drop FUNCTION PrzepiszOferent (varchar);
drop function NieruchomoscSzczeg (text, text, text, text);
drop function ParamsDictRoom (varchar, integer, integer, integer, text, text, text, integer);
drop function ParamsDict (varchar, integer, integer, integer, text, text, text, integer);
drop function OneLevelDict (varchar, integer, integer);
drop function TwoLevelDictRoom (text, text, text, varchar, boolean, integer, integer, text, text, text);
drop function TwoLevelDict (text, text, text, varchar, boolean, integer, integer, text, text, text);
drop function MigrateToTags (text, text, text);
drop function ConvToTag (varchar);

create language plpgsql;
---pomysl przeniesienia danych w skrocie:

---slowniki:
	--- slowniki wielopoziomowe (wyszczegolnione w procesie analizy) podlegaja przetransponowaniu do nowego systemu w nastepujacy sposob:
		---pobieramy selectem zawartosc slownika
		---dodajemy nazwe rodzica dla tego slownika
		---przenosimy te dane w hierarchii rodzic dzieci
		---stary slownik podmieniamy na nowe tagi
		---stare dane sa konwertowane do tagów: obcinanie polskich znakow, spacji, cholera wie czego jeszcze, wszystko do lowercase
		---wrzucenie do nowych slownikow, update danych w starych. Przy przenoszeniu danych ze starego slownika
			---zostanie pobrany tag, z nowego nowe id informacji, i do nowej tabeli w bazie. Przy insercie bedzie
			---jeszcze brany pod uwage zestaw parametrow takich jak czy inf wielokrotna itd, przewidziane w procedurach


---zarys samego importu:
	---najpewniej wszystkie kolejne pola ogromnych tabel zostan¹ nastêpuj¹co potraktowane:
		---procedura pobiera nazwe tabeli, nazwe pola, odpowiedzialny slownik (tu 2 rodzaje w zaleznosci czy slownik tak/nie)
		---docelowa tabele; to pozwoli walnac mnostwo wywolan 1 procedury (ewentualnie 2) i mniej wiecej w tej postaci powinno dac rade


---SET client_encoding TO UTF8;
---protected :P
---procedura do uzytku wewnetrznego poozstalych procedur
---konwersja polskich znakow i specjalnych do "normalnych"
CREATE FUNCTION ConvToTag(textfc varchar) RETURNS text AS $$
DECLARE 
	arrpol char[] := ARRAY['ê','ó','±','¶','³','¿','¼','æ','ñ',',','-','.'];
	arrstn char[] := ARRAY['e','o','a','s','l','z','z','c','n','_','_','_'];
	zrod_lower text;
	temp char;
	i integer := 1;
	res text;
BEGIN
	select into zrod_lower lower(trim(textfc));
	res := zrod_lower;

	while i < 13 loop
		select into res replace(res, arrpol[i], arrstn[i]);
		i := i + 1;
	end loop;
	
	select into res replace (res, ' ', '_');

	RETURN '_' || res;
END;
$$ LANGUAGE plpgsql;
---protected :P
---przetworzenie starych slownikow na tagowane
---procedura pobieraj¹ca nazwe slownika, kolumne danych slownika, kolumne id slownika, konwertuje wpisy w starym slowniku na nowe
---dodaje do zestawu tagow jezykowych nowe dane
---najpewniej nalezy od reki wpakowaæ tlumaczenia do odpowiednich tabel, zrobic to tu
CREATE FUNCTION MigrateToTags(tab_cur_dict text, col_cur_dict text, col_cur_id text) RETURNS SETOF text AS $$
DECLARE
	curs refcursor;
	res record;
	tag_from_word text;
	test record;
BEGIN
	---select ze slownika
	OPEN curs FOR EXECUTE 'select ' || col_cur_id || ' as id, ' || col_cur_dict || ' as nazwa, ' || col_cur_dict || '_en as nazwa_en, ' || col_cur_dict || '_ge as nazwa_ge from ' || tab_cur_dict || ';';

	LOOP
		---wczytywanie kolejnych wynikow
		FETCH curs INTO res;
    
		IF  NOT FOUND THEN
		        EXIT;  -- exit loop
		END IF;
		---konwersja elementu slownika do tagowanego
		select into tag_from_word convtotag(res.nazwa);
		BEGIN
			INSERT INTO lang_tag (nazwa) values (tag_from_word);
		EXCEPTION WHEN unique_violation THEN
			RAISE NOTICE 'Un viol: Insert do lang_tag: %', tag_from_word;
		END;
		SELECT INTO test id from tlumaczenie where id_jezyk = (select id from jezyk where nazwa = 'Polski') and nazwa_lang_tag = tag_from_word;
		IF test.id is null THEN
			---wprowadzenie do tablicy tagow jezykowej (na nia robimy tlumaczenia)
			INSERT INTO tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values (tag_from_word, (select id from jezyk where nazwa = 'Polski'), replace(res.nazwa, ',', '^'));
			INSERT INTO tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values (tag_from_word, (select id from jezyk where nazwa = 'English'), replace(res.nazwa_en, ',', '^'));
			INSERT INTO tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values (tag_from_word, (select id from jezyk where nazwa = 'Deutsch'), replace(res.nazwa_ge, ',', '^'));
		ELSE
			RAISE NOTICE 'Tlumaczenia dla % juz istnieja.', tag_from_word;
		END IF;
		---update na slowniku
		EXECUTE 'update ' || tab_cur_dict || ' set ' || col_cur_dict ||  ' = \'' || tag_from_word || '\' where ' || col_cur_id || ' = ' || res.id || ';';
		RETURN NEXT tag_from_word;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

---select migratetotags('ciepla_woda', 'nazwa_wo', 'id');

---inserts to wyposazenie_nier
---w kolumnie wielokrotne true mowi o tym, ze mozna wiele razy dana opcje wybierac, w przypadku jednopoziomowki wlasciwie nie ma to zastosowania
---jest to tylko do 2 poziomowych

---ze wzgledu na wagi ktore chyba dodamy do danych slownikowych kontynuowanie na tym etapie z pisaniem wywolan jest niebezpieczne
---problem polega na tym ze mozemy od reki walnac tu juz wage, najpewniej zaoszczedzi powtarzania sie z robota
CREATE FUNCTION TwoLevelDict (tab_dict text, col_dict text, id_dict text, parent_tag varchar, wiel boolean, id_sek integer, waga_el integer, pl_tlum text, en_tlum text, ge_tlum text) RETURNS VOID AS $$
DECLARE
	one_tag record;
	id_par integer;
	id_wyp_test integer;
	test record;
BEGIN
	select into id_wyp_test id from wyposazenie_nier where nazwa = parent_tag;
	IF id_wyp_test is null THEN
	---wpakowanie rodzica
	insert into wyposazenie_nier (wielokrotne, ma_dzieci, waga, id_sekcja, nazwa) values (wiel, true, waga_el, id_sek, parent_tag);
	---pobranie id rodzica po wlozeniu (select na pewno zwraca 1 rekord, w tabeli jest klauzula unique)
	select into id_par id from wyposazenie_nier where nazwa = parent_tag;
	BEGIN
		---wrzucenie tagu rodzica do tabeli tagow do tlumaczen
		INSERT INTO lang_tag (nazwa) values (parent_tag);
		SELECT INTO test id from tlumaczenie where id_jezyk = (select id from jezyk where nazwa = 'Polski') and nazwa_lang_tag = parent_tag;
		IF test.id is null THEN
			---wprowadzenie do tablicy tagow jezykowej (na nia robimy tlumaczenia)
			INSERT INTO tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values (parent_tag, (select id from jezyk where nazwa = 'Polski'), pl_tlum);
			IF en_tlum is not null THEN
				INSERT INTO tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values (parent_tag, (select id from jezyk where nazwa = 'English'), en_tlum);
			END IF;
			IF ge_tlum is not null THEN
				INSERT INTO tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values (parent_tag, (select id from jezyk where nazwa = 'Deutsch'), ge_tlum);
			END IF;
		ELSE
			RAISE NOTICE 'Tlumaczenia dla % juz istnieja.', parent_tag;
		END IF;
	EXCEPTION WHEN unique_violation THEN
		RAISE NOTICE 'Un viol: Insert do lang_tag: %', parent_tag;
	END;
	---wywolywanie update 'owania na slowniku
	FOR one_tag IN SELECT * from migratetotags(tab_dict, col_dict, id_dict) LOOP
		---w konsekwencji wprowadzanie rowniez do nowego slownika - uzupelnianie nowego slownika
		insert into wyposazenie_nier (id_parent, wielokrotne, ma_dzieci, waga, id_sekcja, nazwa) values (id_par, wiel, false, waga_el, id_sek, one_tag.migratetotags);
	END LOOP;
	END IF;
	RETURN;
END;
$$ LANGUAGE plpgsql;

---wg mnie podawanie wagi mija sie z celem, ale niech bedzie
---ogolnie procedura przeznaczona do wprowadzania parametrow pomieszczen
CREATE FUNCTION TwoLevelDictRoom (tab_dict text, col_dict text, id_dict text, parent_tag varchar, wiel boolean, id_sek integer, waga_el integer, pl_tlum text, en_tlum text, ge_tlum text) RETURNS VOID AS $$
DECLARE
	one_tag record;
	id_par integer;
	id_wyp_test integer;
	test record;
BEGIN
	select into id_wyp_test id from wyposazenie_pom where nazwa = parent_tag;
	IF id_wyp_test is null THEN
	---wpakowanie rodzica
	insert into wyposazenie_pom (wielokrotne, ma_dzieci, waga, id_sekcja, nazwa) values (wiel, true, waga_el, id_sek, parent_tag);
	---pobranie id rodzica po wlozeniu (select na pewno zwraca 1 rekord, w tabeli jest klauzula unique)
	select into id_par id from wyposazenie_pom where nazwa = parent_tag;
	BEGIN
		---wrzucenie tagu rodzica do tabeli tagow do tlumaczen
		INSERT INTO lang_tag (nazwa) values (parent_tag);
		SELECT INTO test id from tlumaczenie where id_jezyk = (select id from jezyk where nazwa = 'Polski') and nazwa_lang_tag = parent_tag;
		IF test.id is null THEN
			---wprowadzenie do tablicy tagow jezykowej (na nia robimy tlumaczenia)
			INSERT INTO tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values (parent_tag, (select id from jezyk where nazwa = 'Polski'), pl_tlum);
			IF en_tlum is not null THEN
				INSERT INTO tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values (parent_tag, (select id from jezyk where nazwa = 'English'), en_tlum);
			END IF;
			IF ge_tlum is not null THEN
				INSERT INTO tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values (parent_tag, (select id from jezyk where nazwa = 'Deutsch'), ge_tlum);
			END IF;
		ELSE
			RAISE NOTICE 'Tlumaczenia dla % juz istnieja.', parent_tag;
		END IF;
	EXCEPTION WHEN unique_violation THEN
		RAISE NOTICE 'Un viol: Insert do lang_tag: %', parent_tag;
	END;
	---wywolywanie update 'owania na slowniku
	FOR one_tag IN SELECT * from migratetotags(tab_dict, col_dict, id_dict) LOOP
		---w konsekwencji wprowadzanie rowniez do nowego slownika - uzupelnianie nowego slownika
		insert into wyposazenie_pom (id_parent, wielokrotne, ma_dzieci, waga, id_sekcja, nazwa) values (id_par, wiel, false, waga_el, id_sek, one_tag.migratetotags);
	END LOOP;
	END IF;
	RETURN;
END;
$$ LANGUAGE plpgsql;

---dorobic osobne przeniesienie dla parametrow pomieszczen (np. podlogi sa dla pomieszczen nie dla calej nier)

---brakuje tlumaczen dla nadrzednych : ciepla woda itd, dodac do procedury twoleveldict

---select twoleveldict('ciepla_woda', 'nazwa_wo', 'id', '_ciepla_woda', true, (select id from sekcja where nazwa = '_sekcjapodstawowa'));
---select twoleveldict (tabela, kolumna danej, id wierszy, nowy tag, ma dzieci, sekcja, waga);
select twoleveldict('ciepla_woda', 'nazwa_wo', 'id', '_ciepla_woda', true, (select id from sekcja where nazwa = '_sekcjapodstawowa'), 4, 'Ciep³a woda', 'Warm water', null);
select twoleveldict('dach', 'nazwa_da', 'id', '_dach', true, (select id from sekcja where nazwa = '_informacjetechniczne'), 4, 'Dach', 'Roof', null);
select twoleveldict('dzialka', 'nazwa_dz', 'id', '_dzialka', true, (select id from sekcja where nazwa = '_sekcjadodatkowa'), 4, 'DZia³ka', 'Plot', null);
select twoleveldict('dzialka_uk', 'nazwa_uk', 'id', '_uksztaltowanie_dzialka', true, (select id from sekcja where nazwa = '_sekcjadodatkowa'), 4, 'Ukszta³towanie dzia³ki', 'Plot form ', null);
select twoleveldict('dzialka_za', 'nazwa_za', 'id', '_zabudowa_dzialka', true, (select id from sekcja where nazwa = '_sekcjadodatkowa'), 4, 'Zabudowa dzia³ki', 'Buildings of plot', null);
select twoleveldictroom('garaz_usyt', 'nazwa_usyt', 'id', '_usytuowanie_garaz', false, (select id from sekcja where nazwa = '_sekcjadodatkowa'), 4, 'Usytuowanie gara¿u', 'Garage location ', null);
--- w gazie siedzi tak/nie, napisac na to na koncu delete, albo i nie :P
select twoleveldict('gaz', 'nazwa_g', 'id', '_gaz', true, (select id from sekcja where nazwa = '_media'), 4, 'Gaz', 'Gas', null);
select twoleveldict('kanaliza', 'nazwa_ka', 'id', '_kanalizacja', true, (select id from sekcja where nazwa = '_media'), 4, 'Kanalizacja', 'Sewage system', null);
select twoleveldict('komunikacja', 'nazwa_kom', 'id', '_komunikacja', true, (select id from sekcja where nazwa = '_usytuowanie'), 3, 'Komunikacja', 'Communication', null);
select twoleveldict('material_b', 'nazwa_m', 'id', '_material_budowlany', true, (select id from sekcja where nazwa = '_informacjetechniczne'), 3, 'Materia³ budowlany', 'Building material', null);
select twoleveldict('nawierzchnia', 'nazwa_na', 'id', '_nawierzchnia', true, (select id from sekcja where nazwa = '_usytuowanie'), 3, 'Nawierzchnia', 'Surface', null);
select twoleveldict('ogrzewanie', 'nazwa_grz', 'id', '_ogrzewanie', true, (select id from sekcja where nazwa = '_media'), 3, 'Ogrzewanie', 'Heating', 'Heizung');
select twoleveldict('okna', 'nazwa_ok', 'id', '_okna', true, (select id from sekcja where nazwa = '_sekcjadodatkowa'), 4, 'Okna', 'Windows', 'Fenster');
select twoleveldictroom('podlogi', 'nazwa_pod', 'id', '_podlogi', true, (select id from sekcja where nazwa = '_sekcjadodatkowa'), 4, 'Pod³ogi', 'Floor', null);
select twoleveldict('polo', 'nazwa_po', 'id', '_polozenie', false, (select id from sekcja where nazwa = '_sekcjapodstawowa'), 3, 'Po³o¿enie', 'Position', null);
select twoleveldict('przeksztalcenie', 'nazwa_przek', 'id', '_przeksztalcenie', true, (select id from sekcja where nazwa = '_informacjetechniczne'), 4, 'Przekszta³cenie', 'Transformation', null);
select twoleveldict('rodzaj_b', 'nazwa_b', 'id', '_rodzaj_budynku', false, (select id from sekcja where nazwa = '_informacjetechniczne'), 3, 'Rodzaj budynku', 'Kind of building', null);
select twoleveldictroom('rodzaj_kuchni', 'nazwa_kuch', 'id', '_rodzaj_kuchni', false, (select id from sekcja where nazwa = '_sekcjadodatkowa'), 3, 'Rodzaj kuchni', 'Kind of kitchen', null);
select twoleveldict('sasiedztwo', 'nazwa_sas', 'id', '_sasiedztwo', false, (select id from sekcja where nazwa = '_okolica'), 3, 'S¹siedztwo', 'Neighbourhood', null);
select twoleveldictroom('sciany', 'nazwa_sc', 'id', '_sciany', false, (select id from sekcja where nazwa = '_sekcjadodatkowa'), 4, 'Œciany', 'Walls', null);
select twoleveldict('stan', 'nazwa_sst', 'id', '_stan', false, (select id from sekcja where nazwa = '_sekcjapodstawowa'), 1, 'Stan', 'Condition', null);
select twoleveldict('stan_pr', 'nazwa_pr', 'id', '_stan_prawny', false, (select id from sekcja where nazwa = '_sekcjapodstawowa'), 1, 'Stan prawny', 'Legal status', null);
select twoleveldict('standard', 'nazwa_stan', 'id', '_standard', false, (select id from sekcja where nazwa = '_sekcjapodstawowa'), 2, 'Standard', 'Standard', null);
select twoleveldictroom('sufit', 'nazwa_su', 'id', '_sufit', false, (select id from sekcja where nazwa = '_sekcjadodatkowa'), 4, 'Sufit', 'Ceiling', null);
select twoleveldict('techno_b', 'nazwat_b', 'id', '_technologia_budowlana', true, (select id from sekcja where nazwa = '_informacjetechniczne'), 3, 'Technologia budowlana', 'Building technology', null);
select twoleveldictroom('typ_balkonu', 'nazwa_ba', 'id', '_typ_balkonu', false, (select id from sekcja where nazwa = '_sekcjadodatkowa'), 3, 'Typ balkonu', 'Type of balcony', null);
select twoleveldictroom('typ_kuchni', 'nazwa_ku', 'id', '_typ_kuchni', false, (select id from sekcja where nazwa = '_sekcjadodatkowa'), 3, 'Typ kuchni', 'Type of kitchen', null);
select twoleveldict('typ_ulicy', 'nazwa_ul', 'id', '_typ_ulicy', true, (select id from sekcja where nazwa = '_usytuowanie'), 3, 'Typ ulicy', 'Type of street', null);
select twoleveldictroom('typ_wc', 'nazwa_wc', 'id', '_typ_wc', false, (select id from sekcja where nazwa = '_sekcjadodatkowa'), 3, 'Typ toalety', 'Type of toilet', null);
select twoleveldictroom('wyposazenie', 'nazwa_wp', 'id', '_wyposazenie', true, (select id from sekcja where nazwa = '_sekcjadodatkowa'), 3, 'Wyposa¿enie', 'Equipment', null);
select twoleveldict('wystawka_o', 'nazwa_wy', 'id', '_wystawka_okien', true, (select id from sekcja where nazwa = '_informacjetechniczne'), 3, 'Wystawka okien', null, null);


---przemyslec opcje nazwy tabeli w celu obsluzenia za 1 razem tabel parametrow pomieszczen i calej nieruchomosci
CREATE FUNCTION OneLevelDict (parent_tag varchar, waga_el integer, id_sek integer, tlum_pol text, tlum_eng text, tlum_ger text) RETURNS VOID AS $$
DECLARE
	test record;
	id_par integer;
	
BEGIN
	SELECT INTO test id from wyposazenie_nier where nazwa = parent_tag;
	IF test.id is null THEN
		insert into wyposazenie_nier (wielokrotne, ma_dzieci, waga, id_sekcja, nazwa) values (false, false, waga_el, id_sek, parent_tag);
		---select into id_par id from wyposazenie_nier where nazwa = parent_tag;
		INSERT INTO lang_tag (nazwa) values (parent_tag);

		IF tlum_pol is not null THEN
			INSERT INTO tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values (parent_tag, (select id from jezyk where nazwa = 'Polski'), tlum_pol);
		END IF;
		IF tlum_eng is not null THEN
			INSERT INTO tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values (parent_tag, (select id from jezyk where nazwa = 'English'), tlum_eng);
		END IF;
		IF tlum_ger is not null THEN
			INSERT INTO tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values (parent_tag, (select id from jezyk where nazwa = 'Deutsch'), tlum_ger);
		END IF;
	END IF;
	---FOR one_tag IN SELECT * from migratetotags(tab_dict, col_dict, id_dict) LOOP
	---	insert into wyposazenie_nier (id_parent, wielokrotne, ma_dzieci, id_sekcja, nazwa) values (id_par, wiel, false, id_sek, one_tag.migratetotags);
	---END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

select oneleveldict ('_ksiega_wieczysta', 2, (select id from sekcja where nazwa = '_sekcjapodstawowa'), 'Ksiêga wieczysta', 'Real - Estate Register', null);
select oneleveldict ('_alarm', 4, (select id from sekcja where nazwa = '_zabezpieczenia'), 'Alarm', 'Alarm', 'Alarm');
select oneleveldict ('_antena', 4, (select id from sekcja where nazwa = '_media'), 'Antena', 'Aerial', 'Antenne');
select oneleveldict ('_bank', 4, (select id from sekcja where nazwa = '_okolica'), 'Bank', 'Bank', 'Bank');
select oneleveldict ('_basen', 4, (select id from sekcja where nazwa = '_okolica'), 'Basen', 'Swimming pool', 'Schwimmbecken');
select oneleveldict ('_budownictwo_jednorodzinne_ind', 4, (select id from sekcja where nazwa = '_mozliwosczabudowy'), 'Budownictwo jednorodzinne indywidualne', 'One-family individual building', null);
select oneleveldict ('_budownictwo_wielorodzinne', 4, (select id from sekcja where nazwa = '_mozliwosczabudowy'), 'Budownictwo wielorodzinne', 'Multi-family building', null);
select oneleveldict ('_budownictwo_jednorodzinne_szer', 4, (select id from sekcja where nazwa = '_mozliwosczabudowy'), 'Budownictwo jednorodzinne szeregowe', 'One-family private building', null);
select oneleveldict ('_domofon', 4, (select id from sekcja where nazwa = '_zabezpieczenia'), 'Domofon', 'Door phone', null);
select oneleveldict ('_drzwi_antywlamaniowe', 4, (select id from sekcja where nazwa = '_zabezpieczenia'), 'Drzwi antyw³amaniowe', 'Anti - burglaries doors', 'Anti - Einbruch Tür');
select oneleveldict ('_dzialka_narozna', 4, (select id from sekcja where nazwa = '_sekcjadodatkowa'), 'Dzia³ka naro¿na', 'Corner plot', 'Eck Baugrundstück');
select oneleveldict ('_dzialka_ogrodzona', 4, (select id from sekcja where nazwa = '_sekcjadodatkowa'), 'Dzia³ka ogrodzona', 'Enclosed plot', 'Zaun Baugrundstück');
select oneleveldict ('_fitness', 4, (select id from sekcja where nazwa = '_okolica'), 'Fitness Club', 'Fitness Club', 'Fitness Club');
select oneleveldict ('_gory', 4, (select id from sekcja where nazwa = '_okolica'), 'Góry', 'Mountain', 'Gebirge');
select oneleveldict ('_jaccuzi', 4, (select id from sekcja where nazwa = '_udogodnienia'), 'Jaccuzi', 'Jaccuzi', 'Jaccuzi');
select oneleveldict ('_jezioro', 4, (select id from sekcja where nazwa = '_okolica'), 'Jezioro', 'Lake', 'See');
select oneleveldict ('_kablowa', 4, (select id from sekcja where nazwa = '_media'), 'Sieæ kablowa', 'Cable net', 'Kabel netz');
select oneleveldict ('_kamery', 4, (select id from sekcja where nazwa = '_zabezpieczenia'), 'Kamery video', 'Surveillance camera', 'Kontrolle kamera');
select oneleveldict ('_klimatyzacja', 4, (select id from sekcja where nazwa = '_udogodnienia'), 'Klimatyzacja', 'Air-conditioning', 'Klimatisierung');
select oneleveldict ('_kominek', 4, (select id from sekcja where nazwa = '_udogodnienia'), 'Kominek', 'Fireplace', 'Kamin');
select oneleveldict ('_kort_tenisowy', 4, (select id from sekcja where nazwa = '_okolica'), 'Kort tenisowy', 'Racket court', 'Tennisplatz');
select oneleveldict ('_kraty', 4, (select id from sekcja where nazwa = '_zabezpieczenia'), 'Kraty', 'Bars', 'Gitteren');
---select oneleveldict ('_laka', 4, (select id from sekcja where nazwa = '_otoczenie'), '£¹ka', 'Meadow', 'Wiese');
select oneleveldict ('_las', 4, (select id from sekcja where nazwa = '_okolica'), 'Las', 'Forest', 'Wald');
select oneleveldict ('_mozliwosc_podzial', 4, (select id from sekcja where nazwa = '_sekcjadodatkowa'), 'Mo¿liwoœæ podzia³u', 'Possibility of division', 'Einteilung möglichkeit');
select oneleveldict ('_udogodnienia_niepelno', 4, (select id from sekcja where nazwa = '_udogodnienia'), 'Udogodnienia dla niepe³nosprawnych', 'Convenience for handicapped', null);
select oneleveldict ('_ochrona', 4, (select id from sekcja where nazwa = '_zabezpieczenia'), 'Ochrona', 'Security', 'Bewachung');
select oneleveldict ('_oczko', 4, (select id from sekcja where nazwa = '_otoczenie'), 'Oczko wodne', 'Water little eye', null);
select oneleveldict ('_odrolniona', 4, (select id from sekcja where nazwa = '_mozliwosczabudowy'), 'Odrolniona', null, null);
select oneleveldict ('_ogrodek', 4, (select id from sekcja where nazwa = '_otoczenie'), 'Ogródek', 'Garden', 'Garten');
select oneleveldict ('_okazja', 4, (select id from sekcja where nazwa = '_sekcjapodstawowa'), 'Okazja', 'Opportunity', 'Angelegenheit');
select oneleveldict ('_okna_anty', 4, (select id from sekcja where nazwa = '_zabezpieczenia'), 'Okna antyw³amaniowe', 'Anti - burglaries windows', null);
select oneleveldict ('_osiedle_strzezone', 4, (select id from sekcja where nazwa = '_zabezpieczenia'), 'Osiedle strze¿one', 'Watched housing estate', null);
select oneleveldict ('_park', 4, (select id from sekcja where nazwa = '_okolica'), 'Park', 'Park', 'Park');
select oneleveldict ('_parking', 4, (select id from sekcja where nazwa = '_okolica'), 'Parking', 'Parking', 'Parking');
select oneleveldict ('_plac_zabaw', 4, (select id from sekcja where nazwa = '_okolica'), 'Plac zabaw', 'Playground', 'Spielplatz');
select oneleveldict ('_pozwolenie_na_bud', 4, (select id from sekcja where nazwa = '_sekcjapodstawowa'), 'Pozwolenie na budowê', 'Permission on building', null);
select oneleveldict ('_prad', 4, (select id from sekcja where nazwa = '_media'), 'Pr¹d', 'Electric current', 'Elektrisch strom');
select oneleveldict ('_przemysl', 4, (select id from sekcja where nazwa = '_okolica'), 'Przemys³', 'Industry', 'Industrie');
select oneleveldict ('_recepcja', 4, (select id from sekcja where nazwa = '_zabezpieczenia'), 'Recepcja', 'Reception', 'Empfang');
select oneleveldict ('_restauracja', 4, (select id from sekcja where nazwa = '_okolica'), 'Restauracja', 'Restaurant', 'Restaurant');
select oneleveldict ('_rolety', 4, (select id from sekcja where nazwa = '_zabezpieczenia'), 'Rolety', 'Roller blind', null);
select oneleveldict ('_rzeka', 4, (select id from sekcja where nazwa = '_okolica'), 'Rzeka', 'River', 'Fluss');
select oneleveldict ('_sauna', 4, (select id from sekcja where nazwa = '_udogodnienia'), 'Sauna', 'Sauna', 'Sauna');
select oneleveldict ('_siec_internet', 4, (select id from sekcja where nazwa = '_media'), 'Sieæ internetowa', 'Internet net', 'Internet');
select oneleveldict ('_sila', 4, (select id from sekcja where nazwa = '_media'), 'Si³a', 'Power', null);
select oneleveldict ('_staw', 4, (select id from sekcja where nazwa = '_okolica'), 'Staw', 'Pond', 'Teich');
select oneleveldict ('_telefon', 4, (select id from sekcja where nazwa = '_media'), 'Telefon', 'Telephone', 'Telefon');
select oneleveldict ('_uslugi', 4, (select id from sekcja where nazwa = '_sekcjadodatkowa'), 'Us³ugi', 'Services', 'Diensten');
select oneleveldict ('_winda', 4, (select id from sekcja where nazwa = '_udogodnienia'), 'Winda', 'Lift', 'Aufzug');
select oneleveldict ('_woda', 4, (select id from sekcja where nazwa = '_media'), 'Woda', 'Water', 'Wasser');
select oneleveldict ('_zsyp', 4, (select id from sekcja where nazwa = '_udogodnienia'), 'Zsyp', 'Pouring', 'Schütten');

CREATE FUNCTION ParamsDict (parent_tag varchar, waga_el integer, id_sek integer, id_wal integer, tlum_pol text, tlum_eng text, tlum_ger text, dlug_inf integer) RETURNS VOID AS $$
DECLARE
	test record;
	id_par integer;
	
BEGIN
	SELECT INTO test id from parametr_nier where nazwa = parent_tag;
	IF test.id is null THEN
		insert into parametr_nier (id_sekcja, id_walidacja, waga, nazwa, dl_inf) values (id_sek, id_wal, waga_el, parent_tag, dlug_inf);
		---select into id_par id from wyposazenie_nier where nazwa = parent_tag;
		INSERT INTO lang_tag (nazwa) values (parent_tag);

		IF tlum_pol is not null THEN
			INSERT INTO tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values (parent_tag, (select id from jezyk where nazwa = 'Polski'), tlum_pol);
		END IF;
		IF tlum_eng is not null THEN
			INSERT INTO tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values (parent_tag, (select id from jezyk where nazwa = 'English'), tlum_eng);
		END IF;
		IF tlum_ger is not null THEN
			INSERT INTO tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values (parent_tag, (select id from jezyk where nazwa = 'Deutsch'), tlum_ger);
		END IF;
	END IF;
	---FOR one_tag IN SELECT * from migratetotags(tab_dict, col_dict, id_dict) LOOP
	---	insert into wyposazenie_nier (id_parent, wielokrotne, ma_dzieci, id_sekcja, nazwa) values (id_par, wiel, false, id_sek, one_tag.migratetotags);
	---END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION ParamsDictRoom (parent_tag varchar, waga_el integer, id_sek integer, id_wal integer, tlum_pol text, tlum_eng text, tlum_ger text, dlug_inf integer) RETURNS VOID AS $$
DECLARE
	test record;
	id_par integer;
	
BEGIN
	SELECT INTO test id from parametr_pom where nazwa = parent_tag;
	IF test.id is null THEN
		insert into parametr_pom (id_sekcja, id_walidacja, waga, nazwa, dl_inf) values (id_sek, id_wal, waga_el, parent_tag, dlug_inf);
		---select into id_par id from wyposazenie_nier where nazwa = parent_tag;
		INSERT INTO lang_tag (nazwa) values (parent_tag);

		IF tlum_pol is not null THEN
			INSERT INTO tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values (parent_tag, (select id from jezyk where nazwa = 'Polski'), tlum_pol);
		END IF;
		IF tlum_eng is not null THEN
			INSERT INTO tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values (parent_tag, (select id from jezyk where nazwa = 'English'), tlum_eng);
		END IF;
		IF tlum_ger is not null THEN
			INSERT INTO tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values (parent_tag, (select id from jezyk where nazwa = 'Deutsch'), tlum_ger);
		END IF;
	END IF;
	---FOR one_tag IN SELECT * from migratetotags(tab_dict, col_dict, id_dict) LOOP
	---	insert into wyposazenie_nier (id_parent, wielokrotne, ma_dzieci, id_sekcja, nazwa) values (id_par, wiel, false, id_sek, one_tag.migratetotags);
	---END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

select paramsdict ('_powierzchnia_uzytkowa', 1, (select id from sekcja where nazwa = '_sekcjapodstawowa'), (select id from walidacja where nazwa = 'float'), 'Powierzchnia u¿ytkowa', 'Usable surface', null, 8);
select paramsdict ('_powierzchnia_calkowita', 1, (select id from sekcja where nazwa = '_sekcjapodstawowa'), (select id from walidacja where nazwa = 'float'), 'Powierzchnia ca³kowita', 'Total surface', null, 8);
select paramsdict ('_powierzchnia_zabudowy', 2, (select id from sekcja where nazwa = '_sekcjapodstawowa'), (select id from walidacja where nazwa = 'float'), 'Powierzchnia zabudowy', 'Surface of buildings', null, 8);
select paramsdict ('_powierzchnia_pom_biur', 2, (select id from sekcja where nazwa = '_sekcjapodstawowa'), (select id from walidacja where nazwa = 'float'), 'Powierzchnia pomieszczeñ biurowych', 'Surface of office rooms', null, 8);
select paramsdict ('_powierzchnia_witryny', 3, (select id from sekcja where nazwa = '_sekcjapodstawowa'), (select id from walidacja where nazwa = 'float'), 'Powierzchnia witryny', 'Surface of shopwindow', null, 8);
select paramsdict ('_powierzchnia_pomieszczen', 2, (select id from sekcja where nazwa = '_sekcjapodstawowa'), (select id from walidacja where nazwa = 'float'), 'Powierzchnia pomieszczeñ', 'Surface of rooms', null, 8);
select paramsdict ('_powierzchnia_dzialki', 2, (select id from sekcja where nazwa = '_sekcjapodstawowa'), (select id from walidacja where nazwa = 'float'), 'Powierzchnia dzia³ki', 'Surface of plot', null, 8);
select paramsdict ('_powierzchnia_ogrodu', 3, (select id from sekcja where nazwa = '_sekcjapodstawowa'), (select id from walidacja where nazwa = 'float'), 'Powierzchnia ogrodu', 'Surface of garden', null, 8);
select paramsdict ('_powierzchnia_pom_gospodarczych', 2, (select id from sekcja where nazwa = '_sekcjapodstawowa'), (select id from walidacja where nazwa = 'float'), 'Powierzchnia pomieszczeñ gospodarczych', 'Surface of economic rooms', null, 8);
select paramsdict ('_powierzchnia_pom_socjalnych', 2, (select id from sekcja where nazwa = '_sekcjapodstawowa'), (select id from walidacja where nazwa = 'float'), 'Powierzchnia pomieszczeñ socjalnych', 'Surface of social rooms', null, 8);
select paramsdict ('_liczba_pokoi', 1, (select id from sekcja where nazwa = '_sekcjapodstawowa'), (select id from walidacja where nazwa = 'int'), 'Liczba pokoi', 'Number of rooms', null, 4);
select paramsdict ('_liczba_kuchni', 2, (select id from sekcja where nazwa = '_sekcjapodstawowa'), (select id from walidacja where nazwa = 'int'), 'Liczba kuchni', 'Number of kitchens', null, 4);
select paramsdict ('_liczba_przedpokoi', 3, (select id from sekcja where nazwa = '_sekcjapodstawowa'), (select id from walidacja where nazwa = 'int'), 'Liczba przedpokoi', 'Number of halls', null, 4);
select paramsdict ('_liczba_lazienek', 2, (select id from sekcja where nazwa = '_sekcjapodstawowa'), (select id from walidacja where nazwa = 'int'), 'Liczba ³azienek', 'Number of bathrooms', null, 4);
select paramsdict ('_liczba_ubikacji', 2, (select id from sekcja where nazwa = '_sekcjapodstawowa'), (select id from walidacja where nazwa = 'int'), 'Liczba ubikacji', 'Number of toilets', null, 4);
select paramsdict ('_liczba_dod_pom', 3, (select id from sekcja where nazwa = '_sekcjapodstawowa'), (select id from walidacja where nazwa = 'int'), 'Liczba dodatkowych pomieszczeñ', 'Number of additional rooms', null, 4);
select paramsdict ('_liczba_tarasow', 4, (select id from sekcja where nazwa = '_sekcjapodstawowa'), (select id from walidacja where nazwa = 'int'), 'Liczba tarasów', 'Number of terraces', null, 4);
select paramsdict ('_liczba_balkonow', 4, (select id from sekcja where nazwa = '_sekcjapodstawowa'), (select id from walidacja where nazwa = 'int'), 'Liczba balkonów', 'Number of balcons', null, 4);
select paramsdict ('_liczba_kondygnacji', 2, (select id from sekcja where nazwa = '_sekcjapodstawowa'), (select id from walidacja where nazwa = 'int'), 'Liczba kondygnacji', 'Number of storey', null, 2);
select paramsdict ('_liczba_kondygnacji_bud', 2, (select id from sekcja where nazwa = '_sekcjapodstawowa'), (select id from walidacja where nazwa = 'int'), 'Liczba kondygnacji budynku', 'Number of building storey', null, 3);
select paramsdict ('_wysokosc_oplat', 2, (select id from sekcja where nazwa = '_sekcjapodstawowa'), (select id from walidacja where nazwa = 'int'), 'Wysokoœæ op³at', 'Height of payments', null, 8);
select paramsdict ('_liczba_pieter', 2, (select id from sekcja where nazwa = '_sekcjapodstawowa'), (select id from walidacja where nazwa = 'int'), 'Liczba piêter', 'Number of storeys', null, 3);
select paramsdict ('_numer_pietra', 1, (select id from sekcja where nazwa = '_sekcjapodstawowa'), (select id from walidacja where nazwa = 'int'), 'Numer piêtra', 'Number of storey', null, 3);
select paramsdict ('_wysokosc_czynszu', 1, (select id from sekcja where nazwa = '_sekcjapodstawowa'), (select id from walidacja where nazwa = 'int'), 'Wysokoœæ czynszu', 'Height of rent', null, 8);
select paramsdict ('_rok_budowy', 3, (select id from sekcja where nazwa = '_sekcjapodstawowa'), (select id from walidacja where nazwa = 'data'), 'Rok budowy', 'Year of building', null, 10);
select paramsdict ('_liczba_witryn', 4, (select id from sekcja where nazwa = '_sekcjapodstawowa'), (select id from walidacja where nazwa = 'int'), 'Liczba witryn', 'Number of shopwindows', null, 4);
select paramsdict ('_liczba_pom_gospodarczych', 4, (select id from sekcja where nazwa = '_sekcjapodstawowa'), (select id from walidacja where nazwa = 'int'), 'Liczba pomieszczeñ gospodarczych', 'Number of economic rooms', null, 4);
select paramsdict ('_liczba_pom_socjalnych', 4, (select id from sekcja where nazwa = '_sekcjapodstawowa'), (select id from walidacja where nazwa = 'int'), 'Liczba pomieszczeñ socjalnych', 'Number of social rooms', null, 4);
select paramsdictroom ('_powierzchnia', 4, (select id from sekcja where nazwa = '_sekcjadodatkowa'), (select id from walidacja where nazwa = 'float'), 'Powierzchnia', 'Surface', null, 8);

select paramsdict ('_szerokosc', 4, (select id from sekcja where nazwa = '_sekcjadodatkowa'), (select id from walidacja where nazwa = 'float'), 'Szerokoœæ', 'Width', 'Weite', 8);
select paramsdict ('_dlugosc', 4, (select id from sekcja where nazwa = '_sekcjadodatkowa'), (select id from walidacja where nazwa = 'float'), 'D³ugoœæ', 'Length', 'Länge', 8);

select paramsdict ('_pow_grunt_orny', 4, (select id from sekcja where nazwa = '_otoczenie'), (select id from walidacja where nazwa = 'float'), 'Powierzchnia gruntu ornego', 'The ground surface arable', null, 8);
select paramsdict ('_pow_pastwisko', 4, (select id from sekcja where nazwa = '_otoczenie'), (select id from walidacja where nazwa = 'float'), 'Powierzchnia pastwiska', 'Surface of pasture', null, 8);
select paramsdict ('_pow_laka', 4, (select id from sekcja where nazwa = '_otoczenie'), (select id from walidacja where nazwa = 'float'), 'Powierzchnia ³¹ki', 'Surface of meadow', null, 8);
select paramsdict ('_pow_las', 4, (select id from sekcja where nazwa = '_otoczenie'), (select id from walidacja where nazwa = 'float'), 'Powierzchnia lasu', 'Surface of forest', null, 8);
select paramsdict ('_pow_nieuzytki', 4, (select id from sekcja where nazwa = '_otoczenie'), (select id from walidacja where nazwa = 'float'), 'Powierzchnia nieu¿ytków', 'Surface of waste lands', null, 8);
select paramsdict ('_pow_grunt_inny', 4, (select id from sekcja where nazwa = '_otoczenie'), (select id from walidacja where nazwa = 'float'), 'Powierzchnia gruntów innych', 'Surface of other grounds', null, 8);


---opis jest wielojêzykowy, wiêc en sobie chyba podarujewszy :P
---select paramsdict ('_opis', 4, (select id from sekcja where nazwa = '_sekcjapodstawowa'), (select id from walidacja where nazwa = 'int'), 'Liczba pomieszczeñ socjalnych', 'Number of social rooms', null);

---select paramsdict ('_powierzchnia_pom_gospodarczych', 2, (select id from sekcja where nazwa = '_sekcjapodstawowa'), (select id from walidacja where nazwa = 'float'), 'Powierzchnia pomieszczeñ gospodarczych', 'Surface of economic rooms', null);

CREATE FUNCTION NieruchomoscSzczeg (rodzaj_nier text, tab_szcz text, kol_szcz text, id_szcz text) RETURNS VOID AS $$
DECLARE
	one_tag record;
	id_par integer;
	id_wyp_test integer;
BEGIN
	select into id_wyp_test id from rodz_nier_szczeg where id_nier_rodzaj = (select id from nier_rodzaj where nazwa = rodzaj_nier);
	IF id_wyp_test is null THEN

	---wywolywanie update 'owania na slowniku
	FOR one_tag IN SELECT * from migratetotags(tab_szcz, kol_szcz, id_szcz) LOOP
		---w konsekwencji wprowadzanie rowniez do nowego slownika - uzupelnianie nowego slownika
		insert into rodz_nier_szczeg (id_nier_rodzaj, nazwa) values ((select id from nier_rodzaj where nazwa = rodzaj_nier), one_tag.migratetotags);
	END LOOP;
	END IF;
	RETURN;
END
$$ LANGUAGE plpgsql;

select nieruchomoscszczeg ('_dom', 'rodzaj_of', 'rodzaj_of', 'id');
select nieruchomoscszczeg ('_dzialka', 'rodzaj_of_dzi', 'rodzaj_of', 'id');
select nieruchomoscszczeg ('_lokal', 'rodzaj_of_lok', 'rodzaj_of', 'id');
select nieruchomoscszczeg ('_obiekt', 'rodzaj_of_obi', 'rodzaj_of', 'id');
select nieruchomoscszczeg ('_teren', 'rodzaj_of_te', 'rodzaj_of', 'id');

---wrzucenie wylacznie tlumaczen do nowej bazy, w nowej bazie nie ma na to tabeli
---to moze isc tylko raz, stad wyleci w zwiazku z tym chyba 
select * from MigrateToTags('rodzaj_ryn', 'nazwa_r', 'id');

---regiony geograficzne

insert into region_geog (id_parent, id_otodom, nazwa) select 1, id_w_otodom, nazwa_w from wojewodztwa;

---przeniesienie powiatow

insert into region_geog (id_parent, id_otodom, nazwa) select (select id from region_geog where nazwa = (select nazwa_w from wojewodztwa where id_w = p1.id_w)), id_pow_otodom, nazwa_p from powiaty p1;

---korekta regionow
---select substring(nazwa from 1 for char_length(nazwa) - 1) from region_geog where nazwa like 'gliwicki_';
---update region_geog set nazwa = trim(nazwa);
update region_geog set nazwa = substring(nazwa from 1 for char_length(nazwa) - 1) where nazwa != '_polska';



---w perspektywie najpewniej bedzie potrzebna taka procedura jak ponizej, chodzi o przerzucenie standardowych slownikow (chyba nie ma tego duzo jesli w  ogole cos jeszcze jest)
---CREATE FUNCTION StandardDict (tab_slow_old text, kol_slow_old text, tab_slow_new text)

---ten parametr jest bez sensu, nie jest uzyty
CREATE FUNCTION PrzepiszOferent (osob varchar) RETURNS VOID AS $$
DECLARE
	rec_dane record;
	imie_id integer;
	msc_id integer;
	osoba_id integer;
BEGIN
	FOR rec_dane IN select id_ofe, im1, naz1, nazrod, mie, pesel, nudow, telstac1, telstac2, telkom1, telkom2, naztelstac1, naztelstac2, naztelkom1, naztelkom2, email from tab_ofe LOOP
		select into msc_id id from region_geog where nazwa = rec_dane.mie;
		IF msc_id is null THEN
			RAISE NOTICE 'Nie znalazl msc: %', rec_dane.mie;
		END IF;
		select into imie_id id from imie where nazwa = rec_dane.im1;
		IF imie_id is null THEN
			RAISE NOTICE 'Nie znalazl imienia: %', rec_dane.im1;
		ELSE
			insert into osoba (id_old, id_imie, nazwisko, nazwisko_rodowe, pesel, nr_dowod, id_region_geog) values (rec_dane.id_ofe, imie_id, rec_dane.naz1, rec_dane.nazrod, rec_dane.pesel, rec_dane.nudow, msc_id);
			select into osoba_id currval('osoba_id_seq');
			---telefony
			IF rec_dane.telstac1 is not null THEN
				insert into telefon (id_osoba, nazwa, opis) values (osoba_id, rec_dane.telstac1, rec_dane.naztelstac1);
			END IF;
			IF rec_dane.telstac2 is not null THEN
				insert into telefon (id_osoba, nazwa, opis) values (osoba_id, rec_dane.telstac2, rec_dane.naztelstac2);
			END IF;
			IF rec_dane.telkom2 is not null THEN
				insert into telefon (id_osoba, nazwa, opis) values (osoba_id, rec_dane.telkom2, rec_dane.naztelkom2);
			END IF;
			IF rec_dane.telkom1 is not null THEN
				insert into komorka (id_osoba, nazwa, opis) values (osoba_id, rec_dane.telkom1, rec_dane.naztelkom1);
			END IF;
			IF rec_dane.email is not null THEN
				insert into email_osoba (id_osoba, nazwa) values (osoba_id, rec_dane.email);
			END IF;
			---dodanie osoby jako bedacej jedna z reprezentantow klienta
			insert into osoba_klient (id_klient, id_osoba) values ((select id from klient where id_old = rec_dane.id_ofe), osoba_id);
			
		END IF;
	END LOOP;
END
$$ LANGUAGE plpgsql;




