----pobranie zapotrzebowan zalozonych przez osoby prawne

select zapotrzebowanie.id from zapotrzebowanie join klient on zapotrzebowanie.id_klient = klient.id where klient.id_osobowosc = (2);



select zapotrzebowanie.id as id_klient, os1.nazwisko, os1.pesel from zapotrzebowanie join klient on zapotrzebowanie.id_klient = klient.id join osoba_klient on klient.id = osoba_klient.id_klient 
join osoba os1 on osoba_klient.id_osoba = os1.id where (select count(id) from osoba where pesel = os1.pesel) > 1 order by nazwisko, pesel;

select klient.id as id_klient, os1.id as id_osoba, os1.nazwisko, os1.pesel from klient join osoba_klient on klient.id = osoba_klient.id_klient 
join osoba os1 on osoba_klient.id_osoba = os1.id where (select count(id) from osoba where pesel = os1.pesel) > 1 order by nazwisko, pesel;

select *, (stat.zrodla_wejsc::float / stat.ilosc_wyswietlen::float)::float as wspolczynnik from (select id_oferta, count(id) as ilosc_wyswietlen, 
(select count(distinct adres) from oferta_odwiedziny where id_oferta = of_odw1.id_oferta and adres not like '10.0.0%') as zrodla_wejsc from oferta_odwiedziny of_odw1 where adres not like '10.0.0%' 
group by id_oferta) as stat where id_oferta = 2179 order by wspolczynnik desc, ilosc_wyswietlen desc;
