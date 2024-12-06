
---kuchnia
INSERT INTO wyposazenie_pom (wielokrotne, ma_dzieci, waga, id_sekcja, nazwa) values (true, true, 3, 2, '_wyposazenie_kuchni');
INSERT INTO lista_param_slow_pom (id_pomieszczenie, id_wyposazenie_pom) values ((select id from pomieszczenie where nazwa = '_kuchnia'), (select id from wyposazenie_pom where nazwa = '_wyposazenie_kuchni'));

UPDATE wyposazenie_pom set id_parent = (select id from wyposazenie_pom where nazwa = '_wyposazenie_kuchni') where nazwa in 
('_meble_kuchenne', '_m__kuchenne_pod_wymiar', '_m__kuchenne_sprzet_agd', '_sprzet_agd');

DELETE FROM lista_param_slow_pom where id = 40;

---koniec wyposazenia kuchni

---lazienka
INSERT INTO wyposazenie_pom (wielokrotne, ma_dzieci, waga, id_sekcja, nazwa) values (true, true, 3, 2, '_wyposazenie_lazienki');
INSERT INTO lista_param_slow_pom (id_pomieszczenie, id_wyposazenie_pom) values ((select id from pomieszczenie where nazwa = '_lazienka'), (select id from wyposazenie_pom where nazwa = '_wyposazenie_lazienki'));

UPDATE wyposazenie_pom set id_parent = (select id from wyposazenie_pom where nazwa = '_wyposazenie_lazienki') where nazwa in 
('_m__lazienkowe', '_m__lazienkowe_natrysk', '_m__laz__wanna_natrysk', '_m__lazienkowe_wanna', '_natrysk', '_natrysk___wanna', '_szafka___umywalka', '_umywalka', '_wanna');

DELETE FROM lista_param_slow_pom where id = 41;
---

----- prostowanie slownikow c.d. 06-11

select distinct id_pomieszczenie_przyn_nier from dane_slow_wyp_pom d1 where id_wyposazenie_pom in (57, 52) and (select count(id) from dane_slow_wyp_pom where id_pomieszczenie_przyn_nier = d1.id_pomieszczenie_przyn_nier and id_wyposazenie_pom in (52, 57)) > 1;
select distinct id_pomieszczenie_przyn_nier from dane_slow_wyp_pom d1 where id_wyposazenie_pom = 52 and (select count(id) from dane_slow_wyp_pom where id_pomieszczenie_przyn_nier = d1.id_pomieszczenie_przyn_nier and id_wyposazenie_pom in (52, 60)) > 1;


INSERT INTO dane_slow_wyp_pom (id_pomieszczenie_przyn_nier, id_wyposazenie_pom) select id_pomieszczenie_przyn_nier, 57 from dane_slow_wyp_pom where id_wyposazenie_pom = 52;
INSERT INTO dane_slow_wyp_pom (id_pomieszczenie_przyn_nier, id_wyposazenie_pom) select id_pomieszczenie_przyn_nier, 60 from dane_slow_wyp_pom where id_wyposazenie_pom = 52;

DELETE FROM dane_slow_wyp_pom where id_wyposazenie_pom = 52;
DELETE FROM wyposazenie_pom where id = 52;

----select oferta.id from oferta join pomieszczenie_przyn_nier on oferta.id_nieruchomosc = pomieszczenie_przyn_nier.id_nieruchomosc where pomieszczenie_przyn_nier.id = 3261;

----select distinct id_pomieszczenie_przyn_nier from dane_slow_wyp_pom d1 where id_wyposazenie_pom in (30, 25) and (select count(id) from dane_slow_wyp_pom where id_pomieszczenie_przyn_nier = d1.id_pomieszczenie_przyn_nier and id_wyposazenie_pom in (30, 25)) > 1;


---sprawdzenie, czy nie wystepuje kombinacja typu wpis gladz, kafle po czym sama gladz (***); w praktyce wyskakuja rekordy, gdzie po 2 razy jest gladz; 
---w zwiazku z powyzszym nalezaloby napisac zapytanie, ktore w danym pomieszczeniu szuka powielonych id ... ponizej sql atakujacy ten problem ... jest on dosc ciezki, ale skuteczny

select distinct id_pomieszczenie_przyn_nier from dane_slow_wyp_pom d1 where (select count(distinct id_wyposazenie_pom) from dane_slow_wyp_pom where id_pomieszczenie_przyn_nier = d1.id_pomieszczenie_przyn_nier) < (select count(id_wyposazenie_pom) from dane_slow_wyp_pom where id_pomieszczenie_przyn_nier = d1.id_pomieszczenie_przyn_nier);

---grupa naprawczych sql:
--select * from dane_slow_wyp_pom where id_pomieszczenie_przyn_nier = 143;
--DELETE FROM dane_slow_wyp_pom where id in (411, 413);

---***

--do wylotu kombinacja o id 23 - kafle gladz
select distinct id_pomieszczenie_przyn_nier from dane_slow_wyp_pom d1 where id_wyposazenie_pom in (23, 30) and (select count(id) from dane_slow_wyp_pom where id_pomieszczenie_przyn_nier = d1.id_pomieszczenie_przyn_nier and id_wyposazenie_pom in (23, 30)) > 1;
select distinct id_pomieszczenie_przyn_nier from dane_slow_wyp_pom d1 where id_wyposazenie_pom in (23, 34) and (select count(id) from dane_slow_wyp_pom where id_pomieszczenie_przyn_nier = d1.id_pomieszczenie_przyn_nier and id_wyposazenie_pom in (23, 34)) > 1;

INSERT INTO dane_slow_wyp_pom (id_pomieszczenie_przyn_nier, id_wyposazenie_pom) select id_pomieszczenie_przyn_nier, 30 from dane_slow_wyp_pom where id_wyposazenie_pom = 23;
INSERT INTO dane_slow_wyp_pom (id_pomieszczenie_przyn_nier, id_wyposazenie_pom) select id_pomieszczenie_przyn_nier, 34 from dane_slow_wyp_pom where id_wyposazenie_pom = 23;

DELETE FROM dane_slow_wyp_pom where id_wyposazenie_pom = 23;
DELETE FROM wyposazenie_pom where id = 23;

--do wylotu kombinacja o id 22 - tapeta gladz
select distinct id_pomieszczenie_przyn_nier from dane_slow_wyp_pom d1 where id_wyposazenie_pom in (22, 25) and (select count(id) from dane_slow_wyp_pom where id_pomieszczenie_przyn_nier = d1.id_pomieszczenie_przyn_nier and id_wyposazenie_pom in (22, 25)) > 1;
select distinct id_pomieszczenie_przyn_nier from dane_slow_wyp_pom d1 where id_wyposazenie_pom in (22, 34) and (select count(id) from dane_slow_wyp_pom where id_pomieszczenie_przyn_nier = d1.id_pomieszczenie_przyn_nier and id_wyposazenie_pom in (22, 34)) > 1;

INSERT INTO dane_slow_wyp_pom (id_pomieszczenie_przyn_nier, id_wyposazenie_pom) select id_pomieszczenie_przyn_nier, 25 from dane_slow_wyp_pom where id_wyposazenie_pom = 22;
INSERT INTO dane_slow_wyp_pom (id_pomieszczenie_przyn_nier, id_wyposazenie_pom) select id_pomieszczenie_przyn_nier, 34 from dane_slow_wyp_pom where id_wyposazenie_pom = 22;

DELETE FROM dane_slow_wyp_pom where id_wyposazenie_pom = 22;
DELETE FROM wyposazenie_pom where id = 22;

--do wylotu kombinacja o id 31 - kafle boazeria
select distinct id_pomieszczenie_przyn_nier from dane_slow_wyp_pom d1 where id_wyposazenie_pom in (31, 24) and (select count(id) from dane_slow_wyp_pom where id_pomieszczenie_przyn_nier = d1.id_pomieszczenie_przyn_nier and id_wyposazenie_pom in (31, 24)) > 1;
select distinct id_pomieszczenie_przyn_nier from dane_slow_wyp_pom d1 where id_wyposazenie_pom in (31, 30) and (select count(id) from dane_slow_wyp_pom where id_pomieszczenie_przyn_nier = d1.id_pomieszczenie_przyn_nier and id_wyposazenie_pom in (31, 30)) > 1;

INSERT INTO dane_slow_wyp_pom (id_pomieszczenie_przyn_nier, id_wyposazenie_pom) select id_pomieszczenie_przyn_nier, 24 from dane_slow_wyp_pom where id_wyposazenie_pom = 31;
INSERT INTO dane_slow_wyp_pom (id_pomieszczenie_przyn_nier, id_wyposazenie_pom) select id_pomieszczenie_przyn_nier, 30 from dane_slow_wyp_pom where id_wyposazenie_pom = 31;

DELETE FROM dane_slow_wyp_pom where id_wyposazenie_pom = 31;
DELETE FROM wyposazenie_pom where id = 31;

--do wylotu kombinacja o id 32 - tapeta 25 boazeria 24
select distinct id_pomieszczenie_przyn_nier from dane_slow_wyp_pom d1 where id_wyposazenie_pom in (32, 24) and (select count(id) from dane_slow_wyp_pom where id_pomieszczenie_przyn_nier = d1.id_pomieszczenie_przyn_nier and id_wyposazenie_pom in (32, 24)) > 1;
select distinct id_pomieszczenie_przyn_nier from dane_slow_wyp_pom d1 where id_wyposazenie_pom in (32, 25) and (select count(id) from dane_slow_wyp_pom where id_pomieszczenie_przyn_nier = d1.id_pomieszczenie_przyn_nier and id_wyposazenie_pom in (32, 25)) > 1;

INSERT INTO dane_slow_wyp_pom (id_pomieszczenie_przyn_nier, id_wyposazenie_pom) select id_pomieszczenie_przyn_nier, 24 from dane_slow_wyp_pom where id_wyposazenie_pom = 32;
INSERT INTO dane_slow_wyp_pom (id_pomieszczenie_przyn_nier, id_wyposazenie_pom) select id_pomieszczenie_przyn_nier, 25 from dane_slow_wyp_pom where id_wyposazenie_pom = 32;

DELETE FROM dane_slow_wyp_pom where id_wyposazenie_pom = 32;
DELETE FROM wyposazenie_pom where id = 32;

--do wylotu kombinacja o id 33 - kafle 30 tapeta 25
select distinct id_pomieszczenie_przyn_nier from dane_slow_wyp_pom d1 where id_wyposazenie_pom in (33, 30) and (select count(id) from dane_slow_wyp_pom where id_pomieszczenie_przyn_nier = d1.id_pomieszczenie_przyn_nier and id_wyposazenie_pom in (33, 30)) > 1;
select distinct id_pomieszczenie_przyn_nier from dane_slow_wyp_pom d1 where id_wyposazenie_pom in (33, 25) and (select count(id) from dane_slow_wyp_pom where id_pomieszczenie_przyn_nier = d1.id_pomieszczenie_przyn_nier and id_wyposazenie_pom in (33, 25)) > 1;

INSERT INTO dane_slow_wyp_pom (id_pomieszczenie_przyn_nier, id_wyposazenie_pom) select id_pomieszczenie_przyn_nier, 30 from dane_slow_wyp_pom where id_wyposazenie_pom = 33;
INSERT INTO dane_slow_wyp_pom (id_pomieszczenie_przyn_nier, id_wyposazenie_pom) select id_pomieszczenie_przyn_nier, 25 from dane_slow_wyp_pom where id_wyposazenie_pom = 33;

DELETE FROM dane_slow_wyp_pom where id_wyposazenie_pom = 33;
DELETE FROM wyposazenie_pom where id = 33;

--do wylotu kombinacja o id 63 - natrysk 62 wanna 70

select distinct id_pomieszczenie_przyn_nier from dane_slow_wyp_pom d1 where id_wyposazenie_pom in (63, 62) and (select count(id) from dane_slow_wyp_pom where id_pomieszczenie_przyn_nier = d1.id_pomieszczenie_przyn_nier and id_wyposazenie_pom in (63, 62)) > 1;
select distinct id_pomieszczenie_przyn_nier from dane_slow_wyp_pom d1 where id_wyposazenie_pom in (63, 70) and (select count(id) from dane_slow_wyp_pom where id_pomieszczenie_przyn_nier = d1.id_pomieszczenie_przyn_nier and id_wyposazenie_pom in (63, 70)) > 1;

INSERT INTO dane_slow_wyp_pom (id_pomieszczenie_przyn_nier, id_wyposazenie_pom) select id_pomieszczenie_przyn_nier, 62 from dane_slow_wyp_pom where id_wyposazenie_pom = 63;
INSERT INTO dane_slow_wyp_pom (id_pomieszczenie_przyn_nier, id_wyposazenie_pom) select id_pomieszczenie_przyn_nier, 70 from dane_slow_wyp_pom where id_wyposazenie_pom = 63;

DELETE FROM dane_slow_wyp_pom where id_wyposazenie_pom = 63;
DELETE FROM wyposazenie_pom where id = 63;

---select distinct id_pomieszczenie_przyn_nier from dane_slow_wyp_pom d1 where id_wyposazenie_pom in (62, 70) and (select count(id) from dane_slow_wyp_pom where id_pomieszczenie_przyn_nier = d1.id_pomieszczenie_przyn_nier and id_wyposazenie_pom in (62, 70)) > 1;

--do wylotu kombinacja o id 54 - natrysk 62 m__lazienkowe 53

select distinct id_pomieszczenie_przyn_nier from dane_slow_wyp_pom d1 where id_wyposazenie_pom in (54, 62) and (select count(id) from dane_slow_wyp_pom where id_pomieszczenie_przyn_nier = d1.id_pomieszczenie_przyn_nier and id_wyposazenie_pom in (54, 62)) > 1;
select distinct id_pomieszczenie_przyn_nier from dane_slow_wyp_pom d1 where id_wyposazenie_pom in (54, 53) and (select count(id) from dane_slow_wyp_pom where id_pomieszczenie_przyn_nier = d1.id_pomieszczenie_przyn_nier and id_wyposazenie_pom in (54, 53)) > 1;

INSERT INTO dane_slow_wyp_pom (id_pomieszczenie_przyn_nier, id_wyposazenie_pom) select id_pomieszczenie_przyn_nier, 62 from dane_slow_wyp_pom where id_wyposazenie_pom = 54;
INSERT INTO dane_slow_wyp_pom (id_pomieszczenie_przyn_nier, id_wyposazenie_pom) select id_pomieszczenie_przyn_nier, 53 from dane_slow_wyp_pom where id_wyposazenie_pom = 54;

DELETE FROM dane_slow_wyp_pom where id_wyposazenie_pom = 54;
DELETE FROM wyposazenie_pom where id = 54;

--do wylotu kombinacja o id 56 - wanna 70 m__lazienkowe 53

select distinct id_pomieszczenie_przyn_nier from dane_slow_wyp_pom d1 where id_wyposazenie_pom in (56, 70) and (select count(id) from dane_slow_wyp_pom where id_pomieszczenie_przyn_nier = d1.id_pomieszczenie_przyn_nier and id_wyposazenie_pom in (56, 70)) > 1;
select distinct id_pomieszczenie_przyn_nier from dane_slow_wyp_pom d1 where id_wyposazenie_pom in (56, 53) and (select count(id) from dane_slow_wyp_pom where id_pomieszczenie_przyn_nier = d1.id_pomieszczenie_przyn_nier and id_wyposazenie_pom in (56, 53)) > 1;

INSERT INTO dane_slow_wyp_pom (id_pomieszczenie_przyn_nier, id_wyposazenie_pom) select id_pomieszczenie_przyn_nier, 70 from dane_slow_wyp_pom where id_wyposazenie_pom = 56;
INSERT INTO dane_slow_wyp_pom (id_pomieszczenie_przyn_nier, id_wyposazenie_pom) select id_pomieszczenie_przyn_nier, 53 from dane_slow_wyp_pom where id_wyposazenie_pom = 56;

DELETE FROM dane_slow_wyp_pom where id_wyposazenie_pom = 56;
DELETE FROM wyposazenie_pom where id = 56;

--do wylotu kombinacja o id 55 - wanna 70 m__lazienkowe 53 natrysk 62

select distinct id_pomieszczenie_przyn_nier from dane_slow_wyp_pom d1 where id_wyposazenie_pom in (55, 70) and (select count(id) from dane_slow_wyp_pom where id_pomieszczenie_przyn_nier = d1.id_pomieszczenie_przyn_nier and id_wyposazenie_pom in (55, 70)) > 1;
select distinct id_pomieszczenie_przyn_nier from dane_slow_wyp_pom d1 where id_wyposazenie_pom in (55, 53) and (select count(id) from dane_slow_wyp_pom where id_pomieszczenie_przyn_nier = d1.id_pomieszczenie_przyn_nier and id_wyposazenie_pom in (55, 53)) > 1;
select distinct id_pomieszczenie_przyn_nier from dane_slow_wyp_pom d1 where id_wyposazenie_pom in (55, 62) and (select count(id) from dane_slow_wyp_pom where id_pomieszczenie_przyn_nier = d1.id_pomieszczenie_przyn_nier and id_wyposazenie_pom in (55, 62)) > 1;

INSERT INTO dane_slow_wyp_pom (id_pomieszczenie_przyn_nier, id_wyposazenie_pom) select id_pomieszczenie_przyn_nier, 70 from dane_slow_wyp_pom where id_wyposazenie_pom = 55;
INSERT INTO dane_slow_wyp_pom (id_pomieszczenie_przyn_nier, id_wyposazenie_pom) select id_pomieszczenie_przyn_nier, 53 from dane_slow_wyp_pom where id_wyposazenie_pom = 55;
INSERT INTO dane_slow_wyp_pom (id_pomieszczenie_przyn_nier, id_wyposazenie_pom) select id_pomieszczenie_przyn_nier, 62 from dane_slow_wyp_pom where id_wyposazenie_pom = 55;

DELETE FROM dane_slow_wyp_pom where id_wyposazenie_pom = 55;
DELETE FROM wyposazenie_pom where id = 55;

--select distinct id_pomieszczenie_przyn_nier from dane_slow_wyp_pom d1 where id_wyposazenie_pom in (70, 53, 62) and (select count(id) from dane_slow_wyp_pom where id_pomieszczenie_przyn_nier = d1.id_pomieszczenie_przyn_nier and id_wyposazenie_pom in (70, 53, 62)) > 1;
--select oferta.id from oferta join pomieszczenie_przyn_nier on oferta.id_nieruchomosc = pomieszczenie_przyn_nier.id_nieruchomosc where pomieszczenie_przyn_nier.id = 