<HTML>
<HEAD>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <script language="javascript" src="js/script.js"></script>
<link href="azg.css" rel="stylesheet" type="text/css">
</head>
<body>
<?php
    // œ - ¶ ¹ - ±  Ÿ - ¼  - ¬ Œ - ¦
    include_once ('ui/kontrolki_html.php'); 
    include_once ('ui/utilsui.php'); 
    include_once ('bll/tags.php'); 
    include_once ('bll/jezykibll.php');
    include_once ('bll/cache.php');
    include_once ('dal/dal.php');
    require('naglowek.php');
    require('conf.php');


    echo '<table '.$atr_tab_srodek.'>'.UtilsUI::DodajTrListwaGlowna($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$o_firmie));
    echo '<tr><td><table align="center" cellpading="1" cellspacing="1" width="98%" style="border: 1px solid black; background-color: #d5deec;"><tr><td></td></tr><tr><td><table>';
    
    echo '<tr><td width="60%">';
    /*.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$firma_azg_posredniczaca).'.<br />
    '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$dzieki_doswiadczeniu_i_wszechstronnej).'<br />
    '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$decydujac_sie_na_skorzystanie).'
    :
    <ul type="1">
    <li>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$czlonek_opolskiego_stowarzyszenia).';
    <li>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$czlonek_polskiej_federacji).';
    <li>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$czlonek_zalozyciel_powszechnego).'.
    </ul>
    <b>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zapraszamy_do_wspolpracy).'.</b>
    <br /><br />
    '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podstawowymi_obszarami_dzialalnosci).':<br /><br />
    1. '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$obsluga_prawno_finansowa).';<br />
    2. '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$sprzedaz_nieruchomosci_w_systemie_kredytowym).';<br />
    3. '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$inwestycje_na_wlasny_rachunek).';<br />
    4. '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$doradztwo).'; <br />
    5. '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$posrednictwo_w_transakcjach_kupna_sprzedazy).'; <br />

    <br />
    <b> '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$atuty_firmy).' '.$AZG.':</b><br /><br />
    I. '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$kompleksowosc_uslug).':<br />
        1. '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$umozliwienie_klientowi_wyboru_interesujacego).';<br />
        2. '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$pelna_dyspozycyjnosc_pracownikow).';<br />
        3. '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$doradztwo_prawne_i_finansowe).'; <br />
        4. '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$pomoc_w_zalatwieniu_wszelkich).'.<br /><br />
    II. '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$bogata_oferta_azg).'. <br />
    III. '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$profesjonalizm_wysoka_kultura).'.<br />
    III. '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$reklama_i_promocja_firma).'.<br />
    IV. '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$logo_firmy_firma).'.<br />
    V. '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$innowacyjnosc_i_otwartosc).'.<br /><br />

    '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nasza_przyszlosc_to_nowoczesna).'. <br /><br />

    '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podstawa_prawna_wykonywania_dzialalnosci).':<br /><br />
    <center><b>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$art).'. 180</b></center>

    1. '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$posrednictwo_w_obrocie_nieruchomosciami_polega).':<br /><br />
    1) '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nabycia_lub_zbycia_praw).',<br />
    2) '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nabycia_lub_zbycia_wlasnosciowego).',<br />
    3) '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$najmu_lub_dzierzawy_nieruchomosci).',<br />
    4) '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$innych_niz_okreslone_w_pkt).'.<br /><br />
    1.a. '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$posrednik_w_obrocie_nieruchomosciami_moze).'.<br />
    2. '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$posrednik_wykonuje_czynnosci_o_ktorych).'.<br />
    3. '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zakres_czynnosci_posrednictwa_w_obrocie).'.<br />
    3a. '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$umowa_posrednictwa_moze_byc_zawarta).'.<br />
    4. '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$przez_umowe_posrednictwa_posrednik).'.<br />
    5. '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$sposob_ustalenia_lub_wysokosc).'.<br />
    6. '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$czynnosci_posrednictwa_w_obrocie).'.<br />
    7. '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$posrednik_w_obrocie_nieruchomosciami_wykonuje).':<br /><br />
    1) '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$prowadzac_jako_przedsiebiorca_dzialalnosc).'<br />
    2) '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$w_ramach_stosunku_pracy).'.<br /><br />
    8. '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$posrednik_w_obrocie_nieruchomosciami_nie_moze).'.<br />

    <br />
    </td><td>';*/
    if (is_file('generator/o_firmie.php'))
    {
        require('generator/o_firmie.php');
    }
    echo '</td><td></td></tr>';
    
    echo '</table></td></tr></table></td></tr></table>';
    
    require('stopka.php');    
?>
</body>
</html>
