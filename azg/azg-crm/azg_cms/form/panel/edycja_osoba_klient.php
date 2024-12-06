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
    include_once ('../bll/klientbll.php');
    require('../naglowek.php');
    require('../conf.php');
    
    if (!isset($_SESSION[$zalogowany]))
    {
        echo 'Nie jesteÅ› zalogowany.';
    }
    else
    {
        $uprawnienia = unserialize($_SESSION[$zalogowany]);
        $tlumaczenia = cachejezyki::Czytaj();
        $agent_zal = unserialize($_SESSION[$dane_agent]);
        $klient_id = null;
        $zapotrzebowanie_id = null;
        $oferta_id = null;
        
        if (isset($_GET[KlientDAL::$id_klient]))
        {
            $klient_id = $_GET[KlientDAL::$id_klient];
        }
        if (isset($_POST[KlientDAL::$id_klient]))
        {
            $klient_id = $_POST[KlientDAL::$id_klient];
        }
        
        //echo '<b>'.$klient_id.'</b><br /><br />';
        
        if (isset($_GET[NieruchomoscDAL::$id_zapotrzebowanie]))
        {
            $zapotrzebowanie_id = $_GET[NieruchomoscDAL::$id_zapotrzebowanie];
        }
        if (isset($_POST[NieruchomoscDAL::$id_zapotrzebowanie]))
        {
            $zapotrzebowanie_id = $_POST[NieruchomoscDAL::$id_zapotrzebowanie];
        }
        
        if (isset($_GET[NieruchomoscDAL::$id_oferta]))
        {
            $oferta_id = $_GET[NieruchomoscDAL::$id_oferta];
        }
        if (isset($_POST[NieruchomoscDAL::$id_oferta]))
        {
            $oferta_id = $_POST[NieruchomoscDAL::$id_oferta];
        }
        
        if(isset($_POST['dodaj_notatka']))
        {
            $dal = new KlientDAL();
            $tabParametr[KlientDAL::$id_klient] = $klient_id;
            $tabParametr[KlientDAL::$id_agent] = $agent_zal->id;
            $tabParametr[KlientDAL::$tresc] = $_POST['tresc_not'];
            
            $wynik = $dal->DodajNotatkaKlient($tabParametr);
            if ($wynik == null)
            {
                UtilsUI::InfoBlad($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_nie_powiodla_sie));
            }
        }
        if(isset($_POST['kasowanie']))
        {
            $dal = new KlientDAL();
            $tabParametr[KlientDAL::$id_notatka] = $_POST['notatka_id'];
            $wynik = $dal->UsunNotatka($tabParametr);
            if ($wynik == null)
            {
                UtilsUI::InfoBlad($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_nie_powiodla_sie));
            }    
        }
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
                //echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_powiodla_sie).'.<br />';
                if (isset($_POST['dodaj_jako_oferent']))
                {  
                                      
                    if ($zapotrzebowanie_id != null)
                    {
                        $dal->DodajOsobaZapotrzebowanie(array(OsobaDAL::$id_zapotrzebowanie => $zapotrzebowanie_id), true);
                    }
                    if ($oferta_id != null)
                    {
                        $dal->DodajOsobaOferta(array(OsobaDAL::$id_oferta => $oferta_id), true);
                    }
                }
                else
                {
                    if ($zapotrzebowanie_id != null)
                    {
                        $dal->DodajOsobaZapotrzebowanie(array(OsobaDAL::$id_zapotrzebowanie => $zapotrzebowanie_id), false);
                    }
                    if ($oferta_id != null)
                    {
                        $dal->DodajOsobaOferta(array(OsobaDAL::$id_oferta => $oferta_id), false);
                    }
                }
            } 
            else
            {
                UtilsUI::InfoBlad($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_nie_powiodla_sie).'. '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], $wynik[OsobaDAL::$nazwa]));
                //echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_nie_powiodla_sie).'.<br />';
                //echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], $wynik[OsobaDAL::$nazwa]).'.<br />';
            }
        }
        //edycja_osoby edytuj_osobe    
        if (isset($_POST['edycja']))
        {
            echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$edycja_osoby).' : <br />';
            $dal = new OsobaDAL($_POST['osoba_id']);
            //$tabParametr[NieruchomoscDAL::$id_osoba] = $_POST['osoba_id'];
            $wynik = $dal->EdycjaOsoba();
            $wiersz = $wynik[0];
            echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'">';
            KontrolkiHtml::DodajHidden(OsobaDAL::$id_osoba, OsobaDAL::$id_osoba, $_POST['osoba_id']);
            KontrolkiHtml::DodajHidden(KlientDAL::$id_klient, KlientDAL::$id_klient, $klient_id);
            
            if ($zapotrzebowanie_id != null)
            {
                KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_zapotrzebowanie, NieruchomoscDAL::$id_zapotrzebowanie, $zapotrzebowanie_id);
            }
            if ($oferta_id != null)
            {
                KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_oferta, NieruchomoscDAL::$id_oferta, $oferta_id);
            }
            echo '<table><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$imie).'</td><td>';
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
            KontrolkiHtml::DodajLiczbaCalkowitaTextbox('pesel', 'id_pesel', $wiersz[OsobaDAL::$pesel], 11, 11, 'onblur="WalidacjaPesel(this, \''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$bledny_pesel).'\');"');
            echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$kod_pocztowy).' :</td><td>';
            KontrolkiHtml::DodajKodPocztowyTextbox('kod_pocztowy', 'id_kod_pocztowy', $wiersz[OsobaDAL::$kod], 6, 6, '', '');
            echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$miejscowosc).' :</td><td>';
            KontrolkiHtml::DodajPrzeszukiwanieKontrolka($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wybierz), 'wybierz', 'msc_osoba', $wiersz[OsobaDAL::$region], 'msc_id_osoba', $wiersz[OsobaDAL::$id_region_geog], 'popup/wybor_miejscowosc.php?txt=msc_osoba&hid=msc_id_osoba', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$miejscowosc));
            echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$ulica).' :</td><td>';
            KontrolkiHtml::DodajTextbox('ulica', 'id_ulica', $wiersz[OsobaDAL::$ulica], 40, 15, '');
            echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nr_dom).' :</td><td>';
            KontrolkiHtml::DodajTextbox('numer_dom', 'id_numer_dom', $wiersz[OsobaDAL::$nr_dom], 10, 10, '');
            echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nr_mieszkanie).' :</td><td>';
            KontrolkiHtml::DodajTextbox('numer_miesz', 'id_numer_miesz', $wiersz[OsobaDAL::$nr_mieszkanie], 10, 10, ''); 
            echo '</td></tr><tr><td>';
            //przekazanie do hiddena id tu wlasciwie jest niepotrzebne, gdyzono juz przy tworzeniu hiddena zostalo tam zapisane
            KontrolkiHtml::DodajSubmit('aktualizuj_osoba', $wiersz[OsobaDAL::$id_osoba], $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$aktualizuj).'.', '');
            $os_otw_zlec = false;
            if ($zapotrzebowanie_id != null)
            {
                $tabParametr[OsobaDAL::$id_zapotrzebowanie] = $zapotrzebowanie_id;
                $osoba_otw = $dal->PodajOsobaZapotrzebowanie($tabParametr, $ilosc_wierszy);
                $osoba_otw = UtilsDAL::TabIdNazwa2TabIndexId($osoba_otw, OsobaDAL::$id_osoba, OsobaDAL::$id_osoba);
                if (isset($osoba_otw[$_POST['osoba_id']]))
                {
                    $os_otw_zlec = true;
                }
            }
            if ($oferta_id != null)
            {
                $tabParametr[OsobaDAL::$id_oferta] = $oferta_id;
                $osoba_otw = $dal->PodajOsobaOferta($tabParametr, $ilosc_wierszy);
                $osoba_otw = UtilsDAL::TabIdNazwa2TabIndexId($osoba_otw, OsobaDAL::$id_osoba, OsobaDAL::$id_osoba);
                if (isset($osoba_otw[$_POST['osoba_id']]))
                {
                    $os_otw_zlec = true;
                }
            }
            echo '</td><td>';
            KontrolkiHtml::DodajCheckbox('dodaj_jako_oferent', 'id_dodaj_jako_oferent', $os_otw_zlec, $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$osoba_otwiera_zlecenie), '');
            echo '</td></tr></table></form><hr />';
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
                
            
            $tabParametr[OsobaDAL::$komorka_opis] = $_POST['telefon_kom_opis'];
            $tabParametr[OsobaDAL::$email_opis] = $_POST['adres_email_opis'];
            $tabParametr[OsobaDAL::$id_klient] = $klient_id;

            $wynik = $dal->DodajOsoba($tabParametr);
            
            if (strlen($wynik[OsobaDAL::$id]) > 0)
            {
                //od nowa zeby bylo id osoby
                $dal = new OsobaDAL($wynik[OsobaDAL::$id]);
                //echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_powiodla_sie).'.<br />';
                if (isset($_POST['dodaj_jako_oferent']))
                {                    
                    if ($zapotrzebowanie_id != null)
                    {
                        $dal->DodajOsobaZapotrzebowanie(array(OsobaDAL::$id_zapotrzebowanie => $zapotrzebowanie_id), true);
                    }
                    if ($oferta_id != null)
                    {
                        $dal->DodajOsobaOferta(array(OsobaDAL::$id_oferta => $oferta_id), true);
                    }
                }
            }   
            else
            {
                UtilsUI::InfoBlad($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_nie_powiodla_sie));
                UtilsUI::InfoBlad($tlumaczenia->Tlumacz($_SESSION[$jezyk], $wynik[OsobaDAL::$nazwa]));
            }
        }
        ////przetwarzanie klienta    
        if (isset($_POST['aktualizuj_klient']))
        {
            //unset($_SESSION[KlientDAL::$id_klient]);
            $agent_zal = unserialize($_SESSION[$dane_agent]);
            $dal = new KlientDAL();
            //skonstruowac tablice parametrow dla metody dodaj klient wywolywanej z obiektu $dal
            $tabParametr[KlientDAL::$id_klient] = $klient_id;
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
                $klient_id = $wynik[KlientDAL::$id];
            }
            else
            {
                echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_nie_powiodla_sie).'.<br />';
                echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], $wynik[KlientDAL::$nazwa]).'.<br />';
            }            
        }
        ////przetwarzanie klienta c.d.    
        if (isset($_POST['zatwierdz']))
        {
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
                $klient_id = $wynik[KlientDAL::$id];
            }
            else
            {
                echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_nie_powiodla_sie).'.<br />';
                echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], $wynik[KlientDAL::$nazwa]).'.<br />';
            }            
        }
        ////przetwarzanie klienta c.d.
        if (isset($_POST['edytuj_klient']))
        {
            $dal = new KlientDAL();
            $wynik = $dal->EdycjaKlient(array(KlientDAL::$id_klient => $klient_id));
            ///sprawdzenie czy cos z bazy danych przywêdroewa³o (powinno to zawsze byc 1 wiersz jesli baza nie lezy lub zero jesli cos  na bazie sie dzieje, nigdy wiecej niz 1)
            if (isset($wynik[0]))
            {
                //poniewaz wynik jest talica ale 1 elementowa mozna go uproscic do zmiennej, ostatecznie wewnatrz wyniku jest troche kompliakcji
                $wiersz = $wynik[0];
                echo '<form action= "'.$_SERVER['PHP_SELF'].'" method= "POST">';
                KontrolkiHtml::DodajHidden(KlientDAL::$id_klient, KlientDAL::$id_klient, $klient_id);
                if ($zapotrzebowanie_id != null)
                {
                    KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_zapotrzebowanie, NieruchomoscDAL::$id_zapotrzebowanie, $zapotrzebowanie_id);
                }
                if ($oferta_id != null)
                {
                    KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_oferta, NieruchomoscDAL::$id_oferta, $oferta_id);
                }
                
                echo '<table><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$osobowosc).' :</td><td>';
                KontrolkiHtml::DodajSelectZrodSlownik('osobowosc', 'id_but_osobowosc', SlownikDAL::$osobowosc, 'osobowosc_id', $wiersz[KlientDAL::$id_osobowosc], '', 'onchange="PokazUkryjFirmaDane(this.options[this.selectedIndex].id, '.$osoba_prawna.', \'firma_dane\');"');
                echo '</td><td>';
                
                echo '</td></tr>';
                if ($wiersz[KlientDAL::$id_osobowosc] == $osoba_prawna)
                {
                    echo '<tr name="firma_dane1" id="firma_dane1"><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nazwa_firma).' :</td><td>';
                    KontrolkiHtml::DodajTextbox('nazwa_firma', 'id_nazwa_firma', $wiersz[KlientDAL::$nazwa_firma], 100, 60, '');
                    echo '</td></tr><tr name="firma_dane2" id="firma_dane2"><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nip).' :</td><td>';
                    KontrolkiHtml::DodajTextbox('nip', 'id_nip', $wiersz[KlientDAL::$nip], 15, 15, '');
                    echo '</td></tr><tr name="firma_dane3" id="firma_dane3"><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$regon).' :</td><td>';
                    KontrolkiHtml::DodajTextbox('regon', 'id_regon', $wiersz[KlientDAL::$regon], 15, 15, '');
                    echo '</td></tr><tr name="firma_dane4" id="firma_dane4"><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$krs).' :</td><td>';
                    KontrolkiHtml::DodajTextbox('krs', 'id_krs', $wiersz[KlientDAL::$krs], 15, 15, '');
                    echo '</td></tr><tr name="firma_dane5" id="firma_dane5"><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$kod_pocztowy).' :</td><td>';
                    KontrolkiHtml::DodajKodPocztowyTextbox('kod_pocztowy_firma', 'id_kod_pocztowy_firma', $wiersz[KlientDAL::$kod], 6, 6, '', '');
                    echo '</td></tr><tr name="firma_dane6" id="firma_dane6"><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$miejscowosc).' :</td><td>';
                    KontrolkiHtml::DodajPrzeszukiwanieKontrolka($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wybierz), 'wybierz', 'msc_firma', $wiersz[KlientDAL::$miejscowosc], 'msc_id_firma', $wiersz[KlientDAL::$id_region_geog], 'popup/wybor_miejscowosc.php?txt=msc_firma&hid=msc_id_firma', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$miejscowosc));
                    echo '</td></tr><tr name="firma_dane7" id="firma_dane7"><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$ulica).' :</td><td>';
                    KontrolkiHtml::DodajTextbox('ulica_firma', 'id_ulica_firma', $wiersz[KlientDAL::$ulica], 40, 15, '');
                    echo '</td></tr><tr name="firma_dane8" id="firma_dane8"><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nr_dom).' :</td><td>';
                    KontrolkiHtml::DodajTextbox('numer_dom_firma', 'id_numer_dom_firma', $wiersz[KlientDAL::$nr_dom], 10, 10, '');
                    echo '</td></tr><tr name="firma_dane9" id="firma_dane9"><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nr_mieszkanie).' :</td><td>';
                    KontrolkiHtml::DodajTextbox('numer_miesz_firma', 'id_numer_miesz_firma', $wiersz[KlientDAL::$nr_mieszkanie], 10, 10, '');
                    echo '</td></tr>';
                }
                else
                {
                    //formularz jesli przy edycji klienta trzeba go zmienic na osobe prawna
                    echo '<tr name="firma_dane1" id="firma_dane1"><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nazwa_firma).' :</td><td>';
                    KontrolkiHtml::DodajTextbox('nazwa_firma', 'id_nazwa_firma', '', 100, 60, '');
                    echo '</td></tr><tr name="firma_dane2" id="firma_dane2"><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nip).' :</td><td>';
                    KontrolkiHtml::DodajTextbox('nip', 'id_nip', '', 15, 15, '');
                    echo '</td></tr><tr name="firma_dane3" id="firma_dane3"><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$regon).' :</td><td>';
                    KontrolkiHtml::DodajTextbox('regon', 'id_regon', '', 15, 15, '');
                    echo '</td></tr><tr name="firma_dane4" id="firma_dane4"><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$krs).' :</td><td>';
                    KontrolkiHtml::DodajTextbox('krs', 'id_krs', '', 15, 15, '');
                    echo '</td></tr><tr name="firma_dane5" id="firma_dane5"><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$kod_pocztowy).' :</td><td>';
                    KontrolkiHtml::DodajKodPocztowyTextbox('kod_pocztowy_firma', 'id_kod_pocztowy_firma', '', 6, 6, '', '');
                    echo '</td></tr><tr name="firma_dane6" id="firma_dane6"><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$miejscowosc).' :</td><td>';
                    KontrolkiHtml::DodajPrzeszukiwanieKontrolka($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wybierz), 'wybierz', 'msc_firma', '', 'msc_id_firma', '', 'popup/wybor_miejscowosc.php?txt=msc_firma&hid=msc_id_firma', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$miejscowosc));
                    echo '</td></tr><tr name="firma_dane7" id="firma_dane7"><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$ulica).' :</td><td>';
                    KontrolkiHtml::DodajTextbox('ulica_firma', 'id_ulica_firma', '', 40, 15, '');
                    echo '</td></tr><tr name="firma_dane8" id="firma_dane8"><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nr_dom).' :</td><td>';
                    KontrolkiHtml::DodajTextbox('numer_dom_firma', 'id_numer_dom_firma', '', 10, 10, '');
                    echo '</td></tr><tr name="firma_dane9" id="firma_dane9"><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nr_mieszkanie).' :</td><td>';
                    KontrolkiHtml::DodajTextbox('numer_miesz_firma', 'id_numer_miesz_firma', '', 10, 10, '');
                    echo '</td></tr>';
                }
                
                echo '<tr name="firma_dane10" id="firma_dane10"><td>';
                $tabPodpowiedzi = 'Array(\''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nazwa_firma).'\', \''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$miejscowosc).'\')';
                KontrolkiHtml::DodajSubmit('aktualizuj_klient', 'id_aktualizuj_klient', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$aktualizuj).'.', 'onclick="return WalidacjaFormularz(Array(nazwa_firma, msc_firma), '.$tabPodpowiedzi.', \''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$brak).' : \');"');
                echo '</td></tr><tr name="dane_os_fiz" id="dane_os_fiz"><td>';
                KontrolkiHtml::DodajSubmit('aktualizuj_klient', 'id_aktualizuj_klient', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$aktualizuj).'.', '');
                
                echo '<script>PokazUkryjFirmaDane(document.getElementById("osobowosc_id").value, '.$osoba_prawna.', \'firma_dane\');</script>';
                echo '</td></tr>';
                echo '</table><hr />';
            }
        }
        if (isset($_POST['osoba_id_dod']))
        {
            $dal = new OsobaDAL($_POST['osoba_id_dod']);
            $tabParametr[OsobaDAL::$id_klient] = $klient_id;
            $wynik = $dal->DodajOsobaKlient($tabParametr, true);
            
            if (!$wynik)
            {
                UtilsUI::InfoBlad($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_nie_powiodla_sie));
            }
        }
        if ($klient_id != null) 
        {
            if (!isset($_POST['edytuj_klient']))
            {
                //UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$numer_klienta).' : '.$klient_id);
                $dal = new OsobaDAL(null);
                
                
                $wynik = $dal->PodajOsobaKlient($klient_id, $ilosc_wierszy);
                
                if ($ilosc_wierszy > 0)
                {
                    $popupObj = new PopUpWysw(); 
                    
                    UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$klient));
                    echo '<hr />';
                    UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$edycja_osoby));
                    echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'">';
                    KontrolkiHtml::DodajHidden(KlientDAL::$id_klient, KlientDAL::$id_klient, $klient_id);
                    if ($zapotrzebowanie_id != null)
                    {
                        KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_zapotrzebowanie, NieruchomoscDAL::$id_zapotrzebowanie, $zapotrzebowanie_id);
                    }
                    if ($oferta_id != null)
                    {
                        KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_oferta, NieruchomoscDAL::$id_oferta, $oferta_id);
                    }
                    
                    if ($zapotrzebowanie_id != null)
                    {
                        $tabParametr[OsobaDAL::$id_zapotrzebowanie] = $zapotrzebowanie_id;
                        $osoba_otw = $dal->PodajOsobaZapotrzebowanie($tabParametr, $ilosc_wierszy);
                        $osoba_otw = UtilsDAL::TabIdNazwa2TabIndexId($osoba_otw, OsobaDAL::$id_osoba, OsobaDAL::$id_osoba);
                                                    /////oooooo - to jest array id => id, taki podawac z bazy i wyjazd :P
                        UtilsUI::DodajTabWyroznien($osoba_otw, $zielony);
                        
                        $popupObj->nag = array(tags::$posiada_do_sprzedazy_wynajmu);
                        $popupObj->przyc_nazwa = array(tags::$posiada_do_sprzedazy_wynajmu);
                        $popupObj->url = array('popup/media_os_klient.php?'.$oferta_hidden.'='.tags::$oferuje.'&'.OsobaDAL::$id_osoba);
                    }
                    if ($oferta_id != null)
                    {
                        $tabParametr[OsobaDAL::$id_oferta] = $oferta_id;
                        $osoba_otw = $dal->PodajOsobaOferta($tabParametr, $ilosc_wierszy);
                        $osoba_otw = UtilsDAL::TabIdNazwa2TabIndexId($osoba_otw, OsobaDAL::$id_osoba, OsobaDAL::$id_osoba);
                                                    /////oooooo - to jest array id => id, taki podawac z bazy i wyjazd :P
                        UtilsUI::DodajTabWyroznien($osoba_otw, $zielony);
                        
                        $popupObj->nag = array(tags::$poszukuje_do_kupna_najmu);
                        $popupObj->przyc_nazwa = array(tags::$poszukuje_do_kupna_najmu);
                        $popupObj->url = array('popup/media_os_klient.php?'.$oferta_hidden.'='.tags::$poszukuje.'&'.OsobaDAL::$id_osoba);
                    }
                    
                    $popupObj->szerokosc = array(900);
                    $popupObj->dlugosc = array(700);
                    
                    if ($uprawnienia->adm_klient)
                    {
                        $popupObj->nag[] = tags::$informacje_o_bankach;
                        $popupObj->przyc_nazwa[] = tags::$informacje_o_bankach;
                        $popupObj->url[] = 'popup/info_bank.php?'.OsobaDAL::$id_osoba;
                        $popupObj->szerokosc[] = 900;
                        $popupObj->dlugosc[] = 700;
                    }
                    //KontrolkiHtml::DodajPopUpButton($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$informacje_o_bankach), 'info_o_bankach', 'popup/', 500, 500);
                    
                    UtilsUI::$rekordy = $ilosc_wierszy;
                    UtilsUI::WyswietlTab1Poz($wynik, array(OsobaDAL::$id_osoba, OsobaDAL::$nazwisko, OsobaDAL::$imie, OsobaDAL::$pesel, OsobaDAL::$telefon), 
                    array('id', tags::$nazwisko, tags::$imie, tags::$pesel, tags::$telefon),
                    OsobaDAL::$id_osoba, 'osoba_id', array(Akcja::$edycja => 1), null, null, $popupObj);
                    echo '</form><hr />';
                }
                //region grid znalezionych osob w wyniku przeszukiwania
                if (isset($_POST['szukaj_osoba']))
                {
                    $dal = new OsobaDAL(null);
                    $tabParametr[OsobaDAL::$nazwisko] = $_POST['nazwisko_szukaj'];
                    $wynik = $dal->SzukajOsoba($tabParametr, $ilosc_wierszy);
                    if ($ilosc_wierszy > 0)
                    {
                        UtilsUI::$strona = 10;
                        UtilsUI::$rekordy = $ilosc_wierszy;
                        UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$znalezione_osoby));
                        echo '<form action= "'.$_SERVER['PHP_SELF'].'" method= "POST">';
                        KontrolkiHtml::DodajHidden(KlientDAL::$id_klient, KlientDAL::$id_klient, $klient_id);
                        if ($zapotrzebowanie_id != null)
                        {
                            KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_zapotrzebowanie, NieruchomoscDAL::$id_zapotrzebowanie, $zapotrzebowanie_id);
                        }
                        if ($oferta_id != null)
                        {
                            KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_oferta, NieruchomoscDAL::$id_oferta, $oferta_id);
                        }

                        UtilsUI::WyswietlTab1Poz($wynik, array(OsobaDAL::$imie, OsobaDAL::$nazwisko, OsobaDAL::$pesel, OsobaDAL::$telefon), 
                        array(tags::$imie, tags::$nazwisko, tags::$pesel, tags::$telefon), NieruchomoscDAL::$id_osoba, 'osoba_id_dod', array(Akcja::$dodawanie => 1));
                        echo '</form>';
                    }
                }
                ///koniec regionu przeszukiwania istniejacych osob
                
                //region przeszukiwanie istniejacych osob
                UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$dodawanie_istniejacej_osoby_do_klienta));
                echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'"><table><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nazwisko).' :</td><td>';
                KontrolkiHtml::DodajHidden(KlientDAL::$id_klient, KlientDAL::$id_klient, $klient_id); 
                if ($zapotrzebowanie_id != null)
                {
                    KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_zapotrzebowanie, NieruchomoscDAL::$id_zapotrzebowanie, $zapotrzebowanie_id);
                }
                if ($oferta_id != null)
                {
                    KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_oferta, NieruchomoscDAL::$id_oferta, $oferta_id);
                }
                
                KontrolkiHtml::DodajTextbox('nazwisko_szukaj', 'id_txt_nazwisko', '', 20, 20, '');
                echo '</td><td>';
                KontrolkiHtml::DodajSubmit('szukaj_osoba','id_szukaj',$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$szukaj).'.','');
                echo '</td></tr></table></form><hr />';
                ///koniec regionu przeszukiwania istniejacych osob
                
                if (!isset($_POST['edycja'])) 
                {
                    UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$dodawanie_nowej_osoby_do_klienta));
                    
                    echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'">';
                    KontrolkiHtml::DodajHidden(KlientDAL::$id_klient, KlientDAL::$id_klient, $klient_id);
                    if ($zapotrzebowanie_id != null)
                    {
                        KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_zapotrzebowanie, NieruchomoscDAL::$id_zapotrzebowanie, $zapotrzebowanie_id);
                    }
                    if ($oferta_id != null)
                    {
                        KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_oferta, NieruchomoscDAL::$id_oferta, $oferta_id);
                    }
                    echo '<table><tr><td>';
                    
                    echo '<table><tr><td>';
                    KontrolkiHtml::DodajCheckbox('imie_hid', 'imie_hid', false, '', 'onclick=PokazUkryjImie();');
                    echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$imie).' :</td><td name="combo_imie" id="combo_imie">';                    
                    KontrolkiHtml::DodajSelectZrodSlownik('imie', 'id_sel_imie', SlownikDAL::$imie, 'imie_id', null, '', '');
                    echo '<td name="listwa_imie" id="listwa_imie" style="display: none;">';
                    KontrolkiHtml::DodajTextbox('imie_alt', 'id_imie_alt', '', 20, 20, '');
                    echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nazwisko).' :</td><td>';
                    KontrolkiHtml::DodajTextbox('nazwisko', 'id_nazwisko', '', 30, 15, '', true);
                    echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nazwisko_rodowe).' :</td><td>';
                    KontrolkiHtml::DodajTextbox('nazwisko_rodowe', 'id_nazwisko_rodowe', '', 15, 15, '');
                    echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$pesel).' :</td><td>';
                    KontrolkiHtml::DodajLiczbaCalkowitaTextbox('pesel', 'id_pesel', '', 11, 11, 'onblur="WalidacjaPesel(this, \''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$bledny_pesel).'\');"');
                    echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$dokument_tozsamosci).' :</td><td>';
                    KontrolkiHtml::DodajSelectZrodSlownik('dokument_toz_rodzaj', 'id_dokument_toz_rodzaj', SlownikDAL::$rodzaj_dowod_tozsamosc, 'rodzaj_dowod_tozsamosc_id', null, '', '');
                    echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nr_dokument_tozsamosci).' :</td><td>';
                    KontrolkiHtml::DodajTextbox('nr_dowod', 'id_nr_dowod', '', 15, 15, '');
                    echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$telefon).' :</td><td>';
                    KontrolkiHtml::DodajTelefonTextbox('telefon', 'id_telefon', '', 13, 10, '', '', true);
                    echo '&nbsp;&nbsp;&nbsp;'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$opis).' : ';
                    KontrolkiHtml::DodajTextbox('telefon_opis', 'id_telefon_opis', '', 20, 15, '');
                    echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$telefon).' (2) :</td><td>';
                    KontrolkiHtml::DodajTelefonTextbox('telefon2', 'id_telefon2', '', 13, 10, '', '');
                    echo '&nbsp;&nbsp;&nbsp;'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$opis).' : ';
                    KontrolkiHtml::DodajTextbox('telefon_opis2', 'id_telefon_opis2', '', 20, 15, '');
                    echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$telefon).' (3) :</td><td>';
                    KontrolkiHtml::DodajTelefonTextbox('telefon3', 'id_telefon3', '', 13, 10, '', '');
                    echo '&nbsp;&nbsp;&nbsp;'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$opis).' : ';
                    KontrolkiHtml::DodajTextbox('telefon_opis3', 'id_telefon_opis3', '', 20, 15, '');
                    echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$telefon_komorkowy).' :</td><td>';
                    KontrolkiHtml::DodajKomorkaTextbox('telefon_kom', 'id_telefon_kom', '', 9, 9, '', '');
                    echo '&nbsp;&nbsp;&nbsp;'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$opis).' : ';
                    KontrolkiHtml::DodajTextbox('telefon_kom_opis', 'id_telefon_kom_opis', '', 20, 15, '');
                    echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$adres_email).' :</td><td>';
                    KontrolkiHtml::DodajEmailTextbox('adres_email', 'id_adres_email', '', 30, 20, '', '');
                    echo '&nbsp;&nbsp;&nbsp;'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$opis).' : ';
                    KontrolkiHtml::DodajTextbox('adres_email_opis', 'id_adres_email_opis', '', 20, 15, '');
                    echo '</td></tr><tr><td>';
                    
                    $tabPodpowiedzi = 'Array(\''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nazwisko).'\', \''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$telefon).'\')'; 
                    
                    KontrolkiHtml::DodajSubmit('dodaj_osoba', 'id_dodaj_osoba', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$dodaj).'.', 'onclick="return WalidacjaFormularz(Array(nazwisko, telefon), '.$tabPodpowiedzi.', \''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$brak).' : \');"');
                    echo '</td><td>';
                    KontrolkiHtml::DodajCheckbox('dodaj_jako_oferent', 'id_dodaj_jako_oferent', true, $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$osoba_otwiera_zlecenie), '');
                    echo '</td></tr></table>';
                    
                    echo '</td><td>';
                    
                    echo '<table><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$kod_pocztowy).' :</td><td>';
                    KontrolkiHtml::DodajKodPocztowyTextbox('kod_pocztowy', 'id_kod_pocztowy', '', 6, 6, '', '');
                    echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$miejscowosc).' :</td><td>';
                    KontrolkiHtml::DodajPrzeszukiwanieKontrolka($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wybierz), 'wybierz', 'msc_osoba', '', 'msc_id_osoba', '', 'popup/wybor_miejscowosc.php?txt=msc_osoba&hid=msc_id_osoba', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$miejscowosc));
                    echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$ulica).' :</td><td>';
                    KontrolkiHtml::DodajTextbox('ulica', 'id_ulica', '', 40, 15, '');
                    echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nr_dom).' :</td><td>';
                    KontrolkiHtml::DodajTextbox('numer_dom', 'id_numer_dom', '', 10, 10, '');
                    echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nr_mieszkanie).' :</td><td>';
                    KontrolkiHtml::DodajTextbox('numer_miesz', 'id_numer_miesz', '', 10, 10, '');
                    echo '</td></tr></table>';
                    
                    echo '</td></tr></table></form><hr />';
                }
            
                echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'">';
                KontrolkiHtml::DodajHidden(KlientDAL::$id_klient, KlientDAL::$id_klient, $klient_id);
                if ($zapotrzebowanie_id != null)
                {
                    KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_zapotrzebowanie, NieruchomoscDAL::$id_zapotrzebowanie, $zapotrzebowanie_id);
                }
                if ($oferta_id != null)
                {
                    KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_oferta, NieruchomoscDAL::$id_oferta, $oferta_id);
                }
                
                
                
                KontrolkiHtml::DodajSubmit('edytuj_klient', 'id_edytuj_klient', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$edycja_klienta), '');
                echo '</form>';
                echo '<table><tr><td>';
                //zmiany
                echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'"><table>';
                KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_klient, NieruchomoscDAL::$id_klient, $klient_id);
                echo '<tr><td><b>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$notatka).' : </b></td></tr><tr><td>'; 
                KontrolkiHtml::DodajTextArea('tresc_not','id_tresc_not','','40','5','');
                echo '</td></tr><tr><td>';
                KontrolkiHtml::DodajSubmit('dodaj_notatka', 'id_dodaj_notatka', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$dodaj), '');
                echo '</tr></td></table></form>';
                echo '</td><td>';
                $dal = new KlientDAL();
                $wynik = $dal->PodajNotatkaKlient(array(KlientDAL::$id_klient => $klient_id), $ilosc_wierszy);
                if($ilosc_wierszy > 0)
                {
                    
                    echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'">';
                    KontrolkiHtml::DodajHidden(KlientDAL::$id_klient, KlientDAL::$id_klient, $klient_id);
                    UtilsUI::WyswietlTab1Poz($wynik, array(KlientDAL::$tresc, KlientDAL::$data, KlientDAL::$agent),
                    array(tags::$notatka, tags::$data, tags::$agent), KlientDAL::$id_notatka, 'notatka_id', array(Akcja::$kasowanie => 1));
                    echo '</form>';
                }
                echo '</td></tr></table>';
                //KontrolkiHtml::DodajPopUpButton($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$notatka_o_kliencie), 'notatka', 'popup/notatka_klient.php?'.KlientDAL::$id_klient.'='.$klient_id, 600, 600);
            }
        }
        echo '<hr />';
        KontrolkiHtml::DodajSubmit('ok', 'id_ok', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zakoncz), 'onclick="window.close();"');
    }
    require('../stopka.php');

?>
</body>
</html>
