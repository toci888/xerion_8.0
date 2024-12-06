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
        
        //formularz szukania po tel i oferuje - poszukuje, pomyslec o lepieniu :P
        $oferuje_poszukuje_id = 'null';
        $nier_rodzaj_id = 'null';
        $trans_rodzaj_id = 'null';
        $tel_wartosc = null;
        $data_od = null;
        $data_do = null;
        
        if (isset($_POST['oferuje_poszukuje']))
        {
            $oferuje_poszukuje_id = $_POST['oferuje_poszukuje_id'];
            $nier_rodzaj_id = $_POST['nier_rodzaj_id'];
            $trans_rodzaj_id = $_POST['trans_rodzaj_id'];
            $tel_wartosc = $_POST['telefon'];
            $data_od = $_POST['data_od'];
            $data_do = $_POST['data_do'];
        }
        $of_posz = array(array('id' => 'null', 'nazwa' => '--------'), array('id' => 'true', 'nazwa' => tags::$oferuje), array('id' => 'false', 'nazwa' => tags::$poszukuje));
        $obiektTrans = new TransNierDAL();
        $tabNier = $obiektTrans->PodajListeNieruchomosci($ilosc_wierszy);
        $tabNier[count($tabNier)] = array(TransNierDAL::$id => 'null', TransNierDAL::$nazwa_nieruchomosc => '--------');
        $tabTrans = $obiektTrans->PodajListeTransakcji(array(TransNierDAL::$of_zap => tags::$oferta), $ilosc_wierszy);
        $tabTrans[count($tabTrans)] = array('id' => 'null', 'nazwa' => '--------');
        
        echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'" name="filtracja_media"><table><tr><td>';
        KontrolkiHtml::DodajHidden('sort_kol', 'sort_kol', '');
        KontrolkiHtml::DodajHidden('sort_kier', 'sort_kier', '');
        KontrolkiHtml::DodajSelectDomWartId('oferuje_poszukuje', 'id_oferuje_poszukuje', $of_posz, 'oferuje_poszukuje_id', $oferuje_poszukuje_id, '', '');
        echo '<td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$rodzaj_nieruchomosci).' : </td><td>';
        KontrolkiHtml::DodajSelectDomWartId('nieruchomosci', 'id_nieruchomosci', $tabNier, 'nier_rodzaj_id', $nier_rodzaj_id, '', '', TransNierDAL::$id, TransNierDAL::$nazwa_nieruchomosc);
        echo '</td><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$rodzaj_transakcja);
        echo ' : </td><td>';
        KontrolkiHtml::DodajSelectDomWartId('transakcje', 'id_transakcje', $tabTrans, 'trans_rodzaj_id', $trans_rodzaj_id, '', '');
        //KontrolkiHtml::DodajRadio('oferuje_poszukuje', array('id_oferuje', 'id_poszukuje'), array(tags::$oferuje, tags::$poszukuje), array(tags::$oferuje, tags::$poszukuje), '', false, $radio_dana, '<td>', '</td>');
        echo '</td><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$telefon).' :</td><td>';
        KontrolkiHtml::DodajTextbox('telefon', 'id_telefon', $tel_wartosc, 13, 10, '');
        echo '</td><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$data_dodania_od).' :</td><td>';
        KontrolkiHtml::DodajTextboxData('data_od', 'id_data_od', $data_od, 10, 10, $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podana_inf_nie_jest_data), '', '', 'filtracja_media');
        echo '</td><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$data_dodania_do).' :</td><td>';
        KontrolkiHtml::DodajTextboxData('data_do', 'id_data_do', $data_do, 10, 10, $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podana_inf_nie_jest_data), '', '', 'filtracja_media');
        echo '</td><td>';
        KontrolkiHtml::DodajSubmit('zatwierdz_kr_szukanie', 'id_zatwierdz_kr_szukanie', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zatwierdz).'.', '');
        echo '</td></tr></table>';
        echo '</form>';
        
        if (isset($_POST['zatwierdz_kr_szukanie']))
        {
            $dal = new MediaDAL();
            
            UtilsUI::DodajSortowanie('filtracja_media', 'zatwierdz_kr_szukanie', 'sort_kol', 'sort_kier');
            UtilsUI::$strona = 15;

            $tabParametr[NieruchomoscDAL::$oferent] = $_POST['oferuje_poszukuje_id'];
            $tabParametr[MediaDAL::$telefon] = $_POST['telefon'];
            $tabParametr[NieruchomoscDAL::$id_nier_rodzaj] = $_POST['nier_rodzaj_id'];
            $tabParametr[NieruchomoscDAL::$id_trans_rodzaj] = $_POST['trans_rodzaj_id'];
            $tabParametr[MediaDAL::$data] = $_POST['data_od'];
            $tabParametr[MediaDAL::$data_do] = $_POST['data_do'];
            
            if (strlen($_POST['sort_kol']) > 0)
            {
                $tabParametr[NieruchomoscDAL::$sortuj] = $_POST['sort_kol'];
            }
            if (strlen($_POST['sort_kier']) > 0)
            {
                $tabParametr[NieruchomoscDAL::$sortuj_kierunek] = $_POST['sort_kier'];
            }
            
            $wynik = $dal->PodajOfertyMedia($tabParametr, $ilosc_wierszy);
            //na powstajace gridy ponawijac nowe formularze z targetem blank :)
            if ($ilosc_wierszy > 0)
            {
                UtilsUI::DodajTabWyroznien($status_nieaktualny, $czerwony);
                UtilsUI::DodajTabWyroznien($status_zawieszony, $niebieski);
                UtilsUI::DodajTabWyroznien($status_umowiony, $zielony);
                UtilsUI::PodajIndWyroznien(NieruchomoscDAL::$id_status);
                
                UtilsUI::$rekordy = $ilosc_wierszy;
                echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$znaleziono_w_mediach).' :<br />';
                echo '<form action="edycja_media_nier.php" method="POST" target="_blank">';
                UtilsUI::WyswietlTab1Poz($wynik, array(NieruchomoscDAL::$oferent, NieruchomoscDAL::$transakcja_rodzaj, NieruchomoscDAL::$nieruchomosc_rodzaj, NieruchomoscDAL::$status, 
                MediaDAL::$telefon, MediaDAL::$data, MediaDAL::$przypomnienie, NieruchomoscDAL::$region, NieruchomoscDAL::$ulica), 
                array(tags::$oferent, tags::$rodzaj_transakcja, tags::$rodzaj_nieruchomosci, tags::$status, tags::$telefon, tags::$data, tags::$przypomnienia, tags::$miejscowosc, tags::$ulica), 
                MediaDAL::$id_media_nieruchomosc, 'media_nieruchomosc_id', array(Akcja::$edycja => 1));
                echo '</form>';
            }
            
            $wynik = $dal->PodajOfertyTelefon($tabParametr, $ilosc_wierszy);
            
            if ($ilosc_wierszy > 0)
            {
                echo '<hr />';
                UtilsUI::DodajTabWyroznien($status_nieaktualny, $czerwony);
                UtilsUI::DodajTabWyroznien($status_zawieszony, $niebieski);
                UtilsUI::DodajTabWyroznien($status_umowiony, $zielony);
                UtilsUI::PodajIndWyroznien(NieruchomoscDAL::$id_status);
                
                UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$oferty));
                
                UtilsUI::$rekordy = $ilosc_wierszy;
                echo '<form action="edycja_oferta_szcz.php" method="POST" target="_blank">';
                UtilsUI::WyswietlTab1Poz($wynik, array(NieruchomoscDAL::$id_oferta, NieruchomoscDAL::$imie, NieruchomoscDAL::$nazwisko, NieruchomoscDAL::$pesel, NieruchomoscDAL::$transakcja_rodzaj, 
                NieruchomoscDAL::$nieruchomosc_rodzaj, NieruchomoscDAL::$status, MediaDAL::$telefon, OsobaDAL::$komorka), 
                array(tags::$nr_oferty, tags::$imie, tags::$nazwisko, tags::$pesel, tags::$rodzaj_transakcja, tags::$rodzaj_nieruchomosci, tags::$status, tags::$telefon, tags::$telefon_komorkowy), 
                NieruchomoscDAL::$id_oferta, 'oferta_id', array(Akcja::$edycja => 1));
                echo '</form>';
            }
            
            $wynik = $dal->PodajZapotrzebowanieTelefon($tabParametr, $ilosc_wierszy);
            
            if ($ilosc_wierszy > 0)
            {
                echo '<hr />';
                UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zapotrzebowania));
                
                UtilsUI::$rekordy = $ilosc_wierszy;
                echo '<form action="dodanie_trans_zap.php" method= "POST" target="_blank">';
                UtilsUI::WyswietlTab1Poz($wynik, array(NieruchomoscDAL::$id_zapotrzebowanie, NieruchomoscDAL::$imie, NieruchomoscDAL::$nazwisko, NieruchomoscDAL::$pesel, 
                MediaDAL::$telefon, OsobaDAL::$komorka), 
                array(tags::$nr_oferty, tags::$imie, tags::$nazwisko, tags::$pesel, tags::$telefon, tags::$telefon_komorkowy), 
                NieruchomoscDAL::$id_zapotrzebowanie, 'zapotrzebowanie_id', array(Akcja::$edycja => 1), null, null, null, null, null, array(NieruchomoscDAL::$id_klient => NieruchomoscDAL::$id_klient));
                echo '</form>';
            }
        }
        //formularz filtrowania zlozonego - rodzaj nier, rodzaj trans, status, data wprowadzenia, mozliwe ze cos jeszcze
        
        ///to pod button aktualnosci jako rzecz oddzielona - trzymanie tego w kupie spowoduje nadwyzke roboty dla serwera
               
    }
    require('../stopka.php');

?>
</body>
</html>
