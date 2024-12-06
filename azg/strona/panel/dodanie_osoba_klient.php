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
        $tlumaczenia = cachejezyki::Czytaj();
        $agent_zal = unserialize($_SESSION[$dane_agent]);

        $dodawany_klient = null; ///zmienna na dane klienta do zapamietania :P
        
        if (isset($_POST['zatwierdz_dodaj_klient']))
        {            
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
            
            $dodawany_klient = serialize($tabParametr); //tu prawdopodobnie konieczna bedzie serializacja 
            //$dodawany_klient = str_replace('"', '', $dodawany_klient); //tu prawdopodobnie konieczna bedzie serializacja 
            //echo($dodawany_klient);
        }
        if (isset($_POST[KlientDAL::$klient]))
        {
            $dodawany_klient = $_POST[KlientDAL::$klient];
        }
        

                //region grid znalezionych osob w wyniku przeszukiwania
        if (isset($_POST['szukaj_osoba']) && $dodawany_klient != null)
        {
            $dal = new OsobaDAL(null);
            $tabParametr[OsobaDAL::$nazwisko] = $_POST['nazwisko_szukaj'];
            $wynik = $dal->SzukajOsoba($tabParametr, $ilosc_wierszy);
            
            if ($ilosc_wierszy > 0)
            {
                UtilsUI::$strona = 10;
                UtilsUI::$rekordy = $ilosc_wierszy;
                UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$znalezione_osoby));
                echo '<form action="okresl_oferta.php" method= "POST">';
                //KontrolkiHtml::DodajCheckbox('dodaj_jako_oferent', 'id_dodaj_jako_oferent', true, 
                //UtilsUI::ZamianaLitery($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$dodaj_jako).' '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$osoba_otwiera_zlecenie)), '');
                KontrolkiHtml::DodajHidden(KlientDAL::$klient, KlientDAL::$klient, $dodawany_klient); 
                KontrolkiHtml::DodajHidden($oferta_hidden, $oferta_hidden, $_POST[$oferta_hidden]);
                
                UtilsUI::WyswietlTab1Poz($wynik, array(OsobaDAL::$id_osoba, OsobaDAL::$imie, OsobaDAL::$nazwisko, OsobaDAL::$pesel, OsobaDAL::$telefon, NieruchomoscDAL::$miejscowosc, NieruchomoscDAL::$ulica), 
                array(tags::$nr_osoby, tags::$imie, tags::$nazwisko, tags::$pesel, tags::$telefon, tags::$miejscowosc, tags::$ulica), 
                NieruchomoscDAL::$id_osoba, 'osoba_id_dod', array(Akcja::$dodawanie => 1));
                echo '</form>';
            }
        }
        ///koniec regionu przeszukiwania istniejacych osob
        
        //region przeszukiwanie istniejacych osob
        if ($dodawany_klient != null)
        {
            UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$dodawanie_istniejacej_osoby_do_klienta)); 
            echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'"><table><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nazwisko).' :</td><td>';
            
            KontrolkiHtml::DodajHidden(KlientDAL::$klient, KlientDAL::$klient, $dodawany_klient); 
            KontrolkiHtml::DodajHidden($oferta_hidden, $oferta_hidden, $_POST[$oferta_hidden]);
            KontrolkiHtml::DodajTextbox('nazwisko_szukaj', 'id_txt_nazwisko', '', 20, 20, '');
            echo '</td><td>';
            KontrolkiHtml::DodajSubmit('szukaj_osoba','id_szukaj',$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$szukaj).'.','');
            echo '</td></tr></table></form><hr />';
            ///koniec regionu przeszukiwania istniejacych osob
        }
        
        if ($dodawany_klient != null)
        {
            ///formularz dodawania nowej osoby
            UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$dodawanie_nowej_osoby_do_klienta));  
            
            echo '<form method="POST" action="okresl_oferta.php">';
            KontrolkiHtml::DodajHidden(KlientDAL::$klient, KlientDAL::$klient, $dodawany_klient); 
            KontrolkiHtml::DodajHidden($oferta_hidden, $oferta_hidden, $_POST[$oferta_hidden]);
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
            //echo '</td><td>';
            //KontrolkiHtml::DodajCheckbox('dodaj_jako_oferent', 'id_dodaj_jako_oferent', true, $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$osoba_otwiera_zlecenie), '');
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

        //na sranie tu jeszcze ten unset ??
        //unset($_SESSION[KlientDAL::$id_klient]);
    }
    require('../stopka.php');

?>
</body>
</html>
