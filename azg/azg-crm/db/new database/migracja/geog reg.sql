---regiony geograficzne

insert into region_geog (id_parent, id_otodom, nazwa) select 1, id_w_otodom, nazwa_w from wojewodztwa;
insert into region_geog (id_parent, id_otodom, nazwa) select (select id from region_geog where nazwa = (select nazwa_w from wojewodztwa where id_w = p1.id_w)), id_pow_otodom, nazwa_p from powiaty p1;