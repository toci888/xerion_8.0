create table rejestracja_nto (
id serial primary key,
adres_ip text,
data_odwiedzin timestamp,
port_klient integer,
sposob_odwiedzin text);

alter table rejestracja_nto add column przegladarka text;
