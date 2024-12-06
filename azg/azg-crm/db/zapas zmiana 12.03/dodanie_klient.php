<html><head><title>A.Z.Gwarancja - Baza Danych</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/style.css" rel="stylesheet" type="text/css"></head>
  <script language="javascript" src="js/script.js"></script>
<body class="logo">
<?php
    include_once ('bll/cache.php');
    include_once ('bll/jezykibll.php');
    include_once ('bll/tags.php');
    include_once ('bll/parametrynierbll.php');
    include_once ('bll/agentbll.php');
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
        /*if (isset($_POST['zatwierdz_zn_kl']))
        {
            if (isset($_POST[NieruchomoscDAL::$id_klient]))
            {
                if (strlen($_POST[NieruchomoscDAL::$id_klient]) > 0)
                {
                    $_SESSION[NieruchomoscDAL::$id_klient] = $_POST[NieruchomoscDAL::$id_klient];
                    //przekierowanie do skryptu dadanie_oferta
                    if ($_SESSION[$posiada_poszukuje] == tags::$oferta)
                    {
                        header('location: dodanie_oferta.php');
                    }
                    else
                    {
                        header('location: dodanie_zapotrzebowanie.php');
                    }
                }
            }
        }
        if (isset($_POST['zatwierdz']))
        {
            $agent_zal = unserialize($_SESSION[$dane_agent]);
            $dal = new NieruchomoscDAL();
            //skonstruowac tablice parametrow dla metody dodaj klient wywolywanej z obiektu $dal
            if (strlen($_POST['msc_id_osoba']) > 0)
            {
                $tabParametr[NieruchomoscDAL::$id_region_geog] = $_POST['msc_id_osoba'];
            }
            if (strlen($_POST['ist_osoba_id']) > 0)
            {
                $tabParametr[NieruchomoscDAL::$id_osoba] = $_POST['ist_osoba_id'];
            }
            $tabParametr[NieruchomoscDAL::$id_osobowosc] = $_POST['osobowosc_id'];
            $tabParametr[NieruchomoscDAL::$agent] = $agent_zal->id;
            $tabParametr[NieruchomoscDAL::$kod] = $_POST['kod_pocztowy'];
            $tabParametr[NieruchomoscDAL::$ulica] = $_POST['ulica'];
            $tabParametr[NieruchomoscDAL::$nr_dom] = $_POST['numer_dom'];
            $tabParametr[NieruchomoscDAL::$nr_mieszkanie] = $_POST['numer_miesz'];
            $tabParametr[NieruchomoscDAL::$nazwa_firma] = $_POST['nazwa_firma'];
            $tabParametr[NieruchomoscDAL::$nip] = $_POST['nip'];
            $tabParametr[NieruchomoscDAL::$regon] = $_POST['regon'];
            $tabParametr[NieruchomoscDAL::$krs] = $_POST['krs'];
            $tabParametr[NieruchomoscDAL::$kod_firma] = $_POST['kod_pocztowy_firma'];
            $tabParametr[NieruchomoscDAL::$id_region_geog_firma] = $_POST['msc_id_firma'];
            $tabParametr[NieruchomoscDAL::$ulica_firma] = $_POST['ulica_firma'];
            $tabParametr[NieruchomoscDAL::$nr_dom_firma] = $_POST['numer_dom_firma'];
            $tabParametr[NieruchomoscDAL::$nr_mieszkanie_firma] = $_POST['numer_miesz_firma'];
            $tabParametr[NieruchomoscDAL::$id_imie] = $_POST['imie_id'];
            $tabParametr[NieruchomoscDAL::$nazwisko] = $_POST['nazwisko']; 
            $tabParametr[NieruchomoscDAL::$nazwisko_rodowe] = $_POST['nazwisko_rodowe']; 
            $tabParametr[NieruchomoscDAL::$pesel] = $_POST['pesel']; 
            $tabParametr[NieruchomoscDAL::$id_rodzaj_dowod_tozsamosc] = $_POST['rodzaj_dowod_tozsamosc_id'];
            $tabParametr[NieruchomoscDAL::$nr_dowod] = $_POST['nr_dowod'];
            //if (strlen($_POST['telefon']) > 0)
                $tabParametr[NieruchomoscDAL::$telefon] = $_POST['telefon'];
            //if (strlen($_POST['telefon_kom']) > 0)
                $tabParametr[NieruchomoscDAL::$komorka] = $_POST['telefon_kom'];
            //if (strlen($_POST['adres_email']) > 0)
                $tabParametr[NieruchomoscDAL::$email] = $_POST['adres_email'];
                
            $tabParametr[NieruchomoscDAL::$telefon_opis] = $_POST['telefon_opis'];
            $tabParametr[NieruchomoscDAL::$komorka_opis] = $_POST['telefon_kom_opis'];
            $tabParametr[NieruchomoscDAL::$email_opis] = $_POST['adres_email_opis'];
            
            //$tabParametr[NieruchomoscDAL::$id_region_geog] = $_POST['msc_id_osoba'];
            
            $wynik = $dal->DodajKlient($tabParametr);
            
            //nastepnie zapisanie id nowego klienta i header
            $_SESSION[NieruchomoscDAL::$id_klient] = $wynik[NieruchomoscDAL::$id_klient];
            if (isset($wynik[NieruchomoscDAL::$id_klient]))
            {
                if ($_SESSION[$posiada_poszukuje] == tags::$oferta)
                {
                    header('location: dodanie_oferta.php');
                }
                else
                {
                    header('location: dodanie_zapotrzebowanie.php');
                }
            }
            else
            {
                //komentarz o niepowodzeniu
            }
        }*/
        //if (isset($_POST['zatwierdz_transakcje']) || isset($_POST['dodaj_zapotrzebowanie'])) //|| isset($_GET['zatwierdz_zapotrzebowanie'])
        if (isset($_POST['dodaj']))
        {
            //po rozpoczeciu nowej umowy id klienta z sesji powinno zostac zapomniane
            //podobnie caly szereg sesji majacych wplyw na zarzadzanie oferta
            unset ($_SESSION[NieruchomoscDAL::$id_klient]);
            unset($_SESSION[$wynik_ed_of]);
            unset($_SESSION[$param_nier]);
            unset($_SESSION[NieruchomoscDAL::$id_nieruchomosc]);
            unset($_SESSION[NieruchomoscDAL::$id_oferta]);
            unset($_SESSION[$wyb_param_nowa_oferta]);
            unset($_SESSION[NieruchomoscDAL::$id_nieruchomosc]);
            unset($_SESSION[NieruchomoscDAL::$id_oferta]);

            //formularz dodania lub szukania klienta
            echo '<form action= "dodanie_osoba_klient.php" method= "POST">';
            //formular zprzekazuje z lefta w hiddenie czego dotyczy dodanie tego klienta: moze to byc dodanie w celu otworzenia zlecenia na poszukiwanie lub na dodanie oferty
            KontrolkiHtml::DodajHidden($oferta_hidden, $oferta_hidden, $_POST[$oferta_hidden]);
            echo '<table><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$osobowosc).' :</td><td>';
            KontrolkiHtml::DodajSelectZrodSlownik('osobowosc', 'id_but_osobowosc', SlownikDAL::$osobowosc, 'osobowosc_id', null, '', 'onchange="PokazUkryjFirmaDane(this.options[this.selectedIndex].id, '.$osoba_prawna.', \'firma_dane\');"');
            echo '</td></tr><tr name="firma_dane1" id="firma_dane1"><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nazwa_firma).' :</td><td>';
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
            /*echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$istniejaca_osoba).' :</td><td>';
            KontrolkiHtml::DodajPrzeszukiwanieKontrolka($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wybierz), 'wybierz', 'ist_osoba', '', 'ist_osoba_id', '', 'popup/wybor_osoba.php?txt=ist_osoba&hid=ist_osoba_id', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$istniejaca_osoba));
            echo '<tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$imie).' :</td><td>';
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
            KontrolkiHtml::DodajTextbox('numer_miesz', 'id_numer_miesz', '', 10, 10, '');*/
            echo '</td></tr><tr><td>';
            KontrolkiHtml::DodajSubmit('zatwierdz', 'id_zatwierdz', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zatwierdz).'.','');
            echo '</td></tr></table></form>';
            //schowanie lub pokazanie elementow formularza
            echo '<script>PokazUkryjFirmaDane(document.getElementById("osobowosc_id").value, '.$osoba_prawna.', \'firma_dane\');</script>';
            
            /*echo '<form action= "'.$_SERVER['PHP_SELF'].'" method= "POST">';
                
            echo '<table border="1" rules="none"><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$ist_klient).' :</td><td>'; 
            KontrolkiHtml::DodajPrzeszukiwanieKontrolka($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wybierz), 'wybierz', 'wybor_klient', '', NieruchomoscDAL::$id_klient, '', 'popup/wybor_klient.php', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$ist_klient));
            echo '</td></tr><tr><td>'; 
            KontrolkiHtml::DodajSubmit('zatwierdz_zn_kl','id_zatwierdz_zn_kl',$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zatwierdz).'.','');
            echo '</td></tr></table></form>';*/
            
            //$_SESSION[NieruchomoscDAL::$id_klient] - tu dac id w przypadku wyszukania
            
            //dopisac szukanie klientow
            
            //$paramNier = new WyposazenieNierBLL($tabParam);
                   
            //UtilsUI::DodajSekcja($paramNier); 
        }
    }
    require('stopka.php');
?>
</body>
</html>