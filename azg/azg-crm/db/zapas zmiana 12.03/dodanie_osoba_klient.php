<HTML>
<HEAD>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <script language="javascript" src="js/script.js"></script>
<link href="css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<?php
    // ¶ ±
    session_start();
    include_once ('dal/queriesDAL.php');
    include_once ('ui/kontrolki_html.php');
    include_once ('ui/utilsui.php');
    include_once ('bll/parametrynierbll.php'); 
    include_once ('bll/tags.php'); 
    include_once ('bll/agentbll.php');
    include_once ('bll/jezykibll.php');
    include_once ('bll/cache.php');
    include_once ('bll/transnierbll.php');
    include_once ('bll/klientbll.php');
    require('naglowek.php');
    require('conf.php');
    
    if (!isset($_SESSION[$zalogowany]))
    {
        echo 'Nie jesteÅ› zalogowany.';
    }
    else
    {
        $tlumaczenia = cachejezyki::Czytaj();
        $agent_zal = unserialize($_SESSION[$dane_agent]);
        unset($_SESSION[NieruchomoscDAL::$id_oferta]);
        unset($_SESSION[KlientDAL::$id_klient]);
        
        //if (isset($_GET[KlientDAL::$id_klient]))
        //{
        //    $_SESSION[KlientDAL::$id_klient] = $_GET[KlientDAL::$id_klient];
        //}
        if (isset($_POST[KlientDAL::$id_klient]))
        {
            $_SESSION[KlientDAL::$id_klient] = $_POST[KlientDAL::$id_klient];
        }
        if (isset($_POST[$oferta_hidden]))
        {
            $_SESSION[$oferta_hidden] = $_POST[$oferta_hidden];
        }
        
        if (isset($_POST['zatwierdz_klient']))
        {
            $obiektTrans = new TransNierDAL();
            $tabNier = $obiektTrans->PodajListeNieruchomosci($ilosc_wierszy);
            $tabTrans = $obiektTrans->PodajListeTransakcji(array(TransNierDAL::$of_zap => $_SESSION[$oferta_hidden]), $ilosc_wierszy);
            
            //ewentualnie w zaleznosci od $_session [$oferta_hidden] dodanie zapotrzebowania powinno byc w action
            echo '<form method="POST" action="dodanie_oferta.php"><table><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$rodzaj_nieruchomosci);
            KontrolkiHtml::DodajHidden(KlientDAL::$id_klient, KlientDAL::$id_klient, $_SESSION[KlientDAL::$id_klient]);
            KontrolkiHtml::DodajHidden($oferta_hidden, $oferta_hidden, $_SESSION[$oferta_hidden]);
            echo ' : </td><td>'; 
            KontrolkiHtml::DodajSelectDomWartId('nieruchomosci', 'id_nieruchomosci', $tabNier, 'nier_rodzaj_id', null, '', '', TransNierDAL::$id, TransNierDAL::$nazwa_nieruchomosc);
            echo '</td><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$rodzaj_transakcja);
            echo ' : </td><td>';
            KontrolkiHtml::DodajSelectDomWartId('transakcje', 'id_transakcje', $tabTrans, 'trans_rodzaj_id', null, '', ''); //, TransNierDAL::$id_nieruchomosc, TransNierDAL::$nazwa_nieruchomosc);
            echo '</td><td>';
            KontrolkiHtml::DodajSubmit('zatwierdz_rodz_oferta','id_zatwierdz', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zatwierdz).'.','');
            echo '</td></tr></table></form>';
        }
        else
        {
            if (isset($_POST['aktualizuj_osoba']))
            {
                $dal = new OsobaDAL($_POST[OsobaDAL::$id_osoba]);
                $tabParametr[OsobaDAL::$id_osoba] = $_POST[OsobaDAL::$id_osoba];
                $tabParametr[OsobaDAL::$id_imie] = $_POST['imie_id'];
                $tabParametr[OsobaDAL::$nazwisko] = $_POST['nazwisko']; 
                $tabParametr[OsobaDAL::$nazwisko_rodowe] = $_POST['nazwisko_rodowe']; 
                $tabParametr[OsobaDAL::$pesel] = $_POST['pesel']; 
                //$tabParametr[NieruchomoscDAL::$nr_dowod] = $_POST['nr_dowod'];
                $tabParametr[OsobaDAL::$id_agent] = $agent_zal->id; 
                if (strlen($_POST['msc_id_osoba']) > 0)
                {
                    $tabParametr[OsobaDAL::$id_region_geog] = $_POST['msc_id_osoba']; 
                }
                $tabParametr[OsobaDAL::$kod] = $_POST['kod_pocztowy'];
                $tabParametr[OsobaDAL::$ulica] = $_POST['ulica'];
                $tabParametr[OsobaDAL::$nr_dom] = $_POST['numer_dom'];
                $tabParametr[OsobaDAL::$nr_mieszkanie] = $_POST['numer_miesz'];
                
                $wynik = $dal->DodajOsoba($tabParametr);
                
                if (strlen($wynik[OsobaDAL::$id]) > 0)
                {
                    echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_powiodla_sie).'.<br />';
                    if (isset($_POST['dodaj_jako_oferent']))
                    {
                        ///jesli edzie ustawiona sesja z oferta informacja prosto do bazy
                        ///przy dodawaniu osob przed dodaniem nieruchomosci nie ma takiej mozliwosci, wtedy cache'ujemy to info
                        if (isset($_SESSION[$osoby_nowe_zlecenie.$_SESSION[KlientDAL::$id_klient]]))
                        {
                            $osoby_zlecenie = unserialize($_SESSION[$osoby_nowe_zlecenie.$_SESSION[KlientDAL::$id_klient]]);
                        }
                        else
                        {
                            $osoby_zlecenie = new KlientBLL($_SESSION[KlientDAL::$id_klient]);
                        }
                        $osoby_zlecenie->DodajOsobaZlec($wynik[OsobaDAL::$id]);
                        
                        $_SESSION[$osoby_nowe_zlecenie.$_SESSION[KlientDAL::$id_klient]] = serialize($osoby_zlecenie);
                    }
                } 
                else
                {
                    echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_nie_powiodla_sie).'.<br />';
                    echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], $wynik[OsobaDAL::$nazwa]).'.<br />';
                }
            }
            
            if (isset($_POST['edycja']))
            {
                echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$edycja_osoby).' : <br />';
                $dal = new OsobaDAL($_POST['osoba_id']);
                //$tabParametr[NieruchomoscDAL::$id_osoba] = $_POST['osoba_id'];
                $wynik = $dal->EdycjaOsoba();
                $wiersz = $wynik[0];
                echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'"><table><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$imie).'</td><td>';
                //utworzenie hiddena wraz z id osoby
                KontrolkiHtml::DodajHidden(OsobaDAL::$id_osoba, OsobaDAL::$id_osoba, $_POST['osoba_id']);
                KontrolkiHtml::DodajHidden(KlientDAL::$id_klient, KlientDAL::$id_klient, $_SESSION[KlientDAL::$id_klient]);
                KontrolkiHtml::DodajHidden($oferta_hidden, $oferta_hidden, $_SESSION[$oferta_hidden]);
                
                KontrolkiHtml::DodajSelectZrodSlownik('imie', 'id_sel_imie', SlownikDAL::$imie, 'imie_id', $wiersz[OsobaDAL::$id_imie], '', '');
                echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nazwisko).'</td><td>';
                KontrolkiHtml::DodajTextbox('nazwisko', 'id_nazwisko', $wiersz[OsobaDAL::$nazwisko], 30, 30, ''); 
                //popup dokumenty
                echo '</td><td>';
                KontrolkiHtml::DodajPopUpButton($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$dokumenty), 'dokumenty', 'popup/dokumenty.php?'.OsobaDAL::$id_osoba.'='.$_POST['osoba_id'], 400, 200);
                //po popupie
                echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nazwisko_rodowe).'</td><td>';
                KontrolkiHtml::DodajTextbox('nazwisko_rodowe', 'id_nazwisko_rodowe', $wiersz[OsobaDAL::$nazwisko_rodowe], 30, 30, '');  
                //popup kontakt
                echo '</td><td>';
                KontrolkiHtml::DodajPopUpButton($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$kontakt), 'kontakt', 'popup/kontakt.php?'.OsobaDAL::$id_osoba.'='.$_POST['osoba_id'], 600, 350);
                //po popupie
                echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$pesel).'</td><td>';
                KontrolkiHtml::DodajTextbox('pesel', 'id_pesel', $wiersz[OsobaDAL::$pesel], 15, 15, '');
                echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$kod_pocztowy).' :</td><td>';
                KontrolkiHtml::DodajKodPocztowyTextbox('kod_pocztowy', 'id_kod_pocztowy', $wiersz[OsobaDAL::$kod], 6, 6, '', '');
                echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$miejscowosc).' :</td><td>';
                KontrolkiHtml::DodajPrzeszukiwanieKontrolka($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wybierz), 'wybierz', 'msc_osoba', $wiersz[OsobaDAL::$region], 'msc_id_osoba', $wiersz[OsobaDAL::$id_region_geog], 'popup/wybor_region_geog.php?txt=msc_osoba&hid=msc_id_osoba', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$miejscowosc));
                echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$ulica).' :</td><td>';
                KontrolkiHtml::DodajTextbox('ulica', 'id_ulica', $wiersz[OsobaDAL::$ulica], 40, 15, '');
                echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nr_dom).' :</td><td>';
                KontrolkiHtml::DodajLiczbaCalkowitaTextbox('numer_dom', 'id_numer_dom', $wiersz[OsobaDAL::$nr_dom], 10, 10, '');
                echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nr_mieszkanie).' :</td><td>';
                KontrolkiHtml::DodajLiczbaCalkowitaTextbox('numer_miesz', 'id_numer_miesz', $wiersz[OsobaDAL::$nr_mieszkanie], 10, 10, ''); 
                echo '</td></tr><tr><td>';
                //przekazanie do hiddena id tu wlasciwie jest niepotrzebne, gdyzono juz przy tworzeniu hiddena zostalo tam zapisane
                KontrolkiHtml::DodajSubmit('aktualizuj_osoba', $wiersz[OsobaDAL::$id_osoba], $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$aktualizuj).'.', '');
                echo '</td></tr></table></form><hr />';
            }
            if (isset($_POST['dodaj_osoba']))
            {
                $dal = new OsobaDAL(null);
                $tabParametr[OsobaDAL::$id_agent] = $agent_zal->id;
                $tabParametr[OsobaDAL::$id_imie] = $_POST['imie_id'];
                $tabParametr[OsobaDAL::$nazwisko] = $_POST['nazwisko']; 
                $tabParametr[OsobaDAL::$nazwisko_rodowe] = $_POST['nazwisko_rodowe']; 
                $tabParametr[OsobaDAL::$pesel] = $_POST['pesel']; 
                //$tabParametr[NieruchomoscDAL::$nr_dowod] = $_POST['nr_dowod'];
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
                if (strlen($_POST['telefon']) > 0)
                    $tabParametr[OsobaDAL::$telefon] = $_POST['telefon'];
                if (strlen($_POST['telefon_kom']) > 0)
                    $tabParametr[OsobaDAL::$komorka] = $_POST['telefon_kom'];
                if (strlen($_POST['adres_email']) > 0)
                    $tabParametr[OsobaDAL::$email] = $_POST['adres_email'];
                    
                $tabParametr[OsobaDAL::$telefon_opis] = $_POST['telefon_opis'];
                $tabParametr[OsobaDAL::$komorka_opis] = $_POST['telefon_kom_opis'];
                $tabParametr[OsobaDAL::$email_opis] = $_POST['adres_email_opis'];
                $tabParametr[OsobaDAL::$id_klient] = $_SESSION[NieruchomoscDAL::$id_klient];

                $wynik = $dal->DodajOsoba($tabParametr);
                
                if (strlen($wynik[OsobaDAL::$id]) > 0)
                {
                    echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_powiodla_sie).'.<br />';
                    if (isset($_POST['dodaj_jako_oferent']))
                    {
                        ///jesli edzie ustawiona sesja z oferta informacja prosto do bazy
                        ///przy dodawaniu osob przed dodaniem nieruchomosci nie ma takiej mozliwosci, wtedy cache'ujemy to info
                        if (isset($_SESSION[$osoby_nowe_zlecenie.$_SESSION[KlientDAL::$id_klient]]))
                        {
                            $osoby_zlecenie = unserialize($_SESSION[$osoby_nowe_zlecenie.$_SESSION[KlientDAL::$id_klient]]);
                        }
                        else
                        {
                            $osoby_zlecenie = new KlientBLL($_SESSION[KlientDAL::$id_klient]);
                        }
                        $osoby_zlecenie->DodajOsobaZlec($wynik[OsobaDAL::$id]);
                        
                        $_SESSION[$osoby_nowe_zlecenie.$_SESSION[KlientDAL::$id_klient]] = serialize($osoby_zlecenie);
                    }
                }   
                else
                {
                    echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_nie_powiodla_sie).'.<br />';
                    echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], $wynik[OsobaDAL::$nazwa]).'.<br />';
                }
            }
            
            if (isset($_POST['aktualizuj_klient']))
            {
                //unset($_SESSION[KlientDAL::$id_klient]);
                $agent_zal = unserialize($_SESSION[$dane_agent]);
                $dal = new KlientDAL();
                //skonstruowac tablice parametrow dla metody dodaj klient wywolywanej z obiektu $dal
                $tabParametr[KlientDAL::$id_klient] = $_SESSION[KlientDAL::$id_klient];
                $tabParametr[KlientDAL::$id_osobowosc] = $_POST['osobowosc_id']; 
                $tabParametr[KlientDAL::$nazwa_firma] = $_POST['nazwa_firma'];
                $tabParametr[KlientDAL::$id_agent] = $agent_zal->id;
                $tabParametr[KlientDAL::$nip] = $_POST['nip'];
                $tabParametr[KlientDAL::$regon] = $_POST['regon'];
                $tabParametr[KlientDAL::$krs] = $_POST['krs'];
                $tabParametr[KlientDAL::$kod_firma] = $_POST['kod_pocztowy_firma'];
                $tabParametr[KlientDAL::$id_region_geog_firma] = $_POST['msc_id_firma'];
                $tabParametr[KlientDAL::$ulica_firma] = $_POST['ulica_firma'];
                $tabParametr[KlientDAL::$nr_dom_firma] = $_POST['numer_dom_firma'];
                $tabParametr[KlientDAL::$nr_mieszkanie_firma] = $_POST['numer_miesz_firma'];

                $wynik = $dal->DodajKlient($tabParametr);
                if(strlen($wynik[KlientDAL::$id]) > 0)
                {
                    $_SESSION[KlientDAL::$id_klient] = $wynik[KlientDAL::$id];
                }
                else
                {
                    echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_nie_powiodla_sie).'.<br />';
                    echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], $wynik[KlientDAL::$nazwa]).'.<br />';
                }            
            }
            
            if (isset($_POST['zatwierdz']))
            {
                unset($_SESSION[KlientDAL::$id_klient]);
                $agent_zal = unserialize($_SESSION[$dane_agent]);
                $dal = new KlientDAL();
                //skonstruowac tablice parametrow dla metody dodaj klient wywolywanej z obiektu $dal
                $tabParametr[KlientDAL::$id_osobowosc] = $_POST['osobowosc_id']; 
                $tabParametr[KlientDAL::$nazwa_firma] = $_POST['nazwa_firma'];
                $tabParametr[KlientDAL::$id_agent] = $agent_zal->id;
                $tabParametr[KlientDAL::$nip] = $_POST['nip'];
                $tabParametr[KlientDAL::$regon] = $_POST['regon'];
                $tabParametr[KlientDAL::$krs] = $_POST['krs'];
                $tabParametr[KlientDAL::$kod_firma] = $_POST['kod_pocztowy_firma'];
                $tabParametr[KlientDAL::$id_region_geog_firma] = $_POST['msc_id_firma'];
                $tabParametr[KlientDAL::$ulica_firma] = $_POST['ulica_firma'];
                $tabParametr[KlientDAL::$nr_dom_firma] = $_POST['numer_dom_firma'];
                $tabParametr[KlientDAL::$nr_mieszkanie_firma] = $_POST['numer_miesz_firma'];

                $wynik = $dal->DodajKlient($tabParametr);
                if(strlen($wynik[KlientDAL::$id]) > 0)
                {
                    $_SESSION[KlientDAL::$id_klient] = $wynik[KlientDAL::$id];
                }
                else
                {
                    echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_nie_powiodla_sie).'.<br />';
                    echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], $wynik[KlientDAL::$nazwa]).'.<br />';
                }            
            }
            if (isset($_POST['edytuj_klient']))
            {
                $dal = new KlientDAL();
                $wynik = $dal->EdycjaKlient(array(KlientDAL::$id_klient => $_SESSION[KlientDAL::$id_klient]));
                ///sprawdzenie czy cos z bazy danych przywêdroewa³o (powinno to zawsze byc 1 wiersz jesli baza nie lezy lub zero jesli cos  na bazie sie dzieje, nigdy wiecej niz 1)
                if (isset($wynik[0]))
                {
                    //poniewaz wynik jest talica ale 1 elementowa mozna go uproscic do zmiennej, ostatecznie wewnatrz wyniku jest troche kompliakcji
                    $wiersz = $wynik[0];
                    echo '<form action= "'.$_SERVER['PHP_SELF'].'" method= "POST">';
                    KontrolkiHtml::DodajHidden(KlientDAL::$id_klient, KlientDAL::$id_klient, $_SESSION[KlientDAL::$id_klient]);
                    KontrolkiHtml::DodajHidden($oferta_hidden, $oferta_hidden, $_SESSION[$oferta_hidden]);
                    
                    echo '<table><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$osobowosc).' :</td><td>';
                    KontrolkiHtml::DodajSelectZrodSlownik('osobowosc', 'id_but_osobowosc', SlownikDAL::$osobowosc, 'osobowosc_id', $wiersz[KlientDAL::$id_osobowosc], '', 'onchange="PokazUkryjFirmaDane(this.options[this.selectedIndex].id, '.$osoba_prawna.', \'firma_dane\');"');
                    echo '</td><td>';
                    KontrolkiHtml::DodajPopUpButton($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$notatka), 'notatka', 'popup/notatka_klient.php?'.KlientDAL::$id_klient.'='.
                    $_SESSION[KlientDAL::$id_klient], 600, 600);
                    echo '</td></tr>';
                    if ($wiersz[KlientDAL::$id_osobowosc] == $osoba_prawna)
                    {
                        echo '<tr name="firma_dane1" id="firma_dane1"><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nazwa_firma).' :</td><td>';
                        KontrolkiHtml::DodajTextbox('nazwa_firma', 'id_nazwa_firma', $wiersz[KlientDAL::$nazwa_firma], 30, 50, '');
                        echo '</td></tr><tr name="firma_dane2" id="firma_dane2"><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nip).' :</td><td>';
                        KontrolkiHtml::DodajTextbox('nip', 'id_nip', $wiersz[KlientDAL::$nip], 15, 15, '');
                        echo '</td></tr><tr name="firma_dane3" id="firma_dane3"><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$regon).' :</td><td>';
                        KontrolkiHtml::DodajTextbox('regon', 'id_regon', $wiersz[KlientDAL::$regon], 15, 15, '');
                        echo '</td></tr><tr name="firma_dane4" id="firma_dane4"><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$krs).' :</td><td>';
                        KontrolkiHtml::DodajTextbox('krs', 'id_krs', $wiersz[KlientDAL::$krs], 15, 15, '');
                        echo '</td></tr><tr name="firma_dane5" id="firma_dane5"><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$kod_pocztowy).' :</td><td>';
                        KontrolkiHtml::DodajKodPocztowyTextbox('kod_pocztowy_firma', 'id_kod_pocztowy_firma', $wiersz[KlientDAL::$kod_firma], 6, 6, '', '');
                        echo '</td></tr><tr name="firma_dane6" id="firma_dane6"><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$miejscowosc).' :</td><td>';
                        KontrolkiHtml::DodajPrzeszukiwanieKontrolka($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wybierz), 'wybierz', 'msc_firma', $wiersz[KlientDAL::$miejscowosc], 'msc_id_firma', $wiersz[KlientDAL::$id_region_geog], 'popup/wybor_region_geog.php?txt=msc_firma&hid=msc_id_firma', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$miejscowosc));
                        echo '</td></tr><tr name="firma_dane7" id="firma_dane7"><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$ulica).' :</td><td>';
                        KontrolkiHtml::DodajTextbox('ulica_firma', 'id_ulica_firma', $wiersz[KlientDAL::$ulica_firma], 40, 15, '');
                        echo '</td></tr><tr name="firma_dane8" id="firma_dane8"><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nr_dom).' :</td><td>';
                        KontrolkiHtml::DodajTextbox('numer_dom_firma', 'id_numer_dom_firma', $wiersz[KlientDAL::$nr_dom_firma], 10, 10, '');
                        echo '</td></tr><tr name="firma_dane9" id="firma_dane9"><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nr_mieszkanie).' :</td><td>';
                        KontrolkiHtml::DodajTextbox('numer_miesz_firma', 'id_numer_miesz_firma', $wiersz[KlientDAL::$nr_mieszkanie_firma], 10, 10, '');
                        echo '</td></tr>';
                    }
                    else
                    {
                        //formularz jesli przy edycji klienta trzeba go zmienic na osobe prawna
                        echo '<tr name="firma_dane1" id="firma_dane1"><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nazwa_firma).' :</td><td>';
                        KontrolkiHtml::DodajTextbox('nazwa_firma', 'id_nazwa_firma', '', 30, 50, '');
                        echo '</td></tr><tr name="firma_dane2" id="firma_dane2"><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nip).' :</td><td>';
                        KontrolkiHtml::DodajTextbox('nip', 'id_nip', '', 15, 15, '');
                        echo '</td></tr><tr name="firma_dane3" id="firma_dane3"><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$regon).' :</td><td>';
                        KontrolkiHtml::DodajTextbox('regon', 'id_regon', '', 15, 15, '');
                        echo '</td></tr><tr name="firma_dane4" id="firma_dane4"><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$krs).' :</td><td>';
                        KontrolkiHtml::DodajTextbox('krs', 'id_krs', '', 15, 15, '');
                        echo '</td></tr><tr name="firma_dane5" id="firma_dane5"><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$kod_pocztowy).' :</td><td>';
                        KontrolkiHtml::DodajKodPocztowyTextbox('kod_pocztowy_firma', 'id_kod_pocztowy_firma', '', 6, 6, '', '');
                        echo '</td></tr><tr name="firma_dane6" id="firma_dane6"><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$miejscowosc).' :</td><td>';
                        KontrolkiHtml::DodajPrzeszukiwanieKontrolka($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wybierz), 'wybierz', 'msc_firma', '', 'msc_id_firma', '', 'popup/wybor_region_geog.php?txt=msc_firma&hid=msc_id_firma', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$miejscowosc));
                        echo '</td></tr><tr name="firma_dane7" id="firma_dane7"><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$ulica).' :</td><td>';
                        KontrolkiHtml::DodajTextbox('ulica_firma', 'id_ulica_firma', '', 40, 15, '');
                        echo '</td></tr><tr name="firma_dane8" id="firma_dane8"><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nr_dom).' :</td><td>';
                        KontrolkiHtml::DodajTextbox('numer_dom_firma', 'id_numer_dom_firma', '', 10, 10, '');
                        echo '</td></tr><tr name="firma_dane9" id="firma_dane9"><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nr_mieszkanie).' :</td><td>';
                        KontrolkiHtml::DodajTextbox('numer_miesz_firma', 'id_numer_miesz_firma', '', 10, 10, '');
                        echo '</td></tr>';
                    }
                    
                    ///dorobic reszte formularza aktualizacji samego klienta - kod pocztowy, region geog, ulica, dom, mieszkanie
                    //ulegnie zmianie tabela klient w bazie i architektura formularza 
                    echo '<script>PokazUkryjFirmaDane(document.getElementById("osobowosc_id").value, '.$osoba_prawna.', \'firma_dane\');</script>';
                    
                    echo '<tr><td>';
                    KontrolkiHtml::DodajSubmit('aktualizuj_klient','id_aktualizuj_klient',$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$aktualizuj).'.','');
                    echo '</td></tr>';
                    echo '</table><hr />';
                }
            }
            if (isset($_POST['osoba_id_dod']))
            {
                $dal = new OsobaDAL($_POST['osoba_id_dod']);
                //$tabParametr[OsobaDAL::$id_osoba] = $_POST['osoba_id_dod'];
                $tabParametr[OsobaDAL::$id_klient] = $_SESSION[KlientDAL::$id_klient];
                $wynik = $dal->DodajOsobaKlient($tabParametr, true);
                
                if ($wynik)
                {
                    echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_powiodla_sie).'.<br />';
                }   
                else
                {
                    echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_nie_powiodla_sie).'.<br />';
                }
            }
            if (isset($_SESSION[KlientDAL::$id_klient])) 
            {
                if (!isset($_POST['edytuj_klient']))
                {
                    echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$numer_klienta).' : '.$_SESSION[KlientDAL::$id_klient].'.<br />';
                    $dal = new OsobaDAL(null);
                    
                    
                    $wynik = $dal->PodajOsobaKlient($_SESSION[KlientDAL::$id_klient], $ilosc_wierszy);
                    if ($ilosc_wierszy > 0)
                    {
                        echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$osoby_dodane).' : ';
                        echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'">';
                        KontrolkiHtml::DodajHidden(KlientDAL::$id_klient, KlientDAL::$id_klient, $_SESSION[KlientDAL::$id_klient]);
                        KontrolkiHtml::DodajHidden($oferta_hidden, $oferta_hidden, $_SESSION[$oferta_hidden]);
                        
                        UtilsUI::WyswietlTab1Poz($wynik, array(OsobaDAL::$nazwisko, OsobaDAL::$imie, OsobaDAL::$pesel), array(tags::$nazwisko, tags::$imie, tags::$pesel), 
                        OsobaDAL::$id_osoba, 'osoba_id', array(Akcja::$edycja => 1));
                        echo '</form>';
                    }
                    
                    if (!isset($_POST['edycja'])) 
                    {
                        echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$dodawanie_osoby).' : ';
                        echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'"><table><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$imie).' :</td><td>';
                        KontrolkiHtml::DodajHidden(KlientDAL::$id_klient, KlientDAL::$id_klient, $_SESSION[KlientDAL::$id_klient]);
                        KontrolkiHtml::DodajHidden($oferta_hidden, $oferta_hidden, $_SESSION[$oferta_hidden]);
                        
                        KontrolkiHtml::DodajSelectZrodSlownik('imie', 'id_sel_imie', SlownikDAL::$imie, 'imie_id', null, '', '');
                        echo '<tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nazwisko).' :</td><td>';
                        KontrolkiHtml::DodajTextbox('nazwisko', 'id_nazwisko', '', 30, 15, '');
                        echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nazwisko_rodowe).' :</td><td>';
                        KontrolkiHtml::DodajTextbox('nazwisko_rodowe', 'id_nazwisko_rodowe', '', 15, 15, '');
                        echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$pesel).' :</td><td>';
                        KontrolkiHtml::DodajTextbox('pesel', 'id_pesel', '', 15, 15, '');
                        echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$dokument_tozsamosci).' :</td><td>';
                        KontrolkiHtml::DodajSelectZrodSlownik('dokument_toz_rodzaj', 'id_dokument_toz_rodzaj', SlownikDAL::$rodzaj_dowod_tozsamosc, 'rodzaj_dowod_tozsamosc_id', null, '', '');
                        echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nr_dokument_tozsamosci).' :</td><td>';
                        KontrolkiHtml::DodajTextbox('nr_dowod', 'id_nr_dowod', '', 15, 15, '');
                        echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$telefon).' :</td><td>';
                        KontrolkiHtml::DodajTelefonTextbox('telefon', 'id_telefon', '', 13, 10, '', '');
                        echo '&nbsp;&nbsp;&nbsp;'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$opis).' : ';
                        KontrolkiHtml::DodajTextbox('telefon_opis', 'id_telefon_opis', '', 20, 15, '');
                        echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$telefon_komorkowy).' :</td><td>';
                        KontrolkiHtml::DodajKomorkaTextbox('telefon_kom', 'id_telefon_kom', '', 9, 9, '', '');
                        echo '&nbsp;&nbsp;&nbsp;'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$opis).' : ';
                        KontrolkiHtml::DodajTextbox('telefon_kom_opis', 'id_telefon_kom_opis', '', 20, 15, '');
                        echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$adres_email).' :</td><td>';
                        KontrolkiHtml::DodajEmailTextbox('adres_email', 'id_adres_email', '', 20, 15, '', '');
                        echo '&nbsp;&nbsp;&nbsp;'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$opis).' : ';
                        KontrolkiHtml::DodajTextbox('adres_email_opis', 'id_adres_email_opis', '', 20, 15, '');
                        echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$kod_pocztowy).' :</td><td>';
                        KontrolkiHtml::DodajKodPocztowyTextbox('kod_pocztowy', 'id_kod_pocztowy', '', 6, 6, '', '');
                        echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$miejscowosc).' :</td><td>';
                        KontrolkiHtml::DodajPrzeszukiwanieKontrolka($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wybierz), 'wybierz', 'msc_osoba', '', 'msc_id_osoba', '', 'popup/wybor_region_geog.php?txt=msc_osoba&hid=msc_id_osoba', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$miejscowosc));
                        echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$ulica).' :</td><td>';
                        KontrolkiHtml::DodajTextbox('ulica', 'id_ulica', '', 40, 15, '');
                        echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nr_dom).' :</td><td>';
                        KontrolkiHtml::DodajTextbox('numer_dom', 'id_numer_dom', '', 10, 10, '');
                        echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nr_mieszkanie).' :</td><td>';
                        KontrolkiHtml::DodajTextbox('numer_miesz', 'id_numer_miesz', '', 10, 10, '');
                        echo '</td></tr><tr><td>'; 
                        KontrolkiHtml::DodajSubmit('dodaj_osoba', 'id_dodaj_osoba', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zatwierdz).'.','');
                        echo '</td><td>';
                        KontrolkiHtml::DodajCheckbox('dodaj_jako_oferent', 'id_dodaj_jako_oferent', true, $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$osoba_otwiera_zlecenie), '');
                        echo '</td></tr></table></form><hr />';
                    }
                    if (isset($_POST['szukaj_osoba']))
                    {
                        $dal = new OsobaDAL(null);
                        $tabParametr[OsobaDAL::$nazwisko] = $_POST['nazwisko_szukaj'];
                        $wynik = $dal->SzukajOsoba($tabParametr);
                        
                        echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$znalezione_osoby).' :<br />';
                        echo '<form action= "'.$_SERVER['PHP_SELF'].'" method= "POST">';
                        KontrolkiHtml::DodajHidden(KlientDAL::$id_klient, KlientDAL::$id_klient, $_SESSION[KlientDAL::$id_klient]);
                        KontrolkiHtml::DodajHidden($oferta_hidden, $oferta_hidden, $_SESSION[$oferta_hidden]);
                        
                        UtilsUI::WyswietlTab1Poz($wynik, array(OsobaDAL::$id_osoba, OsobaDAL::$imie, OsobaDAL::$nazwisko, OsobaDAL::$pesel), 
                        array(tags::$id, tags::$imie, tags::$nazwisko, tags::$pesel), NieruchomoscDAL::$id_osoba, 'osoba_id_dod', array(Akcja::$dodawanie => 1));
                        echo '</form>';
                    }
                    
                    echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$szukanie_istniejacych_osob).' :<br />';
                    echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'"><table><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nazwisko).' :</td><td>';
                    KontrolkiHtml::DodajHidden(KlientDAL::$id_klient, KlientDAL::$id_klient, $_SESSION[KlientDAL::$id_klient]); 
                    KontrolkiHtml::DodajHidden($oferta_hidden, $oferta_hidden, $_SESSION[$oferta_hidden]);
                    
                    KontrolkiHtml::DodajTextbox('nazwisko_szukaj', 'id_txt_nazwisko', '', 20, 20, '');
                    echo '</td><td>';
                    KontrolkiHtml::DodajSubmit('szukaj_osoba','id_szukaj',$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$szukaj).'.','');
                    echo '</td></tr></table></form><hr />';
                
                    echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'">';
                    KontrolkiHtml::DodajHidden(KlientDAL::$id_klient, KlientDAL::$id_klient, $_SESSION[KlientDAL::$id_klient]);
                    KontrolkiHtml::DodajHidden($oferta_hidden, $oferta_hidden, $_POST[$oferta_hidden]);
                    KontrolkiHtml::DodajSubmit('edytuj_klient', 'id_edytuj_klient', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$edycja_klienta), '');
                    echo '</form>';
                }
                if (isset($_SESSION[$osoby_nowe_zlecenie.$_SESSION[KlientDAL::$id_klient]]))
                {
                    if ($_SESSION[$oferta_hidden] == tags::$zapotrzbowanie)
                    {
                        $url = 'dodanie_zapotrzebowanie.php';
                    }
                    else
                    {
                        $url = $_SERVER['PHP_SELF'];
                    }
                    echo '<form method="POST" action="'.$url.'">';
                    KontrolkiHtml::DodajHidden(KlientDAL::$id_klient, KlientDAL::$id_klient, $_SESSION[KlientDAL::$id_klient]);
                    KontrolkiHtml::DodajHidden($oferta_hidden, $oferta_hidden, $_SESSION[$oferta_hidden]);
                    
                    KontrolkiHtml::DodajSubmit('zatwierdz_klient','id_zatwierdz', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zatwierdz).'.','');
                    echo '</form>';
                }
                unset($_SESSION[KlientDAL::$id_klient]);
            }
        }  
    }
    require('stopka.php');

?>
</body>
</html>
