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
        
        if (isset($_GET['media_nieruchomosc_id']))
        {
            $_POST['media_nieruchomosc_id'] = $_GET['media_nieruchomosc_id'];
        }
        
        $dal = new MediaDAL();
        if (isset($_POST['aktualizuj']))
        {
            if ($_POST['oferuje_poszukuje'] == tags::$oferuje)
            {
                $tabParametr[NieruchomoscDAL::$oferent] = 'true';
            }
            else
            {
                $tabParametr[NieruchomoscDAL::$oferent] = 'false';
            }
            $tabParametr[MediaDAL::$id_media_reklama] = $_POST['media_nieruchomosc_id'];
            $tabParametr[NieruchomoscDAL::$id_nier_rodzaj] = $_POST['nier_rodzaj_id'];
            $tabParametr[NieruchomoscDAL::$id_rodz_trans] = $_POST['trans_rodzaj_id'];
            $tabParametr[NieruchomoscDAL::$id_region_geog] = $_POST['msc_id_nier'];
            $tabParametr[NieruchomoscDAL::$id_status] = $_POST['status_id'];
            $tabParametr[NieruchomoscDAL::$ulica] = $_POST['ulica'];            
            $tabParametr[MediaDAL::$powierzchnia] = $_POST['powierzchnia'];
            $tabParametr[NieruchomoscDAL::$cena] = $_POST['cena'];
            $tabParametr[NieruchomoscDAL::$opis] = $_POST['opis_nieruchomosc'];
            $tabParametr[NieruchomoscDAL::$data] = $_POST['data_przyp'];
            
            $wynik = $dal->UaktualnijMediaNieruchomosc($tabParametr);
            if (!$wynik)
            {
                UtilsUI::InfoBlad($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_nie_powiodla_sie));
            }
        }
        
        if (isset($_POST['dodaj_oferta']))
        if (strlen($_POST['dodaj_oferta']) > 0)
        {
            $tabParametr[MediaDAL::$id_media_nieruchomosc] = $_POST['media_nieruchomosc_id'];
            $tabParametr[MediaDAL::$id_of_zap] = $_POST['dodaj_oferta'];
            
            $rezultat = $dal->PrzyjetoZMediow($tabParametr);
            if ($rezultat[NieruchomoscDAL::$nazwa] != null)
            {
                UtilsUI::InfoBlad($tlumaczenia->Tlumacz($_SESSION[$jezyk], $rezultat[NieruchomoscDAL::$nazwa]));
            }
        }
        
        if (isset($_POST['media_nieruchomosc_id']))
        {
            $dal = new MediaDAL();
            $tabParametr[MediaDAL::$id_media_nieruchomosc] = $_POST['media_nieruchomosc_id'];
            $wynik = $dal->EdycjaNieruchomoscMedia($tabParametr);
            $wiersz = $wynik[0];
            $obiektTrans = new TransNierDAL();
            
            $disable = '';
            
            if ($wiersz[MediaDAL::$id_of_zap] != null)
            {
                if ($wiersz[NieruchomoscDAL::$oferent])
                {
                    UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podpisano_umowe_oferta_nr).': '.$wiersz[MediaDAL::$id_of_zap]);
                }
                else
                {
                    UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podpisano_umowe_zlecenie_nr).': '.$wiersz[MediaDAL::$id_of_zap]);
                }
                $disable = 'disabled';
            }
            
            $tabNier = $obiektTrans->PodajListeNieruchomosci($ilosc_wierszy);
            echo '<table><tr><td>';
            echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'" name="'.tags::$dodawanie_nieruchomosci_z_mediow.'"><table>';
            KontrolkiHtml::DodajHidden('media_nieruchomosc_id', 'media_nieruchomosc_id', $_POST['media_nieruchomosc_id']);
            $radio_dana = tags::$poszukuje;
            $combo_trans = tags::$zapotrzebowanie;
            if ($wiersz[NieruchomoscDAL::$oferent])
            {
                $radio_dana = tags::$oferuje;
                $combo_trans = tags::$oferta;
            }
            $tabTrans = $obiektTrans->PodajListeTransakcji(array(TransNierDAL::$of_zap => $combo_trans), $ilosc_wierszy);
            echo '<tr>';
            KontrolkiHtml::DodajRadio('oferuje_poszukuje', array('id_oferuje', 'id_poszukuje'), array(tags::$oferuje, tags::$poszukuje), array(tags::$oferuje, tags::$poszukuje), $disable, false, $radio_dana, '<td>', '</td>');
            echo '</tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$rodzaj_nieruchomosci).' :</td><td>';
            KontrolkiHtml::DodajSelectDomWartId('rodzaj_nier', 'id_rodzaj_nier', $tabNier, 'nier_rodzaj_id', $wiersz[NieruchomoscDAL::$id_nier_rodzaj], '', $disable, TransNierDAL::$id, TransNierDAL::$nazwa_nieruchomosc);
            echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$rodzaj_transakcja).' :</td><td>';
            KontrolkiHtml::DodajSelectDomWartId('rodzaj_trans', 'id_rodzaj_trans', $tabTrans, 'trans_rodzaj_id', $wiersz[MediaDAL::$id_trans_rodzaj], '', $disable);
            echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$miejscowosc).' :</td><td>';
            KontrolkiHtml::DodajPrzeszukiwanieKontrolka($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wybierz), 'wybierz', 'msc_nier', $wiersz[NieruchomoscDAL::$region], 'msc_id_nier', $wiersz[NieruchomoscDAL::$id_region_geog], 'popup/wybor_dow_region_geog.php?txt=msc_nier&hid=msc_id_nier', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$miejscowosc));
            echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$ulica).' :</td><td>';
            KontrolkiHtml::DodajTextbox('ulica', 'id_ulica', $wiersz[NieruchomoscDAL::$ulica], 100, 25, '');
            echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$status).' :</td><td>';
            KontrolkiHtml::DodajSelectZrodSlownik('status', 'id_status', SlownikDAL::$status, 'status_id', $wiersz[NieruchomoscDAL::$id_status], '', $disable);
            echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$powierzchnia).' :</td><td>';
            KontrolkiHtml::DodajLiczbaWymiernaTextbox('powierzchnia', 'id_powierzchnia', $wiersz[MediaDAL::$powierzchnia], 10, 10, '');
            echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$cena).' :</td><td>';
            KontrolkiHtml::DodajLiczbaWymiernaTextbox('cena', 'id_cena', $wiersz[NieruchomoscDAL::$cena], 15, 10, '');
            echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$data_przypomnienia).' :</td><td>';
            KontrolkiHtml::DodajTextboxDataPrzyszlosc('data_przyp', 'id_data_przyp', $wiersz[MediaDAL::$przypomnienie], 10, 10, $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podana_inf_nie_jest_data), 
            $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podano_data_przeszlosc), '', '', tags::$dodawanie_nieruchomosci_z_mediow);
            echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$opis_oferty).' :</td><td>';
            KontrolkiHtml::DodajTextArea('opis_nieruchomosc', 'id_opis_nieruchomosc', $wiersz[NieruchomoscDAL::$opis], 50, 5, '');
            echo '</td></tr>';
            if ($wiersz[MediaDAL::$id_of_zap] == null)
            {
                if ($wiersz[NieruchomoscDAL::$oferent])
                {
                    echo '<tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$przyjeto_jako_oferte_nr).' :</td><td>';
                    KontrolkiHtml::DodajTextbox('dodaj_oferta', 'id_oferta', '', 6, 6, '');
                    //echo '&nbsp;&nbsp;';
                    //KontrolkiHtml::DodajSubmit('dodaj_oferta', 'id_dodaj_oferta', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zatwierdz).'.', '');
                    echo '</td></tr>';
                }
                else
                {
                    echo '<tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$przyjeto_jako_zlecenie_nr).' :</td><td>';
                    KontrolkiHtml::DodajTextbox('dodaj_oferta', 'id_oferta', '', 6, 6, '');
                    //echo '&nbsp;&nbsp;';
                    //KontrolkiHtml::DodajSubmit('dodaj_oferta', 'id_dodaj_oferta', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zatwierdz).'.', '');
                    echo '</td></tr>';
                }
            }
            
            if ($wiersz[NieruchomoscDAL::$id_osoba])
            {
                echo '<tr><td><b>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nazwisko).':</b> '.$wiersz[OsobaDAL::$nazwisko].'</td>
                <td><b>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$imie).':</b> '.$wiersz[OsobaDAL::$imie].'</td></tr>';
            }
            
            echo '<tr><td>';
            $tabPodpowiedzi = 'Array(\''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$miejscowosc).'\')';
            KontrolkiHtml::DodajSubmit('aktualizuj', 'id_aktualizuj', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$aktualizuj).'.', 'onclick="return WalidacjaFormularz(Array(msc_nier), '.$tabPodpowiedzi.', \''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$brak).' : \');"');
            echo '</td></tr></table></form>';
            echo '</td><td>'; //valign="top"
            //po co ten 2 form ??
            echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'"><table><tr><td>';
            //echo '<script type="text/javascript">parent.window.document.getElementById("ramkabudynki").height = PodajDluzszySelect(\'id_rodz_bud\', \'id_rodz_bud_wyb\') * 13 + 130;</script>';
            echo '<iframe frameborder="0" marginheight="0" marginwidth="0" width="700" height="250" id="ramkakontakt" name="ramkakontakt" src="popup/edycja_media_nier_kontakt.php?'.
            MediaDAL::$id_media_nieruchomosc.'='.$_POST['media_nieruchomosc_id'].'&'.NieruchomoscDAL::$id_status.'='.$wiersz[NieruchomoscDAL::$id_status].'&'.NieruchomoscDAL::$id_osoba.'='.
            $wiersz[NieruchomoscDAL::$id_osoba].'" ></iframe>';
            //$_POST['media_nieruchomosc_id']
            //KontrolkiHtml::DodajPopUpButton($tlumaczenia->Tlumacz($_SESSION[$jezyk],tags::$kontakt), 'kontakt','popup/edycja_media_nier_kontakt.php?'.MediaDAL::$id_media_nieruchomosc.'='.$_POST['media_nieruchomosc_id'].'&'.
            //NieruchomoscDAL::$id_status.'='.$wiersz[NieruchomoscDAL::$id_status], 800, 700);
            echo '</td></tr><tr><td>';
            echo '<iframe frameborder="0" marginheight="0" marginwidth="0" width="700" height="250" id="ramkakontakt" name="ramkakontakt" src="popup/edycja_media_nier_telefon.php?'.
            MediaDAL::$id_media_nieruchomosc.'='.$_POST['media_nieruchomosc_id'].'" ></iframe>';
            //KontrolkiHtml::DodajPopUpButton($tlumaczenia->Tlumacz($_SESSION[$jezyk],tags::$telefon), 'telefon','popup/edycja_media_nier_telefon.php?'.MediaDAL::$id_media_nieruchomosc.'='.$_POST['media_nieruchomosc_id'], 800, 700);
            echo '</td></tr><tr><td>';
            KontrolkiHtml::DodajPopUpButton($tlumaczenia->Tlumacz($_SESSION[$jezyk],tags::$reklamowanie), 'reklamowanie','popup/edycja_media_nier_reklamowanie.php?'.MediaDAL::$id_media_nieruchomosc.'='.$_POST['media_nieruchomosc_id'], 800, 700);
            echo '</td></tr><tr><td>';
            KontrolkiHtml::DodajPopUpButton($tlumaczenia->Tlumacz($_SESSION[$jezyk],tags::$pokaz_skojarzenia), 'skojarzenia','popup/skojarzenia_media.php?'.MediaDAL::$id_media_nieruchomosc.'='.
            $_POST['media_nieruchomosc_id'].'&oferuje_poszukuje='.$radio_dana, 800, 700);
            echo '</td></tr></table></form>';
            echo '</td></tr></table>';
            
            echo '<hr /><form>';
            KontrolkiHtml::DodajSubmit('ok', 'id_ok', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zakoncz), 'onclick="window.close();"');
            echo '</form>';
        }
    }
    require('../stopka.php');

?>
</body>
</html>
