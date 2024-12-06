<?php 
        include_once ('bll/cache.php');
        include_once ('bll/tags.php');
        require('conf.php');
        $tlumaczenia = cachejezyki::Czytaj(); 
        echo ''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], '|_firma_azg_posredniczaca_nasze_sukcesy___|').'.<br>
    '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], '|_dzieki_doswiadczeniu_i_wszechstronnej___|').'<br>
    '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], '|_decydujac_sie_na_skorzystanie___|').'
    :
    <ul type="1"><li>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], '|_czlonek_opolskiego_stowarzyszenia___|').';
    </li><li>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], '|_czlonek_polskiej_federacji___|').';
    </li><li>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], '|_czlonek_zalozyciel_powszechnego___|').'.</li></ul>
    <b>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], '|_zapraszamy_do_wspolpracy___|').'.</b>
    <br><br>
    '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], '|_podstawowymi_obszarami_dzialalnosci___|').':<br><br>
    1. '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], '|_obsluga_prawno_finansowa|').';<br>
    2. '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], '|_sprzedaz_nieruchomosci_w_systemie_kredytowym|').';<br>
    3. '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], '|_inwestycje_na_wlasny_rachunek|').';<br>
    4. '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], '|_doradztwo|').'; <br>
    5. '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], '|_posrednictwo_w_transakcjach_kupna_sprzedazy___|').'; <br>

    <br>
    <b> '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], '|_atuty_firmy|').' A.Z.GWARANCJA:</b><br><br>
    I. '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], '|_kompleksowosc_uslug___|').':<br>
        1. '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], '|_umozliwienie_klientowi_wyboru_interesujacego___|').';<br>
        2. '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], '|_pelna_dyspozycyjnosc_pracownikow___|').';<br>
        3. '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], '|_doradztwo_prawne_i_finansowe___|').'; <br>
        4. '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], '|_pomoc_w_zalatwieniu_wszelkich___|').'.<br><br>
    II. '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], '|_bogata_oferta_azg___|').'. <br>
    III. '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], '|_profesjonalizm_wysoka_kultura___|').'.<br>
    III. '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], '|_reklama_i_promocja_firma___|').'.<br>
    IV. '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], '|_logo_firmy_firma___|').'.<br>
    V. '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], '|_innowacyjnosc_i_otwartosc___|').'.<br><br>

    '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], '|_nasza_przyszlosc_to_nowoczesna___|').'. <br><br>

    '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], '|_podstawa_prawna_wykonywania_dzialalnosci___|').':<br><br>
    <center><b>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], '|_art|').'. 180</b></center>

    1. '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], '|_posrednictwo_w_obrocie_nieruchomosciami_polega___|').':<br><br>
    1) '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], '|_nabycia_lub_zbycia_praw___|').',<br>
    2) '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], '|_nabycia_lub_zbycia_wlasnosciowego___|').',<br>
    3) '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], '|_najmu_lub_dzierzawy_nieruchomosci___|').',<br>
    4) '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], '|_innych_niz_okreslone_w_pkt___|').'.<br><br>
    1.a. '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], '|_posrednik_w_obrocie_nieruchomosciami_moze___|').'.<br>
    2. '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], '|_posrednik_wykonuje_czynnosci_o_ktorych___|').'.<br>
    3. '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], '|_zakres_czynnosci_posrednictwa_w_obrocie___|').'.<br>
    3a. '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], '|_umowa_posrednictwa_moze_byc_zawarta___|').'.<br>
    4. '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], '|_przez_umowe_posrednictwa_posrednik___|').'.<br>
    5. '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], '|_sposob_ustalenia_lub_wysokosc___|').'.<br>
    6. '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], '|_czynnosci_posrednictwa_w_obrocie___|').'.<br>
    7. '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], '|_posrednik_w_obrocie_nieruchomosciami_wykonuje___|').':<br><br>
    1) '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], '|_prowadzac_jako_przedsiebiorca_dzialalnosc___|').'<br>
    2) '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], '|_w_ramach_stosunku_pracy___|').'.<br><br>
    8. '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], '|_posrednik_w_obrocie_nieruchomosciami_nie_moze___|').'.<br>'; ?>