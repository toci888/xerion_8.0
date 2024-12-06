<?php 
    include_once ('ui/xajax.php');
?>
<HTML>
<HEAD>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <script language="javascript" src="js/script.js"></script>
<link href="css/style.css" rel="stylesheet" type="text/css">
<?php $xajax->printJavascript("lib/xajax/"); ?>
</head>                                                                                                                                                         
<body>
<?php
    // ¶ ±
    session_start();
    include_once ('dal/queriesDAL.php');
    include_once ('ui/kontrolki_html.php'); 
    include_once ('bll/tags.php'); 
    include_once ('bll/agentbll.php');
    include_once ('bll/jezykibll.php');
    include_once ('bll/cache.php');
    
    require('naglowek.php');
    require('conf.php');
    if (!isset($_SESSION[$zalogowany]))
    {
        echo 'Nie jesteÅ› zalogowany.';
    }
    else
    {
        if (isset($_GET[NieruchomoscDAL::$id_oferta]))
        {
            $_SESSION[NieruchomoscDAL::$id_oferta] = $_GET[NieruchomoscDAL::$id_oferta];
        }
        if ($_SERVER['REQUEST_METHOD'] == 'POST' || isset($_GET[NieruchomoscDAL::$id_oferta]))
        {
            
            //pobranie tlumaczen z cache
            $tlumaczenia = cachejezyki::Czytaj();
            //utworzenie obiektu do komunikacji z baza danych w kontekscier nieruchomosci
            $nieruchomoscDal = new NieruchomoscDAL();
            $agent_zal = unserialize($_SESSION[$dane_agent]);
            if (isset($_POST['zatwierdz']))
            {
                $_SESSION[NieruchomoscDAL::$id_nieruchomosc] = $_POST[NieruchomoscDAL::$id_nieruchomosc];
                
                $tabParametr[NieruchomoscDAL::$id_oferta] = $_SESSION[NieruchomoscDAL::$id_oferta];
                $tabParametr[NieruchomoscDAL::$cena] = $_POST['cena'];
                $tabParametr[NieruchomoscDAL::$id_status] = $_POST['status_id'];
                if (strlen($_POST['data_zam_zlec']) == 10)
                {
                    $tabParametr[NieruchomoscDAL::$data_zam_zlecenie] = '\''.$_POST['data_zam_zlec'].'\'';
                }
                else
                {
                    $tabParametr[NieruchomoscDAL::$data_zam_zlecenie] = 'null';
                }
                $tabParametr[NieruchomoscDAL::$prowizja] = $_POST['prowizja'];
                $tabParametr[NieruchomoscDAL::$agent] = (int)$agent_zal->id;
                if (isset($_POST['nier_szczeg_id']))
                {
                    $tabParametr[NieruchomoscDAL::$id_rodz_nier_szcz] = $_POST['nier_szczeg_id'];
                }
               if (isset($_POST['prowizja_proc']))
                {
                    $tabParametr[NieruchomoscDAL::$prow_proc] = true;
                }
                else
                {
                    $tabParametr[NieruchomoscDAL::$prow_proc] = false;
                }
                if (isset($_POST['wylacznosc']))
                {
                    $tabParametr[NieruchomoscDAL::$wylacznosc] = true;
                }
                else
                {
                    $tabParametr[NieruchomoscDAL::$wylacznosc] = false;
                }
                if (isset($_POST['pokaz']))
                {
                    $tabParametr[NieruchomoscDAL::$pokaz] = true;
                }
                else
                {
                    $tabParametr[NieruchomoscDAL::$pokaz] = false;
                }
                if (isset($_POST['rynek']))
                {
                    $tabParametr[NieruchomoscDAL::$rynek] = true;
                }
                else
                {
                    $tabParametr[NieruchomoscDAL::$rynek] = false;
                }
                $tabParametr[NieruchomoscDAL::$id_region_geog] = $_POST[NieruchomoscDAL::$id_region_geog];
                $tabParametr[NieruchomoscDAL::$ulica] = $_POST['ulica'];
                $tabParametr[NieruchomoscDAL::$ulica_net] = $_POST['ulica_net'];
                $tabParametr[NieruchomoscDAL::$kod] = $_POST['kod'];
                $tabParametr[NieruchomoscDAL::$id_rodz_trans] = $_POST['transakcja_nier_id'];
                if (isset($_POST['osoba_id']))
                {
                     $tabParametr[NieruchomoscDAL::$id_osoba] = $_POST['osoba_id'];
                                   
                }
                $tabParametr[NieruchomoscDAL::$podpis] = false;
                if (isset($_POST['podpis_cena']))
                {
                    $tabParametr[NieruchomoscDAL::$podpis] = true;    
                }
                $wynik = $nieruchomoscDal->DodajOferta($tabParametr);
                
                if (isset($wynik[NieruchomoscDAL::$id_oferta]))
                {
                    if ($wynik[NieruchomoscDAL::$id_oferta] != null)
                    {
                        echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_powiodla_sie).'.<br/>';
                        KontrolkiHtml::DodajSubmit('ok', 'id_ok', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zamknij), 'onclick="window.close();"');
                    }
                }
            }
            if (isset($_GET[NieruchomoscDAL::$id_oferta]))
            {
                //przypisanie id oferty do tablicy bedacej parametrem metody podajacej dane nieruchomosci do edycji
                $tabParametr[NieruchomoscDAL::$id_oferta] = $_SESSION[NieruchomoscDAL::$id_oferta];
                //wywolanie metody pobierajacej z bazy danych nieruchomosc przy pomocy id oferty
                $wynik = $nieruchomoscDal->EdycjaOferta($tabParametr, $iloscWierszy);
                
                //sprawdzenie czy cos zostalo pobrane (przy naglym padnieciu bazy moze nic nie przyjsc, ewentualnie procedura lezy z niewiadomych powodow)
                if($iloscWierszy == 1)
                {
                    //jesli zostal zwrocony 1 wiersz (zawsze bedzie 1 lub 0), przepisujemy wiersz 0 do nowej zmiennej
                    $wiersz = $wynik[0];
                    
                    $_SESSION[NieruchomoscDAL::$id_oferta] = $wiersz[NieruchomoscDAL::$id_oferta];
                    $_SESSION[NieruchomoscDAL::$id_nieruchomosc] = $wiersz[NieruchomoscDAL::$id_nieruchomosc];
                    
                    
                    echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$numer_oferty).' :'.$_SESSION[NieruchomoscDAL::$id_oferta].'.<br/>';
                    echo '<form action= "'.$_SERVER['PHP_SELF'].'" method= "POST">';
                    KontrolkiHtml::DodajHidden('oferta_id', 'oferta_id', $_SESSION[NieruchomoscDAL::$id_oferta]);
                    KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_nieruchomosc, NieruchomoscDAL::$id_nieruchomosc, $_SESSION[NieruchomoscDAL::$id_nieruchomosc]);
                    echo '<table><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$agent).' :</td><td><b>'.$wiersz[NieruchomoscDAL::$agent].'</b></td><td>';
                    //dodanie przycisku do utworzenia nowego okna w ktorym odbywac sie bedzie zarzadzanie klientem
                    //przez parametr get przy wywolaniu pliku edycja_klient.php podajemy id_klienta by moc pobrac go z bazy zaprezentowac i przetwarzac
                    //sama nazwa paratemtry get jest brana ze statycznych zmiennych zdefiniowaqnych w klasie dala ze wzgledu na lepsze panowanie na nazwa zmiennej 
                    //, latwiejszy dostep do niej, porzadek itd itd
                    
                    //tego klienta bym stad wysmerfowal
                    //KontrolkiHtml::DodajPopUpButton($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$klient),'klient', 'popup/edycja_klient.php?'.NieruchomoscDAL::$id_klient.'='.$wiersz[NieruchomoscDAL::$id_klient], 1000, 700);
                    echo '</td><td>';
                    KontrolkiHtml::DodajPopUpButton($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$lista_wskazan_adresowych), 'lista_wskazan', 'popup/lista_wskazan_adresowych_o.php?'.
                    NieruchomoscDAL::$id_oferta.'='.$_SESSION[NieruchomoscDAL::$id_oferta], 1000, 700);
                    echo '</td></tr></table>';   
                    $tabParametr[NieruchomoscDAL::$id_nier_rodzaj] = $wiersz[NieruchomoscDAL::$id_nier_rodzaj];
                    //ta sama procedura podaje nazwy transakcji dla oferowania i poszukiwania, dl aoferty podajemy oferte
                    $tabParametr[NieruchomoscDAL::$of_zap] = tags::$oferta;
                    
                    $iloscWierszySzczegNieruch = 0;
                    $szczegolyNier = $nieruchomoscDal->SzczegolyNieruchomosc($tabParametr, $iloscWierszySzczegNieruch);
                    $transakcjaNier = $nieruchomoscDal->TransakcjaNieruchomosc($tabParametr);
                    echo '<table><tr>';
                    if ($iloscWierszySzczegNieruch > 0)
                    {
                        echo '<td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$rodzaj_budynek).' :</td><td>';
                        KontrolkiHtml::DodajSelectDomWartId('nier_szczeg','id_nier_szczeg',$szczegolyNier,'nier_szczeg_id', $wiersz[NieruchomoscDAL::$id_rodz_nier_szcz], '','');
                        echo '</td>';
                    }
                    echo '<td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$rodzaj_transakcja).' :</td><td>';
                    KontrolkiHtml::DodajSelectDomWartId('transakcja_nier','id_transakcja_nier',$transakcjaNier,'transakcja_nier_id', $wiersz[NieruchomoscDAL::$id_rodz_trans], '','');
                    echo '</td><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$cena_transakcji).' :</td><td>';
                    KontrolkiHtml::DodajHidden('cena_akt', 'cena_akt', $wiersz[NieruchomoscDAL::$cena]);
                    KontrolkiHtml::DodajLiczbaCalkowitaTextbox('cena','id_cena', $wiersz[NieruchomoscDAL::$cena], 10, 10, 'onblur="PokazSchowajZmianaCena('.$wiersz[NieruchomoscDAL::$id_klient].');"');
                    echo '</td></tr><tr name="zmiana_cena" id="zmiana_cena" style="display:none;"><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zmiana_cena).' :</td><td name="osoby_combo" id="osoby_combo">';
                    echo '</td><td>';
                    KontrolkiHtml::DodajCheckbox('podpis_cena', 'id_podpis_cena', true, $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podpisano), '');
                    echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$status).' :</td><td>'; 
                    KontrolkiHtml::DodajSelectZrodSlownik('status', 'id_status', SlownikDAL::$status, 'status_id',$wiersz[NieruchomoscDAL::$id_status], '', '');            
                    echo '</td><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$data_otw_zlec).'</td><td>';
                    KontrolkiHtml::DodajTextboxData('data_otw_zlec', 'id_data_otw_zlec', $wiersz[NieruchomoscDAL::$data_otw_zlecenie], 10, 10, 
                    $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podana_inf_nie_jest_data), 'SprawdzMniejszoscDaty(this, \'id_data_zam_zlec\', \''.
                    $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$data_poczatkowa_wieksza_koncowa).'\');', '');
                    echo '</td><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$data_zam_zlec).'</td><td>';
                    KontrolkiHtml::DodajTextboxDataPrzyszlosc('data_zam_zlec', 'id_data_zam_zlec', $wiersz[NieruchomoscDAL::$data_zam_zlecenie], 10, 10, 
                    $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podana_inf_nie_jest_data), 
                    $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podano_data_przeszlosc), 'SprawdzWiekszoscDaty(this, \'id_data_otw_zlec\', \''.
                    $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$data_koncowa_mniejsza_poczatkowa).'\');', '');
                    echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$prowizja).'</td><td>';
                    KontrolkiHtml::DodajLiczbaWymiernaTextbox('prowizja', 'id_prowizja', $wiersz[NieruchomoscDAL::$prowizja], 6, 6, 'onblur="SprawdzZaznaczenieDlaProwizji(this, \'id_prowizja_proc\');"');
                    echo '</td><td>';
                    KontrolkiHtml::DodajCheckbox('prowizja_proc', 'id_prowizja_proc', $wiersz[NieruchomoscDAL::$prow_proc], $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$prowizja_proc), 
                    'onclick="return SprawdzWysokoscProwizji(this, \'id_prowizja\', \''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podana_prow_wyd_sie_liczba)
                    .'\', \''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podana_prow_wyd_sie_proc).'\');"');
                    echo '</td><td>';
                    KontrolkiHtml::DodajCheckbox('wylacznosc', 'id_wylacznosc', $wiersz[NieruchomoscDAL::$wylacznosc], $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wylacznosc), '');
                    echo '</td><td>';
                    KontrolkiHtml::DodajCheckbox('pokaz', 'id_pokaz', $wiersz[NieruchomoscDAL::$pokaz], $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$pokaz_na_stronie), '');
                    echo '</td><td>';
                    KontrolkiHtml::DodajCheckbox('rynek', 'id_rynek', $wiersz[NieruchomoscDAL::$rynek], $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$rynek_pierwotny), '');
                    echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$miejscowosc).' :</td><td>';
                    KontrolkiHtml::DodajPrzeszukiwanieKontrolka($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wybierz), 'wybierz', NieruchomoscDAL::$region, $wiersz[NieruchomoscDAL::$miejscowosc], NieruchomoscDAL::$id_region_geog, $wiersz[NieruchomoscDAL::$id_region_geog], 'popup/wybor_region_geog.php?txt='.NieruchomoscDAL::$region.'&hid='.NieruchomoscDAL::$id_region_geog, $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$miejscowosc));
                    echo '</td><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$lokalizacja).' :</td><td>';
                    KontrolkiHtml::DodajTextbox('ulica_net', 'id_ulica_net', $wiersz[NieruchomoscDAL::$ulica_net], 30, 15, '');
                    echo '</td><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$kod_pocztowy).' :</td><td>';
                    KontrolkiHtml::DodajKodPocztowyTextbox('kod', 'id_kod', $wiersz[NieruchomoscDAL::$kod], 6, 6, '', '');
                    echo '</td></tr><tr><td>';
                    KontrolkiHtml::DodajCheckbox('', '', false, '', 'onclick=PokazUkryjLokalizacja();');
                    echo '</td></tr><tr name="listwa_ulica" id="listwa_ulica" style="display: none;"><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$ulica).' :</td><td>';
                    KontrolkiHtml::DodajTextbox('ulica', 'id_ulica', $wiersz[NieruchomoscDAL::$ulica], 100, 20, '');
                    echo '</td></tr><tr><td>';
                    KontrolkiHtml::DodajSubmit('zatwierdz', 'id_zatwierdz', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zatwierdz), '');
                    echo '</td></tr></table></form>';
                }
            }
        }
    }
    require('stopka.php');

    
?>
</body>
</html>
