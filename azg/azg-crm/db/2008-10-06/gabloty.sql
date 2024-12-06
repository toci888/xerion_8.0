drop FUNCTION StanGabloty (integer);
drop FUNCTION PodajOfertyDostepneGablota (integer);
drop FUNCTION DodajOfertaGablota (integer, integer, integer, integer);

drop type oferty_gablota;
drop type gablota_stan;

drop table gablota_zawartosc;
drop table gablota_typ_oferta;
drop table gablota;

---tu ewentualnie trigger na zmiane wymiaru x i/lub y
create table gablota (
id serial primary key,
nazwa text not null,
opis text not null,
wymiar_x integer not null,
wymiar_y integer not null,
pojemnosc integer not null
);

create table gablota_typ_oferta (
id serial primary key,
id_gablota integer references gablota(id) not null,
id_nier_rodzaj integer references nier_rodzaj(id) not null
);

----tabela ofert umieszczonych w gablotach
create table gablota_zawartosc (
id serial primary key,
id_gablota integer references gablota(id) not null,
id_oferta integer references oferta(id) not null,
cena float not null,
wspolrzedna_x integer not null,
wspolrzedna_y integer not null,
data timestamp not null default date_trunc('second', current_timestamp::timestamp)
);

insert into gablota (nazwa, opis, wymiar_x, wymiar_y, pojemnosc) values ('gablota_dom_zachod', 'Gablota domy na nowszym skrzydle szarych', 5, 6, 30);
insert into gablota (nazwa, opis, wymiar_x, wymiar_y, pojemnosc) values ('gablota_mieszkanie_zachod', 'Gablota mieszkania na nowszym skrzydle szarych', 10, 6, 60);
insert into gablota (nazwa, opis, wymiar_x, wymiar_y, pojemnosc) values ('gablota_mieszkanie_polnoc', 'Gablota mieszkania na starszym skrzydle szarych', 10, 6, 60);
insert into gablota (nazwa, opis, wymiar_x, wymiar_y, pojemnosc) values ('gablota_dom_polnoc', 'Gablota domy na starszym skrzydle szarych', 10, 6, 60);
insert into gablota (nazwa, opis, wymiar_x, wymiar_y, pojemnosc) values ('gablota_lokal_polnoc', 'Gablota lokale na starszym skrzydle szarych', 5, 6, 30);

insert into gablota (nazwa, opis, wymiar_x, wymiar_y, pojemnosc) values ('gablota_kosciuszki_prawa', 'Gablota mieszkania na koœciuszki - prawa', 12, 3, 36);
insert into gablota (nazwa, opis, wymiar_x, wymiar_y, pojemnosc) values ('gablota_kosciuszki_lewa', 'Gablota mieszkania na koœciuszki - lewa', 12, 3, 36);

insert into gablota (nazwa, opis, wymiar_x, wymiar_y, pojemnosc) values ('gablota_krakowska', 'Gablota najciekawszych ofert na krakowskiej', 13, 4, 52);
insert into gablota (nazwa, opis, wymiar_x, wymiar_y, pojemnosc) values ('gablota_mieszkanie_bytnara', 'Gablota mieszkania na bytnara', 14, 4, 56);
insert into gablota (nazwa, opis, wymiar_x, wymiar_y, pojemnosc) values ('gablota_dom_bytnara', 'Gablota domy na bytnara', 7, 4, 28);


insert into gablota_typ_oferta (id_gablota, id_nier_rodzaj) values ((select id from gablota where nazwa = 'gablota_dom_zachod'), 1);
insert into gablota_typ_oferta (id_gablota, id_nier_rodzaj) values ((select id from gablota where nazwa = 'gablota_dom_zachod'), 3);
insert into gablota_typ_oferta (id_gablota, id_nier_rodzaj) values ((select id from gablota where nazwa = 'gablota_dom_zachod'), 4);
insert into gablota_typ_oferta (id_gablota, id_nier_rodzaj) values ((select id from gablota where nazwa = 'gablota_mieszkanie_zachod'), 2);
insert into gablota_typ_oferta (id_gablota, id_nier_rodzaj) values ((select id from gablota where nazwa = 'gablota_mieszkanie_polnoc'), 2);
insert into gablota_typ_oferta (id_gablota, id_nier_rodzaj) values ((select id from gablota where nazwa = 'gablota_dom_polnoc'), 1);
insert into gablota_typ_oferta (id_gablota, id_nier_rodzaj) values ((select id from gablota where nazwa = 'gablota_dom_polnoc'), 3);
insert into gablota_typ_oferta (id_gablota, id_nier_rodzaj) values ((select id from gablota where nazwa = 'gablota_lokal_polnoc'), 3);
insert into gablota_typ_oferta (id_gablota, id_nier_rodzaj) values ((select id from gablota where nazwa = 'gablota_lokal_polnoc'), 4);

insert into gablota_typ_oferta (id_gablota, id_nier_rodzaj) values ((select id from gablota where nazwa = 'gablota_kosciuszki_prawa'), 2);
insert into gablota_typ_oferta (id_gablota, id_nier_rodzaj) values ((select id from gablota where nazwa = 'gablota_kosciuszki_lewa'), 2);

insert into gablota_typ_oferta (id_gablota, id_nier_rodzaj) values ((select id from gablota where nazwa = 'gablota_krakowska'), 1);
insert into gablota_typ_oferta (id_gablota, id_nier_rodzaj) values ((select id from gablota where nazwa = 'gablota_krakowska'), 2);
insert into gablota_typ_oferta (id_gablota, id_nier_rodzaj) values ((select id from gablota where nazwa = 'gablota_krakowska'), 3);
insert into gablota_typ_oferta (id_gablota, id_nier_rodzaj) values ((select id from gablota where nazwa = 'gablota_krakowska'), 4);
insert into gablota_typ_oferta (id_gablota, id_nier_rodzaj) values ((select id from gablota where nazwa = 'gablota_krakowska'), 5);
insert into gablota_typ_oferta (id_gablota, id_nier_rodzaj) values ((select id from gablota where nazwa = 'gablota_krakowska'), 6);

insert into gablota_typ_oferta (id_gablota, id_nier_rodzaj) values ((select id from gablota where nazwa = 'gablota_mieszkanie_bytnara'), 2);
insert into gablota_typ_oferta (id_gablota, id_nier_rodzaj) values ((select id from gablota where nazwa = 'gablota_dom_bytnara'), 1);
insert into gablota_typ_oferta (id_gablota, id_nier_rodzaj) values ((select id from gablota where nazwa = 'gablota_dom_bytnara'), 3);
insert into gablota_typ_oferta (id_gablota, id_nier_rodzaj) values ((select id from gablota where nazwa = 'gablota_dom_bytnara'), 4);

create type oferty_gablota as (
id_oferta integer,
nieruchomosc_rodzaj text,
id_nier_rodzaj integer,
id_trans_rodzaj integer,
cena float,
agent text,
data date
);

create type gablota_stan as (
id_oferta integer,
id_nier_rodzaj integer,
id_trans_rodzaj integer,
stan integer,
wspolrzedna_x integer,
wspolrzedna_y integer
);

---drop FUNCTION DodajOfertaGablota (integer, integer, integer, integer);

----procedura dodania elementu do gabloty/ opcja zamiany mozliwa/ poki co zwraca bool, jest konieczne konkretne uzasadnienie stad zwraca text
CREATE FUNCTION DodajOfertaGablota (oferta_id integer, gablota_id integer, wsp_x integer, wsp_y integer) RETURNS slownik AS $$
DECLARE
	rec_of_info record;
	test integer;
	result slownik;
BEGIN
	--sprawdzenie aktualnosci oferty i ceny
	select into rec_of_info cena, nieruchomosc.id_nier_rodzaj from oferta join nieruchomosc on oferta.id_nieruchomosc = nieruchomosc.id where oferta.id = oferta_id and id_status in 
	(select id from status where nazwa not in ('_zawieszona', '_nieaktualna'));
	--id nier rodzaj moze posluzyc do weryfikacji, czy taki typ oferty moze tam wejsc zgodnie z tabela gablota_typ_oferta, 
	---jednak z pomoca tej tabeli do tej procedury inna oferta nie powinna sie przedostac
	select into test id from gablota_typ_oferta where id_gablota = gablota_id and id_nier_rodzaj = rec_of_info.id_nier_rodzaj;
	IF test is not null THEN
		---zalozenie na tym etapie jest takie, ze miejsce, gdzie jest wkladana oferta jest dostepne
		select into test id from gablota_zawartosc where id_gablota = gablota_id and wspolrzedna_x = wsp_x and wspolrzedna_y = wsp_y;
		IF test is not null THEN
			--juz cos tam wisi, moznaby sprawdzac, czy wolno zdjac itd(tu mozliwe zmiany cen itd), nastepnie wpis nowego
			update gablota_zawartosc set id_oferta = oferta_id, cena = rec_of_info.cena::float where id  = test;
			result.id := 1;
			RETURN result;
		ELSE
			--miejsce jest puste, sprawdzenie, czy oferta nie sedzi gdzie indziej
			select into test id from gablota_zawartosc where id_oferta = oferta_id and id_gablota = gablota_id;
			IF test is null THEN
				insert into gablota_zawartosc (id_gablota, id_oferta, cena, wspolrzedna_x, wspolrzedna_y) values (gablota_id, oferta_id, rec_of_info.cena::float, wsp_x, wsp_y);
				result.id := 1;
				RETURN result;
			ELSE
				result.nazwa := '_oferta_jest_juz_w_gablocie';
				RETURN result;
			END IF;
		END IF;
	ELSE
		---taki typ oferty nie moze wskoczyc
		result.nazwa := '_rodzaj_nieruchomosci_nie_dopuszczalny_w_tej_gablocie_lub_oferta_nieaktualna';
		RETURN result;
	END IF;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION PodajOfertyDostepneGablota (gablota_id integer) RETURNS SETOF oferty_gablota AS $$
DECLARE
	result oferty_gablota;
BEGIN
	FOR result in select oferta.id, nier_rodzaj.nazwa, nieruchomosc.id_nier_rodzaj, oferta.id_rodz_trans, oferta.cena, agent.nazwa_pot, oferta.data from oferta 
	join nieruchomosc on oferta.id_nieruchomosc = nieruchomosc.id join agent on nieruchomosc.id_agent = agent.id join nier_rodzaj on nieruchomosc.id_nier_rodzaj = nier_rodzaj.id 
	where oferta.id_status in (select id from status where nazwa not in ('_nieaktualna', '_zawieszona')) and nieruchomosc.id_nier_rodzaj in (select id_nier_rodzaj from gablota_typ_oferta where 
	id_gablota = gablota_id) and oferta.id_rodz_trans = (select id from trans_rodzaj where nazwa = '_sprzedaz') and oferta.id not in (select id_oferta from gablota_zawartosc where id_gablota = gablota_id) LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

---podanie ofert: wolne msc, zmiany cen, do zdjecia z gabloty
CREATE FUNCTION StanGabloty (gablota_id integer) RETURNS SETOF gablota_stan AS $$
DECLARE
	result gablota_stan;
	dane_oferta record;
	rec_temp record;
	dane_gablota record;
	wsp_x integer;
	wsp_y integer;
	test integer;
BEGIN
	wsp_y := 1;
	wsp_x := 1;
	select into dane_gablota * from gablota where id = gablota_id;
	WHILE wsp_y <= dane_gablota.wymiar_y LOOP
		wsp_x := 1;
		WHILE wsp_x <= dane_gablota.wymiar_x LOOP
			select into test id from gablota_zawartosc where wspolrzedna_x = wsp_x and wspolrzedna_y = wsp_y and id_gablota = gablota_id;
			IF test is null THEN
				result.stan := 0;
				result.wspolrzedna_x := wsp_x;
				result.wspolrzedna_y := wsp_y;
				RETURN NEXT result;
			END IF;
			wsp_x := wsp_x + 1;
		END LOOP;
		wsp_y := wsp_y + 1;
	END LOOP;
	--stany beda tak lekko 3: nieaktualna - 3, zmiana ceny - 2, bez zmian - 1, 0 - pusta ???
	FOR dane_oferta in select id_oferta, cena, wspolrzedna_x, wspolrzedna_y from gablota_zawartosc where id_gablota = gablota_id order by wspolrzedna_x, wspolrzedna_y LOOP
		result.id_oferta := dane_oferta.id_oferta;
		result.wspolrzedna_x := dane_oferta.wspolrzedna_x;
		result.wspolrzedna_y := dane_oferta.wspolrzedna_y;
		select into rec_temp id_status, cena, nieruchomosc.id_nier_rodzaj, oferta.id_rodz_trans from oferta join nieruchomosc on oferta.id_nieruchomosc = nieruchomosc.id 
		where oferta.id = dane_oferta.id_oferta and id_status in (select id from status where nazwa not in ('_nieaktualna', '_zawieszona'));
		IF rec_temp.id_status is null THEN
			result.stan := 3;
		ELSIF rec_temp.cena != dane_oferta.cena THEN
			result.stan := 2;
		ELSE
			result.stan := 1;
		END IF;
		result.id_nier_rodzaj := rec_temp.id_nier_rodzaj;
		result.id_trans_rodzaj := rec_temp.id_rodz_trans;
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

select * from DodajOfertaGablota (699, 1, 1, 1);
select * from DodajOfertaGablota (1055, 1, 2, 1);
select * from DodajOfertaGablota (1025, 1, 3, 1);
select * from DodajOfertaGablota (1343, 1, 4, 1);
select * from DodajOfertaGablota (478, 1, 5, 1);
select * from DodajOfertaGablota (2173, 1, 1, 2);
select * from DodajOfertaGablota (2200, 1, 2, 2);
select * from DodajOfertaGablota (1019, 1, 3, 2);
select * from DodajOfertaGablota (1017, 1, 4, 2);
select * from DodajOfertaGablota (2020, 1, 5, 2);
select * from DodajOfertaGablota (450, 1, 1, 3);
select * from DodajOfertaGablota (2174, 1, 2, 3);
select * from DodajOfertaGablota (2176, 1, 3, 3);
select * from DodajOfertaGablota (2175, 1, 4, 3);
select * from DodajOfertaGablota (448, 1, 5, 3);
select * from DodajOfertaGablota (1614, 1, 1, 4);
select * from DodajOfertaGablota (1341, 1, 2, 4);
select * from DodajOfertaGablota (1186, 1, 3, 4);
select * from DodajOfertaGablota (2177, 1, 4, 4);
select * from DodajOfertaGablota (482, 1, 5, 4);
select * from DodajOfertaGablota (477, 1, 1, 5);
select * from DodajOfertaGablota (1067, 1, 2, 5);
select * from DodajOfertaGablota (1916, 1, 3, 5);
select * from DodajOfertaGablota (2172, 1, 4, 5);
select * from DodajOfertaGablota (1605, 1, 5, 5);
select * from DodajOfertaGablota (1617, 1, 1, 6);
select * from DodajOfertaGablota (1531, 1, 2, 6);
select * from DodajOfertaGablota (2203, 1, 3, 6);
select * from DodajOfertaGablota (1059, 1, 4, 6);
select * from DodajOfertaGablota (1333, 1, 5, 6);

UPDATE gablota_zawartosc set cena = 890000 where id = 18;

select * from DodajOfertaGablota (2192, 2, 1, 1);
select * from DodajOfertaGablota (1155, 2, 2, 1);
select * from DodajOfertaGablota (2170, 2, 3, 1);
select * from DodajOfertaGablota (2211, 2, 4, 1);
select * from DodajOfertaGablota (1184, 2, 5, 1);
select * from DodajOfertaGablota (2165, 2, 1, 2);
select * from DodajOfertaGablota (2196, 2, 2, 2);
select * from DodajOfertaGablota (2025, 2, 3, 2);
select * from DodajOfertaGablota (1923, 2, 4, 2);
select * from DodajOfertaGablota (2229, 2, 5, 2);
select * from DodajOfertaGablota (2162, 2, 1, 3);
select * from DodajOfertaGablota (2232, 2, 2, 3);
select * from DodajOfertaGablota (2234, 2, 3, 3);
select * from DodajOfertaGablota (2001, 2, 4, 3);
select * from DodajOfertaGablota (2193, 2, 5, 3);
select * from DodajOfertaGablota (2189, 2, 1, 4);
select * from DodajOfertaGablota (1920, 2, 2, 4);
select * from DodajOfertaGablota (2230, 2, 3, 4);
select * from DodajOfertaGablota (2168, 2, 4, 4);
select * from DodajOfertaGablota (1073, 2, 5, 4);
select * from DodajOfertaGablota (2198, 2, 1, 5);
select * from DodajOfertaGablota (2014, 2, 2, 5);
select * from DodajOfertaGablota (1349, 2, 3, 5);
select * from DodajOfertaGablota (2009, 2, 4, 5);
select * from DodajOfertaGablota (2197, 2, 5, 5);
select * from DodajOfertaGablota (2022, 2, 1, 6);
select * from DodajOfertaGablota (2224, 2, 2, 6);
select * from DodajOfertaGablota (2181, 2, 3, 6);
select * from DodajOfertaGablota (2226, 2, 4, 6);
select * from DodajOfertaGablota (1536, 2, 5, 6);
select * from DodajOfertaGablota (2008, 2, 6, 1);
select * from DodajOfertaGablota (2007, 2, 7, 1);
select * from DodajOfertaGablota (2213, 2, 8, 1);
select * from DodajOfertaGablota (2187, 2, 9, 1);
select * from DodajOfertaGablota (2221, 2, 10, 1);
select * from DodajOfertaGablota (2231, 2, 6, 2);
select * from DodajOfertaGablota (1053, 2, 7, 2);
select * from DodajOfertaGablota (1921, 2, 8, 2);
select * from DodajOfertaGablota (1179, 2, 9, 2);
select * from DodajOfertaGablota (2169, 2, 10, 2);
select * from DodajOfertaGablota (1351, 2, 6, 3);
select * from DodajOfertaGablota (2179, 2, 7, 3);
select * from DodajOfertaGablota (2189, 2, 8, 3);
select * from DodajOfertaGablota (2222, 2, 9, 3);
select * from DodajOfertaGablota (1240, 2, 10, 3);
select * from DodajOfertaGablota (2016, 2, 6, 4);
select * from DodajOfertaGablota (471, 2, 7, 4);
select * from DodajOfertaGablota (1187, 2, 8, 4);
select * from DodajOfertaGablota (2210, 2, 9, 4);
select * from DodajOfertaGablota (2225, 2, 10, 4);
select * from DodajOfertaGablota (2019, 2, 6, 5);
select * from DodajOfertaGablota (1320, 2, 7, 5);
select * from DodajOfertaGablota (1915, 2, 8, 5);
select * from DodajOfertaGablota (2233, 2, 9, 5);
select * from DodajOfertaGablota (2214, 2, 10, 5);
select * from DodajOfertaGablota (1039, 2, 6, 6);
select * from DodajOfertaGablota (1113, 2, 7, 6);
select * from DodajOfertaGablota (1519, 2, 8, 6);
select * from DodajOfertaGablota (1541, 2, 9, 6);
select * from DodajOfertaGablota (1546, 2, 10, 6);