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
    include_once ('dal/utilsdal.php');
    include_once ('ui/kontrolki_html.php');
    include_once ('ui/utilsui.php');
    include_once ('bll/transnierbll.php');
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
        if ($_POST[KlientDAL::$id_klient])
        {
            $_SESSION[KlientDAL::$id_klient] = $_POST[KlientDAL::$id_klient];
        }
            //zniszczenie sesji z wyposazeniami jesliby czasem pamietalo z poprzedniejoferty (np. niedokonczonej)

            //pobranie tlumaczen z cache
            $tlumaczenia = cachejezyki::Czytaj();
            //utworzenie obiektu do komunikacji z baza danych w kontekscier nieruchomosci
            $nieruchomoscDal = new NieruchomoscDAL();
            //wczytanie danych agenta z sesji
            $agent_zal = unserialize($_SESSION[$dane_agent]);
            
            $obiektTrans = new TransNierDAL();
            $tabNieruchomosc = $obiektTrans->PodajListeNieruchomosci($ilosc_wierszy);
            
            //zdarzenie zatwierdzenia formularza, poslanie informacji do bazy danych
            if (isset($_POST['zatwierdz']))
            {
                $tabParametr[NieruchomoscDAL::$id_klient] = $_SESSION[NieruchomoscDAL::$id_klient];

                $tabParametr[NieruchomoscDAL::$data_otw_zlecenie] = $_POST['data_otw_zlec'];
                $tabParametr[NieruchomoscDAL::$data_zam_zlecenie] = $_POST['data_zam_zlec'];
                $tabParametr[NieruchomoscDAL::$prowizja] = $_POST['prowizja'];
                //region checkboxow
                if (isset($_POST['prowizja_proc']))
                {
                    $tabParametr[NieruchomoscDAL::$prow_proc] = true;
                }
                else
                {
                    $tabParametr[NieruchomoscDAL::$prow_proc] = false;
                }
                $wybNier = array();
                foreach ($tabNieruchomosc as $wiersz)
                {
                    if (isset($_POST['nieruchomosc'.$wiersz['id']]))
                    {
                        $wybNier[$wiersz['id']] = $wiersz['id'];
                    }
                }
                $tabParametr[NieruchomoscDAL::$nieruchomosc_rodzaj] = UtilsDAL::TabPhp2TabPg($wybNier, false, $tabParametr[NieruchomoscDAL::$nieruchomosc_rodzaj]);
                //koniec regionu checkboxow
                $tabParametr[NieruchomoscDAL::$agent] = (int)$agent_zal->id;
                $wynik = $nieruchomoscDal->DodajZapotrzebowanie($tabParametr);
                
                if (isset($wynik[0]))
                {
                    if ($wynik[0] != null)
                    {
                        $tabParametr = array();
                        $_SESSION[NieruchomoscDAL::$id_zapotrzebowanie] = $wynik[0];
                        //unset($_SESSION[NieruchomoscDAL::$id_klient]);
                        header('Location: dodanie_trans_zap.php?'.NieruchomoscDAL::$id_zapotrzebowanie.'='.$wynik[0].'&'.KlientDAL::$id_klient.'='.$_POST[KlientDAL::$id_klient]);
                    }
                }
            }
            if (isset($_POST['zatwierdz_klient']))
            {                
                //budowa formularza
                echo '<form action= "'.$_SERVER['PHP_SELF'].'" method= "POST">';
                KontrolkiHtml::DodajHidden(KlientDAL::$id_klient, KlientDAL::$id_klient, $_SESSION[KlientDAL::$id_klient]);
                echo '<table><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$agent).' :</td><td><b>'.$agent_zal->nazwa.'</b></td><td>';
                //dodanie przycisku do utworzenia nowego okna w ktorym odbywac sie bedzie zarzadzanie klientem
                //przez parametr get przy wywolaniu pliku edycja_klient.php podajemy id_klienta by moc pobrac go z bazy zaprezentowac i przetwarzac
                //sama nazwa paratemtry get jest brana ze statycznych zmiennych zdefiniowaqnych w klasie dala ze wzgledu na lepsze panowanie na nazwa zmiennej 
                //, latwiejszy dostep do niej, porzadek itd itd
                //przekazac tablice parametrow i namalowac te komba
                //KontrolkiHtml::DodajPopUpButton($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$klient),'klient', 'popup/edycja_klient.php?'.NieruchomoscDAL::$id_klient.'='.$_SESSION[NieruchomoscDAL::$id_klient], 1000, 700);
                echo '</td></tr></table><table><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$data_otw_zlec).' :</td><td>';
                KontrolkiHtml::DodajTextboxData('data_otw_zlec', 'id_data_otw_zlec', $data_dzienna, 10, 10, 
                $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podana_inf_nie_jest_data), 'SprawdzMniejszoscDaty(this, \'id_data_zam_zlec\', \''.
                $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$data_poczatkowa_wieksza_koncowa).'\');', '');
                echo '</td><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$data_zam_zlec).' :</td><td>';
                KontrolkiHtml::DodajTextboxDataPrzyszlosc('data_zam_zlec', 'id_data_zam_zlec', '', 10, 10, 
                $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podana_inf_nie_jest_data), 
                $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podano_data_przeszlosc), 'SprawdzWiekszoscDaty(this, \'id_data_otw_zlec\', \''.
                $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$data_koncowa_mniejsza_poczatkowa).'\');', '');
                //echo '</td><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$prowizja).' :</td><td>';
                //KontrolkiHtml::DodajLiczbaWymiernaTextbox('prowizja', 'id_prowizja', '', 6, 6, 'onblur="SprawdzZaznaczenieDlaProwizji(this, \'id_prowizja_proc\');"');
                //echo '</td><td>';
                //KontrolkiHtml::DodajCheckbox('prowizja_proc', 'id_prowizja_proc', true, $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$prowizja_proc), 
                //'onclick="return SprawdzWysokoscProwizji(this, \'id_prowizja\', \''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podana_prow_wyd_sie_liczba)
                //.'\', \''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podana_prow_wyd_sie_proc).'\');"');
                echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$poszukiwane_nieruchomosci).' :</td></tr></table><table><tr>';
                
                foreach ($tabNieruchomosc as $wiersz)
                {
                    echo '<td>';
                    KontrolkiHtml::DodajCheckbox('nieruchomosc'.$wiersz['id'], $wiersz['id'], false, $wiersz['nazwa'], '');
                    echo '</td>';
                }
                
                echo '</tr><tr><td>';                
                KontrolkiHtml::DodajSubmit('zatwierdz', 'id_zatwierdz', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zatwierdz), '');
                echo '</td></tr></table></form>';
            }
    }
    require('stopka.php');
?>
</body>
</html>