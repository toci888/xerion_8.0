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
        echo 'Nie jesteĹ› zalogowany.';
    }
    else
    {
        $tlumaczenia = cachejezyki::Czytaj();
        $agent_zal = unserialize($_SESSION[$dane_agent]);
        $agentdal = new AgentDAL();
        
        foreach ($agent_zal->bank as $klucz => $wartosc)
        {
            $konta[] = array('id' => $klucz, 'nazwa' => $wartosc);
        }
        
        $numer_faktury = null;
        $miesiac_faktury = date('m');
        $rok_faktury = date('y');
        $data_wystawienia = $data_dzienna;
        $data_sprzedazy = $data_dzienna;
        $forma_platnosci_id = null;
        $termin_platnosci = $data_dzienna;
        $kwota_netto = null;
        $rachunek_id = null;
        $nip = '754-000-96-00';
        $osoba_nazwa = 'A. Z. Gwarancja Andrzej Zapart';
        $adres = 'ul. Szarych Szeregów 34d, 45-285 Opole';
        $nazwa_uslugi = null;
        
        if (isset($_POST['zatwierdz']))
        {
            $numer_faktury = $_POST['numer_faktury'];
            $miesiac_faktury = $_POST['miesiac_faktury'];
            $rok_faktury = $_POST['rok_faktury'];
            $data_wystawienia = $_POST['data_wystawienia'];
            $data_sprzedazy = $_POST['data_sprzedazy'];
            $forma_platnosci_id = $_POST['forma_platnosci_id'];
            $termin_platnosci = $_POST['termin_platnosci'];
            $kwota_netto = $_POST['kwota_netto'];
            $rachunek_id = $_POST['rachunek_id'];
            $nip = $_POST['nip'];
            $osoba_nazwa = $_POST['osoba_nazwa'];
            $adres = $_POST['adres'];
            $nazwa_uslugi = $_POST['nazwa_uslugi'];
        }
        
        //formularz
        $tab_forma_platnosci = array(0 => array('id' => 1, 'nazwa' => tags::$przelew), 1 => array('id' => 2, 'nazwa' => tags::$gotowka));
        echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'" name="faktura"><table><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nr_faktury).':</td><td>'.
        $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$data_wystawienia).':</td><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$data_sprzedazy).':</td><td>'.
        $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$forma_platnosci).':</td><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$termin_platnosci).':</td><td>'.
        $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$kwota_uslugi_netto).':</td><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$rachunek).':</td></tr>';
        echo '<tr><td>';
        KontrolkiHtml::DodajLiczbaCalkowitaTextbox('numer_faktury', 'id_numer_faktury', $numer_faktury, 4, 3, '', true);
        echo ' / ';
        KontrolkiHtml::DodajLiczbaCalkowitaTextbox('miesiac_faktury', 'id_miesiac_faktury', $miesiac_faktury, 2, 2, '', true);
        echo ' / ';
        KontrolkiHtml::DodajLiczbaCalkowitaTextbox('rok_faktury', 'id_rok_faktury', $rok_faktury, 4, 2, '', true);
        echo '</td><td>';
        KontrolkiHtml::DodajTextboxData('data_wystawienia', 'id_data_wystawienia', $data_wystawienia, 10, 10, $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podana_inf_nie_jest_data), '', '', 'faktura', '', true);
        echo '</td><td>';
        KontrolkiHtml::DodajTextboxData('data_sprzedazy', 'id_data_sprzedazy', $data_wystawienia, 10, 10, $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podana_inf_nie_jest_data), '', '', 'faktura', '', true);
        echo '</td><td>';
        KontrolkiHtml::DodajSelectDomWartId('forma_platnosci', 'id_forma_platnosci', $tab_forma_platnosci, 'forma_platnosci_id', $forma_platnosci_id, '', '');
        echo '</td><td>';
        KontrolkiHtml::DodajTextboxData('termin_platnosci', 'id_termin_platnosci', $termin_platnosci, 10, 10, $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podana_inf_nie_jest_data), '', '', 'faktura', '', true);
        echo '</td><td>';
        KontrolkiHtml::DodajLiczbaWymiernaTextbox('kwota_netto', 'id_kwota_netto', $kwota_netto, 9, 8, '', true);
        echo '</td><td>';
        KontrolkiHtml::DodajSelectDomWartId('rachunek', 'id_rachunek', $konta, 'rachunek_id', $rachunek_id, '', '');
        echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nip).':</td><td colspan="2">'.
        $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$imie_nazwisko_nazwa_nabywcy).':</td><td colspan="2">'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$adres_zamieszkania_lub_siedziba_nabywcy).':</td><td colspan="2">'.
        $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nazwa_uslugi).':</td></tr><tr><td>';
        KontrolkiHtml::DodajTextbox('nip', 'id_nip', $nip, 13, 10, '', true); //zrobic walidacje nip lub nip textbox
        echo '</td><td colspan="2">';
        KontrolkiHtml::DodajTextArea('osoba_nazwa', 'id_osoba_nazwa', $osoba_nazwa, 25, 2, '', '');
        echo '</td><td colspan="2">';
        KontrolkiHtml::DodajTextArea('adres', 'id_adres', $adres, 25, 2, '', '');
        echo '</td><td colspan="2">';
        KontrolkiHtml::DodajTextArea('nazwa_uslugi', 'id_nazwa_uslugi', $nazwa_uslugi, 30, 3, '', '');
        echo '</td></tr>';
        echo '<tr><td>';
        $tabPodpowiedzi = 'Array(\''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nr_faktury).'\', \''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$miesiac).'\', 
        \''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$rok).'\', \''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$data_wystawienia).'\', \''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$data_sprzedazy).'\', 
        \''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$termin_platnosci).'\', \''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$kwota_uslugi_netto).'\', 
        \''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nip).'\')';
        KontrolkiHtml::DodajSubmit('zatwierdz', 'id_zatwierdz', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zatwierdz), 
        'onclick="return WalidacjaFormularz(Array(numer_faktury, miesiac_faktury, rok_faktury, data_wystawienia, data_sprzedazy, termin_platnosci, kwota_netto, nip), 
        '.$tabPodpowiedzi.', \''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$brak).' : \');"');
        
        echo '</td></tr></table>';
        
        if (isset($_POST['zatwierdz']))
        {
            echo '<hr />';
            if (true) //ewentualnie jakies warunki walidacyjne
            {
                KontrolkiHtml::DodajPopUpButton($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$drukuj_oryginal), 'pokaz_faktura', 'popup/faktura.php?rodzaj=org&numer_faktury='.$numer_faktury.'&miesiac_faktury='.$miesiac_faktury.
                '&rok_faktury='.$rok_faktury.'&data_wystawienia='.$data_wystawienia.'&data_sprzedazy='.$data_sprzedazy.'&forma_platnosci='.$_POST['forma_platnosci'].'&termin_platnosci='.$termin_platnosci.
                '&kwota_netto='.$kwota_netto.'&rachunek='.$_POST['rachunek'].'&rachunek_id='.$rachunek_id.'&nip='.$nip.'&osoba_nazwa='.urlencode($osoba_nazwa).'&adres='.urlencode($adres).
                '&nazwa_uslugi='.urlencode($nazwa_uslugi), $szer_lista_wsk, $dl_lista_wsk);
                
                echo '&nbsp;&nbsp;&nbsp;&nbsp;';
                
                KontrolkiHtml::DodajPopUpButton($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$drukuj_kopie), 'pokaz_faktura', 'popup/faktura.php?rodzaj=kop&numer_faktury='.$numer_faktury.'&miesiac_faktury='.$miesiac_faktury.
                '&rok_faktury='.$rok_faktury.'&data_wystawienia='.$data_wystawienia.'&data_sprzedazy='.$data_sprzedazy.'&forma_platnosci='.$_POST['forma_platnosci'].'&termin_platnosci='.$termin_platnosci.
                '&kwota_netto='.$kwota_netto.'&rachunek='.$_POST['rachunek'].'&rachunek_id='.$rachunek_id.'&nip='.$nip.'&osoba_nazwa='.urlencode($osoba_nazwa).'&adres='.urlencode($adres).
                '&nazwa_uslugi='.urlencode($nazwa_uslugi), $szer_lista_wsk, $dl_lista_wsk);
            }
            else
            {
                
            }
        }
    }
    require('../stopka.php');
?>
</body>
</html>
