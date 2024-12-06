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
    include_once ('../../bll/transnierbll.php');
    require('../../naglowek.php');
    require('../../conf.php');
    
    if (!isset($_SESSION[$zalogowany]))
    {
        echo 'Nie jesteÅ› zalogowany.';
    }
    else
    {
        $tlumaczenia = cachejezyki::Czytaj();
        $agent_zal = unserialize($_SESSION[$dane_agent]);
        
        $nier_rodz_id = null;
        $trans_rodz_id = null;
        $oferent = null;
        //to bedzie tez zapotrzebowanie
        $oferta_id = null;
        
        if (isset($_GET[NieruchomoscDAL::$oferent]))
        {
            $oferent = $_GET[NieruchomoscDAL::$oferent];
            $oferta_id = $_GET[NieruchomoscDAL::$id_oferta];
            $nier_rodz_id = $_GET[NieruchomoscDAL::$id_nier_rodzaj];
            $trans_rodz_id = $_GET[NieruchomoscDAL::$id_trans_rodzaj];
        }
        if (isset($_POST[NieruchomoscDAL::$oferent]))
        {
            $oferent = $_POST[NieruchomoscDAL::$oferent];
            $oferta_id = $_POST[NieruchomoscDAL::$id_oferta];
            $nier_rodz_id = $_POST[NieruchomoscDAL::$id_nier_rodzaj];
            $trans_rodz_id = $_POST[NieruchomoscDAL::$id_trans_rodzaj];
        }
        
        $dal = new MediaDAL();
        
        if (isset($_POST['dodaj']))
        {
            $tabParametr[MediaDAL::$id_media_nieruchomosc] = $_POST['media_nieruchomosc_id'];
            $tabParametr[MediaDAL::$id_of_zap] = $oferta_id;
            
            $rezultat = $dal->PrzyjetoZMediow($tabParametr);
            //var_dump($rezultat);
            if ($rezultat[NieruchomoscDAL::$nazwa] != null)
            {
                UtilsUI::InfoBlad($tlumaczenia->Tlumacz($_SESSION[$jezyk], $rezultat[NieruchomoscDAL::$nazwa]));
            }
        }
        
        if (isset($_POST['zatwierdz_kr_szukanie']))
        {            
            //tu sie chyba nie nada utilsui
            
            UtilsUI::$strona = 15;
            $tabParametr[MediaDAL::$telefon] = $_POST['telefon'];
            $tabParametr[NieruchomoscDAL::$oferent] = $oferent;
            $tabParametr[MediaDAL::$id_nier_rodzaj] = $nier_rodz_id;
            $tabParametr[MediaDAL::$id_trans_rodzaj] = $trans_rodz_id;
            
            $wynik = $dal->PodajOfertyMediaPrzyjecie($tabParametr, $ilosc_wierszy);
            //na powstajace gridy ponawijac nowe formularze z targetem blank :)
            if ($ilosc_wierszy > 0)
            {
                UtilsUI::$rekordy = $ilosc_wierszy;
                UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$znaleziono_w_mediach));
                echo '<form action="'.$_SERVER['PHP_SELF'].'" method="POST">';
                KontrolkiHtml::DodajHidden(NieruchomoscDAL::$oferent, NieruchomoscDAL::$oferent, $oferent);
                KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_oferta, NieruchomoscDAL::$id_oferta, $oferta_id);
                KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_nier_rodzaj, NieruchomoscDAL::$id_nier_rodzaj, $nier_rodz_id);
                KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_trans_rodzaj, NieruchomoscDAL::$id_trans_rodzaj, $trans_rodz_id);
                UtilsUI::WyswietlTab1Poz($wynik, array(MediaDAL::$id_media_nieruchomosc, NieruchomoscDAL::$transakcja_rodzaj, NieruchomoscDAL::$nieruchomosc_rodzaj, NieruchomoscDAL::$status, 
                MediaDAL::$telefon), 
                array(tags::$id, tags::$rodzaj_transakcja, tags::$rodzaj_nieruchomosci, tags::$status, tags::$telefon), 
                MediaDAL::$id_media_nieruchomosc, 'media_nieruchomosc_id', array(Akcja::$dodawanie => 1));
                echo '</form>';
            }
            else
            {
                UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nie_znaleziono_elementow));
            }
        }
        
        if ($oferta_id != null)
        {
            $tabParametr[NieruchomoscDAL::$oferent] = $oferent;
            $tabParametr[MediaDAL::$id_of_zap] = $oferta_id;
            
            $wynik = $dal->PodajMediumDlaOfZap($tabParametr, $ilosc_wierszy);
            UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$oferta_w_mediach));
            if ($ilosc_wierszy > 0)
            {
                UtilsUI::$rekordy = $ilosc_wierszy;
                //echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$znaleziono_w_mediach).' :<br />';
                UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$oferta_zlecenie_przypisane_z_mediow));
                echo '<form action="'.$_SERVER['PHP_SELF'].'" method="POST">';
                KontrolkiHtml::DodajHidden(NieruchomoscDAL::$oferent, NieruchomoscDAL::$oferent, $oferent);
                KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_oferta, NieruchomoscDAL::$id_oferta, $oferta_id);
                KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_nier_rodzaj, NieruchomoscDAL::$id_nier_rodzaj, $nier_rodz_id);
                KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_trans_rodzaj, NieruchomoscDAL::$id_trans_rodzaj, $trans_rodz_id);
                UtilsUI::WyswietlTab1Poz($wynik, array(MediaDAL::$id_media_nieruchomosc, NieruchomoscDAL::$transakcja_rodzaj, NieruchomoscDAL::$nieruchomosc_rodzaj, NieruchomoscDAL::$status, 
                MediaDAL::$telefon, MediaDAL::$media_reklama), 
                array(tags::$id, tags::$rodzaj_transakcja, tags::$rodzaj_nieruchomosci, tags::$status, tags::$telefon, tags::$rodzaj_medium), 
                MediaDAL::$id_media_nieruchomosc, 'media_nieruchomosc_id', null);
                echo '</form>';
            }
            else
            {
                UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$szukaj_w_mediach));                
                echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'"><table><tr>';
                KontrolkiHtml::DodajHidden(NieruchomoscDAL::$oferent, NieruchomoscDAL::$oferent, $oferent);
                KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_oferta, NieruchomoscDAL::$id_oferta, $oferta_id);
                KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_nier_rodzaj, NieruchomoscDAL::$id_nier_rodzaj, $nier_rodz_id);
                KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_trans_rodzaj, NieruchomoscDAL::$id_trans_rodzaj, $trans_rodz_id);
                //KontrolkiHtml::DodajRadio('oferuje_poszukuje', array('id_oferuje', 'id_poszukuje'), array(tags::$oferuje, tags::$poszukuje), array(tags::$oferuje, tags::$poszukuje), '', false, $radio_dana, '<td>', '</td>');
                echo '<td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$telefon).' :</td><td>';
                KontrolkiHtml::DodajTextbox('telefon', 'id_telefon', '', 13, 10, '');
                echo '</td><td>';
                KontrolkiHtml::DodajSubmit('zatwierdz_kr_szukanie', 'id_zatwierdz_kr_szukanie', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zatwierdz).'.', '');
                echo '</td></tr></table>';
                echo '</form>';
            }
        }
        echo '<hr />';
        KontrolkiHtml::DodajSubmit('ok', 'id_ok', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zakoncz), 'onclick="window.close();"');
    }
    require('../../stopka.php');
?>
</body>
</html>
