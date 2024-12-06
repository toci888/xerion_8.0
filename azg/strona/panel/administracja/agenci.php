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
    include_once ('../../dal/admDAL.php');
    include_once ('../../ui/kontrolki_html.php');
    include_once ('../../ui/utilsui.php');
    include_once ('../../bll/parametrynierbll.php'); 
    include_once ('../../bll/tags.php'); 
    include_once ('../../bll/agentbll.php');
    include_once ('../../bll/jezykibll.php');
    include_once ('../../bll/cache.php');
    include_once ('../../bll/transnierbll.php');
    require('../../naglowek.php');
    require('../../conf.php');
    
    if (!isset($_SESSION[$zalogowany]))
    {
        echo 'Nie jesteÅ› zalogowany.';
    }
    else
    {
        $uprawnienia = unserialize($_SESSION[$zalogowany]);
        
        if ($uprawnienia->zmiana_upr)
        {
            $tlumaczenia = cachejezyki::Czytaj();
            $agent_zal = unserialize($_SESSION[$dane_agent]);
            
            $dal = new AgenciDAL();
            
            if (isset($_POST['zatwierdz_dodaj_agent']))
            {
                $tabParametr[AgenciDAL::$nazwa] = $_POST['imie_i_nazwisko'];
                $tabParametr[AgenciDAL::$nazwa_pot] = $_POST['skrot'];
                $tabParametr[AgenciDAL::$nazwa_firma] = $_POST['nazwa_firma'];
                $tabParametr[AgenciDAL::$login] = $_POST['login'];
                $tabParametr[AgenciDAL::$haslo] = $_POST['haslo'];
                $tabParametr[AgenciDAL::$telefon] = $_POST['telefon'];
                $tabParametr[AgenciDAL::$komorka] = $_POST['komorka'];
                $tabParametr[AgenciDAL::$fax] = $_POST['fax'];
                $tabParametr[AgenciDAL::$email] = $_POST['email'];
                $tabParametr[AgenciDAL::$licencja] = $_POST['nr_licencji'];
                $tabParametr[AgenciDAL::$id_agent_otodom] = $_POST['id_otodom'];
                $tabParametr[AgenciDAL::$wewnetrzny] = $_POST['wewnetrzny'];
                $tabParametr[AgenciDAL::$nip] = $_POST['nip'];
                $tabParametr[AgenciDAL::$adres] = $_POST['adres'];
                $tabParametr[AgenciDAL::$id_bank] = $_POST['bank_id'];
                $tabParametr[AgenciDAL::$nr_konto] = $_POST['rachunek'];
                
                if (!isset($_POST['dodawanie'])) {$_POST['dodawanie'] = 'false';} else {$_POST['dodawanie'] = 'true';}
                if (!isset($_POST['edycja'])) {$_POST['edycja'] = 'false';} else {$_POST['edycja'] = 'true';}
                if (!isset($_POST['kasowanie'])) {$_POST['kasowanie'] = 'false';} else {$_POST['kasowanie'] = 'true';}
                if (!isset($_POST['druk'])) {$_POST['druk'] = 'false';} else {$_POST['druk'] = 'true';}
                if (!isset($_POST['adm_klient'])) {$_POST['adm_klient'] = 'false';} else {$_POST['adm_klient'] = 'true';}
                if (!isset($_POST['adm_dane'])) {$_POST['adm_dane'] = 'false';} else {$_POST['adm_dane'] = 'true';}
                if (!isset($_POST['zmiana_upr'])) {$_POST['zmiana_upr'] = 'false';} else {$_POST['zmiana_upr'] = 'true';}
                
                $tabParametr[AgenciDAL::$uprawnienia] = array($_POST['dodawanie'], $_POST['edycja'], $_POST['kasowanie'], $_POST['druk'], $_POST['adm_klient'], $_POST['adm_dane'], $_POST['zmiana_upr']);
                
                $wynik = $dal->DodajAgent($tabParametr);
                //ziterpretowac wynik
                //var_dump($wynik);
                if ($wynik[NieruchomoscDAL::$id] == null)
                {
                    UtilsUI::InfoBlad($tlumaczenia->Tlumacz($_SESSION[$jezyk], $wynik[NieruchomoscDAL::$nazwa]));
                }
                else
                {
                    UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_powiodla_sie));
                }
            }
            if (isset($_POST['zatwierdz_aktualizuj_agent']))
            {
                $tabParametr[AgenciDAL::$id_agent] = $_POST[AgenciDAL::$id_agent];
                $tabParametr[AgenciDAL::$nazwa] = $_POST['imie_i_nazwisko'];
                $tabParametr[AgenciDAL::$nazwa_pot] = $_POST['skrot'];
                $tabParametr[AgenciDAL::$nazwa_firma] = $_POST['nazwa_firma'];
                $tabParametr[AgenciDAL::$telefon] = $_POST['telefon'];
                $tabParametr[AgenciDAL::$komorka] = $_POST['komorka'];
                $tabParametr[AgenciDAL::$fax] = $_POST['fax'];
                $tabParametr[AgenciDAL::$email] = $_POST['email'];
                $tabParametr[AgenciDAL::$licencja] = $_POST['nr_licencji'];
                $tabParametr[AgenciDAL::$id_agent_otodom] = $_POST['id_otodom'];
                $tabParametr[AgenciDAL::$wewnetrzny] = $_POST['wewnetrzny'];
                $tabParametr[AgenciDAL::$nip] = $_POST['nip'];
                $tabParametr[AgenciDAL::$adres] = $_POST['adres'];
                
                if (!isset($_POST['dodawanie'])) {$_POST['dodawanie'] = 'false';} else {$_POST['dodawanie'] = 'true';}
                if (!isset($_POST['edycja'])) {$_POST['edycja'] = 'false';} else {$_POST['edycja'] = 'true';}
                if (!isset($_POST['kasowanie'])) {$_POST['kasowanie'] = 'false';} else {$_POST['kasowanie'] = 'true';}
                if (!isset($_POST['druk'])) {$_POST['druk'] = 'false';} else {$_POST['druk'] = 'true';}
                if (!isset($_POST['adm_klient'])) {$_POST['adm_klient'] = 'false';} else {$_POST['adm_klient'] = 'true';}
                if (!isset($_POST['adm_dane'])) {$_POST['adm_dane'] = 'false';} else {$_POST['adm_dane'] = 'true';}
                if (!isset($_POST['zmiana_upr'])) {$_POST['zmiana_upr'] = 'false';} else {$_POST['zmiana_upr'] = 'true';}
                if (!isset($_POST['aktywnosc'])) {$_POST['aktywnosc'] = 'false';} else {$_POST['aktywnosc'] = 'true';}
                
                $tabParametr[AgenciDAL::$uprawnienia] = array($_POST['dodawanie'], $_POST['edycja'], $_POST['kasowanie'], $_POST['druk'], $_POST['adm_klient'], $_POST['adm_dane'], $_POST['zmiana_upr']);
                $tabParametr[AgenciDAL::$aktywnosc] = $_POST['aktywnosc'];
                
                $wynik = $dal->DodajAgent($tabParametr);
                //ziterpretowac wynik
                //var_dump($wynik);
                if ($wynik[NieruchomoscDAL::$id] == null)
                {
                    UtilsUI::InfoBlad($tlumaczenia->Tlumacz($_SESSION[$jezyk], $wynik[NieruchomoscDAL::$nazwa]));
                }
                else
                {
                    UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_powiodla_sie));
                }
            }
            
            if (isset($_POST['edycja']) && isset($_POST['agent_id']))
            {
                $wynik = $dal->EdytujAgent($_POST['agent_id']);
                $wynik = $wynik[0];
                //var_dump($wynik);
                UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$modyfikacja_agenta));
                echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'"><table>';
                KontrolkiHtml::DodajHidden(AgenciDAL::$id_agent, AgenciDAL::$id_agent, $_POST['agent_id']);
                echo '<tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$imie_i_nazwisko).':</td><td>';
                KontrolkiHtml::DodajTextbox('imie_i_nazwisko', 'id_imie_i_nazwisko', $wynik[AgenciDAL::$nazwa], 30, 25, '', true);
                echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$skrot).':</td><td>';
                KontrolkiHtml::DodajTextbox('skrot', 'id_skrot', $wynik[AgenciDAL::$nazwa_pot], 20, 20, '', true);
                echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$telefon).':</td><td>';
                KontrolkiHtml::DodajTelefonTextbox('telefon', 'id_telefon', $wynik[AgenciDAL::$telefon], 13, 12, '', '', true);
                echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$telefon_komorkowy).':</td><td>';
                KontrolkiHtml::DodajKomorkaTextbox('komorka', 'id_komorka', $wynik[AgenciDAL::$komorka], 9, 9, '', '', true);
                echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$fax).':</td><td>';
                KontrolkiHtml::DodajTelefonTextbox('fax', 'id_fax', $wynik[AgenciDAL::$fax], 13, 12, '', '', true);
                echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$adres_email).':</td><td>';
                KontrolkiHtml::DodajEmailTextbox('email', 'id_email', $wynik[AgenciDAL::$email], 25, 22, '', '', true);
                echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nr_licencji).':</td><td>';
                KontrolkiHtml::DodajLiczbaCalkowitaTextbox('nr_licencji', 'id_nr_licencji', $wynik[AgenciDAL::$licencja], 5, 4, '', true);
                echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wewnetrzny).':</td><td>';
                KontrolkiHtml::DodajTextbox('wewnetrzny', 'id_wewnetrzny', $wynik[AgenciDAL::$wewnetrzny], 4, 3, '');
                echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$id_otodom).':</td><td>';
                KontrolkiHtml::DodajLiczbaCalkowitaTextbox('id_otodom', 'id_id_otodom', $wynik[AgenciDAL::$id_agent_otodom], 6, 4, '');
                echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nip).':</td><td>';
                KontrolkiHtml::DodajTextboxNip('nip', 'id_nip', $wynik[AgenciDAL::$nip], '', '');
                echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$adres).':</td><td>';
                KontrolkiHtml::DodajTextbox('adres', 'id_adres', $wynik[AgenciDAL::$adres], 50, 35, '', true);
                echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nazwa_firma).':</td><td>';
                KontrolkiHtml::DodajTextbox('nazwa_firma', 'id_nazwa_firma', $wynik[AgenciDAL::$firma], 25, 20, '');
                echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$uprawnienia).':</td><td>';
                KontrolkiHtml::DodajCheckbox('aktywnosc', 'id_aktywnosc', $wynik[AgenciDAL::$aktywnosc], $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$konto_aktywne), '', 'true');
                echo '&nbsp;&nbsp;';
                KontrolkiHtml::DodajCheckbox('dodawanie', 'id_dodawanie', $wynik[AgenciDAL::$dodawanie], $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$dodaj), '', 'true');
                echo '&nbsp;&nbsp;';
                KontrolkiHtml::DodajCheckbox('edycja', 'id_edycja', $wynik[AgenciDAL::$edycja], $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$edytuj), '', 'true');
                echo '&nbsp;&nbsp;';
                KontrolkiHtml::DodajCheckbox('kasowanie', 'id_kasowanie', $wynik[AgenciDAL::$kasowanie], $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$kasuj), '', 'true');
                echo '&nbsp;&nbsp;';
                KontrolkiHtml::DodajCheckbox('druk', 'id_druk', $wynik[AgenciDAL::$druk], $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$druk), '', 'true');
                echo '&nbsp;&nbsp;';
                KontrolkiHtml::DodajCheckbox('adm_klient', 'id_adm_klient', $wynik[AgenciDAL::$admin_klient], $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$adm_kl), '', 'true');
                echo '&nbsp;&nbsp;';
                KontrolkiHtml::DodajCheckbox('adm_dane', 'id_adm_dane', $wynik[AgenciDAL::$admin_dane], $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$adm_dane), '', 'true');
                echo '&nbsp;&nbsp;';
                KontrolkiHtml::DodajCheckbox('zmiana_upr', 'id_zmiana_upr', $wynik[AgenciDAL::$zmiana_uprawnien], $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zm_upr), '', 'true');
                echo '</td></tr><tr><td>';
                $tabPodpowiedzi = 'Array(\''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$imie_i_nazwisko).'\', \''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$skrot).'\', \''.
                $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$telefon).'\', \''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$telefon_komorkowy).'\', \''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$fax).'\', \''.
                $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$adres_email).'\', \''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$adres).'\', \''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nr_licencji).'\')';

                KontrolkiHtml::DodajSubmit('zatwierdz_aktualizuj_agent', 'id_zatwierdz_aktualizuj_agent', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$aktualizuj), 
                'onclick="return WalidacjaFormularz(Array(imie_i_nazwisko, skrot, telefon, komorka, fax, email, adres, nr_licencji), '.$tabPodpowiedzi.', \''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$brak).' : \');"');
                echo '</td></tr>';
       
                echo '</table></form>';
            }
            if (isset($_POST['dodaj_agent']))
            {
                UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$dodawanie_nowego_agenta));
                echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'"><table>';
                echo '<tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$imie_i_nazwisko).':</td><td>';
                KontrolkiHtml::DodajTextbox('imie_i_nazwisko', 'id_imie_i_nazwisko', '', 30, 25, '', true);
                echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$skrot).':</td><td>';
                KontrolkiHtml::DodajTextbox('skrot', 'id_skrot', '', 20, 20, '', true);
                echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$login).':</td><td>';
                KontrolkiHtml::DodajTextbox('login', 'id_login', '', 20, 20, '', true);
                echo '</td></tr>';
                KontrolkiHtml::DodajHasloKontrolka(array('haslo', 'ponownie_haslo'), array('id_haslo', 'id_ponownie_haslo'), 20, 20, '', true);
                echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$telefon).':</td><td>';
                KontrolkiHtml::DodajTelefonTextbox('telefon', 'id_telefon', '', 13, 12, '', '', true);
                echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$telefon_komorkowy).':</td><td>';
                KontrolkiHtml::DodajKomorkaTextbox('komorka', 'id_komorka', '', 9, 9, '', '', true);
                echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$fax).':</td><td>';
                KontrolkiHtml::DodajTelefonTextbox('fax', 'id_fax', '', 13, 12, '', '', true);
                echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$adres_email).':</td><td>';
                KontrolkiHtml::DodajEmailTextbox('email', 'id_email', '', 25, 22, '', '', true);
                echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nr_licencji).':</td><td>';
                KontrolkiHtml::DodajLiczbaCalkowitaTextbox('nr_licencji', 'id_nr_licencji', '', 5, 4, '', true);
                echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wewnetrzny).':</td><td>';
                KontrolkiHtml::DodajTextbox('wewnetrzny', 'id_wewnetrzny', '', 4, 3, '');
                echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$id_otodom).':</td><td>';
                KontrolkiHtml::DodajLiczbaCalkowitaTextbox('id_otodom', 'id_id_otodom', '', 6, 4, '');
                echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nip).':</td><td>';
                KontrolkiHtml::DodajTextboxNip('nip', 'id_nip', '', '', '');
                echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$adres).':</td><td>';
                KontrolkiHtml::DodajTextbox('adres', 'id_adres', '', 50, 35, '', true);
                echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nazwa_firma).':</td><td>';
                KontrolkiHtml::DodajTextbox('nazwa_firma', 'id_nazwa_firma', '', 25, 20, '');
                echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nazwa_banku).':</td><td>';
                KontrolkiHtml::DodajSelectZrodSlownik('nazwa_bank', 'id_nazwa_bank', SlownikDAL::$bank, 'bank_id', null, '', '');
                echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$rachunek).':</td><td>';
                KontrolkiHtml::DodajLiczbaCalkowitaTextbox('rachunek', 'id_rachunek', '', 26, 28, 'onblur="WalidacjaNrKonto(this, \''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$niepoprawny_nr_rachunku).'\');"');
                echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$uprawnienia).':</td><td>';
                KontrolkiHtml::DodajCheckbox('dodawanie', 'id_dodawanie', true, $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$dodaj), '', 'true');
                echo '&nbsp;&nbsp;';
                KontrolkiHtml::DodajCheckbox('edycja', 'id_edycja', true, $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$edytuj), '', 'true');
                echo '&nbsp;&nbsp;';
                KontrolkiHtml::DodajCheckbox('kasowanie', 'id_kasowanie', false, $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$kasuj), '', 'true');
                echo '&nbsp;&nbsp;';
                KontrolkiHtml::DodajCheckbox('druk', 'id_druk', true, $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$druk), '', 'true');
                echo '&nbsp;&nbsp;';
                KontrolkiHtml::DodajCheckbox('adm_klient', 'id_adm_klient', false, $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$adm_kl), '', 'true');
                echo '&nbsp;&nbsp;';
                KontrolkiHtml::DodajCheckbox('adm_dane', 'id_adm_dane', false, $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$adm_dane), '', 'true');
                echo '&nbsp;&nbsp;';
                KontrolkiHtml::DodajCheckbox('zmiana_upr', 'id_zmiana_upr', false, $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zm_upr), '', 'true');
                echo '</td></tr><tr><td>';
                $tabPodpowiedzi = 'Array(\''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$imie_i_nazwisko).'\', \''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$skrot).'\', \''.
                $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$login).'\', \''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$haslo).'\', \''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$haslo_ponownie).'\', \''.
                $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$telefon).'\', \''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$telefon_komorkowy).'\', \''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$fax).'\', \''.
                $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$adres_email).'\', \''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$adres).'\', \''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nr_licencji).'\')';

                KontrolkiHtml::DodajSubmit('zatwierdz_dodaj_agent', 'id_zatwierdz_dodaj_agent', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$dodaj), 
                'onclick="return WalidacjaFormularz(Array(imie_i_nazwisko, skrot, login, haslo, ponownie_haslo, telefon, komorka, fax, email, adres, nr_licencji), '.$tabPodpowiedzi.', \''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$brak).' : \');"');
                echo '</td></tr>';
       
                echo '</table></form>';
            }
            
            $wynik = $dal->ListaAgentow($ilosc_wierszy);
            
            UtilsUI::$rekordy = $ilosc_wierszy;
            echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'">';
            UtilsUI::WyswietlTab1Poz($wynik, array(AgenciDAL::$nazwa, AgenciDAL::$licencja, AgenciDAL::$aktywnosc, AgenciDAL::$waznosc_haslo, AgenciDAL::$telefon, AgenciDAL::$komorka, AgenciDAL::$fax, AgenciDAL::$email, 
            AgenciDAL::$dodawanie, AgenciDAL::$edycja, AgenciDAL::$kasowanie, AgenciDAL::$druk, AgenciDAL::$admin_klient, AgenciDAL::$admin_dane, AgenciDAL::$zmiana_uprawnien), 
            array(tags::$agent, tags::$licencja, tags::$aktywne, tags::$waznosc_hasla, tags::$telefon, tags::$telefon_komorkowy, tags::$fax, tags::$adres_email, tags::$dodaj, tags::$edytuj, tags::$kasuj, tags::$druk, 
            tags::$adm_kl, tags::$adm_dane, tags::$zm_upr), 
            AgenciDAL::$id_agent, 'agent_id', array(Akcja::$edycja => 1));
            echo '</form>';
            
            echo '<hr /><form method="POST" action="'.$_SERVER['PHP_SELF'].'">';
            KontrolkiHtml::DodajSubmit('dodaj_agent', 'id_dodaj_agent', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$dodaj_agent), '');
            echo '</form>';
            
            //var_dump($wynik);
        }
    }
    require('../../stopka.php');
?>
</body>
</html>
