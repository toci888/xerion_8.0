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
        ///pokazanie zapotrzebowan skojarzonych dla ofert
        if (isset($_POST['zatw_poziomy']))
        {
            $tabParametr[NieruchomoscDAL::$zainteresowany] = $_POST['nowe_stare'];
            $tabParametr[NieruchomoscDAL::$poziom_parametry] = $_POST['poziom_par'];
            $tabParametr[NieruchomoscDAL::$poziom_wyposazenia] = $_POST['poziom_wyp'];
        }
        
        $oferta_id = null;
        
        if (isset($_GET[NieruchomoscDAL::$id_oferta]))
        {
            $oferta_id = $_GET[NieruchomoscDAL::$id_oferta];
        }
        if (isset($_POST[NieruchomoscDAL::$id_oferta]))
        {
            $oferta_id = $_POST[NieruchomoscDAL::$id_oferta];
        }
         
        if ($oferta_id != null)
        {
            UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$numer_oferty).' : '.$oferta_id);
            
            $zain_zazn = null;
            $par_zazn = null;
            $wyp_zazn = null;
            
            if (isset($_POST['nowe_stare']))
            {
                $zain_zazn = $_POST['nowe_stare'];
            }           
            if (isset($_POST['poziom_par']))
            {
                $par_zazn = $_POST['poziom_par'];
            }
            if (isset($_POST['poziom_wyp']))
            {
                $wyp_zazn = $_POST['poziom_wyp'];
            }
            
            $dal = new NieruchomoscDAL();
            
            echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'">';
            KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_oferta, NieruchomoscDAL::$id_oferta, $oferta_id);
            echo '<table><tr>';
            KontrolkiHtml::DodajRadio('nowe_stare', array('zain_id', 'niezain_id'), 
            array(tags::$zainteresowany, tags::$niezainteresowany), array('true', 'false'), '', false, $zain_zazn, '<td>', '</td>');
            echo '</tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$poziom_kojarzenia_parametrow).' :</td>';
            
            KontrolkiHtml::DodajRadio('poziom_par', array('par0_id', 'par1_id', 'par2_id', 'par3_id', 'par4_id'), 
            array(tags::$brak, ' 1', ' 2', ' 3', ' 4'), array(0, 1, 2, 3, 4), '', false, $par_zazn, '<td>', '</td>');
            
            echo '</tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$poziom_kojarzenia_wyposazen).' :</td>';
            KontrolkiHtml::DodajRadio('poziom_wyp', array('wyp0_id', 'wyp1_id', 'wyp2_id', 'wyp3_id', 'wyp4_id'), 
            array(tags::$brak, ' 1', ' 2', ' 3', ' 4'), array(0, 1, 2, 3, 4), '', false, $wyp_zazn, '<td>', '</td>');
            
            echo '<td>';
            KontrolkiHtml::DodajSubmit('zatw_poziomy', 'id_zatw_poziomy', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zatwierdz), '');
            echo '</td></tr></table></form>';
            
            if ($par_zazn > 0)
            {
                $params = $dal->PokazWybraneParamOferta(array(NieruchomoscDAL::$id_oferta => $oferta_id, WyposazenieZapDAL::$poziom_parametry => $par_zazn), $ilosc_wierszy);
                echo '<table><tr>';
                foreach ($params as $param)
                {
                    echo '<td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], $param[NieruchomoscDAL::$nazwa]).', </td>';
                }
                echo '</tr></table>';
                //var_dump($params);
            }
            
            echo '<hr />';
            
            $popupObj = new PopUpWysw();
            ///na razie nie uzywane
            /*$popupObj->nag = array(tags::$lista_wskazan);
            $popupObj->przyc_nazwa = array(tags::$lista_wskazan);
            $popupObj->url = array('dodaj_of_lista_wsk.php?'.NieruchomoscDAL::$id_oferta.'='.$_SESSION[NieruchomoscDAL::$id_oferta].'&'.NieruchomoscDAL::$id_zapotrzebowanie);
            $popupObj->szerokosc = array(1000);
            $popupObj->dlugosc = array(750);*/
            
            $popupObj->nag = array(tags::$pokaz, tags::$skojarz);
            $popupObj->przyc_nazwa = array(tags::$pokaz, tags::$skojarz);
            $popupObj->url = array('info_klient_zlecenie.php?'.NieruchomoscDAL::$id_oferta.'='.$oferta_id.'&'.NieruchomoscDAL::$id_zapotrzebowanie, 
            'skojarz_of_zap.php?'.NieruchomoscDAL::$id_oferta.'='.$oferta_id.'&'.NieruchomoscDAL::$id_zapotrzebowanie);
            $popupObj->szerokosc = array(1000, 1000);
            $popupObj->dlugosc = array(750, 750);
            $popupObj->dod_index = array(array(NieruchomoscDAL::$id_klient => NieruchomoscDAL::$id_klient, NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj => NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj), 
            array());
            
            $tabParametr[NieruchomoscDAL::$id_oferta] = $oferta_id;
            $wynik = $dal->KojarzenieBazoweDlaOferty($tabParametr, $ilosc_wierszy);
            UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zapotrzebowania_skojarzone_dla_oferty).' '.$oferta_id);
            
            if ($ilosc_wierszy > 0)
            {
                UtilsUI::$rekordy = $ilosc_wierszy;
                //echo '<form action="../edycja_zapotrzebowania.php" method= "POST" target="_blank">';
                echo '<form action="../dodanie_trans_zap.php" method= "POST" target="_blank">';
                UtilsUI::WyswietlTab1Poz($wynik, 
                array(NieruchomoscDAL::$id_zapotrzebowanie, NieruchomoscDAL::$imie, NieruchomoscDAL::$nazwisko, NieruchomoscDAL::$pesel, OsobaDAL::$telefon, NieruchomoscDAL::$data_otw_zlecenie), 
                array(tags::$nr_zapotrzebowania, tags::$imie, tags::$nazwisko, tags::$pesel, tags::$telefon, tags::$data_otw_zlec), 
                NieruchomoscDAL::$id_zapotrzebowanie, 
                'zapotrzebowanie_id',
                array(Akcja::$edycja => 1), null, null, $popupObj, null, null, array(NieruchomoscDAL::$id_klient => NieruchomoscDAL::$id_klient));
                echo '</form>';
            }
            else
            {
                UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nie_znaleziono_elementow));
            }
            
            $wynik = $dal->KojarzenieOfertaMedia($tabParametr, $ilosc_wierszy);
            
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
        }
        KontrolkiHtml::DodajSubmit('ok', 'id_ok', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zakoncz), 'onclick="window.close();"');
    }
    require('../../stopka.php');

?>
</body>
</html>
