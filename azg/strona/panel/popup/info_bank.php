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
    include_once ('../../bll/agentbll.php');
    include_once ('../../bll/jezykibll.php');
    include_once ('../../bll/cache.php');
    include_once ('../../bll/transnierbll.php');
    include_once ('../../lib/mail.php');
    require('../../naglowek.php');
    require('../../conf.php');
    
    if (!isset($_SESSION[$zalogowany]))
    {
        echo 'Nie jesteÅ› zalogowany.';
    }
    else
    {
        $uprawnienia = unserialize($_SESSION[$zalogowany]);
        if ($uprawnienia->adm_klient)
        {
            $osoba_id = null;
            $tlumaczenia = cachejezyki::Czytaj();
            
            if (isset($_GET[OsobaDAL::$id_osoba]))
            {
                $osoba_id = $_GET[OsobaDAL::$id_osoba];
            }
            if (isset($_POST[OsobaDAL::$id_osoba]))
            {
                $osoba_id = $_POST[OsobaDAL::$id_osoba];
            }
            if ($osoba_id != null)
            {
                $agent_zal = unserialize($_SESSION[$dane_agent]);
                $dal = new OsobaDAL($osoba_id);
                
                if (isset($_POST['dodaj_bank']))
                {
                    $wynik = $dal->DodajInfOsobaBank(array(OsobaDAL::$id_bank => $_POST['bank_osoba_id']));
                    if (!$wynik)
                    {
                        UtilsUI::InfoBlad($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_nie_powiodla_sie));
                    }
                }
                
                if (isset($_POST['wyslij_mail']))
                {
                    //var_dump($_POST['banki']);
                    //echo '<br />';
                    //var_dump($_POST['telefony']);
                    if (count($_POST['banki']) > 0)
                    {
                        $mail_obj = array();
                        foreach ($_POST['banki'] as $bank)
                        {
                            $b_id_mail = explode(':', $bank);
                            $mail_obj[$b_id_mail[1]] = new MailSend();
                            ///$test_ar[$b_id_mail[1]] = $b_id_mail[0];
                            //$mail_obj[$b_id_mail[1]]->DodajUkrytyOdbiorca($b_id_mail[0]);
                            $mail_obj[$b_id_mail[1]]->DodajUkrytyOdbiorca('informatyk@azg.pl');
                            //echo $b_id_mail[0].'<br />';
                        }
                        $temat = $AZG.' - dane o kliencie skierowanym do banku z biura.';
                        $tresc = $_POST['komentarz'].' Dane osoby: '.$_POST[OsobaDAL::$nazwisko].' '.$_POST[OsobaDAL::$imie].', pesel: '.$_POST[OsobaDAL::$pesel].'.';
                        $tresc_poj = array();
                        foreach ($_POST['telefony'] as $telefon)
                        {
                            $dane_tel = explode(':', $telefon);
                            if (!isset($tresc_poj[$dane_tel[1]]))
                            {
                                $tresc_poj[$dane_tel[1]] = $tresc.' Kontakt: ';
                            }
                            $tresc_poj[$dane_tel[1]] .= $dane_tel[0].', ';
                            ///konczyc
                        }
                        $i = 0;
                        foreach ($mail_obj as $klucz => $mail)
                        {
                            //podstawienie odpowiedniej tresci - z telefonami lub bez - dla odpowiedniego bankowca :P
                            //$klucz - id banku
                            $tr_mail = '';
                            if (isset($tresc_poj[$klucz]))
                            {
                                $tr_mail = $tresc_poj[$klucz];
                            }
                            else
                            {
                                $tr_mail = $tresc;
                            }
                            $mail->WyslijMail($temat, $tr_mail);
                            $i++;
                        }
                        UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wyslano_maili).': '.$i);
                    }
                }
                
                if (isset($_POST['powiadom_banki']))
                {
                    $wynik = $dal->DaneBankiOsoba($ilosc_wierszy);
                    $telefony = $dal->PodajWszystkieTelefony($ilosc_wierszy);
                    $edycja = $dal->EdycjaOsoba();
                    
                    $osoba_dane = $edycja[0];
                    if ($ilosc_wierszy > 0)
                    {
                        UtilsUI::IstotneInfo($osoba_dane[OsobaDAL::$nazwisko].' '.$osoba_dane[OsobaDAL::$imie].', '.$osoba_dane[OsobaDAL::$pesel]);
                        echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'"><table>';
                        KontrolkiHtml::DodajHidden(OsobaDAL::$id_osoba, OsobaDAL::$id_osoba, $osoba_id);
                        KontrolkiHtml::DodajHidden(OsobaDAL::$nazwisko, OsobaDAL::$nazwisko, $osoba_dane[OsobaDAL::$nazwisko]);
                        KontrolkiHtml::DodajHidden(OsobaDAL::$imie, OsobaDAL::$imie, $osoba_dane[OsobaDAL::$imie]);
                        KontrolkiHtml::DodajHidden(OsobaDAL::$pesel, OsobaDAL::$pesel, $osoba_dane[OsobaDAL::$pesel]);
                        $i = 0;
                        foreach ($wynik as $wiersz)
                        {
                            $i++;
                            echo '<tr><td>';                    //lista bankow do poinformowania mailem o kliencie, który otrzymal w azg oferte banku; po dwukropku id banku, na ktore bedzie konstruowana tresc z poszczegolnych telefonow
                            echo '<input type="checkbox" id="'.$wiersz[OsobaDAL::$id_bank].$i.'" name="banki[]" value="'.$wiersz[OsobaDAL::$email].':'.$wiersz[OsobaDAL::$id_bank].'" />
                            <label for="'.$wiersz[OsobaDAL::$id_bank].$i.'">'.$wiersz[OsobaDAL::$bank].': '.$wiersz[OsobaDAL::$nazwisko].' '.$wiersz[OsobaDAL::$imie].'</label>'; //."\n"
                            echo '</td><td>';
                            foreach ($telefony as $telefon)
                            {            //po dwukropku id banku, do ktorego dany telefon moze pojsc lub nie
                                echo '<input type="checkbox" id="'.$telefon[OsobaDAL::$nazwa].$i.'" name="telefony[]" value="'.$telefon[OsobaDAL::$nazwa].':'.$wiersz[OsobaDAL::$id_bank].'" />
                                <label for="'.$telefon[OsobaDAL::$nazwa].$i.'">'.$telefon[OsobaDAL::$nazwa].' - '.$telefon[OsobaDAL::$opis].'</label>'; //."\n"
                                $i++;
                            }
                            echo '</td></tr>';
                        }
                        echo '<tr><td colspan="2">';
                        KontrolkiHtml::DodajTextArea('komentarz', 'id_komentarz', '', 60, 4, '', '');
                        echo '</tr></td><tr><td>';
                        KontrolkiHtml::DodajSubmit('wyslij_mail', 'id_wyslij_mail', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wyslij), '');
                        echo '</td></tr></table></form>';
                    }
                }
                
                $wynik = $dal->PodajDostBankInfo($ilosc_wierszy);
                
                //var_dump($wynik);
                if ($ilosc_wierszy > 0)
                {
                    UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$dodawanie_oferty_banku_przedstawionej_klientowi));
                    echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'">';
                    KontrolkiHtml::DodajHidden(OsobaDAL::$id_osoba, OsobaDAL::$id_osoba, $osoba_id);
                    echo '<table><tr><td>';
                    KontrolkiHtml::DodajSelectDomWartId('bank_dodaj', 'id_bank_dodaj', $wynik, 'bank_osoba_id', null, '', '');
                    echo '</td><td>';
                    KontrolkiHtml::DodajSubmit('dodaj_bank', 'id_dodaj_bank', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$dodaj), '');
                    echo '</td></tr></table>';
                    echo '</form><hr />';
                }
                
                UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$oferty_bankow_przedstawione_klientowi));
                $wynik = $dal->PodajWybBankInfo($ilosc_wierszy);
                if ($ilosc_wierszy > 0)
                {
                    echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'">';
                    KontrolkiHtml::DodajHidden(OsobaDAL::$id_osoba, OsobaDAL::$id_osoba, $osoba_id); 
                    UtilsUI::WyswietlTab1Poz($wynik, array(OsobaDAL::$bank), array(tags::$bank), OsobaDAL::$id_osoba_bank_porada, OsobaDAL::$id_osoba_bank_porada, array(Akcja::$kasowanie => 1));
                    echo '</form><hr />';
                    
                    echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'">';
                    KontrolkiHtml::DodajHidden(OsobaDAL::$id_osoba, OsobaDAL::$id_osoba, $osoba_id);
                    KontrolkiHtml::DodajSubmit('powiadom_banki', 'id_powiadom_banki', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$powiadom_banki), '');
                    echo '</form>';
                }
            }
        }
        echo '<br />';
        KontrolkiHtml::DodajSubmit('ok', 'id_ok', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zakoncz), 'onclick="window.close();"');
    }
    require('../../stopka.php');
?>
</body>
</html>
