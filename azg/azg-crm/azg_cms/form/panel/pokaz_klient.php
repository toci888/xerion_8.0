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
    
    if (!isset($_SESSION[$zalogowany]))
    {
        echo 'Nie jesteÅ› zalogowany.';
    }
    else
    {
        $tlumaczenia = cachejezyki::Czytaj();

        //przeczyszczenie ewentualnych zawislych sesji z pozostawionego samemu sobie formularza gdzies wczesniej - problem polega na tym, ze
        //sesja jest pamietana dla klienta nie oferty czy zapotrzebowania bo nie istnieja przy dodawaniu klienta; po 2 nalozenie sie tez byloby mozliwe ;/
        
        
        ///to chyba juz zbedne stad zakomentowac

        if (isset($_POST['zatwierdz_klient_d_o']))
        {
            $dal = new OsobaDAL(null);
            $wynik = $dal->PodajOsobaKlient($_POST[KlientDAL::$id_klient], $ilosc_wierszy);

            //dodanie_zapotrzebowanie.php
            UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wybor_osoby));
            $txt_button_dodaj = '';
            if ($_POST[$oferta_hidden] == tags::$oferta)
            {
                //echo '<form method="POST" action="dodanie_osoba_klient.php">';
                echo '<form method="POST" action="okresl_oferta.php">';
                $txt_button_dodaj = tags::$dodaj_oferte;
            }
            else
            {
                //echo '<form method="POST" action="dodanie_zapotrzebowanie.php">';
                echo '<form method="POST" action="okresl_oferta.php">';
                $txt_button_dodaj = tags::$dodaj_zapotrzebowanie;
            }
            KontrolkiHtml::DodajHidden(KlientDAL::$id_klient, KlientDAL::$id_klient, $_POST[KlientDAL::$id_klient]);
            KontrolkiHtml::DodajHidden($oferta_hidden, $oferta_hidden, $_POST[$oferta_hidden]);    //to jest array w opcji !! :P
            KontrolkiHtml::DodajRadioDb(KlientDAL::$id_osoba, $wynik, OsobaDAL::$id_osoba, array(OsobaDAL::$nazwisko, OsobaDAL::$imie), OsobaDAL::$id_osoba, '', true, null, '', '');
            KontrolkiHtml::DodajSubmit('zatwierdz_klient', 'id_zatwierdz_klient', $tlumaczenia->Tlumacz($_SESSION[$jezyk], $txt_button_dodaj), '');
            echo '</form>';
        }
        
        //ifa dla id klienta do sesji
        if (isset($_POST['pokaz_klient']))
        {
            //$_SESSION[KlientDAL::$id_klient] = $_POST['klient_id'];
            //KontrolkiHtml::DodajPopUpButton($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$klient),'klient', 'edycja_osoba_klient.php?'.KlientDAL::$id_klient.'='.$_SESSION[KlientDAL::$id_klient], 1000, 700);
            //echo '<br/>';
            
            $dal = new KlientDAL(); 
            $tabParametr[KlientDAL::$id_osoba] = $_POST['osoba_id'];
            $wynik = $dal->OfertaKlient($tabParametr, $ilosc_wierszy);
            
            if ($ilosc_wierszy > 0)
            {
                UtilsUI::DodajTabWyroznien($status_nieaktualny, $czerwony);
                UtilsUI::DodajTabWyroznien($status_zawieszony, $niebieski);
                UtilsUI::DodajTabWyroznien($status_umowiony, $zielony);
                UtilsUI::DodajTabWyroznien($status_wstrzymany, $zolty);
                UtilsUI::PodajIndWyroznien(NieruchomoscDAL::$id_status);
                UtilsUI::$rekordy = $ilosc_wierszy;
                UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$oferty_klienta));
                echo '<form action= "edycja_oferta_szcz.php" method= "POST" target="_blank">';
                UtilsUI::WyswietlTab1Poz($wynik, 
                array(NieruchomoscDAL::$id_oferta, NieruchomoscDAL::$nazwisko, NieruchomoscDAL::$status, KlientDAL::$telefon, NieruchomoscDAL::$miejscowosc, NieruchomoscDAL::$cena, 
                NieruchomoscDAL::$transakcja_rodzaj, NieruchomoscDAL::$nieruchomosc_rodzaj), 
                array(tags::$nr_oferty, tags::$nazwisko, tags::$status, tags::$telefon, tags::$miejscowosc, tags::$cena, tags::$rodzaj_transakcja, tags::$rodzaj_nieruchomosci), 
                NieruchomoscDAL::$id_oferta, 'oferta_id', array(Akcja::$edycja => 1));
                echo '</form>';
                //tags::$nr_klienta, NieruchomoscDAL::$id_klient,
                
                //dodac przycisk umawianie na pokazywanie :) - ogolnie pokazywanie
                //jakie id osoby ??? co to za badziewie ?? dodac do linii popup - ogolnie formula tutaj musi byc inna - nalezy tylko pokazac istniejace pokazywania i chyba nic wiecej
                //KontrolkiHtml::DodajPopUpButton($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$pokazywanie), '', 'popup/pokazywanie.php?'.KlientDAL::$id_osoba.'='.$_POST['osoba_id'], 1000, 500);
                //kod ponizej wlozyc tam zeby wglad byl jednoczesny z ewentualnym umawianiem
                //w oknie pokazac wszystkich oferentow z telefonami - umawianie tyczy sie calego klienta, ewentualnie osob wchodzacych w sklad, umozliwic wybor
                /*
                
                */ 
            }
            
            $wynik = $dal->ZapotrzebowanieKlient($tabParametr, $ilosc_wierszy);
            
            $popupObj = new PopUpWysw();
            $popupObj->nag = array(tags::$oferty_ogladniete);
            $popupObj->przyc_nazwa = array(tags::$oferty_ogladniete);
            $popupObj->url = array('popup/lista_wskazan_adresowych_z.php?'.NieruchomoscDAL::$id_zapotrzebowanie); //podac tu id trans id nier ??
            $popupObj->szerokosc = array(1000);
            $popupObj->dlugosc = array(700);
            
            
            $dane_zagn = new ZagnWysw();
                
            $dane_zagn->nag = tags::$poszukuje;
            $dane_zagn->obj_nazwa = 'nieruchomoscDAL';
            $dane_zagn->obj_metoda = 'PodajTransNierZapotrzebowanie';
            $dane_zagn->ind_dane = array(NieruchomoscDAL::$id_zapotrzebowanie);
            $dane_zagn->ind_param = array(NieruchomoscDAL::$id_zapotrzebowanie);
            $dane_zagn->wysw_info = array(NieruchomoscDAL::$nieruchomosc_rodzaj, NieruchomoscDAL::$transakcja_rodzaj, NieruchomoscDAL::$cena, NieruchomoscDAL::$status);
            $dane_zagn->index = NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj;
            $dane_zagn->nad_index = tags::$numer_zapotrzebowania;
            $dane_zagn->popupobj = new PopUpWysw();
            
            $dane_zagn->popupobj->przyc_nazwa = array(tags::$pokaz, tags::$pokaz_skojarzenia);//, tags::$opis_zapotrzebowania);
            $dane_zagn->popupobj->url = array('popup/info_klient_zlecenie.php?'.NieruchomoscDAL::$id_zapotrzebowanie.'='.tags::$numer_zapotrzebowania.'&'.NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj, 
            'popup/skoj_of_standard.php?'.NieruchomoscDAL::$id_zapotrzebowanie.'='.tags::$numer_zapotrzebowania.'&'.NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj);//,
            $dane_zagn->popupobj->szerokosc = array(1000, 1000);
            $dane_zagn->popupobj->dlugosc = array(750, 750);
            $dane_zagn->popupobj->dod_index = array(array(NieruchomoscDAL::$id_klient => NieruchomoscDAL::$id_klient), array());

            if ($ilosc_wierszy > 0)
            {
                UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zlecenia_klienta)); 
                UtilsUI::$rekordy = $ilosc_wierszy;
                //echo '<form action="edycja_zapotrzebowania.php" method="POST">';
                echo '<form action="dodanie_trans_zap.php" method="POST" target="_blank">';
                UtilsUI::WyswietlTab1Poz($wynik, 
                array(NieruchomoscDAL::$id_zapotrzebowanie, NieruchomoscDAL::$imie, NieruchomoscDAL::$nazwisko, NieruchomoscDAL::$pesel, OsobaDAL::$telefon), 
                array(tags::$nr_zapotrzebowania, tags::$imie, tags::$nazwisko, tags::$pesel, tags::$telefon), NieruchomoscDAL::$id_zapotrzebowanie, 'zapotrzebowanie_id', 
                array(Akcja::$edycja => 1), null, null, $popupObj, null, $dane_zagn, array(NieruchomoscDAL::$id_klient => NieruchomoscDAL::$id_klient));
                echo '</form>';
            }
            /*if ($ilosc_wierszy > 0)
            {
                UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zlecenia_klienta));
                //echo '<form action="edycja_zapotrzebowania.php" method= "POST">';
                echo '<form action="dodanie_trans_zap.php" method= "POST" target="_blank">';
                UtilsUI::WyswietlTab1Poz($wynik, 
                array(NieruchomoscDAL::$id_zapotrzebowanie, NieruchomoscDAL::$imie, NieruchomoscDAL::$nazwisko, NieruchomoscDAL::$pesel, OsobaDAL::$telefon, OsobaDAL::$komorka), 
                array(tags::$id, tags::$imie, tags::$nazwisko, tags::$pesel, tags::$telefon, tags::$telefon_komorkowy), NieruchomoscDAL::$id_zapotrzebowanie, 'zapotrzebowanie_id', 
                array(Akcja::$edycja => 1), null, null, null, null, null, array(NieruchomoscDAL::$id_klient => NieruchomoscDAL::$id_klient));
                echo '</form>';
            } */
            $dal = new OsobaDAL($_POST['osoba_id']);
            $wynik = $dal->PodajKlientOsoba($ilosc_wierszy);
            
            //echo '<table><tr><td><form method="POST" action="dodanie_osoba_klient.php">'; //zmiany tu wykonac
            echo '<hr />';
            UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$otwieranie_nowych_zlecen));
            UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wybor_klienta));
            echo '<table><tr><td><form method="POST" action="'.$_SERVER['PHP_SELF'].'">'; 
            KontrolkiHtml::DodajRadioDb(KlientDAL::$id_klient, $wynik, 'id', 'nazwa', 'id_klof', '', true, null, '', '');            
            KontrolkiHtml::DodajHidden($oferta_hidden, $oferta_hidden, tags::$oferta);
            KontrolkiHtml::DodajSubmit('zatwierdz_klient_d_o', 'id_zatwierdz_klient', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$dodaj_oferte), ''); //zatwierdz klient dodawanie oferty
            echo '</form></td><td><form method="POST" action="'.$_SERVER['PHP_SELF'].'">';
            KontrolkiHtml::DodajRadioDb(KlientDAL::$id_klient, $wynik, 'id', 'nazwa', 'id_klzl', '', true, null, '', '');            
            KontrolkiHtml::DodajHidden($oferta_hidden, $oferta_hidden, tags::$zapotrzebowanie);
            KontrolkiHtml::DodajSubmit('zatwierdz_klient_d_o', 'id_zatwierdz_klient', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$dodaj_zapotrzebowanie), '');
            echo '</form></td></tr></table>';
            
            //zaciagnac i pokazac spotkania
            //spotkania z tytulu zapotrzebowania
            $wynik = $dal->PodajSpotkanieOsoba(array(OsobaDAL::$oferent => 'false'), $ilosc_wierszy);
            if ($ilosc_wierszy > 0)
            {
                UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zaplanowane_klientowi_ogladania));
                UtilsUI::$rekordy = $ilosc_wierszy;
                UtilsUI::WyswietlTab1Poz($wynik, array(OsobaDAL::$id_oferta, OsobaDAL::$id_zapotrzebowanie, OsobaDAL::$data, OsobaDAL::$godzina, NieruchomoscDAL::$agent, OsobaDAL::$umowienie), 
                array(tags::$nr_oferty, tags::$nr_zapotrzebowania, tags::$data, tags::$godzina, tags::$agent, tags::$cel_spotkania), OsobaDAL::$id_osoba, 'osoba_id', null);
            }
        }
        
        if (isset($_POST['nazwisko']))  
        {
            echo '<hr /><form method="POST" action="szukanie_klient.php">';
            KontrolkiHtml::DodajHidden('osobowosc_id', 'osobowosc_id', $_POST['osobowosc_id']);
            KontrolkiHtml::DodajHidden('nazwa_firma', 'nazwa_firma', $_POST['nazwa_firma']);
            KontrolkiHtml::DodajHidden('nazwisko', 'nazwisko', $_POST['nazwisko']);
            KontrolkiHtml::DodajHidden('pesel', 'pesel', $_POST['pesel']);
            KontrolkiHtml::DodajHidden('telefon', 'telefon', $_POST['telefon']);
            //KontrolkiHtml::DodajHidden('komorka', 'komorka', $_POST['komorka']);
            
            KontrolkiHtml::DodajSubmit('szukaj_klient','id_szukaj',$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$cofnij).'.','');
            
            echo '</form>';
        }
    }
    require('../stopka.php');

?>
</body>
</html>
