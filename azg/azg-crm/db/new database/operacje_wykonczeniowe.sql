----konwersja polskich znaczkow :P
---

---opis_wew_zapotrzebowanie
update klient set id_agent = 18 where id_agent = 24;
update osoba set id_agent = 18 where id_agent = 24;
update nieruchomosc set id_agent = 18 where id_agent = 24;
update opis_nieruchomosc set id_agent = 18 where id_agent = 24;
update zapotrzebowanie set id_agent = 18 where id_agent = 24;
update lista_wsk_adr set id_agent = 18 where id_agent = 24;
update cena set id_agent = 18 where id_agent = 24;
update opis_wew_zapotrzebowanie set id_agent = 18 where id_agent = 24;

delete from agent where id = 24;

update klient set id_agent = 20 where id_agent = 32;
update osoba set id_agent = 20 where id_agent = 32;
update nieruchomosc set id_agent = 20 where id_agent = 32;
update opis_nieruchomosc set id_agent = 20 where id_agent = 32;
update zapotrzebowanie set id_agent = 20 where id_agent = 32;
update lista_wsk_adr set id_agent = 20 where id_agent = 32;
update cena set id_agent = 20 where id_agent = 32;
update opis_wew_zapotrzebowanie set id_agent = 20 where id_agent = 32;

delete from agent where id = 32;

update klient set id_agent = 34 where id_agent = 30;
update osoba set id_agent = 34 where id_agent = 30;
update nieruchomosc set id_agent = 34 where id_agent = 30;
update opis_nieruchomosc set id_agent = 34 where id_agent = 30;
update zapotrzebowanie set id_agent = 34 where id_agent = 30;
update lista_wsk_adr set id_agent = 34 where id_agent = 30;
update cena set id_agent = 34 where id_agent = 30;
update opis_wew_zapotrzebowanie set id_agent = 34 where id_agent = 30;

delete from agent where id = 30;

---z zalozenia ten plik prowadzi operacje ktore mozna wykonac wiele razy, stad ten insert tu nie moze byc :P - przelozyc ten temat do importu zapotrzebowan - zrobione
---insert into opis_wew_zapotrzebowanie (id_zapotrzebowanie, id_agent, tresc) select id_k, id_a, info_k from tab_kl where id_k in (select id from zapotrzebowanie);

---deakt witek - zmiana konta na bartek :P, moze zostac
---update agent set aktywnosc_konto = false where id = 25;

update osoba set pesel = null where pesel = 0;

---kojarzenie - modyfikacje
update lista_param_nier set waga = (select waga from parametr_nier where id = lista_param_nier.id_parametr_nier);
update lista_param_slow_nier set waga = (select waga from wyposazenie_nier where id = lista_param_slow_nier.id_wyposazenie_nier);

---osoby powtarzaj¹ce siê
--select * from osoba os1 where (select count(id) from osoba where pesel = os1.pesel) > 1 order by pesel;

---select distinct(count(id)) from osoba os1 where (select count(id) from osoba where pesel = os1.pesel) > 1 group by pesel;
---id_old jest id klienta :)

---select * from osoba os1 join klient on os1.id_old = klient.id_old where klient.is_oferent_old != true and (select count(id) from osoba where pesel = os1.pesel) > 1 order by id_old;
---select * from osoba os1 join klient on os1.id_old = klient.id_old where klient.is_oferent_old != true and (select count(id) from osoba where pesel = os1.pesel) > 1 order by pesel, os1.id_old;


---select os1.nazwisko, imie.nazwa as imie, os1.pesel from osoba os1 join imie on os1.id_imie = imie.id where (select count(id) from osoba where pesel = os1.pesel) > 1 order by pesel, os1.id_old;

---select os1.* from osoba os1 join osoba_klient on osoba_klient.id_osoba = os1.id join klient on osoba_klient.id_klient = klient.id where klient.is_oferent_old != true and (select count(id) from osoba where pesel = os1.pesel) > 1 order by os1.pesel;


---sieroty bez dzieci regiony
---select * from region_geog r1 where id_parent is null and (select count(id) from region_geog where id_parent = r1.id) = 0;


---naprawa zle regiony

update media_nieruchomosc set id_region_geog = (select id from RegionGeograficznyNajnizejWoj('Czarnow±sy', 9)) where id_region_geog = (select id from region_geog where id > 56000 and id_parent is null and nazwa = 'Czarnowasy');
update osoba_adres set id_region_geog = (select id_region_geog from RegionGeograficznyNajnizejWoj('czerwionka%leszczyny', 13)) where id_region_geog = (select id from region_geog where id > 56000 and id_parent is null and nazwa = 'Czerwionka - Leszczyny');
update osoba_adres set id_region_geog = (select id_region_geog from RegionGeograficznyNajnizejWoj('czeska%', 9)) where id_region_geog = (select id from region_geog where id > 56000 and id_parent is null and nazwa = 'Czeska Wie¶  79');
update osoba_adres set id_region_geog = (select id_region_geog from RegionGeograficznyNajnizejWoj('czeska%', 9)) where id_region_geog = (select id from region_geog where id > 56000 and id_parent is null and nazwa = 'Czeska Wie¶ 46');
update osoba_adres set id_region_geog = (select id_region_geog from RegionGeograficznyNajnizejWoj('Dzier¿ys³awice', 9)) where id_region_geog = (select id from region_geog where id > 56000 and id_parent is null and nazwa = 'Dzie¿ys³awice');
update osoba_adres set id_region_geog = (select id_region_geog from RegionGeograficznyNajnizejWoj('Gadzowice', 9)) where id_region_geog = (select id from region_geog where id > 56000 and id_parent is null and nazwa = 'Gdzowice');
update osoba_adres set id_region_geog = (select id_region_geog from RegionGeograficznyNajnizejWoj('G³ubczyce', 9)) where id_region_geog = (select id from region_geog where id > 56000 and id_parent is null and nazwa = 'G³upczyce');
update osoba_adres set id_region_geog = 27 where id_region_geog = (select id from region_geog where id > 56000 and id_parent is null and nazwa = 'Hilden');
update osoba_adres set id_region_geog = (select id_region_geog from RegionGeograficznyNajnizej('Jastrzêbie-Zdrój')) where id_region_geog = (select id from region_geog where id > 56000 and id_parent is null and nazwa = 'Jastrzêbie Zdrój');
update osoba_adres set id_region_geog = (select id_region_geog from RegionGeograficznyNajnizej('Jelcz-Laskowice')) where id_region_geog = (select id from region_geog where id > 56000 and id_parent is null and nazwa = 'Jelcz - Laskowice');
update osoba_adres set id_region_geog = (select id_region_geog from RegionGeograficznyNajnizejWoj('Katowice', 13)) where id_region_geog = (select id from region_geog where id > 56000 and id_parent is null and nazwa = 'Katowiece');
update osoba_adres set id_region_geog = (select id_region_geog from RegionGeograficznyNajnizejWoj('Kêdzierzyn-Ko¼le', 9)) where id_region_geog = (select id from region_geog where id > 56000 and id_parent is null and nazwa = 'Kêdzierzyn - Ko¼le');
update osoba_adres set id_region_geog = (select id_region_geog from RegionGeograficznyNajnizejWoj('Kêdzierzyn-Ko¼le', 9)) where id_region_geog = (select id from region_geog where id > 56000 and id_parent is null and nazwa = 'Kêdzierzyn-Ko¿le');
update osoba_adres set id_region_geog = (select id_region_geog from RegionGeograficznyNajnizejWoj('Kêdzierzyn Ko¿le', 9)) where id_region_geog = (select id from region_geog where id > 56000 and id_parent is null and nazwa = 'Kêdzierzyn Ko¿le');
update osoba_adres set id_region_geog = (select id_region_geog from RegionGeograficznyNajnizejWoj('Klisino', 9)) where id_region_geog = (select id from region_geog where id > 56000 and id_parent is null and nazwa = 'Klisina');
update osoba_adres set id_region_geog = (select id_region_geog from RegionGeograficznyNajnizejWoj('Krzekotów', 2)) where id_region_geog = (select id from region_geog where id > 56000 and id_parent is null and nazwa = 'Krzekotów 21');
update osoba_adres set id_region_geog = (select id_region_geog from RegionGeograficznyNajnizej('Kudowa-Zdrój')) where id_region_geog = (select id from region_geog where id > 56000 and id_parent is null and nazwa = 'KudowaZdrój');
update osoba_adres set id_region_geog = (select id_region_geog from RegionGeograficznyNajnizejWoj('Ku¼nica Katowska', 9)) where id_region_geog = (select id from region_geog where id > 56000 and id_parent is null and nazwa = 'Ku¿nica Katowska');
update osoba_adres set id_region_geog = (select id_region_geog from RegionGeograficznyNajnizejWoj('Ludzisko', 3)) where id_region_geog = (select id from region_geog where id > 56000 and id_parent is null and nazwa = 'Ludzisko Janikowo');
update osoba_adres set id_region_geog = (select id_region_geog from RegionGeograficznyNajnizejWoj('£aziska Górne', 13)) where id_region_geog = (select id from region_geog where id > 56000 and id_parent is null and nazwa = '£aziska  Górne');
update osoba_adres set id_region_geog = (select id_region_geog from RegionGeograficznyNajnizejWoj('³ód¼', 4)) where id_region_geog = (select id from region_geog where id > 56000 and id_parent is null and nazwa = '£ód¿');
update osoba_adres set id_region_geog = (select id_region_geog from RegionGeograficznyNajnizejWoj('Makowice', 9)) where id_region_geog = (select id from region_geog where id > 56000 and id_parent is null and nazwa = 'Makowice Gm.Skoroszyce');
update osoba_adres set id_region_geog = (select id_region_geog from RegionGeograficznyNajnizejWoj('Malerzowice Wielkie', 9)) where id_region_geog = (select id from region_geog where id > 56000 and id_parent is null and nazwa = 'Malerzowice Wielkie 2');
update osoba_adres set id_region_geog = (select id_region_geog from RegionGeograficznyNajnizejWoj('Namys³ów', 9)) where id_region_geog = (select id from region_geog where id > 56000 and id_parent is null and nazwa like '%Namys³ów');
update osoba_adres set id_region_geog = (select id_region_geog from RegionGeograficznyNajnizejWoj('opole', 9)) where id_region_geog = (select id from region_geog where id > 56000 and id_parent is null and nazwa = 'Ople');
update media_nieruchomosc set id_region_geog = (select id from RegionGeograficznyNajnizejWoj('opole', 9)) where id_region_geog = (select id from region_geog where id > 56000 and id_parent is null and nazwa = 'Ople');
update osoba_adres set id_region_geog = (select id_region_geog from RegionGeograficznyNajnizejWoj('opole', 9)) where id_region_geog = (select id from region_geog where id > 56000 and id_parent is null and nazwa = 'Opola');
update nieruchomosc set id_region_geog = (select id_region_geog from RegionGeograficznyNajnizejWoj('opole', 9)) where id_region_geog = (select id from region_geog where id > 56000 and id_parent is null and nazwa = 'Opola');
update osoba_adres set id_region_geog = (select id_region_geog from RegionGeograficznyNajnizejWoj('P±tnów', 4)) where id_region_geog = (select id from region_geog where id > 56000 and id_parent is null and nazwa = 'P±tnów 120');
update osoba_adres set id_region_geog = (select id_region_geog from RegionGeograficznyNajnizejWoj('Pi³awa Górna', 2)) where id_region_geog = (select id from region_geog where id > 56000 and id_parent is null and nazwa = 'Pilawa Górna');
update osoba_adres set id_region_geog = (select id_region_geog from RegionGeograficznyNajnizejWoj('Piñczów', 14)) where id_region_geog = (select id from region_geog where id > 56000 and id_parent is null and nazwa = 'Pinczów');
update osoba_adres set id_region_geog = (select id_region_geog from RegionGeograficznyNajnizejWoj('Piotrków Trybunalski', 4)) where id_region_geog = (select id from region_geog where id > 56000 and id_parent is null and nazwa = 'Piotrk. Trybunalski');
update osoba_adres set id_region_geog = (select id_region_geog from RegionGeograficznyNajnizejWoj('Rozwadza', 9)) where id_region_geog = (select id from region_geog where id > 56000 and id_parent is null and nazwa = 'Rozwada');
update osoba_adres set id_region_geog = (select id_region_geog from RegionGeograficznyNajnizejWoj('¦wierczów', 9)) where id_region_geog = (select id from region_geog where id > 56000 and id_parent is null and nazwa = '¦wiercowskie');
update osoba_adres set id_region_geog = (select id_region_geog from RegionGeograficznyNajnizejWoj('Teratyn', 5)) where id_region_geog = (select id from region_geog where id > 56000 and id_parent is null and nazwa = 'Teratyn 44');
update osoba_adres set id_region_geog = (select id_region_geog from RegionGeograficznyNajnizejWoj('turawa', 9)) where id_region_geog = (select id from region_geog where id > 56000 and id_parent is null and nazwa = 'Turawa Marszalki');
update media_nieruchomosc set id_region_geog = (select id_region_geog from RegionGeograficznyNajnizejWoj('turawa', 9)) where id_region_geog = (select id from region_geog where id > 56000 and id_parent is null and nazwa = 'Turawa Marszalki');
update osoba_adres set id_region_geog = (select id_region_geog from RegionGeograficznyNajnizejWoj('turawa', 9)) where id_region_geog = (select id from region_geog where id > 56000 and id_parent is null and nazwa = 'Turawa-Marsza³ki');
update osoba_adres set id_region_geog = (select id_region_geog from RegionGeograficznyNajnizejWoj('warszawa', 8)) where id_region_geog = (select id from region_geog where id > 56000 and id_parent is null and nazwa = 'Warzawa');
update osoba_adres set id_region_geog = (select id_region_geog from RegionGeograficznyNajnizejWoj('Wroc³aw', 2)) where id_region_geog = (select id from region_geog where id > 56000 and id_parent is null and nazwa = 'Wroc³aw');
update osoba_adres set id_region_geog = (select id_region_geog from RegionGeograficznyNajnizejWoj('opole', 9)) where id_region_geog = (select id from region_geog where id > 56000 and id_parent is null and nazwa = 'Wroc³awska');
update media_nieruchomosc set id_region_geog = (select id_region_geog from RegionGeograficznyNajnizejWoj('opole', 9)) where id_region_geog = (select id from region_geog where id > 56000 and id_parent is null and nazwa = 'Wroc³awska');
update osoba_adres set id_region_geog = (select id_region_geog from RegionGeograficznyNajnizejWoj('opole', 9)) where id_region_geog = (select id from region_geog where id > 56000 and id_parent is null and nazwa = '0');
update dane_firma set id_region_geog = (select id_region_geog from RegionGeograficznyNajnizejWoj('opole', 9)) where id_region_geog = (select id from region_geog where id > 56000 and id_parent is null and nazwa = '0');
update media_nieruchomosc set id_region_geog = (select id_region_geog from RegionGeograficznyNajnizejWoj('opole', 9)) where id_region_geog = (select id from region_geog where id > 56000 and id_parent is null and nazwa = '0');
update osoba_adres set id_region_geog = (select id_region_geog from RegionGeograficznyNajnizejWoj('opole', 9)) where id_region_geog = (select id from region_geog where id > 56000 and id_parent is null and nazwa = '45-675');
update osoba_adres set id_region_geog = 27 where id_region_geog = (select id from region_geog where id > 56000 and id_parent is null and nazwa = 'Austria - Wiedeñ');
update osoba_adres set id_region_geog = 27 where id_region_geog = (select id from region_geog where id > 56000 and id_parent is null and nazwa = 'Berlin');
update osoba_adres set id_region_geog = 27 where id_region_geog = (select id from region_geog where id > 56000 and id_parent is null and nazwa = 'Canada');
update osoba_adres set id_region_geog = (select min(id_region_geog) from RegionGeograficznyNajnizejWoj('Chró¶cina', 9)) where id_region_geog = (select id from region_geog where id > 56000 and id_parent is null and nazwa = 'Chró¶cina Opolska');
update media_nieruchomosc set id_region_geog = (select min(id_region_geog) from RegionGeograficznyNajnizejWoj('Chró¶cina', 9)) where id_region_geog = (select id from region_geog where id > 56000 and id_parent is null and nazwa = 'Chró¶cina Opolska');
update osoba_adres set id_region_geog = 27 where id_region_geog = (select id from region_geog where id > 56000 and id_parent is null and nazwa = 'Grerenbroich');
update osoba_adres set id_region_geog = 27 where id_region_geog = (select id from region_geog where id > 56000 and id_parent is null and nazwa = 'Gutersloh');
update osoba_adres set id_region_geog = (select id_region_geog from RegionGeograficznyNajnizejWoj('Jemielnica', 9)) where id_region_geog = (select id from region_geog where id > 56000 and id_parent is null and nazwa = 'Jemelnica');
update osoba_adres set id_region_geog = (select id_region_geog from RegionGeograficznyNajnizejWoj('Kêdzierzyn-Ko¼le', 9)) where id_region_geog = (select id from region_geog where id > 56000 and id_parent is null and nazwa = 'Kêdziertzyn Ko¼le');
update osoba_adres set id_region_geog = (select id_region_geog from RegionGeograficznyNajnizejWoj('Konstantynów £ódzki', 4)) where id_region_geog = (select id from region_geog where id > 56000 and id_parent is null and nazwa = 'Konstantynów£ódzki');
update osoba_adres set id_region_geog = (select id_region_geog from RegionGeograficznyNajnizejWoj('opole', 9)) where id_region_geog = (select id from region_geog where id > 56000 and id_parent is null and nazwa = 'Koszyka');
update media_nieruchomosc set id_region_geog = (select id_region_geog from RegionGeograficznyNajnizejWoj('opole', 9)) where id_region_geog = (select id from region_geog where id > 56000 and id_parent is null and nazwa = 'Koszyka');
update osoba_adres set id_region_geog = (select id_region_geog from RegionGeograficznyNajnizejWoj('opole', 9)) where id_region_geog = (select id from region_geog where id > 56000 and id_parent is null and nazwa = 'Luboszycka');
update media_nieruchomosc set id_region_geog = (select id_region_geog from RegionGeograficznyNajnizejWoj('opole', 9)) where id_region_geog = (select id from region_geog where id > 56000 and id_parent is null and nazwa = 'Luboszycka');
update osoba_adres set id_region_geog = (select id_region_geog from RegionGeograficznyNajnizejWoj('opole', 9)) where id_region_geog = (select id from region_geog where id > 56000 and id_parent is null and nazwa like '%Opole');
update osoba_adres set id_region_geog = (select id_region_geog from RegionGeograficznyNajnizejWoj('Osowiec Œl¹ski', 9)) where id_region_geog = (select id from region_geog where id > 56000 and id_parent is null and nazwa = 'Osowiec - Trzêsina');
update osoba_adres set id_region_geog = (select id_region_geog from RegionGeograficznyNajnizejWoj('turawa', 9)) where id_region_geog = (select id from region_geog where id > 56000 and id_parent is null and nazwa = 'Turawa Marsza³ki');
update media_nieruchomosc set id_region_geog = (select id_region_geog from RegionGeograficznyNajnizejWoj('turawa', 9)) where id_region_geog = (select id from region_geog where id > 56000 and id_parent is null and nazwa = 'Turawa Marsza³ki');
update osoba_adres set id_region_geog = (select id_region_geog from RegionGeograficznyNajnizejWoj('Warszewice', 4)) where id_region_geog = (select id from region_geog where id > 56000 and id_parent is null and nazwa = 'Warszewicach');
update osoba_adres set id_region_geog = (select id_region_geog from RegionGeograficznyNajnizejWoj('Wêgry', 9)) where id_region_geog = (select id from region_geog where id > 56000 and id_parent is null and nazwa = 'Wegry');
update dane_firma set id_region_geog = 27 where id_region_geog = (select id from region_geog where id > 56000 and id_parent is null and nazwa = '25, Via Porto I - 24060 Castelli Calepio');
update dane_firma set id_region_geog = (select id_region_geog from RegionGeograficznyNajnizejWoj('warszawa', 8)) where id_region_geog = (select id from region_geog where id > 56000 and id_parent is null and nazwa like 'Warszawa_');
update osoba_adres set id_region_geog = (select id_region_geog from RegionGeograficznyNajnizejWoj('Bieni¹dzice', 4)) where id_region_geog = (select id from region_geog where id > 56000 and id_parent is null and nazwa = 'Bieni¹dzice 47');
update osoba_adres set id_region_geog = (select id_region_geog from RegionGeograficznyNajnizejWoj('Szalowa', 7)) where id_region_geog = (select id from region_geog where id > 56000 and id_parent is null and nazwa = 'Szalowa 49');
---update osoba_adres set id_region_geog = (select id_region_geog from RegionGeograficznyNajnizejWoj('', 9)) where id_region_geog = (select id from region_geog where id > 56000 and id_parent is null and nazwa = '');

---delete from region_geog where id > 56000 and id_parent is null and id < 56387;
---select * from region_geog where id > 56000 and id_parent is null order by id desc;

delete from region_geog where id > 56000 and id_parent is null;

---select * from media_reklama order by id desc;

--update reklama_nieruchomosc_m set id_media_reklama = (select id from media_reklama where nazwa = 'nto') where id_media_reklama = (select id from media_reklama where nazwa = '');
--update media_nieruchomosc set id_media_reklama = (select id from media_reklama where nazwa = 'nto') where id_media_reklama = (select id from media_reklama where nazwa = '');
--delete from media_reklama where nazwa = '';
--update reklama_nieruchomosc_m set id_media_reklama = (select id from media_reklama where nazwa = 'nto') where id_media_reklama = (select id from media_reklama where nazwa = '0');
--delete from media_reklama where nazwa = '0';
update reklama_nieruchomosc_m set id_media_reklama = (select id from media_reklama where nazwa = 'gazeta wyborcza') where id_media_reklama in (select id from media_reklama where nazwa in 
('gw', 'wyborcza'));
update media_nieruchomosc set id_media_reklama = (select id from media_reklama where nazwa = 'gazeta wyborcza') where id_media_reklama in (select id from media_reklama where nazwa in 
('gw', 'wyborcza'));
delete from media_reklama where nazwa in ('gw', 'wyborcza');

update reklama_nieruchomosc_m set id_media_reklama = (select id from media_reklama where nazwa = 'nto') where id_media_reklama in (select id from media_reklama where nazwa in 
('nti', 'nto.', 'ntyo', 'ntpos', 'nnto', 'n to', 'ntp', 'npos', '2007-01-30', '', '0'));
update media_nieruchomosc set id_media_reklama = (select id from media_reklama where nazwa = 'nto') where id_media_reklama in (select id from media_reklama where nazwa in 
('nti', 'nto.', 'ntyo', 'ntpos', 'nnto', 'n to', 'ntp', 'npos', '2007-01-30', '', '0'));
delete from media_reklama where nazwa in ('nti', 'nto.', 'ntyo', 'ntpos', 'nnto', 'n to', 'ntp', 'npos', '2007-01-30', '', '0');

update reklama_nieruchomosc_m set id_media_reklama = (select id from media_reklama where nazwa = 'nto') where id_media_reklama in (select id from media_reklama where nazwa like 'nto_%');
update media_nieruchomosc set id_media_reklama = (select id from media_reklama where nazwa = 'nto') where id_media_reklama in (select id from media_reklama where nazwa like 'nto_%');
delete from media_reklama where nazwa like 'nto_%';

update reklama_nieruchomosc_m set id_media_reklama = (select id from media_reklama where nazwa = 'po¶rednik') where id_media_reklama in (select id from media_reklama where nazwa like 'pos%');
update media_nieruchomosc set id_media_reklama = (select id from media_reklama where nazwa = 'po¶rednik') where id_media_reklama in (select id from media_reklama where nazwa like 'pos%');
delete from media_reklama where nazwa like 'pos%';

update reklama_nieruchomosc_m set id_media_reklama = (select id from media_reklama where nazwa = 'po¶rednik') where id_media_reklama in (select id from media_reklama where nazwa in 
('po¶', 'po s', '[pos', 'po', 'poos', 'po¶.', 'po¶.08.06.07', 'poz.', '`po¶'));
update media_nieruchomosc set id_media_reklama = (select id from media_reklama where nazwa = 'po¶rednik') where id_media_reklama in (select id from media_reklama where nazwa in 
('po¶', 'po s', '[pos', 'po', 'poos', 'po¶.', 'po¶.08.06.07', 'poz.', '`po¶'));
delete from media_reklama where nazwa in ('po¶', 'po s', '[pos', 'po', 'poos', 'po¶.', 'po¶.08.06.07', 'poz.', '`po¶');

update reklama_nieruchomosc_m set id_media_reklama = (select id from media_reklama where nazwa = 'portal') where id_media_reklama in (select id from media_reklama where nazwa in 
('portl', 'z portalu', 'portal 24', 'internet', 'inter', 'zg³oszenie internetowe'));
update media_nieruchomosc set id_media_reklama = (select id from media_reklama where nazwa = 'portal') where id_media_reklama in (select id from media_reklama where nazwa in 
('portl', 'z portalu', 'portal 24', 'internet', 'inter', 'zg³oszenie internetowe'));
delete from media_reklama where nazwa in ('portl', 'z portalu', 'portal 24', 'internet', 'inter', 'zg³oszenie internetowe');

update reklama_nieruchomosc_m set id_media_reklama = (select id from media_reklama where nazwa = 'gratka') where id_media_reklama in (select id from media_reklama where nazwa in 
('serwis gratka', 'portal  gratka'));
update media_nieruchomosc set id_media_reklama = (select id from media_reklama where nazwa = 'gratka') where id_media_reklama in (select id from media_reklama where nazwa in 
('serwis gratka', 'portal  gratka'));
delete from media_reklama where nazwa in ('serwis gratka', 'portal  gratka');

update reklama_nieruchomosc_m set id_media_reklama = (select id from media_reklama where nazwa = '24opole.pl') where id_media_reklama in (select id from media_reklama where nazwa in 
('24.opole.pl'));
update media_nieruchomosc set id_media_reklama = (select id from media_reklama where nazwa = '24opole.pl') where id_media_reklama in (select id from media_reklama where nazwa in 
('24.opole.pl'));
delete from media_reklama where nazwa in ('24.opole.pl');

update reklama_nieruchomosc_m set id_media_reklama = (select id from media_reklama where nazwa = 'top reklama') where id_media_reklama in (select id from media_reklama where nazwa in 
('top relkama', 'top reklama str.inter', 'to'));
update media_nieruchomosc set id_media_reklama = (select id from media_reklama where nazwa = 'top reklama') where id_media_reklama in (select id from media_reklama where nazwa in 
('top relkama', 'top reklama str.inter', 'to'));
delete from media_reklama where nazwa in ('top relkama', 'top reklama str.inter', 'to');

update reklama_nieruchomosc_m set id_media_reklama = (select id from media_reklama where nazwa = 'gratka') where id_media_reklama in (select id from media_reklama where nazwa like 
'og³oszenie%sp%ielni%');
update media_nieruchomosc set id_media_reklama = (select id from media_reklama where nazwa = 'gratka') where id_media_reklama in (select id from media_reklama where nazwa like 
'og³oszenie%sp%elni%');
delete from media_reklama where nazwa like 'og³oszenie%sp%elni%';

---oferty nie nalezace do bezdzietnych dzieci - przypisane do gmin i gorzej :P

---dobranoc ...
---select id from nieruchomosc where id_region_geog not in (select id from region_geog r1 where (select count(id) from region_geog where id_parent = r1.id) = 0);

---to jest ok - oferty nie nalezace do bezdzietnych dzieci - przypisane do gmin i gorzej :P
---select oferta.id from nieruchomosc n1 join oferta on n1.id = oferta.id_nieruchomosc where (select count(id) from region_geog where id_parent = n1.id_region_geog) > 0 order by oferta.id asc;
--87 przu of, bez 88 ????

----poprawki ofert - regiony geograficzne
update nieruchomosc set id_region_geog = 482 where id = (select id_nieruchomosc from oferta where id = 5);
update nieruchomosc set id_region_geog = 635 where id = (select id_nieruchomosc from oferta where id = 8);
update nieruchomosc set id_region_geog = 1189 where id = (select id_nieruchomosc from oferta where id = 12);
update nieruchomosc set id_region_geog = 3976 where id = (select id_nieruchomosc from oferta where id = 99);
update nieruchomosc set id_region_geog = 585 where id = (select id_nieruchomosc from oferta where id = 125);
update nieruchomosc set id_region_geog = 487 where id = (select id_nieruchomosc from oferta where id = 230);
update nieruchomosc set id_region_geog = 487 where id = (select id_nieruchomosc from oferta where id = 266);
update nieruchomosc set id_region_geog = 516 where id = (select id_nieruchomosc from oferta where id = 273);
update nieruchomosc set id_region_geog = 480 where id = (select id_nieruchomosc from oferta where id = 283);
update nieruchomosc set id_region_geog = 525 where id = (select id_nieruchomosc from oferta where id = 284);
update nieruchomosc set id_region_geog = 523 where id = (select id_nieruchomosc from oferta where id = 293);
update nieruchomosc set id_region_geog = 622 where id = (select id_nieruchomosc from oferta where id = 299);
update nieruchomosc set id_region_geog = 1549 where id = (select id_nieruchomosc from oferta where id = 300);
update nieruchomosc set id_region_geog = 635 where id = (select id_nieruchomosc from oferta where id = 301);
update nieruchomosc set id_region_geog = 623 where id = (select id_nieruchomosc from oferta where id = 302);
update nieruchomosc set id_region_geog = 623 where id = (select id_nieruchomosc from oferta where id = 303);
update nieruchomosc set id_region_geog = 519 where id = (select id_nieruchomosc from oferta where id = 342);
update nieruchomosc set id_region_geog = 469 where id = (select id_nieruchomosc from oferta where id = 365);
update nieruchomosc set id_region_geog = 528 where id = (select id_nieruchomosc from oferta where id = 411);
update nieruchomosc set id_region_geog = 473 where id = (select id_nieruchomosc from oferta where id = 413);
update nieruchomosc set id_region_geog = 623 where id = (select id_nieruchomosc from oferta where id = 440);
update nieruchomosc set id_region_geog = 476 where id = (select id_nieruchomosc from oferta where id = 441);
update nieruchomosc set id_region_geog = 4816 where id = (select id_nieruchomosc from oferta where id = 481);
update nieruchomosc set id_region_geog = 19400 where id = (select id_nieruchomosc from oferta where id = 647);
update nieruchomosc set id_region_geog = 641 where id = (select id_nieruchomosc from oferta where id = 659);
update nieruchomosc set id_region_geog = 485 where id = (select id_nieruchomosc from oferta where id = 669);
update nieruchomosc set id_region_geog = 608 where id = (select id_nieruchomosc from oferta where id = 684);
update nieruchomosc set id_region_geog = 3346 where id = (select id_nieruchomosc from oferta where id = 687);
update nieruchomosc set id_region_geog = 509 where id = (select id_nieruchomosc from oferta where id = 700);
update nieruchomosc set id_region_geog = 3855 where id = (select id_nieruchomosc from oferta where id = 706);
update nieruchomosc set id_region_geog = 517 where id = (select id_nieruchomosc from oferta where id = 707);
update nieruchomosc set id_region_geog = 482 where id = (select id_nieruchomosc from oferta where id = 709);
update nieruchomosc set id_region_geog = 574 where id = (select id_nieruchomosc from oferta where id = 718);
update nieruchomosc set id_region_geog = 627 where id = (select id_nieruchomosc from oferta where id = 720);
update nieruchomosc set id_region_geog = 473 where id = (select id_nieruchomosc from oferta where id = 722);
update nieruchomosc set id_region_geog = 597 where id = (select id_nieruchomosc from oferta where id = 725);
update nieruchomosc set id_region_geog = 56325 where id = (select id_nieruchomosc from oferta where id = 734);
update nieruchomosc set id_region_geog = 523 where id = (select id_nieruchomosc from oferta where id = 736);
update nieruchomosc set id_region_geog = 638 where id = (select id_nieruchomosc from oferta where id = 741);
update nieruchomosc set id_region_geog = 627 where id = (select id_nieruchomosc from oferta where id = 742);
update nieruchomosc set id_region_geog = 618 where id = (select id_nieruchomosc from oferta where id = 748);
update nieruchomosc set id_region_geog = 638 where id = (select id_nieruchomosc from oferta where id = 749);
update nieruchomosc set id_region_geog = 699 where id = (select id_nieruchomosc from oferta where id = 752);
update nieruchomosc set id_region_geog = 618 where id = (select id_nieruchomosc from oferta where id = 754);
update nieruchomosc set id_region_geog = 15733 where id = (select id_nieruchomosc from oferta where id = 826);
update nieruchomosc set id_region_geog = 508 where id = (select id_nieruchomosc from oferta where id = 855);
update nieruchomosc set id_region_geog = 515 where id = (select id_nieruchomosc from oferta where id = 856);
update nieruchomosc set id_region_geog = 486 where id = (select id_nieruchomosc from oferta where id = 867);
update nieruchomosc set id_region_geog = 483 where id = (select id_nieruchomosc from oferta where id = 868);
update nieruchomosc set id_region_geog = 483 where id = (select id_nieruchomosc from oferta where id = 869);
update nieruchomosc set id_region_geog = 469 where id = (select id_nieruchomosc from oferta where id = 885);
update nieruchomosc set id_region_geog = 615 where id = (select id_nieruchomosc from oferta where id = 909);
update nieruchomosc set id_region_geog = 478 where id = (select id_nieruchomosc from oferta where id = 911);
update nieruchomosc set id_region_geog = 1052 where id = (select id_nieruchomosc from oferta where id = 914);
update nieruchomosc set id_region_geog = 501 where id = (select id_nieruchomosc from oferta where id = 920);
update nieruchomosc set id_region_geog = 1159 where id = (select id_nieruchomosc from oferta where id = 938);
update nieruchomosc set id_region_geog = 618 where id = (select id_nieruchomosc from oferta where id = 1006);
update nieruchomosc set id_region_geog = 618 where id = (select id_nieruchomosc from oferta where id = 1007);
update nieruchomosc set id_region_geog = 476 where id = (select id_nieruchomosc from oferta where id = 1009);
update nieruchomosc set id_region_geog = 618 where id = (select id_nieruchomosc from oferta where id = 1015);
update nieruchomosc set id_region_geog = 526 where id = (select id_nieruchomosc from oferta where id = 1028);
update nieruchomosc set id_region_geog = 510 where id = (select id_nieruchomosc from oferta where id = 1052);
update nieruchomosc set id_region_geog = 620 where id = (select id_nieruchomosc from oferta where id = 1107);
update nieruchomosc set id_region_geog = 480 where id = (select id_nieruchomosc from oferta where id = 1117);
update nieruchomosc set id_region_geog = 1457 where id = (select id_nieruchomosc from oferta where id = 1124);
update nieruchomosc set id_region_geog = 576 where id = (select id_nieruchomosc from oferta where id = 1130);
update nieruchomosc set id_region_geog = 527 where id = (select id_nieruchomosc from oferta where id = 1161);
update nieruchomosc set id_region_geog = 1065 where id = (select id_nieruchomosc from oferta where id = 1205);
update nieruchomosc set id_region_geog = 698 where id = (select id_nieruchomosc from oferta where id = 1217);
update nieruchomosc set id_region_geog = 527 where id = (select id_nieruchomosc from oferta where id = 1223);
update nieruchomosc set id_region_geog = 597 where id = (select id_nieruchomosc from oferta where id = 1224);
update nieruchomosc set id_region_geog = 503 where id = (select id_nieruchomosc from oferta where id = 1225);
update nieruchomosc set id_region_geog = 503 where id = (select id_nieruchomosc from oferta where id = 1227);
update nieruchomosc set id_region_geog = 1588 where id = (select id_nieruchomosc from oferta where id = 1228);
update nieruchomosc set id_region_geog = 472 where id = (select id_nieruchomosc from oferta where id = 1307);
update nieruchomosc set id_region_geog = 31377 where id = (select id_nieruchomosc from oferta where id = 1331);
update nieruchomosc set id_region_geog = 19205 where id = (select id_nieruchomosc from oferta where id = 1333);
update nieruchomosc set id_region_geog = 655 where id = (select id_nieruchomosc from oferta where id = 1340);
update nieruchomosc set id_region_geog = 628 where id = (select id_nieruchomosc from oferta where id = 1614);
update nieruchomosc set id_region_geog = 779 where id = (select id_nieruchomosc from oferta where id = 1910);
update nieruchomosc set id_region_geog = 527 where id = (select id_nieruchomosc from oferta where id = 1916);
update nieruchomosc set id_region_geog = 56428 where id = (select id_nieruchomosc from oferta where id = 1059);
update nieruchomosc set id_region_geog = 56443 where id = (select id_nieruchomosc from oferta where id = 17);
update nieruchomosc set id_region_geog = 56441 where id = (select id_nieruchomosc from oferta where id = 32);
update nieruchomosc set id_region_geog = 56430 where id = (select id_nieruchomosc from oferta where id = 122);
update nieruchomosc set id_region_geog = 56434 where id = (select id_nieruchomosc from oferta where id = 245);
update nieruchomosc set id_region_geog = 56435 where id = (select id_nieruchomosc from oferta where id = 268);
update nieruchomosc set id_region_geog = 56446 where id = (select id_nieruchomosc from oferta where id = 306);
update nieruchomosc set id_region_geog = 56427 where id = (select id_nieruchomosc from oferta where id = 396);
update nieruchomosc set id_region_geog = 56446 where id = (select id_nieruchomosc from oferta where id = 461);
update nieruchomosc set id_region_geog = 56446 where id = (select id_nieruchomosc from oferta where id = 491);
update nieruchomosc set id_region_geog = 56434 where id = (select id_nieruchomosc from oferta where id = 611);
update nieruchomosc set id_region_geog = 56443 where id = (select id_nieruchomosc from oferta where id = 639);
update nieruchomosc set id_region_geog = 56441 where id = (select id_nieruchomosc from oferta where id = 640);
update nieruchomosc set id_region_geog = 56444 where id = (select id_nieruchomosc from oferta where id = 668);
update nieruchomosc set id_region_geog = 56446 where id = (select id_nieruchomosc from oferta where id = 675);
update nieruchomosc set id_region_geog = 56446 where id = (select id_nieruchomosc from oferta where id = 676);
update nieruchomosc set id_region_geog = 56441 where id = (select id_nieruchomosc from oferta where id = 701);
update nieruchomosc set id_region_geog = 56430 where id = (select id_nieruchomosc from oferta where id = 714);
update nieruchomosc set id_region_geog = 56435 where id = (select id_nieruchomosc from oferta where id = 715);
update nieruchomosc set id_region_geog = 502 where id = (select id_nieruchomosc from oferta where id = 733);
update nieruchomosc set id_region_geog = 500 where id = (select id_nieruchomosc from oferta where id = 744);
update nieruchomosc set id_region_geog = 56439 where id = (select id_nieruchomosc from oferta where id = 762);
update nieruchomosc set id_region_geog = 56423 where id = (select id_nieruchomosc from oferta where id = 809);
update nieruchomosc set id_region_geog = 56420 where id = (select id_nieruchomosc from oferta where id = 811);
update nieruchomosc set id_region_geog = 56426 where id = (select id_nieruchomosc from oferta where id = 814);
update nieruchomosc set id_region_geog = 56446 where id = (select id_nieruchomosc from oferta where id = 817);
update nieruchomosc set id_region_geog = 56446 where id = (select id_nieruchomosc from oferta where id = 821);
update nieruchomosc set id_region_geog = 56446 where id = (select id_nieruchomosc from oferta where id = 823);
update nieruchomosc set id_region_geog = 632 where id = (select id_nieruchomosc from oferta where id = 890);
update nieruchomosc set id_region_geog = 56440 where id = (select id_nieruchomosc from oferta where id = 901);
update nieruchomosc set id_region_geog = 56440 where id = (select id_nieruchomosc from oferta where id = 904);
update nieruchomosc set id_region_geog = 56446 where id = (select id_nieruchomosc from oferta where id = 910);
update nieruchomosc set id_region_geog = 56423 where id = (select id_nieruchomosc from oferta where id = 921);
update nieruchomosc set id_region_geog = 56425 where id = (select id_nieruchomosc from oferta where id = 952);
update nieruchomosc set id_region_geog = 623 where id = (select id_nieruchomosc from oferta where id = 1067);
update nieruchomosc set id_region_geog = 490 where id = (select id_nieruchomosc from oferta where id = 1166);
update nieruchomosc set id_region_geog = 56423 where id = (select id_nieruchomosc from oferta where id = 1184);
update nieruchomosc set id_region_geog = 56445 where id = (select id_nieruchomosc from oferta where id = 1186);
update nieruchomosc set id_region_geog = 628 where id = (select id_nieruchomosc from oferta where id = 1237);
update nieruchomosc set id_region_geog = 594 where id = (select id_nieruchomosc from oferta where id = 1302);
update nieruchomosc set id_region_geog = 19231 where id = (select id_nieruchomosc from oferta where id = 1334);
update nieruchomosc set id_region_geog = 520 where id = (select id_nieruchomosc from oferta where id = 2013);
update nieruchomosc set id_region_geog = 512 where id = (select id_nieruchomosc from oferta where id = 2020);


---insert into kategoria_allegro (id_nier_rodzaj, id_trans_rodzaj, id_powiat, kategoria_allegro) select id_rodzaj_nieruchomosci, 1, region_geog.id, kategoria_allegro from kategorie_allegro join powiaty on kategorie_allegro.id_powiat = powiaty.id_pow where powiaty.nazwa = region_geog.nazwa;

--from region_geog where nazwa = (select nazwa_p from powiaty where id_pow = k1.id_powiat))

---agergacja do dzielnic nieruchomosci z opola
update nieruchomosc set id_region_geog = (select id from region_geog where nazwa = '¦ródmie¶cie' and id_parent = 574) where lower(ulica_net) like '%r%dmie%cie%';
update nieruchomosc set id_region_geog = (select id from region_geog where nazwa = '¦ródmie¶cie' and id_parent = 574) where lower(ulica_net) like '%rejta%';
update nieruchomosc set id_region_geog = (select id from region_geog where nazwa = '¦ródmie¶cie' and id_parent = 574) where lower(ulica_net) like '%olesk%';
update nieruchomosc set id_region_geog = (select id from region_geog where nazwa = '¦ródmie¶cie' and id_parent = 574) where lower(ulica_net) like '%maja%';
update nieruchomosc set id_region_geog = (select id from region_geog where nazwa = '¦ródmie¶cie' and id_parent = 574) where lower(ulica_net) like '%torowa%';
update nieruchomosc set id_region_geog = (select id from region_geog where nazwa = '¦ródmie¶cie' and id_parent = 574) where lower(ulica_net) like '%katowic%';
update nieruchomosc set id_region_geog = (select id from region_geog where nazwa = '¦ródmie¶cie' and id_parent = 574) where lower(ulica_net) like '%orl%t%lwow%';
update nieruchomosc set id_region_geog = (select id from region_geog where nazwa = '¦ródmie¶cie' and id_parent = 574) where lower(ulica_net) like '%general%';
update nieruchomosc set id_region_geog = (select id from region_geog where nazwa = '¦ródmie¶cie' and id_parent = 574) where lower(ulica_net) like '%kraszews%';
update nieruchomosc set id_region_geog = (select id from region_geog where nazwa = 'Centrum' and id_parent = 574) where lower(ulica_net) like '%centru%';
update nieruchomosc set id_region_geog = (select id from region_geog where nazwa = 'Centrum' and id_parent = 574) where lower(ulica_net) like '%rynek%';
update nieruchomosc set id_region_geog = (select id from region_geog where nazwa = 'Centrum' and id_parent = 574) where lower(ulica_net) like '%ko%taja%';
update nieruchomosc set id_region_geog = (select id from region_geog where nazwa = 'Centrum' and id_parent = 574) where lower(ulica_net) like '%teatral%';
update nieruchomosc set id_region_geog = (select id from region_geog where nazwa = 'Wójtowa Wie¶' and id_parent = 574) where lower(ulica_net) like '%jtowa%';
update nieruchomosc set id_region_geog = (select id from region_geog where nazwa = 'Nowa Wie¶ Królewska' and zaglebienie = 5 and id_parent = 574) where lower(ulica_net) like '%owa%lewsk%';
update nieruchomosc set id_region_geog = (select id from region_geog where nazwa = 'Nowa Wie¶ Królewska' and zaglebienie = 5 and id_parent = 574) where lower(ulica_net) like '%nwk%';
update nieruchomosc set id_region_geog = (select id from region_geog where nazwa = 'Pó³wie¶' and zaglebienie = 5 and id_parent = 574) where lower(ulica_net) like '%p%³wie%';
---wladowaine calego zwm do starego tak, aby oferty z wpisem samego zwm poszly do starego zwm
update nieruchomosc set id_region_geog = (select id from region_geog where nazwa = 'Stary ZWM' and id_parent = 574) where lower(ulica_net) like '%zwm%';
---zweryfikowanie nowego i starego zwm zgodnie z wpisami rozgraniczajacymi zwm'y
update nieruchomosc set id_region_geog = (select id from region_geog where nazwa = 'Nowy ZWM' and id_parent = 574), ulica_net = 'Opole - Nowy ZWM' where lower(ulica_net) like '%n%zwm%';
update nieruchomosc set id_region_geog = (select id from region_geog where nazwa = 'Nowy ZWM' and id_parent = 574) where lower(ulica_net) like '%szarych%sz%';
update nieruchomosc set id_region_geog = (select id from region_geog where nazwa = 'Stary ZWM' and id_parent = 574), ulica_net = 'Opole - Stary ZWM' where lower(ulica_net) like '%s%zwm%';
update nieruchomosc set id_region_geog = (select id from region_geog where nazwa = 'Stary ZWM' and id_parent = 574) where lower(ulica_net) like '%jankowsk%';
update nieruchomosc set id_region_geog = (select id from region_geog where nazwa = 'Stary ZWM' and id_parent = 574) where lower(ulica_net) like '%politech%';
update nieruchomosc set id_region_geog = (select id from region_geog where nazwa = 'Stary ZWM' and id_parent = 574) where lower(ulica_net) like '%fi%dorf%';
update nieruchomosc set id_region_geog = (select id from region_geog where nazwa = 'Stary ZWM' and id_parent = 574) where lower(ulica_net) like '%pu%aka%';
update nieruchomosc set id_region_geog = (select id from region_geog where nazwa = 'Stary ZWM' and id_parent = 574) where lower(ulica_net) like '%hubala%';

update nieruchomosc set id_region_geog = (select id from region_geog where nazwa = 'Metalchem' and id_parent = 574), ulica_net = 'Opole - Metalchem' where lower(ulica_net) like '%metal%';
update nieruchomosc set id_region_geog = (select id from region_geog where nazwa = 'Medyk' and id_parent = 574) where lower(ulica_net) like '%medyk%';
update nieruchomosc set id_region_geog = (select id from region_geog where nazwa = 'Chabry' and id_parent = 574), ulica_net = 'Opole - Chabry' where lower(ulica_net) like '%chabr%';
update nieruchomosc set id_region_geog = (select id from region_geog where nazwa = 'Chabry' and id_parent = 574) where lower(ulica_net) like '%luboszycka%';
update nieruchomosc set id_region_geog = (select id from region_geog where nazwa = 'Malinka' and id_parent = 574) where lower(ulica_net) like '%malink%';
update nieruchomosc set id_region_geog = (select id from region_geog where nazwa = 'Malinka' and id_parent = 574) where lower(ulica_net) like '%rzeszow%';
update nieruchomosc set id_region_geog = (select id from region_geog where nazwa = 'Malinka' and id_parent = 574) where lower(ulica_net) like '%piotrkow%';
update nieruchomosc set id_region_geog = (select id from region_geog where nazwa = 'Malinka II' and id_parent = 574) where lower(ulica_net) like '%malink%ii%';
update nieruchomosc set id_region_geog = (select id from region_geog where nazwa = 'Malina' and id_parent = 574) where lower(ulica_net) like '%malina%';
update nieruchomosc set id_region_geog = (select id from region_geog where nazwa = 'Koszyka' and id_parent = 574) where lower(ulica_net) like '%koszyk%';
update nieruchomosc set id_region_geog = (select id from region_geog where nazwa = 'Dambonia' and id_parent = 574) where lower(ulica_net) like '%dambo%';
update nieruchomosc set id_region_geog = (select id from region_geog where nazwa = 'Zakrzów' and id_parent = 574) where lower(ulica_net) like '%zakrz%';
update nieruchomosc set id_region_geog = (select id from region_geog where nazwa = 'Zaodrze' and id_parent = 574) where lower(ulica_net) like '%zaodrz%';
update nieruchomosc set id_region_geog = (select id from region_geog where nazwa = 'Zaodrze' and id_parent = 574) where lower(ulica_net) like '%spychals%';
update nieruchomosc set id_region_geog = (select id from region_geog where nazwa = 'Zaodrze' and id_parent = 574) where lower(ulica_net) like '%wroc%awsk%';
update nieruchomosc set id_region_geog = (select id from region_geog where nazwa = 'Zaodrze' and id_parent = 574) where lower(ulica_net) like '%pl%kazimierz%';
update nieruchomosc set id_region_geog = (select id from region_geog where nazwa = 'Wyspa Pasieka' and id_parent = 574) where lower(ulica_net) like '%pasiek%';
update nieruchomosc set id_region_geog = (select id from region_geog where nazwa = 'Wyspa Pasieka' and id_parent = 574) where lower(ulica_net) like '%wyspa%';
update nieruchomosc set id_region_geog = (select id from region_geog where nazwa = 'Wyspa Bolko' and id_parent = 574) where lower(ulica_net) like '%bolko%';
update nieruchomosc set id_region_geog = (select id from region_geog where nazwa = 'Wróblin' and id_parent = 574) where lower(ulica_net) like '%wr%blin%';
update nieruchomosc set id_region_geog = (select id from region_geog where nazwa = 'Szczepanowice' and id_parent = 574) where lower(ulica_net) like '%szczepan%';
update nieruchomosc set id_region_geog = (select id from region_geog where nazwa = 'Kolonia Gos³awicka' and id_parent = 574) where lower(ulica_net) like '%gos%awicka%';
update nieruchomosc set id_region_geog = (select id from region_geog where nazwa = 'Gos³awice' and id_parent = 574) where lower(ulica_net) like '%gos%awice%';
update nieruchomosc set id_region_geog = (select id from region_geog where nazwa = 'Groszowice' and id_parent = 574) where lower(ulica_net) like '%groszow%';
update nieruchomosc set id_region_geog = (select id from region_geog where nazwa = 'Grudzice' and id_parent = 574) where lower(ulica_net) like '%grudzi%';
update nieruchomosc set id_region_geog = (select id from region_geog where nazwa = 'Bierkowice' and id_parent = 574) where lower(ulica_net) like '%bierko%';
update nieruchomosc set id_region_geog = (select id from region_geog where nazwa = 'Kolorowe' and id_parent = 574) where lower(ulica_net) like '%kolorow%';
update nieruchomosc set id_region_geog = (select id from region_geog where nazwa = 'Bezpieczne' and id_parent = 574) where lower(ulica_net) like '%bezpiecz%';
update nieruchomosc set id_region_geog = (select id from region_geog where nazwa = 'Osiedle Zawada' and id_parent = 574) where lower(ulica_net) like '%opole%zawada%';


insert into dane_slow_wyp_nier (id_nieruchomosc, id_wyposazenie_nier) select id_nieruchomosc, (select id from wyposazenie_nier where nazwa = '_poludnie') from dane_slow_wyp_nier 
where id_wyposazenie_nier = (select id from wyposazenie_nier where nazwa = '_poludniowy___zachod');
insert into dane_slow_wyp_nier (id_nieruchomosc, id_wyposazenie_nier) select id_nieruchomosc, (select id from wyposazenie_nier where nazwa = '_zachod') from dane_slow_wyp_nier 
where id_wyposazenie_nier = (select id from wyposazenie_nier where nazwa = '_poludniowy___zachod');

delete from dane_slow_wyp_nier where id_wyposazenie_nier = (select id from wyposazenie_nier where nazwa = '_poludniowy___zachod');

insert into dane_slow_wyp_nier (id_nieruchomosc, id_wyposazenie_nier) select id_nieruchomosc, (select id from wyposazenie_nier where nazwa = '_poludnie') from dane_slow_wyp_nier 
where id_wyposazenie_nier = (select id from wyposazenie_nier where nazwa = '_poludniowy___wschod');
insert into dane_slow_wyp_nier (id_nieruchomosc, id_wyposazenie_nier) select id_nieruchomosc, (select id from wyposazenie_nier where nazwa = '_wschod') from dane_slow_wyp_nier 
where id_wyposazenie_nier = (select id from wyposazenie_nier where nazwa = '_poludniowy___wschod');

delete from dane_slow_wyp_nier where id_wyposazenie_nier = (select id from wyposazenie_nier where nazwa = '_poludniowy___wschod');

insert into dane_slow_wyp_nier (id_nieruchomosc, id_wyposazenie_nier) select id_nieruchomosc, (select id from wyposazenie_nier where nazwa = '_polnoc') from dane_slow_wyp_nier 
where id_wyposazenie_nier = (select id from wyposazenie_nier where nazwa = '_polnoc___poludnie');
insert into dane_slow_wyp_nier (id_nieruchomosc, id_wyposazenie_nier) select id_nieruchomosc, (select id from wyposazenie_nier where nazwa = '_poludnie') from dane_slow_wyp_nier 
where id_wyposazenie_nier = (select id from wyposazenie_nier where nazwa = '_polnoc___poludnie');

delete from dane_slow_wyp_nier where id_wyposazenie_nier = (select id from wyposazenie_nier where nazwa = '_polnoc___poludnie');

insert into dane_slow_wyp_nier (id_nieruchomosc, id_wyposazenie_nier) select id_nieruchomosc, (select id from wyposazenie_nier where nazwa = '_polnoc') from dane_slow_wyp_nier 
where id_wyposazenie_nier = (select id from wyposazenie_nier where nazwa = '_polnocny___wschod');
insert into dane_slow_wyp_nier (id_nieruchomosc, id_wyposazenie_nier) select id_nieruchomosc, (select id from wyposazenie_nier where nazwa = '_wschod') from dane_slow_wyp_nier 
where id_wyposazenie_nier = (select id from wyposazenie_nier where nazwa = '_polnocny___wschod');

delete from dane_slow_wyp_nier where id_wyposazenie_nier = (select id from wyposazenie_nier where nazwa = '_polnocny___wschod');

insert into dane_slow_wyp_nier (id_nieruchomosc, id_wyposazenie_nier) select id_nieruchomosc, (select id from wyposazenie_nier where nazwa = '_polnoc') from dane_slow_wyp_nier 
where id_wyposazenie_nier = (select id from wyposazenie_nier where nazwa = '_polnocny___zachod');
insert into dane_slow_wyp_nier (id_nieruchomosc, id_wyposazenie_nier) select id_nieruchomosc, (select id from wyposazenie_nier where nazwa = '_zachod') from dane_slow_wyp_nier 
where id_wyposazenie_nier = (select id from wyposazenie_nier where nazwa = '_polnocny___zachod');

delete from dane_slow_wyp_nier where id_wyposazenie_nier = (select id from wyposazenie_nier where nazwa = '_polnocny___zachod');

insert into dane_slow_wyp_nier (id_nieruchomosc, id_wyposazenie_nier) select id_nieruchomosc, (select id from wyposazenie_nier where nazwa = '_wschod') from dane_slow_wyp_nier 
where id_wyposazenie_nier = (select id from wyposazenie_nier where nazwa = '_wschod___zachod');
insert into dane_slow_wyp_nier (id_nieruchomosc, id_wyposazenie_nier) select id_nieruchomosc, (select id from wyposazenie_nier where nazwa = '_zachod') from dane_slow_wyp_nier 
where id_wyposazenie_nier = (select id from wyposazenie_nier where nazwa = '_wschod___zachod');

delete from dane_slow_wyp_nier where id_wyposazenie_nier = (select id from wyposazenie_nier where nazwa = '_wschod___zachod');
---wykasowac kombinacje wystawek okien, o ile nie bedzie nielogiczne, ze na str int po 2 razy sie bedzie pojawiac wystawka okien

---sekcja podstawowa - ulozenia na stronie
update wyposazenie_nier set waga = 1 where nazwa = '_polozenie';
update wyposazenie_nier set waga = 1 where id_parent = (select id from wyposazenie_nier where nazwa = '_polozenie');
update wyposazenie_nier set waga = 2 where nazwa = '_standard';
update wyposazenie_nier set waga = 2 where id_parent = (select id from wyposazenie_nier where nazwa = '_standard');
update wyposazenie_nier set waga = 3 where nazwa = '_stan';
update wyposazenie_nier set waga = 3 where id_parent = (select id from wyposazenie_nier where nazwa = '_stan');
update wyposazenie_nier set waga = 4 where nazwa = '_stan_prawny';
update wyposazenie_nier set waga = 4 where id_parent = (select id from wyposazenie_nier where nazwa = '_stan_prawny');
update wyposazenie_nier set waga = 5 where nazwa = '_stan_prawny_dzialka';
update wyposazenie_nier set waga = 5 where id_parent = (select id from wyposazenie_nier where nazwa = '_stan_prawny_dzialka');
update wyposazenie_nier set waga = 6 where nazwa = '_okazja';
update wyposazenie_nier set waga = 6 where id_parent = (select id from wyposazenie_nier where nazwa = '_okazja');
update wyposazenie_nier set waga = 7 where nazwa = '_ksiega_wieczysta';
update wyposazenie_nier set waga = 7 where id_parent = (select id from wyposazenie_nier where nazwa = '_ksiega_wieczysta');
update wyposazenie_nier set waga = 8 where nazwa = '_pozwolenie_na_bud';
update wyposazenie_nier set waga = 8 where id_parent = (select id from wyposazenie_nier where nazwa = '_pozwolenie_na_bud');

update wyposazenie_nier set waga = 2 where nazwa = '_dzialka';
update wyposazenie_nier set waga = 2 where id_parent = (select id from wyposazenie_nier where nazwa = '_dzialka');
update wyposazenie_nier set waga = 5 where nazwa = '_uksztaltowanie_dzialka';
update wyposazenie_nier set waga = 5 where id_parent = (select id from wyposazenie_nier where nazwa = '_uksztaltowanie_dzialka');
update wyposazenie_nier set waga = 6 where nazwa = '_zadrzewienie_dzialka';
update wyposazenie_nier set waga = 6 where id_parent = (select id from wyposazenie_nier where nazwa = '_zadrzewienie_dzialka');
update wyposazenie_nier set waga = 1 where nazwa = '_okna';
update wyposazenie_nier set waga = 1 where id_parent = (select id from wyposazenie_nier where nazwa = '_okna');
update wyposazenie_nier set waga = 3 where nazwa = '_dzialka_narozna';
update wyposazenie_nier set waga = 3 where id_parent = (select id from wyposazenie_nier where nazwa = '_dzialka_narozna');
update wyposazenie_nier set waga = 4 where nazwa = '_dzialka_ogrodzona';
update wyposazenie_nier set waga = 4 where id_parent = (select id from wyposazenie_nier where nazwa = '_dzialka_ogrodzona');
update wyposazenie_nier set waga = 7 where nazwa = '_mozliwosc_podzial';
update wyposazenie_nier set waga = 7 where id_parent = (select id from wyposazenie_nier where nazwa = '_mozliwosc_podzial');
update wyposazenie_nier set waga = 8 where nazwa = '_uslugi';
update wyposazenie_nier set waga = 8 where id_parent = (select id from wyposazenie_nier where nazwa = '_uslugi');

update wyposazenie_nier set waga = 4 where nazwa = '_dach';
update wyposazenie_nier set waga = 4 where id_parent = (select id from wyposazenie_nier where nazwa = '_dach');
update wyposazenie_nier set waga = 3 where nazwa = '_material_budowlany';
update wyposazenie_nier set waga = 3 where id_parent = (select id from wyposazenie_nier where nazwa = '_material_budowlany');
update wyposazenie_nier set waga = 6 where nazwa = '_przeksztalcenie';
update wyposazenie_nier set waga = 6 where id_parent = (select id from wyposazenie_nier where nazwa = '_przeksztalcenie');
update wyposazenie_nier set waga = 1 where nazwa = '_rodzaj_budynku';
update wyposazenie_nier set waga = 1 where id_parent = (select id from wyposazenie_nier where nazwa = '_rodzaj_budynku');
update wyposazenie_nier set waga = 2 where nazwa = '_technologia_budowlana';
update wyposazenie_nier set waga = 2 where id_parent = (select id from wyposazenie_nier where nazwa = '_technologia_budowlana');
update wyposazenie_nier set waga = 5 where nazwa = '_wystawka_okien';
update wyposazenie_nier set waga = 5 where id_parent = (select id from wyposazenie_nier where nazwa = '_wystawka_okien');

update wyposazenie_nier set waga = 6 where nazwa = '_ciepla_woda';
update wyposazenie_nier set waga = 6 where id_parent = (select id from wyposazenie_nier where nazwa = '_ciepla_woda');
update wyposazenie_nier set waga = 4 where nazwa = '_gaz';
update wyposazenie_nier set waga = 4 where id_parent = (select id from wyposazenie_nier where nazwa = '_gaz');
update wyposazenie_nier set waga = 7 where nazwa = '_kanalizacja';
update wyposazenie_nier set waga = 7 where id_parent = (select id from wyposazenie_nier where nazwa = '_kanalizacja');
update wyposazenie_nier set waga = 5 where nazwa = '_ogrzewanie';
update wyposazenie_nier set waga = 5 where id_parent = (select id from wyposazenie_nier where nazwa = '_ogrzewanie');
update wyposazenie_nier set waga = 11 where nazwa = '_antena';
update wyposazenie_nier set waga = 11 where id_parent = (select id from wyposazenie_nier where nazwa = '_antena');
update wyposazenie_nier set waga = 10 where nazwa = '_kablowa';
update wyposazenie_nier set waga = 10 where id_parent = (select id from wyposazenie_nier where nazwa = '_kablowa');
update wyposazenie_nier set waga = 1 where nazwa = '_prad';
update wyposazenie_nier set waga = 1 where id_parent = (select id from wyposazenie_nier where nazwa = '_prad');
update wyposazenie_nier set waga = 9 where nazwa = '_siec_internet';
update wyposazenie_nier set waga = 9 where id_parent = (select id from wyposazenie_nier where nazwa = '_siec_internet');
update wyposazenie_nier set waga = 2 where nazwa = '_sila';
update wyposazenie_nier set waga = 2 where id_parent = (select id from wyposazenie_nier where nazwa = '_sila');
update wyposazenie_nier set waga = 8 where nazwa = '_telefon';
update wyposazenie_nier set waga = 8 where id_parent = (select id from wyposazenie_nier where nazwa = '_telefon');
update wyposazenie_nier set waga = 3 where nazwa = '_woda';
update wyposazenie_nier set waga = 3 where id_parent = (select id from wyposazenie_nier where nazwa = '_woda');

update wyposazenie_nier set waga = 3 where nazwa = '_alarm';
update wyposazenie_nier set waga = 3 where id_parent = (select id from wyposazenie_nier where nazwa = '_alarm');
update wyposazenie_nier set waga = 4 where nazwa = '_domofon';
update wyposazenie_nier set waga = 4 where id_parent = (select id from wyposazenie_nier where nazwa = '_domofon');
update wyposazenie_nier set waga = 1 where nazwa = '_drzwi_antywlamaniowe';
update wyposazenie_nier set waga = 1 where id_parent = (select id from wyposazenie_nier where nazwa = '_drzwi_antywlamaniowe');
update wyposazenie_nier set waga = 7 where nazwa = '_kamery';
update wyposazenie_nier set waga = 7 where id_parent = (select id from wyposazenie_nier where nazwa = '_kamery');
update wyposazenie_nier set waga = 5 where nazwa = '_kraty';
update wyposazenie_nier set waga = 5 where id_parent = (select id from wyposazenie_nier where nazwa = '_kraty');
update wyposazenie_nier set waga = 6 where nazwa = '_ochrona';
update wyposazenie_nier set waga = 6 where id_parent = (select id from wyposazenie_nier where nazwa = '_ochrona');
update wyposazenie_nier set waga = 2 where nazwa = '_okna_anty';
update wyposazenie_nier set waga = 2 where id_parent = (select id from wyposazenie_nier where nazwa = '_okna_anty');
update wyposazenie_nier set waga = 8 where nazwa = '_osiedle_strzezone';
update wyposazenie_nier set waga = 8 where id_parent = (select id from wyposazenie_nier where nazwa = '_osiedle_strzezone');
update wyposazenie_nier set waga = 9 where nazwa = '_recepcja';
update wyposazenie_nier set waga = 9 where id_parent = (select id from wyposazenie_nier where nazwa = '_recepcja');
update wyposazenie_nier set waga = 10 where nazwa = '_rolety';
update wyposazenie_nier set waga = 10 where id_parent = (select id from wyposazenie_nier where nazwa = '_rolety');

update wyposazenie_nier set waga = 6 where nazwa = '_jaccuzi';
update wyposazenie_nier set waga = 6 where id_parent = (select id from wyposazenie_nier where nazwa = '_jaccuzi');
update wyposazenie_nier set waga = 4 where nazwa = '_klimatyzacja';
update wyposazenie_nier set waga = 4 where id_parent = (select id from wyposazenie_nier where nazwa = '_klimatyzacja');
update wyposazenie_nier set waga = 5 where nazwa = '_kominek';
update wyposazenie_nier set waga = 5 where id_parent = (select id from wyposazenie_nier where nazwa = '_kominek');
update wyposazenie_nier set waga = 3 where nazwa = '_udogodnienia_niepelno';
update wyposazenie_nier set waga = 3 where id_parent = (select id from wyposazenie_nier where nazwa = '_udogodnienia_niepelno');
update wyposazenie_nier set waga = 7 where nazwa = '_sauna';
update wyposazenie_nier set waga = 7 where id_parent = (select id from wyposazenie_nier where nazwa = '_sauna');
update wyposazenie_nier set waga = 1 where nazwa = '_winda';
update wyposazenie_nier set waga = 1 where id_parent = (select id from wyposazenie_nier where nazwa = '_winda');
update wyposazenie_nier set waga = 2 where nazwa = '_zsyp';
update wyposazenie_nier set waga = 2 where id_parent = (select id from wyposazenie_nier where nazwa = '_zsyp');

update wyposazenie_nier set waga = 2 where nazwa = '_oczko';
update wyposazenie_nier set waga = 2 where id_parent = (select id from wyposazenie_nier where nazwa = '_oczko');
update wyposazenie_nier set waga = 1 where nazwa = '_ogrodek';
update wyposazenie_nier set waga = 1 where id_parent = (select id from wyposazenie_nier where nazwa = '_ogrodek');

update wyposazenie_nier set waga = 1 where nazwa = '_sasiedztwo';
update wyposazenie_nier set waga = 1 where id_parent = (select id from wyposazenie_nier where nazwa = '_sasiedztwo');
update wyposazenie_nier set waga = 3 where nazwa = '_bank';
update wyposazenie_nier set waga = 3 where id_parent = (select id from wyposazenie_nier where nazwa = '_bank');
update wyposazenie_nier set waga = 5 where nazwa = '_basen';
update wyposazenie_nier set waga = 5 where id_parent = (select id from wyposazenie_nier where nazwa = '_basen');
update wyposazenie_nier set waga = 2 where nazwa = '_centrumhandlowe';
update wyposazenie_nier set waga = 2 where id_parent = (select id from wyposazenie_nier where nazwa = '_centrumhandlowe');
update wyposazenie_nier set waga = 6 where nazwa = '_fitness';
update wyposazenie_nier set waga = 6 where id_parent = (select id from wyposazenie_nier where nazwa = '_fitness');
update wyposazenie_nier set waga = 12 where nazwa = '_gory';
update wyposazenie_nier set waga = 12 where id_parent = (select id from wyposazenie_nier where nazwa = '_gory');
update wyposazenie_nier set waga = 13 where nazwa = '_jezioro';
update wyposazenie_nier set waga = 13 where id_parent = (select id from wyposazenie_nier where nazwa = '_jezioro');
update wyposazenie_nier set waga = 7 where nazwa = '_kort_tenisowy';
update wyposazenie_nier set waga = 7 where id_parent = (select id from wyposazenie_nier where nazwa = '_kort_tenisowy');
update wyposazenie_nier set waga = 9 where nazwa = '_las';
update wyposazenie_nier set waga = 9 where id_parent = (select id from wyposazenie_nier where nazwa = '_las');
update wyposazenie_nier set waga = 8 where nazwa = '_park';
update wyposazenie_nier set waga = 8 where id_parent = (select id from wyposazenie_nier where nazwa = '_park');
update wyposazenie_nier set waga = 14 where nazwa = '_parking';
update wyposazenie_nier set waga = 14 where id_parent = (select id from wyposazenie_nier where nazwa = '_parking');
update wyposazenie_nier set waga = 15 where nazwa = '_plac_zabaw';
update wyposazenie_nier set waga = 15 where id_parent = (select id from wyposazenie_nier where nazwa = '_plac_zabaw');
update wyposazenie_nier set waga = 16 where nazwa = '_przemysl';
update wyposazenie_nier set waga = 16 where id_parent = (select id from wyposazenie_nier where nazwa = '_przemysl');
update wyposazenie_nier set waga = 4 where nazwa = '_restauracja';
update wyposazenie_nier set waga = 4 where id_parent = (select id from wyposazenie_nier where nazwa = '_restauracja');
update wyposazenie_nier set waga = 10 where nazwa = '_rzeka';
update wyposazenie_nier set waga = 10 where id_parent = (select id from wyposazenie_nier where nazwa = '_rzeka');
update wyposazenie_nier set waga = 11 where nazwa = '_staw';
update wyposazenie_nier set waga = 11 where id_parent = (select id from wyposazenie_nier where nazwa = '_staw');

update wyposazenie_nier set waga = 3 where nazwa = '_komunikacja';
update wyposazenie_nier set waga = 3 where id_parent = (select id from wyposazenie_nier where nazwa = '_komunikacja');
update wyposazenie_nier set waga = 2 where nazwa = '_nawierzchnia';
update wyposazenie_nier set waga = 2 where id_parent = (select id from wyposazenie_nier where nazwa = '_nawierzchnia');
update wyposazenie_nier set waga = 1 where nazwa = '_typ_ulicy';
update wyposazenie_nier set waga = 1 where id_parent = (select id from wyposazenie_nier where nazwa = '_typ_ulicy');

update parametr_nier set waga = 1 where nazwa = '_powierzchnia_uzytkowa';
update parametr_nier set waga = 15 where nazwa = '_powierzchnia_calkowita';
update parametr_nier set waga = 16 where nazwa = '_powierzchnia_zabudowy';
update parametr_nier set waga = 17 where nazwa = '_powierzchnia_pom_biur';
update parametr_nier set waga = 18 where nazwa = '_powierzchnia_witryny';
update parametr_nier set waga = 19 where nazwa = '_powierzchnia_pomieszczen';
update parametr_nier set waga = 20 where nazwa = '_powierzchnia_dzialki';
update parametr_nier set waga = 21 where nazwa = '_powierzchnia_ogrodu';
update parametr_nier set waga = 22 where nazwa = '_powierzchnia_pom_gospodarczych';
update parametr_nier set waga = 23 where nazwa = '_powierzchnia_pom_socjalnych';
update parametr_nier set waga = 30 where nazwa = '_numer_dzialki';
update parametr_nier set waga = 3 where nazwa = '_liczba_pomieszczen';
update parametr_nier set waga = 2 where nazwa = '_liczba_pokoi';
update parametr_nier set waga = 4 where nazwa = '_liczba_kuchni';
update parametr_nier set waga = 5 where nazwa = '_liczba_przedpokoi';
update parametr_nier set waga = 6 where nazwa = '_liczba_lazienek';
update parametr_nier set waga = 7 where nazwa = '_liczba_ubikacji';
update parametr_nier set waga = 8 where nazwa = '_liczba_dod_pom';
update parametr_nier set waga = 9 where nazwa = '_liczba_tarasow';
update parametr_nier set waga = 10 where nazwa = '_liczba_balkonow';
update parametr_nier set waga = 11 where nazwa = '_liczba_kondygnacji';
update parametr_nier set waga = 12 where nazwa = '_liczba_kondygnacji_bud';
update parametr_nier set waga = 24 where nazwa = '_wysokosc_oplat';
update parametr_nier set waga = 25 where nazwa = '_dodatkowe_oplaty';
update parametr_nier set waga = 26 where nazwa = '_liczba_pieter';
update parametr_nier set waga = 27 where nazwa = '_numer_pietra';
update parametr_nier set waga = 28 where nazwa = '_wysokosc_czynszu';
update parametr_nier set waga = 29 where nazwa = '_rok_budowy';
update parametr_nier set waga = 13 where nazwa = '_liczba_witryn';
update parametr_nier set waga = 14 where nazwa = '_liczba_pom_gospodarczych';
update parametr_nier set waga = 15 where nazwa = '_liczba_pom_socjalnych';

update parametr_nier set waga = 1 where nazwa = '_szerokosc';
update parametr_nier set waga = 2 where nazwa = '_dlugosc';

update parametr_nier set waga = 1 where nazwa = '_pow_grunt_orny';
update parametr_nier set waga = 4 where nazwa = '_pow_pastwisko';
update parametr_nier set waga = 2 where nazwa = '_pow_laka';
update parametr_nier set waga = 3 where nazwa = '_pow_las';
update parametr_nier set waga = 6 where nazwa = '_pow_nieuzytki';
update parametr_nier set waga = 7 where nazwa = '_pow_grunt_inny';

---select setval('oferta_id_seq', 3000);

---mailing - przepis na inny slownik - ten trigger sie juz potem inaczej nazywa i nie dropuje
drop TRIGGER "RI_ConstraintTrigger_847295" on mailing;
update mailing set  id_wojewodztwo = (select id from region_geog where nazwa = (select nazwa_w from wojewodztwa where id_w = mailing.id_wojewodztwo));
alter table mailing add constraint mailing_id_wojewodztwo_fkey FOREIGN KEY (id_wojewodztwo) REFERENCES region_geog(id);
update mailing set zgoda = true;

---ewentualne poprawienie kojarzenia przy pokojach i pietrach na precyzyjniejsze
---UPDATE precyzja_kojarzenie set baza = 0 where id = 3;