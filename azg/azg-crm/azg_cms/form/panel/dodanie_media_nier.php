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
        
        $nier_rodzaj_id = null;
        $trans_rodzaj_id = null;
        $medium_id = null;
        
        if (isset($_GET['nier_rodzaj_id']))
        {
            $nier_rodzaj_id = $_GET['nier_rodzaj_id'];
            $trans_rodzaj_id = $_GET['trans_rodzaj_id'];
            $medium_id = $_GET['medium_id'];
            
            UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$dodano_wpis));
        }
        
        if (isset($_POST['nier_rodzaj_id']))
        {
            $nier_rodzaj_id = $_POST['nier_rodzaj_id'];
            $trans_rodzaj_id = $_POST['trans_rodzaj_id'];
            $medium_id = $_POST['medium_id'];
        }
        
        if (isset($_POST['zatwierdz']))
        {
            if ($_POST['oferuje_poszukuje'] == tags::$oferuje)
            {
                $tabParametr[NieruchomoscDAL::$oferent] = 'true';
            }
            else
            {
                $tabParametr[NieruchomoscDAL::$oferent] = 'false';
            }
            
            $tabParametr[NieruchomoscDAL::$id_nier_rodzaj] = $_POST['nier_rodzaj_id'];
            $tabParametr[NieruchomoscDAL::$id_rodz_trans] = $_POST['trans_rodzaj_id'];
            $tabParametr[NieruchomoscDAL::$id_region_geog] = $_POST['msc_id_nier'];
            $tabParametr[NieruchomoscDAL::$id_status] = $_POST['status_id'];
            $tabParametr[NieruchomoscDAL::$ulica] = $_POST['ulica'];            
            $tabParametr[MediaDAL::$powierzchnia] = $_POST['powierzchnia'];
            $tabParametr[NieruchomoscDAL::$cena] = $_POST['cena'];
            $tabParametr[NieruchomoscDAL::$opis] = $_POST['opis_nieruchomosc'];
            $tabParametr[NieruchomoscDAL::$data] = $_POST['data_przyp'];
            $tabParametr[MediaDAL::$id_media_reklama] = $_POST['medium_id'];
            $tabParametr[MediaDAL::$komentarz] = $_POST['komentarz'];
            $tabParametr[NieruchomoscDAL::$id_agent] = $agent_zal->id;
            $tabParametr[NieruchomoscDAL::$nazwisko] = $_POST['nazwisko'];
            $tabParametr[NieruchomoscDAL::$imie] = $_POST['imie_id'];
            $tabParametr[MediaDAL::$telefon] = $_POST['telefon'];
            $tabParametr[MediaDAL::$telefon_opis] = $_POST['telefon_opis'];
            $tabParametr[MediaDAL::$email] = $_POST['adres_email'];
            $tabParametr[MediaDAL::$email_opis] = $_POST['adres_email_opis'];
            
            $dal = new MediaDAL();
            $wynik = $dal->DodajNieruchomoscMedia($tabParametr);

            if ($wynik['nazwa'] != null)
            {
                echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], $wynik['nazwa']).'.<br />';
            }
            if ($wynik['id'] != null && !isset($_POST['automat']))
            {
                echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_powiodla_sie).'.<br />';
                //przeniesienie bezposrednio do edycji
                header('Location: http://'.$_SERVER['SERVER_NAME'].'/panel/edycja_media_nier.php?media_nieruchomosc_id='.$wynik['id']);
            }
            if (isset($_POST['automat']))
            {
                header('Location: http://'.$_SERVER['SERVER_NAME'].'/panel/dodanie_media_nier.php?medium_id='.$medium_id.'&trans_rodzaj_id='.$trans_rodzaj_id.'&nier_rodzaj_id='.$nier_rodzaj_id);
            }
        } 
        
        $obiektTrans = new TransNierDAL();
        $tabNier = $obiektTrans->PodajListeNieruchomosci($ilosc_wierszy);
        $tabTrans = $obiektTrans->PodajListeTransakcji(array(TransNierDAL::$of_zap => tags::$oferta), $ilosc_wierszy);
            
        echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$dodawanie_nieruchomosci_z_mediow).' : ';
        echo '<form method="POST" name="'.tags::$dodawanie_nieruchomosci_z_mediow.'" action="'.$_SERVER['PHP_SELF'].'"><table>';
        echo '<tr>';
        KontrolkiHtml::DodajRadio('oferuje_poszukuje', array('id_oferuje', 'id_poszukuje'), array(tags::$oferuje, tags::$poszukuje), array(tags::$oferuje, tags::$poszukuje), '', false, null, '<td>', '</td>');
        echo '</tr>';
        echo '<tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$rodzaj_medium).' :</td><td>';
        KontrolkiHtml::DodajSelectZrodSlownik('medium', 'id_medium', SlownikDAL::$media_reklama, 'medium_id', $medium_id, '', '');
        echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$rodzaj_nieruchomosci).' :</td><td>';
        KontrolkiHtml::DodajSelectDomWartId('rodzaj_nier', 'id_rodzaj_nier', $tabNier, 'nier_rodzaj_id', $nier_rodzaj_id, '', '', TransNierDAL::$id, TransNierDAL::$nazwa_nieruchomosc);
        echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$rodzaj_transakcja).' :</td><td>';
        KontrolkiHtml::DodajSelectDomWartId('rodzaj_trans', 'id_rodzaj_trans', $tabTrans, 'trans_rodzaj_id', $trans_rodzaj_id, '', '');
        echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$miejscowosc).' :</td><td>';
        KontrolkiHtml::DodajPrzeszukiwanieKontrolka($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wybierz), 'wybierz', 'msc_nier', '', 'msc_id_nier', '', 'popup/wybor_dow_region_geog.php?txt=msc_nier&hid=msc_id_nier', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$miejscowosc));
        echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$ulica).' :</td><td>';
        KontrolkiHtml::DodajTextbox('ulica', 'id_ulica', '', 100, 25, '');
        echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$status).' :</td><td>';
        KontrolkiHtml::DodajSelectZrodSlownik('status', 'id_status', SlownikDAL::$status, 'status_id', null, '', '');
        echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$powierzchnia).' :</td><td>';
        KontrolkiHtml::DodajLiczbaWymiernaTextbox('powierzchnia', 'id_powierzchnia', '', 10, 10, '');
        echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$cena).' :</td><td>';
        KontrolkiHtml::DodajLiczbaWymiernaTextbox('cena', 'id_cena', '', 15, 10, '');
        echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$data_przypomnienia).' :</td><td>';
        KontrolkiHtml::DodajTextboxDataPrzyszlosc('data_przyp', 'id_data_przyp', '', 10, 10, $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podana_inf_nie_jest_data), 
        $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podano_data_przeszlosc), '', '', tags::$dodawanie_nieruchomosci_z_mediow);
        echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$imie).' :</td><td>';
        KontrolkiHtml::DodajSelectZrodSlownik('imie', 'id_sel_imie', SlownikDAL::$imie, 'imie_id', null, '', '');
        echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nazwisko).' :</td><td>';
        KontrolkiHtml::DodajTextbox('nazwisko', 'id_nazwisko', '', 30, 15, '');
        echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$telefon).' :</td><td>';
        KontrolkiHtml::DodajTelefonTextbox('telefon', 'id_telefon', '', 13, 10, '', '');
        echo '&nbsp;&nbsp;&nbsp;'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$opis).' : ';
        KontrolkiHtml::DodajTextbox('telefon_opis', 'id_telefon_opis', '', 20, 15, '');                
        echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$adres_email).' :</td><td>';
        KontrolkiHtml::DodajEmailTextbox('adres_email', 'id_adres_email', '', 20, 15, '', '');
        echo '&nbsp;&nbsp;&nbsp;'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$opis).' : ';
        KontrolkiHtml::DodajTextbox('adres_email_opis', 'id_adres_email_opis', '', 20, 15, '');
        echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$opis_oferty).' :</td><td>';
        KontrolkiHtml::DodajTextArea('opis_nieruchomosc', 'id_opis_nieruchomosc', '', 50, 5, '');
        echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$komentarz).' :</td><td>';
        KontrolkiHtml::DodajTextArea('komentarz', 'id_komentarz', '', 50, 5, '');
        echo '</td></tr><tr><td>';
        KontrolkiHtml::DodajCheckbox('automat', 'id_automat', true, $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wprowadzanie_masowe), '');
        //KontrolkiHtml::DodajRadio('automat_nieaut', array('id_oferuje', 'id_poszukuje'), array(tags::$oferuje, tags::$poszukuje), array(tags::$oferuje, tags::$poszukuje), '', false, null, '<td>', '</td>');
        echo '</td></tr><tr><td>';
        $tabPodpowiedzi = 'Array(\''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$rodzaj_medium).'\', \''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$miejscowosc).'\')';
        KontrolkiHtml::DodajSubmit('zatwierdz', 'id_zatwierdz', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zatwierdz).'.', 'onclick="return WalidacjaFormularz(Array(medium, msc_nier), '.$tabPodpowiedzi.', \''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$brak).' : \');"');
        echo '</td></tr></table></form>';                 
                        
                            
    }
    require('../stopka.php');

?>
</body>
</html>
