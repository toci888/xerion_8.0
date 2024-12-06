select * from osoba_klient where id_klient = 360;
select * from osoba where id = 360;
select * from osoba_adres where id = 360;
select * from osoba_dowod where id_osoba = 360;
---1196
select * from osoba_klient where id_klient = 1196;
select * from osoba where id = 2134;
select * from osoba_adres where id = 2134;
select * from osoba_dowod where id_osoba = 2134;

DELETE FROM osoba_dowod where id_osoba = 360;
DELETE FROM osoba_adres where id = 360;
DELETE FROM osoba_klient where id_osoba = 360;
DELETE FROM telefon where id_osoba = 360;
DELETE FROM komorka where id_osoba = 360;
update cena set id_osoba = 2134 where id_osoba = 360;
update osoba_oferta set id_osoba = 2134 where id_osoba = 360;
update wlasciciel set id_osoba = 2134 where id_osoba = 360;
DELETE FROM osoba where id = 360;

update nieruchomosc set id_klient = 1196 where id_klient = 360;
delete from klient where id = 360;

----------------------

select * from osoba_klient where id_klient = 770;
select * from osoba where id = 769;
select * from osoba_adres where id = 769;
select * from osoba_dowod where id_osoba = 769;
---1196
select * from osoba_klient where id_klient = 1411;
select * from osoba where id = 1805;
select * from osoba_adres where id = 1805;
select * from osoba_dowod where id_osoba = 1805;

DELETE FROM osoba_dowod where id_osoba = 769;
DELETE FROM osoba_adres where id = 769;
DELETE FROM osoba_klient where id_osoba = 769;
DELETE FROM telefon where id_osoba = 769;
DELETE FROM komorka where id_osoba = 769;
update cena set id_osoba = 1805 where id_osoba = 769;
update osoba_oferta set id_osoba = 1805 where id_osoba = 769;
update wlasciciel set id_osoba = 1805 where id_osoba = 769;
DELETE FROM osoba where id = 769;

update nieruchomosc set id_klient = 1411 where id_klient = 770;
delete from klient where id = 770;

------------of - zl

select * from osoba_klient where id_klient = 42;

select * from osoba_klient where id_klient = 2585;

DELETE FROM osoba_dowod where id_osoba = 42;
DELETE FROM osoba_adres where id = 42;
DELETE FROM osoba_klient where id_osoba = 42;
DELETE FROM telefon where id_osoba = 42;
DELETE FROM komorka where id_osoba = 42;
update cena set id_osoba = 2121 where id_osoba = 42;
update osoba_oferta set id_osoba = 2121 where id_osoba = 42;
update wlasciciel set id_osoba = 2121 where id_osoba = 42;
DELETE FROM osoba where id = 42;

update nieruchomosc set id_klient = 2585 where id_klient = 42;
---tu byl jeszcze delte z dane firma
delete from klient where id = 42;

-----------------zl - of

select * from osoba_klient where id_klient = 507;

select * from osoba_klient where id_klient = 1980;

DELETE FROM osoba_dowod where id_osoba = 1956;
DELETE FROM osoba_adres where id = 1956;
DELETE FROM osoba_klient where id_osoba = 1956;
DELETE FROM telefon where id_osoba = 1956;
DELETE FROM komorka where id_osoba = 1956;
update osoba_zapotrzebowanie set id_osoba = 506 where id_osoba = 1956;
DELETE FROM osoba where id = 1956;

update lista_wsk_adr set id_klient = 507 where id_klient = 1980;
update zapotrzebowanie set id_klient = 507 where id_klient = 1980;
delete from klient where id = 1980;

--------------------zl - of

select * from osoba_klient where id_klient = 564;
select * from osoba_klient where id_klient = 677;

select * from osoba_klient where id_klient = 2339;


DELETE FROM osoba_dowod where id_osoba = 1841;
DELETE FROM osoba_adres where id = 1841;
DELETE FROM osoba_klient where id_osoba = 1841;
DELETE FROM telefon where id_osoba = 1841;
DELETE FROM komorka where id_osoba = 1841;
update osoba_zapotrzebowanie set id_osoba = 563 where id_osoba = 1841;
DELETE FROM osoba where id = 1841;

update lista_wsk_adr set id_klient = 564 where id_klient = 2339;
update zapotrzebowanie set id_klient = 564 where id_klient = 2339;
delete from klient where id = 2339;


DELETE FROM osoba_dowod where id_osoba = 676;
DELETE FROM osoba_adres where id = 676;
DELETE FROM osoba_klient where id_osoba = 676;
DELETE FROM telefon where id_osoba = 676;
DELETE FROM komorka where id_osoba = 676;
update cena set id_osoba = 563 where id_osoba = 676;
update osoba_oferta set id_osoba = 563 where id_osoba = 676;
update wlasciciel set id_osoba = 563 where id_osoba = 676;
DELETE FROM osoba where id = 676;

update nieruchomosc set id_klient = 564 where id_klient = 677;
delete from klient where id = 677;

-----------------zl - of

select * from osoba_klient where id_klient = 34;

select * from osoba_klient where id_klient = 2504;

DELETE FROM osoba_dowod where id_osoba = 1022;
DELETE FROM osoba_adres where id = 1022;
DELETE FROM osoba_klient where id_osoba = 1022;
DELETE FROM telefon where id_osoba = 1022;
DELETE FROM komorka where id_osoba = 1022;
update osoba_zapotrzebowanie set id_osoba = 34 where id_osoba = 1022;
DELETE FROM osoba where id = 1022;

update lista_wsk_adr set id_klient = 34 where id_klient = 2504;
update zapotrzebowanie set id_klient = 34 where id_klient = 2504;
delete from klient where id = 2504;

------------of - zl

select * from osoba_klient where id_klient = 182;
select * from osoba_klient where id_klient = 186;

select * from osoba_klient where id_klient = 1576;

DELETE FROM osoba_dowod where id_osoba = 182;
DELETE FROM osoba_adres where id = 182;
DELETE FROM osoba_klient where id_osoba = 182;
DELETE FROM telefon where id_osoba = 182;
DELETE FROM komorka where id_osoba = 182;
update cena set id_osoba = 2445 where id_osoba = 182;
update osoba_oferta set id_osoba = 2445 where id_osoba = 182;
update wlasciciel set id_osoba = 2445 where id_osoba = 182;
DELETE FROM osoba where id = 182;

DELETE FROM osoba_dowod where id_osoba = 186;
DELETE FROM osoba_adres where id = 186;
DELETE FROM osoba_klient where id_osoba = 186;
DELETE FROM telefon where id_osoba = 186;
DELETE FROM komorka where id_osoba = 186;
update cena set id_osoba = 2445 where id_osoba = 186;
update osoba_oferta set id_osoba = 2445 where id_osoba = 186;
update wlasciciel set id_osoba = 2445 where id_osoba = 186;
DELETE FROM osoba where id = 186;

update nieruchomosc set id_klient = 1576 where id_klient = 182;
update nieruchomosc set id_klient = 1576 where id_klient = 186;
delete from klient where id = 182;
delete from klient where id = 186;


-----------zl - zl

select * from osoba_klient where id_klient = 1198; --nizszy nr zlecenia
select * from osoba_klient where id_klient = 1122; --2344 os


DELETE FROM osoba_dowod where id_osoba = 2344;
DELETE FROM osoba_adres where id = 2344;
DELETE FROM osoba_klient where id_osoba = 2344;
DELETE FROM telefon where id_osoba = 2344;
DELETE FROM komorka where id_osoba = 2344;
update osoba_zapotrzebowanie set id_osoba = 2343 where id_osoba = 2344;
DELETE FROM osoba where id = 2344;

update lista_wsk_adr set id_klient = 1198 where id_klient = 1122;
update zapotrzebowanie set id_klient = 1198 where id_klient = 1122;
delete from klient where id = 1122;

DELETE FROM opis_wew_zapotrzebowanie WHERE id_zapotrzebowanie = 1310;
DELETE FROM osoba_zapotrzebowanie WHERE id_zapotrzebowanie = 1310;
DELETE FROM prowizja_zapotrzebowanie WHERE id_zapotrzebowanie = 1310;

DELETE FROM dane_txt_zap_max where id_zapotrzebowanie_trans_rodzaj = 1490;
DELETE FROM dane_txt_zap_min where id_zapotrzebowanie_trans_rodzaj = 1490;
DELETE FROM opis_posz_zapotrzebowanie where id_zapotrzebowanie_trans_rodzaj = 1490;
DELETE FROM zap_lokaliz_nier where id_zapotrzebowanie_trans_rodzaj = 1490;
DELETE FROM zapotrzebowanie_trans_rodzaj where id_zapotrzebowanie_nier_rodzaj = 1483;

DELETE FROM zapotrzebowanie_nier_rodzaj WHERE id_zapotrzebowanie = 1310;
delete from zapotrzebowanie where id = 1310;

------------of - zl

select * from osoba_klient where id_klient = 819;

select * from osoba_klient where id_klient = 1041;

DELETE FROM osoba_dowod where id_osoba = 818;
DELETE FROM osoba_adres where id = 818;
DELETE FROM osoba_klient where id_osoba = 818;
DELETE FROM telefon where id_osoba = 818;
DELETE FROM komorka where id_osoba = 818;
update cena set id_osoba = 1386 where id_osoba = 818;
update osoba_oferta set id_osoba = 1386 where id_osoba = 818;
update wlasciciel set id_osoba = 1386 where id_osoba = 818;
DELETE FROM osoba where id = 818;

update nieruchomosc set id_klient = 1041 where id_klient = 819;
delete from klient where id = 819;


-------of - of

select * from osoba_klient where id_klient = 87;

select * from osoba_klient where id_klient = 892;

DELETE FROM osoba_dowod where id_osoba = 890;
DELETE FROM osoba_adres where id = 890;
DELETE FROM osoba_klient where id_osoba = 890;
DELETE FROM telefon where id_osoba = 890;
DELETE FROM komorka where id_osoba = 890;

DELETE FROM cena where id_oferta = 2159;
DELETE FROM osoba_oferta where id_oferta = 2159;
DELETE FROM wlasciciel where id_osoba = 890;

DELETE FROM osoba where id = 890;
DELETE FROM opis where id_oferta = 2159;
DELETE FROM oferta where id = 2159;

delete from dane_slow_wyp_nier where id_nieruchomosc = 950;
delete from dane_txt_nier where id_nieruchomosc = 950;
delete from opis_nieruchomosc where id_nieruchomosc = 950;
delete from dane_slow_wyp_pom where id_pomieszczenie_przyn_nier in (select id from pomieszczenie_przyn_nier where id_nieruchomosc = 950);
delete from dane_txt_pom where id_pomieszczenie_przyn_nier in (select id from pomieszczenie_przyn_nier where id_nieruchomosc = 950);
delete from pomieszczenie_przyn_nier where id_nieruchomosc = 950;
delete from zdjecie where id_nieruchomosc = 950;
delete from nieruchomosc where id_klient = 892;

delete from klient where id = 892;

------------of - zl

select * from osoba_klient where id_klient = 755;

select * from osoba_klient where id_klient = 1063;

DELETE FROM osoba_dowod where id_osoba = 754;
DELETE FROM osoba_adres where id = 754;
DELETE FROM osoba_klient where id_osoba = 754;
DELETE FROM telefon where id_osoba = 754;
DELETE FROM komorka where id_osoba = 754;
update cena set id_osoba = 2292 where id_osoba = 754;
update osoba_oferta set id_osoba = 2292 where id_osoba = 754;
update wlasciciel set id_osoba = 2292 where id_osoba = 754;
DELETE FROM osoba where id = 754;

update nieruchomosc set id_klient = 1063 where id_klient = 755;
delete from klient where id = 755;

------------of - zl

select * from osoba_klient where id_klient = 242;

select * from osoba_klient where id_klient = 926;

DELETE FROM osoba_dowod where id_osoba = 242;
DELETE FROM osoba_adres where id = 242;
DELETE FROM osoba_klient where id_osoba = 242;
DELETE FROM telefon where id_osoba = 242;
DELETE FROM komorka where id_osoba = 242;
update cena set id_osoba = 2777 where id_osoba = 242;
update osoba_oferta set id_osoba = 2777 where id_osoba = 242;
update wlasciciel set id_osoba = 2777 where id_osoba = 242;
DELETE FROM osoba where id = 242;

update nieruchomosc set id_klient = 926 where id_klient = 242;
delete from klient where id = 242;

----pusty

select * from osoba_klient where id_klient = 441;
DELETE FROM osoba_dowod where id_osoba = 441;
DELETE FROM osoba_adres where id = 441;
DELETE FROM osoba_klient where id_osoba = 441;
DELETE FROM telefon where id_osoba = 441;
DELETE FROM komorka where id_osoba = 441;
DELETE FROM osoba where id = 441;

delete from klient where id = 441;

-------of - of

select * from osoba_klient where id_klient = 736; --wylata

select * from osoba_klient where id_klient = 752;

DELETE FROM osoba_dowod where id_osoba = 735;
DELETE FROM osoba_adres where id = 735;
DELETE FROM osoba_klient where id_osoba = 735;
DELETE FROM telefon where id_osoba = 735;
DELETE FROM komorka where id_osoba = 735;

DELETE FROM cena where id_oferta = 1134;
DELETE FROM osoba_oferta where id_oferta = 1134;
DELETE FROM wlasciciel where id_osoba = 735;

DELETE FROM osoba where id = 735;
DELETE FROM opis where id_oferta = 1134;
DELETE FROM portal_wys where id_oferta = 1134;
UPDATE lista_wsk_adr set id_oferta = 1133 where id_oferta = 1134;
DELETE FROM oferta where id = 1134;

delete from dane_slow_wyp_nier where id_nieruchomosc = 795;
delete from dane_txt_nier where id_nieruchomosc = 795;
delete from opis_nieruchomosc where id_nieruchomosc = 795;
delete from dane_slow_wyp_pom where id_pomieszczenie_przyn_nier in (select id from pomieszczenie_przyn_nier where id_nieruchomosc = 795);
delete from dane_txt_pom where id_pomieszczenie_przyn_nier in (select id from pomieszczenie_przyn_nier where id_nieruchomosc = 795);
delete from pomieszczenie_przyn_nier where id_nieruchomosc = 795;
delete from zdjecie where id_nieruchomosc = 795;
delete from nieruchomosc where id_klient = 736;

delete from klient where id = 736;

----pusty

select * from osoba_klient where id_klient = 445;
DELETE FROM osoba_dowod where id_osoba = 445;
DELETE FROM osoba_adres where id = 445;
DELETE FROM osoba_klient where id_osoba = 445;
DELETE FROM telefon where id_osoba = 445;
DELETE FROM komorka where id_osoba = 445;
DELETE FROM osoba where id = 445;

delete from klient where id = 445;


-------of - of

select * from osoba_klient where id_klient = 815; --wylata

select * from osoba_klient where id_klient = 712;

DELETE FROM osoba_dowod where id_osoba = 814;
DELETE FROM osoba_adres where id = 814;
DELETE FROM osoba_klient where id_osoba = 814;
DELETE FROM telefon where id_osoba = 814;
DELETE FROM komorka where id_osoba = 814;

DELETE FROM cena where id_oferta = 2152;
DELETE FROM osoba_oferta where id_oferta = 2152;
DELETE FROM wlasciciel where id_osoba = 814;

DELETE FROM osoba where id = 814;
DELETE FROM opis where id_oferta = 2152;
DELETE FROM portal_wys where id_oferta = 2152;
UPDATE lista_wsk_adr set id_oferta = 1510 where id_oferta = 2152;
DELETE FROM oferta where id = 2152;

delete from dane_slow_wyp_nier where id_nieruchomosc = 874;
delete from dane_txt_nier where id_nieruchomosc = 874;
delete from opis_nieruchomosc where id_nieruchomosc = 874;
delete from dane_slow_wyp_pom where id_pomieszczenie_przyn_nier in (select id from pomieszczenie_przyn_nier where id_nieruchomosc = 874);
delete from dane_txt_pom where id_pomieszczenie_przyn_nier in (select id from pomieszczenie_przyn_nier where id_nieruchomosc = 874);
delete from pomieszczenie_przyn_nier where id_nieruchomosc = 874;
delete from zdjecie where id_nieruchomosc = 874;
delete from nieruchomosc where id_klient = 815;

delete from klient where id = 815;

-----------------zl - of

select * from osoba_klient where id_klient = 712;

select * from osoba_klient where id_klient = 2395;

DELETE FROM osoba_dowod where id_osoba = 2390;
DELETE FROM osoba_adres where id = 2390;
DELETE FROM osoba_klient where id_osoba = 2390;
DELETE FROM telefon where id_osoba = 2390;
DELETE FROM komorka where id_osoba = 2390;
update osoba_zapotrzebowanie set id_osoba = 711 where id_osoba = 2390;
DELETE FROM osoba where id = 2390;

update lista_wsk_adr set id_klient = 712 where id_klient = 2395;
update zapotrzebowanie set id_klient = 712 where id_klient = 2395;
delete from klient where id = 2395;


-------of - of

select * from osoba_klient where id_klient = 326;

select * from osoba_klient where id_klient = 333;

DELETE FROM osoba_dowod where id_osoba = 333;
DELETE FROM osoba_adres where id = 333;
DELETE FROM osoba_klient where id_osoba = 333;
DELETE FROM telefon where id_osoba = 333;
DELETE FROM komorka where id_osoba = 333;

update cena set id_osoba = 326 where id_osoba = 333;
update osoba_oferta set id_osoba = 326 where id_osoba = 333;
update wlasciciel set id_osoba = 326 where id_osoba = 333;

DELETE FROM osoba where id = 333;

update nieruchomosc set id_klient = 326 where id_klient = 333;

delete from klient where id = 333;


------------oferent zastepowany zleceniodawca

select * from osoba_klient where id_klient = 657;

select * from osoba_klient where id_klient = 1183;

DELETE FROM osoba_dowod where id_osoba = 656;
DELETE FROM osoba_adres where id = 656;
DELETE FROM osoba_klient where id_osoba = 656;
DELETE FROM telefon where id_osoba = 656;
DELETE FROM komorka where id_osoba = 656;
update cena set id_osoba = 1439 where id_osoba = 656;
update osoba_oferta set id_osoba = 1439 where id_osoba = 656;
update wlasciciel set id_osoba = 1439 where id_osoba = 656;
DELETE FROM osoba where id = 656;

update nieruchomosc set id_klient = 1183 where id_klient = 657;
delete from klient where id = 657;

------------oferent zastepowany zleceniodawca

select * from osoba_klient where id_klient = 474;

select * from osoba_klient where id_klient = 1401;

DELETE FROM osoba_dowod where id_osoba = 474;
DELETE FROM osoba_adres where id = 474;
DELETE FROM osoba_klient where id_osoba = 474;
DELETE FROM telefon where id_osoba = 474;
DELETE FROM komorka where id_osoba = 474;
update cena set id_osoba = 2106 where id_osoba = 474;
update osoba_oferta set id_osoba = 2106 where id_osoba = 474;
update wlasciciel set id_osoba = 2106 where id_osoba = 474;
DELETE FROM osoba where id = 474;

update nieruchomosc set id_klient = 1401 where id_klient = 474;
delete from klient where id = 474;

------kasowanie oferenta - bez oferty

select * from osoba_klient where id_klient = 585;

DELETE FROM osoba_dowod where id_osoba = 584;
DELETE FROM osoba_adres where id = 584;
DELETE FROM osoba_klient where id_osoba = 584;
DELETE FROM telefon where id_osoba = 584;
DELETE FROM komorka where id_osoba = 584;
DELETE FROM osoba where id = 584;

delete from klient where id = 585;

-----------zl - zl

select * from osoba_klient where id_klient = 1016; --nizszy nr zlecenia
select * from osoba_klient where id_klient = 1709; --wylatuje razem ze zleceniem


DELETE FROM osoba_dowod where id_osoba = 2427;
DELETE FROM osoba_adres where id = 2427;
DELETE FROM osoba_klient where id_osoba = 2427;
DELETE FROM telefon where id_osoba = 2427;
DELETE FROM komorka where id_osoba = 2427;
update osoba_zapotrzebowanie set id_osoba = 2426 where id_osoba = 2427;
DELETE FROM osoba where id = 2427;

update lista_wsk_adr set id_klient = 1016 where id_klient = 1709;
update zapotrzebowanie set id_klient = 1016 where id_klient = 1709;
delete from klient where id = 1709;

DELETE FROM opis_wew_zapotrzebowanie WHERE id_zapotrzebowanie = 1389;
DELETE FROM osoba_zapotrzebowanie WHERE id_zapotrzebowanie = 1389;
DELETE FROM prowizja_zapotrzebowanie WHERE id_zapotrzebowanie = 1389;

DELETE FROM dane_txt_zap_max where id_zapotrzebowanie_trans_rodzaj = 1578;
DELETE FROM dane_txt_zap_min where id_zapotrzebowanie_trans_rodzaj = 1578;
DELETE FROM opis_posz_zapotrzebowanie where id_zapotrzebowanie_trans_rodzaj = 1578;
DELETE FROM zap_lokaliz_nier where id_zapotrzebowanie_trans_rodzaj = 1578;
DELETE FROM zapotrzebowanie_trans_rodzaj where id_zapotrzebowanie_nier_rodzaj = 1571;

DELETE FROM zapotrzebowanie_nier_rodzaj WHERE id_zapotrzebowanie = 1389;
delete from zapotrzebowanie where id = 1389;


-----------------zleceniodawca zastepowany oferentem

select * from osoba_klient where id_klient = 18;

select * from osoba_klient where id_klient = 1841;

DELETE FROM osoba_dowod where id_osoba = 2657;
DELETE FROM osoba_adres where id = 2657;
DELETE FROM osoba_klient where id_osoba = 2657;
DELETE FROM telefon where id_osoba = 2657;
DELETE FROM komorka where id_osoba = 2657;
update osoba_zapotrzebowanie set id_osoba = 18 where id_osoba = 2657;
DELETE FROM osoba where id = 2657;

update lista_wsk_adr set id_klient = 18 where id_klient = 1841;
update zapotrzebowanie set id_klient = 18 where id_klient = 1841;
delete from klient where id = 1841;


-------of - of

select * from osoba_klient where id_klient = 181;

select * from osoba_klient where id_klient = 216;--zostaje

DELETE FROM osoba_dowod where id_osoba = 181;
DELETE FROM osoba_adres where id = 181;
DELETE FROM osoba_klient where id_osoba = 181;
DELETE FROM telefon where id_osoba = 181;
DELETE FROM komorka where id_osoba = 181;

update cena set id_osoba = 216 where id_osoba = 181;
update osoba_oferta set id_osoba = 216 where id_osoba = 181;
update wlasciciel set id_osoba = 216 where id_osoba = 181;

DELETE FROM osoba where id = 181;

update nieruchomosc set id_klient = 216 where id_klient = 181;

delete from klient where id = 181;


-----------zl - zl

select * from osoba_klient where id_klient = 2664; --nizszy nr zlecenia
select * from osoba_klient where id_klient = 2261; --wylatuje razem ze zleceniem


DELETE FROM osoba_dowod where id_osoba = 1125;
DELETE FROM osoba_adres where id = 1125;
DELETE FROM osoba_klient where id_osoba = 1125;
DELETE FROM telefon where id_osoba = 1125;
DELETE FROM komorka where id_osoba = 1125;
update osoba_zapotrzebowanie set id_osoba = 1606 where id_osoba = 1125;
DELETE FROM osoba where id = 1125;

update lista_wsk_adr set id_klient = 2261 where id_klient = 2664;
update zapotrzebowanie set id_klient = 2261 where id_klient = 2664;
delete from klient where id = 2664;


-------of - of

select * from osoba_klient where id_klient = 716;--zostaje

select * from osoba_klient where id_klient = 723;

DELETE FROM osoba_dowod where id_osoba = 722;
DELETE FROM osoba_adres where id = 722;
DELETE FROM osoba_klient where id_osoba = 722;
DELETE FROM telefon where id_osoba = 722;
DELETE FROM komorka where id_osoba = 722;

update cena set id_osoba = 715 where id_osoba = 722;
update osoba_oferta set id_osoba = 715 where id_osoba = 722;
update wlasciciel set id_osoba = 715 where id_osoba = 722;

DELETE FROM osoba where id = 722;

update nieruchomosc set id_klient = 716 where id_klient = 723;

delete from klient where id = 723;


-----------zl - zl

select * from osoba_klient where id_klient = 2664; --nizszy nr zlecenia
select * from osoba_klient where id_klient = 2261; --wylatuje razem ze zleceniem


DELETE FROM osoba_dowod where id_osoba = 1125;
DELETE FROM osoba_adres where id = 1125;
DELETE FROM osoba_klient where id_osoba = 1125;
DELETE FROM telefon where id_osoba = 1125;
DELETE FROM komorka where id_osoba = 1125;
update osoba_zapotrzebowanie set id_osoba = 1606 where id_osoba = 1125;
DELETE FROM osoba where id = 1125;

update lista_wsk_adr set id_klient = 2261 where id_klient = 2664;
update zapotrzebowanie set id_klient = 2261 where id_klient = 2664;
delete from klient where id = 2664;

-----------zl - zl

select * from osoba_klient where id_klient = 1741; ---wylatuje
select * from osoba_klient where id_klient = 1606; ---zostaje


DELETE FROM osoba_dowod where id_osoba = 1084;
DELETE FROM osoba_adres where id = 1084;
DELETE FROM osoba_klient where id_osoba = 1084;
DELETE FROM telefon where id_osoba = 1084;
DELETE FROM komorka where id_osoba = 1084;
update osoba_zapotrzebowanie set id_osoba = 1626 where id_osoba = 1084;
DELETE FROM osoba where id = 1084;

update lista_wsk_adr set id_klient = 1606 where id_klient = 1741;
update zapotrzebowanie set id_klient = 1606 where id_klient = 1741;
delete from klient where id = 1741;

-------------332

select * from osoba_klient where id_klient = 332;

DELETE FROM osoba_dowod where id_osoba = 332;
DELETE FROM osoba_adres where id = 332;
DELETE FROM osoba_klient where id_osoba = 332;
DELETE FROM telefon where id_osoba = 332;
DELETE FROM komorka where id_osoba = 332;
DELETE FROM osoba_zapotrzebowanie where id_osoba = 332;
DELETE FROM cena where id_osoba = 332;
DELETE FROM osoba_oferta where id_osoba = 332;
DELETE FROM wlasciciel where id_osoba = 332;
DELETE FROM osoba where id = 332;

delete from dane_slow_wyp_nier where id_nieruchomosc = 392;
delete from dane_txt_nier where id_nieruchomosc = 392;
delete from opis where id_oferta = 2120;
delete from oferta where id_nieruchomosc = 392;
delete from opis_nieruchomosc where id_nieruchomosc = 392;
delete from nieruchomosc where id_klient = 332;
delete from klient where id = 332;


------------oferent zastepowany zleceniodawca

select * from osoba_klient where id_klient = 891;

select * from osoba_klient where id_klient = 1225;

DELETE FROM osoba_dowod where id_osoba = 889;
DELETE FROM osoba_adres where id = 889;
DELETE FROM osoba_klient where id_osoba = 889;
DELETE FROM telefon where id_osoba = 889;
DELETE FROM komorka where id_osoba = 889;
update cena set id_osoba = 983 where id_osoba = 889;
update osoba_oferta set id_osoba = 983 where id_osoba = 889;
update wlasciciel set id_osoba = 983 where id_osoba = 889;
DELETE FROM osoba where id = 889;

update nieruchomosc set id_klient = 1225 where id_klient = 891;
delete from klient where id = 891;