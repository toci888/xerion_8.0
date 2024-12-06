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
        //$agent_zal = unserialize($_SESSION[$dane_agent]); 
        $dal = new ListaWskazanDAL();
        
        $zapotrzebowanie_id = null;
        
        //otrzaskac ta sesje
        if (isset($_GET[NieruchomoscDAL::$id_zapotrzebowanie]))
        {
            //$_SESSION[NieruchomoscDAL::$id_zapotrzebowanie] = $_GET[NieruchomoscDAL::$id_zapotrzebowanie];
            $zapotrzebowanie_id = $_GET[NieruchomoscDAL::$id_zapotrzebowanie];
        }
        if (isset($_POST[NieruchomoscDAL::$id_zapotrzebowanie]))
        {
            //$_SESSION[NieruchomoscDAL::$id_zapotrzebowanie] = $_POST[NieruchomoscDAL::$id_zapotrzebowanie];
            $zapotrzebowanie_id = $_POST[NieruchomoscDAL::$id_zapotrzebowanie];
        }
        
        ///echo oferty ogladniete
        //ten formularz nie ma sensu ?? ?:P, dodac jakis wydruk tych danych ?
        UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$numer_zapotrzebowania).' : '.$zapotrzebowanie_id);
        UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$oferty_ogladniete_przez_klienta));
        
        /*echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'"><table>';
        KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_zapotrzebowanie, NieruchomoscDAL::$id_zapotrzebowanie, $zapotrzebowanie_id); 
        echo '</tr></td></table></form>';*/
        
        $wynik = $dal->PodajListaWskZapotrzebowanie(array(ListaWskazanDAL::$id_zapotrzebowanie => $zapotrzebowanie_id), $ilosc_wierszy); 
        if($ilosc_wierszy > 0)
        { 
            UtilsUI::$rekordy = $ilosc_wierszy;
            UtilsUI::DodajTabWyroznien($status_nieaktualny, $czerwony);
            UtilsUI::DodajTabWyroznien($status_zawieszony, $niebieski);
            UtilsUI::DodajTabWyroznien($status_umowiony, $zielony);
            UtilsUI::DodajTabWyroznien($status_wstrzymany, $zolty);
            UtilsUI::PodajIndWyroznien(NieruchomoscDAL::$id_status);
                
            echo '<form method="POST" action="transakcja.php"><table>';
            KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_zapotrzebowanie, NieruchomoscDAL::$id_zapotrzebowanie, $zapotrzebowanie_id);
            UtilsUI::WyswietlTab1Poz($wynik, array(ListaWskazanDAL::$id_oferta, NieruchomoscDAL::$nieruchomosc_rodzaj, NieruchomoscDAL::$transakcja_rodzaj, NieruchomoscDAL::$status, NieruchomoscDAL::$agent, 
            ListaWskazanDAL::$cena, ListaWskazanDAL::$cena_ogl, ListaWskazanDAL::$ulica, ListaWskazanDAL::$ogladanie_data, MediaDAL::$powierzchnia, ExportDAL::$liczba_pokoi),
            array(tags::$nr_oferty, tags::$rodzaj_nieruchomosci, tags::$rodzaj_transakcja, tags::$status, tags::$agent, tags::$cena, tags::$cena_ogl, tags::$ulica, tags::$data, tags::$powierzchnia, tags::$liczba_pokoi), 
            ListaWskazanDAL::$id_lista_wsk_adr, 'lista_wsk_adr_id', null, array(tags::$transakcja), array(tags::$transakcja => tags::$transakcja), null, null, null, array(NieruchomoscDAL::$id_oferta => NieruchomoscDAL::$id_oferta));
            
            //UtilsUI::WyswietlTab1Poz($wynik, array(ListaWskazanDAL::$id_oferta, NieruchomoscDAL::$nieruchomosc_rodzaj, ListaWskazanDAL::$cena, ListaWskazanDAL::$ulica, ListaWskazanDAL::$ogladanie_data),
            //array(tags::$nr_oferty, tags::$rodzaj_nieruchomosci, tags::$cena, tags::$ulica, tags::$data), ListaWskazanDAL::$id_oferta, 'oferta_id', null);
            
            //array(Akcja::$kasowanie => 1)
            echo '</form>';
        }
        
        KontrolkiHtml::DodajPopUpButton($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$generuj_liste_ogladanych_ofert), 'generuj_lista_wskazan', 'lista_ofert_ogl.php?'.
                NieruchomoscDAL::$id_zapotrzebowanie.'='.$zapotrzebowanie_id, $dl_lista_wsk, $szer_lista_wsk);
        echo '<hr />';
        
        //zaciagnac id osoby po id zlecenia
        $dal = new ListaWskazanDAL();
        $wynik = $dal->PodajOsobaZapotrzebowanie(array(ListaWskazanDAL::$id_zapotrzebowanie => $zapotrzebowanie_id));
        $dal = new OsobaDAL($wynik[0][OsobaDAL::$id_osoba]);
        $wynik = $dal->PodajSpotkanieOsoba(array(OsobaDAL::$oferent => 'false'), $ilosc_wierszy);
        if ($ilosc_wierszy > 0)
        {
            UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zaplanowane_klientowi_ogladania));
            UtilsUI::$rekordy = $ilosc_wierszy;
            UtilsUI::WyswietlTab1Poz($wynik, array(OsobaDAL::$id_oferta, OsobaDAL::$id_zapotrzebowanie, OsobaDAL::$data, OsobaDAL::$godzina, NieruchomoscDAL::$agent, OsobaDAL::$umowienie), 
            array(tags::$nr_oferty, tags::$nr_zapotrzebowania, tags::$data, tags::$godzina, tags::$agent, tags::$cel_spotkania), OsobaDAL::$id_osoba, 'osoba_id', null);
        }
        echo '<br />';
        KontrolkiHtml::DodajSubmit('ok', 'id_ok', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zakoncz), 'onclick="window.close();"');
    }
    require('../../stopka.php');

?>
</body>
</html>
