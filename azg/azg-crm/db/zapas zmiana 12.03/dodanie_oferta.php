<html><head><title>A.Z.Gwarancja - Baza Danych</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/style.css" rel="stylesheet" type="text/css"></head>
  <script language="javascript" src="js/script.js"></script>
<body>
<?php
    include_once ('bll/cache.php');
    include_once ('bll/agentbll.php');
    include_once ('bll/jezykibll.php');
    include_once ('bll/parametrynierbll.php');
    include_once ('dal/queriesDAL.php');
    include_once ('ui/kontrolki_html.php');
    include_once ('ui/utilsui.php');
    require('naglowek.php');
    require('conf.php');
    session_start();
    $tlumaczenia = cachejezyki::Czytaj();
    if (!isset($_SESSION[$zalogowany]))
    {
        echo 'Nie jesteś zalogowany.';
    }
    else
    {
        if (isset($_POST[$oferta_hidden]))
        {
            $_SESSION[$oferta_hidden] = $_POST[$oferta_hidden];
        }
        if (isset($_POST[KlientDAL::$id_klient]))
        {
            $_SESSION[KlientDAL::$id_klient] = $_POST[KlientDAL::$id_klient];
            //zniszczenie sesji z wyposazeniami jesliby czasem pamietalo z poprzedniejoferty (np. niedokonczonej) - do dokonczenia
            if (isset($_SESSION[NieruchomoscDAL::$id_oferta]))
                unset($_SESSION[$param_nier.$_SESSION[NieruchomoscDAL::$id_oferta]]);
            unset($_SESSION[NieruchomoscDAL::$id_oferta]);
            
            //pobranie tlumaczen z cache
            $tlumaczenia = cachejezyki::Czytaj();
            //utworzenie obiektu do komunikacji z baza danych w kontekscier nieruchomosci
            $nieruchomoscDal = new NieruchomoscDAL();
            //wczytanie danych agenta z sesji
            $agent_zal = unserialize($_SESSION[$dane_agent]);
            
            //zdarzenie zatwierdzenia formularza, poslanie informacji do bazy danych
            if (isset($_POST['zatwierdz_rodz_oferta']))
            {                
                //budowa formularza
                echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$dodawanie_nowej_oferty).', '.$_POST['nieruchomosci'].' : '.$_POST['transakcje'].'.<br />';
                echo '<form action= "dodanie_oferta_szcz.php" method= "POST">';
                KontrolkiHtml::DodajHidden(KlientDAL::$id_klient, KlientDAL::$id_klient, $_POST[KlientDAL::$id_klient]);
                KontrolkiHtml::DodajHidden(TransNierDAL::$id_nieruchomosc, TransNierDAL::$id_nieruchomosc, $_POST['nier_rodzaj_id']);
                KontrolkiHtml::DodajHidden(TransNierDAL::$id_transakcja, TransNierDAL::$id_transakcja, $_POST['trans_rodzaj_id']);
                
                KontrolkiHtml::DodajHidden($oferta_hidden, $oferta_hidden, $_POST[$oferta_hidden]);
                
                echo '<table><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$agent).' :</td><td><b>'.$agent_zal->nazwa.'</b></td><td>';
                //dodanie przycisku do utworzenia nowego okna w ktorym odbywac sie bedzie zarzadzanie klientem
                //przez parametr get przy wywolaniu pliku edycja_klient.php podajemy id_klienta by moc pobrac go z bazy zaprezentowac i przetwarzac
                //sama nazwa paratemtry get jest brana ze statycznych zmiennych zdefiniowaqnych w klasie dala ze wzgledu na lepsze panowanie na nazwa zmiennej 
                //, latwiejszy dostep do niej, porzadek itd itd
                //przekazac tablice parametrow i namalowac te komba
                echo '</td></tr></table>';   
                $tabParametr[NieruchomoscDAL::$id_nier_rodzaj] = $_POST['nier_rodzaj_id'];
                $tabParametr[NieruchomoscDAL::$of_zap] = $_POST[$oferta_hidden];
                
                $iloscWierszySzczegNieruch = 0;
                $szczegolyNier = $nieruchomoscDal->SzczegolyNieruchomosc($tabParametr, $iloscWierszySzczegNieruch);
                $transakcjaNier = $nieruchomoscDal->TransakcjaNieruchomosc($tabParametr);
                echo '<table><tr>';
                if ($iloscWierszySzczegNieruch > 0)
                {
                    echo '<td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$rodzaj_budynek).' :</td><td>';
                    KontrolkiHtml::DodajSelectDomWartId('nier_szczeg','id_nier_szczeg',$szczegolyNier,'nier_szczeg_id', '', '', '');
                    echo '</td>';
                }
                echo '<td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$rodzaj_transakcja).' :</td><td><b>'.$_POST['transakcje'];
                echo '</b></td><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$cena_transakcji).' :</td><td>';
                KontrolkiHtml::DodajLiczbaCalkowitaTextbox('cena','id_cena', '', 10, 10, '');
                echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$status).' :</td><td>';
                KontrolkiHtml::DodajSelectZrodSlownik('status', 'id_status', SlownikDAL::$status, 'status_id', null, '', '');            
                echo '</td><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$data_otw_zlec).'</td><td>';
                KontrolkiHtml::DodajTextboxData('data_otw_zlec', 'id_data_otw_zlec', $data_dzienna, 10, 10, 
                $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podana_inf_nie_jest_data), 'SprawdzMniejszoscDaty(this, \'id_data_zam_zlec\', \''.
                $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$data_poczatkowa_wieksza_koncowa).'\');', '');
                echo '</td><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$data_zam_zlec).'</td><td>';
                KontrolkiHtml::DodajTextboxDataPrzyszlosc('data_zam_zlec', 'id_data_zam_zlec', '', 10, 10, 
                $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podana_inf_nie_jest_data), 
                $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podano_data_przeszlosc), 'SprawdzWiekszoscDaty(this, \'id_data_otw_zlec\', \''.
                $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$data_koncowa_mniejsza_poczatkowa).'\');', '');
                echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$prowizja).'</td><td>';
                KontrolkiHtml::DodajLiczbaWymiernaTextbox('prowizja', 'id_prowizja', '', 6, 6, 'onblur="SprawdzZaznaczenieDlaProwizji(this, \'id_prowizja_proc\');"');
                echo '</td><td>';
                KontrolkiHtml::DodajCheckbox('prowizja_proc', 'id_prowizja_proc', true, $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$prowizja_proc), 
                'onclick="return SprawdzWysokoscProwizji(this, \'id_prowizja\', \''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podana_prow_wyd_sie_liczba)
                .'\', \''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podana_prow_wyd_sie_proc).'\');"');
                echo '</td><td>';
                KontrolkiHtml::DodajCheckbox('wylacznosc', 'id_wylacznosc', true, $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wylacznosc), '');
                echo '</td><td>';
                KontrolkiHtml::DodajCheckbox('pokaz', 'id_pokaz', true, $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$pokaz_na_stronie), '');
                echo '</td><td>';
                KontrolkiHtml::DodajCheckbox('rynek', 'id_rynek', false, $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$rynek_pierwotny), '');
                echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$miejscowosc).' :</td><td>';
                KontrolkiHtml::DodajPrzeszukiwanieKontrolka($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wybierz), 'wybierz', NieruchomoscDAL::$region, '', NieruchomoscDAL::$id_region_geog, '', 'popup/wybor_region_geog.php?txt='.NieruchomoscDAL::$region.'&hid='.NieruchomoscDAL::$id_region_geog, $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$miejscowosc));
                echo '</td><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$lokalizacja).' :</td><td>';
                KontrolkiHtml::DodajTextbox('ulica_net', 'id_ulica_net', '', 30, 20, '');
                echo '</td><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$kod_pocztowy).' :</td><td>';
                KontrolkiHtml::DodajKodPocztowyTextbox('kod', 'id_kod', '', 6, 6, '', '');
                echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$ulica).' :</td><td>';
                KontrolkiHtml::DodajTextbox('ulica', 'id_ulica', '', 100, 20, '');
                echo '</td></tr><tr><td>';
                KontrolkiHtml::DodajSubmit('zatwierdz_oferta', 'id_zatwierdz', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zatwierdz), '');
                echo '</td></tr></table></form>';
            }
        }
    }
    require('stopka.php');
?>
</body>
</html>