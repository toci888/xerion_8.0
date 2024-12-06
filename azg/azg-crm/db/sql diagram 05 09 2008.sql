CREATE TABLE prowizja_zapotrzebowanie (
    id integer NOT NULL,
    id_zapotrzebowanie integer NOT NULL,
    id_trans_rodzaj integer NOT NULL,
    prowizja_proc bit,
    prowizja character varying(7) NOT NULL,
    id_sposob_finansowania integer,
    poszukiwane_dla text
);

CREATE TABLE osoba_lista_wsk_adr (
    id integer NOT NULL,
    id_lista_wsk_adr integer NOT NULL,
    id_osoba integer NOT NULL
);


CREATE TABLE cena (
    id integer NOT NULL,
    id_oferta integer NOT NULL,
    id_osoba integer NOT NULL,
    id_agent integer NOT NULL,
    cena character varying(15) NOT NULL,
    data datetime NOT NULL,
    podpis bit
);

CREATE TABLE trans_rodzaj (
    id integer NOT NULL,
    nazwa character varying(30) NOT NULL,
    nazwa_zap character varying(30) NOT NULL
);


CREATE TABLE zapotrzebowanie_nier_rodzaj (
    id integer NOT NULL,
    id_nier_rodzaj integer NOT NULL,
    id_zapotrzebowanie integer NOT NULL
);


CREATE TABLE zapotrzebowanie_trans_rodzaj (
    id integer NOT NULL,
    id_zapotrzebowanie_nier_rodzaj integer NOT NULL,
    id_status integer NOT NULL,
    id_trans_rodzaj integer NOT NULL,
    cena character varying(15),
    pokaz bit
);

CREATE TABLE agent (
    id integer NOT NULL,
    id_otodom integer,
    nazwa text NOT NULL,
    nazwa_pot text,
    firma text,
    "login" character varying(40) NOT NULL,
    haslo character varying(40) NOT NULL,
    waznosc_haslo datetime NOT NULL,
    aktywnosc_konto bit,
    telefon character varying(13),
    komorka character varying(13),
    fax character varying(13),
    email character varying(40) NOT NULL,
    wewnetrzny character varying(4),
    licencja integer,
    nadzor integer,
    nip character varying(13),
    adres text,
    dodawanie bit,
    edycja bit,
    kasowanie bit,
    druk bit,
    adm_klient bit,
    adm_dane bit,
    zmiana_upr bit
);

CREATE TABLE imie (
    id integer NOT NULL,
    nazwa character varying(60) NOT NULL
);


CREATE TABLE komorka (
    id_osoba integer,
    nazwa character varying(9) NOT NULL,
    opis text
);



CREATE TABLE nier_rodzaj (
    id integer NOT NULL,
    nazwa character varying(30) NOT NULL
);



CREATE TABLE osoba (
    id integer NOT NULL,
    id_old integer,
    id_imie integer NOT NULL,
    nazwisko character varying(30) NOT NULL,
    nazwisko_rodowe character varying(30),
    pesel character varying(15),
    id_agent integer
);



CREATE TABLE osoba_adres (
    id integer NOT NULL,
    kod_pocztowy character varying(6),
    id_region_geog integer,
    ulica character varying(40) NOT NULL,
    numer_dom character varying(10),
    numer_miesz character varying(10)
);



CREATE TABLE osoba_zapotrzebowanie (
    id integer NOT NULL,
    id_zapotrzebowanie integer NOT NULL,
    id_osoba integer NOT NULL
);




CREATE TABLE region_geog (
    id integer NOT NULL,
    id_parent integer,
    id_otodom integer,
    nazwa character varying(60) NOT NULL,
    zaglebienie integer,
    ma_dzieci bit ,
    pokaz bit 
);



CREATE TABLE telefon (
    id integer NOT NULL,
    id_osoba integer,
    nazwa character varying(13) NOT NULL,
    opis text
);



CREATE TABLE status (
    id integer NOT NULL,
    nazwa character varying(20) NOT NULL
);

CREATE TABLE zapotrzebowanie (
    id integer NOT NULL,
    id_klient integer NOT NULL,
    data datetime NOT NULL,
    data_otw_zlecenie datetime NOT NULL,
    data_zam_zlecenie datetime,
    id_agent integer NOT NULL
);

CREATE TABLE media_nieruchomosc (
    id integer NOT NULL,
    id_nier_rodzaj integer NOT NULL,
    id_trans_rodzaj integer NOT NULL,
    id_region_geog integer,
    id_status integer NOT NULL,
    id_agent integer NOT NULL,
    data datetime NOT NULL,
    ulica text,
    oferent bit,
    powierzchnia character varying(10),
    cena character varying(15),
    opis text,
    przypomnienie datetime,
    id_media_reklama integer NOT NULL,
    id_osoba integer,
    id_of_zap integer
);

CREATE TABLE nieruchomosc (
    id integer NOT NULL,
    id_old integer,
    id_nier_rodzaj integer NOT NULL,
    id_rodz_nier_szcz integer,
    id_klient integer NOT NULL,
    id_region_geog integer,
    ulica_net text,
    ulica text,
    kod character varying(6),
    id_agent integer NOT NULL,
    data datetime NOT NULL,
    rynek_pierw bit,
    klucz bit 
);

CREATE TABLE oferta (
    id integer NOT NULL,
    id_old integer,
    id_rodz_trans integer NOT NULL,
    id_nieruchomosc integer NOT NULL,
    id_status integer,
    data datetime NOT NULL,
    data_otw_zlecenie datetime NOT NULL,
    data_zam_zlecenie datetime,
    cena character varying(15) NOT NULL,
    prowizja_proc bit,
    prowizja character varying(7),
    wylacznosc bit,
    pokaz bit,
    czas_przekazania integer,
    przek_od_otwarcia bit ,
    id_priorytet_reklama integer
);

CREATE TABLE godzina (
    id integer NOT NULL,
    nazwa character varying(2) NOT NULL
);

CREATE TABLE kalendarz (
    id integer NOT NULL,
    data datetime NOT NULL,
    id_godzina integer NOT NULL,
    id_minuta integer NOT NULL,
    id_spotkanie integer,
    komentarz text
);

CREATE TABLE minuta (
    id integer NOT NULL,
    nazwa character varying(2) NOT NULL
);

CREATE TABLE osoba_oferta (
    id integer NOT NULL,
    id_oferta integer NOT NULL,
    id_osoba integer NOT NULL
);

CREATE TABLE media_reklama (
    id integer NOT NULL,
    nazwa text NOT NULL
);

CREATE TABLE telefon_media_nieruchomosc (
    id integer NOT NULL,
    id_media_nieruchomosc integer NOT NULL,
    nazwa character varying(13) NOT NULL,
    opis character varying(100)
);

CREATE TABLE sposob_finansowania (
    id integer NOT NULL,
    nazwa character varying(30) NOT NULL
);

CREATE TABLE opis (
    id integer NOT NULL,
    id_oferta integer NOT NULL,
    id_jezyk integer NOT NULL,
    wartosc text NOT NULL
);

CREATE TABLE zmiana_status (
    id integer NOT NULL,
    id_oferta integer NOT NULL,
    id_status integer NOT NULL,
    id_agent integer NOT NULL,
    data datetime NOT NULL
);

CREATE TABLE osoba_dowod (
    id integer NOT NULL,
    id_osoba integer NOT NULL,
    id_rodzaj_dowod_tozsamosc integer NOT NULL,
    nazwa text NOT NULL
);

CREATE TABLE rodzaj_dowod_tozsamosc (
    id integer NOT NULL,
    nazwa character varying(30) NOT NULL
);

CREATE TABLE spotkanie (
    id integer NOT NULL,
    id_oferta integer NOT NULL,
    id_zapotrzebowanie integer NOT NULL,
    id_klient integer,
    klient_oferujacy bit  NOT NULL,
    id_umowienie integer NOT NULL,
    spotkanie_data datetime NOT NULL,
    spotkanie_godzina integer NOT NULL,
    spotkanie_minuta integer NOT NULL,
    id_agent integer NOT NULL,
    komentarz text
);

CREATE TABLE spotkanie_os (
    id integer NOT NULL,
    id_spotkanie integer NOT NULL,
    id_osoba integer NOT NULL
);

CREATE TABLE umowienie (
    id integer NOT NULL,
    nazwa character varying(40) NOT NULL
);

CREATE TABLE jezyk (
    id integer NOT NULL,
    nazwa character varying(20) NOT NULL,
    id_waluta integer NOT NULL
);

CREATE TABLE opis_zapotrzebowanie (
    id integer NOT NULL,
    id_zapotrzebowanie_trans_rodzaj integer NOT NULL,
    id_jezyk integer NOT NULL,
    wartosc text NOT NULL
);

CREATE TABLE osoba_klient (
    id integer NOT NULL,
    id_klient integer NOT NULL,
    id_osoba integer NOT NULL
);

CREATE TABLE wlasciciel (
    id integer NOT NULL,
    id_nieruchomosc integer NOT NULL,
    id_osoba integer NOT NULL,
    procent_udzial double precision
);

CREATE TABLE email_osoba (
    id integer NOT NULL,
    id_osoba integer,
    nazwa character varying(50) NOT NULL,
    opis text
);

CREATE TABLE email_media_nieruchomosc (
    id integer NOT NULL,
    id_media_nieruchomosc integer NOT NULL,
    nazwa character varying(50) NOT NULL,
    opis character varying(50)
);

CREATE TABLE kon_m_nieruchomosc (
    id integer NOT NULL,
    id_media_nieruchomosc integer NOT NULL,
    id_agent integer NOT NULL,
    komentarz text NOT NULL,
    data datetime  NOT NULL
);

CREATE TABLE ustalenia (
    id integer NOT NULL,
    id_klient integer NOT NULL,
    id_agent integer NOT NULL,
    data datetime ,
    tresc text
);

CREATE TABLE opis_nieruchomosc (
    id integer NOT NULL,
    id_nieruchomosc integer NOT NULL,
    id_agent integer NOT NULL,
    data datetime ,
    tresc text
);

CREATE TABLE wysylka_ofert_zapotrzebowanie (
    id integer NOT NULL,
    id_zapotrzebowanie integer NOT NULL,
    id_oferta integer NOT NULL,
    cena double precision NOT NULL,
    data datetime NOT NULL,
    is_lst_wsk bit  NOT NULL
);

CREATE TABLE opis_posz_zapotrzebowanie (
    id integer NOT NULL,
    id_zapotrzebowanie_trans_rodzaj integer NOT NULL,
    id_agent integer DEFAULT 1 NOT NULL,
    data datetime NOT NULL,
    wartosc text NOT NULL
);

CREATE TABLE opis_wew_zapotrzebowanie (
    id integer NOT NULL,
    id_zapotrzebowanie integer NOT NULL,
    id_oferta integer,
    zainteresowany bit ,
    cena character varying(15),
    id_agent integer NOT NULL,
    data datetime ,
    tresc text
);

CREATE TABLE lista_wsk_adr (
    id integer NOT NULL,
    id_oferta integer NOT NULL,
    id_zapotrzebowanie integer NOT NULL,
    id_klient integer NOT NULL,
    id_agent integer NOT NULL,
    data datetime  NOT NULL,
    ogladanie_data datetime NOT NULL,
    ogladanie_godzina integer NOT NULL,
    ogladanie_minuta integer NOT NULL
);

CREATE TABLE reklama_nieruchomosc_m (
    id integer NOT NULL,
    id_media_nieruchomosc integer NOT NULL,
    id_media_reklama integer NOT NULL,
    data datetime NOT NULL
);

CREATE TABLE agent_kalendarz (
    id integer NOT NULL,
    id_kalendarz integer NOT NULL,
    id_agent integer
);

CREATE TABLE agent_otodom (
    id integer NOT NULL,
    id_otodom integer NOT NULL
);

CREATE TABLE bank (
    id integer NOT NULL,
    nazwa character varying(50) NOT NULL
);


CREATE TABLE biuro_nier_kon (
    id integer NOT NULL,
    id_region_geog integer NOT NULL,
    email character varying(50) NOT NULL,
    nazwa character varying(30) NOT NULL,
    adres character varying(100)
);

CREATE TABLE biuro_nier_wspolpraca (
    id_klient integer NOT NULL,
    id_biuro_nier_kon integer NOT NULL
);

CREATE TABLE dane_firma (
    id_klient integer NOT NULL,
    nazwa character varying(100) NOT NULL,
    nip character varying(13) NOT NULL,
    regon character varying(14),
    krs character varying(15),
    kod_pocztowy character varying(6),
    id_region_geog integer,
    ulica character varying(40) NOT NULL,
    numer_dom character varying(10),
    numer_miesz character varying(10)
);

CREATE TABLE dane_slow_wyp_nier (
    id integer NOT NULL,
    id_nieruchomosc integer NOT NULL,
    id_wyposazenie_nier integer NOT NULL
);

CREATE TABLE dane_slow_wyp_pom (
    id integer NOT NULL,
    id_pomieszczenie_przyn_nier integer NOT NULL,
    id_wyposazenie_pom integer NOT NULL
);

CREATE TABLE dane_slow_wyp_zap (
    id integer NOT NULL,
    id_zapotrzebowanie_trans_rodzaj integer NOT NULL,
    id_wyposazenie_nier integer NOT NULL
);

CREATE TABLE dane_txt_nier (
    id integer NOT NULL,
    id_nieruchomosc integer NOT NULL,
    id_parametr_nier integer NOT NULL,
    wartosc character varying(100)
);

CREATE TABLE dane_txt_pom (
    id integer NOT NULL,
    id_pomieszczenie_przyn_nier integer NOT NULL,
    id_parametr_pom integer NOT NULL,
    wartosc character varying(100)
);

CREATE TABLE dane_txt_zap_max (
    id integer NOT NULL,
    id_zapotrzebowanie_trans_rodzaj integer NOT NULL,
    id_parametr_nier integer NOT NULL,
    wartosc character varying(100)
);


CREATE TABLE dane_txt_zap_min (
    id integer NOT NULL,
    id_zapotrzebowanie_trans_rodzaj integer NOT NULL,
    id_parametr_nier integer NOT NULL,
    wartosc character varying(100)
);

CREATE TABLE film (
    id integer NOT NULL,
    id_nieruchomosc integer NOT NULL,
    nazwa character varying(30) NOT NULL
);

CREATE TABLE kategoria_allegro (
    id integer NOT NULL,
    id_nier_rodzaj integer,
    id_trans_rodzaj integer,
    id_powiat integer,
    kategoria_allegro integer NOT NULL
);


CREATE TABLE klient (
    id integer NOT NULL,
    id_old integer,
    is_oferent_old bit ,
    id_osobowosc integer NOT NULL,
    id_agent integer NOT NULL
);

CREATE TABLE konto_agent (
    id integer NOT NULL,
    id_agent integer NOT NULL,
    id_bank integer NOT NULL,
    nr_konto character varying(26) NOT NULL
);

CREATE TABLE kredytowanie (
    id integer NOT NULL,
    id_transakcja integer NOT NULL,
    id_bank integer NOT NULL,
    kwota character varying(15) NOT NULL
);

CREATE TABLE kurs (
    id integer NOT NULL,
    wartosc character varying(10) NOT NULL
);

CREATE TABLE lang_tag (
    id integer NOT NULL,
    nazwa text NOT NULL
);

CREATE TABLE lista_niechcianych (
    id integer NOT NULL,
    nazwa character varying(30) NOT NULL
);

CREATE TABLE lista_param_nier (
    id integer NOT NULL,
    id_nier_rodzaj integer NOT NULL,
    id_parametr_nier integer NOT NULL,
    id_trans_rodzaj integer NOT NULL,
    waga integer,
    pokaz bit
);

CREATE TABLE lista_param_pom (
    id integer NOT NULL,
    id_pomieszczenie integer NOT NULL,
    id_parametr_pom integer NOT NULL
);

CREATE TABLE lista_param_slow_nier (
    id integer NOT NULL,
    id_nier_rodzaj integer NOT NULL,
    id_wyposazenie_nier integer NOT NULL,
    id_trans_rodzaj integer NOT NULL,
    waga integer,
    pokaz bit
);

CREATE TABLE lista_param_slow_pom (
    id integer NOT NULL,
    id_pomieszczenie integer NOT NULL,
    id_wyposazenie_pom integer NOT NULL
);

CREATE TABLE mailing (
    id integer NOT NULL,
    id_wojewodztwo integer NOT NULL,
    nazwa text,
    adres text,
    email text NOT NULL,
    zgoda bit
);

CREATE TABLE rodz_nier_szczeg (
    id integer NOT NULL,
    id_nier_rodzaj integer NOT NULL,
    nazwa character varying(30) NOT NULL
);

CREATE TABLE osoba_kon_bank (
    id integer NOT NULL,
    id_imie integer NOT NULL,
    nazwisko character varying(30) NOT NULL,
    id_bank integer NOT NULL
);

CREATE TABLE osobowosc (
    id integer NOT NULL,
    nazwa character varying(25) NOT NULL
);

CREATE TABLE param_nier_strona (
    id integer NOT NULL,
    id_nier_rodzaj integer NOT NULL,
    id_parametr_nier integer NOT NULL,
    id_trans_rodzaj integer NOT NULL
);

CREATE TABLE parametr_nier (
    id integer NOT NULL,
    id_sekcja integer NOT NULL,
    id_walidacja integer NOT NULL,
    waga integer NOT NULL,
    nazwa character varying(40) NOT NULL,
    dl_inf integer
);

CREATE TABLE parametr_pom (
    id integer NOT NULL,
    id_sekcja integer NOT NULL,
    id_walidacja integer NOT NULL,
    waga integer NOT NULL,
    nazwa character varying(40) NOT NULL,
    dl_inf integer
);

CREATE TABLE walidacja (
    id integer NOT NULL,
    nazwa character varying(20) NOT NULL
);

CREATE TABLE pomieszczenie (
    id integer NOT NULL,
    waga integer,
    nazwa character varying(30) NOT NULL
);

CREATE TABLE pomieszczenie_nier (
    id integer NOT NULL,
    id_nier_rodzaj integer NOT NULL,
    id_pomieszczenie integer NOT NULL
);

CREATE TABLE pomieszczenie_przyn_nier (
    id integer NOT NULL,
    id_nieruchomosc integer NOT NULL,
    id_pomieszczenie integer NOT NULL,
    nr_pomieszczenia integer NOT NULL
);

CREATE TABLE portal (
    id integer NOT NULL,
    nazwa character varying(20) NOT NULL
);

CREATE TABLE portal_wys (
    id integer NOT NULL,
    id_oferta integer NOT NULL,
    id_portal integer NOT NULL,
    portal_ins_id integer,
    data_wys datetime NOT NULL,
    data_wyg datetime NOT NULL,
    is_active bit
);

CREATE TABLE precyzja_kojarzenie (
    id integer NOT NULL,
    nazwa text NOT NULL,
    baza text NOT NULL,
    krok text NOT NULL
);

CREATE TABLE priorytet_reklama (
    id integer NOT NULL,
    nazwa text
);

CREATE TABLE rejestracja_nto (
    id integer NOT NULL,
    adres_ip text,
    data_odwiedzin datetime ,
    port_klient integer,
    sposob_odwiedzin text,
    przegladarka text
);

CREATE TABLE rekord_nieakt_lista_wsk_adr (
    id integer NOT NULL,
    id_agent integer NOT NULL,
    data datetime 
);

CREATE TABLE rozmowa_przychodzaca (
    id integer NOT NULL,
    nr_telefon text NOT NULL,
    id_status_dzwonienie integer NOT NULL,
    id_agent integer NOT NULL,
    polaczenie_zakonczone bit ,
    czas_poczatek datetime ,
    czas_koniec datetime 
);

CREATE TABLE sekcja (
    id integer NOT NULL,
    nazwa character varying(40) NOT NULL
);

CREATE TABLE status_dzwonienie (
    id integer NOT NULL,
    nazwa text NOT NULL
);

CREATE TABLE subskrypcja (
    id integer NOT NULL,
    id_nier_rodzaj integer NOT NULL,
    id_trans_rodzaj integer NOT NULL,
    id_jezyk integer DEFAULT 1 NOT NULL,
    cena_min double precision,
    cena_max double precision,
    email text,
    data datetime
);

CREATE TABLE telefon_niechciany (
    id integer NOT NULL,
    id_lista_niechcianych integer NOT NULL,
    nazwa character varying(13) NOT NULL,
    opis character varying(50)
);

CREATE TABLE telefon_os_bank (
    id integer NOT NULL,
    id_osoba_kon_bank integer NOT NULL,
    nazwa character varying(9) NOT NULL
);

CREATE TABLE tlumaczenie (
    id integer NOT NULL,
    nazwa_lang_tag text NOT NULL,
    id_jezyk integer NOT NULL,
    nazwa text NOT NULL
);

CREATE TABLE transakcja (
    id integer NOT NULL,
    id_wlasciciel integer NOT NULL,
    id_nabywca integer NOT NULL,
    id_oferta integer NOT NULL,
    id_nieruchomosc integer NOT NULL,
    id_lista_wsk_adr integer NOT NULL,
    data_umowa_przed datetime NOT NULL,
    data_umowa_notar datetime,
    termin_notar datetime,
    zdanie_nier datetime,
    zadatek_w character varying(7),
    zadatek_n character varying(7),
    prowizja_w character varying(5),
    prowizja_n character varying(5),
    kredyt bit,
    finalizacja bit,
    cena character varying(15)
);

CREATE TABLE transakcja_nier (
    id integer NOT NULL,
    id_trans_rodzaj integer NOT NULL,
    id_nier_rodzaj integer NOT NULL,
    typ_of_otodom text
);

CREATE TABLE waluta (
    id integer NOT NULL,
    nazwa character varying(20) NOT NULL,
    skrot character varying(10) NOT NULL
);

CREATE TABLE wypos_nier_strona (
    id integer NOT NULL,
    id_nier_rodzaj integer NOT NULL,
    id_wyposazenie_nier integer NOT NULL,
    id_trans_rodzaj integer NOT NULL
);

CREATE TABLE wyposazenie_nier (
    id integer NOT NULL,
    id_parent integer,
    wielokrotne bit,
    ma_dzieci bit,
    waga integer NOT NULL,
    id_sekcja integer NOT NULL,
    nazwa character varying(60) NOT NULL
);

CREATE TABLE wyposazenie_pom (
    id integer NOT NULL,
    id_parent integer,
    wielokrotne bit,
    ma_dzieci bit,
    waga integer NOT NULL,
    id_sekcja integer NOT NULL,
    nazwa character varying(60) NOT NULL
);

CREATE TABLE zamiana (
    id integer NOT NULL,
    id_oferta integer NOT NULL,
    id_zapotrzebowanie integer NOT NULL
);

CREATE TABLE zap_lokaliz_nier (
    id integer NOT NULL,
    id_zapotrzebowanie_trans_rodzaj integer NOT NULL,
    id_region_geog integer NOT NULL
);

CREATE TABLE zap_szcz_nier (
    id integer NOT NULL,
    id_zapotrzebowanie_trans_rodzaj integer NOT NULL,
    id_rodz_nier_szcz integer NOT NULL
);

CREATE TABLE zdjecie (
    id integer NOT NULL,
    id_nieruchomosc integer NOT NULL,
    nazwa character varying(40) NOT NULL,
    nazwa_old text
);

ALTER TABLE  agent_kalendarz
    ADD CONSTRAINT agent_kalendarz_pkey PRIMARY KEY (id);


--
-- Name: agent_login_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  agent
    ADD CONSTRAINT agent_login_key UNIQUE ("login");


--
-- Name: agent_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  agent
    ADD CONSTRAINT agent_pkey PRIMARY KEY (id);


--
-- Name: bank_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  bank
    ADD CONSTRAINT bank_pkey PRIMARY KEY (id);


--
-- Name: biuro_nier_kon_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  biuro_nier_kon
    ADD CONSTRAINT biuro_nier_kon_pkey PRIMARY KEY (id);


--
-- Name: biuro_nier_wspolpraca_id_biuro_nier_kon_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  biuro_nier_wspolpraca
    ADD CONSTRAINT biuro_nier_wspolpraca_id_biuro_nier_kon_key UNIQUE (id_biuro_nier_kon);


--
-- Name: biuro_nier_wspolpraca_id_klient_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  biuro_nier_wspolpraca
    ADD CONSTRAINT biuro_nier_wspolpraca_id_klient_key UNIQUE (id_klient);


--
-- Name: cena_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  cena
    ADD CONSTRAINT cena_pkey PRIMARY KEY (id);


--
-- Name: dane_firma_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  dane_firma
    ADD CONSTRAINT dane_firma_pkey PRIMARY KEY (id_klient);


--
-- Name: dane_slow_wyp_nier_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  dane_slow_wyp_nier
    ADD CONSTRAINT dane_slow_wyp_nier_pkey PRIMARY KEY (id);


--
-- Name: dane_slow_wyp_pom_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  dane_slow_wyp_pom
    ADD CONSTRAINT dane_slow_wyp_pom_pkey PRIMARY KEY (id);


--
-- Name: dane_slow_wyp_zap_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  dane_slow_wyp_zap
    ADD CONSTRAINT dane_slow_wyp_zap_pkey PRIMARY KEY (id);


--
-- Name: dane_txt_nier_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  dane_txt_nier
    ADD CONSTRAINT dane_txt_nier_pkey PRIMARY KEY (id);


--
-- Name: dane_txt_pom_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  dane_txt_pom
    ADD CONSTRAINT dane_txt_pom_pkey PRIMARY KEY (id);


--
-- Name: dane_txt_zap_max_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  dane_txt_zap_max
    ADD CONSTRAINT dane_txt_zap_max_pkey PRIMARY KEY (id);


--
-- Name: dane_txt_zap_min_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  dane_txt_zap_min
    ADD CONSTRAINT dane_txt_zap_min_pkey PRIMARY KEY (id);


--
-- Name: email_media_nieruchomosc_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  email_media_nieruchomosc
    ADD CONSTRAINT email_media_nieruchomosc_pkey PRIMARY KEY (id);


--
-- Name: email_osoba_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  email_osoba
    ADD CONSTRAINT email_osoba_pkey PRIMARY KEY (id);


--
-- Name: film_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  film
    ADD CONSTRAINT film_pkey PRIMARY KEY (id);


--
-- Name: godzina_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  godzina
    ADD CONSTRAINT godzina_pkey PRIMARY KEY (id);


--
-- Name: imie_nazwa_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  imie
    ADD CONSTRAINT imie_nazwa_key UNIQUE (nazwa);


--
-- Name: imie_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  imie
    ADD CONSTRAINT imie_pkey PRIMARY KEY (id);


--
-- Name: jezyk_nazwa_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  jezyk
    ADD CONSTRAINT jezyk_nazwa_key UNIQUE (nazwa);


--
-- Name: jezyk_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  jezyk
    ADD CONSTRAINT jezyk_pkey PRIMARY KEY (id);


--
-- Name: kalendarz_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  kalendarz
    ADD CONSTRAINT kalendarz_pkey PRIMARY KEY (id);


--
-- Name: kategoria_allegro_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  kategoria_allegro
    ADD CONSTRAINT kategoria_allegro_pkey PRIMARY KEY (id);


--
-- Name: klient_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  klient
    ADD CONSTRAINT klient_pkey PRIMARY KEY (id);


--
-- Name: komorka_id_osoba_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  komorka
    ADD CONSTRAINT komorka_id_osoba_key UNIQUE (id_osoba);


--
-- Name: kon_m_nieruchomosc_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  kon_m_nieruchomosc
    ADD CONSTRAINT kon_m_nieruchomosc_pkey PRIMARY KEY (id);


--
-- Name: konto_agent_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  konto_agent
    ADD CONSTRAINT konto_agent_pkey PRIMARY KEY (id);


--
-- Name: kredytowanie_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  kredytowanie
    ADD CONSTRAINT kredytowanie_pkey PRIMARY KEY (id);


--
-- Name: kurs_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  kurs
    ADD CONSTRAINT kurs_id_key UNIQUE (id);


--
-- Name: lang_tag_nazwa_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  lang_tag
    ADD CONSTRAINT lang_tag_nazwa_key UNIQUE (nazwa);


--
-- Name: lang_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  lang_tag
    ADD CONSTRAINT lang_tag_pkey PRIMARY KEY (id);


--
-- Name: lista_niechcianych_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  lista_niechcianych
    ADD CONSTRAINT lista_niechcianych_pkey PRIMARY KEY (id);


--
-- Name: lista_param_nier_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  lista_param_nier
    ADD CONSTRAINT lista_param_nier_pkey PRIMARY KEY (id);


--
-- Name: lista_param_pom_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  lista_param_pom
    ADD CONSTRAINT lista_param_pom_pkey PRIMARY KEY (id);


--
-- Name: lista_param_slow_nier_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  lista_param_slow_nier
    ADD CONSTRAINT lista_param_slow_nier_pkey PRIMARY KEY (id);


--
-- Name: lista_param_slow_pom_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  lista_param_slow_pom
    ADD CONSTRAINT lista_param_slow_pom_pkey PRIMARY KEY (id);


--
-- Name: lista_wsk_adr_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  lista_wsk_adr
    ADD CONSTRAINT lista_wsk_adr_pkey PRIMARY KEY (id);


--
-- Name: media_nieruchomosc_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  media_nieruchomosc
    ADD CONSTRAINT media_nieruchomosc_pkey PRIMARY KEY (id);


--
-- Name: media_reklama_nazwa_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  media_reklama
    ADD CONSTRAINT media_reklama_nazwa_key UNIQUE (nazwa);


--
-- Name: media_reklama_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  media_reklama
    ADD CONSTRAINT media_reklama_pkey PRIMARY KEY (id);


--
-- Name: minuta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  minuta
    ADD CONSTRAINT minuta_pkey PRIMARY KEY (id);


--
-- Name: nier_rodzaj_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  nier_rodzaj
    ADD CONSTRAINT nier_rodzaj_pkey PRIMARY KEY (id);


--
-- Name: nieruchomosc_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  nieruchomosc
    ADD CONSTRAINT nieruchomosc_pkey PRIMARY KEY (id);


--
-- Name: oferta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  oferta
    ADD CONSTRAINT oferta_pkey PRIMARY KEY (id);


--
-- Name: opis_nieruchomosc_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  opis_nieruchomosc
    ADD CONSTRAINT opis_nieruchomosc_pkey PRIMARY KEY (id);


--
-- Name: opis_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  opis
    ADD CONSTRAINT opis_pkey PRIMARY KEY (id);


--
-- Name: opis_posz_zapotrzebowanie_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  opis_posz_zapotrzebowanie
    ADD CONSTRAINT opis_posz_zapotrzebowanie_pkey PRIMARY KEY (id);


--
-- Name: opis_wew_zapotrzebowanie_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  opis_wew_zapotrzebowanie
    ADD CONSTRAINT opis_wew_zapotrzebowanie_pkey PRIMARY KEY (id);


--
-- Name: opis_zapotrzebowanie_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  opis_zapotrzebowanie
    ADD CONSTRAINT opis_zapotrzebowanie_pkey PRIMARY KEY (id);


--
-- Name: osoba_adres_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  osoba_adres
    ADD CONSTRAINT osoba_adres_id_key UNIQUE (id);


--
-- Name: osoba_dowod_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  osoba_dowod
    ADD CONSTRAINT osoba_dowod_pkey PRIMARY KEY (id);


--
-- Name: osoba_klient_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  osoba_klient
    ADD CONSTRAINT osoba_klient_pkey PRIMARY KEY (id);


--
-- Name: osoba_kon_bank_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  osoba_kon_bank
    ADD CONSTRAINT osoba_kon_bank_pkey PRIMARY KEY (id);


--
-- Name: osoba_lista_wsk_adr_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  osoba_lista_wsk_adr
    ADD CONSTRAINT osoba_lista_wsk_adr_pkey PRIMARY KEY (id);


--
-- Name: osoba_oferta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  osoba_oferta
    ADD CONSTRAINT osoba_oferta_pkey PRIMARY KEY (id);


--
-- Name: osoba_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  osoba
    ADD CONSTRAINT osoba_pkey PRIMARY KEY (id);


--
-- Name: osoba_zapotrzebowanie_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  osoba_zapotrzebowanie
    ADD CONSTRAINT osoba_zapotrzebowanie_pkey PRIMARY KEY (id);


--
-- Name: osobowosc_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  osobowosc
    ADD CONSTRAINT osobowosc_pkey PRIMARY KEY (id);


--
-- Name: param_nier_strona_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  param_nier_strona
    ADD CONSTRAINT param_nier_strona_pkey PRIMARY KEY (id);


--
-- Name: parametr_nier_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  parametr_nier
    ADD CONSTRAINT parametr_nier_pkey PRIMARY KEY (id);


--
-- Name: parametr_pom_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  parametr_pom
    ADD CONSTRAINT parametr_pom_pkey PRIMARY KEY (id);


--
-- Name: pomieszczenie_nier_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  pomieszczenie_nier
    ADD CONSTRAINT pomieszczenie_nier_pkey PRIMARY KEY (id);


--
-- Name: pomieszczenie_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  pomieszczenie
    ADD CONSTRAINT pomieszczenie_pkey PRIMARY KEY (id);


--
-- Name: pomieszczenie_przyn_nier_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  pomieszczenie_przyn_nier
    ADD CONSTRAINT pomieszczenie_przyn_nier_pkey PRIMARY KEY (id);


--
-- Name: portal_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  portal
    ADD CONSTRAINT portal_pkey PRIMARY KEY (id);


--
-- Name: portal_wys_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  portal_wys
    ADD CONSTRAINT portal_wys_pkey PRIMARY KEY (id);


--
-- Name: precyzja_kojarzenie_nazwa_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  precyzja_kojarzenie
    ADD CONSTRAINT precyzja_kojarzenie_nazwa_key UNIQUE (nazwa);


--
-- Name: precyzja_kojarzenie_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  precyzja_kojarzenie
    ADD CONSTRAINT precyzja_kojarzenie_pkey PRIMARY KEY (id);


--
-- Name: priorytet_reklama_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  priorytet_reklama
    ADD CONSTRAINT priorytet_reklama_pkey PRIMARY KEY (id);


--
-- Name: prowizja_zapotrzebowanie_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  prowizja_zapotrzebowanie
    ADD CONSTRAINT prowizja_zapotrzebowanie_pkey PRIMARY KEY (id);


--
-- Name: region_geog_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  region_geog
    ADD CONSTRAINT region_geog_pkey PRIMARY KEY (id);


--
-- Name: rejestracja_nto_pkey; Type: CONSTRAINT; Schema: public; Owner: azg; Tablespace: 
--

ALTER TABLE  rejestracja_nto
    ADD CONSTRAINT rejestracja_nto_pkey PRIMARY KEY (id);


--
-- Name: reklama_nieruchomosc_m_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  reklama_nieruchomosc_m
    ADD CONSTRAINT reklama_nieruchomosc_m_pkey PRIMARY KEY (id);


--
-- Name: rekord_nieakt_lista_wsk_adr_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  rekord_nieakt_lista_wsk_adr
    ADD CONSTRAINT rekord_nieakt_lista_wsk_adr_id_key UNIQUE (id);


--
-- Name: rodz_nier_szczeg_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  rodz_nier_szczeg
    ADD CONSTRAINT rodz_nier_szczeg_pkey PRIMARY KEY (id);


--
-- Name: rodzaj_dowod_tozsamosc_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  rodzaj_dowod_tozsamosc
    ADD CONSTRAINT rodzaj_dowod_tozsamosc_pkey PRIMARY KEY (id);


--
-- Name: rozmowa_przychodzaca_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  rozmowa_przychodzaca
    ADD CONSTRAINT rozmowa_przychodzaca_pkey PRIMARY KEY (id);


--
-- Name: sekcja_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  sekcja
    ADD CONSTRAINT sekcja_pkey PRIMARY KEY (id);


--
-- Name: sposob_finansowania_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  sposob_finansowania
    ADD CONSTRAINT sposob_finansowania_pkey PRIMARY KEY (id);


--
-- Name: spotkanie_os_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  spotkanie_os
    ADD CONSTRAINT spotkanie_os_pkey PRIMARY KEY (id);


--
-- Name: spotkanie_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  spotkanie
    ADD CONSTRAINT spotkanie_pkey PRIMARY KEY (id);


--
-- Name: status_dzwonienie_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  status_dzwonienie
    ADD CONSTRAINT status_dzwonienie_pkey PRIMARY KEY (id);


--
-- Name: status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  status
    ADD CONSTRAINT status_pkey PRIMARY KEY (id);


--
-- Name: subskrypcja_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  subskrypcja
    ADD CONSTRAINT subskrypcja_pkey PRIMARY KEY (id);


--
-- Name: telefon_media_nieruchomosc_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  telefon_media_nieruchomosc
    ADD CONSTRAINT telefon_media_nieruchomosc_pkey PRIMARY KEY (id);


--
-- Name: telefon_niechciany_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  telefon_niechciany
    ADD CONSTRAINT telefon_niechciany_pkey PRIMARY KEY (id);


--
-- Name: telefon_os_bank_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  telefon_os_bank
    ADD CONSTRAINT telefon_os_bank_pkey PRIMARY KEY (id);


--
-- Name: telefon_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  telefon
    ADD CONSTRAINT telefon_pkey PRIMARY KEY (id);


--
-- Name: tlumaczenie_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  tlumaczenie
    ADD CONSTRAINT tlumaczenie_pkey PRIMARY KEY (id);


--
-- Name: trans_rodzaj_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  trans_rodzaj
    ADD CONSTRAINT trans_rodzaj_pkey PRIMARY KEY (id);


--
-- Name: transakcja_nier_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  transakcja_nier
    ADD CONSTRAINT transakcja_nier_pkey PRIMARY KEY (id);


--
-- Name: transakcja_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  transakcja
    ADD CONSTRAINT transakcja_pkey PRIMARY KEY (id);


--
-- Name: umowienie_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  umowienie
    ADD CONSTRAINT umowienie_pkey PRIMARY KEY (id);


--
-- Name: ustalenia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  ustalenia
    ADD CONSTRAINT ustalenia_pkey PRIMARY KEY (id);


--
-- Name: walidacja_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  walidacja
    ADD CONSTRAINT walidacja_pkey PRIMARY KEY (id);


--
-- Name: waluta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  waluta
    ADD CONSTRAINT waluta_pkey PRIMARY KEY (id);


--
-- Name: wlasciciel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  wlasciciel
    ADD CONSTRAINT wlasciciel_pkey PRIMARY KEY (id);


--
-- Name: wypos_nier_strona_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  wypos_nier_strona
    ADD CONSTRAINT wypos_nier_strona_pkey PRIMARY KEY (id);


--
-- Name: wyposazenie_nier_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  wyposazenie_nier
    ADD CONSTRAINT wyposazenie_nier_pkey PRIMARY KEY (id);


--
-- Name: wyposazenie_pom_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  wyposazenie_pom
    ADD CONSTRAINT wyposazenie_pom_pkey PRIMARY KEY (id);


--
-- Name: wysylka_ofert_zapotrzebowanie_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  wysylka_ofert_zapotrzebowanie
    ADD CONSTRAINT wysylka_ofert_zapotrzebowanie_pkey PRIMARY KEY (id);


--
-- Name: zamiana_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  zamiana
    ADD CONSTRAINT zamiana_pkey PRIMARY KEY (id);


--
-- Name: zap_lokaliz_nier_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  zap_lokaliz_nier
    ADD CONSTRAINT zap_lokaliz_nier_pkey PRIMARY KEY (id);


--
-- Name: zap_szcz_nier_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  zap_szcz_nier
    ADD CONSTRAINT zap_szcz_nier_pkey PRIMARY KEY (id);


--
-- Name: zapotrzebowanie_nier_rodzaj_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  zapotrzebowanie_nier_rodzaj
    ADD CONSTRAINT zapotrzebowanie_nier_rodzaj_pkey PRIMARY KEY (id);


--
-- Name: zapotrzebowanie_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  zapotrzebowanie
    ADD CONSTRAINT zapotrzebowanie_pkey PRIMARY KEY (id);


--
-- Name: zapotrzebowanie_trans_rodzaj_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  zapotrzebowanie_trans_rodzaj
    ADD CONSTRAINT zapotrzebowanie_trans_rodzaj_pkey PRIMARY KEY (id);


--
-- Name: zdjecie_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  zdjecie
    ADD CONSTRAINT zdjecie_pkey PRIMARY KEY (id);


--
-- Name: zmiana_status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE  zmiana_status
    ADD CONSTRAINT zmiana_status_pkey PRIMARY KEY (id);


--
-- Name: agent_otodom_id_key; Type: INDEX; Schema: public; Owner: azg; Tablespace: 
--

CREATE UNIQUE INDEX agent_otodom_id_key ON agent_otodom (id);


--
-- Name: mailing_id_key; Type: INDEX; Schema: public; Owner: azg; Tablespace: 
--

CREATE UNIQUE INDEX mailing_id_key ON mailing  (id);


--
-- Name: rejestracja_nto_id_key; Type: INDEX; Schema: public; Owner: azg; Tablespace: 
--

CREATE UNIQUE INDEX rejestracja_nto_id_key ON rejestracja_nto  (id);


--
-- Name: agent_kalendarz_id_agent_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  agent_kalendarz
    ADD CONSTRAINT agent_kalendarz_id_agent_fkey FOREIGN KEY (id_agent) REFERENCES agent(id);


--
-- Name: agent_kalendarz_id_kalendarz_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  agent_kalendarz
    ADD CONSTRAINT agent_kalendarz_id_kalendarz_fkey FOREIGN KEY (id_kalendarz) REFERENCES kalendarz(id);


--
-- Name: agent_nadzor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  agent
    ADD CONSTRAINT agent_nadzor_fkey FOREIGN KEY (nadzor) REFERENCES agent(id);


--
-- Name: biuro_nier_kon_id_region_geog_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  biuro_nier_kon
    ADD CONSTRAINT biuro_nier_kon_id_region_geog_fkey FOREIGN KEY (id_region_geog) REFERENCES region_geog(id);


--
-- Name: biuro_nier_wspolpraca_id_biuro_nier_kon_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  biuro_nier_wspolpraca
    ADD CONSTRAINT biuro_nier_wspolpraca_id_biuro_nier_kon_fkey FOREIGN KEY (id_biuro_nier_kon) REFERENCES biuro_nier_kon(id);


--
-- Name: biuro_nier_wspolpraca_id_klient_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  biuro_nier_wspolpraca
    ADD CONSTRAINT biuro_nier_wspolpraca_id_klient_fkey FOREIGN KEY (id_klient) REFERENCES klient(id);


--
-- Name: cena_id_agent_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  cena
    ADD CONSTRAINT cena_id_agent_fkey FOREIGN KEY (id_agent) REFERENCES agent(id);


--
-- Name: cena_id_oferta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  cena
    ADD CONSTRAINT cena_id_oferta_fkey FOREIGN KEY (id_oferta) REFERENCES oferta(id);


--
-- Name: cena_id_osoba_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  cena
    ADD CONSTRAINT cena_id_osoba_fkey FOREIGN KEY (id_osoba) REFERENCES osoba(id);


--
-- Name: dane_firma_id_klient_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  dane_firma
    ADD CONSTRAINT dane_firma_id_klient_fkey FOREIGN KEY (id_klient) REFERENCES klient(id);


--
-- Name: dane_firma_id_region_geog_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  dane_firma
    ADD CONSTRAINT dane_firma_id_region_geog_fkey FOREIGN KEY (id_region_geog) REFERENCES region_geog(id);


--
-- Name: dane_slow_wyp_nier_id_nieruchomosc_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  dane_slow_wyp_nier
    ADD CONSTRAINT dane_slow_wyp_nier_id_nieruchomosc_fkey FOREIGN KEY (id_nieruchomosc) REFERENCES nieruchomosc(id);


--
-- Name: dane_slow_wyp_nier_id_wyposazenie_nier_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  dane_slow_wyp_nier
    ADD CONSTRAINT dane_slow_wyp_nier_id_wyposazenie_nier_fkey FOREIGN KEY (id_wyposazenie_nier) REFERENCES wyposazenie_nier(id);


--
-- Name: dane_slow_wyp_pom_id_pomieszczenie_przyn_nier_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  dane_slow_wyp_pom
    ADD CONSTRAINT dane_slow_wyp_pom_id_pomieszczenie_przyn_nier_fkey FOREIGN KEY (id_pomieszczenie_przyn_nier) REFERENCES pomieszczenie_przyn_nier(id);


--
-- Name: dane_slow_wyp_pom_id_wyposazenie_pom_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  dane_slow_wyp_pom
    ADD CONSTRAINT dane_slow_wyp_pom_id_wyposazenie_pom_fkey FOREIGN KEY (id_wyposazenie_pom) REFERENCES wyposazenie_pom(id);


--
-- Name: dane_slow_wyp_zap_id_wyposazenie_nier_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  dane_slow_wyp_zap
    ADD CONSTRAINT dane_slow_wyp_zap_id_wyposazenie_nier_fkey FOREIGN KEY (id_wyposazenie_nier) REFERENCES wyposazenie_nier(id);


--
-- Name: dane_slow_wyp_zap_id_zapotrzebowanie_trans_rodzaj_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  dane_slow_wyp_zap
    ADD CONSTRAINT dane_slow_wyp_zap_id_zapotrzebowanie_trans_rodzaj_fkey FOREIGN KEY (id_zapotrzebowanie_trans_rodzaj) REFERENCES zapotrzebowanie_trans_rodzaj(id);


--
-- Name: dane_txt_nier_id_nieruchomosc_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  dane_txt_nier
    ADD CONSTRAINT dane_txt_nier_id_nieruchomosc_fkey FOREIGN KEY (id_nieruchomosc) REFERENCES nieruchomosc(id);


--
-- Name: dane_txt_nier_id_parametr_nier_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  dane_txt_nier
    ADD CONSTRAINT dane_txt_nier_id_parametr_nier_fkey FOREIGN KEY (id_parametr_nier) REFERENCES parametr_nier(id);


--
-- Name: dane_txt_pom_id_parametr_pom_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  dane_txt_pom
    ADD CONSTRAINT dane_txt_pom_id_parametr_pom_fkey FOREIGN KEY (id_parametr_pom) REFERENCES parametr_pom(id);


--
-- Name: dane_txt_pom_id_pomieszczenie_przyn_nier_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  dane_txt_pom
    ADD CONSTRAINT dane_txt_pom_id_pomieszczenie_przyn_nier_fkey FOREIGN KEY (id_pomieszczenie_przyn_nier) REFERENCES pomieszczenie_przyn_nier(id);


--
-- Name: dane_txt_zap_max_id_parametr_nier_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  dane_txt_zap_max
    ADD CONSTRAINT dane_txt_zap_max_id_parametr_nier_fkey FOREIGN KEY (id_parametr_nier) REFERENCES parametr_nier(id);


--
-- Name: dane_txt_zap_max_id_zapotrzebowanie_trans_rodzaj_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  dane_txt_zap_max
    ADD CONSTRAINT dane_txt_zap_max_id_zapotrzebowanie_trans_rodzaj_fkey FOREIGN KEY (id_zapotrzebowanie_trans_rodzaj) REFERENCES zapotrzebowanie_trans_rodzaj(id);


--
-- Name: dane_txt_zap_min_id_parametr_nier_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  dane_txt_zap_min
    ADD CONSTRAINT dane_txt_zap_min_id_parametr_nier_fkey FOREIGN KEY (id_parametr_nier) REFERENCES parametr_nier(id);


--
-- Name: dane_txt_zap_min_id_zapotrzebowanie_trans_rodzaj_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  dane_txt_zap_min
    ADD CONSTRAINT dane_txt_zap_min_id_zapotrzebowanie_trans_rodzaj_fkey FOREIGN KEY (id_zapotrzebowanie_trans_rodzaj) REFERENCES zapotrzebowanie_trans_rodzaj(id);


--
-- Name: email_media_nieruchomosc_id_media_nieruchomosc_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  email_media_nieruchomosc
    ADD CONSTRAINT email_media_nieruchomosc_id_media_nieruchomosc_fkey FOREIGN KEY (id_media_nieruchomosc) REFERENCES media_nieruchomosc(id);


--
-- Name: email_osoba_id_osoba_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  email_osoba
    ADD CONSTRAINT email_osoba_id_osoba_fkey FOREIGN KEY (id_osoba) REFERENCES osoba(id);


--
-- Name: film_id_nieruchomosc_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  film
    ADD CONSTRAINT film_id_nieruchomosc_fkey FOREIGN KEY (id_nieruchomosc) REFERENCES nieruchomosc(id);


--
-- Name: jezyk_id_waluta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  jezyk
    ADD CONSTRAINT jezyk_id_waluta_fkey FOREIGN KEY (id_waluta) REFERENCES waluta(id);


--
-- Name: kalendarz_id_godzina_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  kalendarz
    ADD CONSTRAINT kalendarz_id_godzina_fkey FOREIGN KEY (id_godzina) REFERENCES godzina(id);


--
-- Name: kalendarz_id_minuta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  kalendarz
    ADD CONSTRAINT kalendarz_id_minuta_fkey FOREIGN KEY (id_minuta) REFERENCES minuta(id);


--
-- Name: kalendarz_id_spotkanie_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  kalendarz
    ADD CONSTRAINT kalendarz_id_spotkanie_fkey FOREIGN KEY (id_spotkanie) REFERENCES spotkanie(id);


--
-- Name: kategoria_allegro_id_nier_rodzaj_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  kategoria_allegro
    ADD CONSTRAINT kategoria_allegro_id_nier_rodzaj_fkey FOREIGN KEY (id_nier_rodzaj) REFERENCES nier_rodzaj(id);


--
-- Name: kategoria_allegro_id_powiat_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  kategoria_allegro
    ADD CONSTRAINT kategoria_allegro_id_powiat_fkey FOREIGN KEY (id_powiat) REFERENCES region_geog(id);


--
-- Name: kategoria_allegro_id_trans_rodzaj_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  kategoria_allegro
    ADD CONSTRAINT kategoria_allegro_id_trans_rodzaj_fkey FOREIGN KEY (id_trans_rodzaj) REFERENCES trans_rodzaj(id);


--
-- Name: klient_id_agent_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  klient
    ADD CONSTRAINT klient_id_agent_fkey FOREIGN KEY (id_agent) REFERENCES agent(id);


--
-- Name: klient_id_osobowosc_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  klient
    ADD CONSTRAINT klient_id_osobowosc_fkey FOREIGN KEY (id_osobowosc) REFERENCES osobowosc(id);


--
-- Name: komorka_id_osoba_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  komorka
    ADD CONSTRAINT komorka_id_osoba_fkey FOREIGN KEY (id_osoba) REFERENCES osoba(id);


--
-- Name: kon_m_nieruchomosc_id_agent_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  kon_m_nieruchomosc
    ADD CONSTRAINT kon_m_nieruchomosc_id_agent_fkey FOREIGN KEY (id_agent) REFERENCES agent(id);


--
-- Name: kon_m_nieruchomosc_id_media_nieruchomosc_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  kon_m_nieruchomosc
    ADD CONSTRAINT kon_m_nieruchomosc_id_media_nieruchomosc_fkey FOREIGN KEY (id_media_nieruchomosc) REFERENCES media_nieruchomosc(id);


--
-- Name: konto_agent_id_agent_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  konto_agent
    ADD CONSTRAINT konto_agent_id_agent_fkey FOREIGN KEY (id_agent) REFERENCES agent(id);


--
-- Name: konto_agent_id_bank_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  konto_agent
    ADD CONSTRAINT konto_agent_id_bank_fkey FOREIGN KEY (id_bank) REFERENCES bank(id);


--
-- Name: kredytowanie_id_bank_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  kredytowanie
    ADD CONSTRAINT kredytowanie_id_bank_fkey FOREIGN KEY (id_bank) REFERENCES bank(id);


--
-- Name: kredytowanie_id_transakcja_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  kredytowanie
    ADD CONSTRAINT kredytowanie_id_transakcja_fkey FOREIGN KEY (id_transakcja) REFERENCES transakcja(id);


--
-- Name: kurs_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  kurs
    ADD CONSTRAINT kurs_id_fkey FOREIGN KEY (id) REFERENCES waluta(id);


--
-- Name: lista_param_nier_id_nier_rodzaj_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  lista_param_nier
    ADD CONSTRAINT lista_param_nier_id_nier_rodzaj_fkey FOREIGN KEY (id_nier_rodzaj) REFERENCES nier_rodzaj(id);


--
-- Name: lista_param_nier_id_parametr_nier_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  lista_param_nier
    ADD CONSTRAINT lista_param_nier_id_parametr_nier_fkey FOREIGN KEY (id_parametr_nier) REFERENCES parametr_nier(id);


--
-- Name: lista_param_nier_id_trans_rodzaj_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  lista_param_nier
    ADD CONSTRAINT lista_param_nier_id_trans_rodzaj_fkey FOREIGN KEY (id_trans_rodzaj) REFERENCES trans_rodzaj(id);


--
-- Name: lista_param_pom_id_parametr_pom_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  lista_param_pom
    ADD CONSTRAINT lista_param_pom_id_parametr_pom_fkey FOREIGN KEY (id_parametr_pom) REFERENCES parametr_pom(id);


--
-- Name: lista_param_pom_id_pomieszczenie_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  lista_param_pom
    ADD CONSTRAINT lista_param_pom_id_pomieszczenie_fkey FOREIGN KEY (id_pomieszczenie) REFERENCES pomieszczenie(id);


--
-- Name: lista_param_slow_nier_id_nier_rodzaj_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  lista_param_slow_nier
    ADD CONSTRAINT lista_param_slow_nier_id_nier_rodzaj_fkey FOREIGN KEY (id_nier_rodzaj) REFERENCES nier_rodzaj(id);


--
-- Name: lista_param_slow_nier_id_trans_rodzaj_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  lista_param_slow_nier
    ADD CONSTRAINT lista_param_slow_nier_id_trans_rodzaj_fkey FOREIGN KEY (id_trans_rodzaj) REFERENCES trans_rodzaj(id);


--
-- Name: lista_param_slow_nier_id_wyposazenie_nier_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  lista_param_slow_nier
    ADD CONSTRAINT lista_param_slow_nier_id_wyposazenie_nier_fkey FOREIGN KEY (id_wyposazenie_nier) REFERENCES wyposazenie_nier(id);


--
-- Name: lista_param_slow_pom_id_pomieszczenie_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  lista_param_slow_pom
    ADD CONSTRAINT lista_param_slow_pom_id_pomieszczenie_fkey FOREIGN KEY (id_pomieszczenie) REFERENCES pomieszczenie(id);


--
-- Name: lista_param_slow_pom_id_wyposazenie_pom_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  lista_param_slow_pom
    ADD CONSTRAINT lista_param_slow_pom_id_wyposazenie_pom_fkey FOREIGN KEY (id_wyposazenie_pom) REFERENCES wyposazenie_pom(id);


--
-- Name: lista_wsk_adr_id_agent_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  lista_wsk_adr
    ADD CONSTRAINT lista_wsk_adr_id_agent_fkey FOREIGN KEY (id_agent) REFERENCES agent(id);


--
-- Name: lista_wsk_adr_id_klient_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  lista_wsk_adr
    ADD CONSTRAINT lista_wsk_adr_id_klient_fkey FOREIGN KEY (id_klient) REFERENCES klient(id);


--
-- Name: lista_wsk_adr_id_oferta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  lista_wsk_adr
    ADD CONSTRAINT lista_wsk_adr_id_oferta_fkey FOREIGN KEY (id_oferta) REFERENCES oferta(id);


--
-- Name: lista_wsk_adr_id_zapotrzebowanie_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  lista_wsk_adr
    ADD CONSTRAINT lista_wsk_adr_id_zapotrzebowanie_fkey FOREIGN KEY (id_zapotrzebowanie) REFERENCES zapotrzebowanie(id);


--
-- Name: lista_wsk_adr_ogladanie_godzina_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  lista_wsk_adr
    ADD CONSTRAINT lista_wsk_adr_ogladanie_godzina_fkey FOREIGN KEY (ogladanie_godzina) REFERENCES godzina(id);


--
-- Name: lista_wsk_adr_ogladanie_minuta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  lista_wsk_adr
    ADD CONSTRAINT lista_wsk_adr_ogladanie_minuta_fkey FOREIGN KEY (ogladanie_minuta) REFERENCES minuta(id);


--
-- Name: mailing_id_wojewodztwo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: azg
--

ALTER TABLE  mailing
    ADD CONSTRAINT mailing_id_wojewodztwo_fkey FOREIGN KEY (id_wojewodztwo) REFERENCES region_geog(id);


--
-- Name: media_nieruchomosc_id_agent_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  media_nieruchomosc
    ADD CONSTRAINT media_nieruchomosc_id_agent_fkey FOREIGN KEY (id_agent) REFERENCES agent(id);


--
-- Name: media_nieruchomosc_id_media_reklama_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  media_nieruchomosc
    ADD CONSTRAINT media_nieruchomosc_id_media_reklama_fkey FOREIGN KEY (id_media_reklama) REFERENCES media_reklama(id);


--
-- Name: media_nieruchomosc_id_nier_rodzaj_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  media_nieruchomosc
    ADD CONSTRAINT media_nieruchomosc_id_nier_rodzaj_fkey FOREIGN KEY (id_nier_rodzaj) REFERENCES nier_rodzaj(id);


--
-- Name: media_nieruchomosc_id_osoba_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  media_nieruchomosc
    ADD CONSTRAINT media_nieruchomosc_id_osoba_fkey FOREIGN KEY (id_osoba) REFERENCES osoba(id);


--
-- Name: media_nieruchomosc_id_region_geog_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  media_nieruchomosc
    ADD CONSTRAINT media_nieruchomosc_id_region_geog_fkey FOREIGN KEY (id_region_geog) REFERENCES region_geog(id);


--
-- Name: media_nieruchomosc_id_status_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  media_nieruchomosc
    ADD CONSTRAINT media_nieruchomosc_id_status_fkey FOREIGN KEY (id_status) REFERENCES status(id);


--
-- Name: media_nieruchomosc_id_trans_rodzaj_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  media_nieruchomosc
    ADD CONSTRAINT media_nieruchomosc_id_trans_rodzaj_fkey FOREIGN KEY (id_trans_rodzaj) REFERENCES trans_rodzaj(id);


--
-- Name: nieruchomosc_id_agent_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  nieruchomosc
    ADD CONSTRAINT nieruchomosc_id_agent_fkey FOREIGN KEY (id_agent) REFERENCES agent(id);


--
-- Name: nieruchomosc_id_klient_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  nieruchomosc
    ADD CONSTRAINT nieruchomosc_id_klient_fkey FOREIGN KEY (id_klient) REFERENCES klient(id);


--
-- Name: nieruchomosc_id_nier_rodzaj_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  nieruchomosc
    ADD CONSTRAINT nieruchomosc_id_nier_rodzaj_fkey FOREIGN KEY (id_nier_rodzaj) REFERENCES nier_rodzaj(id);


--
-- Name: nieruchomosc_id_region_geog_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  nieruchomosc
    ADD CONSTRAINT nieruchomosc_id_region_geog_fkey FOREIGN KEY (id_region_geog) REFERENCES region_geog(id);


--
-- Name: nieruchomosc_id_rodz_nier_szcz_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  nieruchomosc
    ADD CONSTRAINT nieruchomosc_id_rodz_nier_szcz_fkey FOREIGN KEY (id_rodz_nier_szcz) REFERENCES rodz_nier_szczeg(id);


--
-- Name: oferta_id_nieruchomosc_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  oferta
    ADD CONSTRAINT oferta_id_nieruchomosc_fkey FOREIGN KEY (id_nieruchomosc) REFERENCES nieruchomosc(id);


--
-- Name: oferta_id_priorytet_reklama_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  oferta
    ADD CONSTRAINT oferta_id_priorytet_reklama_fkey FOREIGN KEY (id_priorytet_reklama) REFERENCES priorytet_reklama(id);


--
-- Name: oferta_id_rodz_trans_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  oferta
    ADD CONSTRAINT oferta_id_rodz_trans_fkey FOREIGN KEY (id_rodz_trans) REFERENCES trans_rodzaj(id);


--
-- Name: oferta_id_status_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  oferta
    ADD CONSTRAINT oferta_id_status_fkey FOREIGN KEY (id_status) REFERENCES status(id);


--
-- Name: opis_id_jezyk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  opis
    ADD CONSTRAINT opis_id_jezyk_fkey FOREIGN KEY (id_jezyk) REFERENCES jezyk(id);


--
-- Name: opis_id_oferta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  opis
    ADD CONSTRAINT opis_id_oferta_fkey FOREIGN KEY (id_oferta) REFERENCES oferta(id);


--
-- Name: opis_nieruchomosc_id_agent_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  opis_nieruchomosc
    ADD CONSTRAINT opis_nieruchomosc_id_agent_fkey FOREIGN KEY (id_agent) REFERENCES agent(id);


--
-- Name: opis_nieruchomosc_id_nieruchomosc_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  opis_nieruchomosc
    ADD CONSTRAINT opis_nieruchomosc_id_nieruchomosc_fkey FOREIGN KEY (id_nieruchomosc) REFERENCES nieruchomosc(id);


--
-- Name: opis_posz_zapotrzebowanie_id_agent_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  opis_posz_zapotrzebowanie
    ADD CONSTRAINT opis_posz_zapotrzebowanie_id_agent_fkey FOREIGN KEY (id_agent) REFERENCES agent(id);


--
-- Name: opis_posz_zapotrzebowanie_id_zapotrzebowanie_trans_rodzaj_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  opis_posz_zapotrzebowanie
    ADD CONSTRAINT opis_posz_zapotrzebowanie_id_zapotrzebowanie_trans_rodzaj_fkey FOREIGN KEY (id_zapotrzebowanie_trans_rodzaj) REFERENCES zapotrzebowanie_trans_rodzaj(id);


--
-- Name: opis_wew_zapotrzebowanie_id_agent_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  opis_wew_zapotrzebowanie
    ADD CONSTRAINT opis_wew_zapotrzebowanie_id_agent_fkey FOREIGN KEY (id_agent) REFERENCES agent(id);


--
-- Name: opis_wew_zapotrzebowanie_id_oferta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  opis_wew_zapotrzebowanie
    ADD CONSTRAINT opis_wew_zapotrzebowanie_id_oferta_fkey FOREIGN KEY (id_oferta) REFERENCES oferta(id);


--
-- Name: opis_wew_zapotrzebowanie_id_zapotrzebowanie_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  opis_wew_zapotrzebowanie
    ADD CONSTRAINT opis_wew_zapotrzebowanie_id_zapotrzebowanie_fkey FOREIGN KEY (id_zapotrzebowanie) REFERENCES zapotrzebowanie(id);


--
-- Name: opis_zapotrzebowanie_id_jezyk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  opis_zapotrzebowanie
    ADD CONSTRAINT opis_zapotrzebowanie_id_jezyk_fkey FOREIGN KEY (id_jezyk) REFERENCES jezyk(id);


--
-- Name: opis_zapotrzebowanie_id_zapotrzebowanie_trans_rodzaj_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  opis_zapotrzebowanie
    ADD CONSTRAINT opis_zapotrzebowanie_id_zapotrzebowanie_trans_rodzaj_fkey FOREIGN KEY (id_zapotrzebowanie_trans_rodzaj) REFERENCES zapotrzebowanie_trans_rodzaj(id);


--
-- Name: osoba_adres_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  osoba_adres
    ADD CONSTRAINT osoba_adres_id_fkey FOREIGN KEY (id) REFERENCES osoba(id);


--
-- Name: osoba_adres_id_region_geog_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  osoba_adres
    ADD CONSTRAINT osoba_adres_id_region_geog_fkey FOREIGN KEY (id_region_geog) REFERENCES region_geog(id);


--
-- Name: osoba_dowod_id_osoba_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  osoba_dowod
    ADD CONSTRAINT osoba_dowod_id_osoba_fkey FOREIGN KEY (id_osoba) REFERENCES osoba(id);


--
-- Name: osoba_dowod_id_rodzaj_dowod_tozsamosc_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  osoba_dowod
    ADD CONSTRAINT osoba_dowod_id_rodzaj_dowod_tozsamosc_fkey FOREIGN KEY (id_rodzaj_dowod_tozsamosc) REFERENCES rodzaj_dowod_tozsamosc(id);


--
-- Name: osoba_id_agent_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  osoba
    ADD CONSTRAINT osoba_id_agent_fkey FOREIGN KEY (id_agent) REFERENCES agent(id);


--
-- Name: osoba_id_imie_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  osoba
    ADD CONSTRAINT osoba_id_imie_fkey FOREIGN KEY (id_imie) REFERENCES imie(id);


--
-- Name: osoba_klient_id_klient_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  osoba_klient
    ADD CONSTRAINT osoba_klient_id_klient_fkey FOREIGN KEY (id_klient) REFERENCES klient(id);


--
-- Name: osoba_klient_id_osoba_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  osoba_klient
    ADD CONSTRAINT osoba_klient_id_osoba_fkey FOREIGN KEY (id_osoba) REFERENCES osoba(id);


--
-- Name: osoba_kon_bank_id_bank_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  osoba_kon_bank
    ADD CONSTRAINT osoba_kon_bank_id_bank_fkey FOREIGN KEY (id_bank) REFERENCES bank(id);


--
-- Name: osoba_kon_bank_id_imie_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  osoba_kon_bank
    ADD CONSTRAINT osoba_kon_bank_id_imie_fkey FOREIGN KEY (id_imie) REFERENCES imie(id);


--
-- Name: osoba_lista_wsk_adr_id_lista_wsk_adr_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  osoba_lista_wsk_adr
    ADD CONSTRAINT osoba_lista_wsk_adr_id_lista_wsk_adr_fkey FOREIGN KEY (id_lista_wsk_adr) REFERENCES lista_wsk_adr(id);


--
-- Name: osoba_lista_wsk_adr_id_osoba_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  osoba_lista_wsk_adr
    ADD CONSTRAINT osoba_lista_wsk_adr_id_osoba_fkey FOREIGN KEY (id_osoba) REFERENCES osoba(id);


--
-- Name: osoba_oferta_id_oferta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  osoba_oferta
    ADD CONSTRAINT osoba_oferta_id_oferta_fkey FOREIGN KEY (id_oferta) REFERENCES oferta(id);


--
-- Name: osoba_oferta_id_osoba_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  osoba_oferta
    ADD CONSTRAINT osoba_oferta_id_osoba_fkey FOREIGN KEY (id_osoba) REFERENCES osoba(id);


--
-- Name: osoba_zapotrzebowanie_id_osoba_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  osoba_zapotrzebowanie
    ADD CONSTRAINT osoba_zapotrzebowanie_id_osoba_fkey FOREIGN KEY (id_osoba) REFERENCES osoba(id);


--
-- Name: osoba_zapotrzebowanie_id_zapotrzebowanie_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  osoba_zapotrzebowanie
    ADD CONSTRAINT osoba_zapotrzebowanie_id_zapotrzebowanie_fkey FOREIGN KEY (id_zapotrzebowanie) REFERENCES zapotrzebowanie(id);


--
-- Name: param_nier_strona_id_nier_rodzaj_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  param_nier_strona
    ADD CONSTRAINT param_nier_strona_id_nier_rodzaj_fkey FOREIGN KEY (id_nier_rodzaj) REFERENCES nier_rodzaj(id);


--
-- Name: param_nier_strona_id_parametr_nier_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  param_nier_strona
    ADD CONSTRAINT param_nier_strona_id_parametr_nier_fkey FOREIGN KEY (id_parametr_nier) REFERENCES parametr_nier(id);


--
-- Name: param_nier_strona_id_trans_rodzaj_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  param_nier_strona
    ADD CONSTRAINT param_nier_strona_id_trans_rodzaj_fkey FOREIGN KEY (id_trans_rodzaj) REFERENCES trans_rodzaj(id);


--
-- Name: parametr_nier_id_sekcja_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  parametr_nier
    ADD CONSTRAINT parametr_nier_id_sekcja_fkey FOREIGN KEY (id_sekcja) REFERENCES sekcja(id);


--
-- Name: parametr_nier_id_walidacja_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  parametr_nier
    ADD CONSTRAINT parametr_nier_id_walidacja_fkey FOREIGN KEY (id_walidacja) REFERENCES walidacja(id);


--
-- Name: parametr_pom_id_sekcja_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  parametr_pom
    ADD CONSTRAINT parametr_pom_id_sekcja_fkey FOREIGN KEY (id_sekcja) REFERENCES sekcja(id);


--
-- Name: parametr_pom_id_walidacja_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  parametr_pom
    ADD CONSTRAINT parametr_pom_id_walidacja_fkey FOREIGN KEY (id_walidacja) REFERENCES walidacja(id);


--
-- Name: pomieszczenie_nier_id_nier_rodzaj_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  pomieszczenie_nier
    ADD CONSTRAINT pomieszczenie_nier_id_nier_rodzaj_fkey FOREIGN KEY (id_nier_rodzaj) REFERENCES nier_rodzaj(id);


--
-- Name: pomieszczenie_nier_id_pomieszczenie_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  pomieszczenie_nier
    ADD CONSTRAINT pomieszczenie_nier_id_pomieszczenie_fkey FOREIGN KEY (id_pomieszczenie) REFERENCES pomieszczenie(id);


--
-- Name: pomieszczenie_przyn_nier_id_nieruchomosc_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  pomieszczenie_przyn_nier
    ADD CONSTRAINT pomieszczenie_przyn_nier_id_nieruchomosc_fkey FOREIGN KEY (id_nieruchomosc) REFERENCES nieruchomosc(id);


--
-- Name: pomieszczenie_przyn_nier_id_pomieszczenie_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  pomieszczenie_przyn_nier
    ADD CONSTRAINT pomieszczenie_przyn_nier_id_pomieszczenie_fkey FOREIGN KEY (id_pomieszczenie) REFERENCES pomieszczenie(id);


--
-- Name: portal_wys_id_oferta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  portal_wys
    ADD CONSTRAINT portal_wys_id_oferta_fkey FOREIGN KEY (id_oferta) REFERENCES oferta(id);


--
-- Name: portal_wys_id_portal_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  portal_wys
    ADD CONSTRAINT portal_wys_id_portal_fkey FOREIGN KEY (id_portal) REFERENCES portal(id);


--
-- Name: prowizja_zapotrzebowanie_id_sposob_finansowania_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  prowizja_zapotrzebowanie
    ADD CONSTRAINT prowizja_zapotrzebowanie_id_sposob_finansowania_fkey FOREIGN KEY (id_sposob_finansowania) REFERENCES sposob_finansowania(id);


--
-- Name: prowizja_zapotrzebowanie_id_trans_rodzaj_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  prowizja_zapotrzebowanie
    ADD CONSTRAINT prowizja_zapotrzebowanie_id_trans_rodzaj_fkey FOREIGN KEY (id_trans_rodzaj) REFERENCES trans_rodzaj(id);


--
-- Name: prowizja_zapotrzebowanie_id_zapotrzebowanie_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  prowizja_zapotrzebowanie
    ADD CONSTRAINT prowizja_zapotrzebowanie_id_zapotrzebowanie_fkey FOREIGN KEY (id_zapotrzebowanie) REFERENCES zapotrzebowanie(id);


--
-- Name: region_geog_id_parent_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  region_geog
    ADD CONSTRAINT region_geog_id_parent_fkey FOREIGN KEY (id_parent) REFERENCES region_geog(id);


--
-- Name: reklama_nieruchomosc_m_id_media_nieruchomosc_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  reklama_nieruchomosc_m
    ADD CONSTRAINT reklama_nieruchomosc_m_id_media_nieruchomosc_fkey FOREIGN KEY (id_media_nieruchomosc) REFERENCES media_nieruchomosc(id);


--
-- Name: reklama_nieruchomosc_m_id_media_reklama_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  reklama_nieruchomosc_m
    ADD CONSTRAINT reklama_nieruchomosc_m_id_media_reklama_fkey FOREIGN KEY (id_media_reklama) REFERENCES media_reklama(id);


--
-- Name: rekord_nieakt_lista_wsk_adr_id_agent_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  rekord_nieakt_lista_wsk_adr
    ADD CONSTRAINT rekord_nieakt_lista_wsk_adr_id_agent_fkey FOREIGN KEY (id_agent) REFERENCES agent(id);


--
-- Name: rekord_nieakt_lista_wsk_adr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  rekord_nieakt_lista_wsk_adr
    ADD CONSTRAINT rekord_nieakt_lista_wsk_adr_id_fkey FOREIGN KEY (id) REFERENCES lista_wsk_adr(id);


--
-- Name: rodz_nier_szczeg_id_nier_rodzaj_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  rodz_nier_szczeg
    ADD CONSTRAINT rodz_nier_szczeg_id_nier_rodzaj_fkey FOREIGN KEY (id_nier_rodzaj) REFERENCES nier_rodzaj(id);


--
-- Name: rozmowa_przychodzaca_id_agent_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  rozmowa_przychodzaca
    ADD CONSTRAINT rozmowa_przychodzaca_id_agent_fkey FOREIGN KEY (id_agent) REFERENCES agent(id);


--
-- Name: rozmowa_przychodzaca_id_status_dzwonienie_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  rozmowa_przychodzaca
    ADD CONSTRAINT rozmowa_przychodzaca_id_status_dzwonienie_fkey FOREIGN KEY (id_status_dzwonienie) REFERENCES status_dzwonienie(id);


--
-- Name: spotkanie_id_agent_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  spotkanie
    ADD CONSTRAINT spotkanie_id_agent_fkey FOREIGN KEY (id_agent) REFERENCES agent(id);


--
-- Name: spotkanie_id_klient_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  spotkanie
    ADD CONSTRAINT spotkanie_id_klient_fkey FOREIGN KEY (id_klient) REFERENCES klient(id);


--
-- Name: spotkanie_id_oferta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  spotkanie
    ADD CONSTRAINT spotkanie_id_oferta_fkey FOREIGN KEY (id_oferta) REFERENCES oferta(id);


--
-- Name: spotkanie_id_umowienie_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  spotkanie
    ADD CONSTRAINT spotkanie_id_umowienie_fkey FOREIGN KEY (id_umowienie) REFERENCES umowienie(id);


--
-- Name: spotkanie_id_zapotrzebowanie_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  spotkanie
    ADD CONSTRAINT spotkanie_id_zapotrzebowanie_fkey FOREIGN KEY (id_zapotrzebowanie) REFERENCES zapotrzebowanie(id);


--
-- Name: spotkanie_os_id_osoba_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  spotkanie_os
    ADD CONSTRAINT spotkanie_os_id_osoba_fkey FOREIGN KEY (id_osoba) REFERENCES osoba(id);


--
-- Name: spotkanie_os_id_spotkanie_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  spotkanie_os
    ADD CONSTRAINT spotkanie_os_id_spotkanie_fkey FOREIGN KEY (id_spotkanie) REFERENCES spotkanie(id);


--
-- Name: spotkanie_spotkanie_godzina_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  spotkanie
    ADD CONSTRAINT spotkanie_spotkanie_godzina_fkey FOREIGN KEY (spotkanie_godzina) REFERENCES godzina(id);


--
-- Name: spotkanie_spotkanie_minuta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  spotkanie
    ADD CONSTRAINT spotkanie_spotkanie_minuta_fkey FOREIGN KEY (spotkanie_minuta) REFERENCES minuta(id);


--
-- Name: subskrypcja_id_jezyk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  subskrypcja
    ADD CONSTRAINT subskrypcja_id_jezyk_fkey FOREIGN KEY (id_jezyk) REFERENCES jezyk(id);


--
-- Name: subskrypcja_id_nier_rodzaj_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  subskrypcja
    ADD CONSTRAINT subskrypcja_id_nier_rodzaj_fkey FOREIGN KEY (id_nier_rodzaj) REFERENCES nier_rodzaj(id);


--
-- Name: subskrypcja_id_trans_rodzaj_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  subskrypcja
    ADD CONSTRAINT subskrypcja_id_trans_rodzaj_fkey FOREIGN KEY (id_trans_rodzaj) REFERENCES trans_rodzaj(id);


--
-- Name: telefon_id_osoba_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  telefon
    ADD CONSTRAINT telefon_id_osoba_fkey FOREIGN KEY (id_osoba) REFERENCES osoba(id);


--
-- Name: telefon_media_nieruchomosc_id_media_nieruchomosc_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  telefon_media_nieruchomosc
    ADD CONSTRAINT telefon_media_nieruchomosc_id_media_nieruchomosc_fkey FOREIGN KEY (id_media_nieruchomosc) REFERENCES media_nieruchomosc(id);


--
-- Name: telefon_niechciany_id_lista_niechcianych_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  telefon_niechciany
    ADD CONSTRAINT telefon_niechciany_id_lista_niechcianych_fkey FOREIGN KEY (id_lista_niechcianych) REFERENCES lista_niechcianych(id);


--
-- Name: telefon_os_bank_id_osoba_kon_bank_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  telefon_os_bank
    ADD CONSTRAINT telefon_os_bank_id_osoba_kon_bank_fkey FOREIGN KEY (id_osoba_kon_bank) REFERENCES osoba_kon_bank(id);


--
-- Name: tlumaczenie_id_jezyk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  tlumaczenie
    ADD CONSTRAINT tlumaczenie_id_jezyk_fkey FOREIGN KEY (id_jezyk) REFERENCES jezyk(id);


--
-- Name: tlumaczenie_nazwa_lang_tag_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  tlumaczenie
    ADD CONSTRAINT tlumaczenie_nazwa_lang_tag_fkey FOREIGN KEY (nazwa_lang_tag) REFERENCES lang_tag(nazwa);


--
-- Name: transakcja_id_lista_wsk_adr_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  transakcja
    ADD CONSTRAINT transakcja_id_lista_wsk_adr_fkey FOREIGN KEY (id_lista_wsk_adr) REFERENCES lista_wsk_adr(id);


--
-- Name: transakcja_id_nabywca_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  transakcja
    ADD CONSTRAINT transakcja_id_nabywca_fkey FOREIGN KEY (id_nabywca) REFERENCES klient(id);


--
-- Name: transakcja_id_nieruchomosc_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  transakcja
    ADD CONSTRAINT transakcja_id_nieruchomosc_fkey FOREIGN KEY (id_nieruchomosc) REFERENCES nieruchomosc(id);


--
-- Name: transakcja_id_oferta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  transakcja
    ADD CONSTRAINT transakcja_id_oferta_fkey FOREIGN KEY (id_oferta) REFERENCES oferta(id);


--
-- Name: transakcja_id_wlasciciel_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  transakcja
    ADD CONSTRAINT transakcja_id_wlasciciel_fkey FOREIGN KEY (id_wlasciciel) REFERENCES klient(id);


--
-- Name: transakcja_nier_id_nier_rodzaj_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  transakcja_nier
    ADD CONSTRAINT transakcja_nier_id_nier_rodzaj_fkey FOREIGN KEY (id_nier_rodzaj) REFERENCES nier_rodzaj(id);


--
-- Name: transakcja_nier_id_trans_rodzaj_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  transakcja_nier
    ADD CONSTRAINT transakcja_nier_id_trans_rodzaj_fkey FOREIGN KEY (id_trans_rodzaj) REFERENCES trans_rodzaj(id);


--
-- Name: ustalenia_id_agent_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  ustalenia
    ADD CONSTRAINT ustalenia_id_agent_fkey FOREIGN KEY (id_agent) REFERENCES agent(id);


--
-- Name: ustalenia_id_klient_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  ustalenia
    ADD CONSTRAINT ustalenia_id_klient_fkey FOREIGN KEY (id_klient) REFERENCES klient(id);


--
-- Name: wlasciciel_id_nieruchomosc_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  wlasciciel
    ADD CONSTRAINT wlasciciel_id_nieruchomosc_fkey FOREIGN KEY (id_nieruchomosc) REFERENCES nieruchomosc(id);


--
-- Name: wlasciciel_id_osoba_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  wlasciciel
    ADD CONSTRAINT wlasciciel_id_osoba_fkey FOREIGN KEY (id_osoba) REFERENCES osoba(id);


--
-- Name: wypos_nier_strona_id_nier_rodzaj_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  wypos_nier_strona
    ADD CONSTRAINT wypos_nier_strona_id_nier_rodzaj_fkey FOREIGN KEY (id_nier_rodzaj) REFERENCES nier_rodzaj(id);


--
-- Name: wypos_nier_strona_id_trans_rodzaj_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  wypos_nier_strona
    ADD CONSTRAINT wypos_nier_strona_id_trans_rodzaj_fkey FOREIGN KEY (id_trans_rodzaj) REFERENCES trans_rodzaj(id);


--
-- Name: wypos_nier_strona_id_wyposazenie_nier_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  wypos_nier_strona
    ADD CONSTRAINT wypos_nier_strona_id_wyposazenie_nier_fkey FOREIGN KEY (id_wyposazenie_nier) REFERENCES wyposazenie_nier(id);


--
-- Name: wyposazenie_nier_id_parent_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  wyposazenie_nier
    ADD CONSTRAINT wyposazenie_nier_id_parent_fkey FOREIGN KEY (id_parent) REFERENCES wyposazenie_nier(id);


--
-- Name: wyposazenie_nier_id_sekcja_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  wyposazenie_nier
    ADD CONSTRAINT wyposazenie_nier_id_sekcja_fkey FOREIGN KEY (id_sekcja) REFERENCES sekcja(id);


--
-- Name: wyposazenie_pom_id_parent_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  wyposazenie_pom
    ADD CONSTRAINT wyposazenie_pom_id_parent_fkey FOREIGN KEY (id_parent) REFERENCES wyposazenie_pom(id);


--
-- Name: wyposazenie_pom_id_sekcja_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  wyposazenie_pom
    ADD CONSTRAINT wyposazenie_pom_id_sekcja_fkey FOREIGN KEY (id_sekcja) REFERENCES sekcja(id);


--
-- Name: wysylka_ofert_zapotrzebowanie_id_oferta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  wysylka_ofert_zapotrzebowanie
    ADD CONSTRAINT wysylka_ofert_zapotrzebowanie_id_oferta_fkey FOREIGN KEY (id_oferta) REFERENCES oferta(id);


--
-- Name: wysylka_ofert_zapotrzebowanie_id_zapotrzebowanie_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  wysylka_ofert_zapotrzebowanie
    ADD CONSTRAINT wysylka_ofert_zapotrzebowanie_id_zapotrzebowanie_fkey FOREIGN KEY (id_zapotrzebowanie) REFERENCES zapotrzebowanie(id);


--
-- Name: zamiana_id_oferta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  zamiana
    ADD CONSTRAINT zamiana_id_oferta_fkey FOREIGN KEY (id_oferta) REFERENCES oferta(id);


--
-- Name: zamiana_id_zapotrzebowanie_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  zamiana
    ADD CONSTRAINT zamiana_id_zapotrzebowanie_fkey FOREIGN KEY (id_zapotrzebowanie) REFERENCES zapotrzebowanie(id);


--
-- Name: zap_lokaliz_nier_id_region_geog_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  zap_lokaliz_nier
    ADD CONSTRAINT zap_lokaliz_nier_id_region_geog_fkey FOREIGN KEY (id_region_geog) REFERENCES region_geog(id);


--
-- Name: zap_lokaliz_nier_id_zapotrzebowanie_trans_rodzaj_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  zap_lokaliz_nier
    ADD CONSTRAINT zap_lokaliz_nier_id_zapotrzebowanie_trans_rodzaj_fkey FOREIGN KEY (id_zapotrzebowanie_trans_rodzaj) REFERENCES zapotrzebowanie_trans_rodzaj(id);


--
-- Name: zap_szcz_nier_id_rodz_nier_szcz_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  zap_szcz_nier
    ADD CONSTRAINT zap_szcz_nier_id_rodz_nier_szcz_fkey FOREIGN KEY (id_rodz_nier_szcz) REFERENCES rodz_nier_szczeg(id);


--
-- Name: zap_szcz_nier_id_zapotrzebowanie_trans_rodzaj_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  zap_szcz_nier
    ADD CONSTRAINT zap_szcz_nier_id_zapotrzebowanie_trans_rodzaj_fkey FOREIGN KEY (id_zapotrzebowanie_trans_rodzaj) REFERENCES zapotrzebowanie_trans_rodzaj(id);


--
-- Name: zapotrzebowanie_id_agent_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  zapotrzebowanie
    ADD CONSTRAINT zapotrzebowanie_id_agent_fkey FOREIGN KEY (id_agent) REFERENCES agent(id);


--
-- Name: zapotrzebowanie_id_klient_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  zapotrzebowanie
    ADD CONSTRAINT zapotrzebowanie_id_klient_fkey FOREIGN KEY (id_klient) REFERENCES klient(id);


--
-- Name: zapotrzebowanie_nier_rodzaj_id_nier_rodzaj_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  zapotrzebowanie_nier_rodzaj
    ADD CONSTRAINT zapotrzebowanie_nier_rodzaj_id_nier_rodzaj_fkey FOREIGN KEY (id_nier_rodzaj) REFERENCES nier_rodzaj(id);


--
-- Name: zapotrzebowanie_nier_rodzaj_id_zapotrzebowanie_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  zapotrzebowanie_nier_rodzaj
    ADD CONSTRAINT zapotrzebowanie_nier_rodzaj_id_zapotrzebowanie_fkey FOREIGN KEY (id_zapotrzebowanie) REFERENCES zapotrzebowanie(id);


--
-- Name: zapotrzebowanie_trans_rodzaj_id_status_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  zapotrzebowanie_trans_rodzaj
    ADD CONSTRAINT zapotrzebowanie_trans_rodzaj_id_status_fkey FOREIGN KEY (id_status) REFERENCES status(id);


--
-- Name: zapotrzebowanie_trans_rodzaj_id_trans_rodzaj_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  zapotrzebowanie_trans_rodzaj
    ADD CONSTRAINT zapotrzebowanie_trans_rodzaj_id_trans_rodzaj_fkey FOREIGN KEY (id_trans_rodzaj) REFERENCES trans_rodzaj(id);


--
-- Name: zapotrzebowanie_trans_rodzaj_id_zapotrzebowanie_nier_rodza_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  zapotrzebowanie_trans_rodzaj
    ADD CONSTRAINT zapotrzebowanie_trans_rodzaj_id_zapotrzebowanie_nier_rodza_fkey FOREIGN KEY (id_zapotrzebowanie_nier_rodzaj) REFERENCES zapotrzebowanie_nier_rodzaj(id);


--
-- Name: zdjecie_id_nieruchomosc_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  zdjecie
    ADD CONSTRAINT zdjecie_id_nieruchomosc_fkey FOREIGN KEY (id_nieruchomosc) REFERENCES nieruchomosc(id);


--
-- Name: zmiana_status_id_agent_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  zmiana_status
    ADD CONSTRAINT zmiana_status_id_agent_fkey FOREIGN KEY (id_agent) REFERENCES agent(id);


--
-- Name: zmiana_status_id_oferta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  zmiana_status
    ADD CONSTRAINT zmiana_status_id_oferta_fkey FOREIGN KEY (id_oferta) REFERENCES oferta(id);


--
-- Name: zmiana_status_id_status_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE  zmiana_status
    ADD CONSTRAINT zmiana_status_id_status_fkey FOREIGN KEY (id_status) REFERENCES status(id);