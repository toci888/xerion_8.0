
insert into lang_tag (nazwa) values ('_dom');
insert into lang_tag (nazwa) values ('_mieszkanie');
insert into lang_tag (nazwa) values ('_obiekt');
insert into lang_tag (nazwa) values ('_lokal');
insert into lang_tag (nazwa) values ('_teren');
insert into lang_tag (nazwa) values ('_dzialka');
insert into lang_tag (nazwa) values ('_sprzedaz');
insert into lang_tag (nazwa) values ('_wynajem');
insert into lang_tag (nazwa) values ('_zamiana');
insert into lang_tag (nazwa) values ('_dzierzawa');


insert into tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values ('_dom', (select id from jezyk where nazwa = 'Polski'), 'Dom');
insert into tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values ('_mieszkanie', (select id from jezyk where nazwa = 'Polski'), 'Mieszkanie');
insert into tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values ('_obiekt', (select id from jezyk where nazwa = 'Polski'), 'Obiekt');
insert into tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values ('_lokal', (select id from jezyk where nazwa = 'Polski'), 'Lokal');
insert into tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values ('_teren', (select id from jezyk where nazwa = 'Polski'), 'Teren');
insert into tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values ('_dzialka', (select id from jezyk where nazwa = 'Polski'), 'Dzia³ka');

insert into tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values ('_sprzedaz', (select id from jezyk where nazwa = 'Polski'), 'Sprzeda¿');
insert into tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values ('_wynajem', (select id from jezyk where nazwa = 'Polski'), 'Wynajem');
insert into tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values ('_zamiana', (select id from jezyk where nazwa = 'Polski'), 'Zamiana');
insert into tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values ('_dzierzawa', (select id from jezyk where nazwa = 'Polski'), 'Dzier¿awa');


insert into tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values ('_dom', (select id from jezyk where nazwa = 'English'), 'House');
insert into tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values ('_mieszkanie', (select id from jezyk where nazwa = 'English'), 'Flat');
insert into tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values ('_obiekt', (select id from jezyk where nazwa = 'English'), 'Object');
insert into tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values ('_lokal', (select id from jezyk where nazwa = 'English'), 'Local');
insert into tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values ('_teren', (select id from jezyk where nazwa = 'English'), 'Area');
insert into tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values ('_dzialka', (select id from jezyk where nazwa = 'English'), 'Plot');

insert into tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values ('_sprzedaz', (select id from jezyk where nazwa = 'English'), 'Sale');
insert into tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values ('_wynajem', (select id from jezyk where nazwa = 'English'), 'Renting');
insert into tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values ('_zamiana', (select id from jezyk where nazwa = 'English'), 'Exchange');
insert into tlumaczenie (nazwa_lang_tag, id_jezyk, nazwa) values ('_dzierzawa', (select id from jezyk where nazwa = 'English'), 'Lease');

