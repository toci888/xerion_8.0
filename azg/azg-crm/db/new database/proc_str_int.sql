set client_encoding to latin2;

drop FUNCTION OfertyPodobne (integer);
drop FUNCTION OfertyNajczestsze ();
drop FUNCTION OfertaOdwiedziny (text, integer, text);
drop FUNCTION OfertyListaWskazanSubskrypcja ();
drop FUNCTION OfertyZlecenieSubskrypcja ();
drop FUNCTION OfertySubskrypcja ();
drop FUNCTION SprawdzSubskrypcja (integer, integer, text);
drop FUNCTION UsunSubskrypcja (integer, integer, text);
drop FUNCTION DodajSubskrypcja (integer, integer, float, float, text, integer);
drop FUNCTION FiltracjaPodstawoweWersjeOfert (integer, integer, float, float, text, integer, integer, integer, integer, text);
drop FUNCTION OfertyNowosci ();
drop FUNCTION OfertaWyswietl (integer);
drop FUNCTION PodajTransIdNierIdOfertaAkt (integer) ;
drop FUNCTION PodajTransIdNierIdOferta (integer);
drop FUNCTION PodajRodzajOferta (integer, integer);
drop FUNCTION OfertaOpisy (integer);
drop FUNCTION OfertaPomieszczenia (integer, integer);
drop FUNCTION OfertaInfoSekcje (integer, integer, integer);
drop FUNCTION OfertaPelnaWersja (integer, integer);
drop FUNCTION PodstawoweWersjeOfert (integer, integer);
drop FUNCTION PodstawowaWersjaOferta (integer, integer, integer);
drop FUNCTION PodstawoweParamWypos();
drop FUNCTION NazwaRegion (integer);
drop FUNCTION RodzajBudynek (integer);
drop FUNCTION PodajNierDlaTrans (integer);
drop FUNCTION WszystkieRodzajeTrans();

drop view OfertaNowosc;
drop view OfertaPelneDane;
drop view OfertaPodsDane;

drop type OfertaZlecenieSubskrypcja;
drop type OfertaSubskrypcja;
drop type OfertaRodzaj;
drop type OfertaRodzajId;
drop type oferta_pomieszczenia;
drop type oferta_sekcje;
drop type oferta_nowosc;
drop type oferty_wersja_pelna;
drop type oferty_wersja_pods;
drop type pods_param_wypos;
drop type transakcje;

create type transakcje as (
id integer,
nazwa text,
oferta boolean
);

create type pods_param_wypos as (
id_trans_rodzaj integer,
id_nier_rodzaj integer,
parametr integer[],
wyposazenie integer[]);

create type oferty_wersja_pods as (
id_trans_rodzaj integer,
id_nier_rodzaj integer,
id_rodz_nier_szcz integer,
id_oferta integer,
id_nieruchomosc integer,
id_region_geog integer,
id_region_filtr integer,
lokalizacja text,
---data date,
cena text,
cena_pop text,
wylacznosc boolean,
klucz boolean,
id_status integer,
status text,
zdjecie text,
ilosc_pokoi integer,
liczba_pokoi integer,
powierzchnia float,
parametr_nazwa text[],
parametr_wartosc text[],
wyposazenie text[]);

create type oferty_wersja_pelna as (
id_oferta integer,
id_nieruchomosc integer,
nieruchomosc_rodzaj text,
transakcja_rodzaj text,
status text,
id_agent integer,
email text,
telefon text,
komorka text,
lokalizacja text,
wojewodztwo text,
powiat text,
cena text,
cena_pop text,
czas_przekazania text,
rodzaj_budynek text,
rynek_pierw boolean,
wylacznosc boolean,
klucz boolean,
zdjecie text[],
film text[]);

create type oferta_nowosc as (
id_oferta integer,
id_nieruchomosc integer,
id_trans_rodzaj integer,
id_nier_rodzaj integer,
nieruchomosc_rodzaj text,
transakcja_rodzaj text,
lokalizacja text,
wylacznosc boolean,
zdjecie text);

create type oferta_sekcje as (
id_sekcja integer,
nazwa text,
parametry text[], ---notacja text : wartosc
wyposazenia text[] ---notacja text : text - rodzic dziecko lub rodzic : tak
);

create type oferta_pomieszczenia as (
id_pomieszczenie integer, --nr, czy pokoj, czy kuchnia
nazwa text, ---nazwa pomieszczenia
nr_pomieszczenie integer, ---nr porzadkowy
parametry text[], ---notacja text : wartosc
wyposazenia text[] ---notacja text : text - rodzic dziecko lub rodzic : tak
);

create type OfertaRodzaj as (
nieruchomosc_rodzaj text,
transakcja_rodzaj text
);

create type OfertaRodzajId as (
id_oferta integer,
id_nieruchomosc integer,
id_nier_rodzaj integer,
id_trans_rodzaj integer
);

create type OfertaSubskrypcja as (
id_oferta integer,
id_trans_rodzaj integer,
id_nier_rodzaj integer,
id_jezyk integer[],
email text[]
);

create type OfertaZlecenieSubskrypcja as (
id_oferta integer,
id_zapotrzebowanie integer,
id_trans_rodzaj integer,
id_nier_rodzaj integer,
email text
);

create or replace view OfertaPodsDane as 
	select oferta.id as id_oferta, oferta.id_rodz_trans as id_trans_rodzaj, oferta.id_status, oferta.data_otw_zlecenie, oferta.cena, oferta.wylacznosc, nieruchomosc.id_nier_rodzaj, 
	nieruchomosc.id_region_geog, nieruchomosc.ulica_net as lokalizacja, nieruchomosc.klucz, status.nazwa as status, nieruchomosc.id as id_nieruchomosc, nieruchomosc.id_rodz_nier_szcz 
	from oferta join nieruchomosc on oferta.id_nieruchomosc = nieruchomosc.id join status on oferta.id_status = status.id where oferta.pokaz = true;

create or replace view OfertaPelneDane as
	select oferta.id as id_oferta, oferta.cena, oferta.wylacznosc, nieruchomosc.id_region_geog, nieruchomosc.ulica_net as lokalizacja, status.nazwa as status, nieruchomosc.id as id_nieruchomosc, nieruchomosc.klucz,
	agent.id as id_agent, agent.telefon, agent.komorka, agent.email, nieruchomosc.id_rodz_nier_szcz, nier_rodzaj.nazwa as nieruchomosc_rodzaj, trans_rodzaj.nazwa as transakcja_rodzaj, czas_przekazania,
	przek_od_otwarcia, data_otw_zlecenie, nieruchomosc.rynek_pierw from oferta 
	join nieruchomosc on oferta.id_nieruchomosc = nieruchomosc.id 
	join status on oferta.id_status = status.id 
	join agent on nieruchomosc.id_agent = agent.id 
	join nier_rodzaj on nieruchomosc.id_nier_rodzaj = nier_rodzaj.id 
	join trans_rodzaj on oferta.id_rodz_trans = trans_rodzaj.id;
---	where oferta.pokaz = true;
---uzasadnienie dla wykomentowania: oferta pelne dane nie musi obostrzac czy oferta ma atrybut pokaz w sieci, bo te oferty nie pojawia sie w widoku podstawowym; widok pelny moze byc wzywany z panelu

create or replace view OfertaNowosc as
	select distinct oferta.id as id_oferta, cena1.data, nieruchomosc.id as id_nieruchomosc, nieruchomosc.ulica_net as lokalizacja, nieruchomosc.id_nier_rodzaj, 
	oferta.id_rodz_trans, nier_rodzaj.nazwa as nieruchomosc_rodzaj, trans_rodzaj.nazwa as transakcja_rodzaj, oferta.wylacznosc  
	from cena cena1
	join oferta on oferta.id = cena1.id_oferta 
	join nieruchomosc on oferta.id_nieruchomosc = nieruchomosc.id 
	join nier_rodzaj on nieruchomosc.id_nier_rodzaj = nier_rodzaj.id 
	join trans_rodzaj on oferta.id_rodz_trans = trans_rodzaj.id 
	where oferta.pokaz = true and cena1.id = (select max(id) from cena where id_oferta = cena1.id_oferta) and oferta.id_status in (select id from status where nazwa = '_aktualna' or nazwa = '_umowiona');

CREATE FUNCTION WszystkieRodzajeTrans () RETURNS SETOF transakcje AS $$
DECLARE
	result transakcje;
BEGIN
	FOR result in select id, nazwa, true from trans_rodzaj where nazwa != '_zamiana' LOOP
		RETURN NEXT result;
	END LOOP;
	FOR result in select id, nazwa_zap as nazwa, false from trans_rodzaj LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION PodajNierDlaTrans (trans_id integer) RETURNS SETOF slownik AS $$
DECLARE
	rec_trans slownik;
BEGIN
	
	FOR rec_trans IN SELECT transakcja_nier.id_nier_rodzaj as id, nier_rodzaj.nazwa as nazwa from nier_rodzaj join transakcja_nier on nier_rodzaj.id = transakcja_nier.id_nier_rodzaj where transakcja_nier.id_trans_rodzaj = trans_id LOOP
		RETURN NEXT rec_trans;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION RodzajBudynek (nier_szcz_id integer) RETURNS SETOF slownik AS $$
DECLARE
	rec_slownik slownik;
BEGIN
	FOR rec_slownik IN select id, nazwa from rodz_nier_szczeg where id = nier_szcz_id order by nazwa asc LOOP
		RETURN NEXT rec_slownik;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION NazwaRegion (region_id integer) RETURNS SETOF slownik AS $$
DECLARE
	rec_slownik slownik;
BEGIN
	FOR rec_slownik IN select id, nazwa from region_geog where id = region_id order by nazwa asc LOOP
		RETURN NEXT rec_slownik;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

---BEZPARAMETRYCZNE, IDEA JEST, ZEBY POBIERAC TO RAZ I BUDOWAC CACHE
CREATE FUNCTION PodstawoweParamWypos () RETURNS SETOF pods_param_wypos AS $$
DECLARE
	result pods_param_wypos;
	trans_nier_rec record;
	temp record;
	licznik integer;
BEGIN
	FOR trans_nier_rec IN select id_trans_rodzaj, id_nier_rodzaj from transakcja_nier LOOP
		licznik := 1;
		result.id_trans_rodzaj := trans_nier_rec.id_trans_rodzaj;
		result.id_nier_rodzaj := trans_nier_rec.id_nier_rodzaj;
		result.parametr := null;
		result.wyposazenie := null;
		---pobieramy parametry :)
		FOR temp in select id_parametr_nier from param_nier_strona where id_nier_rodzaj = trans_nier_rec.id_nier_rodzaj and id_trans_rodzaj = trans_nier_rec.id_trans_rodzaj LOOP
			result.parametr[licznik] := temp.id_parametr_nier;
			licznik := licznik + 1;
		END LOOP;
		licznik := 1;
		FOR temp in select id_wyposazenie_nier from wypos_nier_strona where id_nier_rodzaj = trans_nier_rec.id_nier_rodzaj and id_trans_rodzaj = trans_nier_rec.id_trans_rodzaj LOOP
			result.wyposazenie[licznik] := temp.id_wyposazenie_nier;
			licznik := licznik + 1;
		END LOOP;
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION PodstawoweWersjeOfert (nier_rodzaj_id integer, trans_rodzaj_id integer) RETURNS SETOF oferty_wersja_pods as $$
DECLARE
	result oferty_wersja_pods;
	dane_oferta OfertaPodsDane;
	podst_par_wyp pods_param_wypos;
	status_nieakt integer;
	pop_cena text;
	licznik integer;
	indexer integer;
	temp record;
	id_pokoje integer;
	rodzic text;
	test integer;
	rec_region record;
BEGIN
	select into status_nieakt id from status where nazwa = '_nieaktualna';
	select into id_pokoje id from parametr_nier where nazwa = '_liczba_pokoi';
	select into podst_par_wyp * from PodstawoweParamWypos() where id_nier_rodzaj = nier_rodzaj_id and id_trans_rodzaj = trans_rodzaj_id;
	FOR dane_oferta in select * from OfertaPodsDane where id_trans_rodzaj = trans_rodzaj_id and id_nier_rodzaj = nier_rodzaj_id and id_status != status_nieakt order by data_otw_zlecenie desc LOOP
		result.parametr_nazwa := null;
		result.parametr_wartosc := null;
		result.wyposazenie := null;
		
		result.id_trans_rodzaj := dane_oferta.id_trans_rodzaj;
		result.id_nier_rodzaj := dane_oferta.id_nier_rodzaj;
		result.id_rodz_nier_szcz := dane_oferta.id_rodz_nier_szcz;
		result.id_oferta := dane_oferta.id_oferta;
		result.id_nieruchomosc := dane_oferta.id_nieruchomosc;
		result.lokalizacja := dane_oferta.lokalizacja;
		result.klucz := dane_oferta.klucz;

		select into rec_region id, id_parent, zaglebienie, pokaz from region_geog where id = dane_oferta.id_region_geog;

		IF rec_region.zaglebienie = 5 THEN
			result.id_region_geog := rec_region.id_parent;
			result.id_region_filtr := rec_region.id;
		ELSE
			---wyciaganie rodzica rodzica czyli powiatu
			select into result.id_region_filtr id_parent from region_geog where id = rec_region.id_parent;
			IF rec_region.pokaz = false THEN
				result.id_region_geog := result.id_region_filtr;
				--select into result.id_region_geog id_parent from region_geog where id = rec_region.id_parent;
			ELSE
				result.id_region_geog := dane_oferta.id_region_geog;
			END IF;
		END IF;
		---result.data := dane_oferta.data;
		result.cena := dane_oferta.cena;
		result.wylacznosc := dane_oferta.wylacznosc;
		result.id_status := dane_oferta.id_status;
		result.status := dane_oferta.status;
	
		select into pop_cena cena.cena from cena where cena.cena != dane_oferta.cena and cena.id_oferta = dane_oferta.id_oferta order by cena.data desc limit 1;
		result.cena_pop := pop_cena;
		
		---pobranie zdjecia
		select into result.zdjecie nazwa from zdjecie where id = (select min(id) from zdjecie where id_nieruchomosc = dane_oferta.id_nieruchomosc);
		---sprawdzenie, czy rodzaj nier szcz nie jest nullem
		select into result.liczba_pokoi wartosc from dane_txt_nier where id_nieruchomosc = dane_oferta.id_nieruchomosc and id_parametr_nier = id_pokoje;

		IF nier_rodzaj_id = 2 THEN
			--nie ma rodzaju budynku, pobieramy pokoje, wg nich bedziemy agregowac
			select into result.ilosc_pokoi wartosc from dane_txt_nier where id_nieruchomosc = dane_oferta.id_nieruchomosc and id_parametr_nier = id_pokoje;
		END IF;

		licznik := 1;
		indexer := 1;
		---parametry podstawowe
		IF podst_par_wyp.parametr is not null THEN
			WHILE podst_par_wyp.parametr[licznik] is not null LOOP
				select into temp parametr_nier.nazwa, dane_txt_nier.wartosc from dane_txt_nier join parametr_nier on dane_txt_nier.id_parametr_nier = parametr_nier.id 
				where dane_txt_nier.id_nieruchomosc = dane_oferta.id_nieruchomosc and parametr_nier.id = podst_par_wyp.parametr[licznik];
				IF temp.nazwa is not null THEN
					result.parametr_nazwa[indexer] := temp.nazwa;
					result.parametr_wartosc[indexer] := temp.wartosc;
					indexer := indexer + 1;
					IF temp.nazwa = '_powierzchnia_uzytkowa' THEN
						result.powierzchnia := temp.wartosc::float;
					END IF;
				END IF;
				licznik := licznik + 1;
			END LOOP;
		END IF;
		licznik := 1;
		indexer := 1;
		---wyposazenia podstawowe
		IF podst_par_wyp.wyposazenie is not null THEN
			WHILE podst_par_wyp.wyposazenie[licznik] is not null LOOP
				select into rodzic nazwa from wyposazenie_nier where id = podst_par_wyp.wyposazenie[licznik];
				---sprawdzic czy element ma dzieci - jak ma robic select porownawczy na dzieci - jak ten ponizej, jesli nie ma dzieci robic select porownawczy bezposrednio
				select into test count(id) from wyposazenie_nier where id_parent = podst_par_wyp.wyposazenie[licznik];
				IF test > 0 THEN
					--element ma dzieci
					---jesli sie pokryje wprowadzic do rekordu i juz
					select into temp wyposazenie_nier.nazwa, dane_slow_wyp_nier.id_wyposazenie_nier from dane_slow_wyp_nier join wyposazenie_nier on 
					dane_slow_wyp_nier.id_wyposazenie_nier = wyposazenie_nier.id 
					where dane_slow_wyp_nier.id_nieruchomosc = dane_oferta.id_nieruchomosc and wyposazenie_nier.id in (select id from wyposazenie_nier where id_parent = podst_par_wyp.wyposazenie[licznik]);
					IF temp.nazwa is not null THEN
						result.wyposazenie[indexer] := rodzic || ' : ' || temp.nazwa;
					END IF;
				ELSE ---przetestowac zachowanie dla przykladnego elementu bezdzietnego
					--element bezdzietny :P
					select into temp dane_slow_wyp_nier.id_wyposazenie_nier from dane_slow_wyp_nier where dane_slow_wyp_nier.id_nieruchomosc = dane_oferta.id_nieruchomosc and 
					dane_slow_wyp_nier.id_wyposazenie_nier = podst_par_wyp.wyposazenie[licznik];
					IF temp.id_wyposazenie_nier is not null THEN
						result.wyposazenie[indexer] := rodzic;
					END IF;
				END IF;
				indexer := indexer + 1;
				licznik := licznik + 1;
			END LOOP;
		END IF;
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION PodstawowaWersjaOferta (oferta_id integer, nier_rodzaj_id integer, trans_rodzaj_id integer) RETURNS oferty_wersja_pods as $$
DECLARE
	result oferty_wersja_pods;
	dane_oferta OfertaPodsDane;
	podst_par_wyp pods_param_wypos;
	status_nieakt integer;
	pop_cena text;
	licznik integer;
	indexer integer;
	temp record;
	id_pokoje integer;
	rodzic text;
	test integer;
	rec_region record;
BEGIN
	select into status_nieakt id from status where nazwa = '_nieaktualna';
	select into id_pokoje id from parametr_nier where nazwa = '_liczba_pokoi';
	select into podst_par_wyp * from PodstawoweParamWypos() where id_nier_rodzaj = nier_rodzaj_id and id_trans_rodzaj = trans_rodzaj_id;
	select into dane_oferta * from OfertaPodsDane where id_oferta = oferta_id and id_trans_rodzaj = trans_rodzaj_id and id_nier_rodzaj = nier_rodzaj_id and id_status != status_nieakt; ---order by data_otw_zlecenie desc
	result.parametr_nazwa := null;
	result.parametr_wartosc := null;
	result.wyposazenie := null;
	
	result.id_trans_rodzaj := dane_oferta.id_trans_rodzaj;
	result.id_nier_rodzaj := dane_oferta.id_nier_rodzaj;
	result.id_rodz_nier_szcz := dane_oferta.id_rodz_nier_szcz;
	result.id_oferta := dane_oferta.id_oferta;
	result.id_nieruchomosc := dane_oferta.id_nieruchomosc;
	result.lokalizacja := dane_oferta.lokalizacja;
	result.klucz := dane_oferta.klucz;

	select into rec_region id_parent, zaglebienie, pokaz from region_geog where id = dane_oferta.id_region_geog;

	IF rec_region.zaglebienie = 5 THEN
		result.id_region_geog := rec_region.id_parent;
	ELSE
		IF rec_region.pokaz = false THEN
			select into result.id_region_geog id_parent from region_geog where id = rec_region.id_parent;
		ELSE
			result.id_region_geog := dane_oferta.id_region_geog;
		END IF;
	END IF;
	---result.data := dane_oferta.data;
	result.cena := dane_oferta.cena;
	result.wylacznosc := dane_oferta.wylacznosc;
	result.id_status := dane_oferta.id_status;
	result.status := dane_oferta.status;

	select into pop_cena cena.cena from cena where cena.cena != dane_oferta.cena and cena.id_oferta = dane_oferta.id_oferta order by cena.data desc limit 1;
	result.cena_pop := pop_cena;
	
	---pobranie zdjecia
	select into result.zdjecie nazwa from zdjecie where id = (select min(id) from zdjecie where id_nieruchomosc = dane_oferta.id_nieruchomosc);
	---sprawdzenie, czy rodzaj nier szcz nie jest nullem
	IF nier_rodzaj_id = 2 THEN
		--nie ma rodzaju budynku, pobieramy pokoje, wg nich bedziemy agregowac
		select into result.ilosc_pokoi wartosc from dane_txt_nier where id_nieruchomosc = dane_oferta.id_nieruchomosc and id_parametr_nier = id_pokoje;
	END IF;

	licznik := 1;
	indexer := 1;
	---parametry podstawowe
	IF podst_par_wyp.parametr is not null THEN
		WHILE podst_par_wyp.parametr[licznik] is not null LOOP
			select into temp parametr_nier.nazwa, dane_txt_nier.wartosc from dane_txt_nier join parametr_nier on dane_txt_nier.id_parametr_nier = parametr_nier.id 
			where dane_txt_nier.id_nieruchomosc = dane_oferta.id_nieruchomosc and parametr_nier.id = podst_par_wyp.parametr[licznik];
			IF temp.nazwa is not null THEN
				result.parametr_nazwa[indexer] := temp.nazwa;
				result.parametr_wartosc[indexer] := temp.wartosc;
				indexer := indexer + 1;
				IF temp.nazwa = '_powierzchnia_uzytkowa' THEN
					result.powierzchnia := temp.wartosc::float;
				END IF;
			END IF;
			licznik := licznik + 1;
		END LOOP;
	END IF;
	licznik := 1;
	indexer := 1;
	---wyposazenia podstawowe
	IF podst_par_wyp.wyposazenie is not null THEN
		WHILE podst_par_wyp.wyposazenie[licznik] is not null LOOP
			select into rodzic nazwa from wyposazenie_nier where id = podst_par_wyp.wyposazenie[licznik];
			---sprawdzic czy element ma dzieci - jak ma robic select porownawczy na dzieci - jak ten ponizej, jesli nie ma dzieci robic select porownawczy bezposrednio
			select into test count(id) from wyposazenie_nier where id_parent = podst_par_wyp.wyposazenie[licznik];
			IF test > 0 THEN
				--element ma dzieci
				---jesli sie pokryje wprowadzic do rekordu i juz
				select into temp wyposazenie_nier.nazwa, dane_slow_wyp_nier.id_wyposazenie_nier from dane_slow_wyp_nier join wyposazenie_nier on 
				dane_slow_wyp_nier.id_wyposazenie_nier = wyposazenie_nier.id 
				where dane_slow_wyp_nier.id_nieruchomosc = dane_oferta.id_nieruchomosc and wyposazenie_nier.id in (select id from wyposazenie_nier where id_parent = podst_par_wyp.wyposazenie[licznik]);
				IF temp.nazwa is not null THEN
					result.wyposazenie[indexer] := rodzic || ' : ' || temp.nazwa;
				END IF;
			ELSE ---przetestowac zachowanie dla przykladnego elementu bezdzietnego
				--element bezdzietny :P
				select into temp dane_slow_wyp_nier.id_wyposazenie_nier from dane_slow_wyp_nier where dane_slow_wyp_nier.id_nieruchomosc = dane_oferta.id_nieruchomosc and 
				dane_slow_wyp_nier.id_wyposazenie_nier = podst_par_wyp.wyposazenie[licznik];
				IF temp.id_wyposazenie_nier is not null THEN
					result.wyposazenie[indexer] := rodzic;
				END IF;
			END IF;
			indexer := indexer + 1;
			licznik := licznik + 1;
		END LOOP;
	END IF;
	RETURN result;
END;
$$ LANGUAGE plpgsql;

---podstawowe informacje o ofercie do wersji rozszerzonej
CREATE FUNCTION OfertaPelnaWersja (oferta_id integer, jezyk_id integer) RETURNS oferty_wersja_pelna AS $$
DECLARE
	result oferty_wersja_pelna;
	rec_view OfertaPelneDane;
	rec_zdjecia record;
	licznik integer;
	test integer;
	parent_id integer;
	rec_region record;
	data_rozn integer;
BEGIN
	select into rec_view * from OfertaPelneDane where id_oferta = oferta_id;

	result.id_oferta := rec_view.id_oferta;
	result.id_nieruchomosc := rec_view.id_nieruchomosc;
	result.nieruchomosc_rodzaj := rec_view.nieruchomosc_rodzaj;
	result.transakcja_rodzaj := rec_view.transakcja_rodzaj;
	result.status := rec_view.status;
	result.id_agent := rec_view.id_agent;
	result.telefon := rec_view.telefon;
	result.komorka := rec_view.komorka;
	result.email := rec_view.email;
	result.lokalizacja := rec_view.lokalizacja;
	result.cena := rec_view.cena;
	result.wylacznosc := rec_view.wylacznosc;
	result.klucz := rec_view.klucz;
	result.rynek_pierw := rec_view.rynek_pierw;

	IF rec_view.przek_od_otwarcia = true THEN
		select into data_rozn rec_view.data_otw_zlecenie - (current_date - (rec_view.czas_przekazania * 30));
		IF data_rozn < 0 THEN
			---od zaraz
			result.czas_przekazania := 0;
		ELSE
			select into result.czas_przekazania ceil (data_rozn::float / 30);
		END IF;
	ELSE
		result.czas_przekazania := rec_view.czas_przekazania;
	END IF;

	---select into result.agent nazwa from AgentWersjaOficjalna(jezyk_id) where id = rec_view.id_agent;
	
	licznik := 1;
	FOR rec_zdjecia IN select id, nazwa from zdjecie where id_nieruchomosc = rec_view.id_nieruchomosc order by id asc LOOP
		result.zdjecie[licznik] := rec_zdjecia.nazwa;
		licznik := licznik + 1;
	END LOOP;

	licznik := 1;
	FOR rec_zdjecia IN select id, nazwa from film where id_nieruchomosc = rec_view.id_nieruchomosc LOOP
		result.film[licznik] := rec_zdjecia.nazwa;
		licznik := licznik + 1;
	END LOOP;
	
	select into rec_region id_parent, zaglebienie from region_geog where id = rec_view.id_region_geog;

	IF rec_region.zaglebienie = 5 THEN
		rec_view.id_region_geog := rec_region.id_parent;
	END IF;

	select into test count(id) from region_geog where id_parent = rec_view.id_region_geog;
	IF rec_region.zaglebienie >= 4 THEN
		select into parent_id id_parent from region_geog where id = rec_view.id_region_geog;
		select into parent_id id_parent from region_geog where id = parent_id;
		select into result.powiat nazwa from region_geog where id = parent_id;
		select into parent_id id_parent from region_geog where id = parent_id;
		select into result.wojewodztwo nazwa from region_geog where id = parent_id;
	ELSE
		---lipa, trudno powiedziec co tu robic, nie powinno sie to zdarzyc
		---zalozenie, ze jestemy w gminie, podajemy juz tylko powiat - region podejrzany o bycie powiatem :P
		select into parent_id id_parent from region_geog where id = rec_view.id_region_geog;
		select into result.powiat nazwa from region_geog where id = parent_id;
	END IF;
	
	IF rec_view.id_rodz_nier_szcz is not null THEN
		select into result.rodzaj_budynek nazwa from rodz_nier_szczeg where id = rec_view.id_rodz_nier_szcz;
	END IF;
	select into result.cena_pop cena.cena from cena where cena.cena != result.cena and cena.id_oferta = result.id_oferta order by cena.data desc limit 1;

	return result;
END; 
$$ LANGUAGE plpgsql;

---zgromadzenie informacji o ofercie w sekcjach dla wszystkich parametrow dozwolonych jako widzialne dla danego rodzaju transakcji i nieruchomosci
CREATE FUNCTION OfertaInfoSekcje (nieruchomosc_id integer, nier_rodzaj_id integer, trans_rodzaj_id integer) RETURNS SETOF oferta_sekcje AS $$
DECLARE
	rec_sekcje record;
	result oferta_sekcje;
	rec_temp record;
	rec_param record;
	rec_wypos record;
	licznik integer;
	rodzic record;
	test integer;
BEGIN
	FOR rec_sekcje IN select id, nazwa from sekcja order by id LOOP
		result.parametry := null;
		result.wyposazenia := null;
		result.id_sekcja := rec_sekcje.id;
		result.nazwa := rec_sekcje.nazwa;

		licznik := 1;
		FOR rec_param IN select parametr_nier.nazwa, dane_txt_nier.wartosc from dane_txt_nier join parametr_nier on dane_txt_nier.id_parametr_nier = parametr_nier.id join lista_param_nier on 
		parametr_nier.id = lista_param_nier.id_parametr_nier where parametr_nier.id_sekcja = rec_sekcje.id and dane_txt_nier.id_nieruchomosc = nieruchomosc_id and lista_param_nier.id_nier_rodzaj = 
		nier_rodzaj_id and lista_param_nier.id_trans_rodzaj = trans_rodzaj_id and lista_param_nier.pokaz = true order by parametr_nier.waga asc LOOP
			result.parametry[licznik] := rec_param.nazwa || ' : ' || rec_param.wartosc;
			licznik := licznik + 1;
		END LOOP;
		
		licznik := 1; 
		FOR rec_wypos IN select wyposazenie_nier.nazwa, wyposazenie_nier.id, wyposazenie_nier.id_parent from dane_slow_wyp_nier join wyposazenie_nier on dane_slow_wyp_nier.id_wyposazenie_nier = 
		wyposazenie_nier.id where wyposazenie_nier.id_sekcja = rec_sekcje.id and dane_slow_wyp_nier.id_nieruchomosc = nieruchomosc_id order by wyposazenie_nier.waga asc LOOP
			IF rec_wypos.id_parent is null THEN
				---sprawdzenie czy figuruje do pokazania, element nie ma dzieci
				select into test id from lista_param_slow_nier where id_wyposazenie_nier = rec_wypos.id and lista_param_slow_nier.id_nier_rodzaj = nier_rodzaj_id and 
				lista_param_slow_nier.id_trans_rodzaj = trans_rodzaj_id and lista_param_slow_nier.pokaz = true;
				IF test is not null THEN
					result.wyposazenia[licznik] := rec_wypos.nazwa || ' : _tak';
					licznik := licznik + 1;
				END IF;
			ELSE
				---sprawdzenie, czy widnieje do pokazania, element jest dzieckiem, ustalamy rodzica i jego weryfikujemy
				select into rodzic wyposazenie_nier.id, wyposazenie_nier.nazwa from wyposazenie_nier where id = rec_wypos.id_parent;
				select into test id from lista_param_slow_nier where id_wyposazenie_nier = rodzic.id and lista_param_slow_nier.id_nier_rodzaj = nier_rodzaj_id and 
				lista_param_slow_nier.id_trans_rodzaj = trans_rodzaj_id and lista_param_slow_nier.pokaz = true;
				IF test is not null THEN
					result.wyposazenia[licznik] := rodzic.nazwa || ' : ' || rec_wypos.nazwa;
					licznik := licznik + 1;
				END IF;
			END IF;
		END LOOP;

		IF result.parametry is not null OR result.wyposazenia is not null THEN
			RETURN NEXT result;
		END IF;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

---zgromadzenie kompletu informacji o pomieszczeniach oferty
CREATE FUNCTION OfertaPomieszczenia (nieruchomosc_id integer, nier_rodzaj_id integer) RETURNS SETOF oferta_pomieszczenia AS $$
DECLARE
	result oferta_pomieszczenia;
	rec_temp record;
	rec_param record;
	rec_wypos record;
	test integer;
	licznik integer;
	rodzic text;
BEGIN
	select into test count(id) from pomieszczenie_nier where id_nier_rodzaj = nier_rodzaj_id;
	IF test = 0 THEN
		RETURN;
	ELSE
		FOR rec_temp in select pomieszczenie.nazwa, pomieszczenie.id, pomieszczenie_przyn_nier.nr_pomieszczenia, pomieszczenie_przyn_nier.id as id_pomieszczenie_przyn_nier 
		from pomieszczenie_przyn_nier join pomieszczenie on pomieszczenie_przyn_nier.id_pomieszczenie = pomieszczenie.id where pomieszczenie_przyn_nier.id_nieruchomosc = nieruchomosc_id 
		order by pomieszczenie.waga, pomieszczenie_przyn_nier.nr_pomieszczenia LOOP
			result.parametry := null;
			result.wyposazenia := null;
			
			result.id_pomieszczenie := rec_temp.id;
			result.nazwa := rec_temp.nazwa;
			result.nr_pomieszczenie := rec_temp.nr_pomieszczenia;

			---wczytac parametry i wyposazenia
			licznik := 1;
			FOR rec_param in select parametr_pom.nazwa, dane_txt_pom.wartosc from dane_txt_pom join parametr_pom on dane_txt_pom.id_parametr_pom = parametr_pom.id 
			where dane_txt_pom.id_pomieszczenie_przyn_nier = rec_temp.id_pomieszczenie_przyn_nier LOOP
				result.parametry[licznik] := rec_param.nazwa || ' : ' || rec_param.wartosc;
				licznik := licznik + 1;
			END LOOP;

			licznik := 1;
			FOR rec_wypos in select wyposazenie_pom.nazwa, wyposazenie_pom.id_parent from dane_slow_wyp_pom join wyposazenie_pom on dane_slow_wyp_pom.id_wyposazenie_pom = wyposazenie_pom.id 
			where dane_slow_wyp_pom.id_pomieszczenie_przyn_nier = rec_temp.id_pomieszczenie_przyn_nier LOOP
				IF rec_wypos.id_parent is null THEN
					result.wyposazenia[licznik] := rec_wypos.nazwa || ' : _tak';
				ELSE
					select into rodzic nazwa from wyposazenie_pom where id = rec_wypos.id_parent;
					result.wyposazenia[licznik] := rodzic || ' : ' || rec_wypos.nazwa;
				END IF;
				licznik := licznik + 1;
			END LOOP;
			IF result.parametry is not null OR result.wyposazenia is not null THEN
				RETURN NEXT result;
			END IF;
		END LOOP;
		RETURN;
	END IF;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION OfertaOpisy (oferta_id integer) RETURNS SETOF opis AS $$
DECLARE
	result opis;
BEGIN
	FOR result in select * from opis where id_oferta = oferta_id LOOP
		return next result;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION PodajRodzajOferta (nier_rodzaj_id integer, trans_rodzaj_id integer) RETURNS OfertaRodzaj AS $$
DECLARE
	result OfertaRodzaj;
BEGIN
	select into result.nieruchomosc_rodzaj nazwa from nier_rodzaj where id = nier_rodzaj_id;
	select into result.transakcja_rodzaj nazwa from trans_rodzaj where id = trans_rodzaj_id;
	return result;
END;
$$ LANGUAGE plpgsql;

---OfertaRodzajId
CREATE FUNCTION PodajTransIdNierIdOferta (oferta_id integer) RETURNS OfertaRodzajId AS $$
DECLARE
	result OfertaRodzajId;
	rec_temp record;
BEGIN
	select into rec_temp id_nier_rodzaj, oferta.id_nieruchomosc from nieruchomosc join oferta on oferta.id_nieruchomosc = nieruchomosc.id where oferta.id = oferta_id;
	result.id_nier_rodzaj := rec_temp.id_nier_rodzaj;
	result.id_nieruchomosc := rec_temp.id_nieruchomosc;
	select into result.id_trans_rodzaj id_rodz_trans from oferta where id = oferta_id;
	result.id_oferta := oferta_id;
	return result;
END;
$$ LANGUAGE plpgsql;

---PodajTransIdNierIdOferta akt
CREATE FUNCTION PodajTransIdNierIdOfertaAkt (oferta_id integer) RETURNS SETOF OfertaRodzajId AS $$
DECLARE
	test integer;
	result OfertaRodzajId;
BEGIN
	select into test id from oferta where id_status in (select id from status where nazwa in ('_aktualna', '_umowiona', '_wstrzymana', '_zawieszona') and pokaz = true) and id = oferta_id;
	IF test is not null THEN
		select into result * from PodajTransIdNierIdOferta(oferta_id);
		RETURN NEXT result;
	END IF;
END;
$$ LANGUAGE plpgsql;


CREATE FUNCTION OfertaWyswietl (oferta_id integer) RETURNS boolean AS $$
DECLARE
	result integer;
BEGIN
	select into result id from oferta where id = oferta_id and pokaz = true and id_status != (select id from status where nazwa = '_nieaktualna');
	IF result is null THEN
		RETURN false;
	ELSE
		RETURN true;
	END IF;
END;
$$ LANGUAGE plpgsql;


CREATE FUNCTION OfertyNowosci() RETURNS SETOF oferta_nowosc AS $$
DECLARE
	result oferta_nowosc;
	dane_oferta OfertaNowosc;
BEGIN
	FOR dane_oferta in select * from OfertaNowosc order by data desc limit 20 LOOP
		result.id_oferta := dane_oferta.id_oferta;
		result.id_nieruchomosc := dane_oferta.id_nieruchomosc;
		result.id_nier_rodzaj := dane_oferta.id_nier_rodzaj;
		result.id_trans_rodzaj := dane_oferta.id_rodz_trans;
		result.nieruchomosc_rodzaj := dane_oferta.nieruchomosc_rodzaj;
		result.transakcja_rodzaj := dane_oferta.transakcja_rodzaj;
		result.lokalizacja := dane_oferta.lokalizacja;
		result.wylacznosc := dane_oferta.wylacznosc;
		select into result.zdjecie nazwa from zdjecie where id = (select min(id) from zdjecie where id_nieruchomosc = dane_oferta.id_nieruchomosc);
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql; 

CREATE FUNCTION FiltracjaPodstawoweWersjeOfert (nier_rodzaj_id integer, trans_rodzaj_id integer, pow_min float, pow_max float, cena_max text, l_pok_min int, l_pok_max int, dzielnica_id integer, jezyk_id integer, adres_ip text) RETURNS SETOF oferty_wersja_pods AS $$
DECLARE
	result oferty_wersja_pods;
	zapytanie text;
	andphr boolean;
	---logowanie aktywnosci wyszukujacych, dodanie do tabel wyszukiwanie i kryteria
	wyszukiwanie_id integer;
BEGIN
	insert into wyszukiwanie (adres, id_jezyk) values (adres_ip, jezyk_id);
	select into wyszukiwanie_id currval('wyszukiwanie_id_seq');
	andphr := false;
	zapytanie := 'select * from PodstawoweWersjeOfert(' || nier_rodzaj_id || ', ' || trans_rodzaj_id || ') where';
	insert into kryteria (id_wyszukiwanie, nazwa, wartosc) values (wyszukiwanie_id, 'id_nier_rodzaj', nier_rodzaj_id);
	insert into kryteria (id_wyszukiwanie, nazwa, wartosc) values (wyszukiwanie_id, 'id_trans_rodzaj', trans_rodzaj_id);
	--powierzchnia between ' || pow_min || ' and ' || pow_max;
	IF pow_min is not null THEN
		zapytanie := zapytanie || ' powierzchnia >= ' || (pow_min * 0.97);
		andphr := true;
		insert into kryteria (id_wyszukiwanie, nazwa, wartosc) values (wyszukiwanie_id, 'pow_min', pow_min);
	END IF;
	IF pow_max is not null THEN
		IF andphr = true THEN
			zapytanie := zapytanie || ' and';
		END IF;
		zapytanie := zapytanie || ' powierzchnia <= ' || (pow_max * 1.03);
		andphr := true;
		insert into kryteria (id_wyszukiwanie, nazwa, wartosc) values (wyszukiwanie_id, 'pow_max', pow_max);
	END IF;
	IF l_pok_min is not null THEN
		IF andphr = true THEN
			zapytanie := zapytanie || ' and';
		END IF;
		zapytanie := zapytanie || ' liczba_pokoi >= ' || l_pok_min;
		andphr := true;
		insert into kryteria (id_wyszukiwanie, nazwa, wartosc) values (wyszukiwanie_id, 'l_pok_min', l_pok_min);
	END IF;
	IF l_pok_max is not null THEN
		IF andphr = true THEN
			zapytanie := zapytanie || ' and';
		END IF;
		zapytanie := zapytanie || ' liczba_pokoi <= ' || l_pok_max;
		andphr := true;
		insert into kryteria (id_wyszukiwanie, nazwa, wartosc) values (wyszukiwanie_id, 'l_pok_max', l_pok_max);
	END IF;
	IF character_length (cena_max) > 0 THEN
		IF andphr = true THEN
			zapytanie := zapytanie || ' and';
		END IF;
		zapytanie := zapytanie || ' cena::float <= ' || (cena_max::float * 1.05);
		andphr := true;
		insert into kryteria (id_wyszukiwanie, nazwa, wartosc) values (wyszukiwanie_id, 'cena', cena_max);
	END IF;
---dzielnica_id
	IF dzielnica_id > 1 THEN
		IF andphr = true THEN
			zapytanie := zapytanie || ' and';
		END IF;
		zapytanie := zapytanie || ' id_region_filtr = ' || dzielnica_id;
		insert into kryteria (id_wyszukiwanie, nazwa, wartosc) values (wyszukiwanie_id, 'region', dzielnica_id);
		---andphr := true;
	END IF;
	zapytanie := zapytanie || ' order by cena::float;';
	--cena::float <= cena_max and 
	FOR result in execute zapytanie LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION DodajSubskrypcja (nier_rodzaj_id integer, trans_rodzaj_id integer, min_cena float, max_cena float, adres_email text, jezyk_id integer) RETURNS slownik AS $$
DECLARE
	result slownik;
	test boolean;
BEGIN
	select into test SprawdzSubskrypcja(nier_rodzaj_id, trans_rodzaj_id, adres_email);
	IF test THEN
		insert into subskrypcja (id_nier_rodzaj, id_trans_rodzaj, cena_min, cena_max, email, data, id_jezyk) values (nier_rodzaj_id, trans_rodzaj_id, min_cena, max_cena, lower(adres_email), (select current_date), jezyk_id);
		result.id := 1;
	ELSE
		result.nazwa := '_subskrybent_jest_juz_dodany';
	END IF;
	RETURN result;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION UsunSubskrypcja (nier_rodzaj_id integer, trans_rodzaj_id integer, adres_email text) RETURNS slownik AS $$
DECLARE
	result slownik;
BEGIN
	delete from subskrypcja where id_nier_rodzaj = nier_rodzaj_id and id_trans_rodzaj = trans_rodzaj_id and lower(email) = lower(adres_email);
	IF found THEN
		result.id := 1;
	ELSE
		result.nazwa := '_nie_znaleziono_subskrybenta';
	END IF;
	RETURN result;
END;
$$ LANGUAGE plpgsql;

---zastanowic sie czy nie walic od reki podaj oferty dla subs z mailami ??
--CREATE FUNCTION PodajSubskrypcja (nier_rodzaj_id integer, trans_rodzaj_id integer)

---protected ?? tylko do uzytku wewn ??
CREATE FUNCTION SprawdzSubskrypcja (nier_rodzaj_id integer, trans_rodzaj_id integer, adres_email text) RETURNS boolean AS $$
DECLARE
	test integer;
BEGIN
	select into test id from subskrypcja where id_nier_rodzaj = nier_rodzaj_id and id_trans_rodzaj = trans_rodzaj_id and lower(email) = lower(adres_email);
	IF test is null THEN
		---mozna dodawac
		RETURN true;
	ELSE
		---juz jest, nie mozna dodawac
		RETURN false;
	END IF;
END;
$$ LANGUAGE plpgsql;


---wstepna ideologia jest taka, zeby pobrac liste id ofert do publikacji, czyli swiezych, po czym podac je aplikacji, zeby ta skorzystala z mechanizmow 
---z iplementacja cache itd zeby ta operacja nie byla zupelnie na marne

---!!! korzystane jest tylko ze zmiany ceny, dlatego ze w zmianie ceny z danego dnia beda oferty dodane jako nowe, jak rowniez te po zmianie ceny
CREATE FUNCTION OfertySubskrypcja () RETURNS SETOF OfertaSubskrypcja AS $$
DECLARE
	temp_rec record;
	temp record;
	oferta_id integer;
	dzis date;
	jutro date;
	result OfertaSubskrypcja;
	licznik integer;
BEGIN
	select into dzis current_date - 1;
	select into jutro current_date;
	FOR temp_rec in select distinct cena.id_oferta, cena.cena, oferta.id_rodz_trans as id_trans_rodzaj, nieruchomosc.id_nier_rodzaj from cena join oferta on cena.id_oferta = oferta.id 
	join nieruchomosc on oferta.id_nieruchomosc = nieruchomosc.id where oferta.pokaz = true and oferta.id_status in (select id from status where nazwa = '_aktualna' or nazwa = '_umowiona') and 
	cena.data between dzis and jutro order by cena.id_oferta asc LOOP
		result.id_oferta := temp_rec.id_oferta;
		result.id_trans_rodzaj := temp_rec.id_trans_rodzaj;
		result.id_nier_rodzaj := temp_rec.id_nier_rodzaj;
		result.email := null;
		licznik := 1;
		FOR temp in select email, id_jezyk from subskrypcja where id_nier_rodzaj = temp_rec.id_nier_rodzaj and id_trans_rodzaj = temp_rec.id_trans_rodzaj and temp_rec.cena between cena_min and cena_max LOOP
			result.id_jezyk[licznik] := temp.id_jezyk;
			result.email[licznik] := temp.email;
			licznik := licznik + 1;
		END LOOP;
		IF licznik > 1 THEN
			RETURN NEXT result;
		END IF;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

---KojarzenieBazoweDlaOferty
---ZapotrzTransNierRodzaj
CREATE FUNCTION OfertyZlecenieSubskrypcja () RETURNS SETOF OfertaZlecenieSubskrypcja AS $$
DECLARE
	result OfertaZlecenieSubskrypcja;
	rec_zap record;
	temp_rec record;
	dzis date;
	jutro date;
	licznik integer;
BEGIN
	select into dzis current_date - 1;
	select into jutro current_date;
	FOR temp_rec in select distinct cena.id_oferta, cena.cena, oferta.id_rodz_trans as id_trans_rodzaj, nieruchomosc.id_nier_rodzaj from cena join oferta on cena.id_oferta = oferta.id 
	join nieruchomosc on oferta.id_nieruchomosc = nieruchomosc.id where oferta.pokaz = true and oferta.id_status in (select id from status where nazwa = '_aktualna' or nazwa = '_umowiona') and 
	cena.data between dzis and jutro order by cena.id_oferta asc LOOP
		--RAISE NOTICE '%', temp_rec.id_oferta;
		--licznik := 1;
		FOR rec_zap in select KojarzenieBazoweDlaOferty.*, email_osoba.nazwa as email from KojarzenieBazoweDlaOferty (temp_rec.id_oferta, 1, 0, true) 
		join email_osoba on KojarzenieBazoweDlaOferty.id_osoba = email_osoba.id_osoba order by id_zapotrzebowanie asc LOOP
			result.id_oferta := temp_rec.id_oferta;
			result.id_zapotrzebowanie := rec_zap.id_zapotrzebowanie;
			result.id_trans_rodzaj := temp_rec.id_trans_rodzaj;
			result.id_nier_rodzaj := temp_rec.id_nier_rodzaj;
			result.email := rec_zap.email;
			---dodanie info o powiadomieniu osoby
			insert into wysylka_ofert_zapotrzebowanie (id_zapotrzebowanie, id_oferta, cena) values (rec_zap.id_zapotrzebowanie, temp_rec.id_oferta, temp_rec.cena::float);
			RETURN NEXT result;
			--licznik := licznik + 1;
		END LOOP;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION OfertyListaWskazanSubskrypcja () RETURNS SETOF OfertaZlecenieSubskrypcja AS $$
DECLARE
	result OfertaZlecenieSubskrypcja;
	rec_zap record;
	temp_rec record;
	dzis date;
	jutro date;
	licznik integer;
BEGIN
	select into dzis current_date - 1;
	select into jutro current_date;
	FOR temp_rec in select distinct cena.id_oferta, cena.cena, oferta.id_rodz_trans as id_trans_rodzaj, nieruchomosc.id_nier_rodzaj from cena join oferta on cena.id_oferta = oferta.id 
	join nieruchomosc on oferta.id_nieruchomosc = nieruchomosc.id where oferta.pokaz = true and oferta.id_status in (select id from status where nazwa = '_aktualna' or nazwa = '_umowiona') and 
	cena.data between dzis and jutro order by cena.id_oferta asc LOOP
		FOR rec_zap in select lista_wsk_adr.id_zapotrzebowanie, email_osoba.nazwa as email from lista_wsk_adr join osoba_zapotrzebowanie on lista_wsk_adr.id_zapotrzebowanie = osoba_zapotrzebowanie.id_zapotrzebowanie 
		join email_osoba on osoba_zapotrzebowanie.id_osoba = email_osoba.id_osoba where lista_wsk_adr.id_oferta = temp_rec.id_oferta and 
		(select id_status from zapotrzebowanie_trans_rodzaj join zapotrzebowanie_nier_rodzaj on zapotrzebowanie_trans_rodzaj.id_zapotrzebowanie_nier_rodzaj = zapotrzebowanie_nier_rodzaj.id join 
		zapotrzebowanie on zapotrzebowanie_nier_rodzaj.id_zapotrzebowanie = zapotrzebowanie.id where zapotrzebowanie.id = lista_wsk_adr.id_zapotrzebowanie and zapotrzebowanie_nier_rodzaj.id_nier_rodzaj = 
		temp_rec.id_nier_rodzaj and zapotrzebowanie_trans_rodzaj.id_trans_rodzaj = temp_rec.id_trans_rodzaj) in (select id from status where nazwa = '_aktualna' or nazwa = '_umowiona') LOOP
			result.id_oferta := temp_rec.id_oferta;
			result.id_zapotrzebowanie := rec_zap.id_zapotrzebowanie;
			result.id_trans_rodzaj := temp_rec.id_trans_rodzaj;
			result.id_nier_rodzaj := temp_rec.id_nier_rodzaj;
			result.email := rec_zap.email;
			---dodanie info o powiadomieniu osoby, jednak dodatkowo info ze to lezy na liscie wsk
			insert into wysylka_ofert_zapotrzebowanie (id_zapotrzebowanie, id_oferta, cena, is_lst_wsk) values (rec_zap.id_zapotrzebowanie, temp_rec.id_oferta, temp_rec.cena::float, true);
			RETURN NEXT result;
		END LOOP;
	END LOOP;
END;
$$ LANGUAGE plpgsql;

---oferta_odwiedziny
---drop FUNCTION OfertaOdwiedziny (text, integer, text);
CREATE FUNCTION OfertaOdwiedziny (adres_ip text, oferta_id integer, ref_site text) RETURNS VOID AS $$
DECLARE
	akt_czas timestamp;
BEGIN
	select into akt_czas date_trunc('second', current_timestamp::timestamp);
	insert into oferta_odwiedziny (id_oferta, adres, data, referer) values (oferta_id, adres_ip, akt_czas, ref_site);
END;
$$ LANGUAGE plpgsql;

--select count(id_oferta) as ilosc, id_oferta from oferta_odwiedziny where adres not like '10.0.0.%' group by id_oferta order by ilosc desc limit 6;
--pokaz na stronie i status ujac
CREATE FUNCTION OfertyNajczestsze () RETURNS setof OfertaRodzajId AS $$
DECLARE
	result OfertaRodzajId;
	temp record;
	akt_data date;
BEGIN
	select into akt_data current_date - 4;
	FOR temp in select count(id_oferta) as ilosc, id_oferta from oferta_odwiedziny where (select oferta.pokaz from oferta where id = id_oferta) = true and oferta_odwiedziny.adres not like '10.0.0.%' 
	and oferta_odwiedziny.data > akt_data and oferta_odwiedziny.consider = true group by oferta_odwiedziny.id_oferta order by ilosc desc limit 4 LOOP
		select into result * from PodajTransIdNierIdOferta(temp.id_oferta);
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION OfertyPodobne (oferta_id integer) RETURNS SETOF OfertaPodsDane AS $$
DECLARE
	result OfertaPodsDane;
	oferta_rec record;
BEGIN
	select into oferta_rec id_region_geog, cena, id_rodz_trans as id_trans_rodzaj, id_nier_rodzaj from oferta join nieruchomosc on oferta.id_nieruchomosc = nieruchomosc.id where oferta.id = oferta_id;
	---status i pokaz w sieci sprawdzic
	---porownac cene, lokalizacje
	FOR result in select * from OfertaPodsDane where id_oferta != oferta_id and id_trans_rodzaj = oferta_rec.id_trans_rodzaj and id_nier_rodzaj = oferta_rec.id_nier_rodzaj and 
	id_region_geog = oferta_rec.id_region_geog and cena::float between (oferta_rec.cena::float * 0.85) and (oferta_rec.cena::float * 1.12) and status in ('_aktualna', '_umowiona', '_wstrzymana') LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;