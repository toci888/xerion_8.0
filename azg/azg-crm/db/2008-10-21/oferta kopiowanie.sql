drop FUNCTION OfertaPowielenie (integer, integer, integer, integer);


CREATE FUNCTION OfertaPowielenie (oferta_id integer, klient_id integer, agent_id integer, osoba_id integer) RETURNS integer AS $$
DECLARE
	akt_data date;
	nieruchomosc_id integer;
	nieruchomosc_id_new integer;
	oferta_id_new integer;
	status_id integer;
	pomieszczenie_rec record;
	pomieszczenie_id integer;
	test integer;
BEGIN
	--sprawdzenie czy istnieje oferta klient itd - oferte trzeba sprawdzic
	select into test id from oferta where id = oferta_id;
	IF test is not null THEN 
		select into akt_data current_date;
		select into status_id id from status where nazwa = '_aktualna';
		select into nieruchomosc_id id_nieruchomosc from oferta where id = oferta_id;
		
		insert into nieruchomosc (id_nier_rodzaj, id_rodz_nier_szcz, id_klient, id_region_geog, ulica_net, ulica, kod, id_agent, data, rynek_pierw, klucz) 
		select id_nier_rodzaj, id_rodz_nier_szcz, klient_id, id_region_geog, ulica_net, ulica, kod, agent_id, akt_data, rynek_pierw, klucz from nieruchomosc where id = nieruchomosc_id;
		
		select into nieruchomosc_id_new currval('nieruchomosc_id_seq');
		insert into oferta (id_rodz_trans, id_nieruchomosc, id_status, data, data_otw_zlecenie, cena, prowizja_proc, prowizja, wylacznosc, pokaz, czas_przekazania, przek_od_otwarcia, id_priorytet_reklama)
		select id_rodz_trans, nieruchomosc_id_new, status_id, akt_data, akt_data, cena, prowizja_proc, prowizja, wylacznosc, false, czas_przekazania, przek_od_otwarcia, id_priorytet_reklama from oferta 
		where id = oferta_id;

		select into oferta_id_new currval('oferta_id_seq');
		insert into cena (id_oferta, id_osoba, id_agent, cena, data, podpis) select id, osoba_id, agent_id, cena, akt_data, true from oferta where id = oferta_id_new;
		insert into osoba_oferta (id_oferta, id_osoba) values (oferta_id_new, osoba_id);
		
		insert into dane_txt_nier (id_nieruchomosc, id_parametr_nier, wartosc) select nieruchomosc_id_new, id_parametr_nier, wartosc from dane_txt_nier where id_nieruchomosc = nieruchomosc_id;
		insert into dane_slow_wyp_nier (id_nieruchomosc, id_wyposazenie_nier) select nieruchomosc_id_new, id_wyposazenie_nier from dane_slow_wyp_nier where id_nieruchomosc = nieruchomosc_id;
		insert into opis (id_oferta, id_jezyk, wartosc) select oferta_id_new, id_jezyk, wartosc from opis where id_oferta = oferta_id;
		
		FOR pomieszczenie_rec in select * from pomieszczenie_przyn_nier where id_nieruchomosc = nieruchomosc_id LOOP
			insert into pomieszczenie_przyn_nier (id_nieruchomosc, id_pomieszczenie, nr_pomieszczenia) values (nieruchomosc_id_new, pomieszczenie_rec.id_pomieszczenie, pomieszczenie_rec.nr_pomieszczenia);
			select into pomieszczenie_id currval ('pomieszczenie_przyn_nier_id_seq');
			insert into dane_txt_pom (id_pomieszczenie_przyn_nier, id_parametr_pom, wartosc) select pomieszczenie_id, id_parametr_pom, wartosc from dane_txt_pom 
			where id_pomieszczenie_przyn_nier = pomieszczenie_rec.id;
			insert into dane_slow_wyp_pom (id_pomieszczenie_przyn_nier, id_wyposazenie_pom) select pomieszczenie_id, id_wyposazenie_pom from dane_slow_wyp_pom 
			where id_pomieszczenie_przyn_nier = pomieszczenie_rec.id;
		END LOOP;
		RETURN oferta_id_new;
	ELSE
		RETURN null;
	END IF;
END;
$$ LANGUAGE plpgsql;