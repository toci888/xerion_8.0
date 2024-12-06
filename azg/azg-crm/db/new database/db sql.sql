---w wyposazeniach i parametrach na nazwy warto chyba zasadzic unique
SET client_encoding TO LATIN2;

drop table konto_agent;
drop table rozmowa_przychodzaca;
drop table status_dzwonienie;
drop table subskrypcja;
drop table precyzja_kojarzenie;
drop table portal_wys;
drop table portal;
drop table kategoria_allegro;
drop table email_media_nieruchomosc;
drop table telefon_media_nieruchomosc;
drop table reklama_nieruchomosc_m;
drop table kon_m_nieruchomosc;
drop table media_nieruchomosc;
drop table agent_kalendarz;
drop table kalendarz;
drop table kredytowanie; ---jesli transakca wymaga kredytu (a nie zawsze), to tu detale kredytu
drop table wlasciciel; ---osoby zawierajace transakcje dla obu stron (podstawowo klient, w przypadku firmy mniejsze znaczenie)
drop table transakcja; ---tabela nawiazanej transakcji
drop table rekord_nieakt_lista_wsk_adr;
drop table osoba_lista_wsk_adr;
drop table spotkanie_os;
drop table spotkanie;
drop table lista_wsk_adr; ---lista kto co widzial
drop table minuta;
drop table godzina;
drop table dane_slow_wyp_zap; ---okreslone parametry slownikowe wyposazenia dla poszukiwanej nieruchomosci
drop table dane_txt_zap_max;
drop table dane_txt_zap_min; ---dane textowe dla parametrow nieruchomosci przy zapotrzebowaniu
drop table zap_lokaliz_nier; ---gdzie chop szuka nieruchomosci
drop table zap_szcz_nier; ---jaki typ domu/mieszkania
drop table osoba_zapotrzebowanie;
drop table osoba_oferta;
drop table opis_wew_zapotrzebowanie;
drop table opis_zapotrzebowanie;
drop table opis_posz_zapotrzebowanie;
drop table zamiana;
drop table zapotrzebowanie_trans_rodzaj;
drop table zapotrzebowanie_nier_rodzaj;
drop table prowizja_zapotrzebowanie;
drop table zapotrzebowanie; ---poszukiwania klientow
drop table dane_slow_wyp_pom;
drop table dane_txt_pom;
drop table pomieszczenie_przyn_nier;
drop table dane_slow_wyp_nier; ---dane slownikowe wyposazenie nieruchomosci
drop table dane_txt_nier; ---dane wpisywane z reki - lista mozliwosci tez bedzie ze slownika
drop table opis_nieruchomosc;
drop table cena; ---ceny nieruchomosci w danej ofercie (kolejne ceny :P)
drop table opis;
drop table oferta; ---3 kolumnowa podstawowa tabela danych gwarantujaca unikatowosc oferty oraz wskazujaca rodzaj transakcji i nieruchomosc
drop table film;
drop table zdjecie;
drop table nieruchomosc; ---podstawowe parametry nieruchomosci
drop table telefon_os_bank;
drop table osoba_kon_bank;
drop table dane_firma; ---dane podmiotu gospodarczego
drop table email_osoba;
drop table komorka;
drop table telefon; ---telefony do osob
drop table osoba_klient;
drop table osoba_adres;
drop table osoba_dowod;
drop table osoba; ---osoby fizyczne oraz reprezentanci firm
drop table biuro_nier_wspolpraca;
drop table biuro_nier_kon;
drop table ustalenia;
drop table klient; ---klienci
drop table agent; ---pracownicy
drop table kurs;

---end of tabele z danymi

drop table pomieszczenie_nier;
---drop table pokaz_parametr; ---lista parametrow, ktore mozna pokazac na stronie internetowej dla danego typu transakcji
drop table transakcja_nier; ---lista dostepnych transakcji dla danego rodzaju nieruchomosci
drop table lista_param_slow_pom;
drop table lista_param_pom;
-----drop table tlumaczenie; ---tlumaczenie na jezyki obce tabel parametrow i wyposazen nieruchomosci
drop table param_nier_strona;
drop table wypos_nier_strona;
drop table lista_param_slow_nier; ---lista parametrow dostepnych dla kazdego typu nieruchomosci pochodzaca ze slownika
drop table lista_param_nier; ---lista parametrow dostepnych dla kazdego typu nieruchomosci dla danych do podania z lapy
drop table tlumaczenie; ---tlumaczenia na poszczegolne jezyki
drop table umowienie; ---3 powody spotkan 2 stron

---end of tabele konfiguracyjne

drop table osobowosc; ---slownik osoba fizyczna osoba prawna
drop table bank; ---slownik bankow (kredytujacych)
drop table imie; ---slownik imion
---drop table miejscowosc; ---slownik miejscowosci poszczegolnych gmin
---drop table gmina; ---slownik gmin poszczegolnych powiatow
---drop table powiat; ---powiaty (districts) poszczegolnych wojewodztw (provinces)
---drop table wojewodztwo; ---wojewodztwa (provinces) poszczegolnych krajow
drop table region_geog; ---slownik krajow, wojewodztw itd
drop table wyposazenie_pom;
drop table parametr_pom;
drop table parametr_nier; ---lista parametrow wszystkich nieruchomosci dla informacji klepanych z klawiatury : ilosc pokoi, powierzchnia
drop table wyposazenie_nier; ---parametry nieruchomosci slownikowe : sila, gaz, krycie dachu etc
drop table pomieszczenie;
drop table rodz_nier_szczeg; ---typ zabudowy nieruchomosci : blizniak etc
drop table telefon_niechciany;
drop table lista_niechcianych;
drop table media_reklama;
drop table rodzaj_dowod_tozsamosc;
drop table sekcja; ---okreslenie rodzaju danych : podstawowe, okolica itd
drop table nier_rodzaj; ---typy nieruchomosci : dom, mieszkanie
drop table trans_rodzaj; ---sprzedaz, wynajem, zamiana, dzierzawa
drop table sposob_finansowania;
drop table status; ---statusy transakcji, takze ofert ?? - wrzucenie oferty na transakcje zawiesza nieruchomosc (moze byc trigger)
---pytanie czy sa 2 rozne zestawienia statusow ?? czy status idzie do nieruchomosci wylacznie ?? (ewentualnie oferty, ale)
---bez sensu zeby wynajem domu zawisic a kupno nie jak to ten sam dom
-----drop table umowa; ---umowy zawierane pomiedzy stronami - rodzaje
drop table walidacja;
drop table lang_tag; ---zestaw tagow slow ktore w cms maja znaqczenie wielojezykowe
drop table jezyk; ---slownik jezykow obcych obslugiwanych na stronie
drop table waluta;
drop table priorytet_reklama;

---drop end, create begining : slowniki

create table priorytet_reklama (
id serial primary key,
nazwa text);

create table waluta (
id serial primary key,
nazwa varchar(20) not null,
skrot varchar(10) not null
);

create table jezyk (
id serial primary key,
nazwa varchar(20) not null unique,
id_waluta integer references waluta(id) not null
);

create table lang_tag (
id serial primary key,
nazwa text not null unique
);

create table walidacja (
id serial primary key,
nazwa varchar(20) not null
);

create table status (
id serial primary key,
nazwa varchar(20) not null
);

create table sposob_finansowania (
id serial primary key,
nazwa varchar(30) not null
);

create table trans_rodzaj ( ---uzupelnione
id serial primary key,
nazwa varchar(30) not null,
nazwa_zap varchar(30) not null);

create table nier_rodzaj ( ---uzupelnione
id serial primary key,
nazwa varchar(30) not null
);

create table rodzaj_dowod_tozsamosc (
id serial primary key,
nazwa varchar(30) not null);

create table sekcja ( ---uzupelnione
id serial primary key,
nazwa varchar(40) not null
);

create table media_reklama (
id serial primary key,
nazwa text not null unique
);

create table lista_niechcianych (
id serial primary key,
nazwa varchar(30) not null
);

create table telefon_niechciany (
id serial primary key,
id_lista_niechcianych integer references lista_niechcianych(id) not null,
nazwa varchar(13) not null,
opis varchar(50)
);

create table rodz_nier_szczeg ( ---do ustalenia
id serial primary key,
id_nier_rodzaj integer references nier_rodzaj(id) not null,
nazwa varchar(30) not null
);

create table pomieszczenie (
id serial primary key,
waga integer,
nazwa varchar(30) not null
);

create table wyposazenie_nier (
id serial primary key,
id_parent integer references wyposazenie_nier(id), ---tu null musi byc allowed
wielokrotne boolean, ---pole zaznaczalne tylko dla parenta(niekoniecznie), dozwalanie na wielokrotne wybieranie dzieci lub zabranianie np. jak centrum to nie 
---peryferia, ale np ogrzewanie gazowe i tez ogrzewanie srakie :P
ma_dzieci boolean,
waga integer not null, ---docelowo ma wyleciec, wagi beda ustalane osobno dla poszczegolnych nieruchomosci i transakcji
id_sekcja integer references sekcja(id) not null,
nazwa varchar(60) not null
);

create table parametr_nier ( ---lista wszystkich mozliwych informacji gromadzonych o nieruchomosci nie bedacych slownikowymi, 
---podawane z lapy np powierzchnia itd. W tej tabeli maja byc wszystkie mozliwosci niezaleznie od rodzaju nieruchomosci
id serial primary key,
id_sekcja integer references sekcja(id) not null,
id_walidacja integer references walidacja(id) not null,
waga integer not null, ---poziom istotnosci do kojarzenia
nazwa varchar(40) not null,
dl_inf integer
);

create table wyposazenie_pom (
id serial primary key,
id_parent integer references wyposazenie_pom(id),
wielokrotne boolean,
ma_dzieci boolean,
waga integer not null,
id_sekcja integer references sekcja(id) not null,
nazwa varchar(60) not null
);

create table parametr_pom ( 
id serial primary key,
id_sekcja integer references sekcja(id) not null,
id_walidacja integer references walidacja(id) not null,
waga integer not null,
nazwa varchar(40) not null,
dl_inf integer
);

create table region_geog (
id serial primary key,
id_parent integer references region_geog(id),
id_otodom integer,
nazwa varchar(60) not null,
zaglebienie integer,
ma_dzieci boolean default true,
pokaz boolean default true ---miejscowosci, ktore na stronie moga sie pojawic w naglowku ofert
);

---create table wojewodztwo (
---id serial primary key,
---id_kraj integer references kraj(id) not null,
---id_otodom integer,
---nazwa varchar(30) not null
---);

---create table powiat (
---id serial primary key,
---id_wojewodztwo integer references wojewodztwo(id) not null,
---id_otodom integer,
---nazwa varchar(30) not null
---);

---create table gmina (
---id serial primary key,
---id_powiat integer references powiat (id) not null,
---nazwa varchar(30) not null
---);

---create table miejscowosc (
---id serial primary key,
---id_gmina integer references gmina (id) not null,
---nazwa varchar(30) not null
---);

create table imie (
id serial primary key,
nazwa varchar(60) not null unique
);

create table bank (
id serial primary key,
nazwa varchar(50) not null
);

create table osobowosc (
id serial primary key,
nazwa varchar(25) not null
);

create table umowienie ( ---ogladanie, umowa przedwstepna, umowa notarialna, odbior mieszkania czy to nie ???
id serial primary key,
nazwa varchar(40) not null
);

---statusy klientow

---tabele konfiguracyjne

create table tlumaczenie (
id serial primary key,
nazwa_lang_tag text references lang_tag(nazwa) not null,
id_jezyk integer references jezyk(id) not null,
nazwa text not null
);

create table lista_param_nier (
id serial primary key,
id_nier_rodzaj integer references nier_rodzaj (id) not null,
id_parametr_nier integer references parametr_nier(id) not null,
id_trans_rodzaj integer references trans_rodzaj(id) not null,
waga integer, --- not null, 
pokaz boolean
);

create table param_nier_strona (
id serial primary key,
id_nier_rodzaj integer references nier_rodzaj (id) not null,
id_parametr_nier integer references parametr_nier(id) not null,
id_trans_rodzaj integer references trans_rodzaj(id) not null
);

create table lista_param_slow_nier ( ---lista parametrow slownikowych nieruchomosci dla danego rodzaju nieruchomosci
id serial primary key,
id_nier_rodzaj integer references nier_rodzaj (id) not null,
id_wyposazenie_nier integer references wyposazenie_nier(id) not null,
id_trans_rodzaj integer references trans_rodzaj(id) not null,
waga integer, --- not null,
pokaz boolean
);

create table wypos_nier_strona (
id serial primary key,
id_nier_rodzaj integer references nier_rodzaj (id) not null,
id_wyposazenie_nier integer references wyposazenie_nier(id) not null,
id_trans_rodzaj integer references trans_rodzaj(id) not null
);

create table lista_param_pom (
id serial primary key,
id_pomieszczenie integer references pomieszczenie (id) not null,
id_parametr_pom integer references parametr_pom(id) not null);

create table lista_param_slow_pom ( ---lista parametrow slownikowych nieruchomosci dla danego rodzaju nieruchomosci
id serial primary key,
id_pomieszczenie integer references pomieszczenie (id) not null,
id_wyposazenie_pom integer references wyposazenie_pom(id) not null
);

create table transakcja_nier (
id serial primary key,
id_trans_rodzaj integer references trans_rodzaj(id) not null,
id_nier_rodzaj integer references nier_rodzaj(id) not null,
typ_of_otodom text
);

create table pomieszczenie_nier (
id serial primary key,
id_nier_rodzaj integer references nier_rodzaj(id) not null,
id_pomieszczenie integer references pomieszczenie(id) not null
);

---create table pokaz_parametr (
---id serial primary key,
---id_transakcja integer references trans_rodzaj(id),
---is_dict_table boolean not null,
---id_parametr integer not null ---references parametr_nier, wyposazenie_nier
----nie mozna zrobic referencji na 2 tabele jednoczesnie
---);

---tabele z danymi

create table kurs (
id integer references waluta(id) unique not null,
wartosc varchar(10) not null
);

create table agent (
id serial primary key,
id_otodom integer,
nazwa text not null,
nazwa_pot text,
firma text,
login varchar(40) not null unique,
haslo varchar(40) not null,
waznosc_haslo date not null,
aktywnosc_konto boolean,
telefon varchar(13),
komorka varchar(13),
fax varchar(13),
email varchar(40) not null,
wewnetrzny varchar(4),
licencja integer,
nadzor integer references agent(id),
nip varchar(13), ---mogloby byc unique, ale wtedy tez not null
adres text,
dodawanie boolean,
edycja boolean,
kasowanie boolean,
druk boolean,
adm_klient boolean,
adm_dane boolean,
zmiana_upr boolean);

create table klient ( ---umowiony oczekujacy moze cos jeszcze inny zestaw statusow
id serial primary key,
id_old integer,
is_oferent_old boolean default false,
id_osobowosc integer references osobowosc(id) not null,
id_agent integer references agent(id) not null);

create table ustalenia (
id serial primary key,
id_klient integer references klient(id) not null,
id_agent integer references agent(id) not null,
data timestamp,
tresc text
);

create table biuro_nier_kon (
id serial primary key,
id_region_geog integer references region_geog(id) not null,
email varchar(50) not null,
nazwa varchar(30) not null,
adres varchar(100));

---pytanie czy tego klienta zawsze na pewnoi pojmujemy jako osobe prawna czy moze nie
create table biuro_nier_wspolpraca (
id_klient integer references klient(id) not null unique,
id_biuro_nier_kon integer references biuro_nier_kon(id) not null unique);
--- ewentualnie dodatkowa tabela 1 do wielu z ewentualnymi loginami i opcja samodzielnego uwierzytelnienia i dodania

create table osoba (
id serial primary key,
id_old integer,
id_imie integer references imie(id) not null,
nazwisko varchar(30) not null,
nazwisko_rodowe varchar(30),--- not null,
pesel varchar(15),
id_agent integer references agent(id));---not null

create table osoba_dowod (
id serial primary key,
id_osoba integer references osoba(id) not null,
id_rodzaj_dowod_tozsamosc integer references rodzaj_dowod_tozsamosc(id) not null,
nazwa text not null);

create table osoba_adres (
id integer references osoba(id) not null unique,
kod_pocztowy varchar(6),--- not null,
id_region_geog integer references region_geog(id),--- not null,
ulica varchar(40) not null,
numer_dom varchar(10),
numer_miesz varchar(10));

create table osoba_klient (
id serial primary key,
id_klient integer references klient(id) not null,
id_osoba integer references osoba(id) not null
);

create table dane_firma (
id_klient integer references klient(id) primary key,
nazwa varchar(100) not null,
nip varchar(13) not null,
regon varchar(14),
krs varchar(15),
kod_pocztowy varchar(6),--- not null,
id_region_geog integer references region_geog(id),--- not null,
ulica varchar(40) not null,
numer_dom varchar(10),
numer_miesz varchar(10));

create table telefon (
id serial primary key,
id_osoba integer references osoba(id),
nazwa varchar(13) not null,
opis text
);

create table komorka (
id_osoba integer references osoba(id) unique,
nazwa varchar(9) not null,
opis text
);

create table email_osoba (
id serial primary key,
id_osoba integer references osoba(id),
nazwa varchar(50) not null,
opis text
);

---komorka pod sms

create table osoba_kon_bank (
id serial primary key,
id_imie integer references imie(id) not null,
nazwisko varchar(30) not null,
id_bank integer references bank(id) not null
);

create table telefon_os_bank (
id serial primary key,
id_osoba_kon_bank integer references osoba_kon_bank(id) not null,
nazwa varchar(9) not null
);

create table nieruchomosc (
id serial primary key,
id_old integer,
id_nier_rodzaj integer references nier_rodzaj(id) not null,
id_rodz_nier_szcz integer references rodz_nier_szczeg(id), --- not null,
id_klient integer references klient(id) not null,
id_region_geog integer references region_geog(id),-- not null, -- zmienic to zaraz spowrotem
ulica_net text,
ulica text,
kod varchar(6),
id_agent integer references agent(id) not null,
data date not null,
rynek_pierw boolean,
klucz boolean default false
);

create table zdjecie (
id serial primary key,
id_nieruchomosc integer references nieruchomosc(id) not null,
nazwa varchar(40) not null,
nazwa_old text
);

create table film (
id serial primary key,
id_nieruchomosc integer references nieruchomosc(id) not null,
nazwa varchar(30) not null
);

create table oferta (
id serial primary key,
id_old integer,
id_rodz_trans integer references trans_rodzaj(id) not null,
id_nieruchomosc integer references nieruchomosc(id) not null,
id_status integer references status(id),
data date not null,
data_otw_zlecenie date not null,
data_zam_zlecenie date,
cena varchar(15) not null,
prowizja_proc boolean, ---czy prowizja procentowo czy kwotowo
prowizja varchar(7),
wylacznosc boolean,
pokaz boolean,
czas_przekazania integer, --- not null,
przek_od_otwarcia boolean default false,
id_priorytet_reklama integer references priorytet_reklama(id) ---not null z czasem by sie przydal
---tu ewentualnie rodzaj klienta jesli to konieczne, ale rodzaj klienta wynika
---z tego, ze jest przypisany jako wlasciciel nieruchomosci
);

create table opis (
id serial primary key,
id_oferta integer references oferta(id) not null, --- a moze oferta ?
id_jezyk integer references jezyk(id) not null,
wartosc text not null
);

create table opis_nieruchomosc (
id serial primary key,
id_nieruchomosc integer references nieruchomosc(id) not null,
id_agent integer references agent(id) not null,
data timestamp,
tresc text
);

create table cena (
id serial primary key,
id_oferta integer references oferta(id) not null,
id_osoba integer references osoba(id) not null,
id_agent integer references agent(id) not null,
cena varchar(15) not null, ---rozwazyc przepisanie najaktualniejszej ceny
---do tabeli oferta trigerem
data timestamp not null,
podpis boolean
);

create table dane_txt_nier (
id serial primary key,
id_nieruchomosc integer references nieruchomosc(id) not null,
id_parametr_nier integer references parametr_nier(id) not null,
wartosc varchar(100)
);

create table dane_slow_wyp_nier (  ---ze standardowego slownika wyposazen
id serial primary key,
id_nieruchomosc integer references nieruchomosc(id) not null,
id_wyposazenie_nier integer references wyposazenie_nier(id) not null
);

create table pomieszczenie_przyn_nier (
id serial primary key,
id_nieruchomosc integer references nieruchomosc(id) not null,
id_pomieszczenie integer references pomieszczenie(id) not null,
nr_pomieszczenia integer not null
);

create table dane_txt_pom (
id serial primary key,
id_pomieszczenie_przyn_nier integer references pomieszczenie_przyn_nier(id) not null,
id_parametr_pom integer references parametr_pom(id) not null,---[] not null, ---references lista_param_pom(id) not null,
wartosc varchar(100)---[]
);

create table dane_slow_wyp_pom (  ---ze standardowego slownika wyposazen
id serial primary key,
id_pomieszczenie_przyn_nier integer references pomieszczenie_przyn_nier(id) not null,
id_wyposazenie_pom integer references wyposazenie_pom(id) not null ---[] not null,---references lista_param_slow_pom(id) not null,
);

create table zapotrzebowanie (
id serial primary key,
---id_old integer,
id_klient integer references klient(id) not null,
---id_trans_rodzaj integer references trans_rodzaj(id) not null,
---id_nier_rodzaj integer references nier_rodzaj(id) not null,
data date not null,
data_otw_zlecenie date not null,
data_zam_zlecenie date,
---id_status integer references status(id) not null,
---cena varchar(30) not null, ---wieksze pole ze wzgledu na mozliwosc podania od do ??
---prowizja_proc boolean, ---czy prowizja procentowo czy kwotowo
---prowizja varchar(7),
id_agent integer references agent(id) not null
---pokaz boolean
);

create table prowizja_zapotrzebowanie (
id serial primary key,
id_zapotrzebowanie integer references zapotrzebowanie(id) not null,
id_trans_rodzaj integer references trans_rodzaj(id) not null,
prowizja_proc boolean, ---czy prowizja procentowo czy kwotowo
prowizja varchar(7) not null,
id_sposob_finansowania integer references sposob_finansowania(id),--- not null,
poszukiwane_dla text);

create table zapotrzebowanie_nier_rodzaj (
id serial primary key,
id_nier_rodzaj integer references nier_rodzaj(id) not null,
id_zapotrzebowanie integer references zapotrzebowanie(id) not null);

create table zapotrzebowanie_trans_rodzaj (
id serial primary key,
id_zapotrzebowanie_nier_rodzaj integer references zapotrzebowanie_nier_rodzaj(id) not null,
id_status integer references status(id) not null,
id_trans_rodzaj integer references trans_rodzaj (id) not null,
cena varchar(15),
pokaz boolean);

---regiony + nieruchomosc szczegoly

create table zamiana (
id serial primary key,
id_oferta integer references oferta(id) not null,
id_zapotrzebowanie integer references zapotrzebowanie(id) not null);

create table opis_wew_zapotrzebowanie ( ---opis poszczegolnych proponowanych ofert, ale byc moze nie tylko
id serial primary key,
id_zapotrzebowanie integer references zapotrzebowanie(id) not null,
id_oferta integer references oferta(id), ---null jak najbardziej dopuszczalny
zainteresowany boolean default false,
cena varchar(15),
id_agent integer references agent(id) not null,
data timestamp,
tresc text
);

create table opis_zapotrzebowanie (
id serial primary key,
id_zapotrzebowanie_trans_rodzaj integer references zapotrzebowanie_trans_rodzaj(id) not null,
id_jezyk integer references jezyk(id) not null,
wartosc text not null);

create table opis_posz_zapotrzebowanie (
id serial primary key,
id_zapotrzebowanie_trans_rodzaj integer references zapotrzebowanie_trans_rodzaj(id) not null,
id_agent integer references agent(id) not null default 1,
data timestamp not null default date_trunc('second', current_timestamp::timestamp),
wartosc text not null);

create table osoba_oferta (
id serial primary key,
id_oferta integer references oferta(id) not null,
id_osoba integer references osoba(id) not null);

create table osoba_zapotrzebowanie (
id serial primary key,
id_zapotrzebowanie integer references zapotrzebowanie(id) not null,
id_osoba integer references osoba(id) not null);

create table zap_szcz_nier (
id serial primary key,
id_zapotrzebowanie_trans_rodzaj integer references zapotrzebowanie_trans_rodzaj(id) not null,
id_rodz_nier_szcz integer references rodz_nier_szczeg(id) not null);

create table zap_lokaliz_nier ( ---mozna zdefiniowac kilka roznych lokalizacji np 3 gminy i jeszcze powiat itd
id serial primary key,
id_zapotrzebowanie_trans_rodzaj integer references zapotrzebowanie_trans_rodzaj(id) not null,
id_region_geog integer references region_geog(id) not null);

create table dane_txt_zap_min (
id serial primary key,
id_zapotrzebowanie_trans_rodzaj integer references zapotrzebowanie_trans_rodzaj(id) not null,
id_parametr_nier integer references parametr_nier(id) not null,
wartosc varchar(100));

create table dane_txt_zap_max (
id serial primary key,
id_zapotrzebowanie_trans_rodzaj integer references zapotrzebowanie_trans_rodzaj(id) not null,
id_parametr_nier integer references parametr_nier(id) not null,
wartosc varchar(100));

create table dane_slow_wyp_zap (  ---ze standardowego slownika wyposazen
id serial primary key,
id_zapotrzebowanie_trans_rodzaj integer references zapotrzebowanie_trans_rodzaj(id) not null,
id_wyposazenie_nier integer references wyposazenie_nier(id) not null
);

create table godzina (
id serial primary key,
nazwa varchar(2) not null);

create table minuta (
id serial primary key,
nazwa varchar(2) not null);

create table spotkanie ( ---umowienie sie z ludzmi
id serial primary key,
id_oferta integer references oferta(id) not null,
id_zapotrzebowanie integer references zapotrzebowanie(id) not null,
id_klient integer references klient(id), ---kupujacy lub sprzedajacy, reguluje to bool ponizej
klient_oferujacy boolean not null default false,
id_umowienie integer references umowienie(id) not null,
spotkanie_data date not null,
spotkanie_godzina integer references godzina(id) not null,
spotkanie_minuta integer references minuta(id) not null,
id_agent integer references agent(id) not null,
komentarz text
);

create table spotkanie_os (
id serial primary key,
id_spotkanie integer references spotkanie(id) not null,
---id_klient integer references klient(id) not null,
id_osoba integer references osoba(id) not null --osoby koniecznie sposrod wskazanego klienta
);

---przygotowac tabele osob postronnych bioracych udzial w spotkaniu - to juz chyba jest rozwiazane
create table lista_wsk_adr (
id serial primary key,
id_oferta integer references oferta(id) not null,---cena i adres wynika z oferty
id_zapotrzebowanie integer references zapotrzebowanie(id) not null,
id_klient integer references klient(id) not null,
id_agent integer references agent(id) not null,
data timestamp not null, ---data wprowadzenia rekordu do systemu
ogladanie_data date not null,
ogladanie_godzina integer references godzina(id) not null,
ogladanie_minuta integer references minuta(id) not null);

create table osoba_lista_wsk_adr (
id serial primary key,
id_lista_wsk_adr integer references lista_wsk_adr(id) not null,
id_osoba integer references osoba(id) not null);

create table rekord_nieakt_lista_wsk_adr (
id integer not null unique references lista_wsk_adr(id),
id_agent integer references agent(id) not null,
data timestamp);

create table transakcja (
id serial primary key,
id_wlasciciel integer references klient(id) not null,
id_nabywca integer references klient(id) not null,
---id_agent_n integer references agent(id) not null, ---agent nabywcy
id_oferta integer references oferta(id) not null,
id_nieruchomosc integer references nieruchomosc(id) not null,
---agent wlasciciela wynika z nieruchomosci
id_lista_wsk_adr integer references lista_wsk_adr(id) not null,
---agent klienta wynika z listy wskazan adr
data_umowa_przed date not null,
data_umowa_notar date,
termin_notar date,
zdanie_nier date,
zadatek_w varchar(7),
zadatek_n varchar(7),
prowizja_w varchar(5),
prowizja_n varchar(5),
kredyt boolean,
finalizacja boolean,
cena varchar(15));
---tabela wlascicieli lub wlasciciela nieruchomosci
create table wlasciciel ( ---chodzi o to zeby przy transakcji nie upominac sie o wszystkie osoby ktore byly kontaktowe,
id serial primary key,
---id_transakcja integer references transakcja(id) not null,
id_nieruchomosc integer references nieruchomosc(id) not null,
id_osoba integer references osoba(id) not null,
procent_udzial float);
---alter table wlasciciel alter column procent_udzial type float;

create table kredytowanie (
id serial primary key,
id_transakcja integer references transakcja(id) not null, ---a jest mozliwe ze koles dostaje na ta hate 2 kredyty nie 1 ??
id_bank integer references bank(id) not null,
kwota varchar(15) not null
);

create table kalendarz (
id serial primary key,
--id_agent integer references agent(id),
data date not null,
id_godzina integer references godzina(id) not null,
id_minuta integer references minuta(id) not null,
id_spotkanie integer references spotkanie(id),
komentarz text);

create table agent_kalendarz (
id serial primary key,
id_kalendarz integer references kalendarz(id) not null,
id_agent integer references agent(id));

create table media_nieruchomosc (
id serial primary key,
id_nier_rodzaj integer references nier_rodzaj(id) not null,
id_trans_rodzaj integer references trans_rodzaj(id) not null,
id_region_geog integer references region_geog(id),--- not null,
id_status integer references status(id) not null,
id_agent integer references agent(id) not null,
data date not null,
ulica text,
oferent boolean,
powierzchnia varchar(10),
cena varchar(15),
opis text,
przypomnienie date,
id_media_reklama integer references media_reklama(id) not null,
id_osoba integer references osoba(id),
id_of_zap integer ---references zapotrzebowanie i oferta - masakra troche :P, trzeba przyblokowac zmiany jak jest not null
);

create table kon_m_nieruchomosc (
id serial primary key,
id_media_nieruchomosc integer references media_nieruchomosc(id) not null,
id_agent integer references agent(id) not null,
komentarz text not null,
data timestamp not null
);

create table reklama_nieruchomosc_m ( ---reklamowanie nieruchomosci w mediach - ewidencja
id serial primary key,
id_media_nieruchomosc integer references media_nieruchomosc(id) not null,
id_media_reklama integer references media_reklama(id) not null,
data date not null
);

create table telefon_media_nieruchomosc (
id serial primary key,
id_media_nieruchomosc integer references media_nieruchomosc(id) not null,
nazwa varchar(13) not null,
opis varchar(100)
);

create table email_media_nieruchomosc (
id serial primary key,
id_media_nieruchomosc integer references media_nieruchomosc(id) not null,
nazwa varchar(50) not null,
opis varchar(50)
);

create table kategoria_allegro (
id serial primary key,
id_nier_rodzaj integer references nier_rodzaj(id),
id_trans_rodzaj integer references trans_rodzaj(id),
id_powiat integer references region_geog(id),
kategoria_allegro integer not null);

create table portal (
id serial primary key,
nazwa varchar(20) not null);

create table portal_wys (
id serial primary key,
id_oferta integer references oferta(id) not null,
id_portal integer references portal(id) not null,
--id_rodzaj_nier integer references rodzaj_nieruchomosci (id) not null,
portal_ins_id integer,
data_wys date not null,
data_wyg date not null,
is_active boolean);

create table precyzja_kojarzenie (
id serial primary key,
nazwa text not null unique,
baza text not null,
krok text not null);

create table subskrypcja (
id serial primary key,
id_nier_rodzaj integer references nier_rodzaj(id) not null,
id_trans_rodzaj integer references trans_rodzaj(id) not null,
id_jezyk integer references jezyk(id) not null default 1,
cena_min float,
cena_max float,
email text,
data date);

create table status_dzwonienie (
id serial primary key,
nazwa text not null);

create table rozmowa_przychodzaca (
id serial primary key,
nr_telefon text not null, --telefon z centralki
id_status_dzwonienie integer references status_dzwonienie(id) not null,
id_agent integer references agent(id) not null, ---agent, u ktorego zadzwonilo
polaczenie_zakonczone boolean default false, ---informacja, czy polaczenie zostalo zakonczone: w 1 fazie elefon dzwoni, do bazy idzie info ze telefon ma miejsce, kolejno ten telefon jest odebrany
---wiec do bazy idzie status odebrany, czyli ze rozmowa jest w toku. po zakonczeniu do bazy idzieinformacja, ze polaczenie zostalo zakonczone, wiec ten sam rekord jest modyfikowany:
---wchodzi data zakonczenia, bool polaczenie zakonczone jest zmieniony na true (juz nigdy rekord nie powinien byc modyfikowany).
czas_poczatek timestamp,
czas_koniec timestamp);

create table konto_agent (
id serial primary key,
id_agent integer references agent(id) not null,
id_bank integer references bank(id) not null,
nr_konto varchar(26) not null);


---INSERTS

insert into precyzja_kojarzenie (nazwa, baza, krok) values ('cena', '10', '5');
insert into precyzja_kojarzenie (nazwa, baza, krok) values ('param_pow', '10', '5'); ---?? pomyslec ile tu dac :P :)
insert into precyzja_kojarzenie (nazwa, baza, krok) values ('param_licz', '1', '1');

---waluty - to sie gdzies wczesniej juz robi ... ?????????????????
insert into waluta (nazwa, skrot) values ('Z³oty', 'PLN');
insert into waluta (nazwa, skrot) values ('Euro', '&#8364;');
insert into waluta (nazwa, skrot) values ('Funt', 'funt');
---jezyki
---???
insert into jezyk (nazwa, id_waluta) values ('Polski', (select id from waluta where nazwa = 'Z³oty'));
insert into jezyk (nazwa, id_waluta) values ('English', (select id from waluta where nazwa = 'Funt'));
insert into jezyk (nazwa, id_waluta) values ('Deutsch', (select id from waluta where nazwa = 'Euro'));

---walidacje, text wskazujacy jak walidowac dane komorki
insert into walidacja (nazwa) values ('text');
insert into walidacja (nazwa) values ('float');
insert into walidacja (nazwa) values ('int');
insert into walidacja (nazwa) values ('data');

insert into rodzaj_dowod_tozsamosc (nazwa) values ('_dowod_osobisty');
insert into rodzaj_dowod_tozsamosc (nazwa) values ('_prawo_jazdy');
insert into rodzaj_dowod_tozsamosc (nazwa) values ('_paszport');

---tagi jezykowe

insert into lang_tag (nazwa) values ('_osobafizyczna');
insert into lang_tag (nazwa) values ('_osobaprawna');

insert into lang_tag (nazwa) values ('_sekcjapodstawowa');
insert into lang_tag (nazwa) values ('_sekcjadodatkowa');
insert into lang_tag (nazwa) values ('_mozliwosczabudowy');
insert into lang_tag (nazwa) values ('_informacjetechniczne');
insert into lang_tag (nazwa) values ('_media');
insert into lang_tag (nazwa) values ('_zabezpieczenia');
insert into lang_tag (nazwa) values ('_udogodnienia');
insert into lang_tag (nazwa) values ('_otoczenie');
insert into lang_tag (nazwa) values ('_okolica');
insert into lang_tag (nazwa) values ('_usytuowanie');

insert into lang_tag (nazwa) values ('_pokoj');
insert into lang_tag (nazwa) values ('_kuchnia');
insert into lang_tag (nazwa) values ('_lazienka');
insert into lang_tag (nazwa) values ('_przedpokoj');
insert into lang_tag (nazwa) values ('_toaleta');
insert into lang_tag (nazwa) values ('_pomieszczeniebiurowe');
insert into lang_tag (nazwa) values ('_pomieszczeniesocjalne');
insert into lang_tag (nazwa) values ('_pomieszczeniegospodarcze');
insert into lang_tag (nazwa) values ('_stajnia');
insert into lang_tag (nazwa) values ('_stodola');
insert into lang_tag (nazwa) values ('_kurnik');
insert into lang_tag (nazwa) values ('_owczarnia');
insert into lang_tag (nazwa) values ('_obora');
insert into lang_tag (nazwa) values ('_chlewnia');
insert into lang_tag (nazwa) values ('_warsztat');
insert into lang_tag (nazwa) values ('_garaz');

insert into lang_tag (nazwa) values ('_aktualna');
insert into lang_tag (nazwa) values ('_nieaktualna');
insert into lang_tag (nazwa) values ('_zawieszona');
insert into lang_tag (nazwa) values ('_umowiona');

insert into lang_tag (nazwa) values ('_polska');

insert into lang_tag (nazwa) values ('_dowod_osobisty');
insert into lang_tag (nazwa) values ('_prawo_jazdy');
insert into lang_tag (nazwa) values ('_paszport');

---statusy
insert into status (nazwa) values ('_aktualna');
insert into status (nazwa) values ('_nieaktualna');
insert into status (nazwa) values ('_zawieszona');
insert into status (nazwa) values ('_umowiona');

---kraje
---ewentualnie jesli w istocie byloby tagowane
---insert into region_geog (nazwa, id_otodom) values ('_polska', 1);

insert into tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values ('_osobafizyczna', (select id from jezyk where nazwa = 'Polski'), 'Osoba fizyczna');
insert into tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values ('_osobaprawna', (select id from jezyk where nazwa = 'Polski'), 'Osoba prawna');

insert into tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values ('_sekcjapodstawowa', (select id from jezyk where nazwa = 'Polski'), 'Informacje podstawowe');
insert into tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values ('_sekcjadodatkowa', (select id from jezyk where nazwa = 'Polski'), 'Informacje dodatkowe');
insert into tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values ('_mozliwosczabudowy', (select id from jezyk where nazwa = 'Polski'), 'Mo¿liwo¶æ zabudowy');
insert into tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values ('_informacjetechniczne', (select id from jezyk where nazwa = 'Polski'), 'Informacje techniczne');
insert into tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values ('_media', (select id from jezyk where nazwa = 'Polski'), 'Media');
insert into tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values ('_zabezpieczenia', (select id from jezyk where nazwa = 'Polski'), 'Zabezpieczenia');
insert into tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values ('_udogodnienia', (select id from jezyk where nazwa = 'Polski'), 'Udogodnienia');
insert into tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values ('_otoczenie', (select id from jezyk where nazwa = 'Polski'), 'Otoczenie');
insert into tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values ('_okolica', (select id from jezyk where nazwa = 'Polski'), 'Okolica');
insert into tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values ('_usytuowanie', (select id from jezyk where nazwa = 'Polski'), 'Usytuowanie');

insert into tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values ('_pokoj', (select id from jezyk where nazwa = 'Polski'), 'Pokój');
insert into tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values ('_kuchnia', (select id from jezyk where nazwa = 'Polski'), 'Kuchnia');
insert into tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values ('_lazienka', (select id from jezyk where nazwa = 'Polski'), '£azienka');
insert into tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values ('_przedpokoj', (select id from jezyk where nazwa = 'Polski'), 'Przedpokój');
insert into tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values ('_toaleta', (select id from jezyk where nazwa = 'Polski'), 'Toaleta');
insert into tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values ('_pomieszczeniebiurowe', (select id from jezyk where nazwa = 'Polski'), 'Pomieszczenie biurowe');
insert into tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values ('_pomieszczeniesocjalne', (select id from jezyk where nazwa = 'Polski'), 'Pomieszczenie socjalne');
insert into tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values ('_pomieszczeniegospodarcze', (select id from jezyk where nazwa = 'Polski'), 'Pomieszczenie gospodarcze');
insert into tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values ('_stajnia', (select id from jezyk where nazwa = 'Polski'), 'Stajnia');
insert into tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values ('_stodola', (select id from jezyk where nazwa = 'Polski'), 'Stodo³a');
insert into tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values ('_kurnik', (select id from jezyk where nazwa = 'Polski'), 'Kurnik');
insert into tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values ('_owczarnia', (select id from jezyk where nazwa = 'Polski'), 'Owczarnia');
insert into tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values ('_obora', (select id from jezyk where nazwa = 'Polski'), 'Obora');
insert into tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values ('_chlewnia', (select id from jezyk where nazwa = 'Polski'), 'Chlewnia');
insert into tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values ('_warsztat', (select id from jezyk where nazwa = 'Polski'), 'Warsztat');
insert into tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values ('_garaz', (select id from jezyk where nazwa = 'Polski'), 'Gara¿');
---sprawdzic czy dodanie nie komplikuje sytuacji - to nie dziala, bo nie ma tagow
--insert into tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values ('_balkon', (select id from jezyk where nazwa = 'Polski'), 'Balkon');
--insert into tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values ('_taras', (select id from jezyk where nazwa = 'Polski'), 'Taras');

insert into tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values ('_aktualna', (select id from jezyk where nazwa = 'Polski'), 'Aktualna');
insert into tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values ('_nieaktualna', (select id from jezyk where nazwa = 'Polski'), 'Nieaktualna');
insert into tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values ('_zawieszona', (select id from jezyk where nazwa = 'Polski'), 'Zawieszona');
insert into tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values ('_umowiona', (select id from jezyk where nazwa = 'Polski'), 'Umówiona');

insert into tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values ('_polska', (select id from jezyk where nazwa = 'Polski'), 'Polska');



insert into tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values ('_osobafizyczna', (select id from jezyk where nazwa = 'English'), 'Natural person');
insert into tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values ('_osobaprawna', (select id from jezyk where nazwa = 'English'), 'Corporate body');

insert into tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values ('_sekcjapodstawowa', (select id from jezyk where nazwa = 'English'), 'Primary information');
insert into tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values ('_sekcjadodatkowa', (select id from jezyk where nazwa = 'English'), 'Additional information');
insert into tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values ('_mozliwosczabudowy', (select id from jezyk where nazwa = 'English'), 'Possibility of buildings');
insert into tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values ('_informacjetechniczne', (select id from jezyk where nazwa = 'English'), 'Technical information');
insert into tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values ('_media', (select id from jezyk where nazwa = 'English'), 'Media');
insert into tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values ('_zabezpieczenia', (select id from jezyk where nazwa = 'English'), 'Protection');
insert into tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values ('_udogodnienia', (select id from jezyk where nazwa = 'English'), 'Convenience');
insert into tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values ('_otoczenie', (select id from jezyk where nazwa = 'English'), 'Surroundings');
insert into tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values ('_okolica', (select id from jezyk where nazwa = 'English'), 'Neighbourhood');
insert into tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values ('_usytuowanie', (select id from jezyk where nazwa = 'English'), 'Location');

insert into tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values ('_pokoj', (select id from jezyk where nazwa = 'English'), 'Room');
insert into tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values ('_kuchnia', (select id from jezyk where nazwa = 'English'), 'Kitchen');
insert into tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values ('_lazienka', (select id from jezyk where nazwa = 'English'), 'Bathroom');
insert into tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values ('_przedpokoj', (select id from jezyk where nazwa = 'English'), 'Hall');
insert into tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values ('_toaleta', (select id from jezyk where nazwa = 'English'), 'Toilet');
insert into tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values ('_pomieszczeniebiurowe', (select id from jezyk where nazwa = 'English'), 'Office room');
insert into tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values ('_pomieszczeniesocjalne', (select id from jezyk where nazwa = 'English'), 'Social room');
insert into tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values ('_pomieszczeniegospodarcze', (select id from jezyk where nazwa = 'English'), 'Economic room');
insert into tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values ('_stajnia', (select id from jezyk where nazwa = 'English'), 'Stable');
insert into tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values ('_stodola', (select id from jezyk where nazwa = 'English'), 'Barn');
insert into tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values ('_kurnik', (select id from jezyk where nazwa = 'English'), 'Shed');
insert into tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values ('_owczarnia', (select id from jezyk where nazwa = 'English'), 'Sheep-fold');
insert into tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values ('_obora', (select id from jezyk where nazwa = 'English'), 'Cowshed');
insert into tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values ('_chlewnia', (select id from jezyk where nazwa = 'English'), 'Piggery');
insert into tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values ('_warsztat', (select id from jezyk where nazwa = 'English'), 'Workshop');
insert into tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values ('_garaz', (select id from jezyk where nazwa = 'English'), 'Garage');

insert into tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values ('_aktualna', (select id from jezyk where nazwa = 'English'), 'Actual');
insert into tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values ('_zawieszona', (select id from jezyk where nazwa = 'English'), 'Suspended');

insert into tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values ('_polska', (select id from jezyk where nazwa = 'English'), 'Poland');

insert into tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values ('_stajnia', (select id from jezyk where nazwa = 'Deutsch'), 'Stall');


insert into nier_rodzaj (nazwa) values ('_dom');
insert into nier_rodzaj (nazwa) values ('_mieszkanie');
insert into nier_rodzaj (nazwa) values ('_obiekt');
insert into nier_rodzaj (nazwa) values ('_lokal');
insert into nier_rodzaj (nazwa) values ('_teren');
insert into nier_rodzaj (nazwa) values ('_dzialka');


insert into trans_rodzaj (nazwa, nazwa_zap) values ('_sprzedaz', '_kupno');
insert into trans_rodzaj (nazwa, nazwa_zap) values ('_wynajem', '_najem');
insert into trans_rodzaj (nazwa, nazwa_zap) values ('_zamiana', '_zamiana');
---insert into trans_rodzaj (nazwa, nazwa_zap) values ('_dzierzawa', '_dzierzawa');

---sekcje
insert into sekcja (nazwa) values ('_sekcjapodstawowa');
insert into sekcja (nazwa) values ('_sekcjadodatkowa');
insert into sekcja (nazwa) values ('_mozliwosczabudowy');
insert into sekcja (nazwa) values ('_informacjetechniczne');
insert into sekcja (nazwa) values ('_media');
insert into sekcja (nazwa) values ('_zabezpieczenia');
insert into sekcja (nazwa) values ('_udogodnienia');
insert into sekcja (nazwa) values ('_otoczenie');
insert into sekcja (nazwa) values ('_okolica');
insert into sekcja (nazwa) values ('_usytuowanie');


insert into osobowosc (nazwa) values ('_osobafizyczna');
insert into osobowosc (nazwa) values ('_osobaprawna');

insert into status_dzwonienie (nazwa) values ('_nieodebrana');
insert into status_dzwonienie (nazwa) values ('_odebrana');
insert into status_dzwonienie (nazwa) values ('_zakonczona');

---insert into wyposazenie_nier (id_sekcja, nazwa) values ((select id from sekcja where nazwa = '_sekcjapodstawowa'), '_okazja');
---insert into wyposazenie_nier (id_sekcja, nazwa) values ((select id from sekcja where nazwa = '_sekcjapodstawowa'), '_ksiegawieczysta');
---insert into wyposazenie_nier (id_sekcja, nazwa) values ((select id from sekcja where nazwa = '_sekcjapodstawowa'), '_stanprawnynieruchomosci');
---insert into wyposazenie_nier (id_sekcja, nazwa) values ((select id from sekcja where nazwa = '_sekcjapodstawowa'), '_stanprawnydzialki');
---insert into wyposazenie_nier (id_sekcja, nazwa) values ((select id from sekcja where nazwa = '_sekcjapodstawowa'), '_standard');
---insert into wyposazenie_nier (id_sekcja, nazwa) values ((select id from sekcja where nazwa = '_sekcjapodstawowa'), '_stan');
---insert into wyposazenie_nier (id_sekcja, nazwa) values ((select id from sekcja where nazwa = '_sekcjapodstawowa'), '_mozliwoscprzeksztalcenia');

---podsekcje popisac do tego powyzej
---LANGUAGE

insert into godzina (nazwa) values ('06');
insert into godzina (nazwa) values ('07');
insert into godzina (nazwa) values ('08');
insert into godzina (nazwa) values ('09');
insert into godzina (nazwa) values ('10');
insert into godzina (nazwa) values ('11');
insert into godzina (nazwa) values ('12');
insert into godzina (nazwa) values ('13');
insert into godzina (nazwa) values ('14');
insert into godzina (nazwa) values ('15');
insert into godzina (nazwa) values ('16');
insert into godzina (nazwa) values ('17');
insert into godzina (nazwa) values ('18');
insert into godzina (nazwa) values ('19');
insert into godzina (nazwa) values ('20');
insert into godzina (nazwa) values ('21');
insert into godzina (nazwa) values ('22');
insert into godzina (nazwa) values ('23');

---update godzina set nazwa = '06' where nazwa = '6';
---update godzina set nazwa = '07' where nazwa = '7';
---update godzina set nazwa = '08' where nazwa = '8';
---update godzina set nazwa = '09' where nazwa = '9';

insert into minuta (nazwa) values ('00');
insert into minuta (nazwa) values ('05');
insert into minuta (nazwa) values ('10');
insert into minuta (nazwa) values ('15');
insert into minuta (nazwa) values ('20');
insert into minuta (nazwa) values ('25');
insert into minuta (nazwa) values ('30');
insert into minuta (nazwa) values ('35');
insert into minuta (nazwa) values ('40');
insert into minuta (nazwa) values ('45');
insert into minuta (nazwa) values ('50');
insert into minuta (nazwa) values ('55');

insert into umowienie (nazwa) values ('_ogladanie');
insert into umowienie (nazwa) values ('_umowa_przedwstepna');

insert into sposob_finansowania (nazwa) values ('_kredyt');
insert into sposob_finansowania (nazwa) values ('_gotowka');
insert into sposob_finansowania (nazwa) values ('_kredyt___gotowka');

insert into priorytet_reklama (nazwa) values ('_niski');
insert into priorytet_reklama (nazwa) values ('_sredni');
insert into priorytet_reklama (nazwa) values ('_wysoki');

insert into bank (nazwa) values ('MultiBank BRE Bank S.A.');

--insert into media_reklama (nazwa) values ('_portal_internetowy');
--insert into media_reklama (nazwa) values ('_telefon');
--insert into media_reklama (nazwa) values ('_gazeta');
--insert into media_reklama (nazwa) values ('_ogloszenia');


--insert into media_reklama (nazwa) values ('_email');
---insert into media_reklama (nazwa) values ('_witryna');