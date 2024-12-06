set client_encoding to latin2;

drop FUNCTION PodajListaOfertAkt ();
drop FUNCTION PodajListaOfertPublikacjaGratka ();
drop FUNCTION PodajListaOfertPublikacjaGazetaDom ();
drop FUNCTION PodajListaOfertPublikacjaOfertyNet ();
drop FUNCTION PodajListaOfertPublikacjaKrn ();
drop FUNCTION PodajOfertaOfertyNet (integer);
drop FUNCTION PodajOfertaDomiporta (integer, boolean);
drop FUNCTION WyposazeniePodajSzczeg(integer, text);
drop FUNCTION WyposazeniePodajIdSzczeg(integer, text);
drop FUNCTION MediaTakNieOfertyExport(integer, text, integer);
drop FUNCTION ParametryOfertyExport (integer, text);
drop FUNCTION PodajOfertyDeaktywacjaOfertyNet ();
drop FUNCTION PodajOfertyDeaktywacja (text);
drop FUNCTION PodajOfertyProlongata (text);
drop FUNCTION PodajInsOtodomIdPoOfId (integer);
drop FUNCTION PodajOfIdPoInsOtodom (otodom_id integer);
drop FUNCTION SprawdzAktOfwPortalu (integer, text);
drop FUNCTION AktDeaktOferta (integer, boolean);
drop FUNCTION PodajOfertaOtodom (integer, boolean);
---drop FUNCTION PodajZdjeciaOtodom (integer, text);
drop FUNCTION OgloszenieOfertyNet (integer);
drop FUNCTION OgloszenieDomiporta (integer, integer, integer);
drop FUNCTION PodajOfertaGazetaDom (integer);
drop FUNCTION PodajOfertaKrn (integer);
drop FUNCTION PodajOfertaGratka (integer);
drop FUNCTION OgloszenieOtodom (integer, integer, integer);

drop type oferta_usun;
drop type OfertaOfNet;
drop type OfertaGazetaDom;
drop type OfertaGratka;
drop type OfertaKrn;
drop type OfertaDomiporta;
drop type OfertaOtodom;

create type OfertaOtodom AS (
id_oferta integer,
id_agent integer,
insertion_id integer,
data_mod date,
data_wyg date,
id_wojewodztwo integer,
id_powiat integer,
miejscowosc text,
ulica text,
cena float,
powierzchnia float,
rynek_pierw boolean,
stan_prawny text,
opis text,
id_kategoria integer,
rodzaj_oferta text,
rodzaj_nieruchomosc text,
dodatki text[],
liczba_pokoi integer,
liczba_pieter integer,
numer_pietra integer,
powierzchnia_dzialki float,
rok text,
zdjecie text[]
);

create type OfertaDomiporta AS (
exclusive integer,
id integer,
Nr_oferty integer,
Operacja text,
Kategoria text,
Miasto text,
Powiat text,
Wojewodztwo text,
Gmina text,
Dzielnica text,
Lokalizacja text,
Ulica text,
Najblizsza_przecznica text,
Polozenie text,
Kierunek text,
Odleglosc_od_centrum_miasta_woj float,
Odleglosc_od_drogi_glownej float,
Przy_drodze text,
Nawierzchnia_drogi text,
Forma_wlasnosci text,
Powierzchnia float, ---calkowita
okna_strony_swiata text,
wyposazenie text,
witryny integer,
Wymiary text,
Pow_miesz float,
Powierzchnia_zabudowy float,
Pow_dzial float,
Pietro integer,
Ile_pieter integer,
Liczba_poziomow integer,
Liczba_kondygnacji integer,
Pietra_opis text,
Piwnica text, --opisy
Parter text, --opisy
Poddasze_opis text,
Liczba_pokoi integer,
Pokoje_opis text, --opisy
Kuchnia text,
Liczba_lazienek integer,
Lazienka text,
Liczba_sypialni integer,
Salon_powierzchnia float,
Przedpokoj_powierzchnia float,
Piwnica_powierzchnia float,
Strych_powierzchnia float,
Meble text,
Rok integer,
rok_nabycia integer,
Stan_techniczny text,
Material text,
Stan_lokalu text,
Standard text,
Technologia text,
Ksztalt text,
Czy_mozliwy_podzial integer,
Przeznaczenie text,
Dopuszczalna_zabudowa float,
Zagospodarowanie text,
Ogrodzenie text,
Dach text,
Ogrzewanie text,
Kanalizacja text,
Woda text,
Sila integer,
Elektr integer, 
Gaz integer,
Telefon integer,
TV_kablowa integer,
TV integer,
Internet integer,
Pralka integer,
Lodowka integer,
Zamrazarka integer,
Zmywarka integer,
Klimatyzacja integer,
Lokal_pusty integer,
Winda integer,
Domofon integer,
Zsyp text,
Ogrodek integer,
Parking_typ text,
Parking_liczba_miejsc integer,
Zabezpieczenia text,
Garaz integer,
Garaz_typ text,
Garaz_liczba_stanowisk integer,
Glosnosc text,
Dzialka_uwagi text,
Halas text,
Otoczenie text,
Sasiedztwo text,
Zalesienie integer,
Opis text,
Wysokosc_czynszu float,
Czynsz_najemca integer,
Cena_metra float,
Wartosc float, --cena
zdjecia text[],
Kontakt text
);

create type OfertaGazetaDom AS (
klucz integer, ---id_oferta
id_oferta integer,
id_nier_rodzaj integer,
id_trans_rodzaj integer,
wojewodztwo text,
miasto_powiat text, --tu zawsze bedzie chyba walony powiat ...
dzielnica_gmina text, --tu raczej zawsze gmina ? ... niekoniecznie to sie tak uda ..
adres text, --lokalizacja
pietro integer,
ilosc_pieter integer,
cena float,
cena_m2 float,
ilosc_pok integer,
powierzchnia float,
pow_dzialki text,
pow_ogrodu float,
rok_bud text, --date ??
stan text, --do remontu itd
---material text, --technologia budowlana ?
typ_bud text,
droga text, --asfalt itd - nawierzchnia drogi
typ_dzialki text, ---u mnie to typ budynku .... w sensie typ nieruchomosci
agencja_kontakt text, --imie nazwisko agenta
agencja_telefon1 text, ---tel stacj
agencja_telefon2 text, ---tel kom agenta
agencja_email text, --adres email agenta
--media text, --nei wiem czy nie []; na razie media sobie podaruje
zdjecie text[],
komentarz text
); 

create type OfertaOfNet as (
id_oferta integer,
id_nier_rodzaj integer,
id_trans_rodzaj integer,
wojewodztwo text,
miasto text,
dzielnica text,
okolica text,
ulica text,
dataaktualizacji text,
cena float,
powierzchnia float,
powierzchniadzialki float,
typzabudowy text,
typlokalu text,
liczbapokoi integer,
liczbatelefonow integer,
ogrzewanie text,
pietro integer,
liczbapieter integer,
rokbudowy integer,
winda boolean,
materialbudowy text,
stanbudynku text,
typkuchni text,
miejscaparkingowe text,
opis text,
biuro boolean,
meble boolean,
typpodlaczeniawody text,
gaz text,
uzbrojenie text,
klimatyzacja integer,
rodzajlacz text,
zwalnianeod text,
zabezpieczenia text,
agent_nazwisko text,
agent_email text,
agent_tel_biuro text,
agent_tel_kom text,
zdjecie text[]
);

create type OfertaKrn AS (
id_nier_rodzaj integer,
id_trans_rodzaj integer,
id_wojewodztwo integer,
nr_oferty integer,
klucz integer,
miejscowosc text,
--dzielnica text,
ulica text,
cena text,
powierzchnia float,
powierzchnia_dzialki float,
ogrzewanie text,
rok_budowy integer,
stan_techniczny text,
opis text,
--czynsz float,
forma_wlasnosci text,
liczba_pieter integer,
ktore_pietro integer,
liczba_pokoi integer,
zdjecie text[]
);

create type OfertaGratka as (
data_zalozenia date,
id_nier_rodzaj integer,
id_trans_rodzaj integer,
numer_oferty integer,
id_oferta integer,
id_region integer, 
miejscowosc text,
dzielnica text,
ulica text, 
id_pietro integer,              
id_liczba_pieter integer,              
powierzchnia float,
powierzchnia_dzialki float,
cena_calkowita float,
cena float,
wysokosc_czynszu float,             
opis text,
kontakt_email text,
kontakt_telefon text,
kontakt_osoba text,
id_forma_wlasnosci integer,
id_rodz_nier_szcz integer, --w domu juz typ budynku ....
id_liczba_pokoi integer,
id_rok_budowy integer,
id_material integer,
id_stan_mieszkania integer,
id_okna integer,
id_ogrzewanie integer,
id_balkon integer,
id_telefon integer,
id_internet integer,
id_wolne_od integer,
data_usuniecia date,
na_wylacznosc integer,
zdjecie text[]
);

create type oferta_usun as (
id_oferta integer,
id_nier_rodzaj integer,
id_trans_rodzaj integer
);

---automat jest tylko po to, zeby sciezka do zdjec byla podawana: w przypadku pojedynczej oferty relatywna, wzgledna; w przypadku ofert meczonych z nocnych weryfikacji potrzebna jest sciezka od korzenia
CREATE FUNCTION PodajOfertaOtodom (oferta_id integer, automat boolean) RETURNS SETOF OfertaOtodom AS $$
DECLARE
	result OfertaOtodom;
	temp record;
	rec_oferta record;
	akt_data date;
	region_dane record;
	region_id integer;
	gmina_id integer;
	powiat_id integer;
	wojewodztwo_id integer;
	nieruchomosc_id integer;
	jezyk_id integer;
	licznik integer;
	test integer;
	sciezka text;
	przes_data integer;
	tag_powierzchnia text;
	tag_stan_prawny text;
	tag_liczba_pokoi text;
	tag_liczba_pieter text;
	tag_numer_pietra text;
	tag_powierzchnia_dzialki text;
	tag_rok text;
	pokaz_region_b boolean;
BEGIN
	---okreslenie tagow
	tag_powierzchnia := '_powierzchnia_uzytkowa';
	tag_stan_prawny := '_stan_prawny';
	tag_liczba_pokoi := '_liczba_pokoi';
	tag_liczba_pieter := '_liczba_pieter';
	tag_numer_pietra := '_numer_pietra';
	tag_powierzchnia_dzialki := '_powierzchnia_dzialki';
	tag_rok := '_rok_budowy';
	---koniec okreslania tagow
	
	---pobranie id nieruchomosci
	select into nieruchomosc_id id_nieruchomosc from oferta where id = oferta_id;
	---pobranie id regionu geograficznego oferty
	select into region_dane id_region_geog, region_geog.zaglebienie from nieruchomosc join region_geog on nieruchomosc.id_region_geog = region_geog.id where nieruchomosc.id = nieruchomosc_id;

	IF region_dane.zaglebienie = 5 THEN
		select into region_id id_parent from region_geog where id = region_dane.id_region_geog;
	ELSE
		region_id := region_dane.id_region_geog;
	END IF;
	

	---pobranie id gminy
	select into gmina_id id_parent from region_geog where id = region_id;
	---pobranie id powiatu
	select into powiat_id id_parent from region_geog where id = gmina_id;
	---pobranie id wojewodztwa
	select into wojewodztwo_id id_parent from region_geog where id = powiat_id;
	---pobranie id jezyka polskiego
	select into jezyk_id id from jezyk where nazwa = 'Polski';
	
	przes_data := 30;
	select into akt_data current_date;
	select into temp * from portal_wys where id_oferta = oferta_id and id_portal = (select id from portal where nazwa = 'Otodom');
	
	---pobranie id dodania w otodomie
	result.insertion_id := temp.portal_ins_id;
	result.data_mod := akt_data;
	select into result.data_wyg akt_data + przes_data;
	---nazwy miejscowosci
	select into pokaz_region_b pokaz from region_geog where id = region_id;
	IF pokaz_region_b = true THEN
		select into result.miejscowosc nazwa from region_geog where id = region_id;
	ELSE
		---schowanie msc takich jak walidrogi
		select into result.miejscowosc nazwa from region_geog where id = (select id_parent from region_geog where id = region_id);
	END IF;
	select into result.id_powiat id_otodom from region_geog where id = powiat_id;
	select into result.id_wojewodztwo id_otodom from region_geog where id = wojewodztwo_id;
		
	select into rec_oferta oferta.id as id_oferta, nieruchomosc.id_agent, oferta.id_rodz_trans as id_trans_rodzaj, nieruchomosc.id_nier_rodzaj, nieruchomosc.id_rodz_nier_szcz, 
	nieruchomosc.id_region_geog as id_miejscowosc, nieruchomosc.ulica_net as ulica, oferta.cena::float, nieruchomosc.rynek_pierw, kategoria_allegro.kategoria_allegro as id_kategoria, 
	transakcja_nier.typ_of_otodom as rodzaj_oferta from oferta 
	join nieruchomosc on oferta.id_nieruchomosc = nieruchomosc.id 
	join kategoria_allegro on nieruchomosc.id_nier_rodzaj = kategoria_allegro.id_nier_rodzaj 
	join transakcja_nier on nieruchomosc.id_nier_rodzaj = transakcja_nier.id_nier_rodzaj 
	where oferta.id = oferta_id and transakcja_nier.id_trans_rodzaj = oferta.id_rodz_trans and kategoria_allegro.id_trans_rodzaj = oferta.id_rodz_trans and kategoria_allegro.id_powiat = powiat_id;

	IF rec_oferta.id_oferta is null THEN
		RETURN;
	END IF;
	
	---rodzaj budynku
	select into result.rodzaj_nieruchomosc nazwa from rodz_nier_szczeg where id = rec_oferta.id_rodz_nier_szcz;

	result.ulica := rec_oferta.ulica;
	result.cena := rec_oferta.cena;
	result.rynek_pierw := rec_oferta.rynek_pierw;
	result.id_kategoria := rec_oferta.id_kategoria;
	result.rodzaj_oferta := rec_oferta.rodzaj_oferta;

	select into result.opis wartosc from opis where id_oferta = oferta_id and id_jezyk = jezyk_id;

	---okreslenie stanu prawnego jesli nieruchomosc ma taka opcje dla tej transakcji, tu bedzie trzeba to sprzegnac chyba juz w php z otodomowskim slownikiem
	select into test wyposazenie_nier.id from wyposazenie_nier join lista_param_slow_nier on wyposazenie_nier.id = lista_param_slow_nier.id_wyposazenie_nier 
	where wyposazenie_nier.nazwa = tag_stan_prawny and lista_param_slow_nier.id_nier_rodzaj = rec_oferta.id_nier_rodzaj and lista_param_slow_nier.id_trans_rodzaj = rec_oferta.id_trans_rodzaj;
	IF test is not null THEN
		select into result.stan_prawny wyposazenie_nier.nazwa from wyposazenie_nier join dane_slow_wyp_nier on wyposazenie_nier.id = dane_slow_wyp_nier.id_wyposazenie_nier 
		where dane_slow_wyp_nier.id_nieruchomosc = nieruchomosc_id and wyposazenie_nier.id_parent = test;
	END IF;

	---wpakowanie wszyskich mediow i nie tylko
	licznik := 1;
	FOR temp in select wyposazenie_nier.id_parent, wyposazenie_nier.id, wyposazenie_nier.nazwa from wyposazenie_nier 
	join dane_slow_wyp_nier on dane_slow_wyp_nier.id_wyposazenie_nier = wyposazenie_nier.id where wyposazenie_nier.id_sekcja = (select id from sekcja where nazwa = '_media') 
	and dane_slow_wyp_nier.id_nieruchomosc = nieruchomosc_id LOOP
		IF temp.id_parent is null THEN
			result.dodatki[licznik] := temp.nazwa;
		ELSE
			select into sciezka nazwa from wyposazenie_nier where id = temp.id_parent;
			result.dodatki[licznik] := sciezka;
		END IF;
		licznik := licznik + 1;
	END LOOP;
	---okolica
	FOR temp in select wyposazenie_nier.id_parent, wyposazenie_nier.id, wyposazenie_nier.nazwa from wyposazenie_nier 
	join dane_slow_wyp_nier on dane_slow_wyp_nier.id_wyposazenie_nier = wyposazenie_nier.id where wyposazenie_nier.id_sekcja = (select id from sekcja where nazwa = '_okolica') 
	and dane_slow_wyp_nier.id_nieruchomosc = nieruchomosc_id LOOP
		IF temp.id_parent is null THEN
			result.dodatki[licznik] := temp.nazwa;
		ELSE
			select into sciezka nazwa from wyposazenie_nier where id = temp.id_parent;
			result.dodatki[licznik] := sciezka;
		END IF;
		licznik := licznik + 1;
	END LOOP;
	---
	FOR temp in select wyposazenie_nier.id_parent, wyposazenie_nier.id, wyposazenie_nier.nazwa from wyposazenie_nier 
	join dane_slow_wyp_nier on dane_slow_wyp_nier.id_wyposazenie_nier = wyposazenie_nier.id where wyposazenie_nier.id_sekcja = (select id from sekcja where nazwa = '_usytuowanie') 
	and dane_slow_wyp_nier.id_nieruchomosc = nieruchomosc_id LOOP
		--IF temp.id_parent is null THEN
			result.dodatki[licznik] := temp.nazwa;
		--ELSE
		--	select into sciezka nazwa from wyposazenie_nier where id = temp.id_parent;
		--	result.dodatki[licznik] := sciezka;
		--	licznik := licznik + 1;
		--	result.dodatki[licznik] := temp.nazwa;
		--END IF;
		licznik := licznik + 1;
	END LOOP;
	---koniec mediow

	---okreslenie pozostalych parametrow jesli sa dostepne dla nieruchomosci i transakcji : tag_powierzchnia
	select into test parametr_nier.id from parametr_nier join lista_param_nier on parametr_nier.id = lista_param_nier.id_parametr_nier 
	where parametr_nier.nazwa = tag_powierzchnia and lista_param_nier.id_nier_rodzaj = rec_oferta.id_nier_rodzaj and lista_param_nier.id_trans_rodzaj = rec_oferta.id_trans_rodzaj;
	IF test is not null THEN
		select into result.powierzchnia wartosc::float from dane_txt_nier where id_nieruchomosc = nieruchomosc_id and id_parametr_nier = test;
	END IF;

	---to zostalo lepiej rozwiazane w domiporcie itd
	--tag_liczba_pokoi
	select into test parametr_nier.id from parametr_nier join lista_param_nier on parametr_nier.id = lista_param_nier.id_parametr_nier 
	where parametr_nier.nazwa = tag_liczba_pokoi and lista_param_nier.id_nier_rodzaj = rec_oferta.id_nier_rodzaj and lista_param_nier.id_trans_rodzaj = rec_oferta.id_trans_rodzaj;
	IF test is not null THEN
		select into result.liczba_pokoi wartosc::integer from dane_txt_nier where id_nieruchomosc = nieruchomosc_id and id_parametr_nier = test;
	END IF;

	---tag_liczba_pieter
	select into test parametr_nier.id from parametr_nier join lista_param_nier on parametr_nier.id = lista_param_nier.id_parametr_nier 
	where parametr_nier.nazwa = tag_liczba_pieter and lista_param_nier.id_nier_rodzaj = rec_oferta.id_nier_rodzaj and lista_param_nier.id_trans_rodzaj = rec_oferta.id_trans_rodzaj;
	IF test is not null THEN
		select into result.liczba_pieter wartosc::integer from dane_txt_nier where id_nieruchomosc = nieruchomosc_id and id_parametr_nier = test;
	END IF;

	---tag_numer_pietra
	select into test parametr_nier.id from parametr_nier join lista_param_nier on parametr_nier.id = lista_param_nier.id_parametr_nier 
	where parametr_nier.nazwa = tag_numer_pietra and lista_param_nier.id_nier_rodzaj = rec_oferta.id_nier_rodzaj and lista_param_nier.id_trans_rodzaj = rec_oferta.id_trans_rodzaj;
	IF test is not null THEN
		select into result.numer_pietra wartosc::integer from dane_txt_nier where id_nieruchomosc = nieruchomosc_id and id_parametr_nier = test;
	END IF;

	---tag_powierzchnia_dzialki
	select into test parametr_nier.id from parametr_nier join lista_param_nier on parametr_nier.id = lista_param_nier.id_parametr_nier 
	where parametr_nier.nazwa = tag_powierzchnia_dzialki and lista_param_nier.id_nier_rodzaj = rec_oferta.id_nier_rodzaj and lista_param_nier.id_trans_rodzaj = rec_oferta.id_trans_rodzaj;
	IF test is not null THEN
		select into result.powierzchnia_dzialki wartosc::float from dane_txt_nier where id_nieruchomosc = nieruchomosc_id and id_parametr_nier = test;
	END IF;

	---tag_rok
	select into test parametr_nier.id from parametr_nier join lista_param_nier on parametr_nier.id = lista_param_nier.id_parametr_nier 
	where parametr_nier.nazwa = tag_rok and lista_param_nier.id_nier_rodzaj = rec_oferta.id_nier_rodzaj and lista_param_nier.id_trans_rodzaj = rec_oferta.id_trans_rodzaj;
	IF test is not null THEN
		select into result.rok wartosc from dane_txt_nier where id_nieruchomosc = nieruchomosc_id and id_parametr_nier = test;
	END IF;

	---zdjecia
	--../media/'.$_SESSION[NieruchomoscDAL::$id_nieruchomosc].'/zdjecia/
	IF automat = true THEN
		sciezka := '/var/www/html/form/media/' || nieruchomosc_id || '/zdjecia/';
	ELSE
		sciezka := '../media/' || nieruchomosc_id || '/zdjecia/';
	END IF;
	licznik := 1;
	FOR temp in select nazwa from zdjecie where id_nieruchomosc = nieruchomosc_id LOOP
		result.zdjecie[licznik] := sciezka || temp.nazwa;
		licznik := licznik + 1;
	END LOOP;

	select into result.id_agent id_otodom from agent where id = rec_oferta.id_agent;

	result.id_oferta := oferta_id;

	RETURN NEXT result;
END;
$$ LANGUAGE plpgsql;


---dac tu podaj oferta domiporta, potem ofert.net
CREATE FUNCTION PodajOfertaDomiporta (oferta_id integer, automat boolean) RETURNS OfertaDomiporta AS $$
DECLARE
	result OfertaDomiporta;
	rec_of_otodom OfertaOtodom;
	rec_temp record;
	parent_region record;
BEGIN
	--pobrac z otodomu co sie da dla zaoszczedzenia rozpierduchy a potem meczyc flaka z reszta
	select into rec_of_otodom * from PodajOfertaOtodom(oferta_id, automat);
	select into rec_temp nier_rodzaj.nazwa as kategoria, oferta.id_nieruchomosc, oferta.cena, trans_rodzaj.nazwa as operacja, oferta.wylacznosc::integer as wylacznosc, nieruchomosc.id_region_geog, 
	nieruchomosc.id_agent from oferta 
	join nieruchomosc on oferta.id_nieruchomosc = nieruchomosc.id 
	join trans_rodzaj on oferta.id_rodz_trans = trans_rodzaj.id 
	join nier_rodzaj on nieruchomosc.id_nier_rodzaj = nier_rodzaj.id 
	where oferta.id = oferta_id;

	IF rec_temp.kategoria = '_teren' THEN
		rec_temp.kategoria := '_dzialka';
	END IF;

	select into result.kontakt agent.nazwa || ', tel. ' || agent.komorka || ', ' || agent.telefon || ', e-mail: ' || agent.email || '. Wiêcej ofert na www.azg.pl.' from agent where id = rec_temp.id_agent;

	select into parent_region id ,id_parent, nazwa, zaglebienie from region_geog where id = rec_temp.id_region_geog;
	---zejscie na poziom 4 jesli mamy do czynienia z dzielnica
	IF parent_region.zaglebienie = 5 THEN
		select into parent_region id ,id_parent, nazwa from region_geog where id = parent_region.id_parent;
	END IF;

	select into parent_region id ,id_parent, nazwa from region_geog where id = parent_region.id_parent;
	result.gmina := parent_region.nazwa;
	select into parent_region id ,id_parent, nazwa from region_geog where id = parent_region.id_parent;
	result.powiat := parent_region.nazwa;
	select into parent_region id ,id_parent, nazwa from region_geog where id = parent_region.id_parent;
	result.wojewodztwo := parent_region.nazwa;

	result.exclusive := rec_temp.wylacznosc;
	result.wartosc := rec_temp.cena;

	result.id := oferta_id;
	result.nr_oferty := oferta_id;
	result.operacja := rec_temp.operacja;
	result.kategoria := rec_temp.kategoria;
	result.miasto := rec_of_otodom.miejscowosc;
	result.dzielnica := rec_of_otodom.ulica;
	result.ulica := rec_of_otodom.ulica;
	result.lokalizacja := rec_of_otodom.ulica;

	result.forma_wlasnosci := rec_of_otodom.stan_prawny;
	result.powierzchnia := rec_of_otodom.powierzchnia;
	result.pow_dzial := rec_of_otodom.powierzchnia_dzialki;
	result.pietro := rec_of_otodom.numer_pietra;
	result.ile_pieter := rec_of_otodom.liczba_pieter;
	result.liczba_pokoi := rec_of_otodom.liczba_pokoi;
	result.rok := rec_of_otodom.rok;
	result.opis := rec_of_otodom.opis;
	result.cena_metra := result.wartosc / result.powierzchnia;

	result.zdjecia := rec_of_otodom.zdjecie;

	---pobieranie poszczegolnych info typu parametrycznego jesli sa do pol
	select into result.liczba_kondygnacji ParametryOfertyExport(rec_temp.id_nieruchomosc, '_liczba_kondygnacji')::integer;
	select into result.liczba_lazienek ParametryOfertyExport(rec_temp.id_nieruchomosc, '_liczba_lazienek')::integer;
	select into result.pow_miesz ParametryOfertyExport(rec_temp.id_nieruchomosc, '_powierzchnia_uzytkowa')::float;
	select into result.powierzchnia_zabudowy ParametryOfertyExport(rec_temp.id_nieruchomosc, '_powierzchnia_zabudowy')::float;
	select into result.wysokosc_czynszu ParametryOfertyExport(rec_temp.id_nieruchomosc, '_wysokosc_czynszu')::float;
	---koniec pobierania poszczegolnych informacji do pol

	---pobieranie info o wyposazeniach szczegolowych
	select into result.nawierzchnia_drogi WyposazeniePodajSzczeg(rec_temp.id_nieruchomosc, '_nawierzchnia');
	select into result.okna_strony_swiata WyposazeniePodajSzczeg(rec_temp.id_nieruchomosc, '_wystawka_okien');
	select into result.stan_techniczny WyposazeniePodajSzczeg(rec_temp.id_nieruchomosc, '_stan');
	select into result.material WyposazeniePodajSzczeg(rec_temp.id_nieruchomosc, '_material_budowlany');
	select into result.stan_lokalu WyposazeniePodajSzczeg(rec_temp.id_nieruchomosc, '_stan');
	select into result.standard WyposazeniePodajSzczeg(rec_temp.id_nieruchomosc, '_standard');
	select into result.technologia WyposazeniePodajSzczeg(rec_temp.id_nieruchomosc, '_technologia_budowlana');
	select into result.dach WyposazeniePodajSzczeg(rec_temp.id_nieruchomosc, '_dach');
	select into result.ogrzewanie WyposazeniePodajSzczeg(rec_temp.id_nieruchomosc, '_ogrzewanie');
	select into result.kanalizacja WyposazeniePodajSzczeg(rec_temp.id_nieruchomosc, '_kanalizacja');
	
	---koniec pobierania info o wyposazeniach szczegolowych

	---pobranie info o mediach tak - nie (slowniki jednopoziomowe bez dzieci)
	select into result.sila MediaTakNieOfertyExport(rec_temp.id_nieruchomosc, '_sila', 0)::integer;
	select into result.elektr MediaTakNieOfertyExport(rec_temp.id_nieruchomosc, '_prad', 0)::integer;
	select into result.gaz MediaTakNieOfertyExport(rec_temp.id_nieruchomosc, '_gaz', 1)::integer;
	select into result.telefon MediaTakNieOfertyExport(rec_temp.id_nieruchomosc, '_telefon', 0)::integer;
	select into result.tv_kablowa MediaTakNieOfertyExport(rec_temp.id_nieruchomosc, '_kablowa', 0)::integer;
	select into result.tv MediaTakNieOfertyExport(rec_temp.id_nieruchomosc, '_antena', 0)::integer;
	select into result.internet MediaTakNieOfertyExport(rec_temp.id_nieruchomosc, '_siec_internet', 0)::integer;
	select into result.klimatyzacja MediaTakNieOfertyExport(rec_temp.id_nieruchomosc, '_klimatyzacja', 0)::integer;
	select into result.winda MediaTakNieOfertyExport(rec_temp.id_nieruchomosc, '_winda', 0)::integer;
	select into result.domofon MediaTakNieOfertyExport(rec_temp.id_nieruchomosc, '_domofon', 0)::integer;
	select into result.zsyp MediaTakNieOfertyExport(rec_temp.id_nieruchomosc, '_zsyp', 0)::integer;
	select into result.ogrodek MediaTakNieOfertyExport(rec_temp.id_nieruchomosc, '_ogrodek', 0)::integer;
	---koniec poborow tak / nie

	RETURN result;
END;
$$ LANGUAGE plpgsql;

---to bedzie chodzic tylko automatem, dobowo - wysylka znaczysje :P - przerobic cala procedure zeby byla lzejsza
CREATE FUNCTION PodajOfertaOfertyNet (oferta_id integer) RETURNS OfertaOfNet AS $$
DECLARE
	result OfertaOfNet;
	rec_temp record;
	parent_region record;
	rec_agent record;
	temp record;
	rec_oferta record;
	akt_data date;
	region_dane record;
	region_id integer;
	gmina_id integer;
	powiat_id integer;
	wojewodztwo_id integer;
	nieruchomosc_id integer;
	jezyk_id integer;
	licznik integer;
	test integer;
	sciezka text;
	przes_data integer;
	pokaz_region_b boolean;
BEGIN
	select into jezyk_id id from jezyk where nazwa = 'Polski';
	---pobranie id nieruchomosci
	select into nieruchomosc_id id_nieruchomosc from oferta where id = oferta_id;
	---pobranie id regionu geograficznego oferty
	select into region_dane id_region_geog, region_geog.nazwa, region_geog.id_parent, region_geog.zaglebienie from nieruchomosc join region_geog on nieruchomosc.id_region_geog = region_geog.id 
	where nieruchomosc.id = nieruchomosc_id;

	IF region_dane.zaglebienie = 5 THEN
		result.dzielnica := region_dane.nazwa;
		select into region_id id_parent from region_geog where id = region_dane.id_region_geog;
		select into region_dane region_geog.nazwa, region_geog.id_parent, region_geog.zaglebienie from region_geog where id = region_dane.id_parent;
	ELSE
		region_id := region_dane.id_region_geog;
	END IF;
	
	select into pokaz_region_b pokaz from region_geog where id = region_id;
	IF pokaz_region_b = true THEN
		select into result.miasto nazwa from region_geog where id = region_id;
	ELSE
		---schowanie msc takich jak walidrogi
		select into result.miasto nazwa from region_geog where id = (select id_parent from region_geog where id = region_id);
	END IF;

	select into rec_temp nieruchomosc.id_nier_rodzaj, oferta.id_rodz_trans as id_trans_rodzaj, oferta.id_nieruchomosc, oferta.cena, nieruchomosc.id_region_geog, nieruchomosc.id_agent, nieruchomosc.ulica_net as lokalizacja
	from oferta join nieruchomosc on oferta.id_nieruchomosc = nieruchomosc.id where oferta.id = oferta_id;

	select into rec_agent agent.nazwa, agent.telefon, agent.komorka, agent.email from agent where id = rec_temp.id_agent;

	result.id_oferta := oferta_id;
	result.id_nier_rodzaj := rec_temp.id_nier_rodzaj;
	result.id_trans_rodzaj := rec_temp.id_trans_rodzaj;
	result.agent_nazwisko := rec_agent.nazwa;
	result.agent_email := rec_agent.email;
	result.agent_tel_biuro := rec_agent.telefon;
	result.agent_tel_kom := rec_agent.komorka;
	---agent pobrany
	
	select into region_dane id ,id_parent, nazwa from region_geog where id = region_dane.id_parent;
	--result.gmina := parent_region.nazwa;
	select into region_dane id ,id_parent, nazwa from region_geog where id = region_dane.id_parent;
	--result.powiat := parent_region.nazwa;
	select into region_dane id ,id_parent, nazwa from region_geog where id = region_dane.id_parent;
	result.wojewodztwo := region_dane.nazwa;

	result.cena := rec_temp.cena;
	---result.dzielnica := rec_of_otodom.ulica;
	result.ulica := rec_temp.lokalizacja;

	select into result.powierzchnia ParametryOfertyExport(rec_temp.id_nieruchomosc, '_powierzchnia_uzytkowa')::float;
	select into result.powierzchniadzialki ParametryOfertyExport(rec_temp.id_nieruchomosc, '_powierzchnia_dzialki')::float;
	select into result.liczbapokoi ParametryOfertyExport(rec_temp.id_nieruchomosc, '_liczba_pokoi')::integer;
	select into result.pietro ParametryOfertyExport(rec_temp.id_nieruchomosc, '_numer_pietra')::integer;
	select into result.liczbapieter ParametryOfertyExport(rec_temp.id_nieruchomosc, '_liczba_pieter')::integer;
	select into result.rokbudowy ParametryOfertyExport(rec_temp.id_nieruchomosc, '_rok_budowy')::integer;
	select into result.opis wartosc from opis where id_oferta = oferta_id and id_jezyk = jezyk_id;
	result.opis := result.opis || ' Wiêcej informacji o ofercie na stronie azg.pl';
	
	--IF automat = true THEN
		sciezka := '/var/www/html/form/media/' || nieruchomosc_id || '/zdjecia/';
	--ELSE
	--	sciezka := '../media/' || nieruchomosc_id || '/zdjecia/';
	--END IF;
	licznik := 1;
	FOR temp in select nazwa from zdjecie where id_nieruchomosc = nieruchomosc_id LOOP
		result.zdjecie[licznik] := sciezka || temp.nazwa;
		licznik := licznik + 1;
	END LOOP;
	--result.zdjecie := rec_of_otodom.zdjecie;

	---pobieranie info o wyposazeniach szczegolowych
	select into result.stanbudynku WyposazeniePodajSzczeg(rec_temp.id_nieruchomosc, '_stan');
	select into result.materialbudowy WyposazeniePodajSzczeg(rec_temp.id_nieruchomosc, '_material_budowlany');
	select into result.ogrzewanie WyposazeniePodajSzczeg(rec_temp.id_nieruchomosc, '_ogrzewanie');
	select into result.gaz WyposazeniePodajSzczeg(rec_temp.id_nieruchomosc, '_gaz');
	
	---select into result.kanalizacja WyposazeniePodajSzczeg(rec_temp.id_nieruchomosc, '_kanalizacja');
	
	---koniec pobierania info o wyposazeniach szczegolowych

	---pobranie info o mediach tak - nie (slowniki jednopoziomowe bez dzieci)
	select into result.klimatyzacja MediaTakNieOfertyExport(rec_temp.id_nieruchomosc, '_klimatyzacja', 0)::integer;	
	select into result.liczbatelefonow MediaTakNieOfertyExport(rec_temp.id_nieruchomosc, '_telefon', 0)::integer;
	select into result.winda MediaTakNieOfertyExport(rec_temp.id_nieruchomosc, '_winda', 0)::boolean;

	---koniec poborow tak / nie

	RETURN result;
END;
$$ LANGUAGE plpgsql;

---pobranie danych do OfertaGazetaDom
CREATE FUNCTION PodajOfertaGazetaDom (oferta_id integer) RETURNS OfertaGazetaDom AS $$
DECLARE
	jezyk_id integer;
	nieruchomosc_id integer;
	region_dane record;
	rec_temp record;
	rec_agent record;
	sciezka text;
	temp record;
	licznik integer;
	result OfertaGazetaDom;
BEGIN
	select into jezyk_id id from jezyk where nazwa = 'Polski';
	---pobranie id nieruchomosci
	select into nieruchomosc_id id_nieruchomosc from oferta where id = oferta_id;
	---pobranie id regionu geograficznego oferty
	select into region_dane id_region_geog, region_geog.nazwa, region_geog.id_parent, region_geog.zaglebienie from nieruchomosc join region_geog on nieruchomosc.id_region_geog = region_geog.id 
	where nieruchomosc.id = nieruchomosc_id;
	
	--podskoczenie do gminy
	IF region_dane.zaglebienie = 4 THEN
		--select into region_id id_parent from region_geog where id = region_dane.id_region_geog;
		select into region_dane region_geog.nazwa, region_geog.id_parent, region_geog.zaglebienie from region_geog where id = region_dane.id_parent;
		result.dzielnica_gmina := region_dane.nazwa;
		select into region_dane id ,id_parent, nazwa from region_geog where id = region_dane.id_parent;
		result.miasto_powiat := region_dane.nazwa;
		select into region_dane id ,id_parent, nazwa from region_geog where id = region_dane.id_parent;
		result.wojewodztwo := region_dane.nazwa;
	ELSE
		--region_id := region_dane.id_region_geog;
		result.dzielnica_gmina := region_dane.nazwa;
		---4 poziom - miasto
		select into region_dane region_geog.nazwa, region_geog.id_parent, region_geog.zaglebienie from region_geog where id = region_dane.id_parent;
		result.miasto_powiat := region_dane.nazwa;
		--gmina
		select into region_dane region_geog.nazwa, region_geog.id_parent, region_geog.zaglebienie from region_geog where id = region_dane.id_parent;
		--powiat
		select into region_dane region_geog.nazwa, region_geog.id_parent, region_geog.zaglebienie from region_geog where id = region_dane.id_parent;
		--woj
		select into region_dane region_geog.nazwa, region_geog.id_parent, region_geog.zaglebienie from region_geog where id = region_dane.id_parent;
		result.wojewodztwo := region_dane.nazwa;
	END IF;
	select into rec_temp nieruchomosc.id_nier_rodzaj, oferta.id_rodz_trans as id_trans_rodzaj, oferta.id_nieruchomosc, oferta.cena, nieruchomosc.id_region_geog, nieruchomosc.id_agent, 
	nieruchomosc.ulica_net as lokalizacja from oferta join nieruchomosc on oferta.id_nieruchomosc = nieruchomosc.id where oferta.id = oferta_id;

	select into rec_agent agent.nazwa, agent.telefon, agent.komorka, agent.email from agent where id = rec_temp.id_agent;

	result.klucz := oferta_id;
	result.id_oferta := oferta_id;
	result.id_nier_rodzaj := rec_temp.id_nier_rodzaj;
	result.id_trans_rodzaj := rec_temp.id_trans_rodzaj;
	result.agencja_kontakt := rec_agent.nazwa;
	result.agencja_email := rec_agent.email;
	result.agencja_telefon1 := rec_agent.telefon;
	result.agencja_telefon2 := rec_agent.komorka;
	
	result.cena := rec_temp.cena::float;
	---result.dzielnica := rec_of_otodom.ulica;
	result.adres := rec_temp.lokalizacja;

	sciezka := '/var/www/html/form/media/' || nieruchomosc_id || '/zdjecia/';

	licznik := 1;
	FOR temp in select nazwa from zdjecie where id_nieruchomosc = nieruchomosc_id limit 10 LOOP --10 zdjec sobie zycza tam
		result.zdjecie[licznik] := sciezka || temp.nazwa;
		licznik := licznik + 1;
	END LOOP;

	select into result.komentarz wartosc from opis where id_oferta = oferta_id and id_jezyk = jezyk_id;
	result.komentarz := result.komentarz || ' Wiêcej informacji o ofercie na stronie www.azg.pl';
	
	select into result.ilosc_pieter ParametryOfertyExport(rec_temp.id_nieruchomosc, '_liczba_pieter')::integer;
	select into result.pietro ParametryOfertyExport(rec_temp.id_nieruchomosc, '_numer_pietra')::integer;
	select into result.ilosc_pok ParametryOfertyExport(rec_temp.id_nieruchomosc, '_liczba_pokoi')::integer;
	select into result.powierzchnia ParametryOfertyExport(rec_temp.id_nieruchomosc, '_powierzchnia_uzytkowa')::float;
	select into result.rok_bud ParametryOfertyExport(rec_temp.id_nieruchomosc, '_rok_budowy');
	select into result.pow_ogrodu ParametryOfertyExport(rec_temp.id_nieruchomosc, '_powierzchnia_ogrodu')::float;

	result.rok_bud := '01/01/' || result.rok_bud;
	result.cena_m2 := (result.cena / result.powierzchnia)::integer;

	---select into result.material WyposazeniePodajSzczeg(rec_temp.id_nieruchomosc, '_material_budowlany');
	select into result.stan WyposazeniePodajSzczeg(rec_temp.id_nieruchomosc, '_stan');
	select into result.droga WyposazeniePodajSzczeg(rec_temp.id_nieruchomosc, '_nawierzchnia_drogi');

	RETURN result;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION PodajOfertaKrn (oferta_id integer) RETURNS OfertaKrn AS $$
DECLARE
	jezyk_id integer;
	nieruchomosc_id integer;
	region_dane record;
	rec_temp record;
	rec_agent record;
	sciezka text;
	temp record;
	licznik integer;
	result OfertaKrn;
BEGIN
	select into jezyk_id id from jezyk where nazwa = 'Polski';
	---pobranie id nieruchomosci
	select into nieruchomosc_id id_nieruchomosc from oferta where id = oferta_id;
	---pobranie id regionu geograficznego oferty
	select into region_dane id_region_geog, region_geog.nazwa, region_geog.id_parent, region_geog.zaglebienie from nieruchomosc join region_geog on nieruchomosc.id_region_geog = region_geog.id 
	where nieruchomosc.id = nieruchomosc_id;
	
	--podskoczenie do gminy
	IF region_dane.zaglebienie = 4 THEN
		--select into region_id id_parent from region_geog where id = region_dane.id_region_geog;
		select into region_dane region_geog.nazwa, region_geog.id_parent, region_geog.zaglebienie from region_geog where id = region_dane.id_parent;
		result.miejscowosc := region_dane.nazwa;
		--result.dzielnica_gmina := region_dane.nazwa;
		select into region_dane id, id_parent, nazwa from region_geog where id = region_dane.id_parent;
		--result.miasto_powiat := region_dane.nazwa;
		select into region_dane id ,id_parent, id_otodom, nazwa from region_geog where id = region_dane.id_parent;
		result.id_wojewodztwo := region_dane.id_otodom;
	ELSE
		--region_id := region_dane.id_region_geog;
		--result.dzielnica_gmina := region_dane.nazwa;
		---4 poziom - miasto
		select into region_dane region_geog.nazwa, region_geog.id_parent, region_geog.zaglebienie from region_geog where id = region_dane.id_parent;
		--gmina
		select into region_dane region_geog.nazwa, region_geog.id_parent, region_geog.zaglebienie from region_geog where id = region_dane.id_parent;
		result.miejscowosc := region_dane.nazwa;
		--powiat
		select into region_dane region_geog.nazwa, region_geog.id_parent, region_geog.zaglebienie from region_geog where id = region_dane.id_parent;
		--woj
		select into region_dane region_geog.nazwa, id_otodom, region_geog.id, region_geog.id_parent, region_geog.zaglebienie from region_geog where id = region_dane.id_parent;
		result.id_wojewodztwo := region_dane.id_otodom;
	END IF;
	select into rec_temp nieruchomosc.id_nier_rodzaj, oferta.id_rodz_trans as id_trans_rodzaj, oferta.id_nieruchomosc, oferta.cena, nieruchomosc.id_region_geog, nieruchomosc.id_agent, 
	nieruchomosc.ulica_net as lokalizacja from oferta join nieruchomosc on oferta.id_nieruchomosc = nieruchomosc.id where oferta.id = oferta_id;

	--select into rec_agent agent.nazwa, agent.telefon, agent.komorka, agent.email from agent where id = rec_temp.id_agent;

	result.klucz := oferta_id;
	result.nr_oferty := oferta_id;
	result.id_nier_rodzaj := rec_temp.id_nier_rodzaj;
	result.id_trans_rodzaj := rec_temp.id_trans_rodzaj;	
	result.cena := rec_temp.cena::float;
	result.ulica := rec_temp.lokalizacja;

	sciezka := '/var/www/html/form/media/' || nieruchomosc_id || '/zdjecia/';

	licznik := 1;
	FOR temp in select nazwa from zdjecie where id_nieruchomosc = nieruchomosc_id limit 10 LOOP --10 zdjec sobie zycza tam
		result.zdjecie[licznik] := sciezka || temp.nazwa;
		licznik := licznik + 1;
	END LOOP;

	select into result.opis wartosc from opis where id_oferta = oferta_id and id_jezyk = jezyk_id;
	result.opis := result.opis || ' Wiêcej informacji o ofercie na stronie www.azg.pl';
	
	select into result.liczba_pieter ParametryOfertyExport(rec_temp.id_nieruchomosc, '_liczba_pieter')::integer;
	select into result.ktore_pietro ParametryOfertyExport(rec_temp.id_nieruchomosc, '_numer_pietra')::integer;
	select into result.liczba_pokoi ParametryOfertyExport(rec_temp.id_nieruchomosc, '_liczba_pokoi')::integer;
	select into result.powierzchnia ParametryOfertyExport(rec_temp.id_nieruchomosc, '_powierzchnia_uzytkowa')::float;
	select into result.powierzchnia_dzialki ParametryOfertyExport(rec_temp.id_nieruchomosc, '_powierzchnia_dzialki')::float;
	select into result.rok_budowy ParametryOfertyExport(rec_temp.id_nieruchomosc, '_rok_budowy');

	---select into result.material WyposazeniePodajSzczeg(rec_temp.id_nieruchomosc, '_material_budowlany');
	select into result.stan_techniczny WyposazeniePodajSzczeg(rec_temp.id_nieruchomosc, '_stan');
	select into result.forma_wlasnosci WyposazeniePodajSzczeg(rec_temp.id_nieruchomosc, '_stan_prawny');
	select into result.ogrzewanie WyposazeniePodajSzczeg(rec_temp.id_nieruchomosc, '_miejskie');

	RETURN result;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION PodajOfertaGratka (oferta_id integer) RETURNS OfertaGratka AS $$
DECLARE
	jezyk_id integer;
	nieruchomosc_id integer;
	region_dane record;
	rec_temp record;
	rec_agent record;
	sciezka text;
	temp record;
	licznik integer;
	result OfertaGratka;
BEGIN
	select into jezyk_id id from jezyk where nazwa = 'Polski';
	---pobranie id nieruchomosci
	select into nieruchomosc_id id_nieruchomosc from oferta where id = oferta_id;
	---pobranie id regionu geograficznego oferty
	select into region_dane id_region_geog, region_geog.nazwa, region_geog.id_parent, region_geog.zaglebienie from nieruchomosc join region_geog on nieruchomosc.id_region_geog = region_geog.id 
	where nieruchomosc.id = nieruchomosc_id;
	
	--podskoczenie do gminy
	IF region_dane.zaglebienie = 4 THEN
		--select into region_id id_parent from region_geog where id = region_dane.id_region_geog;
		select into region_dane region_geog.nazwa, region_geog.id_parent, region_geog.zaglebienie from region_geog where id = region_dane.id_parent;
		result.miejscowosc := region_dane.nazwa;
		--result.dzielnica_gmina := region_dane.nazwa;
		select into region_dane id, id_parent, nazwa from region_geog where id = region_dane.id_parent;
		--result.miasto_powiat := region_dane.nazwa;
		select into region_dane id ,id_parent, id_otodom, nazwa from region_geog where id = region_dane.id_parent;
		result.id_region := region_dane.id;
	ELSE
		--region_id := region_dane.id_region_geog;
		--result.dzielnica_gmina := region_dane.nazwa;
		---4 poziom - miasto
		select into region_dane region_geog.nazwa, region_geog.id_parent, region_geog.zaglebienie from region_geog where id = region_dane.id_parent;
		--gmina
		select into region_dane region_geog.nazwa, region_geog.id_parent, region_geog.zaglebienie from region_geog where id = region_dane.id_parent;
		result.miejscowosc := region_dane.nazwa;
		--powiat
		select into region_dane region_geog.nazwa, region_geog.id_parent, region_geog.zaglebienie from region_geog where id = region_dane.id_parent;
		--woj
		select into region_dane region_geog.nazwa, id_otodom, region_geog.id, region_geog.id_parent, region_geog.zaglebienie from region_geog where id = region_dane.id_parent;
		result.id_region := region_dane.id;
	END IF;
	select into rec_temp nieruchomosc.id_nier_rodzaj, oferta.id_rodz_trans as id_trans_rodzaj, oferta.id_nieruchomosc, oferta.cena, nieruchomosc.id_region_geog, nieruchomosc.id_agent, 
	nieruchomosc.ulica_net as lokalizacja, nieruchomosc.id_rodz_nier_szcz, oferta.wylacznosc from oferta join nieruchomosc on oferta.id_nieruchomosc = nieruchomosc.id where oferta.id = oferta_id;

	select into rec_agent agent.nazwa, agent.telefon, agent.komorka, agent.email from agent where id = rec_temp.id_agent;

	result.numer_oferty := oferta_id;
	result.id_oferta := oferta_id;
	result.id_nier_rodzaj := rec_temp.id_nier_rodzaj;
	result.id_trans_rodzaj := rec_temp.id_trans_rodzaj;	
	result.cena := rec_temp.cena::float;
	result.cena_calkowita := rec_temp.cena::float;
	result.ulica := rec_temp.lokalizacja;
	result.dzielnica := rec_temp.lokalizacja;
	result.id_rodz_nier_szcz := rec_temp.id_rodz_nier_szcz;
	result.na_wylacznosc := rec_temp.wylacznosc::integer;

	result.kontakt_osoba := rec_agent.nazwa;
	result.kontakt_email := rec_agent.email;
	result.kontakt_telefon := rec_agent.komorka;

	sciezka := '/var/www/html/form/media/' || nieruchomosc_id || '/zdjecia/';

	licznik := 1;
	FOR temp in select nazwa from zdjecie where id_nieruchomosc = nieruchomosc_id limit 10 LOOP --10 zdjec sobie zycza tam
		result.zdjecie[licznik] := sciezka || temp.nazwa;
		licznik := licznik + 1;
	END LOOP;

	select into result.opis wartosc from opis where id_oferta = oferta_id and id_jezyk = jezyk_id;
	result.opis := result.opis || ' Wiêcej informacji o ofercie na stronie www.azg.pl';
	
	select into result.id_liczba_pieter ParametryOfertyExport(rec_temp.id_nieruchomosc, '_liczba_pieter')::integer;
	select into result.id_pietro ParametryOfertyExport(rec_temp.id_nieruchomosc, '_numer_pietra')::integer;
	select into result.id_liczba_pokoi ParametryOfertyExport(rec_temp.id_nieruchomosc, '_liczba_pokoi')::integer;
	select into result.powierzchnia ParametryOfertyExport(rec_temp.id_nieruchomosc, '_powierzchnia_uzytkowa')::float;
	select into result.powierzchnia_dzialki ParametryOfertyExport(rec_temp.id_nieruchomosc, '_powierzchnia_dzialki')::float;
	select into result.id_rok_budowy ParametryOfertyExport(rec_temp.id_nieruchomosc, '_rok_budowy');
	select into result.wysokosc_czynszu ParametryOfertyExport(rec_temp.id_nieruchomosc, '_wysokosc_czynszu')::float;

	---select into result.material WyposazeniePodajSzczeg(rec_temp.id_nieruchomosc, '_material_budowlany');
	select into result.id_forma_wlasnosci WyposazeniePodajIdSzczeg(rec_temp.id_nieruchomosc, '_stan_prawny');
	select into result.id_material WyposazeniePodajIdSzczeg(rec_temp.id_nieruchomosc, '_material_budowlany');
	select into result.id_stan_mieszkania WyposazeniePodajIdSzczeg(rec_temp.id_nieruchomosc, '_stan');
	select into result.id_okna WyposazeniePodajIdSzczeg(rec_temp.id_nieruchomosc, '_okna');
	select into result.id_ogrzewanie WyposazeniePodajIdSzczeg(rec_temp.id_nieruchomosc, '_ogrzewanie');

	select into result.id_telefon MediaTakNieOfertyExport(rec_temp.id_nieruchomosc, '_telefon', 0)::integer;
	select into result.id_internet MediaTakNieOfertyExport(rec_temp.id_nieruchomosc, '_internet', 0)::integer;

	RETURN result;
END;
$$ LANGUAGE plpgsql;


---metoda odnotowuje dodanie lub przesuniecie o 30 dni od daty wygasniecia - oferty dla otodom; rownoczenie
---dodac parametr zakomentowany
CREATE FUNCTION OgloszenieOtodom (oferta_id integer, insertion_id integer, okresy integer) RETURNS date AS $$ ---, wyg_data date
DECLARE
	test record;
	akt_data date;
	przes_data integer;
	portal_otodom_id integer;
BEGIN
	select into portal_otodom_id id from portal where nazwa = 'Otodom';
	przes_data := 30 * okresy;
	select into akt_data current_date;
	select into test portal_ins_id as id, data_wyg from portal_wys where id_oferta = oferta_id and id_portal = portal_otodom_id;
	IF test.id is not null THEN
		IF test.id != insertion_id THEN
			RETURN null;
		ELSE
			update portal_wys set data_wys = akt_data, data_wyg = (select test.data_wyg::date + przes_data), is_active = true where id_oferta = oferta_id and portal_ins_id = insertion_id;
			RETURN (select test.data_wyg::date + przes_data);
		END IF;
	ELSE
		insert into portal_wys (id_oferta, id_portal, portal_ins_id, data_wys, data_wyg, is_active) values (oferta_id, portal_otodom_id, insertion_id, akt_data, (select akt_data + przes_data), true);
		RETURN (select akt_data + przes_data);
	END IF;
END;
$$ LANGUAGE plpgsql;

---oferty dla domiporta - odnotowanie wys³ania oferty	--insertion_id nigdy nie bedzie ---jesli mam zgadywac to domiporta daje na 60 dni, te okresy moznaby sztywno zamienic na 60, dodatkowo dobre pytanie czy przy update 
---tej oferty i wysylce oni tez wydluzaja te okresy
-----domiporta oczekuje xml i go m³óci, wiec insertion id jest kompletnie niepotrzebne; gdyby zrobili soap to kto wie ...
CREATE FUNCTION OgloszenieDomiporta (oferta_id integer, insertion_id integer, okresy integer) RETURNS date AS $$
DECLARE
	test record;
	akt_data date;
	przes_data integer;
	portal_domiporta_id integer;
BEGIN
	select into portal_domiporta_id id from portal where nazwa = 'Domiporta';
	przes_data := 30 * okresy; ---tu bedzie pewnie na sztywno 2, ale kto wie :P
	select into akt_data current_date;
	select into test id_oferta as id, data_wyg from portal_wys where id_oferta = oferta_id and id_portal = portal_domiporta_id;
	IF test.id is not null THEN
		update portal_wys set data_wys = akt_data, data_wyg = (select akt_data + przes_data), is_active = true where id_oferta = oferta_id and id_portal = portal_domiporta_id;
		RETURN (select test.data_wyg::date + przes_data);
	ELSE
		insert into portal_wys (id_oferta, id_portal, portal_ins_id, data_wys, data_wyg, is_active) values (oferta_id, portal_domiporta_id, insertion_id, akt_data, (select akt_data + przes_data), true);
		RETURN (select akt_data + przes_data);
	END IF;
END;
$$ LANGUAGE plpgsql;

---waznosc ofert na oferty.net jest bezterminowa, wiec data konca nie musi istniec i nie bedzie interpretowana w tym przypadku
---w zwiazku z powyzszym tylko nowosci i zmiany cen beda publikowane ponownie --- 10 10 2008 - ta procedura chyba nie uzywana bo te dane nie sa brane pod uwage przy eksportach
CREATE FUNCTION OgloszenieOfertyNet (oferta_id integer) RETURNS date AS $$
DECLARE
	test record;
	akt_data date;
	portal_ofertynet_id integer;
BEGIN
	select into portal_ofertynet_id id from portal where nazwa = 'Oferty.NET';
	select into akt_data current_date;
	select into test id_oferta as id, data_wyg from portal_wys where id_oferta = oferta_id and id_portal = portal_ofertynet_id;
	IF test.id is not null THEN
		update portal_wys set data_wys = akt_data, is_active = true where id_oferta = oferta_id and id_portal = portal_ofertynet_id;
		RETURN null;
	ELSE
		---poniewaz oferty na oferty.net sie same prolonguja, zeby wszystko wesolo dzialalo zbornie razem wspolnie - konkretnie deaktywacje nieaktualnych - wrzucam wysoka date, 
		---zeby metoda podajofertydodeaktywacji zadzialala rowniez dla ofert.net
		insert into portal_wys (id_oferta, id_portal, portal_ins_id, data_wys, data_wyg, is_active) values (oferta_id, portal_ofertynet_id, insertion_id, akt_data, '2100-12-31', true);
		RETURN null;
	END IF;
END;
$$ LANGUAGE plpgsql;

---ogloszenie gratka

---deaktywacje ofert powinny wystepowac dla wszystkich portali hurtem
---zrobione dla wszystkich portali - wyciac stad oferty.net
CREATE FUNCTION AktDeaktOferta (oferta_id integer, akt boolean) RETURNS boolean AS $$
DECLARE
	--portal_otodom_id integer;
BEGIN
	--select into portal_otodom_id id from portal where nazwa = 'Otodom';
	update portal_wys set is_active = akt where id_oferta = oferta_id; --- and id_portal != portal_ofertynet_id;
	IF found THEN
		RETURN true;
	ELSE
		RETURN false;
	END IF;
END;
$$ LANGUAGE plpgsql;

---zwraca null jesli oferta w serwisie otodom nie widnieje, cyfre 0 jesli widnieje i jest jeszcze aktualna (datowo), n > 0 jesli oferta wymaga przesuniecia o n jesdnostek, gdzie 1 jedn - 30 dni
---to nie musi byc ze w otodom - to zadziala dla wszystkich portali
CREATE FUNCTION SprawdzAktOfwPortalu (oferta_id integer, portal_nazwa text) RETURNS integer AS $$
DECLARE
	test record;
	akt_data date;
	il_dni float;
	przes_data float;
	portal_id integer;
BEGIN
	select into portal_id id from portal where nazwa = portal_nazwa;
	przes_data := 30;
	select into akt_data current_date + 5;
	select into test * from portal_wys where id_oferta = oferta_id and id_portal = portal_id;
	IF test.id is not null THEN
		IF test.data_wyg <= akt_data THEN --jesli data wygasniecia jest za 5 dni lub sukcesywnie wczesniej
			select into il_dni akt_data - test.data_wyg;
			---zwracamy ilosc jednostek, o jaka ma zostac przesunieta oferta - jesli ilosc dni roznicy jest wieksza niz 30 to oferta od 30 dni jest nieaktualna, wiec trzeba ja 
			---pchnac o 2 miesiace zeby jeszcze miesiac byla aktualna
			return ceil(il_dni / przes_data);
		ELSE
			IF test.is_active = true THEN
				---oferta jest aktualna, nie ma co jej aktualizowac
				RETURN 0;
			ELSE
				---oferta jest nieaktywna - to sie pewnie nie powinno zdarzyc ?? :P
				RETURN -1;
			END IF;
		END IF;
	ELSE
		return null;---oferty nie ma w portalu, publikowac
	END IF;
END;
$$ LANGUAGE plpgsql;

---customowe pod otodom
CREATE FUNCTION PodajInsOtodomIdPoOfId (oferta_id integer) RETURNS integer AS $$
DECLARE
	test integer;
	portal_otodom_id integer;
BEGIN
	select into portal_otodom_id id from portal where nazwa = 'Otodom';
	select into test portal_ins_id from portal_wys where id_oferta = oferta_id and id_portal = portal_otodom_id;
	return test;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION PodajOfIdPoInsOtodom (otodom_id integer) RETURNS integer AS $$
DECLARE
	test integer;
	portal_otodom_id integer;
BEGIN
	select into portal_otodom_id id from portal where nazwa = 'Otodom';
	select into test id_oferta from portal_wys where portal_ins_id = otodom_id and id_portal = portal_otodom_id;
	return test;
END;
$$ LANGUAGE plpgsql;

---podaje oferty do automatu ponownie publikujacego oferty
---tu sa brane pod uwage jedynie oferty gasn¹ce; naleza³oby wzi¹c pod uwage rowniez zmiany cen, pomijajac fakt, ze wymuszenie ponownej publikacji po powaznych zmianach z panelu powinno byc mozliwe
---odnotowanie wysylki gdzies sie odbywa :P
---zmienic formu³e : wysylac z nowosci between current_date i - 2 oraz z nowosci  z - 60 :P, ... to samo z otodom ? (tam - 30)
CREATE FUNCTION PodajOfertyProlongata (portal_nazwa text) RETURNS SETOF integer AS $$
DECLARE
	rec_oferta record;
	akt_data date;
	portal_id integer;
BEGIN
	select into portal_id id from portal where nazwa = portal_nazwa;
	select into akt_data current_date;
	FOR rec_oferta IN select id_oferta from portal_wys join oferta on portal_wys.id_oferta = oferta.id where (portal_wys.data_wyg <= akt_data or portal_wys.is_active = false) and oferta.id_status in 
	(select id from status where nazwa = '_aktualna' or nazwa = '_umowiona') and portal_wys.id_portal = portal_id and oferta.pokaz = true LOOP
		RETURN NEXT rec_oferta.id_oferta;
	END LOOP;
	---select id from oferta where id_status = 1 and pokaz = true and id not in (select id_oferta from portal_wys where id_portal = 2)
	FOR rec_oferta in select id from oferta where id_status in (select id from status where nazwa = '_aktualna' or nazwa = '_umowiona') and pokaz = true and id not in 
	(select id_oferta from portal_wys where id_portal = portal_id) and oferta.id_rodz_trans = (select id from trans_rodzaj where nazwa = '_sprzedaz') LOOP
		RETURN NEXT rec_oferta.id;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

---podaje automatowi oferty do zdjêcia z portalu
CREATE FUNCTION PodajOfertyDeaktywacja (portal_nazwa text) RETURNS SETOF integer AS $$
DECLARE
	rec_oferta record;
	akt_data date;
	portal_id integer;
BEGIN
	select into portal_id id from portal where nazwa = portal_nazwa;
	select into akt_data current_date;
	FOR rec_oferta IN select id_oferta from portal_wys join oferta on portal_wys.id_oferta = oferta.id where portal_wys.data_wyg > akt_data and portal_wys.is_active = true and oferta.id_status in 
	(select id from status where nazwa = '_nieaktualna' or nazwa = '_zawieszona') and portal_wys.id_portal = portal_id LOOP
		RETURN NEXT rec_oferta.id_oferta;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

---dla oferty.net powyzsza metoda podaje za malo info, trzeba zrobic customowa - portal wys nic tu nie daje, zmienic
--w portal wys nie ma ofert net, podobnie bedzie chyba z gazetadom
CREATE FUNCTION PodajOfertyDeaktywacjaOfertyNet () RETURNS SETOF oferta_usun AS $$
DECLARE
	rec_oferta oferta_usun;
	akt_data date;
	--portal_id integer;
BEGIN
	--select into portal_id id from portal where nazwa = 'Oferty.NET';
	select into akt_data current_date - 1;
	FOR rec_oferta IN select id_oferta, nieruchomosc.id_nier_rodzaj, oferta.id_rodz_trans as id_trans_rodzaj from oferta join nieruchomosc on oferta.id_nieruchomosc = nieruchomosc.id 
	join zmiana_status on oferta.id = zmiana_status.id_oferta 
	where zmiana_status.id_status in (select id from status where nazwa = '_nieaktualna' or nazwa = '_zawieszona') and zmiana_status.data > akt_data and zmiana_status.id = 
	(select max(id) from zmiana_status where id_oferta = oferta.id) LOOP
		RETURN NEXT rec_oferta;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

---podawanie ofert pod prolongate lub deaktywacje zasadnioczo opiera sie na tym, ze oferta juz zostala raz opublikowana. w przypadku oferty.net problem polega na tym, ze dane oferty z dnia
---powinny byc najpierw zbierane do publikacji, wiec nalezaloby ten mechanizm polaczyc z mechanizmem prolongaty, zeby nie robic 2 rzeczy na raz niezaleznie
---poniewaz procedura, ktora zaraz zrobie :P dotyczaca ewidencji publikacji - ogloszenieotodom;domiporta;oferty.net radzi sobie z update jak i  z insert zlepienie tego mechanizmu jest mozliwe
---wstepna idea: pobieramy oferty nowe: z procedury od nowosci; dzieki temu oferty z dnia leca na oferty.net; nastepnie puszczamy prolongate, i ona podaje juz tylko reszte
---wlasciwie to mimo wszystko spadnie na kod php chyba ze zrobie w procedurze jakas czesc wspolna .... ;/

---utile dla procedur pobierania danych o ofertach do publikacji
---podaje wartosc kolejnych parametrow nieruchomosci
CREATE FUNCTION ParametryOfertyExport (nieruchomosc_id integer, nazwa_param text) RETURNS text AS $$
DECLARE
	param text;
BEGIN
	select into param dane_txt_nier.wartosc from dane_txt_nier join parametr_nier on dane_txt_nier.id_parametr_nier = parametr_nier.id 
	where dane_txt_nier.id_nieruchomosc = nieruchomosc_id and parametr_nier.nazwa = nazwa_param;
	return param;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION MediaTakNieOfertyExport(nieruchomosc_id integer, nazwa_wyp text, zaglebienie integer) RETURNS boolean AS $$
DECLARE
	test integer;
	wyp_id integer;
BEGIN
	IF zaglebienie = 0 THEN
		select into test wyposazenie_nier.id from wyposazenie_nier join dane_slow_wyp_nier on wyposazenie_nier.id = dane_slow_wyp_nier.id_wyposazenie_nier 
		where wyposazenie_nier.nazwa = nazwa_wyp and dane_slow_wyp_nier.id_nieruchomosc = nieruchomosc_id;
		IF test is null THEN
			return false;
		ELSE			
			return true;
		END IF;
	ELSE
		---dopisac jesli powstanie potrzeba :P, bedzie przy gazie :P
		select into wyp_id id from wyposazenie_nier where nazwa = nazwa_wyp;
		select into test wyposazenie_nier.id from wyposazenie_nier join dane_slow_wyp_nier on wyposazenie_nier.id = dane_slow_wyp_nier.id_wyposazenie_nier 
		where wyposazenie_nier.id_parent = wyp_id and dane_slow_wyp_nier.id_nieruchomosc = nieruchomosc_id;
		IF test is null THEN
			return false;
		ELSE
			return true;
		END IF;
	END IF;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION WyposazeniePodajSzczeg(nieruchomosc_id integer, nazwa_wyp text) RETURNS text AS $$
DECLARE
	wyp_id integer;
	result text;
BEGIN
	select into wyp_id id from wyposazenie_nier where nazwa = nazwa_wyp;
	select into result nazwa from wyposazenie_nier join dane_slow_wyp_nier on wyposazenie_nier.id = dane_slow_wyp_nier.id_wyposazenie_nier 
	where wyposazenie_nier.id_parent = wyp_id and dane_slow_wyp_nier.id_nieruchomosc = nieruchomosc_id;
	return result;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION WyposazeniePodajIdSzczeg(nieruchomosc_id integer, nazwa_wyp text) RETURNS integer AS $$
DECLARE
	wyp_id integer;
	result text;
BEGIN
	select into wyp_id id from wyposazenie_nier where nazwa = nazwa_wyp;
	select into result dane_slow_wyp_nier.id_wyposazenie_nier from wyposazenie_nier join dane_slow_wyp_nier on wyposazenie_nier.id = dane_slow_wyp_nier.id_wyposazenie_nier 
	where wyposazenie_nier.id_parent = wyp_id and dane_slow_wyp_nier.id_nieruchomosc = nieruchomosc_id;
	return result;
END;
$$ LANGUAGE plpgsql;

---troche to do dupy zrobione - te same oferty teoretycznie sa pobierane po 4 razy, jednak warto zachowac to rozgraniczone
CREATE FUNCTION PodajListaOfertPublikacjaOfertyNet () RETURNS SETOF OfertaOfNet AS $$
DECLARE
	---powinny byc pobierane tylko oferty nowe i zmiany cen, to opublikowac w oferty net odnotowac w bazie i zapomniec - oferty same sie prolonguja w tym serwisie
	result OfertaOfNet;
	oferta_id integer;
BEGIN
	FOR oferta_id in select id_oferta from OfertaNowosc where id_rodz_trans = (select id from trans_rodzaj where nazwa = '_sprzedaz') and data between (select current_date - 1) and (select current_date) order by data asc LOOP 
		select into result * from PodajOfertaOfertyNet (oferta_id);
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION PodajListaOfertPublikacjaKrn () RETURNS SETOF OfertaKrn AS $$
DECLARE
	---powinny byc pobierane tylko oferty nowe i zmiany cen, to opublikowac w oferty net odnotowac w bazie i zapomniec - oferty same sie prolonguja w tym serwisie
	result OfertaKrn;
	oferta_id integer;
BEGIN
	FOR oferta_id in select id_oferta from OfertaNowosc where id_rodz_trans = (select id from trans_rodzaj where nazwa = '_sprzedaz') and data between (select current_date - 2) and (select current_date) order by data asc LOOP 
		select into result * from PodajOfertaKrn (oferta_id);
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION PodajListaOfertPublikacjaGazetaDom () RETURNS SETOF OfertaGazetaDom AS $$
DECLARE
	result OfertaGazetaDom;
	oferta_id integer;
BEGIN
	FOR oferta_id in select id_oferta from OfertaNowosc where id_rodz_trans = (select id from trans_rodzaj where nazwa = '_sprzedaz') and data between (select current_date - 3) and (select current_date) order by data asc LOOP 
		select into result * from PodajOfertaGazetaDom(oferta_id);
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION PodajListaOfertPublikacjaGratka () RETURNS SETOF OfertaGratka AS $$
DECLARE
	---powinny byc pobierane tylko oferty nowe i zmiany cen, to opublikowac w oferty net odnotowac w bazie i zapomniec - oferty same sie prolonguja w tym serwisie
	result OfertaGratka;
	oferta_id integer;
BEGIN
	FOR oferta_id in select id_oferta from OfertaNowosc where id_rodz_trans = (select id from trans_rodzaj where nazwa = '_sprzedaz') and data between (select current_date - 6) and (select current_date) order by data asc LOOP 
		select into result * from PodajOfertaGratka (oferta_id);
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

--na potrzeby gazeta dom
CREATE FUNCTION PodajListaOfertAkt () RETURNS SETOF integer AS $$
DECLARE
	result integer;
BEGIN
	FOR result in select id from oferta where id_status in (select id from status where nazwa in ('_aktualna', '_umowiona', '_wstrzymana')) and pokaz = true order by id asc LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;


----proba parsowania zapytan dla elementow procedury - podawania ze stringa elementu do wyciagniecia z rekordu - nie da sie tak, sprawdzone na forum

--CREATE FUNCTION PodajOfertaDomiporta (oferta_id integer, automat boolean) RETURNS record AS $BODY$
--DECLARE
--	result OfertaDomiporta;
--	test text;
--	rec record;
--BEGIN
--	test := 'result';
--	----ROW nie uzyjemy :P
--	result := ROW(1,3,4,'dfs', null, 'miskowo');
--	---uzyjemy tego : parsujemy selecta  z pobranymi danymi tak, zeby go potem odpalic zeby dane siadly w typ; potrzeba by bylo tablicy ktora mowi na ktorym miejscu kolejny element jest
--	---OK - UPADEK
--	FOR rec in execute 'select 1;' LOOP
--		--result := rec;
--	END LOOP;
--	return rec;
--	--rec.operacja := 'fdsfgds';
--	--update result set operacja = 'fgs';
--	--result := rec;
--	--select into result.' || test || ' nazwa from status where id = 1;
--	--execute 'select into result.' || test || ' \'blebla\';';
--
--	--return result;
--END;
--$BODY$ LANGUAGE plpgsql VOLATILE;