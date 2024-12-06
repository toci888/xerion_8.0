INSERT INTO wyposazenie_nier (wielokrotne, ma_dzieci, waga, id_sekcja, nazwa) values (true, true, 3, 2, '_mozliwosczabudowy');

UPDATE wyposazenie_nier set id_parent = (select id from wyposazenie_nier where nazwa = '_mozliwosczabudowy'), id_sekcja = 2 where id in (155, 156, 157, 178);
DELETE FROM sekcja WHERE id = 3;

INSERT INTO lista_param_slow_nier (id_nier_rodzaj, id_wyposazenie_nier, id_trans_rodzaj, waga, pokaz) values (6, (select id from wyposazenie_nier where nazwa = '_mozliwosczabudowy'), 1, 3, true);
INSERT INTO lista_param_slow_nier (id_nier_rodzaj, id_wyposazenie_nier, id_trans_rodzaj, waga, pokaz) values (5, (select id from wyposazenie_nier where nazwa = '_mozliwosczabudowy'), 1, 3, true);


----sprawdzenie, czy wystepuja w bazie oferty, ktore mialyby wiecej niz jedna informacje jednokrotna slownikowa wprowadzona
select count(id_nieruchomosc) as ilosc, id_nieruchomosc from 
	dane_slow_wyp_nier d1 where 
	(select wielokrotne from wyposazenie_nier where id = d1.id_wyposazenie_nier) = false and 
		(select count(id) from dane_slow_wyp_nier where id_nieruchomosc = d1.id_nieruchomosc and id_wyposazenie_nier in 
			(select id from wyposazenie_nier where id != d1.id_wyposazenie_nier and id_parent = 
				(select id_parent from wyposazenie_nier where id = d1.id_wyposazenie_nier)
			)
		) > 1 group by id_nieruchomosc;