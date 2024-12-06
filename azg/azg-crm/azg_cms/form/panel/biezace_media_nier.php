<HTML>
<HEAD>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <script language="javascript" src="../js/script.js"></script>
<link href="../css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<?php
    // ¶ ±
    session_start();
    include_once ('../dal/queriesDAL.php');
    include_once ('../ui/kontrolki_html.php');
    include_once ('../ui/utilsui.php');
    include_once ('../bll/parametrynierbll.php'); 
    include_once ('../bll/tags.php'); 
    include_once ('../bll/agentbll.php');
    include_once ('../bll/jezykibll.php');
    include_once ('../bll/cache.php');
    include_once ('../bll/transnierbll.php');
    require('../naglowek.php');
    require('../conf.php');
    
    if (!isset($_SESSION[$zalogowany]))
    {
        echo 'Nie jesteÅ› zalogowany.';
    }
    else
    {
        $tlumaczenia = cachejezyki::Czytaj();
        $agent_zal = unserialize($_SESSION[$dane_agent]);
    
        $radio_dana = null;
        if (isset($_POST['moje_wszystkie']))
        {
            $radio_dana = $_POST['moje_wszystkie'];
        }
        
        echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'"><table><tr>';
        UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$przypomnienia));
        KontrolkiHtml::DodajRadio('moje_wszystkie', array('id_wszystkie', 'id_moje'), array(tags::$wszystkie, tags::$moje), array(tags::$wszystkie, tags::$moje), '', false, $radio_dana, '<td>', '</td>');
        echo '<td>';
        KontrolkiHtml::DodajSubmit('zatwierdz', 'id_zatwierdz', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zatwierdz).'.', '');
        echo '</td></tr></table>';
        echo '</form>';
        $dal = new MediaDAL();
        $tabParametr = array();
        
        if (isset($_POST['zatwierdz']))
        {
            if ($_POST['moje_wszystkie'] == tags::$moje)
            $tabParametr[NieruchomoscDAL::$id_agent] = $agent_zal->id;
        }
        
        $wynik = $dal->PodajPrzypomnieniaMedia($tabParametr, $ilosc_wierszy);
                
        if ($ilosc_wierszy > 0)
        {
            UtilsUI::DodajTabWyroznien($status_nieaktualny, $czerwony);
            UtilsUI::DodajTabWyroznien($status_zawieszony, $niebieski);
            UtilsUI::DodajTabWyroznien($status_umowiony, $zielony);
            UtilsUI::PodajIndWyroznien(NieruchomoscDAL::$id_status);
            
            UtilsUI::$rekordy = $ilosc_wierszy;
            echo '<form action="edycja_media_nier.php" method="POST" target="_blank">';
            UtilsUI::WyswietlTab1Poz($wynik, array(MediaDAL::$id_media_nieruchomosc, NieruchomoscDAL::$nieruchomosc_rodzaj, NieruchomoscDAL::$transakcja_rodzaj, NieruchomoscDAL::$region, NieruchomoscDAL::$status, 
            NieruchomoscDAL::$data, MediaDAL::$przypomnienie, NieruchomoscDAL::$agent, MediaDAL::$telefon, NieruchomoscDAL::$oferent), 
            array(tags::$id, tags::$rodzaj_nieruchomosci, tags::$rodzaj_transakcja, tags::$miejscowosc, tags::$status, tags::$data, tags::$data_przypomnienia, tags::$agent, tags::$telefon, tags::$oferent), 
            MediaDAL::$id_media_nieruchomosc, 'media_nieruchomosc_id', array(Akcja::$edycja => 1));
            echo '</form>';
        }
        else
        {
            UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nie_znaleziono_elementow));
        }
        
        
        $radio_dana_n_c = null;
        if (isset($_POST['moje_wszystkie_n_c']))
        {
            $radio_dana_n_c = $_POST['moje_wszystkie_n_c'];
        }
        
        echo '<hr /><form method="POST" action="'.$_SERVER['PHP_SELF'].'"><table><tr>';
        UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$oferty_z_ostatnich_trzech_miesiecy));
        KontrolkiHtml::DodajRadio('moje_wszystkie_n_c', array('id_wszystkie_n_c', 'id_moje_n_c'), array(tags::$wszystkie, tags::$moje), array(tags::$wszystkie, tags::$moje), '', false, $radio_dana_n_c, '<td>', '</td>');
        echo '<td>';
        KontrolkiHtml::DodajSubmit('zatwierdz_n_c', 'id_zatwierdz', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zatwierdz).'.', '');
        echo '</td></tr></table>';
        echo '</form>';
        $dal = new MediaDAL();
        $tabParametr = array();
        // na czasie :P - n c
        if (isset($_POST['zatwierdz_n_c']))
        {
            if ($_POST['moje_wszystkie_n_c'] == tags::$moje)
            $tabParametr[NieruchomoscDAL::$id_agent] = $agent_zal->id;
        }
        
        $wynik = $dal->PodajMediaNaCzasie($tabParametr, $ilosc_wierszy);
        if ($ilosc_wierszy > 0)
        {
            UtilsUI::DodajTabWyroznien($status_nieaktualny, $czerwony);
            UtilsUI::DodajTabWyroznien($status_zawieszony, $niebieski);
            UtilsUI::DodajTabWyroznien($status_umowiony, $zielony);
            UtilsUI::PodajIndWyroznien(NieruchomoscDAL::$id_status);
            
            UtilsUI::$rekordy = $ilosc_wierszy;
            echo '<form action="edycja_media_nier.php" method="POST" target="_blank">';
            UtilsUI::$grid_un = '3mies';
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
            
            /*$tabParametr[MediaDAL::$telefon] = $_POST['telefon'];
            $wynik = $dal->PodajOfertyMedia($tabParametr, $ilosc_wierszy);
            //na powstajace gridy ponawijac nowe formularze z targetem blank :)
            if ($ilosc_wierszy > 0)
            {
                echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$znaleziono_w_mediach).' :<br />';
                UtilsUI::WyswietlTab1Poz($wynik, array(MediaDAL::$id_media_nieruchomosc, NieruchomoscDAL::$transakcja_rodzaj, NieruchomoscDAL::$nieruchomosc_rodzaj, NieruchomoscDAL::$status, 
                MediaDAL::$telefon), 
                array(tags::$id, tags::$rodzaj_transakcja, tags::$rodzaj_nieruchomosci, tags::$status, tags::$telefon), 
                MediaDAL::$id_media_nieruchomosc, 'media_nieruchomosc_id', null);
            }
            
            $wynik = $dal->PodajOfertyTelefon($tabParametr, $ilosc_wierszy);
            
            if ($ilosc_wierszy > 0)
            {
                echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$oferty).' :<br />';
                UtilsUI::WyswietlTab1Poz($wynik, array(NieruchomoscDAL::$id_oferta, NieruchomoscDAL::$imie, NieruchomoscDAL::$nazwisko, NieruchomoscDAL::$pesel, NieruchomoscDAL::$transakcja_rodzaj, 
                NieruchomoscDAL::$nieruchomosc_rodzaj, NieruchomoscDAL::$status, MediaDAL::$telefon, OsobaDAL::$komorka), 
                array(tags::$nr_oferty, tags::$imie, tags::$nazwisko, tags::$pesel, tags::$rodzaj_transakcja, tags::$rodzaj_nieruchomosci, tags::$status, tags::$telefon, tags::$telefon_komorkowy), 
                NieruchomoscDAL::$id_oferta, 'oferta_id', null);
            }
            
            $wynik = $dal->PodajZapotrzebowanieTelefon($tabParametr, $ilosc_wierszy);
            
            if ($ilosc_wierszy > 0)
            {
                echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zapotrzebowania).' :<br />';
                UtilsUI::WyswietlTab1Poz($wynik, array(NieruchomoscDAL::$id_zapotrzebowanie, NieruchomoscDAL::$imie, NieruchomoscDAL::$nazwisko, NieruchomoscDAL::$pesel, 
                MediaDAL::$telefon, OsobaDAL::$komorka), 
                array(tags::$nr_oferty, tags::$imie, tags::$nazwisko, tags::$pesel, tags::$telefon, tags::$telefon_komorkowy), 
                NieruchomoscDAL::$id_oferta, 'oferta_id', null);
            }  */
    }
    require('../stopka.php');

?>
</body>
</html>
