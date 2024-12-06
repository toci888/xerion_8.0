set client_encoding to latin2;
create language plpgsql;

---to do : renaming funkcji, zapotrzebowanie
---drop function Tlumacz(pojtlumaczenie);
---drop FUNCTION OfertyAgent (integer, text, integer);
drop FUNCTION RegionGeograficznyCzwPozWoj (text_nazwa text, wojewodztwo_id integer);
drop FUNCTION RegionGeograficznyNajnizejWoj (text, integer);
drop FUNCTION PodajDzielniceOpole ();
drop FUNCTION DodajRegGeogZap(integer, integer);
drop FUNCTION ZmianaCena (integer);
drop FUNCTION SprawdzIstOferta (integer);
drop FUNCTION PodajJezykiId();
drop FUNCTION PodajDaneZapotrzebowanie (integer, integer);
drop FUNCTION PodajAgentow();
drop FUNCTION ObnizZdjecie (integer, integer);
drop FUNCTION PodniesZdjecie (integer, integer);
drop FUNCTION PodajDaneUmowa (integer);
drop FUNCTION PodajZapotrzebowanieTelefon (text);
drop FUNCTION PodajOfertyTelefon (text);
drop FUNCTION MediaOsoba (integer);
drop FUNCTION PodajMediaNaCzasie (integer);
drop FUNCTION PodajPrzypomnieniaMedia (integer);
drop FUNCTION DodajEmailMedia (integer, integer, text, text);
drop FUNCTION UsunEmailMedia (integer);
drop FUNCTION PodajEmailMedia (integer);
drop FUNCTION DodajTelefonMedia (integer, integer, text, text, boolean);
drop FUNCTION UsunTelefonMedia (integer);
drop FUNCTION PodajTelefonMedia (integer);
drop FUNCTION PodajOfertyMediaPrzyjecie (boolean, text, integer, integer);
drop FUNCTION PodajOfertyMedia (text, text, integer, integer, date, date, text, integer);
drop FUNCTION DodajReklamaMedia (integer, integer, date);
drop FUNCTION PodajReklamaMedia (integer);
drop FUNCTION DodajKontaktMediaNier (integer, integer, text);
drop FUNCTION PodajKontaktyMediaNier (integer);
drop FUNCTION EdytujMediaNieruchomosc (integer);
drop FUNCTION PodajMediumDlaOfZap (integer, boolean);
drop FUNCTION PrzyjetoZMediow (integer, integer);
drop FUNCTION UaktualnijMediaNieruchomosc (integer, integer, integer, integer, integer, text, boolean, text, text, text, date);
drop FUNCTION DodajMediaNieruchomosc (integer, integer, integer, integer, text, boolean, text, text, text, date, integer, text, integer, text, integer, text, text, text, text);
drop FUNCTION DodajMediaNieruchomoscOs (integer, integer, integer, integer, text, boolean, text, text, text, date, text, integer, integer);
drop FUNCTION PokazWybraneParamOferta (integer, integer);
drop FUNCTION PokazWybraneParamZlecenie (integer, integer);
drop FUNCTION KojarzenieMedia (integer, boolean);
drop FUNCTION KojarzenieMediaOferta (integer); --media - posz, baza - posiada
drop FUNCTION KojarzenieMediaZapotrzebowanie (integer); --media - posiada, baza - poszukuje
drop FUNCTION KojarzenieOfertaMedia (integer);
drop FUNCTION KojarzenieBazoweDlaOferty (integer, integer, integer, boolean);
drop FUNCTION SprawdzObecnoscOfZlec (integer, integer, boolean, float);
drop FUNCTION KojarzenieZapotrzebowanieMedia (integer);
drop FUNCTION KojarzenieBazoweDlaZapotrzebowania (integer, integer, integer, boolean);
drop FUNCTION KojarzenieLokalizacjeMedia (integer, integer);
drop FUNCTION KojarzenieLokalizacjeMediaOferta (integer, integer);
drop FUNCTION KojarzenieLokalizacjeMediaZapotrzebowanie (integer, integer);
drop FUNCTION KojarzenieLokalizacje (integer, integer);
drop FUNCTION KojarzenieNpoziomoweWyp (integer, integer, integer);
drop FUNCTION KojarzenieNpoziomowe (integer, integer, integer);
drop FUNCTION PodajEmaile (integer);
drop FUNCTION UsunEmail (integer);
drop FUNCTION DodajEmail (integer, integer, text, text);
drop FUNCTION TablicaTelefony (integer);
drop FUNCTION PodajWszystkieTelefony (integer);
drop FUNCTION PodajKomorka (integer);
drop FUNCTION UsunKomorka (integer);
drop FUNCTION DodajKomorka (integer, text, text);
drop FUNCTION PodajTelefony (integer);
drop FUNCTION UsunTelefon (integer);
drop FUNCTION DodajTelefon (integer, integer, text, text, boolean);
drop FUNCTION PodajFilmy (integer, text);
drop FUNCTION UsunFilm (integer);
drop FUNCTION DodajFilm (integer, text);
drop FUNCTION PodajZdjecia (integer, text);
drop FUNCTION UsunZdjecie (integer);
drop FUNCTION DodajZdjecie (integer, text);
drop FUNCTION DodajOferta (integer, integer, integer, date, date, text, integer, boolean, text, boolean, boolean, integer, boolean, integer, integer, integer, 
integer, text, text, text, integer, boolean, boolean, integer, boolean);
drop FUNCTION TransakcjaNieruchomosc (integer);
drop FUNCTION RegionNajnGalazRodzice (integer);
drop FUNCTION PelneZagnRegion (integer);
drop FUNCTION SzczegolyNieruchomosc (integer);
drop FUNCTION RegionGeograficznyNajnizej (text);
drop function DowRegionGeograficzny (integer, text);
drop FUNCTION RegionGeograficzny (integer);
drop FUNCTION PodajOsobaZapotrzebowanie (integer);
drop FUNCTION PodajOsobaKlientZmCena (integer);
drop FUNCTION PodajKlientOsoba (integer);
drop FUNCTION PodajOsobaKlientPoZap (integer);
drop function DaneSlownik (text);
drop FUNCTION PodajOsobaDane (integer);
drop FUNCTION OgladanieNieaktywne (integer, integer);
drop FUNCTION PodajDostepneSpotkania (integer);
drop FUNCTION PodajOferenciSpotkanieZapotrzebowanie (integer);
drop FUNCTION PodajSpotkanieZapotrzebowanie (integer);
drop FUNCTION PodajSpotkanieOferta (integer, boolean);
drop FUNCTION PodajSpotkanieOsoba (integer, boolean);
drop FUNCTION UsunSpotkanie (integer);
drop FUNCTION PodajOsPokOfSpotkanie (integer);
drop FUNCTION DodajSpotkanie (integer, integer, integer, integer, integer, integer, date, integer, integer, text, integer[], integer[]);
drop FUNCTION DodajOsobaOgladanie (integer, integer);
drop FUNCTION SprawdzOfZapListaWsk (integer, integer);
drop FUNCTION DodajOgladanie (integer, integer, integer, date, integer, integer, integer[]);
drop FUNCTION UsunOsobaZapotrzebowanie (integer, integer);
drop FUNCTION DodajOsobaZapotrzebowanie (integer, integer);
drop FUNCTION PodajDostZapotrzNierSzczeg (integer, integer);
drop FUNCTION DodajZapotrzNierSzczeg (boolean, integer, integer);
drop FUNCTION PodajZapotrzNierSzczeg (integer);
drop FUNCTION UsunTransNierZapotrzebowanie (integer);
drop FUNCTION DodajTransNierZapotrzebowanie (integer, integer, integer, integer, integer, text, boolean);
drop FUNCTION PodajNierZapotrzebowanie (integer);
drop FUNCTION DodajNierZapotrzebowanie (integer, integer[], boolean);
drop FUNCTION PodajTransDlaNierZapotrzebowanie (integer);
drop FUNCTION PodajIdTransIdNierZapotrzebowanie (integer);
drop FUNCTION EdycjaTransNierZapotrzebowanie (integer);
drop FUNCTION ListaProwDlaTrans (integer);
drop FUNCTION BrakujaceProwizje (integer);
drop FUNCTION UsunProwDlaTrans (integer);
drop FUNCTION DodajProwDlaTrans (integer, integer, integer, text, boolean, integer, text);
drop FUNCTION PodajTransNierZapotrzebowanie (integer);
drop FUNCTION DodajZapotrzebowanie (integer, integer[], date, date, integer, integer);
drop FUNCTION DodajSzczegNierZap (integer, integer);
drop FUNCTION PodajListaWskOferta (integer);
drop FUNCTION PodajListaWskZapotrzebowanie (integer);
drop FUNCTION OfertyOgladniete (integer, integer);
drop FUNCTION OfertaOgladnieta (integer, integer);
drop FUNCTION PodajOfertaDoListaWsk (integer, integer);
drop FUNCTION PodajOpisOferty (integer, integer, integer, integer, integer);
drop FUNCTION UsunSzczegNierZap (integer, integer);
drop FUNCTION UsunOsobaListaWsk (integer);
drop FUNCTION PodajOsListaWsk (integer);
drop FUNCTION PodajOsDostListaWsk (integer, integer);
drop FUNCTION PodajSpotkanieEdycja(integer);
drop FUNCTION DodajSpotkaniePomKal (integer, integer, integer, boolean, integer, integer, date, integer, integer, text, integer[]);
drop FUNCTION UsunOpisZapotrzebowanieTrRodz (integer);
drop FUNCTION DodajOpisZapotrzebowanieTrRodz (integer, integer, integer, text);
drop FUNCTION PodajOpisZapotrzebowanieTrRodz (integer);
drop FUNCTION PodajDostOpisZapotrzebowanieTrRodz (integer);
drop FUNCTION UsunNotatkaZapotrzebowanie (integer);
drop FUNCTION UsunOpisPoszZapotrzebowanie (integer);
drop FUNCTION PodajOpisPoszZapotrzebowanie (integer);
drop FUNCTION DodajOpisPoszZapotrzebowanie (integer, integer, text);
drop FUNCTION PodajOpisZapotrzebowanie (integer);
drop FUNCTION DodajOpisZapotrzebowanie (integer, integer, text, integer, boolean, text);
drop FUNCTION UsunNotatkaNieruchomosc (integer);
drop FUNCTION PodajNotatkaNieruchomoscOfId (integer);
drop FUNCTION PodajNotatkaNieruchomosc (integer);
drop FUNCTION DodajInfoOfSprz (integer, text, boolean, boolean);
drop FUNCTION DodajOpisNieruchomosc (integer, integer, text);
drop FUNCTION PodajOpisOferta (integer);
drop FUNCTION PodajDostOpisOferta (integer);
drop FUNCTION NierDaneOferta (integer);
drop FUNCTION FiltrujZapotrzebowania (integer, integer, integer, integer, text, integer);
drop FUNCTION FiltrujOferty (integer, integer, integer, integer, text, integer);
drop FUNCTION DodajOpisOferta (integer, integer, integer, text);
drop FUNCTION UsunOpisOferta (integer);
drop FUNCTION UsunRegGeogZap (integer, integer);
drop FUNCTION PodajRegGeogZap (integer);
drop FUNCTION DodajParametrZap (boolean, boolean, integer, integer, text);
drop FUNCTION DodajWyposazenieZap (boolean, integer, integer);
drop FUNCTION EdycjaPomieszczeniaNieruchomosc(integer[]);
drop FUNCTION EdycjaZapTransRodzajWypPar (integer);
drop FUNCTION EdycjaZapotrzebowanie (integer);
drop FUNCTION EdycjaOferta (integer);
drop FUNCTION PodajOfertaWyslanaZapotrzebowanie (integer);
drop FUNCTION PodajZapotrzebowanieAdresatOferta (integer);
drop FUNCTION OfertyWejscieGablota ();
drop FUNCTION OfertyZejscieGablota ();
drop FUNCTION OfertaWstrzymana();
drop FUNCTION PokazOdwiedziny (integer, date);
drop FUNCTION PokazZmianaStatus (integer);
drop FUNCTION OfertaPublikuj (integer);
drop FUNCTION OfertaSchowaj (integer);
drop FUNCTION UsunNotatka (integer);
drop FUNCTION PodajNotatkaKlient (integer);
drop FUNCTION DodajNotatkaKlient (integer, integer, text);
drop FUNCTION PodajOsobaKlient (integer);
drop FUNCTION UsunOsobaOferta (integer, integer);
drop FUNCTION PodajOsobaKlientZapId (integer);
drop FUNCTION PodajOsobaKlientOfId (integer);
drop FUNCTION PodajOsobaOferta (integer);
drop FUNCTION DodajOsobaOferta (integer, integer);
drop FUNCTION UsunOsobaKlient (integer, integer);
drop FUNCTION DodajOsobaKlient (integer, integer);
drop FUNCTION EdycjaOsoba (integer);
drop FUNCTION SzukajKlient (integer, integer, text, text, text, text);
drop FUNCTION EdycjaKlient (integer);
drop FUNCTION DodajDokOsoba (integer, integer, text);
drop FUNCTION UsunDokOsoba (integer, integer);
drop FUNCTION PodajDokOsoba (integer);
drop FUNCTION PodajDostDokOsoba (integer);
drop FUNCTION UsunDokOsoba (integer);
drop FUNCTION PodajWlascicieleNier (integer);
drop FUNCTION PodajDostProcUdzialWlasNier (integer, integer);
drop FUNCTION PodajDostOsWlas (integer);
drop FUNCTION DodajWlasciciel (integer, integer, integer, float);
drop FUNCTION UsunWlasciciel (integer);
drop FUNCTION DodajOsoba (integer, integer, text, text, text, integer, text, integer, integer, text[], integer, text[], text[], text[]);
drop FUNCTION DodajAdresOsoba (integer, integer, text, text, text, text);
drop FUNCTION SzukajOsoby (text, text, text);
drop FUNCTION DodajKlient (integer, integer, integer, text[]);
drop FUNCTION SzukajOsoba (text);
drop FUNCTION OfertaKlient (integer, integer);
drop FUNCTION ZapotrzebowanieKlient (integer);
drop FUNCTION ZapotrzebowaniaTabListWskazan (integer[]);
drop FUNCTION SzybkieSzukanieZapotrzebowanie (text, integer);
drop FUNCTION SzukanieOfertaAdres (text);
drop FUNCTION SzybkieSzukanie (text, integer);
drop FUNCTION UsunWpisKalendarz(integer);
drop FUNCTION PodajWpisKalendarz(integer);
drop FUNCTION AgenciWpisKalendarz (integer);
drop FUNCTION PokazKalendarz (integer, date);
drop FUNCTION WpisKalendarz (integer, date, integer, integer, integer[], text, integer);
drop FUNCTION PodajKontoAgenta (integer);
drop FUNCTION SprawdzDostepnoscAgenta (date, integer, integer, integer, integer);
drop FUNCTION AktualizujAgent(integer, text, text, text, text, text, boolean, boolean, boolean, boolean, boolean, boolean, boolean, integer, integer);
drop FUNCTION PodajNazwaAgentId (integer);
drop FUNCTION Logowanie(text, text);
drop FUNCTION UsunPomieszczenieNier (integer);
drop FUNCTION DodajPomieszczenieNier (integer, integer);
drop FUNCTION DodajParametrPom (boolean, integer, integer, text);
drop FUNCTION DodajWyposazeniePom (boolean, integer, integer);
drop FUNCTION DodajParametrNier (boolean, integer, integer, text);
drop FUNCTION DodajWyposazenieNier (boolean, integer, integer);
drop FUNCTION PobierzParametryPomNier (integer);
drop FUNCTION EdycjaParametrPom (integer);
drop FUNCTION EdycjaWyposazeniePom (integer);
drop FUNCTION PobierzWyposazeniePomNier (integer);
drop FUNCTION PobierzPomPrzynNier (integer, integer);
---pobieranie samych pomieszczen w logice moze byc zbedne, wyniknie to z 2 kolejnych metod
drop FUNCTION PobierzPomieszczeniaNieruchomosc (integer);

drop FUNCTION PobierzParametryNier (integer, integer);
drop FUNCTION PobierzWyposazenieNier (integer, integer);
drop FUNCTION PodajWojewodztwa ();
---metody dodawanie i ujmowania wyposazenia nieruchomosci i pomieszczenia
drop function PodajNier();
drop FUNCTION PodajTransRodzaj (text);
drop FUNCTION PodajTransDlaNier (integer, text);
drop function Tlumaczenia();

---end of drop function

---drop type TlumJezykCol;
drop type KalendarzEdycja;
drop type ListaWskZapotrzebowanie;
drop type ZapotrzebowanieDane;
drop type UmowaDane;
drop type ListaWskazanZapotrzebowanie;
drop type OfertaListaWskazan;
drop type OfertaOglDane;
drop type OfertaOgladanaKlient;
drop type OsobaEdycja;
drop type PomPrzynNier;
drop type ZapotrzebowanieNieruchomoscWypPar;
drop type ZapotrzebowanieNieruchomosc;
drop type OfertaNieruchomosc;
drop type OsobaSzukaj;
drop type KlientSzukaj;
drop type KlientOferta;
drop type DodanieOferta;
drop type PomieszczeniaNieruchomosc;
--drop type SzukanieOfertaNieruchomosc;
drop type LogowanieObj;
drop type PomieszczenieParamEdycja;
drop type ParNierPom;
drop type WypNierPom;
drop type ParNierSekcja;
drop type WypNierSekcja;
drop type trans_rodzaj_t;
drop type TlumJezyk;
drop type RegGeog;



---end of drop type
---drop language plpgsql;
---end of languages

---drop view
drop view ZmianaCeny;
drop view PodajDaneUmowaKupno;

drop FUNCTION AgentWersjaOficjalna (integer);
drop type slownik;

drop view SzukajZapotrzebowanieWszystkieOs;
drop view SzukajOfertaWszystkieOs;
drop view ReklamaMedia;
drop view KontaktMediaNier;
drop view MediaNieruchomoscEdycja;
drop view MediaNieruchomosc;
drop view SpotkaniaKlientEdycja;
drop view SpotkaniaKlient;
drop view OfertyWstrzymane;
drop view OfertyZawieszoneNieaktualne;
drop view ZmianyStatusow;
drop view WysylaneOfertyZapotrzebowanie;
drop view Oferty;
drop view NierOferta;
drop view OsobaKlient;
drop view OsobaOferta;
drop view PodajOsListaWsk;
drop view NotatkiPoszZapotrzebowanie;
drop view NotatkiZapotrzebowanie;
--drop view PodajOsDostListaWsk;
drop view NotatkiNieruchomosc;
drop view NotatkiKlient;
drop view OsobaListaWsk;
drop view PodajDaneListaWskAdr;
drop view PodajDostOpisyZapotrzebowanieTrRodz;
drop view PodajOpisyZapotrzebowanieTrRodz;
drop view PodajDostOpisyOferta;
drop view PodajOpisyOferta;
drop view PodajDostOsWlasciciel;
drop view PodajWlascicielNieruchomosc;
drop view PodajDostDowOsoba;
drop view PodajDodaneDowOsoba;
drop view ProwizjeNieUzupelnioneZap;
drop view ProwizjeZapotrzebowanie;
drop view KojarzenieBazoweMedia_Media;
drop view kojarzenieBazoweZapotrzebowanie_Media;
drop view KojarzenieBazoweOferta_Media;
drop view KojarzenieBazoweOferta_Zapotrzebowanie;
drop view KojarzenieBazoweZapotrzebowanie_Oferta;
drop view ZapotrzebowanieIdTransIdNier;
drop view ZapotrzTransNierRodzaj;
drop view SzukajZapotrzebowanieNierView;
drop view SzukajOfertaNierView;
drop view OsobaView;
drop view ListaKalendarz; 
drop view ListaAgent;
drop view LogowanieAgent;
drop view ParamPomNier;
drop view WyposPomNier;
drop view ParamNierTrans;
drop view WyposNierTrans;

---views
alter table region_geog alter COLUMN nazwa type varchar(100);
---create or replace view Tlumaczenie AS 
---select nazwa_lang_tag, nazwa from 

create or replace view WyposNierTrans as
SELECT lista_param_slow_nier.id_wyposazenie_nier as id, lista_param_slow_nier.id_nier_rodzaj, lista_param_slow_nier.id_trans_rodzaj, wyposazenie_nier.id_sekcja, wyposazenie_nier.ma_dzieci, 
wyposazenie_nier.nazwa from lista_param_slow_nier join wyposazenie_nier on lista_param_slow_nier.id_wyposazenie_nier = wyposazenie_nier.id;

create or replace view ParamNierTrans as
SELECT lista_param_nier.id_parametr_nier as id, lista_param_nier.id_nier_rodzaj, lista_param_nier.id_trans_rodzaj, parametr_nier.id_sekcja, walidacja.nazwa as nazwa_walidacja, 
parametr_nier.nazwa, parametr_nier.dl_inf as dl_inf from (lista_param_nier join parametr_nier on lista_param_nier.id_parametr_nier = parametr_nier.id) join walidacja on parametr_nier.id_walidacja = walidacja.id;

---przemyslec czy widok nie powinien zwracac jeszcze id sekcji - jesli nawet, to to id powinno siedziec w pomieszczenie_nier, bo parametr dotyczy calych pomieszczen
---rozdzielanie parametrow poszczegolnego pomieszczenia na sekcje jest kompletnym kretynstwem :P

create or replace view WyposPomNier as
select pomieszczenie.id as id_pomieszczenie, wyposazenie_pom.id, wyposazenie_pom.id_parent, wyposazenie_pom.wielokrotne, wyposazenie_pom.ma_dzieci, wyposazenie_pom.nazwa
from (pomieszczenie join lista_param_slow_pom on pomieszczenie.id = lista_param_slow_pom.id_pomieszczenie) join 
wyposazenie_pom on lista_param_slow_pom.id_wyposazenie_pom = wyposazenie_pom.id;


create or replace view ParamPomNier as
select pomieszczenie.id as id_pomieszczenie, parametr_pom.id, parametr_pom.nazwa, walidacja.nazwa as nazwa_walidacja, parametr_pom.dl_inf as dl_inf 
from ((pomieszczenie join lista_param_pom on pomieszczenie.id = lista_param_pom.id_pomieszczenie) join parametr_pom on 
lista_param_pom.id_parametr_pom = parametr_pom.id) join walidacja on parametr_pom.id_walidacja = walidacja.id;

create or replace view LogowanieAgent as 
select id, id_otodom, nazwa, firma, login, haslo, waznosc_haslo, aktywnosc_konto, wewnetrzny, nip, adres, dodawanie, edycja, kasowanie, druk, adm_klient, adm_dane, zmiana_upr from agent;

create or replace view ListaAgent as 
select id as id_agent, id_otodom, nazwa, nazwa_pot, login, haslo, waznosc_haslo, aktywnosc_konto, telefon, komorka, fax, email, licencja, nadzor, dodawanie, edycja, kasowanie, druk, adm_klient, adm_dane, zmiana_upr from agent;

create or replace view ListaKalendarz as
select kalendarz.id as id_kalendarz, kalendarz.data, godzina.nazwa || ' : ' || minuta.nazwa as godzina, kalendarz.komentarz, 'miejsce' as agent  from kalendarz 
	join godzina on kalendarz.id_godzina = godzina.id 
	join minuta on kalendarz.id_minuta = minuta.id;


CREATE FUNCTION PodajTelefony (osoba_id integer) RETURNS SETOF telefon AS $$
DECLARE
	result telefon;
BEGIN
	FOR result IN select * from telefon where id_osoba = osoba_id order by nazwa asc LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION PodajKomorka (osoba_id integer) RETURNS SETOF komorka AS $$
DECLARE
	result komorka;
BEGIN
	FOR result IN select * from komorka where id_osoba = osoba_id LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION PodajWszystkieTelefony (osoba_id integer) RETURNS SETOF telefon AS $$
DECLARE
	result telefon;
BEGIN
	FOR result in select * from PodajTelefony(osoba_id) LOOP
		RETURN NEXT result;
	END LOOP;
	FOR result in select null, * from PodajKomorka(osoba_id) LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION TablicaTelefony (osoba_id integer) RETURNS text[] AS $$
DECLARE
	result text[];
	telefony telefon;
	licznik integer;
BEGIN
	licznik := 1;
	FOR telefony in select * from PodajWszystkieTelefony(osoba_id) LOOP
		result[licznik] := telefony.nazwa;
		IF character_length (telefony.opis) > 0 THEN
			result[licznik] := telefony.nazwa || ': ' || telefony.opis;
		END IF;
		licznik := licznik + 1;
	END LOOP;
	RETURN result;
END;
$$ LANGUAGE plpgsql;

--telefon.nazwa as telefon, komorka.nazwa as komorka,
create or replace view OsobaView as 
	select distinct on (osoba.id) osoba.id as id_osoba, osoba.nazwisko, osoba.nazwisko_rodowe, imie.nazwa as imie, osoba.pesel, region_geog.nazwa as miejscowosc, 
	osoba_adres.ulica || ' ' || osoba_adres.numer_dom || ' / ' || osoba_adres.numer_miesz as ulica, osoba_adres.kod_pocztowy as kod, null as telefon
	from osoba 
	join imie on osoba.id_imie = imie.id 
	left join osoba_adres on osoba.id = osoba_adres.id 
	left join region_geog on osoba_adres.id_region_geog = region_geog.id;
	--left join telefon on osoba.id = telefon.id_osoba 
	--left join komorka on osoba.id = komorka.id_osoba;

---distinct on (oferta.id), distinct on (osoba.id)
--OsobaView.telefon, OsobaView.komorka,
create or replace view SzukajOfertaNierView as
select oferta.id as id_oferta, oferta.id_rodz_trans, oferta.pokaz, oferta.wylacznosc, oferta.data_otw_zlecenie, nieruchomosc.klucz, nieruchomosc.ulica_net, nieruchomosc.id as id_nieruchomosc, 
nieruchomosc.id_klient, nieruchomosc.id_nier_rodzaj, region_geog.nazwa as miejscowosc, OsobaView.id_osoba, OsobaView.nazwisko || ' ' || OsobaView.imie as nazwisko, oferta.id_status, OsobaView.pesel, 
trans_rodzaj.nazwa as transakcja_rodzaj, nier_rodzaj.nazwa as nieruchomosc_rodzaj, oferta.cena, status.nazwa as status, nieruchomosc.id_agent, nieruchomosc.ulica, 
(select * from TablicaTelefony(OsobaView.id_osoba)) as telefon
	from oferta 
		join nieruchomosc on oferta.id_nieruchomosc = nieruchomosc.id 
		join status on oferta.id_status = status.id 
		join nier_rodzaj on nieruchomosc.id_nier_rodzaj = nier_rodzaj.id 
		join trans_rodzaj on oferta.id_rodz_trans = trans_rodzaj.id 
		join osoba_oferta on oferta.id = osoba_oferta.id_oferta 
		join OsobaView on osoba_oferta.id_osoba = OsobaView.id_osoba 
		join region_geog on nieruchomosc.id_region_geog = region_geog.id;

---distinct on (zapotrzebowanie.id) distinct on (osoba.id) -- te distincty sa niebezpieczne
--OsobaView.telefon, OsobaView.komorka 
create or replace view SzukajZapotrzebowanieNierView as ---przeparkowac to na otwierajacego zlecenie, przy zleceniach  i ofertach dorobic button zleceniodawca
select zapotrzebowanie.id as id_zapotrzebowanie, zapotrzebowanie.id_klient, zapotrzebowanie.data_otw_zlecenie, OsobaView.id_osoba, OsobaView.nazwisko, OsobaView.imie, OsobaView.pesel, 
(select * from TablicaTelefony(OsobaView.id_osoba)) as telefon from ((zapotrzebowanie  
		join osoba_zapotrzebowanie on zapotrzebowanie.id = osoba_zapotrzebowanie.id_zapotrzebowanie) 
		join OsobaView on osoba_zapotrzebowanie.id_osoba = OsobaView.id_osoba);

--OsobaView.komorka, OsobaView.telefon,
create or replace view ZapotrzTransNierRodzaj as select zapotrzebowanie.id as id_zapotrzebowanie, zapotrzebowanie.id_klient, zapotrzebowanie.data_otw_zlecenie, 
	zapotrzebowanie_trans_rodzaj.id as id_zapotrzebowanie_trans_rodzaj, zapotrzebowanie_trans_rodzaj.id_status, status.nazwa as status,	nier_rodzaj.nazwa as nieruchomosc_rodzaj, 
	trans_rodzaj.nazwa_zap as transakcja_rodzaj, zapotrzebowanie_trans_rodzaj.cena::float, zapotrzebowanie_trans_rodzaj.pokaz, zapotrzebowanie_nier_rodzaj.id_nier_rodzaj, 
	zapotrzebowanie_trans_rodzaj.id_trans_rodzaj, agent.nazwa_pot as agent, zapotrzebowanie_trans_rodzaj.id_agent, 
	OsobaView.id_osoba, OsobaView.nazwisko, OsobaView.imie, OsobaView.pesel, (select * from TablicaTelefony(OsobaView.id_osoba)) as telefon
	from zapotrzebowanie 
	join zapotrzebowanie_nier_rodzaj on zapotrzebowanie.id = zapotrzebowanie_nier_rodzaj.id_zapotrzebowanie 
	join zapotrzebowanie_trans_rodzaj on zapotrzebowanie_nier_rodzaj.id = zapotrzebowanie_trans_rodzaj.id_zapotrzebowanie_nier_rodzaj 
	join agent on zapotrzebowanie_trans_rodzaj.id_agent = agent.id 
	join status on zapotrzebowanie_trans_rodzaj.id_status = status.id 
	join nier_rodzaj on zapotrzebowanie_nier_rodzaj.id_nier_rodzaj = nier_rodzaj.id 
	join trans_rodzaj on zapotrzebowanie_trans_rodzaj.id_trans_rodzaj = trans_rodzaj.id
	join osoba_zapotrzebowanie on zapotrzebowanie.id = osoba_zapotrzebowanie.id_zapotrzebowanie
	join OsobaView on osoba_zapotrzebowanie.id_osoba = OsobaView.id_osoba;

create or replace view ZapotrzebowanieIdTransIdNier as select zapotrzebowanie_trans_rodzaj.id as id_zapotrzebowanie_trans_rodzaj, 
	zapotrzebowanie_trans_rodzaj.id_trans_rodzaj as id_trans_rodzaj, zapotrzebowanie_nier_rodzaj.id_nier_rodzaj as id_nier_rodzaj 
	from zapotrzebowanie_trans_rodzaj 
	join zapotrzebowanie_nier_rodzaj on zapotrzebowanie_trans_rodzaj.id_zapotrzebowanie_nier_rodzaj = zapotrzebowanie_nier_rodzaj.id;

---mamy zapotrzebowanie -> szukamy ofert
----or nazwa = '_umowiona'
create or replace view KojarzenieBazoweZapotrzebowanie_Oferta as 
select oferta.id as id_oferta, zapotrzebowanie_nier_rodzaj.id_zapotrzebowanie, zapotrzebowanie_trans_rodzaj.id as id_zapotrzebowanie_trans_rodzaj, oferta.cena::float as cena_oferta, 
zapotrzebowanie_trans_rodzaj.cena::float as cena_zapotrzebowanie 
from nieruchomosc 
	join oferta on nieruchomosc.id = oferta.id_nieruchomosc 
	join zapotrzebowanie_trans_rodzaj on oferta.id_rodz_trans = zapotrzebowanie_trans_rodzaj.id_trans_rodzaj
	join zapotrzebowanie_nier_rodzaj on zapotrzebowanie_trans_rodzaj.id_zapotrzebowanie_nier_rodzaj = zapotrzebowanie_nier_rodzaj.id 
	where zapotrzebowanie_nier_rodzaj.id_nier_rodzaj = nieruchomosc.id_nier_rodzaj and oferta.id_status = (select id from status where nazwa = '_aktualna') and oferta.cena > 0 
	and zapotrzebowanie_trans_rodzaj.cena > 0  and (select count(id) from lista_wsk_adr where id_oferta = oferta.id and id_zapotrzebowanie = zapotrzebowanie_nier_rodzaj.id_zapotrzebowanie) = 0;

---mamy oferte -> szukamy zapotrzebowania
----or nazwa = '_umowiona'
---, '_umowiona'
create or replace view KojarzenieBazoweOferta_Zapotrzebowanie as
select zapotrzebowanie_nier_rodzaj.id_zapotrzebowanie as id_zapotrzebowanie, zapotrzebowanie_trans_rodzaj.id as id_zapotrzebowanie_trans_rodzaj, oferta.id as id_oferta, zapotrzebowanie_trans_rodzaj.id_status, 
oferta.cena::float as cena_oferta, zapotrzebowanie_trans_rodzaj.cena::float as cena_zapotrzebowanie from zapotrzebowanie_nier_rodzaj 
	join zapotrzebowanie_trans_rodzaj on zapotrzebowanie_nier_rodzaj.id = zapotrzebowanie_trans_rodzaj.id_zapotrzebowanie_nier_rodzaj 
	join oferta on oferta.id_rodz_trans = zapotrzebowanie_trans_rodzaj.id_trans_rodzaj 
	join nieruchomosc on oferta.id_nieruchomosc = nieruchomosc.id 
	where zapotrzebowanie_nier_rodzaj.id_nier_rodzaj = nieruchomosc.id_nier_rodzaj and zapotrzebowanie_trans_rodzaj.id_status in (select id from status where nazwa in ('_aktualna')) 
	and oferta.cena > 0 and zapotrzebowanie_trans_rodzaj.cena > 0 and (select count(id) from lista_wsk_adr where id_oferta = oferta.id and id_zapotrzebowanie = zapotrzebowanie_nier_rodzaj.id_zapotrzebowanie) = 0;

---mamy oferte - szukamy w mediach
---- or nazwa = '_umowiona'
create or replace view KojarzenieBazoweOferta_Media as ---potem potrzeba id nieruchomosci ktore stad juz mozna miec, tam jest brane od nowa
select oferta.id as id_oferta, media_nieruchomosc.id as id_media_nieruchomosc, media_nieruchomosc.cena::float as cena_media, oferta.cena::float as cena_oferta from oferta 
	join nieruchomosc on oferta.id_nieruchomosc = nieruchomosc.id 
	join media_nieruchomosc on oferta.id_rodz_trans = media_nieruchomosc.id_trans_rodzaj 
	where nieruchomosc.id_nier_rodzaj = media_nieruchomosc.id_nier_rodzaj and media_nieruchomosc.oferent = false and media_nieruchomosc.id_status = 
	(select id from status where nazwa = '_aktualna') and oferta.id_status = (select id from status where nazwa = '_aktualna') and oferta.cena > 0 and media_nieruchomosc.cena > 0;

---mamy zapotrzebowanie - szukamy w mediach
create or replace view KojarzenieBazoweZapotrzebowanie_Media as
select zapotrzebowanie_trans_rodzaj.id as id_zapotrzebowanie_trans_rodzaj, zapotrzebowanie_trans_rodzaj.cena::float as cena_zapotrzebowanie, media_nieruchomosc.id as id_media_nieruchomosc, 
media_nieruchomosc.cena::float as cena_media from zapotrzebowanie_nier_rodzaj 
	join zapotrzebowanie_trans_rodzaj on zapotrzebowanie_nier_rodzaj.id = zapotrzebowanie_trans_rodzaj.id_zapotrzebowanie_nier_rodzaj 
	join media_nieruchomosc on zapotrzebowanie_trans_rodzaj.id_trans_rodzaj = media_nieruchomosc.id_trans_rodzaj 
	where zapotrzebowanie_nier_rodzaj.id_nier_rodzaj = media_nieruchomosc.id_nier_rodzaj and media_nieruchomosc.oferent = true and media_nieruchomosc.id_status in (select id from status where nazwa = '_aktualna' or nazwa = '_umowiona') 
	and zapotrzebowanie_trans_rodzaj.cena > 0 and media_nieruchomosc.cena > 0;

---media - media
---- or nazwa = '_umowiona'
----or nazwa = '_umowiona'
create or replace view KojarzenieBazoweMedia_Media as 
select media_n_of.id as id_media_nieruchomosc_o, media_n_z.id as id_media_nieruchomosc_z, media_n_of.cena::float as cena_oferta, media_n_z.cena::float as cena_zapotrzebowanie 
	from media_nieruchomosc media_n_of 
	join media_nieruchomosc media_n_z on media_n_of.id_trans_rodzaj = media_n_z.id_trans_rodzaj 
	where media_n_z.oferent = false and media_n_of.oferent = true and media_n_of.id_nier_rodzaj = media_n_z.id_nier_rodzaj and media_n_z.id_status = 
	(select id from status where nazwa = '_aktualna') and media_n_of.id_status = (select id from status where nazwa = '_aktualna') and 
	media_n_z.cena > 0 and media_n_of.cena > 0;

---prowizje
create or replace view ProwizjeZapotrzebowanie as 
	select prowizja_zapotrzebowanie.id as id_prow_zap, prowizja_zapotrzebowanie.id_zapotrzebowanie, prowizja_zapotrzebowanie.prowizja_proc as prow_proc, prowizja_zapotrzebowanie.prowizja, 
	prowizja_zapotrzebowanie.id_sposob_finansowania, prowizja_zapotrzebowanie.poszukiwane_dla, trans_rodzaj.nazwa_zap as transakcja_rodzaj, sposob_finansowania.nazwa as sposob_finansowania 
	from prowizja_zapotrzebowanie 
	join trans_rodzaj on prowizja_zapotrzebowanie.id_trans_rodzaj = trans_rodzaj.id
	join sposob_finansowania on prowizja_zapotrzebowanie.id_sposob_finansowania = sposob_finansowania.id;

create or replace view ProwizjeNieUzupelnioneZap as 
	select distinct trans_rodzaj.id as id_rodz_trans, zapotrzebowanie_nier_rodzaj.id_zapotrzebowanie, trans_rodzaj.nazwa_zap as transakcja_rodzaj from zapotrzebowanie_nier_rodzaj join zapotrzebowanie_trans_rodzaj on 
	zapotrzebowanie_nier_rodzaj.id = zapotrzebowanie_trans_rodzaj.id_zapotrzebowanie_nier_rodzaj join trans_rodzaj on zapotrzebowanie_trans_rodzaj.id_trans_rodzaj = 
	trans_rodzaj.id where zapotrzebowanie_trans_rodzaj.id_trans_rodzaj not in (select id_trans_rodzaj from prowizja_zapotrzebowanie where 
	id_zapotrzebowanie = zapotrzebowanie_nier_rodzaj.id_zapotrzebowanie);
---osoba_dowod.id as id_osoba_dowod, 
create or replace view PodajDodaneDowOsoba as
	select osoba_dowod.id_osoba as id_osoba, rodzaj_dowod_tozsamosc.id as id_rodzaj_dowod_tozsamosc, osoba_dowod.nazwa as nr_dowod, rodzaj_dowod_tozsamosc.nazwa as rodzaj_dowod from osoba_dowod join 
	rodzaj_dowod_tozsamosc on osoba_dowod.id_rodzaj_dowod_tozsamosc = rodzaj_dowod_tozsamosc.id;

create or replace view PodajDostDowOsoba as
	select distinct rodzaj_dowod_tozsamosc.id as id_rodzaj_dowod_tozsamosc, osoba.id as id_osoba, rodzaj_dowod_tozsamosc.nazwa as rodzaj_dowod from rodzaj_dowod_tozsamosc, osoba 
	where rodzaj_dowod_tozsamosc.id not in (select id_rodzaj_dowod_tozsamosc from osoba_dowod where id_osoba = osoba.id);

create or replace view PodajWlascicielNieruchomosc as
	select wlasciciel.id as id_wlasciciel, wlasciciel.id_osoba as id_osoba, osoba.nazwisko, imie.nazwa as imie, osoba.pesel, wlasciciel.procent_udzial, wlasciciel.id_nieruchomosc from osoba 
	join wlasciciel on osoba.id = wlasciciel.id_osoba 
	join imie on osoba.id_imie = imie.id;

create or replace view PodajDostOsWlasciciel as 
	select nieruchomosc.id as id_nieruchomosc, osoba_klient.id_osoba, osoba.nazwisko, imie.nazwa as imie, osoba.pesel from nieruchomosc join osoba_klient on nieruchomosc.id_klient = osoba_klient.id_klient join osoba on osoba_klient.id_osoba = 
	osoba.id join imie on osoba.id_imie = imie.id where osoba.id not in (select id_osoba from wlasciciel where id_nieruchomosc = nieruchomosc.id);

create or replace view PodajOpisyOferta as
	select opis.id as id_opis, oferta.id as id_oferta, opis.id_jezyk, jezyk.nazwa as jezyk, opis.wartosc as opis from oferta join opis on oferta.id = opis.id_oferta join jezyk on opis.id_jezyk = jezyk.id;

create or replace view PodajDostOpisyOferta as 
	select oferta.id as id_oferta, jezyk.id as id_jezyk, jezyk.nazwa as jezyk from oferta, jezyk where jezyk.id not in (select id_jezyk from opis where id_oferta = oferta.id);

create or replace view PodajOpisyZapotrzebowanieTrRodz as
	select zapotrzebowanie_trans_rodzaj.id as id_zapotrzebowanie_trans_rodzaj, opis_zapotrzebowanie.id as id_opis, opis_zapotrzebowanie.id_jezyk, jezyk.nazwa as jezyk, 
	opis_zapotrzebowanie.wartosc as opis from zapotrzebowanie_trans_rodzaj 
	join opis_zapotrzebowanie on zapotrzebowanie_trans_rodzaj.id = opis_zapotrzebowanie.id_zapotrzebowanie_trans_rodzaj 
	join jezyk on 
	opis_zapotrzebowanie.id_jezyk = jezyk.id;

create or replace view PodajDostOpisyZapotrzebowanieTrRodz as 
	select zapotrzebowanie_trans_rodzaj.id as id_zapotrzebowanie_trans_rodzaj, jezyk.id as id_jezyk, jezyk.nazwa as jezyk from zapotrzebowanie_trans_rodzaj, jezyk where jezyk.id not in 
	(select id_jezyk from opis_zapotrzebowanie where id_zapotrzebowanie_trans_rodzaj = zapotrzebowanie_trans_rodzaj.id);

---pomyslec o jakims distinctcie, albo i nie :P
create or replace view PodajDaneListaWskAdr as
	select oferta.id as id_oferta, zapotrzebowanie.id as id_zapotrzebowanie, nieruchomosc.id as id_nieruchomosc, agent.nazwa_pot as agent, oferta.cena, nier_rodzaj.nazwa as nieruchomosc_rodzaj, 
	trans_rodzaj.nazwa as transakcja_rodzaj, nieruchomosc.ulica, (lista_wsk_adr.ogladanie_data || ' ' || godzina.nazwa || ':' || minuta.nazwa)::timestamp as ogladanie_data, oferta.id_status 
	---, dtxt_pow.wartosc as powierzchnia, dtxt_il.wartosc as ilosc_pokoi 
	from lista_wsk_adr 
	join agent on lista_wsk_adr.id_agent = agent.id 
	join zapotrzebowanie on lista_wsk_adr.id_zapotrzebowanie = zapotrzebowanie.id 
	join oferta on lista_wsk_adr.id_oferta = oferta.id 
	join nieruchomosc on oferta.id_nieruchomosc = nieruchomosc.id 
	join nier_rodzaj on nieruchomosc.id_nier_rodzaj = nier_rodzaj.id 
	join trans_rodzaj on oferta.id_rodz_trans = trans_rodzaj.id 
	join godzina on lista_wsk_adr.ogladanie_godzina = godzina.id 
	join minuta on lista_wsk_adr.ogladanie_minuta = minuta.id order by ogladanie_data asc;
--	join dane_txt_nier dtxt_pow on nieruchomosc.id = dtxt_pow.id_nieruchomosc 
--	join dane_txt_nier dtxt_il on nieruchomosc.id = dtxt_il.id_nieruchomosc 
--	where dtxt_pow.id_parametr_nier = (select id from parametr_nier where nazwa = '_powierzchnia_uzytkowa') 
--	and dtxt_il.id_parametr_nier = (select id from parametr_nier where nazwa = '_ilosc_pokoi');

create or replace view OsobaListaWsk as
	select lista_wsk_adr.id_oferta, lista_wsk_adr.id_zapotrzebowanie, osoba_lista_wsk_adr.id_osoba from osoba_lista_wsk_adr 
	join lista_wsk_adr on osoba_lista_wsk_adr.id_lista_wsk_adr = lista_wsk_adr.id;

create or replace view NotatkiKlient as
	select ustalenia.id as id_notatka, ustalenia.id_klient, agent.nazwa_pot as agent, ustalenia.data, ustalenia.tresc as notatka from ustalenia 
	join agent on ustalenia.id_agent = agent.id;

create or replace view NotatkiNieruchomosc as
	select opis_nieruchomosc.id as id_opis_nieruchomosc, opis_nieruchomosc.id_nieruchomosc, agent.nazwa_pot as agent, opis_nieruchomosc.data, opis_nieruchomosc.tresc as notatka from opis_nieruchomosc 
	join agent on opis_nieruchomosc.id_agent = agent.id;

create or replace view NotatkiZapotrzebowanie as
	select opis_wew_zapotrzebowanie.id as id_opis_zapotrzebowanie, opis_wew_zapotrzebowanie.id_zapotrzebowanie, agent.nazwa_pot as agent, opis_wew_zapotrzebowanie.data, 
	opis_wew_zapotrzebowanie.tresc as tresc, opis_wew_zapotrzebowanie.id_oferta, opis_wew_zapotrzebowanie.cena, opis_wew_zapotrzebowanie.zainteresowany  from opis_wew_zapotrzebowanie 
	join agent on opis_wew_zapotrzebowanie.id_agent = agent.id;

create or replace view NotatkiPoszZapotrzebowanie as
	select opis_posz_zapotrzebowanie.id as id_opis_posz_zapotrzebowanie, opis_posz_zapotrzebowanie.id_zapotrzebowanie_trans_rodzaj, agent.nazwa_pot as agent, 
	opis_posz_zapotrzebowanie.wartosc, opis_posz_zapotrzebowanie.data from opis_posz_zapotrzebowanie 
	join agent on opis_posz_zapotrzebowanie.id_agent = agent.id;

---lista_wsk_adr.id as id_lista_wsk_adr, 
---lista_wsk_adr on osoba_klient.id_klient = lista_wsk_adr.id_klient 
--create or replace view PodajOsDostListaWsk as
--	select osoba.id as id_osoba, osoba.nazwisko, imie.nazwa as imie from osoba join osoba_klient on osoba.id = osoba_klient.id_osoba 
--	join imie on osoba.id_imie = imie.id join where osoba.id not in (select id_osoba from osoba_lista_wsk_adr 
--	where id_lista_wsk_adr = lista_wsk_adr.id);

create or replace view PodajOsListaWsk as
	select lista_wsk_adr.id as id_lista_wsk_adr, osoba_lista_wsk_adr.id as id_osoba_lista_wsk_adr, osoba.id as id_osoba, osoba.nazwisko, imie.nazwa as imie from osoba 
	join osoba_klient on osoba.id = osoba_klient.id_osoba join imie on osoba.id_imie = imie.id join lista_wsk_adr on osoba_klient.id_klient = lista_wsk_adr.id_klient 
	join osoba_lista_wsk_adr on lista_wsk_adr.id = osoba_lista_wsk_adr.id_lista_wsk_adr; ---where osoba.id in (select id_osoba from osoba_lista_wsk_adr 
	---where id_lista_wsk_adr = lista_wsk_adr.id);

create or replace view OsobaOferta as ---mozna wywalic to id osoba oferta
	select osoba_oferta.id as id_osoba_oferta, osoba_oferta.id_oferta, OsobaView.id_osoba, OsobaView.imie, OsobaView.nazwisko, OsobaView.pesel, 
	(select * from TablicaTelefony(OsobaView.id_osoba)) as telefon  
	from osoba_oferta 
	join OsobaView on osoba_oferta.id_osoba = OsobaView.id_osoba;

create or replace view OsobaKlient as
	select osoba_klient.id_klient as id_klient, OsobaView.id_osoba, OsobaView.imie, OsobaView.nazwisko, OsobaView.pesel, (select * from TablicaTelefony(OsobaView.id_osoba)) as telefon from osoba_klient 
	join OsobaView on osoba_klient.id_osoba = OsobaView.id_osoba;

create or replace view NierOferta as
	select oferta.id as id_oferta, oferta.id_nieruchomosc, oferta.id_rodz_trans, nieruchomosc.id_nier_rodzaj from oferta join nieruchomosc on oferta.id_nieruchomosc = nieruchomosc.id;

create or replace view Oferty as
	select oferta.id as id_oferta, oferta.id_status, oferta.pokaz, oferta.wylacznosc, nieruchomosc.klucz, status.nazwa as status, oferta.id_rodz_trans, nieruchomosc.id_nier_rodzaj, 
	nier_rodzaj.nazwa as nieruchomosc_rodzaj, trans_rodzaj.nazwa as transakcja_rodzaj, oferta.data_otw_zlecenie, oferta.cena::float, nieruchomosc.ulica_net, agent.nazwa_pot as agent, 
	nieruchomosc.id_agent from oferta 
	join status on oferta.id_status = status.id 
	join nieruchomosc on oferta.id_nieruchomosc = nieruchomosc.id 
	join trans_rodzaj on oferta.id_rodz_trans = trans_rodzaj.id 
	join nier_rodzaj on nieruchomosc.id_nier_rodzaj = nier_rodzaj.id
	join agent on nieruchomosc.id_agent = agent.id;

---widok podaje wszystkie aktualnie wstrzymane
----join oferty nie jest potrzebny - jesli jest brane maxymalne id z tabeli zmiana status to ten status powinien byc najaktualniejszym, chyba ze procedura by zle dzialala
---w widoku zawieszone nieaktualne zostalo to ujete - zadzialalo, a ze potrzebna jest tabela nier to i tak oferte trza podlaczyc
create or replace view OfertyWstrzymane as 
	select distinct zmiana_status.id_oferta, zmiana_status.id, zmiana_status.id_agent, zmiana_status.data from zmiana_status join oferta on zmiana_status.id_oferta = oferta.id 
	where zmiana_status.id_status = (select id from status where nazwa = '_wstrzymana') and zmiana_status.id_status = oferta.id_status and zmiana_status.id = (select max(id) from zmiana_status where id_oferta = oferta.id);

create or replace view OfertyZawieszoneNieaktualne as 
	select distinct zmiana_status.id_oferta, zmiana_status.id_status, oferta.cena, nier_rodzaj.nazwa as nieruchomosc_rodzaj, zmiana_status.id_agent, zmiana_status.data from nier_rodzaj, zmiana_status 
	join oferta on zmiana_status.id_oferta = oferta.id join nieruchomosc on oferta.id_nieruchomosc = nieruchomosc.id
	where nier_rodzaj.id = nieruchomosc.id_nier_rodzaj and zmiana_status.id_status in (select id from status where nazwa in ('_zawieszona', '_nieaktualna')) 
	and zmiana_status.id = (select max(id) from zmiana_status z1 where id_oferta = zmiana_status.id_oferta);

---zmiana statusu widok do procedury
create or replace view ZmianyStatusow as 
	select zmiana_status.id_oferta, zmiana_status.data, agent.nazwa_pot as agent, status.nazwa as status from zmiana_status join agent on zmiana_status.id_agent = agent.id 
	join status on zmiana_status.id_status = status.id;

---wysylki do zleceniodawcow - pokazanie
create or replace view WysylaneOfertyZapotrzebowanie as
	select id_zapotrzebowanie, id_oferta, cena, data, is_lst_wsk from wysylka_ofert_zapotrzebowanie;

---pokazac dane osoby
create or replace view SpotkaniaKlient as 
	select spotkanie.id as id_spotkanie, spotkanie_os.id_osoba, spotkanie.id_klient, spotkanie.id_oferta, spotkanie.id_zapotrzebowanie, spotkanie.klient_oferujacy as is_oferent, Osobaview.imie, 
	OsobaView.nazwisko, (select * from TablicaTelefony(OsobaView.id_osoba)) as telefon, umowienie.nazwa as umowienie, spotkanie.spotkanie_data as data, godzina.nazwa || ' : ' || minuta.nazwa as godzina, 
	agent.nazwa_pot as agent from spotkanie 
	join spotkanie_os on spotkanie.id = spotkanie_os.id_spotkanie 
	join OsobaView on spotkanie_os.id_osoba = OsobaView.id_osoba 
	join agent on spotkanie.id_agent = agent.id 
	join umowienie on spotkanie.id_umowienie = umowienie.id 
	join godzina on spotkanie.spotkanie_godzina = godzina.id 
	join minuta on spotkanie.spotkanie_minuta = minuta.id;

create or replace view SpotkaniaKlientEdycja as ---cos pod edycje istniejacego spotkania, dopis oferent chyba na wyrost
	select spotkanie.id as id_spotkanie, spotkanie.id_klient, spotkanie.id_oferta, spotkanie.id_zapotrzebowanie, spotkanie.klient_oferujacy as is_oferent, 
	id_umowienie, spotkanie.spotkanie_data as data, spotkanie.spotkanie_godzina as id_godzina, spotkanie.spotkanie_minuta as id_minuta, agent.nazwa_pot as agent from spotkanie 
	join agent on spotkanie.id_agent = agent.id;

---ten distinct jest niebezpieczny .... ;( uwazac z tym
---distinct on (media_nieruchomosc.id)
---dodac tu ulice do pokazania
create or replace view MediaNieruchomosc as 
	select media_nieruchomosc.id as id_media_nieruchomosc, nier_rodzaj.nazwa as nieruchomosc_rodzaj, media_nieruchomosc.cena, trans_rodzaj.nazwa as transakcja_rodzaj, 
	media_nieruchomosc.id_region_geog, region_geog.nazwa as region, media_nieruchomosc.ulica, status.nazwa as status, media_nieruchomosc.id_status, media_nieruchomosc.data, 
	media_nieruchomosc.oferent, media_nieruchomosc.przypomnienie, agent.nazwa_pot as agent, media_nieruchomosc.id_agent, telefon_media_nieruchomosc.nazwa as telefon, media_nieruchomosc.id_osoba, 
	media_nieruchomosc.id_of_zap, media_nieruchomosc.id_nier_rodzaj, media_nieruchomosc.id_trans_rodzaj, media_reklama.nazwa as media_reklama 
	from media_nieruchomosc 
	join nier_rodzaj on media_nieruchomosc.id_nier_rodzaj = nier_rodzaj.id 
	join trans_rodzaj on media_nieruchomosc.id_trans_rodzaj = trans_rodzaj.id 
	left join region_geog on media_nieruchomosc.id_region_geog = region_geog.id 
	join status on media_nieruchomosc.id_status = status.id 
	join agent on media_nieruchomosc.id_agent = agent.id 
	join media_reklama on media_nieruchomosc.id_media_reklama = media_reklama.id 
	left join telefon_media_nieruchomosc on media_nieruchomosc.id = telefon_media_nieruchomosc.id_media_nieruchomosc;

create or replace view MediaNieruchomoscEdycja as ---media_nieruchomosc.id_agent,
	select media_nieruchomosc.id as id_media_nieruchomosc, media_nieruchomosc.id_nier_rodzaj, media_nieruchomosc.id_trans_rodzaj, media_nieruchomosc.id_region_geog, region_geog.nazwa as region, 
	media_nieruchomosc.ulica, media_nieruchomosc.powierzchnia, media_nieruchomosc.cena, media_nieruchomosc.opis, media_nieruchomosc.id_status, media_nieruchomosc.data, media_nieruchomosc.oferent, 
	media_nieruchomosc.przypomnienie, agent.nazwa_pot as agent, media_nieruchomosc.id_osoba, media_nieruchomosc.id_of_zap, imie.nazwa as imie, osoba.nazwisko 
	from media_nieruchomosc 
	left join region_geog on media_nieruchomosc.id_region_geog = region_geog.id 
	join agent on media_nieruchomosc.id_agent = agent.id
	left join osoba on media_nieruchomosc.id_osoba = osoba.id
	left join imie on osoba.id_imie = imie.id;

create or replace view KontaktMediaNier as 
	select kon_m_nieruchomosc.id_media_nieruchomosc, komentarz, data, agent.nazwa_pot as agent from kon_m_nieruchomosc 
	join agent on kon_m_nieruchomosc.id_agent = agent.id;

create or replace view ReklamaMedia as 
	select reklama_nieruchomosc_m.id_media_nieruchomosc, media_reklama.nazwa as media_reklama, reklama_nieruchomosc_m.data from reklama_nieruchomosc_m 
	join media_reklama on reklama_nieruchomosc_m.id_media_reklama = media_reklama.id;

create or replace view SzukajOfertaWszystkieOs as
select oferta.id as id_oferta, nieruchomosc.id as id_nieruchomosc, nieruchomosc.id_klient, region_geog.nazwa as miejscowosc, osoba.id as id_osoba, osoba.nazwisko, oferta.id_status, 
imie.nazwa as imie, osoba.pesel, telefon.nazwa as telefon, komorka.nazwa as komorka, trans_rodzaj.nazwa as transakcja_rodzaj, nier_rodzaj.nazwa as nieruchomosc_rodzaj, oferta.cena, 
status.nazwa as status
	from oferta 
		join nieruchomosc on oferta.id_nieruchomosc = nieruchomosc.id 
		join status on oferta.id_status = status.id 
		join nier_rodzaj on nieruchomosc.id_nier_rodzaj = nier_rodzaj.id 
		join trans_rodzaj on oferta.id_rodz_trans = trans_rodzaj.id 
		join osoba_klient on nieruchomosc.id_klient = osoba_klient.id_klient 
		join osoba on osoba_klient.id_osoba = osoba.id 
		join imie on osoba.id_imie = imie.id 
		join region_geog on nieruchomosc.id_region_geog = region_geog.id 
		left join telefon on osoba.id = telefon.id_osoba 
		left join komorka on osoba.id = komorka.id_osoba;
---distinct on (zapotrzebowanie.id) distinct on (osoba.id) -- te distincty sa niebezpieczne
create or replace view SzukajZapotrzebowanieWszystkieOs as ---przeparkowac to na otwierajacego zlecenie, przy zleceniach  i ofertach dorobic button zleceniodawca
select zapotrzebowanie.id as id_zapotrzebowanie, zapotrzebowanie.id_klient, osoba.id as id_osoba, osoba.nazwisko, imie.nazwa as imie, osoba.pesel, telefon.nazwa as telefon, komorka.nazwa as komorka 
		from ((zapotrzebowanie  
		join osoba_klient on zapotrzebowanie.id_klient = osoba_klient.id_klient) 
		join osoba on osoba_klient.id_osoba = osoba.id) 
		join imie on osoba.id_imie = imie.id 
		left join telefon on osoba.id = telefon.id_osoba 
		left join komorka on osoba.id = komorka.id_osoba;

create or replace view ZmianaCeny as 
select cena.id_oferta, cena.cena, cena.data, cena.podpis, agent.nazwa_pot as agent, OsobaView.nazwisko, OsobaView.imie from cena join agent on cena.id_agent = agent.id join OsobaView on cena.id_osoba = OsobaView.id_osoba;

create type slownik as (
id integer,
nazwa text);

CREATE FUNCTION AgentWersjaOficjalna (jezyk_id integer) RETURNS SETOF slownik AS $$
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
$$ LANGUAGE plpgsql;

---tu ten telefon to kiepska sprawa ...
create or replace view PodajDaneUmowaKupno as 
	select zapotrzebowanie.id as id_zapotrzebowanie, zapotrzebowanie.id_klient, zapotrzebowanie.data_otw_zlecenie as data, agent_f.nazwa as agent, agent.komorka as komorka_agent, 
	osoba_zapotrzebowanie.id_osoba, klient.id_osobowosc, osobowosc.nazwa as osobowosc, osobaview.imie, osobaview.nazwisko, osobaview.nazwisko_rodowe, osobaview.pesel
	--(select * from TablicaTelefony(OsobaView.id_osoba)) as telefon 
	from zapotrzebowanie 
	join AgentWersjaOficjalna(1) agent_f on zapotrzebowanie.id_agent = agent_f.id
	join agent on zapotrzebowanie.id_agent = agent.id
	join osoba_zapotrzebowanie on zapotrzebowanie.id = osoba_zapotrzebowanie.id_zapotrzebowanie 
	join klient on zapotrzebowanie.id_klient = klient.id 
	join osobowosc on klient.id_osobowosc = osobowosc.id 
	join osobaview on osoba_zapotrzebowanie.id_osoba = osobaview.id_osoba;

---create language plpgsql;

---TYPES


create type PomPrzynNier as (
id integer,
nr_pomieszczenie integer,
nazwa text);

---typ pod region geograficzny z tablica kolejnych rodzicow do zlozenia pod php, ten typ ma zwracac procedura
create type RegGeog as (
id_region_geog integer,
region text,
rodzice text[]);

create type TlumJezyk AS (
id_jezyk integer,
nazwa text,
nazwa_tag text[],
tlumaczenie text[]);

create type trans_rodzaj_t AS (
id_trans integer,
nazwa_trans varchar);
---typ zapamietuje informacje o wyposazeniu nieruchomosci ze slownikow dla jednej sekcji
---setof typu zwraca info dla wszystkich sekcji

create type WypNierSekcja AS (
id_sekcja integer, ---numer sekcji, id ze s³ownika sekcji
nazwa_sekcja text, ---nazwa sekcji
id_parent integer[], ---numer id rodzica danego elementu s³ownika
id integer[], ---numer id danego elementu s³ownika
wielokrotne boolean[], ---informacja o tym, czy dana informacja, w przypadku, kiedy jest z³o¿ona, ma naturê wielokrotn¹ (rodzic mo¿e byæ wybierany z wieloma elementami) czy nie
nazwa text[]); ---tekst nazwy elementu

---typ zapamietuje parametry slownikowe pisane z reki dla nieruchomosci dla danej sekcji
---setof typu pamieta to dla wszystkich sekcji

create type ParNierSekcja AS (
id_sekcja integer,
nazwa_sekcja text,
id integer[],
walidacja text[],
nazwa text[],
dl_inf integer[]);

---typ pamieta parametry slownikowe (wyposazenie) pomieszczenia
---setof typu zwraca dla danej nieruchomosci dla wszystkich pomieszczen to info

create type WypNierPom as (
id integer,
id_parent integer,
wielokrotne boolean,
nazwa text);


create type ParNierPom AS (
id integer,
walidacja text,
nazwa text,
dl_inf integer);

create type PomieszczenieParamEdycja AS (
id integer,
wartosc text);

create type LogowanieObj AS ( ---1 element typu slownik, ktory mi pomoga podawac przyczyne niezalogowania - tu poznaje po rezultatcie czy sie udalo czy nie - nie po id, niech juz tak bedzie
nazwa text,
rezultat boolean,
id_agent integer,
id_agent_otodom integer,
il_dni_wyg integer,
aktywnosc boolean,
wewnetrzny varchar(4),
nip varchar(13),
adres text,
firma text,
bank text[],
nr_konto varchar(26)[],
dodawanie boolean, 
edycja boolean, 
kasowanie boolean,
druk boolean,
adm_klient boolean,
adm_dane boolean,
zmiana_upr boolean);

--create type SzukanieOfertaNieruchomosc AS (
--id_oferta integer,
--id_nieruchomosc integer,
--nazwisko text,
--imie text,
--miejscowosc text,
--rodzaj_nier text,
--rodzaj_trans text,
--cena text);
---po co to w ogole ???
create type KlientOferta AS (
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
numer_miesz text);
--id_osoba_klient integer[], ---id do kasowania z tabeli osoba_klient ??
--id_osoba integer[],
--imie text[],
--nazwisko text[]);

create type OsobaSzukaj AS (
id_osoba integer,
imie text,
nazwisko text,
pesel text);

create type KlientSzukaj AS (
id_osoba integer,
id_klient integer,
---osobowosc text,
--kod_pocztowy text,
--miejscowosc text,
--ulica text,
nazwisko text,
imie text,
pesel text,
telefon text,
komorka text,
nazwa_firma text);
---pytanie czy jest sens robic typ jak to jest 1 do 1
--create type OsobaEdycja AS (
--id_imie integer,
--nazwisko text,
--nazwisko_rodowe text,
--pesel text,
--nr_dowod text);

---typ do edycji
create type OfertaNieruchomosc AS (
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
---dane o nieruchomosci
dane_wyposazenie_nier integer[],
dane_parametr_nier integer[],
dane_parametr_nier_wartosc text[]);
--dane_pomieszczenie_przyn_nier integer[]); ---pomieszczenia przyn nie beda tu tak uzywane wiec stad najpewniej wyleca :P :)

---typ do pokazania rodzajow transakcji dla zapotrzebowania, od razy tez do edycji
--create type ZapotrzTransNierRodzaj AS (
--id integer,
--id_zapotrzebowanie_nier_rodzaj integer,
--id_status integer,
--nier_rodzaj text,
--trans_rodzaj text,
--cena text,
--pokaz boolean);

---typ do edycji zapotrzebowania
create type ZapotrzebowanieNieruchomosc AS (
id_zapotrzebowanie integer,
id_klient integer,
id_nier_rodzaj integer[],
agent text,
data_otw_zlecenie date,
data_zam_zlecenie date);

---dane o nieruchomosci

create type ZapotrzebowanieNieruchomoscWypPar AS (
id_zapotrzebowanie_trans_rodzaj integer,
dane_wyposazenie_zap integer[],
dane_parametr_zap_min integer[],
dane_parametr_zap_min_wartosc text[],
dane_parametr_zap_max integer[],
dane_parametr_zap_max_wartosc text[]);

create type DodanieOferta AS (
id_nieruchomosc integer,
id_oferta integer);

create type PomieszczeniaNieruchomosc as (
id_pomieszczenie integer,
nr_pomieszczenie integer,
nazwa_pomieszczenie text,
dane_id_parametr_pom integer[],
dane_wartosc_parametr_pom integer[],
dane_id_wyposazenie_pom integer[]);

create type OsobaEdycja AS (
id_osoba integer,
id_imie integer,
imie text,
nazwisko text,
nazwisko_rodowe text,
pesel text,
---nr_dowod text,
id_agent integer,
kod text,
id_region_geog integer,
region text,
ulica text,
numer_dom text,
numer_miesz text);

--data date,
--id_godzina integer,
--id_minuta integer,
--id_zapotrzebowanie integer,

create type OfertaListaWskazan as (
id_oferta integer,
id_nier_rodzaj integer,
id_trans_rodzaj integer,
id_klient integer,
adres text,
cena text,
opis text,
wlasciciel integer[],
oferent integer[]
);

---dane do oferty ogladanej do listy klientow zwiedzajacych
create type OfertaOglDane as (
id_oferta integer,
id_nier_rodzaj integer,
id_trans_rodzaj integer,
adres text,
cena text,
opis text,
data date,
wlasciciel integer[]
);

---dane ofert ogladanych do listy ofert obejrzanych przez klienta
create type OfertaOgladanaKlient as (
id_oferta integer,
adres text,
cena text,
opis text,
data timestamp,
agent text,
wlasciciel text[]
);

create type ListaWskazanZapotrzebowanie as (
id_zapotrzebowanie integer,
agent text,
data timestamp,
data_otw_zlecenie date,
osoba text[],
pesel text[],
telefon text[]
);

create type UmowaDane AS (
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

---id oferta jako parametr zeby znalezc zap trans rodzaj :P
create type ZapotrzebowanieDane AS (
id_zapotrzebowanie integer,
id_klient integer,
data_otw_zlecenie date,
cena text,
powierzchnia text,
powierzchnia_max text,
liczba_pokoi integer,
liczba_pokoi_max integer
); --rozwijac o whatever is necessary


create type ListaWskZapotrzebowanie AS ( ---PodajDaneListaWskAdr
id_oferta integer,
id_zapotrzebowanie integer,
id_nieruchomosc integer,
agent text,
cena text,
nieruchomosc_rodzaj text,
transakcja_rodzaj text,
ulica text,
ogladanie_data text,
id_status integer,
status text,
powierzchnia text,
liczba_pokoi text
);

create type KalendarzEdycja AS (
id integer,
data date,
id_godzina integer,
id_minuta integer,
id_spotkanie integer,
komentarz text,
id_agent integer[]
);

----KONWENCJA !!!! Utilsy wszelkiej masci (takie male protected procedury) wedruja na sam poczatek, chocby po to zeby potem nie szukac ** wie czego ** wie gdzie :P

---jeszcze jedna wesola konwencja: pisze procedury najnizszego szczebla - super podstawowe operacje; jelsi chce w procedurach wyzszego poziomu ogolnosci
---wykonac tez te operacje nizszego poziomu odpalam tamta procedure i jest ok. cele sa 2 : nie powielanie sie, uzyskanie wyzszej kontroli nad tym, 
---co siedzi w kodzie

---procedura zwraca wszystkie tlumaczenia dla wszystkich jezykow

CREATE FUNCTION Tlumaczenia() RETURNS SETOF TlumJezyk AS $$
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
$$ LANGUAGE plpgsql;

---zwraca wszystkie nieruchomosci
CREATE FUNCTION PodajNier () RETURNS SETOF slownik AS $$
DECLARE
	rec_nier slownik;
BEGIN
	FOR rec_nier IN SELECT id, nazwa from nier_rodzaj LOOP
		RETURN NEXT rec_nier;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;
---zwraca wszystkie transakcje dla danej nieruchomosci

CREATE FUNCTION PodajTransRodzaj (of_zap text) RETURNS SETOF slownik AS $$
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
$$ LANGUAGE plpgsql;

CREATE FUNCTION PodajTransDlaNier (nier_id integer, of_zap text) RETURNS SETOF slownik AS $$
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
$$ LANGUAGE plpgsql;

----wojewodztwa
CREATE FUNCTION PodajWojewodztwa () RETURNS SETOF slownik AS $$
DECLARE
	result slownik;
BEGIN
	--dla polski :P (1)
	FOR result in select id, nazwa from region_geog where id_parent = 1 LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

---zwraca zestawienie wyposazen nieruchomosci ze wzgledu na rodzaj nieruchomosci i rodzaj transakcji jako zestaw z podzialem na sekcje

CREATE FUNCTION PobierzWyposazenieNier (trans_id integer, nier_id integer) RETURNS SETOF WypNierSekcja AS $$
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
$$ LANGUAGE plpgsql;
---select * from PobierzWyposazenieNier (1, 1) where id is not null;

---pobiera parametry nieruchomosci z podzialem na sekcje

CREATE FUNCTION PobierzParametryNier (trans_id integer, nier_id integer) RETURNS SETOF ParNierSekcja AS $$
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
$$ LANGUAGE plpgsql;
---select * from PobierzParametryNier(1, 1) where id is not null;

CREATE FUNCTION PobierzPomieszczeniaNieruchomosc (nier_rodzaj_id integer) RETURNS SETOF slownik AS $$
DECLARE
	result slownik;
BEGIN
	FOR result in select pomieszczenie.id, pomieszczenie.nazwa from pomieszczenie_nier join pomieszczenie on 
	pomieszczenie_nier.id_pomieszczenie = pomieszczenie.id where pomieszczenie_nier.id_nier_rodzaj = nier_rodzaj_id order by pomieszczenie.waga LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION PobierzPomPrzynNier (nieruchomosc_id integer, pomieszczenie_id integer) RETURNS SETOF PomPrzynNier AS $$
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
$$ LANGUAGE plpgsql;

CREATE FUNCTION EdycjaWyposazeniePom (pom_id integer) RETURNS SETOF integer AS $$
DECLARE
	result record;
BEGIN
	FOR result in select id_wyposazenie_pom as id from dane_slow_wyp_pom where id_pomieszczenie_przyn_nier = pom_id LOOP
		RETURN NEXT result.id;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION EdycjaParametrPom (pom_id integer) RETURNS SETOF PomieszczenieParamEdycja AS $$
DECLARE
	result PomieszczenieParamEdycja;
BEGIN
	FOR result in select id_parametr_pom as id, wartosc from dane_txt_pom where id_pomieszczenie_przyn_nier = pom_id LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

--CREATE FUNCTION EdycjaPomieszczenie (pom_przyn_nier_id integer) RETURNS PomieszczenieEdycja AS $$


CREATE FUNCTION PobierzWyposazeniePomNier (pom_id integer) RETURNS SETOF WypNierPom AS $$
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
$$ LANGUAGE plpgsql;
---select * from pobierzwyposazeniepomnier (1) where id is not null;

---ParNierPom
CREATE FUNCTION PobierzParametryPomNier (pom_id integer) RETURNS SETOF ParNierPom AS $$
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
$$ LANGUAGE plpgsql;
---select * from PobierzParametryPomNier (1) where id is not null;
---procedura dodawania wyposazenia nieruchomosci lub usuwania - przewiduje walidacje wielokrotniwsci
---nie waliduje 2 zdarzen: oba sa uznawane za niemozliwe: podania rodzica podczas gdy ma on dzieci, podania wyposazenia niedostepnego dla tego rodzaju nieruchomosci
CREATE FUNCTION DodajWyposazenieNier (op_dodawania boolean, nieruchomosc_id integer, wyposazenie_id integer) RETURNS boolean AS $$
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
$$ LANGUAGE plpgsql;

CREATE FUNCTION DodajParametrNier (op_dodawania boolean, nieruchomosc_id integer, parametr_id integer, informacja text) RETURNS boolean AS $$
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
$$ LANGUAGE plpgsql;

CREATE FUNCTION DodajPomieszczenieNier (nieruchomosc_id integer, pomieszczenie_id integer) RETURNS integer AS $$
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
$$ LANGUAGE plpgsql;
---wymagana weryfikacja - kasowanie, gdy sa jakies dane w tabelach dane_txt... i dane_slow_wyp - dorobic cascade jak wystarczy :P, ale lepiej zrobic to do rzeczy :P
CREATE FUNCTION UsunPomieszczenieNier (pom_przyn_nier_id integer) RETURNS boolean AS $$
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
$$ LANGUAGE plpgsql;

CREATE FUNCTION DodajWyposazeniePom (op_dodawania boolean, pomieszczenie_id integer, wyposazenie_id integer) RETURNS boolean AS $$
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
$$ LANGUAGE plpgsql;

CREATE FUNCTION DodajParametrPom (op_dodawania boolean, pomieszczenie_id integer, parametr_id integer, informacja text) RETURNS boolean AS $$
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
$$ LANGUAGE plpgsql;

CREATE FUNCTION Logowanie(login_t text, passwd text) RETURNS LogowanieObj AS $$
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
$$ LANGUAGE plpgsql;

---podaj agentow
CREATE FUNCTION PodajNazwaAgentId (agent_id integer) RETURNS slownik AS $$
DECLARE
	result slownik;
BEGIN
	select into result id, nazwa_pot as nazwa from agent where id = agent_id;
	RETURN result;
END;
$$ LANGUAGE plpgsql;

---aktualizuj dane agenta

CREATE FUNCTION AktualizujAgent(id_a integer, nazwa_t text, tel text, komorka_t text, fax_t text, email_t text, dod_upr boolean, ed_upr boolean, kas_upr boolean, druk_upr boolean, adm_klient_upr boolean, adm_dane_upr boolean, zmiana_upr_upr boolean, lic_num integer, agent_nad integer) RETURNS boolean AS $$
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
$$ LANGUAGE plpgsql;

---zdebugowac
CREATE FUNCTION SprawdzDostepnoscAgenta (data_wp date, godzina integer, minuta integer, id_a integer, kalendarz_id integer) RETURNS boolean AS $$
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
$$ LANGUAGE plpgsql;

CREATE FUNCTION PodajKontoAgenta (agent_id integer) RETURNS SETOF slownik AS $$
DECLARE
	result slownik;
BEGIN
	FOR result in select id, nr_konto as nazwa from konto_agent where id_agent = agent_id LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;


---wpis kalendarz powinien uzywac SprawdzDostepnoscAgenta ...
---select * from WpisKalendarz(null, '2008-06-13', 1, 1, ARRAY[18], 'gds shsdf', null);
CREATE FUNCTION WpisKalendarz (kalendarz_id integer, data_wp date, godzina integer, minuta integer, id_agent_a integer[], koment text, spotkanie_id integer) RETURNS slownik AS $$
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
$$ LANGUAGE plpgsql;

CREATE FUNCTION PokazKalendarz (agent_id integer, data_w date) returns SETOF ListaKalendarz AS $$
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
$$ LANGUAGE plpgsql;

---funkcja pseudo chroniona
CREATE FUNCTION AgenciWpisKalendarz (kalendarz_id integer) RETURNS text AS $$
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
$$ LANGUAGE plpgsql;

CREATE FUNCTION PodajWpisKalendarz(kalendarz_id integer) RETURNS KalendarzEdycja AS $$
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
$$ LANGUAGE plpgsql;

CREATE FUNCTION UsunWpisKalendarz(kalendarz_id integer) RETURNS slownik AS $$
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
$$ LANGUAGE plpgsql;

---szukanie :)

CREATE FUNCTION SzybkieSzukanie (klient_nazwisko text, of_numer integer) RETURNS SETOF SzukajOfertaNierView AS $$
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
$$ LANGUAGE plpgsql;

CREATE FUNCTION SzukanieOfertaAdres (adres_t text) RETURNS SETOF SzukajOfertaNierView AS $$
DECLARE
	result SzukajOfertaNierView;
BEGIN
	FOR result IN select * from SzukajOfertaNierView where lower(ulica) like lower('%' || adres_t || '%') LIMIT 51 LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION SzybkieSzukanieZapotrzebowanie (klient_nazwisko text, zap_numer integer) RETURNS SETOF SzukajZapotrzebowanieNierView AS $$
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
$$ LANGUAGE plpgsql;

CREATE FUNCTION ZapotrzebowaniaTabListWskazan (tab_zapotrzebowania integer[]) RETURNS SETOF SzukajZapotrzebowanieNierView AS $$
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
$$ LANGUAGE plpgsql;

CREATE FUNCTION ZapotrzebowanieKlient (osoba_id integer) RETURNS SETOF SzukajZapotrzebowanieNierView AS $$
DECLARE
	result SzukajZapotrzebowanieNierView;
BEGIN
	FOR result IN select * from SzukajZapotrzebowanieNierView where id_osoba = osoba_id LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;
												---status niechciany
CREATE FUNCTION OfertaKlient (osoba_id integer, status_id_n integer) RETURNS SETOF SzukajOfertaNierView AS $$
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
$$ LANGUAGE plpgsql;

---pomyslec o telefonie przy szukaniu
CREATE FUNCTION SzukajOsoba (text_szukaj text) RETURNS SETOF OsobaView AS $$
DECLARE
	result OsobaView;
BEGIN
	FOR result IN select * from OsobaView where lower(nazwisko) like lower(text_szukaj) limit 51 LOOP
		select into result.telefon * from TablicaTelefony(result.id_osoba);
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION SzukajOsoby (nazwisko_os text, telefon_os text, komorka_os text) RETURNS SETOF OsobaView AS $$
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
	zapytanie := 'select * from OsobaView left join telefon on OsobaView.id_osoba = telefon.id_osoba left join komorka on OsobaView.id_osoba = komorka.id_osoba  where ';
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
		zapytanie := zapytanie || 'telefon.nazwa like \'' || telefon_os || '\'';
		andbool := true;
		can_ask := true;
	END IF;
	IF character_length (komorka_os) > 0 THEN
		IF andbool = true THEN
			zapytanie := zapytanie || andphr;
		END IF;
		zapytanie := zapytanie || 'komorka.nazwa like \'' || komorka_os || '\'';
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
$$ LANGUAGE plpgsql;

---protected :P - procedura funkcjonuje tylko dla procedury dodaj osoba, adresu bezposrednio z dala nie oprogramowujemy :P
CREATE FUNCTION DodajAdresOsoba (osoba_id integer, region_id integer, kod text, ul_adr text, num_dom text, num_miesz text) RETURNS VOID AS $$
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
$$ LANGUAGE plpgsql;

CREATE FUNCTION DodajDokOsoba (osoba_id integer, dowod_tozsamosc_id integer, dowod_nr text) RETURNS	boolean AS $$
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
$$ LANGUAGE plpgsql;

CREATE FUNCTION UsunDokOsoba (osoba_id integer, dowod_tozsamosc_id integer) RETURNS boolean AS $$
DECLARE
BEGIN
	delete from osoba_dowod  where id_osoba = osoba_id and id_rodzaj_dowod_tozsamosc = dowod_tozsamosc_id;
	IF found THEN
		return true;
	ELSE
		return false;
	END IF;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION PodajDokOsoba (osoba_id integer) RETURNS SETOF PodajDodaneDowOsoba AS $$ ---podanie wpisanych, opcja aktualizacji
DECLARE
	result PodajDodaneDowOsoba;
BEGIN
	FOR result IN select * from PodajDodaneDowOsoba where id_osoba = osoba_id LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION PodajDostDokOsoba (osoba_id integer) RETURNS SETOF PodajDostDowOsoba AS $$ ---podanie nie wprowadzonych, opcja wprowadzenia
DECLARE
	result PodajDostDowOsoba;
BEGIN
	FOR result IN select * from PodajDostDowOsoba where id_osoba = osoba_id LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION UsunDokOsoba (osoba_dowod_id integer) RETURNS boolean AS $$
DECLARE
	
BEGIN
	delete from osoba_dowod where id = osoba_dowod_id;
	IF found THEN
		return true;
	ELSE
		return false;
	END IF;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION PodajWlascicieleNier (nieruchomosc_id integer) RETURNS SETOF PodajWlascicielNieruchomosc AS $$
DECLARE
	result PodajWlascicielNieruchomosc;
BEGIN
	FOR result IN select * from PodajWlascicielNieruchomosc where id_nieruchomosc = nieruchomosc_id LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;
---funkcja podaje jaki udzial w procentach we wlasnosci nieruchomosci jest mozliwy
---jesli id osoba zostalo podane nalezy nie brac pod uwage udzialu tej osoby
CREATE FUNCTION PodajDostProcUdzialWlasNier (nieruchomosc_id integer, osoba_id integer) RETURNS float AS $$
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
$$ LANGUAGE plpgsql;

CREATE FUNCTION PodajDostOsWlas (nieruchomosc_id integer) RETURNS SETOF PodajDostOsWlasciciel AS $$
DECLARE
	result PodajDostOsWlasciciel;
BEGIN
	FOR result IN select * from PodajDostOsWlasciciel where id_nieruchomosc = nieruchomosc_id LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION DodajWlasciciel (wlasciciel_id integer, nieruchomosc_id integer, osoba_id integer, proc_udzial float) RETURNS boolean AS $$
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
$$ LANGUAGE plpgsql;

---usun wlasciciel
CREATE FUNCTION UsunWlasciciel (wlasciciel_id integer) RETURNS boolean AS $$
DECLARE
BEGIN
	delete from wlasciciel where id = wlasciciel_id;
	IF found THEN
		return true;
	ELSE
		return false;
	END IF;
END;
$$ LANGUAGE plpgsql;

---dodawanie lub aktualizacja osoby
---jesli osoba jest dodawana oraz podano id klienta osobe nalezy od razu dodac do danego klienta
----modyfikacje 24.06 : dodanie obslugi imienia oraz wiecej telefonow: idea:
--- - imie obsluzone zostanie procedura osobno, zalatwic na poziomie dal
--- - telefony przujda w dluzszej tablicy, przepetlowac
CREATE FUNCTION DodajOsoba (osoba_id integer, imie_id integer, nazw text, nazw_rod text, pesel_t text, dow_toz_id integer, dowod_nr text, region_geog_id integer, agent_id integer, dane_adres text[], 
klient_id integer, tel text[], tel_kom text[], adres_email text[]) RETURNS slownik AS $$
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
$$ LANGUAGE plpgsql;

---dodaj, aktualizuj klient
CREATE FUNCTION DodajKlient (klient_id integer, osobowosc_id integer, agent_id integer, firma_dane text[]) RETURNS slownik AS $$
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
$$ LANGUAGE plpgsql;

---1 - osdoba prawna
CREATE FUNCTION EdycjaKlient (klient_id integer) RETURNS KlientOferta AS $$
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
$$ LANGUAGE plpgsql;

CREATE FUNCTION SzukajKlient (osobowosc_id integer, klient_id integer, nazwa_text text, pesel text, nazwisko text, telefon text) RETURNS SETOF KlientSzukaj AS $$ ---, komorka text
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
$$ LANGUAGE plpgsql;

CREATE FUNCTION EdycjaOsoba (osoba_id integer) RETURNS OsobaEdycja AS $$
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
$$ LANGUAGE plpgsql;

CREATE FUNCTION DodajOsobaKlient (klient_id integer, osoba_id integer) RETURNS boolean AS $$
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
$$ LANGUAGE plpgsql;

CREATE FUNCTION UsunOsobaKlient (klient_id integer, osoba_id integer) RETURNS boolean AS $$
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
$$ LANGUAGE plpgsql;

CREATE FUNCTION DodajOsobaOferta (osoba_id integer, oferta_id integer) RETURNS boolean AS $$
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
$$ LANGUAGE plpgsql;

CREATE FUNCTION PodajOsobaOferta (oferta_id integer) RETURNS SETOF OsobaOferta AS $$
DECLARE
	result OsobaOferta;
BEGIN
	FOR result in select * from OsobaOferta where id_oferta = oferta_id LOOP
		return next result;
	END LOOP;
	return;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION PodajOsobaKlientOfId (oferta_id integer) RETURNS SETOF OsobaKlient AS $$
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
$$ LANGUAGE plpgsql;

CREATE FUNCTION PodajOsobaKlientZapId (zapotrzebowanie_id integer) RETURNS SETOF OsobaKlient AS $$
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
$$ LANGUAGE plpgsql;

CREATE FUNCTION UsunOsobaOferta (osoba_id integer, oferta_id integer) RETURNS boolean AS $$
DECLARE
BEGIN
	delete from osoba_oferta where id_oferta = oferta_id and id_osoba = osoba_id;
	IF found THEN
		return true;
	ELSE
		return false;
	END IF;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION PodajOsobaKlient (klient_id integer) RETURNS SETOF OsobaKlient AS $$
DECLARE
	result OsobaKlient;
BEGIN
	FOR result IN select * from OsobaKlient where id_klient = klient_id LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION PodajOsobaKlientPoZap (zapotrzebowanie_id integer) RETURNS SETOF OsobaKlient AS $$
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
$$ LANGUAGE plpgsql;

---przyklad podlaczenia sie joinem z procedurka :)
---select nieruchomosc.id, bla.id as id_klient, nazwa from PodajKlientOsoba(12) as bla join nieruchomosc on bla.id = nieruchomosc.id_klient;


CREATE FUNCTION PodajKlientOsoba (osoba_id integer) RETURNS SETOF slownik AS $$
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
$$ LANGUAGE plpgsql;

CREATE FUNCTION PodajOsobaKlientZmCena (klient_id integer) RETURNS SETOF slownik AS $$
DECLARE
	result slownik;
BEGIN
	FOR result IN select osoba.id, imie.nazwa || ' ' || osoba.nazwisko as nazwa from osoba join osoba_klient on osoba.id = osoba_klient.id_osoba 
	join imie on osoba.id_imie = imie.id where osoba_klient.id_klient = klient_id LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION PodajOsobaZapotrzebowanie (zapotrzebowanie_id integer) RETURNS SETOF OsobaView AS $$
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
$$ LANGUAGE plpgsql;

CREATE FUNCTION PodajOsobaDane (osoba_id integer) RETURNS SETOF OsobaView AS $$
DECLARE
	result OsobaView;
BEGIN
	FOR result IN select * from OsobaView where id_osoba = osoba_id LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION DaneSlownik (nazwa_slow text) RETURNS SETOF slownik AS $$
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
$$ LANGUAGE plpgsql;

---pobieranie dzieci dla rodzica lub najstarszych rodzicow
CREATE FUNCTION RegionGeograficzny (parent_id integer) RETURNS SETOF slownik AS $$
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
$$ LANGUAGE plpgsql;
---pobiera zestaw z drzewem rodzicow dla dowolnego regionu
---dorobic metode region geograficzny najnizszego szczebla
CREATE FUNCTION DowRegionGeograficzny (wojewodztwo_id integer, text_nazwa text) RETURNS SETOF RegGeog AS $$
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
$$ LANGUAGE plpgsql;

CREATE FUNCTION PelneZagnRegion (region_id integer) RETURNS slownik AS $$
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
$$ LANGUAGE plpgsql;

---metoda podaje zestaw rodzicow dla dziecka bezdzietnego - najnizszego regionu geograficznego
---przy kojarzeniu szukamy nalozenia sie rezultatu tej procedury dla oferty z zestawieniem potrzeb z zapotrzebowania - selectem wszystkich id
CREATE FUNCTION RegionNajnGalazRodzice (region_id integer) RETURNS SETOF integer AS $$
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
$$ LANGUAGE plpgsql;

CREATE FUNCTION SzczegolyNieruchomosc (nier_rodzaj_id integer) RETURNS SETOF slownik AS $$
DECLARE
	rec_slownik slownik;
BEGIN
	FOR rec_slownik IN select id, nazwa from rodz_nier_szczeg where id_nier_rodzaj = nier_rodzaj_id order by nazwa asc LOOP
		RETURN NEXT rec_slownik;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

---bodaj calkowicie nieuzywane - przynajmniej powinno zostac nieuzywane
CREATE FUNCTION TransakcjaNieruchomosc (nier_rodzaj_id integer) RETURNS SETOF slownik AS $$
DECLARE
	rec_slownik slownik;
BEGIN
	FOR rec_slownik IN select trans_rodzaj.id, trans_rodzaj.nazwa from trans_rodzaj join transakcja_nier on trans_rodzaj.id = transakcja_nier.id_trans_rodzaj where transakcja_nier.id_nier_rodzaj = nier_rodzaj_id order by nazwa asc LOOP
		RETURN NEXT rec_slownik;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

---boolean pokaz zawsze bedzie tu podawany jako false :P
CREATE FUNCTION DodajOferta (oferta_id integer, rodz_trans_id integer, status_id integer, otw_zlec_data date, zam_zlec_data date, cena_t text, priorytet_id integer, 
prow_proc boolean, prowizja_t text, wyl boolean, pokaz_t boolean, czas_przek integer, przek_od_otw boolean, nier_rodzaj_id integer, nier_szcz_id integer, klient_id integer, region_id integer, 
ulica_t text, ulica_net_t text, kod_t text, agent_id integer, rynek boolean, klucz_b boolean, osoba_id integer, podpis_cena boolean) RETURNS DodanieOferta AS $$
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
$$ LANGUAGE plpgsql;

CREATE FUNCTION OfertaPublikuj (oferta_id integer) RETURNS boolean AS $$
DECLARE
BEGIN
	update oferta set pokaz = true where id = oferta_id;
	IF found THEN
		return true;
	ELSE
		return false;
	END IF;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION OfertaSchowaj (oferta_id integer) RETURNS boolean AS $$
DECLARE
BEGIN
	update oferta set pokaz = false where id = oferta_id;
	IF found THEN
		return true;
	ELSE
		return false;
	END IF;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION OfertaWstrzymana () RETURNS SETOF OfertyWstrzymane AS $$
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
$$ LANGUAGE plpgsql;

CREATE FUNCTION OfertyZejscieGablota () RETURNS SETOF OfertyZawieszoneNieaktualne AS $$
DECLARE
	result OfertyZawieszoneNieaktualne;
BEGIN
	---and zmiana_status.id_status in (select id from status where nazwa in ('_zawieszona', '_nieaktualna'))
	FOR result in select * from OfertyZawieszoneNieaktualne where data > current_date - 8 order by data asc LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION OfertyWejscieGablota () RETURNS SETOF OfertyZawieszoneNieaktualne AS $$
DECLARE
	result OfertyZawieszoneNieaktualne;
BEGIN
	---and zmiana_status.id_status in (select id from status where nazwa in ('_zawieszona', '_nieaktualna'))
	FOR result in select distinct cena.id_oferta, oferta.id_status, cena.cena, nier_rodzaj.nazwa as nieruchomosc_rodzaj, nieruchomosc.id_agent, cena.data from cena join oferta on oferta.id = cena.id_oferta 
	join nieruchomosc on oferta.id_nieruchomosc = nieruchomosc.id join nier_rodzaj on nieruchomosc.id_nier_rodzaj = nier_rodzaj.id where id_status in (select id from status 
	where nazwa in ('_aktualna', '_umowiona')) and cena.data > current_date - 8 order by data asc LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION PokazZmianaStatus (oferta_id integer) RETURNS SETOF ZmianyStatusow AS $$
DECLARE
	result ZmianyStatusow;
BEGIN
	FOR result in select * from ZmianyStatusow where id_oferta = oferta_id order by data asc LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION PokazOdwiedziny (oferta_id integer, dzien date) RETURNS SETOF oferta_odwiedziny AS $$
DECLARE
	result oferta_odwiedziny;
	dzien_kolejny date;
BEGIN
	select into dzien_kolejny dzien + 1;
	FOR result in select * from oferta_odwiedziny where adres not like '10.0.0.%' and id_oferta = oferta_id and data between dzien and dzien_kolejny order by data asc LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION PodajOfertaWyslanaZapotrzebowanie (zapotrzebowanie_id integer) RETURNS SETOF WysylaneOfertyZapotrzebowanie AS $$
DECLARE
	result WysylaneOfertyZapotrzebowanie;
BEGIN
	FOR result in select * from WysylaneOfertyZapotrzebowanie where id_zapotrzebowanie = zapotrzebowanie_id LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION PodajZapotrzebowanieAdresatOferta (oferta_id integer) RETURNS SETOF WysylaneOfertyZapotrzebowanie AS $$
DECLARE
	result WysylaneOfertyZapotrzebowanie;
BEGIN
	FOR result in select * from WysylaneOfertyZapotrzebowanie where id_oferta = oferta_id LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION EdycjaOferta (id_oferta integer) RETURNS SETOF OfertaNieruchomosc AS $$
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
$$ LANGUAGE plpgsql;

CREATE FUNCTION FiltrujOferty (nier_rodzaj_id integer, trans_rodzaj_id integer, status_id integer, agent_id integer, sort_kol text, sort_kier integer) RETURNS SETOF Oferty AS $$
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
$$ LANGUAGE plpgsql;

--distinct na id zapotrzebowanie moze byc konieczny przy wiekszej ilosci osob otw zlecenie
CREATE FUNCTION FiltrujZapotrzebowania (nier_rodzaj_id integer, trans_rodzaj_id integer, status_id integer, agent_id integer, sort_kol text, sort_kier integer) RETURNS SETOF ZapotrzTransNierRodzaj AS $$
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
$$ LANGUAGE plpgsql;

CREATE FUNCTION NierDaneOferta (oferta_id integer) RETURNS NierOferta AS $$
DECLARE
	result NierOferta;
BEGIN
	select into result * from NierOferta where id_oferta = oferta_id;
	return result;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION PodajDostOpisOferta (oferta_id integer) RETURNS SETOF PodajDostOpisyOferta AS $$
DECLARE
	result PodajDostOpisyOferta;
BEGIN
	FOR result IN select * from PodajDostOpisyOferta where id_oferta = oferta_id LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION PodajOpisOferta (oferta_id integer) RETURNS SETOF PodajOpisyOferta AS $$
DECLARE
	result PodajOpisyOferta;
BEGIN
	FOR result IN select * from PodajOpisyOferta where id_oferta = oferta_id LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION DodajOpisOferta (opis_id integer, oferta_id integer, jezyk_id integer, tresc text) RETURNS boolean AS $$
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
$$ LANGUAGE plpgsql;

CREATE FUNCTION UsunOpisOferta (opis_id integer) RETURNS boolean AS $$
DECLARE
	
BEGIN
	delete from opis where id = opis_id;
	IF found THEN
		RETURN true;
	ELSE
		RETURN false;
	END IF;
END;
$$ LANGUAGE plpgsql;

--oferta_sprzedana
CREATE FUNCTION DodajInfoOfSprz (oferta_id integer, cena_sp text, of_sp boolean, azg_sp boolean) RETURNS boolean AS $$
DECLARE
	result boolean;
	test integer;
BEGIN
	select into test id_oferta from oferta_sprzedana where id_oferta = oferta_id;
	IF test is null THEN
		---insert
		insert into oferta_sprzedana (id_oferta, cena, is_sprzedana, is_azg) values (oferta_id, cena_sp, of_sp, azg_sp);
		return true;
	ELSE
		UPDATE oferta_sprzedana set cena = cena_sp, is_sprzedana = of_sp, is_azg = azg_sp where id_oferta = oferta_id;
		IF found THEN
			RETURN true;
		ELSE
			RETURN false;
		END IF;
	END IF;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION DodajOpisNieruchomosc (nieruchomosc_id integer, agent_id integer, notatka text) RETURNS boolean AS $$
DECLARE
	akt_data timestamp;
BEGIN
	select into akt_data date_trunc('second', current_timestamp::timestamp);
	---insert
	insert into opis_nieruchomosc (id_nieruchomosc, id_agent, data, tresc) values (nieruchomosc_id, agent_id, akt_data, notatka);
	return true;
END;
$$ LANGUAGE plpgsql;

---opis_nieruchomosc - notatka wewnetrzna
CREATE FUNCTION PodajNotatkaNieruchomosc (nieruchomosc_id integer) RETURNS SETOF NotatkiNieruchomosc AS $$
DECLARE
	result NotatkiNieruchomosc;
BEGIN
	FOR result IN select * from NotatkiNieruchomosc where id_nieruchomosc = nieruchomosc_id order by data desc LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION PodajNotatkaNieruchomoscOfId (oferta_id integer) RETURNS SETOF NotatkiNieruchomosc AS $$
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
$$ LANGUAGE plpgsql;

---opis_nieruchomosc
CREATE FUNCTION UsunNotatkaNieruchomosc (notatka_id integer) RETURNS boolean AS $$
DECLARE
BEGIN
	delete from opis_nieruchomosc where id = notatka_id;
	IF found THEN
		RETURN true;
	ELSE
		RETURN false;
	END IF;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION DodajOpisZapotrzebowanie (zapotrzebowanie_id integer, agent_id integer, notatka text, oferta_id integer, zainter_b boolean, cena_of text) RETURNS boolean AS $$
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
$$ LANGUAGE plpgsql;

CREATE FUNCTION PodajOpisZapotrzebowanie (zapotrzebowanie_id integer) RETURNS SETOF NotatkiZapotrzebowanie AS $$
DECLARE
	result NotatkiZapotrzebowanie;
BEGIN
	FOR result IN select * from NotatkiZapotrzebowanie where id_zapotrzebowanie = zapotrzebowanie_id order by data desc LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION UsunNotatkaZapotrzebowanie (notatka_id integer) RETURNS boolean AS $$
DECLARE
BEGIN
	delete from opis_wew_zapotrzebowanie where id = notatka_id;
	IF found THEN
		RETURN true;
	ELSE
		RETURN false;
	END IF;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION DodajOpisPoszZapotrzebowanie (zapotrzebowanie_trans_rodzaj_id integer, agent_id integer, notatka text) RETURNS boolean AS $$
DECLARE
	akt_data timestamp;
BEGIN
	select into akt_data date_trunc('second', current_timestamp::timestamp);
	---insert
	insert into opis_posz_zapotrzebowanie (id_zapotrzebowanie_trans_rodzaj, id_agent, data, wartosc) values (zapotrzebowanie_trans_rodzaj_id, agent_id, akt_data, notatka);
	return true;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION PodajOpisPoszZapotrzebowanie (zapotrzebowanie_trans_rodzaj_id integer) RETURNS SETOF NotatkiPoszZapotrzebowanie AS $$
DECLARE
	result NotatkiPoszZapotrzebowanie;
BEGIN
	FOR result IN select * from NotatkiPoszZapotrzebowanie where id_zapotrzebowanie_trans_rodzaj = zapotrzebowanie_trans_rodzaj_id order by data desc LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION UsunOpisPoszZapotrzebowanie (opis_id integer) RETURNS boolean AS $$
DECLARE
BEGIN
	delete from opis_posz_zapotrzebowanie where id = opis_id;
	IF found THEN
		RETURN true;
	ELSE
		RETURN false;
	END IF;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION PodajDostOpisZapotrzebowanieTrRodz (zapotrzebowanie_trans_rodzaj_id integer) RETURNS SETOF PodajDostOpisyZapotrzebowanieTrRodz AS $$
DECLARE
	result PodajDostOpisyZapotrzebowanieTrRodz;
BEGIN
	FOR result IN select * from PodajDostOpisyZapotrzebowanieTrRodz where id_zapotrzebowanie_trans_rodzaj = zapotrzebowanie_trans_rodzaj_id LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION PodajOpisZapotrzebowanieTrRodz (zapotrzebowanie_trans_rodzaj_id integer) RETURNS SETOF PodajOpisyZapotrzebowanieTrRodz AS $$
DECLARE
	result PodajOpisyZapotrzebowanieTrRodz;
BEGIN
	FOR result IN select * from PodajOpisyZapotrzebowanieTrRodz where id_zapotrzebowanie_trans_rodzaj = zapotrzebowanie_trans_rodzaj_id LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION DodajOpisZapotrzebowanieTrRodz (opis_id integer, zapotrzebowanie_trans_rodzaj_id integer, jezyk_id integer, tresc text) RETURNS boolean AS $$
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
$$ LANGUAGE plpgsql;

CREATE FUNCTION UsunOpisZapotrzebowanieTrRodz (opis_id integer) RETURNS boolean AS $$
DECLARE
	
BEGIN
	delete from opis_zapotrzebowanie where id = opis_id;
	IF found THEN
		RETURN true;
	ELSE
		RETURN false;
	END IF;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION DodajNotatkaKlient (klient_id integer, agent_id integer, tresc_t text) RETURNS boolean AS $$
DECLARE
	akt_data timestamp;
BEGIN
	select into akt_data date_trunc('second', current_timestamp::timestamp);
	insert into ustalenia (id_klient, id_agent, data, tresc) values (klient_id, agent_id, akt_data, tresc_t);
	return true;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION PodajNotatkaKlient (klient_id integer) RETURNS SETOF NotatkiKlient AS $$
DECLARE
	result NotatkiKlient;
BEGIN
	FOR result IN select * from NotatkiKlient where id_klient = klient_id order by data desc LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION UsunNotatka (notatka_id integer) RETURNS boolean AS $$
DECLARE
	
BEGIN
	delete from ustalenia where id = notatka_id;
	IF found THEN
		RETURN true;
	ELSE
		RETURN false;
	END IF;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION EdycjaZapotrzebowanie (zapotrzebowanie_id integer) RETURNS ZapotrzebowanieNieruchomosc AS $$
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
$$ LANGUAGE plpgsql;

CREATE FUNCTION EdycjaZapTransRodzajWypPar (zapotrzebowanie_trans_rodzaj_id integer) RETURNS ZapotrzebowanieNieruchomoscWypPar AS $$
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
$$ LANGUAGE plpgsql;

---swego rodzaju protected, w zapotrzebowaniu dodaje rodzaje szukanych nieruchomosci
CREATE FUNCTION DodajNierZapotrzebowanie (zapotrzebowanie_id integer, nier_rodzaj_id integer[], opUpdate boolean) returns void AS $$
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
$$ LANGUAGE plpgsql;

CREATE FUNCTION PodajNierZapotrzebowanie (zapotrzebowanie_id integer) RETURNS SETOF slownik AS $$
DECLARE
	result slownik;
BEGIN
	FOR result IN select zapotrzebowanie_nier_rodzaj.id as id, nier_rodzaj.nazwa as nazwa from zapotrzebowanie_nier_rodzaj join nier_rodzaj on
	zapotrzebowanie_nier_rodzaj.id_nier_rodzaj = nier_rodzaj.id where zapotrzebowanie_nier_rodzaj.id_zapotrzebowanie = zapotrzebowanie_id LOOP
		return next result;
	END LOOP;
	return;
END;
$$ LANGUAGE plpgsql;

---dodawanie i aktualizacja transakcji dla danej nieruchomosci w zapotrzebowaniu; potrzebne poszczegolne ceny, statusy rodzaje transakcji i boole pokaz
CREATE FUNCTION DodajTransNierZapotrzebowanie (zapotrzebowanie_trans_rodzaj_id integer, zapotrzebowanie_nier_rodzaj_id integer, trans_rodzaj_id integer, status_id integer, agent_id integer,
cena_t text, pokaz_t boolean) RETURNS boolean AS $$
DECLARE
	test integer;
BEGIN
	IF zapotrzebowanie_trans_rodzaj_id is null THEN
		---sprawdzenie, czy nie ma juz takiego wpisu
		select into test id from zapotrzebowanie_trans_rodzaj where id_zapotrzebowanie_nier_rodzaj = zapotrzebowanie_nier_rodzaj_id and id_trans_rodzaj = trans_rodzaj_id;
		IF test is null THEN
			insert into zapotrzebowanie_trans_rodzaj (id_zapotrzebowanie_nier_rodzaj, id_status, id_trans_rodzaj, cena, pokaz, id_agent) values 
			(zapotrzebowanie_nier_rodzaj_id, status_id, trans_rodzaj_id, cena_t, pokaz_t, agent_id);
			return true;
		ELSE
			return false;
		END IF;
	ELSE
		update zapotrzebowanie_trans_rodzaj set id_status = status_id, cena = cena_t, pokaz = pokaz_t, id_agent = agent_id where id = zapotrzebowanie_trans_rodzaj_id;
		IF found THEN
			return true;
		ELSE
			return false;
		END IF;
	END IF;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION UsunTransNierZapotrzebowanie (zapotrzebowanie_trans_rodzaj_id integer) RETURNS boolean AS $$
DECLARE
	
BEGIN
	delete from zapotrzebowanie_trans_rodzaj where id = zapotrzebowanie_trans_rodzaj_id;
	IF found THEN
		return true;
	ELSE
		return false;
	END IF;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION PodajTransDlaNierZapotrzebowanie (zapotrzebowanie_nier_rodzaj_id integer) RETURNS SETOF slownik AS $$
DECLARE
	nier_rodzaj_id integer;
	result slownik;
BEGIN
	select into nier_rodzaj_id id_nier_rodzaj from zapotrzebowanie_nier_rodzaj where id = zapotrzebowanie_nier_rodzaj_id;
	FOR result IN select * from (select * from PodajTransDlaNier(nier_rodzaj_id, '_zapotrzebowanie')) as TrNier where TrNier.id not in (select id_trans_rodzaj from zapotrzebowanie_trans_rodzaj where id_zapotrzebowanie_nier_rodzaj = zapotrzebowanie_nier_rodzaj_id) order by nazwa asc LOOP
		RETURN NEXT result;
	END LOOP;	
END;
$$ LANGUAGE plpgsql;

---podaje juz okreslone prowizje dla transakcji okreslonych w zapotrzebowaniu
CREATE FUNCTION ListaProwDlaTrans (zapotrzebowanie_id integer) RETURNS SETOF ProwizjeZapotrzebowanie AS $$
DECLARE
	result ProwizjeZapotrzebowanie;
BEGIN
	FOR result IN select * from ProwizjeZapotrzebowanie where id_zapotrzebowanie = zapotrzebowanie_id LOOP
		return next result;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION BrakujaceProwizje (zapotrzebowanie_id integer) RETURNS SETOF ProwizjeNieUzupelnioneZap AS $$
DECLARE
	result ProwizjeNieUzupelnioneZap;
BEGIN
	FOR result IN select * from ProwizjeNieUzupelnioneZap where id_zapotrzebowanie = zapotrzebowanie_id LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION UsunProwDlaTrans (prow_zap_id integer) RETURNS boolean AS $$
DECLARE
	
BEGIN
	delete from prowizja_zapotrzebowanie where id = prow_zap_id;
	IF found THEN
		return true;
	ELSE
		return false;
	END IF;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION DodajProwDlaTrans (prow_zap_id integer, zapotrzebowanie_id integer, trans_id integer, prow text, prow_proc boolean, spos_fin_id integer, posz_dla text) RETURNS boolean AS $$
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
$$ LANGUAGE plpgsql;

---
CREATE FUNCTION PodajTransNierZapotrzebowanie (zapotrzebowanie_id integer) RETURNS SETOF ZapotrzTransNierRodzaj AS $$
DECLARE
	result ZapotrzTransNierRodzaj;
BEGIN
	FOR result IN select distinct on (id_zapotrzebowanie_trans_rodzaj) * from ZapotrzTransNierRodzaj where id_zapotrzebowanie = zapotrzebowanie_id LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION EdycjaTransNierZapotrzebowanie (zapotrzebowanie_trans_rodzaj_id integer) RETURNS ZapotrzTransNierRodzaj AS $$
DECLARE
	---id_zapotrzebowanie_trans_rodzaj
	result ZapotrzTransNierRodzaj;
BEGIN
	select into result * from ZapotrzTransNierRodzaj where id_zapotrzebowanie_trans_rodzaj = zapotrzebowanie_trans_rodzaj_id;
	return result;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION PodajIdTransIdNierZapotrzebowanie (zapotrzebowanie_trans_rodzaj_id integer) RETURNS ZapotrzebowanieIdTransIdNier AS $$
DECLARE
	result ZapotrzebowanieIdTransIdNier;
BEGIN
	select into result * from ZapotrzebowanieIdTransIdNier where id_zapotrzebowanie_trans_rodzaj = zapotrzebowanie_trans_rodzaj_id;
	return result;
END;
$$ LANGUAGE plpgsql;


---status_id integer, 
---cena_t text, 
---, pokaz_t boolean
CREATE FUNCTION DodajZapotrzebowanie (zapotrzebowanie_id integer, nier_rodzaj_id integer[], otw_zlec_data date, zam_zlec_data date, klient_id integer, agent_id integer) RETURNS integer AS $$
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
$$ LANGUAGE plpgsql;

---
CREATE FUNCTION DodajZapotrzNierSzczeg (op_dodaj boolean, zapotrzebowanie_trans_rodzaj_id integer, nier_szczeg_id integer) RETURNS boolean AS $$
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
$$ LANGUAGE plpgsql;

---select * from PodajZapotrzNierSzczeg(112);
CREATE FUNCTION PodajZapotrzNierSzczeg (zapotrzebowanie_trans_rodzaj_id integer) RETURNS SETOF slownik AS $$
DECLARE
	result slownik;
BEGIN
	FOR result in select zap_szcz_nier.id_rodz_nier_szcz as id, rodz_nier_szczeg.nazwa from zap_szcz_nier join rodz_nier_szczeg on zap_szcz_nier.id_rodz_nier_szcz = rodz_nier_szczeg.id 
	where zap_szcz_nier.id_zapotrzebowanie_trans_rodzaj = zapotrzebowanie_trans_rodzaj_id LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

---select * from PodajDostZapotrzNierSzczeg(112, 1);
CREATE FUNCTION PodajDostZapotrzNierSzczeg (zapotrzebowanie_trans_rodzaj_id integer, nier_rodzaj_id integer) RETURNS SETOF slownik AS $$
DECLARE
	result slownik;
BEGIN
	FOR result IN select * from (select * from SzczegolyNieruchomosc(nier_rodzaj_id)) as szcz_nier where szcz_nier.id not in 
	(select id_rodz_nier_szcz from zap_szcz_nier where id_zapotrzebowanie_trans_rodzaj = zapotrzebowanie_trans_rodzaj_id) LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

---chyba nie uzywane, pytanie o zasadnosc, poruszyc w odpowiednim czasie; osoba zapotrzebowanie raczej nie ma chyba takiego sensu, aczkolwiek mozliwe ze ktos szuka nie dla siebie
CREATE FUNCTION DodajOsobaZapotrzebowanie (zapotrzebowanie_id integer, osoba_id integer) RETURNS boolean AS $$
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
$$ LANGUAGE plpgsql;

CREATE FUNCTION UsunOsobaZapotrzebowanie (zapotrzebowanie_id integer, osoba_id integer) RETURNS boolean AS $$
DECLARE
	
BEGIN
	delete from osoba_zapotrzebowanie where id_zapotrzebowanie = zapotrzebowanie_id and id_osoba = osoba_id;
	IF found THEN
		return true;
	ELSE
		return false;
	END IF;
END;
$$ LANGUAGE plpgsql;

---dorobic ewentualne kasowanie na pomylki
CREATE FUNCTION DodajOsobaOgladanie (ogladanie_id integer, osoba_id integer) RETURNS boolean AS $$
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
$$ LANGUAGE plpgsql;

---dorobic ewentualne kasowanie na pomylki
---dodac osobe badz grupe osob (array); dodawanie do listy wskazan ogladania, ktore sure sie odbylo etc :P
CREATE FUNCTION DodajOgladanie (oferta_id integer, zapotrzebowanie_id integer, agent_id integer, data_ogl date, godzina_id integer, minuta_id integer, osoby integer[]) RETURNS boolean AS $$ ---pytanie czy dawac date, i co z tym agentem, czy na pewno ma to sens
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
$$ LANGUAGE plpgsql;

---z id zapotrzebowanie i id oferta wyciagnac z prowizja zapotrzebowanie czy istnieje rekord
CREATE FUNCTION SprawdzOfZapListaWsk (oferta_id integer, zapotrzebowanie_id integer) RETURNS slownik AS $$
DECLARE
	test integer;
	result slownik;
BEGIN
	select into test id from prowizja_zapotrzebowanie where id_zapotrzebowanie = zapotrzebowanie_id and id_trans_rodzaj = (select id_rodz_trans from oferta where id = oferta_id);
	IF test is null THEN
		result.nazwa := '_nie_podpisano_umowy_nieokreslona_prowizja';
		RETURN result;
	ELSE
		select into test id from lista_wsk_adr where id_oferta = oferta_id and id_zapotrzebowanie = zapotrzebowanie_id;
		IF test is null THEN
			---sparwdzenie statusu oferty
			select into test id from oferta where id = oferta_id and id_status = (select id from status where nazwa = '_aktualna');
			IF test is not null THEN
				result.id := 1;
				RETURN result;
			ELSE
				result.nazwa := '_oferta_ma_status_inny_niz_aktualna';
				RETURN result;
			END IF;
		ELSE
			result.nazwa := '_oferta_jest_juz_na_liscie_wskazan';
			RETURN result;
		END IF;
	END IF;
END;
$$ LANGUAGE plpgsql;

---uzasadnienie dla trzymania tylko jednego id_klient w tabeli jest taka, iz sprawdzenie zajectosci klienta w takiej sytuacji jest prostsze i bardziej oczywiste
---za to trudniej ustalic odwrotnie : na ktore ogladania oferent jest juz sprzegniety z szukajacym

---id klienta oferujacego lub szukajacego w zaleznosci od boola								---true jesli wpis dotyczy oferenta, false jesli klienta
---procedura dopisujaca do systemu spotkanie (rozwinac o insert do kalendarza); dodawanie spotkania
CREATE FUNCTION DodajSpotkanie (spotkanie_id_o integer, spotkanie_id_k integer, oferta_id integer, zapotrzebowanie_id integer, umowienie_id integer, agent_id integer, sp_data date, 
sp_godzina_id integer, sp_minuta_id integer, komentarz_t text, osoby_ogl integer[], osoby_pok integer[]) RETURNS slownik AS $$ ----w polu id erkordu typu slownik ma byc id spotkania klienta, ktore zawsze powinno istniec
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
$$ LANGUAGE plpgsql;

CREATE FUNCTION PodajOsPokOfSpotkanie (spotkanie_kl_id integer) RETURNS integer AS $$
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
$$ LANGUAGE plpgsql;

CREATE FUNCTION UsunSpotkanie (spotkanie_id integer) RETURNS boolean AS $$
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
$$ LANGUAGE plpgsql;

CREATE FUNCTION PodajSpotkanieOsoba (osoba_id integer, oferent_b boolean) RETURNS SETOF SpotkaniaKlient AS $$
DECLARE
	result SpotkaniaKlient;
BEGIN
	---distinct on (id_spotkanie)
	FOR result in select * from SpotkaniaKlient where id_osoba = osoba_id and is_oferent = oferent_b and data >= (select current_date) order by data asc LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION PodajSpotkanieOferta (oferta_id integer, oferent_b boolean) RETURNS SETOF SpotkaniaKlient AS $$
DECLARE
	result SpotkaniaKlient;
BEGIN
	---distinct on (id_spotkanie)
	FOR result in select * from SpotkaniaKlient where id_oferta = oferta_id and is_oferent = oferent_b and data >= (select current_date) order by data asc LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION PodajSpotkanieZapotrzebowanie (zapotrzebowanie_id integer) RETURNS SETOF SpotkaniaKlient AS $$
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
$$ LANGUAGE plpgsql;

CREATE FUNCTION PodajOferenciSpotkanieZapotrzebowanie (zapotrzebowanie_id integer) RETURNS SETOF SpotkaniaKlient AS $$
DECLARE
	result SpotkaniaKlient;
BEGIN
	---distinct on (id_spotkanie)
	FOR result in select * from SpotkaniaKlient where id_zapotrzebowanie = zapotrzebowanie_id and is_oferent = true and data >= (select current_date) order by data asc LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

										---chodzi o oferenta, wiec na id oferty pobrac id klienta
---info zwracane przez metode ma charakter informacyjny i dowolny, mozna dodac dowolne spotkanie niezaleznie :)

---chyba trzeba zostawic id osoby ogladajacej czy pokazujacej, bedzie koniecznosc pokazania jej konkretnie
---nie wiem po co ta metoda, nie wiem gdzie dac ta kaluzule z data zeby to mialo sens, ale chyba w gornej czesci
CREATE FUNCTION PodajDostepneSpotkania (oferta_id integer) RETURNS SETOF SpotkaniaKlient AS $$
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
$$ LANGUAGE plpgsql;

CREATE FUNCTION OgladanieNieaktywne (ogladanie_id integer, agent_id integer) RETURNS boolean AS $$
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
$$ LANGUAGE plpgsql;

---to sie chyba nie przyda i nie bedzie uzywane :P - zmiana koncepcji na lepsza
---dodanie spotkania tylko dla oferenta - z pominieciem kalendarza (ewentualnie bool is oferent zeby proc byla bardziej uniwersalna)
CREATE FUNCTION DodajSpotkaniePomKal (spotkanie_id integer, oferta_id integer, zapotrzebowanie_id integer, is_oferent boolean, umowienie_id integer, agent_id integer, 
sp_data date, sp_godzina_id integer, sp_minuta_id integer, komentarz_t text, osoby integer[]) RETURNS slownik AS $$
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
$$ LANGUAGE plpgsql;

CREATE FUNCTION PodajSpotkanieEdycja(spotkanie_id integer) RETURNS SpotkaniaKlientEdycja AS $$
DECLARE
	result SpotkaniaKlientEdycja;
BEGIN
	select into result * from SpotkaniaKlientEdycja where id_spotkanie = spotkanie_id;
	RETURN result;
END;
$$ LANGUAGE plpgsql;

---podawanie osob dostepnych do wrzucenia na liste wskazan adresowych; 
---osoby sa wybierane sposrod osob dodanych do klienta, ktore nie sa juz umieszczone jako ogladajace
CREATE FUNCTION PodajOsDostListaWsk (zapotrzebowanie_id integer, oferta_id integer) RETURNS SETOF OsobaView AS $$
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
$$ LANGUAGE plpgsql;
---zastanowic si eczy nie do poprawy
CREATE FUNCTION PodajOsListaWsk (lista_wsk_adr_id integer) RETURNS SETOF PodajOsListaWsk AS $$
DECLARE
	result PodajOsListaWsk;
BEGIN
	FOR result IN select * from PodajOsListaWsk where id_lista_wsk_adr = lista_wsk_adr_id LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION UsunOsobaListaWsk (osoba_lista_wsk_adr_id integer) RETURNS boolean AS $$
DECLARE
BEGIN
	delete from osoba_lista_wsk_adr where id = osoba_lista_wsk_adr_id;
	IF found THEN
		RETURN true;
	ELSE
		RETURN false;
	END IF;
END;
$$ LANGUAGE plpgsql;

---utility: wczytywanie opisu oferty
CREATE FUNCTION PodajOpisOferty (oferta_id integer, jezyk_id integer, nier_rodzaj_id integer, rodz_budynek_id integer, nieruchomosc_id integer) RETURNS text AS $$
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
$$ LANGUAGE plpgsql;

CREATE FUNCTION PodajOfertaDoListaWsk (oferta_id integer, jezyk_id integer) RETURNS OfertaListaWskazan AS $$
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
	select into rec_temp oferta.id as id_oferta, nieruchomosc.id as id_nieruchomosc, nieruchomosc.id_klient, nieruchomosc.ulica as adres, oferta.cena || ' PLN' as cena, nieruchomosc.id_nier_rodzaj, oferta.id_rodz_trans as id_trans_rodzaj 
	from oferta 
	join nieruchomosc on oferta.id_nieruchomosc = nieruchomosc.id where oferta.id = oferta_id;
	--opis.wartosc as opis 
	---left join opis on oferta.id = opis.id_oferta where opis.id_jezyk = jezyk_id
	result.id_oferta := rec_temp.id_oferta;
	result.id_klient := rec_temp.id_klient;
	result.id_nier_rodzaj := rec_temp.id_nier_rodzaj;
	result.id_trans_rodzaj := rec_temp.id_trans_rodzaj;
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
$$ LANGUAGE plpgsql;

---ofertaobejrzana - PodajOfertaDoListaWsk + dane: data zlecenia; na id wlasciciela komplet danych ciagnac inna procedura - id wlasciciel w array
CREATE FUNCTION OfertaOgladnieta (oferta_id integer, jezyk_id integer) RETURNS OfertaOglDane AS $$
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
	result.id_nier_rodzaj := rec_temp.id_nier_rodzaj;
	result.id_trans_rodzaj := rec_temp.id_trans_rodzaj;
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
$$ LANGUAGE plpgsql;

---LISTA OFERT WIDZIANYCH PRZEZ KLIENTA
CREATE FUNCTION OfertyOgladniete (zapotrzebowanie_id integer, jezyk_id integer) RETURNS SETOF OfertaOgladanaKlient AS $$
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
$$ LANGUAGE plpgsql;

CREATE FUNCTION PodajListaWskZapotrzebowanie (zapotrzebowanie_id integer) RETURNS SETOF ListaWskZapotrzebowanie AS $$
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
		select into result.status nazwa from status where id = result.id_status;
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION PodajListaWskOferta (oferta_id integer) RETURNS SETOF ListaWskazanZapotrzebowanie AS $$
DECLARE
	result ListaWskazanZapotrzebowanie;
	rec_temp record;
	rec_osoba record;
	licznik integer;
	tel text;
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
			select into tel nazwa from telefon where id_osoba = rec_osoba.id_osoba; --TablicaTelefony
			result.telefon[licznik] := tel;
			licznik := licznik + 1;
		END LOOP;
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

---dodawanie informacji o szczegolowym rodzaju nieruchomosci dla danej transakcji przy poszukiwaniu, do zmiany
CREATE FUNCTION DodajSzczegNierZap (zapotrzebowanie_id integer, szczeg_id integer) RETURNS boolean AS $$
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
$$ LANGUAGE plpgsql;

CREATE FUNCTION UsunSzczegNierZap (zapotrzebowanie_id integer, szczeg_id integer) RETURNS boolean AS $$
DECLARE
BEGIN
	delete from zap_szcz_nier where id_zapotrzebowanie = zapotrzebowanie_id and id_rodz_nier_szcz = szczeg_id;
	IF found THEN
		return true;
	ELSE
		return false;
	END IF;
END;
$$ LANGUAGE plpgsql;

---usuniecie lokalizacji - tu bezwarunkowo :P

CREATE FUNCTION UsunRegGeogZap (zapotrzebowanie_trans_rodzaj_id integer, reg_id integer) RETURNS boolean AS $$
DECLARE
	
BEGIN
	delete from zap_lokaliz_nier where id_region_geog = reg_id and id_zapotrzebowanie_trans_rodzaj = zapotrzebowanie_trans_rodzaj_id;
	IF found THEN
		return true;
	ELSE
		return false;
	END IF;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION PodajRegGeogZap (zapotrzebowanie_trans_rodzaj_id integer) RETURNS SETOF RegGeog AS $$
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
$$ LANGUAGE plpgsql;

CREATE FUNCTION DodajParametrZap (op_dodawania boolean, min_b boolean, zapotrzebowanie_trans_rodzaj_id integer, parametr_id integer, informacja text) 
RETURNS boolean AS $$
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
$$ LANGUAGE plpgsql;

CREATE FUNCTION DodajWyposazenieZap (op_dodawania boolean, zapotrzebowanie_trans_rodzaj_id integer, wyposazenie_id integer) RETURNS boolean AS $$
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
$$ LANGUAGE plpgsql;

---dodanie do listy wskazan adresowych: wrzucenie samego ogladania jak i osob, ktore widzialy

---to bedzie chyba niepotrzebne - to jest chyba w ogole nie uzywane
CREATE FUNCTION EdycjaPomieszczeniaNieruchomosc (tab_pom integer[]) RETURNS SETOF PomieszczeniaNieruchomosc AS $$
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
$$ LANGUAGE plpgsql;

CREATE FUNCTION DodajZdjecie (nieruchomosc_id integer, rozszerzenie text) RETURNS text AS $$
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
$$ LANGUAGE plpgsql;

CREATE FUNCTION UsunZdjecie (zdjecie_id integer) RETURNS text AS $$
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
$$ LANGUAGE plpgsql;

CREATE FUNCTION PodajZdjecia (nieruchomosc_id integer, sciezka text) RETURNS SETOF slownik AS $$
DECLARE
	result slownik;
BEGIN
	FOR result IN select id, nazwa from zdjecie where id_nieruchomosc = nieruchomosc_id order by id LOOP
		result.nazwa := '<a href="' || sciezka || result.nazwa || '" target="_blank"><img src="' || sciezka || result.nazwa || '" width="30" length="30" /></a>';
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION DodajFilm (nieruchomosc_id integer, rozszerzenie text) RETURNS text AS $$
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
$$ LANGUAGE plpgsql;

CREATE FUNCTION UsunFilm (film_id integer) RETURNS text AS $$
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
$$ LANGUAGE plpgsql;

CREATE FUNCTION PodajFilmy (nieruchomosc_id integer, sciezka text) RETURNS SETOF slownik AS $$
DECLARE
	result slownik;
BEGIN
	FOR result IN select id, nazwa from film where id_nieruchomosc = nieruchomosc_id LOOP
		result.nazwa := '<a href="' || sciezka || result.nazwa || '" target="_blank"><img src="' || sciezka || result.nazwa || '" width="30" length="30" /></a>';
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

---dodajtelefon media wywolac jesli jest tam osoba uzyta gdzies - petla
CREATE FUNCTION DodajTelefon (tel_id integer, osoba_id integer, nr_tel text, opis_tel text, powrot boolean) RETURNS boolean AS $$
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
$$ LANGUAGE plpgsql;

CREATE FUNCTION UsunTelefon (tel_id integer) RETURNS boolean AS $$
DECLARE
	
BEGIN
	delete from telefon where id = tel_id;
	IF found THEN
		return true;
	ELSE
		return false;
	END IF;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION DodajKomorka (osoba_id integer, nr_tel text, opis_tel text) RETURNS boolean AS $$
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
$$ LANGUAGE plpgsql;

CREATE FUNCTION UsunKomorka (osoba_id integer) RETURNS boolean AS $$
DECLARE
	
BEGIN
	delete from komorka where id_osoba = osoba_id;
	IF found THEN
		return true;
	ELSE
		return false;
	END IF;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION DodajEmail (mail_id integer, osoba_id integer, adr_email text, opis_email text) RETURNS boolean AS $$
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
$$ LANGUAGE plpgsql;

CREATE FUNCTION UsunEmail (mail_id integer) RETURNS boolean AS $$
DECLARE
	
BEGIN
	delete from email_osoba where id = mail_id;
	IF found THEN
		return true;
	ELSE
		return false;
	END IF;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION PodajEmaile (osoba_id integer) RETURNS SETOF email_osoba AS $$
DECLARE
	result email_osoba;
BEGIN
	FOR result IN select * from email_osoba where id_osoba = osoba_id order by nazwa asc LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

---select * from KojarzenieNpoziomoweWyp(410, 117, 4);
CREATE FUNCTION KojarzenieNpoziomoweWyp (nieruchomosc_id integer, zapotrzebowanie_trans_rodzaj_id integer, poziom integer) RETURNS boolean AS $$
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
$$ LANGUAGE plpgsql;


---tu wszelkie uwagi dotyczace kojarzenia - a bedzie ich od zajebania :), ale chyba pozniej :P
---ideologia jest nastepujaca: 
	---	- pobieramy istniejace z obu stron parametry minimalne zapotrzebowania i parametry nieruchomosci dla danej wagi (poziomu) podanego przez parametr, rozrozniamy tez rodzaje wartosci
			---wg walidacji na calkowite i floatowe
			---zalozenie jest takie ze nie interesujemy sie zadna ze stron w kontekscie braku jakiegos parametru - zakladamy ze potrzebujacy mogl nie podac ile chce - wobec tego chce wszystko
			---to samo tyczy istniejacej nieruchomosci
	--- - pobieramy precyzje wg ktorej testujemy informacje i dokonujemy porownan: parametry floatowe maja precyzje procentowa, parametry calkowite maja liczbe calkowita odejmowana i dodawana
	--- - patent uzywany w 2 storny w dokladnie ten sam sposob :P
	--- - metoda do wywolania idzie w kojarzeniu ogolnym, jesli osoba okresli jakis poziom, po skojarzeniu lokalizacji cen i rodzajow transakcji, jak i aktualnosci podejmowane jest kojarzenie
			---z ta procedura jesli poziom podany przez uzytkownika jest wiekszy niz 0 :P
---kojarzenie parametryczne :P
CREATE FUNCTION KojarzenieNpoziomowe (nieruchomosc_id integer, zapotrzebowanie_trans_rodzaj_id integer, poziom integer) RETURNS boolean AS $$
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
$$ LANGUAGE plpgsql;

---majac do dyspozycji id_oferty i id_zapotrzebowanie_trans_rodzaj zwracamy boolean - true jesli sie naklada
---zamienic ta oferta na nieruchomosc id bo co chwila jest potrzebne :P i wielokrotne pobieranie nadrabia tylko
CREATE FUNCTION KojarzenieLokalizacje (nieruchomosc_id integer, zapotrzebowanie_trans_rodzaj_id integer) RETURNS boolean AS $$
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
$$ LANGUAGE plpgsql;

CREATE FUNCTION KojarzenieLokalizacjeMediaZapotrzebowanie (media_of_id integer, zapotrzebowanie_trans_rodzaj_id integer) RETURNS boolean AS $$
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
$$ LANGUAGE plpgsql;

CREATE FUNCTION KojarzenieLokalizacjeMediaOferta (nieruchomosc_id integer, media_zap_id integer) RETURNS boolean AS $$
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
$$ LANGUAGE plpgsql;

CREATE FUNCTION KojarzenieLokalizacjeMedia (media_of_id integer, media_zap_id integer) RETURNS boolean AS $$
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
$$ LANGUAGE plpgsql;

---SzybkieSzukanie (klient_nazwisko text, of_numer integer)
---wjebac ! :) tu parametr pozioma kojarzenia od nulla wzwyz :D:D:D:D:D - null nie kojarzy poziomowo rzecz jasna :):):):)
---KojarzenieNpoziomowe (nieruchomosc_id integer, zapotrzebowanie_trans_rodzaj_id integer, poziom integer)
CREATE FUNCTION KojarzenieBazoweDlaZapotrzebowania (zapotrzebowanie_trans_rodzaj_id integer, poziom_param integer, poziom_wyp integer, nowe boolean) RETURNS SETOF SzukajOfertaNierView AS $$
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
$$ LANGUAGE plpgsql;

---kojarzenie wpisow z mediow dla zapotrzebowania
CREATE FUNCTION KojarzenieZapotrzebowanieMedia (zapotrzebowanie_trans_rodzaj_id integer) RETURNS SETOF MediaNieruchomosc AS $$
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
$$ LANGUAGE plpgsql;

---kurwa gdzie tu sie z tym w srodek kojarzenia wjebalem .... rece opadaja :P
CREATE FUNCTION SprawdzObecnoscOfZlec (oferta_id integer, zapotrzebowanie_id integer, nowe boolean, cena_of float) RETURNS boolean AS $$
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
$$ LANGUAGE plpgsql;

---KojarzenieNpoziomowe (nieruchomosc_id integer, zapotrzebowanie_trans_rodzaj_id integer, poziom integer)
CREATE FUNCTION KojarzenieBazoweDlaOferty (oferta_id integer, poziom_param integer, poziom_wyp integer, nowe boolean) RETURNS SETOF ZapotrzTransNierRodzaj AS $$
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
	--status_akt integer;
BEGIN
	--select into status_akt id from status where nazwa = '_aktualna';
	---and id_status = status_akt 
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
$$ LANGUAGE plpgsql;

---kojarzenie mediow dla ofert zleconych (szukanie poszukujacych w mediach)
CREATE FUNCTION KojarzenieOfertaMedia (oferta_id integer) RETURNS SETOF MediaNieruchomosc AS $$
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
$$ LANGUAGE plpgsql;

---kojarzenie oferujacych z mediow z klientami - szukanie dla zglaszajacego np przez telefon szukajacych ktorzy otworzyli zlecenie
CREATE FUNCTION KojarzenieMediaZapotrzebowanie (media_nieruchomosc_id integer) RETURNS SETOF ZapotrzTransNierRodzaj AS $$
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
$$ LANGUAGE plpgsql;

---szukanie istniejacych w systemie ofert dla poszukujacego z mediow
CREATE FUNCTION KojarzenieMediaOferta (media_nieruchomosc_id integer) RETURNS SETOF SzukajOfertaNierView AS $$
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
$$ LANGUAGE plpgsql;

CREATE FUNCTION KojarzenieMedia (media_nieruchomosc_id integer, is_oferent boolean) RETURNS SETOF MediaNieruchomosc AS $$
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
$$ LANGUAGE plpgsql;

CREATE FUNCTION PokazWybraneParamZlecenie (zapotrzebowanie_trans_rodzaj_id integer, poziom integer) RETURNS setof slownik AS $$
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
$$ LANGUAGE plpgsql;

CREATE FUNCTION PokazWybraneParamOferta (oferta_id integer, poziom integer) RETURNS setof slownik AS $$
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
$$ LANGUAGE plpgsql;

CREATE FUNCTION DodajMediaNieruchomoscOs (nier_rodzaj_id integer, trans_rodzaj_id integer, region_id integer, status_id integer, ulica_lok text, is_oferent boolean, powierzchnia_t text, cena_t text, 
opis_n_t text, przyp_data date, koment text, agent_id integer, osoba_id integer) RETURNS slownik AS $$ ---slownik, gdyz wystepuje koniecznosc podania id inserta w przypadku wykorzystania w innej proc
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
$$ LANGUAGE plpgsql;

---z czasem dolaczyc debugowanie - stad zwraca slownik
---zaczniemy od debugu - sprawdzenie, czy dodawana osoba, jesli  w ogole jest imie i nazwisko po telefonie imieniu i nazwisku wystepuje w systemie
---zmiana tabeli media_nieruchomosc pociagaja za soba koniecznosc zmiany tej procedury
---zastanowi csie czy nie dac opcji szukania osoby i wtedy podania id ... -- koniecznie !! powyzej procedura dodania prz znanym id osoby, ponizsza z niej skorzysta w przypadku dodawania lub znalezienia istniejacej osoby
CREATE FUNCTION DodajMediaNieruchomosc (nier_rodzaj_id integer, trans_rodzaj_id integer, region_id integer, status_id integer, ulica_lok text, is_oferent boolean, powierzchnia_t text, cena_t text, 
opis_n_t text, przyp_data date, medium_id integer, koment text, agent_id integer, nazwisko_os text, imie_os integer, telefon_os text, tel_opis text, email_os text, email_opis text) RETURNS slownik AS $$ ---update zrobic osobno
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
$$ LANGUAGE plpgsql;

CREATE FUNCTION UaktualnijMediaNieruchomosc (media_nieruchomosc_id integer, nier_rodzaj_id integer, trans_rodzaj_id integer, region_id integer, status_id integer, ulica_lok text, is_oferent boolean, 
powierzchnia_t text, cena_t text, opis_n_t text, przyp_data date) RETURNS boolean AS $$
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
$$ LANGUAGE plpgsql;

CREATE FUNCTION PrzyjetoZMediow (media_nieruchomosc_id integer, of_zap_id integer) RETURNS slownik AS $$
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
$$ LANGUAGE plpgsql;

CREATE FUNCTION PodajMediumDlaOfZap (of_zap_id integer, is_oferent boolean) RETURNS SETOF MediaNieruchomosc AS $$
DECLARE
	result MediaNieruchomosc;
BEGIN
	FOR result in select * from MediaNieruchomosc where oferent = is_oferent and id_of_zap = of_zap_id LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION EdytujMediaNieruchomosc (media_nieruchomosc_id integer) RETURNS MediaNieruchomoscEdycja AS $$
DECLARE
	result MediaNieruchomoscEdycja;
BEGIN
	--media_nieruchomosc.id_region_geog
	select into result * from MediaNieruchomoscEdycja where id_media_nieruchomosc = media_nieruchomosc_id;
	select into result.region nazwa from PelneZagnRegion(result.id_region_geog);
	RETURN result;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION PodajKontaktyMediaNier (media_nieruchomosc_id integer) RETURNS SETOF KontaktMediaNier AS $$
DECLARE
	result KontaktMediaNier;
BEGIN
	FOR result in select * from KontaktMediaNier where id_media_nieruchomosc = media_nieruchomosc_id order by data desc LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION DodajKontaktMediaNier (media_nieruchomosc_id integer, agent_id integer, koment text) RETURNS boolean AS $$
DECLARE
	akt_czas timestamp;
BEGIN
	select into akt_czas date_trunc('second', current_timestamp::timestamp);
	insert into kon_m_nieruchomosc (id_media_nieruchomosc, id_agent, komentarz, data) values (media_nieruchomosc_id, agent_id, koment, akt_czas);
	RETURN true;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION PodajReklamaMedia (media_nieruchomosc_id integer) RETURNS SETOF ReklamaMedia AS $$
DECLARE
	result ReklamaMedia;
BEGIN
	FOR result in select * from ReklamaMedia where id_media_nieruchomosc = media_nieruchomosc_id order by data desc LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION DodajReklamaMedia (media_nieruchomosc_id integer, media_reklama_id integer, akt_data date) RETURNS boolean AS $$
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
$$ LANGUAGE plpgsql;

CREATE FUNCTION PodajOfertyMedia (is_oferent text, tel text, nier_rodzaj_id integer, trans_rodzaj_id integer, data_od date, data_do date, sort_kol text, sort_kier integer) RETURNS SETOF MediaNieruchomosc AS $$
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
--, nieruchomosc_rodzaj, cena, transakcja_rodzaj, id_region_geog, region, ulica, status, id_status, data, oferent, przypomnienie, agent, 
--	id_agent, telefon, id_osoba, id_of_zap, id_nier_rodzaj, id_trans_rodzaj, media_reklama
	zapytanie := 'select * from (select distinct on (id_media_nieruchomosc) * from MediaNieruchomosc ';
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

	zapytanie := zapytanie || ') as a1 order by ' || kolumna_sort || ' ' || porzadek || ' limit 501';		
	FOR result in execute zapytanie limit 121 LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION PodajOfertyMediaPrzyjecie (is_oferent boolean, tel text, nier_rodzaj_id integer, trans_rodzaj_id integer) RETURNS SETOF MediaNieruchomosc AS $$
DECLARE
	result MediaNieruchomosc;
BEGIN
	FOR result in select * from MediaNieruchomosc where oferent = is_oferent and telefon like tel and id_nier_rodzaj = nier_rodzaj_id and id_trans_rodzaj = trans_rodzaj_id and id_of_zap is null limit 121 LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

 CREATE FUNCTION PodajTelefonMedia (media_nieruchomosc_id integer) RETURNS SETOF telefon_media_nieruchomosc AS $$
DECLARE
	result telefon_media_nieruchomosc;
BEGIN
	FOR result in select * from telefon_media_nieruchomosc where id_media_nieruchomosc = media_nieruchomosc_id LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION UsunTelefonMedia (telefon_media_nieruchomosc_id integer) RETURNS boolean AS $$
DECLARE
BEGIN
	delete from telefon_media_nieruchomosc where id = telefon_media_nieruchomosc_id;
	IF found THEN
		RETURN true;
	ELSE
		RETURN false;
	END IF;
END;
$$ LANGUAGE plpgsql;

---id osoby mogloby wpadac z parametru jesli jest ale poki co ok
---parametr powrot decydujeczy moze byc odpalony perform do kontaktow osoby zeby nie zrobic petli smierci
CREATE FUNCTION DodajTelefonMedia (telefon_media_nieruchomosc_id integer, media_nieruchomosc_id integer, tel text, opis_t text, powrot boolean) RETURNS boolean AS $$
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
$$ LANGUAGE plpgsql;

CREATE FUNCTION PodajEmailMedia (media_nieruchomosc_id integer) RETURNS SETOF email_media_nieruchomosc AS $$
DECLARE
	result email_media_nieruchomosc;
BEGIN
	FOR result in select * from email_media_nieruchomosc where id_media_nieruchomosc = media_nieruchomosc_id LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION UsunEmailMedia (email_media_nieruchomosc_id integer) RETURNS boolean AS $$
DECLARE
BEGIN
	delete from email_media_nieruchomosc where id = email_media_nieruchomosc_id;
	IF found THEN
		RETURN true;
	ELSE
		RETURN false;
	END IF;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION DodajEmailMedia (email_media_nieruchomosc_id integer, media_nieruchomosc_id integer, mail text, opis_t text) RETURNS boolean AS $$
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
$$ LANGUAGE plpgsql;

CREATE FUNCTION PodajPrzypomnieniaMedia (agent_id integer) RETURNS SETOF MediaNieruchomosc AS $$
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
$$ LANGUAGE plpgsql;

CREATE FUNCTION PodajMediaNaCzasie (agent_id integer) RETURNS SETOF MediaNieruchomosc AS $$
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
$$ LANGUAGE plpgsql;

CREATE FUNCTION MediaOsoba (osoba_id integer) RETURNS SETOF MediaNieruchomosc AS $$
DECLARE
	result MediaNieruchomosc;
BEGIN
	FOR result in select * from MediaNieruchomosc where id_osoba = osoba_id LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

---podanie ofert na numer telefonu
CREATE FUNCTION PodajOfertyTelefon (tel text) RETURNS SETOF SzukajOfertaWszystkieOs as $$
DECLARE
	result SzukajOfertaWszystkieOs;
BEGIN
	FOR result in select * from SzukajOfertaWszystkieOs where telefon like tel or komorka like tel limit 121 LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

---podanie zlecen na numer telefonu
CREATE FUNCTION PodajZapotrzebowanieTelefon (tel text) RETURNS SETOF SzukajZapotrzebowanieWszystkieOs as $$
DECLARE
	result SzukajZapotrzebowanieWszystkieOs;
BEGIN
	FOR result in select * from SzukajZapotrzebowanieWszystkieOs where telefon like tel or komorka like tel limit 121 LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

-----------      umowy          ----------
---zdecydowac, czy dane do umowy kupna beda gromadzone ta sama procedura co dane umowy sprzedazy
CREATE FUNCTION PodajDaneUmowa (zapotrzebowanie_id integer) RETURNS UmowaDane AS $$
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
	select into result.telefon nazwa from PodajTelefony(rec_daneumowakupno.id_osoba);
	select into result.komorka nazwa from PodajKomorka(rec_daneumowakupno.id_osoba);
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
$$ LANGUAGE plpgsql;

---procedura podsuwa zdjecie do gory o jedno miejsce lub zsuwa w dol
CREATE FUNCTION PodniesZdjecie (zdjecie_id integer, nieruchomosc_id integer) RETURNS boolean AS $$
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
$$ LANGUAGE plpgsql;

CREATE FUNCTION ObnizZdjecie (zdjecie_id integer, nieruchomosc_id integer) RETURNS boolean AS $$
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
$$ LANGUAGE plpgsql;

CREATE FUNCTION PodajAgentow() RETURNS SETOF slownik AS $$
DECLARE
	result slownik;
BEGIN
	FOR result in select id,nazwa_pot as nazwa from agent where aktywnosc_konto = true order by nazwa_pot asc LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

---z id oferty jest wrozone id trans i id nier rodzaj :P
CREATE FUNCTION PodajDaneZapotrzebowanie (zapotrzebowanie_id integer, oferta_id integer) RETURNS ZapotrzebowanieDane AS $$
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
$$ LANGUAGE plpgsql;

CREATE FUNCTION PodajJezykiId () RETURNS SETOF integer AS $$
DECLARE
	jezyk_id integer;
BEGIN
	FOR jezyk_id in select id from jezyk order by id asc LOOP
		RETURN NEXT jezyk_id;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION SprawdzIstOferta (oferta_id integer) RETURNS boolean AS $$
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
$$ LANGUAGE plpgsql;

CREATE FUNCTION ZmianaCena (oferta_id integer) RETURNS SETOF ZmianaCeny AS $$
DECLARE
	result ZmianaCeny;
BEGIN
	FOR result in select * from ZmianaCeny where id_oferta = oferta_id order by data LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

----poczatek refactoringu : region przetwarzania regionow geograficznych
---dodanie lokalizacji - nalezy sprawdzic, czy nie jest dodawane dziecko juz istniejacej lokalizacji, jesli tak dodanie jest bez sensu i nie ma sie powiesc
CREATE FUNCTION DodajRegGeogZap (zapotrzebowanie_trans_rodzaj_id integer, reg_id integer) RETURNS slownik AS $$
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
$$ LANGUAGE plpgsql;

CREATE FUNCTION RegionGeograficznyNajnizejWoj (text_nazwa text, wojewodztwo_id integer) RETURNS SETOF RegGeog AS $$
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
$$ LANGUAGE plpgsql;

CREATE FUNCTION RegionGeograficznyCzwPozWoj (text_nazwa text, wojewodztwo_id integer) RETURNS SETOF RegGeog AS $$
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
$$ LANGUAGE plpgsql;

---pobiera tylko dzieci nie majace juz dzieci - najnizsze regiony geograficzne
---czy to nie jest DEPRECATED ?? jesli nie uzywane wywalic
CREATE FUNCTION RegionGeograficznyNajnizej (text_nazwa text) RETURNS SETOF RegGeog AS $$
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
$$ LANGUAGE plpgsql;

CREATE FUNCTION PodajDzielniceOpole () RETURNS SETOF slownik AS $$
DECLARE
	result slownik;
	opole_id integer;
BEGIN
	opole_id := 574;
	result.id := 1;
	result.nazwa := '--------';
	RETURN NEXT result;
	FOR result in select id, nazwa from region_geog where id_parent = opole_id order by nazwa asc LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;
---koniec regionow geograficznych


---triggery - kontakt osob a media --- raczej nie powstana, wiec ta sekcja raczej anulowana - moze sie  w przyszlosci przyda

---koniec triggerow kontakt osob a media


---CREATE FUNCTION OfertyAgent (agent_id integer, sort_kol text, sort_kier integer) RETURNS SETOF SzukajOfertaNierView AS $$
---DECLARE
---	result SzukajOfertaNierView;
---	kolumna_sort text;
---	porzadek text;
---BEGIN
---	IF sort_kol is null or character_length(sort_kol) = 0 THEN
---		kolumna_sort := 'nieruchomosc_rodzaj';
---	ELSE
---		kolumna_sort := sort_kol;
---	END IF;
---	IF sort_kier = 1 THEN
---		--sortowanie rosnace
---		porzadek := 'asc';
---	ELSE
---		porzadek := 'desc';
---	END IF;
---	FOR result in execute 'select * from SzukajOfertaNierView where id_agent = ' || agent_id || ' order by ' ||
---	kolumna_sort || ' ' || porzadek LOOP
---		RETURN NEXT result;
---	END LOOP;
---	RETURN;
---END;
---$$ LANGUAGE plpgsql;