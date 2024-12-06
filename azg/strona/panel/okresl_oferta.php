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
    include_once ('../bll/utilsbll.php');
    include_once ('../bll/parametrynierbll.php'); 
    include_once ('../bll/tags.php'); 
    include_once ('../bll/agentbll.php');
    include_once ('../bll/jezykibll.php');
    include_once ('../bll/cache.php');
    include_once ('../bll/transnierbll.php');
    include_once ('../bll/klientbll.php');
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
        $klient_id = null;
        $osoba_id = null;
        
        ///if post z osoba i klientem jest
        ///zweryfikowac, czy to nie spowoduje jakis bledow
        if (isset($_POST[KlientDAL::$id_klient]) && isset($_POST[KlientDAL::$id_osoba]))
        {
            $klient_id = $_POST[KlientDAL::$id_klient];
            $osoba_id = $_POST[KlientDAL::$id_osoba];
        }
        
        if (isset($_POST[KlientDAL::$klient]))
        {
            $dal = new KlientDAL();
            $wynik = $dal->DodajKlient(Utils::DeserializacjaPost($_POST[KlientDAL::$klient]));
            
            if(strlen($wynik[KlientDAL::$id]) > 0)
            {
                $klient_id = $wynik[KlientDAL::$id];
            }
            else
            {
                //echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_nie_powiodla_sie).'.<br />';
                UtilsUI::InfoBlad($tlumaczenia->Tlumacz($_SESSION[$jezyk], $wynik[KlientDAL::$nazwa]));
                unset($_POST['dodaj_osoba']);
            }
        }
        
        if (isset($_POST['dodaj_osoba']))
        {
            $dal = new OsobaDAL(null);
            $tabParametr[OsobaDAL::$id_agent] = $agent_zal->id;
            if (isset($_POST['imie_hid']))
            {
                if (strlen($_POST['imie_alt']) > 0)
                {
                    $tabParametr[OsobaDAL::$imie] = $_POST['imie_alt'];
                }
                else
                {
                    $tabParametr[OsobaDAL::$id_imie] = $_POST['imie_id'];
                }
            }
            else
            {
                $tabParametr[OsobaDAL::$id_imie] = $_POST['imie_id'];
            }
            $tabParametr[OsobaDAL::$nazwisko] = $_POST['nazwisko']; 
            $tabParametr[OsobaDAL::$nazwisko_rodowe] = $_POST['nazwisko_rodowe']; 
            $tabParametr[OsobaDAL::$pesel] = $_POST['pesel']; 
            if (strlen($_POST['msc_id_osoba']) > 0)
            { 
                $tabParametr[OsobaDAL::$id_region_geog] = $_POST['msc_id_osoba'];
            }
            $tabParametr[OsobaDAL::$kod] = $_POST['kod_pocztowy'];
            $tabParametr[OsobaDAL::$ulica] = $_POST['ulica'];
            $tabParametr[OsobaDAL::$nr_dom] = $_POST['numer_dom'];
            $tabParametr[OsobaDAL::$nr_mieszkanie] = $_POST['numer_miesz'];
            $tabParametr[OsobaDAL::$id_rodzaj_dowod_tozsamosc] = $_POST['rodzaj_dowod_tozsamosc_id'];
            $tabParametr[OsobaDAL::$nr_dowod] = $_POST['nr_dowod'];
            
            $tabParametr[OsobaDAL::$telefon] = array($_POST['telefon'], $_POST['telefon_opis']);
            
            if (strlen($_POST['telefon2']) > 0)
            {
                $tabParametr[OsobaDAL::$telefon][count($tabParametr[OsobaDAL::$telefon])] = $_POST['telefon2'];
                $tabParametr[OsobaDAL::$telefon][count($tabParametr[OsobaDAL::$telefon])] = $_POST['telefon_opis2'];
            }
            if (strlen($_POST['telefon3']) > 0)
            {
                $tabParametr[OsobaDAL::$telefon][count($tabParametr[OsobaDAL::$telefon])] = $_POST['telefon3'];
                $tabParametr[OsobaDAL::$telefon][count($tabParametr[OsobaDAL::$telefon])] = $_POST['telefon_opis3'];
            }
            
            if (strlen($_POST['telefon_kom']) > 0)
                $tabParametr[OsobaDAL::$komorka] = $_POST['telefon_kom'];
            if (strlen($_POST['adres_email']) > 0)
                $tabParametr[OsobaDAL::$email] = $_POST['adres_email'];
                
            //$tabParametr[OsobaDAL::$telefon_opis] = $_POST['telefon_opis'];
            $tabParametr[OsobaDAL::$komorka_opis] = $_POST['telefon_kom_opis'];
            $tabParametr[OsobaDAL::$email_opis] = $_POST['adres_email_opis'];
            $tabParametr[OsobaDAL::$id_klient] = $klient_id;

            $wynik = $dal->DodajOsoba($tabParametr);
            
            if (strlen($wynik[OsobaDAL::$id]) > 0)
            {
                UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$dodano_klienta));
                echo '<br />';
                $osoba_id = $wynik[OsobaDAL::$id];
            }   
            else
            {
                UtilsUI::InfoBlad($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_nie_powiodla_sie));
                UtilsUI::InfoBlad($tlumaczenia->Tlumacz($_SESSION[$jezyk], $wynik[OsobaDAL::$nazwa]));
            }
        }
            
        if (isset($_POST['osoba_id_dod']))
        {            
            if ($klient_id != null)
            {
                $dal = new OsobaDAL($_POST['osoba_id_dod']);
                $tabParametr[OsobaDAL::$id_klient] = $klient_id;
                $wynik = $dal->DodajOsobaKlient($tabParametr, true);
                
                if (!$wynik)
                {
                    UtilsUI::InfoBlad($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_nie_powiodla_sie));
                }
                else
                {
                    $osoba_id = $_POST['osoba_id_dod'];
                }
            } 
        }
        
        if ($klient_id != null && $osoba_id != null)
        {
            if ($_POST[$oferta_hidden] == tags::$oferta)
            {
                $obiektTrans = new TransNierDAL();
                $tabNier = $obiektTrans->PodajListeNieruchomosci($ilosc_wierszy);
                $tabTrans = $obiektTrans->PodajListeTransakcji(array(TransNierDAL::$of_zap => $_POST[$oferta_hidden]), $ilosc_wierszy);
                
                //UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$numer_klienta).' : '.$klient_id);
                UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wybierz_rodzaj_oferty));
                
                echo '<form method="POST" action="dodanie_oferta.php">';
                echo '<table><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$rodzaj_nieruchomosci);
                KontrolkiHtml::DodajHidden(KlientDAL::$id_klient, KlientDAL::$id_klient, $klient_id);
                KontrolkiHtml::DodajHidden(KlientDAL::$id_osoba, KlientDAL::$id_osoba, $osoba_id);
                KontrolkiHtml::DodajHidden($oferta_hidden, $oferta_hidden, $_POST[$oferta_hidden]); //ten hidden dalej nie powinien byc potrzebny
                echo ' : </td><td>'; 
                KontrolkiHtml::DodajSelectDomWartId('nieruchomosci', 'id_nieruchomosci', $tabNier, 'nier_rodzaj_id', null, '', '', TransNierDAL::$id, TransNierDAL::$nazwa_nieruchomosc);
                echo '</td><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$rodzaj_transakcja);
                echo ' : </td><td>';
                KontrolkiHtml::DodajSelectDomWartId('transakcje', 'id_transakcje', $tabTrans, 'trans_rodzaj_id', null, '', ''); //, TransNierDAL::$id_nieruchomosc, TransNierDAL::$nazwa_nieruchomosc);
                echo '</td><td>';
                KontrolkiHtml::DodajSubmit('zatwierdz_rodz_oferta','id_zatwierdz', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zatwierdz).'.','');
                echo '</td></tr></table></form>';
                
                echo '<hr /><form method="POST" action="powielenie_oferta.php">';
                KontrolkiHtml::DodajHidden(KlientDAL::$id_klient, KlientDAL::$id_klient, $klient_id);
                KontrolkiHtml::DodajHidden(KlientDAL::$id_osoba, KlientDAL::$id_osoba, $osoba_id);
                echo '<table><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$numer_oferty).' : </td><td>';
                KontrolkiHtml::DodajLiczbaCalkowitaTextbox('numer_oferta', 'id_numer_oferta', '', 6, 6, '');
                echo '</td><td>';
                KontrolkiHtml::DodajSubmit('powiel','id_powiel',$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$powiel).'.','');
                echo '</td></tr></table></form>';
            }
            else
            {
                //sprawdzic czy to tu potrzebne
                $nieruchomoscDal = new NieruchomoscDAL();
                //wczytanie danych agenta z sesji
            
            
                $obiektTrans = new TransNierDAL();
                $tabNieruchomosc = $obiektTrans->PodajListeNieruchomosci($ilosc_wierszy);
                
                UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$otwieranie_zlecenia));
                echo '<form action= "dodanie_zapotrzebowanie.php" method= "POST" name="dodanie_zapotrzebowanie">';
                KontrolkiHtml::DodajHidden(KlientDAL::$id_klient, KlientDAL::$id_klient, $klient_id);
                KontrolkiHtml::DodajHidden(KlientDAL::$id_osoba, KlientDAL::$id_osoba, $osoba_id);
                KontrolkiHtml::DodajHidden($oferta_hidden, $oferta_hidden, $_POST[$oferta_hidden]);
                
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
                $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$data_poczatkowa_wieksza_koncowa).'\');', '', 'dodanie_zapotrzebowanie');
                echo '</td><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$data_zam_zlec).' :</td><td>';
                KontrolkiHtml::DodajTextboxDataPrzyszlosc('data_zam_zlec', 'id_data_zam_zlec', '', 10, 10, 
                $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podana_inf_nie_jest_data), 
                $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podano_data_przeszlosc), 'SprawdzWiekszoscDaty(this, \'id_data_otw_zlec\', \''.
                $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$data_koncowa_mniejsza_poczatkowa).'\');', '', 'dodanie_zapotrzebowanie');
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
                    KontrolkiHtml::DodajCheckbox('nieruchomosc'.$wiersz['id'], $wiersz['id'], false, $tlumaczenia->Tlumacz($_SESSION[$jezyk], $wiersz['nazwa']), '');
                    echo '</td>';
                }
                
                echo '</tr><tr><td>';                
                KontrolkiHtml::DodajSubmit('zatwierdz', 'id_zatwierdz', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zatwierdz), '');
                echo '</td></tr></table></form>';
            }
        }
    }
    require('../stopka.php');

?>
</body>
</html>
