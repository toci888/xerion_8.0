delete from sub where id_b > 1;

update sub set rodz_zg = 1 where rodz_zg = 'K';
update sub set rodz_zg = 2 where rodz_zg = 'N';

update sub set rodzn_zg = 1 where rodzn_zg = 'D';
update sub set rodzn_zg = 2 where rodzn_zg = 'M';
update sub set rodzn_zg = 3 where rodzn_zg = 'O';
update sub set rodzn_zg = 4 where rodzn_zg = 'L';
update sub set rodzn_zg = 5 where rodzn_zg = 'T';
update sub set rodzn_zg = 6 where rodzn_zg = 'Dz';

insert into subskrypcja (id_nier_rodzaj, id_trans_rodzaj, id_jezyk, cena_min, cena_max, email, data) select rodzn_zg::integer, rodz_zg::integer, 1, cena_zg_od, cena_zg_do, email_zg, data_zg from sub;
