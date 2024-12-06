drop FUNCTION PrzeniesPubOtodom ();
drop FUNCTION PrzeniesGazeta (integer, integer, text, text[], boolean);
drop function PrzeniesListaWskazan();
drop FUNCTION PrzepiszZapotrzebowanie (integer, integer, text[], text[], text[]);
drop function PrzepiszKlient();
drop FUNCTION PrzeniesPomieszczenieNieruchomosc (integer, text, text, integer);
drop FUNCTION PrzeniesDaneNieruchomosc (integer, text, text, integer);
drop FUNCTION PrzeniesZdjecie (integer, integer, text, text);
drop FUNCTION DodajZdjecieImport (integer, text, text);
drop FUNCTION Explode (text);
drop FUNCTION Boom (varchar(2), text);
drop function DodajOferta (text[], integer, integer, integer, text);
drop function PrzepiszNieruchomosc (integer, text, integer, text[], text);
drop function PrzytnijTekstMsc (text);
drop FUNCTION PrzepiszOferent ();
drop function PoprawNieisOf();
drop function NieruchomoscSzczeg (text, text, text, text);
drop function ParamsDictRoom (varchar, integer, integer, integer, text, text, text, integer);
drop function ParamsDict (varchar, integer, integer, integer, text, text, text, integer);
drop FUNCTION OneLevelDict (varchar, integer, integer, text, text, text);
drop function TwoLevelDictRoom (text, text, text, varchar, boolean, integer, integer, text, text, text);
drop function TwoLevelDict (text, text, text, varchar, boolean, integer, integer, text, text, text);
drop function MigrateToTags (text, text, text);
drop function ConvToTag (varchar);


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
	test text;
BEGIN
	---test
	select into test substring (textfc from 1 for 1);
	IF test = '_' THEN
		RETURN textfc;
	END IF;
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
select twoleveldict('ciepla_woda', 'nazwa_wo', 'id', '_ciepla_woda', true, (select id from sekcja where nazwa = '_media'), 4, 'Ciep³a woda', 'Warm water', null);
select twoleveldict('dach', 'nazwa_da', 'id', '_dach', true, (select id from sekcja where nazwa = '_informacjetechniczne'), 4, 'Dach', 'Roof', null);
select twoleveldict('dzialka', 'nazwa_dz', 'id', '_dzialka', false, (select id from sekcja where nazwa = '_sekcjadodatkowa'), 4, 'Dzia³ka', 'Plot', null);
select twoleveldict('dzialka_uk', 'nazwa_uk', 'id', '_uksztaltowanie_dzialka', false, (select id from sekcja where nazwa = '_sekcjadodatkowa'), 4, 'Ukszta³towanie dzia³ki', 'Plot form ', null);
select twoleveldict('dzialka_za', 'nazwa_za', 'id', '_zadrzewienie_dzialka', false, (select id from sekcja where nazwa = '_sekcjadodatkowa'), 4, 'Zadrzewienie dzia³ki', 'Afforestation of plot', null);
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
select twoleveldict('sasiedztwo', 'nazwa_sas', 'id', '_sasiedztwo', false, (select id from sekcja where nazwa = '_okolica'), 3, 'S±siedztwo', 'Neighbourhood', null);
select twoleveldictroom('sciany', 'nazwa_sc', 'id', '_sciany', false, (select id from sekcja where nazwa = '_sekcjadodatkowa'), 4, '¦ciany', 'Walls', null);
select twoleveldict('stan', 'nazwa_sst', 'id', '_stan', false, (select id from sekcja where nazwa = '_sekcjapodstawowa'), 1, 'Stan', 'Condition', null);
select twoleveldict('stan_pr', 'nazwa_pr', 'id', '_stan_prawny', false, (select id from sekcja where nazwa = '_sekcjapodstawowa'), 1, 'Stan prawny', 'Legal status', null);
select twoleveldict('stan_pr', 'nazwa_pr', 'id', '_stan_prawny_dzialka', false, (select id from sekcja where nazwa = '_sekcjapodstawowa'), 1, 'Stan prawny dzia³ki', 'Legal status of plot', null);
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
select oneleveldict ('_centrumhandlowe', 4, (select id from sekcja where nazwa = '_okolica'), 'Centrum handlowe', 'Trade Center', null);
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
---select oneleveldict ('_laka', 4, (select id from sekcja where nazwa = '_otoczenie'), '£±ka', 'Meadow', 'Wiese');
select oneleveldict ('_las', 4, (select id from sekcja where nazwa = '_okolica'), 'Las', 'Forest', 'Wald');
select oneleveldict ('_mozliwosc_podzial', 4, (select id from sekcja where nazwa = '_sekcjadodatkowa'), 'Mo¿liwo¶æ podzia³u', 'Possibility of division', 'Einteilung möglichkeit');
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
select oneleveldict ('_prad', 4, (select id from sekcja where nazwa = '_media'), 'Pr±d', 'Electric current', 'Elektrisch strom');
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
select oneleveldict ('_piwnica', 4, (select id from sekcja where nazwa = '_udogodnienia'), 'Piwnica', 'Basement', 'Keller');
select oneleveldict ('_otoczenie_nieuciazliwe', 4, (select id from sekcja where nazwa = '_udogodnienia'), 'Otoczenie nieuci±¿liwe', 'Nonarduous environment', 'Unlästige Umgebung');

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

select paramsdict ('_powierzchnia_uzytkowa', 1, (select id from sekcja where nazwa = '_sekcjapodstawowa'), (select id from walidacja where nazwa = 'float'), 'Pow. u¿ytkowa(m2)', 'Usable surface(m2)', null, 8);
select paramsdict ('_powierzchnia_calkowita', 1, (select id from sekcja where nazwa = '_sekcjapodstawowa'), (select id from walidacja where nazwa = 'float'), 'Pow. ca³kowita(m2)', 'Total surface(m2)', 'Gesamtfläche', 8);
select paramsdict ('_powierzchnia_zabudowy', 2, (select id from sekcja where nazwa = '_sekcjapodstawowa'), (select id from walidacja where nazwa = 'float'), 'Pow. zabudowy(m2)', 'Surface of buildings(m2)', null, 8);
select paramsdict ('_powierzchnia_pom_biur', 2, (select id from sekcja where nazwa = '_sekcjapodstawowa'), (select id from walidacja where nazwa = 'float'), 'Pow. pomieszczeñ biurowych(m2)', 'Surface of office rooms(m2)', null, 8);
select paramsdict ('_powierzchnia_witryny', 3, (select id from sekcja where nazwa = '_sekcjapodstawowa'), (select id from walidacja where nazwa = 'float'), 'Pow. witryny(m2)', 'Surface of shopwindow(m2)', null, 8);
select paramsdict ('_powierzchnia_pomieszczen', 2, (select id from sekcja where nazwa = '_sekcjapodstawowa'), (select id from walidacja where nazwa = 'float'), 'Pow. pomieszczeñ(m2)', 'Surface of rooms(m2)', null, 8);
select paramsdict ('_powierzchnia_dzialki', 2, (select id from sekcja where nazwa = '_sekcjapodstawowa'), (select id from walidacja where nazwa = 'float'), 'Pow. dzia³ki(m2)', 'Surface of plot(m2)', 'Grundstückfläche', 8);
select paramsdict ('_powierzchnia_ogrodu', 3, (select id from sekcja where nazwa = '_sekcjapodstawowa'), (select id from walidacja where nazwa = 'float'), 'Pow. ogrodu(m2)', 'Surface of garden(m2)', null, 8);
select paramsdict ('_powierzchnia_pom_gospodarczych', 2, (select id from sekcja where nazwa = '_sekcjapodstawowa'), (select id from walidacja where nazwa = 'float'), 'Pow. pomieszczeñ gospodarczych', 'Surface of economic rooms(m2)', null, 8);
select paramsdict ('_powierzchnia_pom_socjalnych', 2, (select id from sekcja where nazwa = '_sekcjapodstawowa'), (select id from walidacja where nazwa = 'float'), 'Pow. pomieszczeñ socjalnych(m2)', 'Surface of social rooms(m2)', null, 8);
select paramsdict ('_numer_dzialki', 4, (select id from sekcja where nazwa = '_sekcjapodstawowa'), (select id from walidacja where nazwa = 'text'), 'Numer dzia³ki', 'Plot number', null, 8);
select paramsdict ('_liczba_pomieszczen', 3, (select id from sekcja where nazwa = '_sekcjapodstawowa'), (select id from walidacja where nazwa = 'int'), 'Liczba pomieszczeñ', 'Number of rooms', null, 4);
select paramsdict ('_liczba_pokoi', 1, (select id from sekcja where nazwa = '_sekcjapodstawowa'), (select id from walidacja where nazwa = 'int'), 'Liczba pokoi', 'Number of rooms', null, 4);
select paramsdict ('_liczba_kuchni', 2, (select id from sekcja where nazwa = '_sekcjapodstawowa'), (select id from walidacja where nazwa = 'int'), 'Liczba kuchni', 'Number of kitchens', null, 4);
select paramsdict ('_liczba_przedpokoi', 3, (select id from sekcja where nazwa = '_sekcjapodstawowa'), (select id from walidacja where nazwa = 'int'), 'Liczba przedpokoi', 'Number of halls', null, 4);
select paramsdict ('_liczba_lazienek', 2, (select id from sekcja where nazwa = '_sekcjapodstawowa'), (select id from walidacja where nazwa = 'int'), 'Liczba ³azienek', 'Number of bathrooms', null, 4);
select paramsdict ('_liczba_ubikacji', 2, (select id from sekcja where nazwa = '_sekcjapodstawowa'), (select id from walidacja where nazwa = 'int'), 'Liczba toalet', 'Number of toilets', null, 4);
select paramsdict ('_liczba_dod_pom', 3, (select id from sekcja where nazwa = '_sekcjapodstawowa'), (select id from walidacja where nazwa = 'int'), 'Liczba dodatkowych pomieszczeñ', 'Number of additional rooms', null, 4);
select paramsdict ('_liczba_tarasow', 4, (select id from sekcja where nazwa = '_sekcjapodstawowa'), (select id from walidacja where nazwa = 'int'), 'Liczba tarasów', 'Number of terraces', null, 4);
select paramsdict ('_liczba_balkonow', 4, (select id from sekcja where nazwa = '_sekcjapodstawowa'), (select id from walidacja where nazwa = 'int'), 'Liczba balkonów', 'Number of balcons', null, 4);
select paramsdict ('_liczba_kondygnacji', 2, (select id from sekcja where nazwa = '_sekcjapodstawowa'), (select id from walidacja where nazwa = 'int'), 'Liczba kondygnacji', 'Number of storey', null, 2);
select paramsdict ('_liczba_kondygnacji_bud', 2, (select id from sekcja where nazwa = '_sekcjapodstawowa'), (select id from walidacja where nazwa = 'int'), 'Liczba kondygnacji budynku', 'Number of building storey', null, 3);
select paramsdict ('_wysokosc_oplat', 2, (select id from sekcja where nazwa = '_sekcjapodstawowa'), (select id from walidacja where nazwa = 'int'), 'Wysoko¶æ op³at', 'Height of payments', null, 8);
select paramsdict ('_dodatkowe_oplaty', 4, (select id from sekcja where nazwa = '_sekcjapodstawowa'), (select id from walidacja where nazwa = 'text'), 'Dodatkowe op³aty', 'Additional payments', null, 25);
select paramsdict ('_liczba_pieter', 2, (select id from sekcja where nazwa = '_sekcjapodstawowa'), (select id from walidacja where nazwa = 'int'), 'Liczba piêter', 'Quantity of storeys', null, 3);
select paramsdict ('_numer_pietra', 1, (select id from sekcja where nazwa = '_sekcjapodstawowa'), (select id from walidacja where nazwa = 'int'), 'Numer piêtra', 'Number of storey', null, 3);
select paramsdict ('_wysokosc_czynszu', 1, (select id from sekcja where nazwa = '_sekcjapodstawowa'), (select id from walidacja where nazwa = 'int'), 'Czynsz', 'Height of rent', null, 8);
select paramsdict ('_rok_budowy', 3, (select id from sekcja where nazwa = '_sekcjapodstawowa'), (select id from walidacja where nazwa = 'int'), 'Rok budowy', 'Year of building', null, 4);
select paramsdict ('_liczba_witryn', 4, (select id from sekcja where nazwa = '_sekcjapodstawowa'), (select id from walidacja where nazwa = 'int'), 'Liczba witryn', 'Number of shopwindows', null, 4);
select paramsdict ('_liczba_pom_gospodarczych', 4, (select id from sekcja where nazwa = '_sekcjapodstawowa'), (select id from walidacja where nazwa = 'int'), 'Liczba pomieszczeñ gospodarczych', 'Number of economic rooms', null, 4);
select paramsdict ('_liczba_pom_socjalnych', 4, (select id from sekcja where nazwa = '_sekcjapodstawowa'), (select id from walidacja where nazwa = 'int'), 'Liczba pomieszczeñ socjalnych', 'Number of social rooms', null, 4);
select paramsdictroom ('_powierzchnia', 4, (select id from sekcja where nazwa = '_sekcjadodatkowa'), (select id from walidacja where nazwa = 'float'), 'Powierzchnia(m2)', 'Surface(m2)', null, 8);

select paramsdict ('_szerokosc', 4, (select id from sekcja where nazwa = '_sekcjadodatkowa'), (select id from walidacja where nazwa = 'float'), 'Szeroko¶æ', 'Width', 'Weite', 8);
select paramsdict ('_dlugosc', 4, (select id from sekcja where nazwa = '_sekcjadodatkowa'), (select id from walidacja where nazwa = 'float'), 'D³ugo¶æ', 'Length', 'Länge', 8);

select paramsdict ('_pow_grunt_orny', 4, (select id from sekcja where nazwa = '_otoczenie'), (select id from walidacja where nazwa = 'float'), 'Pow. gruntu ornego(m2)', 'The ground surface arable(m2)', null, 8);
select paramsdict ('_pow_pastwisko', 4, (select id from sekcja where nazwa = '_otoczenie'), (select id from walidacja where nazwa = 'float'), 'Pow. pastwiska(m2)', 'Surface of pasture(m2)', null, 8);
select paramsdict ('_pow_laka', 4, (select id from sekcja where nazwa = '_otoczenie'), (select id from walidacja where nazwa = 'float'), 'Pow. ³±ki(m2)', 'Surface of meadow(m2)', null, 8);
select paramsdict ('_pow_las', 4, (select id from sekcja where nazwa = '_otoczenie'), (select id from walidacja where nazwa = 'float'), 'Pow. lasu(m2)', 'Surface of forest(m2)', null, 8);
select paramsdict ('_pow_nieuzytki', 4, (select id from sekcja where nazwa = '_otoczenie'), (select id from walidacja where nazwa = 'float'), 'Pow. nieu¿ytków(m2)', 'Surface of waste lands(m2)', null, 8);
select paramsdict ('_pow_grunt_inny', 4, (select id from sekcja where nazwa = '_otoczenie'), (select id from walidacja where nazwa = 'float'), 'Pow. gruntów innych(m2)', 'Surface of other grounds(m2)', null, 8);

select paramsdict ('_odl_od_centrum', 4, (select id from sekcja where nazwa = '_usytuowanie'), (select id from walidacja where nazwa = 'int'), 'Odleg³o¶æ od centrum (m)', 'Distance from the centre (m)', 'Entfernung vom Zentrum (m)', 8);
select paramsdict ('_odl_od_szkoly', 4, (select id from sekcja where nazwa = '_usytuowanie'), (select id from walidacja where nazwa = 'int'), 'Odleg³o¶æ od szko³y (m)', 'Distance from the school (m)', 'Entfernung von der Schule (m)', 8);

select paramsdict ('_wysokosc_pomieszczen', 3, (select id from sekcja where nazwa = '_informacjetechniczne'), (select id from walidacja where nazwa = 'float'), 'Wysoko¶æ pomieszczeñ (m)', 'Height of rooms (m)', 'Raumhöhe (m)', 5);


---opis jest wielojêzykowy, wiêc en sobie chyba podarujewszy :P
---select paramsdict ('_opis', 4, (select id from sekcja where nazwa = '_sekcjapodstawowa'), (select id from walidacja where nazwa = 'int'), 'Liczba pomieszczeñ socjalnych', 'Number of social rooms', null);

---select paramsdict ('_powierzchnia_pom_gospodarczych', 2, (select id from sekcja where nazwa = '_sekcjapodstawowa'), (select id from walidacja where nazwa = 'float'), 'Powierzchnia pomieszczeñ gospodarczych', 'Surface of economic rooms', null);

---migracja rodzajow poszczegolnych nieruchomosci
-----				 nowy tag miejscowosci, stara tabela szczegolow, kolumna szczegolow, id szczegolow - wszystko textowo
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

select nieruchomoscszczeg ('_mieszkanie', 'rodzaj_b', 'nazwa_b', 'id');
select nieruchomoscszczeg ('_dom', 'rodzaj_of', 'rodzaj_of', 'id');
select nieruchomoscszczeg ('_dzialka', 'rodzaj_of_dzi', 'rodzaj_of', 'id');
select nieruchomoscszczeg ('_lokal', 'rodzaj_of_lok', 'rodzaj_of', 'id');
select nieruchomoscszczeg ('_obiekt', 'rodzaj_of_obi', 'rodzaj_of', 'id');
select nieruchomoscszczeg ('_teren', 'rodzaj_of_te', 'rodzaj_of', 'id');

---wrzucenie wylacznie tlumaczen do nowej bazy, w nowej bazie nie ma na to tabeli
---to moze isc tylko raz, stad wyleci w zwiazku z tym chyba 
select * from MigrateToTags('rodzaj_ryn', 'nazwa_r', 'id');


---drop function PoprawNieisOf();
CREATE FUNCTION PoprawNieisOf () RETURNS VOID AS $$
DECLARE
	licznik integer;
BEGIN
	licznik := 1;
	FOR licznik IN 1..10 LOOP
		EXECUTE 'update tab_ofe set num_of' || licznik || ' = null, rodz_of' || licznik || ' = null where num_of' || licznik || ' = 0 and rodz_of' || licznik || ' = 0;';
	END LOOP;
END
$$ LANGUAGE plpgsql;

select PoprawNieisOf();

---w perspektywie najpewniej bedzie potrzebna taka procedura jak ponizej, chodzi o przerzucenie standardowych slownikow (chyba nie ma tego duzo jesli w  ogole cos jeszcze jest)
---CREATE FUNCTION StandardDict (tab_slow_old text, kol_slow_old text, tab_slow_new text)

---test: select num_of1 from tab_ofe where id_ofe = 547;

---drop FUNCTION PrzepiszOferent (varchar);

---ten parametr jest bez sensu, nie jest uzyty
CREATE FUNCTION PrzepiszOferent () RETURNS VOID AS $$
DECLARE
	rec_dane record;
	imie_id integer;
	msc_id integer;
	osoba_id integer;
	licznik integer;
	rec_nier_info record;
	curs refcursor;
	klient_id integer;
	dow_os_id integer;
	numer_of_pop integer;
	rodzaj_of_pop integer;
BEGIN
	licznik := 1;
	select into dow_os_id id from rodzaj_dowod_tozsamosc where nazwa = '_dowod_osobisty';
	FOR rec_dane IN select id_ofe, id_a, im1, im2, naz1, naz2, nazrod, mie, substring(kodp from 1 for 6) as kodp, ul, nud, num, pesel, nudow, telstac1, telstac2, telkom1, telkom2, naztelstac1, naztelstac2, naztelkom1, naztelkom2, email from tab_ofe LOOP
		select into msc_id min(id_region_geog) from RegionGeograficznyNajnizej(rec_dane.mie || '%'); ----troche lipa - nie wiadomo na stowe co on wezmie, a nie moge sie uwalic na opolskie ...
		IF msc_id is null THEN
			RAISE NOTICE 'Nie znalazl msc: %', rec_dane.mie;
		END IF;
		select into imie_id id from imie where lower(nazwa) = lower(rec_dane.im1);
		IF imie_id is null THEN
			---RAISE NOTICE 'Nie znalazl imienia: %', rec_dane.im1;
			select into imie_id id from imie where lower(nazwa) = lower(rec_dane.im2);
			IF imie_id is null THEN
				RAISE NOTICE 'Nie znalazl imion: %, %', rec_dane.im1, rec_dane.im2;
			END IF;
		ELSE
			insert into osoba (id_old, id_imie, nazwisko, nazwisko_rodowe, pesel, id_agent) values (rec_dane.id_ofe, imie_id, rec_dane.naz1, rec_dane.nazrod, rec_dane.pesel, rec_dane.id_a);
			select into osoba_id currval('osoba_id_seq');
			---rec_dane.nudow
			insert into osoba_dowod (id_osoba, id_rodzaj_dowod_tozsamosc, nazwa) values (osoba_id, dow_os_id, rec_dane.nudow);
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
			IF rec_dane.kodp != '' THEN
				insert into osoba_adres (id, kod_pocztowy, id_region_geog, ulica, numer_dom, numer_miesz) values (osoba_id, rec_dane.kodp, msc_id, rec_dane.ul, rec_dane.nud, rec_dane.num);
			END IF;
			---dodanie osoby jako bedacej jedna z reprezentantow klienta
			select into klient_id id from klient where id_old = rec_dane.id_ofe and is_oferent_old = true;
			insert into osoba_klient (id_klient, id_osoba) values (klient_id, osoba_id);
			
			FOR licznik IN 1..10 LOOP
				FOR rec_nier_info IN EXECUTE 'select num_of' || licznik || ' as numer_of, rodz_of' || licznik || ' as rodzaj_of_id, info_k as opis, tab_rodzaju_ofe.nazwa_tab as tabela, tab_rodzaju_ofe.dane_pomocnicze 
				from tab_ofe join tab_rodzaju_ofe on tab_ofe.rodz_of' || licznik ||' = tab_rodzaju_ofe.num where id_ofe = ' || rec_dane.id_ofe || ' and num_of' || licznik || ' is not null;' LOOP
					--FETCH curs INTO rec_nier_info;
					IF rec_nier_info.numer_of is not null and rec_nier_info.numer_of != 0 THEN
						---cos jest nie tak z tym poprzednim numerem, nie uzywane, lepiej poczyscic zapytaniami tab ofe
						IF klient_id is not null THEN --and numer_of_pop != rec_nier_info.numer_of 
							--numer_of_pop := rec_nier_info.numer_of;
							perform PrzepiszNieruchomosc(rec_nier_info.numer_of, rec_nier_info.tabela, klient_id, rec_nier_info.dane_pomocnicze, rec_nier_info.opis);
						END IF;
					END IF;
					---dziala : rec_nier_info.tabela to tabela, ktora musimy smigac :P, rec_nier_info.numer_of to numer oferty w niej
					---RAISE NOTICE 'oferta dla klienta : % , oferta : % , tabela : %', rec_dane.id_ofe, rec_nier_info.numer_of, rec_nier_info.tabela;
					---close curs;
				END LOOP;
			END LOOP;
		END IF;
	END LOOP;
END
$$ LANGUAGE plpgsql;
---select PrzepiszOferent('bla');

---drop function PrzytnijTekstMsc (text);
---metoda do rozbierania zapisu miejscowosc - dzielnica na sama miejscowosc
---dziala :)
CREATE FUNCTION PrzytnijTekstMsc (text_msc text) RETURNS text AS $$
DECLARE
	text_to_pos varchar;
	res_text text;
BEGIN
	text_to_pos := '-';
	IF position(text_to_pos in text_msc) > 0 THEN
		select into res_text trim(substring(text_msc from 1 for position(text_to_pos in text_msc) - 1));
	ELSE
		select into res_text trim(text_msc);
	END IF;
	return res_text;
END
$$ LANGUAGE plpgsql;

CREATE FUNCTION Explode (datatoexplode text) RETURNS text[] AS $$
DECLARE
	res text[];
BEGIN
	--trim(substring(text_msc from 1 for position(text_to_pos in text_msc) - 1))
	res[1] = trim(substring(datatoexplode from 1 for position('.' in datatoexplode) - 1));
	res[2] = trim(substring(datatoexplode from position('.' in datatoexplode) + 1 for (character_length(datatoexplode) - character_length(res[1]))));

	return res;
END;
$$ LANGUAGE plpgsql;

---procedura jest duzo lepsza od explode, zalecane jej zastosowanie :)
---drop FUNCTION Boom (varchar(2), text);
CREATE FUNCTION Boom (delimiter varchar(2), datatoexplode text) RETURNS text[] AS $$
DECLARE
	result text[];
	pozycja integer;
	licznik integer;
	dane text;
BEGIN
	dane := datatoexplode;
	licznik := 1;
	WHILE position(delimiter in dane) > 1 LOOP
		pozycja := position(delimiter in dane);
		result[licznik] = trim(substring(dane from 1 for pozycja - 1));
		---RAISE NOTICE '%.', dane;
		dane = trim(substring(dane from pozycja + 1 for character_length(dane) - pozycja));
		licznik := licznik + 1;
	END LOOP;
	return result;
END;
$$ LANGUAGE plpgsql; 

---select * from PrzytnijTekstMsc('DSA - dsa');
 
---selectowac po kolei klientow ze starej bazy, ustalac rodzaje ofertpobierac nowe id, i wtedy puszczac procedure wrzucania nieruchomosci
---w petli sprawdzac kolejne rodzaje ofert i ich id, osobna procedura podawac zestaw nazw tabel itd, sama nazwe tabeli mozna selectowac :P, nazw pol juz nie ;/

---drop function PrzepiszNieruchomosc (text, integer, integer, text, text, text, integer, text, text, text, text, text, text);

CREATE FUNCTION PrzepiszNieruchomosc (num_of integer, nazwa_tab text, ---nazwa starej tabeli,
klient_id integer, kol_tab text[], opis_nier text) RETURNS VOID AS $$
DECLARE
---przy pomocy nowego id klienta ewentualnie pobierac stare :P
	rec_nier_info record;
	rec_nier_trans record;
	rec_nier_szcz record;
	curs refcursor;
	curs_nier_trans refcursor;
	curs_nier_szcz refcursor;
	msc_text text;
	msc_id integer;
	powiat_id integer;
	nier_id integer;
	nier_id_n integer;
	nier_szcz_id integer;
	rynek_rodz boolean;
	data_nier date;
	rodzaj_of_tab text[];
BEGIN
	---OPEN curs_nier_trans FOR EXECUTE 'select id from nier_rodzaj where nazwa = \'' || kol_tab[10] || '\';';
	---FETCH curs_nier_trans INTO rec_nier_trans;
	select into nier_id id from nier_rodzaj where nazwa = kol_tab[10];
	---nier_id := rec_nier_trans.id;
	---CLOSE curs_nier_trans;

	--IF kol_tab[2] = 'null' THEN
	--	OPEN curs FOR EXECUTE 'select '|| kol_tab[4] ||' as msc,' || kol_tab[5] || ' as powiat_id,' || kol_tab[14] || ' as woj_id,' || kol_tab[6] || ' as opole_poza,' || kol_tab[7] || ' as ulica,' 
	--	|| kol_tab[8] || ' as data,' || kol_tab[9] || ' as rodzaj_rynek, opis_po, id_a from '|| nazwa_tab ||' where ' || kol_tab[1] || ' = ' || num_of || ';';
	--	FETCH curs INTO rec_nier_info;
	--	nier_szcz_id := null;
	--ELSE
		select into rodzaj_of_tab Explode(kol_tab[3]);

		OPEN curs FOR EXECUTE 'select '|| kol_tab[2] ||' as nier_szcz,'|| kol_tab[4] ||' as msc,' || kol_tab[5] || ' as powiat_id,' || kol_tab[14] || ' as woj_id,' || kol_tab[6] || ' as opole_poza,' 
		|| kol_tab[7] || ' as ulica,' || kol_tab[8] || ' as data,' || kol_tab[9] || ' as rodzaj_rynek, opis_po, id_a from '|| nazwa_tab ||' where ' || kol_tab[1] || ' = ' || num_of || ';';
		FETCH curs INTO rec_nier_info;
		---wyczytac z odpowiedniej tabeli tag (3 index arraya ma nazwe tabeli, walnac tym w kursor, z tagiem to juz poradzimy, ogolnie wyczytac tag) odnosnie rodzaj_nier_szcz
		OPEN curs_nier_szcz FOR EXECUTE 'select ' || kol_tab[3] || ' as rodzaj_of, rodz_nier_szczeg.id from ' || nazwa_tab || ' join ' || rodzaj_of_tab[1] || ' on ' || nazwa_tab || '.' 
		|| kol_tab[2] || ' = ' || rodzaj_of_tab[1] || '.id join rodz_nier_szczeg on ' || kol_tab[3] || ' = rodz_nier_szczeg.nazwa where ' || nazwa_tab || '.' || kol_tab[1] 
		|| ' = ' || num_of || ' and rodz_nier_szczeg.id_nier_rodzaj = (select id from nier_rodzaj where nazwa = \'' || kol_tab[10] || '\');';
		---na tag pobrac odpowiednie id
		FETCH curs_nier_szcz INTO rec_nier_szcz;
		nier_szcz_id := rec_nier_szcz.id;
		CLOSE curs_nier_szcz;
	--END IF;
	---uzyskanie id powiatu wg nowej tabeli na podstawie id powiatu starego slownika
	select into powiat_id id from region_geog where nazwa = (select nazwa_p from powiaty where id_pow = rec_nier_info.powiat_id);
	---rozwiazanie tymczasowe
	IF powiat_id is null THEN
		powiat_id := rec_nier_info.woj_id;
		---select into powiat_id id from region_geog where nazwa = '_polska';
	END IF;
	---jak juz na poziomie wojewodztwa nie ma informacji wpalamy na hama opolskie :P
	IF powiat_id = 0 THEN
		powiat_id := 9;
	END IF;
	---obrobic jakos bardziej ten msc_txt
	select into msc_text PrzytnijTekstMsc(rec_nier_info.msc);
	---selectowac id miejscowosci, jak sie uda uzyc
	---jesli opole_poza = 1 nier stoi w opolu, mozna od razu do adresu pobierac opole z region_geog
	IF rec_nier_info.opole_poza = 1 THEN
		---(select id_region_geog from RegionGeograficznyNajnizej(mieospr))
		select into msc_id id_region_geog from RegionGeograficznyCzwPozWoj('Opole', 9);
	ELSE
		IF rec_nier_info.woj_id > 0 THEN
			select into msc_id id_region_geog from RegionGeograficznyCzwPozWoj(msc_text, rec_nier_info.woj_id);
		ELSE
			select into msc_id id_region_geog from RegionGeograficznyNajnizej(msc_text);
		END IF;
		IF msc_id is null THEN
			RAISE NOTICE 'Przenoszenie nieruchomosci, nie znalazl miejscowosci:%. Id old : %', msc_text, num_of;
			msc_id := powiat_id;
		END IF;
	END IF;
	

	---jesli rodzaj rynku = 2 to pierwotny na false
	IF rec_nier_info.rodzaj_rynek = 2 THEN
		rynek_rodz := false;
	ELSE
		rynek_rodz := true;
	END IF;
	---reszta nie podlega juz przerobce, zamknac kursor i insert
	---RAISE NOTICE 'Data: %', rec_nier_info.data;
	CLOSE curs;
	data_nier := rec_nier_info.data;
	IF data_nier is null THEN
		data_nier := '2007-09-30';
	END IF;
	---insert
	BEGIN
		insert into nieruchomosc (id_old, id_nier_rodzaj, id_rodz_nier_szcz, id_klient, id_region_geog, ulica_net, ulica, id_agent, data, rynek_pierw) values (num_of, 
		nier_id, nier_szcz_id, klient_id, msc_id, rec_nier_info.msc, rec_nier_info.ulica, rec_nier_info.id_a, data_nier, rynek_rodz);
		select into nier_id_n currval('nieruchomosc_id_seq');
	EXCEPTION WHEN not_null_violation THEN
		RAISE NOTICE 'Dane nieruchomosci: Num Of: %, Nier Rodzaj: %, Nier szcz: %, Klient:  %, Reg geog: %, Ulica: %, Agent: %, Data: %, Rynek: %', num_of, nier_id, nier_szcz_id, 
		klient_id, msc_id, rec_nier_info.ulica, rec_nier_info.id_a, rec_nier_info.data, rynek_rodz;
	END;
	IF nier_id_n is not null THEN
		insert into opis_nieruchomosc (id_nieruchomosc, id_agent, data, tresc) values (nier_id_n, rec_nier_info.id_a, data_nier, opis_nier);
		IF character_length (rec_nier_info.opis_po) > 2 THEN
			insert into opis_nieruchomosc (id_nieruchomosc, id_agent, data, tresc) values (nier_id_n, rec_nier_info.id_a, data_nier, rec_nier_info.opis_po);
		END IF;
		---to przechwytuje nulle
		perform DodajOferta (kol_tab, nier_id_n, klient_id, num_of, nazwa_tab);
		---dodanie szczegolow nieruchomosci - tu musi wszystko dzialac az milo - jak cos debugowac wewnatrz tej procedury
		perform PrzeniesDaneNieruchomosc (nier_id_n, nazwa_tab, kol_tab[1], num_of);
	END IF;
END
$$ LANGUAGE plpgsql;

CREATE FUNCTION DodajOferta (kol_tab text[], nier_id integer, klient_id integer, num_of integer, nazwa_tab text) RETURNS VOID AS $$
DECLARE
	curs refcursor;
	rec_curs record;
	rec_dane_kl record;
	rodz_trans_id integer;
	is_prowizja_proc boolean;
	is_wylacznosc boolean;
	prowizja_war varchar;
	status_id integer;
	licz_blad integer;
	oferta_new_id integer;
	test integer;
BEGIN
	licz_blad := 0;
	is_prowizja_proc := true;
	is_wylacznosc := false;
	select into rodz_trans_id id from trans_rodzaj where nazwa = kol_tab[11];
	select into rec_dane_kl datazlec, datazamzlec, status_k as status, wys_prow_sp as prow_sp, wys_prow_wy as prow_wyn from tab_ofe where id_ofe = (select id_old from klient where id = klient_id);
	OPEN curs FOR EXECUTE 'select ' || kol_tab[8] || ' as data, ' || kol_tab[12] || ' as cena, ' || kol_tab[13] || ' as wylacznosc, ' || kol_tab[17] || ' as czas_przek, 
	' || kol_tab[16] || ' as status, ' || kol_tab[15] || ' as usun, pokaz, dodopis, dodopis_en, dodopis_ge from ' || nazwa_tab || ' where ' || kol_tab[1] || ' = ' || num_of || ';';
	FETCH curs INTO rec_curs;

	IF kol_tab[11] = '_sprzedaz' THEN
		prowizja_war := rec_dane_kl.prow_sp;
	ELSE
		prowizja_war := rec_dane_kl.prow_wyn;
	END IF;

	IF prowizja_war::float > 100 THEN
		is_prowizja_proc := false;
	END IF;

	IF rec_curs.wylacznosc = 2 THEN
		is_wylacznosc := true;
	END IF;
	status_id := rec_curs.status;
	IF rec_curs.status = 2 THEN
		SELECT INTO status_id id from status where nazwa = '_zawieszona';
	END IF;
	IF rec_curs.status = 0 or rec_curs.usun = true THEN
		SELECT INTO status_id id from status where nazwa = '_nieaktualna';
	END IF;
	IF rec_curs.usun = true THEN
		rec_curs.pokaz := false;
	END IF;

	rec_curs.czas_przek := rec_curs.czas_przek::integer;

	IF rec_curs.czas_przek = 13 THEN
		rec_curs.czas_przek := 0;	
	ELSIF rec_curs.czas_przek <= 12 and rec_curs.czas_przek >= 5 THEN
		rec_curs.czas_przek := rec_curs.czas_przek - 3;
	ELSIF rec_curs.czas_przek <= 4 and rec_curs.czas_przek >= 2 THEN
		rec_curs.czas_przek := rec_curs.czas_przek + 8;
	END IF;

	select into oferta_new_id id from oferta where id = num_of;

	IF oferta_new_id is null and num_of is not null THEN
		oferta_new_id := num_of;
	ELSE
		select into oferta_new_id nextval('oferta_id_seq');
	END IF;
	

	BEGIN
		insert into oferta (id, id_old, id_rodz_trans, id_nieruchomosc, id_status, data, data_otw_zlecenie, data_zam_zlecenie, cena, prowizja_proc, prowizja, wylacznosc, pokaz, czas_przekazania) values 
		(oferta_new_id, num_of, rodz_trans_id, nier_id, status_id, rec_curs.data, rec_dane_kl.datazlec, rec_dane_kl.datazamzlec, rec_curs.cena, is_prowizja_proc, prowizja_war, is_wylacznosc, 
		rec_curs.pokaz, rec_curs.czas_przek);
	EXCEPTION WHEN not_null_violation THEN
		licz_blad := licz_blad + 1;
		RAISE NOTICE 'Byl niedozowolony null w ofercie: %', licz_blad;
	END;
	---dodanie opisow
	---select into oferta_new_id currval('oferta_id_seq');
	IF character_length (rec_curs.dodopis) > 2 THEN
		insert into opis(id_oferta, id_jezyk, wartosc) values (oferta_new_id, (select id from jezyk where nazwa = 'Polski'), rec_curs.dodopis);
	END IF;
	IF character_length (rec_curs.dodopis_en) > 2 THEN
		insert into opis(id_oferta, id_jezyk, wartosc) values (oferta_new_id, (select id from jezyk where nazwa = 'English'), rec_curs.dodopis_en);
	END IF;
	IF character_length (rec_curs.dodopis_ge) > 2 THEN
		insert into opis(id_oferta, id_jezyk, wartosc) values (oferta_new_id, (select id from jezyk where nazwa = 'Deutsch'), rec_curs.dodopis_ge);
	END IF;
END
$$ LANGUAGE plpgsql;

---2 utilsy: podzial na kropke : zwrocenie 1 elementu, oraz zwrocenie tablicy 2 elementow, 2 rzutowanie na int
---protected :P

CREATE FUNCTION DodajZdjecieImport (nieruchomosc_id integer, rozszerzenie text, stara_nazwa text) RETURNS text AS $$
DECLARE
	id_zdj integer;
	sep text;
	nazwa_zdj text;
BEGIN
	sep := '_';
	select into id_zdj nextval('zdjecie_id_seq');
	nazwa_zdj := nieruchomosc_id || sep || id_zdj || '.' || rozszerzenie;
	insert into zdjecie (id, id_nieruchomosc, nazwa, nazwa_old) values (id_zdj, nieruchomosc_id, nazwa_zdj, stara_nazwa);
	return nazwa_zdj;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION PrzeniesZdjecie (new_nier_id integer, old_id_nier integer, tab_nazwa text, kol_id text) RETURNS VOID AS $$
DECLARE
	temp record;
	licznik integer;
BEGIN
	licznik := 1;
	WHILE licznik < 13 LOOP
		FOR temp in execute 'select zd' || licznik || ' as zdjecie from ' || tab_nazwa || ' where ' || kol_id || ' = ' || old_id_nier LOOP
			IF temp.zdjecie > 0 THEN
				perform DodajZdjecieImport(new_nier_id, 'jpg', temp.zdjecie);
			END IF;
		END LOOP;
		licznik := licznik + 1;
	END LOOP;
END;
$$ LANGUAGE plpgsql;
---przeniesienie parametreow nieruchomosci jak i wyposazen pobranych ze slownikow
---komorki wystepujace w tabeli wraz z odpowiadajacymi im informacjami lub slownikami posiadajacymi ter informacje sa w tabeli tab_rodzaju_ofe w tablicach
CREATE FUNCTION PrzeniesDaneNieruchomosc (new_id integer, tab_nazwa text, kol_id text, old_id_n integer) RETURNS VOID AS $$
DECLARE
	curs refcursor;
	rec_curs record;
	---tablice parametrow yes/no
	tab_komorka_yesno text[];
	tab_komorka_yesno_tag text[];
	---tablice parametrow podawanych z reki
	tab_komorka_param text[];
	tab_komorka_param_tag text[];
	---tablice dla slownikow
	tab_komorka_slow text[];
	tab_komorka_slow_tabela text[];
	
	---koniec tablic
	rec_dane record;
	tab_2_el text[];
	pierwszyElTab text;
	drugiElTab text;
	text_slow text;
	tag_rodzic text;
	kol_inf text;
	IloscPom integer;
	licznik integer;
	tak integer;
	parametr_id integer;
BEGIN
	perform PrzeniesZdjecie(new_id, old_id_n, tab_nazwa, kol_id);
	tak := 2;
	licznik := 1;
	select into rec_dane komorka_yesno, komorka_yesno_tag, komorka_param, komorka_param_tag, komorka_slow, komorka_slow_tabela 
	from tab_rodzaju_ofe where nazwa_tab = tab_nazwa;

	tab_komorka_yesno := rec_dane.komorka_yesno;
	tab_komorka_yesno_tag := rec_dane.komorka_yesno_tag;
	tab_komorka_param := rec_dane.komorka_param;
	tab_komorka_param_tag := rec_dane.komorka_param_tag;
	tab_komorka_slow := rec_dane.komorka_slow;
	tab_komorka_slow_tabela := rec_dane.komorka_slow_tabela;

	WHILE tab_komorka_yesno[licznik] is not null LOOP
		---RAISE NOTICE '%', tab_komorka_yesno[licznik];
		FOR rec_curs IN EXECUTE 'select ' || tab_komorka_yesno[licznik] ||' as dana from ' || tab_nazwa || ' where ' || kol_id || ' = ' || old_id_n || ';' LOOP
			IF rec_curs.dana = tak THEN
				---RAISE NOTICE '%', tab_komorka_yesno_tag[licznik];
				insert into dane_slow_wyp_nier(id_nieruchomosc, id_wyposazenie_nier) values (new_id, (select id from wyposazenie_nier where nazwa = tab_komorka_yesno_tag[licznik]));
			END IF;
		END LOOP;
		licznik := licznik + 1;
	END LOOP;
	licznik := 1;
	WHILE tab_komorka_param[licznik] is not null LOOP
		---RAISE NOTICE '%', tab_komorka_yesno[licznik];
		FOR rec_curs IN EXECUTE 'select ' || tab_komorka_param[licznik] ||'::text as dana from ' || tab_nazwa || ' where ' || kol_id || ' = ' || old_id_n || ';' LOOP
---poprawic: pobrac walidacje, zrobic rzutowaniei i fa lub od razy insert
			IF rec_curs.dana != '0' THEN
				---RAISE NOTICE '%', tab_komorka_yesno_tag[licznik];
				select into parametr_id id from parametr_nier where nazwa = tab_komorka_param_tag[licznik];
				IF parametr_id is not null THEN
					insert into dane_txt_nier(id_nieruchomosc, id_parametr_nier, wartosc) values (new_id, parametr_id, rec_curs.dana);
				ELSE
					RAISE NOTICE 'Nie ma w tabeli parametru %.', tab_komorka_param_tag[licznik];
				END IF;
			END IF;
		END LOOP;
		licznik := licznik + 1;
	END LOOP;
	licznik := 1;
	WHILE tab_komorka_slow[licznik] is not null LOOP
		---RAISE NOTICE '%', tab_komorka_yesno[licznik];
		select into tab_2_el * from Explode (tab_komorka_slow[licznik]);
		kol_inf := tab_2_el[1];
		tag_rodzic := tab_2_el[2];
		FOR rec_curs IN EXECUTE 'select ' || kol_inf ||' as dana from ' || tab_nazwa || ' where ' || kol_id || ' = ' || old_id_n || ';' LOOP
			IF rec_curs.dana > 0 THEN
				---jeszcze rozlamac ta informacje
				select into tab_2_el * from Explode(tab_komorka_slow_tabela[licznik]);
				pierwszyElTab := tab_2_el[1];
				---kursor dac albo ta petle
				OPEN curs FOR EXECUTE 'select ' || tab_komorka_slow_tabela[licznik] || ' as dana_tag from ' || pierwszyElTab || ' where id = ' || rec_curs.dana || ';';
				---w kursorze mamy tag, fetchowac go i insert
				FETCH curs INTO rec_curs;
				---RAISE NOTICE 'Dziecko: %', rec_curs.dana_tag;
				---RAISE NOTICE 'Rodzic: %', tag_rodzic;
				insert into dane_slow_wyp_nier(id_nieruchomosc, id_wyposazenie_nier) values (new_id, (select id from wyposazenie_nier where nazwa = rec_curs.dana_tag and id_parent = (select id from wyposazenie_nier where nazwa = tag_rodzic)));
				CLOSE curs;
			END IF;
		END LOOP;
		licznik := licznik + 1;
	END LOOP;

	perform PrzeniesPomieszczenieNieruchomosc (new_id, tab_nazwa, kol_id, old_id_n);
END
$$ LANGUAGE plpgsql;

---drop function PrzeniesPomieszczeniaNieruchomosc
---select PrzeniesPomieszczenieNieruchomosc (4, 'tab_dom', 760, 'no_d');
CREATE FUNCTION PrzeniesPomieszczenieNieruchomosc (new_id integer, tab_nazwa text, kol_id text, old_id_n integer) RETURNS VOID AS $$
DECLARE
	----tablice dla pomieszczen: parametry slownikowe
	tab_komorka_slow_pom text[]; ---nazwa kolumny w starej tabeli
	tab_komorka_slow_pom_nazwa text[]; ---tabela.kolumna starego slownika
	tab_komorka_slow_tabela_pom text[]; ---pomieszczenie.ilosc powtorzen w bazie
	----tablice dla pomieszczen: parametry z reki
	tab_komorka_param_pom text[];
	tab_komorka_param_pom_nazwa text[];
	tab_komorka_param_tabela_pom text[];
	---
	rec_curs record;
	rec_dane record;
	ilosc_pom integer;
	tag_pomieszczenia text;
	tab_rozdz text[];
	licznik_pom integer;
	licznik integer;
	pomieszczenie_id integer;
	test integer;
	tag_rodzic_pom text;
	wyp_pom_id integer;
BEGIN
	select into rec_dane komorka_slow_pom, komorka_slow_pom_nazwa, komorka_slow_tabela_pom, komorka_param_pom, komorka_param_pom_nazwa, 
	komorka_param_tabela_pom from tab_rodzaju_ofe where nazwa_tab = tab_nazwa;

	tab_komorka_slow_pom := rec_dane.komorka_slow_pom;
	tab_komorka_slow_pom_nazwa := rec_dane.komorka_slow_pom_nazwa;
	tab_komorka_slow_tabela_pom := rec_dane.komorka_slow_tabela_pom;
	tab_komorka_param_pom := rec_dane.komorka_param_pom;
	tab_komorka_param_pom_nazwa := rec_dane.komorka_param_pom_nazwa;
	tab_komorka_param_tabela_pom := rec_dane.komorka_param_tabela_pom;

	IF tab_komorka_slow_pom is not null THEN
		---wszystko tu
		licznik := 1;
		WHILE tab_komorka_slow_tabela_pom[licznik] is not null LOOP
			---najpierw wyznaczenie ilosci pomieszczen i tagu pomieszczenia
			select into tab_rozdz * from Explode (tab_komorka_slow_tabela_pom[licznik]);
			tag_pomieszczenia := tab_rozdz[1];
			ilosc_pom := tab_rozdz[2]::integer;
			select into pomieszczenie_id id from pomieszczenie where nazwa = tag_pomieszczenia;
			IF ilosc_pom > 1 THEN
				---petla selectujaca info dla kolejnego pomieszczenia
				licznik_pom := 1;
				WHILE licznik_pom <= ilosc_pom LOOP
					---pobranie ze starej tabeli informacji
					select into tab_rozdz * from Explode (tab_komorka_slow_pom_nazwa[licznik]);
					FOR rec_curs IN EXECUTE 'select ' || tab_komorka_slow_pom[licznik] || licznik_pom || ' as numer, ' || tab_komorka_slow_pom_nazwa[licznik] || ' as tag_dana from ' || tab_nazwa || ' join ' || tab_rozdz[1] ||' on ' || tab_nazwa || '.' || tab_komorka_slow_pom[licznik] || licznik_pom || ' = ' || tab_rozdz[1] || '.id where ' || kol_id || ' = ' || old_id_n || ';' LOOP
						IF rec_curs.numer > 0 THEN
							---sprawdzenie czy takie pomieszczenie nie jest juz dodane
							select into test id from pomieszczenie_przyn_nier where id_nieruchomosc = new_id and id_pomieszczenie = pomieszczenie_id and nr_pomieszczenia = licznik_pom;
							---jesli nie jest dodanie
							IF test is null THEN
								insert into pomieszczenie_przyn_nier (id_nieruchomosc, id_pomieszczenie, nr_pomieszczenia) values (new_id, pomieszczenie_id, licznik_pom);
								select into test currval('pomieszczenie_przyn_nier_id_seq');
							---ELSE
							END IF;
							---wprowadzenie informacji do nowej bazy
							IF tab_rozdz[1] = 'podlogi' THEN
								tag_rodzic_pom := '_podlogi';
							ELSIF tab_rozdz[1] = 'sciany' THEN
								tag_rodzic_pom := '_sciany';
							ELSIF tab_rozdz[1] = 'sufit' THEN
								tag_rodzic_pom := '_sufit';
							ELSE
								tag_rodzic_pom := null;
							END IF;
							IF tag_rodzic_pom is not null THEN
								select into wyp_pom_id id from wyposazenie_pom where nazwa = rec_curs.tag_dana and id_parent = (select id from wyposazenie_pom where nazwa = tag_rodzic_pom);
								IF wyp_pom_id is null THEN
									RAISE NOTICE 'Wyposazenie pomieszczenia: %, %, %', test, rec_curs.tag_dana, tag_rodzic_pom;
								ELSE
									insert into dane_slow_wyp_pom (id_pomieszczenie_przyn_nier, id_wyposazenie_pom) values (test, wyp_pom_id);
								END IF;
							ELSE
								select into wyp_pom_id id from wyposazenie_pom where nazwa = rec_curs.tag_dana;
								IF wyp_pom_id is null THEN
									RAISE NOTICE 'Wyposazenie pomieszczenia: %, %', test, rec_curs.tag_dana;
								ELSE
									insert into dane_slow_wyp_pom (id_pomieszczenie_przyn_nier, id_wyposazenie_pom) values (test, wyp_pom_id);
								END IF;
							END IF;
						END IF;
					END LOOP;
					licznik_pom := licznik_pom + 1;
				END LOOP;
				licznik := licznik + 1;
			ELSE
				select into tab_rozdz * from Explode (tab_komorka_slow_pom_nazwa[licznik]);
				FOR rec_curs IN EXECUTE 'select ' || tab_komorka_slow_pom[licznik] ||' as numer, ' || tab_komorka_slow_pom_nazwa[licznik] || ' as tag_dana from ' || tab_nazwa || ' join ' || tab_rozdz[1] ||' on ' || tab_nazwa || '.' || tab_komorka_slow_pom[licznik] || ' = ' || tab_rozdz[1] || '.id where ' || kol_id || ' = ' || old_id_n || ';' LOOP
					IF rec_curs.numer > 0 THEN
						---sprawdzenie czy takie pomieszczenie nie jest juz dodane
						select into test id from pomieszczenie_przyn_nier where id_nieruchomosc = new_id and id_pomieszczenie = pomieszczenie_id and nr_pomieszczenia = 1;
						---jesli nie jest dodanie
						IF test is null THEN
							insert into pomieszczenie_przyn_nier (id_nieruchomosc, id_pomieszczenie, nr_pomieszczenia) values (new_id, pomieszczenie_id, 1);
							select into test currval('pomieszczenie_przyn_nier_id_seq');
						END IF;
						---wprowadzenie informacji do nowej bazy
						IF tab_rozdz[1] = 'podlogi' THEN
							tag_rodzic_pom := '_podlogi';
						ELSIF tab_rozdz[1] = 'sciany' THEN
							tag_rodzic_pom := '_sciany';
						ELSIF tab_rozdz[1] = 'sufit' THEN
							tag_rodzic_pom := '_sufit';
						ELSE
							tag_rodzic_pom := null;
						END IF;
						IF tag_rodzic_pom is not null THEN
							insert into dane_slow_wyp_pom (id_pomieszczenie_przyn_nier, id_wyposazenie_pom) values (test, (select id from wyposazenie_pom where nazwa = rec_curs.tag_dana and id_parent = (select id from wyposazenie_pom where nazwa = tag_rodzic_pom)));
						ELSE
							insert into dane_slow_wyp_pom (id_pomieszczenie_przyn_nier, id_wyposazenie_pom) values (test, (select id from wyposazenie_pom where nazwa = rec_curs.tag_dana));
						END IF;
					END IF;
				END LOOP;
				licznik := licznik + 1;
			END IF;
		END LOOP;
	---przeciwnego wypadku nie robie bo w przeciwnym wypadku nic sie nie dzieje
	END IF;

	IF tab_komorka_param_pom is not null THEN
		---wszystko tu
		licznik := 1;
		WHILE tab_komorka_param_tabela_pom[licznik] is not null LOOP
			---najpierw wyznaczenie ilosci pomieszczen i tagu pomieszczenia
			select into tab_rozdz * from Explode (tab_komorka_param_tabela_pom[licznik]);
			tag_pomieszczenia := tab_rozdz[1];
			ilosc_pom := tab_rozdz[2]::integer;
			select into pomieszczenie_id id from pomieszczenie where nazwa = tag_pomieszczenia;
			IF ilosc_pom > 1 THEN
				---petla selectujaca info dla kolejnego pomieszczenia
				licznik_pom := 1;
				WHILE licznik_pom <= ilosc_pom LOOP
					---pobranie ze starej tabeli informacji
					FOR rec_curs IN EXECUTE 'select ' || tab_komorka_param_pom[licznik] || licznik_pom || '::float as dana from ' || tab_nazwa || ' where ' || kol_id || ' = ' || old_id_n || ';' LOOP
						IF rec_curs.dana > 0 THEN
							---sprawdzenie czy takie pomieszczenie nie jest juz dodane
							select into test id from pomieszczenie_przyn_nier where id_nieruchomosc = new_id and id_pomieszczenie = pomieszczenie_id and nr_pomieszczenia = licznik_pom;
							---jesli nie jest dodanie
							IF test is null THEN
								---jesli jest pobranie id
								insert into pomieszczenie_przyn_nier (id_nieruchomosc, id_pomieszczenie, nr_pomieszczenia) values (new_id, pomieszczenie_id, licznik_pom);
								select into test currval('pomieszczenie_przyn_nier_id_seq');
							END IF;
							----insert do tabeli parametrow pomieszczenia
							insert into dane_txt_pom (id_pomieszczenie_przyn_nier, id_parametr_pom, wartosc) values (test, (select id from parametr_pom where nazwa = tab_komorka_param_pom_nazwa[licznik]), rec_curs.dana);
						END IF;
					END LOOP;
					licznik_pom := licznik_pom + 1;
				END LOOP;
				licznik := licznik + 1;
			ELSE
				---pobranie ze starej tabeli informacji
				FOR rec_curs IN EXECUTE 'select ' || tab_komorka_param_pom[licznik] || '::float as dana from ' || tab_nazwa || ' where ' || kol_id || ' = ' || old_id_n || ';' LOOP
					IF rec_curs.dana > 0 THEN
						---sprawdzenie czy takie pomieszczenie nie jest juz dodane
						select into test id from pomieszczenie_przyn_nier where id_nieruchomosc = new_id and id_pomieszczenie = pomieszczenie_id and nr_pomieszczenia = 1;
						---jesli nie jest dodanie
						IF test is null THEN
							insert into pomieszczenie_przyn_nier (id_nieruchomosc, id_pomieszczenie, nr_pomieszczenia) values (new_id, pomieszczenie_id, 1);
							select into test currval('pomieszczenie_przyn_nier_id_seq');
						END IF;
						----insert do tabeli parametrow pomieszczenia
						insert into dane_txt_pom (id_pomieszczenie_przyn_nier, id_parametr_pom, wartosc) values (test, (select id from parametr_pom where nazwa = tab_komorka_param_pom_nazwa[licznik]), rec_curs.dana);
					END IF;
				END LOOP;
				licznik := licznik + 1;
			END IF;
			
		END LOOP;
	---przeciwnego wypadku nie robie bo w przeciwnym wypadku nic sie nie dzieje
	END IF;
END
$$ LANGUAGE plpgsql;


---drop function PrzepiszKlient();

CREATE FUNCTION PrzepiszKlient () RETURNS VOID AS $$
DECLARE
	rec_dane record;
	imie_id integer;
	msc_id integer;
	osoba_id integer;
	licznik integer;
	rec_nier_info record;
	rec_of record;
	curs refcursor;
	rec_os_tow record;
	id_os_tow integer;
	klient_id integer;
	dow_os_id integer;
	zapotrzebowanie_new_id integer;
	rec_zap_old record;
	test_zap_ex integer; ---sprawdzenie, czy zap istnieje
BEGIN
	licznik := 1;
	select into dow_os_id id from rodzaj_dowod_tozsamosc where nazwa = '_dowod_osobisty';
	FOR rec_dane IN select id_k, id_a, im1, naz1, nazrod, mie, kodp, ul, nud, num, pesel, nudow, telstac1, telstac2, telkom1, telkom2, naztelstac1, naztelstac2, naztelkom1, naztelkom2, email, info_k from tab_kl order by id_k LOOP
		select into msc_id id from region_geog where lower(nazwa) like lower(rec_dane.mie || '%');
		IF msc_id is null THEN
			RAISE NOTICE 'Nie znalazl msc: %', rec_dane.mie;
		END IF;
		select into imie_id id from imie where lower(nazwa) = lower(rec_dane.im1);
		IF imie_id is null THEN
			RAISE NOTICE 'Nie znalazl imienia: %', rec_dane.im1;
		ELSE
			insert into osoba (id_old, id_imie, nazwisko, nazwisko_rodowe, pesel, id_agent) values (rec_dane.id_k, imie_id, rec_dane.naz1, rec_dane.nazrod, rec_dane.pesel, rec_dane.id_a);
			select into osoba_id currval('osoba_id_seq');
			---rec_dane.nudow
			insert into osoba_dowod (id_osoba, id_rodzaj_dowod_tozsamosc, nazwa) values (osoba_id, dow_os_id, rec_dane.nudow);
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
			IF rec_dane.kodp != '' THEN
				insert into osoba_adres (id, kod_pocztowy, id_region_geog, ulica, numer_dom, numer_miesz) values (osoba_id, rec_dane.kodp, msc_id, rec_dane.ul, rec_dane.nud, rec_dane.num);
			END IF;
			---dodanie osoby jako bedacej jedna z reprezentantow klienta
			select into klient_id id from klient where id_old = rec_dane.id_k and is_oferent_old = false and id not in (select distinct id_klient from nieruchomosc);
			insert into osoba_klient (id_klient, id_osoba) values (klient_id, osoba_id);
			---wrzucic zapotrzebowania na id klient
			
			select into rec_zap_old datazlec, datazamzlec, id_a from tab_kl where id_k = rec_dane.id_k; ---to moze byc chyba w tym for na gorze - pobranie tych danych

			select into test_zap_ex id from zapotrzebowanie where id = rec_dane.id_k;
			IF test_zap_ex is null THEN
				zapotrzebowanie_new_id := rec_dane.id_k;
			ELSE
				select into zapotrzebowanie_new_id nextval('zapotrzebowanie_id_seq');
			END IF;

			insert into zapotrzebowanie (id, id_klient, data, data_otw_zlecenie, data_zam_zlecenie, id_agent) values 
			(zapotrzebowanie_new_id, klient_id, rec_zap_old.datazlec, rec_zap_old.datazlec, rec_zap_old.datazamzlec, rec_zap_old.id_a);
			---upewnic sie przy imporcie ze to jest dobrze zrobione
			insert into opis_wew_zapotrzebowanie (id_zapotrzebowanie, id_agent, tresc) values (zapotrzebowanie_new_id, rec_dane.id_a, rec_dane.info_k);

			---select into zapotrzebowanie_new_id currval('zapotrzebowanie_id_seq');
			FOR licznik IN 1..12 LOOP
				---RAISE NOTICE 'looping: %', rec_dane.id_k;
				OPEN curs FOR EXECUTE 'select rodz_of' || licznik || ' as rodzaj_of from tab_kl where id_k = ' || rec_dane.id_k || ';';
				FETCH curs INTO rec_nier_info;
				
				IF rec_nier_info.rodzaj_of = 1 THEN
					RAISE NOTICE 'Przepisywanie zapotrzebowania.';
					select into rec_of dane_pomocnicze, param_min, param_max from tab_rodzaju_ofe_w where num = licznik;
					perform PrzepiszZapotrzebowanie(rec_dane.id_k, zapotrzebowanie_new_id, rec_of.dane_pomocnicze, rec_of.param_min, rec_of.param_max);
				END IF;
				CLOSE curs;
			END LOOP;

			
			FOR rec_os_tow IN select (select id from imie where lower(nazwa) = lower(a1.imie)) as imie, naz, id_ag from tab_oso_tow a1 where id_k = rec_dane.id_k LOOP
				insert into osoba (id_old, id_imie, nazwisko, nazwisko_rodowe, id_agent) values (rec_dane.id_k, rec_os_tow.imie, rec_os_tow.naz, rec_os_tow.naz, rec_os_tow.id_ag);
				select into id_os_tow currval('osoba_id_seq');
				insert into osoba_klient (id_klient, id_osoba) values (klient_id, id_os_tow);
			END LOOP;
		END IF;
	END LOOP;
END
$$ LANGUAGE plpgsql;

---select PrzepiszKlient();
---select id, id_old from klient where id_old in (select id_old from klient where id not in (select distinct id_klient from nieruchomosc) group by id_old having count(id_old) > 1) order by id_old;


---przepisz zapotrzebowanie
CREATE FUNCTION PrzepiszZapotrzebowanie (kl_old_id integer, zapotrzebowanie_id integer, kol_tab text[], par_min text[], par_max text[]) RETURNS VOID AS $$
DECLARE
	curs refcursor;
	rec_curs record;
	rec_temp record;
	dane text[];
	nier_r_id integer;
	trans_r_id integer;
	prow_proc boolean;
	test integer;
	zapotrzebowanie_nier_r_new_id integer;
	zapotrzebowanie_trans_r_new_id integer;
	licznik integer;
	l_pok_min integer;
	l_pok_max integer;
	licznik_dod_regionow integer;
	licznik_tab_exp integer;
	tablica_regionow text[];
	region_id integer;
BEGIN
	select into nier_r_id id from nier_rodzaj where nazwa = kol_tab[3]; ---info z danych pomocniczych wyciagniete, rodzaj nieruchomosci
	select into trans_r_id id from trans_rodzaj where nazwa = kol_tab[4]; ---rodzaj transakcji z danych pomocniczych

	select into test id from zapotrzebowanie_nier_rodzaj where id_zapotrzebowanie = zapotrzebowanie_id and id_nier_rodzaj = nier_r_id;
	IF test is null THEN
		insert into zapotrzebowanie_nier_rodzaj (id_zapotrzebowanie, id_nier_rodzaj) values (zapotrzebowanie_id, nier_r_id);
		select into zapotrzebowanie_nier_r_new_id currval('zapotrzebowanie_nier_rodzaj_id_seq');
	ELSE
		zapotrzebowanie_nier_r_new_id := test;
	END IF;

	OPEN curs FOR EXECUTE 'select status_k as status, sposob_pl, poszuk, ma_zbycie, ' || kol_tab[2] || ' as prowizja, ' || kol_tab[1] || ' as cena, ' || kol_tab[5] || ' as lokalizacja, ' || 
	kol_tab[6] || ' as msc, ' || kol_tab[7] || ' as dziel_ul, ' || kol_tab[8] || ' as standard, ' || kol_tab[9] || ' as info from tab_kl where id_k = ' || kl_old_id || ';';
	FETCH curs INTO rec_curs;
	CLOSE curs;

	IF rec_curs.sposob_pl = 0 THEN
		rec_curs.sposob_pl := 1; --zweryfikowac poprawnosc tych informacji
	END IF;
	
	insert into zapotrzebowanie_trans_rodzaj (id_zapotrzebowanie_nier_rodzaj, id_status, id_trans_rodzaj, cena, pokaz) values 
	(zapotrzebowanie_nier_r_new_id, rec_curs.status, trans_r_id, rec_curs.cena, true);
	select into zapotrzebowanie_trans_r_new_id currval('zapotrzebowanie_trans_rodzaj_id_seq');

	insert into opis_posz_zapotrzebowanie (id_zapotrzebowanie_trans_rodzaj, wartosc) values (zapotrzebowanie_trans_r_new_id, 'Miejscowosc: ' || rec_curs.msc || ', dzielnica/ulica: ' || rec_curs.dziel_ul || 
	', standard: ' || rec_curs.standard || ', informacje: ' || rec_curs.info); ---dodac ma zbycie ?
	---rec_curs.msc - tu sa poprzecinkowane lokalizacje
	licznik_dod_regionow := 0;
	select into tablica_regionow Boom (',', rec_curs.msc);

	licznik_tab_exp := 1;
	WHILE tablica_regionow[licznik_tab_exp] is not null LOOP
		FOR region_id in select id_region_geog from DowRegionGeograficzny(9, '%' || tablica_regionow[licznik_tab_exp] || '%') limit 1 LOOP
			IF region_id is not null THEN
				licznik_dod_regionow := licznik_dod_regionow + 1;
				perform DodajRegGeogZap (zapotrzebowanie_trans_r_new_id, region_id);
			END IF;
		END LOOP;
		licznik_tab_exp := licznik_tab_exp + 1;
	END LOOP;
	IF licznik_dod_regionow < 1 THEN
		IF rec_curs.lokalizacja = 0 or rec_curs.lokalizacja = 3 THEN
			insert into zap_lokaliz_nier (id_zapotrzebowanie_trans_rodzaj, id_region_geog) values (zapotrzebowanie_trans_r_new_id, (select id from region_geog where nazwa = 'opolskie'));
		ELSIF rec_curs.lokalizacja = 2 THEN
			insert into zap_lokaliz_nier (id_zapotrzebowanie_trans_rodzaj, id_region_geog) values (zapotrzebowanie_trans_r_new_id, (select id from region_geog where nazwa = 'opolski'));
		ELSE
			insert into zap_lokaliz_nier (id_zapotrzebowanie_trans_rodzaj, id_region_geog) values (zapotrzebowanie_trans_r_new_id, (select min(id_region_geog) from RegionGeograficznyCzwPozWoj('Opole', 9)));
		END IF;
	END IF;
	
	prow_proc := true;

	IF rec_curs.prowizja::float > 100 THEN
		prow_proc := false;
	END IF;

	select into test id from prowizja_zapotrzebowanie where id_zapotrzebowanie = zapotrzebowanie_id and id_trans_rodzaj = trans_r_id;
	IF test is null THEN
		insert into prowizja_zapotrzebowanie (id_zapotrzebowanie, id_trans_rodzaj, prowizja_proc, prowizja, id_sposob_finansowania, poszukiwane_dla) values 
		(zapotrzebowanie_id, trans_r_id, prow_proc, rec_curs.prowizja, rec_curs.sposob_pl, rec_curs.poszuk);
	END IF;
	---pozostaja parametry i rodzaje budynku
	licznik := 1;
	WHILE par_min[licznik] is not null LOOP
		select into dane Explode(par_min[licznik]);
		FOR rec_temp in execute 'select ' || dane[1] || ' as dana from tab_kl where id_k = ' || kl_old_id || ';' LOOP
			IF rec_temp.dana > 0 THEN
				insert into dane_txt_zap_min (id_zapotrzebowanie_trans_rodzaj, id_parametr_nier, wartosc) values (zapotrzebowanie_trans_r_new_id, (select id from parametr_nier where nazwa = dane[2]), rec_temp.dana);
			END IF;
		END LOOP;
		licznik := licznik + 1;
	END LOOP;

	licznik := 1;
	WHILE par_max[licznik] is not null LOOP
		select into dane Explode(par_max[licznik]);
		FOR rec_temp in execute 'select ' || dane[1] || ' as dana from tab_kl where id_k = ' || kl_old_id || ';' LOOP
			IF rec_temp.dana > 0 THEN
				insert into dane_txt_zap_max (id_zapotrzebowanie_trans_rodzaj, id_parametr_nier, wartosc) values (zapotrzebowanie_trans_r_new_id, (select id from parametr_nier where nazwa = dane[2]), rec_temp.dana);
			END IF;
		END LOOP;
		licznik := licznik + 1;
	END LOOP;

	---rodzaje budynku ....
	IF kol_tab[3] = '_mieszkanie' THEN
		----analiza pokoi i wprowadzenie do par min i par max
		l_pok_min := 0;
		l_pok_max := 0;
		licznik := kol_tab[12]::integer;
		WHILE licznik > 0 LOOP
			FOR rec_temp in execute 'select ' || kol_tab[10] || licznik || kol_tab[11] || ' as dana from tab_kl where id_k = ' || kl_old_id || ';' LOOP
				IF rec_temp.dana = true THEN
					IF licznik > l_pok_max THEN
						l_pok_max := licznik;
					END IF;
					l_pok_min := licznik;
				END IF;				
			END LOOP;
			licznik := licznik - 1;
		END LOOP;
		---przejrzano wszystkie boole
		---liczba pokoi min i max zostala ustalona
		IF l_pok_min > 0 THEN
			insert into dane_txt_zap_min (id_zapotrzebowanie_trans_rodzaj, id_parametr_nier, wartosc) values (zapotrzebowanie_trans_r_new_id, (select id from parametr_nier where nazwa = '_liczba_pokoi'), l_pok_min);
		END IF;
		IF l_pok_max > 0 THEN
			insert into dane_txt_zap_max (id_zapotrzebowanie_trans_rodzaj, id_parametr_nier, wartosc) values (zapotrzebowanie_trans_r_new_id, (select id from parametr_nier where nazwa = '_liczba_pokoi'), l_pok_max);
		END IF;
	ELSE
		----zczytywanie i wprowadzenie rodzajow budynku
		licznik := kol_tab[12]::integer;
		WHILE licznik > 0 LOOP
			---kol_tab[3], kol_tab[13]
			FOR rec_temp in execute 'select ' || kol_tab[10] || licznik || kol_tab[11] || ' as dana from tab_kl where id_k = ' || kl_old_id || ';' LOOP
				IF rec_temp.dana = 1 THEN
				---pobrac na id text rodzaju budynku, pobrac id z nowego slownika i insert (3 opercje - 2 ;))
					FOR rec_temp in execute 'select rodzaj_of as dana from ' || kol_tab[13] || ' where id = ' || licznik LOOP
						insert into zap_szcz_nier (id_zapotrzebowanie_trans_rodzaj, id_rodz_nier_szcz) values (zapotrzebowanie_trans_r_new_id, (select id from rodz_nier_szczeg where nazwa = rec_temp.dana and id_nier_rodzaj = (select id from nier_rodzaj where nazwa = kol_tab[3])));
					END LOOP;
				END IF;
			END LOOP;
			licznik := licznik - 1;
		END LOOP;
	END IF;
END
$$ LANGUAGE plpgsql;

---ewentualnie zdjac obostrzenie na not null w id klient
---drop FUNCTION PrzeniesListaWskazan();
---select PrzeniesListaWskazan();
---update tab_li_wsk set nr_ag = 18 where nr_ag = 24;
---KorektaLWsk dodane poimportowo 22-08-2008
CREATE FUNCTION KorektaLWsk () RETURNS VOID AS $$
DECLARE
	curs refcursor;
	rec_curs record;
	dane_rec record;
	klient_new_id integer;
	zapotrzebowanie_id integer;
	oferta_id integer;
	licznik integer;
	godzina_id integer;
	minuta_id integer;
	ofe_new_id integer;
	zlecenie_id integer;
BEGIN
	licznik := 0;
	FOR zlecenie_id in select distinct id_k from tab_li_wsk where id_k not in (select distinct id_zapotrzebowanie from lista_wsk_adr) LOOP
		FOR dane_rec IN select id_k, id_of, rodz_of, data_ogl, (select Explode(godziny.godziny)) as godzina, nr_ag from tab_li_wsk join godziny on tab_li_wsk.godz_ogl = godziny.id where id_k = zlecenie_id LOOP
			IF character_length (dane_rec.godzina[1]) = 1 THEN
				dane_rec.godzina[1] := '0' || dane_rec.godzina[1];
			END IF;
			select into godzina_id id from godzina where nazwa = dane_rec.godzina[1];
			select into minuta_id id from minuta where nazwa = dane_rec.godzina[2];
			---pobrac nowe id klienta: max jesli wiecej niz jedno, nie wystepujace w tabeli nieruchomosci dlatego, ze poprzedni klient tylko szukal
			select into klient_new_id id_klient from zapotrzebowanie where id = zlecenie_id; --and id not in (select distinct id_klient from nieruchomosc);
			select into rec_curs dane_pomocnicze from tab_rodzaju_ofe where num = dane_rec.rodz_of;
			oferta_id := dane_rec.id_of;
			select into ofe_new_id id_klient from nieruchomosc join oferta on nieruchomosc.id = oferta.id_nieruchomosc where oferta.id = oferta_id;
			--BEGIN
			select into oferta_id id from oferta where id = oferta_id;
				
			--EXCEPTION WHEN not_null_violation THEN
			IF oferta_id is null or klient_new_id is null THEN ---or godzina_id is null
				licznik := licznik + 1;
				RAISE NOTICE 'Ilosc brakow w liscie wsk: %', licznik;
				RAISE NOTICE 'Dane: Oferta: %, Zapotrzebowanie: %, Oferent: %, Klient: %, Agent: %, Data %, Godzina %', oferta_id, zlecenie_id, ofe_new_id, klient_new_id, dane_rec.nr_ag, dane_rec.data_ogl, dane_rec.godzina[1];
			ELSE
				insert into lista_wsk_adr (id_oferta, id_zapotrzebowanie, id_klient, id_agent, data, ogladanie_data, ogladanie_godzina, ogladanie_minuta) values 
				(oferta_id, zlecenie_id, klient_new_id, dane_rec.nr_ag, dane_rec.data_ogl::timestamp, dane_rec.data_ogl, godzina_id, minuta_id);
			END IF;
			--END;
		END LOOP;
	END LOOP;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION PrzeniesListaWskazan () RETURNS VOID AS $$
DECLARE
	curs refcursor;
	rec_curs record;
	dane_rec record;
	klient_new_id integer;
	zapotrzebowanie_id integer;
	oferta_id integer;
	licznik integer;
	godzina_id integer;
	minuta_id integer;
	ofe_new_id integer;
BEGIN
	licznik := 0;
	FOR dane_rec IN select id_k, id_of, rodz_of, data_ogl, (select Explode(godziny.godziny)) as godzina, nr_ag from tab_li_wsk join godziny on tab_li_wsk.godz_ogl = godziny.id LOOP
		select into godzina_id id from godzina where nazwa = dane_rec.godzina[1];
		select into minuta_id id from minuta where nazwa = dane_rec.godzina[2];
		---pobrac nowe id klienta: max jesli wiecej niz jedno, nie wystepujace w tabeli nieruchomosci dlatego, ze poprzedni klient tylko szukal
		select into klient_new_id max(id) from klient where is_oferent_old = false and id_old = dane_rec.id_k; --and id not in (select distinct id_klient from nieruchomosc);
		select into rec_curs dane_pomocnicze from tab_rodzaju_ofe where num = dane_rec.rodz_of;
		--RAISE NOTICE '%', rec_curs.dane_pomocnicze[10];
		--RAISE NOTICE '%', klient_new_id;
		---okreslamy zapotrzebowanie dla klienta szukajacego
		select into zapotrzebowanie_id id from zapotrzebowanie where id_klient = klient_new_id; --- and id_nier_rodzaj = (select id from nier_rodzaj where nazwa = rec_curs.dane_pomocnicze[10]) and id_trans_rodzaj = (select id from trans_rodzaj where nazwa = rec_curs.dane_pomocnicze[11]);
		--id of to id oferty ??
		---select into ofe_new_id max(id) from klient where is_oferent_old = true and id_old = dane_rec.id_of; 
		select into oferta_id oferta.id from oferta join nieruchomosc on nieruchomosc.id = oferta.id_nieruchomosc where oferta.id_old = dane_rec.id_of and nieruchomosc.id_nier_rodzaj = 
		(select id from nier_rodzaj where nazwa = rec_curs.dane_pomocnicze[10]) and oferta.id_rodz_trans = (select id from trans_rodzaj where nazwa = rec_curs.dane_pomocnicze[11]);
		IF oferta_id is null THEN
			select into oferta_id min(oferta.id) from oferta join nieruchomosc on nieruchomosc.id = oferta.id_nieruchomosc where oferta.id_old = dane_rec.id_of and nieruchomosc.id_nier_rodzaj = 
			(select id from nier_rodzaj where nazwa = rec_curs.dane_pomocnicze[10]);
		END IF;
		select into ofe_new_id id_klient from nieruchomosc join oferta on nieruchomosc.id = oferta.id_nieruchomosc where oferta.id = oferta_id;
		BEGIN
			insert into lista_wsk_adr (id_oferta, id_zapotrzebowanie, id_klient, id_agent, data, ogladanie_data, ogladanie_godzina, ogladanie_minuta) values 
			(oferta_id, zapotrzebowanie_id, klient_new_id, dane_rec.nr_ag, dane_rec.data_ogl::timestamp, dane_rec.data_ogl, godzina_id, minuta_id);
		EXCEPTION WHEN not_null_violation THEN
			licznik := licznik + 1;
			RAISE NOTICE 'Ilosc brakow w liscie wsk: %', licznik;
			RAISE NOTICE 'Dane: Oferta: %, Zapotrzebowanie: %, Oferent: %, Klient: %, Agent: %, Data %', oferta_id, zapotrzebowanie_id, ofe_new_id, klient_new_id, dane_rec.nr_ag, dane_rec.data_ogl;
		END;
	END LOOP;
END
$$ LANGUAGE plpgsql;

----przeniesienie gazet :) - procedura importowa
												---id sprzedazy :P
CREATE FUNCTION PrzeniesGazeta (nier_id integer, sprz_id integer, tabela text, pow text[], pokoje boolean) RETURNS VOID AS $$
DECLARE
	pot_msc_t text; --potencjalnie miejscowosc :P
	region_id integer;
	status_t text; --decyzja o statusie
	pok_il integer;
	pow_dzi_t text;
	dane record;
	rec_temp record;
	new_id integer;
	pelny_opis text;
	przyp_d date;
BEGIN
	FOR dane in execute 'select id, lok, cena, ' || pow[1] || ' as powierzchnia, gazeta, data_of, uwagi, komentarz, aktu, tel_st_1 as tel1, tel_st_2 as tel2, tel_kom_1 as tel3, tel_kom_2 as tel4, data_p, pokaz from ' || tabela || ';' LOOP
		select into pot_msc_t PrzytnijTekstMsc (dane.lok);
		select into region_id id_region_geog from RegionGeograficznyNajnizejWoj(pot_msc_t, 9) limit 1; ---;) z tym limitem :P
		---status
		IF dane.aktu = 't' THEN
			status_t := '_aktualna';
		ELSE
			status_t := '_nieaktualna';
		END IF;
		---przypomnienie
		IF dane.pokaz = true THEN
			przyp_d := dane.data_p;
		ELSE
			przyp_d := null;
		END IF;
		---2 powierzchnia
		IF pow[2] is not null THEN
			FOR rec_temp in execute 'select ' || pow[2] || '::float as powierzchnia from ' || tabela || ' where id = ' || dane.id || ';' LOOP
				IF rec_temp.powierzchnia > 0 THEN
					pelny_opis := 'Powierzchnia dzia³ki: ' || rec_temp.powierzchnia || ' ';
				END IF;
			END LOOP;
		END IF;
		---pokoje
		IF pokoje = true THEN
			FOR rec_temp in execute 'select pok::integer from ' || tabela || ' where id = ' || dane.id || ';' LOOP
				IF rec_temp.pok > 0 THEN
					pelny_opis := pelny_opis || 'iloœæ pokoi: ' || rec_temp.pok || ' ';
				END IF;
			END LOOP;
		END IF;
		pelny_opis := pelny_opis || dane.uwagi;
		insert into media_nieruchomosc (id_nier_rodzaj, id_trans_rodzaj, id_region_geog, id_status, id_agent, data, ulica, oferent, powierzchnia, cena, opis, przypomnienie, id_media_reklama) 
		values (nier_id, sprz_id, region_id, (select id from status where nazwa = status_t), 1, dane.data_of, dane.lok, true, dane.powierzchnia, dane.cena, pelny_opis, przyp_d, 
		(select id from media_reklama where nazwa = trim(lower(dane.gazeta))));
		---po insercie glownym :)
		select into new_id currval('media_nieruchomosc_id_seq');
		---kontakt
		insert into kon_m_nieruchomosc (id_media_nieruchomosc, id_agent, komentarz, data) values (new_id, 1, dane.komentarz, dane.data_of);
		---wrzucenie aktualnego promowania w danym zrodle :P
		insert into reklama_nieruchomosc_m (id_media_nieruchomosc, id_media_reklama, data) values (new_id, (select id from media_reklama where nazwa = trim(lower(dane.gazeta))), dane.data_of);
		---telefony - tu by mozna zaiterowac, ale po co :P
		IF character_length (dane.tel1) > 6 THEN
			insert into telefon_media_nieruchomosc (id_media_nieruchomosc, nazwa) values (new_id, dane.tel1);
		END IF;
		IF character_length (dane.tel2) > 6 THEN
			insert into telefon_media_nieruchomosc (id_media_nieruchomosc, nazwa) values (new_id, dane.tel2);
		END IF;
		IF character_length (dane.tel3) > 6 THEN
			insert into telefon_media_nieruchomosc (id_media_nieruchomosc, nazwa) values (new_id, dane.tel3);
		END IF;
		IF character_length (dane.tel4) > 6 THEN
			insert into telefon_media_nieruchomosc (id_media_nieruchomosc, nazwa) values (new_id, dane.tel4);
		END IF;
	END LOOP;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION PrzeniesPubOtodom () RETURNS VOID AS $$
DECLARE
	rec_otodom_wys record;
	rec_dane record;
	nazwa_tab text;
	nazwa_oferta text;
	nazwa_id text;
	numer_oferty integer;
	is_act boolean;
	dzis date;
	test integer;
BEGIN
	select into dzis current_date;
	FOR rec_otodom_wys in select * from otodom_wysylka LOOP
		IF rec_otodom_wys.id_rodzaj_nier = 1 THEN
			nazwa_tab := 'tab_dom'; ---dom
			nazwa_oferta := 'no_d';
			nazwa_id := 'id_d';
		ELSIF rec_otodom_wys.id_rodzaj_nier = 2 THEN
			nazwa_tab := 'tab_mie'; ---mieszkanie
			nazwa_oferta := 'no_m';
			nazwa_id := 'id_m';
		ELSIF rec_otodom_wys.id_rodzaj_nier = 4 THEN
			nazwa_tab := 'tab_lok'; ---lokal
			nazwa_oferta := 'no_d';
			nazwa_id := 'id_d';
		ELSIF rec_otodom_wys.id_rodzaj_nier = 5 THEN
			nazwa_tab := 'tab_dzi'; ---dzialka
			nazwa_oferta := 'no_d';
			nazwa_id := 'id_d';
		END IF;
		is_act := true;
		IF rec_otodom_wys.data_wyg < dzis THEN
			is_act := false;
		END IF;
		FOR rec_dane in execute 'select ' || nazwa_oferta || ' as id_oferta from ' || nazwa_tab || ' where ' || nazwa_id || ' = ' || rec_otodom_wys.id_nieruchomosc LOOP
			---to nie zachowa sie jako petla, a jesli tak to bardzo niedobrze :P - to po prostu niemozliwe
			select into test id from oferta where id = rec_dane.id_oferta;
			IF test is not null THEN
				insert into portal_wys (id_oferta, id_portal, portal_ins_id, data_wys, data_wyg, is_active) values 
				(rec_dane.id_oferta, (select id from portal where nazwa = 'Otodom'), rec_otodom_wys.otodom_ins_id, rec_otodom_wys.data_wys, rec_otodom_wys.data_wyg, is_act);
			ELSE
				RAISE NOTICE 'Publikacje otodom, nie ma oferty: %. nr id rekordu: %', rec_dane.id_oferta, rec_otodom_wys.id_nieruchomosc;
			END IF;
		END LOOP;		
	END LOOP;
END;
$$ LANGUAGE plpgsql;