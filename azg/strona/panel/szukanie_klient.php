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
    $tlumaczenia = cachejezyki::Czytaj(); 
    if (!isset($_SESSION[$zalogowany]))
    {
        echo 'Nie jesteÅ› zalogowany.';
    }
    else
    {        
        //if (isset($_POST['szukaj_left']))
        if ($_SERVER['REQUEST_METHOD'] == 'POST')     //jesli ma zniknac ewentualnie to dorzucac != isset jakis post, lub obslugiwac w innym pliku wywolanie
        {
            $osobowosc = null;
            //$numer_klient = null;
            $nazwa_firma = null;
            $nazwisko = null;
            $pesel = null;
            $telefon = null;
            $komorka = null;
            if (isset($_POST['nazwa_firma']))
            {
                $osobowosc = $_POST['osobowosc_id'];
                //$numer_klient = $_POST['numer_klient'];
                $nazwa_firma = $_POST['nazwa_firma'];
                $nazwisko = $_POST['nazwisko'];
                $pesel = $_POST['pesel'];
                $telefon = $_POST['telefon'];
                //$komorka = $_POST['komorka'];
            }
            //<td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$numer_klienta).' :</td>
            UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$szukanie_klienta)); 
            echo '<form action= "'.$_SERVER['PHP_SELF'].'" method= "POST"><table><tr><td>'.
            $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$osobowosc).' :</td><td name="firma_text" id="firma_text">'.
            $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nazwa_firma).' :</td><td>'.
            $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nazwisko).' :</td><td>'.
            $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$pesel).' :</td><td>'.
            $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$telefon).' :</td><td></tr><tr><td>';
            //$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$telefon_komorkowy).' :</td><td></tr><tr><td>';
            //zakaldamy ze z bazy moze przyjsc slownik osobowosci (az 2 elementowy) pokrecony, parametr 5 - null pozwoli 1 wpisywana wartosc
            //do pola rozwijalnego umiescic w hiddenie
            KontrolkiHtml::DodajSelectZrodSlownik('osobowosc', 'id_but_osobowosc', SlownikDAL::$osobowosc, 'osobowosc_id', $osobowosc, '', 'onchange="FormularzOsPrOsFiz(this.options[this.selectedIndex].id, '.$osoba_prawna.');"');
            //echo '</td><td>';
            //KontrolkiHtml::DodajLiczbaCalkowitaTextbox('numer_klient', 'id_numer_klient', $numer_klient, 10, 10, '');
            echo '</td><td name="firma_input" id="firma_input">';
            KontrolkiHtml::DodajTextbox('nazwa_firma', 'id_nazwa_firma', $nazwa_firma, 20, 20, '');
            echo '</td><td>';
            KontrolkiHtml::DodajTextbox('nazwisko', 'id_nazwisko', $nazwisko, 20, 20, '');
            echo '</td><td>';
            KontrolkiHtml::DodajTextbox('pesel', 'id_pesel', $pesel, 15, 15, '');
            echo '</td><td>';
            KontrolkiHtml::DodajTextbox('telefon', 'id_telefon', $telefon, 15, 15, '');
            //echo '</td><td>';
            //KontrolkiHtml::DodajTextbox('komorka', 'id_komorka', $komorka, 15, 15, '');
            echo '</td></tr><tr><td>';
            KontrolkiHtml::DodajSubmit('szukaj_klient','id_szukaj',$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$szukaj).'.','');
            echo '</td></tr></table></form>';
            echo '<script>FormularzOsPrOsFiz(osobowosc_id.value, '.$osoba_prawna.');</script>';
        }
        if (isset($_POST['szukaj_klient']))
        {
            $tabParametr[KlientDAL::$id_osobowosc] = $_POST['osobowosc_id'];
            //$tabParametr[KlientDAL::$id_klient] = $_POST['numer_klient'];
            $tabParametr[KlientDAL::$nazwa_firma] = $_POST['nazwa_firma'];
            $tabParametr[KlientDAL::$nazwisko] = $_POST['nazwisko'];
            $tabParametr[KlientDAL::$pesel] = $_POST['pesel'];
            $tabParametr[KlientDAL::$telefon] = $_POST['telefon'];
            //$tabParametr[KlientDAL::$komorka] = $_POST['komorka'];
            
            $dal = new KlientDAL();
            $wynik = $dal->SzukajKlient($tabParametr, $ilosc_wierszy);
            
            if ($ilosc_wierszy > 0)
            {
                echo '<hr />';
                UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$znalezieni_klienci));
                UtilsUI::$strona = 15;
                UtilsUI::$rekordy = $ilosc_wierszy;
                echo '<form method="POST" action="pokaz_klient.php">';
                
                KontrolkiHtml::DodajHidden('osobowosc_id', 'osobowosc_id', $_POST['osobowosc_id']);
                KontrolkiHtml::DodajHidden('nazwa_firma', 'nazwa_firma', $_POST['nazwa_firma']);
                KontrolkiHtml::DodajHidden('nazwisko', 'nazwisko', $_POST['nazwisko']);
                KontrolkiHtml::DodajHidden('pesel', 'pesel', $_POST['pesel']);
                KontrolkiHtml::DodajHidden('telefon', 'telefon', $_POST['telefon']);
                //KontrolkiHtml::DodajHidden('komorka', 'komorka', $_POST['komorka']);
                
                //KontrolkiHtml::DodajHidden('zapotrzebowanie_id', 'zapotrzebowanie_id', $_SESSION[NieruchomoscDAL::$id_zapotrzebowanie]);
                if ($_POST['osobowosc_id'] == $osoba_prawna)
                {
                    UtilsUI::WyswietlTab1Poz($wynik, array(KlientDAL::$id_klient, KlientDAL::$nazwa_firma, KlientDAL::$nazwisko, KlientDAL::$imie, KlientDAL::$pesel, KlientDAL::$telefon, KlientDAL::$komorka), 
                    array(tags::$nr_klienta, tags::$nazwa_firma, tags::$nazwisko, tags::$imie, tags::$pesel, tags::$telefon, 
                    $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$telefon_komorkowy)), KlientDAL::$id_osoba, 'osoba_id', null, array(tags::$pokaz), array('pokaz_klient' => tags::$pokaz), 
                    null, null, null, array(KlientDAL::$id_klient => KlientDAL::$id_klient));
                }
                else
                {
                    UtilsUI::WyswietlTab1Poz($wynik, array(KlientDAL::$id_klient, KlientDAL::$nazwisko, KlientDAL::$imie, KlientDAL::$pesel, KlientDAL::$telefon, KlientDAL::$komorka), 
                    array(tags::$nr_klienta, tags::$nazwisko, tags::$imie, tags::$pesel, tags::$telefon, 
                    $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$telefon_komorkowy)), KlientDAL::$id_osoba, 'osoba_id', null, array(tags::$pokaz), array('pokaz_klient' => tags::$pokaz), 
                    null, null, null, array(KlientDAL::$id_klient => KlientDAL::$id_klient));
                }
                echo '</form>';
            }
        }
    }
    require('../stopka.php');

?>
</body>
</html>
