---delete na tabele z nier dla ofert innych biur

delete from tab_dom where id_b > 1;
delete from tab_mie where id_b > 1;
delete from tab_obi where id_b > 1;
delete from tab_lok where id_b > 1;
delete from tab_te where id_b > 1;
delete from tab_dzi where id_b > 1;

delete from tab_dom_w where id_b > 1;
delete from tab_mie_w where id_b > 1;
delete from tab_obi_w where id_b > 1;
delete from tab_lok_w where id_b > 1;
delete from tab_te_w where id_b > 1;
delete from tab_dzi_w where id_b > 1;

delete from tab_dom_za where id_b > 1;
delete from tab_mie_za where id_b > 1;

delete from tab_agent where id_b > 1;
delete from tab_ofe where id_a not in (select id_a from tab_agent where id_b = 1);
delete from tab_kl where id_a not in (select id_a from tab_agent where id_b = 1);
delete from tab_li_wsk where nr_ag not in (select id_a from tab_agent where id_b = 1);

update tab_ofe set nazrod = null where nazrod = '0';
update tab_ofe set im1 = null where im1 = '0';
update tab_ofe set im1 = trim(im1);
update tab_ofe set mie = trim(mie);
update tab_ofe set telstac1 = null where telstac1 = 0;
update tab_ofe set telstac2 = null where telstac2 = 0;
update tab_ofe set telkom1 = null where telkom1 = 0;
update tab_ofe set telkom2 = null where telkom2 = 0;
update tab_ofe set email = null where email = 0 or email = '';
update tab_ofe set naztelstac1 = null where naztelstac1 = 0;
update tab_ofe set naztelstac2 = null where naztelstac2 = 0;
update tab_ofe set naztelkom1 = null where naztelkom1 = 0;
update tab_ofe set naztelkom2 = null where naztelkom2 = 0;

----dopracowane - chyba nie dalo rezultatu
update tab_ofe set rodz_of10 = 0, num_of10 = 0 where rodz_of9 = rodz_of10 and num_of9 = num_of10 and num_of10 != 0;
update tab_ofe set rodz_of10 = 0, num_of10 = 0 where rodz_of8 = rodz_of10 and num_of8 = num_of10 and num_of10 != 0;
update tab_ofe set rodz_of10 = 0, num_of10 = 0 where rodz_of7 = rodz_of10 and num_of7 = num_of10 and num_of10 != 0;
update tab_ofe set rodz_of10 = 0, num_of10 = 0 where rodz_of6 = rodz_of10 and num_of6 = num_of10 and num_of10 != 0;
update tab_ofe set rodz_of10 = 0, num_of10 = 0 where rodz_of5 = rodz_of10 and num_of5 = num_of10 and num_of10 != 0;
update tab_ofe set rodz_of10 = 0, num_of10 = 0 where rodz_of4 = rodz_of10 and num_of4 = num_of10 and num_of10 != 0;
update tab_ofe set rodz_of10 = 0, num_of10 = 0 where rodz_of3 = rodz_of10 and num_of3 = num_of10 and num_of10 != 0;
update tab_ofe set rodz_of10 = 0, num_of10 = 0 where rodz_of2 = rodz_of10 and num_of2 = num_of10 and num_of10 != 0;
update tab_ofe set rodz_of10 = 0, num_of10 = 0 where rodz_of1 = rodz_of10 and num_of1 = num_of10 and num_of10 != 0;

update tab_ofe set rodz_of9 = 0, num_of9 = 0 where rodz_of9 = rodz_of8 and num_of9 = num_of8 and num_of9 != 0;
update tab_ofe set rodz_of9 = 0, num_of9 = 0 where rodz_of9 = rodz_of7 and num_of9 = num_of7 and num_of9 != 0;
update tab_ofe set rodz_of9 = 0, num_of9 = 0 where rodz_of9 = rodz_of6 and num_of9 = num_of6 and num_of9 != 0;
update tab_ofe set rodz_of9 = 0, num_of9 = 0 where rodz_of9 = rodz_of5 and num_of9 = num_of5 and num_of9 != 0;
update tab_ofe set rodz_of9 = 0, num_of9 = 0 where rodz_of9 = rodz_of4 and num_of9 = num_of4 and num_of9 != 0;
update tab_ofe set rodz_of9 = 0, num_of9 = 0 where rodz_of9 = rodz_of3 and num_of9 = num_of3 and num_of9 != 0;
update tab_ofe set rodz_of9 = 0, num_of9 = 0 where rodz_of9 = rodz_of2 and num_of9 = num_of2 and num_of9 != 0;
update tab_ofe set rodz_of9 = 0, num_of9 = 0 where rodz_of9 = rodz_of1 and num_of9 = num_of1 and num_of9 != 0;

update tab_ofe set rodz_of8 = 0, num_of8 = 0 where rodz_of7 = rodz_of8 and num_of7 = num_of8 and num_of8 != 0;
update tab_ofe set rodz_of8 = 0, num_of8 = 0 where rodz_of6 = rodz_of8 and num_of6 = num_of8 and num_of8 != 0;
update tab_ofe set rodz_of8 = 0, num_of8 = 0 where rodz_of5 = rodz_of8 and num_of5 = num_of8 and num_of8 != 0;
update tab_ofe set rodz_of8 = 0, num_of8 = 0 where rodz_of4 = rodz_of8 and num_of4 = num_of8 and num_of8 != 0;
update tab_ofe set rodz_of8 = 0, num_of8 = 0 where rodz_of3 = rodz_of8 and num_of3 = num_of8 and num_of8 != 0;
update tab_ofe set rodz_of8 = 0, num_of8 = 0 where rodz_of2 = rodz_of8 and num_of2 = num_of8 and num_of8 != 0;
update tab_ofe set rodz_of8 = 0, num_of8 = 0 where rodz_of1 = rodz_of8 and num_of1 = num_of8 and num_of8 != 0;

update tab_ofe set rodz_of7 = 0, num_of7 = 0 where rodz_of7 = rodz_of6 and num_of7 = num_of6 and num_of7 != 0;
update tab_ofe set rodz_of7 = 0, num_of7 = 0 where rodz_of7 = rodz_of5 and num_of7 = num_of5 and num_of7 != 0;
update tab_ofe set rodz_of7 = 0, num_of7 = 0 where rodz_of7 = rodz_of4 and num_of7 = num_of4 and num_of7 != 0;
update tab_ofe set rodz_of7 = 0, num_of7 = 0 where rodz_of7 = rodz_of3 and num_of7 = num_of3 and num_of7 != 0;
update tab_ofe set rodz_of7 = 0, num_of7 = 0 where rodz_of7 = rodz_of2 and num_of7 = num_of2 and num_of7 != 0;
update tab_ofe set rodz_of7 = 0, num_of7 = 0 where rodz_of7 = rodz_of1 and num_of7 = num_of1 and num_of7 != 0;

update tab_ofe set rodz_of6 = 0, num_of6 = 0 where rodz_of5 = rodz_of6 and num_of5 = num_of6 and num_of6 != 0;
update tab_ofe set rodz_of6 = 0, num_of6 = 0 where rodz_of4 = rodz_of6 and num_of4 = num_of6 and num_of6 != 0;
update tab_ofe set rodz_of6 = 0, num_of6 = 0 where rodz_of3 = rodz_of6 and num_of3 = num_of6 and num_of6 != 0;
update tab_ofe set rodz_of6 = 0, num_of6 = 0 where rodz_of2 = rodz_of6 and num_of2 = num_of6 and num_of6 != 0;
update tab_ofe set rodz_of6 = 0, num_of6 = 0 where rodz_of1 = rodz_of6 and num_of1 = num_of6 and num_of6 != 0;

update tab_ofe set rodz_of5 = 0, num_of5 = 0 where rodz_of5 = rodz_of4 and num_of5 = num_of4 and num_of5 != 0;
update tab_ofe set rodz_of5 = 0, num_of5 = 0 where rodz_of5 = rodz_of3 and num_of5 = num_of3 and num_of5 != 0;
update tab_ofe set rodz_of5 = 0, num_of5 = 0 where rodz_of5 = rodz_of2 and num_of5 = num_of2 and num_of5 != 0;
update tab_ofe set rodz_of5 = 0, num_of5 = 0 where rodz_of5 = rodz_of1 and num_of5 = num_of1 and num_of5 != 0;

update tab_ofe set rodz_of4 = 0, num_of4 = 0 where rodz_of3 = rodz_of4 and num_of3 = num_of4 and num_of4 != 0;
update tab_ofe set rodz_of4 = 0, num_of4 = 0 where rodz_of2 = rodz_of4 and num_of2 = num_of4 and num_of4 != 0;
update tab_ofe set rodz_of4 = 0, num_of4 = 0 where rodz_of1 = rodz_of4 and num_of1 = num_of4 and num_of4 != 0;

update tab_ofe set rodz_of3 = 0, num_of3 = 0 where rodz_of3 = rodz_of2 and num_of3 = num_of2 and num_of3 != 0;
update tab_ofe set rodz_of3 = 0, num_of3 = 0 where rodz_of3 = rodz_of1 and num_of3 = num_of1 and num_of3 != 0;

update tab_ofe set rodz_of2 = 0, num_of2 = 0 where rodz_of1 = rodz_of2 and num_of1 = num_of2 and num_of2 != 0;

update tab_kl set nazrod = null where nazrod = '0';
update tab_kl set im1 = null where im1 = '0';
update tab_kl set im1 = trim(im1);
update tab_oso_tow set imie = trim(imie);
update tab_kl set mie = trim(mie);
update tab_kl set telstac1 = null where telstac1 = 0;
update tab_kl set telstac2 = null where telstac2 = 0;
update tab_kl set telkom1 = null where telkom1 = 0;
update tab_kl set telkom2 = null where telkom2 = 0;
update tab_kl set email = null where email = 0 or email = '';
update tab_kl set naztelstac1 = null where naztelstac1 = 0;
update tab_kl set naztelstac2 = null where naztelstac2 = 0;
update tab_kl set naztelkom1 = null where naztelkom1 = 0;
update tab_kl set naztelkom2 = null where naztelkom2 = 0;
update tab_kl set kodp = null where kodp = '0';
update tab_kl set mie = null where mie = '0';
update tab_kl set kodp = substring(kodp from 1 for 6) where character_length (kodp) > 6;

update tab_kl set id_a = 18 where id_a = 24;
update tab_kl set id_a = 20 where id_a = 32;

---regiony geograficzne
update wojewodztwa set nazwa_w = substring(nazwa_w from 1 for char_length(nazwa_w) - 1);
update powiaty set nazwa_p = substring(nazwa_p from 1 for char_length(nazwa_p) - 1);

--insert into region_geog (id_parent, id_otodom, nazwa) select 1, id_w_otodom, nazwa_w from wojewodztwa;

---przeniesienie powiatow

--insert into region_geog (id_parent, id_otodom, nazwa) select (select id from region_geog where nazwa = (select nazwa_w from wojewodztwa where id_w = p1.id_w)), id_pow_otodom, nazwa_p from powiaty p1;

---jako gminy dodajemy miasta, potem jako miejscowosci w gmianch te miejscowosci tez trzeba dodac


insert into region_geog (nazwa) select distinct mie from tab_kl where lower(mie) not in (select lower(nazwa) from region_geog);
insert into region_geog (nazwa) select distinct mie from tab_ofe where lower(mie) not in (select lower(nazwa) from region_geog);

insert into region_geog (nazwa) select distinct mieospr from tab_kl where lower(mieospr) not in (select lower(nazwa) from region_geog);
insert into region_geog (nazwa) select distinct mieospr from tab_ofe where lower(mieospr) not in (select lower(nazwa) from region_geog);

---dorobic to samo dla innych tab :P


---korekta regionow
---select substring(nazwa from 1 for char_length(nazwa) - 1) from region_geog where nazwa like 'gliwicki_';
---update region_geog set nazwa = trim(nazwa);
---update region_geog set nazwa = substring(nazwa from 1 for char_length(nazwa) - 1) where nazwa != '_polska';


---zamysl: 
	---kazda z 6 tabel (czy nawet 12) ma swoje indywidualne pola (o indywidualnych nazwach) ktore to samo oznaczaja - przechowuja ta sama informacje o nier.
	---w zwiazku z tym wraz z tabela jest pobierana lista jej pol potrzebnych do pobrania tych danych, te pola potem beda pobierane do sparsowania zapytania
	---dla tej tabeli dla tych pol

---dane z informacjami odnosnie pol tabel, ktore sa tam podane lub jeszcze innych tabel
alter table tab_rodzaju_ofe add column dane_pomocnicze text[];

update tab_rodzaju_ofe set dane_pomocnicze = ARRAY['no_m','rb', 'rodzaj_b.nazwa_b', 'lok_m', 'lok_p', 'loka', 'opis_po', 'datawp_m', 'rr_m', '_mieszkanie', '_sprzedaz', 'cm_m', 'wyl_m', 'lok_w', 'usunm', 'sm_m', 'cz_prze_m'] where nazwa_tab = 'tab_mie';
update tab_rodzaju_ofe set dane_pomocnicze = ARRAY['no_d','rof_d', 'rodzaj_of.rodzaj_of', 'lok_d', 'lok_p', 'loka', 'opis_po', 'datawp_d', 'rr_d', '_dom', '_sprzedaz', 'cd', 'wyl_d', 'lok_w', 'usund', 'sm_d', 'cz_prze_d'] where nazwa_tab = 'tab_dom';
update tab_rodzaju_ofe set dane_pomocnicze = ARRAY['no_d','rof_d', 'rodzaj_of_lok.rodzaj_of', 'lok_d', 'lok_p', 'loka', 'opis_po', 'datawp_d', 'rr_d', '_lokal', '_sprzedaz', 'cd', 'wyl_d', 'lok_w', 'usund', 'sm_d', 'cz_prze_d'] where nazwa_tab = 'tab_lok';
update tab_rodzaju_ofe set dane_pomocnicze = ARRAY['no_d','rof_d', 'rodzaj_of_obi.rodzaj_of', 'lok_d', 'lok_p', 'loka', 'opis_po', 'datawp_d', 'rr_d', '_obiekt', '_sprzedaz', 'cd', 'wyl_d', 'lok_w', 'usund', 'sm_d', 'cz_prze_d'] where nazwa_tab = 'tab_obi';
update tab_rodzaju_ofe set dane_pomocnicze = ARRAY['no_d','rof_d', 'rodzaj_of_te.rodzaj_of', 'lok_d', 'lok_p', 'loka', 'opis_po', 'datawp_d', 'rr_d', '_teren', '_sprzedaz', 'cd', 'wyl_d', 'lok_w', 'usund', 'sm_d', 'cz_prze_d'] where nazwa_tab = 'tab_te';
update tab_rodzaju_ofe set dane_pomocnicze = ARRAY['no_d','rof_d', 'rodzaj_of_dzi.rodzaj_of', 'lok_d', 'lok_p', 'loka', 'opis_po', 'datawp_d', 'rr_d', '_dzialka', '_sprzedaz', 'cd', 'wyl_d', 'lok_w', 'usund', 'sm_d', 'cz_prze_d'] where nazwa_tab = 'tab_dzi';
update tab_rodzaju_ofe set dane_pomocnicze = ARRAY['no_m','rb', 'rodzaj_b.nazwa_b', 'lok_m', 'lok_p', 'loka', 'opis_po', 'datawp_m', 'rr_m', '_mieszkanie', '_wynajem', 'cm_m', 'wyl_m', 'lok_w', 'usunm', 'sm_m', 'cz_prze_m'] where nazwa_tab = 'tab_mie_w';
update tab_rodzaju_ofe set dane_pomocnicze = ARRAY['no_d','rof_d', 'rodzaj_of.rodzaj_of', 'lok_d', 'lok_p', 'loka', 'opis_po', 'datawp_d', 'rr_d', '_dom', '_wynajem', 'cd', 'wyl_d', 'lok_w', 'usund', 'sm_d', 'cz_prze_d'] where nazwa_tab = 'tab_dom_w';
update tab_rodzaju_ofe set dane_pomocnicze = ARRAY['no_d','rof_d', 'rodzaj_of_lok.rodzaj_of', 'lok_d', 'lok_p', 'loka', 'opis_po', 'datawp_d', 'rr_d', '_lokal', '_wynajem', 'cd', 'wyl_d', 'lok_w', 'usund', 'sm_d', 'cz_prze_d'] where nazwa_tab = 'tab_lok_w';
update tab_rodzaju_ofe set dane_pomocnicze = ARRAY['no_d','rof_d', 'rodzaj_of_obi.rodzaj_of', 'lok_d', 'lok_p', 'loka', 'opis_po', 'datawp_d', 'rr_d', '_obiekt', '_wynajem', 'cd', 'wyl_d', 'lok_w', 'usund', 'sm_d', 'cz_prze_d'] where nazwa_tab = 'tab_obi_w';
update tab_rodzaju_ofe set dane_pomocnicze = ARRAY['no_d','rof_d', 'rodzaj_of_te.rodzaj_of', 'lok_d', 'lok_p', 'loka', 'opis_po', 'datawp_d', 'rr_d', '_teren', '_dzierzawa', 'cd', 'wyl_d', 'lok_w', 'usund', 'sm_d', 'cz_prze_d'] where nazwa_tab = 'tab_te_w';
update tab_rodzaju_ofe set dane_pomocnicze = ARRAY['no_d','rof_d', 'rodzaj_of_dzi.rodzaj_of', 'lok_d', 'lok_p', 'loka', 'opis_po', 'datawp_d', 'rr_d', '_dzialka', '_dzierzawa', 'cd', 'wyl_d', 'lok_w', 'usund', 'sm_d', 'cz_prze_d'] where nazwa_tab = 'tab_dzi_w';

---komorki do importu danych slownikowych o nieruchomosci
alter table tab_rodzaju_ofe add column komorka_slow text[];
alter table tab_rodzaju_ofe add column komorka_slow_tabela text[];
alter table tab_rodzaju_ofe add column komorka_yesno text[];
alter table tab_rodzaju_ofe add column komorka_yesno_tag text[];
alter table tab_rodzaju_ofe add column komorka_param text[];
alter table tab_rodzaju_ofe add column komorka_param_tag text[];

---komorki do importu danych o pomieszczeniach nieruchomosci
alter table tab_rodzaju_ofe add column komorka_slow_pom text[];
alter table tab_rodzaju_ofe add column komorka_slow_pom_nazwa text[];
alter table tab_rodzaju_ofe add column komorka_slow_tabela_pom text[];
alter table tab_rodzaju_ofe add column komorka_param_pom text[];
alter table tab_rodzaju_ofe add column komorka_param_pom_nazwa text[];
alter table tab_rodzaju_ofe add column komorka_param_tabela_pom text[];
alter table tab_rodzaju_ofe add column komorka_yesno_pom text[];
alter table tab_rodzaju_ofe add column komorka_yesno_pom_nazwa text[];
alter table tab_rodzaju_ofe add column komorka_yesno_tag_pom text[];

----idea jest nastepujaca: 
	---w tabeli w tablicach sa kolejno komorka tabeli, nazwa tabeli slownika odpowiadajacego lub tag, dla pomieszczen jeszcze _tag_pomieszczenia.ilosc informacji (np pokoi do 12, lazienek 3 itd)
	---to zostanie sparsowane w jedno spore zapytanie, nastepnie odczytane zinterpretowane i wrzucone do nowej bazy
	---kolumn do tej tabeli rodzaju ofe jest dodane od huhu ze wzgledu na rozdzielenie slownikow jes no od wielopoziomowych oraz parametrow, jeszcze na to pomieszczenia

---mieszkanie
--parametry
update tab_rodzaju_ofe set komorka_param = ARRAY['powuzyt_m', 'lp_m', 'np_m', 'lpi_m', 'wys_cz_m', 'rokb', 'odlce', 'odlprz', 'ws'] where nazwa_tab = 'tab_mie'; ---or nazwa_tab = 'tab_mie_w'
update tab_rodzaju_ofe set komorka_param_tag = ARRAY['_powierzchnia_uzytkowa', '_liczba_pokoi', '_numer_pietra', '_liczba_pieter', '_wysokosc_czynszu', '_rok_budowy', '_odl_od_centrum', 
'_odl_od_szkoly', '_wysokosc_pomieszczen'] where nazwa_tab = 'tab_mie';
---pytanie czy przy wynajmnie tez ten import rozwijac
update tab_rodzaju_ofe set komorka_param = ARRAY['powuzyt_m', 'lp_m', 'np_m', 'lpi_m', 'wys_cz_m', 'cm_m2'] where nazwa_tab = 'tab_mie_w'; ---or nazwa_tab = 'tab_mie_w'
update tab_rodzaju_ofe set komorka_param_tag = ARRAY['_powierzchnia_uzytkowa', '_liczba_pokoi', '_numer_pietra', '_liczba_pieter', '_wysokosc_czynszu', '_dodatkowe_oplaty'] where nazwa_tab = 'tab_mie_w';
---wyposazenia tak/nie
update tab_rodzaju_ofe set komorka_yesno = ARRAY['kw_m', 'si', 'tel', 'sk', 'ant', 'siec', 'oss', 'dom', 'drz', 
'rol', 'kv', 'al', 'okan', 'klim', 'komi', 'jac', 'zs', 'wi', 'fc', 'pz', 'ogr', 'sau', 'bas', 'kt', 'mip', 'unie', 'las', 
'park', 'rzeka', 'jezioro', 'staw', 'gory', 'piw', 'otnie'] where nazwa_tab = 'tab_mie' or nazwa_tab = 'tab_mie_w';
update tab_rodzaju_ofe set komorka_yesno_tag = ARRAY['_ksiega_wieczysta', '_sila', '_telefon', '_kablowa', '_antena', '_siec_internet', 
'_osiedle_strzezone', '_domofon', '_drzwi_antywlamaniowe', '_rolety', '_kamery', '_alarm', '_okna_anty', '_klimatyzacja', '_kominek', '_jaccuzi', '_zsyp', '_winda', '_fitness', '_plac_zabaw', 
'_ogrodek', '_sauna', '_basen', '_kort_tenisowy', '_parking', '_udogodnienia_niepelno', '_las', '_park', '_rzeka', '_jezioro', '_staw', '_gory', '_piwnica', '_otoczenie_nieuciazliwe'] where nazwa_tab = 'tab_mie' or nazwa_tab = 'tab_mie_w';

---wyposazenie - slowniki
---brak 
update tab_rodzaju_ofe set komorka_slow = ARRAY['spr_m._stan_prawny', 'rb._rodzaj_budynku', 'teb._technologia_budowlana', 'mat._material_budowlany', 'wo._wystawka_okien', 'ogrz._ogrzewanie', 
'cwod._ciepla_woda', 'gaz._gaz', 'kan._kanalizacja', 'tdr._typ_ulicy', 'ndr._nawierzchnia', 'kom._komunikacja', 'std._standard', 'sta._stan', 'moprz._przeksztalcenie', 'okn._okna'] 
where nazwa_tab = 'tab_mie' or nazwa_tab = 'tab_mie_w';

update tab_rodzaju_ofe set komorka_slow_tabela = ARRAY['stan_pr.nazwa_pr', 'rodzaj_b.nazwa_b', 'techno_b.nazwat_b', 'material_b.nazwa_m', 'wystawka_o.nazwa_wy', 'ogrzewanie.nazwa_grz', 
'ciepla_woda.nazwa_wo', 'gaz.nazwa_g', 'kanaliza.nazwa_ka', 'typ_ulicy.nazwa_ul', 'nawierzchnia.nazwa_na', 'komunikacja.nazwa_kom', 
'standard.nazwa_stan', 'stan.nazwa_sst', 'przeksztalcenie.nazwa_przek', 'okna.nazwa_ok'] where nazwa_tab = 'tab_mie' or nazwa_tab = 'tab_mie_w';


---konfiguracja dla tabeli mieszkania - pomieszczenia : parametry i wyposazenia

update tab_rodzaju_ofe set komorka_slow_pom = ARRAY['pop', 'ps', 'psu', 'wyp', 'tk', 'rk', 'kpo', 'kps', 'kpsu', 'kwyp', 'lpo', 'ls', 'lsu', 'lawyp', 'twc', 'wcpo', 'wcs', 'wcsu', 
'wcwyp', 'przpo', 'przs', 'przsu', 'przwyp', 'tb', 'sb', 'pob'] where nazwa_tab = 'tab_mie' or nazwa_tab = 'tab_mie_w'; ---12 powtorzen z reguly

update tab_rodzaju_ofe set komorka_slow_pom_nazwa = ARRAY['podlogi.nazwa_pod', 'sciany.nazwa_sc', 'sufit.nazwa_su', 'wyposazenie.nazwa_wp', 'typ_kuchni.nazwa_ku', 'rodzaj_kuchni.nazwa_kuch', 
'podlogi.nazwa_pod', 'sciany.nazwa_sc', 'sufit.nazwa_su', 'wyposazenie.nazwa_wp', 'podlogi.nazwa_pod', 'sciany.nazwa_sc', 'sufit.nazwa_su', 'wyposazenie.nazwa_wp', 'typ_wc.nazwa_wc', 'podlogi.nazwa_pod', 
'sciany.nazwa_sc', 'sufit.nazwa_su', 'wyposazenie.nazwa_wp', 'podlogi.nazwa_pod', 'sciany.nazwa_sc', 'sufit.nazwa_su', 'wyposazenie.nazwa_wp', 'typ_balkonu.nazwa_ba', 'sciany.nazwa_sc', 
'podlogi.nazwa_pod'] where nazwa_tab = 'tab_mie' or nazwa_tab = 'tab_mie_w';

update tab_rodzaju_ofe set komorka_slow_tabela_pom = ARRAY['_pokoj.6', '_pokoj.6', '_pokoj.6', '_pokoj.6', '_kuchnia.1', '_kuchnia.1', '_kuchnia.1', '_kuchnia.1', 
'_kuchnia.1', '_kuchnia.1', '_lazienka.1', '_lazienka.1', '_lazienka.1', '_lazienka.1', '_toaleta.1', '_toaleta.1', '_toaleta.1', '_toaleta.1', '_toaleta.1', 
'_przedpokoj.1', '_przedpokoj.1', '_przedpokoj.1', '_przedpokoj.1', '_balkon.1', '_balkon.1', '_balkon.1'] where nazwa_tab = 'tab_mie' or nazwa_tab = 'tab_mie_w'; ---ilosc powtorzen podana po kropce


update tab_rodzaju_ofe set komorka_param_pom = ARRAY['pp', 'kp', 'pl', 'pwc', 'pprz', 'pb'] where nazwa_tab = 'tab_mie' or nazwa_tab = 'tab_mie_w'; ---12 powtorzen z reguly
update tab_rodzaju_ofe set komorka_param_pom_nazwa = ARRAY['_powierzchnia', '_powierzchnia', '_powierzchnia', '_powierzchnia', '_powierzchnia', '_powierzchnia'] where nazwa_tab = 'tab_mie' or nazwa_tab = 'tab_mie_w';
update tab_rodzaju_ofe set komorka_param_tabela_pom = ARRAY['_pokoj.6', '_kuchnia.1', '_lazienka.1', '_toaleta.1', '_przedpokoj.1', '_balkon.1'] where nazwa_tab = 'tab_mie' or nazwa_tab = 'tab_mie_w';

---update tab_rodzaju_ofe set komorka_yesno_pom = ARRAY[] where nazwa_tab = 'tab_dom';
---update tab_rodzaju_ofe set komorka_yesno_pom_nazwa = ARRAY[] where nazwa_tab = 'tab_dom';
---update tab_rodzaju_ofe set komorka_yesno_tag_pom = ARRAY[] where nazwa_tab = 'tab_dom';



---konfiguracja dla tabeli domu - parametry i wyposazenia
update tab_rodzaju_ofe set komorka_param = ARRAY['powuzyt_d', 'powcal_d', 'powzab_d', 'powdzi_d', 'powpom_d', 'powogr_d', 'lp_d', 'lkuch_d', 'lprzed_d', 'lla_d', 'lub_d', 'ltar_d', 
'lbal_d', 'lkon_d', 'wysop_d', 'rok_d', 'szdzi_d', 'dldz_d', 'odlce_d', 'odlprz_d', 'ws_d'] where nazwa_tab = 'tab_dom' or nazwa_tab = 'tab_dom_w';

update tab_rodzaju_ofe set komorka_param_tag = ARRAY['_powierzchnia_uzytkowa', '_powierzchnia_calkowita', '_powierzchnia_zabudowy', '_powierzchnia_dzialki', '_powierzchnia_pomieszczen', 
'_powierzchnia_ogrodu', '_liczba_pokoi', '_liczba_kuchni', '_liczba_przedpokoi', '_liczba_lazienek', '_liczba_ubikacji', '_liczba_tarasow', '_liczba_balkonow', '_liczba_kondygnacji', 
'_wysokosc_oplat', '_rok_budowy', '_szerokosc', '_dlugosc', '_odl_od_centrum', '_odl_od_szkoly', '_wysokosc_pomieszczen'] where nazwa_tab = 'tab_dom' or nazwa_tab = 'tab_dom_w';
---wyposazenia tak/nie
update tab_rodzaju_ofe set komorka_yesno = ARRAY['kw_d', 'dzinar_d', 'dziogr_d', 'sila_d', 'wod_d', 'tel_d', 'siecka_d', 'antena_d', 'siecint_d', 'ostrz_d', 'domof_d', 'drzwant_d', 
'rol_d', 'kv_d', 'kra_d', 'alar_d', 'okant_d', 'klim_d', 'komin_d', 'jac_d', 'fit_d', 'plac_d', 'ogrodek_d', 'oczk_d', 'saun_d', 'basen_d', 'kort_d', 'mip_d', 'udog_d', 'las_d', 
'park_d', 'rzeka_d', 'jezioro_d', 'staw_d', 'gory_d', 'piwn_d', 'otnie_d'] where nazwa_tab = 'tab_dom' or nazwa_tab = 'tab_dom_w';

update tab_rodzaju_ofe set komorka_yesno_tag = ARRAY['_ksiega_wieczysta', '_dzialka_narozna', '_dzialka_ogrodzona', '_sila', '_woda', '_telefon', '_kablowa', '_antena', '_siec_internet', 
'_osiedle_strzezone', '_domofon', '_drzwi_antywlamaniowe', '_rolety', '_kamery', '_kraty', '_alarm', '_okna_anty', '_klimatyzacja', '_kominek', '_jaccuzi', '_fitness', '_plac_zabaw', 
'_ogrodek', '_oczko', '_sauna', '_basen', '_kort_tenisowy', '_parking', '_udogodnienia_niepelno', '_las', '_park', '_rzeka', '_jezioro', '_staw', '_gory', '_piwnica', '_otoczenie_nieuciazliwe'] 
where nazwa_tab = 'tab_dom' or nazwa_tab = 'tab_dom_w';

---tu po kropce dac tag rodzica - bezwzglednie; stan prawny poprawic, dac konkretnie nieruchomosci dzialki - juz zrobione
update tab_rodzaju_ofe set komorka_slow = ARRAY['spr_d._stan_prawny', 'spr_dz._stan_prawny_dzialka', 'teb_d._technologia_budowlana', 'mat_d._material_budowlany', 'kdach_d._dach', 'wo_d._wystawka_okien', 
'ksdzi_d._dzialka', 'uksz_d._uksztaltowanie_dzialka', 'zaddzi_d._zadrzewienie_dzialka', 'ogrz_d._ogrzewanie', 'ciewod_d._ciepla_woda', 'gaz_d._gaz', 'kanal_d._kanalizacja', 'tdr_d._typ_ulicy', 
'ndr_d._nawierzchnia', 'kmod_d._komunikacja', 'sas_d._sasiedztwo', 'std_d._standard', 'sta_d._stan', 'moprz_d._przeksztalcenie'] where nazwa_tab = 'tab_dom' or nazwa_tab = 'tab_dom_w';
update tab_rodzaju_ofe set komorka_slow_tabela = ARRAY['stan_pr.nazwa_pr', 'stan_pr.nazwa_pr', 'techno_b.nazwat_b', 'material_b.nazwa_m', 'dach.nazwa_da', 'wystawka_o.nazwa_wy', 'dzialka.nazwa_dz', 
'dzialka_uk.nazwa_uk', 'dzialka_za.nazwa_za', 'ogrzewanie.nazwa_grz', 'ciepla_woda.nazwa_wo', 'gaz.nazwa_g', 'kanaliza.nazwa_ka', 'typ_ulicy.nazwa_ul', 'nawierzchnia.nazwa_na', 'komunikacja.nazwa_kom', 
'sasiedztwo.nazwa_sas', 'standard.nazwa_stan', 'stan.nazwa_sst', 'przeksztalcenie.nazwa_przek'] where nazwa_tab = 'tab_dom' or nazwa_tab = 'tab_dom_w';


---konfiguracja dla tabeli domu - pomieszczenia : parametry i wyposazenia

update tab_rodzaju_ofe set komorka_slow_pom = ARRAY['pop', 'ps', 'psu', 'wyp', 'tk', 'rk', 'kpo', 'kps', 'kpsu', 'kwyp', 'lpo', 'ls', 'lsu', 'lawyp', 'twc', 'wcpo', 'wcs', 'wcsu', 
'wcwyp', 'przpo', 'przs', 'przsu', 'przwyp', 'tb', 'sb', 'pob'] where nazwa_tab = 'tab_dom' or nazwa_tab = 'tab_dom_w'; ---12 powtorzen z reguly
update tab_rodzaju_ofe set komorka_slow_pom_nazwa = ARRAY['podlogi.nazwa_pod', 'sciany.nazwa_sc', 'sufit.nazwa_su', 'wyposazenie.nazwa_wp', 'typ_kuchni.nazwa_ku', 'rodzaj_kuchni.nazwa_kuch', 
'podlogi.nazwa_pod', 'sciany.nazwa_sc', 'sufit.nazwa_su', 'wyposazenie.nazwa_wp', 'podlogi.nazwa_pod', 'sciany.nazwa_sc', 'sufit.nazwa_su', 'wyposazenie.nazwa_wp', 'typ_wc.nazwa_wc', 'podlogi.nazwa_pod', 
'sciany.nazwa_sc', 'sufit.nazwa_su', 'wyposazenie.nazwa_wp', 'podlogi.nazwa_pod', 'sciany.nazwa_sc', 'sufit.nazwa_su', 'wyposazenie.nazwa_wp', 'typ_balkonu.nazwa_ba', 'sciany.nazwa_sc', 
'podlogi.nazwa_pod'] where nazwa_tab = 'tab_dom' or nazwa_tab = 'tab_dom_w';
update tab_rodzaju_ofe set komorka_slow_tabela_pom = ARRAY['_pokoj.12', '_pokoj.12', '_pokoj.12', '_pokoj.12', '_kuchnia.3', '_kuchnia.3', '_kuchnia.3', '_kuchnia.3', 
'_kuchnia.3', '_kuchnia.3', '_lazienka.3', '_lazienka.3', '_lazienka.3', '_lazienka.3', '_toaleta.3', '_toaleta.3', '_toaleta.3', '_toaleta.3', '_toaleta.3', 
'_przedpokoj.3', '_przedpokoj.3', '_przedpokoj.3', '_przedpokoj.3', '_balkon.3', '_balkon.3', '_balkon.3'] where nazwa_tab = 'tab_dom' or nazwa_tab = 'tab_dom_w'; ---ilosc powtorzen podana po kropce


update tab_rodzaju_ofe set komorka_param_pom = ARRAY['pp', 'kp', 'pl', 'pwc', 'pprz', 'pb'] where nazwa_tab = 'tab_dom' or nazwa_tab = 'tab_dom_w'; ---12 powtorzen z reguly
update tab_rodzaju_ofe set komorka_param_pom_nazwa = ARRAY['_powierzchnia', '_powierzchnia', '_powierzchnia', '_powierzchnia', '_powierzchnia', '_powierzchnia'] where nazwa_tab = 'tab_dom' or nazwa_tab = 'tab_dom_w';
update tab_rodzaju_ofe set komorka_param_tabela_pom = ARRAY['_pokoj.12', '_kuchnia.3', '_lazienka.3', '_toaleta.3', '_przedpokoj.3', '_balkon.3'] where nazwa_tab = 'tab_dom' or nazwa_tab = 'tab_dom_w';

---update tab_rodzaju_ofe set komorka_yesno_pom = ARRAY[] where nazwa_tab = 'tab_dom';
---update tab_rodzaju_ofe set komorka_yesno_pom_nazwa = ARRAY[] where nazwa_tab = 'tab_dom';
---update tab_rodzaju_ofe set komorka_yesno_tag_pom = ARRAY[] where nazwa_tab = 'tab_dom';


---konfiguracja dla tabeli obiektu - parametry i wyposazenia
update tab_rodzaju_ofe set komorka_param = ARRAY['powuzyt_d', 'powcal_d', 'powdzi_d', 'powpom_d', 'powpomg_d', 'powpoms_d', 'lpom_d', 'lpomg_d', 'lpoms_d', 
'lkond', 'wysop_d', 'rok_d', 'szdzi_d', 'dldz_d', 'powgror', 'powpast', 'powlaka', 'powlasy', 'pownieuzy', 'powgrin'] where nazwa_tab = 'tab_obi' or nazwa_tab = 'tab_obi_w';
update tab_rodzaju_ofe set komorka_param_tag = ARRAY['_powierzchnia_uzytkowa', '_powierzchnia_calkowita', '_powierzchnia_dzialki', '_powierzchnia_pomieszczen', 
'_powierzchnia_pom_gospodarczych', '_powierzchnia_pom_socjalnych', '_liczba_pomieszczen', '_liczba_pom_gospodarczych', '_liczba_pom_socjalnych', '_liczba_kondygnacji', 
'_wysokosc_oplat', '_rok_budowy', '_szerokosc', '_dlugosc', '_pow_grunt_orny', '_pow_pastwisko', '_pow_laka', '_pow_las', '_pow_nieuzytki', '_pow_grunt_inny'] where nazwa_tab = 'tab_obi' or nazwa_tab = 'tab_obi_w';


update tab_rodzaju_ofe set komorka_yesno = ARRAY['kw_d', 'dzinar_d', 'dziogr_d', 'sila_d', 'wod_d', 'tel_d', 'siecka_d', 'antena_d', 'siecint_d', 'ochr_d', 'domof_d', 'drzwant_d', 
'rol_d', 'kv_d', 'alar_d', 'okant_d', 'klim_d', 'mip_d', 'udog_d', 'resta_d', 'bank_d', 'cenha_d', 'las_d', 'park_d', 'rzeka_d', 'jezioro_d', 'staw_d', 'gory_d', 'kra_d', 'rec_d'] where nazwa_tab = 'tab_obi' or nazwa_tab = 'tab_obi_w';
update tab_rodzaju_ofe set komorka_yesno_tag = ARRAY['_ksiega_wieczysta', '_dzialka_narozna', '_dzialka_ogrodzona', '_sila', '_woda', '_telefon', '_kablowa', '_antena', '_siec_internet', 
'_ochrona', '_domofon', '_drzwi_antywlamaniowe', '_rolety', '_kamery', '_alarm', '_okna_anty', '_klimatyzacja', '_parking', '_udogodnienia_niepelno', '_restauracja', '_bank', '_centrumhandlowe', 
'_las', '_park', '_rzeka', '_jezioro', '_staw', '_gory', '_kraty', '_recepcja'] where nazwa_tab = 'tab_obi' or nazwa_tab = 'tab_obi_w';


update tab_rodzaju_ofe set komorka_slow = ARRAY['spr_d._stan_prawny', 'spr_dz._stan_prawny_dzialka', 'teb_d._technologia_budowlana', 'mat_d._material_budowlany', 'kdach_d._dach', 'wo_d._wystawka_okien', 
'ksdzi_d._dzialka', 'uksz_d._uksztaltowanie_dzialka', 'zaddzi_d._zadrzewienie_dzialka', 'ogrz_d._ogrzewanie', 'ciewod_d._ciepla_woda', 'gaz_d._gaz', 'kanal_d._kanalizacja', 'tdr_d._typ_ulicy', 
'ndr_d._nawierzchnia', 'kmod_d._komunikacja', 'std_d._standard', 'sta_d._stan', 'moprz_d._przeksztalcenie'] where nazwa_tab = 'tab_obi' or nazwa_tab = 'tab_obi_w';
update tab_rodzaju_ofe set komorka_slow_tabela = ARRAY['stan_pr.nazwa_pr', 'stan_pr.nazwa_pr', 'techno_b.nazwat_b', 'material_b.nazwa_m', 'dach.nazwa_da', 'wystawka_o.nazwa_wy', 'dzialka.nazwa_dz', 
'dzialka_uk.nazwa_uk', 'dzialka_za.nazwa_za', 'ogrzewanie.nazwa_grz', 'ciepla_woda.nazwa_wo', 'gaz.nazwa_g', 'kanaliza.nazwa_ka', 'typ_ulicy.nazwa_ul', 'nawierzchnia.nazwa_na', 'komunikacja.nazwa_kom', 
'standard.nazwa_stan', 'stan.nazwa_sst', 'przeksztalcenie.nazwa_przek'] where nazwa_tab = 'tab_obi' or nazwa_tab = 'tab_obi_w';


---konfiguracja dla tabeli obiektu - pomieszczenia : parametry i wyposazenia

update tab_rodzaju_ofe set komorka_slow_pom = ARRAY['pop', 'ps', 'psu', 'wyp', 'popb', 'psb', 'psub', 'wypb', 'pops', 'pss', 'psus', 'wyps'] where nazwa_tab = 'tab_obi' or nazwa_tab = 'tab_obi_w'; ---12 powtorzen z reguly
update tab_rodzaju_ofe set komorka_slow_pom_nazwa = ARRAY['podlogi.nazwa_pod', 'sciany.nazwa_sc', 'sufit.nazwa_su', 'wyposazenie.nazwa_wp', 'podlogi.nazwa_pod', 'sciany.nazwa_sc', 'sufit.nazwa_su', 
'wyposazenie.nazwa_wp', 'podlogi.nazwa_pod', 'sciany.nazwa_sc', 'sufit.nazwa_su', 'wyposazenie.nazwa_wp'] where nazwa_tab = 'tab_obi' or nazwa_tab = 'tab_obi_w';
update tab_rodzaju_ofe set komorka_slow_tabela_pom = ARRAY['_pomieszczeniegospodarcze.12', '_pomieszczeniegospodarcze.12', '_pomieszczeniegospodarcze.12', '_pomieszczeniegospodarcze.12', 
'_pomieszczeniebiurowe.12', '_pomieszczeniebiurowe.12', '_pomieszczeniebiurowe.12', '_pomieszczeniebiurowe.12', '_pomieszczeniesocjalne.12', '_pomieszczeniesocjalne.12', '_pomieszczeniesocjalne.12', 
'_pomieszczeniesocjalne.12'] where nazwa_tab = 'tab_obi' or nazwa_tab = 'tab_obi_w'; ---ilosc powtorzen podana po kropce



update tab_rodzaju_ofe set komorka_param_pom = ARRAY['pp', 'ppb', 'pps', 'powstaj', 'powstod', 'powobor', 'powkurn', 'powowcza', 'powchle'] where nazwa_tab = 'tab_obi' or nazwa_tab = 'tab_obi_w'; ---12 powtorzen z reguly
update tab_rodzaju_ofe set komorka_param_pom_nazwa = ARRAY['_powierzchnia', '_powierzchnia', '_powierzchnia', '_powierzchnia', '_powierzchnia', '_powierzchnia', '_powierzchnia', '_powierzchnia', 
'_powierzchnia'] where nazwa_tab = 'tab_obi' or nazwa_tab = 'tab_obi_w';
update tab_rodzaju_ofe set komorka_param_tabela_pom = ARRAY['_pomieszczeniegospodarcze.12', '_pomieszczeniebiurowe.12', '_pomieszczeniesocjalne.12', '_stajnia.1', '_stodola.1', '_obora.1', 
'_kurnik.1', '_owczarnia.1', '_chlewnia.1'] where nazwa_tab = 'tab_obi' or nazwa_tab = 'tab_obi_w';

---update tab_rodzaju_ofe set komorka_yesno_pom = ARRAY[] where nazwa_tab = 'tab_dom';
---update tab_rodzaju_ofe set komorka_yesno_pom_nazwa = ARRAY[] where nazwa_tab = 'tab_dom';
---update tab_rodzaju_ofe set komorka_yesno_tag_pom = ARRAY[] where nazwa_tab = 'tab_dom';

---konfiguracja dla tabeli lokalu - parametry i wyposazenia
update tab_rodzaju_ofe set komorka_param = ARRAY['powuzyt_d', 'powcal_d', 'powdzi_d', 'powpom_d', 'powwit_d', 'powpomg_d', 'powpoms_d', 'lpom_d', 'lwit_d', 'lpomg_d', 'lpoms_d', 
'wysop_d', 'rok_d', 'szdzi_d', 'dldz_d'] where nazwa_tab = 'tab_lok' or nazwa_tab = 'tab_lok_w';
update tab_rodzaju_ofe set komorka_param_tag = ARRAY['_powierzchnia_uzytkowa', '_powierzchnia_calkowita', '_powierzchnia_dzialki', '_powierzchnia_pomieszczen', '_powierzchnia_witryny', 
'_powierzchnia_pom_gospodarczych', '_powierzchnia_pom_socjalnych', '_liczba_pomieszczen', '_liczba_witryn', '_liczba_pom_gospodarczych', '_liczba_pom_socjalnych', 
'_wysokosc_oplat', '_rok_budowy', '_szerokosc', '_dlugosc'] where nazwa_tab = 'tab_lok' or nazwa_tab = 'tab_lok_w';

update tab_rodzaju_ofe set komorka_yesno = ARRAY['kw_d', 'dzinar_d', 'dziogr_d', 'sila_d', 'wod_d', 'tel_d', 'siecka_d', 'antena_d', 'siecint_d', 'ochr_d', 'domof_d', 'drzwant_d', 
'rol_d', 'kv_d', 'kra_d', 'alar_d', 'okant_d', 'klim_d', 'mip_d', 'udog_d', 'resta_d', 'bank_d', 'cenha_d', 'las_d', 'park_d', 'rzeka_d', 'jezioro_d', 'staw_d', 'gory_d', 
'rec_d'] where nazwa_tab = 'tab_lok' or nazwa_tab = 'tab_lok_w';
update tab_rodzaju_ofe set komorka_yesno_tag = ARRAY['_ksiega_wieczysta', '_dzialka_narozna', '_dzialka_ogrodzona', '_sila', '_woda', '_telefon', '_kablowa', '_antena', '_siec_internet', 
'_ochrona', '_domofon', '_drzwi_antywlamaniowe', '_rolety', '_kamery', '_kraty', '_alarm', '_okna_anty', '_klimatyzacja', '_parking', '_udogodnienia_niepelno', '_restauracja', '_bank', '_centrumhandlowe', 
'_las', '_park', '_rzeka', '_jezioro', '_staw', '_gory', '_recepcja'] where nazwa_tab = 'tab_lok' or nazwa_tab = 'tab_lok_w';

update tab_rodzaju_ofe set komorka_slow = ARRAY['spr_d._stan_prawny', 'spr_dz._stan_prawny_dzialka', 'teb_d._technologia_budowlana', 'mat_d._material_budowlany', 'kdach_d._dach', 'wo_d._wystawka_okien', 
'ksdzi_d._dzialka', 'uksz_d._uksztaltowanie_dzialka', 'zaddzi_d._zadrzewienie_dzialka', 'ogrz_d._ogrzewanie', 'ciewod_d._ciepla_woda', 'gaz_d._gaz', 'kanal_d._kanalizacja', 'tdr_d._typ_ulicy', 
'ndr_d._nawierzchnia', 'kmod_d._komunikacja', 'std_d._standard', 'sta_d._stan', 'moprz_d._przeksztalcenie'] where nazwa_tab = 'tab_lok' or nazwa_tab = 'tab_lok_w';
update tab_rodzaju_ofe set komorka_slow_tabela = ARRAY['stan_pr.nazwa_pr', 'stan_pr.nazwa_pr', 'techno_b.nazwat_b', 'material_b.nazwa_m', 'dach.nazwa_da', 'wystawka_o.nazwa_wy', 'dzialka.nazwa_dz', 
'dzialka_uk.nazwa_uk', 'dzialka_za.nazwa_za', 'ogrzewanie.nazwa_grz', 'ciepla_woda.nazwa_wo', 'gaz.nazwa_g', 'kanaliza.nazwa_ka', 'typ_ulicy.nazwa_ul', 'nawierzchnia.nazwa_na', 'komunikacja.nazwa_kom', 
'standard.nazwa_stan', 'stan.nazwa_sst', 'przeksztalcenie.nazwa_przek'] where nazwa_tab = 'tab_lok' or nazwa_tab = 'tab_lok_w';


---konfiguracja dla tabeli lokalu - pomieszczenia : parametry i wyposazenia

update tab_rodzaju_ofe set komorka_slow_pom = ARRAY['pop', 'ps', 'psu', 'wyp', 'popb', 'psb', 'psub', 'wypb', 'pops', 'pss', 'psus', 'wyps'] where nazwa_tab = 'tab_lok' or nazwa_tab = 'tab_lok_w'; ---12 powtorzen z reguly
update tab_rodzaju_ofe set komorka_slow_pom_nazwa = ARRAY['podlogi.nazwa_pod', 'sciany.nazwa_sc', 'sufit.nazwa_su', 'wyposazenie.nazwa_wp', 'podlogi.nazwa_pod', 'sciany.nazwa_sc', 'sufit.nazwa_su', 
'wyposazenie.nazwa_wp', 'podlogi.nazwa_pod', 'sciany.nazwa_sc', 'sufit.nazwa_su', 'wyposazenie.nazwa_wp'] where nazwa_tab = 'tab_lok' or nazwa_tab = 'tab_lok_w';
update tab_rodzaju_ofe set komorka_slow_tabela_pom = ARRAY['_pomieszczeniegospodarcze.12', '_pomieszczeniegospodarcze.12', '_pomieszczeniegospodarcze.12', '_pomieszczeniegospodarcze.12', 
'_pomieszczeniebiurowe.12', '_pomieszczeniebiurowe.12', '_pomieszczeniebiurowe.12', '_pomieszczeniebiurowe.12', '_pomieszczeniesocjalne.12', '_pomieszczeniesocjalne.12', '_pomieszczeniesocjalne.12', 
'_pomieszczeniesocjalne.12'] where nazwa_tab = 'tab_lok' or nazwa_tab = 'tab_lok_w'; ---ilosc powtorzen podana po kropce



update tab_rodzaju_ofe set komorka_param_pom = ARRAY['pp', 'ppb', 'pps'] where nazwa_tab = 'tab_lok' or nazwa_tab = 'tab_lok_w'; ---12 powtorzen z reguly
update tab_rodzaju_ofe set komorka_param_pom_nazwa = ARRAY['_powierzchnia', '_powierzchnia', '_powierzchnia'] where nazwa_tab = 'tab_lok' or nazwa_tab = 'tab_lok_w';
update tab_rodzaju_ofe set komorka_param_tabela_pom = ARRAY['_pomieszczeniegospodarcze.12', '_pomieszczeniebiurowe.12', '_pomieszczeniesocjalne.12'] where nazwa_tab = 'tab_lok' or nazwa_tab = 'tab_lok_w';

---update tab_rodzaju_ofe set komorka_yesno_pom = ARRAY[] where nazwa_tab = 'tab_dom';
---update tab_rodzaju_ofe set komorka_yesno_pom_nazwa = ARRAY[] where nazwa_tab = 'tab_dom';
---update tab_rodzaju_ofe set komorka_yesno_tag_pom = ARRAY[] where nazwa_tab = 'tab_dom';

---konfiguracja dla tabeli dzialki - parametry i wyposazenia
update tab_rodzaju_ofe set komorka_param = ARRAY['powdzi_d', 'wysop_d', 'szdzi_d', 'dldz_d'] where nazwa_tab = 'tab_dzi' or nazwa_tab = 'tab_dzi_w';
update tab_rodzaju_ofe set komorka_param_tag = ARRAY['_powierzchnia_uzytkowa', '_wysokosc_oplat', '_szerokosc', '_dlugosc'] where nazwa_tab = 'tab_dzi' or nazwa_tab = 'tab_dzi_w'; ---tu ewentualnie ewryfikacja jakie sa powierzchnie dzialek

update tab_rodzaju_ofe set komorka_yesno = ARRAY['kw_d', 'dzinar_d', 'dziogr_d', 'pra_d', 'sila_d', 'wod_d', 'tel_d', 'siecka_d', 'antena_d', 'siecint_d', 'las_d', 'park_d', 'rzeka_d', 'jezioro_d', 
'staw_d', 'gory_d', 'mozpod', 'usl_d', 'przem_d', 'bdj_d', 'bdjs_d', 'bw_d', 'pnab_d', 'odrol_d'] where nazwa_tab = 'tab_dzi' or nazwa_tab = 'tab_dzi_w';
update tab_rodzaju_ofe set komorka_yesno_tag = ARRAY['_ksiega_wieczysta', '_dzialka_narozna', '_dzialka_ogrodzona', '_prad', '_sila', '_woda', '_telefon', '_kablowa', '_antena', '_siec_internet', 
'_las', '_park', '_rzeka', '_jezioro', '_staw', '_gory', '_mozliwosc_podzial', '_uslugi', '_przemysl', '_budownictwo_jednorodzinne_ind', '_budownictwo_jednorodzinne_szer', 
'_budownictwo_wielorodzinne', '_pozwolenie_na_bud', '_odrolniona'] where nazwa_tab = 'tab_dzi' or nazwa_tab = 'tab_dzi_w';

update tab_rodzaju_ofe set komorka_slow = ARRAY['spr_dz._stan_prawny_dzialka', 'ksdzi_d._dzialka', 'uksz_d._uksztaltowanie_dzialka', 'zaddzi_d._zadrzewienie_dzialka', 'ogrz_d._ogrzewanie', 
'ciewod_d._ciepla_woda', 'gaz_d._gaz', 'kanal_d._kanalizacja', 'tdr_d._typ_ulicy', 'ndr_d._nawierzchnia', 'kmod_d._komunikacja', 'polo_d._polozenie'] where nazwa_tab = 'tab_dzi' or nazwa_tab = 'tab_dzi_w';
update tab_rodzaju_ofe set komorka_slow_tabela = ARRAY['stan_pr.nazwa_pr', 'dzialka.nazwa_dz', 'dzialka_uk.nazwa_uk', 'dzialka_za.nazwa_za', 'ogrzewanie.nazwa_grz', 'ciepla_woda.nazwa_wo', 
'gaz.nazwa_g', 'kanaliza.nazwa_ka', 'typ_ulicy.nazwa_ul', 'nawierzchnia.nazwa_na', 'komunikacja.nazwa_kom', 'polo.nazwa_po'] where nazwa_tab = 'tab_dzi' or nazwa_tab = 'tab_dzi_w';

---konfiguracja dla tabeli terenu - parametry i wyposazenia
update tab_rodzaju_ofe set komorka_param = ARRAY['powdzi_d', 'wysop_d', 'szdzi_d', 'dldz_d'] where nazwa_tab = 'tab_te' or nazwa_tab = 'tab_te_w';
update tab_rodzaju_ofe set komorka_param_tag = ARRAY['_powierzchnia_uzytkowa', '_wysokosc_oplat', '_szerokosc', '_dlugosc'] where nazwa_tab = 'tab_te' or nazwa_tab = 'tab_te_w';

update tab_rodzaju_ofe set komorka_yesno = ARRAY['kw_d', 'dzinar_d', 'dziogr_d', 'pra_d', 'sila_d', 'wod_d', 'tel_d', 'siecka_d', 'antena_d', 'siecint_d', 'las_d', 'park_d', 'rzeka_d', 'jezioro_d', 
'staw_d', 'gory_d', 'mozpod', 'usl_d', 'przem_d', 'bdj_d', 'bdjs_d', 'bw_d', 'pnab_d', 'odrol_d'] where nazwa_tab = 'tab_te' or nazwa_tab = 'tab_te_w';
update tab_rodzaju_ofe set komorka_yesno_tag = ARRAY['_ksiega_wieczysta', '_dzialka_narozna', '_dzialka_ogrodzona', '_prad', '_sila', '_woda', '_telefon', '_kablowa', '_antena', '_siec_internet', 
'_las', '_park', '_rzeka', '_jezioro', '_staw', '_gory', '_mozliwosc_podzial', '_uslugi', '_przemysl', '_budownictwo_jednorodzinne_ind', '_budownictwo_jednorodzinne_szer', 
'_budownictwo_wielorodzinne', '_pozwolenie_na_bud', '_odrolniona'] where nazwa_tab = 'tab_te' or nazwa_tab = 'tab_te_w';

update tab_rodzaju_ofe set komorka_slow = ARRAY['spr_dz._stan_prawny_dzialka', 'ksdzi_d._dzialka', 'uksz_d._uksztaltowanie_dzialka', 'zaddzi_d._zadrzewienie_dzialka', 'ogrz_d._ogrzewanie', 
'ciewod_d._ciepla_woda', 'gaz_d._gaz', 'kanal_d._kanalizacja', 'tdr_d._typ_ulicy', 'ndr_d._nawierzchnia', 'kmod_d._komunikacja', 'polo_d._polozenie'] where nazwa_tab = 'tab_te' or nazwa_tab = 'tab_te_w';
update tab_rodzaju_ofe set komorka_slow_tabela = ARRAY['stan_pr.nazwa_pr', 'dzialka.nazwa_dz', 'dzialka_uk.nazwa_uk', 'dzialka_za.nazwa_za', 'ogrzewanie.nazwa_grz', 'ciepla_woda.nazwa_wo', 
'gaz.nazwa_g', 'kanaliza.nazwa_ka', 'typ_ulicy.nazwa_ul', 'nawierzchnia.nazwa_na', 'komunikacja.nazwa_kom', 'polo.nazwa_po'] where nazwa_tab = 'tab_te' or nazwa_tab = 'tab_te_w';


alter table tab_rodzaju_ofe_w add column dane_pomocnicze text[];
alter table tab_rodzaju_ofe_w add column param_min text[];
alter table tab_rodzaju_ofe_w add column param_max text[];
---dorobic pod parametry 2 kolumny, lub jedna :P: 2 na min i max, komorka od nazwy oddzielana np ; lub .
---dane do tabeli tab_kl
update tab_rodzaju_ofe_w set dane_pomocnicze = ARRAY['doceny_km', 'wys_prow_kup', '_mieszkanie', '_sprzedaz', 'lok_km', 'miej_km', 'dzul_km', 'stand_km', 'dodinfo_km', 'l_pok', '_km', '6'] where nazwa_tab = 'tab_mie';
update tab_rodzaju_ofe_w set dane_pomocnicze = ARRAY['doceny_kd', 'wys_prow_kup', '_dom', '_sprzedaz', 'lok_kd', 'miej_kd', 'dzul_kd', 'stand_kd', 'dodinfo_kd', 'rodzd', '_kd', '6', 'rodzaj_of'] where nazwa_tab = 'tab_dom';
update tab_rodzaju_ofe_w set dane_pomocnicze = ARRAY['doceny_kl', 'wys_prow_kup', '_lokal', '_sprzedaz', 'lok_kl', 'miej_kl', 'dzul_kl', 'stand_kl', 'dodinfo_kl', 'rodzl', '_kl', '6', 'rodzaj_of_lok'] where nazwa_tab = 'tab_lok';
update tab_rodzaju_ofe_w set dane_pomocnicze = ARRAY['doceny_ko', 'wys_prow_kup', '_obiekt', '_sprzedaz', 'lok_ko', 'miej_ko', 'dzul_ko', 'stand_ko', 'dodinfo_ko', 'rodzo', '_ko', '9', 'rodzaj_of_obi'] where nazwa_tab = 'tab_obi';
update tab_rodzaju_ofe_w set dane_pomocnicze = ARRAY['doceny_kdz', 'wys_prow_kup', '_dzialka', '_sprzedaz', 'lok_kdz', 'miej_kdz', 'dzul_kdz', 'stand_kdz', 'dodinfo_kdz', 'rodzdz', '_kdz', '5', 'rodzaj_of_dzi'] where nazwa_tab = 'tab_dzi';
update tab_rodzaju_ofe_w set dane_pomocnicze = ARRAY['doceny_kte', 'wys_prow_kup', '_teren', '_sprzedaz', 'lok_kte', 'miej_kte', 'dzul_kte', 'stand_kte', 'dodinfo_kte', 'rodzte', '_kte', '5', 'rodzaj_of_te'] where nazwa_tab = 'tab_te';
update tab_rodzaju_ofe_w set dane_pomocnicze = ARRAY['doceny_wm', 'wys_prow_wyn', '_mieszkanie', '_wynajem', 'lok_wm', 'miej_wm', 'dzul_wm', 'stand_wm', 'dodinfo_wm', 'l_pok', '_wm', '6'] where nazwa_tab = 'tab_mie_w';
update tab_rodzaju_ofe_w set dane_pomocnicze = ARRAY['doceny_wd', 'wys_prow_wyn', '_dom', '_wynajem', 'lok_wd', 'miej_wd', 'dzul_wd', 'stand_wd', 'dodinfo_wd', 'rodzd', '_wd', '6', 'rodzaj_of'] where nazwa_tab = 'tab_dom_w';
update tab_rodzaju_ofe_w set dane_pomocnicze = ARRAY['doceny_wl', 'wys_prow_wyn', '_lokal', '_wynajem', 'lok_wl', 'miej_wl', 'dzul_wl', 'stand_wl', 'dodinfo_wl', 'rodzl', '_wl', '6', 'rodzaj_of_lok'] where nazwa_tab = 'tab_lok_w';
update tab_rodzaju_ofe_w set dane_pomocnicze = ARRAY['doceny_wo', 'wys_prow_wyn', '_obiekt', '_wynajem', 'lok_wo', 'miej_wo', 'dzul_wo', 'stand_wo', 'dodinfo_wo', 'rodzo', '_wo', '9', 'rodzaj_of_obi'] where nazwa_tab = 'tab_obi_w';
update tab_rodzaju_ofe_w set dane_pomocnicze = ARRAY['doceny_wdz', 'wys_prow_wyn', '_dzialka', '_wynajem', 'lok_wdz', 'miej_wdz', 'dzul_wdz', 'stand_wdz', 'dodinfo_wdz', 'rodzdz', '_wdz', '5', 'rodzaj_of_dzi'] where nazwa_tab = 'tab_dzi_w';
update tab_rodzaju_ofe_w set dane_pomocnicze = ARRAY['doceny_wte', 'wys_prow_wyn', '_teren', '_wynajem', 'lok_wte', 'miej_wte', 'dzul_wte', 'stand_wte', 'dodinfo_wte', 'rodzte', '_wte', '5', 'rodzaj_of_te'] where nazwa_tab = 'tab_te_w';

update tab_rodzaju_ofe_w set param_min = ARRAY['odpow_km._powierzchnia_uzytkowa'] where nazwa_tab = 'tab_mie';
update tab_rodzaju_ofe_w set param_min = ARRAY['odpow_kd._powierzchnia_uzytkowa', 'odpowdz_kd._powierzchnia_dzialki'] where nazwa_tab = 'tab_dom';
update tab_rodzaju_ofe_w set param_min = ARRAY['odpow_kl._powierzchnia_uzytkowa', 'odpowdz_kl._powierzchnia_dzialki'] where nazwa_tab = 'tab_lok';
update tab_rodzaju_ofe_w set param_min = ARRAY['odpow_ko._powierzchnia_uzytkowa', 'odpowdz_ko._powierzchnia_dzialki'] where nazwa_tab = 'tab_obi';
update tab_rodzaju_ofe_w set param_min = ARRAY['odpowdz_kdz._powierzchnia_dzialki'] where nazwa_tab = 'tab_dzi';
update tab_rodzaju_ofe_w set param_min = ARRAY['odpowdz_kte._powierzchnia_dzialki'] where nazwa_tab = 'tab_te';
update tab_rodzaju_ofe_w set param_min = ARRAY['odpow_wm._powierzchnia_uzytkowa'] where nazwa_tab = 'tab_mie_w';
update tab_rodzaju_ofe_w set param_min = ARRAY['odpow_wd._powierzchnia_uzytkowa', 'odpowdz_wd._powierzchnia_dzialki'] where nazwa_tab = 'tab_dom_w';
update tab_rodzaju_ofe_w set param_min = ARRAY['odpow_wl._powierzchnia_uzytkowa', 'odpowdz_wl._powierzchnia_dzialki'] where nazwa_tab = 'tab_lok_w';
update tab_rodzaju_ofe_w set param_min = ARRAY['odpow_wo._powierzchnia_uzytkowa', 'odpowdz_wo._powierzchnia_dzialki'] where nazwa_tab = 'tab_obi_w';
update tab_rodzaju_ofe_w set param_min = ARRAY['odpowdz_wdz._powierzchnia_dzialki'] where nazwa_tab = 'tab_dzi_w';
update tab_rodzaju_ofe_w set param_min = ARRAY['odpowdz_wte._powierzchnia_dzialki'] where nazwa_tab = 'tab_te_w';

update tab_rodzaju_ofe_w set param_max = ARRAY['dopow_km._powierzchnia_uzytkowa'] where nazwa_tab = 'tab_mie';
update tab_rodzaju_ofe_w set param_max = ARRAY['dopow_kd._powierzchnia_uzytkowa', 'dopowdz_kd._powierzchnia_dzialki'] where nazwa_tab = 'tab_dom';
update tab_rodzaju_ofe_w set param_max = ARRAY['dopow_kl._powierzchnia_uzytkowa', 'dopowdz_kl._powierzchnia_dzialki'] where nazwa_tab = 'tab_lok';
update tab_rodzaju_ofe_w set param_max = ARRAY['dopow_ko._powierzchnia_uzytkowa', 'dopowdz_ko._powierzchnia_dzialki'] where nazwa_tab = 'tab_obi';
update tab_rodzaju_ofe_w set param_max = ARRAY['dopowdz_kdz._powierzchnia_dzialki'] where nazwa_tab = 'tab_dzi';
update tab_rodzaju_ofe_w set param_max = ARRAY['dopowdz_kte._powierzchnia_dzialki'] where nazwa_tab = 'tab_te';
update tab_rodzaju_ofe_w set param_max = ARRAY['dopow_wm._powierzchnia_uzytkowa'] where nazwa_tab = 'tab_mie_w';
update tab_rodzaju_ofe_w set param_max = ARRAY['dopow_wd._powierzchnia_uzytkowa', 'dopowdz_wd._powierzchnia_dzialki'] where nazwa_tab = 'tab_dom_w';
update tab_rodzaju_ofe_w set param_max = ARRAY['dopow_wl._powierzchnia_uzytkowa', 'dopowdz_wl._powierzchnia_dzialki'] where nazwa_tab = 'tab_lok_w';
update tab_rodzaju_ofe_w set param_max = ARRAY['dopow_wo._powierzchnia_uzytkowa', 'dopowdz_wo._powierzchnia_dzialki'] where nazwa_tab = 'tab_obi_w';
update tab_rodzaju_ofe_w set param_max = ARRAY['dopowdz_wdz._powierzchnia_dzialki'] where nazwa_tab = 'tab_dzi_w';
update tab_rodzaju_ofe_w set param_max = ARRAY['dopowdz_wte._powierzchnia_dzialki'] where nazwa_tab = 'tab_te_w';

update tab_kl set status_k = 2 where status_k = 0;
update tab_mie set rb = 3 where rb = 0;