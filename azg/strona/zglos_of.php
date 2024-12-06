<HTML>
<HEAD>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <script language="javascript" src="js/script.js"></script>
<link href="azg.css" rel="stylesheet" type="text/css">
</head>
<body>
<?php
    // œ - ¶ ¹ - ±  Ÿ - ¼  - ¬ Œ - ¦
    include_once ('ui/kontrolki_html.php');
    include_once ('lib/mail.php'); 
    include_once ('ui/utilsui.php'); 
    include_once ('bll/waluty.php'); 
    include_once ('bll/tags.php'); 
    include_once ('bll/jezykibll.php');
    include_once ('bll/cache.php');
    include_once ('dal/dal.php');
    require('naglowek.php');
    require('conf.php');
    
    echo '<table '.$atr_tab_srodek.'>'.UtilsUI::DodajTrListwaGlowna($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$formularz_zgloszeniowy_biura_nieruchomosci).' '.$AZG);
    
    echo '<tr><td><table align="center" cellpading="1" cellspacing="1" width="98%" style="border: 1px solid black; background-color: #d5deec;">';

    echo '<form action="'.$_SERVER['PHP_SELF'].'" method="GET">
    <input type="hidden" name="target" value="zglos_of">
    <INPUT TYPE="hidden" NAME="subject" VALUE="'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$oferta).' - '.$AZG.'">';

    echo '<tr align="center"><td span class="polecam">'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podaj_swoje_imie_i_nazwisko).':<br />';
    KontrolkiHtml::DodajTextbox('imieinazwisko', 'id_imieinazwisko', '', 20, 15, '');
    echo '</td><td span class="polecam">'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podaj_telefon_kontaktowy).':<br />';
    KontrolkiHtml::DodajTelefonTextbox('telefon', 'id_telefon', '', 13, 9, '', '');
    echo '</td></tr><tr align="center"><td span class="polecam">'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wybierz_rodzaj_zgloszenia).':<br />';

    $trans_ar = array(array('id' => 1, 'nazwa' => tags::$sprzedaz), array('id' => 2, 'nazwa' => tags::$wynajem), array('id' => 3, 'nazwa' => tags::$zamiana));
    KontrolkiHtml::DodajSelectDomWartId('Rodzajzgloszenia', 'id_transakcje', $trans_ar, StronaPodsInfoDAL::$id_trans_rodzaj.'zg_of', null, '', '');

    $obiektTrans = new TransNierDAL();      
    $tabNier = $obiektTrans->PodajListeNieruchomosci($ilosc_wierszy);

    echo '</td><td span class="polecam">'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wybierz_przedmiot_zgloszenia).':<br />';
    KontrolkiHtml::DodajSelectDomWartId('Przedmiotzgloszenia', 'id_Przedmiotzgloszenia', $tabNier, StronaPodsInfoDAL::$id_nier_rodzaj.'zg_of', null, '', '', TransNierDAL::$id, TransNierDAL::$nazwa_nieruchomosc);

    echo '</td></tr><tr align="center"><td span class="polecam">'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$lokalizacja_nieruchomosci).':<br />';
    KontrolkiHtml::DodajTextbox('Lokalizacja', 'id_Lokalizacja', '', 20, 15, '');

    echo '</td><td span class="polecam">'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$cena_nieruchomosci).':<br />';
    KontrolkiHtml::DodajLiczbaWymiernaTextbox('Cena', 'id_Cena', '', 9, 8, '');

    echo '</td></tr><tr align="center"><td colspan="2" span class="polecam">'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$opis_nieruchomosci).':<br />';

    KontrolkiHtml::DodajTextArea('opis', 'id_opis', '', 30, 5, '');


    echo '</td></tr><tr align="center"><td colspan="2" span class="polecam">'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$adres_email).':<br />';
    KontrolkiHtml::DodajEmailTextbox('email', 'id_email', '', 30, 20, '', '');

    echo "</td></tr><tr align=\"center\">
    <td colspan =\"2\" span class=\"polecam\">";
    //walidacja
    $tabPodpowiedzi = 'Array(\''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$imie_i_nazwisko).'\', \''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$telefon).'\', \''.
    $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$lokalizacja_nieruchomosci).'\', \''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$cena_nieruchomosci).'\', \''.
    $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$adres_email).'\')';
    KontrolkiHtml::DodajSubmit('wyslij_zg_of', 'id_wyslij', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zatwierdz), 'onclick="return WalidacjaFormularz(Array(imieinazwisko, telefon, Lokalizacja, Cena, email), '.$tabPodpowiedzi.', \''.
    $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$brak).' : \');"');

    echo '</td></tr></form><tr><td colspan="2">
    <ul><li span class="polecam">'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$po_prawidlowym_wypelnieniu_oferty_przycisnij_przycisk).': &quot;'.
    $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zatwierdz).'&quot;</ul>';
    echo '<span class="polecam">'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zgodnia_z_ustawa_z_dnia).'.</span></td></tr></table></td></tr>
    </table>';

    if (isset($_GET['wyslij_zg_of']))
    {
        $yourname = 'A. Z. Gwarancja';

        $youremail = 'azgwarancja@azg.pl';

        $wiadomosc = UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$imie), $_SESSION[$jezyk]).' '.
        UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$i), $_SESSION[$jezyk]).' '.
        UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nazwisko), $_SESSION[$jezyk]).":\r\n  ".$_GET['imieinazwisko']."\r\n".
        UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$telefon), $_SESSION[$jezyk]).":\r\n  ".$_GET['telefon']."\r\n".
        UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$rodzaj_zgloszenia), $_SESSION[$jezyk]).":\r\n  ".UtilsUI::KonwersjaEncoding($_GET['Rodzajzgloszenia'], $_SESSION[$jezyk])."\r\n".
        UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$przedmiot_zgloszenia), $_SESSION[$jezyk]).":\r\n  ".UtilsUI::KonwersjaEncoding($_GET['Przedmiotzgloszenia'], $_SESSION[$jezyk])."\r\n".
        UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$lokalizacja), $_SESSION[$jezyk]).":\r\n  ".$_GET['Lokalizacja']."\r\n".
        UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$cena), $_SESSION[$jezyk]).":\r\n  ".$_GET['Cena']."\r\n".
        UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$opis), $_SESSION[$jezyk]).":\r\n  ".$_GET['opis']."\r\n".
        UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$adres_email), $_SESSION[$jezyk]).":\r\n  ".$_GET['email'];
        $mail = new MailSend();
        $mail->DodajOdbiorca('azgwarancja@azg.pl');
        $mail->WyslijMail($_GET['subject'], $wiadomosc);

        if ($_GET['email'] != "") 
        {
            $nazwab = UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$biuro_nieruchomosci), $_SESSION[$jezyk]).' '.$AZG;

            $subjectz = UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$potwierdzenie_zgloszenia), $_SESSION[$jezyk]).'.'; //Dziêkuj±c za zainteresowanie us³ugami naszego biura, niniejszym potwierdzamy przyjêcie Pañstwa zg³oszenia.
            $mail = new MailSend();
            $mail->DodajOdbiorca($_GET['email']);
            $mail->WyslijMail($subjectz, UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$szanowni_panstwo), $_SESSION[$jezyk]).".\r\n".
            UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$dziekujac_za_zainteresowanie_uslugami), $_SESSION[$jezyk])."\r\n".$nazwab);
            
            echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wiadomosc_wyslano_poprawnie).'. '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$dziekujemy).'.';
        }
    }
    
    require('stopka.php');    
?>
</body>
</html>
