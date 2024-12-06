drop FUNCTION PodajOfertaGablota (integer);
drop FUNCTION PodajZdjeciaNieruchomosc (integer);
drop FUNCTION PodajIdNierOfId (integer);

drop view OfertaGablota;

drop type oferta_gablota;

create type oferta_gablota as (
id_oferta integer,
id_nieruchomosc integer,
agent text,
email text,
telefon text,
komorka text,
lokalizacja text,
cena text,
cena_pop text,
rodzaj_budynek text,
rynek_pierw boolean,
wylacznosc boolean);

create or replace view OfertaGablota as 
	select oferta.id as id_oferta, oferta.id_rodz_trans as id_trans_rodzaj, oferta.id_status, oferta.cena, oferta.wylacznosc, nieruchomosc.id_nier_rodzaj, 
	nieruchomosc.ulica_net as lokalizacja, nieruchomosc.rynek_pierw, nieruchomosc.id as id_nieruchomosc, nieruchomosc.id_agent, rodz_nier_szczeg.nazwa as rodzaj_budynek from oferta join nieruchomosc on 
	oferta.id_nieruchomosc = nieruchomosc.id join rodz_nier_szczeg on nieruchomosc.id_rodz_nier_szcz = rodz_nier_szczeg.id;


CREATE FUNCTION PodajIdNierOfId (oferta_id integer) RETURNS integer AS $$
DECLARE
	nieruchomosc_id integer;
BEGIN
	select into nieruchomosc_id id_nieruchomosc from oferta where id = oferta_id;
	RETURN nieruchomosc_id;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION PodajZdjeciaNieruchomosc (nieruchomosc_id integer) RETURNS SETOF slownik AS $$
DECLARE
	result slownik;
BEGIN
	FOR result in select id, nazwa from zdjecie where id_nieruchomosc = nieruchomosc_id order by id asc LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION PodajOfertaGablota (oferta_id integer) RETURNS oferta_gablota AS $$
DECLARE
	rec_OfertaGablota OfertaGablota;
	rec_info_agent record;
	result oferta_gablota;
	pop_cena text;
BEGIN
	select into rec_OfertaGablota * from OfertaGablota where id_oferta = oferta_id;
	select into rec_info_agent telefon, komorka, email from agent where id = rec_OfertaGablota.id_agent;
	result.email := rec_info_agent.email;
	result.telefon := rec_info_agent.telefon;
	result.komorka := rec_info_agent.komorka;
-----------------------------------------------------------id jezyk
	select into result.agent nazwa from AgentWersjaOficjalna (1) where id = rec_OfertaGablota.id_agent;

	result.id_oferta := oferta_id;
	result.id_nieruchomosc := rec_OfertaGablota.id_nieruchomosc;
	result.lokalizacja := rec_OfertaGablota.lokalizacja;
	result.cena := rec_OfertaGablota.cena;
	result.rodzaj_budynek := rec_OfertaGablota.rodzaj_budynek;
	result.rynek_pierw := rec_OfertaGablota.rynek_pierw;
	result.wylacznosc := rec_OfertaGablota.wylacznosc;

	select into pop_cena cena.cena from cena where cena.cena != rec_OfertaGablota.cena and cena.id_oferta = rec_OfertaGablota.id_oferta order by cena.data desc limit 1;
	result.cena_pop := pop_cena;

	RETURN result;
END;
$$ LANGUAGE plpgsql;