drop FUNCTION DodajOdwiedziny (text, integer, text, text, text, text, text);

drop table strona_odwiedziny;

create table strona_odwiedziny (
id serial primary key,
adres varchar(15) not null,
id_jezyk integer references jezyk(id) not null,
referer text,
przegladarka text,
url_azg text,
request_time text,
request_method varchar(10));

CREATE FUNCTION DodajOdwiedziny (adres_ip text, jezyk_id integer, ref_site text, browser text, url text, time_req text, method text) RETURNS boolean AS $$
DECLARE
	
BEGIN
	insert into strona_odwiedziny (adres, id_jezyk, referer, przegladarka, url_azg, request_time, request_method) values (adres_ip, jezyk_id, ref_site, browser, url, time_req, method);
	RETURN true;
END;
$$ LANGUAGE plpgsql;

alter table strona_odwiedziny add column data timestamp not null default date_trunc('second', current_timestamp::timestamp);
