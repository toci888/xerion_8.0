<HTML>
<HEAD>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <script language="javascript" src="../../js/script.js"></script>
<link href="../../css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<?php
    // ¶ ±
    session_start();
    include_once ('../../dal/queriesDAL.php');
    include_once ('../../ui/kontrolki_html.php');
    include_once ('../../ui/utilsui.php'); 
    include_once ('../../bll/parametrynierbll.php');
    include_once ('../../bll/tags.php'); 
    include_once ('../../bll/agentbll.php');
    include_once ('../../bll/jezykibll.php');
    include_once ('../../bll/cache.php');
    require('../../naglowek.php');
    require('../../conf.php');
    
    if (!isset($_SESSION[$zalogowany]))
    {
        echo 'Nie jesteÅ› zalogowany.';
    }
    else
    {
        $tlumaczenia = cachejezyki::Czytaj();
        
        if (isset($_GET[MediaDAL::$id_media_nieruchomosc]))
        {
            $id_media = $_GET[MediaDAL::$id_media_nieruchomosc];
            $oferuje_poszukuje = $_GET['oferuje_poszukuje'];
        }
        if (isset($_POST[MediaDAL::$id_media_nieruchomosc]))
        {
            $id_media = $_POST[MediaDAL::$id_media_nieruchomosc];
            $oferuje_poszukuje = $_POST['oferuje_poszukuje'];
        }
        
        if ($oferuje_poszukuje == tags::$poszukuje)
        {
            $tabParametr[NieruchomoscDAL::$oferent] = 'false';
            //kojarzymy dla mediow, gdzie osoba szuka chatki, pokazac oferty
            $dal = new MediaDAL();
            $wynik = $dal->KojarzenieMediaOferta(array(MediaDAL::$id_media_nieruchomosc => $id_media), $ilosc_wierszy);
            
            UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$oferty)); 
            
            if ($ilosc_wierszy > 0)
            {
                $links = new Links();
                $links->nag = tags::$pokaz;
                $links->text = tags::$pokaz;
                $links->url = $strona_www;
                $links->vars = array(tags::$oferta, NieruchomoscDAL::$id_trans_rodzaj, NieruchomoscDAL::$id_nier_rodzaj);
                $links->varvalues = array(NieruchomoscDAL::$id_oferta, NieruchomoscDAL::$id_rodz_trans, NieruchomoscDAL::$id_nier_rodzaj);
                $link[0] = $links;
                echo '<form action="../edycja_oferta_szcz.php" method= "POST" target="_blank">';
                //NieruchomoscDAL::$imie, NieruchomoscDAL::$nazwisko, 
                //tags::$imie, tags::$nazwisko, 
                UtilsUI::$rekordy = $ilosc_wierszy;
                UtilsUI::WyswietlTab1Poz($wynik, 
                array(NieruchomoscDAL::$id_oferta, NieruchomoscDAL::$id_klient, NieruchomoscDAL::$miejscowosc, NieruchomoscDAL::$cena, NieruchomoscDAL::$transakcja_rodzaj, 
                NieruchomoscDAL::$nieruchomosc_rodzaj), array(tags::$nr_oferty ,tags::$nr_klienta ,tags::$miejscowosc, tags::$cena, tags::$rodzaj_transakcja, tags::$rodzaj_nieruchomosci), 
                NieruchomoscDAL::$id_oferta, 'oferta_id', array(Akcja::$edycja => 1, Akcja::$kasowanie => 1), null, null, null, $link);
                echo '</form>';
            }
            else
            {
                UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nie_znaleziono_elementow));
            }
        }
        else
        {
            $tabParametr[NieruchomoscDAL::$oferent] = 'true';
            //kojarzymy dla mediow, gdzie osoba ma chatke, pokazac zapotrzebowania
            $dal = new MediaDAL();
            $wynik = $dal->KojarzenieMediaZapotrzebowanie(array(MediaDAL::$id_media_nieruchomosc => $id_media), $ilosc_wierszy);
            
            UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zapotrzebowania));
            
            if ($ilosc_wierszy > 0)
            {
                $popupObj = new PopUpWysw();
                $popupObj->nag = array(tags::$pokaz, tags::$pokaz_skojarzenia, tags::$oferty_ogladniete);
                $popupObj->przyc_nazwa = array(tags::$pokaz, tags::$pokaz_skojarzenia, tags::$oferty_ogladniete);
                $popupObj->url = array('info_klient_zlecenie.php?'.NieruchomoscDAL::$id_zapotrzebowanie, 
                'skoj_of_standard.php?'.NieruchomoscDAL::$id_zapotrzebowanie, 
                'lista_wskazan_adresowych_z.php?'.NieruchomoscDAL::$id_zapotrzebowanie); //podac tu id trans id nier ??
                $popupObj->szerokosc = array(1000, 1000, 1000);
                $popupObj->dlugosc = array(750, 750, 700);
                $popupObj->dod_index = array(array(NieruchomoscDAL::$id_klient => NieruchomoscDAL::$id_klient, NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj => NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj), 
                array(NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj => NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj), 
                array());
                
                //echo '<form action="../edycja_zapotrzebowania.php" method= "POST" target="_blank">';
                echo '<form action="../dodanie_trans_zap.php" method= "POST" target="_blank">';
                UtilsUI::$rekordy = $ilosc_wierszy;
                UtilsUI::WyswietlTab1Poz($wynik, 
                array(NieruchomoscDAL::$id_zapotrzebowanie, NieruchomoscDAL::$id_klient, NieruchomoscDAL::$imie, NieruchomoscDAL::$nazwisko, NieruchomoscDAL::$pesel), 
                array(tags::$nr_zapotrzebowania, tags::$nr_klienta, tags::$imie, tags::$nazwisko, tags::$pesel), 
                NieruchomoscDAL::$id_zapotrzebowanie, 
                'zapotrzebowanie_id',
                array(Akcja::$edycja => 1), null, null, $popupObj, null, null, array(NieruchomoscDAL::$id_klient => NieruchomoscDAL::$id_klient));
                echo '</form>';
            }
            else
            {
                UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nie_znaleziono_elementow));
            }
        }
        $tabParametr[MediaDAL::$id_media_nieruchomosc] = $id_media;
        $wynik = $dal->KojarzenieMedia($tabParametr, $ilosc_wierszy);
        
        echo '<hr />';
        UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$skojarzone_z_mediow));
        
        if ($ilosc_wierszy > 0)
        {
            UtilsUI::$rekordy = $ilosc_wierszy;
            echo '<form action="../edycja_media_nier.php" method="POST" target="_blank">';
            UtilsUI::WyswietlTab1Poz($wynik, array(MediaDAL::$id_media_nieruchomosc, NieruchomoscDAL::$nieruchomosc_rodzaj, NieruchomoscDAL::$transakcja_rodzaj, NieruchomoscDAL::$region, NieruchomoscDAL::$status, 
            NieruchomoscDAL::$data, MediaDAL::$przypomnienie, NieruchomoscDAL::$agent, MediaDAL::$telefon), 
            array(tags::$id, tags::$rodzaj_nieruchomosci, tags::$rodzaj_transakcja, tags::$miejscowosc, tags::$status, tags::$data, tags::$data_przypomnienia, tags::$agent, tags::$telefon), 
            MediaDAL::$id_media_nieruchomosc, 'media_nieruchomosc_id', array(Akcja::$edycja => 1));
            echo '</form>';
        }
        else
        {
            UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nie_znaleziono_elementow));
        }
        
        echo '<hr />';
        KontrolkiHtml::DodajSubmit('ok', 'id_ok', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zakoncz), 'onclick="window.close();"');
    }
    require('../../stopka.php');

?>
</body>
</html>
