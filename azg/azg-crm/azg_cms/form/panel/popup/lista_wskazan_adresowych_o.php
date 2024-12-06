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
        
        if (isset($_GET[NieruchomoscDAL::$id_oferta]))
        {
            $oferta_id = $_GET[NieruchomoscDAL::$id_oferta];
        }
        if (isset($_POST[NieruchomoscDAL::$id_oferta]))
        {
            $oferta_id = $_POST[NieruchomoscDAL::$id_oferta];
        }
        
        UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$lista_klientow_ktorzy_obejrzeli_nieruchomosci));
        echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'"><table>';
        KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_oferta, NieruchomoscDAL::$id_oferta, $oferta_id); 
        echo '</tr></td></table></form>';
        $wynik = $dal->PodajListaWskOferta(array(ListaWskazanDAL::$id_oferta => $oferta_id), $ilosc_wierszy); 
        if($ilosc_wierszy > 0)
        {
            UtilsUI::$rekordy = $ilosc_wierszy; 
            echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'"><table>';
            UtilsUI::WyswietlTab1Poz($wynik, array(ListaWskazanDAL::$id_zapotrzebowanie, ListaWskazanDAL::$osoba, ListaWskazanDAL::$pesel, ListaWskazanDAL::$telefon, ListaWskazanDAL::$data, NieruchomoscDAL::$agent),
            array(tags::$nr_zapotrzebowania, tags::$osoba, tags::$pesel, tags::$telefon, tags::$data, tags::$agent), 
            ListaWskazanDAL::$id_oferta, 'oferta_id', null);
            //array(Akcja::$kasowanie => 1)
            echo '</form>';
        }
        else
        {
            UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$brak_informacji_do_wyswietlenia));
        }
        if($ilosc_wierszy > 0)
        {
            //1507  po przygotowaniu prostej procedury dodac przycisk do wydruku
            KontrolkiHtml::DodajPopUpButton($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$generuj_liste_wskazan), 'generuj_lista_wskazan', 'lista_klientow_ogl.php?'.NieruchomoscDAL::$id_oferta.'='.$oferta_id, $dl_lista_wsk, $szer_lista_wsk);
            echo '&nbsp;';
            KontrolkiHtml::DodajPopUpButton($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$rozwiazanie_umowy), 'generuj_lista_wskazan', 'lista_klientow_ogl.php?'.NieruchomoscDAL::$id_oferta.'='.$oferta_id.'&rozwiazanie=true', $dl_lista_wsk, $szer_lista_wsk);
        }
        
        echo '<hr />';
        
        KontrolkiHtml::DodajSubmit('ok', 'id_ok', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zakoncz), 'onclick="window.close();"');   
    }
    require('../../stopka.php');

?>
</body>
</html>
