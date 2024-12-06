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
    include_once ('../bll/tags.php'); 
    include_once ('../bll/jezykibll.php');
    include_once ('../bll/agentbll.php');
    include_once ('../bll/cache.php');
    include_once ('../ui/utilsui.php');
    require('../naglowek.php');
    require('../conf.php');
    if (!isset($_SESSION[$zalogowany]))
    {
        echo 'Nie jesteÅ› zalogowany.';
    }
    else
    {
        $dal = new NieruchomoscDAL();
        $tlumaczenia = cachejezyki::Czytaj();
        $agent_zal = unserialize($_SESSION[$dane_agent]);
        
        if (isset($_POST['szukaj']))
        {
            $tabParametr[NieruchomoscDAL::$nazwisko] = $_POST['nazwisko'];
            $wynik = $dal->SzukajOsoba($tabParametr);
            
            echo '<form action= "'.$_SERVER['PHP_SELF'].'" method= "POST">';
            UtilsUI::WyswietlTab1Poz($wynik, 
                array(NieruchomoscDAL::$id_osoba, NieruchomoscDAL::$imie, NieruchomoscDAL::$nazwisko, NieruchomoscDAL::$pesel), 
                array(tags::$id, tags::$imie, tags::$nazwisko, tags::$pesel), 
                NieruchomoscDAL::$id_osoba, 
                'osoba_id_dod',
                array(Akcja::$dodawanie => 1));
            echo '</form><hr />';
        }
        if (isset($_POST['osoba_id_dod']))
        {
            $tabParametr[NieruchomoscDAL::$id_osoba] = $_POST['osoba_id_dod'];
            $tabParametr[NieruchomoscDAL::$id_klient] = $_SESSION[NieruchomoscDAL::$id_klient];
            $wynik = $dal->DodajOsobaKlient($tabParametr, true);
            
            if ($wynik)
            {
                echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_powiodla_sie);
            }   
            else
            {
                echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_nie_powiodla_sie);
            }
        }
        //modyfikacja danych odnosnie klienta, formularz nie jest dokonczony, dokonczyc i obsluzyc
        //dokonczenie formularza oraz obsluga wprowadzenia osoby czy aktualizacji klienta powierzona zabie :)
        if (isset($_POST['zatwierdz']))
        {
            //obsluga aktualizacji klienta: wywolanie procedury dodaj z id, spowoduje aktualizacje, umozliwi przejscie z os fiz na prawna i odwrotnie
            $tabParametr[NieruchomoscDAL::$id_klient] = $_SESSION[NieruchomoscDAL::$id_klient];
            $tabParametr[NieruchomoscDAL::$id_osobowosc] = $_POST['osobowosc_id'];
            $tabParametr[NieruchomoscDAL::$agent] = $agent_zal->id;
            $tabParametr[NieruchomoscDAL::$nazwa_firma] = $_POST['nazwa_firma'];
            $tabParametr[NieruchomoscDAL::$nip] = $_POST['nip'];
            $tabParametr[NieruchomoscDAL::$regon] = $_POST['regon'];
            $tabParametr[NieruchomoscDAL::$krs] = $_POST['krs'];
            $tabParametr[NieruchomoscDAL::$kod_firma] = $_POST['kod_pocztowy_firma'];
            $tabParametr[NieruchomoscDAL::$id_region_geog_firma] = $_POST['msc_id_firma'];
            $tabParametr[NieruchomoscDAL::$ulica_firma] = $_POST['ulica_firma'];
            $tabParametr[NieruchomoscDAL::$nr_dom_firma] = $_POST['numer_dom_firma'];
            $tabParametr[NieruchomoscDAL::$nr_mieszkanie_firma] = $_POST['numer_miesz_firma'];
            
            $wynik = $dal->DodajKlient($tabParametr);
            if ($wynik)
            {
                echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_powiodla_sie);
            }   
            else
            {
                echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_nie_powiodla_sie);
            }
            //zastanowic sie nad zasadnoscia unseta id klienta - chyba tu bez sensu :P
            //$_SESSION[NieruchomoscDAL::$id_klient]; //= $wynik[NieruchomoscDAL::$id_klient];
        }
        //przycisk zatwierdzenia nowej osoby, wywolac dodanie z dala
        if (isset($_POST['wprowadz_osoba']))
        {
            $tabParametr[NieruchomoscDAL::$agent] = $agent_zal->id;
            $tabParametr[NieruchomoscDAL::$id_imie] = $_POST['imie_id'];
            $tabParametr[NieruchomoscDAL::$nazwisko] = $_POST['nazwisko']; 
            $tabParametr[NieruchomoscDAL::$nazwisko_rodowe] = $_POST['nazwisko_rodowe']; 
            $tabParametr[NieruchomoscDAL::$pesel] = $_POST['pesel']; 
            //$tabParametr[NieruchomoscDAL::$nr_dowod] = $_POST['nr_dowod'];
            if (strlen($_POST['msc_id_osoba']) > 0)
            { 
                $tabParametr[NieruchomoscDAL::$id_region_geog] = $_POST['msc_id_osoba'];
            }
            $tabParametr[NieruchomoscDAL::$kod] = $_POST['kod_pocztowy'];
            $tabParametr[NieruchomoscDAL::$ulica] = $_POST['ulica'];
            $tabParametr[NieruchomoscDAL::$nr_dom] = $_POST['numer_dom'];
            $tabParametr[NieruchomoscDAL::$nr_mieszkanie] = $_POST['numer_miesz'];
            $tabParametr[NieruchomoscDAL::$id_rodzaj_dowod_tozsamosc] = $_POST['rodzaj_dowod_tozsamosc_id'];
            $tabParametr[NieruchomoscDAL::$nr_dowod] = $_POST['nr_dowod'];
            if (strlen($_POST['telefon']) > 0)
                $tabParametr[NieruchomoscDAL::$telefon] = $_POST['telefon'];
            if (strlen($_POST['telefon_kom']) > 0)
                $tabParametr[NieruchomoscDAL::$komorka] = $_POST['telefon_kom'];
            if (strlen($_POST['adres_email']) > 0)
                $tabParametr[NieruchomoscDAL::$email] = $_POST['adres_email'];
                
            $tabParametr[NieruchomoscDAL::$telefon_opis] = $_POST['telefon_opis'];
            $tabParametr[NieruchomoscDAL::$komorka_opis] = $_POST['telefon_kom_opis'];
            $tabParametr[NieruchomoscDAL::$email_opis] = $_POST['adres_email_opis'];
            if(isset($_POST['dodaj_do_klient']))
            {
                $tabParametr[NieruchomoscDAL::$id_klient] = $_SESSION[NieruchomoscDAL::$id_klient]; 
            } 

            $wynik = $dal->DodajOsoba($tabParametr);
            
            if ($wynik != null)
            {
                echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_powiodla_sie);
            }   
            else
            {
                echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_nie_powiodla_sie);
            }
            //jesli ptaszek zostanie zaznaczony ponizszy if zwroci true, inaczej false
            //if(isset($_POST['dodaj_do_klient']))
        }
        if (isset($_POST['aktualizuj']))
        {
            $tabParametr[NieruchomoscDAL::$id_osoba] = $_POST['osoba_id_akt'];
            $tabParametr[NieruchomoscDAL::$id_imie] = $_POST['imie_id'];
            $tabParametr[NieruchomoscDAL::$nazwisko] = $_POST['nazwisko']; 
            $tabParametr[NieruchomoscDAL::$nazwisko_rodowe] = $_POST['nazwisko_rodowe']; 
            $tabParametr[NieruchomoscDAL::$pesel] = $_POST['pesel']; 
            //$tabParametr[NieruchomoscDAL::$nr_dowod] = $_POST['nr_dowod'];
            $tabParametr[NieruchomoscDAL::$agent] = $agent_zal->id; 
            if (strlen($_POST['msc_id_osoba']) > 0)
            {
                $tabParametr[NieruchomoscDAL::$id_region_geog] = $_POST['msc_id_osoba']; 
            }
            $tabParametr[NieruchomoscDAL::$kod] = $_POST['kod_pocztowy'];
            $tabParametr[NieruchomoscDAL::$ulica] = $_POST['ulica'];
            $tabParametr[NieruchomoscDAL::$nr_dom] = $_POST['numer_dom'];
            $tabParametr[NieruchomoscDAL::$nr_mieszkanie] = $_POST['numer_miesz'];
            
            $wynik = $dal->DodajOsoba($tabParametr);
            
            if ($wynik != null)
            {
                echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_powiodla_sie);
            }   
            else
            {
                echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_nie_powiodla_sie);
            }
        }
        if (isset($_POST['edycja']))
        {
            //formularz edycji osoby - textboxy i inne zabawki wraz z danymi osoby edytowanej
            $tabParametr[NieruchomoscDAL::$id_osoba] = $_POST['osoba_id_ed_kas'];
            $wynik = $dal->EdycjaOsoba($tabParametr);
            $wiersz = $wynik[0];
            echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'"><table><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$imie).'</td><td>';
            //utworzenie hiddena wraz z id osoby
            KontrolkiHtml::DodajHidden('osoba_id_akt', 'osoba_id_akt', $_POST['osoba_id_ed_kas']);
            KontrolkiHtml::DodajSelectZrodSlownik('imie', 'id_sel_imie', SlownikDAL::$imie, 'imie_id', $wiersz[NieruchomoscDAL::$id_imie], '', '');
            echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nazwisko).'</td><td>';
            KontrolkiHtml::DodajTextbox('nazwisko', 'id_nazwisko', $wiersz[NieruchomoscDAL::$nazwisko], 30, 30, ''); 
            //popup dokumenty
            echo '</td><td>';
            KontrolkiHtml::DodajPopUpButton($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$dokumenty), 'dokumenty', 'dokumenty.php?'.OsobaDAL::$id_osoba.'='.$_POST['osoba_id_ed_kas'], 400, 200);
            //po popupie
            echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nazwisko_rodowe).'</td><td>';
            KontrolkiHtml::DodajTextbox('nazwisko_rodowe', 'id_nazwisko_rodowe', $wiersz[NieruchomoscDAL::$nazwisko_rodowe], 30, 30, '');  
            //popup kontakt
            echo '</td><td>';
            KontrolkiHtml::DodajPopUpButton($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$kontakt), 'kontakt', 'kontakt.php?'.OsobaDAL::$id_osoba.'='.$_POST['osoba_id_ed_kas'], 600, 350);
            //po popupie
            echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$pesel).'</td><td>';
            KontrolkiHtml::DodajTextbox('pesel', 'id_pesel', $wiersz[NieruchomoscDAL::$pesel], 15, 15, '');
            echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$kod_pocztowy).' :</td><td>';
            KontrolkiHtml::DodajKodPocztowyTextbox('kod_pocztowy', 'id_kod_pocztowy', $wiersz[NieruchomoscDAL::$kod], 6, 6, '', '');
            echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$miejscowosc).' :</td><td>';
            KontrolkiHtml::DodajPrzeszukiwanieKontrolka($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wybierz), 'wybierz', 'msc_osoba', $wiersz[NieruchomoscDAL::$region], 'msc_id_osoba', $wiersz[NieruchomoscDAL::$id_region_geog], 'wybor_region_geog.php?txt=msc_osoba&hid=msc_id_osoba', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$miejscowosc));
            echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$ulica).' :</td><td>';
            KontrolkiHtml::DodajTextbox('ulica', 'id_ulica', $wiersz[NieruchomoscDAL::$ulica], 40, 15, '');
            echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nr_dom).' :</td><td>';
            KontrolkiHtml::DodajLiczbaCalkowitaTextbox('numer_dom', 'id_numer_dom', $wiersz[NieruchomoscDAL::$nr_dom], 10, 10, '');
            echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nr_mieszkanie).' :</td><td>';
            KontrolkiHtml::DodajLiczbaCalkowitaTextbox('numer_miesz', 'id_numer_miesz', $wiersz[NieruchomoscDAL::$nr_mieszkanie], 10, 10, ''); 
            echo '</td></tr><tr><td>';
            //przekazanie do hiddena id tu wlasciwie jest niepotrzebne, gdyzono juz przy tworzeniu hiddena zostalo tam zapisane
            KontrolkiHtml::DodajSubmit('aktualizuj', $wiersz[NieruchomoscDAL::$id_osoba], $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zatwierdz).'.','onclick="osoba_id_akt.value = this.id;"');
            echo '</td></tr></table></form><hr />';
        }
        if (isset($_POST['kasowanie']))
        {
            $tabParametr[NieruchomoscDAL::$id_osoba] = $_POST['osoba_id_ed_kas'];
            $tabParametr[NieruchomoscDAL::$id_klient] = $_SESSION[NieruchomoscDAL::$id_klient];
            $wynik = $dal->DodajOsobaKlient($tabParametr, false);
        }
        //jesli okno zostalo bezposrednio wywolane lub po raz kolejny
        if (isset($_GET[NieruchomoscDAL::$id_klient]) || isset($_SESSION[NieruchomoscDAL::$id_klient]))
        {
            if (isset($_GET[NieruchomoscDAL::$id_klient]))
            {
                $_SESSION[NieruchomoscDAL::$id_klient] = $_GET[NieruchomoscDAL::$id_klient];
            }
            //parametrem metody jest $tabParametr - tablica parametrow; tu zastosowano skrot tworzac tablice z parametrem juz wewnatrz wywolania metody
            // wlasciwie w celu zaoszczedzenia na linijce kodu i definicji jednej zmiennej wiecej
            $wynik = $dal->EdycjaKlient(array(NieruchomoscDAL::$id_klient => $_SESSION[NieruchomoscDAL::$id_klient]));
            ///sprawdzenie czy cos z bazy danych przywêdroewa³o (powinno to zawsze byc 1 wiersz jesli baza nie lezy lub zero jesli cos  na bazie sie dzieje, nigdy wiecej niz 1)
            if (isset($wynik[0]))
            {
                //poniewaz wynik jest talica ale 1 elementowa mozna go uproscic do zmiennej, ostatecznie wewnatrz wyniku jest troche kompliakcji
                $wiersz = $wynik[0];
                echo '<form action= "'.$_SERVER['PHP_SELF'].'" method= "POST">';
                
                echo '<table><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$osobowosc).' :</td><td>';
                KontrolkiHtml::DodajSelectZrodSlownik('osobowosc', 'id_but_osobowosc', SlownikDAL::$osobowosc, 'osobowosc_id', $wiersz[NieruchomoscDAL::$id_osobowosc], '', 'onchange="PokazUkryjFirmaDane(this.options[this.selectedIndex].id, '.$osoba_prawna.', \'firma_dane\');"');
                echo '</td><td>';
                KontrolkiHtml::DodajPopUpButton($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$notatka), 'notatka', 'notatka_klient.php?'.NieruchomoscDAL::$id_klient.'='.
                $_SESSION[NieruchomoscDAL::$id_klient], 600, 600);
                echo '</td></tr>';
                if ($wiersz[NieruchomoscDAL::$id_osobowosc] == $osoba_prawna)
                {
                    echo '<tr name="firma_dane1" id="firma_dane1"><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nazwa_firma).' :</td><td>';
                    KontrolkiHtml::DodajTextbox('nazwa_firma', 'id_nazwa_firma', $wiersz[NieruchomoscDAL::$nazwa_firma], 30, 50, '');
                    echo '</td></tr><tr name="firma_dane2" id="firma_dane2"><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nip).' :</td><td>';
                    KontrolkiHtml::DodajTextbox('nip', 'id_nip', $wiersz[NieruchomoscDAL::$nip], 15, 15, '');
                    echo '</td></tr><tr name="firma_dane3" id="firma_dane3"><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$regon).' :</td><td>';
                    KontrolkiHtml::DodajTextbox('regon', 'id_regon', $wiersz[NieruchomoscDAL::$regon], 15, 15, '');
                    echo '</td></tr><tr name="firma_dane4" id="firma_dane4"><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$krs).' :</td><td>';
                    KontrolkiHtml::DodajTextbox('krs', 'id_krs', $wiersz[NieruchomoscDAL::$krs], 15, 15, '');
                    echo '</td></tr><tr name="firma_dane5" id="firma_dane5"><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$kod_pocztowy).' :</td><td>';
                    KontrolkiHtml::DodajKodPocztowyTextbox('kod_pocztowy_firma', 'id_kod_pocztowy_firma', $wiersz[NieruchomoscDAL::$kod], 6, 6, '', '');
                    echo '</td></tr><tr name="firma_dane6" id="firma_dane6"><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$miejscowosc).' :</td><td>';
                    KontrolkiHtml::DodajPrzeszukiwanieKontrolka($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wybierz), 'wybierz', 'msc_firma', $wiersz[NieruchomoscDAL::$miejscowosc], 'msc_id_firma', $wiersz[NieruchomoscDAL::$id_region_geog], 'wybor_region_geog.php?txt=msc_firma&hid=msc_id_firma', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$miejscowosc));
                    echo '</td></tr><tr name="firma_dane7" id="firma_dane7"><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$ulica).' :</td><td>';
                    KontrolkiHtml::DodajTextbox('ulica_firma', 'id_ulica_firma', $wiersz[NieruchomoscDAL::$ulica], 40, 15, '');
                    echo '</td></tr><tr name="firma_dane8" id="firma_dane8"><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nr_dom).' :</td><td>';
                    KontrolkiHtml::DodajTextbox('numer_dom_firma', 'id_numer_dom_firma', $wiersz[NieruchomoscDAL::$nr_dom], 10, 10, '');
                    echo '</td></tr><tr name="firma_dane9" id="firma_dane9"><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nr_mieszkanie).' :</td><td>';
                    KontrolkiHtml::DodajTextbox('numer_miesz_firma', 'id_numer_miesz_firma', $wiersz[NieruchomoscDAL::$nr_mieszkanie], 10, 10, '');
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
                    KontrolkiHtml::DodajPrzeszukiwanieKontrolka($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wybierz), 'wybierz', 'msc_firma', '', 'msc_id_firma', '', 'wybor_region_geog.php?txt=msc_firma&hid=msc_id_firma', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$miejscowosc));
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
                KontrolkiHtml::DodajSubmit('zatwierdz','id_zatwierdz',$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zatwierdz).'.','');
                echo '</td></tr>';
                echo '</table><hr />';
                ///osoby skaldajace sie na klienta
                $osoby[NieruchomoscDAL::$id_osoba] = $wiersz[NieruchomoscDAL::$id_osoba];
                $osoby[NieruchomoscDAL::$imie] = $wiersz[NieruchomoscDAL::$imie];
                $osoby[NieruchomoscDAL::$nazwisko] = $wiersz[NieruchomoscDAL::$nazwisko];
                //wywolanie metody, ktora pokazuje informacje jedna lub wiele w tablicy html
                UtilsUI::WyswietlTablicaTablic($osoby, array(NieruchomoscDAL::$id_osoba, NieruchomoscDAL::$imie, NieruchomoscDAL::$nazwisko), array(tags::$id, tags::$imie, tags::$nazwisko), NieruchomoscDAL::$id_osoba, 'osoba_id_ed_kas', array(Akcja::$edycja => 1, Akcja::$kasowanie => 1));
                
                echo '<hr /><table><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nazwisko).' :</td><td>';
                KontrolkiHtml::DodajTextbox('nazwisko', 'id_txt_nazwisko', '', 20, 20, '');
                echo '</td><td>';
                KontrolkiHtml::DodajSubmit('szukaj','id_szukaj',$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$szukaj).'.','');
                echo '</td></tr></table></form>';
                //otworzenie nowego formularza iterpretowanego w tym samym pliku, zeby moc powielic nazwy pol, dodatkowo chowanie formularza przy edycji osoby
                //ze wzgledu na fakt, ze w momencie pojawienia sie edycji naloza sie nazwy id pol, co spowoduje oglupienie javascriptu
                if (!isset($_POST['edycja']))
                {
                    echo '<hr /><form action= "'.$_SERVER['PHP_SELF'].'" method= "POST"><table><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$imie).'</td><td>';
                    KontrolkiHtml::DodajSelectZrodSlownik('imie', 'id_sel_imie', SlownikDAL::$imie, 'imie_id', '', '', '');
                    echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nazwisko).'</td><td>';
                    KontrolkiHtml::DodajTextbox('nazwisko', 'id_nazwisko', '', 30, 30, ''); 
                    echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nazwisko_rodowe).'</td><td>';
                    KontrolkiHtml::DodajTextbox('nazwisko_rodowe', 'id_nazwisko_rodowe', '', 30, 30, '');  
                    echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$pesel).'</td><td>';
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
                    KontrolkiHtml::DodajPrzeszukiwanieKontrolka($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wybierz), 'wybierz', 'msc_osoba', '', 'msc_id_osoba', '', 'wybor_region_geog.php?txt=msc_osoba&hid=msc_id_osoba', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$miejscowosc));
                    echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$ulica).' :</td><td>';
                    KontrolkiHtml::DodajTextbox('ulica', 'id_ulica', '', 40, 15, '');
                    echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nr_dom).' :</td><td>';
                    KontrolkiHtml::DodajTextbox('numer_dom', 'id_numer_dom', '', 10, 10, '');
                    echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nr_mieszkanie).' :</td><td>';
                    KontrolkiHtml::DodajTextbox('numer_miesz', 'id_numer_miesz', '', 10, 10, ''); 
                    echo '</td></tr><tr><td>';
                    //przekazanie do hiddena id tu wlasciwie jest niepotrzebne, gdyzono juz przy tworzeniu hiddena zostalo tam zapisane
                    KontrolkiHtml::DodajSubmit('wprowadz_osoba', 'id_wprowadz_osoba', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zatwierdz).'.','');
                    echo '</td><td>';
                    KontrolkiHtml::DodajCheckbox('dodaj_do_klient', 'id_dodaj_do_klient', true, $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$dodaj_do_klienta), '');
                    echo '</td></tr></table></form>';
                }
            }
        }
    }
    require('../stopka.php');
?>
</body>
</html>