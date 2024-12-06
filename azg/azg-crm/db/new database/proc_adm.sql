set client_encoding to latin2;

drop FUNCTION DodajParametrNierDoNierTrans(integer, integer, integer, integer, boolean);
drop FUNCTION PodajParametrNierTrans (integer);
drop FUNCTION PodajWyposazenieNierTrans (integer);
drop FUNCTION DodajParametrNier (integer, integer, integer, text, integer);
drop FUNCTION PodajParametrNier (integer);
drop FUNCTION StatWyszukiwanieZewn (date);
drop FUNCTION PodajWyposazenieNier (integer);
drop FUNCTION StatWyszukiwanie (date);
drop FUNCTION StatOdwiedzOfert (integer, text, integer);
drop FUNCTION DaneBankiOsoba (integer);
drop FUNCTION PodajWybBankInfo (integer);
drop FUNCTION PodajDostBankInfo (integer);
drop FUNCTION DodajInfOsobaBank (integer, integer);
drop FUNCTION DodajDoSlownika (text, text);
drop FUNCTION SzukajTlumaczen (text, integer);
drop FUNCTION DodajTlumaczenie (text, integer, text);
drop FUNCTION DodajTagJezyk (text);
drop FUNCTION PodajNieWytlumaczoneSlowa (integer);
drop FUNCTION PokazRozmowy (integer, date);
drop FUNCTION RozmowaPrzychodzaca (text, integer, text);
drop FUNCTION KalendarzAdm (integer, date, date);
drop FUNCTION UsunMailBiura (text);
drop FUNCTION NieZgodaMail (hash text);
drop FUNCTION MailListaWysylka (integer[]);
drop FUNCTION AktywujKonto (text, boolean);
drop FUNCTION ZmianaHasla (text, text, text);
drop FUNCTION PodajAgentEdycja (integer);
drop FUNCTION WprowadzAgent(integer, text, text, text, text, text, text, text, text, text, integer, integer, text, text, text, boolean[], integer, text, boolean);
drop FUNCTION ListaAgentow ();
drop FUNCTION DodajImie (text);
drop FUNCTION KasujRegionGeog (integer);
drop FUNCTION DodajRegionGeog (integer, text, boolean, integer, integer);
drop FUNCTION PodajRodzic (integer);
drop FUNCTION PodajRegionyGeog (integer);

drop type rejestracja_centralka;
drop type wyszukiwanie_info;

drop view StatWyszukanZewn;
drop view StatOfert;
drop view ParametrTransNier;
drop view WyposazenieTransNier;
drop view BankInfoOsoba;
drop view BankDaneWysOs;
drop view WyposazenieNier;
drop view ParametrNier;

create view BankInfoOsoba as 
	select bank.nazwa as bank, osoba_bank_porada.id as id_osoba_bank_porada, osoba_bank_porada.id_bank, osoba_bank_porada.id_osoba from osoba_bank_porada join bank on osoba_bank_porada.id_bank = bank.id;

create view BankDaneWysOs as 
	select bank.nazwa as bank, osoba_bank_porada.id_bank, osoba_bank_porada.id_osoba, osoba_kon_bank.nazwisko, imie.nazwa as imie, email_os_bank.nazwa as email from osoba_bank_porada join bank on 
	osoba_bank_porada.id_bank = bank.id join osoba_kon_bank on bank.id = osoba_kon_bank.id_bank join email_os_bank on osoba_kon_bank.id = email_os_bank.id_osoba_kon_bank join imie on 
	osoba_kon_bank.id_imie = imie.id;

create view ParametrNier as 
	select parametr_nier.id as id_parametr_nier, parametr_nier.id_sekcja, sekcja.nazwa as sekcja, walidacja.nazwa as walidacja, parametr_nier.waga, parametr_nier.nazwa, parametr_nier.dl_inf 
	from parametr_nier join sekcja on parametr_nier.id_sekcja = sekcja.id join walidacja on parametr_nier.id_walidacja = walidacja.id;

create view WyposazenieNier as 
	select wyposazenie_nier.id as id_wyposazenie_nier, wyposazenie_nier.id_parent, wyposazenie_nier.id_sekcja, sekcja.nazwa as sekcja, wyposazenie_nier.waga, wyposazenie_nier.wielokrotne, 
	wyposazenie_nier.nazwa, wyposazenie_nier.ma_dzieci from wyposazenie_nier join sekcja on wyposazenie_nier.id_sekcja = sekcja.id;

create view ParametrTransNier as
	select lista_param_nier.id as id_lista_param_nier, id_nier_rodzaj, id_trans_rodzaj, waga, pokaz, id_parametr_nier, nier_rodzaj.nazwa as nieruchomosc_rodzaj, trans_rodzaj.nazwa as transakcja_rodzaj 
	from lista_param_nier join nier_rodzaj on lista_param_nier.id_nier_rodzaj = nier_rodzaj.id join trans_rodzaj on lista_param_nier.id_trans_rodzaj = trans_rodzaj.id;

create view WyposazenieTransNier as
	select lista_param_slow_nier.id as id_lista_param_slow_nier, id_nier_rodzaj, id_trans_rodzaj, waga, pokaz, id_wyposazenie_nier, nier_rodzaj.nazwa as nieruchomosc_rodzaj, 
	trans_rodzaj.nazwa as transakcja_rodzaj from lista_param_slow_nier join nier_rodzaj on lista_param_slow_nier.id_nier_rodzaj = nier_rodzaj.id 
	join trans_rodzaj on lista_param_slow_nier.id_trans_rodzaj = trans_rodzaj.id;

create view StatOfert as 
	select *, 
	(stat.zrodla_wejsc::float / stat.ilosc_wyswietlen::float)::float as wspolczynnik 
	from (select id_oferta, count(id) as ilosc_wyswietlen, (select count(distinct adres) 
		from oferta_odwiedziny where id_oferta = of_odw1.id_oferta and adres not like '10.0.0%') as zrodla_wejsc from oferta_odwiedziny of_odw1 where adres not like '10.0.0%' group by id_oferta)
	 as stat;

create view StatWyszukanZewn as 
	select oferta_odwiedziny.id_oferta, oferta.id_rodz_trans as id_trans_rodzaj, nieruchomosc.id_nier_rodzaj, oferta_odwiedziny.adres, oferta_odwiedziny.data, oferta_odwiedziny.referer 
	from oferta_odwiedziny join oferta on oferta_odwiedziny.id_oferta = oferta.id join nieruchomosc on oferta.id_nieruchomosc = nieruchomosc.id 
	where adres not like '%10.0%' and referer != '';

create type rejestracja_centralka as (
id integer,
telefon text,
osoba text,
id_status_dzwonienie integer,
status_dzwonienie text,
id_agent integer,
agent text,
czas_poczatek timestamp,
czas_koniec timestamp);

create type wyszukiwanie_info as (
id integer,
ilosc_wyszukiwan integer,
ilosc_ofert integer,
id_nier_rodzaj integer,
id_trans_rodzaj integer,
adres varchar(15),
data timestamp,
nieruchomosc_rodzaj text,
transakcja_rodzaj text,
region_geog text,
pow_min float,
pow_max float,
l_pok_min integer,
l_pok_max integer,
cena float);


CREATE FUNCTION PodajRegionyGeog (parent_id integer) RETURNS SETOF region_geog AS $$
DECLARE
	result region_geog;
BEGIN
	FOR result in select * from region_geog where id_parent = parent_id order by nazwa asc LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION PodajRodzic(region_id integer) RETURNS integer AS $$
DECLARE
	parent_id integer;
BEGIN
	select into parent_id id_parent from region_geog where id = region_id;
	RETURN parent_id;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION DodajRegionGeog (id_rec integer, nazwa_r text, pokaz_b boolean, parent_id integer, otodom_id integer) RETURNS boolean AS $$
DECLARE
	test_rec record;
	test integer;
BEGIN
	IF id_rec is null THEN
		select into test_rec zaglebienie, ma_dzieci, id_parent from region_geog where id = parent_id;

		IF test_rec.ma_dzieci = false THEN
			update region_geog set ma_dzieci = true where id = parent_id;
		END IF;
		
		select into test id from region_geog where id_parent = parent_id and lower(nazwa) = lower(nazwa_r);
		IF test is null THEN
			insert into region_geog (id_parent, id_otodom, nazwa, zaglebienie, ma_dzieci, pokaz) values (parent_id, otodom_id, nazwa_r, test_rec.zaglebienie + 1, false, pokaz_b);
			RETURN true;
		ELSE
			RETURN false;
		END IF;
	ELSE
		select into test id from region_geog where id_parent = parent_id and id != id_rec and lower(nazwa) = lower(nazwa_r);
		IF test is null THEN
			update region_geog set id_otodom = otodom_id, nazwa = nazwa_r, pokaz = pokaz_b where id = id_rec;
			RETURN true;
		ELSE
			RETURN false;
		END IF;
	END IF;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION KasujRegionGeog (region_id integer) RETURNS boolean AS $$
DECLARE
	test integer;
	parent_id integer;
BEGIN
	select into test id from region_geog where id_parent = region_id;
	select into parent_id id_parent from region_geog where id = region_id;
	IF test is null THEN
		----moze byc uzywane na bazie gdzies, blok exception nie zaszkodzi
		delete from region_geog where id = region_id;
		select into test count(id) from region_geog where id_parent = parent_id;
		IF test = 0 THEN
			update region_geog set ma_dzieci = false where id = parent_id;
		END IF;
		RETURN true;
	ELSE
		RETURN false;
	END IF;
END;
$$ LANGUAGE plpgsql;

---po regionach


---slowniki: imiona

CREATE FUNCTION DodajImie (imie_txt text) RETURNS integer AS $$
DECLARE
	test integer;
BEGIN
	IF character_length(imie_txt) > 0 THEN
		select into test id from imie where lower(trim(nazwa)) = lower(trim(imie_txt));
		IF test is null THEN
			insert into imie (nazwa) values (imie_txt);
			select into test currval('imie_id_seq');			
		END IF;
		RETURN test;
	ELSE
		RETURN null; ---tu mozna zwrocic id pustego imienia
	END IF;
END;
$$ LANGUAGE plpgsql;


---koniec slownikow


---zarzadzanie agentami

CREATE FUNCTION ListaAgentow () RETURNS SETOF ListaAgent AS $$
DECLARE
	result ListaAgent;
BEGIN
	FOR result in select * from ListaAgent order by nazwa asc LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

---wprowadz agent

CREATE FUNCTION WprowadzAgent(agent_id integer, nazwa_t text, nazwa_skr text, nazwa_f text, login_t text, passwd text, tel text, komorka_t text, fax_t text, email_t text, lic_num integer, otodom_id integer, wewn_nr text, 
nip_t text, adres_t text, uprawnienia boolean[], bank_id integer, rachunek_nr text, akt_konto boolean) RETURNS slownik AS $$ ---uprawnienia maja 7 sztuk :P
DECLARE
	data_wyg date;
	result slownik;
	lic_agent integer;
	log_id integer;
	nadz_agent integer;
	newid integer;
	test integer;
BEGIN
	IF agent_id is null THEN
		select into log_id id from agent where login = md5(login_t);
		IF log_id is not null THEN
			result.id := null;
			result.nazwa := '_podany_login_jest_uzywany';

			return result;
		ELSE
			select into data_wyg current_date + 90;

			select into nadz_agent id from agent where licencja = lic_num;
			IF nadz_agent is null THEN
				---licencja nowa, nie ma nadzoru
				lic_agent := lic_num;
				--else nie robie, bo lic_agent pozostanie null i wtedy nadz_agent bedzie istniec
			END IF;
			test := 1; --petla musi ruszyc po raz 1, wiec test nie moze byc null na poczatku :P
			WHILE test is not null LOOP
				select into newid nextval('agent_id_seq');
				select into test id from agent where id = newid;
			END LOOP;
			
			BEGIN
				insert into agent (id, id_otodom, nazwa, nazwa_pot, login, haslo, waznosc_haslo, aktywnosc_konto, telefon, komorka, fax, email, wewnetrzny, licencja, nadzor, nip, dodawanie, edycja, 
				kasowanie, druk, adm_klient, adm_dane, zmiana_upr, adres, firma) 
				values (newid, otodom_id, nazwa_t, nazwa_skr, md5(login_t), md5(passwd), data_wyg, true, tel, komorka_t, fax_t, email_t, wewn_nr, lic_agent, nadz_agent, nip_t, uprawnienia[1], 
				uprawnienia[2], uprawnienia[3], uprawnienia[4], uprawnienia[5], uprawnienia[6], uprawnienia[7], adres_t, nazwa_f);
				--select into result.id currval('agent_id_seq');
				result.id := newid;
				IF character_length(rachunek_nr) = 26 THEN
					insert into konto_agent (id_agent, id_bank, nr_konto) values (newid, bank_id, rachunek_nr);
				END IF;

				return result;
			EXCEPTION WHEN not_null_violation THEN
				result.id := null;
				result.nazwa := 'Wystapil niedozwolony null, to niemozliwe :P.';
				return result;
			END;
		END IF;
	ELSE
		select into nadz_agent id from agent where licencja = lic_num and id != agent_id;
		IF nadz_agent is null THEN
			---licencja nowa, nie ma nadzoru
			lic_agent := lic_num;
			--else nie robie, bo lic_agent pozostanie null i wtedy nadz_agent bedzie istniec
		END IF;
		BEGIN
			update agent set id_otodom = otodom_id, nazwa = nazwa_t, nazwa_pot = nazwa_skr, aktywnosc_konto = akt_konto, telefon = tel, komorka = komorka_t, fax = fax_t, email = email_t, 
			wewnetrzny = wewn_nr, licencja = lic_agent, nadzor = nadz_agent, nip = nip_t, dodawanie = uprawnienia[1], edycja = uprawnienia[2], kasowanie = uprawnienia[3], 
			druk = uprawnienia[4], adm_klient = uprawnienia[5], adm_dane = uprawnienia[6], zmiana_upr = uprawnienia[7], adres = adres_t, firma = nazwa_f where id = agent_id;
			result.id := agent_id;
			return result;
		EXCEPTION WHEN not_null_violation THEN
			result.id := null;
			result.nazwa := 'Wystapil niedozwolony null, to niemozliwe :P.';
			return result;
		END;
	END IF;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION PodajAgentEdycja (agent_id integer) RETURNS agent AS $$
DECLARE
	result agent;
BEGIN
	select into result * from agent where id = agent_id;
	IF result.licencja is null THEN
		select into result.licencja agent.licencja from agent where id = result.nadzor;
	END IF;
	RETURN result;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION ZmianaHasla (login_t text, passwd text, newpasswd text) RETURNS slownik AS $$
DECLARE
	newdate date;
	akt_data date;
	ilosc_dni integer;
	result slownik;
BEGIN
	---waznosc_haslo - akt_data
	select into newdate current_date + 30;
	select into akt_data current_date;
	select into ilosc_dni waznosc_haslo - akt_data from agent where login = md5(login_t);
	IF ilosc_dni > 20 THEN
		result.nazwa := '_haslo_zmieniane_zbyt_wczesnie';
		return result;
	ELSE
		IF character_length (newpasswd) < 8 THEN
			result.nazwa := '_nowe_haslo_jest_za_krotkie';
			return result;
		ELSIF passwd = newpasswd THEN
			result.nazwa := '_podano_takie_same_hasla';
			return result;
		ELSE
			update agent set haslo = md5(newpasswd), waznosc_haslo = newdate where aktywnosc_konto = true and login = md5(login_t) and haslo = md5(passwd);
			IF found THEN
				result.id := 1;
				return result;
			ELSE
				result.nazwa := '_nie_odnaleziono_uzytkownika';
				return result;
			END IF;
		END IF;
	END IF;
END;
$$ LANGUAGE plpgsql;

---aktywuj konto
---deaktywuj konto

CREATE FUNCTION AktywujKonto (login_t text, aktywuj boolean) RETURNS boolean AS $$
DECLARE
	
BEGIN
	update agent set aktywnosc_konto = aktywuj where login = md5(login_t);
	IF found THEN
		return true;
	ELSE
		return false;
	END IF;
END;
$$ LANGUAGE plpgsql;

---koniec zarzadzania agentami

CREATE FUNCTION MailListaWysylka (region_id integer[]) RETURNS setof slownik AS $$
DECLARE
	result slownik;
	zapytanie text;
	licznik integer;
BEGIN
	licznik := 1;
	---select email from mailing where id_wojewodztwo in (region_id) and zgoda = true
	zapytanie := 'select id, email from mailing where zgoda = true and id_wojewodztwo in (';
	WHILE region_id[licznik] is not null LOOP
		IF licznik > 1 THEN
			zapytanie := zapytanie || ', ';
		END IF;
		zapytanie := zapytanie || region_id[licznik];
		licznik := licznik + 1;
	END LOOP;
	zapytanie := zapytanie || ')';

	FOR result in execute zapytanie LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION NieZgodaMail (hash text) RETURNS boolean AS $$
DECLARE
BEGIN
	update mailing set zgoda = false where md5(id || email) = hash;
	IF found THEN
		RETURN true;
	ELSE
		RETURN false;
	END IF;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION UsunMailBiura (nazwa_m text) RETURNS boolean AS $$
DECLARE
BEGIN
	delete from mailing where email = nazwa_m;
	IF found THEN
		RETURN true;
	ELSE
		RETURN false;
	END IF;
END;
$$ language plpgsql;


CREATE FUNCTION KalendarzAdm (agent_id integer, data_od date, data_do date) RETURNS setof ListaKalendarz AS $$
DECLARE
	rec_dane ListaKalendarz;
BEGIN
	FOR rec_dane in select * from ListaKalendarz join agent_kalendarz on ListaKalendarz.id_kalendarz = agent_kalendarz.id_kalendarz where agent_kalendarz.id_agent = agent_id and 
	data between data_od and data_do order by data, godzina asc LOOP
		select into rec_dane.agent AgenciWpisKalendarz(rec_dane.id_kalendarz);
		RETURN NEXT rec_dane;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION RozmowaPrzychodzaca (telefon_nr text, dzwonienie_status_id integer, wewn_nr_agent text) RETURNS boolean AS $$
DECLARE
	czas timestamp;
	status_nieod integer;
	status_od integer;
	status_zak integer;
	agent_id integer;
	status_pol_zak integer;
BEGIN
	status_nieod := 1;
	status_od := 2;
	status_zak := 3;
	select into czas date_trunc('second', current_timestamp::timestamp);
	select into agent_id id from agent where wewnetrzny = wewn_nr_agent;

	IF dzwonienie_status_id = status_nieod THEN
		select into status_pol_zak id from rozmowa_przychodzaca where polaczenie_zakonczone = false and nr_telefon = telefon_nr and id_status_dzwonienie = status_nieod;
		IF status_pol_zak is null THEN
			---telefon zadzwonil, ewidencjonujemy
			insert into rozmowa_przychodzaca (nr_telefon, id_status_dzwonienie, id_agent, czas_poczatek) values (telefon_nr, dzwonienie_status_id, agent_id, czas);
		ELSE
			update rozmowa_przychodzaca set id_agent = agent_id where id = status_pol_zak;
		END IF;
		RETURN true;
	ELSIF dzwonienie_status_id = status_od THEN
		---tu moze byc dwuznacznie, moze polaczenie wychodzace uzyskac conn, i wtedy ta operacja update nie ma sensu
		---warunek where powinien byc wystarczajacy: w zalozeniu kazdy sygnal zakonczenia polaczenia bedzie odbierany i uwzgledniany, wiec nie powinno miec miejsca,
		---aby w bazie pozostala rozmowa na dany numer telefonu niezakonczona, oraz nowe polaczenie z tego numeru mialo miejsce. Zawsze przed nowym polaczeniem poprzednie powinno ustac.
		update rozmowa_przychodzaca set id_status_dzwonienie = dzwonienie_status_id, id_agent = agent_id, czas_poczatek = czas where nr_telefon = telefon_nr and polaczenie_zakonczone = false;
		IF found THEN
			RETURN true;
		ELSE
			--nie znaleziono rozmowy do okreslenia jako odebrana - zonk ;/, nie powinno sie zdarzyc
			RETURN false;
		END IF;
	ELSIF dzwonienie_status_id = status_zak THEN
		select into status_pol_zak id_status_dzwonienie from rozmowa_przychodzaca where id_agent = agent_id and polaczenie_zakonczone = false;
		--sprawdzamy czy zakonczone polaczenie bylo odebrane, czy nie
		IF status_pol_zak = status_nieod THEN
			---polaczenie nie zostalo odebrane, zapisujemy date zakonczenia, zaznaczamy ze zakonczono i zostawiamy status
			update rozmowa_przychodzaca set czas_koniec = czas, polaczenie_zakonczone = true where id_agent = agent_id and polaczenie_zakonczone = false;
			IF found THEN
				RETURN true;
			ELSE
				--nie znaleziono rozmowy do okreslenia jako odebrana - zonk ;/, nie powinno sie zdarzyc
				RETURN false;
			END IF;
		ELSE
			---polaczenie bylo odebrane, teraz zostalo zakonczone, zmieniamy status, zaznaczamy ze polaczenie jest zakonczone, dodajemy czas konca
			update rozmowa_przychodzaca set id_status_dzwonienie = dzwonienie_status_id, czas_koniec = czas, polaczenie_zakonczone = true where id_agent = agent_id and polaczenie_zakonczone = false;
			IF found THEN
				RETURN true;
			ELSE
				--nie znaleziono rozmowy do okreslenia jako odebrana - zonk ;/, nie powinno sie zdarzyc
				RETURN false;
			END IF;
		END IF;
	END IF;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION PokazRozmowy (dzwonienie_status_id integer, data_dzw date) RETURNS SETOF rejestracja_centralka AS $$
DECLARE
	result rejestracja_centralka;
	rec_temp record;
	data_dzien_poz date;
BEGIN
	select into data_dzien_poz data_dzw + 1;
	FOR rec_temp in select rozmowa_przychodzaca.id, trim(leading 0 from rozmowa_przychodzaca.nr_telefon) as nr_telefon, rozmowa_przychodzaca.id_status_dzwonienie, rozmowa_przychodzaca.id_agent, 
		rozmowa_przychodzaca.czas_poczatek, rozmowa_przychodzaca.czas_koniec, agent.nazwa_pot as agent, status_dzwonienie.nazwa as status_dzwonienie from rozmowa_przychodzaca join agent on 
		rozmowa_przychodzaca.id_agent = agent.id join status_dzwonienie on rozmowa_przychodzaca.id_status_dzwonienie = status_dzwonienie.id 
		where rozmowa_przychodzaca.id_status_dzwonienie = dzwonienie_status_id and rozmowa_przychodzaca.czas_poczatek between data_dzw and data_dzien_poz 
		order by rozmowa_przychodzaca.czas_poczatek desc LOOP
		---przepisac dane
		result.id := rec_temp.id;
		result.telefon := rec_temp.nr_telefon;
		result.id_status_dzwonienie := rec_temp.id_status_dzwonienie;
		result.status_dzwonienie := rec_temp.status_dzwonienie;
		result.id_agent := rec_temp.id_agent;
		result.agent := rec_temp.agent;
		result.czas_poczatek := rec_temp.czas_poczatek;
		result.czas_koniec := rec_temp.czas_koniec;
		---dodac osobe jesli znaleziona po telefonie
		select into rec_temp * from OsobaView left join telefon on OsobaView.id_osoba = telefon.id_osoba left join komorka on OsobaView.id_osoba = komorka.id_osoba 
		where telefon.nazwa = result.telefon or komorka.nazwa = result.telefon;
		result.osoba := rec_temp.nazwisko || ' ' || rec_temp.imie;
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

---jezyki obrobka
CREATE FUNCTION PodajNieWytlumaczoneSlowa (jezyk_id integer) RETURNS SETOF slownik AS $$
--select id, nazwa from lang_tag where nazwa not in (select nazwa_lang_tag from tlumaczenie where id_jezyk = 1)
DECLARE
	result slownik;
BEGIN
	FOR result in select id, nazwa from lang_tag where nazwa not in (select nazwa_lang_tag from tlumaczenie where id_jezyk = jezyk_id) LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;
---walidacja tagu - koniecznie _ z przodu itd
CREATE FUNCTION DodajTagJezyk (lang_tag_nazwa text) RETURNS boolean AS $$
DECLARE
	test integer;
BEGIN
	select into test id from lang_tag where nazwa = lang_tag_nazwa;
	IF test is null THEN
		insert into lang_tag (nazwa) values (lang_tag_nazwa);
		RETURN true;
	ELSE
		RETURN false;
	END IF;
END;
$$ LANGUAGE plpgsql;

--walidacja wpisu, replace wszystkich , na ^
--select replace('bartek,', ',', '^');
CREATE FUNCTION DodajTlumaczenie (lang_tag_nazwa text, jezyk_id integer, wartosc text) RETURNS boolean AS $$
DECLARE
	test integer;
BEGIN
	select into test id from tlumaczenie where id_jezyk = jezyk_id and nazwa_lang_tag = lang_tag_nazwa;
	IF test is null and character_length(wartosc) > 0 THEN
		insert into tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values ((select replace(lang_tag_nazwa, ',', '^')), jezyk_id, wartosc);
		RETURN true;
	ELSE
		---znaleziono, juz jest, nie bedzie dodawane kolejne lub nie podano textu sensownego - i tak powinno byc zwalidowane js
		RETURN false;
	END IF;
END;
$$ LANGUAGE plpgsql;

---select nazwa_lang_tag from tlumaczenie where id_jezyk = 1 group by nazwa_lang_tag having count(id) > 1;

CREATE FUNCTION SzukajTlumaczen (wartosc text, jezyk_id integer) RETURNS SETOF slownik AS $$
DECLARE
	result slownik;
BEGIN
	FOR result in select id, nazwa from tlumaczenie where nazwa like wartosc and id_jezyk = jezyk_id LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

----dodawanie informacji do slownika
CREATE FUNCTION DodajDoSlownika (slownik_nazwa text, wartosc text) RETURNS boolean AS $$
DECLARE
	rec_test record;
BEGIN
	FOR rec_test in execute 'select count(id) as ilosc from ' || slownik_nazwa || ' where lower(nazwa) = lower(''' || wartosc || ''');' LOOP
		IF rec_test.ilosc > 0 THEN
			RETURN false;
		ELSE
			execute 'insert into ' || slownik_nazwa || ' (nazwa) values (''' || wartosc || ''');';
			RETURN true;
		END IF;
	END LOOP;
END;
$$ LANGUAGE plpgsql;

---osoba_bank_porada
CREATE FUNCTION DodajInfOsobaBank (bank_id integer, osoba_id integer) RETURNS boolean AS $$
DECLARE
	test integer;
BEGIN
	select into test id from osoba_bank_porada where id_osoba = osoba_id and id_bank = bank_id;
	IF test is null THEN
		insert into osoba_bank_porada (id_bank, id_osoba) values (bank_id, osoba_id);
		RETURN true;
	ELSE
		RETURN false;
	END IF;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION PodajDostBankInfo (osoba_id integer) RETURNS SETOF bank AS $$
DECLARE
	result bank;
BEGIN
	FOR result in select * from bank where id not in (select id_bank from osoba_bank_porada where id_osoba = osoba_id) order by nazwa asc LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION PodajWybBankInfo (osoba_id integer) RETURNS SETOF BankInfoOsoba AS $$
DECLARE
	result BankInfoOsoba;
BEGIN
	FOR result in select * from BankInfoOsoba where id_osoba = osoba_id order by bank asc LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

---pobranie bankow, o ktorych zostal powiadomiony i maja mail, dodatkowo jego imie, nazwisko, pesel i tel, ale to 2 proc niezalezne, customowe pole do komentarza pojda w mailu
CREATE FUNCTION DaneBankiOsoba (osoba_id integer) RETURNS SETOF BankDaneWysOs AS $$
DECLARE
	result BankDaneWysOs;
BEGIN
	FOR result in select * from BankDaneWysOs where id_osoba = osoba_id LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

---statystyka wyswietlen ofert; ex sql below
---select *, (stat.zrodla_wejsc::float / stat.ilosc_wyswietlen::float)::float as wspolczynnik from (select id_oferta, count(id) as ilosc_wyswietlen, (select count(distinct adres) from oferta_odwiedziny where id_oferta = of_odw1.id_oferta and adres not like '10.0.0%') as zrodla_wejsc from oferta_odwiedziny of_odw1 where adres not like '10.0.0%' group by id_oferta) as stat where id_oferta = 2179 order by wspolczynnik desc, ilosc_wyswietlen desc;

CREATE FUNCTION StatOdwiedzOfert (oferta_id integer, sort_kol text, sort_kier integer) RETURNS SETOF StatOfert AS $$
DECLARE
	result StatOfert;
	kolumna_sort text;
	porzadek text;
	zapytanie text;
BEGIN
	IF sort_kol is null or character_length(sort_kol) = 0 THEN
		kolumna_sort := 'ilosc_wyswietlen';
	ELSE
		kolumna_sort := sort_kol;
	END IF;
	IF sort_kier = 1 THEN
		--sortowanie rosnace
		porzadek := 'asc';
	ELSE
		porzadek := 'desc';
	END IF;
	zapytanie := 'select * from StatOfert';
	IF oferta_id is not null and oferta_id > 0 THEN
		zapytanie := zapytanie || ' where id_oferta = ' || oferta_id;
	END IF;
	zapytanie := zapytanie || ' order by ' || kolumna_sort || ' ' || porzadek;
	FOR result in execute zapytanie LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION StatWyszukiwanie (data_f date) RETURNS SETOF wyszukiwanie_info AS $$
DECLARE
	result wyszukiwanie_info;
	rec_temp record;
	rec_szczeg record;
	rec_dod_info record;
	can_return boolean;
	---tu ida wartosci textowe ze slownikow
	wart_tym text;
BEGIN
	FOR rec_temp IN select distinct adres from wyszukiwanie where data between data_f and (data_f + 1) and adres not like '10.0.%' LOOP --order by data asc
		result.cena := 0;
		result.id_nier_rodzaj := 0;
		result.id_trans_rodzaj := 0;
		result.nieruchomosc_rodzaj := '';
		result.transakcja_rodzaj := '';
		result.region_geog := '';
		result.l_pok_min := 0;
		result.l_pok_max := 0;
		result.pow_min := 0;
		result.pow_max := 0;
		result.ilosc_wyszukiwan := 0;
		FOR rec_szczeg in select * from wyszukiwanie where data between data_f and (data_f + 1) and adres = rec_temp.adres order by data asc LOOP
			--IF rec_temp.adres != result.adres THEN
				
			--END IF;
			result.ilosc_wyszukiwan := result.ilosc_wyszukiwan + 1;
			result.id := rec_szczeg.id;
			result.adres := rec_szczeg.adres;
			result.data := rec_szczeg.data;
			can_return := false;
			FOR rec_dod_info in select * from kryteria where id_wyszukiwanie = rec_szczeg.id LOOP
				IF rec_dod_info.nazwa = 'cena' THEN
					IF result.cena != rec_dod_info.wartosc::float THEN
						result.cena := rec_dod_info.wartosc::float;
						can_return := true;
					END IF;
				ELSIF rec_dod_info.nazwa = 'id_nier_rodzaj' THEN
					IF result.id_nier_rodzaj != rec_dod_info.wartosc::integer THEN
						select into wart_tym nazwa from nier_rodzaj where id = rec_dod_info.wartosc::integer;
						result.nieruchomosc_rodzaj := wart_tym;
						result.id_nier_rodzaj := rec_dod_info.wartosc::integer;
						can_return := true;
					END IF;
				ELSIF rec_dod_info.nazwa = 'id_trans_rodzaj' THEN
					IF result.id_trans_rodzaj != rec_dod_info.wartosc::integer THEN
						select into wart_tym nazwa_zap from trans_rodzaj where id = rec_dod_info.wartosc::integer;
						result.transakcja_rodzaj := wart_tym;
						result.id_trans_rodzaj := rec_dod_info.wartosc::integer;
						can_return := true;
					END IF;
				ELSIF rec_dod_info.nazwa = 'region' THEN
					select into wart_tym nazwa from region_geog where id = rec_dod_info.wartosc::integer;
					IF result.region_geog != wart_tym THEN
						result.region_geog := wart_tym;
						can_return := true;
					END IF;
				ELSIF rec_dod_info.nazwa = 'l_pok_min' THEN
					IF result.l_pok_min != rec_dod_info.wartosc::integer THEN
						result.l_pok_min := rec_dod_info.wartosc::integer;
						can_return := true;
					END IF;
				ELSIF rec_dod_info.nazwa = 'l_pok_max' THEN
					IF result.l_pok_max != rec_dod_info.wartosc::integer THEN
						result.l_pok_max := rec_dod_info.wartosc::integer;
						can_return := true;
					END IF;
				ELSIF rec_dod_info.nazwa = 'pow_min' THEN
					IF result.pow_min != rec_dod_info.wartosc::float THEN
						result.pow_min := rec_dod_info.wartosc::float;
						can_return := true;
					END IF;
				ELSIF rec_dod_info.nazwa = 'pow_max' THEN
					IF result.pow_max != rec_dod_info.wartosc::float THEN
						result.pow_max := rec_dod_info.wartosc::float;
						can_return := true;
					END IF;
				END IF;
			END LOOP;
			IF can_return = true THEN
				select into result.ilosc_ofert count(id) from oferta_odwiedziny where adres = result.adres and data between result.data and result.data::date + 1;
				RETURN NEXT result;
				result.ilosc_wyszukiwan := 0;
			END IF;
		END LOOP;
	END LOOP;
END;
$$ LANGUAGE plpgsql;

---wyszukiwanie z googli itd - wejscia na str z innej manki niz nawigacja po stronie, wejscia z zewnatrz
CREATE FUNCTION StatWyszukiwanieZewn (data_f date) RETURNS SETOF StatWyszukanZewn AS $$
DECLARE
	result StatWyszukanZewn;
BEGIN
	FOR result in select * from StatWyszukanZewn where data between data_f and (data_f + 1) and referer not like '%azg.pl%' and referer not like '%azgwarancja.eu%' 
	and referer not like '%nieruchomosciopole.pl%' and referer not like '%217.197.72.138%' LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

----zarzadzanie slownikami .....
CREATE FUNCTION PodajParametrNier (sekcja_id integer) RETURNS SETOF ParametrNier AS $$
DECLARE
	result ParametrNier;
BEGIN
	FOR result in select * from ParametrNier where id_sekcja = sekcja_id order by waga, nazwa asc LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION PodajWyposazenieNier (sekcja_id integer) RETURNS SETOF WyposazenieNier AS $$
DECLARE
	result WyposazenieNier;
BEGIN
	FOR result in select * from WyposazenieNier where id_sekcja = sekcja_id and id_parent is null order by waga, nazwa asc LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

--CREATE FUNCTION PodajParametrNierEdycja () RETURNS ??? AS $$

CREATE FUNCTION DodajParametrNier (sekcja_id integer, walidacja_id integer, waga_nr integer, nazwa_t text, inf_dl integer) RETURNS slownik AS $$
DECLARE
	result slownik;
	test integer;
	--rekord weryfikacji - do update ewentualnego
	rec_wer record;
BEGIN
	--sprawdzenie obecnosci tagu w slowniku
	select into test id from lang_tag where nazwa = nazwa_t;
	IF test is null THEN
		---uruchamianie procedury jest bez sensu - 2 raz zrobi to samo sprawdzenie, de facto moznaby ja tu po prostu wywolac, ale wtedy nie do konca wiadomo co sie odbywa a co nie
		insert into lang_tag (nazwa) values (nazwa_t);
	END IF;
	---sprawdzenie czy dana waga jest wolna
	select into test id from parametr_nier where waga = waga_nr and id_sekcja = sekcja_id;
	IF test is not null THEN
		result.nazwa := '_waga_nie_jest_dostepna';
		RETURN result;
	ELSE
		select into rec_wer id, id_sekcja, id_walidacja, waga, nazwa, dl_inf from parametr_nier where nazwa = nazwa_t;
		IF rec_wer.id is null THEN
			insert into parametr_nier (id_sekcja, id_walidacja, waga, nazwa, dl_inf) values (sekcja_id, walidacja_id, waga_nr, nazwa_t, inf_dl);
		ELSE
			--update
			update parametr_nier set id_sekcja = sekcja_id, id_walidacja = walidacja_id, waga = waga_nr, nazwa = nazwa_t, dl_inf = inf_dl where id = rec_wer.id;
		END IF;
		result.id := 1;
		RETURN result;
	END IF;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION PodajParametrNierTrans (parametr_id integer) RETURNS SETOF ParametrTransNier AS $$
DECLARE
	result ParametrTransNier;
BEGIN
	FOR result in select * from ParametrTransNier where id_parametr_nier = parametr_id LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

--WyposazenieTransNier
CREATE FUNCTION PodajWyposazenieNierTrans (wyposazenie_id integer) RETURNS SETOF WyposazenieTransNier AS $$
DECLARE
	result WyposazenieTransNier;
BEGIN
	FOR result in select * from WyposazenieTransNier where id_wyposazenie_nier = wyposazenie_id LOOP
		RETURN NEXT result;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

----dodanie do tabeli lista_param_nier wpisu powodujacego, ze dla danego rodzaju transakcji oraz nieruchomosci dany parametr bedzie mozliwy do wypelnienia
CREATE FUNCTION DodajParametrNierDoNierTrans (nier_rodzaj_id integer, trans_rodzaj_id integer, parametr_nier_id integer, waga_koj integer, pokaz_b boolean) RETURNS boolean AS $$
DECLARE
	test integer;
BEGIN
	select into test id from lista_param_nier where id_nier_rodzaj = nier_rodzaj_id and id_trans_rodzaj = trans_rodzaj_id and id_parametr_nier = parametr_nier_id;
	IF test is null THEN
		---waga musi byc 1-4
		insert into lista_param_nier (id_nier_rodzaj, id_parametr_nier, id_trans_rodzaj, waga, pokaz) values (nier_rodzaj_id, parametr_nier_id, trans_rodzaj_id, waga_koj, pokaz_b);
		RETURN true;
	ELSE
		RETURN false;
	END IF;
END;
$$ LANGUAGE plpgsql;


----koniec zarzadzania slownikami