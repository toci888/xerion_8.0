--
-- PostgreSQL database dump
--

SET client_encoding = 'LATIN2';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'Standard public schema';


--
-- Name: plpgsql; Type: PROCEDURAL LANGUAGE; Schema: -; Owner: postgres
--

CREATE PROCEDURAL LANGUAGE plpgsql;


SET search_path = public, pg_catalog;

--
-- Name: dodanieoferta; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE dodanieoferta AS (
	id_nieruchomosc integer,
	id_oferta integer
);


ALTER TYPE public.dodanieoferta OWNER TO postgres;

--
-- Name: kalendarzedycja; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE kalendarzedycja AS (
	id integer,
	data date,
	id_godzina integer,
	id_minuta integer,
	id_spotkanie integer,
	komentarz text,
	id_agent integer[]
);


ALTER TYPE public.kalendarzedycja OWNER TO postgres;

--
-- Name: klientoferta; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE klientoferta AS (
	id_klient integer,
	id_osobowosc integer,
	agent text,
	nazwa_firma text,
	nip text,
	regon text,
	krs text,
	kod text,
	id_region_geog integer,
	miejscowosc text,
	ulica text,
	numer_dom text,
	numer_miesz text
);


ALTER TYPE public.klientoferta OWNER TO postgres;

--
-- Name: klientszukaj; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE klientszukaj AS (
	id_osoba integer,
	id_klient integer,
	nazwisko text,
	imie text,
	pesel text,
	telefon text,
	komorka text,
	nazwa_firma text
);


ALTER TYPE public.klientszukaj OWNER TO postgres;

--
-- Name: listawskazanzapotrzebowanie; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE listawskazanzapotrzebowanie AS (
	id_zapotrzebowanie integer,
	agent text,
	data timestamp without time zone,
	data_otw_zlecenie date,
	osoba text[],
	pesel text[],
	telefon text[]
);


ALTER TYPE public.listawskazanzapotrzebowanie OWNER TO postgres;

--
-- Name: listawskzapotrzebowanie; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE listawskzapotrzebowanie AS (
	id_oferta integer,
	id_zapotrzebowanie integer,
	id_nieruchomosc integer,
	agent text,
	cena text,
	nieruchomosc_rodzaj text,
	transakcja_rodzaj text,
	ulica text,
	ogladanie_data text,
	powierzchnia text,
	liczba_pokoi text
);


ALTER TYPE public.listawskzapotrzebowanie OWNER TO postgres;

--
-- Name: logowanieobj; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE logowanieobj AS (
	nazwa text,
	rezultat boolean,
	id_agent integer,
	id_agent_otodom integer,
	il_dni_wyg integer,
	aktywnosc boolean,
	wewnetrzny character varying(4),
	nip character varying(13),
	adres text,
	firma text,
	bank text[],
	nr_konto character varying(26)[],
	dodawanie boolean,
	edycja boolean,
	kasowanie boolean,
	druk boolean,
	adm_klient boolean,
	adm_dane boolean,
	zmiana_upr boolean
);


ALTER TYPE public.logowanieobj OWNER TO postgres;

--
-- Name: oferta_gablota; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE oferta_gablota AS (
	id_oferta integer,
	id_nieruchomosc integer,
	agent text,
	email text,
	telefon text,
	komorka text,
	lokalizacja text,
	cena text,
	cena_pop text,
	rodzaj_budynek text,
	rynek_pierw boolean,
	wylacznosc boolean
);


ALTER TYPE public.oferta_gablota OWNER TO postgres;

--
-- Name: oferta_nowosc; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE oferta_nowosc AS (
	id_oferta integer,
	id_nieruchomosc integer,
	id_trans_rodzaj integer,
	id_nier_rodzaj integer,
	nieruchomosc_rodzaj text,
	transakcja_rodzaj text,
	lokalizacja text,
	zdjecie text
);


ALTER TYPE public.oferta_nowosc OWNER TO postgres;

--
-- Name: oferta_pomieszczenia; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE oferta_pomieszczenia AS (
	id_pomieszczenie integer,
	nazwa text,
	nr_pomieszczenie integer,
	parametry text[],
	wyposazenia text[]
);


ALTER TYPE public.oferta_pomieszczenia OWNER TO postgres;

--
-- Name: oferta_sekcje; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE oferta_sekcje AS (
	id_sekcja integer,
	nazwa text,
	parametry text[],
	wyposazenia text[]
);


ALTER TYPE public.oferta_sekcje OWNER TO postgres;

--
-- Name: oferta_usun; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE oferta_usun AS (
	id_oferta integer,
	id_nier_rodzaj integer,
	id_trans_rodzaj integer
);


ALTER TYPE public.oferta_usun OWNER TO postgres;

--
-- Name: ofertadomiporta; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE ofertadomiporta AS (
	"exclusive" integer,
	id integer,
	nr_oferty integer,
	operacja text,
	kategoria text,
	miasto text,
	powiat text,
	wojewodztwo text,
	gmina text,
	dzielnica text,
	lokalizacja text,
	ulica text,
	najblizsza_przecznica text,
	polozenie text,
	kierunek text,
	odleglosc_od_centrum_miasta_woj double precision,
	odleglosc_od_drogi_glownej double precision,
	przy_drodze text,
	nawierzchnia_drogi text,
	forma_wlasnosci text,
	powierzchnia double precision,
	okna_strony_swiata text,
	wyposazenie text,
	witryny integer,
	wymiary text,
	pow_miesz double precision,
	powierzchnia_zabudowy double precision,
	pow_dzial double precision,
	pietro integer,
	ile_pieter integer,
	liczba_poziomow integer,
	liczba_kondygnacji integer,
	pietra_opis text,
	piwnica text,
	parter text,
	poddasze_opis text,
	liczba_pokoi integer,
	pokoje_opis text,
	kuchnia text,
	liczba_lazienek integer,
	lazienka text,
	liczba_sypialni integer,
	salon_powierzchnia double precision,
	przedpokoj_powierzchnia double precision,
	piwnica_powierzchnia double precision,
	strych_powierzchnia double precision,
	meble text,
	rok integer,
	rok_nabycia integer,
	stan_techniczny text,
	material text,
	stan_lokalu text,
	standard text,
	technologia text,
	ksztalt text,
	czy_mozliwy_podzial integer,
	przeznaczenie text,
	dopuszczalna_zabudowa double precision,
	zagospodarowanie text,
	ogrodzenie text,
	dach text,
	ogrzewanie text,
	kanalizacja text,
	woda text,
	sila integer,
	elektr integer,
	gaz integer,
	telefon integer,
	tv_kablowa integer,
	tv integer,
	internet integer,
	pralka integer,
	lodowka integer,
	zamrazarka integer,
	zmywarka integer,
	klimatyzacja integer,
	lokal_pusty integer,
	winda integer,
	domofon integer,
	zsyp text,
	ogrodek integer,
	parking_typ text,
	parking_liczba_miejsc integer,
	zabezpieczenia text,
	garaz integer,
	garaz_typ text,
	garaz_liczba_stanowisk integer,
	glosnosc text,
	dzialka_uwagi text,
	halas text,
	otoczenie text,
	sasiedztwo text,
	zalesienie integer,
	opis text,
	wysokosc_czynszu double precision,
	czynsz_najemca integer,
	cena_metra double precision,
	wartosc double precision,
	zdjecia text[],
	kontakt text
);


ALTER TYPE public.ofertadomiporta OWNER TO postgres;

--
-- Name: ofertakrn; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE ofertakrn AS (
	typ_obiektu integer,
	typ_transakcji integer,
	nr_oferty integer,
	klucz integer,
	wojewodztwo integer,
	miejscowosc text,
	dzielnica text,
	ulica text,
	cena text,
	powierzchnia double precision,
	powierzchnia_dzialki double precision,
	ogrzewanie text,
	rok_budowy integer,
	stan_techniczny text,
	opis text,
	czynsz double precision,
	forma_wlasnosci text,
	liczba_pieter integer,
	ktore_pietro integer,
	liczba_pokoi integer,
	zdjecie text[]
);


ALTER TYPE public.ofertakrn OWNER TO postgres;

--
-- Name: ofertalistawskazan; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE ofertalistawskazan AS (
	id_oferta integer,
	id_klient integer,
	adres text,
	cena text,
	opis text,
	wlasciciel integer[],
	oferent integer[]
);


ALTER TYPE public.ofertalistawskazan OWNER TO postgres;

--
-- Name: ofertanieruchomosc; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE ofertanieruchomosc AS (
	id_oferta integer,
	id_nieruchomosc integer,
	id_klient integer,
	id_nier_rodzaj integer,
	id_rodz_nier_szcz integer,
	id_rodz_trans integer,
	id_status integer,
	id_region_geog integer,
	id_priorytet_reklama integer,
	miejscowosc text,
	agent text,
	ulica_net text,
	ulica text,
	kod text,
	data date,
	rynek text,
	klucz boolean,
	data_otw_zlecenie date,
	data_zam_zlecenie date,
	cena text,
	prowizja text,
	prow_proc boolean,
	wylacznosc boolean,
	pokaz boolean,
	czas_przekazania integer,
	przek_od_otwarcia boolean,
	dane_wyposazenie_nier integer[],
	dane_parametr_nier integer[],
	dane_parametr_nier_wartosc text[]
);


ALTER TYPE public.ofertanieruchomosc OWNER TO postgres;

--
-- Name: ofertaofnet; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE ofertaofnet AS (
	id_oferta integer,
	id_nier_rodzaj integer,
	id_trans_rodzaj integer,
	wojewodztwo text,
	miasto text,
	dzielnica text,
	okolica text,
	ulica text,
	dataaktualizacji text,
	cena double precision,
	powierzchnia double precision,
	powierzchniadzialki double precision,
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


ALTER TYPE public.ofertaofnet OWNER TO postgres;

--
-- Name: ofertaogladanaklient; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE ofertaogladanaklient AS (
	id_oferta integer,
	adres text,
	cena text,
	opis text,
	data timestamp without time zone,
	agent text,
	wlasciciel text[]
);


ALTER TYPE public.ofertaogladanaklient OWNER TO postgres;

--
-- Name: ofertaogldane; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE ofertaogldane AS (
	id_oferta integer,
	adres text,
	cena text,
	opis text,
	data date,
	wlasciciel integer[]
);


ALTER TYPE public.ofertaogldane OWNER TO postgres;

--
-- Name: ofertaotodom; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE ofertaotodom AS (
	id_oferta integer,
	id_agent integer,
	insertion_id integer,
	data_mod date,
	data_wyg date,
	id_wojewodztwo integer,
	id_powiat integer,
	miejscowosc text,
	ulica text,
	cena double precision,
	powierzchnia double precision,
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
	powierzchnia_dzialki double precision,
	rok text,
	zdjecie text[]
);


ALTER TYPE public.ofertaotodom OWNER TO postgres;

--
-- Name: ofertarodzaj; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE ofertarodzaj AS (
	nieruchomosc_rodzaj text,
	transakcja_rodzaj text
);


ALTER TYPE public.ofertarodzaj OWNER TO postgres;

--
-- Name: ofertarodzajid; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE ofertarodzajid AS (
	id_oferta integer,
	id_nier_rodzaj integer,
	id_trans_rodzaj integer
);


ALTER TYPE public.ofertarodzajid OWNER TO postgres;

--
-- Name: ofertasubskrypcja; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE ofertasubskrypcja AS (
	id_oferta integer,
	id_trans_rodzaj integer,
	id_nier_rodzaj integer,
	id_jezyk integer[],
	email text[]
);


ALTER TYPE public.ofertasubskrypcja OWNER TO postgres;

--
-- Name: ofertazleceniesubskrypcja; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE ofertazleceniesubskrypcja AS (
	id_oferta integer,
	id_zapotrzebowanie integer,
	id_trans_rodzaj integer,
	id_nier_rodzaj integer,
	email text
);


ALTER TYPE public.ofertazleceniesubskrypcja OWNER TO postgres;

--
-- Name: oferty_wersja_pelna; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE oferty_wersja_pelna AS (
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
	zdjecie text[],
	film text[]
);


ALTER TYPE public.oferty_wersja_pelna OWNER TO postgres;

--
-- Name: oferty_wersja_pods; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE oferty_wersja_pods AS (
	id_trans_rodzaj integer,
	id_nier_rodzaj integer,
	id_rodz_nier_szcz integer,
	id_oferta integer,
	id_nieruchomosc integer,
	id_region_geog integer,
	lokalizacja text,
	cena text,
	cena_pop text,
	wylacznosc boolean,
	id_status integer,
	status text,
	zdjecie text,
	ilosc_pokoi integer,
	powierzchnia double precision,
	parametr_nazwa text[],
	parametr_wartosc text[],
	wyposazenie text[]
);


ALTER TYPE public.oferty_wersja_pods OWNER TO postgres;

--
-- Name: osobaedycja; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE osobaedycja AS (
	id_osoba integer,
	id_imie integer,
	imie text,
	nazwisko text,
	nazwisko_rodowe text,
	pesel text,
	id_agent integer,
	kod text,
	id_region_geog integer,
	region text,
	ulica text,
	numer_dom text,
	numer_miesz text
);


ALTER TYPE public.osobaedycja OWNER TO postgres;

--
-- Name: osobaszukaj; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE osobaszukaj AS (
	id_osoba integer,
	imie text,
	nazwisko text,
	pesel text
);


ALTER TYPE public.osobaszukaj OWNER TO postgres;

--
-- Name: parnierpom; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE parnierpom AS (
	id integer,
	walidacja text,
	nazwa text,
	dl_inf integer
);


ALTER TYPE public.parnierpom OWNER TO postgres;

--
-- Name: parniersekcja; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE parniersekcja AS (
	id_sekcja integer,
	nazwa_sekcja text,
	id integer[],
	walidacja text[],
	nazwa text[],
	dl_inf integer[]
);


ALTER TYPE public.parniersekcja OWNER TO postgres;

--
-- Name: pods_param_wypos; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE pods_param_wypos AS (
	id_trans_rodzaj integer,
	id_nier_rodzaj integer,
	parametr integer[],
	wyposazenie integer[]
);


ALTER TYPE public.pods_param_wypos OWNER TO postgres;

--
-- Name: pomieszczenianieruchomosc; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE pomieszczenianieruchomosc AS (
	id_pomieszczenie integer,
	nr_pomieszczenie integer,
	nazwa_pomieszczenie text,
	dane_id_parametr_pom integer[],
	dane_wartosc_parametr_pom integer[],
	dane_id_wyposazenie_pom integer[]
);


ALTER TYPE public.pomieszczenianieruchomosc OWNER TO postgres;

--
-- Name: pomieszczenieparamedycja; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE pomieszczenieparamedycja AS (
	id integer,
	wartosc text
);


ALTER TYPE public.pomieszczenieparamedycja OWNER TO postgres;

--
-- Name: pomprzynnier; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE pomprzynnier AS (
	id integer,
	nr_pomieszczenie integer,
	nazwa text
);


ALTER TYPE public.pomprzynnier OWNER TO postgres;

--
-- Name: reggeog; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE reggeog AS (
	id_region_geog integer,
	region text,
	rodzice text[]
);


ALTER TYPE public.reggeog OWNER TO postgres;

--
-- Name: rejestracja_centralka; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE rejestracja_centralka AS (
	id integer,
	telefon text,
	osoba text,
	id_status_dzwonienie integer,
	status_dzwonienie text,
	id_agent integer,
	agent text,
	czas_poczatek timestamp without time zone,
	czas_koniec timestamp without time zone
);


ALTER TYPE public.rejestracja_centralka OWNER TO postgres;

--
-- Name: slownik; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE slownik AS (
	id integer,
	nazwa text
);


ALTER TYPE public.slownik OWNER TO postgres;

--
-- Name: tlumjezyk; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE tlumjezyk AS (
	id_jezyk integer,
	nazwa text,
	nazwa_tag text[],
	tlumaczenie text[]
);


ALTER TYPE public.tlumjezyk OWNER TO postgres;

--
-- Name: trans_rodzaj_t; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE trans_rodzaj_t AS (
	id_trans integer,
	nazwa_trans character varying
);


ALTER TYPE public.trans_rodzaj_t OWNER TO postgres;

--
-- Name: transakcje; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE transakcje AS (
	id integer,
	nazwa text,
	oferta boolean
);


ALTER TYPE public.transakcje OWNER TO postgres;

--
-- Name: umowadane; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE umowadane AS (
	id_zapotrzebowanie integer,
	id_klient integer,
	id_osobowosc integer,
	osobowosc text,
	id_osoba integer,
	imie text,
	nazwisko text,
	nazwisko_rodowe text,
	dowod text,
	nr_dowod text,
	pesel text,
	telefon text,
	komorka text,
	kod text,
	miejscowosc text,
	ulica text,
	numer_dom text,
	numer_miesz text,
	data date,
	agent text,
	komorka_agent text,
	nazwa_firma text,
	nip text,
	regon text,
	krs text,
	kod_firma text,
	miejscowosc_firma text,
	ulica_firma text,
	numer_dom_firma text,
	numer_miesz_firma text
);


ALTER TYPE public.umowadane OWNER TO postgres;

--
-- Name: wypnierpom; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE wypnierpom AS (
	id integer,
	id_parent integer,
	wielokrotne boolean,
	nazwa text
);


ALTER TYPE public.wypnierpom OWNER TO postgres;

--
-- Name: wypniersekcja; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE wypniersekcja AS (
	id_sekcja integer,
	nazwa_sekcja text,
	id_parent integer[],
	id integer[],
	wielokrotne boolean[],
	nazwa text[]
);


ALTER TYPE public.wypniersekcja OWNER TO postgres;

--
-- Name: zapotrzebowaniedane; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE zapotrzebowaniedane AS (
	id_zapotrzebowanie integer,
	id_klient integer,
	data_otw_zlecenie date,
	cena text,
	powierzchnia text,
	powierzchnia_max text,
	liczba_pokoi integer,
	liczba_pokoi_max integer
);


ALTER TYPE public.zapotrzebowaniedane OWNER TO postgres;

--
-- Name: zapotrzebowanienieruchomosc; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE zapotrzebowanienieruchomosc AS (
	id_zapotrzebowanie integer,
	id_klient integer,
	id_nier_rodzaj integer[],
	agent text,
	data_otw_zlecenie date,
	data_zam_zlecenie date
);


ALTER TYPE public.zapotrzebowanienieruchomosc OWNER TO postgres;

--
-- Name: zapotrzebowanienieruchomoscwyppar; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE zapotrzebowanienieruchomoscwyppar AS (
	id_zapotrzebowanie_trans_rodzaj integer,
	dane_wyposazenie_zap integer[],
	dane_parametr_zap_min integer[],
	dane_parametr_zap_min_wartosc text[],
	dane_parametr_zap_max integer[],
	dane_parametr_zap_max_wartosc text[]
);


ALTER TYPE public.zapotrzebowanienieruchomoscwyppar OWNER TO postgres;

--
-- Name: agenciwpiskalendarz(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION agenciwpiskalendarz(kalendarz_id integer) RETURNS text
    AS $$
DECLARE
	result text;
	licznik integer;
	test integer;
	rec_temp record;
BEGIN
	select into test id_agent from agent_kalendarz where id_kalendarz = kalendarz_id;
	IF test is null THEN
		result := '_wszyscy';
	ELSE
		licznik := 0;
		result := '';
		FOR rec_temp in select nazwa_pot from agent where id in (select id_agent from agent_kalendarz where id_kalendarz = kalendarz_id) order by nazwa_pot asc LOOP
			IF licznik > 0 THEN
				result := result || ' + ';
			END IF;
			result := result || rec_temp.nazwa_pot;
			licznik := licznik + 1;
		END LOOP;
	END IF;
	RETURN result;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.agenciwpiskalendarz(kalendarz_id integer) OWNER TO postgres;

--
-- Name: agentwersjaoficjalna(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION agentwersjaoficjalna(jezyk_id integer) RETURNS SETOF slownik
    AS $$
DECLARE
	result slownik;
	licencja_t text;
	posrednik text;
	agent_pod_nadzorem text;
	temp record;
	nadz_licencja integer;
BEGIN
	select into licencja_t nazwa from tlumaczenie where id_jezyk = jezyk_id and nazwa_lang_tag = '_licencja:';
	select into posrednik nazwa from tlumaczenie where id_jezyk = jezyk_id and nazwa_lang_tag = '_posrednik';
	select into agent_pod_nadzorem nazwa from tlumaczenie where id_jezyk = jezyk_id and nazwa_lang_tag = '_agent_pod_nadzorem_licencji_nr:';

	FOR temp in select * from agent LOOP
		result.id := temp.id;
		IF temp.licencja is null THEN
			select into nadz_licencja licencja from agent where id = temp.nadzor;
			result.nazwa := agent_pod_nadzorem || ' ' || nadz_licencja || ' ' || temp.nazwa;
		ELSE
			result.nazwa := posrednik || ' ' || temp.nazwa || ' ' || licencja_t || ' ' || temp.licencja;
		END IF;
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.agentwersjaoficjalna(jezyk_id integer) OWNER TO postgres;

--
-- Name: aktdeaktoferta(integer, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION aktdeaktoferta(oferta_id integer, akt boolean) RETURNS boolean
    AS $$
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
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.aktdeaktoferta(oferta_id integer, akt boolean) OWNER TO postgres;

--
-- Name: aktualizujagent(integer, text, text, text, text, text, boolean, boolean, boolean, boolean, boolean, boolean, boolean, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION aktualizujagent(id_a integer, nazwa_t text, tel text, komorka_t text, fax_t text, email_t text, dod_upr boolean, ed_upr boolean, kas_upr boolean, druk_upr boolean, adm_klient_upr boolean, adm_dane_upr boolean, zmiana_upr_upr boolean, lic_num integer, agent_nad integer) RETURNS boolean
    AS $$
DECLARE
	nadz_agent integer;
BEGIN
	nadz_agent := agent_nad;
	IF lic_num is not null THEN
			nadz_agent := null;
		ELSE
			---agent_nad nie moze byc null w tej sytuacji, jesli jest przypisac na sztywno
			IF nadz_agent is null THEN
				nadz_agent := 1;
			END IF;
		END IF;
	BEGIN
		update agent set nazwa = nazwa_t, telefon = tel, komorka = komorka_t, fax = fax_t, email = email_t, dodawanie = dod_upr, licencja = lic_num, nadzor = nadz_agent, edycja = ed_upr, kasowanie = kas_upr, druk = druk_upr, adm_klient = adm_klient_upr, adm_dane = adm_dane_upr, zmiana_upr = zmiana_upr_upr where id = id_a;
		IF found THEN
			return true;
		ELSE
			return false;
		END IF;
	EXCEPTION WHEN not_null_violation THEN
		return false;
	END;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.aktualizujagent(id_a integer, nazwa_t text, tel text, komorka_t text, fax_t text, email_t text, dod_upr boolean, ed_upr boolean, kas_upr boolean, druk_upr boolean, adm_klient_upr boolean, adm_dane_upr boolean, zmiana_upr_upr boolean, lic_num integer, agent_nad integer) OWNER TO postgres;

--
-- Name: aktywujkonto(text, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION aktywujkonto(login_t text, aktywuj boolean) RETURNS boolean
    AS $$
DECLARE
	
BEGIN
	update agent set aktywnosc_konto = aktywuj where login = md5(login_t);
	IF found THEN
		return true;
	ELSE
		return false;
	END IF;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.aktywujkonto(login_t text, aktywuj boolean) OWNER TO postgres;

--
-- Name: boom(character varying, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION boom("delimiter" character varying, datatoexplode text) RETURNS text[]
    AS $$
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
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.boom("delimiter" character varying, datatoexplode text) OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: prowizja_zapotrzebowanie; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE prowizja_zapotrzebowanie (
    id integer NOT NULL,
    id_zapotrzebowanie integer NOT NULL,
    id_trans_rodzaj integer NOT NULL,
    prowizja_proc boolean,
    prowizja character varying(7) NOT NULL,
    id_sposob_finansowania integer,
    poszukiwane_dla text
);


ALTER TABLE public.prowizja_zapotrzebowanie OWNER TO postgres;

--
-- Name: trans_rodzaj; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE trans_rodzaj (
    id integer NOT NULL,
    nazwa character varying(30) NOT NULL,
    nazwa_zap character varying(30) NOT NULL
);


ALTER TABLE public.trans_rodzaj OWNER TO postgres;

--
-- Name: zapotrzebowanie_nier_rodzaj; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE zapotrzebowanie_nier_rodzaj (
    id integer NOT NULL,
    id_nier_rodzaj integer NOT NULL,
    id_zapotrzebowanie integer NOT NULL
);


ALTER TABLE public.zapotrzebowanie_nier_rodzaj OWNER TO postgres;

--
-- Name: zapotrzebowanie_trans_rodzaj; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE zapotrzebowanie_trans_rodzaj (
    id integer NOT NULL,
    id_zapotrzebowanie_nier_rodzaj integer NOT NULL,
    id_status integer NOT NULL,
    id_trans_rodzaj integer NOT NULL,
    cena character varying(15),
    pokaz boolean
);


ALTER TABLE public.zapotrzebowanie_trans_rodzaj OWNER TO postgres;

--
-- Name: prowizjenieuzupelnionezap; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW prowizjenieuzupelnionezap AS
    SELECT DISTINCT trans_rodzaj.id AS id_rodz_trans, zapotrzebowanie_nier_rodzaj.id_zapotrzebowanie, trans_rodzaj.nazwa_zap AS transakcja_rodzaj FROM ((zapotrzebowanie_nier_rodzaj JOIN zapotrzebowanie_trans_rodzaj ON ((zapotrzebowanie_nier_rodzaj.id = zapotrzebowanie_trans_rodzaj.id_zapotrzebowanie_nier_rodzaj))) JOIN trans_rodzaj ON ((zapotrzebowanie_trans_rodzaj.id_trans_rodzaj = trans_rodzaj.id))) WHERE (NOT (zapotrzebowanie_trans_rodzaj.id_trans_rodzaj IN (SELECT prowizja_zapotrzebowanie.id_trans_rodzaj FROM prowizja_zapotrzebowanie WHERE (prowizja_zapotrzebowanie.id_zapotrzebowanie = zapotrzebowanie_nier_rodzaj.id_zapotrzebowanie)))) ORDER BY trans_rodzaj.id, zapotrzebowanie_nier_rodzaj.id_zapotrzebowanie, trans_rodzaj.nazwa_zap;


ALTER TABLE public.prowizjenieuzupelnionezap OWNER TO postgres;

--
-- Name: brakujaceprowizje(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION brakujaceprowizje(zapotrzebowanie_id integer) RETURNS SETOF prowizjenieuzupelnionezap
    AS $$
DECLARE
	result ProwizjeNieUzupelnioneZap;
BEGIN
	FOR result IN select * from ProwizjeNieUzupelnioneZap where id_zapotrzebowanie = zapotrzebowanie_id LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.brakujaceprowizje(zapotrzebowanie_id integer) OWNER TO postgres;

--
-- Name: convtotag(character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION convtotag(textfc character varying) RETURNS text
    AS $$
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
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.convtotag(textfc character varying) OWNER TO postgres;

--
-- Name: daneslownik(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION daneslownik(nazwa_slow text) RETURNS SETOF slownik
    AS $$
DECLARE
	rec_slownik slownik;
	--rec_dane record;
BEGIN
	FOR rec_slownik IN EXECUTE 'select id, nazwa::text from ' || nazwa_slow || ' order by nazwa asc;' LOOP
		--rec_slownik.id := rec_dane.id;
		--rec_slownik.nazwa := rec_dane.nazwa;
		RETURN NEXT rec_slownik;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.daneslownik(nazwa_slow text) OWNER TO postgres;

--
-- Name: dodajadresosoba(integer, integer, text, text, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dodajadresosoba(osoba_id integer, region_id integer, kod text, ul_adr text, num_dom text, num_miesz text) RETURNS void
    AS $$
DECLARE
	test integer;
BEGIN
	IF region_id is not null THEN
		select into test id from osoba_adres where id = osoba_id;
		IF test is null THEN
			---insert
			insert into osoba_adres (id, kod_pocztowy, id_region_geog, ulica, numer_dom, numer_miesz) values (osoba_id, kod, region_id, ul_adr, num_dom, num_miesz);
		ELSE
			---update
			update osoba_adres set kod_pocztowy = kod, id_region_geog = region_id, ulica = ul_adr, numer_dom = num_dom, numer_miesz = num_miesz where id = osoba_id;
		END IF;
	END IF;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.dodajadresosoba(osoba_id integer, region_id integer, kod text, ul_adr text, num_dom text, num_miesz text) OWNER TO postgres;

--
-- Name: dodajdokosoba(integer, integer, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dodajdokosoba(osoba_id integer, dowod_tozsamosc_id integer, dowod_nr text) RETURNS boolean
    AS $$
DECLARE
	test integer;
BEGIN
	select into test id from osoba_dowod where id_osoba = osoba_id and id_rodzaj_dowod_tozsamosc = dowod_tozsamosc_id;
	IF test is not null THEN
		IF character_length(dowod_nr) > 0 THEN
			---update	
			update osoba_dowod set nazwa = dowod_nr where id = test;
			return true;
		ELSE
			--delete from osoba_dowod where id = test;
			return false;
		END IF;
	ELSE
		IF character_length(dowod_nr) > 0 THEN
			insert into osoba_dowod (id_osoba, id_rodzaj_dowod_tozsamosc, nazwa) values (osoba_id, dowod_tozsamosc_id, dowod_nr);
			return true;
		ELSE
			return false;
		END IF;
	END IF;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.dodajdokosoba(osoba_id integer, dowod_tozsamosc_id integer, dowod_nr text) OWNER TO postgres;

--
-- Name: dodajemail(integer, integer, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dodajemail(mail_id integer, osoba_id integer, adr_email text, opis_email text) RETURNS boolean
    AS $$
DECLARE
	test integer;
BEGIN
	---dodawanie nie aktualizacja
	IF mail_id is null THEN
		--sprawdzenie, czy juz nie ma takiego telefonu dla tej osoby
		select into test id from email_osoba where nazwa = adr_email and id_osoba = osoba_id;
		IF test is null THEN
			insert into email_osoba (id_osoba, nazwa, opis) values (osoba_id, adr_email, opis_email);
			return true;
		ELSE
			return false;
		END IF;
	ELSE
		select into test id from email_osoba where id != mail_id and nazwa = adr_email and id_osoba = osoba_id;
		IF test is null THEN
			update email_osoba set nazwa = adr_email, opis = opis_email where id = mail_id;
			IF found THEN
				return true;
			ELSE
				return false;
			END IF;
		ELSE
			return false;
		END IF;
	END IF;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.dodajemail(mail_id integer, osoba_id integer, adr_email text, opis_email text) OWNER TO postgres;

--
-- Name: dodajemailmedia(integer, integer, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dodajemailmedia(email_media_nieruchomosc_id integer, media_nieruchomosc_id integer, mail text, opis_t text) RETURNS boolean
    AS $$
DECLARE
	test integer;
BEGIN
	IF email_media_nieruchomosc_id is null THEN
		select into test id from email_media_nieruchomosc where id_media_nieruchomosc = media_nieruchomosc_id and nazwa = mail;
		IF test is null THEN
			insert into email_media_nieruchomosc (id_media_nieruchomosc, nazwa, opis) values (media_nieruchomosc_id, mail, opis_t);
			RETURN true;
		ELSE
			RETURN false;
		END IF;
	ELSE
		select into test id from email_media_nieruchomosc where id_media_nieruchomosc = media_nieruchomosc_id and nazwa = mail and id != email_media_nieruchomosc_id;
		IF test is null THEN
			update email_media_nieruchomosc set nazwa = mail, opis = opis_t where id = email_media_nieruchomosc_id;
			RETURN true;
		ELSE
			RETURN false;
		END IF;
	END IF;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.dodajemailmedia(email_media_nieruchomosc_id integer, media_nieruchomosc_id integer, mail text, opis_t text) OWNER TO postgres;

--
-- Name: dodajfilm(integer, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dodajfilm(nieruchomosc_id integer, rozszerzenie text) RETURNS text
    AS $$
DECLARE
	id_film integer;
	sep text;
	nazwa_film text;
BEGIN
	sep := '_';
	select into id_film nextval('film_id_seq');
	nazwa_film := nieruchomosc_id || sep || id_film || '.' || rozszerzenie;
	insert into film (id, id_nieruchomosc, nazwa) values (id_film, nieruchomosc_id, nazwa_film);
	return nazwa_film;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.dodajfilm(nieruchomosc_id integer, rozszerzenie text) OWNER TO postgres;

--
-- Name: dodajimie(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dodajimie(imie_txt text) RETURNS integer
    AS $$
DECLARE
	test integer;
BEGIN
	IF character_length(imie_txt) > 0 THEN
		select into test id from imie where lower(trim(nazwa)) = lower(trim(imie_txt));
		IF test is null THEN
			insert into imie (nazwa) values (imie_txt);
			select into test currval('imie_id_seq');			
		END IF;
		RETURN test;
	ELSE
		RETURN null; ---tu mozna zwrocic id pustego imienia
	END IF;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.dodajimie(imie_txt text) OWNER TO postgres;

--
-- Name: dodajklient(integer, integer, integer, text[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dodajklient(klient_id integer, osobowosc_id integer, agent_id integer, firma_dane text[]) RETURNS slownik
    AS $$
DECLARE
	osoba_prawna_id integer;
	test integer;
	result slownik;
BEGIN
	select into osoba_prawna_id id from osobowosc where nazwa = '_osobaprawna';
	IF klient_id is null THEN
		---potencjalny insert
		IF osobowosc_id = osoba_prawna_id THEN
			---sprawdzenie, czy firma nie jest w bazie
			IF character_length(firma_dane[2]) > 0 THEN
				select into test id_klient from dane_firma where nip = firma_dane[2];
			END IF;
			IF test is null THEN
				insert into klient (id_osobowosc, id_agent) values (osobowosc_id, agent_id);
				select into result.id currval('klient_id_seq');
				insert into dane_firma (id_klient, nazwa, nip, regon, krs, kod_pocztowy, id_region_geog, ulica, numer_dom, numer_miesz) values 
				(result.id, firma_dane[1], firma_dane[2], firma_dane[3], firma_dane[4], firma_dane[5], firma_dane[6]::integer, firma_dane[7], firma_dane[8], firma_dane[9]);
				return result;
			ELSE
				result.nazwa := '_osoba_prawna_istnieje_znaleziono_nip';
				return result;
			END IF;
		ELSE
			---dodanie
			insert into klient (id_osobowosc, id_agent) values (osobowosc_id, agent_id);
			select into result.id currval('klient_id_seq');
			return result;
		END IF;
	ELSE
		IF osobowosc_id = osoba_prawna_id THEN
			---sprawdzenie, czy firma nie jest w bazie
			IF character_length(firma_dane[2]) > 0 THEN
				select into test id_klient from dane_firma where nip = firma_dane[2] and id_klient != klient_id;
			END IF;
			IF test is null THEN
				update klient set id_osobowosc = osobowosc_id where id = klient_id;
				select into test id_klient from dane_firma where id_klient = klient_id;
				IF test is null THEN
					insert into dane_firma (id_klient, nazwa, nip, regon, krs, kod_pocztowy, id_region_geog, ulica, numer_dom, numer_miesz) values 
					(klient_id, firma_dane[1], firma_dane[2], firma_dane[3], firma_dane[4], firma_dane[5], firma_dane[6]::integer, firma_dane[7], firma_dane[8], firma_dane[9]);
				ELSE
					update dane_firma set nazwa = firma_dane[1], nip = firma_dane[2], regon = firma_dane[3], krs = firma_dane[4], kod_pocztowy = firma_dane[5], 
					id_region_geog = firma_dane[6]::integer, ulica = firma_dane[7], numer_dom = firma_dane[8], numer_miesz = firma_dane[9] where id_klient = klient_id;
				END IF;
				result.id := klient_id;
				return result;
			ELSE
				result.nazwa := '_osoba_prawna_istnieje_znaleziono_nip';
				return result;
			END IF;
		ELSE
			update klient set id_osobowosc = osobowosc_id where id = klient_id;
			delete from dane_firma where id_klient = klient_id;
			result.id := klient_id;
			return result;
		END IF;
	END IF;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.dodajklient(klient_id integer, osobowosc_id integer, agent_id integer, firma_dane text[]) OWNER TO postgres;

--
-- Name: dodajkomorka(integer, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dodajkomorka(osoba_id integer, nr_tel text, opis_tel text) RETURNS boolean
    AS $$
DECLARE
	test integer;
BEGIN
	select into test osoba_id from komorka where id_osoba = osoba_id;
	---dodawanie nie aktualizacja
	IF test is null THEN
		insert into komorka (id_osoba, nazwa, opis) values (osoba_id, nr_tel, opis_tel);
		return true;
	ELSE
		update komorka set nazwa = nr_tel, opis = opis_tel where id_osoba = osoba_id;
		IF found THEN
			return true;
		ELSE
			return false;
		END IF;
	END IF;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.dodajkomorka(osoba_id integer, nr_tel text, opis_tel text) OWNER TO postgres;

--
-- Name: dodajkontaktmedianier(integer, integer, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dodajkontaktmedianier(media_nieruchomosc_id integer, agent_id integer, koment text) RETURNS boolean
    AS $$
DECLARE
	akt_czas timestamp;
BEGIN
	select into akt_czas date_trunc('second', current_timestamp::timestamp);
	insert into kon_m_nieruchomosc (id_media_nieruchomosc, id_agent, komentarz, data) values (media_nieruchomosc_id, agent_id, koment, akt_czas);
	RETURN true;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.dodajkontaktmedianier(media_nieruchomosc_id integer, agent_id integer, koment text) OWNER TO postgres;

--
-- Name: dodajmedianieruchomosc(integer, integer, integer, integer, text, boolean, text, text, text, date, integer, text, integer, text, integer, text, text, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dodajmedianieruchomosc(nier_rodzaj_id integer, trans_rodzaj_id integer, region_id integer, status_id integer, ulica_lok text, is_oferent boolean, powierzchnia_t text, cena_t text, opis_n_t text, przyp_data date, medium_id integer, koment text, agent_id integer, nazwisko_os text, imie_os integer, telefon_os text, tel_opis text, email_os text, email_opis text) RETURNS slownik
    AS $$ ---update zrobic osobno
DECLARE
	result slownik;
	test record;
	media_new_id integer;
	akt_data date;
	akt_czas timestamp;
	osoba_id integer;
	tel text[];
	email text[];
BEGIN
	---poszukac osoby: to sprawdzenie ponizej powinno sie odbywac w dodajosoba, tu powinno byc wywolywane co najwyzej - jeszcze to dobrze przeanalizowac
	---odszukiwanie istniejacej osoby dziala poprawnie
	select into test * from SzukajOsoby(nazwisko_os, telefon_os, '');
	IF test is null THEN
		select into test * from SzukajOsoby(nazwisko_os, '', telefon_os);
	END IF;
	IF test is null THEN
		select into test * from SzukajOsoby('', telefon_os, '');
	END IF;
	IF test is null THEN
		select into test * from SzukajOsoby('', '', telefon_os);
	END IF;
	IF test.id_osoba is not null THEN
		osoba_id := test.id_osoba;
		result.nazwa := '_osoba_istnieje';
	ELSE
		IF character_length (nazwisko_os) > 0 THEN
			IF character_length (telefon_os) > 0 THEN
				tel[1] := telefon_os;
				tel[2] := tel_opis;
			END IF;
			IF character_length (email_os) > 0 THEN
				email[1] := email_os;
				email[2] := email_opis;
			END IF;
			---przynajmniej na tym etapie ta proc nie stwierdzi tu na pewno ze ktos juz jest w bazie :)
			select into result * from DodajOsoba (null, imie_os, nazwisko_os, null, null, null, null, null, agent_id, null, null, tel, null, email);
			osoba_id := result.id;
		END IF;
	END IF;
	select into akt_data current_date;
	---select date_trunc('second', current_timestamp::timestamp);
	select into akt_czas date_trunc('second', current_timestamp::timestamp);
	---pomyslec pozniej moze o sprawdzeniu, czy czegos podobnego nie ma
	---ewentualny debug czy ni ma nulla :P
	insert into media_nieruchomosc (id_nier_rodzaj, id_trans_rodzaj, id_region_geog, id_status, id_agent, data, ulica, oferent, powierzchnia, cena, opis, przypomnienie, id_media_reklama, id_osoba) 
	values (nier_rodzaj_id, trans_rodzaj_id, region_id, status_id, agent_id, akt_data, ulica_lok, is_oferent, powierzchnia_t, cena_t, opis_n_t, przyp_data, medium_id, osoba_id);

	select into media_new_id currval('media_nieruchomosc_id_seq');
	result.id := media_new_id;
	---pomyslec o osobnej proc, bedzie tu wiecej ladowania byc moze
	insert into reklama_nieruchomosc_m (id_media_nieruchomosc, id_media_reklama, data) values (media_new_id, medium_id, akt_data);
	IF character_length (koment) > 0 THEN
		insert into kon_m_nieruchomosc (id_media_nieruchomosc, id_agent, komentarz, data) values (media_new_id, agent_id, koment, akt_czas);
	END IF;
	IF character_length (telefon_os) > 0 THEN
		---zrobic ponizsze z procedury
		---insert into telefon_media_nieruchomosc (id_media_nieruchomosc, nazwa, opis) values (media_new_id, telefon_os, tel_opis);
		perform DodajTelefonMedia (null, media_new_id, telefon_os, tel_opis, true);
	END IF;
	IF character_length (email_os) > 0 THEN
		--insert into email_media_nieruchomosc (id_media_nieruchomosc, nazwa, opis) values (media_new_id, email_os, email_opis);
		perform DodajEmailMedia (null, media_new_id, email_os, email_opis);
	END IF;
	RETURN result;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.dodajmedianieruchomosc(nier_rodzaj_id integer, trans_rodzaj_id integer, region_id integer, status_id integer, ulica_lok text, is_oferent boolean, powierzchnia_t text, cena_t text, opis_n_t text, przyp_data date, medium_id integer, koment text, agent_id integer, nazwisko_os text, imie_os integer, telefon_os text, tel_opis text, email_os text, email_opis text) OWNER TO postgres;

--
-- Name: dodajmedianieruchomoscos(integer, integer, integer, integer, text, boolean, text, text, text, date, text, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dodajmedianieruchomoscos(nier_rodzaj_id integer, trans_rodzaj_id integer, region_id integer, status_id integer, ulica_lok text, is_oferent boolean, powierzchnia_t text, cena_t text, opis_n_t text, przyp_data date, koment text, agent_id integer, osoba_id integer) RETURNS slownik
    AS $$ ---slownik, gdyz wystepuje koniecznosc podania id inserta w przypadku wykorzystania w innej proc
DECLARE
	akt_data date;
	akt_czas timestamp;
	result slownik;
BEGIN
	---wyczarowac medium - biuro jest zrodlem info
	select into akt_data current_date;
	select into akt_czas date_trunc('second', current_timestamp::timestamp);
	insert into media_nieruchomosc (id_nier_rodzaj, id_trans_rodzaj, id_region_geog, id_status, id_agent, data, ulica, oferent, powierzchnia, cena, opis, przypomnienie, id_media_reklama, id_osoba) values 
	(nier_rodzaj_id, trans_rodzaj_id, region_id, status_id, agent_id, akt_data, ulica_lok, is_oferent, powierzchnia_t, cena_t, opis_n_t, przyp_data, (select id from media_reklama where nazwa = 'biuro'), 
	osoba_id);
	select into result.id currval('media_nieruchomosc_id_seq');
	IF character_length (koment) > 0 THEN
		insert into kon_m_nieruchomosc (id_media_nieruchomosc, id_agent, komentarz, data) values (result.id, agent_id, koment, akt_czas);
	END IF;
	insert into telefon_media_nieruchomosc (id_media_nieruchomosc, nazwa, opis) select result.id, nazwa, opis from telefon where id_osoba = osoba_id;

	RETURN result;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.dodajmedianieruchomoscos(nier_rodzaj_id integer, trans_rodzaj_id integer, region_id integer, status_id integer, ulica_lok text, is_oferent boolean, powierzchnia_t text, cena_t text, opis_n_t text, przyp_data date, koment text, agent_id integer, osoba_id integer) OWNER TO postgres;

--
-- Name: dodajnierzapotrzebowanie(integer, integer[], boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dodajnierzapotrzebowanie(zapotrzebowanie_id integer, nier_rodzaj_id integer[], opupdate boolean) RETURNS void
    AS $$
DECLARE
	licznik integer;
	test integer;
BEGIN
	licznik := 1;
	IF opUpdate = false THEN
		WHILE nier_rodzaj_id[licznik] is not null LOOP
			insert into zapotrzebowanie_nier_rodzaj (id_nier_rodzaj, id_zapotrzebowanie) values (nier_rodzaj_id[licznik], zapotrzebowanie_id);
			licznik := licznik + 1;
		END LOOP;
	ELSE
		WHILE nier_rodzaj_id[licznik] is not null LOOP
			select into test id from zapotrzebowanie_nier_rodzaj where id_zapotrzebowanie = zapotrzebowanie_id and id_nier_rodzaj = nier_rodzaj_id[licznik];
			IF test is null THEN
				insert into zapotrzebowanie_nier_rodzaj (id_nier_rodzaj, id_zapotrzebowanie) values (nier_rodzaj_id[licznik], zapotrzebowanie_id);
			END IF;
			licznik := licznik + 1;
		END LOOP;
	END IF;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.dodajnierzapotrzebowanie(zapotrzebowanie_id integer, nier_rodzaj_id integer[], opupdate boolean) OWNER TO postgres;

--
-- Name: dodajnotatkaklient(integer, integer, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dodajnotatkaklient(klient_id integer, agent_id integer, tresc_t text) RETURNS boolean
    AS $$
DECLARE
	akt_data timestamp;
BEGIN
	select into akt_data date_trunc('second', current_timestamp::timestamp);
	insert into ustalenia (id_klient, id_agent, data, tresc) values (klient_id, agent_id, akt_data, tresc_t);
	return true;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.dodajnotatkaklient(klient_id integer, agent_id integer, tresc_t text) OWNER TO postgres;

--
-- Name: dodajoferta(text[], integer, integer, integer, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dodajoferta(kol_tab text[], nier_id integer, klient_id integer, num_of integer, nazwa_tab text) RETURNS void
    AS $$
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
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.dodajoferta(kol_tab text[], nier_id integer, klient_id integer, num_of integer, nazwa_tab text) OWNER TO postgres;

--
-- Name: dodajoferta(integer, integer, integer, date, date, text, integer, boolean, text, boolean, boolean, integer, boolean, integer, integer, integer, integer, text, text, text, integer, boolean, boolean, integer, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dodajoferta(oferta_id integer, rodz_trans_id integer, status_id integer, otw_zlec_data date, zam_zlec_data date, cena_t text, priorytet_id integer, prow_proc boolean, prowizja_t text, wyl boolean, pokaz_t boolean, czas_przek integer, przek_od_otw boolean, nier_rodzaj_id integer, nier_szcz_id integer, klient_id integer, region_id integer, ulica_t text, ulica_net_t text, kod_t text, agent_id integer, rynek boolean, klucz_b boolean, osoba_id integer, podpis_cena boolean) RETURNS dodanieoferta
    AS $$
DECLARE
	akt_data date;
	akt_czas timestamp;
	new_nier_id integer;
	cena_stat_akt record;
	new_ids DodanieOferta;
	osoba_sw_dod integer;
BEGIN
	select into akt_data current_date;
	select into akt_czas date_trunc('second', current_timestamp::timestamp);
	IF oferta_id is null THEN
		---insert
		--BEGIN
			---pomyslec tu o cenie, w zmianie ceny cos powinno byc przy 1 dodaniu, zeby 1 zmiana generowala juz info o 2 roznych cenach
			insert into nieruchomosc (id_nier_rodzaj, id_rodz_nier_szcz, id_klient, id_region_geog, ulica_net, ulica, kod, id_agent, data, rynek_pierw, klucz) values 
			(nier_rodzaj_id, nier_szcz_id, klient_id, region_id, ulica_net_t, ulica_t, kod_t, agent_id, akt_data, rynek, klucz_b);
			select into new_nier_id currval('nieruchomosc_id_seq');
			insert into oferta (id_rodz_trans, id_nieruchomosc, id_status, data, data_otw_zlecenie, data_zam_zlecenie, cena, prowizja_proc, prowizja, wylacznosc, pokaz, czas_przekazania, przek_od_otwarcia, id_priorytet_reklama) 
			values (rodz_trans_id, new_nier_id, status_id, akt_data, otw_zlec_data, zam_zlec_data, cena_t, prow_proc, prowizja_t, wyl, pokaz_t, czas_przek, przek_od_otw, priorytet_id);
			select into new_ids.id_oferta currval('oferta_id_seq');
			--wytrzasnac id osoby
			--select into osoba_sw_dod id_osoba from osoba_oferta where id_oferta = ;
			insert into cena (id_oferta, id_osoba, id_agent, cena, data, podpis) values (new_ids.id_oferta, osoba_id, agent_id, cena_t, akt_czas, true);
			select into new_ids.id_nieruchomosc currval('nieruchomosc_id_seq');
			--poprawic formularz i odpalic :), dodac tez do osoba oferta
			--insert into cena (id_oferta, id_osoba, id_agent, cena, data, podpis) values (new_ids.id_oferta, osoba_id, agent_id, cena_t, akt_data, true);
			RETURN new_ids;
		--EXCEPTION WHEN not_null_violation THEN
			RETURN null;
		--END;
	ELSE
		select into cena_stat_akt cena::float, id_status from oferta where id = oferta_id;
		IF cena_stat_akt.cena != cena_t::float THEN
			insert into cena (id_oferta, id_osoba, id_agent, cena, data, podpis) values (oferta_id, osoba_id, agent_id, cena_t, akt_czas, podpis_cena);
		END IF;
		IF cena_stat_akt.id_status != status_id THEN
			insert into zmiana_status (id_oferta, id_status, id_agent, data) values (oferta_id, status_id, agent_id, akt_czas);
		END IF;
		new_ids.id_oferta := oferta_id;
		select into new_ids.id_nieruchomosc id_nieruchomosc from oferta where id = oferta_id;
		BEGIN
			update nieruchomosc set id_rodz_nier_szcz = nier_szcz_id, id_region_geog = region_id, ulica_net = ulica_net_t,
			ulica = ulica_t, kod = kod_t, rynek_pierw = rynek, klucz = klucz_b where id = new_ids.id_nieruchomosc;
			---select into new_nier_id currval('nieruchomosc_id_seq');
			update oferta set id_status = status_id, id_rodz_trans = rodz_trans_id, data_zam_zlecenie = zam_zlec_data, id_priorytet_reklama = priorytet_id, 
			cena = cena_t, prowizja_proc = prow_proc, prowizja = prowizja_t, wylacznosc = wyl, czas_przekazania = czas_przek, przek_od_otwarcia = przek_od_otw where id = oferta_id;
----pokaz = pokaz_t, 
----przy update tutaj nie moze byc wplywu na pokaz w sieci bo to bedzie na dole
			RETURN new_ids;
		EXCEPTION WHEN not_null_violation THEN
			RETURN null;
		END;
	END IF;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.dodajoferta(oferta_id integer, rodz_trans_id integer, status_id integer, otw_zlec_data date, zam_zlec_data date, cena_t text, priorytet_id integer, prow_proc boolean, prowizja_t text, wyl boolean, pokaz_t boolean, czas_przek integer, przek_od_otw boolean, nier_rodzaj_id integer, nier_szcz_id integer, klient_id integer, region_id integer, ulica_t text, ulica_net_t text, kod_t text, agent_id integer, rynek boolean, klucz_b boolean, osoba_id integer, podpis_cena boolean) OWNER TO postgres;

--
-- Name: dodajogladanie(integer, integer, integer, date, integer, integer, integer[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dodajogladanie(oferta_id integer, zapotrzebowanie_id integer, agent_id integer, data_ogl date, godzina_id integer, minuta_id integer, osoby integer[]) RETURNS boolean
    AS $$ ---pytanie czy dawac date, i co z tym agentem, czy na pewno ma to sens
DECLARE
	test integer;
	akt_data timestamp;
	lista_new_id integer;
	licznik integer;
BEGIN
	select into akt_data date_trunc('second', current_timestamp::timestamp);
	select into test id from lista_wsk_adr where id_oferta = oferta_id and id_zapotrzebowanie = zapotrzebowanie_id;
	IF test is not null THEN
		return false;
	ELSE ---klient z zapotrzebowania jako ogl ma byc dodany
		insert into lista_wsk_adr (id_oferta, id_zapotrzebowanie, id_klient, id_agent, data, ogladanie_data, ogladanie_godzina, ogladanie_minuta) values 
		(oferta_id, zapotrzebowanie_id, (select id_klient from zapotrzebowanie where id = zapotrzebowanie_id), agent_id, akt_data, data_ogl, godzina_id, minuta_id);
		select into lista_new_id currval('lista_wsk_adr_id_seq');
		IF osoby is not null THEN
			licznik := 1;
			WHILE osoby[licznik] is not null LOOP
				---insert into osoba_lista_wsk_adr (id_lista_wsk_adr, id_osoba) values (lista_new_id, osoby[licznik]);
				perform DodajOsobaOgladanie(lista_new_id, osoby[licznik]);
				licznik := licznik + 1;
			END LOOP;
		END IF;
		return true;
	END IF;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.dodajogladanie(oferta_id integer, zapotrzebowanie_id integer, agent_id integer, data_ogl date, godzina_id integer, minuta_id integer, osoby integer[]) OWNER TO postgres;

--
-- Name: dodajopisnieruchomosc(integer, integer, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dodajopisnieruchomosc(nieruchomosc_id integer, agent_id integer, notatka text) RETURNS boolean
    AS $$
DECLARE
	akt_data timestamp;
BEGIN
	select into akt_data date_trunc('second', current_timestamp::timestamp);
	---insert
	insert into opis_nieruchomosc (id_nieruchomosc, id_agent, data, tresc) values (nieruchomosc_id, agent_id, akt_data, notatka);
	return true;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.dodajopisnieruchomosc(nieruchomosc_id integer, agent_id integer, notatka text) OWNER TO postgres;

--
-- Name: dodajopisoferta(integer, integer, integer, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dodajopisoferta(opis_id integer, oferta_id integer, jezyk_id integer, tresc text) RETURNS boolean
    AS $$
DECLARE
	test integer;
BEGIN
	IF opis_id is null THEN
		---insert
		select into test id from opis where id_oferta = oferta_id and id_jezyk = jezyk_id;
		IF test is not null THEN
			return false;
		ELSE
			insert into opis (id_oferta, id_jezyk, wartosc) values (oferta_id, jezyk_id, tresc);
			return true;
		END IF;
	ELSE
		---update
		update opis set wartosc = tresc where id = opis_id;
		IF found THEN
			return true;
		ELSE
			return false;
		END IF;
	END IF;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.dodajopisoferta(opis_id integer, oferta_id integer, jezyk_id integer, tresc text) OWNER TO postgres;

--
-- Name: dodajopisposzzapotrzebowanie(integer, integer, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dodajopisposzzapotrzebowanie(zapotrzebowanie_trans_rodzaj_id integer, agent_id integer, notatka text) RETURNS boolean
    AS $$
DECLARE
	akt_data timestamp;
BEGIN
	select into akt_data date_trunc('second', current_timestamp::timestamp);
	---insert
	insert into opis_posz_zapotrzebowanie (id_zapotrzebowanie_trans_rodzaj, id_agent, data, wartosc) values (zapotrzebowanie_trans_rodzaj_id, agent_id, akt_data, notatka);
	return true;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.dodajopisposzzapotrzebowanie(zapotrzebowanie_trans_rodzaj_id integer, agent_id integer, notatka text) OWNER TO postgres;

--
-- Name: dodajopiszapotrzebowanie(integer, integer, text, integer, boolean, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dodajopiszapotrzebowanie(zapotrzebowanie_id integer, agent_id integer, notatka text, oferta_id integer, zainter_b boolean, cena_of text) RETURNS boolean
    AS $$
DECLARE
	akt_data timestamp;
BEGIN
	select into akt_data date_trunc('second', current_timestamp::timestamp);
	---insert
	insert into opis_wew_zapotrzebowanie (id_zapotrzebowanie, id_agent, data, tresc, id_oferta, zainteresowany, cena) values (zapotrzebowanie_id, agent_id, akt_data, notatka, oferta_id, zainter_b, cena_of);
	IF oferta_id is not null THEN
		update opis_wew_zapotrzebowanie set zainteresowany = zainter_b where id_oferta = oferta_id;
	END IF;
	return true;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.dodajopiszapotrzebowanie(zapotrzebowanie_id integer, agent_id integer, notatka text, oferta_id integer, zainter_b boolean, cena_of text) OWNER TO postgres;

--
-- Name: dodajopiszapotrzebowanietrrodz(integer, integer, integer, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dodajopiszapotrzebowanietrrodz(opis_id integer, zapotrzebowanie_trans_rodzaj_id integer, jezyk_id integer, tresc text) RETURNS boolean
    AS $$
DECLARE
	test integer;
BEGIN
	IF opis_id is null THEN
		---insert
		select into test id from opis_zapotrzebowanie where id_zapotrzebowanie_trans_rodzaj = zapotrzebowanie_trans_rodzaj_id and id_jezyk = jezyk_id;
		IF test is not null THEN
			return false;
		ELSE
			insert into opis_zapotrzebowanie (id_zapotrzebowanie_trans_rodzaj, id_jezyk, wartosc) values (zapotrzebowanie_trans_rodzaj_id, jezyk_id, tresc);
			return true;
		END IF;
	ELSE
		---update
		update opis_zapotrzebowanie set wartosc = tresc where id = opis_id;
		IF found THEN
			return true;
		ELSE
			return false;
		END IF;
	END IF;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.dodajopiszapotrzebowanietrrodz(opis_id integer, zapotrzebowanie_trans_rodzaj_id integer, jezyk_id integer, tresc text) OWNER TO postgres;

--
-- Name: dodajosoba(integer, integer, text, text, text, integer, text, integer, integer, text[], integer, text[], text[], text[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dodajosoba(osoba_id integer, imie_id integer, nazw text, nazw_rod text, pesel_t text, dow_toz_id integer, dowod_nr text, region_geog_id integer, agent_id integer, dane_adres text[], klient_id integer, tel text[], tel_kom text[], adres_email text[]) RETURNS slownik
    AS $$
DECLARE
	osoba_new slownik;
	osoba_new_id integer;
	test integer;
BEGIN
	test := null;
	IF osoba_id is not null THEN
		---update
		IF character_length(pesel_t) > 0 THEN
			select into test id from osoba where pesel = pesel_t and id != osoba_id;
		END IF;
		IF test is null THEN
			update osoba set id_imie = imie_id, nazwisko = nazw, nazwisko_rodowe = nazw_rod, pesel = pesel_t  where id = osoba_id;
			---przy aktualizacji dodawanie do klienta niemozliwe
			IF found THEN
				IF region_geog_id is not null THEN
					perform DodajAdresOsoba(osoba_id, region_geog_id, dane_adres[1], dane_adres[2], dane_adres[3], dane_adres[4]);
				END IF;
			END IF;
			osoba_new.id := osoba_id;
			return osoba_new;
		ELSE
			osoba_new.nazwa := '_osoba_istnieje_znaleziono_pesel';
			return osoba_new;
		END IF;
	ELSE
		---insert
		--begin
		IF character_length(pesel_t) > 0 THEN
			select into test id from osoba where pesel = pesel_t;
		END IF;
		IF test is null THEN
			insert into osoba (id_imie, nazwisko, nazwisko_rodowe, pesel, id_agent) values (imie_id, nazw, nazw_rod, pesel_t, agent_id);
			select into osoba_new_id currval('osoba_id_seq');
			IF dow_toz_id is not null THEN
				perform DodajDokOsoba (osoba_new_id, dow_toz_id, dowod_nr);
			END IF;
			IF tel[1] is not null or character_length(tel[1]) > 0 THEN ---??
				perform DodajTelefon (null, osoba_new_id, tel[1], tel[2], true);
			END IF;
			IF tel[3] is not null or character_length(tel[3]) > 0 THEN ---??
				perform DodajTelefon (null, osoba_new_id, tel[3], tel[4], true);
			END IF;
			IF tel[5] is not null or character_length(tel[5]) > 0 THEN ---??
				perform DodajTelefon (null, osoba_new_id, tel[5], tel[6], true);
			END IF;
			IF tel_kom[1] is not null or character_length(tel_kom[1]) > 0 THEN ---??
				perform DodajKomorka (osoba_new_id, tel_kom[1], tel_kom[2]);
			END IF;
			IF adres_email[1] is not null or character_length(adres_email[1]) > 0 THEN ---??
				perform DodajEmail (null, osoba_new_id, adres_email[1], adres_email[2]);
			END IF;
			IF klient_id is not null THEN
				---dodanie osoby do klienta
				perform DodajOsobaKlient(klient_id, osoba_new_id);
			END IF;
			IF region_geog_id is not null THEN
				perform DodajAdresOsoba(osoba_new_id, region_geog_id, dane_adres[1], dane_adres[2], dane_adres[3], dane_adres[4]);
			END IF;	
			osoba_new.id := osoba_new_id;
			return osoba_new;
		--exception when not_null_violation then
		ELSE
			osoba_new.nazwa := '_osoba_istnieje_znaleziono_pesel';
			return osoba_new;
		END IF;
		--end;
	END IF;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.dodajosoba(osoba_id integer, imie_id integer, nazw text, nazw_rod text, pesel_t text, dow_toz_id integer, dowod_nr text, region_geog_id integer, agent_id integer, dane_adres text[], klient_id integer, tel text[], tel_kom text[], adres_email text[]) OWNER TO postgres;

--
-- Name: dodajosobaklient(integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dodajosobaklient(klient_id integer, osoba_id integer) RETURNS boolean
    AS $$
DECLARE
	test integer;
BEGIN
	select into test id from osoba_klient where id_klient = klient_id and id_osoba = osoba_id;
	IF test is null THEN
		---ewentualnie jesli sie zdarzy tutaj jakis error blok z exception dodac
		insert into osoba_klient (id_klient, id_osoba) values (klient_id, osoba_id);
		RETURN true;
	ELSE
		RETURN false;
	END IF;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.dodajosobaklient(klient_id integer, osoba_id integer) OWNER TO postgres;

--
-- Name: dodajosobaoferta(integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dodajosobaoferta(osoba_id integer, oferta_id integer) RETURNS boolean
    AS $$
DECLARE
	test integer;
BEGIN
	select into test id from osoba_oferta where id_oferta = oferta_id and id_osoba = osoba_id;
	IF test is null THEN
		insert into osoba_oferta (id_oferta, id_osoba) values (oferta_id, osoba_id);
		return true;
	ELSE
		return false;
	END IF;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.dodajosobaoferta(osoba_id integer, oferta_id integer) OWNER TO postgres;

--
-- Name: dodajosobaogladanie(integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dodajosobaogladanie(ogladanie_id integer, osoba_id integer) RETURNS boolean
    AS $$
DECLARE
	test integer;
BEGIN
	select into test id from osoba_lista_wsk_adr where id_lista_wsk_adr = ogladanie_id and id_osoba = osoba_id;
	IF test is not null THEN
		return false;
	ELSE
		insert into osoba_lista_wsk_adr (id_lista_wsk_adr, id_osoba) values (ogladanie_id, osoba_id);
		return true;
	END IF;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.dodajosobaogladanie(ogladanie_id integer, osoba_id integer) OWNER TO postgres;

--
-- Name: dodajosobazapotrzebowanie(integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dodajosobazapotrzebowanie(zapotrzebowanie_id integer, osoba_id integer) RETURNS boolean
    AS $$
DECLARE
	test integer;
BEGIN
	select into test id from osoba_zapotrzebowanie where id_zapotrzebowanie = zapotrzebowanie_id and id_osoba = osoba_id;
	IF test is not null THEN
		return false;
	ELSE
		insert into osoba_zapotrzebowanie (id_zapotrzebowanie, id_osoba) values (zapotrzebowanie_id, osoba_id);
		return true;
	END IF;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.dodajosobazapotrzebowanie(zapotrzebowanie_id integer, osoba_id integer) OWNER TO postgres;

--
-- Name: dodajparametrnier(boolean, integer, integer, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dodajparametrnier(op_dodawania boolean, nieruchomosc_id integer, parametr_id integer, informacja text) RETURNS boolean
    AS $$
DECLARE
	test integer;
BEGIN
	IF op_dodawania = true THEN
		---insert lub update
		select into test id from dane_txt_nier where id_nieruchomosc = nieruchomosc_id and id_parametr_nier = parametr_id;
		IF test is not null THEN
			update dane_txt_nier set wartosc = informacja where id_nieruchomosc = nieruchomosc_id and id_parametr_nier = parametr_id;
			IF found THEN
				RETURN true;
			ELSE
				RETURN false;
			END IF;
		ELSE
			insert into dane_txt_nier (id_nieruchomosc, id_parametr_nier, wartosc) values (nieruchomosc_id, parametr_id, informacja);
			RETURN true;
		END IF;
	ELSE
		---delete
		delete from dane_txt_nier where id_nieruchomosc = nieruchomosc_id and id_parametr_nier = parametr_id;
		IF found THEN
			RETURN true;
		ELSE
			RETURN false;
		END IF;
	END IF;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.dodajparametrnier(op_dodawania boolean, nieruchomosc_id integer, parametr_id integer, informacja text) OWNER TO postgres;

--
-- Name: dodajparametrpom(boolean, integer, integer, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dodajparametrpom(op_dodawania boolean, pomieszczenie_id integer, parametr_id integer, informacja text) RETURNS boolean
    AS $$
DECLARE
	test integer;
BEGIN
	IF op_dodawania = true THEN
		---insert lub update
		select into test id from dane_txt_pom where id_pomieszczenie_przyn_nier = pomieszczenie_id and id_parametr_pom = parametr_id;
		IF test is not null THEN
			update dane_txt_pom set wartosc = informacja where id_pomieszczenie_przyn_nier = pomieszczenie_id and id_parametr_pom = parametr_id;
		ELSE
			insert into dane_txt_pom (id_pomieszczenie_przyn_nier, id_parametr_pom, wartosc) values (pomieszczenie_id, parametr_id, informacja);
		END IF;
		RETURN true;
	ELSE
		---delete
		delete from dane_txt_pom where id_pomieszczenie_przyn_nier = pomieszczenie_id and id_parametr_pom = parametr_id;
		IF found THEN
			RETURN true;
		ELSE
			RETURN false;
		END IF;
	END IF;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.dodajparametrpom(op_dodawania boolean, pomieszczenie_id integer, parametr_id integer, informacja text) OWNER TO postgres;

--
-- Name: dodajparametrzap(boolean, boolean, integer, integer, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dodajparametrzap(op_dodawania boolean, min_b boolean, zapotrzebowanie_trans_rodzaj_id integer, parametr_id integer, informacja text) RETURNS boolean
    AS $$
DECLARE
	test integer;
BEGIN
	IF min_b = true THEN
		IF op_dodawania = true THEN
			---insert lub update
			select into test id from dane_txt_zap_min where id_zapotrzebowanie_trans_rodzaj = zapotrzebowanie_trans_rodzaj_id and 
			id_parametr_nier = parametr_id;
			IF test is not null THEN
				update dane_txt_zap_min set wartosc = informacja where id_zapotrzebowanie_trans_rodzaj = zapotrzebowanie_trans_rodzaj_id and 
				id_parametr_nier = parametr_id;
				IF found THEN
					RETURN true;
				ELSE
					RETURN false;
				END IF;
			ELSE
				insert into dane_txt_zap_min (id_zapotrzebowanie_trans_rodzaj, id_parametr_nier, wartosc) values (zapotrzebowanie_trans_rodzaj_id, parametr_id, informacja);
				RETURN true;
			END IF;
		ELSE
			---delete
			delete from dane_txt_zap_min where id_zapotrzebowanie_trans_rodzaj = zapotrzebowanie_trans_rodzaj_id and id_parametr_nier = parametr_id;
			IF found THEN
				RETURN true;
			ELSE
				RETURN false;
			END IF;
		END IF;
	ELSE
		IF op_dodawania = true THEN
			---insert lub update
			select into test id from dane_txt_zap_max where id_zapotrzebowanie_trans_rodzaj = zapotrzebowanie_trans_rodzaj_id and 
			id_parametr_nier = parametr_id;
			IF test is not null THEN
				update dane_txt_zap_max set wartosc = informacja where id_zapotrzebowanie_trans_rodzaj = zapotrzebowanie_trans_rodzaj_id and 
				id_parametr_nier = parametr_id;
				IF found THEN
					RETURN true;
				ELSE
					RETURN false;
				END IF;
			ELSE
				insert into dane_txt_zap_max (id_zapotrzebowanie_trans_rodzaj, id_parametr_nier, wartosc) values (zapotrzebowanie_trans_rodzaj_id, parametr_id, informacja);
				RETURN true;
			END IF;
		ELSE
			---delete
			delete from dane_txt_zap_max where id_zapotrzebowanie_trans_rodzaj = zapotrzebowanie_trans_rodzaj_id and id_parametr_nier = parametr_id;
			IF found THEN
				RETURN true;
			ELSE
				RETURN false;
			END IF;
		END IF;
	END IF;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.dodajparametrzap(op_dodawania boolean, min_b boolean, zapotrzebowanie_trans_rodzaj_id integer, parametr_id integer, informacja text) OWNER TO postgres;

--
-- Name: dodajpomieszczenienier(integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dodajpomieszczenienier(nieruchomosc_id integer, pomieszczenie_id integer) RETURNS integer
    AS $$
DECLARE
	pom_nr integer;
	new_pom_id integer;
	test integer;
BEGIN
	---sprawdzic czy takie pomieszczenie dla tej nieruchomosci moze byc :P
	select into test id from pomieszczenie_nier where id_pomieszczenie = pomieszczenie_id and id_nier_rodzaj = 
	(select id_nier_rodzaj from nieruchomosc where id = nieruchomosc_id);
	IF test is not null THEN
		select into pom_nr count(id) from pomieszczenie_przyn_nier where id_nieruchomosc = nieruchomosc_id and id_pomieszczenie = pomieszczenie_id;
		pom_nr := pom_nr + 1;
		insert into pomieszczenie_przyn_nier (id_nieruchomosc, id_pomieszczenie, nr_pomieszczenia) values (nieruchomosc_id, pomieszczenie_id, pom_nr);
		select into new_pom_id currval('pomieszczenie_przyn_nier_id_seq');
		return new_pom_id;
	ELSE
		return null;
	END IF;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.dodajpomieszczenienier(nieruchomosc_id integer, pomieszczenie_id integer) OWNER TO postgres;

--
-- Name: dodajprowdlatrans(integer, integer, integer, text, boolean, integer, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dodajprowdlatrans(prow_zap_id integer, zapotrzebowanie_id integer, trans_id integer, prow text, prow_proc boolean, spos_fin_id integer, posz_dla text) RETURNS boolean
    AS $$
DECLARE
	test integer;
BEGIN
	IF prow::float > 0 THEN
		IF prow_zap_id is null THEN
			---insert, najpierw test
			select into test id from prowizja_zapotrzebowanie where id_zapotrzebowanie = zapotrzebowanie_id and id_trans_rodzaj = trans_id;
			IF test is not null THEN
				RETURN false;
			ELSE
				insert into prowizja_zapotrzebowanie (id_zapotrzebowanie, id_trans_rodzaj, prowizja_proc, prowizja, id_sposob_finansowania, poszukiwane_dla) values 
				(zapotrzebowanie_id, trans_id, prow_proc, prow, spos_fin_id, posz_dla);
				RETURN true;
			END IF;
		ELSE
			update prowizja_zapotrzebowanie set prowizja_proc = prow_proc, prowizja = prow, id_sposob_finansowania = spos_fin_id, poszukiwane_dla = posz_dla where id = prow_zap_id;
			IF found THEN
				return true;
			ELSE
				return false;
			END IF;
		END IF;
	ELSE
		return false;
	END IF;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.dodajprowdlatrans(prow_zap_id integer, zapotrzebowanie_id integer, trans_id integer, prow text, prow_proc boolean, spos_fin_id integer, posz_dla text) OWNER TO postgres;

--
-- Name: dodajreggeogzap(integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dodajreggeogzap(zapotrzebowanie_trans_rodzaj_id integer, reg_id integer) RETURNS slownik
    AS $$
DECLARE
	---w przypadku dodawania rodzica jak jest juz kilka dzieci trzebaby je wszystkie wywalic
	---najlepiej przygotowac metode, ktora na id dodanego elementu robi sprawdzenie i wywala wsyzstkie dzieci dodane wczesniej
	---operacje poprowadzic bezposrednio po insercie; z kolei takie wywalanie jest smiercinosne, jesli ktos sie pomyli i poda mega 
	---nadrzedny region niechcacy
	parent_id integer;
	test integer;
	dana_do_dodania integer;
	result slownik;
BEGIN
	---reg_id bedziemy modyfikowac w petli zeby pobierac dane dla rodzicow kolejnych rodzicow, jesli sprawdzenie da wynik prawdziwy docelowo trzeba dodac to
	---czego zyczy sobie osoba a nie rodzica rodzica rodzica itd :P
	dana_do_dodania := reg_id;
	select into test id from zap_lokaliz_nier where id_region_geog = dana_do_dodania and id_zapotrzebowanie_trans_rodzaj = zapotrzebowanie_trans_rodzaj_id;
	IF test is not null THEN
		---dokladnie ta sama lokalizacja jest juz dodana, wychodzimy
		result.nazwa := '_lokalizacja_jest_juz_dodana';
		return result;
	ELSE
		parent_id := 0;
		WHILE parent_id is not null LOOP
			---wczytujemy rodzica
			select into parent_id id_parent from region_geog where id = dana_do_dodania;
			IF parent_id is null THEN
				---nie ma juz rodzica, mozna dodawac
				insert into zap_lokaliz_nier (id_zapotrzebowanie_trans_rodzaj, id_region_geog) values (zapotrzebowanie_trans_rodzaj_id, reg_id);
				result.id := 1;
				return result;
			ELSE
				select into test id from zap_lokaliz_nier where id_zapotrzebowanie_trans_rodzaj = zapotrzebowanie_trans_rodzaj_id and id_region_geog = parent_id;
				IF test is not null THEN
					---rodzic wystepuje jako juz dodany (lub rodzic rodzica itd, w kazym razie wyzszy region geograficzny)
					result.nazwa := '_nadrzedny_region_geograficzny_jest_dodany';
					return result;
				ELSE
					---zapamietujemy uzyskanego rodzica, kolejne badanie dla jego rodzicow
					dana_do_dodania := parent_id;
				END IF;
			END IF;
		END LOOP;
	END IF;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.dodajreggeogzap(zapotrzebowanie_trans_rodzaj_id integer, reg_id integer) OWNER TO postgres;

--
-- Name: dodajregiongeog(integer, text, boolean, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dodajregiongeog(id_rec integer, nazwa_r text, pokaz_b boolean, parent_id integer, otodom_id integer) RETURNS boolean
    AS $$
DECLARE
	test_rec record;
	test integer;
BEGIN
	IF id_rec is null THEN
		select into test_rec zaglebienie, ma_dzieci, id_parent from region_geog where id = parent_id;

		IF test_rec.ma_dzieci = false THEN
			update region_geog set ma_dzieci = true where id = parent_id;
		END IF;
		
		select into test id from region_geog where id_parent = parent_id and lower(nazwa) = lower(nazwa_r);
		IF test is null THEN
			insert into region_geog (id_parent, id_otodom, nazwa, zaglebienie, ma_dzieci, pokaz) values (parent_id, otodom_id, nazwa_r, test_rec.zaglebienie + 1, false, pokaz_b);
			RETURN true;
		ELSE
			RETURN false;
		END IF;
	ELSE
		select into test id from region_geog where id_parent = parent_id and id != id_rec and lower(nazwa) = lower(nazwa_r);
		IF test is null THEN
			update region_geog set id_otodom = otodom_id, nazwa = nazwa_r, pokaz = pokaz_b where id = id_rec;
			RETURN true;
		ELSE
			RETURN false;
		END IF;
	END IF;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.dodajregiongeog(id_rec integer, nazwa_r text, pokaz_b boolean, parent_id integer, otodom_id integer) OWNER TO postgres;

--
-- Name: dodajreklamamedia(integer, integer, date); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dodajreklamamedia(media_nieruchomosc_id integer, media_reklama_id integer, akt_data date) RETURNS boolean
    AS $$
DECLARE
	test integer;
	--akt_data date;
BEGIN
	--select into akt_data current_date;
	select into test id from reklama_nieruchomosc_m where id_media_nieruchomosc = media_nieruchomosc_id and id_media_reklama = media_reklama_id and data = akt_data;
	IF test is null THEN
		---insert
		insert into reklama_nieruchomosc_m (id_media_nieruchomosc, id_media_reklama, data) values (media_nieruchomosc_id, media_reklama_id, akt_data);
		RETURN true;
	ELSE
		RETURN false;
	END IF;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.dodajreklamamedia(media_nieruchomosc_id integer, media_reklama_id integer, akt_data date) OWNER TO postgres;

--
-- Name: dodajspotkanie(integer, integer, integer, integer, integer, integer, date, integer, integer, text, integer[], integer[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dodajspotkanie(spotkanie_id_o integer, spotkanie_id_k integer, oferta_id integer, zapotrzebowanie_id integer, umowienie_id integer, agent_id integer, sp_data date, sp_godzina_id integer, sp_minuta_id integer, komentarz_t text, osoby_ogl integer[], osoby_pok integer[]) RETURNS slownik
    AS $$ ----w polu id erkordu typu slownik ma byc id spotkania klienta, ktore zawsze powinno istniec
DECLARE
	result slownik;
	res_agent boolean;
	kalendarz_id integer;
	test integer;
	test_of integer;
	new_id_o integer;
	new_id_k integer;
	licznik integer;
	klient_of_id integer;
	klient_zap_id integer;
	spotkanie_id_o_rw integer; ---zapis odczyt :P
BEGIN
	spotkanie_id_o_rw := spotkanie_id_o;
	--IF is_oferent = true THEN
		select into klient_of_id id_klient from nieruchomosc join oferta on oferta.id_nieruchomosc = nieruchomosc.id where oferta.id = oferta_id;
	--ELSE
		select into klient_zap_id id_klient from zapotrzebowanie where zapotrzebowanie.id = zapotrzebowanie_id;
	--END IF;
	IF spotkanie_id_o_rw is null and spotkanie_id_k is null THEN
		---insert
		select into test id from spotkanie where id_klient = klient_zap_id and spotkanie_data = sp_data and spotkanie_godzina = sp_godzina_id and spotkanie_minuta = sp_minuta_id;
		select into test_of id from spotkanie where id_klient = klient_of_id and spotkanie_data = sp_data and spotkanie_godzina = sp_godzina_id and spotkanie_minuta = sp_minuta_id;
		IF test is null and test_of is null THEN
			select into test id from spotkanie where id_klient = klient_zap_id and id_oferta = oferta_id and id_zapotrzebowanie = zapotrzebowanie_id and id_umowienie = umowienie_id; 
			select into test_of id from spotkanie where id_klient = klient_of_id and id_oferta = oferta_id and id_zapotrzebowanie = zapotrzebowanie_id and id_umowienie = umowienie_id;
---przemyslec kwestie pasowania id_umowienia oraz daty>= dzis
---uzasadnienie: osoba moze byc umawiana w biurze w roznych celach, jak rowniez kilka razy w danym celu, oczywiscie dane spotkanie moze tez nie dojsc do skutku, moze przydalby sie jego bool ? bylo spotkanie - nie bylo?
			IF test is null and test_of is null THEN
				---dodawanie swiezego spotkania, najpierw sprawdzenie dostepnosci agenta
				---pomyslec o pominieciu kalendarza kiedy oferent, bo juz klient wiaze agenta - chyba treba zrobic inna procedure dodawania oferenta na spotkanie :)
				select into res_agent SprawdzDostepnoscAgenta (sp_data, sp_godzina_id, sp_minuta_id, agent_id, null); 
				IF res_agent = true THEN --- no or =false and is oferent true, albo upewnic sie czy to ta sama oferta ...
----tu teraz 2 inserty ....
----zmodyfikowac ponizsze dodawanie klienta oferujacego jesli jest/nie ma klucza - moze wystarczy, ze osoby pokazujace beda null
					IF osoby_pok[1] is not null THEN
						insert into spotkanie (id_oferta, id_zapotrzebowanie, id_klient, klient_oferujacy, id_umowienie, spotkanie_data, spotkanie_godzina, spotkanie_minuta, id_agent, komentarz) values 
						(oferta_id, zapotrzebowanie_id, klient_of_id, true, umowienie_id, sp_data, sp_godzina_id, sp_minuta_id, agent_id, komentarz_t);
						select into new_id_o currval('spotkanie_id_seq');
						licznik := 1;
						WHILE osoby_pok[licznik] is not null LOOP
							insert into spotkanie_os (id_spotkanie, id_osoba) values (new_id_o, osoby_pok[licznik]);
							licznik := licznik + 1;
						END LOOP;
					END IF;
					insert into spotkanie (id_oferta, id_zapotrzebowanie, id_klient, klient_oferujacy, id_umowienie, spotkanie_data, spotkanie_godzina, spotkanie_minuta, id_agent, komentarz) values 
					(oferta_id, zapotrzebowanie_id, klient_zap_id, false, umowienie_id, sp_data, sp_godzina_id, sp_minuta_id, agent_id, komentarz_t);
					select into new_id_k currval('spotkanie_id_seq');
					perform WpisKalendarz (null, sp_data, sp_godzina_id, sp_minuta_id, ARRAY[agent_id], komentarz_t, new_id_k); ---sparsowac komentarz : ogladanie, nr oferty, nr klienta itd, zrobic to wyzej
					licznik := 1;
					WHILE osoby_ogl[licznik] is not null LOOP
						insert into spotkanie_os (id_spotkanie, id_osoba) values (new_id_k, osoby_ogl[licznik]);
						licznik := licznik + 1;
					END LOOP;
					result.id := new_id_k;
				ELSE
					result.nazwa := '_agent_jest_umowiony_w_wybranym_terminie';
				END IF;
			ELSE
				---spotkanie podlega modyfikacji, wywolujemy ta sama procedure, ale z id spotkania, co powoduje ze uruchamia sie update
				select into result * from DodajSpotkanie (test_of, test, oferta_id, zapotrzebowanie_id, umowienie_id, agent_id, sp_data, sp_godzina_id, sp_minuta_id, komentarz_t, osoby_ogl, osoby_pok);
			END IF;
		ELSE
			---dokladnie sprawdzic czy do czynienia mamy z ta sama oferta czy nie, do poprawy - zrobione ponizej :)
			new_id_k := test;
			IF test is not null THEN
				----select sprawdza, czy wywolanie dotyczy na pewno tego samego umowienia
				select into test id from spotkanie where id_klient = klient_zap_id and spotkanie_data = sp_data and spotkanie_godzina = sp_godzina_id and spotkanie_minuta = sp_minuta_id 
				and id_zapotrzebowanie = zapotrzebowanie_id and id_oferta = oferta_id;
				
				IF test is null THEN
					result.nazwa := '_klient_jest_umowiony_w_wybranym_terminie';
					RETURN result;
				END IF;
			END IF;
			IF test_of is not null THEN
				----select sprawdza, czy wywolanie dotyczy na pewno tego samego umowienia
				select into test_of id from spotkanie where id_klient = klient_of_id and spotkanie_data = sp_data and spotkanie_godzina = sp_godzina_id and spotkanie_minuta = sp_minuta_id 
				and id_oferta = oferta_id and id_zapotrzebowanie = zapotrzebowanie_id;

				IF test_of is null THEN
					result.nazwa := '_oferent_jest_umowiony_w_wybranym_terminie';
					RETURN result;
				ELSE
					---wpis do spotkan dla oferenta istnieje, jesli nie podano osob mamy do czyneinia z przypadkiem, kiedy pojawily sie klucze w biurze
					IF osoby_pok[1] is null THEN ---tu ewentualnie moznaby dla jednolitosci probowac rekurencji
						---kasowanie, najwidoczniej jest klucz i juz oferenta nei trzeba scigac, zas byl juz umowiony i teraz leci poprawka z formularza
						delete from spotkanie_os where id_spotkanie = test_of;
						delete from spotkanie where id = test_of;
					ELSE --jesli osoby sa podane do procedury moze byc ze nastapila podmiana pokazujacego
						delete from spotkanie_os where id_spotkanie = test_of;
						licznik := 1;
						WHILE osoby_pok[licznik] is not null LOOP
							insert into spotkanie_os (id_spotkanie, id_osoba) values (test_of, osoby_pok[licznik]);
							licznik := licznik + 1;
						END LOOP;
					END IF;
				END IF;
			END IF;
			IF test_of is null and osoby_pok[1] is not null THEN
				insert into spotkanie (id_oferta, id_zapotrzebowanie, id_klient, klient_oferujacy, id_umowienie, spotkanie_data, spotkanie_godzina, spotkanie_minuta, id_agent, komentarz) values 
				(oferta_id, zapotrzebowanie_id, klient_of_id, true, umowienie_id, sp_data, sp_godzina_id, sp_minuta_id, agent_id, komentarz_t);
				select into new_id_o currval('spotkanie_id_seq');
				licznik := 1;
				WHILE osoby_pok[licznik] is not null LOOP
					insert into spotkanie_os (id_spotkanie, id_osoba) values (new_id_o, osoby_pok[licznik]);
					licznik := licznik + 1;
				END LOOP;
			END IF;

			result.id := new_id_k;
			RETURN result;
		END IF;
		RETURN result;
	ELSE
		---update
		---jesli spotkanie_id_o_rw jest null mamy do czynienia z przypadkiem, kiedy nie dodano wczesniej spotkania, bo np byly klucze
		---sytuacja odwrotna : jesli nie jest podawane info o oferencie, za to juz jakies figuruje, znaczy to ze sa klucze i juz mozna usunac oferenta z listy umowionych
		select into test id from spotkanie where id_klient = klient_zap_id and spotkanie_data = sp_data and spotkanie_godzina = sp_godzina_id and spotkanie_minuta = sp_minuta_id and id != spotkanie_id_k;
		IF osoby_pok[1] is not null THEN ---sprawdzanie oferenta nie ma sensu, jesli nie jest brany pod uwage, bo w biurze as klucze :)
			select into test_of id from spotkanie where id_klient = klient_of_id and spotkanie_data = sp_data and spotkanie_godzina = sp_godzina_id and spotkanie_minuta = sp_minuta_id and id != spotkanie_id_o_rw;
		END IF;
		IF test is null and test_of is null THEN
			select into res_agent SprawdzDostepnoscAgenta (sp_data, sp_godzina_id, sp_minuta_id, agent_id, null);
			IF res_agent = true THEN
				IF osoby_pok[1] is not null THEN
					update spotkanie set id_oferta = oferta_id, id_zapotrzebowanie = zapotrzebowanie_id, id_klient = klient_of_id, id_umowienie = umowienie_id, spotkanie_data = sp_data, 
					spotkanie_godzina = sp_godzina_id, spotkanie_minuta = sp_minuta_id, id_agent = agent_id, komentarz = komentarz_t  where id = spotkanie_id_o_rw;
				END IF;

				IF osoby_pok[1] is not null and spotkanie_id_o_rw is null THEN
					insert into spotkanie (id_oferta, id_zapotrzebowanie, id_klient, klient_oferujacy, id_umowienie, spotkanie_data, spotkanie_godzina, spotkanie_minuta, id_agent, komentarz) values 
					(oferta_id, zapotrzebowanie_id, klient_of_id, true, umowienie_id, sp_data, sp_godzina_id, sp_minuta_id, agent_id, komentarz_t);
					select into spotkanie_id_o_rw currval('spotkanie_id_seq');
				END IF;

				IF osoby_pok[1] is null and spotkanie_id_o_rw is not null THEN
					---kasowanie, najwidoczniej jest klucz i juz oferenta nei trzeba scigac, zas byl juz umowiony i teraz leci poprawka z formularza
					delete from spotkanie_os where id_spotkanie = spotkanie_id_o_rw;
					delete from spotkanie where id = spotkanie_id_o_rw;
				END IF;

				update spotkanie set id_oferta = oferta_id, id_zapotrzebowanie = zapotrzebowanie_id, id_klient = klient_zap_id, id_umowienie = umowienie_id, spotkanie_data = sp_data, 
				spotkanie_godzina = sp_godzina_id, spotkanie_minuta = sp_minuta_id, id_agent = agent_id, komentarz = komentarz_t  where id = spotkanie_id_k;
				select into kalendarz_id id from kalendarz where id_spotkanie = spotkanie_id_k;
				IF kalendarz_id is not null THEN
					perform WpisKalendarz (kalendarz_id, sp_data, sp_godzina_id, sp_minuta_id, ARRAY[agent_id], komentarz_t, spotkanie_id_k); ---sparsowac komentarz : ogladanie, nr oferty, nr klienta itd, zrobic to wyzej
				END IF;
	---dorobic z osobami jak juz wyjdzie z formularza jaka bedzie potrzeba :P
				delete from spotkanie_os where id_spotkanie = spotkanie_id_o_rw;
				delete from spotkanie_os where id_spotkanie = spotkanie_id_k;
				licznik := 1;
				WHILE osoby_ogl[licznik] is not null LOOP
					insert into spotkanie_os (id_spotkanie, id_osoba) values (spotkanie_id_k, osoby_ogl[licznik]);
					licznik := licznik + 1;
				END LOOP;
				licznik := 1;
				IF osoby_pok[1] is not null THEN
					WHILE osoby_pok[licznik] is not null LOOP
						insert into spotkanie_os (id_spotkanie, id_osoba) values (spotkanie_id_o_rw, osoby_pok[licznik]);
						licznik := licznik + 1;
					END LOOP;
				END IF;
				result.id := spotkanie_id_k;
			ELSE
				result.nazwa := '_agent_jest_umowiony_w_wybranym_terminie';
			END IF;
		ELSE
			IF test_of is not null THEN
				result.nazwa := '_oferent_jest_umowiony_w_wybranym_terminie';
			ELSE
				result.nazwa := '_klient_jest_umowiony_w_wybranym_terminie';
			END IF;
		END IF;
		RETURN result;
	END IF;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.dodajspotkanie(spotkanie_id_o integer, spotkanie_id_k integer, oferta_id integer, zapotrzebowanie_id integer, umowienie_id integer, agent_id integer, sp_data date, sp_godzina_id integer, sp_minuta_id integer, komentarz_t text, osoby_ogl integer[], osoby_pok integer[]) OWNER TO postgres;

--
-- Name: dodajspotkaniepomkal(integer, integer, integer, boolean, integer, integer, date, integer, integer, text, integer[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dodajspotkaniepomkal(spotkanie_id integer, oferta_id integer, zapotrzebowanie_id integer, is_oferent boolean, umowienie_id integer, agent_id integer, sp_data date, sp_godzina_id integer, sp_minuta_id integer, komentarz_t text, osoby integer[]) RETURNS slownik
    AS $$
DECLARE
	result slownik;
	res_agent boolean;
	kalendarz_id integer;
	test integer;
	new_id integer;
	licznik integer;
	klient_id integer;
BEGIN
	IF is_oferent = true THEN
		select into klient_id id_klient from nieruchomosc join oferta on oferta.id_nieruchomosc = nieruchomosc.id where oferta.id = oferta_id;
	ELSE
		select into klient_id id_klient from zapotrzebowanie where zapotrzebowanie.id = zapotrzebowanie_id;
	END IF;
	IF spotkanie_id is null THEN
		---insert
		select into test id from spotkanie where id_klient = klient_id and spotkanie_data = sp_data and spotkanie_godzina = sp_godzina_id and spotkanie_minuta = sp_minuta_id;
		IF test is null THEN
			select into test id from spotkanie where id_klient = klient_id and id_oferta = oferta_id and id_zapotrzebowanie = zapotrzebowanie_id and id_umowienie = umowienie_id; ---przemyslec kwestie pasowania id_umowienia oraz daty>= dzis
---uzasadnienie: osoba moze byc umawiana w biurze w roznych celach, jak rowniez kilka razy w danym celu, oczywiscie dane spotkanie moze tez nie dojsc do skutku, moze przydalby sie jego bool ? bylo spotkanie - nie bylo?
			IF test is null THEN
				---dodawanie swiezego spotkania, najpierw sprawdzenie dostepnosci agenta
				insert into spotkanie (id_oferta, id_zapotrzebowanie, id_klient, klient_oferujacy, id_umowienie, spotkanie_data, spotkanie_godzina, spotkanie_minuta, id_agent, komentarz) values 
				(oferta_id, zapotrzebowanie_id, klient_id, is_oferent, umowienie_id, sp_data, sp_godzina_id, sp_minuta_id, agent_id, komentarz_t);
				select into new_id currval('spotkanie_id_seq');
				licznik := 1;
				WHILE osoby[licznik] is not null LOOP
					insert into spotkanie_os (id_spotkanie, id_osoba) values (new_id, osoby[licznik]);
					licznik := licznik + 1;
				END LOOP;
				result.id := new_id;
			ELSE
				---spotkanie podlega modyfikacji, wywolujemy ta sama procedure, ale z id spotkania, co powoduje ze uruchamia sie update
				select into result * from DodajSpotkanie (test, oferta_id, zapotrzebowanie_id, is_oferent, umowienie_id, agent_id, sp_data, sp_godzina_id, sp_minuta_id, komentarz_t, osoby);
			END IF;
		ELSE
			result.nazwa := '_klient_jest_umowiony_w_wybranym_terminie';
		END IF;
		RETURN result;
	ELSE
		---update
		select into test id from spotkanie where id_klient = klient_id and spotkanie_data = sp_data and spotkanie_godzina = sp_godzina_id and spotkanie_minuta = sp_minuta_id and id != spotkanie_id;
		IF test is null THEN
			update spotkanie set id_oferta = oferta_id, id_zapotrzebowanie = zapotrzebowanie_id, id_klient = klient_id, klient_oferujacy = is_oferent, id_umowienie = umowienie_id, spotkanie_data = sp_data, 
			spotkanie_godzina = sp_godzina_id, spotkanie_minuta = sp_minuta_id, id_agent = agent_id, komentarz = komentarz_t  where id = spotkanie_id;
			delete from spotkanie_os where id_spotkanie = spotkanie_id;
			licznik := 1;
			WHILE osoby[licznik] is not null LOOP
				insert into spotkanie_os (id_spotkanie, id_osoba) values (spotkanie_id, osoby[licznik]);
				licznik := licznik + 1;
			END LOOP;
			result.id := spotkanie_id;
		ELSE
			result.nazwa := '_klient_jest_umowiony_w_wybranym_terminie';
		END IF;
		RETURN result;
	END IF;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.dodajspotkaniepomkal(spotkanie_id integer, oferta_id integer, zapotrzebowanie_id integer, is_oferent boolean, umowienie_id integer, agent_id integer, sp_data date, sp_godzina_id integer, sp_minuta_id integer, komentarz_t text, osoby integer[]) OWNER TO postgres;

--
-- Name: dodajsubskrypcja(integer, integer, double precision, double precision, text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dodajsubskrypcja(nier_rodzaj_id integer, trans_rodzaj_id integer, min_cena double precision, max_cena double precision, adres_email text, jezyk_id integer) RETURNS slownik
    AS $$
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
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.dodajsubskrypcja(nier_rodzaj_id integer, trans_rodzaj_id integer, min_cena double precision, max_cena double precision, adres_email text, jezyk_id integer) OWNER TO postgres;

--
-- Name: dodajszczegnierzap(integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dodajszczegnierzap(zapotrzebowanie_id integer, szczeg_id integer) RETURNS boolean
    AS $$
DECLARE
	test integer;
BEGIN
	select into test id from zap_szcz_nier where id_zapotrzebowanie = zapotrzebowanie_id and id_rodz_nier_szcz = szczeg_id;
	IF test is null THEN
		insert into zap_szcz_nier (id_zapotrzebowanie, id_rodz_nier_szcz) values (zapotrzebowanie_id, szczeg_id);
		return true;
	ELSE
		return false;
	END IF;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.dodajszczegnierzap(zapotrzebowanie_id integer, szczeg_id integer) OWNER TO postgres;

--
-- Name: dodajtagjezyk(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dodajtagjezyk(lang_tag_nazwa text) RETURNS boolean
    AS $$
DECLARE
	test integer;
BEGIN
	select into test id from lang_tag where nazwa = lang_tag_nazwa;
	IF test is null THEN
		insert into lang_tag (nazwa) values (lang_tag_nazwa);
		RETURN true;
	ELSE
		RETURN false;
	END IF;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.dodajtagjezyk(lang_tag_nazwa text) OWNER TO postgres;

--
-- Name: dodajtelefon(integer, integer, text, text, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dodajtelefon(tel_id integer, osoba_id integer, nr_tel text, opis_tel text, powrot boolean) RETURNS boolean
    AS $$
DECLARE
	test integer;
	media_id integer;
BEGIN
	---dodawanie nie aktualizacja
	IF tel_id is null THEN
		IF powrot = true THEN
			FOR media_id in select id from media_nieruchomosc where id_osoba = osoba_id LOOP
				perform DodajTelefonMedia (null, media_id, nr_tel, opis_tel, false);
			END LOOP;
		END IF;
		
		--sprawdzenie, czy juz nie ma takiego telefonu dla tej osoby
		--a gdzie sprawdzenie czy komorka czasem jest taka sama ??
		select into test id from telefon where nazwa = nr_tel and id_osoba = osoba_id;
		IF test is null THEN
			insert into telefon (id_osoba, nazwa, opis) values (osoba_id, nr_tel, opis_tel);
			return true;
		ELSE
			---update telefon set opis = opis_tel where id = 
			return false;
		END IF;
	ELSE
		IF powrot = true THEN
			FOR media_id in select id from media_nieruchomosc where id_osoba = osoba_id LOOP
				select into test id from telefon_media_nieruchomosc where id_media_nieruchomosc = media_id and nazwa = (select nazwa from telefon where id = tel_id);
				IF test is not null THEN
					perform DodajTelefonMedia (test, media_id, nr_tel, opis_tel, false);
				END IF;
			END LOOP;
		END IF;
		select into test id from telefon where id != tel_id and nazwa = nr_tel and id_osoba = osoba_id;
		IF test is null THEN
			update telefon set nazwa = nr_tel, opis = opis_tel where id = tel_id;
			IF found THEN
				return true;
			ELSE
				return false;
			END IF;
		ELSE
			return false;
		END IF;
	END IF;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.dodajtelefon(tel_id integer, osoba_id integer, nr_tel text, opis_tel text, powrot boolean) OWNER TO postgres;

--
-- Name: dodajtelefonmedia(integer, integer, text, text, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dodajtelefonmedia(telefon_media_nieruchomosc_id integer, media_nieruchomosc_id integer, tel text, opis_t text, powrot boolean) RETURNS boolean
    AS $$
DECLARE
	test integer;
	osoba_id integer;
BEGIN
	select into osoba_id id_osoba from media_nieruchomosc where id = media_nieruchomosc_id;

	IF telefon_media_nieruchomosc_id is null THEN
		IF osoba_id is not null and powrot = true THEN
			perform DodajTelefon (null, osoba_id, tel, opis_t, false);
		END IF;

		select into test id from telefon_media_nieruchomosc where id_media_nieruchomosc = media_nieruchomosc_id and nazwa = tel;
		IF test is null THEN
			insert into telefon_media_nieruchomosc (id_media_nieruchomosc, nazwa, opis) values (media_nieruchomosc_id, tel, opis_t);
			RETURN true;
		ELSE
			RETURN false;
		END IF;
	ELSE
		---zmiana telefonu z jednego na inny
		IF osoba_id is not null and powrot = true THEN
			---proba odszukania telefonu w kontakcie osoby
			select into test id from telefon where id_osoba = osoba_id and nazwa = (select nazwa from telefon_media_nieruchomosc where id = telefon_media_nieruchomosc_id);
			IF test is not null THEN
				perform DodajTelefon (test, osoba_id, tel, opis_t, false);
			ELSE
				perform DodajTelefon (null, osoba_id, tel, opis_t, false);
			END IF;
		END IF;
		select into test id from telefon_media_nieruchomosc where id_media_nieruchomosc = media_nieruchomosc_id and nazwa = tel and id != telefon_media_nieruchomosc_id;
		IF test is null THEN
			update telefon_media_nieruchomosc set nazwa = tel, opis = opis_t where id = telefon_media_nieruchomosc_id;
			RETURN true;
		ELSE
			RETURN false;
		END IF;
	END IF;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.dodajtelefonmedia(telefon_media_nieruchomosc_id integer, media_nieruchomosc_id integer, tel text, opis_t text, powrot boolean) OWNER TO postgres;

--
-- Name: dodajtlumaczenie(text, integer, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dodajtlumaczenie(lang_tag_nazwa text, jezyk_id integer, wartosc text) RETURNS boolean
    AS $$
DECLARE
	test integer;
BEGIN
	select into test id from tlumaczenie where id_jezyk = jezyk_id and nazwa_lang_tag = lang_tag_nazwa;
	IF test is null and character_length(wartosc) > 0 THEN
		insert into tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values ((select replace(lang_tag_nazwa, ',', '^')), jezyk_id, wartosc);
		RETURN true;
	ELSE
		---znaleziono, juz jest, nie bedzie dodawane kolejne lub nie podano textu sensownego - i tak powinno byc zwalidowane js
		RETURN false;
	END IF;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.dodajtlumaczenie(lang_tag_nazwa text, jezyk_id integer, wartosc text) OWNER TO postgres;

--
-- Name: dodajtransnierzapotrzebowanie(integer, integer, integer, integer, text, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dodajtransnierzapotrzebowanie(zapotrzebowanie_trans_rodzaj_id integer, zapotrzebowanie_nier_rodzaj_id integer, trans_rodzaj_id integer, status_id integer, cena_t text, pokaz_t boolean) RETURNS boolean
    AS $$
DECLARE
	test integer;
BEGIN
	IF zapotrzebowanie_trans_rodzaj_id is null THEN
		---sprawdzenie, czy nie ma juz takiego wpisu
		select into test id from zapotrzebowanie_trans_rodzaj where id_zapotrzebowanie_nier_rodzaj = zapotrzebowanie_nier_rodzaj_id and id_trans_rodzaj = trans_rodzaj_id;
		IF test is null THEN
			insert into zapotrzebowanie_trans_rodzaj (id_zapotrzebowanie_nier_rodzaj, id_status, id_trans_rodzaj, cena, pokaz) values 
			(zapotrzebowanie_nier_rodzaj_id, status_id, trans_rodzaj_id, cena_t, pokaz_t);
			return true;
		ELSE
			return false;
		END IF;
	ELSE
		update zapotrzebowanie_trans_rodzaj set id_status = status_id, cena = cena_t, pokaz = pokaz_t where id = zapotrzebowanie_trans_rodzaj_id;
		IF found THEN
			return true;
		ELSE
			return false;
		END IF;
	END IF;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.dodajtransnierzapotrzebowanie(zapotrzebowanie_trans_rodzaj_id integer, zapotrzebowanie_nier_rodzaj_id integer, trans_rodzaj_id integer, status_id integer, cena_t text, pokaz_t boolean) OWNER TO postgres;

--
-- Name: dodajwlasciciel(integer, integer, integer, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dodajwlasciciel(wlasciciel_id integer, nieruchomosc_id integer, osoba_id integer, proc_udzial double precision) RETURNS boolean
    AS $$
DECLARE
	max_udz float;
	test integer;
BEGIN
	IF wlasciciel_id is null THEN
		---potencjalnie insert
		select into test id from wlasciciel where id_nieruchomosc = nieruchomosc_id and id_osoba = osoba_id;
		IF test is null THEN
			---przygotowujemy sie na insert, sprawdzenie czy proponowany udzial jest mozliwy
			--select into max_udz PodajDostProcUdzialWlasNier from PodajDostProcUdzialWlasNier(nieruchomosc_id, null);
			--IF proc_udzial > max_udz THEN
			--	return false;
			--ELSE
				--insert moze zostac przeprowadzony
				insert into wlasciciel (id_nieruchomosc, id_osoba, procent_udzial) values (nieruchomosc_id, osoba_id, proc_udzial);
				return true;
			--END IF;
		ELSE
			return false;
		END IF;
	ELSE
		--select into max_udz PodajDostProcUdzialWlasNier from PodajDostProcUdzialWlasNier(nieruchomosc_id, osoba_id);
		--IF proc_udzial > max_udz THEN
		--	return false;
		--ELSE
			update wlasciciel set procent_udzial = proc_udzial where id = wlasciciel_id;
			IF found THEN
				return true;
			ELSE
				return false;
			END IF;
		--END IF;
	END IF;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.dodajwlasciciel(wlasciciel_id integer, nieruchomosc_id integer, osoba_id integer, proc_udzial double precision) OWNER TO postgres;

--
-- Name: dodajwyposazenienier(boolean, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dodajwyposazenienier(op_dodawania boolean, nieruchomosc_id integer, wyposazenie_id integer) RETURNS boolean
    AS $$
DECLARE
	test integer; ---zmienna do sprawdzenia obecnoœci informacji w bazie
	parent_test integer; ---zmienna do sprawdzenia, czy informacja ma elementy nadrzêdne
	czy_dana_wielokrotna boolean;
BEGIN
	IF op_dodawania = true THEN
		---operacja wpowadzania do tabeli nowego elementu
		---sprawdzenie czy dodawana informacja juz nie jest w bazie
		select into test id from dane_slow_wyp_nier where id_nieruchomosc = nieruchomosc_id and id_wyposazenie_nier = wyposazenie_id;
		---dana jest w bazie, nie ma sensu jej dodawac
		IF test is not null THEN
			RETURN false;
		END IF;
		select into parent_test id_parent from wyposazenie_nier where id = wyposazenie_id;
		IF parent_test is not null THEN
			---mamy do czynienia z elementem podrzêdnym
			---sprawdzenie czy podawana dana jest natury wielokrotnej
			select into czy_dana_wielokrotna wyposazenie_nier.wielokrotne from wyposazenie_nier where id = wyposazenie_id;
			IF czy_dana_wielokrotna = false THEN
				---dana jest natury jednokrotnej
				---sprawdzenie czy nie ma wprowadzonego innego elementu podrzêdnego
				select into test id_wyposazenie_nier from dane_slow_wyp_nier join wyposazenie_nier on dane_slow_wyp_nier.id_wyposazenie_nier = 
				wyposazenie_nier.id where dane_slow_wyp_nier.id_nieruchomosc = nieruchomosc_id and wyposazenie_nier.id_parent = 
				(select id_parent from wyposazenie_nier where id = wyposazenie_id) and wyposazenie_nier.wielokrotne = false;
				IF test is not null THEN
					---jest juz inna informacja tego elementu nadrzêdnego w tabeli, nie mo¿na dodaæ tego
					return false;
				END IF;
			END IF;
		END IF;
		---poniewa¿ wszystkie walidacje da³y wynik pozytywny wprowadzenie do tabeli
		insert into dane_slow_wyp_nier (id_nieruchomosc, id_wyposazenie_nier) values (nieruchomosc_id, wyposazenie_id);
		RETURN true;
	ELSE
		---operacja usuwania z tabeli elementu
		delete from dane_slow_wyp_nier where id_nieruchomosc = nieruchomosc_id and id_wyposazenie_nier = wyposazenie_id;
		IF found THEN
			RETURN true;
		ELSE
			RETURN false;
		END IF;
	END IF;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.dodajwyposazenienier(op_dodawania boolean, nieruchomosc_id integer, wyposazenie_id integer) OWNER TO postgres;

--
-- Name: dodajwyposazeniepom(boolean, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dodajwyposazeniepom(op_dodawania boolean, pomieszczenie_id integer, wyposazenie_id integer) RETURNS boolean
    AS $$
DECLARE
	test integer;
	parent_test integer;
	czy_dana_wielokrotna boolean;
BEGIN
	---mozna pobrac na nieruchomosc_id rodzaj nieruchomosci i sprawdzac czy podawana  informacja figuruje w ogole dla tej nieruchomosci
	---ale na razie podarujemy sobie - skoro sie pokazuje to musi byc dostepna, jak nie jest to ma sie nie pokazac
	IF op_dodawania = true THEN
		---insert do bazy
		---sprawdzenie czy dodawana informacja juz nie jest w bazie
		select into test id from dane_slow_wyp_pom where id_pomieszczenie_przyn_nier = pomieszczenie_id and id_wyposazenie_pom = wyposazenie_id;
		---dana jest w bazie nie ma sensu jej dodawac
		IF test is not null THEN
			RETURN false;
		END IF;
		select into parent_test id_parent from wyposazenie_pom where id = wyposazenie_id;
		IF parent_test is not null THEN
			---mamy do czynienia z dzieckiem :)
			---sprawdzenie czy podawana dana jest natury wielokrotnej
			select into czy_dana_wielokrotna wyposazenie_pom.wielokrotne from wyposazenie_pom where id = wyposazenie_id;
			IF czy_dana_wielokrotna = false THEN
				---dana jest natury jednokrotnej
				---sprawdzenie czy nie ma kogos z rodzenstwa juz dorzuconego
				select into test id_wyposazenie_pom from dane_slow_wyp_pom join wyposazenie_pom on dane_slow_wyp_pom.id_wyposazenie_pom = 
				wyposazenie_pom.id where dane_slow_wyp_pom.id_pomieszczenie_przyn_nier = pomieszczenie_id and wyposazenie_pom.id_parent = 
				(select id_parent from wyposazenie_pom where id = wyposazenie_id) and wyposazenie_pom.wielokrotne = false;
				IF test is not null THEN
					---jest juz inna informacja tego rodzica na bazie, nie mozna dodac tego
					return false;
				END IF;
			END IF;
		END IF;
		insert into dane_slow_wyp_pom (id_pomieszczenie_przyn_nier, id_wyposazenie_pom) values (pomieszczenie_id, wyposazenie_id);
		RETURN true;
	ELSE ---dokonczyc
		---delete z bazy
		delete from dane_slow_wyp_pom where id_pomieszczenie_przyn_nier = pomieszczenie_id and id_wyposazenie_pom = wyposazenie_id;
		IF found THEN
			RETURN true;
		ELSE
			RETURN false;
		END IF;
	END IF;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.dodajwyposazeniepom(op_dodawania boolean, pomieszczenie_id integer, wyposazenie_id integer) OWNER TO postgres;

--
-- Name: dodajwyposazeniezap(boolean, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dodajwyposazeniezap(op_dodawania boolean, zapotrzebowanie_trans_rodzaj_id integer, wyposazenie_id integer) RETURNS boolean
    AS $$
DECLARE
	test integer;
BEGIN
	---mozna pobrac na nieruchomosc_id rodzaj nieruchomosci i sprawdzac czy podawana  informacja figuruje w ogole dla tej nieruchomosci
	---ale na razie podarujemy sobie - skoro sie pokazuje to musi byc dostepna, jak nie jest to ma sie nie pokazac
	IF op_dodawania = true THEN
		---insert do bazy
		---sprawdzenie czy dodawana informacja juz nie jest w bazie
		select into test id from dane_slow_wyp_zap where id_zapotrzebowanie_trans_rodzaj = zapotrzebowanie_trans_rodzaj_id and id_wyposazenie_nier = wyposazenie_id;
		---dana jest w bazie nie ma sensu jej dodawac
		IF test is not null THEN
			RETURN false;
		ELSE
			insert into dane_slow_wyp_zap (id_zapotrzebowanie_trans_rodzaj, id_wyposazenie_nier) values (zapotrzebowanie_trans_rodzaj_id, wyposazenie_id);
			RETURN true;
		END IF;
	ELSE
		---delete z bazy
		delete from dane_slow_wyp_zap where id_zapotrzebowanie_trans_rodzaj = zapotrzebowanie_trans_rodzaj_id and id_wyposazenie_nier = wyposazenie_id;
		IF found THEN
			RETURN true;
		ELSE
			RETURN false;
		END IF;
	END IF;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.dodajwyposazeniezap(op_dodawania boolean, zapotrzebowanie_trans_rodzaj_id integer, wyposazenie_id integer) OWNER TO postgres;

--
-- Name: dodajzapotrzebowanie(integer, integer[], date, date, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dodajzapotrzebowanie(zapotrzebowanie_id integer, nier_rodzaj_id integer[], otw_zlec_data date, zam_zlec_data date, klient_id integer, agent_id integer) RETURNS integer
    AS $$
DECLARE
	akt_data date;
	cena_akt float;
	new_id integer;
BEGIN
	select into akt_data current_date;
	IF zapotrzebowanie_id is null THEN
		---insert
		BEGIN
			insert into zapotrzebowanie (id_klient, data, data_otw_zlecenie, data_zam_zlecenie, id_agent) values 
			(klient_id, akt_data, otw_zlec_data, zam_zlec_data, agent_id);
			select into new_id currval('zapotrzebowanie_id_seq');
			perform DodajNierZapotrzebowanie(new_id, nier_rodzaj_id, false);
			RETURN new_id;
		EXCEPTION WHEN not_null_violation THEN
			RETURN null;
		END;
	ELSE
		new_id := zapotrzebowanie_id;
		BEGIN
			update zapotrzebowanie set data_zam_zlecenie = zam_zlec_data where id = zapotrzebowanie_id;
			perform DodajNierZapotrzebowanie(new_id, nier_rodzaj_id, true);
			RETURN new_id;
		EXCEPTION WHEN not_null_violation THEN
			RETURN null;
		END;
	END IF;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.dodajzapotrzebowanie(zapotrzebowanie_id integer, nier_rodzaj_id integer[], otw_zlec_data date, zam_zlec_data date, klient_id integer, agent_id integer) OWNER TO postgres;

--
-- Name: dodajzapotrznierszczeg(boolean, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dodajzapotrznierszczeg(op_dodaj boolean, zapotrzebowanie_trans_rodzaj_id integer, nier_szczeg_id integer) RETURNS boolean
    AS $$
DECLARE
	result boolean;
	test integer;
BEGIN
	IF op_dodaj = true THEN
		select into test id from zap_szcz_nier where id_zapotrzebowanie_trans_rodzaj = zapotrzebowanie_trans_rodzaj_id and id_rodz_nier_szcz = nier_szczeg_id;
		IF test is null THEN
			insert into zap_szcz_nier(id_zapotrzebowanie_trans_rodzaj, id_rodz_nier_szcz) values (zapotrzebowanie_trans_rodzaj_id, nier_szczeg_id);
			return true;
		ELSE
			RETURN false;
		END IF;
	ELSE
		select into test id from zap_szcz_nier where id_zapotrzebowanie_trans_rodzaj = zapotrzebowanie_trans_rodzaj_id and id_rodz_nier_szcz = nier_szczeg_id;
		IF test is not null THEN
			delete from zap_szcz_nier where id = test;
			---if found bez sensu zadnego tutaj :P
			return true;
		ELSE
			return false;
		END IF;
	END IF;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.dodajzapotrznierszczeg(op_dodaj boolean, zapotrzebowanie_trans_rodzaj_id integer, nier_szczeg_id integer) OWNER TO postgres;

--
-- Name: dodajzdjecie(integer, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dodajzdjecie(nieruchomosc_id integer, rozszerzenie text) RETURNS text
    AS $$
DECLARE
	id_zdj integer;
	sep text;
	nazwa_zdj text;
BEGIN
	sep := '_';
	select into id_zdj nextval('zdjecie_id_seq');
	nazwa_zdj := nieruchomosc_id || sep || id_zdj || '.' || rozszerzenie;
	insert into zdjecie (id, id_nieruchomosc, nazwa) values (id_zdj, nieruchomosc_id, nazwa_zdj);
	return nazwa_zdj;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.dodajzdjecie(nieruchomosc_id integer, rozszerzenie text) OWNER TO postgres;

--
-- Name: dodajzdjecieimport(integer, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dodajzdjecieimport(nieruchomosc_id integer, rozszerzenie text, stara_nazwa text) RETURNS text
    AS $$
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
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.dodajzdjecieimport(nieruchomosc_id integer, rozszerzenie text, stara_nazwa text) OWNER TO postgres;

--
-- Name: dowregiongeograficzny(integer, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dowregiongeograficzny(wojewodztwo_id integer, text_nazwa text) RETURNS SETOF reggeog
    AS $$
DECLARE
	rec_slownik RegGeog;
	rec_temp record;
	test integer;
	licznik integer;
BEGIN
	select into test count(id) from region_geog where lower(nazwa) like lower(text_nazwa) and (select count(RegionNajnGalazRodzice) from RegionNajnGalazRodzice (region_geog.id) where RegionNajnGalazRodzice = wojewodztwo_id) = 1;
	IF test > 30 THEN
		RETURN NEXT rec_slownik;
	ELSE
		FOR rec_temp IN select id, id_parent, nazwa from region_geog where lower(nazwa) like lower(text_nazwa) and (select count(RegionNajnGalazRodzice) from RegionNajnGalazRodzice (region_geog.id) where RegionNajnGalazRodzice = wojewodztwo_id) = 1 LOOP
			licznik := 1;
			rec_slownik.id_region_geog := rec_temp.id;
			rec_slownik.region := rec_temp.nazwa;
			rec_slownik.rodzice := null;
			WHILE rec_temp.id_parent is not null LOOP
				---ewentualnie jesli on to zle robi (wyznacza rec_temp.id_parent) do test wpisac parent id
				select into rec_temp id, id_parent, nazwa from region_geog where id = rec_temp.id_parent;
				rec_slownik.rodzice[licznik] := rec_temp.nazwa;
				licznik := licznik + 1;
			END LOOP;
			RETURN NEXT rec_slownik;
		END LOOP;
	END IF;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.dowregiongeograficzny(wojewodztwo_id integer, text_nazwa text) OWNER TO postgres;

--
-- Name: edycjaklient(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION edycjaklient(klient_id integer) RETURNS klientoferta
    AS $$
DECLARE
	result KlientOferta;
	rec_temp record;
	rec_dane_firma record;
	licznik integer;
	os_prawna_id integer;
BEGIN
	select into result.id_osobowosc id_osobowosc from klient where id = klient_id;
	licznik := 1;
	--result.id_osoba_klient := null;
	--result.id_osoba := null;
	--result.imie := null;
	--result.nazwisko := null;
	--FOR rec_temp IN select osoba_klient.id, id_osoba, imie.nazwa as imie, nazwisko from osoba_klient join osoba on osoba_klient.id_osoba = osoba.id join imie on osoba.id_imie = imie.id where osoba_klient.id_klient = klient_id LOOP
	--	result.id_osoba_klient[licznik] := rec_temp.id;
	--	result.id_osoba[licznik] := rec_temp.id_osoba;
	--	result.imie[licznik] := rec_temp.imie;
	--	result.nazwisko[licznik] := rec_temp.nazwisko;
	--	licznik := licznik + 1;
	--END LOOP;
	---sprawdzenie czy mamy do czynienia z osoba prawna
	select into os_prawna_id id from osobowosc where nazwa = '_osobaprawna';

	IF result.id_osobowosc = os_prawna_id THEN
		select into rec_dane_firma dane_firma.nazwa, dane_firma.nip, dane_firma.regon, dane_firma.krs, dane_firma.kod_pocztowy, dane_firma.id_region_geog, dane_firma.ulica, 
		dane_firma.numer_dom, dane_firma.numer_miesz, region_geog.nazwa as miejscowosc from dane_firma join region_geog on dane_firma.id_region_geog = region_geog.id where id_klient = klient_id;
		result.nazwa_firma := rec_dane_firma.nazwa;
		result.nip := rec_dane_firma.nip;
		result.regon := rec_dane_firma.regon;
		result.krs := rec_dane_firma.krs;
		result.kod := rec_dane_firma.kod_pocztowy;
		result.id_region_geog := rec_dane_firma.id_region_geog;
		result.miejscowosc := rec_dane_firma.miejscowosc;
		result.ulica := rec_dane_firma.ulica;
		result.numer_dom := rec_dane_firma.numer_dom;
		result.numer_miesz := rec_dane_firma.numer_miesz;
	END IF;
	
	RETURN result;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.edycjaklient(klient_id integer) OWNER TO postgres;

--
-- Name: edycjaoferta(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION edycjaoferta(id_oferta integer) RETURNS SETOF ofertanieruchomosc
    AS $$
DECLARE
	result OfertaNieruchomosc;
	rec_pods_dane SzukajOfertaNierView;
	rec_temp record;
	rec_temp_of record;
	osobowosc_id integer; 
	licznik integer;	
BEGIN
	select into rec_pods_dane * from SzybkieSzukanie (null, id_oferta);
	select into rec_temp id_nier_rodzaj, id_rodz_nier_szcz, id_region_geog, ulica_net, ulica, kod, data, rynek_pierw, klucz, agent.nazwa as agent from 
	nieruchomosc join agent on nieruchomosc.id_agent = agent.id where nieruchomosc.id = rec_pods_dane.id_nieruchomosc;

	select into rec_temp_of id_rodz_trans, id_status, data_otw_zlecenie, data_zam_zlecenie, cena, prowizja, prowizja_proc, wylacznosc, pokaz, czas_przekazania, przek_od_otwarcia, id_priorytet_reklama from oferta 
	where id_nieruchomosc = rec_pods_dane.id_nieruchomosc and oferta.id = id_oferta;
	select into osobowosc_id id_osobowosc from klient where klient.id = rec_pods_dane.id_klient;

	result.id_oferta := id_oferta;
	result.id_nieruchomosc := rec_pods_dane.id_nieruchomosc;
	result.id_klient := rec_pods_dane.id_klient;
	---result.id_osobowosc := osobowosc_id;
	result.id_nier_rodzaj := rec_temp.id_nier_rodzaj;
	result.id_rodz_nier_szcz := rec_temp.id_rodz_nier_szcz;
	result.id_rodz_trans := rec_temp_of.id_rodz_trans;
	result.id_status := rec_temp_of.id_status;
	result.id_region_geog := rec_temp.id_region_geog;
	result.agent := rec_temp.agent;
	result.ulica_net := rec_temp.ulica_net;
	result.ulica := rec_temp.ulica;
	result.kod := rec_temp.kod;

	select into result.miejscowosc nazwa from PelneZagnRegion(result.id_region_geog);

	result.data := rec_temp.data;
	result.rynek := rec_temp.rynek_pierw;
	result.klucz := rec_temp.klucz;
---2 rekord :)
	result.data_otw_zlecenie := rec_temp_of.data_otw_zlecenie;
	result.data_zam_zlecenie := rec_temp_of.data_zam_zlecenie;
	result.cena := rec_temp_of.cena;
	result.prowizja := rec_temp_of.prowizja;
	result.prow_proc := rec_temp_of.prowizja_proc;
	result.wylacznosc := rec_temp_of.wylacznosc;
	result.pokaz := rec_temp_of.pokaz;
	result.czas_przekazania := rec_temp_of.czas_przekazania;
	result.przek_od_otwarcia := rec_temp_of.przek_od_otwarcia;
	result.id_priorytet_reklama := rec_temp_of.id_priorytet_reklama;

	licznik := 1;
	FOR rec_temp IN select id_wyposazenie_nier from dane_slow_wyp_nier where id_nieruchomosc = rec_pods_dane.id_nieruchomosc LOOP
		result.dane_wyposazenie_nier[licznik] := rec_temp.id_wyposazenie_nier;
		licznik := licznik + 1;
	END LOOP;
	licznik := 1;
	FOR rec_temp IN select id_parametr_nier, wartosc from dane_txt_nier where id_nieruchomosc = rec_pods_dane.id_nieruchomosc LOOP
		result.dane_parametr_nier[licznik] := rec_temp.id_parametr_nier;
		result.dane_parametr_nier_wartosc[licznik] := rec_temp.wartosc;
		licznik := licznik + 1;
	END LOOP;
	--licznik := 1;
	--FOR rec_temp IN select id from pomieszczenie_przyn_nier where id_nieruchomosc = rec_pods_dane.id_nieruchomosc LOOP
	--	result.dane_pomieszczenie_przyn_nier[licznik] := rec_temp.id;
	--	licznik := licznik + 1;
	--END LOOP;
	IF result.id_nieruchomosc is not null THEN
		RETURN NEXT result;
	END IF;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.edycjaoferta(id_oferta integer) OWNER TO postgres;

--
-- Name: edycjaosoba(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION edycjaosoba(osoba_id integer) RETURNS osobaedycja
    AS $$
DECLARE
	result OsobaEdycja;
	rec_osoba record;
BEGIN
	select into rec_osoba osoba.id, id_imie, imie.nazwa as imie, nazwisko, nazwisko_rodowe, pesel, id_agent from osoba join imie on osoba.id_imie = imie.id where osoba.id = osoba_id;
	IF rec_osoba.id is not null THEN
		result.id_osoba := rec_osoba.id;
		result.id_imie := rec_osoba.id_imie;
		result.imie := rec_osoba.imie;
		result.nazwisko := rec_osoba.nazwisko;
		result.nazwisko_rodowe := rec_osoba.nazwisko_rodowe;
		result.pesel := rec_osoba.pesel;
		---result.nr_dowod := rec_osoba.nr_dowod;
		result.id_agent := rec_osoba.id_agent;
		---rec_osoba := null;
		select into rec_osoba kod_pocztowy, id_region_geog, region_geog.nazwa as region, ulica, numer_dom, numer_miesz from osoba_adres join region_geog on osoba_adres.id_region_geog = region_geog.id where osoba_adres.id = osoba_id;
		IF rec_osoba.id_region_geog is not null THEN
			result.kod := rec_osoba.kod_pocztowy;
			result.id_region_geog := rec_osoba.id_region_geog;
			result.region := rec_osoba.region;
			result.ulica := rec_osoba.ulica;
			result.numer_dom := rec_osoba.numer_dom;
			result.numer_miesz := rec_osoba.numer_miesz;
		END IF;

		return result;
	ELSE
		return null;
	END IF;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.edycjaosoba(osoba_id integer) OWNER TO postgres;

--
-- Name: edycjaparametrpom(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION edycjaparametrpom(pom_id integer) RETURNS SETOF pomieszczenieparamedycja
    AS $$
DECLARE
	result PomieszczenieParamEdycja;
BEGIN
	FOR result in select id_parametr_pom as id, wartosc from dane_txt_pom where id_pomieszczenie_przyn_nier = pom_id LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.edycjaparametrpom(pom_id integer) OWNER TO postgres;

--
-- Name: edycjapomieszczenianieruchomosc(integer[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION edycjapomieszczenianieruchomosc(tab_pom integer[]) RETURNS SETOF pomieszczenianieruchomosc
    AS $$
DECLARE
	rec_pomieszczenie record;
	result PomieszczeniaNieruchomosc;
	rec_temp record;
	licznik integer;
	licznik_par integer;
BEGIN
	licznik := 1;
	WHILE tab_pom[licznik] is not null LOOP
		select into rec_pomieszczenie pomieszczenie.nazwa, pomieszczenie_przyn_nier.nr_pomieszczenia from pomieszczenie join pomieszczenie_przyn_nier on pomieszczenie_przyn_nier.id_pomieszczenie = pomieszczenie.id where pomieszczenie_przyn_nier.id = tab_pom[licznik];
		result.id_pomieszczenie := tab_pom[licznik];
		result.nr_pomieszczenie := rec_pomieszczenie.nr_pomieszczenia;
		result.nazwa_pomieszczenie := rec_pomieszczenie.nazwa;
		result.dane_id_parametr_pom := null;
		result.dane_wartosc_parametr_pom := null;
		result.dane_id_wyposazenie_pom := null;
		licznik_par := 1;
		FOR rec_temp IN select id_parametr_pom, wartosc from dane_txt_pom where id_pomieszczenie_przyn_nier = tab_pom[licznik] LOOP
			result.dane_id_parametr_pom[licznik_par] := rec_temp.id_parametr_pom;
			result.dane_wartosc_parametr_pom[licznik_par] := rec_temp.wartosc;
			licznik_par := licznik_par + 1;
		END LOOP;
		licznik_par := 1;
		FOR rec_temp IN select id_wyposazenie_pom from dane_slow_wyp_pom where id_pomieszczenie_przyn_nier = tab_pom[licznik] LOOP
			result.dane_id_wyposazenie_pom[licznik_par] := rec_temp.id_wyposazenie_pom;
			licznik_par := licznik_par + 1;
		END LOOP;

		licznik := licznik + 1;
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.edycjapomieszczenianieruchomosc(tab_pom integer[]) OWNER TO postgres;

--
-- Name: agent; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE agent (
    id integer NOT NULL,
    id_otodom integer,
    nazwa text NOT NULL,
    nazwa_pot text,
    firma text,
    "login" character varying(40) NOT NULL,
    haslo character varying(40) NOT NULL,
    waznosc_haslo date NOT NULL,
    aktywnosc_konto boolean,
    telefon character varying(13),
    komorka character varying(13),
    fax character varying(13),
    email character varying(40) NOT NULL,
    wewnetrzny character varying(4),
    licencja integer,
    nadzor integer,
    nip character varying(13),
    adres text,
    dodawanie boolean,
    edycja boolean,
    kasowanie boolean,
    druk boolean,
    adm_klient boolean,
    adm_dane boolean,
    zmiana_upr boolean
);


ALTER TABLE public.agent OWNER TO postgres;

--
-- Name: imie; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE imie (
    id integer NOT NULL,
    nazwa character varying(60) NOT NULL
);


ALTER TABLE public.imie OWNER TO postgres;

--
-- Name: komorka; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE komorka (
    id_osoba integer,
    nazwa character varying(9) NOT NULL,
    opis text
);


ALTER TABLE public.komorka OWNER TO postgres;

--
-- Name: nier_rodzaj; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE nier_rodzaj (
    id integer NOT NULL,
    nazwa character varying(30) NOT NULL
);


ALTER TABLE public.nier_rodzaj OWNER TO postgres;

--
-- Name: osoba; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE osoba (
    id integer NOT NULL,
    id_old integer,
    id_imie integer NOT NULL,
    nazwisko character varying(30) NOT NULL,
    nazwisko_rodowe character varying(30),
    pesel character varying(15),
    id_agent integer
);


ALTER TABLE public.osoba OWNER TO postgres;

--
-- Name: osoba_adres; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE osoba_adres (
    id integer NOT NULL,
    kod_pocztowy character varying(6),
    id_region_geog integer,
    ulica character varying(40) NOT NULL,
    numer_dom character varying(10),
    numer_miesz character varying(10)
);


ALTER TABLE public.osoba_adres OWNER TO postgres;

--
-- Name: osoba_zapotrzebowanie; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE osoba_zapotrzebowanie (
    id integer NOT NULL,
    id_zapotrzebowanie integer NOT NULL,
    id_osoba integer NOT NULL
);


ALTER TABLE public.osoba_zapotrzebowanie OWNER TO postgres;

--
-- Name: region_geog; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE region_geog (
    id integer NOT NULL,
    id_parent integer,
    id_otodom integer,
    nazwa character varying(60) NOT NULL,
    zaglebienie integer,
    ma_dzieci boolean DEFAULT true,
    pokaz boolean DEFAULT true
);


ALTER TABLE public.region_geog OWNER TO postgres;

--
-- Name: telefon; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE telefon (
    id integer NOT NULL,
    id_osoba integer,
    nazwa character varying(13) NOT NULL,
    opis text
);


ALTER TABLE public.telefon OWNER TO postgres;

--
-- Name: osobaview; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW osobaview AS
    SELECT DISTINCT ON (osoba.id) osoba.id AS id_osoba, osoba.nazwisko, osoba.nazwisko_rodowe, imie.nazwa AS imie, osoba.pesel, telefon.nazwa AS telefon, komorka.nazwa AS komorka, region_geog.nazwa AS miejscowosc, (((((osoba_adres.ulica)::text || ' '::text) || (osoba_adres.numer_dom)::text) || ' / '::text) || (osoba_adres.numer_miesz)::text) AS ulica, osoba_adres.kod_pocztowy AS kod FROM (((((osoba JOIN imie ON ((osoba.id_imie = imie.id))) LEFT JOIN osoba_adres ON ((osoba.id = osoba_adres.id))) LEFT JOIN region_geog ON ((osoba_adres.id_region_geog = region_geog.id))) LEFT JOIN telefon ON ((osoba.id = telefon.id_osoba))) LEFT JOIN komorka ON ((osoba.id = komorka.id_osoba))) ORDER BY osoba.id;


ALTER TABLE public.osobaview OWNER TO postgres;

--
-- Name: status; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE status (
    id integer NOT NULL,
    nazwa character varying(20) NOT NULL
);


ALTER TABLE public.status OWNER TO postgres;

--
-- Name: zapotrzebowanie; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE zapotrzebowanie (
    id integer NOT NULL,
    id_klient integer NOT NULL,
    data date NOT NULL,
    data_otw_zlecenie date NOT NULL,
    data_zam_zlecenie date,
    id_agent integer NOT NULL
);


ALTER TABLE public.zapotrzebowanie OWNER TO postgres;

--
-- Name: zapotrztransnierrodzaj; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW zapotrztransnierrodzaj AS
    SELECT zapotrzebowanie.id AS id_zapotrzebowanie, zapotrzebowanie.id_klient, zapotrzebowanie.data_otw_zlecenie, zapotrzebowanie_trans_rodzaj.id AS id_zapotrzebowanie_trans_rodzaj, zapotrzebowanie_trans_rodzaj.id_status, status.nazwa AS status, nier_rodzaj.nazwa AS nieruchomosc_rodzaj, trans_rodzaj.nazwa_zap AS transakcja_rodzaj, (zapotrzebowanie_trans_rodzaj.cena)::double precision AS cena, zapotrzebowanie_trans_rodzaj.pokaz, zapotrzebowanie_nier_rodzaj.id_nier_rodzaj, zapotrzebowanie_trans_rodzaj.id_trans_rodzaj, agent.nazwa_pot AS agent, zapotrzebowanie.id_agent, osobaview.id_osoba, osobaview.nazwisko, osobaview.imie, osobaview.telefon, osobaview.komorka, osobaview.pesel FROM ((((((((zapotrzebowanie JOIN agent ON ((zapotrzebowanie.id_agent = agent.id))) JOIN zapotrzebowanie_nier_rodzaj ON ((zapotrzebowanie.id = zapotrzebowanie_nier_rodzaj.id_zapotrzebowanie))) JOIN zapotrzebowanie_trans_rodzaj ON ((zapotrzebowanie_nier_rodzaj.id = zapotrzebowanie_trans_rodzaj.id_zapotrzebowanie_nier_rodzaj))) JOIN status ON ((zapotrzebowanie_trans_rodzaj.id_status = status.id))) JOIN nier_rodzaj ON ((zapotrzebowanie_nier_rodzaj.id_nier_rodzaj = nier_rodzaj.id))) JOIN trans_rodzaj ON ((zapotrzebowanie_trans_rodzaj.id_trans_rodzaj = trans_rodzaj.id))) JOIN osoba_zapotrzebowanie ON ((zapotrzebowanie.id = osoba_zapotrzebowanie.id_zapotrzebowanie))) JOIN osobaview ON ((osoba_zapotrzebowanie.id_osoba = osobaview.id_osoba)));


ALTER TABLE public.zapotrztransnierrodzaj OWNER TO postgres;

--
-- Name: edycjatransnierzapotrzebowanie(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION edycjatransnierzapotrzebowanie(zapotrzebowanie_trans_rodzaj_id integer) RETURNS zapotrztransnierrodzaj
    AS $$
DECLARE
	---id_zapotrzebowanie_trans_rodzaj
	result ZapotrzTransNierRodzaj;
BEGIN
	select into result * from ZapotrzTransNierRodzaj where id_zapotrzebowanie_trans_rodzaj = zapotrzebowanie_trans_rodzaj_id;
	return result;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.edycjatransnierzapotrzebowanie(zapotrzebowanie_trans_rodzaj_id integer) OWNER TO postgres;

--
-- Name: edycjawyposazeniepom(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION edycjawyposazeniepom(pom_id integer) RETURNS SETOF integer
    AS $$
DECLARE
	result record;
BEGIN
	FOR result in select id_wyposazenie_pom as id from dane_slow_wyp_pom where id_pomieszczenie_przyn_nier = pom_id LOOP
		RETURN NEXT result.id;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.edycjawyposazeniepom(pom_id integer) OWNER TO postgres;

--
-- Name: edycjazapotrzebowanie(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION edycjazapotrzebowanie(zapotrzebowanie_id integer) RETURNS zapotrzebowanienieruchomosc
    AS $$
DECLARE
	result ZapotrzebowanieNieruchomosc;
	rec_temp record;
	licznik integer;	
BEGIN
	select into rec_temp zapotrzebowanie.id, id_klient, data_otw_zlecenie, data_zam_zlecenie, agent.nazwa as agent from 
	zapotrzebowanie join agent on zapotrzebowanie.id_agent = agent.id where zapotrzebowanie.id = zapotrzebowanie_id;

	result.id_zapotrzebowanie := zapotrzebowanie_id;
	result.id_klient := rec_temp.id_klient;
	result.agent := rec_temp.agent;
	result.data_otw_zlecenie := rec_temp.data_otw_zlecenie;
	result.data_zam_zlecenie := rec_temp.data_zam_zlecenie;

	licznik := 1;
	FOR rec_temp IN select id_nier_rodzaj from zapotrzebowanie_nier_rodzaj where id_zapotrzebowanie = zapotrzebowanie_id LOOP
		result.id_nier_rodzaj[licznik] := rec_temp.id_nier_rodzaj;
		licznik := licznik + 1;
	END LOOP;

	RETURN result;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.edycjazapotrzebowanie(zapotrzebowanie_id integer) OWNER TO postgres;

--
-- Name: edycjazaptransrodzajwyppar(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION edycjazaptransrodzajwyppar(zapotrzebowanie_trans_rodzaj_id integer) RETURNS zapotrzebowanienieruchomoscwyppar
    AS $$
DECLARE
	licznik integer;
	rec_temp record;
	result ZapotrzebowanieNieruchomoscWypPar;
BEGIN
	result.id_zapotrzebowanie_trans_rodzaj := zapotrzebowanie_trans_rodzaj_id;
	licznik := 1;
	FOR rec_temp IN select id_wyposazenie_nier from dane_slow_wyp_zap where id_zapotrzebowanie_trans_rodzaj = zapotrzebowanie_trans_rodzaj_id LOOP
		result.dane_wyposazenie_zap[licznik] := rec_temp.id_wyposazenie_nier;
		licznik := licznik + 1;
	END LOOP;
	licznik := 1;
	FOR rec_temp IN select id_parametr_nier, wartosc from dane_txt_zap_min where id_zapotrzebowanie_trans_rodzaj = zapotrzebowanie_trans_rodzaj_id LOOP
		result.dane_parametr_zap_min[licznik] := rec_temp.id_parametr_nier;
		result.dane_parametr_zap_min_wartosc[licznik] := rec_temp.wartosc;
		licznik := licznik + 1;
	END LOOP;
	licznik := 1;
	FOR rec_temp IN select id_parametr_nier, wartosc from dane_txt_zap_max where id_zapotrzebowanie_trans_rodzaj = zapotrzebowanie_trans_rodzaj_id LOOP
		result.dane_parametr_zap_max[licznik] := rec_temp.id_parametr_nier;
		result.dane_parametr_zap_max_wartosc[licznik] := rec_temp.wartosc;
		licznik := licznik + 1;
	END LOOP;
	return result;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.edycjazaptransrodzajwyppar(zapotrzebowanie_trans_rodzaj_id integer) OWNER TO postgres;

--
-- Name: media_nieruchomosc; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE media_nieruchomosc (
    id integer NOT NULL,
    id_nier_rodzaj integer NOT NULL,
    id_trans_rodzaj integer NOT NULL,
    id_region_geog integer,
    id_status integer NOT NULL,
    id_agent integer NOT NULL,
    data date NOT NULL,
    ulica text,
    oferent boolean,
    powierzchnia character varying(10),
    cena character varying(15),
    opis text,
    przypomnienie date,
    id_media_reklama integer NOT NULL,
    id_osoba integer,
    id_of_zap integer
);


ALTER TABLE public.media_nieruchomosc OWNER TO postgres;

--
-- Name: medianieruchomoscedycja; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW medianieruchomoscedycja AS
    SELECT media_nieruchomosc.id AS id_media_nieruchomosc, media_nieruchomosc.id_nier_rodzaj, media_nieruchomosc.id_trans_rodzaj, media_nieruchomosc.id_region_geog, region_geog.nazwa AS region, media_nieruchomosc.ulica, media_nieruchomosc.powierzchnia, media_nieruchomosc.cena, media_nieruchomosc.opis, media_nieruchomosc.id_status, media_nieruchomosc.data, media_nieruchomosc.oferent, media_nieruchomosc.przypomnienie, agent.nazwa_pot AS agent, media_nieruchomosc.id_osoba, media_nieruchomosc.id_of_zap, imie.nazwa AS imie, osoba.nazwisko FROM ((((media_nieruchomosc LEFT JOIN region_geog ON ((media_nieruchomosc.id_region_geog = region_geog.id))) JOIN agent ON ((media_nieruchomosc.id_agent = agent.id))) LEFT JOIN osoba ON ((media_nieruchomosc.id_osoba = osoba.id))) LEFT JOIN imie ON ((osoba.id_imie = imie.id)));


ALTER TABLE public.medianieruchomoscedycja OWNER TO postgres;

--
-- Name: edytujmedianieruchomosc(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION edytujmedianieruchomosc(media_nieruchomosc_id integer) RETURNS medianieruchomoscedycja
    AS $$
DECLARE
	result MediaNieruchomoscEdycja;
BEGIN
	--media_nieruchomosc.id_region_geog
	select into result * from MediaNieruchomoscEdycja where id_media_nieruchomosc = media_nieruchomosc_id;
	select into result.region nazwa from PelneZagnRegion(result.id_region_geog);
	RETURN result;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.edytujmedianieruchomosc(media_nieruchomosc_id integer) OWNER TO postgres;

--
-- Name: explode(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION explode(datatoexplode text) RETURNS text[]
    AS $$
DECLARE
	res text[];
BEGIN
	--trim(substring(text_msc from 1 for position(text_to_pos in text_msc) - 1))
	res[1] = trim(substring(datatoexplode from 1 for position('.' in datatoexplode) - 1));
	res[2] = trim(substring(datatoexplode from position('.' in datatoexplode) + 1 for (character_length(datatoexplode) - character_length(res[1]))));

	return res;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.explode(datatoexplode text) OWNER TO postgres;

--
-- Name: filtracjapodstawowewersjeofert(integer, integer, double precision, double precision, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION filtracjapodstawowewersjeofert(nier_rodzaj_id integer, trans_rodzaj_id integer, pow_min double precision, pow_max double precision, cena_max text) RETURNS SETOF oferty_wersja_pods
    AS $$
DECLARE
	result oferty_wersja_pods;
	zapytanie text;
	andphr boolean;
BEGIN
	andphr := false;
	zapytanie := 'select * from PodstawoweWersjeOfert(' || nier_rodzaj_id || ', ' || trans_rodzaj_id || ') where';
	--powierzchnia between ' || pow_min || ' and ' || pow_max;
	IF pow_min is not null THEN
		
		zapytanie := zapytanie || ' powierzchnia >= ' || pow_min;
		andphr := true;
	END IF;
	IF pow_max is not null THEN
		IF andphr = true THEN
			zapytanie := zapytanie || ' and';
		END IF;
		zapytanie := zapytanie || ' powierzchnia <= ' || pow_max;
		andphr := true;
	END IF;
	IF character_length (cena_max) > 0 THEN
		IF andphr = true THEN
			zapytanie := zapytanie || ' and';
		END IF;
		zapytanie := zapytanie || ' cena::float <= ' || cena_max::float;
	END IF;
	zapytanie := zapytanie || ' order by cena::float;';
	--cena::float <= cena_max and 
	FOR result in execute zapytanie LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.filtracjapodstawowewersjeofert(nier_rodzaj_id integer, trans_rodzaj_id integer, pow_min double precision, pow_max double precision, cena_max text) OWNER TO postgres;

--
-- Name: nieruchomosc; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE nieruchomosc (
    id integer NOT NULL,
    id_old integer,
    id_nier_rodzaj integer NOT NULL,
    id_rodz_nier_szcz integer,
    id_klient integer NOT NULL,
    id_region_geog integer,
    ulica_net text,
    ulica text,
    kod character varying(6),
    id_agent integer NOT NULL,
    data date NOT NULL,
    rynek_pierw boolean,
    klucz boolean DEFAULT false
);


ALTER TABLE public.nieruchomosc OWNER TO postgres;

--
-- Name: oferta; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE oferta (
    id integer NOT NULL,
    id_old integer,
    id_rodz_trans integer NOT NULL,
    id_nieruchomosc integer NOT NULL,
    id_status integer,
    data date NOT NULL,
    data_otw_zlecenie date NOT NULL,
    data_zam_zlecenie date,
    cena character varying(15) NOT NULL,
    prowizja_proc boolean,
    prowizja character varying(7),
    wylacznosc boolean,
    pokaz boolean,
    czas_przekazania integer,
    przek_od_otwarcia boolean DEFAULT false,
    id_priorytet_reklama integer
);


ALTER TABLE public.oferta OWNER TO postgres;

--
-- Name: oferty; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW oferty AS
    SELECT oferta.id AS id_oferta, oferta.id_status, oferta.pokaz, oferta.wylacznosc, nieruchomosc.klucz, status.nazwa AS status, oferta.id_rodz_trans, nieruchomosc.id_nier_rodzaj, nier_rodzaj.nazwa AS nieruchomosc_rodzaj, trans_rodzaj.nazwa AS transakcja_rodzaj, oferta.data_otw_zlecenie, (oferta.cena)::double precision AS cena, nieruchomosc.ulica_net, agent.nazwa_pot AS agent, nieruchomosc.id_agent FROM (((((oferta JOIN status ON ((oferta.id_status = status.id))) JOIN nieruchomosc ON ((oferta.id_nieruchomosc = nieruchomosc.id))) JOIN trans_rodzaj ON ((oferta.id_rodz_trans = trans_rodzaj.id))) JOIN nier_rodzaj ON ((nieruchomosc.id_nier_rodzaj = nier_rodzaj.id))) JOIN agent ON ((nieruchomosc.id_agent = agent.id)));


ALTER TABLE public.oferty OWNER TO postgres;

--
-- Name: filtrujoferty(integer, integer, integer, integer, text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION filtrujoferty(nier_rodzaj_id integer, trans_rodzaj_id integer, status_id integer, agent_id integer, sort_kol text, sort_kier integer) RETURNS SETOF oferty
    AS $$
DECLARE
	result Oferty;
	kolumna_sort text;
	porzadek text;
	zapytanie text;
BEGIN
	IF sort_kol is null or character_length(sort_kol) = 0 THEN
		kolumna_sort := 'data_otw_zlecenie';
	ELSE
		kolumna_sort := sort_kol;
	END IF;
	IF sort_kier = 1 THEN
		--sortowanie rosnace
		porzadek := 'asc';
	ELSE
		porzadek := 'desc';
	END IF;
	zapytanie := 'select * from oferty where id_rodz_trans = '|| trans_rodzaj_id || ' and id_nier_rodzaj = ' || nier_rodzaj_id || ' and id_status = ' || status_id;
	IF agent_id is not null and agent_id > 0 THEN
		zapytanie := zapytanie || ' and id_agent = ' || agent_id;
	END IF;
	zapytanie := zapytanie || ' order by ' || kolumna_sort || ' ' || porzadek;
	FOR result in execute zapytanie LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.filtrujoferty(nier_rodzaj_id integer, trans_rodzaj_id integer, status_id integer, agent_id integer, sort_kol text, sort_kier integer) OWNER TO postgres;

--
-- Name: filtrujzapotrzebowania(integer, integer, integer, integer, text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION filtrujzapotrzebowania(nier_rodzaj_id integer, trans_rodzaj_id integer, status_id integer, agent_id integer, sort_kol text, sort_kier integer) RETURNS SETOF zapotrztransnierrodzaj
    AS $$
DECLARE
	result ZapotrzTransNierRodzaj;
	kolumna_sort text;
	porzadek text;
	zapytanie text;
BEGIN
	IF sort_kol is null or character_length(sort_kol) = 0 THEN
		kolumna_sort := 'data_otw_zlecenie';
	ELSE
		kolumna_sort := sort_kol;
	END IF;
	IF sort_kier = 1 THEN
		--sortowanie rosnace
		porzadek := 'asc';
	ELSE
		porzadek := 'desc';
	END IF;
	zapytanie := 'select * from ZapotrzTransNierRodzaj where id_trans_rodzaj = '|| trans_rodzaj_id || ' and id_nier_rodzaj = ' || nier_rodzaj_id || ' and id_status = ' || status_id;
	IF agent_id > 0 THEN
		zapytanie := zapytanie || ' and id_agent = ' || agent_id;
	END IF;
	zapytanie := zapytanie || ' order by ' ||	kolumna_sort || ' ' || porzadek;
	FOR result in execute zapytanie LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.filtrujzapotrzebowania(nier_rodzaj_id integer, trans_rodzaj_id integer, status_id integer, agent_id integer, sort_kol text, sort_kier integer) OWNER TO postgres;

--
-- Name: godzina; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE godzina (
    id integer NOT NULL,
    nazwa character varying(2) NOT NULL
);


ALTER TABLE public.godzina OWNER TO postgres;

--
-- Name: kalendarz; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE kalendarz (
    id integer NOT NULL,
    data date NOT NULL,
    id_godzina integer NOT NULL,
    id_minuta integer NOT NULL,
    id_spotkanie integer,
    komentarz text
);


ALTER TABLE public.kalendarz OWNER TO postgres;

--
-- Name: minuta; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE minuta (
    id integer NOT NULL,
    nazwa character varying(2) NOT NULL
);


ALTER TABLE public.minuta OWNER TO postgres;

--
-- Name: listakalendarz; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW listakalendarz AS
    SELECT kalendarz.id AS id_kalendarz, kalendarz.data, (((godzina.nazwa)::text || ' : '::text) || (minuta.nazwa)::text) AS godzina, kalendarz.komentarz, 'miejsce' AS agent FROM ((kalendarz JOIN godzina ON ((kalendarz.id_godzina = godzina.id))) JOIN minuta ON ((kalendarz.id_minuta = minuta.id)));


ALTER TABLE public.listakalendarz OWNER TO postgres;

--
-- Name: kalendarzadm(integer, date, date); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION kalendarzadm(agent_id integer, data_od date, data_do date) RETURNS SETOF listakalendarz
    AS $$
DECLARE
	rec_dane ListaKalendarz;
BEGIN
	FOR rec_dane in select * from ListaKalendarz join agent_kalendarz on ListaKalendarz.id_kalendarz = agent_kalendarz.id_kalendarz where agent_kalendarz.id_agent = agent_id and 
	data between data_od and data_do order by data, godzina asc LOOP
		select into rec_dane.agent AgenciWpisKalendarz(rec_dane.id_kalendarz);
		RETURN NEXT rec_dane;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.kalendarzadm(agent_id integer, data_od date, data_do date) OWNER TO postgres;

--
-- Name: kasujregiongeog(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION kasujregiongeog(region_id integer) RETURNS boolean
    AS $$
DECLARE
	test integer;
	parent_id integer;
BEGIN
	select into test id from region_geog where id_parent = region_id;
	select into parent_id id_parent from region_geog where id = region_id;
	IF test is null THEN
		----moze byc uzywane na bazie gdzies, blok exception nie zaszkodzi
		delete from region_geog where id = region_id;
		select into test count(id) from region_geog where id_parent = parent_id;
		IF test = 0 THEN
			update region_geog set ma_dzieci = false where id = parent_id;
		END IF;
		RETURN true;
	ELSE
		RETURN false;
	END IF;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.kasujregiongeog(region_id integer) OWNER TO postgres;

--
-- Name: kojarzeniebazowedlaoferty(integer, integer, integer, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION kojarzeniebazowedlaoferty(oferta_id integer, poziom_param integer, poziom_wyp integer, nowe boolean) RETURNS SETOF zapotrztransnierrodzaj
    AS $$
DECLARE
	result ZapotrzTransNierRodzaj;
	rec_temp record;
	lokalizacja_bool boolean;
	param_bool boolean;
	wypos_bool boolean;
	proc_podn float;
	proc_obn float;
	nieruchomosc_id integer;
	par_poziom integer;
	wyp_poziom integer;
	pozwolenie boolean;
BEGIN
	select into rec_temp baza from precyzja_kojarzenie where nazwa = 'cena';
	proc_podn := 1;
	proc_obn := 1;
	proc_podn := proc_podn + (proc_podn * (rec_temp.baza::float / 100))::float;
	proc_obn := proc_obn - (proc_obn * (rec_temp.baza::float / 100))::float;
	FOR rec_temp IN select * from KojarzenieBazoweOferta_Zapotrzebowanie where id_oferta = oferta_id and 
	cena_zapotrzebowanie >= (cena_oferta * proc_obn) LOOP ---between (cena_oferta * proc_podn) and
		select into pozwolenie SprawdzObecnoscOfZlec (rec_temp.id_oferta, rec_temp.id_zapotrzebowanie, nowe, rec_temp.cena_oferta);
		IF pozwolenie = true THEN
			select into nieruchomosc_id oferta.id_nieruchomosc from oferta where oferta.id = oferta_id;
			select into lokalizacja_bool KojarzenieLokalizacje(nieruchomosc_id, rec_temp.id_zapotrzebowanie_trans_rodzaj);
			IF lokalizacja_bool = true THEN
				par_poziom := 1;
				wyp_poziom := 1;
				pozwolenie := true;
				IF poziom_param > 0 THEN
					WHILE par_poziom <= poziom_param and pozwolenie = true LOOP
						select into param_bool KojarzenieNpoziomowe (nieruchomosc_id, rec_temp.id_zapotrzebowanie_trans_rodzaj, par_poziom);
						IF param_bool = false THEN
							pozwolenie := false;
						END IF;
						par_poziom := par_poziom + 1;
					END LOOP;
				END IF;
				---poziom wyposazenie
				IF poziom_wyp > 0 THEN
					WHILE wyp_poziom <= poziom_wyp and pozwolenie = true LOOP
						select into wypos_bool KojarzenieNpoziomoweWyp (nieruchomosc_id, rec_temp.id_zapotrzebowanie_trans_rodzaj, wyp_poziom);
						IF wypos_bool = false THEN
							pozwolenie := false;
						END IF;
						wyp_poziom := wyp_poziom + 1;
					END LOOP;
				END IF;
				IF pozwolenie = true THEN
					select into result * from ZapotrzTransNierRodzaj where id_zapotrzebowanie_trans_rodzaj = rec_temp.id_zapotrzebowanie_trans_rodzaj;--(null, rec_temp.id_zapotrzebowanie);
					RETURN NEXT result;
				END IF;
			END IF;
		END IF;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.kojarzeniebazowedlaoferty(oferta_id integer, poziom_param integer, poziom_wyp integer, nowe boolean) OWNER TO postgres;

--
-- Name: osoba_oferta; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE osoba_oferta (
    id integer NOT NULL,
    id_oferta integer NOT NULL,
    id_osoba integer NOT NULL
);


ALTER TABLE public.osoba_oferta OWNER TO postgres;

--
-- Name: szukajofertanierview; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW szukajofertanierview AS
    SELECT oferta.id AS id_oferta, oferta.id_rodz_trans, oferta.pokaz, oferta.wylacznosc, oferta.data_otw_zlecenie, nieruchomosc.klucz, nieruchomosc.ulica_net, nieruchomosc.id AS id_nieruchomosc, nieruchomosc.id_klient, nieruchomosc.id_nier_rodzaj, region_geog.nazwa AS miejscowosc, osobaview.id_osoba, (((osobaview.nazwisko)::text || ' '::text) || (osobaview.imie)::text) AS nazwisko, oferta.id_status, osobaview.pesel, osobaview.telefon, osobaview.komorka, trans_rodzaj.nazwa AS transakcja_rodzaj, nier_rodzaj.nazwa AS nieruchomosc_rodzaj, oferta.cena, status.nazwa AS status, nieruchomosc.id_agent, nieruchomosc.ulica FROM (((((((oferta JOIN nieruchomosc ON ((oferta.id_nieruchomosc = nieruchomosc.id))) JOIN status ON ((oferta.id_status = status.id))) JOIN nier_rodzaj ON ((nieruchomosc.id_nier_rodzaj = nier_rodzaj.id))) JOIN trans_rodzaj ON ((oferta.id_rodz_trans = trans_rodzaj.id))) JOIN osoba_oferta ON ((oferta.id = osoba_oferta.id_oferta))) JOIN osobaview ON ((osoba_oferta.id_osoba = osobaview.id_osoba))) JOIN region_geog ON ((nieruchomosc.id_region_geog = region_geog.id)));


ALTER TABLE public.szukajofertanierview OWNER TO postgres;

--
-- Name: kojarzeniebazowedlazapotrzebowania(integer, integer, integer, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION kojarzeniebazowedlazapotrzebowania(zapotrzebowanie_trans_rodzaj_id integer, poziom_param integer, poziom_wyp integer, nowe boolean) RETURNS SETOF szukajofertanierview
    AS $$
DECLARE
	result SzukajOfertaNierView;
	rec_temp record;
	lokalizacja_bool boolean;
	param_bool boolean;
	wypos_bool boolean;
	proc_podn float;
	proc_obn float;
	nieruchomosc_id integer;
	par_poziom integer;
	wyp_poziom integer;
	pozwolenie boolean;
BEGIN
	select into rec_temp baza from precyzja_kojarzenie where nazwa = 'cena';
	proc_podn := 1;
	proc_obn := 1;
	proc_podn := proc_podn + (proc_podn * (rec_temp.baza::float / 100))::float;
	proc_obn := proc_obn - (proc_obn * (rec_temp.baza::float / 100))::float;
	FOR rec_temp IN select * from KojarzenieBazoweZapotrzebowanie_Oferta where id_zapotrzebowanie_trans_rodzaj = zapotrzebowanie_trans_rodzaj_id and 
	cena_oferta <= (cena_zapotrzebowanie * proc_podn) LOOP ---between (cena_zapotrzebowanie * proc_obn) and
		select into pozwolenie SprawdzObecnoscOfZlec (rec_temp.id_oferta, rec_temp.id_zapotrzebowanie, nowe, rec_temp.cena_oferta);
		IF pozwolenie = true THEN
			select into nieruchomosc_id oferta.id_nieruchomosc from oferta where oferta.id = rec_temp.id_oferta;
			select into lokalizacja_bool KojarzenieLokalizacje(nieruchomosc_id, zapotrzebowanie_trans_rodzaj_id);
			IF lokalizacja_bool = true THEN
				---przejazd po kojarzeniu parametrycznym, jesli sie nie przestawi na : IF param_bool = false THEN to odda cosik z szybkiego szukania (hope so :P)
				par_poziom := 1;
				wyp_poziom := 1;
				pozwolenie := true;
				IF poziom_param > 0 THEN
					---sprawdzamy czy na nizszym, bardziej podstawowym poziomie kojarzenie nie podalo false, gdyz wyzsze sa dluzsze i ciezsze a nizsze duzo bardziej istotne, oszczednosc zasobow
					WHILE par_poziom <= poziom_param and pozwolenie = true LOOP
						select into param_bool KojarzenieNpoziomowe (nieruchomosc_id, zapotrzebowanie_trans_rodzaj_id, par_poziom);
						IF param_bool = false THEN
							pozwolenie := false;
						END IF;
						par_poziom := par_poziom + 1;
					END LOOP;
				END IF;
				---poziom wyposazenie
				IF poziom_wyp > 0 THEN
					WHILE wyp_poziom <= poziom_wyp and pozwolenie = true LOOP
						select into wypos_bool KojarzenieNpoziomoweWyp (nieruchomosc_id, zapotrzebowanie_trans_rodzaj_id, wyp_poziom);
						IF wypos_bool = false THEN
							pozwolenie := false;
						END IF;
						wyp_poziom := wyp_poziom + 1;
					END LOOP;
				END IF;
				IF pozwolenie = true THEN
					select into result * from SzybkieSzukanie(null, rec_temp.id_oferta);
					RETURN NEXT result;
				END IF;
			END IF;
		END IF;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.kojarzeniebazowedlazapotrzebowania(zapotrzebowanie_trans_rodzaj_id integer, poziom_param integer, poziom_wyp integer, nowe boolean) OWNER TO postgres;

--
-- Name: kojarzenielokalizacje(integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION kojarzenielokalizacje(nieruchomosc_id integer, zapotrzebowanie_trans_rodzaj_id integer) RETURNS boolean
    AS $$
DECLARE
	result boolean;
	region_id_nier integer;
	test integer;
BEGIN
	select into region_id_nier id_region_geog from nieruchomosc where nieruchomosc.id = nieruchomosc_id;
	select into test count(id) from zap_lokaliz_nier where id_zapotrzebowanie_trans_rodzaj = zapotrzebowanie_trans_rodzaj_id and id_region_geog in (select RegionNajnGalazRodzice as id from RegionNajnGalazRodzice(region_id_nier));
	IF test > 0 THEN
		RETURN true;
	ELSE
		RETURN false;
	END IF;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.kojarzenielokalizacje(nieruchomosc_id integer, zapotrzebowanie_trans_rodzaj_id integer) OWNER TO postgres;

--
-- Name: kojarzenielokalizacjemedia(integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION kojarzenielokalizacjemedia(media_of_id integer, media_zap_id integer) RETURNS boolean
    AS $$
DECLARE
	result boolean;
	region_id_of integer;
	test integer;
BEGIN
	select into region_id_of id_region_geog from media_nieruchomosc where id = media_of_id;
	select into test count(id) from media_nieruchomosc where id = media_zap_id and id_region_geog in (select RegionNajnGalazRodzice as id from RegionNajnGalazRodzice(region_id_of));
	IF test > 0 THEN
		RETURN true;
	ELSE
		RETURN false;
	END IF;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.kojarzenielokalizacjemedia(media_of_id integer, media_zap_id integer) OWNER TO postgres;

--
-- Name: kojarzenielokalizacjemediaoferta(integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION kojarzenielokalizacjemediaoferta(nieruchomosc_id integer, media_zap_id integer) RETURNS boolean
    AS $$
DECLARE
	result boolean;
	region_id_nier integer;
	test integer;
BEGIN
	select into region_id_nier id_region_geog from nieruchomosc where nieruchomosc.id = nieruchomosc_id;
	select into test count(id) from media_nieruchomosc where id = media_zap_id and id_region_geog in (select RegionNajnGalazRodzice as id from RegionNajnGalazRodzice(region_id_nier));
	IF test > 0 THEN
		RETURN true;
	ELSE
		RETURN false;
	END IF;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.kojarzenielokalizacjemediaoferta(nieruchomosc_id integer, media_zap_id integer) OWNER TO postgres;

--
-- Name: kojarzenielokalizacjemediazapotrzebowanie(integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION kojarzenielokalizacjemediazapotrzebowanie(media_of_id integer, zapotrzebowanie_trans_rodzaj_id integer) RETURNS boolean
    AS $$
DECLARE
	result boolean;
	region_id_of integer;
	test integer;
BEGIN
	select into region_id_of id_region_geog from media_nieruchomosc where id = media_of_id;
	select into test count(id) from zap_lokaliz_nier where id_zapotrzebowanie_trans_rodzaj = zapotrzebowanie_trans_rodzaj_id and id_region_geog in (select RegionNajnGalazRodzice as id from RegionNajnGalazRodzice(region_id_of));
	IF test > 0 THEN
		RETURN true;
	ELSE
		RETURN false;
	END IF;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.kojarzenielokalizacjemediazapotrzebowanie(media_of_id integer, zapotrzebowanie_trans_rodzaj_id integer) OWNER TO postgres;

--
-- Name: media_reklama; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE media_reklama (
    id integer NOT NULL,
    nazwa text NOT NULL
);


ALTER TABLE public.media_reklama OWNER TO postgres;

--
-- Name: telefon_media_nieruchomosc; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE telefon_media_nieruchomosc (
    id integer NOT NULL,
    id_media_nieruchomosc integer NOT NULL,
    nazwa character varying(13) NOT NULL,
    opis character varying(100)
);


ALTER TABLE public.telefon_media_nieruchomosc OWNER TO postgres;

--
-- Name: medianieruchomosc; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW medianieruchomosc AS
    SELECT DISTINCT ON (media_nieruchomosc.id) media_nieruchomosc.id AS id_media_nieruchomosc, nier_rodzaj.nazwa AS nieruchomosc_rodzaj, media_nieruchomosc.cena, trans_rodzaj.nazwa AS transakcja_rodzaj, media_nieruchomosc.id_region_geog, region_geog.nazwa AS region, media_nieruchomosc.ulica, status.nazwa AS status, media_nieruchomosc.id_status, media_nieruchomosc.data, media_nieruchomosc.oferent, media_nieruchomosc.przypomnienie, agent.nazwa_pot AS agent, media_nieruchomosc.id_agent, telefon_media_nieruchomosc.nazwa AS telefon, media_nieruchomosc.id_osoba, media_nieruchomosc.id_of_zap, media_nieruchomosc.id_nier_rodzaj, media_nieruchomosc.id_trans_rodzaj, media_reklama.nazwa AS media_reklama FROM (((((((media_nieruchomosc JOIN nier_rodzaj ON ((media_nieruchomosc.id_nier_rodzaj = nier_rodzaj.id))) JOIN trans_rodzaj ON ((media_nieruchomosc.id_trans_rodzaj = trans_rodzaj.id))) LEFT JOIN region_geog ON ((media_nieruchomosc.id_region_geog = region_geog.id))) JOIN status ON ((media_nieruchomosc.id_status = status.id))) JOIN agent ON ((media_nieruchomosc.id_agent = agent.id))) JOIN media_reklama ON ((media_nieruchomosc.id_media_reklama = media_reklama.id))) LEFT JOIN telefon_media_nieruchomosc ON ((media_nieruchomosc.id = telefon_media_nieruchomosc.id_media_nieruchomosc))) ORDER BY media_nieruchomosc.id;


ALTER TABLE public.medianieruchomosc OWNER TO postgres;

--
-- Name: kojarzeniemedia(integer, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION kojarzeniemedia(media_nieruchomosc_id integer, is_oferent boolean) RETURNS SETOF medianieruchomosc
    AS $$
DECLARE
	result MediaNieruchomosc;
	skoj_pods KojarzenieBazoweMedia_Media;
	baza_przes float;
	proc_podn float;
	proc_obn float;
	lokalizacja_bool boolean;
BEGIN
	select into baza_przes baza::float from precyzja_kojarzenie where nazwa = 'cena';
	proc_podn := 1;
	proc_obn := 1;
	proc_podn := proc_podn + (proc_podn * (baza_przes / 100))::float;
	proc_obn := proc_obn - (proc_obn * (baza_przes / 100))::float;
	IF is_oferent = true THEN
		FOR skoj_pods IN select * from KojarzenieBazoweMedia_Media where id_media_nieruchomosc_o = media_nieruchomosc_id and 
		cena_zapotrzebowanie between (cena_oferta * proc_obn) and (cena_oferta * proc_podn) LOOP
			select into lokalizacja_bool KojarzenieLokalizacjeMedia (skoj_pods.id_media_nieruchomosc_o, skoj_pods.id_media_nieruchomosc_z);
			IF lokalizacja_bool = true THEN ---podajemy znalezione poszukiwane, bo szukamy dla proponujacego
				select into result * from MediaNieruchomosc where id_media_nieruchomosc = skoj_pods.id_media_nieruchomosc_z;
				RETURN NEXT result;
			END IF;
		END LOOP;
	ELSE
		FOR skoj_pods IN select * from KojarzenieBazoweMedia_Media where id_media_nieruchomosc_z = media_nieruchomosc_id and 
		cena_zapotrzebowanie between (cena_oferta * proc_obn) and (cena_oferta * proc_podn) LOOP
			select into lokalizacja_bool KojarzenieLokalizacjeMedia (skoj_pods.id_media_nieruchomosc_o, skoj_pods.id_media_nieruchomosc_z);
			IF lokalizacja_bool = true THEN ---podajemy znalezione oferowane, bo szukalismy dla szukajacych
				select into result * from MediaNieruchomosc where id_media_nieruchomosc = skoj_pods.id_media_nieruchomosc_o;
				RETURN NEXT result;
			END IF;
		END LOOP;
	END IF;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.kojarzeniemedia(media_nieruchomosc_id integer, is_oferent boolean) OWNER TO postgres;

--
-- Name: kojarzeniemediaoferta(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION kojarzeniemediaoferta(media_nieruchomosc_id integer) RETURNS SETOF szukajofertanierview
    AS $$
DECLARE
	result SzukajOfertaNierView;
	skoj_pods KojarzenieBazoweOferta_Media;
	baza_przes float;
	proc_podn float;
	proc_obn float;
	lokalizacja_bool boolean;
	nieruchomosc_id integer;
BEGIN
	select into baza_przes baza::float from precyzja_kojarzenie where nazwa = 'cena';
	proc_podn := 1;
	proc_obn := 1;
	proc_podn := proc_podn + (proc_podn * (baza_przes / 100))::float;
	proc_obn := proc_obn - (proc_obn * (baza_przes / 100))::float;
	FOR skoj_pods IN select * from KojarzenieBazoweOferta_Media where id_media_nieruchomosc = media_nieruchomosc_id and 
	cena_media >= (cena_oferta * proc_obn) LOOP
		select into nieruchomosc_id oferta.id_nieruchomosc from oferta where oferta.id = skoj_pods.id_oferta;
		select into lokalizacja_bool KojarzenieLokalizacjeMediaOferta (nieruchomosc_id, skoj_pods.id_media_nieruchomosc);
		IF lokalizacja_bool = true THEN
			select into result * from SzukajOfertaNierView where id_oferta = skoj_pods.id_oferta;
			RETURN NEXT result;
		END IF;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.kojarzeniemediaoferta(media_nieruchomosc_id integer) OWNER TO postgres;

--
-- Name: kojarzeniemediazapotrzebowanie(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION kojarzeniemediazapotrzebowanie(media_nieruchomosc_id integer) RETURNS SETOF zapotrztransnierrodzaj
    AS $$
DECLARE
	result ZapotrzTransNierRodzaj;
	skoj_pods KojarzenieBazoweZapotrzebowanie_Media;
	baza_przes float;
	proc_podn float;
	proc_obn float;
	lokalizacja_bool boolean;
	zapotrzebowanie_id integer;
BEGIN
	select into baza_przes baza::float from precyzja_kojarzenie where nazwa = 'cena';
	proc_podn := 1;
	proc_obn := 1;
	proc_podn := proc_podn + (proc_podn * (baza_przes / 100))::float;
	proc_obn := proc_obn - (proc_obn * (baza_przes / 100))::float;
	FOR skoj_pods IN select * from KojarzenieBazoweZapotrzebowanie_Media where id_media_nieruchomosc = media_nieruchomosc_id and 
	cena_media <= (cena_zapotrzebowanie * proc_podn) LOOP ---between (cena_zapotrzebowanie * proc_obn) and
		select into lokalizacja_bool KojarzenieLokalizacjeMediaZapotrzebowanie (skoj_pods.id_media_nieruchomosc, skoj_pods.id_zapotrzebowanie_trans_rodzaj);
		IF lokalizacja_bool = true THEN
			select into zapotrzebowanie_id id_zapotrzebowanie from zapotrzebowanie_nier_rodzaj join zapotrzebowanie_trans_rodzaj on zapotrzebowanie_nier_rodzaj.id = zapotrzebowanie_trans_rodzaj.id_zapotrzebowanie_nier_rodzaj 
			where zapotrzebowanie_trans_rodzaj.id = skoj_pods.id_zapotrzebowanie_trans_rodzaj;

			select into result * from ZapotrzTransNierRodzaj where id_zapotrzebowanie = zapotrzebowanie_id;
			RETURN NEXT result;
		END IF;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.kojarzeniemediazapotrzebowanie(media_nieruchomosc_id integer) OWNER TO postgres;

--
-- Name: kojarzenienpoziomowe(integer, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION kojarzenienpoziomowe(nieruchomosc_id integer, zapotrzebowanie_trans_rodzaj_id integer, poziom integer) RETURNS boolean
    AS $$
DECLARE
	przes_liczba integer; ---jednoczesnie obnizanie parametrow minimalnych jak i podnoszenie maxymalnych :P
	proc_podn float;
	proc_obn float;
	rec_temp record;
	walidacja_float_id integer;
	walidacja_int_id integer;
	nier_rodzaj_id integer;
	trans_rodzaj_id integer;
------------
	id_rodzaj_budynek integer;
BEGIN
	---sprawdzenie rodzajow budynkow, zanim wdamy sie w jakiekolwiek szczegoly
	select into id_rodzaj_budynek count(id_rodz_nier_szcz) from zap_szcz_nier where id_zapotrzebowanie_trans_rodzaj = zapotrzebowanie_trans_rodzaj_id;
	IF id_rodzaj_budynek > 0 THEN
		select into id_rodzaj_budynek id_rodz_nier_szcz from nieruchomosc where id = nieruchomosc_id;
		select into id_rodzaj_budynek id_rodz_nier_szcz from zap_szcz_nier where id_zapotrzebowanie_trans_rodzaj = zapotrzebowanie_trans_rodzaj_id and id_rodz_nier_szcz = id_rodzaj_budynek;
		IF id_rodzaj_budynek is null THEN
			return false;
		END IF;
	END IF;

	select into walidacja_float_id id from walidacja where nazwa = 'float';
	select into walidacja_int_id id from walidacja where nazwa = 'int';
	select into przes_liczba baza::integer from precyzja_kojarzenie where nazwa = 'param_licz';

	select into nier_rodzaj_id id_nier_rodzaj from zapotrzebowanie_nier_rodzaj where id = (select id_zapotrzebowanie_nier_rodzaj from zapotrzebowanie_trans_rodzaj where id = zapotrzebowanie_trans_rodzaj_id);
	select into trans_rodzaj_id id_trans_rodzaj from zapotrzebowanie_trans_rodzaj where id = zapotrzebowanie_trans_rodzaj_id;

	select into rec_temp baza from precyzja_kojarzenie where nazwa = 'param_pow';
	proc_podn := 1;
	proc_obn := 1;
	proc_podn := proc_podn + (proc_podn * (rec_temp.baza::float / 100))::float;
	proc_obn := proc_obn - (proc_obn * (rec_temp.baza::float / 100))::float;

	---pobieramy n poziomowe parametry zdefiniowane dla zapotrzebowania, najpierw minimalne, dla liczb
	FOR rec_temp IN select dane_txt_nier.wartosc as nier_wartosc, dane_txt_zap_min.wartosc as zap_wartosc from dane_txt_zap_min 
		join dane_txt_nier on dane_txt_zap_min.id_parametr_nier  = dane_txt_nier.id_parametr_nier 
		join parametr_nier on dane_txt_zap_min.id_parametr_nier = parametr_nier.id 
		join lista_param_nier on parametr_nier.id = lista_param_nier.id_parametr_nier 
		where 
		dane_txt_zap_min.id_zapotrzebowanie_trans_rodzaj = zapotrzebowanie_trans_rodzaj_id and parametr_nier.id_walidacja = walidacja_int_id and lista_param_nier.waga = poziom and 
		lista_param_nier.id_nier_rodzaj = nier_rodzaj_id and lista_param_nier.id_trans_rodzaj = trans_rodzaj_id and 
		dane_txt_nier.id_nieruchomosc = nieruchomosc_id LOOP
			---pomimo zaszumienia parametry istnieja dla obu nieruchomosci i sie nie pokrywaja
			IF (rec_temp.zap_wartosc::integer - przes_liczba) > rec_temp.nier_wartosc::integer THEN
				return false;
			END IF;
	END LOOP;
	---pobieramy n poziomowe parametry zdefiniowane dla zapotrzebowania, maxymalne, dla liczb
	FOR rec_temp IN select dane_txt_nier.wartosc as nier_wartosc, dane_txt_zap_max.wartosc as zap_wartosc from dane_txt_zap_max 
		join dane_txt_nier on dane_txt_zap_max.id_parametr_nier  = dane_txt_nier.id_parametr_nier 
		join parametr_nier on dane_txt_zap_max.id_parametr_nier = parametr_nier.id 
		join lista_param_nier on parametr_nier.id = lista_param_nier.id_parametr_nier 
		where 
		dane_txt_zap_max.id_zapotrzebowanie_trans_rodzaj = zapotrzebowanie_trans_rodzaj_id and parametr_nier.id_walidacja = walidacja_int_id and lista_param_nier.waga = poziom and 
		dane_txt_nier.id_nieruchomosc = nieruchomosc_id LOOP
			---pomimo zaszumienia parametry istnieja dla obu nieruchomosci i sie nie pokrywaja
			IF (rec_temp.zap_wartosc::integer + przes_liczba) < rec_temp.nier_wartosc::integer THEN
				return false;
			END IF;
	END LOOP;

	---pobieramy n poziomowe parametry zdefiniowane dla zapotrzebowania, minimalne, dla floatow
	FOR rec_temp IN select dane_txt_nier.wartosc as nier_wartosc, dane_txt_zap_min.wartosc as zap_wartosc from dane_txt_zap_min 
		join dane_txt_nier on dane_txt_zap_min.id_parametr_nier  = dane_txt_nier.id_parametr_nier 
		join parametr_nier on dane_txt_zap_min.id_parametr_nier = parametr_nier.id 
		join lista_param_nier on parametr_nier.id = lista_param_nier.id_parametr_nier 
		where 
		dane_txt_zap_min.id_zapotrzebowanie_trans_rodzaj = zapotrzebowanie_trans_rodzaj_id and parametr_nier.id_walidacja = walidacja_float_id and lista_param_nier.waga = poziom and 
		dane_txt_nier.id_nieruchomosc = nieruchomosc_id LOOP
			---pomimo zaszumienia parametry istnieja dla obu nieruchomosci i sie nie pokrywaja
			IF (rec_temp.zap_wartosc::float * proc_obn) > rec_temp.nier_wartosc::float THEN
				return false;
			END IF;
	END LOOP;
	---pobieramy n poziomowe parametry zdefiniowane dla zapotrzebowania, maxymalne, dla floatow
	FOR rec_temp IN select dane_txt_nier.wartosc as nier_wartosc, dane_txt_zap_max.wartosc as zap_wartosc from dane_txt_zap_max 
		join dane_txt_nier on dane_txt_zap_max.id_parametr_nier  = dane_txt_nier.id_parametr_nier 
		join parametr_nier on dane_txt_zap_max.id_parametr_nier = parametr_nier.id 
		join lista_param_nier on parametr_nier.id = lista_param_nier.id_parametr_nier 
		where 
		dane_txt_zap_max.id_zapotrzebowanie_trans_rodzaj = zapotrzebowanie_trans_rodzaj_id and parametr_nier.id_walidacja = walidacja_float_id and lista_param_nier.waga = poziom and 
		dane_txt_nier.id_nieruchomosc = nieruchomosc_id LOOP
			---pomimo zaszumienia parametry istnieja dla obu nieruchomosci i sie nie pokrywaja
			IF (rec_temp.zap_wartosc::float * proc_podn) < rec_temp.nier_wartosc::float THEN
				return false;
			END IF;
	END LOOP;
	return true;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.kojarzenienpoziomowe(nieruchomosc_id integer, zapotrzebowanie_trans_rodzaj_id integer, poziom integer) OWNER TO postgres;

--
-- Name: kojarzenienpoziomowewyp(integer, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION kojarzenienpoziomowewyp(nieruchomosc_id integer, zapotrzebowanie_trans_rodzaj_id integer, poziom integer) RETURNS boolean
    AS $$
DECLARE
	temp integer;
	---ilosc wyposazen (liczonych wylacznie dla rodzicow) okreslonych w zapotrzebowaniu
	ilosc_wyp_zap integer;
	---ilosc wyposazen pokrywajacych sie w zapotrzebowaniu i ofercie
	ilosc_pokr_wyp integer;
	nier_rodzaj_id integer;
	trans_rodzaj_id integer;
BEGIN
	select into nier_rodzaj_id id_nier_rodzaj from zapotrzebowanie_nier_rodzaj where id = (select id_zapotrzebowanie_nier_rodzaj from zapotrzebowanie_trans_rodzaj where id = zapotrzebowanie_trans_rodzaj_id);
	select into trans_rodzaj_id id_trans_rodzaj from zapotrzebowanie_trans_rodzaj where id = zapotrzebowanie_trans_rodzaj_id;

	select into temp count(distinct wyposazenie_nier.id) from dane_slow_wyp_zap join wyposazenie_nier on dane_slow_wyp_zap.id_wyposazenie_nier = wyposazenie_nier.id 
	join lista_param_slow_nier on wyposazenie_nier.id = lista_param_slow_nier.id_wyposazenie_nier where 
	dane_slow_wyp_zap.id_zapotrzebowanie_trans_rodzaj = zapotrzebowanie_trans_rodzaj_id and wyposazenie_nier.ma_dzieci = false and id_parent is null 
	and lista_param_slow_nier.waga <= poziom and lista_param_slow_nier.id_nier_rodzaj = nier_rodzaj_id and lista_param_slow_nier.id_trans_rodzaj = trans_rodzaj_id;

	---zbyt zlozone ?? distinct na id_parent ?? i juz ??
	select into ilosc_wyp_zap count(distinct wyp_parent.id) from dane_slow_wyp_zap join wyposazenie_nier on dane_slow_wyp_zap.id_wyposazenie_nier = wyposazenie_nier.id 
	join wyposazenie_nier wyp_parent on wyposazenie_nier.id_parent = wyp_parent.id 
	where dane_slow_wyp_zap.id_zapotrzebowanie_trans_rodzaj = zapotrzebowanie_trans_rodzaj_id ;

	ilosc_wyp_zap := ilosc_wyp_zap + temp;
	
	---pokrywajacy sie
	select into ilosc_pokr_wyp count (dane_slow_wyp_zap.id) from dane_slow_wyp_zap join dane_slow_wyp_nier on dane_slow_wyp_zap.id_wyposazenie_nier = dane_slow_wyp_nier.id_wyposazenie_nier 
	where dane_slow_wyp_zap.id_zapotrzebowanie_trans_rodzaj = zapotrzebowanie_trans_rodzaj_id and dane_slow_wyp_nier.id_nieruchomosc = nieruchomosc_id;
	
	---dodac ewentualnie odejmowanie elementu z precyzji kojarzenia - wtedy nie wszystko co do joty musi wejsc :), tu bym nawet procentowo to rozegral :P
	IF ilosc_pokr_wyp >= ilosc_wyp_zap THEN
		return true;
	ELSE
		return false;
	END IF;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.kojarzenienpoziomowewyp(nieruchomosc_id integer, zapotrzebowanie_trans_rodzaj_id integer, poziom integer) OWNER TO postgres;

--
-- Name: kojarzenieofertamedia(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION kojarzenieofertamedia(oferta_id integer) RETURNS SETOF medianieruchomosc
    AS $$
DECLARE
	result MediaNieruchomosc;
	skoj_pods KojarzenieBazoweOferta_Media;
	baza_przes float;
	proc_podn float;
	proc_obn float;
	lokalizacja_bool boolean;
	nieruchomosc_id integer;
BEGIN
	select into baza_przes baza::float from precyzja_kojarzenie where nazwa = 'cena';
	proc_podn := 1;
	proc_obn := 1;
	proc_podn := proc_podn + (proc_podn * (baza_przes / 100))::float;
	proc_obn := proc_obn - (proc_obn * (baza_przes / 100))::float;
	FOR skoj_pods IN select * from KojarzenieBazoweOferta_Media where id_oferta = oferta_id and 
	cena_media >= (cena_oferta * proc_obn) LOOP ---and (cena_oferta * proc_podn)
		select into nieruchomosc_id oferta.id_nieruchomosc from oferta where oferta.id = oferta_id;
		select into lokalizacja_bool KojarzenieLokalizacjeMediaOferta (nieruchomosc_id, skoj_pods.id_media_nieruchomosc);
		IF lokalizacja_bool = true THEN
			select into result * from MediaNieruchomosc where id_media_nieruchomosc = skoj_pods.id_media_nieruchomosc;
			RETURN NEXT result;
		END IF;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.kojarzenieofertamedia(oferta_id integer) OWNER TO postgres;

--
-- Name: kojarzeniezapotrzebowaniemedia(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION kojarzeniezapotrzebowaniemedia(zapotrzebowanie_trans_rodzaj_id integer) RETURNS SETOF medianieruchomosc
    AS $$
DECLARE
	result MediaNieruchomosc;
	skoj_pods KojarzenieBazoweZapotrzebowanie_Media;
	baza_przes float;
	proc_podn float;
	proc_obn float;
	lokalizacja_bool boolean;
BEGIN
	select into baza_przes baza::float from precyzja_kojarzenie where nazwa = 'cena';
	proc_podn := 1;
	proc_obn := 1;
	proc_podn := proc_podn + (proc_podn * (baza_przes / 100))::float;
	proc_obn := proc_obn - (proc_obn * (baza_przes / 100))::float;
	FOR skoj_pods IN select * from KojarzenieBazoweZapotrzebowanie_Media where id_zapotrzebowanie_trans_rodzaj = zapotrzebowanie_trans_rodzaj_id and 
	cena_media between (cena_zapotrzebowanie * proc_obn) and (cena_zapotrzebowanie * proc_podn) LOOP
		select into lokalizacja_bool KojarzenieLokalizacjeMediaZapotrzebowanie (skoj_pods.id_media_nieruchomosc, skoj_pods.id_zapotrzebowanie_trans_rodzaj);
		IF lokalizacja_bool = true THEN
			select into result * from MediaNieruchomosc where id_media_nieruchomosc = skoj_pods.id_media_nieruchomosc;
			RETURN NEXT result;
		END IF;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.kojarzeniezapotrzebowaniemedia(zapotrzebowanie_trans_rodzaj_id integer) OWNER TO postgres;

--
-- Name: korektalwsk(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION korektalwsk() RETURNS void
    AS $$
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
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.korektalwsk() OWNER TO postgres;

--
-- Name: listaagent; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW listaagent AS
    SELECT agent.id AS id_agent, agent.id_otodom, agent.nazwa, agent.nazwa_pot, agent."login", agent.haslo, agent.waznosc_haslo, agent.aktywnosc_konto, agent.telefon, agent.komorka, agent.fax, agent.email, agent.licencja, agent.nadzor, agent.dodawanie, agent.edycja, agent.kasowanie, agent.druk, agent.adm_klient, agent.adm_dane, agent.zmiana_upr FROM agent;


ALTER TABLE public.listaagent OWNER TO postgres;

--
-- Name: listaagentow(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION listaagentow() RETURNS SETOF listaagent
    AS $$
DECLARE
	result ListaAgent;
BEGIN
	FOR result in select * from ListaAgent order by nazwa asc LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.listaagentow() OWNER TO postgres;

--
-- Name: sposob_finansowania; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE sposob_finansowania (
    id integer NOT NULL,
    nazwa character varying(30) NOT NULL
);


ALTER TABLE public.sposob_finansowania OWNER TO postgres;

--
-- Name: prowizjezapotrzebowanie; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW prowizjezapotrzebowanie AS
    SELECT prowizja_zapotrzebowanie.id AS id_prow_zap, prowizja_zapotrzebowanie.id_zapotrzebowanie, prowizja_zapotrzebowanie.prowizja_proc AS prow_proc, prowizja_zapotrzebowanie.prowizja, prowizja_zapotrzebowanie.id_sposob_finansowania, prowizja_zapotrzebowanie.poszukiwane_dla, trans_rodzaj.nazwa_zap AS transakcja_rodzaj, sposob_finansowania.nazwa AS sposob_finansowania FROM ((prowizja_zapotrzebowanie JOIN trans_rodzaj ON ((prowizja_zapotrzebowanie.id_trans_rodzaj = trans_rodzaj.id))) JOIN sposob_finansowania ON ((prowizja_zapotrzebowanie.id_sposob_finansowania = sposob_finansowania.id)));


ALTER TABLE public.prowizjezapotrzebowanie OWNER TO postgres;

--
-- Name: listaprowdlatrans(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION listaprowdlatrans(zapotrzebowanie_id integer) RETURNS SETOF prowizjezapotrzebowanie
    AS $$
DECLARE
	result ProwizjeZapotrzebowanie;
BEGIN
	FOR result IN select * from ProwizjeZapotrzebowanie where id_zapotrzebowanie = zapotrzebowanie_id LOOP
		return next result;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.listaprowdlatrans(zapotrzebowanie_id integer) OWNER TO postgres;

--
-- Name: logowanie(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION logowanie(login_t text, passwd text) RETURNS logowanieobj
    AS $$
DECLARE
	rec_log record;
	wynik LogowanieObj;
	akt_data date;
	ilosc_dni integer;
	licznik integer;
	rec_konto record;
BEGIN
	licznik := 1;
	select into akt_data current_date;
	select into rec_log * from logowanieagent where login = md5(login_t) and haslo = md5(passwd);
	
	IF rec_log.id is not null THEN
		IF rec_log.aktywnosc_konto = false THEN
			wynik.nazwa := '_konto_jest_nieaktywne';
			wynik.rezultat := false;
			wynik.aktywnosc := rec_log.aktywnosc_konto;
			wynik.id_agent := null;

			return wynik;
		ELSE
			select into ilosc_dni rec_log.waznosc_haslo - akt_data;
			IF ilosc_dni < 1 THEN
				wynik.rezultat := false;
				wynik.nazwa := '_haslo_wygaslo';
				wynik.aktywnosc := rec_log.aktywnosc_konto;
				wynik.il_dni_wyg := ilosc_dni;
				wynik.id_agent := rec_log.id;

				return wynik;
			ELSE
				wynik.rezultat := true;
				wynik.id_agent := rec_log.id;
				wynik.id_agent_otodom := rec_log.id_otodom;
				wynik.aktywnosc := rec_log.aktywnosc_konto;
				wynik.wewnetrzny := rec_log.wewnetrzny;
				wynik.nip := rec_log.nip;
				wynik.adres := rec_log.adres;
				wynik.nazwa := rec_log.nazwa;
				wynik.firma := rec_log.firma;
				wynik.il_dni_wyg := ilosc_dni;
				wynik.dodawanie := rec_log.dodawanie;
				wynik.edycja := rec_log.edycja;
				wynik.kasowanie := rec_log.kasowanie;
				wynik.druk := rec_log.druk;
				wynik.adm_klient := rec_log.adm_klient;
				wynik.adm_dane := rec_log.adm_dane;
---adm_klient, adm_dane,
				wynik.zmiana_upr := rec_log.zmiana_upr;
				FOR rec_konto in select bank.nazwa as bank, konto_agent.nr_konto from konto_agent join bank on konto_agent.id_bank = bank.id where konto_agent.id_agent = wynik.id_agent LOOP
					wynik.bank[licznik] := rec_konto.bank;
					wynik.nr_konto[licznik] := rec_konto.nr_konto;
					licznik := licznik + 1;
				END LOOP;
				return wynik;
			END IF;
		END IF;
	ELSE
		wynik.nazwa := '_niepoprawny_login_lub_haslo';
		wynik.rezultat := false;
		wynik.id_agent := null;

		return wynik;
	END IF;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.logowanie(login_t text, passwd text) OWNER TO postgres;

--
-- Name: maillistawysylka(integer[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION maillistawysylka(region_id integer[]) RETURNS SETOF slownik
    AS $$
DECLARE
	result slownik;
	zapytanie text;
	licznik integer;
BEGIN
	licznik := 1;
	---select email from mailing where id_wojewodztwo in (region_id) and zgoda = true
	zapytanie := 'select id, email from mailing where zgoda = true and id_wojewodztwo in (';
	WHILE region_id[licznik] is not null LOOP
		IF licznik > 1 THEN
			zapytanie := zapytanie || ', ';
		END IF;
		zapytanie := zapytanie || region_id[licznik];
		licznik := licznik + 1;
	END LOOP;
	zapytanie := zapytanie || ')';

	FOR result in execute zapytanie LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.maillistawysylka(region_id integer[]) OWNER TO postgres;

--
-- Name: mediaosoba(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION mediaosoba(osoba_id integer) RETURNS SETOF medianieruchomosc
    AS $$
DECLARE
	result MediaNieruchomosc;
BEGIN
	FOR result in select * from MediaNieruchomosc where id_osoba = osoba_id LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.mediaosoba(osoba_id integer) OWNER TO postgres;

--
-- Name: mediataknieofertyexport(integer, text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION mediataknieofertyexport(nieruchomosc_id integer, nazwa_wyp text, zaglebienie integer) RETURNS boolean
    AS $$
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
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.mediataknieofertyexport(nieruchomosc_id integer, nazwa_wyp text, zaglebienie integer) OWNER TO postgres;

--
-- Name: migratetotags(text, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION migratetotags(tab_cur_dict text, col_cur_dict text, col_cur_id text) RETURNS SETOF text
    AS $$
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
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.migratetotags(tab_cur_dict text, col_cur_dict text, col_cur_id text) OWNER TO postgres;

--
-- Name: nazwaregion(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION nazwaregion(region_id integer) RETURNS SETOF slownik
    AS $$
DECLARE
	rec_slownik slownik;
BEGIN
	FOR rec_slownik IN select id, nazwa from region_geog where id = region_id order by nazwa asc LOOP
		RETURN NEXT rec_slownik;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.nazwaregion(region_id integer) OWNER TO postgres;

--
-- Name: nieroferta; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW nieroferta AS
    SELECT oferta.id AS id_oferta, oferta.id_nieruchomosc, oferta.id_rodz_trans, nieruchomosc.id_nier_rodzaj FROM (oferta JOIN nieruchomosc ON ((oferta.id_nieruchomosc = nieruchomosc.id)));


ALTER TABLE public.nieroferta OWNER TO postgres;

--
-- Name: nierdaneoferta(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION nierdaneoferta(oferta_id integer) RETURNS nieroferta
    AS $$
DECLARE
	result NierOferta;
BEGIN
	select into result * from NierOferta where id_oferta = oferta_id;
	return result;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.nierdaneoferta(oferta_id integer) OWNER TO postgres;

--
-- Name: nieruchomoscszczeg(text, text, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION nieruchomoscszczeg(rodzaj_nier text, tab_szcz text, kol_szcz text, id_szcz text) RETURNS void
    AS $$
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
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.nieruchomoscszczeg(rodzaj_nier text, tab_szcz text, kol_szcz text, id_szcz text) OWNER TO postgres;

--
-- Name: niezgodamail(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION niezgodamail(hash text) RETURNS boolean
    AS $$
DECLARE
BEGIN
	update mailing set zgoda = false where md5(id || email) = hash;
	IF found THEN
		RETURN true;
	ELSE
		RETURN false;
	END IF;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.niezgodamail(hash text) OWNER TO postgres;

--
-- Name: obnizzdjecie(integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION obnizzdjecie(zdjecie_id integer, nieruchomosc_id integer) RETURNS boolean
    AS $$
DECLARE
	temp text;
	zdj_nizej integer;
BEGIN
	select into zdj_nizej id from zdjecie where id_nieruchomosc = nieruchomosc_id and id > zdjecie_id order by id asc limit 1;
	IF zdj_nizej is not null THEN
		select into temp nazwa from zdjecie where id = zdjecie_id; ---mamy nazwe obnizanego zdj zapamietana
		update zdjecie set nazwa = (select nazwa from zdjecie where id = zdj_nizej) where id = zdjecie_id;
		update zdjecie set nazwa = temp where id = zdj_nizej;
		RETURN true;
	ELSE
		RETURN false;
	END IF;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.obnizzdjecie(zdjecie_id integer, nieruchomosc_id integer) OWNER TO postgres;

--
-- Name: ofertainfosekcje(integer, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ofertainfosekcje(nieruchomosc_id integer, nier_rodzaj_id integer, trans_rodzaj_id integer) RETURNS SETOF oferta_sekcje
    AS $$
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
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.ofertainfosekcje(nieruchomosc_id integer, nier_rodzaj_id integer, trans_rodzaj_id integer) OWNER TO postgres;

--
-- Name: ofertaklient(integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ofertaklient(osoba_id integer, status_id_n integer) RETURNS SETOF szukajofertanierview
    AS $$
DECLARE
	result SzukajOfertaNierView;
	zapytanie text;
BEGIN
	zapytanie := 'select distinct on (id_oferta) * from SzukajOfertaNierView where id_osoba = ' ||osoba_id;
	IF status_id_n > 0 THEN
		zapytanie := zapytanie || ' and id_status != ' || status_id_n;
	END IF;
	zapytanie := zapytanie || ';';
	FOR result IN select distinct on (id_oferta) * from SzukajOfertaNierView where id_osoba = osoba_id LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.ofertaklient(osoba_id integer, status_id_n integer) OWNER TO postgres;

--
-- Name: ofertaogladnieta(integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ofertaogladnieta(oferta_id integer, jezyk_id integer) RETURNS ofertaogldane
    AS $$
DECLARE
	result OfertaOglDane;
	rec_temp OfertaListaWskazan;
	rec_sup record;
	nieruchomosc_id integer;
	licznik integer;
BEGIN
	licznik := 1;
	select into rec_temp * from PodajOfertaDoListaWsk (oferta_id, jezyk_id);
	result.id_oferta := rec_temp.id_oferta;
	result.adres := rec_temp.adres;
	result.cena := rec_temp.cena;
	result.opis := rec_temp.opis;
	select into rec_sup data_otw_zlecenie, id_nieruchomosc from oferta where id = oferta_id;
	result.data := rec_sup.data_otw_zlecenie;

	nieruchomosc_id := rec_sup.id_nieruchomosc;
	FOR rec_sup in select id_osoba from wlasciciel where id_nieruchomosc = nieruchomosc_id LOOP
		result.wlasciciel[licznik] := rec_sup.id_osoba;
		licznik := licznik + 1;
	END LOOP;
	RETURN result;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.ofertaogladnieta(oferta_id integer, jezyk_id integer) OWNER TO postgres;

--
-- Name: opis; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE opis (
    id integer NOT NULL,
    id_oferta integer NOT NULL,
    id_jezyk integer NOT NULL,
    wartosc text NOT NULL
);


ALTER TABLE public.opis OWNER TO postgres;

--
-- Name: ofertaopisy(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ofertaopisy(oferta_id integer) RETURNS SETOF opis
    AS $$
DECLARE
	result opis;
BEGIN
	FOR result in select * from opis where id_oferta = oferta_id LOOP
		return next result;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.ofertaopisy(oferta_id integer) OWNER TO postgres;

--
-- Name: ofertapelnawersja(integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ofertapelnawersja(oferta_id integer, jezyk_id integer) RETURNS oferty_wersja_pelna
    AS $$
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
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.ofertapelnawersja(oferta_id integer, jezyk_id integer) OWNER TO postgres;

--
-- Name: ofertapomieszczenia(integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ofertapomieszczenia(nieruchomosc_id integer, nier_rodzaj_id integer) RETURNS SETOF oferta_pomieszczenia
    AS $$
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
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.ofertapomieszczenia(nieruchomosc_id integer, nier_rodzaj_id integer) OWNER TO postgres;

--
-- Name: ofertapublikuj(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ofertapublikuj(oferta_id integer) RETURNS boolean
    AS $$
DECLARE
BEGIN
	update oferta set pokaz = true where id = oferta_id;
	IF found THEN
		return true;
	ELSE
		return false;
	END IF;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.ofertapublikuj(oferta_id integer) OWNER TO postgres;

--
-- Name: ofertaschowaj(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ofertaschowaj(oferta_id integer) RETURNS boolean
    AS $$
DECLARE
BEGIN
	update oferta set pokaz = false where id = oferta_id;
	IF found THEN
		return true;
	ELSE
		return false;
	END IF;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.ofertaschowaj(oferta_id integer) OWNER TO postgres;

--
-- Name: zmiana_status; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE zmiana_status (
    id integer NOT NULL,
    id_oferta integer NOT NULL,
    id_status integer NOT NULL,
    id_agent integer NOT NULL,
    data timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.zmiana_status OWNER TO postgres;

--
-- Name: ofertywstrzymane; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW ofertywstrzymane AS
    SELECT DISTINCT zmiana_status.id_oferta, zmiana_status.id, zmiana_status.id_agent, zmiana_status.data FROM (zmiana_status JOIN oferta ON ((zmiana_status.id_oferta = oferta.id))) WHERE ((zmiana_status.id_status = (SELECT status.id FROM status WHERE ((status.nazwa)::text = '_wstrzymana'::text))) AND (zmiana_status.id_status = oferta.id_status)) ORDER BY zmiana_status.id_oferta, zmiana_status.id, zmiana_status.id_agent, zmiana_status.data;


ALTER TABLE public.ofertywstrzymane OWNER TO postgres;

--
-- Name: ofertawstrzymana(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ofertawstrzymana() RETURNS SETOF ofertywstrzymane
    AS $$
DECLARE
	result OfertyWstrzymane;
	stat_akt integer;
	akt_czas timestamp;
BEGIN
	select into stat_akt id from status where nazwa = '_aktualna';
	select into akt_czas date_trunc('second', current_timestamp::timestamp);
	FOR result in select * from OfertyWstrzymane where data < (select current_date - 3) LOOP
		---update
		update oferta set id_status = stat_akt where id = result.id_oferta;
		insert into zmiana_status (id_oferta, id_status, id_agent, data) values (result.id_oferta, stat_akt, 25, akt_czas);
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.ofertawstrzymana() OWNER TO postgres;

--
-- Name: ofertawyswietl(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ofertawyswietl(oferta_id integer) RETURNS boolean
    AS $$
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
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.ofertawyswietl(oferta_id integer) OWNER TO postgres;

--
-- Name: ofertylistawskazansubskrypcja(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ofertylistawskazansubskrypcja() RETURNS SETOF ofertazleceniesubskrypcja
    AS $$
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
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.ofertylistawskazansubskrypcja() OWNER TO postgres;

--
-- Name: ofertynowosci(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ofertynowosci() RETURNS SETOF oferta_nowosc
    AS $$
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
		select into result.zdjecie nazwa from zdjecie where id = (select min(id) from zdjecie where id_nieruchomosc = dane_oferta.id_nieruchomosc);
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.ofertynowosci() OWNER TO postgres;

--
-- Name: ofertyogladniete(integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ofertyogladniete(zapotrzebowanie_id integer, jezyk_id integer) RETURNS SETOF ofertaogladanaklient
    AS $$
DECLARE
	rec_temp OfertaListaWskazan;
	result OfertaOgladanaKlient;
	ogladanie_dane record;
	wlas text;
	licznik integer;
BEGIN
	FOR ogladanie_dane in select id_oferta, (ogladanie_data || ' ' || godzina.nazwa || ':' || minuta.nazwa)::timestamp as data, agent.nazwa as agent from lista_wsk_adr 
	join godzina on lista_wsk_adr.ogladanie_godzina = godzina.id join minuta on lista_wsk_adr.ogladanie_minuta = minuta.id join agent on lista_wsk_adr.id_agent = agent.id 
	where lista_wsk_adr.id_zapotrzebowanie = zapotrzebowanie_id order by data asc LOOP
		licznik := 1;
		result.data := ogladanie_dane.data;
		result.id_oferta := ogladanie_dane.id_oferta;
		result.agent := ogladanie_dane.agent;
		select into rec_temp * from PodajOfertaDoListaWsk(ogladanie_dane.id_oferta, jezyk_id);
		result.adres := rec_temp.adres;
		result.cena := rec_temp.cena;
		result.opis := rec_temp.opis;
		result.opis := rec_temp.opis;
		WHILE rec_temp.wlasciciel[licznik] is not null LOOP
			select into wlas imie.nazwa || ' ' || osoba.nazwisko from osoba join imie on osoba.id_imie = imie.id where osoba.id = rec_temp.wlasciciel[licznik];
			result.wlasciciel[licznik] := wlas;
			licznik := licznik + 1;
		END LOOP;
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.ofertyogladniete(zapotrzebowanie_id integer, jezyk_id integer) OWNER TO postgres;

--
-- Name: ofertysubskrypcja(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ofertysubskrypcja() RETURNS SETOF ofertasubskrypcja
    AS $$
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
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.ofertysubskrypcja() OWNER TO postgres;

--
-- Name: ofertyzleceniesubskrypcja(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ofertyzleceniesubskrypcja() RETURNS SETOF ofertazleceniesubskrypcja
    AS $$
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
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.ofertyzleceniesubskrypcja() OWNER TO postgres;

--
-- Name: ogladanienieaktywne(integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ogladanienieaktywne(ogladanie_id integer, agent_id integer) RETURNS boolean
    AS $$
DECLARE
	test integer;
	akt_data timestamp;
BEGIN
	select into akt_data date_trunc('second', current_timestamp::timestamp);
	select into test id from rekord_nieakt_lista_wsk_adr where id = ogladanie_id;
	IF test is not null THEN
		return false;
	ELSE
		insert into rekord_nieakt_lista_wsk_adr (id, id_agent, data) values (ogladanie_id, agent_id, akt_data);
		return true;
	END IF;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.ogladanienieaktywne(ogladanie_id integer, agent_id integer) OWNER TO postgres;

--
-- Name: ogloszeniedomiporta(integer, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ogloszeniedomiporta(oferta_id integer, insertion_id integer, okresy integer) RETURNS date
    AS $$
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
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.ogloszeniedomiporta(oferta_id integer, insertion_id integer, okresy integer) OWNER TO postgres;

--
-- Name: ogloszenieofertynet(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ogloszenieofertynet(oferta_id integer) RETURNS date
    AS $$
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
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.ogloszenieofertynet(oferta_id integer) OWNER TO postgres;

--
-- Name: ogloszenieotodom(integer, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ogloszenieotodom(oferta_id integer, insertion_id integer, okresy integer) RETURNS date
    AS $$ ---, wyg_data date
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
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.ogloszenieotodom(oferta_id integer, insertion_id integer, okresy integer) OWNER TO postgres;

--
-- Name: oneleveldict(character varying, integer, integer, text, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION oneleveldict(parent_tag character varying, waga_el integer, id_sek integer, tlum_pol text, tlum_eng text, tlum_ger text) RETURNS void
    AS $$
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
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.oneleveldict(parent_tag character varying, waga_el integer, id_sek integer, tlum_pol text, tlum_eng text, tlum_ger text) OWNER TO postgres;

--
-- Name: parametryofertyexport(integer, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION parametryofertyexport(nieruchomosc_id integer, nazwa_param text) RETURNS text
    AS $$
DECLARE
	param text;
BEGIN
	select into param dane_txt_nier.wartosc from dane_txt_nier join parametr_nier on dane_txt_nier.id_parametr_nier = parametr_nier.id 
	where dane_txt_nier.id_nieruchomosc = nieruchomosc_id and parametr_nier.nazwa = nazwa_param;
	return param;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.parametryofertyexport(nieruchomosc_id integer, nazwa_param text) OWNER TO postgres;

--
-- Name: paramsdict(character varying, integer, integer, integer, text, text, text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION paramsdict(parent_tag character varying, waga_el integer, id_sek integer, id_wal integer, tlum_pol text, tlum_eng text, tlum_ger text, dlug_inf integer) RETURNS void
    AS $$
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
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.paramsdict(parent_tag character varying, waga_el integer, id_sek integer, id_wal integer, tlum_pol text, tlum_eng text, tlum_ger text, dlug_inf integer) OWNER TO postgres;

--
-- Name: paramsdictroom(character varying, integer, integer, integer, text, text, text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION paramsdictroom(parent_tag character varying, waga_el integer, id_sek integer, id_wal integer, tlum_pol text, tlum_eng text, tlum_ger text, dlug_inf integer) RETURNS void
    AS $$
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
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.paramsdictroom(parent_tag character varying, waga_el integer, id_sek integer, id_wal integer, tlum_pol text, tlum_eng text, tlum_ger text, dlug_inf integer) OWNER TO postgres;

--
-- Name: pelnezagnregion(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pelnezagnregion(region_id integer) RETURNS slownik
    AS $$
DECLARE
	result slownik;
	rec_temp record;
BEGIN
	select into rec_temp id, id_parent, nazwa from region_geog where id = region_id;
	result.id := rec_temp.id;
	result.nazwa := rec_temp.nazwa;
	WHILE rec_temp.id_parent is not null LOOP
			---ewentualnie jesli on to zle robi (wyznacza rec_temp.id_parent) do test wpisac parent id
		select into rec_temp id, id_parent, nazwa from region_geog where id = rec_temp.id_parent;
		IF rec_temp.id_parent is not null THEN ---przycinanie kraju
			result.nazwa := result.nazwa || ', ' || rec_temp.nazwa;
		END IF;
	END LOOP;
	RETURN result;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.pelnezagnregion(region_id integer) OWNER TO postgres;

--
-- Name: pobierzparametrynier(integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pobierzparametrynier(trans_id integer, nier_id integer) RETURNS SETOF parniersekcja
    AS $$
DECLARE
	rec_sekcja record;
	rec_l_param record;
	rec_wyp_nier record;
	rec_dzieci record;
	licznik integer;
	wynik ParNierSekcja;
BEGIN
	FOR rec_sekcja IN SELECT id, nazwa from sekcja LOOP
		licznik := 0;
		---uzupelnienie info o sekcjach
		wynik.id := null;
		wynik.walidacja := null;
		wynik.nazwa := null;
		wynik.id_sekcja := rec_sekcja.id;
		wynik.nazwa_sekcja := rec_sekcja.nazwa;
		FOR rec_l_param IN SELECT id, nazwa, nazwa_walidacja, dl_inf from ParamNierTrans where id_nier_rodzaj = nier_id and id_trans_rodzaj = trans_id and id_sekcja = rec_sekcja.id LOOP
			wynik.id[licznik] := rec_l_param.id;
			wynik.walidacja[licznik] := rec_l_param.nazwa_walidacja;
			wynik.nazwa[licznik] := rec_l_param.nazwa;
			wynik.dl_inf[licznik] := rec_l_param.dl_inf;
			licznik := licznik + 1;
		END LOOP;
		RETURN NEXT wynik;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.pobierzparametrynier(trans_id integer, nier_id integer) OWNER TO postgres;

--
-- Name: pobierzparametrypomnier(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pobierzparametrypomnier(pom_id integer) RETURNS SETOF parnierpom
    AS $$
DECLARE
	rec_pom record;
	rec_l_param record;
	rec_wyp_pom record;
	rec_dzieci record;
	licznik integer;
	wynik ParNierPom;
BEGIN
	--FOR rec_pom IN SELECT pomieszczenie.id, pomieszczenie.nazwa from pomieszczenie join pomieszczenie_nier on pomieszczenie.id = pomieszczenie_nier.id_pomieszczenie where pomieszczenie_nier.id_nier_rodzaj = nier_id LOOP
	--	licznik := 0;
		---uzupelnienie info o sekcjach
	--	wynik.id := null;
	--	wynik.walidacja := null;
	--	wynik.nazwa := null;
	--	wynik.id_pomieszczenie := rec_pom.id;
	--	wynik.nazwa_pomieszczenie := rec_pom.nazwa;
		FOR rec_l_param IN SELECT id, nazwa, nazwa_walidacja, dl_inf from ParamPomNier where id_pomieszczenie = pom_id LOOP
			wynik.id := rec_l_param.id;
			wynik.walidacja := rec_l_param.nazwa_walidacja;
			wynik.nazwa := rec_l_param.nazwa;
			wynik.dl_inf := rec_l_param.dl_inf;
	--		licznik := licznik + 1;
			RETURN NEXT wynik;
		END LOOP;
	--END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.pobierzparametrypomnier(pom_id integer) OWNER TO postgres;

--
-- Name: pobierzpomieszczenianieruchomosc(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pobierzpomieszczenianieruchomosc(nier_rodzaj_id integer) RETURNS SETOF slownik
    AS $$
DECLARE
	result slownik;
BEGIN
	FOR result in select pomieszczenie.id, pomieszczenie.nazwa from pomieszczenie_nier join pomieszczenie on 
	pomieszczenie_nier.id_pomieszczenie = pomieszczenie.id where pomieszczenie_nier.id_nier_rodzaj = nier_rodzaj_id order by pomieszczenie.waga LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.pobierzpomieszczenianieruchomosc(nier_rodzaj_id integer) OWNER TO postgres;

--
-- Name: pobierzpomprzynnier(integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pobierzpomprzynnier(nieruchomosc_id integer, pomieszczenie_id integer) RETURNS SETOF pomprzynnier
    AS $$
DECLARE
	result PomPrzynNier;
BEGIN
	FOR result IN select pomieszczenie_przyn_nier.id, pomieszczenie_przyn_nier.nr_pomieszczenia as nr_pomieszczenie, pomieszczenie.nazwa
	from pomieszczenie_przyn_nier join pomieszczenie on pomieszczenie_przyn_nier.id_pomieszczenie = pomieszczenie.id where
	pomieszczenie_przyn_nier.id_nieruchomosc = nieruchomosc_id and pomieszczenie_przyn_nier.id_pomieszczenie = pomieszczenie_id order by nr_pomieszczenie LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.pobierzpomprzynnier(nieruchomosc_id integer, pomieszczenie_id integer) OWNER TO postgres;

--
-- Name: pobierzwyposazenienier(integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pobierzwyposazenienier(trans_id integer, nier_id integer) RETURNS SETOF wypniersekcja
    AS $$
DECLARE
	rec_sekcja record; ---rekord do pobrania sekcji
	rec_l_param record; ---rekord do pobierania danych s³ownikowych dostêpnych dla otrzymanych parametrów
	rec_wyp_nier record; ---rekord elementów nadrzêdnych s³ownika wyposa¿eñ
	rec_dzieci record; ---rekord na elementy podlegaj¹ce danemu elementoi nadrzêdnemu
	licznik integer; ---licznik iteracji indeksuj¹cy kolejne elementy tabeli
	wynik WypNierSekcja;
BEGIN
	---iteracja wczytuj¹ca kolejne sekcje i realizuj¹ca kolejne operacje dla danej sekcji
	FOR rec_sekcja IN SELECT id, nazwa from sekcja LOOP
		---zerowanie licznika dla nowej sekcji
		licznik := 0;
		---wyczyszczenie rekordu rezultatów przygotowuj¹ce now¹ sekcjê
		wynik.id_parent := null;
		wynik.id := null;
		wynik.wielokrotne := null;
		wynik.nazwa := null;
		---podanie danych wczytanej sekcji
		wynik.id_sekcja := rec_sekcja.id;
		wynik.nazwa_sekcja := rec_sekcja.nazwa;
		---iteracja wczytuj¹ca kolejne dopuszczone dla danego rodzaju transakcji oraz rodzaju nieruchomoœci elementy s³ownikowe
		---wykorzystany widok odpowiada za po³¹czenie tabeli s³ownika z tabel¹ konfiguracyjn¹, dziêki czemu jest mo¿liwe filtrowanie dla sekcji
		FOR rec_l_param IN SELECT id, ma_dzieci, nazwa from WyposNierTrans where id_nier_rodzaj = nier_id and id_trans_rodzaj = trans_id and id_sekcja = rec_sekcja.id LOOP
			IF rec_l_param.ma_dzieci = true THEN
				---w przypadku, kiedy dany element slownika ma elementy podrzêdne nale¿y je wczytaæ
				---pobranie w iteracji kolejnych elementów podrzêdnych 
				FOR rec_dzieci IN SELECT id, id_parent, wielokrotne, nazwa from wyposazenie_nier where id_parent = rec_l_param.id LOOP
					---uzupe³nianie elementu wyniku danymi elementów podrzêdnych
					wynik.id_parent[licznik] := rec_dzieci.id_parent;
					wynik.id[licznik] := rec_dzieci.id;
					wynik.wielokrotne[licznik] := rec_dzieci.wielokrotne;
					---ze wzglêdu na fakt, i¿ elementów podrzêdnych jest wiele, element nadrzêdny jest wymieniany z ka¿dym z przynale¿nych mu elementów podrzêdnych 
					wynik.nazwa[licznik] := rec_l_param.nazwa || ':' || rec_dzieci.nazwa;
					---inkrementacja licznika dla kolejnego elementu s³ownika
					licznik := licznik + 1;	
				END LOOP;
			ELSE
				---element nie posiada elementów podrzêdnych, wczytanie elementów
				wynik.id_parent[licznik] := rec_l_param.id;
				wynik.id[licznik] := rec_l_param.id;
				wynik.wielokrotne[licznik] := false;
				wynik.nazwa[licznik] := rec_l_param.nazwa;
				licznik := licznik + 1;
			END IF;
		END LOOP;
		---podanie wyniku
		RETURN NEXT wynik;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.pobierzwyposazenienier(trans_id integer, nier_id integer) OWNER TO postgres;

--
-- Name: pobierzwyposazeniepomnier(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pobierzwyposazeniepomnier(pom_id integer) RETURNS SETOF wypnierpom
    AS $$
DECLARE
	rec_pom record;
	rec_l_param record;
	rec_wyp_pom record;
	rec_dzieci record;
	licznik integer;
	wynik WypNierPom;
BEGIN
	---iterowanie dl akazdego pomieszczenia wylatuje :P
	---FOR rec_pom IN SELECT pomieszczenie.id, pomieszczenie.nazwa from pomieszczenie join pomieszczenie_nier on pomieszczenie.id = pomieszczenie_nier.id_pomieszczenie where pomieszczenie_nier.id_nier_rodzaj = nier_id LOOP
	---	licznik := 0;
		---uzupelnienie info o pomieszczeniu
	---	wynik.id_parent := null;
	---	wynik.id := null;
	---	wynik.wielokrotne := null;
	---	wynik.nazwa := null;
	---	wynik.id_pomieszczenie := rec_pom.id;
	---	wynik.nazwa_pomieszczenie := rec_pom.nazwa;
		FOR rec_l_param IN SELECT id, ma_dzieci, nazwa from WyposPomNier where id_pomieszczenie = pom_id LOOP
			IF rec_l_param.ma_dzieci = true THEN
				FOR rec_dzieci IN SELECT id, id_parent, wielokrotne, nazwa from wyposazenie_pom where id_parent = rec_l_param.id LOOP
					---RAISE NOTICE 'doing : %', rec_dzieci.id_parent;
					---RAISE NOTICE '% : %', rec_l_param.nazwa, rec_dzieci.nazwa;
					wynik.id_parent := rec_dzieci.id_parent;
					---RAISE NOTICE 'test : %', wynik.id_parent[licznik];
					wynik.id := rec_dzieci.id;
					wynik.wielokrotne := rec_dzieci.wielokrotne;
					wynik.nazwa := rec_l_param.nazwa || ':' || rec_dzieci.nazwa;
					---licznik := licznik + 1;	
					RETURN NEXT wynik;
				END LOOP;
			ELSE
				wynik.id_parent := rec_l_param.id;
				wynik.id := rec_l_param.id;
				wynik.wielokrotne := false;
				wynik.nazwa := rec_l_param.nazwa;
				--licznik := licznik + 1;
				RETURN NEXT wynik;
			END IF;
		END LOOP;
		--RETURN NEXT wynik;
	--END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.pobierzwyposazeniepomnier(pom_id integer) OWNER TO postgres;

--
-- Name: podajagentedycja(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION podajagentedycja(agent_id integer) RETURNS agent
    AS $$
DECLARE
	result agent;
BEGIN
	select into result * from agent where id = agent_id;
	IF result.licencja is null THEN
		select into result.licencja agent.licencja from agent where id = result.nadzor;
	END IF;
	RETURN result;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.podajagentedycja(agent_id integer) OWNER TO postgres;

--
-- Name: podajagentow(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION podajagentow() RETURNS SETOF slownik
    AS $$
DECLARE
	result slownik;
BEGIN
	FOR result in select id,nazwa_pot as nazwa from agent where aktywnosc_konto = true order by nazwa_pot asc LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.podajagentow() OWNER TO postgres;

--
-- Name: podajdaneumowa(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION podajdaneumowa(zapotrzebowanie_id integer) RETURNS umowadane
    AS $$
DECLARE
	result UmowaDane;
	rec_daneumowakupno PodajDaneUmowaKupno;
	osoba_prawna_id integer;
	rec_dowod record;
	rec_adres_osoba record;
BEGIN
	select into osoba_prawna_id id from osobowosc where nazwa = '_osobaprawna';
	select into rec_daneumowakupno * from PodajDaneUmowaKupno where id_zapotrzebowanie = zapotrzebowanie_id;
	
	---kopiowanie informacji
	result.id_zapotrzebowanie := rec_daneumowakupno.id_zapotrzebowanie;
	result.id_klient := rec_daneumowakupno.id_klient;
	result.id_osobowosc := rec_daneumowakupno.id_osobowosc;
	result.osobowosc := rec_daneumowakupno.osobowosc;
	result.id_osoba := rec_daneumowakupno.id_osoba;
	result.imie := rec_daneumowakupno.imie;
	result.nazwisko := rec_daneumowakupno.nazwisko;
	result.nazwisko_rodowe := rec_daneumowakupno.nazwisko_rodowe;
	result.pesel := rec_daneumowakupno.pesel;
	result.telefon := rec_daneumowakupno.telefon;
	result.komorka := rec_daneumowakupno.komorka;
	result.data := rec_daneumowakupno.data;
	result.agent := rec_daneumowakupno.agent;
	result.komorka_agent := rec_daneumowakupno.komorka_agent;
	---koniec kopii z widoku
	
	select into rec_dowod osoba_dowod.nazwa as dowod_nr, rodzaj_dowod_tozsamosc.nazwa as dowod from osoba_dowod 
	join rodzaj_dowod_tozsamosc on osoba_dowod.id_rodzaj_dowod_tozsamosc = rodzaj_dowod_tozsamosc.id where osoba_dowod.id_osoba = result.id_osoba;

	---kont kopiowanie info
	result.dowod := rec_dowod.dowod;
	result.nr_dowod := rec_dowod.dowod_nr;
	---koniec kont
	
	select into rec_adres_osoba osoba_adres.id as id_osoba, kod_pocztowy as kod, region_geog.nazwa as miejscowosc, ulica, numer_dom, numer_miesz from osoba_adres 
	join region_geog on osoba_adres.id_region_geog = region_geog.id where osoba_adres.id = result.id_osoba;

	IF rec_adres_osoba.id_osoba is not null THEN
		result.kod := rec_adres_osoba.kod;
		result.miejscowosc := rec_adres_osoba.miejscowosc;
		result.ulica := rec_adres_osoba.ulica;
		result.numer_dom := rec_adres_osoba.numer_dom;
		result.numer_miesz := rec_adres_osoba.numer_miesz;
	END IF;
	
	IF result.id_osobowosc = osoba_prawna_id THEN
		select into rec_adres_osoba dane_firma.id_klient, dane_firma.nazwa as nazwa_firma, dane_firma.nip, dane_firma.regon, dane_firma.krs, dane_firma.kod_pocztowy as kod, 
		region_geog.nazwa as miejscowosc, dane_firma.ulica, dane_firma.numer_dom, dane_firma.numer_miesz from dane_firma join region_geog on dane_firma.id_region_geog = region_geog.id 
		where dane_firma.id_klient = result.id_klient;
		
		result.nazwa_firma := rec_adres_osoba.nazwa_firma;
		result.nip := rec_adres_osoba.nip;
		result.regon := rec_adres_osoba.regon;
		result.krs := rec_adres_osoba.krs;
		result.kod_firma := rec_adres_osoba.kod;
		result.miejscowosc_firma := rec_adres_osoba.miejscowosc;
		result.ulica_firma := rec_adres_osoba.ulica;
		result.numer_dom_firma := rec_adres_osoba.numer_dom;
		result.numer_miesz_firma := rec_adres_osoba.numer_miesz;
	END IF;

	RETURN result;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.podajdaneumowa(zapotrzebowanie_id integer) OWNER TO postgres;

--
-- Name: podajdanezapotrzebowanie(integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION podajdanezapotrzebowanie(zapotrzebowanie_id integer, oferta_id integer) RETURNS zapotrzebowaniedane
    AS $$
DECLARE
	result ZapotrzebowanieDane;
	powierzchnia_id integer;
	liczba_pokoi_id integer;
	temp record;
	nier_id integer;
	trans_id integer;
BEGIN
	select into powierzchnia_id id from parametr_nier where nazwa = '_powierzchnia_uzytkowa';
	select into liczba_pokoi_id id from parametr_nier where nazwa = '_liczba_pokoi';

	select into nier_id id_nier_rodzaj from nieruchomosc join oferta on nieruchomosc.id = oferta.id_nieruchomosc where oferta.id = oferta_id;
	select into trans_id id_rodz_trans from oferta where oferta.id = oferta_id;

	select into temp id_klient, data_otw_zlecenie from zapotrzebowanie where id = zapotrzebowanie_id;
	result.id_zapotrzebowanie := zapotrzebowanie_id;
	result.id_klient := temp.id_klient;
	result.data_otw_zlecenie := temp.data_otw_zlecenie;

	select into temp zapotrzebowanie_trans_rodzaj.cena, zapotrzebowanie_trans_rodzaj.id from zapotrzebowanie_trans_rodzaj 
	join zapotrzebowanie_nier_rodzaj on zapotrzebowanie_nier_rodzaj.id = zapotrzebowanie_trans_rodzaj.id_zapotrzebowanie_nier_rodzaj
	where zapotrzebowanie_nier_rodzaj.id_zapotrzebowanie = zapotrzebowanie_id and zapotrzebowanie_nier_rodzaj.id_nier_rodzaj = nier_id and zapotrzebowanie_trans_rodzaj.id_trans_rodzaj = trans_id;

	result.cena := temp.cena;
	
	select into result.powierzchnia dane_txt_zap_min.wartosc from dane_txt_zap_min where id_zapotrzebowanie_trans_rodzaj = temp.id and id_parametr_nier = powierzchnia_id;
	select into result.powierzchnia_max dane_txt_zap_max.wartosc from dane_txt_zap_max where id_zapotrzebowanie_trans_rodzaj = temp.id and id_parametr_nier = powierzchnia_id;
	select into result.liczba_pokoi dane_txt_zap_min.wartosc from dane_txt_zap_min where id_zapotrzebowanie_trans_rodzaj = temp.id and id_parametr_nier = liczba_pokoi_id;
	select into result.liczba_pokoi_max dane_txt_zap_max.wartosc from dane_txt_zap_max where id_zapotrzebowanie_trans_rodzaj = temp.id and id_parametr_nier = liczba_pokoi_id;

	RETURN result;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.podajdanezapotrzebowanie(zapotrzebowanie_id integer, oferta_id integer) OWNER TO postgres;

--
-- Name: osoba_dowod; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE osoba_dowod (
    id integer NOT NULL,
    id_osoba integer NOT NULL,
    id_rodzaj_dowod_tozsamosc integer NOT NULL,
    nazwa text NOT NULL
);


ALTER TABLE public.osoba_dowod OWNER TO postgres;

--
-- Name: rodzaj_dowod_tozsamosc; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE rodzaj_dowod_tozsamosc (
    id integer NOT NULL,
    nazwa character varying(30) NOT NULL
);


ALTER TABLE public.rodzaj_dowod_tozsamosc OWNER TO postgres;

--
-- Name: podajdodanedowosoba; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW podajdodanedowosoba AS
    SELECT osoba_dowod.id_osoba, rodzaj_dowod_tozsamosc.id AS id_rodzaj_dowod_tozsamosc, osoba_dowod.nazwa AS nr_dowod, rodzaj_dowod_tozsamosc.nazwa AS rodzaj_dowod FROM (osoba_dowod JOIN rodzaj_dowod_tozsamosc ON ((osoba_dowod.id_rodzaj_dowod_tozsamosc = rodzaj_dowod_tozsamosc.id)));


ALTER TABLE public.podajdodanedowosoba OWNER TO postgres;

--
-- Name: podajdokosoba(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION podajdokosoba(osoba_id integer) RETURNS SETOF podajdodanedowosoba
    AS $$ ---podanie wpisanych, opcja aktualizacji
DECLARE
	result PodajDodaneDowOsoba;
BEGIN
	FOR result IN select * from PodajDodaneDowOsoba where id_osoba = osoba_id LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.podajdokosoba(osoba_id integer) OWNER TO postgres;

--
-- Name: podajdostdowosoba; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW podajdostdowosoba AS
    SELECT DISTINCT rodzaj_dowod_tozsamosc.id AS id_rodzaj_dowod_tozsamosc, osoba.id AS id_osoba, rodzaj_dowod_tozsamosc.nazwa AS rodzaj_dowod FROM rodzaj_dowod_tozsamosc, osoba WHERE (NOT (rodzaj_dowod_tozsamosc.id IN (SELECT osoba_dowod.id_rodzaj_dowod_tozsamosc FROM osoba_dowod WHERE (osoba_dowod.id_osoba = osoba.id)))) ORDER BY rodzaj_dowod_tozsamosc.id, osoba.id, rodzaj_dowod_tozsamosc.nazwa;


ALTER TABLE public.podajdostdowosoba OWNER TO postgres;

--
-- Name: podajdostdokosoba(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION podajdostdokosoba(osoba_id integer) RETURNS SETOF podajdostdowosoba
    AS $$ ---podanie nie wprowadzonych, opcja wprowadzenia
DECLARE
	result PodajDostDowOsoba;
BEGIN
	FOR result IN select * from PodajDostDowOsoba where id_osoba = osoba_id LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.podajdostdokosoba(osoba_id integer) OWNER TO postgres;

--
-- Name: spotkanie; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spotkanie (
    id integer NOT NULL,
    id_oferta integer NOT NULL,
    id_zapotrzebowanie integer NOT NULL,
    id_klient integer,
    klient_oferujacy boolean DEFAULT false NOT NULL,
    id_umowienie integer NOT NULL,
    spotkanie_data date NOT NULL,
    spotkanie_godzina integer NOT NULL,
    spotkanie_minuta integer NOT NULL,
    id_agent integer NOT NULL,
    komentarz text
);


ALTER TABLE public.spotkanie OWNER TO postgres;

--
-- Name: spotkanie_os; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spotkanie_os (
    id integer NOT NULL,
    id_spotkanie integer NOT NULL,
    id_osoba integer NOT NULL
);


ALTER TABLE public.spotkanie_os OWNER TO postgres;

--
-- Name: umowienie; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE umowienie (
    id integer NOT NULL,
    nazwa character varying(40) NOT NULL
);


ALTER TABLE public.umowienie OWNER TO postgres;

--
-- Name: spotkaniaklient; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW spotkaniaklient AS
    SELECT spotkanie.id AS id_spotkanie, spotkanie_os.id_osoba, spotkanie.id_klient, spotkanie.id_oferta, spotkanie.id_zapotrzebowanie, spotkanie.klient_oferujacy AS is_oferent, osobaview.imie, osobaview.nazwisko, osobaview.telefon, osobaview.komorka, umowienie.nazwa AS umowienie, spotkanie.spotkanie_data AS data, (((godzina.nazwa)::text || ' : '::text) || (minuta.nazwa)::text) AS godzina, agent.nazwa_pot AS agent FROM ((((((spotkanie JOIN spotkanie_os ON ((spotkanie.id = spotkanie_os.id_spotkanie))) JOIN osobaview ON ((spotkanie_os.id_osoba = osobaview.id_osoba))) JOIN agent ON ((spotkanie.id_agent = agent.id))) JOIN umowienie ON ((spotkanie.id_umowienie = umowienie.id))) JOIN godzina ON ((spotkanie.spotkanie_godzina = godzina.id))) JOIN minuta ON ((spotkanie.spotkanie_minuta = minuta.id)));


ALTER TABLE public.spotkaniaklient OWNER TO postgres;

--
-- Name: podajdostepnespotkania(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION podajdostepnespotkania(oferta_id integer) RETURNS SETOF spotkaniaklient
    AS $$
DECLARE
	result SpotkaniaKlient;
BEGIN
	---dolozyc tez klauzule data >= dzis
	FOR result in select distinct on (id_zapotrzebowanie) * from SpotkaniaKlient where id_oferta = oferta_id and is_oferent = false and id_zapotrzebowanie not in 
	(select id_zapotrzebowanie from spotkanie where id_oferta = oferta_id and klient_oferujacy = true and SpotkaniaKlient.data = spotkanie.spotkanie_data) LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.podajdostepnespotkania(oferta_id integer) OWNER TO postgres;

--
-- Name: jezyk; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE jezyk (
    id integer NOT NULL,
    nazwa character varying(20) NOT NULL,
    id_waluta integer NOT NULL
);


ALTER TABLE public.jezyk OWNER TO postgres;

--
-- Name: podajdostopisyoferta; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW podajdostopisyoferta AS
    SELECT oferta.id AS id_oferta, jezyk.id AS id_jezyk, jezyk.nazwa AS jezyk FROM oferta, jezyk WHERE (NOT (jezyk.id IN (SELECT opis.id_jezyk FROM opis WHERE (opis.id_oferta = oferta.id))));


ALTER TABLE public.podajdostopisyoferta OWNER TO postgres;

--
-- Name: podajdostopisoferta(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION podajdostopisoferta(oferta_id integer) RETURNS SETOF podajdostopisyoferta
    AS $$
DECLARE
	result PodajDostOpisyOferta;
BEGIN
	FOR result IN select * from PodajDostOpisyOferta where id_oferta = oferta_id LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.podajdostopisoferta(oferta_id integer) OWNER TO postgres;

--
-- Name: opis_zapotrzebowanie; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE opis_zapotrzebowanie (
    id integer NOT NULL,
    id_zapotrzebowanie_trans_rodzaj integer NOT NULL,
    id_jezyk integer NOT NULL,
    wartosc text NOT NULL
);


ALTER TABLE public.opis_zapotrzebowanie OWNER TO postgres;

--
-- Name: podajdostopisyzapotrzebowanietrrodz; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW podajdostopisyzapotrzebowanietrrodz AS
    SELECT zapotrzebowanie_trans_rodzaj.id AS id_zapotrzebowanie_trans_rodzaj, jezyk.id AS id_jezyk, jezyk.nazwa AS jezyk FROM zapotrzebowanie_trans_rodzaj, jezyk WHERE (NOT (jezyk.id IN (SELECT opis_zapotrzebowanie.id_jezyk FROM opis_zapotrzebowanie WHERE (opis_zapotrzebowanie.id_zapotrzebowanie_trans_rodzaj = zapotrzebowanie_trans_rodzaj.id))));


ALTER TABLE public.podajdostopisyzapotrzebowanietrrodz OWNER TO postgres;

--
-- Name: podajdostopiszapotrzebowanietrrodz(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION podajdostopiszapotrzebowanietrrodz(zapotrzebowanie_trans_rodzaj_id integer) RETURNS SETOF podajdostopisyzapotrzebowanietrrodz
    AS $$
DECLARE
	result PodajDostOpisyZapotrzebowanieTrRodz;
BEGIN
	FOR result IN select * from PodajDostOpisyZapotrzebowanieTrRodz where id_zapotrzebowanie_trans_rodzaj = zapotrzebowanie_trans_rodzaj_id LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.podajdostopiszapotrzebowanietrrodz(zapotrzebowanie_trans_rodzaj_id integer) OWNER TO postgres;

--
-- Name: osoba_klient; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE osoba_klient (
    id integer NOT NULL,
    id_klient integer NOT NULL,
    id_osoba integer NOT NULL
);


ALTER TABLE public.osoba_klient OWNER TO postgres;

--
-- Name: wlasciciel; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE wlasciciel (
    id integer NOT NULL,
    id_nieruchomosc integer NOT NULL,
    id_osoba integer NOT NULL,
    procent_udzial double precision
);


ALTER TABLE public.wlasciciel OWNER TO postgres;

--
-- Name: podajdostoswlasciciel; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW podajdostoswlasciciel AS
    SELECT nieruchomosc.id AS id_nieruchomosc, osoba_klient.id_osoba, osoba.nazwisko, imie.nazwa AS imie, osoba.pesel FROM (((nieruchomosc JOIN osoba_klient ON ((nieruchomosc.id_klient = osoba_klient.id_klient))) JOIN osoba ON ((osoba_klient.id_osoba = osoba.id))) JOIN imie ON ((osoba.id_imie = imie.id))) WHERE (NOT (osoba.id IN (SELECT wlasciciel.id_osoba FROM wlasciciel WHERE (wlasciciel.id_nieruchomosc = nieruchomosc.id))));


ALTER TABLE public.podajdostoswlasciciel OWNER TO postgres;

--
-- Name: podajdostoswlas(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION podajdostoswlas(nieruchomosc_id integer) RETURNS SETOF podajdostoswlasciciel
    AS $$
DECLARE
	result PodajDostOsWlasciciel;
BEGIN
	FOR result IN select * from PodajDostOsWlasciciel where id_nieruchomosc = nieruchomosc_id LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.podajdostoswlas(nieruchomosc_id integer) OWNER TO postgres;

--
-- Name: podajdostprocudzialwlasnier(integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION podajdostprocudzialwlasnier(nieruchomosc_id integer, osoba_id integer) RETURNS double precision
    AS $$
DECLARE
	max_udz float;
	temp record;
	udz_osoba float;
BEGIN
	max_udz := 100;
	udz_osoba := 0;
	--wyznaczenie udzialu osoby
	IF osoba_id is not null THEN
		select into udz_osoba wlasciciel.procent_udzial from wlasciciel where id_nieruchomosc = nieruchomosc_id and id_osoba = osoba_id;
	END IF;

	FOR temp IN select wlasciciel.procent_udzial from wlasciciel where id_nieruchomosc = nieruchomosc_id LOOP
		max_udz := max_udz - temp.procent_udzial;
	END LOOP;
	---jesli osoba ma udzial - zostal on wyznaczony, trzeba go dodac; jesli nie dodane zostanie 0
	max_udz := max_udz + udz_osoba;
	return max_udz;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.podajdostprocudzialwlasnier(nieruchomosc_id integer, osoba_id integer) OWNER TO postgres;

--
-- Name: podajdostzapotrznierszczeg(integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION podajdostzapotrznierszczeg(zapotrzebowanie_trans_rodzaj_id integer, nier_rodzaj_id integer) RETURNS SETOF slownik
    AS $$
DECLARE
	result slownik;
BEGIN
	FOR result IN select * from (select * from SzczegolyNieruchomosc(nier_rodzaj_id)) as szcz_nier where szcz_nier.id not in 
	(select id_rodz_nier_szcz from zap_szcz_nier where id_zapotrzebowanie_trans_rodzaj = zapotrzebowanie_trans_rodzaj_id) LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.podajdostzapotrznierszczeg(zapotrzebowanie_trans_rodzaj_id integer, nier_rodzaj_id integer) OWNER TO postgres;

--
-- Name: email_osoba; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE email_osoba (
    id integer NOT NULL,
    id_osoba integer,
    nazwa character varying(50) NOT NULL,
    opis text
);


ALTER TABLE public.email_osoba OWNER TO postgres;

--
-- Name: podajemaile(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION podajemaile(osoba_id integer) RETURNS SETOF email_osoba
    AS $$
DECLARE
	result email_osoba;
BEGIN
	FOR result IN select * from email_osoba where id_osoba = osoba_id order by nazwa asc LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.podajemaile(osoba_id integer) OWNER TO postgres;

--
-- Name: email_media_nieruchomosc; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE email_media_nieruchomosc (
    id integer NOT NULL,
    id_media_nieruchomosc integer NOT NULL,
    nazwa character varying(50) NOT NULL,
    opis character varying(50)
);


ALTER TABLE public.email_media_nieruchomosc OWNER TO postgres;

--
-- Name: podajemailmedia(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION podajemailmedia(media_nieruchomosc_id integer) RETURNS SETOF email_media_nieruchomosc
    AS $$
DECLARE
	result email_media_nieruchomosc;
BEGIN
	FOR result in select * from email_media_nieruchomosc where id_media_nieruchomosc = media_nieruchomosc_id LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.podajemailmedia(media_nieruchomosc_id integer) OWNER TO postgres;

--
-- Name: podajfilmy(integer, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION podajfilmy(nieruchomosc_id integer, sciezka text) RETURNS SETOF slownik
    AS $$
DECLARE
	result slownik;
BEGIN
	FOR result IN select id, nazwa from film where id_nieruchomosc = nieruchomosc_id LOOP
		result.nazwa := '<a href="' || sciezka || result.nazwa || '" target="_blank"><img src="' || sciezka || result.nazwa || '" width="30" length="30" /></a>';
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.podajfilmy(nieruchomosc_id integer, sciezka text) OWNER TO postgres;

--
-- Name: podajidnierofid(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION podajidnierofid(oferta_id integer) RETURNS integer
    AS $$
DECLARE
	nieruchomosc_id integer;
BEGIN
	select into nieruchomosc_id id_nieruchomosc from oferta where id = oferta_id;
	RETURN nieruchomosc_id;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.podajidnierofid(oferta_id integer) OWNER TO postgres;

--
-- Name: zapotrzebowanieidtransidnier; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW zapotrzebowanieidtransidnier AS
    SELECT zapotrzebowanie_trans_rodzaj.id AS id_zapotrzebowanie_trans_rodzaj, zapotrzebowanie_trans_rodzaj.id_trans_rodzaj, zapotrzebowanie_nier_rodzaj.id_nier_rodzaj FROM (zapotrzebowanie_trans_rodzaj JOIN zapotrzebowanie_nier_rodzaj ON ((zapotrzebowanie_trans_rodzaj.id_zapotrzebowanie_nier_rodzaj = zapotrzebowanie_nier_rodzaj.id)));


ALTER TABLE public.zapotrzebowanieidtransidnier OWNER TO postgres;

--
-- Name: podajidtransidnierzapotrzebowanie(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION podajidtransidnierzapotrzebowanie(zapotrzebowanie_trans_rodzaj_id integer) RETURNS zapotrzebowanieidtransidnier
    AS $$
DECLARE
	result ZapotrzebowanieIdTransIdNier;
BEGIN
	select into result * from ZapotrzebowanieIdTransIdNier where id_zapotrzebowanie_trans_rodzaj = zapotrzebowanie_trans_rodzaj_id;
	return result;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.podajidtransidnierzapotrzebowanie(zapotrzebowanie_trans_rodzaj_id integer) OWNER TO postgres;

--
-- Name: podajinsotodomidpoofid(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION podajinsotodomidpoofid(oferta_id integer) RETURNS integer
    AS $$
DECLARE
	test integer;
	portal_otodom_id integer;
BEGIN
	select into portal_otodom_id id from portal where nazwa = 'Otodom';
	select into test portal_ins_id from portal_wys where id_oferta = oferta_id and id_portal = portal_otodom_id;
	return test;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.podajinsotodomidpoofid(oferta_id integer) OWNER TO postgres;

--
-- Name: podajjezykiid(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION podajjezykiid() RETURNS SETOF integer
    AS $$
DECLARE
	jezyk_id integer;
BEGIN
	FOR jezyk_id in select id from jezyk order by id asc LOOP
		RETURN NEXT jezyk_id;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.podajjezykiid() OWNER TO postgres;

--
-- Name: podajklientosoba(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION podajklientosoba(osoba_id integer) RETURNS SETOF slownik
    AS $$
DECLARE
	result slownik;
	rec_kl OsobaKlient;
	osoba_prawna integer;
	test integer;
	rec_temp record;
	licznik integer;
BEGIN
	select into osoba_prawna id from osobowosc where nazwa = '_osobaprawna';
	FOR rec_kl IN select * from OsobaKlient where id_osoba = osoba_id LOOP
		select into test id_osobowosc from klient where id = rec_kl.id_klient;
		result.nazwa := '';
		IF test = osoba_prawna THEN
			select into result.nazwa dane_firma.nazwa from dane_firma where id_klient = rec_kl.id_klient;
			result.id := rec_kl.id_klient;
		ELSE
			licznik := 1;
			FOR rec_temp IN select * from OsobaView join osoba_klient on OsobaView.id_osoba = osoba_klient.id_osoba where osoba_klient.id_klient = rec_kl.id_klient LOOP
				IF licznik > 1 THEN
					result.nazwa := result.nazwa || ', ';
				END IF;
				result.nazwa := result.nazwa || rec_temp.nazwisko || ' ' || rec_temp.imie;
				licznik := licznik + 1;
			END LOOP;
			result.id := rec_kl.id_klient;
		END IF;
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.podajklientosoba(osoba_id integer) OWNER TO postgres;

--
-- Name: podajkomorka(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION podajkomorka(osoba_id integer) RETURNS SETOF komorka
    AS $$
DECLARE
	result komorka;
BEGIN
	FOR result IN select * from komorka where id_osoba = osoba_id LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.podajkomorka(osoba_id integer) OWNER TO postgres;

--
-- Name: kon_m_nieruchomosc; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE kon_m_nieruchomosc (
    id integer NOT NULL,
    id_media_nieruchomosc integer NOT NULL,
    id_agent integer NOT NULL,
    komentarz text NOT NULL,
    data timestamp without time zone NOT NULL
);


ALTER TABLE public.kon_m_nieruchomosc OWNER TO postgres;

--
-- Name: kontaktmedianier; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW kontaktmedianier AS
    SELECT kon_m_nieruchomosc.id_media_nieruchomosc, kon_m_nieruchomosc.komentarz, kon_m_nieruchomosc.data, agent.nazwa_pot AS agent FROM (kon_m_nieruchomosc JOIN agent ON ((kon_m_nieruchomosc.id_agent = agent.id)));


ALTER TABLE public.kontaktmedianier OWNER TO postgres;

--
-- Name: podajkontaktymedianier(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION podajkontaktymedianier(media_nieruchomosc_id integer) RETURNS SETOF kontaktmedianier
    AS $$
DECLARE
	result KontaktMediaNier;
BEGIN
	FOR result in select * from KontaktMediaNier where id_media_nieruchomosc = media_nieruchomosc_id order by data desc LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.podajkontaktymedianier(media_nieruchomosc_id integer) OWNER TO postgres;

--
-- Name: podajkontoagenta(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION podajkontoagenta(agent_id integer) RETURNS SETOF slownik
    AS $$
DECLARE
	result slownik;
BEGIN
	FOR result in select id, nr_konto as nazwa from konto_agent where id_agent = agent_id LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.podajkontoagenta(agent_id integer) OWNER TO postgres;

--
-- Name: podajlistaofertpublikacjaofertynet(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION podajlistaofertpublikacjaofertynet() RETURNS SETOF ofertaofnet
    AS $$
DECLARE
	---powinny byc pobierane tylko oferty nowe i zmiany cen, to opublikowac w oferty net odnotowac w bazie i zapomniec - oferty same sie prolonguja w tym serwisie
	---OfertaNowosc
	result OfertaOfNet;
	oferta_id integer;
	--akt_data date;
BEGIN
	--select current_date - 1;
	--select current_date;
	---FOR oferta_id in select id_oferta from OfertaNowosc where data between ('2008-07-15') and (select current_date) LOOP
	---FOR oferta_id in select id_oferta from OfertaNowosc where data between (select current_date - 1) and (select current_date) LOOP
	FOR oferta_id in select id_oferta from OfertaNowosc where id_rodz_trans = (select id from trans_rodzaj where nazwa = '_sprzedaz') and data between (select current_date - 1) and (select current_date) order by data asc LOOP ---where data between (select current_date - 1) and (select current_date) LOOP
---and data between '2008-06-15' and '2008-08-25'
		select into result * from PodajOfertaOfertyNet (oferta_id);
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.podajlistaofertpublikacjaofertynet() OWNER TO postgres;

--
-- Name: podajlistawskoferta(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION podajlistawskoferta(oferta_id integer) RETURNS SETOF listawskazanzapotrzebowanie
    AS $$
DECLARE
	result ListaWskazanZapotrzebowanie;
	rec_temp record;
	rec_osoba record;
	licznik integer;
BEGIN
	FOR rec_temp IN select id_zapotrzebowanie, lista_wsk_adr.id_klient, zapotrzebowanie.data_otw_zlecenie, (ogladanie_data || ' ' || godzina.nazwa || ':' || minuta.nazwa)::timestamp as data, 
	agent.nazwa_pot as agent from lista_wsk_adr join zapotrzebowanie on lista_wsk_adr.id_zapotrzebowanie = zapotrzebowanie.id 
	join godzina on lista_wsk_adr.ogladanie_godzina = godzina.id join minuta on lista_wsk_adr.ogladanie_minuta = minuta.id join agent on lista_wsk_adr.id_agent = agent.id 
	where lista_wsk_adr.id_oferta = oferta_id order by data asc LOOP
		result.id_zapotrzebowanie := rec_temp.id_zapotrzebowanie;
		result.data := rec_temp.data;
		result.data_otw_zlecenie := rec_temp.data_otw_zlecenie;
		result.agent := rec_temp.agent;
		licznik := 1;
		result.osoba := null;
		result.pesel := null;
		FOR rec_osoba IN select * from OsobaView join osoba_klient on osobaview.id_osoba = osoba_klient.id_osoba where osoba_klient.id_klient = rec_temp.id_klient LOOP
			result.osoba[licznik] := rec_osoba.nazwisko || ' ' || rec_osoba.imie;
			result.pesel[licznik] := rec_osoba.pesel;
			result.telefon[licznik] := rec_osoba.telefon;
			licznik := licznik + 1;
		END LOOP;
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.podajlistawskoferta(oferta_id integer) OWNER TO postgres;

--
-- Name: podajlistawskzapotrzebowanie(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION podajlistawskzapotrzebowanie(zapotrzebowanie_id integer) RETURNS SETOF listawskzapotrzebowanie
    AS $$
DECLARE
	temp PodajDaneListaWskAdr;
	result ListaWskZapotrzebowanie;
	powierzchnia_id integer;
	liczba_pokoi_id integer;
BEGIN
	select into powierzchnia_id id from parametr_nier where nazwa = '_powierzchnia_uzytkowa';
	select into liczba_pokoi_id id from parametr_nier where nazwa = '_liczba_pokoi';

	FOR temp IN select * from PodajDaneListaWskAdr where id_zapotrzebowanie = zapotrzebowanie_id LOOP
		result := temp;
		select into result.powierzchnia wartosc from dane_txt_nier where id_parametr_nier = powierzchnia_id and id_nieruchomosc = result.id_nieruchomosc;
		select into result.liczba_pokoi wartosc from dane_txt_nier where id_parametr_nier = liczba_pokoi_id and id_nieruchomosc = result.id_nieruchomosc;
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.podajlistawskzapotrzebowanie(zapotrzebowanie_id integer) OWNER TO postgres;

--
-- Name: podajmedianaczasie(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION podajmedianaczasie(agent_id integer) RETURNS SETOF medianieruchomosc
    AS $$
DECLARE
	result MediaNieruchomosc;
	data_3mies date;
	akt_data date;
	zapytanie text;
BEGIN
	select into data_3mies current_date - 91;
	select into akt_data current_date;
	zapytanie := 'select * from MediaNieruchomosc where data between \'' || data_3mies || '\' and \'' || akt_data || '\'';
	IF agent_id is not null THEN
		zapytanie := zapytanie || ' and id_agent = ' || agent_id;
	END IF;
	zapytanie := zapytanie || ' order by data desc;';
	FOR result in execute zapytanie LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.podajmedianaczasie(agent_id integer) OWNER TO postgres;

--
-- Name: podajmediumdlaofzap(integer, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION podajmediumdlaofzap(of_zap_id integer, is_oferent boolean) RETURNS SETOF medianieruchomosc
    AS $$
DECLARE
	result MediaNieruchomosc;
BEGIN
	FOR result in select * from MediaNieruchomosc where oferent = is_oferent and id_of_zap = of_zap_id LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.podajmediumdlaofzap(of_zap_id integer, is_oferent boolean) OWNER TO postgres;

--
-- Name: podajnazwaagentid(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION podajnazwaagentid(agent_id integer) RETURNS slownik
    AS $$
DECLARE
	result slownik;
BEGIN
	select into result id, nazwa_pot as nazwa from agent where id = agent_id;
	RETURN result;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.podajnazwaagentid(agent_id integer) OWNER TO postgres;

--
-- Name: podajnier(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION podajnier() RETURNS SETOF slownik
    AS $$
DECLARE
	rec_nier slownik;
BEGIN
	FOR rec_nier IN SELECT id, nazwa from nier_rodzaj LOOP
		RETURN NEXT rec_nier;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.podajnier() OWNER TO postgres;

--
-- Name: podajnierdlatrans(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION podajnierdlatrans(trans_id integer) RETURNS SETOF slownik
    AS $$
DECLARE
	rec_trans slownik;
BEGIN
	
	FOR rec_trans IN SELECT transakcja_nier.id_nier_rodzaj as id, nier_rodzaj.nazwa as nazwa from nier_rodzaj join transakcja_nier on nier_rodzaj.id = transakcja_nier.id_nier_rodzaj where transakcja_nier.id_trans_rodzaj = trans_id LOOP
		RETURN NEXT rec_trans;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.podajnierdlatrans(trans_id integer) OWNER TO postgres;

--
-- Name: podajnierzapotrzebowanie(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION podajnierzapotrzebowanie(zapotrzebowanie_id integer) RETURNS SETOF slownik
    AS $$
DECLARE
	result slownik;
BEGIN
	FOR result IN select zapotrzebowanie_nier_rodzaj.id as id, nier_rodzaj.nazwa as nazwa from zapotrzebowanie_nier_rodzaj join nier_rodzaj on
	zapotrzebowanie_nier_rodzaj.id_nier_rodzaj = nier_rodzaj.id where zapotrzebowanie_nier_rodzaj.id_zapotrzebowanie = zapotrzebowanie_id LOOP
		return next result;
	END LOOP;
	return;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.podajnierzapotrzebowanie(zapotrzebowanie_id integer) OWNER TO postgres;

--
-- Name: podajniewytlumaczoneslowa(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION podajniewytlumaczoneslowa(jezyk_id integer) RETURNS SETOF slownik
    AS $$
--select id, nazwa from lang_tag where nazwa not in (select nazwa_lang_tag from tlumaczenie where id_jezyk = 1)
DECLARE
	result slownik;
BEGIN
	FOR result in select id, nazwa from lang_tag where nazwa not in (select nazwa_lang_tag from tlumaczenie where id_jezyk = jezyk_id) LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.podajniewytlumaczoneslowa(jezyk_id integer) OWNER TO postgres;

--
-- Name: ustalenia; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE ustalenia (
    id integer NOT NULL,
    id_klient integer NOT NULL,
    id_agent integer NOT NULL,
    data timestamp without time zone,
    tresc text
);


ALTER TABLE public.ustalenia OWNER TO postgres;

--
-- Name: notatkiklient; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW notatkiklient AS
    SELECT ustalenia.id AS id_notatka, ustalenia.id_klient, agent.nazwa_pot AS agent, ustalenia.data, ustalenia.tresc AS notatka FROM (ustalenia JOIN agent ON ((ustalenia.id_agent = agent.id)));


ALTER TABLE public.notatkiklient OWNER TO postgres;

--
-- Name: podajnotatkaklient(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION podajnotatkaklient(klient_id integer) RETURNS SETOF notatkiklient
    AS $$
DECLARE
	result NotatkiKlient;
BEGIN
	FOR result IN select * from NotatkiKlient where id_klient = klient_id order by data desc LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.podajnotatkaklient(klient_id integer) OWNER TO postgres;

--
-- Name: opis_nieruchomosc; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE opis_nieruchomosc (
    id integer NOT NULL,
    id_nieruchomosc integer NOT NULL,
    id_agent integer NOT NULL,
    data timestamp without time zone,
    tresc text
);


ALTER TABLE public.opis_nieruchomosc OWNER TO postgres;

--
-- Name: notatkinieruchomosc; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW notatkinieruchomosc AS
    SELECT opis_nieruchomosc.id AS id_opis_nieruchomosc, opis_nieruchomosc.id_nieruchomosc, agent.nazwa_pot AS agent, opis_nieruchomosc.data, opis_nieruchomosc.tresc AS notatka FROM (opis_nieruchomosc JOIN agent ON ((opis_nieruchomosc.id_agent = agent.id)));


ALTER TABLE public.notatkinieruchomosc OWNER TO postgres;

--
-- Name: podajnotatkanieruchomosc(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION podajnotatkanieruchomosc(nieruchomosc_id integer) RETURNS SETOF notatkinieruchomosc
    AS $$
DECLARE
	result NotatkiNieruchomosc;
BEGIN
	FOR result IN select * from NotatkiNieruchomosc where id_nieruchomosc = nieruchomosc_id order by data desc LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.podajnotatkanieruchomosc(nieruchomosc_id integer) OWNER TO postgres;

--
-- Name: podajnotatkanieruchomoscofid(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION podajnotatkanieruchomoscofid(oferta_id integer) RETURNS SETOF notatkinieruchomosc
    AS $$
DECLARE
	nier_id integer;
	result NotatkiNieruchomosc;
BEGIN
	select into nier_id id_nieruchomosc from oferta where id = oferta_id;
	FOR result IN select * from NotatkiNieruchomosc where id_nieruchomosc = nier_id order by data desc LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.podajnotatkanieruchomoscofid(oferta_id integer) OWNER TO postgres;

--
-- Name: podajoferencispotkaniezapotrzebowanie(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION podajoferencispotkaniezapotrzebowanie(zapotrzebowanie_id integer) RETURNS SETOF spotkaniaklient
    AS $$
DECLARE
	result SpotkaniaKlient;
BEGIN
	---distinct on (id_spotkanie)
	FOR result in select * from SpotkaniaKlient where id_zapotrzebowanie = zapotrzebowanie_id and is_oferent = true and data >= (select current_date) order by data asc LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.podajoferencispotkaniezapotrzebowanie(zapotrzebowanie_id integer) OWNER TO postgres;

--
-- Name: podajofertadolistawsk(integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION podajofertadolistawsk(oferta_id integer, jezyk_id integer) RETURNS ofertalistawskazan
    AS $$
DECLARE
	result OfertaListaWskazan;
	rec_temp record;
	os_id record;
	licznik integer;
	test integer;
	temp record;
	nieruchomosc_id integer;
	rodzaj_budynek_id integer;
BEGIN
	---docelowo waluta ceny bedzie przechodzic przez id jezyka - przeliczanie
	licznik := 1;														---tu ewentualnie podzialac :P
	select into rec_temp oferta.id as id_oferta, nieruchomosc.id as id_nieruchomosc, nieruchomosc.id_klient, nieruchomosc.ulica as adres, oferta.cena || ' PLN' as cena, nieruchomosc.id_nier_rodzaj  
	from oferta 
	join nieruchomosc on oferta.id_nieruchomosc = nieruchomosc.id where oferta.id = oferta_id;
	--opis.wartosc as opis 
	---left join opis on oferta.id = opis.id_oferta where opis.id_jezyk = jezyk_id
	result.id_oferta := rec_temp.id_oferta;
	result.id_klient := rec_temp.id_klient;
	result.adres := rec_temp.adres;
	result.cena := rec_temp.cena;

	select into temp nieruchomosc.id as id_nieruchomosc, nieruchomosc.id_rodz_nier_szcz from nier_rodzaj join nieruchomosc on nier_rodzaj.id = nieruchomosc.id_nier_rodzaj 
	join oferta on nieruchomosc.id = oferta.id_nieruchomosc where oferta.id = oferta_id;

	nieruchomosc_id := temp.id_nieruchomosc;	
	rodzaj_budynek_id := temp.id_rodz_nier_szcz;

	select into result.opis PodajOpisOferty (oferta_id, jezyk_id, rec_temp.id_nier_rodzaj, rodzaj_budynek_id, nieruchomosc_id);
	--koniec opisu

	select into test count(osoba_oferta.id) from osoba_oferta join wlasciciel on osoba_oferta.id_osoba = wlasciciel.id_osoba where wlasciciel.id_nieruchomosc = rec_temp.id_nieruchomosc 
	and osoba_oferta.id_oferta = oferta_id;
	
	FOR os_id IN select id_osoba from wlasciciel where id_nieruchomosc = rec_temp.id_nieruchomosc LOOP
		result.wlasciciel[licznik] := os_id.id_osoba;
		licznik := licznik + 1;
	END LOOP;

	IF test = 0 THEN
		---osoba oferujaca nie figuruje jako wlasciciel
		licznik := 1;
		FOR os_id IN select id_osoba from osoba_oferta where id_oferta = oferta_id LOOP
			result.oferent[licznik] := os_id.id_osoba;
			licznik := licznik + 1;
		END LOOP;
	END IF;
	RETURN result;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.podajofertadolistawsk(oferta_id integer, jezyk_id integer) OWNER TO postgres;

--
-- Name: podajofertadomiporta(integer, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION podajofertadomiporta(oferta_id integer, automat boolean) RETURNS ofertadomiporta
    AS $$
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
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.podajofertadomiporta(oferta_id integer, automat boolean) OWNER TO postgres;

--
-- Name: podajofertagablota(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION podajofertagablota(oferta_id integer) RETURNS oferta_gablota
    AS $$
DECLARE
	rec_OfertaGablota OfertaGablota;
	rec_info_agent record;
	result oferta_gablota;
	pop_cena text;
BEGIN
	select into rec_OfertaGablota * from OfertaGablota where id_oferta = oferta_id;
	select into rec_info_agent telefon, komorka, email from agent where id = rec_OfertaGablota.id_agent;
	result.email := rec_info_agent.email;
	result.telefon := rec_info_agent.telefon;
	result.komorka := rec_info_agent.komorka;
-----------------------------------------------------------id jezyk
	select into result.agent nazwa from AgentWersjaOficjalna (1) where id = rec_OfertaGablota.id_agent;

	result.id_oferta := oferta_id;
	result.id_nieruchomosc := rec_OfertaGablota.id_nieruchomosc;
	result.lokalizacja := rec_OfertaGablota.lokalizacja;
	result.cena := rec_OfertaGablota.cena;
	result.rodzaj_budynek := rec_OfertaGablota.rodzaj_budynek;
	result.rynek_pierw := rec_OfertaGablota.rynek_pierw;
	result.wylacznosc := rec_OfertaGablota.wylacznosc;

	select into pop_cena cena.cena from cena where cena.cena != rec_OfertaGablota.cena and cena.id_oferta = rec_OfertaGablota.id_oferta order by cena.data desc limit 1;
	result.cena_pop := pop_cena;

	RETURN result;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.podajofertagablota(oferta_id integer) OWNER TO postgres;

--
-- Name: podajofertaofertynet(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION podajofertaofertynet(oferta_id integer) RETURNS ofertaofnet
    AS $$
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
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.podajofertaofertynet(oferta_id integer) OWNER TO postgres;

--
-- Name: podajofertaotodom(integer, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION podajofertaotodom(oferta_id integer, automat boolean) RETURNS SETOF ofertaotodom
    AS $_X$
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
$_X$
    LANGUAGE plpgsql;


ALTER FUNCTION public.podajofertaotodom(oferta_id integer, automat boolean) OWNER TO postgres;

--
-- Name: wysylka_ofert_zapotrzebowanie; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE wysylka_ofert_zapotrzebowanie (
    id integer NOT NULL,
    id_zapotrzebowanie integer NOT NULL,
    id_oferta integer NOT NULL,
    cena double precision NOT NULL,
    data date DEFAULT ('now'::text)::date NOT NULL,
    is_lst_wsk boolean DEFAULT false NOT NULL
);


ALTER TABLE public.wysylka_ofert_zapotrzebowanie OWNER TO postgres;

--
-- Name: wysylaneofertyzapotrzebowanie; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW wysylaneofertyzapotrzebowanie AS
    SELECT wysylka_ofert_zapotrzebowanie.id_zapotrzebowanie, wysylka_ofert_zapotrzebowanie.id_oferta, wysylka_ofert_zapotrzebowanie.cena, wysylka_ofert_zapotrzebowanie.data, wysylka_ofert_zapotrzebowanie.is_lst_wsk FROM wysylka_ofert_zapotrzebowanie;


ALTER TABLE public.wysylaneofertyzapotrzebowanie OWNER TO postgres;

--
-- Name: podajofertawyslanazapotrzebowanie(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION podajofertawyslanazapotrzebowanie(zapotrzebowanie_id integer) RETURNS SETOF wysylaneofertyzapotrzebowanie
    AS $$
DECLARE
	result WysylaneOfertyZapotrzebowanie;
BEGIN
	FOR result in select * from WysylaneOfertyZapotrzebowanie where id_zapotrzebowanie = zapotrzebowanie_id LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.podajofertawyslanazapotrzebowanie(zapotrzebowanie_id integer) OWNER TO postgres;

--
-- Name: podajofertydeaktywacja(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION podajofertydeaktywacja(portal_nazwa text) RETURNS SETOF integer
    AS $$
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
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.podajofertydeaktywacja(portal_nazwa text) OWNER TO postgres;

--
-- Name: podajofertydeaktywacjaofertynet(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION podajofertydeaktywacjaofertynet() RETURNS SETOF oferta_usun
    AS $$
DECLARE
	rec_oferta oferta_usun;
	akt_data date;
	portal_id integer;
BEGIN
	select into portal_id id from portal where nazwa = 'Oferty.NET';
	select into akt_data current_date;
	FOR rec_oferta IN select id_oferta, oferta.id_rodz_trans as id_trans_rodzaj, nieruchomosc.id_nier_rodzaj from portal_wys join oferta on portal_wys.id_oferta = oferta.id 
	join nieruchomosc on oferta.id_nieruchomosc = nieruchomosc.id 
	where portal_wys.data_wyg > akt_data and portal_wys.is_active = true and oferta.id_status in 
	(select id from status where nazwa = '_nieaktualna' or nazwa = '_zawieszona') and portal_wys.id_portal = portal_id LOOP
		RETURN NEXT rec_oferta;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.podajofertydeaktywacjaofertynet() OWNER TO postgres;

--
-- Name: podajofertymedia(text, text, integer, integer, date, date, text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION podajofertymedia(is_oferent text, tel text, nier_rodzaj_id integer, trans_rodzaj_id integer, data_od date, data_do date, sort_kol text, sort_kier integer) RETURNS SETOF medianieruchomosc
    AS $$
DECLARE
	result MediaNieruchomosc;
	zapytanie text;
	and_add boolean;	
	kolumna_sort text;
	porzadek text;
	akt_data date;
BEGIN
	select into akt_data current_date;
	IF sort_kol is null or character_length(sort_kol) = 0 THEN
		kolumna_sort := 'data';
	ELSE
		kolumna_sort := sort_kol;
	END IF;
	IF sort_kier = 1 THEN
		--sortowanie rosnace
		porzadek := 'asc';
	ELSE
		porzadek := 'desc';
	END IF;
	zapytanie := 'select * from MediaNieruchomosc ';
	IF is_oferent is not null THEN
		zapytanie := zapytanie || 'where oferent = ' || is_oferent;
		and_add := true;
	END IF;
	IF character_length(tel) > 0 THEN
		IF and_add = true THEN
			zapytanie := zapytanie || ' and ';
		ELSE
			zapytanie := zapytanie || 'where ';
		END IF;
		zapytanie := zapytanie || 'telefon like \'' || tel || '\'';
		and_add := true;
	END IF;
	IF nier_rodzaj_id is not null THEN
		IF and_add = true THEN
			zapytanie := zapytanie || ' and ';
		ELSE
			zapytanie := zapytanie || 'where ';
		END IF;
		zapytanie := zapytanie || 'id_nier_rodzaj = ' || nier_rodzaj_id;
		and_add := true;
	END IF;
	IF trans_rodzaj_id is not null THEN
		IF and_add = true THEN
			zapytanie := zapytanie || ' and ';
		ELSE
			zapytanie := zapytanie || 'where ';
		END IF;
		zapytanie := zapytanie || 'id_trans_rodzaj = ' || trans_rodzaj_id;
		and_add := true;
	END IF;
	IF data_od is not null THEN
		IF and_add = true THEN
			zapytanie := zapytanie || ' and ';
		ELSE
			zapytanie := zapytanie || 'where ';
		END IF;
		zapytanie := zapytanie || 'data >= \'' || data_od || '\'';
		and_add := true;
	END IF;
	IF data_do is not null THEN
		IF and_add = true THEN
			zapytanie := zapytanie || ' and ';
		ELSE
			zapytanie := zapytanie || 'where ';
		END IF;
		zapytanie := zapytanie || 'data <= \'' || data_do || '\'';
		and_add := true;
	END IF;
---przypomnienie, jesli telefon jest podany przypomnienie nie bierze udzialu
	IF character_length(tel) = 0 THEN
		IF and_add = true THEN
			zapytanie := zapytanie || ' and ';
		ELSE
			zapytanie := zapytanie || 'where ';
		END IF;
		IF kolumna_sort != 'przypomnienie' THEN
			zapytanie := zapytanie || '(przypomnienie <= \'' || akt_data || '\' or przypomnienie is null)';
		ELSE
			zapytanie := zapytanie || '(przypomnienie <= \'' || akt_data || '\')';
		END IF;
		and_add := true;
	END IF;

	zapytanie := zapytanie || ' order by ' || kolumna_sort || ' ' || porzadek || ' limit 121';		
	FOR result in execute zapytanie limit 121 LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.podajofertymedia(is_oferent text, tel text, nier_rodzaj_id integer, trans_rodzaj_id integer, data_od date, data_do date, sort_kol text, sort_kier integer) OWNER TO postgres;

--
-- Name: podajofertymediaprzyjecie(boolean, text, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION podajofertymediaprzyjecie(is_oferent boolean, tel text, nier_rodzaj_id integer, trans_rodzaj_id integer) RETURNS SETOF medianieruchomosc
    AS $$
DECLARE
	result MediaNieruchomosc;
BEGIN
	FOR result in select * from MediaNieruchomosc where oferent = is_oferent and telefon like tel and id_nier_rodzaj = nier_rodzaj_id and id_trans_rodzaj = trans_rodzaj_id and id_of_zap is null limit 121 LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.podajofertymediaprzyjecie(is_oferent boolean, tel text, nier_rodzaj_id integer, trans_rodzaj_id integer) OWNER TO postgres;

--
-- Name: podajofertyprolongata(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION podajofertyprolongata(portal_nazwa text) RETURNS SETOF integer
    AS $$
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
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.podajofertyprolongata(portal_nazwa text) OWNER TO postgres;

--
-- Name: szukajofertawszystkieos; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW szukajofertawszystkieos AS
    SELECT oferta.id AS id_oferta, nieruchomosc.id AS id_nieruchomosc, nieruchomosc.id_klient, region_geog.nazwa AS miejscowosc, osoba.id AS id_osoba, osoba.nazwisko, oferta.id_status, imie.nazwa AS imie, osoba.pesel, telefon.nazwa AS telefon, komorka.nazwa AS komorka, trans_rodzaj.nazwa AS transakcja_rodzaj, nier_rodzaj.nazwa AS nieruchomosc_rodzaj, oferta.cena, status.nazwa AS status FROM ((((((((((oferta JOIN nieruchomosc ON ((oferta.id_nieruchomosc = nieruchomosc.id))) JOIN status ON ((oferta.id_status = status.id))) JOIN nier_rodzaj ON ((nieruchomosc.id_nier_rodzaj = nier_rodzaj.id))) JOIN trans_rodzaj ON ((oferta.id_rodz_trans = trans_rodzaj.id))) JOIN osoba_klient ON ((nieruchomosc.id_klient = osoba_klient.id_klient))) JOIN osoba ON ((osoba_klient.id_osoba = osoba.id))) JOIN imie ON ((osoba.id_imie = imie.id))) JOIN region_geog ON ((nieruchomosc.id_region_geog = region_geog.id))) LEFT JOIN telefon ON ((osoba.id = telefon.id_osoba))) LEFT JOIN komorka ON ((osoba.id = komorka.id_osoba)));


ALTER TABLE public.szukajofertawszystkieos OWNER TO postgres;

--
-- Name: podajofertytelefon(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION podajofertytelefon(tel text) RETURNS SETOF szukajofertawszystkieos
    AS $$
DECLARE
	result SzukajOfertaWszystkieOs;
BEGIN
	FOR result in select * from SzukajOfertaWszystkieOs where telefon like tel or komorka like tel limit 121 LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.podajofertytelefon(tel text) OWNER TO postgres;

--
-- Name: podajofidpoinsotodom(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION podajofidpoinsotodom(otodom_id integer) RETURNS integer
    AS $$
DECLARE
	test integer;
	portal_otodom_id integer;
BEGIN
	select into portal_otodom_id id from portal where nazwa = 'Otodom';
	select into test id_oferta from portal_wys where portal_ins_id = otodom_id and id_portal = portal_otodom_id;
	return test;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.podajofidpoinsotodom(otodom_id integer) OWNER TO postgres;

--
-- Name: podajopisyoferta; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW podajopisyoferta AS
    SELECT opis.id AS id_opis, oferta.id AS id_oferta, opis.id_jezyk, jezyk.nazwa AS jezyk, opis.wartosc AS opis FROM ((oferta JOIN opis ON ((oferta.id = opis.id_oferta))) JOIN jezyk ON ((opis.id_jezyk = jezyk.id)));


ALTER TABLE public.podajopisyoferta OWNER TO postgres;

--
-- Name: podajopisoferta(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION podajopisoferta(oferta_id integer) RETURNS SETOF podajopisyoferta
    AS $$
DECLARE
	result PodajOpisyOferta;
BEGIN
	FOR result IN select * from PodajOpisyOferta where id_oferta = oferta_id LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.podajopisoferta(oferta_id integer) OWNER TO postgres;

--
-- Name: podajopisoferty(integer, integer, integer, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION podajopisoferty(oferta_id integer, jezyk_id integer, nier_rodzaj_id integer, rodz_budynek_id integer, nieruchomosc_id integer) RETURNS text
    AS $$
DECLARE
	result text;
	temp text;
	temp_rec record;
BEGIN
	select into result tlumaczenie.nazwa, nieruchomosc.id as id_nieruchomosc, nieruchomosc.id_rodz_nier_szcz from tlumaczenie join nier_rodzaj on tlumaczenie.nazwa_lang_tag = nier_rodzaj.nazwa 
	join nieruchomosc on nier_rodzaj.id = nieruchomosc.id_nier_rodzaj join oferta on nieruchomosc.id = oferta.id_nieruchomosc where oferta.id = oferta_id and tlumaczenie.id_jezyk = jezyk_id;

	IF nier_rodzaj_id != 2 THEN
		---dopisanie rodzaju budynku
		select into temp lower(tlumaczenie.nazwa) as nazwa from tlumaczenie join rodz_nier_szczeg on tlumaczenie.nazwa_lang_tag = rodz_nier_szczeg.nazwa 
		where rodz_nier_szczeg.id = rodz_budynek_id and tlumaczenie.id_jezyk = jezyk_id;
		result := result || ' - ' || temp;
	ELSE
		---mieszkanie, podac ilosc pokoi
		select into temp dane_txt_nier.wartosc from parametr_nier join dane_txt_nier on parametr_nier.id = dane_txt_nier.id_parametr_nier 
		where dane_txt_nier.id_nieruchomosc = nieruchomosc_id and parametr_nier.nazwa = '_liczba_pokoi';
		result := result || ' - ' || temp;
		select into temp lower(tlumaczenie.nazwa) as nazwa from tlumaczenie where tlumaczenie.nazwa_lang_tag = '_pokojowe' and tlumaczenie.id_jezyk = jezyk_id;
		result := result || ' ' || temp;
	END IF;

	select into temp_rec lower(tlumaczenie.nazwa) as nazwa, dane_txt_nier.wartosc from tlumaczenie join parametr_nier on tlumaczenie.nazwa_lang_tag = parametr_nier.nazwa 
	join dane_txt_nier on parametr_nier.id = dane_txt_nier.id_parametr_nier	where dane_txt_nier.id_nieruchomosc = nieruchomosc_id and parametr_nier.nazwa = '_powierzchnia_uzytkowa' and 
	tlumaczenie.id_jezyk = jezyk_id;
	
	result := result || ', ' || temp_rec.nazwa || ': ' || temp_rec.wartosc;

	---dzialka lub pietro + kondygnacje
	IF nier_rodzaj_id != 2 THEN
		---dzialka - dane
		select into temp_rec lower(tlumaczenie.nazwa) as nazwa, dane_txt_nier.wartosc from tlumaczenie join parametr_nier on tlumaczenie.nazwa_lang_tag = parametr_nier.nazwa 
		join dane_txt_nier on parametr_nier.id = dane_txt_nier.id_parametr_nier	where dane_txt_nier.id_nieruchomosc = nieruchomosc_id and parametr_nier.nazwa = '_powierzchnia_dzialki' and 
		tlumaczenie.id_jezyk = jezyk_id;
		IF temp_rec.nazwa is not null THEN
			result := result || ', ' || temp_rec.nazwa || ': ' || temp_rec.wartosc;
		END IF;
	ELSE
		---pietro, liczba piêter; ewentualnie dodac tag liczba pieter budynku
		---tu jak wpadnie jeden null caly opis przy sklejaniu idzie w buraki, stad warto sprawdzic, czy nie dostal sie nam null
		select into temp_rec lower(tlumaczenie.nazwa) as nazwa from tlumaczenie where tlumaczenie.nazwa_lang_tag = '_numer_pietra' and tlumaczenie.id_jezyk = jezyk_id;
		select into temp dane_txt_nier.wartosc from parametr_nier join dane_txt_nier on parametr_nier.id = dane_txt_nier.id_parametr_nier 
		where dane_txt_nier.id_nieruchomosc = nieruchomosc_id and parametr_nier.nazwa = '_numer_pietra';
		IF temp is not null THEN
			result := result || ', ' || temp_rec.nazwa;
			result := result || ': ' || temp;
		END IF;
		select into temp_rec lower(tlumaczenie.nazwa) as nazwa from tlumaczenie where tlumaczenie.nazwa_lang_tag = '_liczba_pieter_budynku' and tlumaczenie.id_jezyk = jezyk_id;
		select into temp dane_txt_nier.wartosc from parametr_nier join dane_txt_nier on parametr_nier.id = dane_txt_nier.id_parametr_nier 
		where dane_txt_nier.id_nieruchomosc = nieruchomosc_id and parametr_nier.nazwa = '_liczba_pieter';
		IF temp is not null THEN
			result := result || ', ' || temp_rec.nazwa;
			result := result || ': ' || temp;
		END IF;
	END IF;
	RETURN result;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.podajopisoferty(oferta_id integer, jezyk_id integer, nier_rodzaj_id integer, rodz_budynek_id integer, nieruchomosc_id integer) OWNER TO postgres;

--
-- Name: opis_posz_zapotrzebowanie; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE opis_posz_zapotrzebowanie (
    id integer NOT NULL,
    id_zapotrzebowanie_trans_rodzaj integer NOT NULL,
    id_agent integer DEFAULT 1 NOT NULL,
    data timestamp without time zone DEFAULT date_trunc('second'::text, (now())::timestamp without time zone) NOT NULL,
    wartosc text NOT NULL
);


ALTER TABLE public.opis_posz_zapotrzebowanie OWNER TO postgres;

--
-- Name: notatkiposzzapotrzebowanie; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW notatkiposzzapotrzebowanie AS
    SELECT opis_posz_zapotrzebowanie.id AS id_opis_posz_zapotrzebowanie, opis_posz_zapotrzebowanie.id_zapotrzebowanie_trans_rodzaj, agent.nazwa_pot AS agent, opis_posz_zapotrzebowanie.wartosc, opis_posz_zapotrzebowanie.data FROM (opis_posz_zapotrzebowanie JOIN agent ON ((opis_posz_zapotrzebowanie.id_agent = agent.id)));


ALTER TABLE public.notatkiposzzapotrzebowanie OWNER TO postgres;

--
-- Name: podajopisposzzapotrzebowanie(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION podajopisposzzapotrzebowanie(zapotrzebowanie_trans_rodzaj_id integer) RETURNS SETOF notatkiposzzapotrzebowanie
    AS $$
DECLARE
	result NotatkiPoszZapotrzebowanie;
BEGIN
	FOR result IN select * from NotatkiPoszZapotrzebowanie where id_zapotrzebowanie_trans_rodzaj = zapotrzebowanie_trans_rodzaj_id order by data desc LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.podajopisposzzapotrzebowanie(zapotrzebowanie_trans_rodzaj_id integer) OWNER TO postgres;

--
-- Name: opis_wew_zapotrzebowanie; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE opis_wew_zapotrzebowanie (
    id integer NOT NULL,
    id_zapotrzebowanie integer NOT NULL,
    id_oferta integer,
    zainteresowany boolean DEFAULT false,
    cena character varying(15),
    id_agent integer NOT NULL,
    data timestamp without time zone,
    tresc text
);


ALTER TABLE public.opis_wew_zapotrzebowanie OWNER TO postgres;

--
-- Name: notatkizapotrzebowanie; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW notatkizapotrzebowanie AS
    SELECT opis_wew_zapotrzebowanie.id AS id_opis_zapotrzebowanie, opis_wew_zapotrzebowanie.id_zapotrzebowanie, agent.nazwa_pot AS agent, opis_wew_zapotrzebowanie.data, opis_wew_zapotrzebowanie.tresc, opis_wew_zapotrzebowanie.id_oferta, opis_wew_zapotrzebowanie.cena, opis_wew_zapotrzebowanie.zainteresowany FROM (opis_wew_zapotrzebowanie JOIN agent ON ((opis_wew_zapotrzebowanie.id_agent = agent.id)));


ALTER TABLE public.notatkizapotrzebowanie OWNER TO postgres;

--
-- Name: podajopiszapotrzebowanie(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION podajopiszapotrzebowanie(zapotrzebowanie_id integer) RETURNS SETOF notatkizapotrzebowanie
    AS $$
DECLARE
	result NotatkiZapotrzebowanie;
BEGIN
	FOR result IN select * from NotatkiZapotrzebowanie where id_zapotrzebowanie = zapotrzebowanie_id order by data desc LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.podajopiszapotrzebowanie(zapotrzebowanie_id integer) OWNER TO postgres;

--
-- Name: podajopisyzapotrzebowanietrrodz; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW podajopisyzapotrzebowanietrrodz AS
    SELECT zapotrzebowanie_trans_rodzaj.id AS id_zapotrzebowanie_trans_rodzaj, opis_zapotrzebowanie.id AS id_opis, opis_zapotrzebowanie.id_jezyk, jezyk.nazwa AS jezyk, opis_zapotrzebowanie.wartosc AS opis FROM ((zapotrzebowanie_trans_rodzaj JOIN opis_zapotrzebowanie ON ((zapotrzebowanie_trans_rodzaj.id = opis_zapotrzebowanie.id_zapotrzebowanie_trans_rodzaj))) JOIN jezyk ON ((opis_zapotrzebowanie.id_jezyk = jezyk.id)));


ALTER TABLE public.podajopisyzapotrzebowanietrrodz OWNER TO postgres;

--
-- Name: podajopiszapotrzebowanietrrodz(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION podajopiszapotrzebowanietrrodz(zapotrzebowanie_trans_rodzaj_id integer) RETURNS SETOF podajopisyzapotrzebowanietrrodz
    AS $$
DECLARE
	result PodajOpisyZapotrzebowanieTrRodz;
BEGIN
	FOR result IN select * from PodajOpisyZapotrzebowanieTrRodz where id_zapotrzebowanie_trans_rodzaj = zapotrzebowanie_trans_rodzaj_id LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.podajopiszapotrzebowanietrrodz(zapotrzebowanie_trans_rodzaj_id integer) OWNER TO postgres;

--
-- Name: podajosdostlistawsk(integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION podajosdostlistawsk(zapotrzebowanie_id integer, oferta_id integer) RETURNS SETOF osobaview
    AS $$
DECLARE
	result OsobaView;
	klient_id integer;
BEGIN
	select into klient_id id_klient from zapotrzebowanie where id_zapotrzebowanie = zapotrzebowanie_id;
	FOR result IN select * from OsobaView where id_osoba not in (select id_osoba from OsobaListaWsk join osoba_klient on OsobaListaWsk.id_osoba = osoba_klient.id_klient where id_oferta = oferta_id and id_zapotrzebowanie = zapotrzebowanie_id) LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.podajosdostlistawsk(zapotrzebowanie_id integer, oferta_id integer) OWNER TO postgres;

--
-- Name: lista_wsk_adr; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE lista_wsk_adr (
    id integer NOT NULL,
    id_oferta integer NOT NULL,
    id_zapotrzebowanie integer NOT NULL,
    id_klient integer NOT NULL,
    id_agent integer NOT NULL,
    data timestamp without time zone NOT NULL,
    ogladanie_data date NOT NULL,
    ogladanie_godzina integer NOT NULL,
    ogladanie_minuta integer NOT NULL
);


ALTER TABLE public.lista_wsk_adr OWNER TO postgres;

--
-- Name: osoba_lista_wsk_adr; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE osoba_lista_wsk_adr (
    id integer NOT NULL,
    id_lista_wsk_adr integer NOT NULL,
    id_osoba integer NOT NULL
);


ALTER TABLE public.osoba_lista_wsk_adr OWNER TO postgres;

--
-- Name: podajoslistawsk; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW podajoslistawsk AS
    SELECT lista_wsk_adr.id AS id_lista_wsk_adr, osoba_lista_wsk_adr.id AS id_osoba_lista_wsk_adr, osoba.id AS id_osoba, osoba.nazwisko, imie.nazwa AS imie FROM ((((osoba JOIN osoba_klient ON ((osoba.id = osoba_klient.id_osoba))) JOIN imie ON ((osoba.id_imie = imie.id))) JOIN lista_wsk_adr ON ((osoba_klient.id_klient = lista_wsk_adr.id_klient))) JOIN osoba_lista_wsk_adr ON ((lista_wsk_adr.id = osoba_lista_wsk_adr.id_lista_wsk_adr)));


ALTER TABLE public.podajoslistawsk OWNER TO postgres;

--
-- Name: podajoslistawsk(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION podajoslistawsk(lista_wsk_adr_id integer) RETURNS SETOF podajoslistawsk
    AS $$
DECLARE
	result PodajOsListaWsk;
BEGIN
	FOR result IN select * from PodajOsListaWsk where id_lista_wsk_adr = lista_wsk_adr_id LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.podajoslistawsk(lista_wsk_adr_id integer) OWNER TO postgres;

--
-- Name: podajosobadane(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION podajosobadane(osoba_id integer) RETURNS SETOF osobaview
    AS $$
DECLARE
	result OsobaView;
BEGIN
	FOR result IN select * from OsobaView where id_osoba = osoba_id LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.podajosobadane(osoba_id integer) OWNER TO postgres;

--
-- Name: osobaklient; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW osobaklient AS
    SELECT osoba_klient.id_klient, osobaview.id_osoba, osobaview.imie, osobaview.nazwisko, osobaview.pesel, osobaview.telefon, osobaview.komorka FROM (osoba_klient JOIN osobaview ON ((osoba_klient.id_osoba = osobaview.id_osoba)));


ALTER TABLE public.osobaklient OWNER TO postgres;

--
-- Name: podajosobaklient(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION podajosobaklient(klient_id integer) RETURNS SETOF osobaklient
    AS $$
DECLARE
	result OsobaKlient;
BEGIN
	FOR result IN select * from OsobaKlient where id_klient = klient_id LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.podajosobaklient(klient_id integer) OWNER TO postgres;

--
-- Name: podajosobaklientofid(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION podajosobaklientofid(oferta_id integer) RETURNS SETOF osobaklient
    AS $$
DECLARE
	result OsobaKlient;
	klient_id integer;
BEGIN
	select into klient_id nieruchomosc.id_klient from oferta join nieruchomosc on oferta.id_nieruchomosc = nieruchomosc.id where oferta.id = oferta_id;
	FOR result IN select * from PodajOsobaKlient(klient_id) LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.podajosobaklientofid(oferta_id integer) OWNER TO postgres;

--
-- Name: podajosobaklientpozap(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION podajosobaklientpozap(zapotrzebowanie_id integer) RETURNS SETOF osobaklient
    AS $$
DECLARE
	result OsobaKlient;
	klient_id integer;
BEGIN
	select into klient_id id_klient from zapotrzebowanie where id = zapotrzebowanie_id;
	FOR result IN select * from OsobaKlient where id_klient = klient_id LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.podajosobaklientpozap(zapotrzebowanie_id integer) OWNER TO postgres;

--
-- Name: podajosobaklientzapid(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION podajosobaklientzapid(zapotrzebowanie_id integer) RETURNS SETOF osobaklient
    AS $$
DECLARE
	result OsobaKlient;
	klient_id integer;
BEGIN
	select into klient_id zapotrzebowanie.id_klient from zapotrzebowanie where zapotrzebowanie.id = zapotrzebowanie_id;
	FOR result IN select * from PodajOsobaKlient(klient_id) LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.podajosobaklientzapid(zapotrzebowanie_id integer) OWNER TO postgres;

--
-- Name: podajosobaklientzmcena(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION podajosobaklientzmcena(klient_id integer) RETURNS SETOF slownik
    AS $$
DECLARE
	result slownik;
BEGIN
	FOR result IN select osoba.id, imie.nazwa || ' ' || osoba.nazwisko as nazwa from osoba join osoba_klient on osoba.id = osoba_klient.id_osoba 
	join imie on osoba.id_imie = imie.id where osoba_klient.id_klient = klient_id LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.podajosobaklientzmcena(klient_id integer) OWNER TO postgres;

--
-- Name: osobaoferta; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW osobaoferta AS
    SELECT osoba_oferta.id AS id_osoba_oferta, osoba_oferta.id_oferta, osobaview.id_osoba, osobaview.imie, osobaview.nazwisko, osobaview.pesel, osobaview.telefon, osobaview.komorka FROM (osoba_oferta JOIN osobaview ON ((osoba_oferta.id_osoba = osobaview.id_osoba)));


ALTER TABLE public.osobaoferta OWNER TO postgres;

--
-- Name: podajosobaoferta(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION podajosobaoferta(oferta_id integer) RETURNS SETOF osobaoferta
    AS $$
DECLARE
	result OsobaOferta;
BEGIN
	FOR result in select * from OsobaOferta where id_oferta = oferta_id LOOP
		return next result;
	END LOOP;
	return;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.podajosobaoferta(oferta_id integer) OWNER TO postgres;

--
-- Name: podajosobazapotrzebowanie(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION podajosobazapotrzebowanie(zapotrzebowanie_id integer) RETURNS SETOF osobaview
    AS $$
DECLARE
	result OsobaView;
	---klient_id integer;
BEGIN
	---select into klient_id id_klient from zapotrzebowanie where id = zapotrzebowanie_id;
	FOR result IN select * from OsobaView join osoba_zapotrzebowanie on OsobaView.id_osoba = osoba_zapotrzebowanie.id_osoba where osoba_zapotrzebowanie.id_zapotrzebowanie = zapotrzebowanie_id LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.podajosobazapotrzebowanie(zapotrzebowanie_id integer) OWNER TO postgres;

--
-- Name: podajospokofspotkanie(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION podajospokofspotkanie(spotkanie_kl_id integer) RETURNS integer
    AS $$
DECLARE
	result integer;
	temp_rec record;
BEGIN
	select into temp_rec * from spotkanie where id = spotkanie_kl_id;
	select into result spotkanie_os.id_osoba from spotkanie_os join spotkanie on spotkanie_os.id_spotkanie = spotkanie.id where spotkanie.id_oferta = temp_rec.id_oferta and 
	spotkanie.id_zapotrzebowanie = temp_rec.id_zapotrzebowanie and spotkanie.klient_oferujacy = true and spotkanie.spotkanie_data = temp_rec.spotkanie_data and 
	spotkanie.spotkanie_godzina = temp_rec.spotkanie_godzina and spotkanie.spotkanie_minuta = temp_rec.spotkanie_minuta;
	RETURN result;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.podajospokofspotkanie(spotkanie_kl_id integer) OWNER TO postgres;

--
-- Name: podajprzypomnieniamedia(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION podajprzypomnieniamedia(agent_id integer) RETURNS SETOF medianieruchomosc
    AS $$
DECLARE
	result MediaNieruchomosc;
	--data_3mies date;
	akt_data date;
	zapytanie text;
BEGIN
	--select into data_3mies current_date - 91;
	select into akt_data current_date;
	zapytanie := 'select * from MediaNieruchomosc where przypomnienie <= \'' || akt_data || '\'';
	IF agent_id is not null THEN
		zapytanie := zapytanie || ' and id_agent = ' || agent_id;
	END IF;
	zapytanie := zapytanie || ' order by przypomnienie desc;';
	FOR result in execute zapytanie LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.podajprzypomnieniamedia(agent_id integer) OWNER TO postgres;

--
-- Name: podajreggeogzap(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION podajreggeogzap(zapotrzebowanie_trans_rodzaj_id integer) RETURNS SETOF reggeog
    AS $$
DECLARE
	result RegGeog;
	rec_temp record;
	licznik integer;
BEGIN
	FOR rec_temp IN select region_geog.id, region_geog.id_parent, region_geog.nazwa from region_geog 
	join zap_lokaliz_nier on zap_lokaliz_nier.id_region_geog = region_geog.id where zap_lokaliz_nier.id_zapotrzebowanie_trans_rodzaj = zapotrzebowanie_trans_rodzaj_id LOOP
			licznik := 1;
			result.id_region_geog := rec_temp.id;
			result.region := rec_temp.nazwa;
			result.rodzice := null;
			WHILE rec_temp.id_parent is not null LOOP
				---ewentualnie jesli on to zle robi (wyznacza rec_temp.id_parent) do test wpisac parent id
				select into rec_temp id, id_parent, nazwa from region_geog where id = rec_temp.id_parent;
				result.rodzice[licznik] := rec_temp.nazwa;
				licznik := licznik + 1;
			END LOOP;
			RETURN NEXT result;
		END LOOP;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.podajreggeogzap(zapotrzebowanie_trans_rodzaj_id integer) OWNER TO postgres;

--
-- Name: podajregionygeog(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION podajregionygeog(parent_id integer) RETURNS SETOF region_geog
    AS $$
DECLARE
	result region_geog;
BEGIN
	FOR result in select * from region_geog where id_parent = parent_id order by nazwa asc LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.podajregionygeog(parent_id integer) OWNER TO postgres;

--
-- Name: reklama_nieruchomosc_m; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE reklama_nieruchomosc_m (
    id integer NOT NULL,
    id_media_nieruchomosc integer NOT NULL,
    id_media_reklama integer NOT NULL,
    data date NOT NULL
);


ALTER TABLE public.reklama_nieruchomosc_m OWNER TO postgres;

--
-- Name: reklamamedia; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW reklamamedia AS
    SELECT reklama_nieruchomosc_m.id_media_nieruchomosc, media_reklama.nazwa AS media_reklama, reklama_nieruchomosc_m.data FROM (reklama_nieruchomosc_m JOIN media_reklama ON ((reklama_nieruchomosc_m.id_media_reklama = media_reklama.id)));


ALTER TABLE public.reklamamedia OWNER TO postgres;

--
-- Name: podajreklamamedia(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION podajreklamamedia(media_nieruchomosc_id integer) RETURNS SETOF reklamamedia
    AS $$
DECLARE
	result ReklamaMedia;
BEGIN
	FOR result in select * from ReklamaMedia where id_media_nieruchomosc = media_nieruchomosc_id order by data desc LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.podajreklamamedia(media_nieruchomosc_id integer) OWNER TO postgres;

--
-- Name: podajrodzajoferta(integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION podajrodzajoferta(nier_rodzaj_id integer, trans_rodzaj_id integer) RETURNS ofertarodzaj
    AS $$
DECLARE
	result OfertaRodzaj;
BEGIN
	select into result.nieruchomosc_rodzaj nazwa from nier_rodzaj where id = nier_rodzaj_id;
	select into result.transakcja_rodzaj nazwa from trans_rodzaj where id = trans_rodzaj_id;
	return result;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.podajrodzajoferta(nier_rodzaj_id integer, trans_rodzaj_id integer) OWNER TO postgres;

--
-- Name: podajrodzic(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION podajrodzic(region_id integer) RETURNS integer
    AS $$
DECLARE
	parent_id integer;
BEGIN
	select into parent_id id_parent from region_geog where id = region_id;
	RETURN parent_id;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.podajrodzic(region_id integer) OWNER TO postgres;

--
-- Name: spotkaniaklientedycja; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW spotkaniaklientedycja AS
    SELECT spotkanie.id AS id_spotkanie, spotkanie.id_klient, spotkanie.id_oferta, spotkanie.id_zapotrzebowanie, spotkanie.klient_oferujacy AS is_oferent, spotkanie.id_umowienie, spotkanie.spotkanie_data AS data, spotkanie.spotkanie_godzina AS id_godzina, spotkanie.spotkanie_minuta AS id_minuta, agent.nazwa_pot AS agent FROM (spotkanie JOIN agent ON ((spotkanie.id_agent = agent.id)));


ALTER TABLE public.spotkaniaklientedycja OWNER TO postgres;

--
-- Name: podajspotkanieedycja(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION podajspotkanieedycja(spotkanie_id integer) RETURNS spotkaniaklientedycja
    AS $$
DECLARE
	result SpotkaniaKlientEdycja;
BEGIN
	select into result * from SpotkaniaKlientEdycja where id_spotkanie = spotkanie_id;
	RETURN result;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.podajspotkanieedycja(spotkanie_id integer) OWNER TO postgres;

--
-- Name: podajspotkanieoferta(integer, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION podajspotkanieoferta(oferta_id integer, oferent_b boolean) RETURNS SETOF spotkaniaklient
    AS $$
DECLARE
	result SpotkaniaKlient;
BEGIN
	---distinct on (id_spotkanie)
	FOR result in select * from SpotkaniaKlient where id_oferta = oferta_id and is_oferent = oferent_b and data >= (select current_date) order by data asc LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.podajspotkanieoferta(oferta_id integer, oferent_b boolean) OWNER TO postgres;

--
-- Name: podajspotkanieosoba(integer, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION podajspotkanieosoba(osoba_id integer, oferent_b boolean) RETURNS SETOF spotkaniaklient
    AS $$
DECLARE
	result SpotkaniaKlient;
BEGIN
	---distinct on (id_spotkanie)
	FOR result in select * from SpotkaniaKlient where id_osoba = osoba_id and is_oferent = oferent_b and data >= (select current_date) order by data asc LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.podajspotkanieosoba(osoba_id integer, oferent_b boolean) OWNER TO postgres;

--
-- Name: podajspotkaniezapotrzebowanie(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION podajspotkaniezapotrzebowanie(zapotrzebowanie_id integer) RETURNS SETOF spotkaniaklient
    AS $$
DECLARE
	akt_data date;
	result SpotkaniaKlient;
BEGIN
	select into akt_data current_date;
	---distinct on (id_spotkanie)
	FOR result in select * from SpotkaniaKlient where id_zapotrzebowanie = zapotrzebowanie_id and is_oferent = false and data >= akt_data order by data asc LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.podajspotkaniezapotrzebowanie(zapotrzebowanie_id integer) OWNER TO postgres;

--
-- Name: podajtelefonmedia(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION podajtelefonmedia(media_nieruchomosc_id integer) RETURNS SETOF telefon_media_nieruchomosc
    AS $$
DECLARE
	result telefon_media_nieruchomosc;
BEGIN
	FOR result in select * from telefon_media_nieruchomosc where id_media_nieruchomosc = media_nieruchomosc_id LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.podajtelefonmedia(media_nieruchomosc_id integer) OWNER TO postgres;

--
-- Name: podajtelefony(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION podajtelefony(osoba_id integer) RETURNS SETOF telefon
    AS $$
DECLARE
	result telefon;
BEGIN
	FOR result IN select * from telefon where id_osoba = osoba_id order by nazwa asc LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.podajtelefony(osoba_id integer) OWNER TO postgres;

--
-- Name: podajtransdlanier(integer, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION podajtransdlanier(nier_id integer, of_zap text) RETURNS SETOF slownik
    AS $$
DECLARE
	rec_trans slownik;
BEGIN
	IF of_zap = '_oferta' THEN
		FOR rec_trans IN SELECT transakcja_nier.id_trans_rodzaj as id, trans_rodzaj.nazwa as nazwa from trans_rodzaj join transakcja_nier on trans_rodzaj.id = transakcja_nier.id_trans_rodzaj where transakcja_nier.id_nier_rodzaj = nier_id LOOP
			RETURN NEXT rec_trans;
		END LOOP;
	ELSE
		FOR rec_trans IN SELECT transakcja_nier.id_trans_rodzaj as id, trans_rodzaj.nazwa_zap as nazwa from trans_rodzaj join transakcja_nier on trans_rodzaj.id = transakcja_nier.id_trans_rodzaj where transakcja_nier.id_nier_rodzaj = nier_id LOOP
			RETURN NEXT rec_trans;
		END LOOP;
	END IF;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.podajtransdlanier(nier_id integer, of_zap text) OWNER TO postgres;

--
-- Name: podajtransdlanierzapotrzebowanie(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION podajtransdlanierzapotrzebowanie(zapotrzebowanie_nier_rodzaj_id integer) RETURNS SETOF slownik
    AS $$
DECLARE
	nier_rodzaj_id integer;
	result slownik;
BEGIN
	select into nier_rodzaj_id id_nier_rodzaj from zapotrzebowanie_nier_rodzaj where id = zapotrzebowanie_nier_rodzaj_id;
	FOR result IN select * from (select * from PodajTransDlaNier(nier_rodzaj_id, '_zapotrzebowanie')) as TrNier where TrNier.id not in (select id_trans_rodzaj from zapotrzebowanie_trans_rodzaj where id_zapotrzebowanie_nier_rodzaj = zapotrzebowanie_nier_rodzaj_id) order by nazwa asc LOOP
		RETURN NEXT result;
	END LOOP;	
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.podajtransdlanierzapotrzebowanie(zapotrzebowanie_nier_rodzaj_id integer) OWNER TO postgres;

--
-- Name: podajtransidnieridoferta(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION podajtransidnieridoferta(oferta_id integer) RETURNS ofertarodzajid
    AS $$
DECLARE
	result OfertaRodzajId;
BEGIN
	select into result.id_nier_rodzaj id_nier_rodzaj from nieruchomosc join oferta on oferta.id_nieruchomosc = nieruchomosc.id where oferta.id = oferta_id;
	select into result.id_trans_rodzaj id_rodz_trans from oferta where id = oferta_id;
	result.id_oferta := oferta_id;
	return result;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.podajtransidnieridoferta(oferta_id integer) OWNER TO postgres;

--
-- Name: podajtransnierzapotrzebowanie(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION podajtransnierzapotrzebowanie(zapotrzebowanie_id integer) RETURNS SETOF zapotrztransnierrodzaj
    AS $$
DECLARE
	result ZapotrzTransNierRodzaj;
BEGIN
	FOR result IN select distinct on (id_zapotrzebowanie_trans_rodzaj) * from ZapotrzTransNierRodzaj where id_zapotrzebowanie = zapotrzebowanie_id LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.podajtransnierzapotrzebowanie(zapotrzebowanie_id integer) OWNER TO postgres;

--
-- Name: podajtransrodzaj(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION podajtransrodzaj(of_zap text) RETURNS SETOF slownik
    AS $$
DECLARE
	rec_trans slownik;
BEGIN
	IF of_zap = '_oferta' THEN
		FOR rec_trans IN SELECT trans_rodzaj.id as id, trans_rodzaj.nazwa as nazwa from trans_rodzaj LOOP
			RETURN NEXT rec_trans;
		END LOOP;
	ELSE
		FOR rec_trans IN SELECT trans_rodzaj.id as id, trans_rodzaj.nazwa_zap as nazwa from trans_rodzaj LOOP
			RETURN NEXT rec_trans;
		END LOOP;
	END IF;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.podajtransrodzaj(of_zap text) OWNER TO postgres;

--
-- Name: podajwlascicielnieruchomosc; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW podajwlascicielnieruchomosc AS
    SELECT wlasciciel.id AS id_wlasciciel, wlasciciel.id_osoba, osoba.nazwisko, imie.nazwa AS imie, osoba.pesel, wlasciciel.procent_udzial, wlasciciel.id_nieruchomosc FROM ((osoba JOIN wlasciciel ON ((osoba.id = wlasciciel.id_osoba))) JOIN imie ON ((osoba.id_imie = imie.id)));


ALTER TABLE public.podajwlascicielnieruchomosc OWNER TO postgres;

--
-- Name: podajwlascicielenier(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION podajwlascicielenier(nieruchomosc_id integer) RETURNS SETOF podajwlascicielnieruchomosc
    AS $$
DECLARE
	result PodajWlascicielNieruchomosc;
BEGIN
	FOR result IN select * from PodajWlascicielNieruchomosc where id_nieruchomosc = nieruchomosc_id LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.podajwlascicielenier(nieruchomosc_id integer) OWNER TO postgres;

--
-- Name: podajwojewodztwa(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION podajwojewodztwa() RETURNS SETOF slownik
    AS $$
DECLARE
	result slownik;
BEGIN
	--dla polski :P (1)
	FOR result in select id, nazwa from region_geog where id_parent = 1 LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.podajwojewodztwa() OWNER TO postgres;

--
-- Name: podajwpiskalendarz(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION podajwpiskalendarz(kalendarz_id integer) RETURNS kalendarzedycja
    AS $$
DECLARE
	result KalendarzEdycja;
	rec_temp record;
	licznik integer;
BEGIN
	licznik := 1;
	select into result * from kalendarz where id = kalendarz_id;
	FOR rec_temp in select id_agent from agent_kalendarz where id_kalendarz = kalendarz_id LOOP
		result.id_agent[licznik] := rec_temp.id_agent;
		licznik := licznik + 1;
	END LOOP;
	RETURN result;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.podajwpiskalendarz(kalendarz_id integer) OWNER TO postgres;

--
-- Name: podajzapotrzebowanieadresatoferta(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION podajzapotrzebowanieadresatoferta(oferta_id integer) RETURNS SETOF wysylaneofertyzapotrzebowanie
    AS $$
DECLARE
	result WysylaneOfertyZapotrzebowanie;
BEGIN
	FOR result in select * from WysylaneOfertyZapotrzebowanie where id_oferta = oferta_id LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.podajzapotrzebowanieadresatoferta(oferta_id integer) OWNER TO postgres;

--
-- Name: szukajzapotrzebowaniewszystkieos; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW szukajzapotrzebowaniewszystkieos AS
    SELECT zapotrzebowanie.id AS id_zapotrzebowanie, zapotrzebowanie.id_klient, osoba.id AS id_osoba, osoba.nazwisko, imie.nazwa AS imie, osoba.pesel, telefon.nazwa AS telefon, komorka.nazwa AS komorka FROM (((((zapotrzebowanie JOIN osoba_klient ON ((zapotrzebowanie.id_klient = osoba_klient.id_klient))) JOIN osoba ON ((osoba_klient.id_osoba = osoba.id))) JOIN imie ON ((osoba.id_imie = imie.id))) LEFT JOIN telefon ON ((osoba.id = telefon.id_osoba))) LEFT JOIN komorka ON ((osoba.id = komorka.id_osoba)));


ALTER TABLE public.szukajzapotrzebowaniewszystkieos OWNER TO postgres;

--
-- Name: podajzapotrzebowanietelefon(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION podajzapotrzebowanietelefon(tel text) RETURNS SETOF szukajzapotrzebowaniewszystkieos
    AS $$
DECLARE
	result SzukajZapotrzebowanieWszystkieOs;
BEGIN
	FOR result in select * from SzukajZapotrzebowanieWszystkieOs where telefon like tel or komorka like tel limit 121 LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.podajzapotrzebowanietelefon(tel text) OWNER TO postgres;

--
-- Name: podajzapotrznierszczeg(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION podajzapotrznierszczeg(zapotrzebowanie_trans_rodzaj_id integer) RETURNS SETOF slownik
    AS $$
DECLARE
	result slownik;
BEGIN
	FOR result in select zap_szcz_nier.id_rodz_nier_szcz as id, rodz_nier_szczeg.nazwa from zap_szcz_nier join rodz_nier_szczeg on zap_szcz_nier.id_rodz_nier_szcz = rodz_nier_szczeg.id 
	where zap_szcz_nier.id_zapotrzebowanie_trans_rodzaj = zapotrzebowanie_trans_rodzaj_id LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.podajzapotrznierszczeg(zapotrzebowanie_trans_rodzaj_id integer) OWNER TO postgres;

--
-- Name: podajzdjecia(integer, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION podajzdjecia(nieruchomosc_id integer, sciezka text) RETURNS SETOF slownik
    AS $$
DECLARE
	result slownik;
BEGIN
	FOR result IN select id, nazwa from zdjecie where id_nieruchomosc = nieruchomosc_id order by id LOOP
		result.nazwa := '<a href="' || sciezka || result.nazwa || '" target="_blank"><img src="' || sciezka || result.nazwa || '" width="30" length="30" /></a>';
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.podajzdjecia(nieruchomosc_id integer, sciezka text) OWNER TO postgres;

--
-- Name: podajzdjecianieruchomosc(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION podajzdjecianieruchomosc(nieruchomosc_id integer) RETURNS SETOF slownik
    AS $$
DECLARE
	result slownik;
BEGIN
	FOR result in select id, nazwa from zdjecie where id_nieruchomosc = nieruchomosc_id order by id asc LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.podajzdjecianieruchomosc(nieruchomosc_id integer) OWNER TO postgres;

--
-- Name: podnieszdjecie(integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION podnieszdjecie(zdjecie_id integer, nieruchomosc_id integer) RETURNS boolean
    AS $$
DECLARE
	temp text;
	zdj_wyzej integer;
BEGIN
	select into zdj_wyzej id from zdjecie where id_nieruchomosc = nieruchomosc_id and id < zdjecie_id order by id desc limit 1;
	IF zdj_wyzej is not null THEN
		select into temp nazwa from zdjecie where id = zdjecie_id; ---mamy nazwe promowanego zdj zapamietana
		update zdjecie set nazwa = (select nazwa from zdjecie where id = zdj_wyzej) where id = zdjecie_id;
		update zdjecie set nazwa = temp where id = zdj_wyzej;
		RETURN true;
	ELSE
		RETURN false;
	END IF;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.podnieszdjecie(zdjecie_id integer, nieruchomosc_id integer) OWNER TO postgres;

--
-- Name: podstawoweparamwypos(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION podstawoweparamwypos() RETURNS SETOF pods_param_wypos
    AS $$
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
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.podstawoweparamwypos() OWNER TO postgres;

--
-- Name: podstawowewersjeofert(integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION podstawowewersjeofert(nier_rodzaj_id integer, trans_rodzaj_id integer) RETURNS SETOF oferty_wersja_pods
    AS $$
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
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.podstawowewersjeofert(nier_rodzaj_id integer, trans_rodzaj_id integer) OWNER TO postgres;

--
-- Name: pokazkalendarz(integer, date); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pokazkalendarz(agent_id integer, data_w date) RETURNS SETOF listakalendarz
    AS $$
DECLARE
	rec_dane ListaKalendarz;
	data_dzis date;
BEGIN
	IF data_w is null THEN
		select into data_dzis current_date;
	ELSE
		data_dzis := data_w;
	END IF;
	---w zaleznosci czy agent id defined czy null wywlic wszystko lub tylko dla danego agenta	
	IF agent_id is null THEN
		FOR rec_dane in select * from ListaKalendarz where data = data_dzis order by data, godzina asc LOOP
			select into rec_dane.agent AgenciWpisKalendarz(rec_dane.id_kalendarz);
			RETURN NEXT rec_dane;
		END LOOP;
	ELSE
		FOR rec_dane in select * from ListaKalendarz join agent_kalendarz on ListaKalendarz.id_kalendarz = agent_kalendarz.id_kalendarz where agent_kalendarz.id_agent = agent_id and data = data_dzis order by data, godzina asc LOOP
			select into rec_dane.agent AgenciWpisKalendarz(rec_dane.id_kalendarz);
			RETURN NEXT rec_dane;
		END LOOP;
	END IF;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.pokazkalendarz(agent_id integer, data_w date) OWNER TO postgres;

--
-- Name: pokazrozmowy(integer, date); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pokazrozmowy(dzwonienie_status_id integer, data_dzw date) RETURNS SETOF rejestracja_centralka
    AS $$
DECLARE
result rejestracja_centralka;
rec_temp record;
data_dzien_poz date;
BEGIN
select into data_dzien_poz data_dzw + 1;
FOR rec_temp in select rozmowa_przychodzaca.id, trim(leading 0 from rozmowa_przychodzaca.nr_telefon) as nr_telefon, rozmowa_przychodzaca.id_status_dzwonienie, rozmowa_przychodzaca.id_agent, 
rozmowa_przychodzaca.czas_poczatek, rozmowa_przychodzaca.czas_koniec, agent.nazwa_pot as agent, status_dzwonienie.nazwa as status_dzwonienie from rozmowa_przychodzaca join agent on 
rozmowa_przychodzaca.id_agent = agent.id join status_dzwonienie on rozmowa_przychodzaca.id_status_dzwonienie = status_dzwonienie.id 
where rozmowa_przychodzaca.id_status_dzwonienie = dzwonienie_status_id and rozmowa_przychodzaca.czas_poczatek between data_dzw and data_dzien_poz 
order by rozmowa_przychodzaca.czas_poczatek desc LOOP
---przepisac dane
result.id := rec_temp.id;
result.telefon := rec_temp.nr_telefon;
result.id_status_dzwonienie := rec_temp.id_status_dzwonienie;
result.status_dzwonienie := rec_temp.status_dzwonienie;
result.id_agent := rec_temp.id_agent;
result.agent := rec_temp.agent;
result.czas_poczatek := rec_temp.czas_poczatek;
result.czas_koniec := rec_temp.czas_koniec;
---dodac osobe jesli znaleziona po telefonie
select into rec_temp * from OsobaView where telefon = result.telefon or komorka = result.telefon;
result.osoba := rec_temp.nazwisko || ' ' || rec_temp.imie;
RETURN NEXT result;
END LOOP;
RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.pokazrozmowy(dzwonienie_status_id integer, data_dzw date) OWNER TO postgres;

--
-- Name: pokazwybraneparamoferta(integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pokazwybraneparamoferta(oferta_id integer, poziom integer) RETURNS SETOF slownik
    AS $$
DECLARE
	result slownik;
	nieruchomosc_id integer;
	nier_rodzaj_id integer;
	trans_rodzaj_id integer;
BEGIN
	select into nieruchomosc_id id_nieruchomosc from oferta where id = oferta_id;
	select into nier_rodzaj_id id_nier_rodzaj from nieruchomosc where id = nieruchomosc_id;
	select into trans_rodzaj_id id_rodz_trans from oferta where id = oferta_id;

	FOR result in select dane_txt_nier.id_parametr_nier as id, parametr_nier.nazwa from dane_txt_nier join parametr_nier on dane_txt_nier.id_parametr_nier = parametr_nier.id 
	join lista_param_nier on parametr_nier.id = lista_param_nier.id_parametr_nier 
	where lista_param_nier.waga <= poziom and lista_param_nier.id_nier_rodzaj = nier_rodzaj_id and lista_param_nier.id_trans_rodzaj = trans_rodzaj_id 
	and dane_txt_nier.id_nieruchomosc = nieruchomosc_id LOOP
		RETURN NEXT result;
	END LOOP;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.pokazwybraneparamoferta(oferta_id integer, poziom integer) OWNER TO postgres;

--
-- Name: pokazwybraneparamzlecenie(integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pokazwybraneparamzlecenie(zapotrzebowanie_trans_rodzaj_id integer, poziom integer) RETURNS SETOF slownik
    AS $$
DECLARE
	result slownik;
	nier_rodzaj_id integer;
	trans_rodzaj_id integer;
BEGIN
	select into nier_rodzaj_id id_nier_rodzaj from zapotrzebowanie_nier_rodzaj where id = (select id_zapotrzebowanie_nier_rodzaj from zapotrzebowanie_trans_rodzaj where id = zapotrzebowanie_trans_rodzaj_id);
	select into trans_rodzaj_id id_trans_rodzaj from zapotrzebowanie_trans_rodzaj where id = zapotrzebowanie_trans_rodzaj_id;

	FOR result in select p1.id, p1.nazwa from parametr_nier p1 join lista_param_nier on p1.id = lista_param_nier.id_parametr_nier where lista_param_nier.waga <= poziom 
	and lista_param_nier.id_nier_rodzaj = nier_rodzaj_id and lista_param_nier.id_trans_rodzaj = trans_rodzaj_id 
	and (((select count(id) from dane_txt_zap_min where id_parametr_nier = p1.id and id_zapotrzebowanie_trans_rodzaj = zapotrzebowanie_trans_rodzaj_id) = 1) or 
	((select count(id) from dane_txt_zap_max where id_parametr_nier = p1.id and id_zapotrzebowanie_trans_rodzaj = zapotrzebowanie_trans_rodzaj_id) = 1)) LOOP
		RETURN NEXT result;
	END LOOP;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.pokazwybraneparamzlecenie(zapotrzebowanie_trans_rodzaj_id integer, poziom integer) OWNER TO postgres;

--
-- Name: zmianystatusow; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW zmianystatusow AS
    SELECT zmiana_status.id_oferta, zmiana_status.data, agent.nazwa_pot AS agent, status.nazwa AS status FROM ((zmiana_status JOIN agent ON ((zmiana_status.id_agent = agent.id))) JOIN status ON ((zmiana_status.id_status = status.id)));


ALTER TABLE public.zmianystatusow OWNER TO postgres;

--
-- Name: pokazzmianastatus(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pokazzmianastatus(oferta_id integer) RETURNS SETOF zmianystatusow
    AS $$
DECLARE
	result ZmianyStatusow;
BEGIN
	FOR result in select * from ZmianyStatusow where id_oferta = oferta_id order by data asc LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.pokazzmianastatus(oferta_id integer) OWNER TO postgres;

--
-- Name: poprawnieisof(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION poprawnieisof() RETURNS void
    AS $$
DECLARE
	licznik integer;
BEGIN
	licznik := 1;
	FOR licznik IN 1..10 LOOP
		EXECUTE 'update tab_ofe set num_of' || licznik || ' = null, rodz_of' || licznik || ' = null where num_of' || licznik || ' = 0 and rodz_of' || licznik || ' = 0;';
	END LOOP;
END
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.poprawnieisof() OWNER TO postgres;

--
-- Name: przeniesdanenieruchomosc(integer, text, text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION przeniesdanenieruchomosc(new_id integer, tab_nazwa text, kol_id text, old_id_n integer) RETURNS void
    AS $$
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
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.przeniesdanenieruchomosc(new_id integer, tab_nazwa text, kol_id text, old_id_n integer) OWNER TO postgres;

--
-- Name: przeniesgazeta(integer, integer, text, text[], boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION przeniesgazeta(nier_id integer, sprz_id integer, tabela text, pow text[], pokoje boolean) RETURNS void
    AS $$
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
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.przeniesgazeta(nier_id integer, sprz_id integer, tabela text, pow text[], pokoje boolean) OWNER TO postgres;

--
-- Name: przenieslistawskazan(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION przenieslistawskazan() RETURNS void
    AS $$
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
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.przenieslistawskazan() OWNER TO postgres;

--
-- Name: przeniespomieszczenienieruchomosc(integer, text, text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION przeniespomieszczenienieruchomosc(new_id integer, tab_nazwa text, kol_id text, old_id_n integer) RETURNS void
    AS $$
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
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.przeniespomieszczenienieruchomosc(new_id integer, tab_nazwa text, kol_id text, old_id_n integer) OWNER TO postgres;

--
-- Name: przeniespubotodom(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION przeniespubotodom() RETURNS void
    AS $$
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
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.przeniespubotodom() OWNER TO postgres;

--
-- Name: przenieszdjecie(integer, integer, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION przenieszdjecie(new_nier_id integer, old_id_nier integer, tab_nazwa text, kol_id text) RETURNS void
    AS $$
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
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.przenieszdjecie(new_nier_id integer, old_id_nier integer, tab_nazwa text, kol_id text) OWNER TO postgres;

--
-- Name: przepiszklient(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION przepiszklient() RETURNS void
    AS $$
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
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.przepiszklient() OWNER TO postgres;

--
-- Name: przepisznieruchomosc(integer, text, integer, text[], text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION przepisznieruchomosc(num_of integer, nazwa_tab text, klient_id integer, kol_tab text[], opis_nier text) RETURNS void
    AS $$
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
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.przepisznieruchomosc(num_of integer, nazwa_tab text, klient_id integer, kol_tab text[], opis_nier text) OWNER TO postgres;

--
-- Name: przepiszoferent(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION przepiszoferent() RETURNS void
    AS $$
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
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.przepiszoferent() OWNER TO postgres;

--
-- Name: przepiszzapotrzebowanie(integer, integer, text[], text[], text[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION przepiszzapotrzebowanie(kl_old_id integer, zapotrzebowanie_id integer, kol_tab text[], par_min text[], par_max text[]) RETURNS void
    AS $$
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
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.przepiszzapotrzebowanie(kl_old_id integer, zapotrzebowanie_id integer, kol_tab text[], par_min text[], par_max text[]) OWNER TO postgres;

--
-- Name: przyjetozmediow(integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION przyjetozmediow(media_nieruchomosc_id integer, of_zap_id integer) RETURNS slownik
    AS $$
DECLARE
	test_id_of_zap integer;
	is_of_test boolean;
	test integer;
	result slownik;
BEGIN
	select into is_of_test oferent from media_nieruchomosc where id = media_nieruchomosc_id;
	IF is_of_test = true THEN
		---sprawdzenie czy oferta wystepuje - przy podawaniu w medium odferty z ³apy
		select into test_id_of_zap id from oferta where id = of_zap_id;
		IF test_id_of_zap is null THEN
			result.nazwa := '_nie_znaleziono_oferty';
		ELSE
			---sprawdzenie czy znalezione nie jest juz przypisane - de facto w szukaniu wyciac !!! ponowne przypisanie tez nie spaskudzi maxymalnie tematu
			select into test media_nieruchomosc.id from oferta join nieruchomosc on oferta.id_nieruchomosc = nieruchomosc.id join media_nieruchomosc on oferta.id_rodz_trans = media_nieruchomosc.id_trans_rodzaj 
			where media_nieruchomosc.id = media_nieruchomosc_id and oferta.id = of_zap_id and nieruchomosc.id_nier_rodzaj = media_nieruchomosc.id_nier_rodzaj;
			IF test is not null THEN
				update media_nieruchomosc set id_of_zap = of_zap_id, id_status = (select id from status where nazwa = '_nieaktualna') where id = media_nieruchomosc_id;
				result.id := media_nieruchomosc_id;
			ELSE
				result.nazwa := '_typy_ofert_sa_rozne';
			END IF;
		END IF;
	ELSE
		select into test_id_of_zap id from zapotrzebowanie where id = of_zap_id;
		IF test_id_of_zap is null THEN
			result.nazwa := '_nie_znaleziono_zlecenia';
		ELSE
			update media_nieruchomosc set id_of_zap = of_zap_id, id_status = (select id from status where nazwa = '_nieaktualna') where id = media_nieruchomosc_id;
			result.id := media_nieruchomosc_id;
		END IF;
	END IF;
	RETURN result;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.przyjetozmediow(media_nieruchomosc_id integer, of_zap_id integer) OWNER TO postgres;

--
-- Name: przytnijtekstmsc(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION przytnijtekstmsc(text_msc text) RETURNS text
    AS $$
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
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.przytnijtekstmsc(text_msc text) OWNER TO postgres;

--
-- Name: regiongeograficzny(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION regiongeograficzny(parent_id integer) RETURNS SETOF slownik
    AS $$
DECLARE
	rec_slownik slownik;
BEGIN
	IF parent_id is not null THEN
		FOR rec_slownik IN select id, nazwa from region_geog where id_parent = parent_id order by nazwa asc LOOP
			RETURN NEXT rec_slownik;
		END LOOP;
	ELSE
		FOR rec_slownik IN select id, nazwa from region_geog where id_parent is null order by nazwa asc LOOP
			RETURN NEXT rec_slownik;
		END LOOP;
	END IF;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.regiongeograficzny(parent_id integer) OWNER TO postgres;

--
-- Name: regiongeograficznyczwpozwoj(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION regiongeograficznyczwpozwoj(text_nazwa text, wojewodztwo_id integer) RETURNS SETOF reggeog
    AS $$
DECLARE
	rec_slownik RegGeog;
	rec_temp record;
	test integer;
	licznik integer;
BEGIN
	---ta 2 czesc wymuszajaca szukanie tylko w dzieciach zabija - lepiej to wywalic
	select into test count(id) from region_geog where id_parent in (select id from region_geog where id_parent in (select id from region_geog where id_parent = wojewodztwo_id)) and lower(nazwa) like lower(text_nazwa) and zaglebienie = 4;
	IF test > 40 THEN
		RETURN NEXT rec_slownik;
	ELSE
---do importu moznaby tymczasowo te like uwalic, moze cos pomoze
		FOR rec_temp IN select id, id_parent, nazwa from region_geog where id_parent in (select id from region_geog where id_parent in (select id from region_geog where id_parent = wojewodztwo_id)) and lower(nazwa) like lower(text_nazwa) and zaglebienie = 4 LOOP
		--id_parent in (select id from region_geog where id_parent in (select id from region_geog where id_parent = wojewodztwo_id)) and lower(nazwa) like lower(text_nazwa) 
			licznik := 1;
			rec_slownik.id_region_geog := rec_temp.id;
			rec_slownik.region := rec_temp.nazwa;
			rec_slownik.rodzice := null;
			WHILE rec_temp.id_parent is not null LOOP
				---ewentualnie jesli on to zle robi (wyznacza rec_temp.id_parent) do test wpisac parent id
				select into rec_temp id, id_parent, nazwa from region_geog where id = rec_temp.id_parent;
				rec_slownik.rodzice[licznik] := rec_temp.nazwa;
				licznik := licznik + 1;
			END LOOP;
			RETURN NEXT rec_slownik;
		END LOOP;
	END IF;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.regiongeograficznyczwpozwoj(text_nazwa text, wojewodztwo_id integer) OWNER TO postgres;

--
-- Name: regiongeograficznynajnizej(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION regiongeograficznynajnizej(text_nazwa text) RETURNS SETOF reggeog
    AS $$
DECLARE
	rec_slownik RegGeog;
	rec_temp record;
	test integer;
	licznik integer;
BEGIN
	---ta 2 czesc wymuszajaca szukanie tylko w dzieciach zabija - lepiej to wywalic
	select into test count(id) from region_geog a1 where lower(nazwa) like lower(text_nazwa) and zaglebienie = 4;---(select count(id) from region_geog where id_parent = a1.id) = 0;
	IF test > 40 THEN
		RETURN NEXT rec_slownik;
	ELSE
---do importu moznaby tymczasowo te like uwalic, moze cos pomoze
		FOR rec_temp IN select id, id_parent, nazwa from region_geog a1 where lower(nazwa) like lower(text_nazwa) and zaglebienie = 4 LOOP ---(select count(id) from region_geog where id_parent = a1.id) = 0 LOOP
			licznik := 1;
			rec_slownik.id_region_geog := rec_temp.id;
			rec_slownik.region := rec_temp.nazwa;
			rec_slownik.rodzice := null;
			WHILE rec_temp.id_parent is not null LOOP
				---ewentualnie jesli on to zle robi (wyznacza rec_temp.id_parent) do test wpisac parent id
				select into rec_temp id, id_parent, nazwa from region_geog where id = rec_temp.id_parent;
				rec_slownik.rodzice[licznik] := rec_temp.nazwa;
				licznik := licznik + 1;
			END LOOP;
			RETURN NEXT rec_slownik;
		END LOOP;
	END IF;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.regiongeograficznynajnizej(text_nazwa text) OWNER TO postgres;

--
-- Name: regiongeograficznynajnizejwoj(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION regiongeograficznynajnizejwoj(text_nazwa text, wojewodztwo_id integer) RETURNS SETOF reggeog
    AS $$
DECLARE
	rec_slownik RegGeog;
	rec_temp record;
	test integer;
	licznik integer;
BEGIN
	---ta 2 czesc wymuszajaca szukanie tylko w dzieciach zabija - lepiej to wywalic
	select into test count(id) from region_geog where 
	(id_parent in (select id from region_geog where id_parent in (select id from region_geog where id_parent = wojewodztwo_id)) and lower(nazwa) like lower(text_nazwa) and ma_dzieci = false and zaglebienie = 4) or 
	(id_parent in (select id from region_geog where id_parent in (select id from region_geog where id_parent in (select id from region_geog where id_parent = wojewodztwo_id))) and lower(nazwa) like lower(text_nazwa) and ma_dzieci = false and zaglebienie = 5);
	IF test > 40 THEN
		RETURN NEXT rec_slownik;
	ELSE
---do importu moznaby tymczasowo te like uwalic, moze cos pomoze
		FOR rec_temp IN select id, id_parent, nazwa from region_geog where 
		(id_parent in (select id from region_geog where id_parent in (select id from region_geog where id_parent = wojewodztwo_id)) and lower(nazwa) like lower(text_nazwa) and ma_dzieci = false and zaglebienie = 4) or 
		(id_parent in (select id from region_geog where id_parent in (select id from region_geog where id_parent in (select id from region_geog where id_parent = wojewodztwo_id))) and lower(nazwa) like lower(text_nazwa) and ma_dzieci = false and zaglebienie = 5) LOOP
		--id_parent in (select id from region_geog where id_parent in (select id from region_geog where id_parent = wojewodztwo_id)) and lower(nazwa) like lower(text_nazwa) 
			licznik := 1;
			rec_slownik.id_region_geog := rec_temp.id;
			rec_slownik.region := rec_temp.nazwa;
			rec_slownik.rodzice := null;
			WHILE rec_temp.id_parent is not null LOOP
				---ewentualnie jesli on to zle robi (wyznacza rec_temp.id_parent) do test wpisac parent id
				select into rec_temp id, id_parent, nazwa from region_geog where id = rec_temp.id_parent;
				rec_slownik.rodzice[licznik] := rec_temp.nazwa;
				licznik := licznik + 1;
			END LOOP;
			RETURN NEXT rec_slownik;
		END LOOP;
	END IF;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.regiongeograficznynajnizejwoj(text_nazwa text, wojewodztwo_id integer) OWNER TO postgres;

--
-- Name: regionnajngalazrodzice(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION regionnajngalazrodzice(region_id integer) RETURNS SETOF integer
    AS $$
DECLARE
	test integer;
	result integer;
	parent_id integer;
BEGIN
	---to sprawdzenie zapewnia, ze nieruchomosc jest wlasciwie zlokalizowana jesli chodzi o region geogr - to nienajszczesliwsze zwazywszy, ze kojarzenie moze sie odbyc pomimo to :P
	---wykomentowane bo to zabepieczenie troche bez sensu :P 10.06
	-----select into test id from region_geog where id = region_id and (select count(id) from region_geog where id_parent = region_id) = 0;
	test := 1;
	IF test is not null THEN ---dostalismy id dziecka bez dzieci - najnizszego szczebla
		parent_id := region_id;
		RETURN NEXT parent_id;
		WHILE parent_id is not null LOOP
			select into parent_id id_parent from region_geog where id = parent_id;
			IF parent_id is not null THEN
				RETURN NEXT parent_id;
			END IF;
		END LOOP;
	END IF;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.regionnajngalazrodzice(region_id integer) OWNER TO postgres;

--
-- Name: rodzajbudynek(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION rodzajbudynek(nier_szcz_id integer) RETURNS SETOF slownik
    AS $$
DECLARE
	rec_slownik slownik;
BEGIN
	FOR rec_slownik IN select id, nazwa from rodz_nier_szczeg where id = nier_szcz_id order by nazwa asc LOOP
		RETURN NEXT rec_slownik;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.rodzajbudynek(nier_szcz_id integer) OWNER TO postgres;

--
-- Name: rozmowaprzychodzaca(text, integer, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION rozmowaprzychodzaca(telefon_nr text, dzwonienie_status_id integer, wewn_nr_agent text) RETURNS boolean
    AS $$
DECLARE
	czas timestamp;
	status_nieod integer;
	status_od integer;
	status_zak integer;
	agent_id integer;
	status_pol_zak integer;
BEGIN
	status_nieod := 1;
	status_od := 2;
	status_zak := 3;
	select into czas date_trunc('second', current_timestamp::timestamp);
	select into agent_id id from agent where wewnetrzny = wewn_nr_agent;

	IF dzwonienie_status_id = status_nieod THEN
		select into status_pol_zak id from rozmowa_przychodzaca where polaczenie_zakonczone = false and nr_telefon = telefon_nr and id_status_dzwonienie = status_nieod;
		IF status_pol_zak is null THEN
			---telefon zadzwonil, ewidencjonujemy
			insert into rozmowa_przychodzaca (nr_telefon, id_status_dzwonienie, id_agent, czas_poczatek) values (telefon_nr, dzwonienie_status_id, agent_id, czas);
		ELSE
			update rozmowa_przychodzaca set id_agent = agent_id where id = status_pol_zak;
		END IF;
		RETURN true;
	ELSIF dzwonienie_status_id = status_od THEN
		---tu moze byc dwuznacznie, moze polaczenie wychodzace uzyskac conn, i wtedy ta operacja update nie ma sensu
		---warunek where powinien byc wystarczajacy: w zalozeniu kazdy sygnal zakonczenia polaczenia bedzie odbierany i uwzgledniany, wiec nie powinno miec miejsca,
		---aby w bazie pozostala rozmowa na dany numer telefonu niezakonczona, oraz nowe polaczenie z tego numeru mialo miejsce. Zawsze przed nowym polaczeniem poprzednie powinno ustac.
		update rozmowa_przychodzaca set id_status_dzwonienie = dzwonienie_status_id, id_agent = agent_id, czas_poczatek = czas where nr_telefon = telefon_nr and polaczenie_zakonczone = false;
		IF found THEN
			RETURN true;
		ELSE
			--nie znaleziono rozmowy do okreslenia jako odebrana - zonk ;/, nie powinno sie zdarzyc
			RETURN false;
		END IF;
	ELSIF dzwonienie_status_id = status_zak THEN
		select into status_pol_zak id_status_dzwonienie from rozmowa_przychodzaca where id_agent = agent_id and polaczenie_zakonczone = false;
		--sprawdzamy czy zakonczone polaczenie bylo odebrane, czy nie
		IF status_pol_zak = status_nieod THEN
			---polaczenie nie zostalo odebrane, zapisujemy date zakonczenia, zaznaczamy ze zakonczono i zostawiamy status
			update rozmowa_przychodzaca set czas_koniec = czas, polaczenie_zakonczone = true where id_agent = agent_id and polaczenie_zakonczone = false;
			IF found THEN
				RETURN true;
			ELSE
				--nie znaleziono rozmowy do okreslenia jako odebrana - zonk ;/, nie powinno sie zdarzyc
				RETURN false;
			END IF;
		ELSE
			---polaczenie bylo odebrane, teraz zostalo zakonczone, zmieniamy status, zaznaczamy ze polaczenie jest zakonczone, dodajemy czas konca
			update rozmowa_przychodzaca set id_status_dzwonienie = dzwonienie_status_id, czas_koniec = czas, polaczenie_zakonczone = true where id_agent = agent_id and polaczenie_zakonczone = false;
			IF found THEN
				RETURN true;
			ELSE
				--nie znaleziono rozmowy do okreslenia jako odebrana - zonk ;/, nie powinno sie zdarzyc
				RETURN false;
			END IF;
		END IF;
	END IF;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.rozmowaprzychodzaca(telefon_nr text, dzwonienie_status_id integer, wewn_nr_agent text) OWNER TO postgres;

--
-- Name: sprawdzaktofwportalu(integer, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION sprawdzaktofwportalu(oferta_id integer, portal_nazwa text) RETURNS integer
    AS $$
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
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.sprawdzaktofwportalu(oferta_id integer, portal_nazwa text) OWNER TO postgres;

--
-- Name: sprawdzdostepnoscagenta(date, integer, integer, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION sprawdzdostepnoscagenta(data_wp date, godzina integer, minuta integer, id_a integer, kalendarz_id integer) RETURNS boolean
    AS $$
DECLARE
	test integer;
BEGIN
	IF kalendarz_id is null THEN
		select into test kalendarz.id from kalendarz join agent_kalendarz on kalendarz.id = agent_kalendarz.id_kalendarz where data = data_wp and id_godzina = godzina and id_minuta = minuta and (agent_kalendarz.id_agent = id_a or agent_kalendarz.id_agent is null);
	ELSE
		select into test kalendarz.id from kalendarz join agent_kalendarz on kalendarz.id = agent_kalendarz.id_kalendarz where data = data_wp and id_godzina = godzina and id_minuta = minuta and (agent_kalendarz.id_agent = id_a or agent_kalendarz.id_agent is null) and kalendarz.id != kalendarz_id;
	END IF;
	IF test is not null THEN
		RETURN false;
	ELSE
		RETURN true;
	END IF;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.sprawdzdostepnoscagenta(data_wp date, godzina integer, minuta integer, id_a integer, kalendarz_id integer) OWNER TO postgres;

--
-- Name: sprawdzistoferta(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION sprawdzistoferta(oferta_id integer) RETURNS boolean
    AS $$
DECLARE
	test integer;
BEGIN
	select into test id from oferta where id = oferta_id;
	IF test is null THEN
		---oferty nie ma
		RETURN false;
	ELSE
		--oferta jest
		RETURN true;		
	END IF;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.sprawdzistoferta(oferta_id integer) OWNER TO postgres;

--
-- Name: sprawdzobecnoscofzlec(integer, integer, boolean, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION sprawdzobecnoscofzlec(oferta_id integer, zapotrzebowanie_id integer, nowe boolean, cena_of double precision) RETURNS boolean
    AS $$
DECLARE
	test integer;
	result boolean;
BEGIN
	---tu jeszcze mozna dodac sprawdzenie czy jest umowienie na ogladanie w przyszlosci bliskiej lub dalekiej
	select into test count(id) from opis_wew_zapotrzebowanie where id_zapotrzebowanie = zapotrzebowanie_id and id_oferta = oferta_id;
	IF nowe = true THEN
		IF test = 0 THEN
			RETURN true;
		ELSE
			select into test count(id) from opis_wew_zapotrzebowanie where id_zapotrzebowanie = zapotrzebowanie_id and id_oferta = oferta_id and ((zainteresowany = true) or (cena::float > cena_of));
			IF test > 0 THEN
				RETURN true;
			ELSE
				RETURN false;
			END IF;
		END IF;
	ELSE
		IF test = 0 THEN
			RETURN false;
		ELSE
			select into test count(id) from opis_wew_zapotrzebowanie where id_zapotrzebowanie = zapotrzebowanie_id and id_oferta = oferta_id and ((zainteresowany = true) or (cena::float > cena_of));
			IF test > 0 THEN
				RETURN false;
			ELSE
				RETURN true;
			END IF;
		END IF;
	END IF;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.sprawdzobecnoscofzlec(oferta_id integer, zapotrzebowanie_id integer, nowe boolean, cena_of double precision) OWNER TO postgres;

--
-- Name: sprawdzofzaplistawsk(integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION sprawdzofzaplistawsk(oferta_id integer, zapotrzebowanie_id integer) RETURNS boolean
    AS $$
DECLARE
	test integer;
BEGIN
	select into test id from lista_wsk_adr where id_oferta = oferta_id and id_zapotrzebowanie = zapotrzebowanie_id;
	IF test is null THEN
		---sparwdzenie statusu oferty
		select into test id from oferta where id = oferta_id and id_status = (select id from status where nazwa = '_aktualna');
		IF test is not null THEN
			RETURN true;
		ELSE
			RETURN false;
		END IF;
	ELSE
		RETURN false;
	END IF;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.sprawdzofzaplistawsk(oferta_id integer, zapotrzebowanie_id integer) OWNER TO postgres;

--
-- Name: sprawdzsubskrypcja(integer, integer, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION sprawdzsubskrypcja(nier_rodzaj_id integer, trans_rodzaj_id integer, adres_email text) RETURNS boolean
    AS $$
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
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.sprawdzsubskrypcja(nier_rodzaj_id integer, trans_rodzaj_id integer, adres_email text) OWNER TO postgres;

--
-- Name: szczegolynieruchomosc(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION szczegolynieruchomosc(nier_rodzaj_id integer) RETURNS SETOF slownik
    AS $$
DECLARE
	rec_slownik slownik;
BEGIN
	FOR rec_slownik IN select id, nazwa from rodz_nier_szczeg where id_nier_rodzaj = nier_rodzaj_id order by nazwa asc LOOP
		RETURN NEXT rec_slownik;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.szczegolynieruchomosc(nier_rodzaj_id integer) OWNER TO postgres;

--
-- Name: szukajklient(integer, integer, text, text, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION szukajklient(osobowosc_id integer, klient_id integer, nazwa_text text, pesel text, nazwisko text, telefon text) RETURNS SETOF klientszukaj
    AS $$ ---, komorka text
DECLARE
	rec_temp record;
	result KlientSzukaj;
	firma_nazwa text;
	zapytanie text;
	and_phr text;
BEGIN
	and_phr := ' and ';
	IF osobowosc_id = (select id from osobowosc where nazwa = '_osobaprawna') THEN
		---szukamy firmy
		zapytanie := 'select distinct on (osoba.id) osoba.id as id_osoba, klient.id as id_klient, osoba.nazwisko, imie.nazwa as imie, osoba.pesel, dane_firma.nazwa as nazwa_firma, telefon.nazwa as telefon, 
		komorka.nazwa as komorka from klient 
		join dane_firma on klient.id = dane_firma.id_klient 
		join osoba_klient on klient.id = osoba_klient.id_klient 
		join osoba on osoba_klient.id_osoba = osoba.id 
		join imie on osoba.id_imie = imie.id 
		left join telefon on osoba.id = telefon.id_osoba 
		left join komorka on osoba.id = komorka.id_osoba where klient.id_osobowosc = ' || osobowosc_id;

		IF klient_id > 0 THEN
			zapytanie := zapytanie || and_phr || 'klient.id = ' || klient_id;
		END IF;
		IF character_length(nazwa_text) > 0 THEN
			zapytanie := zapytanie || and_phr || 'lower(dane_firma.nazwa) like lower(\'' || nazwa_text || '\')';
		END IF;
		IF character_length(pesel) > 0 THEN
			zapytanie := zapytanie || and_phr || 'osoba.pesel like \'' || pesel || '\'';
		END IF;
		IF character_length(nazwisko) > 0 THEN
			zapytanie := zapytanie || and_phr || 'lower(osoba.nazwisko) like lower(\'' || nazwisko || '\')';
		END IF;
		IF character_length(telefon) > 0 THEN
			zapytanie := zapytanie || and_phr || '(telefon.nazwa like \'' || telefon || '\' or komorka.nazwa like \'' || telefon || '\')';
		END IF;
		--IF character_length(komorka) > 0 THEN
		--	zapytanie := zapytanie || and_phr || 'komorka.nazwa like \'' || komorka || '\'';
		--END IF;

		zapytanie := zapytanie || ' limit 121;';
		FOR rec_temp in execute zapytanie LOOP
			result.nazwisko := rec_temp.nazwisko;
			result.imie := rec_temp.imie;
			result.nazwa_firma := rec_temp.nazwa_firma;
			result.id_osoba := rec_temp.id_osoba;
			result.id_klient := rec_temp.id_klient;
			result.pesel := rec_temp.pesel;
			result.telefon := rec_temp.telefon;
			result.komorka := rec_temp.komorka;
			RETURN NEXT result;
		END LOOP;
	ELSE
		---szukamy osoby fizycznej
		zapytanie := 'select distinct on (osoba.id) osoba.id as id_osoba, klient.id as id_klient, osoba.nazwisko, imie.nazwa as imie, osoba.pesel, telefon.nazwa as telefon, komorka.nazwa as komorka from klient 
		join osoba_klient on klient.id = osoba_klient.id_klient 
		join osoba on osoba_klient.id_osoba = osoba.id 
		join imie on osoba.id_imie = imie.id 
		left join telefon on osoba.id = telefon.id_osoba 
		left join komorka on osoba.id = komorka.id_osoba where klient.id_osobowosc = ' || osobowosc_id;
		
		--IF character_length(nazwa_text) > 0 THEN
		--	zapytanie := zapytanie || and_phr || 'lower(dane_firma.nazwa) like lower(\'' || nazwa_text || '\')';
		--END IF;
		IF klient_id > 0 THEN
			zapytanie := zapytanie || and_phr || 'klient.id = ' || klient_id;
		END IF;
		IF character_length(pesel) > 0 THEN
			zapytanie := zapytanie || and_phr || 'osoba.pesel like \'' || pesel || '\'';
		END IF;
		IF character_length(nazwisko) > 0 THEN
			zapytanie := zapytanie || and_phr || 'lower(osoba.nazwisko) like lower(\'' || nazwisko || '\')';
		END IF;
		IF character_length(telefon) > 0 THEN
			zapytanie := zapytanie || and_phr || '(telefon.nazwa like \'' || telefon || '\' or komorka.nazwa like \'' || telefon || '\')';
		END IF;
		--IF character_length(komorka) > 0 THEN
		--	zapytanie := zapytanie || and_phr || 'komorka.nazwa like \'' || komorka || '\'';
		--END IF;

		zapytanie := zapytanie || ' limit 121;';
		FOR rec_temp in execute zapytanie LOOP
			result.nazwisko := rec_temp.nazwisko;
			result.imie := rec_temp.imie;
		--	result.nazwa_firma := rec_temp.nazwa_firma;
			result.id_osoba := rec_temp.id_osoba;
			result.id_klient := rec_temp.id_klient;
			result.pesel := rec_temp.pesel;
			result.telefon := rec_temp.telefon;
			result.komorka := rec_temp.komorka;
			RETURN NEXT result;
		END LOOP;
	END IF;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.szukajklient(osobowosc_id integer, klient_id integer, nazwa_text text, pesel text, nazwisko text, telefon text) OWNER TO postgres;

--
-- Name: szukajosoba(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION szukajosoba(text_szukaj text) RETURNS SETOF osobaview
    AS $$
DECLARE
	result OsobaView;
BEGIN
	FOR result IN select * from OsobaView where lower(nazwisko) like lower(text_szukaj) limit 51 LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.szukajosoba(text_szukaj text) OWNER TO postgres;

--
-- Name: szukajosoby(text, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION szukajosoby(nazwisko_os text, telefon_os text, komorka_os text) RETURNS SETOF osobaview
    AS $$
DECLARE
	result OsobaView;
	zapytanie text;
	andphr text;
	andbool boolean;
	can_ask boolean; ---sprawdzenie czy jakiekolwiek kryterium podano
BEGIN
	andbool := false;
	can_ask := false;

	andphr := ' and ';
	zapytanie := 'select * from OsobaView where ';
	IF character_length (nazwisko_os) > 0 THEN
		IF andbool = true THEN
			zapytanie := zapytanie || andphr;
		END IF;
		zapytanie := zapytanie || 'lower(nazwisko) like lower(\'' || nazwisko_os || '\')';
		andbool := true;
		can_ask := true;
	END IF;
	IF character_length (telefon_os) > 0 THEN
		IF andbool = true THEN
			zapytanie := zapytanie || andphr;
		END IF;
		zapytanie := zapytanie || 'telefon like \'' || telefon_os || '\'';
		andbool := true;
		can_ask := true;
	END IF;
	IF character_length (komorka_os) > 0 THEN
		IF andbool = true THEN
			zapytanie := zapytanie || andphr;
		END IF;
		zapytanie := zapytanie || 'komorka like \'' || komorka_os || '\'';
		andbool := true;
		can_ask := true;
	END IF;
	
	IF can_ask = true THEN
		zapytanie := zapytanie || ' limit 121;';
		FOR result in execute zapytanie LOOP
			RETURN NEXT result;
		END LOOP;
		RETURN;
	ELSE
		RETURN;
	END IF;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.szukajosoby(nazwisko_os text, telefon_os text, komorka_os text) OWNER TO postgres;

--
-- Name: szukajtlumaczen(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION szukajtlumaczen(wartosc text, jezyk_id integer) RETURNS SETOF slownik
    AS $$
DECLARE
	result slownik;
BEGIN
	FOR result in select id, nazwa from tlumaczenie where nazwa like wartosc and id_jezyk = jezyk_id LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.szukajtlumaczen(wartosc text, jezyk_id integer) OWNER TO postgres;

--
-- Name: szybkieszukanie(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION szybkieszukanie(klient_nazwisko text, of_numer integer) RETURNS SETOF szukajofertanierview
    AS $$
DECLARE
	result SzukajOfertaNierView;
	rec_oferty record;
BEGIN
	IF klient_nazwisko is not null and of_numer > 0 THEN
		FOR result IN select distinct on (id_oferta) * from SzukajOfertaNierView where lower(nazwisko) like lower(klient_nazwisko) and id_oferta = of_numer LOOP
			RETURN NEXT result;
		END LOOP;
	ELSIF klient_nazwisko is not null THEN
		FOR result IN select distinct on (id_oferta) * from SzukajOfertaNierView where lower(nazwisko) like lower(klient_nazwisko) LOOP
			RETURN NEXT result;
		END LOOP;
	ELSIF of_numer > 0 THEN
		FOR result IN select distinct on (id_oferta) * from SzukajOfertaNierView where id_oferta = of_numer LOOP
			RETURN NEXT result;
		END LOOP;
	ELSE
		---2 nulle sa uznane za bezsens lub podajemy dokladnie wszystko - za ciezkie wg mnie
		--RETURN;
	END IF;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.szybkieszukanie(klient_nazwisko text, of_numer integer) OWNER TO postgres;

--
-- Name: szukajzapotrzebowanienierview; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW szukajzapotrzebowanienierview AS
    SELECT zapotrzebowanie.id AS id_zapotrzebowanie, zapotrzebowanie.id_klient, zapotrzebowanie.data_otw_zlecenie, osobaview.id_osoba, osobaview.nazwisko, osobaview.imie, osobaview.pesel, osobaview.telefon, osobaview.komorka FROM ((zapotrzebowanie JOIN osoba_zapotrzebowanie ON ((zapotrzebowanie.id = osoba_zapotrzebowanie.id_zapotrzebowanie))) JOIN osobaview ON ((osoba_zapotrzebowanie.id_osoba = osobaview.id_osoba)));


ALTER TABLE public.szukajzapotrzebowanienierview OWNER TO postgres;

--
-- Name: szybkieszukaniezapotrzebowanie(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION szybkieszukaniezapotrzebowanie(klient_nazwisko text, zap_numer integer) RETURNS SETOF szukajzapotrzebowanienierview
    AS $$
DECLARE
	result SzukajZapotrzebowanieNierView;
	rec_oferty record;
BEGIN
	IF klient_nazwisko is not null and zap_numer > 0 THEN
		FOR result IN select distinct on (id_zapotrzebowanie) * from SzukajZapotrzebowanieNierView where lower(nazwisko) like lower(klient_nazwisko) and id_zapotrzebowanie = zap_numer LOOP
			RETURN NEXT result;
		END LOOP;
	ELSIF klient_nazwisko is not null THEN
		FOR result IN select * from (select distinct on (id_zapotrzebowanie) * from SzukajZapotrzebowanieNierView where lower(nazwisko) like lower(klient_nazwisko)) 
		as rec order by rec.data_otw_zlecenie desc LIMIT 121 LOOP
			RETURN NEXT result;
		END LOOP;
	ELSIF zap_numer > 0 THEN
		FOR result IN select distinct on (id_zapotrzebowanie) * from SzukajZapotrzebowanieNierView where id_zapotrzebowanie = zap_numer LOOP
			RETURN NEXT result;
		END LOOP;
	ELSE
		---2 nulle sa uznane za bezsens lub podajemy dokladnie wszystko - za ciezkie wg mnie
		--RETURN;
	END IF;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.szybkieszukaniezapotrzebowanie(klient_nazwisko text, zap_numer integer) OWNER TO postgres;

--
-- Name: tlumaczenia(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION tlumaczenia() RETURNS SETOF tlumjezyk
    AS $$
DECLARE
	jezyk_id integer;
	i integer;
	rec_jezyk record;
	rec_tlumaczenie record;
	type_tl TlumJezyk;
BEGIN
	FOR rec_jezyk IN SELECT id, nazwa FROM jezyk LOOP
		type_tl.id_jezyk := rec_jezyk.id;
		type_tl.nazwa := rec_jezyk.nazwa;
		type_tl.nazwa_tag := null;
		type_tl.tlumaczenie := null;
		i := 0;
		FOR rec_tlumaczenie IN SELECT nazwa_lang_tag, nazwa FROM tlumaczenie WHERE id_jezyk = rec_jezyk.id LOOP
			type_tl.nazwa_tag[i] := rec_tlumaczenie.nazwa_lang_tag;
			type_tl.tlumaczenie[i] := rec_tlumaczenie.nazwa;
			i := i + 1;
		END LOOP;
		RETURN NEXT type_tl;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.tlumaczenia() OWNER TO postgres;

--
-- Name: transakcjanieruchomosc(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION transakcjanieruchomosc(nier_rodzaj_id integer) RETURNS SETOF slownik
    AS $$
DECLARE
	rec_slownik slownik;
BEGIN
	FOR rec_slownik IN select trans_rodzaj.id, trans_rodzaj.nazwa from trans_rodzaj join transakcja_nier on trans_rodzaj.id = transakcja_nier.id_trans_rodzaj where transakcja_nier.id_nier_rodzaj = nier_rodzaj_id order by nazwa asc LOOP
		RETURN NEXT rec_slownik;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.transakcjanieruchomosc(nier_rodzaj_id integer) OWNER TO postgres;

--
-- Name: twoleveldict(text, text, text, character varying, boolean, integer, integer, text, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION twoleveldict(tab_dict text, col_dict text, id_dict text, parent_tag character varying, wiel boolean, id_sek integer, waga_el integer, pl_tlum text, en_tlum text, ge_tlum text) RETURNS void
    AS $$
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
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.twoleveldict(tab_dict text, col_dict text, id_dict text, parent_tag character varying, wiel boolean, id_sek integer, waga_el integer, pl_tlum text, en_tlum text, ge_tlum text) OWNER TO postgres;

--
-- Name: twoleveldictroom(text, text, text, character varying, boolean, integer, integer, text, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION twoleveldictroom(tab_dict text, col_dict text, id_dict text, parent_tag character varying, wiel boolean, id_sek integer, waga_el integer, pl_tlum text, en_tlum text, ge_tlum text) RETURNS void
    AS $$
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
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.twoleveldictroom(tab_dict text, col_dict text, id_dict text, parent_tag character varying, wiel boolean, id_sek integer, waga_el integer, pl_tlum text, en_tlum text, ge_tlum text) OWNER TO postgres;

--
-- Name: uaktualnijmedianieruchomosc(integer, integer, integer, integer, integer, text, boolean, text, text, text, date); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION uaktualnijmedianieruchomosc(media_nieruchomosc_id integer, nier_rodzaj_id integer, trans_rodzaj_id integer, region_id integer, status_id integer, ulica_lok text, is_oferent boolean, powierzchnia_t text, cena_t text, opis_n_t text, przyp_data date) RETURNS boolean
    AS $$
DECLARE
	
BEGIN
	--w zwiazku z pomyslem id of zap update moze zostac okrojony, pewne rzeczy nie podjegaja juz zmianie, trzebaby zwracac slownik i podawac to info
	update media_nieruchomosc set id_nier_rodzaj = nier_rodzaj_id, id_trans_rodzaj = trans_rodzaj_id, id_region_geog = region_id, id_status = status_id, ulica = ulica_lok, oferent = is_oferent, 
	powierzchnia = powierzchnia_t, cena = cena_t, opis = opis_n_t, przypomnienie =  przyp_data where id = media_nieruchomosc_id;
	IF found THEN
		RETURN true;
	ELSE
		RETURN false;
	END IF;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.uaktualnijmedianieruchomosc(media_nieruchomosc_id integer, nier_rodzaj_id integer, trans_rodzaj_id integer, region_id integer, status_id integer, ulica_lok text, is_oferent boolean, powierzchnia_t text, cena_t text, opis_n_t text, przyp_data date) OWNER TO postgres;

--
-- Name: usundokosoba(integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION usundokosoba(osoba_id integer, dowod_tozsamosc_id integer) RETURNS boolean
    AS $$
DECLARE
BEGIN
	delete from osoba_dowod  where id_osoba = osoba_id and id_rodzaj_dowod_tozsamosc = dowod_tozsamosc_id;
	IF found THEN
		return true;
	ELSE
		return false;
	END IF;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.usundokosoba(osoba_id integer, dowod_tozsamosc_id integer) OWNER TO postgres;

--
-- Name: usundokosoba(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION usundokosoba(osoba_dowod_id integer) RETURNS boolean
    AS $$
DECLARE
	
BEGIN
	delete from osoba_dowod where id = osoba_dowod_id;
	IF found THEN
		return true;
	ELSE
		return false;
	END IF;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.usundokosoba(osoba_dowod_id integer) OWNER TO postgres;

--
-- Name: usunemail(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION usunemail(mail_id integer) RETURNS boolean
    AS $$
DECLARE
	
BEGIN
	delete from email_osoba where id = mail_id;
	IF found THEN
		return true;
	ELSE
		return false;
	END IF;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.usunemail(mail_id integer) OWNER TO postgres;

--
-- Name: usunemailmedia(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION usunemailmedia(email_media_nieruchomosc_id integer) RETURNS boolean
    AS $$
DECLARE
BEGIN
	delete from email_media_nieruchomosc where id = email_media_nieruchomosc_id;
	IF found THEN
		RETURN true;
	ELSE
		RETURN false;
	END IF;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.usunemailmedia(email_media_nieruchomosc_id integer) OWNER TO postgres;

--
-- Name: usunfilm(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION usunfilm(film_id integer) RETURNS text
    AS $$
DECLARE
	nazwa_film text;
BEGIN
	select into nazwa_film nazwa from film where id = film_id;
	delete from film where id = film_id;
	IF found THEN
		return nazwa_film;
	ELSE
		return null;
	END IF;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.usunfilm(film_id integer) OWNER TO postgres;

--
-- Name: usunkomorka(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION usunkomorka(osoba_id integer) RETURNS boolean
    AS $$
DECLARE
	
BEGIN
	delete from komorka where id_osoba = osoba_id;
	IF found THEN
		return true;
	ELSE
		return false;
	END IF;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.usunkomorka(osoba_id integer) OWNER TO postgres;

--
-- Name: usunmailbiura(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION usunmailbiura(nazwa_m text) RETURNS boolean
    AS $$
DECLARE
BEGIN
	delete from mailing where email = nazwa_m;
	IF found THEN
		RETURN true;
	ELSE
		RETURN false;
	END IF;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.usunmailbiura(nazwa_m text) OWNER TO postgres;

--
-- Name: usunnotatka(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION usunnotatka(notatka_id integer) RETURNS boolean
    AS $$
DECLARE
	
BEGIN
	delete from ustalenia where id = notatka_id;
	IF found THEN
		RETURN true;
	ELSE
		RETURN false;
	END IF;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.usunnotatka(notatka_id integer) OWNER TO postgres;

--
-- Name: usunnotatkanieruchomosc(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION usunnotatkanieruchomosc(notatka_id integer) RETURNS boolean
    AS $$
DECLARE
BEGIN
	delete from opis_nieruchomosc where id = notatka_id;
	IF found THEN
		RETURN true;
	ELSE
		RETURN false;
	END IF;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.usunnotatkanieruchomosc(notatka_id integer) OWNER TO postgres;

--
-- Name: usunnotatkazapotrzebowanie(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION usunnotatkazapotrzebowanie(notatka_id integer) RETURNS boolean
    AS $$
DECLARE
BEGIN
	delete from opis_wew_zapotrzebowanie where id = notatka_id;
	IF found THEN
		RETURN true;
	ELSE
		RETURN false;
	END IF;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.usunnotatkazapotrzebowanie(notatka_id integer) OWNER TO postgres;

--
-- Name: usunopisoferta(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION usunopisoferta(opis_id integer) RETURNS boolean
    AS $$
DECLARE
	
BEGIN
	delete from opis where id = opis_id;
	IF found THEN
		RETURN true;
	ELSE
		RETURN false;
	END IF;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.usunopisoferta(opis_id integer) OWNER TO postgres;

--
-- Name: usunopisposzzapotrzebowanie(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION usunopisposzzapotrzebowanie(opis_id integer) RETURNS boolean
    AS $$
DECLARE
BEGIN
	delete from opis_posz_zapotrzebowanie where id = opis_id;
	IF found THEN
		RETURN true;
	ELSE
		RETURN false;
	END IF;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.usunopisposzzapotrzebowanie(opis_id integer) OWNER TO postgres;

--
-- Name: usunopiszapotrzebowanietrrodz(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION usunopiszapotrzebowanietrrodz(opis_id integer) RETURNS boolean
    AS $$
DECLARE
	
BEGIN
	delete from opis_zapotrzebowanie where id = opis_id;
	IF found THEN
		RETURN true;
	ELSE
		RETURN false;
	END IF;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.usunopiszapotrzebowanietrrodz(opis_id integer) OWNER TO postgres;

--
-- Name: usunosobaklient(integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION usunosobaklient(klient_id integer, osoba_id integer) RETURNS boolean
    AS $$
DECLARE
	
BEGIN
		---ewentualnie jesli sie zdarzy tutaj jakis error blok z exception dodac
	delete from osoba_klient where id_klient = klient_id and id_osoba = osoba_id;
	IF found THEN
		RETURN true;
	ELSE
		RETURN false;
	END IF;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.usunosobaklient(klient_id integer, osoba_id integer) OWNER TO postgres;

--
-- Name: usunosobalistawsk(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION usunosobalistawsk(osoba_lista_wsk_adr_id integer) RETURNS boolean
    AS $$
DECLARE
BEGIN
	delete from osoba_lista_wsk_adr where id = osoba_lista_wsk_adr_id;
	IF found THEN
		RETURN true;
	ELSE
		RETURN false;
	END IF;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.usunosobalistawsk(osoba_lista_wsk_adr_id integer) OWNER TO postgres;

--
-- Name: usunosobaoferta(integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION usunosobaoferta(osoba_id integer, oferta_id integer) RETURNS boolean
    AS $$
DECLARE
BEGIN
	delete from osoba_oferta where id_oferta = oferta_id and id_osoba = osoba_id;
	IF found THEN
		return true;
	ELSE
		return false;
	END IF;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.usunosobaoferta(osoba_id integer, oferta_id integer) OWNER TO postgres;

--
-- Name: usunosobazapotrzebowanie(integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION usunosobazapotrzebowanie(zapotrzebowanie_id integer, osoba_id integer) RETURNS boolean
    AS $$
DECLARE
	
BEGIN
	delete from osoba_zapotrzebowanie where id_zapotrzebowanie = zapotrzebowanie_id and id_osoba = osoba_id;
	IF found THEN
		return true;
	ELSE
		return false;
	END IF;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.usunosobazapotrzebowanie(zapotrzebowanie_id integer, osoba_id integer) OWNER TO postgres;

--
-- Name: usunpomieszczenienier(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION usunpomieszczenienier(pom_przyn_nier_id integer) RETURNS boolean
    AS $$
DECLARE
	dane record;
	max_nr integer;
BEGIN
	---przed fizyczneym delete pomieszczenia delete zaleznych danych txt i slow
	select into dane nr_pomieszczenia, id_pomieszczenie, id_nieruchomosc from pomieszczenie_przyn_nier where id = pom_przyn_nier_id;
	select into max_nr max(nr_pomieszczenia) from pomieszczenie_przyn_nier where id_nieruchomosc = dane.id_nieruchomosc and id_pomieszczenie = dane.id_pomieszczenie;
	delete from dane_slow_wyp_pom where id_pomieszczenie_przyn_nier = pom_przyn_nier_id;
	delete from dane_txt_pom where id_pomieszczenie_przyn_nier = pom_przyn_nier_id;
	delete from pomieszczenie_przyn_nier where id = pom_przyn_nier_id;
	IF found THEN
		update pomieszczenie_przyn_nier set nr_pomieszczenia = dane.nr_pomieszczenia 
		where id_nieruchomosc = dane.id_nieruchomosc and id_pomieszczenie = dane.id_pomieszczenie and nr_pomieszczenia = max_nr;
		RETURN true;
	ELSE
		RETURN false;
	END IF;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.usunpomieszczenienier(pom_przyn_nier_id integer) OWNER TO postgres;

--
-- Name: usunprowdlatrans(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION usunprowdlatrans(prow_zap_id integer) RETURNS boolean
    AS $$
DECLARE
	
BEGIN
	delete from prowizja_zapotrzebowanie where id = prow_zap_id;
	IF found THEN
		return true;
	ELSE
		return false;
	END IF;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.usunprowdlatrans(prow_zap_id integer) OWNER TO postgres;

--
-- Name: usunreggeogzap(integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION usunreggeogzap(zapotrzebowanie_trans_rodzaj_id integer, reg_id integer) RETURNS boolean
    AS $$
DECLARE
	
BEGIN
	delete from zap_lokaliz_nier where id_region_geog = reg_id and id_zapotrzebowanie_trans_rodzaj = zapotrzebowanie_trans_rodzaj_id;
	IF found THEN
		return true;
	ELSE
		return false;
	END IF;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.usunreggeogzap(zapotrzebowanie_trans_rodzaj_id integer, reg_id integer) OWNER TO postgres;

--
-- Name: usunspotkanie(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION usunspotkanie(spotkanie_id integer) RETURNS boolean
    AS $$
DECLARE
	test record;
	kal_id integer;
	id_sp_of integer;
BEGIN
	select into test id_oferta, id_zapotrzebowanie, spotkanie_data, id_agent from spotkanie where id = spotkanie_id;

	delete from spotkanie_os where id_spotkanie = spotkanie_id;
	select into kal_id id from kalendarz where id_spotkanie = spotkanie_id;
	delete from agent_kalendarz where id_kalendarz = kal_id;
	delete from kalendarz where id_spotkanie = spotkanie_id;
	delete from spotkanie where id = spotkanie_id;

	select into id_sp_of id from spotkanie where id_oferta = test.id_oferta and id_zapotrzebowanie = test.id_zapotrzebowanie and spotkanie_data = test.spotkanie_data and id_agent = test.id_agent;

	delete from spotkanie_os where id_spotkanie = id_sp_of;
	delete from spotkanie where id = id_sp_of;
	
	IF found THEN
		RETURN true;
	ELSE
		RETURN false;
	END IF;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.usunspotkanie(spotkanie_id integer) OWNER TO postgres;

--
-- Name: usunsubskrypcja(integer, integer, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION usunsubskrypcja(nier_rodzaj_id integer, trans_rodzaj_id integer, adres_email text) RETURNS slownik
    AS $$
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
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.usunsubskrypcja(nier_rodzaj_id integer, trans_rodzaj_id integer, adres_email text) OWNER TO postgres;

--
-- Name: usunszczegnierzap(integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION usunszczegnierzap(zapotrzebowanie_id integer, szczeg_id integer) RETURNS boolean
    AS $$
DECLARE
BEGIN
	delete from zap_szcz_nier where id_zapotrzebowanie = zapotrzebowanie_id and id_rodz_nier_szcz = szczeg_id;
	IF found THEN
		return true;
	ELSE
		return false;
	END IF;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.usunszczegnierzap(zapotrzebowanie_id integer, szczeg_id integer) OWNER TO postgres;

--
-- Name: usuntelefon(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION usuntelefon(tel_id integer) RETURNS boolean
    AS $$
DECLARE
	
BEGIN
	delete from telefon where id = tel_id;
	IF found THEN
		return true;
	ELSE
		return false;
	END IF;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.usuntelefon(tel_id integer) OWNER TO postgres;

--
-- Name: usuntelefonmedia(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION usuntelefonmedia(telefon_media_nieruchomosc_id integer) RETURNS boolean
    AS $$
DECLARE
BEGIN
	delete from telefon_media_nieruchomosc where id = telefon_media_nieruchomosc_id;
	IF found THEN
		RETURN true;
	ELSE
		RETURN false;
	END IF;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.usuntelefonmedia(telefon_media_nieruchomosc_id integer) OWNER TO postgres;

--
-- Name: usuntransnierzapotrzebowanie(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION usuntransnierzapotrzebowanie(zapotrzebowanie_trans_rodzaj_id integer) RETURNS boolean
    AS $$
DECLARE
	
BEGIN
	delete from zapotrzebowanie_trans_rodzaj where id = zapotrzebowanie_trans_rodzaj_id;
	IF found THEN
		return true;
	ELSE
		return false;
	END IF;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.usuntransnierzapotrzebowanie(zapotrzebowanie_trans_rodzaj_id integer) OWNER TO postgres;

--
-- Name: usunwlasciciel(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION usunwlasciciel(wlasciciel_id integer) RETURNS boolean
    AS $$
DECLARE
BEGIN
	delete from wlasciciel where id = wlasciciel_id;
	IF found THEN
		return true;
	ELSE
		return false;
	END IF;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.usunwlasciciel(wlasciciel_id integer) OWNER TO postgres;

--
-- Name: usunwpiskalendarz(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION usunwpiskalendarz(kalendarz_id integer) RETURNS slownik
    AS $$
DECLARE
	---ewentualnie sprawdzenie czy wpis ma id spotkania istniejacego - jak tak to raczej nie kasowac ...., dodatkowo zwracac typ slownik i poinformowac
	result slownik;
	test integer;
BEGIN
	select into test id from spotkanie where id = (select id_spotkanie from kalendarz where id = kalendarz_id);
	IF test is not null THEN
		result.nazwa := '_wpis_powiazany_ze_spotkaniem_z_klientem_aby_usunac_usun_spotkanie';
	ELSE
		delete from agent_kalendarz where id_kalendarz = kalendarz_id;
		delete from kalendarz where id = kalendarz_id;
	END IF;
	RETURN result;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.usunwpiskalendarz(kalendarz_id integer) OWNER TO postgres;

--
-- Name: usunzdjecie(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION usunzdjecie(zdjecie_id integer) RETURNS text
    AS $$
DECLARE
	nazwa_zdj text;
BEGIN
	select into nazwa_zdj nazwa from zdjecie where id = zdjecie_id;
	delete from zdjecie where id = zdjecie_id;
	IF found THEN
		return nazwa_zdj;
	ELSE
		return null;
	END IF;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.usunzdjecie(zdjecie_id integer) OWNER TO postgres;

--
-- Name: wpiskalendarz(integer, date, integer, integer, integer[], text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION wpiskalendarz(kalendarz_id integer, data_wp date, godzina integer, minuta integer, id_agent_a integer[], koment text, spotkanie_id integer) RETURNS slownik
    AS $$
DECLARE
	test_kal boolean;
	result slownik;
	licznik integer;
BEGIN
	IF id_agent_a is null THEN
		select into test_kal SprawdzDostepnoscAgenta(data_wp, godzina, minuta, null, kalendarz_id);
		IF test_kal = false THEN
			result.nazwa := '_jeden_z_agentow_jest_umowiony_w_wybranym_terminie';
		END IF;
	ELSE
		licznik := 1;
		WHILE id_agent_a[licznik] is not null LOOP
			select into test_kal SprawdzDostepnoscAgenta(data_wp, godzina, minuta, id_agent_a[licznik], kalendarz_id);
			IF test_kal = false THEN
				result.nazwa := '_agent_jest_umowiony_w_wybranym_terminie';
				return result;
			END IF;
			licznik := licznik + 1;
		END LOOP;
		IF kalendarz_id is not null THEN
			update kalendarz set data = data_wp, id_godzina = godzina, id_minuta = minuta, id_spotkanie = spotkanie_id, komentarz = koment where id = kalendarz_id;
			result.id := kalendarz_id;
			delete from agent_kalendarz where id_kalendarz = kalendarz_id;
			licznik := 1;
			WHILE id_agent_a[licznik] is not null LOOP
				insert into agent_kalendarz(id_kalendarz, id_agent) values (kalendarz_id, id_agent_a[licznik]);
				licznik := licznik + 1;
			END LOOP;
		ELSE
			insert into kalendarz (data, id_godzina, id_minuta, id_spotkanie, komentarz) values (data_wp, godzina, minuta, spotkanie_id, koment);
			select into result.id currval('kalendarz_id_seq');
			licznik := 1;
			WHILE id_agent_a[licznik] is not null LOOP
				insert into agent_kalendarz(id_kalendarz, id_agent) values (result.id, id_agent_a[licznik]);
				licznik := licznik + 1;
			END LOOP;
		END IF;
		return result;
	END IF;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.wpiskalendarz(kalendarz_id integer, data_wp date, godzina integer, minuta integer, id_agent_a integer[], koment text, spotkanie_id integer) OWNER TO postgres;

--
-- Name: wprowadzagent(integer, text, text, text, text, text, text, text, text, text, integer, integer, text, text, text, boolean[], integer, text, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION wprowadzagent(agent_id integer, nazwa_t text, nazwa_skr text, nazwa_f text, login_t text, passwd text, tel text, komorka_t text, fax_t text, email_t text, lic_num integer, otodom_id integer, wewn_nr text, nip_t text, adres_t text, uprawnienia boolean[], bank_id integer, rachunek_nr text, akt_konto boolean) RETURNS slownik
    AS $$ ---uprawnienia maja 7 sztuk :P
DECLARE
	data_wyg date;
	result slownik;
	lic_agent integer;
	log_id integer;
	nadz_agent integer;
	newid integer;
	test integer;
BEGIN
	IF agent_id is null THEN
		select into log_id id from agent where login = md5(login_t);
		IF log_id is not null THEN
			result.id := null;
			result.nazwa := '_podany_login_jest_uzywany';

			return result;
		ELSE
			select into data_wyg current_date + 90;

			select into nadz_agent id from agent where licencja = lic_num;
			IF nadz_agent is null THEN
				---licencja nowa, nie ma nadzoru
				lic_agent := lic_num;
				--else nie robie, bo lic_agent pozostanie null i wtedy nadz_agent bedzie istniec
			END IF;
			test := 1; --petla musi ruszyc po raz 1, wiec test nie moze byc null na poczatku :P
			WHILE test is not null LOOP
				select into newid nextval('agent_id_seq');
				select into test id from agent where id = newid;
			END LOOP;
			
			BEGIN
				insert into agent (id, id_otodom, nazwa, nazwa_pot, login, haslo, waznosc_haslo, aktywnosc_konto, telefon, komorka, fax, email, wewnetrzny, licencja, nadzor, nip, dodawanie, edycja, 
				kasowanie, druk, adm_klient, adm_dane, zmiana_upr, adres, firma) 
				values (newid, otodom_id, nazwa_t, nazwa_skr, md5(login_t), md5(passwd), data_wyg, true, tel, komorka_t, fax_t, email_t, wewn_nr, lic_agent, nadz_agent, nip_t, uprawnienia[1], 
				uprawnienia[2], uprawnienia[3], uprawnienia[4], uprawnienia[5], uprawnienia[6], uprawnienia[7], adres_t, nazwa_f);
				--select into result.id currval('agent_id_seq');
				result.id := newid;
				IF character_length(rachunek_nr) = 26 THEN
					insert into konto_agent (id_agent, id_bank, nr_konto) values (newid, bank_id, rachunek_nr);
				END IF;

				return result;
			EXCEPTION WHEN not_null_violation THEN
				result.id := null;
				result.nazwa := 'Wystapil niedozwolony null, to niemozliwe :P.';
				return result;
			END;
		END IF;
	ELSE
		select into nadz_agent id from agent where licencja = lic_num and id != agent_id;
		IF nadz_agent is null THEN
			---licencja nowa, nie ma nadzoru
			lic_agent := lic_num;
			--else nie robie, bo lic_agent pozostanie null i wtedy nadz_agent bedzie istniec
		END IF;
		BEGIN
			update agent set id_otodom = otodom_id, nazwa = nazwa_t, nazwa_pot = nazwa_skr, aktywnosc_konto = akt_konto, telefon = tel, komorka = komorka_t, fax = fax_t, email = email_t, 
			wewnetrzny = wewn_nr, licencja = lic_agent, nadzor = nadz_agent, nip = nip_t, dodawanie = uprawnienia[1], edycja = uprawnienia[2], kasowanie = uprawnienia[3], 
			druk = uprawnienia[4], adm_klient = uprawnienia[5], adm_dane = uprawnienia[6], zmiana_upr = uprawnienia[7], adres = adres_t, firma = nazwa_f where id = agent_id;
			result.id := agent_id;
			return result;
		EXCEPTION WHEN not_null_violation THEN
			result.id := null;
			result.nazwa := 'Wystapil niedozwolony null, to niemozliwe :P.';
			return result;
		END;
	END IF;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.wprowadzagent(agent_id integer, nazwa_t text, nazwa_skr text, nazwa_f text, login_t text, passwd text, tel text, komorka_t text, fax_t text, email_t text, lic_num integer, otodom_id integer, wewn_nr text, nip_t text, adres_t text, uprawnienia boolean[], bank_id integer, rachunek_nr text, akt_konto boolean) OWNER TO postgres;

--
-- Name: wszystkierodzajetrans(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION wszystkierodzajetrans() RETURNS SETOF transakcje
    AS $$
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
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.wszystkierodzajetrans() OWNER TO postgres;

--
-- Name: wyposazeniepodajszczeg(integer, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION wyposazeniepodajszczeg(nieruchomosc_id integer, nazwa_wyp text) RETURNS text
    AS $$
DECLARE
	wyp_id integer;
	result text;
BEGIN
	select into wyp_id id from wyposazenie_nier where nazwa = nazwa_wyp;
	select into result nazwa from wyposazenie_nier join dane_slow_wyp_nier on wyposazenie_nier.id = dane_slow_wyp_nier.id_wyposazenie_nier 
	where wyposazenie_nier.id_parent = wyp_id and dane_slow_wyp_nier.id_nieruchomosc = nieruchomosc_id;
	return result;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.wyposazeniepodajszczeg(nieruchomosc_id integer, nazwa_wyp text) OWNER TO postgres;

--
-- Name: zapotrzebowaniatablistwskazan(integer[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION zapotrzebowaniatablistwskazan(tab_zapotrzebowania integer[]) RETURNS SETOF szukajzapotrzebowanienierview
    AS $$
DECLARE
	result SzukajZapotrzebowanieNierView;
	licznik integer;
BEGIN
	licznik := 1;
	WHILE tab_zapotrzebowania[licznik] is not null LOOP
		select into result * from SzukajZapotrzebowanieNierView where id_zapotrzebowanie = tab_zapotrzebowania[licznik];
		IF result.id_zapotrzebowanie is not null THEN
			RETURN NEXT result;
		END IF;
		licznik := licznik + 1;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.zapotrzebowaniatablistwskazan(tab_zapotrzebowania integer[]) OWNER TO postgres;

--
-- Name: zapotrzebowanieklient(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION zapotrzebowanieklient(osoba_id integer) RETURNS SETOF szukajzapotrzebowanienierview
    AS $$
DECLARE
	result SzukajZapotrzebowanieNierView;
BEGIN
	FOR result IN select * from SzukajZapotrzebowanieNierView where id_osoba = osoba_id LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.zapotrzebowanieklient(osoba_id integer) OWNER TO postgres;

--
-- Name: cena; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cena (
    id integer NOT NULL,
    id_oferta integer NOT NULL,
    id_osoba integer NOT NULL,
    id_agent integer NOT NULL,
    cena character varying(15) NOT NULL,
    data timestamp without time zone NOT NULL,
    podpis boolean
);


ALTER TABLE public.cena OWNER TO postgres;

--
-- Name: zmianaceny; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW zmianaceny AS
    SELECT cena.id_oferta, cena.cena, cena.data, cena.podpis, agent.nazwa_pot AS agent, osobaview.nazwisko, osobaview.imie FROM ((cena JOIN agent ON ((cena.id_agent = agent.id))) JOIN osobaview ON ((cena.id_osoba = osobaview.id_osoba)));


ALTER TABLE public.zmianaceny OWNER TO postgres;

--
-- Name: zmianacena(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION zmianacena(oferta_id integer) RETURNS SETOF zmianaceny
    AS $$
DECLARE
	result ZmianaCeny;
BEGIN
	FOR result in select * from ZmianaCeny where id_oferta = oferta_id LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.zmianacena(oferta_id integer) OWNER TO postgres;

--
-- Name: zmianahasla(text, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION zmianahasla(login_t text, passwd text, newpasswd text) RETURNS boolean
    AS $$
DECLARE
	newdate date;
BEGIN
	select into newdate current_date + 180;
	update agent set haslo = md5(newpasswd), waznosc_haslo = newdate where aktywnosc_konto = true and login = md5(login_t) and haslo = md5(passwd);
	IF found THEN
		return true;
	ELSE
		return false;
	END IF;
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.zmianahasla(login_t text, passwd text, newpasswd text) OWNER TO postgres;

--
-- Name: agent_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE agent_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.agent_id_seq OWNER TO postgres;

--
-- Name: agent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE agent_id_seq OWNED BY agent.id;


--
-- Name: agent_kalendarz; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE agent_kalendarz (
    id integer NOT NULL,
    id_kalendarz integer NOT NULL,
    id_agent integer
);


ALTER TABLE public.agent_kalendarz OWNER TO postgres;

--
-- Name: agent_kalendarz_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE agent_kalendarz_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.agent_kalendarz_id_seq OWNER TO postgres;

--
-- Name: agent_kalendarz_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE agent_kalendarz_id_seq OWNED BY agent_kalendarz.id;


--
-- Name: agent_otodom; Type: TABLE; Schema: public; Owner: azg; Tablespace: 
--

CREATE TABLE agent_otodom (
    id integer NOT NULL,
    id_otodom integer NOT NULL
);


ALTER TABLE public.agent_otodom OWNER TO azg;

--
-- Name: bank; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE bank (
    id integer NOT NULL,
    nazwa character varying(50) NOT NULL
);


ALTER TABLE public.bank OWNER TO postgres;

--
-- Name: bank_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE bank_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.bank_id_seq OWNER TO postgres;

--
-- Name: bank_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE bank_id_seq OWNED BY bank.id;


--
-- Name: biuro_nier_kon; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE biuro_nier_kon (
    id integer NOT NULL,
    id_region_geog integer NOT NULL,
    email character varying(50) NOT NULL,
    nazwa character varying(30) NOT NULL,
    adres character varying(100)
);


ALTER TABLE public.biuro_nier_kon OWNER TO postgres;

--
-- Name: biuro_nier_kon_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE biuro_nier_kon_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.biuro_nier_kon_id_seq OWNER TO postgres;

--
-- Name: biuro_nier_kon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE biuro_nier_kon_id_seq OWNED BY biuro_nier_kon.id;


--
-- Name: biuro_nier_wspolpraca; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE biuro_nier_wspolpraca (
    id_klient integer NOT NULL,
    id_biuro_nier_kon integer NOT NULL
);


ALTER TABLE public.biuro_nier_wspolpraca OWNER TO postgres;

--
-- Name: cena_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cena_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.cena_id_seq OWNER TO postgres;

--
-- Name: cena_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cena_id_seq OWNED BY cena.id;


--
-- Name: dane_firma; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE dane_firma (
    id_klient integer NOT NULL,
    nazwa character varying(100) NOT NULL,
    nip character varying(13) NOT NULL,
    regon character varying(14),
    krs character varying(15),
    kod_pocztowy character varying(6),
    id_region_geog integer,
    ulica character varying(40) NOT NULL,
    numer_dom character varying(10),
    numer_miesz character varying(10)
);


ALTER TABLE public.dane_firma OWNER TO postgres;

--
-- Name: dane_slow_wyp_nier; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE dane_slow_wyp_nier (
    id integer NOT NULL,
    id_nieruchomosc integer NOT NULL,
    id_wyposazenie_nier integer NOT NULL
);


ALTER TABLE public.dane_slow_wyp_nier OWNER TO postgres;

--
-- Name: dane_slow_wyp_nier_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE dane_slow_wyp_nier_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.dane_slow_wyp_nier_id_seq OWNER TO postgres;

--
-- Name: dane_slow_wyp_nier_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE dane_slow_wyp_nier_id_seq OWNED BY dane_slow_wyp_nier.id;


--
-- Name: dane_slow_wyp_pom; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE dane_slow_wyp_pom (
    id integer NOT NULL,
    id_pomieszczenie_przyn_nier integer NOT NULL,
    id_wyposazenie_pom integer NOT NULL
);


ALTER TABLE public.dane_slow_wyp_pom OWNER TO postgres;

--
-- Name: dane_slow_wyp_pom_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE dane_slow_wyp_pom_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.dane_slow_wyp_pom_id_seq OWNER TO postgres;

--
-- Name: dane_slow_wyp_pom_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE dane_slow_wyp_pom_id_seq OWNED BY dane_slow_wyp_pom.id;


--
-- Name: dane_slow_wyp_zap; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE dane_slow_wyp_zap (
    id integer NOT NULL,
    id_zapotrzebowanie_trans_rodzaj integer NOT NULL,
    id_wyposazenie_nier integer NOT NULL
);


ALTER TABLE public.dane_slow_wyp_zap OWNER TO postgres;

--
-- Name: dane_slow_wyp_zap_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE dane_slow_wyp_zap_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.dane_slow_wyp_zap_id_seq OWNER TO postgres;

--
-- Name: dane_slow_wyp_zap_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE dane_slow_wyp_zap_id_seq OWNED BY dane_slow_wyp_zap.id;


--
-- Name: dane_txt_nier; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE dane_txt_nier (
    id integer NOT NULL,
    id_nieruchomosc integer NOT NULL,
    id_parametr_nier integer NOT NULL,
    wartosc character varying(100)
);


ALTER TABLE public.dane_txt_nier OWNER TO postgres;

--
-- Name: dane_txt_nier_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE dane_txt_nier_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.dane_txt_nier_id_seq OWNER TO postgres;

--
-- Name: dane_txt_nier_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE dane_txt_nier_id_seq OWNED BY dane_txt_nier.id;


--
-- Name: dane_txt_pom; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE dane_txt_pom (
    id integer NOT NULL,
    id_pomieszczenie_przyn_nier integer NOT NULL,
    id_parametr_pom integer NOT NULL,
    wartosc character varying(100)
);


ALTER TABLE public.dane_txt_pom OWNER TO postgres;

--
-- Name: dane_txt_pom_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE dane_txt_pom_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.dane_txt_pom_id_seq OWNER TO postgres;

--
-- Name: dane_txt_pom_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE dane_txt_pom_id_seq OWNED BY dane_txt_pom.id;


--
-- Name: dane_txt_zap_max; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE dane_txt_zap_max (
    id integer NOT NULL,
    id_zapotrzebowanie_trans_rodzaj integer NOT NULL,
    id_parametr_nier integer NOT NULL,
    wartosc character varying(100)
);


ALTER TABLE public.dane_txt_zap_max OWNER TO postgres;

--
-- Name: dane_txt_zap_max_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE dane_txt_zap_max_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.dane_txt_zap_max_id_seq OWNER TO postgres;

--
-- Name: dane_txt_zap_max_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE dane_txt_zap_max_id_seq OWNED BY dane_txt_zap_max.id;


--
-- Name: dane_txt_zap_min; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE dane_txt_zap_min (
    id integer NOT NULL,
    id_zapotrzebowanie_trans_rodzaj integer NOT NULL,
    id_parametr_nier integer NOT NULL,
    wartosc character varying(100)
);


ALTER TABLE public.dane_txt_zap_min OWNER TO postgres;

--
-- Name: dane_txt_zap_min_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE dane_txt_zap_min_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.dane_txt_zap_min_id_seq OWNER TO postgres;

--
-- Name: dane_txt_zap_min_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE dane_txt_zap_min_id_seq OWNED BY dane_txt_zap_min.id;


--
-- Name: email_media_nieruchomosc_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE email_media_nieruchomosc_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.email_media_nieruchomosc_id_seq OWNER TO postgres;

--
-- Name: email_media_nieruchomosc_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE email_media_nieruchomosc_id_seq OWNED BY email_media_nieruchomosc.id;


--
-- Name: email_osoba_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE email_osoba_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.email_osoba_id_seq OWNER TO postgres;

--
-- Name: email_osoba_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE email_osoba_id_seq OWNED BY email_osoba.id;


--
-- Name: film; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE film (
    id integer NOT NULL,
    id_nieruchomosc integer NOT NULL,
    nazwa character varying(30) NOT NULL
);


ALTER TABLE public.film OWNER TO postgres;

--
-- Name: film_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE film_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.film_id_seq OWNER TO postgres;

--
-- Name: film_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE film_id_seq OWNED BY film.id;


--
-- Name: godzina_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE godzina_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.godzina_id_seq OWNER TO postgres;

--
-- Name: godzina_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE godzina_id_seq OWNED BY godzina.id;


--
-- Name: id_a_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE id_a_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.id_a_seq OWNER TO postgres;

--
-- Name: id_aktu_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE id_aktu_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.id_aktu_seq OWNER TO postgres;

--
-- Name: id_dom_ku_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE id_dom_ku_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.id_dom_ku_seq OWNER TO postgres;

--
-- Name: id_dom_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE id_dom_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.id_dom_seq OWNER TO postgres;

--
-- Name: id_dom_w_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE id_dom_w_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.id_dom_w_seq OWNER TO postgres;

--
-- Name: id_dom_za_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE id_dom_za_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.id_dom_za_seq OWNER TO postgres;

--
-- Name: id_domg_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE id_domg_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.id_domg_seq OWNER TO postgres;

--
-- Name: id_dzi_ku_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE id_dzi_ku_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.id_dzi_ku_seq OWNER TO postgres;

--
-- Name: id_dzi_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE id_dzi_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.id_dzi_seq OWNER TO postgres;

--
-- Name: id_dzi_w_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE id_dzi_w_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.id_dzi_w_seq OWNER TO postgres;

--
-- Name: id_dzig_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE id_dzig_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.id_dzig_seq OWNER TO postgres;

--
-- Name: id_kl_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE id_kl_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.id_kl_seq OWNER TO postgres;

--
-- Name: id_lewa_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE id_lewa_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.id_lewa_seq OWNER TO postgres;

--
-- Name: id_li_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE id_li_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.id_li_seq OWNER TO postgres;

--
-- Name: id_log_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE id_log_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.id_log_seq OWNER TO postgres;

--
-- Name: id_lok_ku_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE id_lok_ku_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.id_lok_ku_seq OWNER TO postgres;

--
-- Name: id_lok_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE id_lok_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.id_lok_seq OWNER TO postgres;

--
-- Name: id_lok_w_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE id_lok_w_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.id_lok_w_seq OWNER TO postgres;

--
-- Name: id_lokg_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE id_lokg_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.id_lokg_seq OWNER TO postgres;

--
-- Name: id_mie_ku_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE id_mie_ku_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.id_mie_ku_seq OWNER TO postgres;

--
-- Name: id_mie_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE id_mie_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.id_mie_seq OWNER TO postgres;

--
-- Name: id_mie_w_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE id_mie_w_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.id_mie_w_seq OWNER TO postgres;

--
-- Name: id_mie_za_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE id_mie_za_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.id_mie_za_seq OWNER TO postgres;

--
-- Name: id_mieg_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE id_mieg_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.id_mieg_seq OWNER TO postgres;

--
-- Name: id_obg_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE id_obg_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.id_obg_seq OWNER TO postgres;

--
-- Name: id_obi_ku_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE id_obi_ku_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.id_obi_ku_seq OWNER TO postgres;

--
-- Name: id_obi_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE id_obi_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.id_obi_seq OWNER TO postgres;

--
-- Name: id_obi_w_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE id_obi_w_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.id_obi_w_seq OWNER TO postgres;

--
-- Name: id_ofe_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE id_ofe_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.id_ofe_seq OWNER TO postgres;

--
-- Name: id_oso_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE id_oso_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.id_oso_seq OWNER TO postgres;

--
-- Name: id_pol_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE id_pol_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.id_pol_seq OWNER TO postgres;

--
-- Name: id_te_ku_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE id_te_ku_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.id_te_ku_seq OWNER TO postgres;

--
-- Name: id_te_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE id_te_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.id_te_seq OWNER TO postgres;

--
-- Name: id_te_w_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE id_te_w_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.id_te_w_seq OWNER TO postgres;

--
-- Name: id_teg_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE id_teg_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.id_teg_seq OWNER TO postgres;

--
-- Name: imie_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE imie_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.imie_id_seq OWNER TO postgres;

--
-- Name: imie_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE imie_id_seq OWNED BY imie.id;


--
-- Name: jezyk_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE jezyk_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.jezyk_id_seq OWNER TO postgres;

--
-- Name: jezyk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE jezyk_id_seq OWNED BY jezyk.id;


--
-- Name: kalendarz_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE kalendarz_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.kalendarz_id_seq OWNER TO postgres;

--
-- Name: kalendarz_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE kalendarz_id_seq OWNED BY kalendarz.id;


--
-- Name: kategoria_allegro; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE kategoria_allegro (
    id integer NOT NULL,
    id_nier_rodzaj integer,
    id_trans_rodzaj integer,
    id_powiat integer,
    kategoria_allegro integer NOT NULL
);


ALTER TABLE public.kategoria_allegro OWNER TO postgres;

--
-- Name: kategoria_allegro_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE kategoria_allegro_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.kategoria_allegro_id_seq OWNER TO postgres;

--
-- Name: kategoria_allegro_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE kategoria_allegro_id_seq OWNED BY kategoria_allegro.id;


--
-- Name: kategorie_allegro_id_seq; Type: SEQUENCE; Schema: public; Owner: azg
--

CREATE SEQUENCE kategorie_allegro_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.kategorie_allegro_id_seq OWNER TO azg;

--
-- Name: klient; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE klient (
    id integer NOT NULL,
    id_old integer,
    is_oferent_old boolean DEFAULT false,
    id_osobowosc integer NOT NULL,
    id_agent integer NOT NULL
);


ALTER TABLE public.klient OWNER TO postgres;

--
-- Name: klient_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE klient_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.klient_id_seq OWNER TO postgres;

--
-- Name: klient_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE klient_id_seq OWNED BY klient.id;


--
-- Name: kojarzeniebazowemedia_media; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW kojarzeniebazowemedia_media AS
    SELECT media_n_of.id AS id_media_nieruchomosc_o, media_n_z.id AS id_media_nieruchomosc_z, (media_n_of.cena)::double precision AS cena_oferta, (media_n_z.cena)::double precision AS cena_zapotrzebowanie FROM (media_nieruchomosc media_n_of JOIN media_nieruchomosc media_n_z ON ((media_n_of.id_trans_rodzaj = media_n_z.id_trans_rodzaj))) WHERE (((((((media_n_z.oferent = false) AND (media_n_of.oferent = true)) AND (media_n_of.id_nier_rodzaj = media_n_z.id_nier_rodzaj)) AND (media_n_z.id_status = (SELECT status.id FROM status WHERE ((status.nazwa)::text = '_aktualna'::text)))) AND (media_n_of.id_status = (SELECT status.id FROM status WHERE ((status.nazwa)::text = '_aktualna'::text)))) AND ((media_n_z.cena)::text > (0)::text)) AND ((media_n_of.cena)::text > (0)::text));


ALTER TABLE public.kojarzeniebazowemedia_media OWNER TO postgres;

--
-- Name: kojarzeniebazoweoferta_media; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW kojarzeniebazoweoferta_media AS
    SELECT oferta.id AS id_oferta, media_nieruchomosc.id AS id_media_nieruchomosc, (media_nieruchomosc.cena)::double precision AS cena_media, (oferta.cena)::double precision AS cena_oferta FROM ((oferta JOIN nieruchomosc ON ((oferta.id_nieruchomosc = nieruchomosc.id))) JOIN media_nieruchomosc ON ((oferta.id_rodz_trans = media_nieruchomosc.id_trans_rodzaj))) WHERE ((((((nieruchomosc.id_nier_rodzaj = media_nieruchomosc.id_nier_rodzaj) AND (media_nieruchomosc.oferent = false)) AND (media_nieruchomosc.id_status = (SELECT status.id FROM status WHERE ((status.nazwa)::text = '_aktualna'::text)))) AND (oferta.id_status = (SELECT status.id FROM status WHERE ((status.nazwa)::text = '_aktualna'::text)))) AND ((oferta.cena)::text > (0)::text)) AND ((media_nieruchomosc.cena)::text > (0)::text));


ALTER TABLE public.kojarzeniebazoweoferta_media OWNER TO postgres;

--
-- Name: kojarzeniebazoweoferta_zapotrzebowanie; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW kojarzeniebazoweoferta_zapotrzebowanie AS
    SELECT zapotrzebowanie_nier_rodzaj.id_zapotrzebowanie, zapotrzebowanie_trans_rodzaj.id AS id_zapotrzebowanie_trans_rodzaj, oferta.id AS id_oferta, (oferta.cena)::double precision AS cena_oferta, (zapotrzebowanie_trans_rodzaj.cena)::double precision AS cena_zapotrzebowanie FROM (((zapotrzebowanie_nier_rodzaj JOIN zapotrzebowanie_trans_rodzaj ON ((zapotrzebowanie_nier_rodzaj.id = zapotrzebowanie_trans_rodzaj.id_zapotrzebowanie_nier_rodzaj))) JOIN oferta ON ((oferta.id_rodz_trans = zapotrzebowanie_trans_rodzaj.id_trans_rodzaj))) JOIN nieruchomosc ON ((oferta.id_nieruchomosc = nieruchomosc.id))) WHERE (((((zapotrzebowanie_nier_rodzaj.id_nier_rodzaj = nieruchomosc.id_nier_rodzaj) AND (zapotrzebowanie_trans_rodzaj.id_status = (SELECT status.id FROM status WHERE ((status.nazwa)::text = '_aktualna'::text)))) AND ((oferta.cena)::text > (0)::text)) AND ((zapotrzebowanie_trans_rodzaj.cena)::text > (0)::text)) AND ((SELECT count(lista_wsk_adr.id) AS count FROM lista_wsk_adr WHERE ((lista_wsk_adr.id_oferta = oferta.id) AND (lista_wsk_adr.id_zapotrzebowanie = zapotrzebowanie_nier_rodzaj.id_zapotrzebowanie))) = 0));


ALTER TABLE public.kojarzeniebazoweoferta_zapotrzebowanie OWNER TO postgres;

--
-- Name: kojarzeniebazowezapotrzebowanie_media; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW kojarzeniebazowezapotrzebowanie_media AS
    SELECT zapotrzebowanie_trans_rodzaj.id AS id_zapotrzebowanie_trans_rodzaj, (zapotrzebowanie_trans_rodzaj.cena)::double precision AS cena_zapotrzebowanie, media_nieruchomosc.id AS id_media_nieruchomosc, (media_nieruchomosc.cena)::double precision AS cena_media FROM ((zapotrzebowanie_nier_rodzaj JOIN zapotrzebowanie_trans_rodzaj ON ((zapotrzebowanie_nier_rodzaj.id = zapotrzebowanie_trans_rodzaj.id_zapotrzebowanie_nier_rodzaj))) JOIN media_nieruchomosc ON ((zapotrzebowanie_trans_rodzaj.id_trans_rodzaj = media_nieruchomosc.id_trans_rodzaj))) WHERE (((((zapotrzebowanie_nier_rodzaj.id_nier_rodzaj = media_nieruchomosc.id_nier_rodzaj) AND (media_nieruchomosc.oferent = true)) AND (media_nieruchomosc.id_status IN (SELECT status.id FROM status WHERE (((status.nazwa)::text = '_aktualna'::text) OR ((status.nazwa)::text = '_umowiona'::text))))) AND ((zapotrzebowanie_trans_rodzaj.cena)::text > (0)::text)) AND ((media_nieruchomosc.cena)::text > (0)::text));


ALTER TABLE public.kojarzeniebazowezapotrzebowanie_media OWNER TO postgres;

--
-- Name: kojarzeniebazowezapotrzebowanie_oferta; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW kojarzeniebazowezapotrzebowanie_oferta AS
    SELECT oferta.id AS id_oferta, zapotrzebowanie_nier_rodzaj.id_zapotrzebowanie, zapotrzebowanie_trans_rodzaj.id AS id_zapotrzebowanie_trans_rodzaj, (oferta.cena)::double precision AS cena_oferta, (zapotrzebowanie_trans_rodzaj.cena)::double precision AS cena_zapotrzebowanie FROM (((nieruchomosc JOIN oferta ON ((nieruchomosc.id = oferta.id_nieruchomosc))) JOIN zapotrzebowanie_trans_rodzaj ON ((oferta.id_rodz_trans = zapotrzebowanie_trans_rodzaj.id_trans_rodzaj))) JOIN zapotrzebowanie_nier_rodzaj ON ((zapotrzebowanie_trans_rodzaj.id_zapotrzebowanie_nier_rodzaj = zapotrzebowanie_nier_rodzaj.id))) WHERE (((((zapotrzebowanie_nier_rodzaj.id_nier_rodzaj = nieruchomosc.id_nier_rodzaj) AND (oferta.id_status = (SELECT status.id FROM status WHERE ((status.nazwa)::text = '_aktualna'::text)))) AND ((oferta.cena)::text > (0)::text)) AND ((zapotrzebowanie_trans_rodzaj.cena)::text > (0)::text)) AND ((SELECT count(lista_wsk_adr.id) AS count FROM lista_wsk_adr WHERE ((lista_wsk_adr.id_oferta = oferta.id) AND (lista_wsk_adr.id_zapotrzebowanie = zapotrzebowanie_nier_rodzaj.id_zapotrzebowanie))) = 0));


ALTER TABLE public.kojarzeniebazowezapotrzebowanie_oferta OWNER TO postgres;

--
-- Name: kon_m_nieruchomosc_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE kon_m_nieruchomosc_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.kon_m_nieruchomosc_id_seq OWNER TO postgres;

--
-- Name: kon_m_nieruchomosc_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE kon_m_nieruchomosc_id_seq OWNED BY kon_m_nieruchomosc.id;


--
-- Name: konto_agent; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE konto_agent (
    id integer NOT NULL,
    id_agent integer NOT NULL,
    id_bank integer NOT NULL,
    nr_konto character varying(26) NOT NULL
);


ALTER TABLE public.konto_agent OWNER TO postgres;

--
-- Name: konto_agent_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE konto_agent_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.konto_agent_id_seq OWNER TO postgres;

--
-- Name: konto_agent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE konto_agent_id_seq OWNED BY konto_agent.id;


--
-- Name: kredytowanie; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE kredytowanie (
    id integer NOT NULL,
    id_transakcja integer NOT NULL,
    id_bank integer NOT NULL,
    kwota character varying(15) NOT NULL
);


ALTER TABLE public.kredytowanie OWNER TO postgres;

--
-- Name: kredytowanie_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE kredytowanie_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.kredytowanie_id_seq OWNER TO postgres;

--
-- Name: kredytowanie_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE kredytowanie_id_seq OWNED BY kredytowanie.id;


--
-- Name: kurs; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE kurs (
    id integer NOT NULL,
    wartosc character varying(10) NOT NULL
);


ALTER TABLE public.kurs OWNER TO postgres;

--
-- Name: lang_tag; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE lang_tag (
    id integer NOT NULL,
    nazwa text NOT NULL
);


ALTER TABLE public.lang_tag OWNER TO postgres;

--
-- Name: lang_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE lang_tag_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.lang_tag_id_seq OWNER TO postgres;

--
-- Name: lang_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE lang_tag_id_seq OWNED BY lang_tag.id;


--
-- Name: lista_niechcianych; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE lista_niechcianych (
    id integer NOT NULL,
    nazwa character varying(30) NOT NULL
);


ALTER TABLE public.lista_niechcianych OWNER TO postgres;

--
-- Name: lista_niechcianych_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE lista_niechcianych_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.lista_niechcianych_id_seq OWNER TO postgres;

--
-- Name: lista_niechcianych_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE lista_niechcianych_id_seq OWNED BY lista_niechcianych.id;


--
-- Name: lista_param_nier; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE lista_param_nier (
    id integer NOT NULL,
    id_nier_rodzaj integer NOT NULL,
    id_parametr_nier integer NOT NULL,
    id_trans_rodzaj integer NOT NULL,
    waga integer,
    pokaz boolean
);


ALTER TABLE public.lista_param_nier OWNER TO postgres;

--
-- Name: lista_param_nier_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE lista_param_nier_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.lista_param_nier_id_seq OWNER TO postgres;

--
-- Name: lista_param_nier_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE lista_param_nier_id_seq OWNED BY lista_param_nier.id;


--
-- Name: lista_param_pom; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE lista_param_pom (
    id integer NOT NULL,
    id_pomieszczenie integer NOT NULL,
    id_parametr_pom integer NOT NULL
);


ALTER TABLE public.lista_param_pom OWNER TO postgres;

--
-- Name: lista_param_pom_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE lista_param_pom_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.lista_param_pom_id_seq OWNER TO postgres;

--
-- Name: lista_param_pom_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE lista_param_pom_id_seq OWNED BY lista_param_pom.id;


--
-- Name: lista_param_slow_nier; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE lista_param_slow_nier (
    id integer NOT NULL,
    id_nier_rodzaj integer NOT NULL,
    id_wyposazenie_nier integer NOT NULL,
    id_trans_rodzaj integer NOT NULL,
    waga integer,
    pokaz boolean
);


ALTER TABLE public.lista_param_slow_nier OWNER TO postgres;

--
-- Name: lista_param_slow_nier_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE lista_param_slow_nier_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.lista_param_slow_nier_id_seq OWNER TO postgres;

--
-- Name: lista_param_slow_nier_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE lista_param_slow_nier_id_seq OWNED BY lista_param_slow_nier.id;


--
-- Name: lista_param_slow_pom; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE lista_param_slow_pom (
    id integer NOT NULL,
    id_pomieszczenie integer NOT NULL,
    id_wyposazenie_pom integer NOT NULL
);


ALTER TABLE public.lista_param_slow_pom OWNER TO postgres;

--
-- Name: lista_param_slow_pom_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE lista_param_slow_pom_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.lista_param_slow_pom_id_seq OWNER TO postgres;

--
-- Name: lista_param_slow_pom_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE lista_param_slow_pom_id_seq OWNED BY lista_param_slow_pom.id;


--
-- Name: lista_wsk_adr_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE lista_wsk_adr_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.lista_wsk_adr_id_seq OWNER TO postgres;

--
-- Name: lista_wsk_adr_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE lista_wsk_adr_id_seq OWNED BY lista_wsk_adr.id;


--
-- Name: logowanieagent; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW logowanieagent AS
    SELECT agent.id, agent.id_otodom, agent.nazwa, agent.firma, agent."login", agent.haslo, agent.waznosc_haslo, agent.aktywnosc_konto, agent.wewnetrzny, agent.nip, agent.adres, agent.dodawanie, agent.edycja, agent.kasowanie, agent.druk, agent.adm_klient, agent.adm_dane, agent.zmiana_upr FROM agent;


ALTER TABLE public.logowanieagent OWNER TO postgres;

--
-- Name: mailing; Type: TABLE; Schema: public; Owner: azg; Tablespace: 
--

CREATE TABLE mailing (
    id integer DEFAULT nextval(('"mailing_id_seq"'::text)::regclass) NOT NULL,
    id_wojewodztwo integer NOT NULL,
    nazwa text,
    adres text,
    email text NOT NULL,
    zgoda boolean
);


ALTER TABLE public.mailing OWNER TO azg;

--
-- Name: mailing_id_seq; Type: SEQUENCE; Schema: public; Owner: azg
--

CREATE SEQUENCE mailing_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.mailing_id_seq OWNER TO azg;

--
-- Name: media_nieruchomosc_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE media_nieruchomosc_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.media_nieruchomosc_id_seq OWNER TO postgres;

--
-- Name: media_nieruchomosc_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE media_nieruchomosc_id_seq OWNED BY media_nieruchomosc.id;


--
-- Name: media_reklama_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE media_reklama_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.media_reklama_id_seq OWNER TO postgres;

--
-- Name: media_reklama_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE media_reklama_id_seq OWNED BY media_reklama.id;


--
-- Name: minuta_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE minuta_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.minuta_id_seq OWNER TO postgres;

--
-- Name: minuta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE minuta_id_seq OWNED BY minuta.id;


--
-- Name: nier_rodzaj_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE nier_rodzaj_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.nier_rodzaj_id_seq OWNER TO postgres;

--
-- Name: nier_rodzaj_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE nier_rodzaj_id_seq OWNED BY nier_rodzaj.id;


--
-- Name: nieruchomosc_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE nieruchomosc_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.nieruchomosc_id_seq OWNER TO postgres;

--
-- Name: nieruchomosc_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE nieruchomosc_id_seq OWNED BY nieruchomosc.id;


--
-- Name: oferta_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE oferta_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.oferta_id_seq OWNER TO postgres;

--
-- Name: oferta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE oferta_id_seq OWNED BY oferta.id;


--
-- Name: rodz_nier_szczeg; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE rodz_nier_szczeg (
    id integer NOT NULL,
    id_nier_rodzaj integer NOT NULL,
    nazwa character varying(30) NOT NULL
);


ALTER TABLE public.rodz_nier_szczeg OWNER TO postgres;

--
-- Name: ofertagablota; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW ofertagablota AS
    SELECT oferta.id AS id_oferta, oferta.id_rodz_trans AS id_trans_rodzaj, oferta.id_status, oferta.cena, oferta.wylacznosc, nieruchomosc.id_nier_rodzaj, nieruchomosc.ulica_net AS lokalizacja, nieruchomosc.rynek_pierw, nieruchomosc.id AS id_nieruchomosc, nieruchomosc.id_agent, rodz_nier_szczeg.nazwa AS rodzaj_budynek FROM ((oferta JOIN nieruchomosc ON ((oferta.id_nieruchomosc = nieruchomosc.id))) JOIN rodz_nier_szczeg ON ((nieruchomosc.id_rodz_nier_szcz = rodz_nier_szczeg.id)));


ALTER TABLE public.ofertagablota OWNER TO postgres;

--
-- Name: ofertanowosc; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW ofertanowosc AS
    SELECT DISTINCT oferta.id AS id_oferta, cena1.data, nieruchomosc.id AS id_nieruchomosc, nieruchomosc.ulica_net AS lokalizacja, nieruchomosc.id_nier_rodzaj, oferta.id_rodz_trans, nier_rodzaj.nazwa AS nieruchomosc_rodzaj, trans_rodzaj.nazwa AS transakcja_rodzaj FROM ((((cena cena1 JOIN oferta ON ((oferta.id = cena1.id_oferta))) JOIN nieruchomosc ON ((oferta.id_nieruchomosc = nieruchomosc.id))) JOIN nier_rodzaj ON ((nieruchomosc.id_nier_rodzaj = nier_rodzaj.id))) JOIN trans_rodzaj ON ((oferta.id_rodz_trans = trans_rodzaj.id))) WHERE (((oferta.pokaz = true) AND (cena1.id = (SELECT max(cena.id) AS max FROM cena WHERE (cena.id_oferta = cena1.id_oferta)))) AND (oferta.id_status IN (SELECT status.id FROM status WHERE (((status.nazwa)::text = '_aktualna'::text) OR ((status.nazwa)::text = '_umowiona'::text))))) ORDER BY oferta.id, cena1.data, nieruchomosc.id, nieruchomosc.ulica_net, nieruchomosc.id_nier_rodzaj, oferta.id_rodz_trans, nier_rodzaj.nazwa, trans_rodzaj.nazwa;


ALTER TABLE public.ofertanowosc OWNER TO postgres;

--
-- Name: ofertapelnedane; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW ofertapelnedane AS
    SELECT oferta.id AS id_oferta, oferta.cena, oferta.wylacznosc, nieruchomosc.id_region_geog, nieruchomosc.ulica_net AS lokalizacja, status.nazwa AS status, nieruchomosc.id AS id_nieruchomosc, agent.id AS id_agent, agent.telefon, agent.komorka, agent.email, nieruchomosc.id_rodz_nier_szcz, nier_rodzaj.nazwa AS nieruchomosc_rodzaj, trans_rodzaj.nazwa AS transakcja_rodzaj, oferta.czas_przekazania, oferta.przek_od_otwarcia, oferta.data_otw_zlecenie, nieruchomosc.rynek_pierw FROM (((((oferta JOIN nieruchomosc ON ((oferta.id_nieruchomosc = nieruchomosc.id))) JOIN status ON ((oferta.id_status = status.id))) JOIN agent ON ((nieruchomosc.id_agent = agent.id))) JOIN nier_rodzaj ON ((nieruchomosc.id_nier_rodzaj = nier_rodzaj.id))) JOIN trans_rodzaj ON ((oferta.id_rodz_trans = trans_rodzaj.id)));


ALTER TABLE public.ofertapelnedane OWNER TO postgres;

--
-- Name: ofertapodsdane; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW ofertapodsdane AS
    SELECT oferta.id AS id_oferta, oferta.id_rodz_trans AS id_trans_rodzaj, oferta.id_status, oferta.data_otw_zlecenie, oferta.cena, oferta.wylacznosc, nieruchomosc.id_nier_rodzaj, nieruchomosc.id_region_geog, nieruchomosc.ulica_net AS lokalizacja, status.nazwa AS status, nieruchomosc.id AS id_nieruchomosc, nieruchomosc.id_rodz_nier_szcz FROM ((oferta JOIN nieruchomosc ON ((oferta.id_nieruchomosc = nieruchomosc.id))) JOIN status ON ((oferta.id_status = status.id))) WHERE (oferta.pokaz = true);


ALTER TABLE public.ofertapodsdane OWNER TO postgres;

--
-- Name: opis_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE opis_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.opis_id_seq OWNER TO postgres;

--
-- Name: opis_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE opis_id_seq OWNED BY opis.id;


--
-- Name: opis_nieruchomosc_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE opis_nieruchomosc_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.opis_nieruchomosc_id_seq OWNER TO postgres;

--
-- Name: opis_nieruchomosc_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE opis_nieruchomosc_id_seq OWNED BY opis_nieruchomosc.id;


--
-- Name: opis_posz_zapotrzebowanie_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE opis_posz_zapotrzebowanie_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.opis_posz_zapotrzebowanie_id_seq OWNER TO postgres;

--
-- Name: opis_posz_zapotrzebowanie_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE opis_posz_zapotrzebowanie_id_seq OWNED BY opis_posz_zapotrzebowanie.id;


--
-- Name: opis_wew_zapotrzebowanie_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE opis_wew_zapotrzebowanie_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.opis_wew_zapotrzebowanie_id_seq OWNER TO postgres;

--
-- Name: opis_wew_zapotrzebowanie_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE opis_wew_zapotrzebowanie_id_seq OWNED BY opis_wew_zapotrzebowanie.id;


--
-- Name: opis_zapotrzebowanie_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE opis_zapotrzebowanie_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.opis_zapotrzebowanie_id_seq OWNER TO postgres;

--
-- Name: opis_zapotrzebowanie_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE opis_zapotrzebowanie_id_seq OWNED BY opis_zapotrzebowanie.id;


--
-- Name: osoba_dowod_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE osoba_dowod_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.osoba_dowod_id_seq OWNER TO postgres;

--
-- Name: osoba_dowod_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE osoba_dowod_id_seq OWNED BY osoba_dowod.id;


--
-- Name: osoba_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE osoba_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.osoba_id_seq OWNER TO postgres;

--
-- Name: osoba_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE osoba_id_seq OWNED BY osoba.id;


--
-- Name: osoba_klient_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE osoba_klient_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.osoba_klient_id_seq OWNER TO postgres;

--
-- Name: osoba_klient_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE osoba_klient_id_seq OWNED BY osoba_klient.id;


--
-- Name: osoba_kon_bank; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE osoba_kon_bank (
    id integer NOT NULL,
    id_imie integer NOT NULL,
    nazwisko character varying(30) NOT NULL,
    id_bank integer NOT NULL
);


ALTER TABLE public.osoba_kon_bank OWNER TO postgres;

--
-- Name: osoba_kon_bank_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE osoba_kon_bank_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.osoba_kon_bank_id_seq OWNER TO postgres;

--
-- Name: osoba_kon_bank_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE osoba_kon_bank_id_seq OWNED BY osoba_kon_bank.id;


--
-- Name: osoba_lista_wsk_adr_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE osoba_lista_wsk_adr_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.osoba_lista_wsk_adr_id_seq OWNER TO postgres;

--
-- Name: osoba_lista_wsk_adr_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE osoba_lista_wsk_adr_id_seq OWNED BY osoba_lista_wsk_adr.id;


--
-- Name: osoba_oferta_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE osoba_oferta_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.osoba_oferta_id_seq OWNER TO postgres;

--
-- Name: osoba_oferta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE osoba_oferta_id_seq OWNED BY osoba_oferta.id;


--
-- Name: osoba_zapotrzebowanie_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE osoba_zapotrzebowanie_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.osoba_zapotrzebowanie_id_seq OWNER TO postgres;

--
-- Name: osoba_zapotrzebowanie_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE osoba_zapotrzebowanie_id_seq OWNED BY osoba_zapotrzebowanie.id;


--
-- Name: osobalistawsk; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW osobalistawsk AS
    SELECT lista_wsk_adr.id_oferta, lista_wsk_adr.id_zapotrzebowanie, osoba_lista_wsk_adr.id_osoba FROM (osoba_lista_wsk_adr JOIN lista_wsk_adr ON ((osoba_lista_wsk_adr.id_lista_wsk_adr = lista_wsk_adr.id)));


ALTER TABLE public.osobalistawsk OWNER TO postgres;

--
-- Name: osobowosc; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE osobowosc (
    id integer NOT NULL,
    nazwa character varying(25) NOT NULL
);


ALTER TABLE public.osobowosc OWNER TO postgres;

--
-- Name: osobowosc_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE osobowosc_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.osobowosc_id_seq OWNER TO postgres;

--
-- Name: osobowosc_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE osobowosc_id_seq OWNED BY osobowosc.id;


--
-- Name: otodom_wysylka_id_seq; Type: SEQUENCE; Schema: public; Owner: azg
--

CREATE SEQUENCE otodom_wysylka_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.otodom_wysylka_id_seq OWNER TO azg;

--
-- Name: param_nier_strona; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE param_nier_strona (
    id integer NOT NULL,
    id_nier_rodzaj integer NOT NULL,
    id_parametr_nier integer NOT NULL,
    id_trans_rodzaj integer NOT NULL
);


ALTER TABLE public.param_nier_strona OWNER TO postgres;

--
-- Name: param_nier_strona_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE param_nier_strona_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.param_nier_strona_id_seq OWNER TO postgres;

--
-- Name: param_nier_strona_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE param_nier_strona_id_seq OWNED BY param_nier_strona.id;


--
-- Name: parametr_nier; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE parametr_nier (
    id integer NOT NULL,
    id_sekcja integer NOT NULL,
    id_walidacja integer NOT NULL,
    waga integer NOT NULL,
    nazwa character varying(40) NOT NULL,
    dl_inf integer
);


ALTER TABLE public.parametr_nier OWNER TO postgres;

--
-- Name: parametr_nier_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE parametr_nier_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.parametr_nier_id_seq OWNER TO postgres;

--
-- Name: parametr_nier_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE parametr_nier_id_seq OWNED BY parametr_nier.id;


--
-- Name: parametr_pom; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE parametr_pom (
    id integer NOT NULL,
    id_sekcja integer NOT NULL,
    id_walidacja integer NOT NULL,
    waga integer NOT NULL,
    nazwa character varying(40) NOT NULL,
    dl_inf integer
);


ALTER TABLE public.parametr_pom OWNER TO postgres;

--
-- Name: parametr_pom_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE parametr_pom_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.parametr_pom_id_seq OWNER TO postgres;

--
-- Name: parametr_pom_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE parametr_pom_id_seq OWNED BY parametr_pom.id;


--
-- Name: walidacja; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE walidacja (
    id integer NOT NULL,
    nazwa character varying(20) NOT NULL
);


ALTER TABLE public.walidacja OWNER TO postgres;

--
-- Name: paramniertrans; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW paramniertrans AS
    SELECT lista_param_nier.id_parametr_nier AS id, lista_param_nier.id_nier_rodzaj, lista_param_nier.id_trans_rodzaj, parametr_nier.id_sekcja, walidacja.nazwa AS nazwa_walidacja, parametr_nier.nazwa, parametr_nier.dl_inf FROM ((lista_param_nier JOIN parametr_nier ON ((lista_param_nier.id_parametr_nier = parametr_nier.id))) JOIN walidacja ON ((parametr_nier.id_walidacja = walidacja.id)));


ALTER TABLE public.paramniertrans OWNER TO postgres;

--
-- Name: pomieszczenie; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE pomieszczenie (
    id integer NOT NULL,
    waga integer,
    nazwa character varying(30) NOT NULL
);


ALTER TABLE public.pomieszczenie OWNER TO postgres;

--
-- Name: parampomnier; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW parampomnier AS
    SELECT pomieszczenie.id AS id_pomieszczenie, parametr_pom.id, parametr_pom.nazwa, walidacja.nazwa AS nazwa_walidacja, parametr_pom.dl_inf FROM (((pomieszczenie JOIN lista_param_pom ON ((pomieszczenie.id = lista_param_pom.id_pomieszczenie))) JOIN parametr_pom ON ((lista_param_pom.id_parametr_pom = parametr_pom.id))) JOIN walidacja ON ((parametr_pom.id_walidacja = walidacja.id)));


ALTER TABLE public.parampomnier OWNER TO postgres;

--
-- Name: podajdanelistawskadr; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW podajdanelistawskadr AS
    SELECT oferta.id AS id_oferta, zapotrzebowanie.id AS id_zapotrzebowanie, nieruchomosc.id AS id_nieruchomosc, agent.nazwa_pot AS agent, oferta.cena, nier_rodzaj.nazwa AS nieruchomosc_rodzaj, trans_rodzaj.nazwa AS transakcja_rodzaj, nieruchomosc.ulica, ((((((lista_wsk_adr.ogladanie_data)::text || ' '::text) || (godzina.nazwa)::text) || ':'::text) || (minuta.nazwa)::text))::timestamp without time zone AS ogladanie_data FROM ((((((((lista_wsk_adr JOIN agent ON ((lista_wsk_adr.id_agent = agent.id))) JOIN zapotrzebowanie ON ((lista_wsk_adr.id_zapotrzebowanie = zapotrzebowanie.id))) JOIN oferta ON ((lista_wsk_adr.id_oferta = oferta.id))) JOIN nieruchomosc ON ((oferta.id_nieruchomosc = nieruchomosc.id))) JOIN nier_rodzaj ON ((nieruchomosc.id_nier_rodzaj = nier_rodzaj.id))) JOIN trans_rodzaj ON ((oferta.id_rodz_trans = trans_rodzaj.id))) JOIN godzina ON ((lista_wsk_adr.ogladanie_godzina = godzina.id))) JOIN minuta ON ((lista_wsk_adr.ogladanie_minuta = minuta.id))) ORDER BY ((((((lista_wsk_adr.ogladanie_data)::text || ' '::text) || (godzina.nazwa)::text) || ':'::text) || (minuta.nazwa)::text))::timestamp without time zone;


ALTER TABLE public.podajdanelistawskadr OWNER TO postgres;

--
-- Name: podajdaneumowakupno; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW podajdaneumowakupno AS
    SELECT zapotrzebowanie.id AS id_zapotrzebowanie, zapotrzebowanie.id_klient, zapotrzebowanie.data_otw_zlecenie AS data, agent_f.nazwa AS agent, agent.komorka AS komorka_agent, osoba_zapotrzebowanie.id_osoba, klient.id_osobowosc, osobowosc.nazwa AS osobowosc, osobaview.imie, osobaview.nazwisko, osobaview.nazwisko_rodowe, osobaview.pesel, osobaview.telefon, osobaview.komorka FROM ((((((zapotrzebowanie JOIN agentwersjaoficjalna(1) agent_f(id, nazwa) ON ((zapotrzebowanie.id_agent = agent_f.id))) JOIN agent ON ((zapotrzebowanie.id_agent = agent.id))) JOIN osoba_zapotrzebowanie ON ((zapotrzebowanie.id = osoba_zapotrzebowanie.id_zapotrzebowanie))) JOIN klient ON ((zapotrzebowanie.id_klient = klient.id))) JOIN osobowosc ON ((klient.id_osobowosc = osobowosc.id))) JOIN osobaview ON ((osoba_zapotrzebowanie.id_osoba = osobaview.id_osoba)));


ALTER TABLE public.podajdaneumowakupno OWNER TO postgres;

--
-- Name: pomieszczenie_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pomieszczenie_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.pomieszczenie_id_seq OWNER TO postgres;

--
-- Name: pomieszczenie_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE pomieszczenie_id_seq OWNED BY pomieszczenie.id;


--
-- Name: pomieszczenie_nier; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE pomieszczenie_nier (
    id integer NOT NULL,
    id_nier_rodzaj integer NOT NULL,
    id_pomieszczenie integer NOT NULL
);


ALTER TABLE public.pomieszczenie_nier OWNER TO postgres;

--
-- Name: pomieszczenie_nier_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pomieszczenie_nier_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.pomieszczenie_nier_id_seq OWNER TO postgres;

--
-- Name: pomieszczenie_nier_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE pomieszczenie_nier_id_seq OWNED BY pomieszczenie_nier.id;


--
-- Name: pomieszczenie_przyn_nier; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE pomieszczenie_przyn_nier (
    id integer NOT NULL,
    id_nieruchomosc integer NOT NULL,
    id_pomieszczenie integer NOT NULL,
    nr_pomieszczenia integer NOT NULL
);


ALTER TABLE public.pomieszczenie_przyn_nier OWNER TO postgres;

--
-- Name: pomieszczenie_przyn_nier_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pomieszczenie_przyn_nier_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.pomieszczenie_przyn_nier_id_seq OWNER TO postgres;

--
-- Name: pomieszczenie_przyn_nier_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE pomieszczenie_przyn_nier_id_seq OWNED BY pomieszczenie_przyn_nier.id;


--
-- Name: portal; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE portal (
    id integer NOT NULL,
    nazwa character varying(20) NOT NULL
);


ALTER TABLE public.portal OWNER TO postgres;

--
-- Name: portal_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE portal_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.portal_id_seq OWNER TO postgres;

--
-- Name: portal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE portal_id_seq OWNED BY portal.id;


--
-- Name: portal_wys; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE portal_wys (
    id integer NOT NULL,
    id_oferta integer NOT NULL,
    id_portal integer NOT NULL,
    portal_ins_id integer,
    data_wys date NOT NULL,
    data_wyg date NOT NULL,
    is_active boolean
);


ALTER TABLE public.portal_wys OWNER TO postgres;

--
-- Name: portal_wys_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE portal_wys_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.portal_wys_id_seq OWNER TO postgres;

--
-- Name: portal_wys_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE portal_wys_id_seq OWNED BY portal_wys.id;


--
-- Name: precyzja_kojarzenie; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE precyzja_kojarzenie (
    id integer NOT NULL,
    nazwa text NOT NULL,
    baza text NOT NULL,
    krok text NOT NULL
);


ALTER TABLE public.precyzja_kojarzenie OWNER TO postgres;

--
-- Name: precyzja_kojarzenie_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE precyzja_kojarzenie_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.precyzja_kojarzenie_id_seq OWNER TO postgres;

--
-- Name: precyzja_kojarzenie_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE precyzja_kojarzenie_id_seq OWNED BY precyzja_kojarzenie.id;


--
-- Name: priorytet_reklama; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE priorytet_reklama (
    id integer NOT NULL,
    nazwa text
);


ALTER TABLE public.priorytet_reklama OWNER TO postgres;

--
-- Name: priorytet_reklama_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE priorytet_reklama_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.priorytet_reklama_id_seq OWNER TO postgres;

--
-- Name: priorytet_reklama_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE priorytet_reklama_id_seq OWNED BY priorytet_reklama.id;


--
-- Name: prowizja_zapotrzebowanie_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE prowizja_zapotrzebowanie_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.prowizja_zapotrzebowanie_id_seq OWNER TO postgres;

--
-- Name: prowizja_zapotrzebowanie_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE prowizja_zapotrzebowanie_id_seq OWNED BY prowizja_zapotrzebowanie.id;


--
-- Name: region_geog_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE region_geog_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.region_geog_id_seq OWNER TO postgres;

--
-- Name: region_geog_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE region_geog_id_seq OWNED BY region_geog.id;


--
-- Name: rejestracja_nto; Type: TABLE; Schema: public; Owner: azg; Tablespace: 
--

CREATE TABLE rejestracja_nto (
    id integer DEFAULT nextval(('"rejestracja_nto_id_seq"'::text)::regclass) NOT NULL,
    adres_ip text,
    data_odwiedzin timestamp without time zone,
    port_klient integer,
    sposob_odwiedzin text,
    przegladarka text
);


ALTER TABLE public.rejestracja_nto OWNER TO azg;

--
-- Name: rejestracja_nto_id_seq; Type: SEQUENCE; Schema: public; Owner: azg
--

CREATE SEQUENCE rejestracja_nto_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.rejestracja_nto_id_seq OWNER TO azg;

--
-- Name: reklama_nieruchomosc_m_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE reklama_nieruchomosc_m_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.reklama_nieruchomosc_m_id_seq OWNER TO postgres;

--
-- Name: reklama_nieruchomosc_m_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE reklama_nieruchomosc_m_id_seq OWNED BY reklama_nieruchomosc_m.id;


--
-- Name: rekord_nieakt_lista_wsk_adr; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE rekord_nieakt_lista_wsk_adr (
    id integer NOT NULL,
    id_agent integer NOT NULL,
    data timestamp without time zone
);


ALTER TABLE public.rekord_nieakt_lista_wsk_adr OWNER TO postgres;

--
-- Name: rodz_nier_szczeg_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE rodz_nier_szczeg_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.rodz_nier_szczeg_id_seq OWNER TO postgres;

--
-- Name: rodz_nier_szczeg_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE rodz_nier_szczeg_id_seq OWNED BY rodz_nier_szczeg.id;


--
-- Name: rodzaj_dowod_tozsamosc_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE rodzaj_dowod_tozsamosc_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.rodzaj_dowod_tozsamosc_id_seq OWNER TO postgres;

--
-- Name: rodzaj_dowod_tozsamosc_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE rodzaj_dowod_tozsamosc_id_seq OWNED BY rodzaj_dowod_tozsamosc.id;


--
-- Name: rodzaj_nieruchomosci_id_seq; Type: SEQUENCE; Schema: public; Owner: azg
--

CREATE SEQUENCE rodzaj_nieruchomosci_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.rodzaj_nieruchomosci_id_seq OWNER TO azg;

--
-- Name: rozmowa_przychodzaca; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE rozmowa_przychodzaca (
    id integer NOT NULL,
    nr_telefon text NOT NULL,
    id_status_dzwonienie integer NOT NULL,
    id_agent integer NOT NULL,
    polaczenie_zakonczone boolean DEFAULT false,
    czas_poczatek timestamp without time zone,
    czas_koniec timestamp without time zone
);


ALTER TABLE public.rozmowa_przychodzaca OWNER TO postgres;

--
-- Name: rozmowa_przychodzaca_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE rozmowa_przychodzaca_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.rozmowa_przychodzaca_id_seq OWNER TO postgres;

--
-- Name: rozmowa_przychodzaca_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE rozmowa_przychodzaca_id_seq OWNED BY rozmowa_przychodzaca.id;


--
-- Name: sekcja; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE sekcja (
    id integer NOT NULL,
    nazwa character varying(40) NOT NULL
);


ALTER TABLE public.sekcja OWNER TO postgres;

--
-- Name: sekcja_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sekcja_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.sekcja_id_seq OWNER TO postgres;

--
-- Name: sekcja_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE sekcja_id_seq OWNED BY sekcja.id;


--
-- Name: sposob_finansowania_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sposob_finansowania_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.sposob_finansowania_id_seq OWNER TO postgres;

--
-- Name: sposob_finansowania_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE sposob_finansowania_id_seq OWNED BY sposob_finansowania.id;


--
-- Name: spotkanie_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spotkanie_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.spotkanie_id_seq OWNER TO postgres;

--
-- Name: spotkanie_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spotkanie_id_seq OWNED BY spotkanie.id;


--
-- Name: spotkanie_os_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE spotkanie_os_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.spotkanie_os_id_seq OWNER TO postgres;

--
-- Name: spotkanie_os_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE spotkanie_os_id_seq OWNED BY spotkanie_os.id;


--
-- Name: status_dzwonienie; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE status_dzwonienie (
    id integer NOT NULL,
    nazwa text NOT NULL
);


ALTER TABLE public.status_dzwonienie OWNER TO postgres;

--
-- Name: status_dzwonienie_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE status_dzwonienie_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.status_dzwonienie_id_seq OWNER TO postgres;

--
-- Name: status_dzwonienie_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE status_dzwonienie_id_seq OWNED BY status_dzwonienie.id;


--
-- Name: status_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE status_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.status_id_seq OWNER TO postgres;

--
-- Name: status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE status_id_seq OWNED BY status.id;


--
-- Name: sub_id_zg_seq; Type: SEQUENCE; Schema: public; Owner: azg
--

CREATE SEQUENCE sub_id_zg_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.sub_id_zg_seq OWNER TO azg;

--
-- Name: subskrypcja; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE subskrypcja (
    id integer NOT NULL,
    id_nier_rodzaj integer NOT NULL,
    id_trans_rodzaj integer NOT NULL,
    id_jezyk integer DEFAULT 1 NOT NULL,
    cena_min double precision,
    cena_max double precision,
    email text,
    data date
);


ALTER TABLE public.subskrypcja OWNER TO postgres;

--
-- Name: subskrypcja_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE subskrypcja_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.subskrypcja_id_seq OWNER TO postgres;

--
-- Name: subskrypcja_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE subskrypcja_id_seq OWNED BY subskrypcja.id;


--
-- Name: telefon_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE telefon_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.telefon_id_seq OWNER TO postgres;

--
-- Name: telefon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE telefon_id_seq OWNED BY telefon.id;


--
-- Name: telefon_media_nieruchomosc_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE telefon_media_nieruchomosc_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.telefon_media_nieruchomosc_id_seq OWNER TO postgres;

--
-- Name: telefon_media_nieruchomosc_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE telefon_media_nieruchomosc_id_seq OWNED BY telefon_media_nieruchomosc.id;


--
-- Name: telefon_niechciany; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE telefon_niechciany (
    id integer NOT NULL,
    id_lista_niechcianych integer NOT NULL,
    nazwa character varying(13) NOT NULL,
    opis character varying(50)
);


ALTER TABLE public.telefon_niechciany OWNER TO postgres;

--
-- Name: telefon_niechciany_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE telefon_niechciany_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.telefon_niechciany_id_seq OWNER TO postgres;

--
-- Name: telefon_niechciany_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE telefon_niechciany_id_seq OWNED BY telefon_niechciany.id;


--
-- Name: telefon_os_bank; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE telefon_os_bank (
    id integer NOT NULL,
    id_osoba_kon_bank integer NOT NULL,
    nazwa character varying(9) NOT NULL
);


ALTER TABLE public.telefon_os_bank OWNER TO postgres;

--
-- Name: telefon_os_bank_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE telefon_os_bank_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.telefon_os_bank_id_seq OWNER TO postgres;

--
-- Name: telefon_os_bank_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE telefon_os_bank_id_seq OWNED BY telefon_os_bank.id;


--
-- Name: tlumaczenie; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tlumaczenie (
    id integer NOT NULL,
    nazwa_lang_tag text NOT NULL,
    id_jezyk integer NOT NULL,
    nazwa text NOT NULL
);


ALTER TABLE public.tlumaczenie OWNER TO postgres;

--
-- Name: tlumaczenie_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tlumaczenie_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.tlumaczenie_id_seq OWNER TO postgres;

--
-- Name: tlumaczenie_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tlumaczenie_id_seq OWNED BY tlumaczenie.id;


--
-- Name: trans_rodzaj_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE trans_rodzaj_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.trans_rodzaj_id_seq OWNER TO postgres;

--
-- Name: trans_rodzaj_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE trans_rodzaj_id_seq OWNED BY trans_rodzaj.id;


--
-- Name: transakcja; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE transakcja (
    id integer NOT NULL,
    id_wlasciciel integer NOT NULL,
    id_nabywca integer NOT NULL,
    id_oferta integer NOT NULL,
    id_nieruchomosc integer NOT NULL,
    id_lista_wsk_adr integer NOT NULL,
    data_umowa_przed date NOT NULL,
    data_umowa_notar date,
    termin_notar date,
    zdanie_nier date,
    zadatek_w character varying(7),
    zadatek_n character varying(7),
    prowizja_w character varying(5),
    prowizja_n character varying(5),
    kredyt boolean,
    finalizacja boolean,
    cena character varying(15)
);


ALTER TABLE public.transakcja OWNER TO postgres;

--
-- Name: transakcja_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE transakcja_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.transakcja_id_seq OWNER TO postgres;

--
-- Name: transakcja_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE transakcja_id_seq OWNED BY transakcja.id;


--
-- Name: transakcja_nier; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE transakcja_nier (
    id integer NOT NULL,
    id_trans_rodzaj integer NOT NULL,
    id_nier_rodzaj integer NOT NULL,
    typ_of_otodom text
);


ALTER TABLE public.transakcja_nier OWNER TO postgres;

--
-- Name: transakcja_nier_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE transakcja_nier_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.transakcja_nier_id_seq OWNER TO postgres;

--
-- Name: transakcja_nier_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE transakcja_nier_id_seq OWNED BY transakcja_nier.id;


--
-- Name: umowienie_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE umowienie_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.umowienie_id_seq OWNER TO postgres;

--
-- Name: umowienie_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE umowienie_id_seq OWNED BY umowienie.id;


--
-- Name: ustalenia_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE ustalenia_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.ustalenia_id_seq OWNER TO postgres;

--
-- Name: ustalenia_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE ustalenia_id_seq OWNED BY ustalenia.id;


--
-- Name: walidacja_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE walidacja_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.walidacja_id_seq OWNER TO postgres;

--
-- Name: walidacja_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE walidacja_id_seq OWNED BY walidacja.id;


--
-- Name: waluta; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE waluta (
    id integer NOT NULL,
    nazwa character varying(20) NOT NULL,
    skrot character varying(10) NOT NULL
);


ALTER TABLE public.waluta OWNER TO postgres;

--
-- Name: waluta_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE waluta_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.waluta_id_seq OWNER TO postgres;

--
-- Name: waluta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE waluta_id_seq OWNED BY waluta.id;


--
-- Name: wlasciciel_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE wlasciciel_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.wlasciciel_id_seq OWNER TO postgres;

--
-- Name: wlasciciel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE wlasciciel_id_seq OWNED BY wlasciciel.id;


--
-- Name: wypos_nier_strona; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE wypos_nier_strona (
    id integer NOT NULL,
    id_nier_rodzaj integer NOT NULL,
    id_wyposazenie_nier integer NOT NULL,
    id_trans_rodzaj integer NOT NULL
);


ALTER TABLE public.wypos_nier_strona OWNER TO postgres;

--
-- Name: wypos_nier_strona_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE wypos_nier_strona_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.wypos_nier_strona_id_seq OWNER TO postgres;

--
-- Name: wypos_nier_strona_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE wypos_nier_strona_id_seq OWNED BY wypos_nier_strona.id;


--
-- Name: wyposazenie_nier; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE wyposazenie_nier (
    id integer NOT NULL,
    id_parent integer,
    wielokrotne boolean,
    ma_dzieci boolean,
    waga integer NOT NULL,
    id_sekcja integer NOT NULL,
    nazwa character varying(60) NOT NULL
);


ALTER TABLE public.wyposazenie_nier OWNER TO postgres;

--
-- Name: wyposazenie_nier_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE wyposazenie_nier_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.wyposazenie_nier_id_seq OWNER TO postgres;

--
-- Name: wyposazenie_nier_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE wyposazenie_nier_id_seq OWNED BY wyposazenie_nier.id;


--
-- Name: wyposazenie_pom; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE wyposazenie_pom (
    id integer NOT NULL,
    id_parent integer,
    wielokrotne boolean,
    ma_dzieci boolean,
    waga integer NOT NULL,
    id_sekcja integer NOT NULL,
    nazwa character varying(60) NOT NULL
);


ALTER TABLE public.wyposazenie_pom OWNER TO postgres;

--
-- Name: wyposazenie_pom_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE wyposazenie_pom_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.wyposazenie_pom_id_seq OWNER TO postgres;

--
-- Name: wyposazenie_pom_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE wyposazenie_pom_id_seq OWNED BY wyposazenie_pom.id;


--
-- Name: wyposniertrans; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW wyposniertrans AS
    SELECT lista_param_slow_nier.id_wyposazenie_nier AS id, lista_param_slow_nier.id_nier_rodzaj, lista_param_slow_nier.id_trans_rodzaj, wyposazenie_nier.id_sekcja, wyposazenie_nier.ma_dzieci, wyposazenie_nier.nazwa FROM (lista_param_slow_nier JOIN wyposazenie_nier ON ((lista_param_slow_nier.id_wyposazenie_nier = wyposazenie_nier.id)));


ALTER TABLE public.wyposniertrans OWNER TO postgres;

--
-- Name: wypospomnier; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW wypospomnier AS
    SELECT pomieszczenie.id AS id_pomieszczenie, wyposazenie_pom.id, wyposazenie_pom.id_parent, wyposazenie_pom.wielokrotne, wyposazenie_pom.ma_dzieci, wyposazenie_pom.nazwa FROM ((pomieszczenie JOIN lista_param_slow_pom ON ((pomieszczenie.id = lista_param_slow_pom.id_pomieszczenie))) JOIN wyposazenie_pom ON ((lista_param_slow_pom.id_wyposazenie_pom = wyposazenie_pom.id)));


ALTER TABLE public.wypospomnier OWNER TO postgres;

--
-- Name: wysylka_ofert_zapotrzebowanie_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE wysylka_ofert_zapotrzebowanie_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.wysylka_ofert_zapotrzebowanie_id_seq OWNER TO postgres;

--
-- Name: wysylka_ofert_zapotrzebowanie_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE wysylka_ofert_zapotrzebowanie_id_seq OWNED BY wysylka_ofert_zapotrzebowanie.id;


--
-- Name: zamiana; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE zamiana (
    id integer NOT NULL,
    id_oferta integer NOT NULL,
    id_zapotrzebowanie integer NOT NULL
);


ALTER TABLE public.zamiana OWNER TO postgres;

--
-- Name: zamiana_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE zamiana_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.zamiana_id_seq OWNER TO postgres;

--
-- Name: zamiana_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE zamiana_id_seq OWNED BY zamiana.id;


--
-- Name: zap_lokaliz_nier; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE zap_lokaliz_nier (
    id integer NOT NULL,
    id_zapotrzebowanie_trans_rodzaj integer NOT NULL,
    id_region_geog integer NOT NULL
);


ALTER TABLE public.zap_lokaliz_nier OWNER TO postgres;

--
-- Name: zap_lokaliz_nier_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE zap_lokaliz_nier_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.zap_lokaliz_nier_id_seq OWNER TO postgres;

--
-- Name: zap_lokaliz_nier_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE zap_lokaliz_nier_id_seq OWNED BY zap_lokaliz_nier.id;


--
-- Name: zap_szcz_nier; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE zap_szcz_nier (
    id integer NOT NULL,
    id_zapotrzebowanie_trans_rodzaj integer NOT NULL,
    id_rodz_nier_szcz integer NOT NULL
);


ALTER TABLE public.zap_szcz_nier OWNER TO postgres;

--
-- Name: zap_szcz_nier_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE zap_szcz_nier_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.zap_szcz_nier_id_seq OWNER TO postgres;

--
-- Name: zap_szcz_nier_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE zap_szcz_nier_id_seq OWNED BY zap_szcz_nier.id;


--
-- Name: zapotrzebowanie_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE zapotrzebowanie_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.zapotrzebowanie_id_seq OWNER TO postgres;

--
-- Name: zapotrzebowanie_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE zapotrzebowanie_id_seq OWNED BY zapotrzebowanie.id;


--
-- Name: zapotrzebowanie_nier_rodzaj_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE zapotrzebowanie_nier_rodzaj_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.zapotrzebowanie_nier_rodzaj_id_seq OWNER TO postgres;

--
-- Name: zapotrzebowanie_nier_rodzaj_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE zapotrzebowanie_nier_rodzaj_id_seq OWNED BY zapotrzebowanie_nier_rodzaj.id;


--
-- Name: zapotrzebowanie_trans_rodzaj_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE zapotrzebowanie_trans_rodzaj_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.zapotrzebowanie_trans_rodzaj_id_seq OWNER TO postgres;

--
-- Name: zapotrzebowanie_trans_rodzaj_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE zapotrzebowanie_trans_rodzaj_id_seq OWNED BY zapotrzebowanie_trans_rodzaj.id;


--
-- Name: zdjecie; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE zdjecie (
    id integer NOT NULL,
    id_nieruchomosc integer NOT NULL,
    nazwa character varying(40) NOT NULL,
    nazwa_old text
);


ALTER TABLE public.zdjecie OWNER TO postgres;

--
-- Name: zdjecie_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE zdjecie_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.zdjecie_id_seq OWNER TO postgres;

--
-- Name: zdjecie_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE zdjecie_id_seq OWNED BY zdjecie.id;


--
-- Name: zmiana_status_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE zmiana_status_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.zmiana_status_id_seq OWNER TO postgres;

--
-- Name: zmiana_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE zmiana_status_id_seq OWNED BY zmiana_status.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE agent ALTER COLUMN id SET DEFAULT nextval('agent_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE agent_kalendarz ALTER COLUMN id SET DEFAULT nextval('agent_kalendarz_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE bank ALTER COLUMN id SET DEFAULT nextval('bank_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE biuro_nier_kon ALTER COLUMN id SET DEFAULT nextval('biuro_nier_kon_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE cena ALTER COLUMN id SET DEFAULT nextval('cena_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE dane_slow_wyp_nier ALTER COLUMN id SET DEFAULT nextval('dane_slow_wyp_nier_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE dane_slow_wyp_pom ALTER COLUMN id SET DEFAULT nextval('dane_slow_wyp_pom_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE dane_slow_wyp_zap ALTER COLUMN id SET DEFAULT nextval('dane_slow_wyp_zap_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE dane_txt_nier ALTER COLUMN id SET DEFAULT nextval('dane_txt_nier_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE dane_txt_pom ALTER COLUMN id SET DEFAULT nextval('dane_txt_pom_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE dane_txt_zap_max ALTER COLUMN id SET DEFAULT nextval('dane_txt_zap_max_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE dane_txt_zap_min ALTER COLUMN id SET DEFAULT nextval('dane_txt_zap_min_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE email_media_nieruchomosc ALTER COLUMN id SET DEFAULT nextval('email_media_nieruchomosc_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE email_osoba ALTER COLUMN id SET DEFAULT nextval('email_osoba_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE film ALTER COLUMN id SET DEFAULT nextval('film_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE godzina ALTER COLUMN id SET DEFAULT nextval('godzina_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE imie ALTER COLUMN id SET DEFAULT nextval('imie_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE jezyk ALTER COLUMN id SET DEFAULT nextval('jezyk_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE kalendarz ALTER COLUMN id SET DEFAULT nextval('kalendarz_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE kategoria_allegro ALTER COLUMN id SET DEFAULT nextval('kategoria_allegro_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE klient ALTER COLUMN id SET DEFAULT nextval('klient_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE kon_m_nieruchomosc ALTER COLUMN id SET DEFAULT nextval('kon_m_nieruchomosc_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE konto_agent ALTER COLUMN id SET DEFAULT nextval('konto_agent_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE kredytowanie ALTER COLUMN id SET DEFAULT nextval('kredytowanie_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE lang_tag ALTER COLUMN id SET DEFAULT nextval('lang_tag_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE lista_niechcianych ALTER COLUMN id SET DEFAULT nextval('lista_niechcianych_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE lista_param_nier ALTER COLUMN id SET DEFAULT nextval('lista_param_nier_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE lista_param_pom ALTER COLUMN id SET DEFAULT nextval('lista_param_pom_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE lista_param_slow_nier ALTER COLUMN id SET DEFAULT nextval('lista_param_slow_nier_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE lista_param_slow_pom ALTER COLUMN id SET DEFAULT nextval('lista_param_slow_pom_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE lista_wsk_adr ALTER COLUMN id SET DEFAULT nextval('lista_wsk_adr_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE media_nieruchomosc ALTER COLUMN id SET DEFAULT nextval('media_nieruchomosc_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE media_reklama ALTER COLUMN id SET DEFAULT nextval('media_reklama_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE minuta ALTER COLUMN id SET DEFAULT nextval('minuta_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE nier_rodzaj ALTER COLUMN id SET DEFAULT nextval('nier_rodzaj_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE nieruchomosc ALTER COLUMN id SET DEFAULT nextval('nieruchomosc_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE oferta ALTER COLUMN id SET DEFAULT nextval('oferta_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE opis ALTER COLUMN id SET DEFAULT nextval('opis_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE opis_nieruchomosc ALTER COLUMN id SET DEFAULT nextval('opis_nieruchomosc_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE opis_posz_zapotrzebowanie ALTER COLUMN id SET DEFAULT nextval('opis_posz_zapotrzebowanie_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE opis_wew_zapotrzebowanie ALTER COLUMN id SET DEFAULT nextval('opis_wew_zapotrzebowanie_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE opis_zapotrzebowanie ALTER COLUMN id SET DEFAULT nextval('opis_zapotrzebowanie_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE osoba ALTER COLUMN id SET DEFAULT nextval('osoba_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE osoba_dowod ALTER COLUMN id SET DEFAULT nextval('osoba_dowod_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE osoba_klient ALTER COLUMN id SET DEFAULT nextval('osoba_klient_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE osoba_kon_bank ALTER COLUMN id SET DEFAULT nextval('osoba_kon_bank_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE osoba_lista_wsk_adr ALTER COLUMN id SET DEFAULT nextval('osoba_lista_wsk_adr_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE osoba_oferta ALTER COLUMN id SET DEFAULT nextval('osoba_oferta_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE osoba_zapotrzebowanie ALTER COLUMN id SET DEFAULT nextval('osoba_zapotrzebowanie_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE osobowosc ALTER COLUMN id SET DEFAULT nextval('osobowosc_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE param_nier_strona ALTER COLUMN id SET DEFAULT nextval('param_nier_strona_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE parametr_nier ALTER COLUMN id SET DEFAULT nextval('parametr_nier_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE parametr_pom ALTER COLUMN id SET DEFAULT nextval('parametr_pom_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE pomieszczenie ALTER COLUMN id SET DEFAULT nextval('pomieszczenie_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE pomieszczenie_nier ALTER COLUMN id SET DEFAULT nextval('pomieszczenie_nier_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE pomieszczenie_przyn_nier ALTER COLUMN id SET DEFAULT nextval('pomieszczenie_przyn_nier_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE portal ALTER COLUMN id SET DEFAULT nextval('portal_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE portal_wys ALTER COLUMN id SET DEFAULT nextval('portal_wys_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE precyzja_kojarzenie ALTER COLUMN id SET DEFAULT nextval('precyzja_kojarzenie_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE priorytet_reklama ALTER COLUMN id SET DEFAULT nextval('priorytet_reklama_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE prowizja_zapotrzebowanie ALTER COLUMN id SET DEFAULT nextval('prowizja_zapotrzebowanie_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE region_geog ALTER COLUMN id SET DEFAULT nextval('region_geog_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE reklama_nieruchomosc_m ALTER COLUMN id SET DEFAULT nextval('reklama_nieruchomosc_m_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE rodz_nier_szczeg ALTER COLUMN id SET DEFAULT nextval('rodz_nier_szczeg_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE rodzaj_dowod_tozsamosc ALTER COLUMN id SET DEFAULT nextval('rodzaj_dowod_tozsamosc_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE rozmowa_przychodzaca ALTER COLUMN id SET DEFAULT nextval('rozmowa_przychodzaca_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE sekcja ALTER COLUMN id SET DEFAULT nextval('sekcja_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE sposob_finansowania ALTER COLUMN id SET DEFAULT nextval('sposob_finansowania_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE spotkanie ALTER COLUMN id SET DEFAULT nextval('spotkanie_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE spotkanie_os ALTER COLUMN id SET DEFAULT nextval('spotkanie_os_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE status ALTER COLUMN id SET DEFAULT nextval('status_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE status_dzwonienie ALTER COLUMN id SET DEFAULT nextval('status_dzwonienie_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE subskrypcja ALTER COLUMN id SET DEFAULT nextval('subskrypcja_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE telefon ALTER COLUMN id SET DEFAULT nextval('telefon_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE telefon_media_nieruchomosc ALTER COLUMN id SET DEFAULT nextval('telefon_media_nieruchomosc_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE telefon_niechciany ALTER COLUMN id SET DEFAULT nextval('telefon_niechciany_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE telefon_os_bank ALTER COLUMN id SET DEFAULT nextval('telefon_os_bank_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE tlumaczenie ALTER COLUMN id SET DEFAULT nextval('tlumaczenie_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE trans_rodzaj ALTER COLUMN id SET DEFAULT nextval('trans_rodzaj_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE transakcja ALTER COLUMN id SET DEFAULT nextval('transakcja_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE transakcja_nier ALTER COLUMN id SET DEFAULT nextval('transakcja_nier_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE umowienie ALTER COLUMN id SET DEFAULT nextval('umowienie_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ustalenia ALTER COLUMN id SET DEFAULT nextval('ustalenia_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE walidacja ALTER COLUMN id SET DEFAULT nextval('walidacja_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE waluta ALTER COLUMN id SET DEFAULT nextval('waluta_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE wlasciciel ALTER COLUMN id SET DEFAULT nextval('wlasciciel_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE wypos_nier_strona ALTER COLUMN id SET DEFAULT nextval('wypos_nier_strona_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE wyposazenie_nier ALTER COLUMN id SET DEFAULT nextval('wyposazenie_nier_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE wyposazenie_pom ALTER COLUMN id SET DEFAULT nextval('wyposazenie_pom_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE wysylka_ofert_zapotrzebowanie ALTER COLUMN id SET DEFAULT nextval('wysylka_ofert_zapotrzebowanie_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE zamiana ALTER COLUMN id SET DEFAULT nextval('zamiana_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE zap_lokaliz_nier ALTER COLUMN id SET DEFAULT nextval('zap_lokaliz_nier_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE zap_szcz_nier ALTER COLUMN id SET DEFAULT nextval('zap_szcz_nier_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE zapotrzebowanie ALTER COLUMN id SET DEFAULT nextval('zapotrzebowanie_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE zapotrzebowanie_nier_rodzaj ALTER COLUMN id SET DEFAULT nextval('zapotrzebowanie_nier_rodzaj_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE zapotrzebowanie_trans_rodzaj ALTER COLUMN id SET DEFAULT nextval('zapotrzebowanie_trans_rodzaj_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE zdjecie ALTER COLUMN id SET DEFAULT nextval('zdjecie_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE zmiana_status ALTER COLUMN id SET DEFAULT nextval('zmiana_status_id_seq'::regclass);


--
-- Name: agent_kalendarz_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY agent_kalendarz
    ADD CONSTRAINT agent_kalendarz_pkey PRIMARY KEY (id);


--
-- Name: agent_login_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY agent
    ADD CONSTRAINT agent_login_key UNIQUE ("login");


--
-- Name: agent_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY agent
    ADD CONSTRAINT agent_pkey PRIMARY KEY (id);


--
-- Name: bank_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY bank
    ADD CONSTRAINT bank_pkey PRIMARY KEY (id);


--
-- Name: biuro_nier_kon_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY biuro_nier_kon
    ADD CONSTRAINT biuro_nier_kon_pkey PRIMARY KEY (id);


--
-- Name: biuro_nier_wspolpraca_id_biuro_nier_kon_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY biuro_nier_wspolpraca
    ADD CONSTRAINT biuro_nier_wspolpraca_id_biuro_nier_kon_key UNIQUE (id_biuro_nier_kon);


--
-- Name: biuro_nier_wspolpraca_id_klient_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY biuro_nier_wspolpraca
    ADD CONSTRAINT biuro_nier_wspolpraca_id_klient_key UNIQUE (id_klient);


--
-- Name: cena_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cena
    ADD CONSTRAINT cena_pkey PRIMARY KEY (id);


--
-- Name: dane_firma_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY dane_firma
    ADD CONSTRAINT dane_firma_pkey PRIMARY KEY (id_klient);


--
-- Name: dane_slow_wyp_nier_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY dane_slow_wyp_nier
    ADD CONSTRAINT dane_slow_wyp_nier_pkey PRIMARY KEY (id);


--
-- Name: dane_slow_wyp_pom_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY dane_slow_wyp_pom
    ADD CONSTRAINT dane_slow_wyp_pom_pkey PRIMARY KEY (id);


--
-- Name: dane_slow_wyp_zap_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY dane_slow_wyp_zap
    ADD CONSTRAINT dane_slow_wyp_zap_pkey PRIMARY KEY (id);


--
-- Name: dane_txt_nier_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY dane_txt_nier
    ADD CONSTRAINT dane_txt_nier_pkey PRIMARY KEY (id);


--
-- Name: dane_txt_pom_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY dane_txt_pom
    ADD CONSTRAINT dane_txt_pom_pkey PRIMARY KEY (id);


--
-- Name: dane_txt_zap_max_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY dane_txt_zap_max
    ADD CONSTRAINT dane_txt_zap_max_pkey PRIMARY KEY (id);


--
-- Name: dane_txt_zap_min_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY dane_txt_zap_min
    ADD CONSTRAINT dane_txt_zap_min_pkey PRIMARY KEY (id);


--
-- Name: email_media_nieruchomosc_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY email_media_nieruchomosc
    ADD CONSTRAINT email_media_nieruchomosc_pkey PRIMARY KEY (id);


--
-- Name: email_osoba_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY email_osoba
    ADD CONSTRAINT email_osoba_pkey PRIMARY KEY (id);


--
-- Name: film_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY film
    ADD CONSTRAINT film_pkey PRIMARY KEY (id);


--
-- Name: godzina_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY godzina
    ADD CONSTRAINT godzina_pkey PRIMARY KEY (id);


--
-- Name: imie_nazwa_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY imie
    ADD CONSTRAINT imie_nazwa_key UNIQUE (nazwa);


--
-- Name: imie_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY imie
    ADD CONSTRAINT imie_pkey PRIMARY KEY (id);


--
-- Name: jezyk_nazwa_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY jezyk
    ADD CONSTRAINT jezyk_nazwa_key UNIQUE (nazwa);


--
-- Name: jezyk_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY jezyk
    ADD CONSTRAINT jezyk_pkey PRIMARY KEY (id);


--
-- Name: kalendarz_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY kalendarz
    ADD CONSTRAINT kalendarz_pkey PRIMARY KEY (id);


--
-- Name: kategoria_allegro_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY kategoria_allegro
    ADD CONSTRAINT kategoria_allegro_pkey PRIMARY KEY (id);


--
-- Name: klient_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY klient
    ADD CONSTRAINT klient_pkey PRIMARY KEY (id);


--
-- Name: komorka_id_osoba_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY komorka
    ADD CONSTRAINT komorka_id_osoba_key UNIQUE (id_osoba);


--
-- Name: kon_m_nieruchomosc_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY kon_m_nieruchomosc
    ADD CONSTRAINT kon_m_nieruchomosc_pkey PRIMARY KEY (id);


--
-- Name: konto_agent_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY konto_agent
    ADD CONSTRAINT konto_agent_pkey PRIMARY KEY (id);


--
-- Name: kredytowanie_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY kredytowanie
    ADD CONSTRAINT kredytowanie_pkey PRIMARY KEY (id);


--
-- Name: kurs_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY kurs
    ADD CONSTRAINT kurs_id_key UNIQUE (id);


--
-- Name: lang_tag_nazwa_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY lang_tag
    ADD CONSTRAINT lang_tag_nazwa_key UNIQUE (nazwa);


--
-- Name: lang_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY lang_tag
    ADD CONSTRAINT lang_tag_pkey PRIMARY KEY (id);


--
-- Name: lista_niechcianych_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY lista_niechcianych
    ADD CONSTRAINT lista_niechcianych_pkey PRIMARY KEY (id);


--
-- Name: lista_param_nier_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY lista_param_nier
    ADD CONSTRAINT lista_param_nier_pkey PRIMARY KEY (id);


--
-- Name: lista_param_pom_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY lista_param_pom
    ADD CONSTRAINT lista_param_pom_pkey PRIMARY KEY (id);


--
-- Name: lista_param_slow_nier_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY lista_param_slow_nier
    ADD CONSTRAINT lista_param_slow_nier_pkey PRIMARY KEY (id);


--
-- Name: lista_param_slow_pom_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY lista_param_slow_pom
    ADD CONSTRAINT lista_param_slow_pom_pkey PRIMARY KEY (id);


--
-- Name: lista_wsk_adr_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY lista_wsk_adr
    ADD CONSTRAINT lista_wsk_adr_pkey PRIMARY KEY (id);


--
-- Name: media_nieruchomosc_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY media_nieruchomosc
    ADD CONSTRAINT media_nieruchomosc_pkey PRIMARY KEY (id);


--
-- Name: media_reklama_nazwa_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY media_reklama
    ADD CONSTRAINT media_reklama_nazwa_key UNIQUE (nazwa);


--
-- Name: media_reklama_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY media_reklama
    ADD CONSTRAINT media_reklama_pkey PRIMARY KEY (id);


--
-- Name: minuta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY minuta
    ADD CONSTRAINT minuta_pkey PRIMARY KEY (id);


--
-- Name: nier_rodzaj_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY nier_rodzaj
    ADD CONSTRAINT nier_rodzaj_pkey PRIMARY KEY (id);


--
-- Name: nieruchomosc_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY nieruchomosc
    ADD CONSTRAINT nieruchomosc_pkey PRIMARY KEY (id);


--
-- Name: oferta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY oferta
    ADD CONSTRAINT oferta_pkey PRIMARY KEY (id);


--
-- Name: opis_nieruchomosc_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY opis_nieruchomosc
    ADD CONSTRAINT opis_nieruchomosc_pkey PRIMARY KEY (id);


--
-- Name: opis_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY opis
    ADD CONSTRAINT opis_pkey PRIMARY KEY (id);


--
-- Name: opis_posz_zapotrzebowanie_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY opis_posz_zapotrzebowanie
    ADD CONSTRAINT opis_posz_zapotrzebowanie_pkey PRIMARY KEY (id);


--
-- Name: opis_wew_zapotrzebowanie_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY opis_wew_zapotrzebowanie
    ADD CONSTRAINT opis_wew_zapotrzebowanie_pkey PRIMARY KEY (id);


--
-- Name: opis_zapotrzebowanie_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY opis_zapotrzebowanie
    ADD CONSTRAINT opis_zapotrzebowanie_pkey PRIMARY KEY (id);


--
-- Name: osoba_adres_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY osoba_adres
    ADD CONSTRAINT osoba_adres_id_key UNIQUE (id);


--
-- Name: osoba_dowod_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY osoba_dowod
    ADD CONSTRAINT osoba_dowod_pkey PRIMARY KEY (id);


--
-- Name: osoba_klient_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY osoba_klient
    ADD CONSTRAINT osoba_klient_pkey PRIMARY KEY (id);


--
-- Name: osoba_kon_bank_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY osoba_kon_bank
    ADD CONSTRAINT osoba_kon_bank_pkey PRIMARY KEY (id);


--
-- Name: osoba_lista_wsk_adr_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY osoba_lista_wsk_adr
    ADD CONSTRAINT osoba_lista_wsk_adr_pkey PRIMARY KEY (id);


--
-- Name: osoba_oferta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY osoba_oferta
    ADD CONSTRAINT osoba_oferta_pkey PRIMARY KEY (id);


--
-- Name: osoba_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY osoba
    ADD CONSTRAINT osoba_pkey PRIMARY KEY (id);


--
-- Name: osoba_zapotrzebowanie_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY osoba_zapotrzebowanie
    ADD CONSTRAINT osoba_zapotrzebowanie_pkey PRIMARY KEY (id);


--
-- Name: osobowosc_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY osobowosc
    ADD CONSTRAINT osobowosc_pkey PRIMARY KEY (id);


--
-- Name: param_nier_strona_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY param_nier_strona
    ADD CONSTRAINT param_nier_strona_pkey PRIMARY KEY (id);


--
-- Name: parametr_nier_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY parametr_nier
    ADD CONSTRAINT parametr_nier_pkey PRIMARY KEY (id);


--
-- Name: parametr_pom_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY parametr_pom
    ADD CONSTRAINT parametr_pom_pkey PRIMARY KEY (id);


--
-- Name: pomieszczenie_nier_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pomieszczenie_nier
    ADD CONSTRAINT pomieszczenie_nier_pkey PRIMARY KEY (id);


--
-- Name: pomieszczenie_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pomieszczenie
    ADD CONSTRAINT pomieszczenie_pkey PRIMARY KEY (id);


--
-- Name: pomieszczenie_przyn_nier_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pomieszczenie_przyn_nier
    ADD CONSTRAINT pomieszczenie_przyn_nier_pkey PRIMARY KEY (id);


--
-- Name: portal_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY portal
    ADD CONSTRAINT portal_pkey PRIMARY KEY (id);


--
-- Name: portal_wys_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY portal_wys
    ADD CONSTRAINT portal_wys_pkey PRIMARY KEY (id);


--
-- Name: precyzja_kojarzenie_nazwa_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY precyzja_kojarzenie
    ADD CONSTRAINT precyzja_kojarzenie_nazwa_key UNIQUE (nazwa);


--
-- Name: precyzja_kojarzenie_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY precyzja_kojarzenie
    ADD CONSTRAINT precyzja_kojarzenie_pkey PRIMARY KEY (id);


--
-- Name: priorytet_reklama_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY priorytet_reklama
    ADD CONSTRAINT priorytet_reklama_pkey PRIMARY KEY (id);


--
-- Name: prowizja_zapotrzebowanie_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY prowizja_zapotrzebowanie
    ADD CONSTRAINT prowizja_zapotrzebowanie_pkey PRIMARY KEY (id);


--
-- Name: region_geog_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY region_geog
    ADD CONSTRAINT region_geog_pkey PRIMARY KEY (id);


--
-- Name: rejestracja_nto_pkey; Type: CONSTRAINT; Schema: public; Owner: azg; Tablespace: 
--

ALTER TABLE ONLY rejestracja_nto
    ADD CONSTRAINT rejestracja_nto_pkey PRIMARY KEY (id);


--
-- Name: reklama_nieruchomosc_m_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY reklama_nieruchomosc_m
    ADD CONSTRAINT reklama_nieruchomosc_m_pkey PRIMARY KEY (id);


--
-- Name: rekord_nieakt_lista_wsk_adr_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY rekord_nieakt_lista_wsk_adr
    ADD CONSTRAINT rekord_nieakt_lista_wsk_adr_id_key UNIQUE (id);


--
-- Name: rodz_nier_szczeg_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY rodz_nier_szczeg
    ADD CONSTRAINT rodz_nier_szczeg_pkey PRIMARY KEY (id);


--
-- Name: rodzaj_dowod_tozsamosc_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY rodzaj_dowod_tozsamosc
    ADD CONSTRAINT rodzaj_dowod_tozsamosc_pkey PRIMARY KEY (id);


--
-- Name: rozmowa_przychodzaca_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY rozmowa_przychodzaca
    ADD CONSTRAINT rozmowa_przychodzaca_pkey PRIMARY KEY (id);


--
-- Name: sekcja_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sekcja
    ADD CONSTRAINT sekcja_pkey PRIMARY KEY (id);


--
-- Name: sposob_finansowania_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sposob_finansowania
    ADD CONSTRAINT sposob_finansowania_pkey PRIMARY KEY (id);


--
-- Name: spotkanie_os_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spotkanie_os
    ADD CONSTRAINT spotkanie_os_pkey PRIMARY KEY (id);


--
-- Name: spotkanie_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spotkanie
    ADD CONSTRAINT spotkanie_pkey PRIMARY KEY (id);


--
-- Name: status_dzwonienie_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY status_dzwonienie
    ADD CONSTRAINT status_dzwonienie_pkey PRIMARY KEY (id);


--
-- Name: status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY status
    ADD CONSTRAINT status_pkey PRIMARY KEY (id);


--
-- Name: subskrypcja_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY subskrypcja
    ADD CONSTRAINT subskrypcja_pkey PRIMARY KEY (id);


--
-- Name: telefon_media_nieruchomosc_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY telefon_media_nieruchomosc
    ADD CONSTRAINT telefon_media_nieruchomosc_pkey PRIMARY KEY (id);


--
-- Name: telefon_niechciany_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY telefon_niechciany
    ADD CONSTRAINT telefon_niechciany_pkey PRIMARY KEY (id);


--
-- Name: telefon_os_bank_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY telefon_os_bank
    ADD CONSTRAINT telefon_os_bank_pkey PRIMARY KEY (id);


--
-- Name: telefon_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY telefon
    ADD CONSTRAINT telefon_pkey PRIMARY KEY (id);


--
-- Name: tlumaczenie_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tlumaczenie
    ADD CONSTRAINT tlumaczenie_pkey PRIMARY KEY (id);


--
-- Name: trans_rodzaj_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY trans_rodzaj
    ADD CONSTRAINT trans_rodzaj_pkey PRIMARY KEY (id);


--
-- Name: transakcja_nier_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY transakcja_nier
    ADD CONSTRAINT transakcja_nier_pkey PRIMARY KEY (id);


--
-- Name: transakcja_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY transakcja
    ADD CONSTRAINT transakcja_pkey PRIMARY KEY (id);


--
-- Name: umowienie_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY umowienie
    ADD CONSTRAINT umowienie_pkey PRIMARY KEY (id);


--
-- Name: ustalenia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY ustalenia
    ADD CONSTRAINT ustalenia_pkey PRIMARY KEY (id);


--
-- Name: walidacja_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY walidacja
    ADD CONSTRAINT walidacja_pkey PRIMARY KEY (id);


--
-- Name: waluta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY waluta
    ADD CONSTRAINT waluta_pkey PRIMARY KEY (id);


--
-- Name: wlasciciel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wlasciciel
    ADD CONSTRAINT wlasciciel_pkey PRIMARY KEY (id);


--
-- Name: wypos_nier_strona_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wypos_nier_strona
    ADD CONSTRAINT wypos_nier_strona_pkey PRIMARY KEY (id);


--
-- Name: wyposazenie_nier_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wyposazenie_nier
    ADD CONSTRAINT wyposazenie_nier_pkey PRIMARY KEY (id);


--
-- Name: wyposazenie_pom_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wyposazenie_pom
    ADD CONSTRAINT wyposazenie_pom_pkey PRIMARY KEY (id);


--
-- Name: wysylka_ofert_zapotrzebowanie_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY wysylka_ofert_zapotrzebowanie
    ADD CONSTRAINT wysylka_ofert_zapotrzebowanie_pkey PRIMARY KEY (id);


--
-- Name: zamiana_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY zamiana
    ADD CONSTRAINT zamiana_pkey PRIMARY KEY (id);


--
-- Name: zap_lokaliz_nier_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY zap_lokaliz_nier
    ADD CONSTRAINT zap_lokaliz_nier_pkey PRIMARY KEY (id);


--
-- Name: zap_szcz_nier_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY zap_szcz_nier
    ADD CONSTRAINT zap_szcz_nier_pkey PRIMARY KEY (id);


--
-- Name: zapotrzebowanie_nier_rodzaj_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY zapotrzebowanie_nier_rodzaj
    ADD CONSTRAINT zapotrzebowanie_nier_rodzaj_pkey PRIMARY KEY (id);


--
-- Name: zapotrzebowanie_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY zapotrzebowanie
    ADD CONSTRAINT zapotrzebowanie_pkey PRIMARY KEY (id);


--
-- Name: zapotrzebowanie_trans_rodzaj_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY zapotrzebowanie_trans_rodzaj
    ADD CONSTRAINT zapotrzebowanie_trans_rodzaj_pkey PRIMARY KEY (id);


--
-- Name: zdjecie_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY zdjecie
    ADD CONSTRAINT zdjecie_pkey PRIMARY KEY (id);


--
-- Name: zmiana_status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY zmiana_status
    ADD CONSTRAINT zmiana_status_pkey PRIMARY KEY (id);


--
-- Name: agent_otodom_id_key; Type: INDEX; Schema: public; Owner: azg; Tablespace: 
--

CREATE UNIQUE INDEX agent_otodom_id_key ON agent_otodom USING btree (id);


--
-- Name: mailing_id_key; Type: INDEX; Schema: public; Owner: azg; Tablespace: 
--

CREATE UNIQUE INDEX mailing_id_key ON mailing USING btree (id);


--
-- Name: rejestracja_nto_id_key; Type: INDEX; Schema: public; Owner: azg; Tablespace: 
--

CREATE UNIQUE INDEX rejestracja_nto_id_key ON rejestracja_nto USING btree (id);


--
-- Name: agent_kalendarz_id_agent_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY agent_kalendarz
    ADD CONSTRAINT agent_kalendarz_id_agent_fkey FOREIGN KEY (id_agent) REFERENCES agent(id);


--
-- Name: agent_kalendarz_id_kalendarz_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY agent_kalendarz
    ADD CONSTRAINT agent_kalendarz_id_kalendarz_fkey FOREIGN KEY (id_kalendarz) REFERENCES kalendarz(id);


--
-- Name: agent_nadzor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY agent
    ADD CONSTRAINT agent_nadzor_fkey FOREIGN KEY (nadzor) REFERENCES agent(id);


--
-- Name: biuro_nier_kon_id_region_geog_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY biuro_nier_kon
    ADD CONSTRAINT biuro_nier_kon_id_region_geog_fkey FOREIGN KEY (id_region_geog) REFERENCES region_geog(id);


--
-- Name: biuro_nier_wspolpraca_id_biuro_nier_kon_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY biuro_nier_wspolpraca
    ADD CONSTRAINT biuro_nier_wspolpraca_id_biuro_nier_kon_fkey FOREIGN KEY (id_biuro_nier_kon) REFERENCES biuro_nier_kon(id);


--
-- Name: biuro_nier_wspolpraca_id_klient_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY biuro_nier_wspolpraca
    ADD CONSTRAINT biuro_nier_wspolpraca_id_klient_fkey FOREIGN KEY (id_klient) REFERENCES klient(id);


--
-- Name: cena_id_agent_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cena
    ADD CONSTRAINT cena_id_agent_fkey FOREIGN KEY (id_agent) REFERENCES agent(id);


--
-- Name: cena_id_oferta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cena
    ADD CONSTRAINT cena_id_oferta_fkey FOREIGN KEY (id_oferta) REFERENCES oferta(id);


--
-- Name: cena_id_osoba_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cena
    ADD CONSTRAINT cena_id_osoba_fkey FOREIGN KEY (id_osoba) REFERENCES osoba(id);


--
-- Name: dane_firma_id_klient_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY dane_firma
    ADD CONSTRAINT dane_firma_id_klient_fkey FOREIGN KEY (id_klient) REFERENCES klient(id);


--
-- Name: dane_firma_id_region_geog_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY dane_firma
    ADD CONSTRAINT dane_firma_id_region_geog_fkey FOREIGN KEY (id_region_geog) REFERENCES region_geog(id);


--
-- Name: dane_slow_wyp_nier_id_nieruchomosc_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY dane_slow_wyp_nier
    ADD CONSTRAINT dane_slow_wyp_nier_id_nieruchomosc_fkey FOREIGN KEY (id_nieruchomosc) REFERENCES nieruchomosc(id);


--
-- Name: dane_slow_wyp_nier_id_wyposazenie_nier_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY dane_slow_wyp_nier
    ADD CONSTRAINT dane_slow_wyp_nier_id_wyposazenie_nier_fkey FOREIGN KEY (id_wyposazenie_nier) REFERENCES wyposazenie_nier(id);


--
-- Name: dane_slow_wyp_pom_id_pomieszczenie_przyn_nier_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY dane_slow_wyp_pom
    ADD CONSTRAINT dane_slow_wyp_pom_id_pomieszczenie_przyn_nier_fkey FOREIGN KEY (id_pomieszczenie_przyn_nier) REFERENCES pomieszczenie_przyn_nier(id);


--
-- Name: dane_slow_wyp_pom_id_wyposazenie_pom_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY dane_slow_wyp_pom
    ADD CONSTRAINT dane_slow_wyp_pom_id_wyposazenie_pom_fkey FOREIGN KEY (id_wyposazenie_pom) REFERENCES wyposazenie_pom(id);


--
-- Name: dane_slow_wyp_zap_id_wyposazenie_nier_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY dane_slow_wyp_zap
    ADD CONSTRAINT dane_slow_wyp_zap_id_wyposazenie_nier_fkey FOREIGN KEY (id_wyposazenie_nier) REFERENCES wyposazenie_nier(id);


--
-- Name: dane_slow_wyp_zap_id_zapotrzebowanie_trans_rodzaj_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY dane_slow_wyp_zap
    ADD CONSTRAINT dane_slow_wyp_zap_id_zapotrzebowanie_trans_rodzaj_fkey FOREIGN KEY (id_zapotrzebowanie_trans_rodzaj) REFERENCES zapotrzebowanie_trans_rodzaj(id);


--
-- Name: dane_txt_nier_id_nieruchomosc_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY dane_txt_nier
    ADD CONSTRAINT dane_txt_nier_id_nieruchomosc_fkey FOREIGN KEY (id_nieruchomosc) REFERENCES nieruchomosc(id);


--
-- Name: dane_txt_nier_id_parametr_nier_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY dane_txt_nier
    ADD CONSTRAINT dane_txt_nier_id_parametr_nier_fkey FOREIGN KEY (id_parametr_nier) REFERENCES parametr_nier(id);


--
-- Name: dane_txt_pom_id_parametr_pom_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY dane_txt_pom
    ADD CONSTRAINT dane_txt_pom_id_parametr_pom_fkey FOREIGN KEY (id_parametr_pom) REFERENCES parametr_pom(id);


--
-- Name: dane_txt_pom_id_pomieszczenie_przyn_nier_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY dane_txt_pom
    ADD CONSTRAINT dane_txt_pom_id_pomieszczenie_przyn_nier_fkey FOREIGN KEY (id_pomieszczenie_przyn_nier) REFERENCES pomieszczenie_przyn_nier(id);


--
-- Name: dane_txt_zap_max_id_parametr_nier_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY dane_txt_zap_max
    ADD CONSTRAINT dane_txt_zap_max_id_parametr_nier_fkey FOREIGN KEY (id_parametr_nier) REFERENCES parametr_nier(id);


--
-- Name: dane_txt_zap_max_id_zapotrzebowanie_trans_rodzaj_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY dane_txt_zap_max
    ADD CONSTRAINT dane_txt_zap_max_id_zapotrzebowanie_trans_rodzaj_fkey FOREIGN KEY (id_zapotrzebowanie_trans_rodzaj) REFERENCES zapotrzebowanie_trans_rodzaj(id);


--
-- Name: dane_txt_zap_min_id_parametr_nier_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY dane_txt_zap_min
    ADD CONSTRAINT dane_txt_zap_min_id_parametr_nier_fkey FOREIGN KEY (id_parametr_nier) REFERENCES parametr_nier(id);


--
-- Name: dane_txt_zap_min_id_zapotrzebowanie_trans_rodzaj_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY dane_txt_zap_min
    ADD CONSTRAINT dane_txt_zap_min_id_zapotrzebowanie_trans_rodzaj_fkey FOREIGN KEY (id_zapotrzebowanie_trans_rodzaj) REFERENCES zapotrzebowanie_trans_rodzaj(id);


--
-- Name: email_media_nieruchomosc_id_media_nieruchomosc_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY email_media_nieruchomosc
    ADD CONSTRAINT email_media_nieruchomosc_id_media_nieruchomosc_fkey FOREIGN KEY (id_media_nieruchomosc) REFERENCES media_nieruchomosc(id);


--
-- Name: email_osoba_id_osoba_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY email_osoba
    ADD CONSTRAINT email_osoba_id_osoba_fkey FOREIGN KEY (id_osoba) REFERENCES osoba(id);


--
-- Name: film_id_nieruchomosc_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY film
    ADD CONSTRAINT film_id_nieruchomosc_fkey FOREIGN KEY (id_nieruchomosc) REFERENCES nieruchomosc(id);


--
-- Name: jezyk_id_waluta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jezyk
    ADD CONSTRAINT jezyk_id_waluta_fkey FOREIGN KEY (id_waluta) REFERENCES waluta(id);


--
-- Name: kalendarz_id_godzina_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kalendarz
    ADD CONSTRAINT kalendarz_id_godzina_fkey FOREIGN KEY (id_godzina) REFERENCES godzina(id);


--
-- Name: kalendarz_id_minuta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kalendarz
    ADD CONSTRAINT kalendarz_id_minuta_fkey FOREIGN KEY (id_minuta) REFERENCES minuta(id);


--
-- Name: kalendarz_id_spotkanie_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kalendarz
    ADD CONSTRAINT kalendarz_id_spotkanie_fkey FOREIGN KEY (id_spotkanie) REFERENCES spotkanie(id);


--
-- Name: kategoria_allegro_id_nier_rodzaj_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kategoria_allegro
    ADD CONSTRAINT kategoria_allegro_id_nier_rodzaj_fkey FOREIGN KEY (id_nier_rodzaj) REFERENCES nier_rodzaj(id);


--
-- Name: kategoria_allegro_id_powiat_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kategoria_allegro
    ADD CONSTRAINT kategoria_allegro_id_powiat_fkey FOREIGN KEY (id_powiat) REFERENCES region_geog(id);


--
-- Name: kategoria_allegro_id_trans_rodzaj_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kategoria_allegro
    ADD CONSTRAINT kategoria_allegro_id_trans_rodzaj_fkey FOREIGN KEY (id_trans_rodzaj) REFERENCES trans_rodzaj(id);


--
-- Name: klient_id_agent_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY klient
    ADD CONSTRAINT klient_id_agent_fkey FOREIGN KEY (id_agent) REFERENCES agent(id);


--
-- Name: klient_id_osobowosc_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY klient
    ADD CONSTRAINT klient_id_osobowosc_fkey FOREIGN KEY (id_osobowosc) REFERENCES osobowosc(id);


--
-- Name: komorka_id_osoba_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY komorka
    ADD CONSTRAINT komorka_id_osoba_fkey FOREIGN KEY (id_osoba) REFERENCES osoba(id);


--
-- Name: kon_m_nieruchomosc_id_agent_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kon_m_nieruchomosc
    ADD CONSTRAINT kon_m_nieruchomosc_id_agent_fkey FOREIGN KEY (id_agent) REFERENCES agent(id);


--
-- Name: kon_m_nieruchomosc_id_media_nieruchomosc_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kon_m_nieruchomosc
    ADD CONSTRAINT kon_m_nieruchomosc_id_media_nieruchomosc_fkey FOREIGN KEY (id_media_nieruchomosc) REFERENCES media_nieruchomosc(id);


--
-- Name: konto_agent_id_agent_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY konto_agent
    ADD CONSTRAINT konto_agent_id_agent_fkey FOREIGN KEY (id_agent) REFERENCES agent(id);


--
-- Name: konto_agent_id_bank_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY konto_agent
    ADD CONSTRAINT konto_agent_id_bank_fkey FOREIGN KEY (id_bank) REFERENCES bank(id);


--
-- Name: kredytowanie_id_bank_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kredytowanie
    ADD CONSTRAINT kredytowanie_id_bank_fkey FOREIGN KEY (id_bank) REFERENCES bank(id);


--
-- Name: kredytowanie_id_transakcja_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kredytowanie
    ADD CONSTRAINT kredytowanie_id_transakcja_fkey FOREIGN KEY (id_transakcja) REFERENCES transakcja(id);


--
-- Name: kurs_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY kurs
    ADD CONSTRAINT kurs_id_fkey FOREIGN KEY (id) REFERENCES waluta(id);


--
-- Name: lista_param_nier_id_nier_rodzaj_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY lista_param_nier
    ADD CONSTRAINT lista_param_nier_id_nier_rodzaj_fkey FOREIGN KEY (id_nier_rodzaj) REFERENCES nier_rodzaj(id);


--
-- Name: lista_param_nier_id_parametr_nier_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY lista_param_nier
    ADD CONSTRAINT lista_param_nier_id_parametr_nier_fkey FOREIGN KEY (id_parametr_nier) REFERENCES parametr_nier(id);


--
-- Name: lista_param_nier_id_trans_rodzaj_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY lista_param_nier
    ADD CONSTRAINT lista_param_nier_id_trans_rodzaj_fkey FOREIGN KEY (id_trans_rodzaj) REFERENCES trans_rodzaj(id);


--
-- Name: lista_param_pom_id_parametr_pom_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY lista_param_pom
    ADD CONSTRAINT lista_param_pom_id_parametr_pom_fkey FOREIGN KEY (id_parametr_pom) REFERENCES parametr_pom(id);


--
-- Name: lista_param_pom_id_pomieszczenie_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY lista_param_pom
    ADD CONSTRAINT lista_param_pom_id_pomieszczenie_fkey FOREIGN KEY (id_pomieszczenie) REFERENCES pomieszczenie(id);


--
-- Name: lista_param_slow_nier_id_nier_rodzaj_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY lista_param_slow_nier
    ADD CONSTRAINT lista_param_slow_nier_id_nier_rodzaj_fkey FOREIGN KEY (id_nier_rodzaj) REFERENCES nier_rodzaj(id);


--
-- Name: lista_param_slow_nier_id_trans_rodzaj_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY lista_param_slow_nier
    ADD CONSTRAINT lista_param_slow_nier_id_trans_rodzaj_fkey FOREIGN KEY (id_trans_rodzaj) REFERENCES trans_rodzaj(id);


--
-- Name: lista_param_slow_nier_id_wyposazenie_nier_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY lista_param_slow_nier
    ADD CONSTRAINT lista_param_slow_nier_id_wyposazenie_nier_fkey FOREIGN KEY (id_wyposazenie_nier) REFERENCES wyposazenie_nier(id);


--
-- Name: lista_param_slow_pom_id_pomieszczenie_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY lista_param_slow_pom
    ADD CONSTRAINT lista_param_slow_pom_id_pomieszczenie_fkey FOREIGN KEY (id_pomieszczenie) REFERENCES pomieszczenie(id);


--
-- Name: lista_param_slow_pom_id_wyposazenie_pom_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY lista_param_slow_pom
    ADD CONSTRAINT lista_param_slow_pom_id_wyposazenie_pom_fkey FOREIGN KEY (id_wyposazenie_pom) REFERENCES wyposazenie_pom(id);


--
-- Name: lista_wsk_adr_id_agent_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY lista_wsk_adr
    ADD CONSTRAINT lista_wsk_adr_id_agent_fkey FOREIGN KEY (id_agent) REFERENCES agent(id);


--
-- Name: lista_wsk_adr_id_klient_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY lista_wsk_adr
    ADD CONSTRAINT lista_wsk_adr_id_klient_fkey FOREIGN KEY (id_klient) REFERENCES klient(id);


--
-- Name: lista_wsk_adr_id_oferta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY lista_wsk_adr
    ADD CONSTRAINT lista_wsk_adr_id_oferta_fkey FOREIGN KEY (id_oferta) REFERENCES oferta(id);


--
-- Name: lista_wsk_adr_id_zapotrzebowanie_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY lista_wsk_adr
    ADD CONSTRAINT lista_wsk_adr_id_zapotrzebowanie_fkey FOREIGN KEY (id_zapotrzebowanie) REFERENCES zapotrzebowanie(id);


--
-- Name: lista_wsk_adr_ogladanie_godzina_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY lista_wsk_adr
    ADD CONSTRAINT lista_wsk_adr_ogladanie_godzina_fkey FOREIGN KEY (ogladanie_godzina) REFERENCES godzina(id);


--
-- Name: lista_wsk_adr_ogladanie_minuta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY lista_wsk_adr
    ADD CONSTRAINT lista_wsk_adr_ogladanie_minuta_fkey FOREIGN KEY (ogladanie_minuta) REFERENCES minuta(id);


--
-- Name: mailing_id_wojewodztwo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: azg
--

ALTER TABLE ONLY mailing
    ADD CONSTRAINT mailing_id_wojewodztwo_fkey FOREIGN KEY (id_wojewodztwo) REFERENCES region_geog(id);


--
-- Name: media_nieruchomosc_id_agent_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY media_nieruchomosc
    ADD CONSTRAINT media_nieruchomosc_id_agent_fkey FOREIGN KEY (id_agent) REFERENCES agent(id);


--
-- Name: media_nieruchomosc_id_media_reklama_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY media_nieruchomosc
    ADD CONSTRAINT media_nieruchomosc_id_media_reklama_fkey FOREIGN KEY (id_media_reklama) REFERENCES media_reklama(id);


--
-- Name: media_nieruchomosc_id_nier_rodzaj_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY media_nieruchomosc
    ADD CONSTRAINT media_nieruchomosc_id_nier_rodzaj_fkey FOREIGN KEY (id_nier_rodzaj) REFERENCES nier_rodzaj(id);


--
-- Name: media_nieruchomosc_id_osoba_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY media_nieruchomosc
    ADD CONSTRAINT media_nieruchomosc_id_osoba_fkey FOREIGN KEY (id_osoba) REFERENCES osoba(id);


--
-- Name: media_nieruchomosc_id_region_geog_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY media_nieruchomosc
    ADD CONSTRAINT media_nieruchomosc_id_region_geog_fkey FOREIGN KEY (id_region_geog) REFERENCES region_geog(id);


--
-- Name: media_nieruchomosc_id_status_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY media_nieruchomosc
    ADD CONSTRAINT media_nieruchomosc_id_status_fkey FOREIGN KEY (id_status) REFERENCES status(id);


--
-- Name: media_nieruchomosc_id_trans_rodzaj_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY media_nieruchomosc
    ADD CONSTRAINT media_nieruchomosc_id_trans_rodzaj_fkey FOREIGN KEY (id_trans_rodzaj) REFERENCES trans_rodzaj(id);


--
-- Name: nieruchomosc_id_agent_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY nieruchomosc
    ADD CONSTRAINT nieruchomosc_id_agent_fkey FOREIGN KEY (id_agent) REFERENCES agent(id);


--
-- Name: nieruchomosc_id_klient_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY nieruchomosc
    ADD CONSTRAINT nieruchomosc_id_klient_fkey FOREIGN KEY (id_klient) REFERENCES klient(id);


--
-- Name: nieruchomosc_id_nier_rodzaj_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY nieruchomosc
    ADD CONSTRAINT nieruchomosc_id_nier_rodzaj_fkey FOREIGN KEY (id_nier_rodzaj) REFERENCES nier_rodzaj(id);


--
-- Name: nieruchomosc_id_region_geog_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY nieruchomosc
    ADD CONSTRAINT nieruchomosc_id_region_geog_fkey FOREIGN KEY (id_region_geog) REFERENCES region_geog(id);


--
-- Name: nieruchomosc_id_rodz_nier_szcz_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY nieruchomosc
    ADD CONSTRAINT nieruchomosc_id_rodz_nier_szcz_fkey FOREIGN KEY (id_rodz_nier_szcz) REFERENCES rodz_nier_szczeg(id);


--
-- Name: oferta_id_nieruchomosc_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oferta
    ADD CONSTRAINT oferta_id_nieruchomosc_fkey FOREIGN KEY (id_nieruchomosc) REFERENCES nieruchomosc(id);


--
-- Name: oferta_id_priorytet_reklama_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oferta
    ADD CONSTRAINT oferta_id_priorytet_reklama_fkey FOREIGN KEY (id_priorytet_reklama) REFERENCES priorytet_reklama(id);


--
-- Name: oferta_id_rodz_trans_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oferta
    ADD CONSTRAINT oferta_id_rodz_trans_fkey FOREIGN KEY (id_rodz_trans) REFERENCES trans_rodzaj(id);


--
-- Name: oferta_id_status_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oferta
    ADD CONSTRAINT oferta_id_status_fkey FOREIGN KEY (id_status) REFERENCES status(id);


--
-- Name: opis_id_jezyk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY opis
    ADD CONSTRAINT opis_id_jezyk_fkey FOREIGN KEY (id_jezyk) REFERENCES jezyk(id);


--
-- Name: opis_id_oferta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY opis
    ADD CONSTRAINT opis_id_oferta_fkey FOREIGN KEY (id_oferta) REFERENCES oferta(id);


--
-- Name: opis_nieruchomosc_id_agent_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY opis_nieruchomosc
    ADD CONSTRAINT opis_nieruchomosc_id_agent_fkey FOREIGN KEY (id_agent) REFERENCES agent(id);


--
-- Name: opis_nieruchomosc_id_nieruchomosc_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY opis_nieruchomosc
    ADD CONSTRAINT opis_nieruchomosc_id_nieruchomosc_fkey FOREIGN KEY (id_nieruchomosc) REFERENCES nieruchomosc(id);


--
-- Name: opis_posz_zapotrzebowanie_id_agent_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY opis_posz_zapotrzebowanie
    ADD CONSTRAINT opis_posz_zapotrzebowanie_id_agent_fkey FOREIGN KEY (id_agent) REFERENCES agent(id);


--
-- Name: opis_posz_zapotrzebowanie_id_zapotrzebowanie_trans_rodzaj_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY opis_posz_zapotrzebowanie
    ADD CONSTRAINT opis_posz_zapotrzebowanie_id_zapotrzebowanie_trans_rodzaj_fkey FOREIGN KEY (id_zapotrzebowanie_trans_rodzaj) REFERENCES zapotrzebowanie_trans_rodzaj(id);


--
-- Name: opis_wew_zapotrzebowanie_id_agent_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY opis_wew_zapotrzebowanie
    ADD CONSTRAINT opis_wew_zapotrzebowanie_id_agent_fkey FOREIGN KEY (id_agent) REFERENCES agent(id);


--
-- Name: opis_wew_zapotrzebowanie_id_oferta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY opis_wew_zapotrzebowanie
    ADD CONSTRAINT opis_wew_zapotrzebowanie_id_oferta_fkey FOREIGN KEY (id_oferta) REFERENCES oferta(id);


--
-- Name: opis_wew_zapotrzebowanie_id_zapotrzebowanie_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY opis_wew_zapotrzebowanie
    ADD CONSTRAINT opis_wew_zapotrzebowanie_id_zapotrzebowanie_fkey FOREIGN KEY (id_zapotrzebowanie) REFERENCES zapotrzebowanie(id);


--
-- Name: opis_zapotrzebowanie_id_jezyk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY opis_zapotrzebowanie
    ADD CONSTRAINT opis_zapotrzebowanie_id_jezyk_fkey FOREIGN KEY (id_jezyk) REFERENCES jezyk(id);


--
-- Name: opis_zapotrzebowanie_id_zapotrzebowanie_trans_rodzaj_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY opis_zapotrzebowanie
    ADD CONSTRAINT opis_zapotrzebowanie_id_zapotrzebowanie_trans_rodzaj_fkey FOREIGN KEY (id_zapotrzebowanie_trans_rodzaj) REFERENCES zapotrzebowanie_trans_rodzaj(id);


--
-- Name: osoba_adres_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY osoba_adres
    ADD CONSTRAINT osoba_adres_id_fkey FOREIGN KEY (id) REFERENCES osoba(id);


--
-- Name: osoba_adres_id_region_geog_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY osoba_adres
    ADD CONSTRAINT osoba_adres_id_region_geog_fkey FOREIGN KEY (id_region_geog) REFERENCES region_geog(id);


--
-- Name: osoba_dowod_id_osoba_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY osoba_dowod
    ADD CONSTRAINT osoba_dowod_id_osoba_fkey FOREIGN KEY (id_osoba) REFERENCES osoba(id);


--
-- Name: osoba_dowod_id_rodzaj_dowod_tozsamosc_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY osoba_dowod
    ADD CONSTRAINT osoba_dowod_id_rodzaj_dowod_tozsamosc_fkey FOREIGN KEY (id_rodzaj_dowod_tozsamosc) REFERENCES rodzaj_dowod_tozsamosc(id);


--
-- Name: osoba_id_agent_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY osoba
    ADD CONSTRAINT osoba_id_agent_fkey FOREIGN KEY (id_agent) REFERENCES agent(id);


--
-- Name: osoba_id_imie_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY osoba
    ADD CONSTRAINT osoba_id_imie_fkey FOREIGN KEY (id_imie) REFERENCES imie(id);


--
-- Name: osoba_klient_id_klient_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY osoba_klient
    ADD CONSTRAINT osoba_klient_id_klient_fkey FOREIGN KEY (id_klient) REFERENCES klient(id);


--
-- Name: osoba_klient_id_osoba_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY osoba_klient
    ADD CONSTRAINT osoba_klient_id_osoba_fkey FOREIGN KEY (id_osoba) REFERENCES osoba(id);


--
-- Name: osoba_kon_bank_id_bank_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY osoba_kon_bank
    ADD CONSTRAINT osoba_kon_bank_id_bank_fkey FOREIGN KEY (id_bank) REFERENCES bank(id);


--
-- Name: osoba_kon_bank_id_imie_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY osoba_kon_bank
    ADD CONSTRAINT osoba_kon_bank_id_imie_fkey FOREIGN KEY (id_imie) REFERENCES imie(id);


--
-- Name: osoba_lista_wsk_adr_id_lista_wsk_adr_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY osoba_lista_wsk_adr
    ADD CONSTRAINT osoba_lista_wsk_adr_id_lista_wsk_adr_fkey FOREIGN KEY (id_lista_wsk_adr) REFERENCES lista_wsk_adr(id);


--
-- Name: osoba_lista_wsk_adr_id_osoba_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY osoba_lista_wsk_adr
    ADD CONSTRAINT osoba_lista_wsk_adr_id_osoba_fkey FOREIGN KEY (id_osoba) REFERENCES osoba(id);


--
-- Name: osoba_oferta_id_oferta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY osoba_oferta
    ADD CONSTRAINT osoba_oferta_id_oferta_fkey FOREIGN KEY (id_oferta) REFERENCES oferta(id);


--
-- Name: osoba_oferta_id_osoba_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY osoba_oferta
    ADD CONSTRAINT osoba_oferta_id_osoba_fkey FOREIGN KEY (id_osoba) REFERENCES osoba(id);


--
-- Name: osoba_zapotrzebowanie_id_osoba_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY osoba_zapotrzebowanie
    ADD CONSTRAINT osoba_zapotrzebowanie_id_osoba_fkey FOREIGN KEY (id_osoba) REFERENCES osoba(id);


--
-- Name: osoba_zapotrzebowanie_id_zapotrzebowanie_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY osoba_zapotrzebowanie
    ADD CONSTRAINT osoba_zapotrzebowanie_id_zapotrzebowanie_fkey FOREIGN KEY (id_zapotrzebowanie) REFERENCES zapotrzebowanie(id);


--
-- Name: param_nier_strona_id_nier_rodzaj_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY param_nier_strona
    ADD CONSTRAINT param_nier_strona_id_nier_rodzaj_fkey FOREIGN KEY (id_nier_rodzaj) REFERENCES nier_rodzaj(id);


--
-- Name: param_nier_strona_id_parametr_nier_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY param_nier_strona
    ADD CONSTRAINT param_nier_strona_id_parametr_nier_fkey FOREIGN KEY (id_parametr_nier) REFERENCES parametr_nier(id);


--
-- Name: param_nier_strona_id_trans_rodzaj_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY param_nier_strona
    ADD CONSTRAINT param_nier_strona_id_trans_rodzaj_fkey FOREIGN KEY (id_trans_rodzaj) REFERENCES trans_rodzaj(id);


--
-- Name: parametr_nier_id_sekcja_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY parametr_nier
    ADD CONSTRAINT parametr_nier_id_sekcja_fkey FOREIGN KEY (id_sekcja) REFERENCES sekcja(id);


--
-- Name: parametr_nier_id_walidacja_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY parametr_nier
    ADD CONSTRAINT parametr_nier_id_walidacja_fkey FOREIGN KEY (id_walidacja) REFERENCES walidacja(id);


--
-- Name: parametr_pom_id_sekcja_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY parametr_pom
    ADD CONSTRAINT parametr_pom_id_sekcja_fkey FOREIGN KEY (id_sekcja) REFERENCES sekcja(id);


--
-- Name: parametr_pom_id_walidacja_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY parametr_pom
    ADD CONSTRAINT parametr_pom_id_walidacja_fkey FOREIGN KEY (id_walidacja) REFERENCES walidacja(id);


--
-- Name: pomieszczenie_nier_id_nier_rodzaj_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pomieszczenie_nier
    ADD CONSTRAINT pomieszczenie_nier_id_nier_rodzaj_fkey FOREIGN KEY (id_nier_rodzaj) REFERENCES nier_rodzaj(id);


--
-- Name: pomieszczenie_nier_id_pomieszczenie_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pomieszczenie_nier
    ADD CONSTRAINT pomieszczenie_nier_id_pomieszczenie_fkey FOREIGN KEY (id_pomieszczenie) REFERENCES pomieszczenie(id);


--
-- Name: pomieszczenie_przyn_nier_id_nieruchomosc_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pomieszczenie_przyn_nier
    ADD CONSTRAINT pomieszczenie_przyn_nier_id_nieruchomosc_fkey FOREIGN KEY (id_nieruchomosc) REFERENCES nieruchomosc(id);


--
-- Name: pomieszczenie_przyn_nier_id_pomieszczenie_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pomieszczenie_przyn_nier
    ADD CONSTRAINT pomieszczenie_przyn_nier_id_pomieszczenie_fkey FOREIGN KEY (id_pomieszczenie) REFERENCES pomieszczenie(id);


--
-- Name: portal_wys_id_oferta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY portal_wys
    ADD CONSTRAINT portal_wys_id_oferta_fkey FOREIGN KEY (id_oferta) REFERENCES oferta(id);


--
-- Name: portal_wys_id_portal_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY portal_wys
    ADD CONSTRAINT portal_wys_id_portal_fkey FOREIGN KEY (id_portal) REFERENCES portal(id);


--
-- Name: prowizja_zapotrzebowanie_id_sposob_finansowania_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY prowizja_zapotrzebowanie
    ADD CONSTRAINT prowizja_zapotrzebowanie_id_sposob_finansowania_fkey FOREIGN KEY (id_sposob_finansowania) REFERENCES sposob_finansowania(id);


--
-- Name: prowizja_zapotrzebowanie_id_trans_rodzaj_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY prowizja_zapotrzebowanie
    ADD CONSTRAINT prowizja_zapotrzebowanie_id_trans_rodzaj_fkey FOREIGN KEY (id_trans_rodzaj) REFERENCES trans_rodzaj(id);


--
-- Name: prowizja_zapotrzebowanie_id_zapotrzebowanie_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY prowizja_zapotrzebowanie
    ADD CONSTRAINT prowizja_zapotrzebowanie_id_zapotrzebowanie_fkey FOREIGN KEY (id_zapotrzebowanie) REFERENCES zapotrzebowanie(id);


--
-- Name: region_geog_id_parent_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY region_geog
    ADD CONSTRAINT region_geog_id_parent_fkey FOREIGN KEY (id_parent) REFERENCES region_geog(id);


--
-- Name: reklama_nieruchomosc_m_id_media_nieruchomosc_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reklama_nieruchomosc_m
    ADD CONSTRAINT reklama_nieruchomosc_m_id_media_nieruchomosc_fkey FOREIGN KEY (id_media_nieruchomosc) REFERENCES media_nieruchomosc(id);


--
-- Name: reklama_nieruchomosc_m_id_media_reklama_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reklama_nieruchomosc_m
    ADD CONSTRAINT reklama_nieruchomosc_m_id_media_reklama_fkey FOREIGN KEY (id_media_reklama) REFERENCES media_reklama(id);


--
-- Name: rekord_nieakt_lista_wsk_adr_id_agent_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rekord_nieakt_lista_wsk_adr
    ADD CONSTRAINT rekord_nieakt_lista_wsk_adr_id_agent_fkey FOREIGN KEY (id_agent) REFERENCES agent(id);


--
-- Name: rekord_nieakt_lista_wsk_adr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rekord_nieakt_lista_wsk_adr
    ADD CONSTRAINT rekord_nieakt_lista_wsk_adr_id_fkey FOREIGN KEY (id) REFERENCES lista_wsk_adr(id);


--
-- Name: rodz_nier_szczeg_id_nier_rodzaj_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rodz_nier_szczeg
    ADD CONSTRAINT rodz_nier_szczeg_id_nier_rodzaj_fkey FOREIGN KEY (id_nier_rodzaj) REFERENCES nier_rodzaj(id);


--
-- Name: rozmowa_przychodzaca_id_agent_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rozmowa_przychodzaca
    ADD CONSTRAINT rozmowa_przychodzaca_id_agent_fkey FOREIGN KEY (id_agent) REFERENCES agent(id);


--
-- Name: rozmowa_przychodzaca_id_status_dzwonienie_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rozmowa_przychodzaca
    ADD CONSTRAINT rozmowa_przychodzaca_id_status_dzwonienie_fkey FOREIGN KEY (id_status_dzwonienie) REFERENCES status_dzwonienie(id);


--
-- Name: spotkanie_id_agent_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spotkanie
    ADD CONSTRAINT spotkanie_id_agent_fkey FOREIGN KEY (id_agent) REFERENCES agent(id);


--
-- Name: spotkanie_id_klient_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spotkanie
    ADD CONSTRAINT spotkanie_id_klient_fkey FOREIGN KEY (id_klient) REFERENCES klient(id);


--
-- Name: spotkanie_id_oferta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spotkanie
    ADD CONSTRAINT spotkanie_id_oferta_fkey FOREIGN KEY (id_oferta) REFERENCES oferta(id);


--
-- Name: spotkanie_id_umowienie_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spotkanie
    ADD CONSTRAINT spotkanie_id_umowienie_fkey FOREIGN KEY (id_umowienie) REFERENCES umowienie(id);


--
-- Name: spotkanie_id_zapotrzebowanie_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spotkanie
    ADD CONSTRAINT spotkanie_id_zapotrzebowanie_fkey FOREIGN KEY (id_zapotrzebowanie) REFERENCES zapotrzebowanie(id);


--
-- Name: spotkanie_os_id_osoba_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spotkanie_os
    ADD CONSTRAINT spotkanie_os_id_osoba_fkey FOREIGN KEY (id_osoba) REFERENCES osoba(id);


--
-- Name: spotkanie_os_id_spotkanie_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spotkanie_os
    ADD CONSTRAINT spotkanie_os_id_spotkanie_fkey FOREIGN KEY (id_spotkanie) REFERENCES spotkanie(id);


--
-- Name: spotkanie_spotkanie_godzina_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spotkanie
    ADD CONSTRAINT spotkanie_spotkanie_godzina_fkey FOREIGN KEY (spotkanie_godzina) REFERENCES godzina(id);


--
-- Name: spotkanie_spotkanie_minuta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY spotkanie
    ADD CONSTRAINT spotkanie_spotkanie_minuta_fkey FOREIGN KEY (spotkanie_minuta) REFERENCES minuta(id);


--
-- Name: subskrypcja_id_jezyk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY subskrypcja
    ADD CONSTRAINT subskrypcja_id_jezyk_fkey FOREIGN KEY (id_jezyk) REFERENCES jezyk(id);


--
-- Name: subskrypcja_id_nier_rodzaj_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY subskrypcja
    ADD CONSTRAINT subskrypcja_id_nier_rodzaj_fkey FOREIGN KEY (id_nier_rodzaj) REFERENCES nier_rodzaj(id);


--
-- Name: subskrypcja_id_trans_rodzaj_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY subskrypcja
    ADD CONSTRAINT subskrypcja_id_trans_rodzaj_fkey FOREIGN KEY (id_trans_rodzaj) REFERENCES trans_rodzaj(id);


--
-- Name: telefon_id_osoba_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY telefon
    ADD CONSTRAINT telefon_id_osoba_fkey FOREIGN KEY (id_osoba) REFERENCES osoba(id);


--
-- Name: telefon_media_nieruchomosc_id_media_nieruchomosc_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY telefon_media_nieruchomosc
    ADD CONSTRAINT telefon_media_nieruchomosc_id_media_nieruchomosc_fkey FOREIGN KEY (id_media_nieruchomosc) REFERENCES media_nieruchomosc(id);


--
-- Name: telefon_niechciany_id_lista_niechcianych_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY telefon_niechciany
    ADD CONSTRAINT telefon_niechciany_id_lista_niechcianych_fkey FOREIGN KEY (id_lista_niechcianych) REFERENCES lista_niechcianych(id);


--
-- Name: telefon_os_bank_id_osoba_kon_bank_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY telefon_os_bank
    ADD CONSTRAINT telefon_os_bank_id_osoba_kon_bank_fkey FOREIGN KEY (id_osoba_kon_bank) REFERENCES osoba_kon_bank(id);


--
-- Name: tlumaczenie_id_jezyk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tlumaczenie
    ADD CONSTRAINT tlumaczenie_id_jezyk_fkey FOREIGN KEY (id_jezyk) REFERENCES jezyk(id);


--
-- Name: tlumaczenie_nazwa_lang_tag_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tlumaczenie
    ADD CONSTRAINT tlumaczenie_nazwa_lang_tag_fkey FOREIGN KEY (nazwa_lang_tag) REFERENCES lang_tag(nazwa);


--
-- Name: transakcja_id_lista_wsk_adr_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY transakcja
    ADD CONSTRAINT transakcja_id_lista_wsk_adr_fkey FOREIGN KEY (id_lista_wsk_adr) REFERENCES lista_wsk_adr(id);


--
-- Name: transakcja_id_nabywca_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY transakcja
    ADD CONSTRAINT transakcja_id_nabywca_fkey FOREIGN KEY (id_nabywca) REFERENCES klient(id);


--
-- Name: transakcja_id_nieruchomosc_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY transakcja
    ADD CONSTRAINT transakcja_id_nieruchomosc_fkey FOREIGN KEY (id_nieruchomosc) REFERENCES nieruchomosc(id);


--
-- Name: transakcja_id_oferta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY transakcja
    ADD CONSTRAINT transakcja_id_oferta_fkey FOREIGN KEY (id_oferta) REFERENCES oferta(id);


--
-- Name: transakcja_id_wlasciciel_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY transakcja
    ADD CONSTRAINT transakcja_id_wlasciciel_fkey FOREIGN KEY (id_wlasciciel) REFERENCES klient(id);


--
-- Name: transakcja_nier_id_nier_rodzaj_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY transakcja_nier
    ADD CONSTRAINT transakcja_nier_id_nier_rodzaj_fkey FOREIGN KEY (id_nier_rodzaj) REFERENCES nier_rodzaj(id);


--
-- Name: transakcja_nier_id_trans_rodzaj_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY transakcja_nier
    ADD CONSTRAINT transakcja_nier_id_trans_rodzaj_fkey FOREIGN KEY (id_trans_rodzaj) REFERENCES trans_rodzaj(id);


--
-- Name: ustalenia_id_agent_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ustalenia
    ADD CONSTRAINT ustalenia_id_agent_fkey FOREIGN KEY (id_agent) REFERENCES agent(id);


--
-- Name: ustalenia_id_klient_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ustalenia
    ADD CONSTRAINT ustalenia_id_klient_fkey FOREIGN KEY (id_klient) REFERENCES klient(id);


--
-- Name: wlasciciel_id_nieruchomosc_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wlasciciel
    ADD CONSTRAINT wlasciciel_id_nieruchomosc_fkey FOREIGN KEY (id_nieruchomosc) REFERENCES nieruchomosc(id);


--
-- Name: wlasciciel_id_osoba_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wlasciciel
    ADD CONSTRAINT wlasciciel_id_osoba_fkey FOREIGN KEY (id_osoba) REFERENCES osoba(id);


--
-- Name: wypos_nier_strona_id_nier_rodzaj_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wypos_nier_strona
    ADD CONSTRAINT wypos_nier_strona_id_nier_rodzaj_fkey FOREIGN KEY (id_nier_rodzaj) REFERENCES nier_rodzaj(id);


--
-- Name: wypos_nier_strona_id_trans_rodzaj_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wypos_nier_strona
    ADD CONSTRAINT wypos_nier_strona_id_trans_rodzaj_fkey FOREIGN KEY (id_trans_rodzaj) REFERENCES trans_rodzaj(id);


--
-- Name: wypos_nier_strona_id_wyposazenie_nier_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wypos_nier_strona
    ADD CONSTRAINT wypos_nier_strona_id_wyposazenie_nier_fkey FOREIGN KEY (id_wyposazenie_nier) REFERENCES wyposazenie_nier(id);


--
-- Name: wyposazenie_nier_id_parent_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wyposazenie_nier
    ADD CONSTRAINT wyposazenie_nier_id_parent_fkey FOREIGN KEY (id_parent) REFERENCES wyposazenie_nier(id);


--
-- Name: wyposazenie_nier_id_sekcja_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wyposazenie_nier
    ADD CONSTRAINT wyposazenie_nier_id_sekcja_fkey FOREIGN KEY (id_sekcja) REFERENCES sekcja(id);


--
-- Name: wyposazenie_pom_id_parent_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wyposazenie_pom
    ADD CONSTRAINT wyposazenie_pom_id_parent_fkey FOREIGN KEY (id_parent) REFERENCES wyposazenie_pom(id);


--
-- Name: wyposazenie_pom_id_sekcja_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wyposazenie_pom
    ADD CONSTRAINT wyposazenie_pom_id_sekcja_fkey FOREIGN KEY (id_sekcja) REFERENCES sekcja(id);


--
-- Name: wysylka_ofert_zapotrzebowanie_id_oferta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wysylka_ofert_zapotrzebowanie
    ADD CONSTRAINT wysylka_ofert_zapotrzebowanie_id_oferta_fkey FOREIGN KEY (id_oferta) REFERENCES oferta(id);


--
-- Name: wysylka_ofert_zapotrzebowanie_id_zapotrzebowanie_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY wysylka_ofert_zapotrzebowanie
    ADD CONSTRAINT wysylka_ofert_zapotrzebowanie_id_zapotrzebowanie_fkey FOREIGN KEY (id_zapotrzebowanie) REFERENCES zapotrzebowanie(id);


--
-- Name: zamiana_id_oferta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY zamiana
    ADD CONSTRAINT zamiana_id_oferta_fkey FOREIGN KEY (id_oferta) REFERENCES oferta(id);


--
-- Name: zamiana_id_zapotrzebowanie_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY zamiana
    ADD CONSTRAINT zamiana_id_zapotrzebowanie_fkey FOREIGN KEY (id_zapotrzebowanie) REFERENCES zapotrzebowanie(id);


--
-- Name: zap_lokaliz_nier_id_region_geog_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY zap_lokaliz_nier
    ADD CONSTRAINT zap_lokaliz_nier_id_region_geog_fkey FOREIGN KEY (id_region_geog) REFERENCES region_geog(id);


--
-- Name: zap_lokaliz_nier_id_zapotrzebowanie_trans_rodzaj_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY zap_lokaliz_nier
    ADD CONSTRAINT zap_lokaliz_nier_id_zapotrzebowanie_trans_rodzaj_fkey FOREIGN KEY (id_zapotrzebowanie_trans_rodzaj) REFERENCES zapotrzebowanie_trans_rodzaj(id);


--
-- Name: zap_szcz_nier_id_rodz_nier_szcz_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY zap_szcz_nier
    ADD CONSTRAINT zap_szcz_nier_id_rodz_nier_szcz_fkey FOREIGN KEY (id_rodz_nier_szcz) REFERENCES rodz_nier_szczeg(id);


--
-- Name: zap_szcz_nier_id_zapotrzebowanie_trans_rodzaj_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY zap_szcz_nier
    ADD CONSTRAINT zap_szcz_nier_id_zapotrzebowanie_trans_rodzaj_fkey FOREIGN KEY (id_zapotrzebowanie_trans_rodzaj) REFERENCES zapotrzebowanie_trans_rodzaj(id);


--
-- Name: zapotrzebowanie_id_agent_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY zapotrzebowanie
    ADD CONSTRAINT zapotrzebowanie_id_agent_fkey FOREIGN KEY (id_agent) REFERENCES agent(id);


--
-- Name: zapotrzebowanie_id_klient_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY zapotrzebowanie
    ADD CONSTRAINT zapotrzebowanie_id_klient_fkey FOREIGN KEY (id_klient) REFERENCES klient(id);


--
-- Name: zapotrzebowanie_nier_rodzaj_id_nier_rodzaj_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY zapotrzebowanie_nier_rodzaj
    ADD CONSTRAINT zapotrzebowanie_nier_rodzaj_id_nier_rodzaj_fkey FOREIGN KEY (id_nier_rodzaj) REFERENCES nier_rodzaj(id);


--
-- Name: zapotrzebowanie_nier_rodzaj_id_zapotrzebowanie_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY zapotrzebowanie_nier_rodzaj
    ADD CONSTRAINT zapotrzebowanie_nier_rodzaj_id_zapotrzebowanie_fkey FOREIGN KEY (id_zapotrzebowanie) REFERENCES zapotrzebowanie(id);


--
-- Name: zapotrzebowanie_trans_rodzaj_id_status_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY zapotrzebowanie_trans_rodzaj
    ADD CONSTRAINT zapotrzebowanie_trans_rodzaj_id_status_fkey FOREIGN KEY (id_status) REFERENCES status(id);


--
-- Name: zapotrzebowanie_trans_rodzaj_id_trans_rodzaj_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY zapotrzebowanie_trans_rodzaj
    ADD CONSTRAINT zapotrzebowanie_trans_rodzaj_id_trans_rodzaj_fkey FOREIGN KEY (id_trans_rodzaj) REFERENCES trans_rodzaj(id);


--
-- Name: zapotrzebowanie_trans_rodzaj_id_zapotrzebowanie_nier_rodza_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY zapotrzebowanie_trans_rodzaj
    ADD CONSTRAINT zapotrzebowanie_trans_rodzaj_id_zapotrzebowanie_nier_rodza_fkey FOREIGN KEY (id_zapotrzebowanie_nier_rodzaj) REFERENCES zapotrzebowanie_nier_rodzaj(id);


--
-- Name: zdjecie_id_nieruchomosc_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY zdjecie
    ADD CONSTRAINT zdjecie_id_nieruchomosc_fkey FOREIGN KEY (id_nieruchomosc) REFERENCES nieruchomosc(id);


--
-- Name: zmiana_status_id_agent_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY zmiana_status
    ADD CONSTRAINT zmiana_status_id_agent_fkey FOREIGN KEY (id_agent) REFERENCES agent(id);


--
-- Name: zmiana_status_id_oferta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY zmiana_status
    ADD CONSTRAINT zmiana_status_id_oferta_fkey FOREIGN KEY (id_oferta) REFERENCES oferta(id);


--
-- Name: zmiana_status_id_status_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY zmiana_status
    ADD CONSTRAINT zmiana_status_id_status_fkey FOREIGN KEY (id_status) REFERENCES status(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- Name: sub_id_zg_seq; Type: ACL; Schema: public; Owner: azg
--

REVOKE ALL ON SEQUENCE sub_id_zg_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE sub_id_zg_seq FROM azg;
GRANT ALL ON SEQUENCE sub_id_zg_seq TO azg;


--
-- PostgreSQL database dump complete
--

