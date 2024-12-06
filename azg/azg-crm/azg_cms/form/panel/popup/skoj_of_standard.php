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
        $tabParametr = array();
        
        $zapotrzebowanie_id = null;
        $zapotrzebowanie_trans_id = null;
        
        ///pokazanie ofert skojarzonych dla zapotrzebowan
        
        if (isset($_POST['zatw_poziomy']))
        {
            $tabParametr[NieruchomoscDAL::$zainteresowany] = $_POST['nowe_stare'];
            $tabParametr[WyposazenieZapDAL::$poziom_parametry] = $_POST['poziom_par'];
            $tabParametr[WyposazenieZapDAL::$poziom_wyposazenia] = $_POST['poziom_wyp'];
        }
        
        if (isset($_GET[WyposazenieZapDAL::$id_zapotrzebowanie_trans_rodzaj]))
        {
            $zapotrzebowanie_trans_id = $_GET[WyposazenieZapDAL::$id_zapotrzebowanie_trans_rodzaj];
            $zapotrzebowanie_id = $_GET[NieruchomoscDAL::$id_zapotrzebowanie];
        }
        if (isset($_POST[WyposazenieZapDAL::$id_zapotrzebowanie_trans_rodzaj]))
        {
            $zapotrzebowanie_trans_id = $_POST[WyposazenieZapDAL::$id_zapotrzebowanie_trans_rodzaj];
            $zapotrzebowanie_id = $_POST[NieruchomoscDAL::$id_zapotrzebowanie];
        }
        
        //if ((isset($_GET[WyposazenieZapDAL::$id_zapotrzebowanie_trans_rodzaj]) || ($_SERVER['REQUEST_METHOD'] == 'POST')))
        if ($zapotrzebowanie_trans_id != null)
        {
            
            UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$numer_zapotrzebowania).' :'.$zapotrzebowanie_id);
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
            
            echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'">';
            KontrolkiHtml::DodajHidden(WyposazenieZapDAL::$id_zapotrzebowanie_trans_rodzaj, WyposazenieZapDAL::$id_zapotrzebowanie_trans_rodzaj, $zapotrzebowanie_trans_id);
            KontrolkiHtml::DodajHidden(WyposazenieZapDAL::$id_zapotrzebowanie, WyposazenieZapDAL::$id_zapotrzebowanie, $zapotrzebowanie_id);
            echo '<table>';
            echo '<tr>';
            
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
            
            $dal = new WyposazenieZapDAL($zapotrzebowanie_trans_id);
            
            if ($par_zazn > 0)
            {
                $params = $dal->PokazWybraneParamZlecenie(array(WyposazenieZapDAL::$poziom_parametry => $par_zazn), $ilosc_wierszy);
                echo '<table><tr>';
                foreach ($params as $param)
                {
                    echo '<td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], $param[NieruchomoscDAL::$nazwa]).', </td>';
                }
                echo '</tr></table>';
                //var_dump($params);
            }
            
            echo '<hr />';
            
            
            $wynik = $dal->KojarzenieBazoweDlaZapotrzebowania($tabParametr, $ilosc_wierszy);
            
            $popupObj = new PopUpWysw();
                
            $popupObj->nag = array(tags::$lista_wskazan);
            $popupObj->przyc_nazwa = array(tags::$lista_wskazan);
            //zmiana skryptu obslugujacego
            //$popupObj->url = array('dodaj_of_lista_wsk.php?'.NieruchomoscDAL::$id_zapotrzebowanie.'='.$zapotrzebowanie_id.'&'.NieruchomoscDAL::$id_oferta);
            //$popupObj->url = array('skojarz_of_zap.php?'.NieruchomoscDAL::$id_oferta.'='.$oferta_id.'&'.NieruchomoscDAL::$id_zapotrzebowanie);
            $popupObj->url = array('skojarz_of_zap.php?'.NieruchomoscDAL::$id_zapotrzebowanie.'='.$zapotrzebowanie_id.'&'.NieruchomoscDAL::$id_oferta);
            $popupObj->szerokosc = array(1000);
            $popupObj->dlugosc = array(750);      
            
            $links = new Links();
            $links->nag = tags::$pokaz;
            $links->text = tags::$pokaz;
            $links->url = $strona_www;
            $links->vars = array(tags::$oferta, NieruchomoscDAL::$id_trans_rodzaj, NieruchomoscDAL::$id_nier_rodzaj);
            $links->varvalues = array(NieruchomoscDAL::$id_oferta, NieruchomoscDAL::$id_rodz_trans, NieruchomoscDAL::$id_nier_rodzaj);
            $link[0] = $links;
            
            UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$oferty_skojarzone_dla_zapotrzebowania).' '.$zapotrzebowanie_id);
            
            if ($ilosc_wierszy > 0)
            {
                UtilsUI::$rekordy = $ilosc_wierszy;
                
                echo '<form action="../edycja_oferta_szcz.php" method= "POST" target="_blank">';
                //NieruchomoscDAL::$imie, NieruchomoscDAL::$nazwisko, 
                //tags::$imie, tags::$nazwisko, 
                //, tags::$telefon, tags::$telefon_komorkowy       , OsobaDAL::$telefon, OsobaDAL::$komorka
                UtilsUI::WyswietlTab1Poz($wynik, 
                array(NieruchomoscDAL::$id_oferta, NieruchomoscDAL::$miejscowosc, NieruchomoscDAL::$ulica_net, NieruchomoscDAL::$cena, NieruchomoscDAL::$transakcja_rodzaj, NieruchomoscDAL::$nieruchomosc_rodzaj, 
                NieruchomoscDAL::$data_otw_zlecenie), 
                array(tags::$nr_oferty, tags::$lokalizacja, tags::$lokalizacja_internet, tags::$cena, tags::$rodzaj_transakcja, tags::$rodzaj_nieruchomosci, 
                tags::$data_otw_zlec), 
                NieruchomoscDAL::$id_oferta, 'oferta_id', array(Akcja::$edycja => 1), null, null, $popupObj, $link);
                echo '</form>';
                //var_dump($wynik);
            }
            else
            {
                UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nie_znaleziono_elementow));
            }
            
            $wynik = $dal->KojarzenieZapotrzebowanieMedia($ilosc_wierszy);
            
            echo '<hr />';
            UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$skojarzone_z_mediow)); 
            
            if ($ilosc_wierszy > 0)
            {
                UtilsUI::$rekordy = $ilosc_wierszy;
                
                echo '<form action="../edycja_media_nier.php" method="POST" target="_blank">';
                UtilsUI::WyswietlTab1Poz($wynik, array(MediaDAL::$id_media_nieruchomosc, NieruchomoscDAL::$nieruchomosc_rodzaj, NieruchomoscDAL::$transakcja_rodzaj, NieruchomoscDAL::$region, NieruchomoscDAL::$status, 
                NieruchomoscDAL::$cena, NieruchomoscDAL::$data, MediaDAL::$przypomnienie, NieruchomoscDAL::$agent, MediaDAL::$telefon), 
                array(tags::$id, tags::$rodzaj_nieruchomosci, tags::$rodzaj_transakcja, tags::$lokalizacja, tags::$status, tags::$cena, tags::$data, tags::$data_przypomnienia, tags::$agent, tags::$telefon), 
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
