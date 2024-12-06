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
    include_once ('../../bll/listawskazanbll.php'); 
    include_once ('../../bll/agentbll.php');
    include_once ('../../bll/jezykibll.php');
    include_once ('../../bll/cache.php');
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
        //ze wzgledow bezpieczenstwa
        unset($_SESSION[NieruchomoscDAL::$id_oferta]);
        
        if (isset($_GET[NieruchomoscDAL::$id_oferta]))
        {
            $_SESSION[NieruchomoscDAL::$id_oferta] = $_GET[NieruchomoscDAL::$id_oferta];
        }
        if (isset($_POST[NieruchomoscDAL::$id_oferta]))
        {
            $_SESSION[NieruchomoscDAL::$id_oferta] = $_POST[NieruchomoscDAL::$id_oferta];
        }
        if (isset($_GET[NieruchomoscDAL::$id_zapotrzebowanie]))
        {
            $_SESSION[NieruchomoscDAL::$id_zapotrzebowanie] = $_GET[NieruchomoscDAL::$id_zapotrzebowanie];
        }
        if (isset($_POST[NieruchomoscDAL::$id_zapotrzebowanie]))
        {
            $_SESSION[NieruchomoscDAL::$id_zapotrzebowanie] = $_POST[NieruchomoscDAL::$id_zapotrzebowanie];
        }
        
        if (isset($_POST['dodaj']) && isset($_POST['spotkanie_id']) && isset($_SESSION[$pokazujace_os_of.$_SESSION[NieruchomoscDAL::$id_oferta]]))
        {
            ///pobieranie jest dlatego, ze godzin itd nie ma na formularzu, teraz to wlasciwie nie potrzbne ale niech se bedzie
            $dal = new ListaWskazanDAL();
            $tabParametr = array();
            $tabParametr[ListaWskazanDAL::$id_spotkanie] = $_POST['spotkanie_id'];
            $wynik = $dal->PodajSpotkanieEdycja($tabParametr);
            $wiersz = $wynik[0];
            //var_dump($wiersz);
            $tabParametr = array();
            ///akceptacja ogladania
            $tabParametr[ListaWskazanDAL::$id_oferta] = $_SESSION[NieruchomoscDAL::$id_oferta];
            $tabParametr[ListaWskazanDAL::$id_zapotrzebowanie] = $wiersz[ListaWskazanDAL::$id_zapotrzebowanie];
            $tabParametr[ListaWskazanDAL::$oferent] = 'true';
            $tabParametr[ListaWskazanDAL::$id_umowienie] = $ogladanie;
            $tabParametr[ListaWskazanDAL::$id_agent] = $agent_zal->id;
            $tabParametr[ListaWskazanDAL::$ogladanie_data] = $wiersz[ListaWskazanDAL::$data];
            $tabParametr[ListaWskazanDAL::$id_godzina] = $wiersz[ListaWskazanDAL::$id_godzina];
            $tabParametr[ListaWskazanDAL::$id_minuta] = $wiersz[ListaWskazanDAL::$id_minuta];
            $tabParametr[ListaWskazanDAL::$komentarz] = ''; //sparsowac
            $ob_pokaz_os = unserialize($_SESSION[$pokazujace_os_of.$_SESSION[NieruchomoscDAL::$id_oferta]]);
            $tab_osoby = $ob_pokaz_os->PodajOsoby($ilosc_wierszy);
            $tab_os = null;
            
            foreach ($tab_osoby as $klucz => $wartosc)
            {
                $tab_os[$wartosc[ListaWskazanDAL::$id_osoba]] = $wartosc[ListaWskazanDAL::$id_osoba];
            }
            $tabParametr[ListaWskazanDAL::$id_osoba] = $tab_os;
            
            if ($ilosc_wierszy > 0)
            {
                $wynik = $dal->DodajSpotkaniePomKal($tabParametr);
                if ($wynik['nazwa'] != null)
                {
                    echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], $wynik['nazwa']).'.<br />';
                }
            }
        }
        
        if (isset($_POST['osoba_id']) && isset($_POST['dodaj']) && isset($_SESSION[$pokazujace_os_of.$_SESSION[NieruchomoscDAL::$id_oferta]]))
        {
            $ob_pokaz_os = unserialize($_SESSION[$pokazujace_os_of.$_SESSION[NieruchomoscDAL::$id_oferta]]);
            $ob_pokaz_os->DodajOsoba($_POST['osoba_id']);
            $_SESSION[$pokazujace_os_of.$_SESSION[NieruchomoscDAL::$id_oferta]] = serialize($ob_pokaz_os);
        }
        if (isset($_POST['osoba_id']) && isset($_POST['kasowanie']) && isset($_SESSION[$pokazujace_os_of.$_SESSION[NieruchomoscDAL::$id_oferta]]))
        {
            $ob_pokaz_os = unserialize($_SESSION[$pokazujace_os_of.$_SESSION[NieruchomoscDAL::$id_oferta]]);
            $ob_pokaz_os->UsunOsoba($_POST['osoba_id']);
            $_SESSION[$pokazujace_os_of.$_SESSION[NieruchomoscDAL::$id_oferta]] = serialize($ob_pokaz_os);
        }
        
        
        echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$uzgadnianie_pokazywania_z_oferentem).'.<br />';
        
        
        if (isset($_SESSION[NieruchomoscDAL::$id_zapotrzebowanie])) ///id oferta ??? troche dziwnie albo i nie :P
        {            
            echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$numer_oferty).' : '.$_SESSION[NieruchomoscDAL::$id_oferta].'.<br />';
        
            $dal = new OsobaDAL(null);
            $tabParametr[OsobaDAL::$id_oferta] = $_SESSION[NieruchomoscDAL::$id_oferta];
            $wynik = $dal->PodajOsobaKlientOfId($tabParametr, $iloscWierszy); //podawanie osob dla klienta po id oferty :P
            
            if ($iloscWierszy > 0)
            {
                //obiekt osob pokazujacych 
                if (isset($_SESSION[$pokazujace_os_of.$_SESSION[NieruchomoscDAL::$id_oferta]]))
                {
                    //obiekt istnieje - deserializacja :)
                    $ob_pokaz_os = unserialize($_SESSION[$pokazujace_os_of.$_SESSION[NieruchomoscDAL::$id_oferta]]);
                    
                    $wynik_os_pokaz = $ob_pokaz_os->PodajOsoby($ilosc_wierszy);
                    if ($ilosc_wierszy > 0)
                    {
                        ///osoby pokazujace, obsluzyc kasowanie
                        UtilsUI::$rekordy = $ilosc_wierszy;
                        echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$osoby_pokazujace).':<br />';
                        echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'">';
                        KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_zapotrzebowanie, NieruchomoscDAL::$id_zapotrzebowanie, $_SESSION[NieruchomoscDAL::$id_zapotrzebowanie]);
                        KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_oferta, NieruchomoscDAL::$id_oferta, $_SESSION[NieruchomoscDAL::$id_oferta]);
                        UtilsUI::WyswietlTab1Poz($wynik_os_pokaz, 
                        array(NieruchomoscDAL::$id_osoba, NieruchomoscDAL::$imie, NieruchomoscDAL::$nazwisko, NieruchomoscDAL::$pesel), 
                        array(tags::$nr_osoby, tags::$imie, tags::$nazwisko, tags::$pesel), NieruchomoscDAL::$id_osoba, 'osoba_id', array(Akcja::$kasowanie => 1));
                        echo '</form>';
                    }
                }
                else
                {
                    //utworzenie nowego obiekta :P
                    $ob_pokaz_os = new OsobyPokazujace($wynik);
                    $_SESSION[$pokazujace_os_of.$_SESSION[NieruchomoscDAL::$id_oferta]] = serialize($ob_pokaz_os);
                }
                
                //pomeczyc problem ilosci wierszy
                UtilsUI::$rekordy = $iloscWierszy;
                echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$osoby_dostepne).':<br />';
                echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'">';
                KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_zapotrzebowanie, NieruchomoscDAL::$id_zapotrzebowanie, $_SESSION[NieruchomoscDAL::$id_zapotrzebowanie]);
                KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_oferta, NieruchomoscDAL::$id_oferta, $_SESSION[NieruchomoscDAL::$id_oferta]);
                UtilsUI::WyswietlTab1Poz($wynik, 
                array(NieruchomoscDAL::$id_osoba, NieruchomoscDAL::$imie, NieruchomoscDAL::$nazwisko, NieruchomoscDAL::$pesel, OsobaDAL::$telefon, OsobaDAL::$komorka), 
                array(tags::$nr_osoby, tags::$imie, tags::$nazwisko, tags::$pesel, tags::$telefon, tags::$telefon_komorkowy), NieruchomoscDAL::$id_osoba, 'osoba_id', array(Akcja::$dodawanie => 1));
                echo '</form>';
            }
            //mozna pomyslec o wywaleniu wszystkich umowien informacyjnie - moze kilku klientow bedzie tam chcialo ogladac, zeby nie dzwonic 2, 3 razy
            //trzeba wywalic na ekran rzeczy nie umowione zeby sie nie powielic w niektorych sytuacjach
            
            $tabParametr[OsobaDAL::$id_oferta] = $_SESSION[NieruchomoscDAL::$id_oferta];
            $wynik = $dal->PodajDostepneSpotkania($tabParametr, $ilosc_wierszy);
            
            if ($ilosc_wierszy > 0)
            {
                //ogladania przez klientow nie uzgodnione z oferentem jeszcze, ewentualne akcje na id oferty, gdyz o tego klienta przy akcjach sie troszczymy
                UtilsUI::$rekordy = $ilosc_wierszy;
                echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$pokazywania_nieuzgodnione).' :<br />';
                echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'">';
                KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_zapotrzebowanie, NieruchomoscDAL::$id_zapotrzebowanie, $_SESSION[NieruchomoscDAL::$id_zapotrzebowanie]);
                KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_oferta, NieruchomoscDAL::$id_oferta, $_SESSION[NieruchomoscDAL::$id_oferta]); 
                UtilsUI::WyswietlTab1Poz($wynik, array(NieruchomoscDAL::$id_oferta, NieruchomoscDAL::$id_klient, NieruchomoscDAL::$id_zapotrzebowanie, NieruchomoscDAL::$agent, NieruchomoscDAL::$data, 
                NieruchomoscDAL::$godzina), 
                array(tags::$nr_oferty, tags::$nr_klienta, tags::$nr_zapotrzebowania, tags::$agent, tags::$data, tags::$godzina), NieruchomoscDAL::$id_spotkanie, 'spotkanie_id', 
                array(Akcja::$dodawanie => 1)); // Akcja::$kasowanie => 1
                echo '</form>';
            }
            
            $tabParametr[OsobaDAL::$id_oferta] = $_SESSION[NieruchomoscDAL::$id_oferta];
            $tabParametr[OsobaDAL::$oferent] = 'true';
            $wynik = $dal->PodajSpotkanieOferta($tabParametr, $ilosc_wierszy);
            
            if ($ilosc_wierszy > 0)
            {
                //ogladania przez klientow nie uzgodnione z oferentem jeszcze, ewentualne akcje na id oferty, gdyz o tego klienta przy akcjach sie troszczymy
                UtilsUI::$rekordy = $ilosc_wierszy;
                echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$pokazywania_uzgodnione).' :<br />';
                UtilsUI::$rekordy = $ilosc_wierszy;
                UtilsUI::WyswietlTab1Poz($wynik, array(NieruchomoscDAL::$id_oferta, NieruchomoscDAL::$id_klient, NieruchomoscDAL::$id_zapotrzebowanie, NieruchomoscDAL::$agent, NieruchomoscDAL::$data, 
                NieruchomoscDAL::$godzina), 
                array(tags::$nr_oferty, tags::$nr_klienta, tags::$nr_zapotrzebowania, tags::$agent, tags::$data, tags::$godzina), NieruchomoscDAL::$id_spotkanie, 'spotkanie_id', 
                null); // Akcja::$kasowanie => 1 array(Akcja::$dodawanie => 1)
            }
        }
        
        ///ponizszy kod przyda sie do zwyklego umawiania .... (?? :P)
        
        /*unset($_SESSION[KlientDAL::$id_osoba]);
        $tlumaczenia = cachejezyki::Czytaj();
        
        if (isset($_GET[KlientDAL::$id_osoba]))
        {
            $_SESSION[KlientDAL::$id_osoba] = $_GET[KlientDAL::$id_osoba];
        }
        if (isset($_POST[KlientDAL::$id_osoba]))
        {
            $_SESSION[KlientDAL::$id_osoba] = $_POST[KlientDAL::$id_osoba];
        }
        
        if (isset($_SESSION[KlientDAL::$id_osoba]))
        {
            $dal = new OsobaDAL($_SESSION[KlientDAL::$id_osoba]);
            
            ///pobranie umowien na pokazywanie
            $wynik = $dal->PodajSpotkanieOsoba(array(OsobaDAL::$oferent => 'true'), $ilosc_wierszy);
            if ($ilosc_wierszy > 0)
            {
                UtilsUI::WyswietlTab1Poz($wynik, array(OsobaDAL::$id_klient, OsobaDAL::$data, OsobaDAL::$godzina, OsobaDAL::$umowienie), 
                array(tags::$nr_klienta, tags::$data, tags::$godzina, tags::$cel_spotkania), OsobaDAL::$id_osoba, 'osoba_id', null);
            }
            
            //podac pule klientow, na ktorych osoba jest zapisana ktorzy cos oferuja aktualnego co mozna umawiac
            
            $dalKl = new KlientDAL(); 
            $tabParametr[KlientDAL::$id_osoba] = $_SESSION[KlientDAL::$id_osoba];
            $tabParametr[NieruchomoscDAL::$id_status] = $status_nieaktualny;
            $wynik = $dalKl->OfertaKlient($tabParametr, $ilosc_wierszy);
            
            if ($ilosc_wierszy > 0)
            {
                //ewentualnie dodac popupbutton do zarzadzania klientem :)
                echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$oferty).' :<br />';
                echo '<form action= "'.$_SERVER['PHP_SELF'].'" method= "POST">';
                KontrolkiHtml::DodajHidden(KlientDAL::$id_osoba, KlientDAL::$id_osoba, $_SESSION[KlientDAL::$id_osoba]);
                UtilsUI::WyswietlTab1Poz($wynik, 
                array(NieruchomoscDAL::$id_oferta, NieruchomoscDAL::$imie, NieruchomoscDAL::$nazwisko, NieruchomoscDAL::$status, KlientDAL::$telefon, KlientDAL::$komorka, NieruchomoscDAL::$miejscowosc, NieruchomoscDAL::$cena, 
                NieruchomoscDAL::$transakcja_rodzaj, NieruchomoscDAL::$nieruchomosc_rodzaj), 
                array(tags::$nr_oferty, tags::$imie, tags::$nazwisko, tags::$status, tags::$telefon, tags::$telefon_komorkowy, tags::$miejscowosc, tags::$cena, tags::$rodzaj_transakcja, tags::$rodzaj_nieruchomosci), 
                NieruchomoscDAL::$id_oferta, 'oferta_id', null, array(tags::$umow), array('umow_ogl' => tags::$umow));
                echo '</form>';
            }
            
            //zrobic form dodania ogladania juz na konkretna oferte
        } */
    }
    require('../../stopka.php');

?>
</body>
</html>
