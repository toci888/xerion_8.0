select id from oferta where id_nieruchomosc in (select id_nieruchomosc from dane_slow_wyp_nier where id_wyposazenie_nier in (5) group by id_nieruchomosc having count(id_wyposazenie_nier) > 1) order by id asc;

--do wysmerfowania 2 - _grzanie_elektryczno___sloneczne; 6 elektr, 5 slon

select distinct id_nieruchomosc from dane_slow_wyp_nier d1 where id_wyposazenie_nier in (2, 5) and (select count(id) from dane_slow_wyp_nier where id_nieruchomosc = d1.id_nieruchomosc and id_wyposazenie_nier in (2, 5)) > 1;
select distinct id_nieruchomosc from dane_slow_wyp_nier d1 where id_wyposazenie_nier in (2, 6) and (select count(id) from dane_slow_wyp_nier where id_nieruchomosc = d1.id_nieruchomosc and id_wyposazenie_nier in (2, 6)) > 1;

INSERT INTO dane_slow_wyp_nier (id_nieruchomosc, id_wyposazenie_nier) select id_nieruchomosc, 5 from dane_slow_wyp_nier where id_wyposazenie_nier = 2;
INSERT INTO dane_slow_wyp_nier (id_nieruchomosc, id_wyposazenie_nier) select id_nieruchomosc, 6 from dane_slow_wyp_nier where id_wyposazenie_nier = 2;

DELETE FROM dane_slow_wyp_nier where id_wyposazenie_nier = 2;
DELETE FROM wyposazenie_nier where id = 2;

--do wysmerfowania 8 - _grzanie_gazowo___elektryczne; 6 elektr, 7 gaz

select distinct id_nieruchomosc from dane_slow_wyp_nier d1 where id_wyposazenie_nier in (8, 7) and (select count(id) from dane_slow_wyp_nier where id_nieruchomosc = d1.id_nieruchomosc and id_wyposazenie_nier in (8, 7)) > 1;
select distinct id_nieruchomosc from dane_slow_wyp_nier d1 where id_wyposazenie_nier in (8, 6) and (select count(id) from dane_slow_wyp_nier where id_nieruchomosc = d1.id_nieruchomosc and id_wyposazenie_nier in (8, 6)) > 1;

INSERT INTO dane_slow_wyp_nier (id_nieruchomosc, id_wyposazenie_nier) select id_nieruchomosc, 7 from dane_slow_wyp_nier where id_wyposazenie_nier = 8;
INSERT INTO dane_slow_wyp_nier (id_nieruchomosc, id_wyposazenie_nier) select id_nieruchomosc, 6 from dane_slow_wyp_nier where id_wyposazenie_nier = 8;

DELETE FROM dane_slow_wyp_nier where id_wyposazenie_nier = 8;
DELETE FROM wyposazenie_nier where id = 8;

--select distinct id_nieruchomosc from dane_slow_wyp_nier d1 where id_wyposazenie_nier in (7) and (select count(id) from dane_slow_wyp_nier where id_nieruchomosc = d1.id_nieruchomosc and id_wyposazenie_nier in (7)) > 1;

--do wysmerfowania 144 - _polnoc___poludnie; 143 polnoc, 140 poludnie
select distinct id_nieruchomosc from dane_slow_wyp_nier d1 where id_wyposazenie_nier in (144, 140) and (select count(id) from dane_slow_wyp_nier where id_nieruchomosc = d1.id_nieruchomosc and id_wyposazenie_nier in (144, 140)) > 1;
select distinct id_nieruchomosc from dane_slow_wyp_nier d1 where id_wyposazenie_nier in (144, 143) and (select count(id) from dane_slow_wyp_nier where id_nieruchomosc = d1.id_nieruchomosc and id_wyposazenie_nier in (144, 143)) > 1;

INSERT INTO dane_slow_wyp_nier (id_nieruchomosc, id_wyposazenie_nier) select id_nieruchomosc, 140 from dane_slow_wyp_nier where id_wyposazenie_nier = 144;
INSERT INTO dane_slow_wyp_nier (id_nieruchomosc, id_wyposazenie_nier) select id_nieruchomosc, 143 from dane_slow_wyp_nier where id_wyposazenie_nier = 144;

DELETE FROM dane_slow_wyp_nier where id_wyposazenie_nier = 144;
DELETE FROM wyposazenie_nier where id = 144;


--do wysmerfowania 148 - _wschod___zachod; 149 _zachod, 147 _wschod
select distinct id_nieruchomosc from dane_slow_wyp_nier d1 where id_wyposazenie_nier in (148, 147) and (select count(id) from dane_slow_wyp_nier where id_nieruchomosc = d1.id_nieruchomosc and id_wyposazenie_nier in (148, 147)) > 1;
select distinct id_nieruchomosc from dane_slow_wyp_nier d1 where id_wyposazenie_nier in (148, 149) and (select count(id) from dane_slow_wyp_nier where id_nieruchomosc = d1.id_nieruchomosc and id_wyposazenie_nier in (148, 149)) > 1;

INSERT INTO dane_slow_wyp_nier (id_nieruchomosc, id_wyposazenie_nier) select id_nieruchomosc, 147 from dane_slow_wyp_nier where id_wyposazenie_nier = 148;
INSERT INTO dane_slow_wyp_nier (id_nieruchomosc, id_wyposazenie_nier) select id_nieruchomosc, 149 from dane_slow_wyp_nier where id_wyposazenie_nier = 148;

DELETE FROM dane_slow_wyp_nier where id_wyposazenie_nier = 148;
DELETE FROM wyposazenie_nier where id = 148;