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
        
        $of_zap = null;
        $osoba_id = null;
        
        if (isset($_GET[$oferta_hidden]))
        {
            $of_zap = $_GET[$oferta_hidden];
        }
        if (isset($_GET[OsobaDAL::$id_osoba]))
        {
            $osoba_id = $_GET[OsobaDAL::$id_osoba];
        }
        if (isset($_POST[$oferta_hidden]))
        {
            $of_zap = $_POST[$oferta_hidden];
        }
        if (isset($_POST[OsobaDAL::$id_osoba]))
        {
            $osoba_id = $_POST[OsobaDAL::$id_osoba];
        }
        
        $dal = new MediaDAL();
        
        ///obsluga formularzy
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
            $tabParametr[MediaDAL::$komentarz] = $_POST['komentarz'];
            $tabParametr[NieruchomoscDAL::$id_agent] = $agent_zal->id;
            $tabParametr[OsobaDAL::$id_osoba] = $osoba_id;
            
            $wynik = $dal->DodajNieruchomoscMediaOs($tabParametr);

            if ($wynik['nazwa'] != null)
            {
                echo UtilsUI::InfoBlad($tlumaczenia->Tlumacz($_SESSION[$jezyk], $wynik['nazwa']));
            }
        }
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
        ///koniec obslugi formularzy
        
        if ($of_zap != null && $osoba_id != null)
        {            
            ////oferty/zapotrzebowania aktualnie dodane osobie            
            $wynik = $dal->MediaOsoba(array(OsobaDAL::$id_osoba => $osoba_id), $ilosc_wierszy);
            
            UtilsUI::$rekordy = $ilosc_wierszy;
            UtilsUI::$strona = 5;
            
            UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$oferty_zapotrzebowania_znajdujace_sie_w_mediach));
            echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'">';
            KontrolkiHtml::DodajHidden($oferta_hidden, $oferta_hidden, $of_zap);
            KontrolkiHtml::DodajHidden(OsobaDAL::$id_osoba, OsobaDAL::$id_osoba, $osoba_id);
            UtilsUI::WyswietlTab1Poz($wynik, array(MediaDAL::$id_media_nieruchomosc, NieruchomoscDAL::$nieruchomosc_rodzaj, NieruchomoscDAL::$transakcja_rodzaj, NieruchomoscDAL::$oferent, NieruchomoscDAL::$region, NieruchomoscDAL::$status, 
            NieruchomoscDAL::$data, MediaDAL::$przypomnienie, NieruchomoscDAL::$agent, MediaDAL::$telefon), 
            array(tags::$id, tags::$rodzaj_nieruchomosci, tags::$rodzaj_transakcja, tags::$oferent, tags::$miejscowosc, tags::$status, tags::$data, tags::$data_przypomnienia, tags::$agent, tags::$telefon), 
            MediaDAL::$id_media_nieruchomosc, 'media_nieruchomosc_id', array(Akcja::$edycja => 1));
            echo '</form><hr />';
            
            ///formularz dodawania nowej oferty sprzedazy - zakupu itd
            
            $obiektTrans = new TransNierDAL();
            $tabNier = $obiektTrans->PodajListeNieruchomosci($ilosc_wierszy);
            $tabTrans = $obiektTrans->PodajListeTransakcji(array(TransNierDAL::$of_zap => tags::$oferta), $ilosc_wierszy);
            if (isset($_POST['edycja']) && isset($_POST['media_nieruchomosc_id']))
            {
                $tabParametr[MediaDAL::$id_media_nieruchomosc] = $_POST['media_nieruchomosc_id'];
                $wynik = $dal->EdycjaNieruchomoscMedia($tabParametr);
                $wiersz = $wynik[0];
                UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$edycja_oferty_zapotrzebowania_w_mediach));
                echo '<table><tr><td>';
                echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'" name="edycja_media"><table>';
                KontrolkiHtml::DodajHidden($oferta_hidden, $oferta_hidden, $of_zap);
                KontrolkiHtml::DodajHidden(OsobaDAL::$id_osoba, OsobaDAL::$id_osoba, $osoba_id);
                KontrolkiHtml::DodajHidden('media_nieruchomosc_id', 'media_nieruchomosc_id', $_POST['media_nieruchomosc_id']);
                $radio_dana = tags::$poszukuje;
                
                if ($wiersz[NieruchomoscDAL::$oferent])
                {
                    $radio_dana = tags::$oferuje;
                }
                echo '<tr>';
                KontrolkiHtml::DodajRadio('oferuje_poszukuje', array('id_oferuje', 'id_poszukuje'), array(tags::$oferuje, tags::$poszukuje), array(tags::$oferuje, tags::$poszukuje), '', false, $radio_dana, '<td>', '</td>');
                echo '</tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$rodzaj_nieruchomosci).' :</td><td>';
                KontrolkiHtml::DodajSelectDomWartId('rodzaj_nier', 'id_rodzaj_nier', $tabNier, 'nier_rodzaj_id', $wiersz[NieruchomoscDAL::$id_nier_rodzaj], '', '', TransNierDAL::$id, TransNierDAL::$nazwa_nieruchomosc);
                echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$rodzaj_transakcja).' :</td><td>';
                KontrolkiHtml::DodajSelectDomWartId('rodzaj_trans', 'id_rodzaj_trans', $tabTrans, 'trans_rodzaj_id', $wiersz[MediaDAL::$id_trans_rodzaj], '', '');
                echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$miejscowosc).' :</td><td>';
                KontrolkiHtml::DodajPrzeszukiwanieKontrolka($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wybierz), 'wybierz', 'msc_nier', $wiersz[NieruchomoscDAL::$region], 'msc_id_nier', $wiersz[NieruchomoscDAL::$id_region_geog], 'wybor_dow_region_geog.php?txt=msc_nier&hid=msc_id_nier', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$miejscowosc));
                echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$ulica).' :</td><td>';
                KontrolkiHtml::DodajTextbox('ulica', 'id_ulica', $wiersz[NieruchomoscDAL::$ulica], 100, 25, '');
                echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$status).' :</td><td>';
                KontrolkiHtml::DodajSelectZrodSlownik('status', 'id_status', SlownikDAL::$status, 'status_id', $wiersz[NieruchomoscDAL::$id_status], '', '');
                echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$powierzchnia).' :</td><td>';
                KontrolkiHtml::DodajLiczbaWymiernaTextbox('powierzchnia', 'id_powierzchnia', $wiersz[MediaDAL::$powierzchnia], 10, 10, '');
                echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$cena).' :</td><td>';
                KontrolkiHtml::DodajLiczbaWymiernaTextbox('cena', 'id_cena', $wiersz[NieruchomoscDAL::$cena], 15, 10, '');
                echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$data_przypomnienia).' :</td><td>';
                KontrolkiHtml::DodajTextboxDataPrzyszlosc('data_przyp', 'id_data_przyp', $wiersz[MediaDAL::$przypomnienie], 10, 10, $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podana_inf_nie_jest_data), 
                $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podano_data_przeszlosc), '', '', 'edycja_media', '../');
                echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$opis_oferty).' :</td><td>';
                KontrolkiHtml::DodajTextArea('opis_nieruchomosc', 'id_opis_nieruchomosc', $wiersz[NieruchomoscDAL::$opis], 50, 5, '');
                echo '</td></tr><tr><td>';
                $tabPodpowiedzi = 'Array(\''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$miejscowosc).'\')';
                KontrolkiHtml::DodajSubmit('aktualizuj', 'id_aktualizuj', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$aktualizuj).'.', 'onclick="return WalidacjaFormularz(Array(msc_nier), '.$tabPodpowiedzi.', \''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$brak).' : \');"');
                echo '</td></tr></table></form>';
                echo '</td><td valign="top">';
                echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'"><table><tr><td>';
                echo '<iframe frameborder="0" marginheight="0" marginwidth="0" width="700" height="250" id="ramkakontakt" name="ramkakontakt" src="edycja_media_nier_kontakt.php?'.
                MediaDAL::$id_media_nieruchomosc.'='.$_POST['media_nieruchomosc_id'].'&'.NieruchomoscDAL::$id_status.'='.$wiersz[NieruchomoscDAL::$id_status].'" ></iframe>';
                //KontrolkiHtml::DodajPopUpButton($tlumaczenia->Tlumacz($_SESSION[$jezyk],tags::$kontakt), 'kontakt','edycja_media_nier_kontakt.php?'.MediaDAL::$id_media_nieruchomosc.'='.$_POST['media_nieruchomosc_id'], 800, 700);
                echo '</td></tr><tr><td>';
                KontrolkiHtml::DodajPopUpButton($tlumaczenia->Tlumacz($_SESSION[$jezyk],tags::$reklamowanie), 'reklamowanie','edycja_media_nier_reklamowanie.php?'.MediaDAL::$id_media_nieruchomosc.'='.$_POST['media_nieruchomosc_id'], 800, 700);
                echo '</td></tr><tr><td>';
                KontrolkiHtml::DodajPopUpButton($tlumaczenia->Tlumacz($_SESSION[$jezyk],tags::$pokaz_skojarzenia), 'skojarzenia','skojarzenia_media.php?'.MediaDAL::$id_media_nieruchomosc.'='.
                $_POST['media_nieruchomosc_id'].'&oferuje_poszukuje='.$radio_dana, 800, 700);
                echo '</td></tr></table></form>';
                echo '</td></tr></table>';
            }
            if (!isset($_POST['edycja']))
            {
                UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wprowadzanie_nieruchomosci_poszukiwanej_oferowanej));
                echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'" name="dodanie_media"><table>';
                KontrolkiHtml::DodajHidden($oferta_hidden, $oferta_hidden, $of_zap);
                KontrolkiHtml::DodajHidden(OsobaDAL::$id_osoba, OsobaDAL::$id_osoba, $osoba_id);
                echo '<tr>';
                KontrolkiHtml::DodajRadio('oferuje_poszukuje', array('id_oferuje', 'id_poszukuje'), array(tags::$oferuje, tags::$poszukuje), array(tags::$oferuje, tags::$poszukuje), '', false, $of_zap, '<td>', '</td>');
                echo '</tr>';
                echo '<tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$rodzaj_nieruchomosci).' :</td><td>';
                KontrolkiHtml::DodajSelectDomWartId('rodzaj_nier', 'id_rodzaj_nier', $tabNier, 'nier_rodzaj_id', null, '', '', TransNierDAL::$id, TransNierDAL::$nazwa_nieruchomosc);
                echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$rodzaj_transakcja).' :</td><td>';
                KontrolkiHtml::DodajSelectDomWartId('rodzaj_trans', 'id_rodzaj_trans', $tabTrans, 'trans_rodzaj_id', null, '', '');
                echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$miejscowosc).' :</td><td>';
                KontrolkiHtml::DodajPrzeszukiwanieKontrolka($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wybierz), 'wybierz', 'msc_nier', '', 'msc_id_nier', '', 'wybor_dow_region_geog.php?txt=msc_nier&hid=msc_id_nier', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$miejscowosc));
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
                $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podano_data_przeszlosc), '', '', 'dodanie_media', '../');
                echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$opis_oferty).' :</td><td>';
                KontrolkiHtml::DodajTextArea('opis_nieruchomosc', 'id_opis_nieruchomosc', '', 50, 5, '');
                echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$komentarz).' :</td><td>';
                KontrolkiHtml::DodajTextArea('komentarz', 'id_komentarz', '', 50, 5, '');
                echo '</td></tr><tr><td>';
                $tabPodpowiedzi = 'Array(\''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$miejscowosc).'\')';
                KontrolkiHtml::DodajSubmit('zatwierdz', 'id_zatwierdz', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zatwierdz).'.', 'onclick="return WalidacjaFormularz(Array(msc_nier), '.$tabPodpowiedzi.', \''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$brak).' : \');"');
                echo '</td></tr></table></form>';
            }
            
            echo '<hr />';
            KontrolkiHtml::DodajSubmit('ok', 'id_ok', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zakoncz), 'onclick="window.close();"');
        }
        
    }
    require('../../stopka.php');
?>
</body>
</html>
