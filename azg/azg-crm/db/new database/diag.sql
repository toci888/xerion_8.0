---w wyposazeniach i parametrach na nazwy warto chyba zasadzic unique
---SET client_encoding TO LATIN2;

drop table precyzja_kojarzenie;
drop table portal_wys;
drop table portal;
drop table kategoria_allegro;
drop table email_media_nieruchomosc;
drop table telefon_media_nieruchomosc;
drop table reklama_nieruchomosc_m;
drop table kon_m_nieruchomosc;
drop table media_nieruchomosc;
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
drop table dane_txt_zap_min; ---dane varchar(100)owe dla parametrow nieruchomosci przy zapotrzebowaniu
drop table zap_lokaliz_nier; ---gdzie chop szuka nieruchomosci
drop table zap_szcz_nier; ---jaki typ domu/mieszkania
drop table osoba_zapotrzebowanie;
drop table osoba_oferta;
drop table opis_wew_zapotrzebowanie;
drop table opis_zapotrzebowanie;
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
drop table status; ---statusy transakcji, takze ofert ?? - wrzucenie oferty na transakcje zawiesza nieruchomosc (moze byc trigger)
---pytanie czy sa 2 rozne zestawienia statusow ?? czy status idzie do nieruchomosci wylacznie ?? (ewentualnie oferty, ale)
---bez sensu zeby wynajem domu zawisic a kupno nie jak to ten sam dom
-----drop table umowa; ---umowy zawierane pomiedzy stronami - rodzaje
drop table walidacja;
drop table lang_tag; ---zestaw tagow slow ktore w cms maja znaqczenie wielojezykowe
drop table jezyk; ---slownik jezykow obcych obslugiwanych na stronie
drop table waluta;

---drop end, create begining : slowniki

create table waluta (
id integer primary key,
nazwa varchar(20) not null,
skrot varchar(10) not null
);

create table jezyk (
id integer primary key,
nazwa varchar(20) not null unique,
id_waluta integer references waluta(id) not null
);

create table lang_tag (
id integer primary key,
nazwa varchar(100) not null unique
);

create table walidacja (
id integer primary key,
nazwa varchar(20) not null
);

create table status (
id integer primary key,
nazwa varchar(20) not null
);

create table trans_rodzaj ( ---uzupelnione
id integer primary key,
nazwa varchar(30) not null,
nazwa_zap varchar(30) not null);

create table nier_rodzaj ( ---uzupelnione
id integer primary key,
nazwa varchar(30) not null
);

create table rodzaj_dowod_tozsamosc (
id integer primary key,
nazwa varchar(30) not null);

create table sekcja ( ---uzupelnione
id integer primary key,
nazwa varchar(40) not null
);

create table media_reklama (
id integer primary key,
nazwa varchar(100) not null unique
);

create table lista_niechcianych (
id integer primary key,
nazwa varchar(30) not null
);

create table telefon_niechciany (
id integer primary key,
id_lista_niechcianych integer references lista_niechcianych(id) not null,
nazwa varchar(13) not null,
opis varchar(50)
);

create table rodz_nier_szczeg ( ---do ustalenia
id integer primary key,
id_nier_rodzaj integer references nier_rodzaj(id) not null,
nazwa varchar(30) not null
);

create table pomieszczenie (
id integer primary key,
nazwa varchar(30) not null
);

create table wyposazenie_nier (
id integer primary key,
id_parent integer references wyposazenie_nier(id), ---tu null musi byc allowed
wielokrotne bit, ---pole zaznaczalne tylko dla parenta(niekoniecznie), dozwalanie na wielokrotne wybieranie dzieci lub zabranianie np. jak centrum to nie 
---peryferia, ale np ogrzewanie gazowe i tez ogrzewanie srakie :P
ma_dzieci bit,
waga integer not null,
id_sekcja integer references sekcja(id) not null,
nazwa varchar(60) not null
);

create table parametr_nier ( ---lista wszystkich mozliwych informacji gromadzonych o nieruchomosci nie bedacych slownikowymi, 
---podawane z lapy np powierzchnia itd. W tej tabeli maja byc wszystkie mozliwosci niezaleznie od rodzaju nieruchomosci
id integer primary key,
id_sekcja integer references sekcja(id) not null,
id_walidacja integer references walidacja(id) not null,
waga integer not null, ---poziom istotnosci do kojarzenia
nazwa varchar(40) not null,
dl_inf integer
);

create table wyposazenie_pom (
id integer primary key,
id_parent integer references wyposazenie_pom(id),
wielokrotne bit,
ma_dzieci bit,
waga integer not null,
id_sekcja integer references sekcja(id) not null,
nazwa varchar(60) not null
);

create table parametr_pom ( 
id integer primary key,
id_sekcja integer references sekcja(id) not null,
id_walidacja integer references walidacja(id) not null,
waga integer not null,
nazwa varchar(40) not null,
dl_inf integer
);

create table region_geog (
id integer primary key,
id_parent integer references region_geog(id),
id_otodom integer,
nazwa varchar(60) not null
);

---create table wojewodztwo (
---id integer primary key,
---id_kraj integer references kraj(id) not null,
---id_otodom integer,
---nazwa varchar(30) not null
---);

---create table powiat (
---id integer primary key,
---id_wojewodztwo integer references wojewodztwo(id) not null,
---id_otodom integer,
---nazwa varchar(30) not null
---);

---create table gmina (
---id integer primary key,
---id_powiat integer references powiat (id) not null,
---nazwa varchar(30) not null
---);

---create table miejscowosc (
---id integer primary key,
---id_gmina integer references gmina (id) not null,
---nazwa varchar(30) not null
---);

create table imie (
id integer primary key,
nazwa varchar(60) not null unique
);

create table bank (
id integer primary key,
nazwa varchar(50) not null
);

create table osobowosc (
id integer primary key,
nazwa varchar(25) not null
);

create table umowienie ( ---ogladanie, umowa przedwstepna, umowa notarialna, odbior mieszkania czy to nie ???
id integer primary key,
nazwa varchar(40) not null
);

---statusy klientow

---tabele konfiguracyjne

create table tlumaczenie (
id integer primary key,
nazwa_lang_tag varchar(100) references lang_tag(nazwa) not null,
id_jezyk integer references jezyk(id) not null,
nazwa varchar(100) not null
);

create table lista_param_nier (
id integer primary key,
id_nier_rodzaj integer references nier_rodzaj (id) not null,
id_parametr_nier integer references parametr_nier(id) not null,
id_trans_rodzaj integer references trans_rodzaj(id) not null,
pokaz bit
);

create table param_nier_strona (
id integer primary key,
id_nier_rodzaj integer references nier_rodzaj (id) not null,
id_parametr_nier integer references parametr_nier(id) not null,
id_trans_rodzaj integer references trans_rodzaj(id) not null
);

create table lista_param_slow_nier ( ---lista parametrow slownikowych nieruchomosci dla danego rodzaju nieruchomosci
id integer primary key,
id_nier_rodzaj integer references nier_rodzaj (id) not null,
id_wyposazenie_nier integer references wyposazenie_nier(id) not null,
id_trans_rodzaj integer references trans_rodzaj(id) not null,
pokaz bit
);

create table wypos_nier_strona (
id integer primary key,
id_nier_rodzaj integer references nier_rodzaj (id) not null,
id_wyposazenie_nier integer references wyposazenie_nier(id) not null,
id_trans_rodzaj integer references trans_rodzaj(id) not null
);

create table lista_param_pom (
id integer primary key,
id_pomieszczenie integer references pomieszczenie (id) not null,
id_parametr_pom integer references parametr_pom(id) not null);

create table lista_param_slow_pom ( ---lista parametrow slownikowych nieruchomosci dla danego rodzaju nieruchomosci
id integer primary key,
id_pomieszczenie integer references pomieszczenie (id) not null,
id_wyposazenie_pom integer references wyposazenie_pom(id) not null
);

create table transakcja_nier (
id integer primary key,
id_trans_rodzaj integer references trans_rodzaj(id) not null,
id_nier_rodzaj integer references nier_rodzaj(id) not null,
typ_of_otodom varchar(100)
);

create table pomieszczenie_nier (
id integer primary key,
id_nier_rodzaj integer references nier_rodzaj(id) not null,
id_pomieszczenie integer references pomieszczenie(id) not null
);

---create table pokaz_parametr (
---id integer primary key,
---id_transakcja integer references trans_rodzaj(id),
---is_dict_table bit not null,
---id_parametr integer not null ---references parametr_nier, wyposazenie_nier
----nie mozna zrobic referencji na 2 tabele jednoczesnie
---);

---tabele z danymi

create table kurs (
id integer references waluta(id) unique not null,
wartosc varchar(10) not null
);

create table agent (
id integer primary key,
id_otodom integer,
nazwa varchar(100) not null,
login varchar(40) not null unique,
haslo varchar(40) not null,
waznosc_haslo datetime not null,
aktywnosc_konto bit,
telefon varchar(13),
komorka varchar(13),
fax varchar(13),
email varchar(40) not null,
licencja integer,
nadzor integer references agent(id),
dodawanie bit,
edycja bit,
kasowanie bit,
druk bit,
adm_klient bit,
adm_dane bit,
zmiana_upr bit);

create table klient ( ---umowiony oczekujacy moze cos jeszcze inny zestaw statusow
id integer primary key,
id_old integer,
is_oferent_old bit ,
id_osobowosc integer references osobowosc(id) not null,
id_agent integer references agent(id) not null);

create table ustalenia (
id integer primary key,
id_klient integer references klient(id) not null,
id_agent integer references agent(id) not null,
data datetime,
tresc varchar(100)
);

create table biuro_nier_kon (
id integer primary key,
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
id integer primary key,
id_old integer,
id_imie integer references imie(id) not null,
nazwisko varchar(30) not null,
nazwisko_rodowe varchar(30),--- not null,
pesel varchar(15),
id_agent integer references agent(id));---not null

create table osoba_dowod (
id integer primary key,
id_osoba integer references osoba(id) not null,
id_rodzaj_dowod_tozsamosc integer references rodzaj_dowod_tozsamosc(id) not null,
nazwa varchar(100) not null);

create table osoba_adres (
id integer references osoba(id) not null unique,
kod_pocztowy varchar(6),--- not null,
id_region_geog integer references region_geog(id),--- not null,
ulica varchar(40) not null,
numer_dom varchar(10),
numer_miesz varchar(10));

create table osoba_klient (
id integer primary key,
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
id integer primary key,
id_osoba integer references osoba(id),
nazwa varchar(13) not null,
opis varchar(100)
);

create table komorka (
id_osoba integer references osoba(id) unique,
nazwa varchar(9) not null,
opis varchar(100)
);

create table email_osoba (
id integer primary key,
id_osoba integer references osoba(id),
nazwa varchar(50) not null,
opis varchar(100)
);

---komorka pod sms

create table osoba_kon_bank (
id integer primary key,
id_imie integer references imie(id) not null,
nazwisko varchar(30) not null,
id_bank integer references bank(id) not null
);

create table telefon_os_bank (
id integer primary key,
id_osoba_kon_bank integer references osoba_kon_bank(id) not null,
nazwa varchar(9) not null
);

create table nieruchomosc (
id integer primary key,
id_old integer,
id_nier_rodzaj integer references nier_rodzaj(id) not null,
id_rodz_nier_szcz integer references rodz_nier_szczeg(id), --- not null,
id_klient integer references klient(id) not null,
id_region_geog integer references region_geog(id),-- not null, -- zmienic to zaraz spowrotem
ulica_net varchar(100),
ulica varchar(100),
kod varchar(6),
id_agent integer references agent(id) not null,
data datetime not null,
rynek_pierw bit
);

create table zdjecie (
id integer primary key,
id_nieruchomosc integer references nieruchomosc(id) not null,
nazwa varchar(40) not null,
nazwa_old varchar(100)
);

create table film (
id integer primary key,
id_nieruchomosc integer references nieruchomosc(id) not null,
nazwa varchar(30) not null
);

create table oferta (
id integer primary key,
id_old integer,
id_rodz_trans integer references trans_rodzaj(id) not null,
id_nieruchomosc integer references nieruchomosc(id) not null,
id_status integer references status(id),
data datetime not null,
data_otw_zlecenie datetime not null,
data_zam_zlecenie datetime,
cena varchar(15) not null,
prowizja_proc bit, ---czy prowizja procentowo czy kwotowo
prowizja varchar(7),
wylacznosc bit,
pokaz bit
---tu ewentualnie rodzaj klienta jesli to konieczne, ale rodzaj klienta wynika
---z tego, ze jest przypisany jako wlasciciel nieruchomosci
);

create table opis (
id integer primary key,
id_oferta integer references oferta(id) not null, --- a moze oferta ?
id_jezyk integer references jezyk(id) not null,
wartosc varchar(100) not null
);

create table opis_nieruchomosc (
id integer primary key,
id_nieruchomosc integer references nieruchomosc(id) not null,
id_agent integer references agent(id) not null,
data datetime,
tresc varchar(100)
);

create table cena (
id integer primary key,
id_oferta integer references oferta(id) not null,
id_osoba integer references osoba(id) not null,
id_agent integer references agent(id) not null,
cena varchar(15) not null, ---rozwazyc przepisanie najaktualniejszej ceny
---do tabeli oferta trigerem
data datetime not null,
podpis bit
);

create table dane_txt_nier (
id integer primary key,
id_nieruchomosc integer references nieruchomosc(id) not null,
id_parametr_nier integer references parametr_nier(id) not null,
wartosc varchar(100)
);

create table dane_slow_wyp_nier (  ---ze standardowego slownika wyposazen
id integer primary key,
id_nieruchomosc integer references nieruchomosc(id) not null,
id_wyposazenie_nier integer references wyposazenie_nier(id) not null
);

create table pomieszczenie_przyn_nier (
id integer primary key,
id_nieruchomosc integer references nieruchomosc(id) not null,
id_pomieszczenie integer references pomieszczenie(id) not null,
nr_pomieszczenia integer not null
);

create table dane_txt_pom (
id integer primary key,
id_pomieszczenie_przyn_nier integer references pomieszczenie_przyn_nier(id) not null,
id_parametr_pom integer references parametr_pom(id) not null,---[] not null, ---references lista_param_pom(id) not null,
wartosc varchar(100)---[]
);

create table dane_slow_wyp_pom (  ---ze standardowego slownika wyposazen
id integer primary key,
id_pomieszczenie_przyn_nier integer references pomieszczenie_przyn_nier(id) not null,
id_wyposazenie_pom integer references wyposazenie_pom(id) not null ---[] not null,---references lista_param_slow_pom(id) not null,
);

create table zapotrzebowanie (
id integer primary key,
---id_old integer,
id_klient integer references klient(id) not null,
---id_trans_rodzaj integer references trans_rodzaj(id) not null,
---id_nier_rodzaj integer references nier_rodzaj(id) not null,
data datetime not null,
data_otw_zlecenie datetime not null,
data_zam_zlecenie datetime,
---id_status integer references status(id) not null,
---cena varchar(30) not null, ---wieksze pole ze wzgledu na mozliwosc podania od do ??
---prowizja_proc bit, ---czy prowizja procentowo czy kwotowo
---prowizja varchar(7),
id_agent integer references agent(id) not null
---pokaz bit
);

create table prowizja_zapotrzebowanie (
id integer primary key,
id_zapotrzebowanie integer references zapotrzebowanie(id) not null,
id_trans_rodzaj integer references trans_rodzaj(id) not null,
prowizja_proc bit, ---czy prowizja procentowo czy kwotowo
prowizja varchar(7) not null);

create table zapotrzebowanie_nier_rodzaj (
id integer primary key,
id_nier_rodzaj integer references nier_rodzaj(id) not null,
id_zapotrzebowanie integer references zapotrzebowanie(id) not null);

create table zapotrzebowanie_trans_rodzaj (
id integer primary key,
id_zapotrzebowanie_nier_rodzaj integer references zapotrzebowanie_nier_rodzaj(id) not null,
id_status integer references status(id) not null,
id_trans_rodzaj integer references trans_rodzaj (id) not null,
cena varchar(15),
pokaz bit);

---regiony + nieruchomosc szczegoly

create table zamiana (
id integer primary key,
id_oferta integer references oferta(id) not null,
id_zapotrzebowanie integer references zapotrzebowanie(id) not null);

create table opis_wew_zapotrzebowanie (
id integer primary key,
id_zapotrzebowanie integer references zapotrzebowanie(id) not null,
id_agent integer references agent(id) not null,
data datetime,
tresc varchar(100)
);

create table opis_zapotrzebowanie (
id integer primary key,
id_zapotrzebowanie_trans_rodzaj integer references zapotrzebowanie_trans_rodzaj(id) not null,
id_jezyk integer references jezyk(id) not null,
wartosc varchar(100) not null);

create table osoba_oferta (
id integer primary key,
id_oferta integer references oferta(id) not null,
id_osoba integer references osoba(id) not null);

create table osoba_zapotrzebowanie (
id integer primary key,
id_zapotrzebowanie integer references zapotrzebowanie(id) not null,
id_osoba integer references osoba(id) not null);

create table zap_szcz_nier (
id integer primary key,
id_zapotrzebowanie_trans_rodzaj integer references zapotrzebowanie_trans_rodzaj(id) not null,
id_rodz_nier_szcz integer references rodz_nier_szczeg(id) not null);

create table zap_lokaliz_nier ( ---mozna zdefiniowac kilka roznych lokalizacji np 3 gminy i jeszcze powiat itd
id integer primary key,
id_zapotrzebowanie_trans_rodzaj integer references zapotrzebowanie_trans_rodzaj(id) not null,
id_region_geog integer references region_geog(id) not null);

create table dane_txt_zap_min (
id integer primary key,
id_zapotrzebowanie_trans_rodzaj integer references zapotrzebowanie_trans_rodzaj(id) not null,
id_parametr_nier integer references parametr_nier(id) not null,
wartosc varchar(100));

create table dane_txt_zap_max (
id integer primary key,
id_zapotrzebowanie_trans_rodzaj integer references zapotrzebowanie_trans_rodzaj(id) not null,
id_parametr_nier integer references parametr_nier(id) not null,
wartosc varchar(100));

create table dane_slow_wyp_zap (  ---ze standardowego slownika wyposazen
id integer primary key,
id_zapotrzebowanie_trans_rodzaj integer references zapotrzebowanie_trans_rodzaj(id) not null,
id_wyposazenie_nier integer references wyposazenie_nier(id) not null
);

create table godzina (
id integer primary key,
nazwa varchar(2) not null);

create table minuta (
id integer primary key,
nazwa varchar(2) not null);

create table spotkanie ( ---umowienie sie z ludzmi
id integer primary key,
id_oferta integer references oferta(id) not null,
id_zapotrzebowanie integer references zapotrzebowanie(id) not null,
id_klient integer references klient(id), ---kupujacy lub sprzedajacy, reguluje to bool ponizej
klient_oferujacy bit not null ,
id_umowienie integer references umowienie(id) not null,
spotkanie_data datetime not null,
spotkanie_godzina integer references godzina(id) not null,
spotkanie_minuta integer references minuta(id) not null,
id_agent integer references agent(id) not null,
komentarz varchar(100)
);

create table spotkanie_os (
id integer primary key,
id_spotkanie integer references spotkanie(id) not null,
---id_klient integer references klient(id) not null,
id_osoba integer references osoba(id) not null --osoby koniecznie sposrod wskazanego klienta
);

---przygotowac tabele osob postronnych bioracych udzial w spotkaniu - to juz chyba jest rozwiazane
create table lista_wsk_adr (
id integer primary key,
id_oferta integer references oferta(id) not null,---cena i adres wynika z oferty
id_zapotrzebowanie integer references zapotrzebowanie(id) not null,
id_klient integer references klient(id) not null,
id_agent integer references agent(id) not null,
data datetime not null, ---data wprowadzenia rekordu do systemu
ogladanie_data datetime not null,
ogladanie_godzina integer references godzina(id) not null,
ogladanie_minuta integer references minuta(id) not null);

create table osoba_lista_wsk_adr (
id integer primary key,
id_lista_wsk_adr integer references lista_wsk_adr(id) not null,
id_osoba integer references osoba(id) not null);

create table rekord_nieakt_lista_wsk_adr (
id integer not null unique references lista_wsk_adr(id),
id_agent integer references agent(id) not null,
data datetime);

create table transakcja (
id integer primary key,
id_wlasciciel integer references klient(id) not null,
id_nabywca integer references klient(id) not null,
---id_agent_n integer references agent(id) not null, ---agent nabywcy
id_oferta integer references oferta(id) not null,
id_nieruchomosc integer references nieruchomosc(id) not null,
---agent wlasciciela wynika z nieruchomosci
id_lista_wsk_adr integer references lista_wsk_adr(id) not null,
---agent klienta wynika z listy wskazan adr
data_umowa_przed datetime not null,
data_umowa_notar datetime,
termin_notar datetime,
zdanie_nier datetime,
zadatek_w varchar(7),
zadatek_n varchar(7),
prowizja_w varchar(5),
prowizja_n varchar(5),
kredyt bit,
finalizacja bit,
cena varchar(15));
---tabela wlascicieli lub wlasciciela nieruchomosci
create table wlasciciel ( ---chodzi o to zeby przy transakcji nie upominac sie o wszystkie osoby ktore byly kontaktowe,
id integer primary key,
---id_transakcja integer references transakcja(id) not null,
id_nieruchomosc integer references nieruchomosc(id) not null,
id_osoba integer references osoba(id) not null,
procent_udzial float);
---alter table wlasciciel alter column procent_udzial type float;

create table kredytowanie (
id integer primary key,
id_transakcja integer references transakcja(id) not null, ---a jest mozliwe ze koles dostaje na ta hate 2 kredyty nie 1 ??
id_bank integer references bank(id) not null,
kwota varchar(15) not null
);

create table kalendarz (
id integer primary key,
id_agent integer references agent(id) not null,
data datetime not null,
id_godzina integer references godzina(id) not null,
id_minuta integer references minuta(id) not null,
id_spotkanie integer references spotkanie(id),
komentarz varchar(100));

create table media_nieruchomosc (
id integer primary key,
id_nier_rodzaj integer references nier_rodzaj(id) not null,
id_trans_rodzaj integer references trans_rodzaj(id) not null,
id_region_geog integer references region_geog(id),--- not null,
id_status integer references status(id) not null,
id_agent integer references agent(id) not null,
data datetime not null,
ulica varchar(100),
oferent bit,
powierzchnia varchar(10),
cena varchar(15),
opis varchar(100),
przypomnienie datetime,
id_osoba integer references osoba(id)
);

create table kon_m_nieruchomosc (
id integer primary key,
id_media_nieruchomosc integer references media_nieruchomosc(id) not null,
id_agent integer references agent(id) not null,
komentarz varchar(100) not null,
data datetime not null
);

create table reklama_nieruchomosc_m ( ---reklamowanie nieruchomosci w mediach - ewidencja
id integer primary key,
id_media_nieruchomosc integer references media_nieruchomosc(id) not null,
id_media_reklama integer references media_reklama(id) not null,
data datetime not null
);

create table telefon_media_nieruchomosc (
id integer primary key,
id_media_nieruchomosc integer references media_nieruchomosc(id) not null,
nazwa varchar(13) not null,
opis varchar(100)
);

create table email_media_nieruchomosc (
id integer primary key,
id_media_nieruchomosc integer references media_nieruchomosc(id) not null,
nazwa varchar(50) not null,
opis varchar(50)
);

create table kategoria_allegro (
id integer primary key,
id_nier_rodzaj integer references nier_rodzaj(id),
id_trans_rodzaj integer references trans_rodzaj(id),
id_powiat integer references region_geog(id),
kategoria_allegro integer not null);

create table portal (
id integer primary key,
nazwa varchar(20) not null);

create table portal_wys (
id integer primary key,
id_oferta integer references oferta(id) not null,
id_portal integer references portal(id) not null,
--id_rodzaj_nier integer references rodzaj_nieruchomosci (id) not null,
portal_ins_id integer,
data_wys datetime not null,
data_wyg datetime not null,
is_active bit);

create table precyzja_kojarzenie (
id integer primary key,
nazwa varchar(100) not null unique,
baza varchar(100) not null,
krok varchar(100) not null);
