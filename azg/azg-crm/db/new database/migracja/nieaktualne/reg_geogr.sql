
---wojewodztwa

insert into wojewodztwo (id, id_kraj, id_otodom, nazwa) select id_w, 1, id_w_otodom, nazwa_w from wojewodztwa;
select setval ('wojewodztwo_id_seq', 16, true);

---powiaty

insert into powiat (id, id_wojewodztwo, id_otodom, nazwa) select id_pow, id_w, id_pow_otodom, nazwa_p from powiaty;
select setval ('powiat_id_seq', 380, true);