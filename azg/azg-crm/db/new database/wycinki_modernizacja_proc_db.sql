---przy dodaniu/aktualizacji osoby procedura powinna wykorzystywac procedure dodajosoba, gdzie pesel tez powinien byc weryfikowany np ;/
CREATE FUNCTION DodajKlient (klient_id integer, osobowosc_id integer, agent_id integer, region_id integer, firma_dane text[], osoba_dane text[], adres_osoba text[], osoba_id integer) RETURNS SETOF integer AS $$
DECLARE
	klient_new_id integer;
	test integer;
	osoba_new_id integer;
	imie_id integer;
BEGIN
	IF klient_id is null THEN
		---insert
		---select into osoba_new_id id from osoba where pesel = osoba_dane[4];
		--begin ---przemyslec zasadnosc tego bloku z wyjatkiem
		IF osoba_dane is not null or osoba_id is not null THEN
			insert into klient (id_osobowosc, id_agent) values (osobowosc_id, agent_id);
			select into klient_new_id currval('klient_id_seq');
			IF osoba_dane is not null THEN
				select into osoba_new_id DodajOsoba (null, osoba_dane[1]::integer,  osoba_dane[2], osoba_dane[3], osoba_dane[4], osoba_dane[5]::integer, osoba_dane[6], region_id, agent_id, 
				adres_osoba, klient_new_id, ARRAY[osoba_dane[7], osoba_dane[8]], ARRAY[osoba_dane[9], osoba_dane[10]], ARRAY[osoba_dane[11], osoba_dane[12]]);
			END IF;
			IF osoba_id is not null THEN
				perform DodajOsobaKlient(klient_new_id, osoba_id);
			END IF;
			---jesli osoba jest osoba prawna podajemy dodatkowe info o firmie
			IF osobowosc_id = (select id from osobowosc where nazwa = '_osobaprawna') THEN
				---wszystkie dane bedziemy miec w 1 parametrze w postaci tablicy, wiec tylko indexujemy tablice
				insert into dane_firma (id_klient, nazwa, nip, regon, krs, kod_pocztowy, id_region_geog, ulica, numer_dom, numer_miesz) values 
				(klient_new_id, firma_dane[1], firma_dane[2], firma_dane[3], firma_dane[4], firma_dane[5], firma_dane[6]::integer, firma_dane[7], firma_dane[8], firma_dane[9]);
			END IF;
			return next klient_new_id;
		ELSE
			return;
		END IF;
		--exception when not_null_violation then
		--	return null;
		--end;
	ELSE
		---aktualizacja, klient juz jest w bazie; do aktualizacji nigdy nie zostanie podana osoba, wiec nie interesujemy sie tymi danymi
		update klient set id_osobowosc = osobowosc_id where id = klient_id;
		---jesli w ogole jest ktos taki - ciezko zeby go nie bylo :P skoro dostalismy id
		IF found THEN
			---sprawdzamy jaka jest osobowosc klienta; poniewaz jest to aktualizacja osobowosc mogla sie zmienic - to pewnie malo realne ale czasem mozliwe
			IF osobowosc_id = (select id from osobowosc where nazwa = '_osobaprawna') THEN
				---jesli osoba jest prawna sprawdzamy czy juz siedzi w systemie info o firmie - jesli tak aktualizujemy, jesli nie dodajemy nowy rekord
				select into test id_klient from dane_firma where id_klient = klient_id;
				IF test is null THEN
					---rekordu z danymi firmy nie ma, dodajemy
					insert into dane_firma (id_klient, nazwa, nip, regon, krs, kod_pocztowy, id_region_geog, ulica, numer_dom, numer_miesz) values 
					(klient_id, firma_dane[1], firma_dane[2], firma_dane[3], firma_dane[4], firma_dane[5], firma_dane[6]::integer, firma_dane[7], firma_dane[8], firma_dane[9]); 
				ELSE
					---rekord z danymi firmy jest, aktualizujemy go
					update dane_firma set nazwa = firma_dane[1], nip = firma_dane[2], regon = firma_dane[3], krs = firma_dane[4], kod_pocztowy = firma_dane[5], 
					id_region_geog = firma_dane[6]::integer, ulica = firma_dane[7], numer_dom = firma_dane[8], numer_miesz = firma_dane[9] where id_klient = klient_id;
				END IF;
			ELSE
				---osobowosc fizyczna, jesli byla prawna zostaja jakies dane firmy, ktore nie maja racji bytu, nalezy je usunac
				---sprawdzamy czy sa dane firmy
				select into test id_klient from dane_firma where id_klient = klient_id;
				IF test is not null THEN
					delete from dane_firma where id_klient = klient_id;
				END IF;
			END IF;
			RETURN next klient_id;
		ELSE
			RETURN;
		END IF;
	END IF;
END;
$$ LANGUAGE plpgsql;


CREATE FUNCTION EdycjaKlient (klient_id integer) RETURNS KlientOferta AS $$
DECLARE
	result KlientOferta;
	rec_temp record;
	rec_dane_firma record;
	licznik integer;
	os_prawna_id integer;
BEGIN
	select into result.id_osobowosc id_osobowosc from klient where id = klient_id;
	licznik := 1;
	result.id_osoba_klient := null;
	result.id_osoba := null;
	result.imie := null;
	result.nazwisko := null;
	FOR rec_temp IN select osoba_klient.id, id_osoba, imie.nazwa as imie, nazwisko from osoba_klient join osoba on osoba_klient.id_osoba = osoba.id join imie on osoba.id_imie = imie.id where osoba_klient.id_klient = klient_id LOOP
		result.id_osoba_klient[licznik] := rec_temp.id;
		result.id_osoba[licznik] := rec_temp.id_osoba;
		result.imie[licznik] := rec_temp.imie;
		result.nazwisko[licznik] := rec_temp.nazwisko;
		licznik := licznik + 1;
	END LOOP;
	---sprawdzenie czy mamy do czynienia z osoba prawna
	select into os_prawna_id id from osobowosc where nazwa = '_osobaprawna';

	IF result.id_osobowosc = os_prawna_id THEN
		select into rec_dane_firma dane_firma.nazwa, dane_firma.nip, dane_firma.regon, dane_firma.krs, dane_firma.kod_pocztowy, dane_firma.id_region_geog, dane_firma.ulica, 
		dane_firma.numer_dom, dane_firma.numer_miesz, region_geog.nazwa as miejscowosc from dane_firma join region_geog on dane_firma.id_region_geog = region_geog.id where id_klient = klient_id;
		result.nazwa_firma := rec_dane_firma.nazwa;
		result.nip_firma := rec_dane_firma.nip;
		result.regon_firma := rec_dane_firma.regon;
		result.krs_firma := rec_dane_firma.krs;
		result.kod := rec_dane_firma.kod_pocztowy;
		result.id_region_geog := rec_dane_firma.id_region_geog;
		result.miejscowosc := rec_dane_firma.miejscowosc;
		result.ulica := rec_dane_firma.ulica;
		result.numer_dom := rec_dane_firma.numer_dom;
		result.numer_miesz := rec_dane_firma.numer_miesz;
	END IF;
	
	RETURN result;
END;
$$ LANGUAGE plpgsql;