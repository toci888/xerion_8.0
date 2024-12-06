create table oferta_sprzedana (
id_oferta integer references oferta(id) not null unique,
cena text,
is_sprzedana boolean not null default false,
is_azg boolean not null default false);

