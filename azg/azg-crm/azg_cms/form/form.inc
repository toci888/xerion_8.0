<?
$identbiura = "1";
	
include "concfg.inc";

$sqlofe = "select nazwa_b, adres_b, tel_b, fax_b, tel_kom_b, email_b, www_b from tab_biur where id_b = '$identbiura';";

	$resultofe = @pg_exec($conn, $sqlofe);
		
		$nazbiu = pg_result($resultofe, 0, "nazwa_b");
		$adrbiu = pg_result($resultofe, 0, "adres_b");
		$telbiu = pg_result($resultofe, 0, "tel_b");
		$faxbiu = pg_result($resultofe, 0, "fax_b");
		$telkombiu = pg_result($resultofe, 0, "tel_kom_b");
		$emailbiu = pg_result($resultofe, 0, "email_b");
		$wwwbiu = pg_result($resultofe, 0, "www_b");

    echo "
    <table border=\"0\" width=\"100 %\">
    <tr>
    <td>
    <center>
    <span class= \"polecam\"><b>".UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$formularz_zgloszeniowy_biura_nieruchomosci), $_SESSION[$jezyk])."<br>".$AZG."</b></span>
    </center>
    <br>
    </td>
    </tr>
    </table>
    <table border=\"0\" width=\"100 %\">";

    echo '<form action="'.$_SERVER['PHP_SELF'].'" method="GET">
    <input type="hidden" name="action" value="emailform">
    <INPUT TYPE="hidden" NAME="subject" VALUE="'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$oferta), $_SESSION[$jezyk]).' - '.$AZG.'">
    <INPUT TYPE="hidden" NAME="toemail" VALUE="'.$emailbiu.'">';

    echo '<tr align="center"><td span class="polecam">'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podaj_swoje_imie_i_nazwisko), $_SESSION[$jezyk]).':<br>';
    KontrolkiHtml::DodajTextbox('imieinazwisko', 'id_imieinazwisko', '', 20, 15, '');
    echo '</td><td span class="polecam">'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podaj_telefon_kontaktowy), $_SESSION[$jezyk]).':<br>';
    KontrolkiHtml::DodajTelefonTextbox('telefon', 'id_telefon', '', 13, 9, '', '');
    echo '</td></tr><tr align="center"><td span class="polecam">'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wybierz_rodzaj_zgloszenia), $_SESSION[$jezyk]).':<br>';

    $trans_ar = array(array('id' => 1, 'nazwa' => tags::$sprzedaz), array('id' => 4, 'nazwa' => tags::$kupno), array('id' => 2, 'nazwa' => tags::$wynajem), array('id' => 5, 'nazwa' => tags::$najem), array('id' => 3, 'nazwa' => tags::$zamiana));
    KontrolkiHtml::DodajSelectDomWartId('Rodzajzgloszenia', 'id_transakcje', $trans_ar, StronaPodsInfoDAL::$id_trans_rodzaj.'zg_of', null, '', '', null, null, true);

    $obiektTrans = new TransNierDAL();      
    $tabNier = $obiektTrans->PodajListeNieruchomosci($ilosc_wierszy);

    echo '</td><td span class="polecam">'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wybierz_przedmiot_zgloszenia), $_SESSION[$jezyk]).':<br>';
    KontrolkiHtml::DodajSelectDomWartId('Przedmiotzgloszenia', 'id_Przedmiotzgloszenia', $tabNier, StronaPodsInfoDAL::$id_nier_rodzaj.'zg_of', null, '', '', TransNierDAL::$id, TransNierDAL::$nazwa_nieruchomosc, true);

echo '</td></tr><tr align="center"><td span class="polecam">'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$lokalizacja_nieruchomosci), $_SESSION[$jezyk]).':<br>';
KontrolkiHtml::DodajTextbox('Lokalizacja', 'id_Lokalizacja', '', 20, 15, '');

echo '</td><td span class="polecam">'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$cena_nieruchomosci), $_SESSION[$jezyk]).':<br>';
KontrolkiHtml::DodajLiczbaWymiernaTextbox('Cena', 'id_Cena', '', 9, 8, '');

echo '</td></tr><tr align="center"><td colspan="2" span class="polecam">'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$opis_nieruchomosci), $_SESSION[$jezyk]).':<br>';

KontrolkiHtml::DodajTextArea('opis', 'id_opis', '', 30, 5, '');
//<TEXTAREA tabIndex=11 name=opis rows=5 cols=30\'></TEXTAREA>

echo '</td></tr><tr align="center"><td colspan="2" span class="polecam">'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$adres_email), $_SESSION[$jezyk]).':<br />';
KontrolkiHtml::DodajEmailTextbox('email', 'id_email', '', 30, 20, '', '');
//<input name=\"email\" size=\"30\">
echo "</td></tr><tr align=\"center\">
<td colspan =\"2\" span class=\"polecam\">";
KontrolkiHtml::DodajSubmit('wyslij_zg_of', 'id_wyslij', UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zatwierdz), $_SESSION[$jezyk]), '');
//<input type=\"submit\" value=\"WY¦LIJ\" name=\"WY¦LIJ\"> 
//<input type=\"reset\" value=\"SKASUJ\" name=\"SKASUJ\">
echo '</td></tr></form></table>';

if (isset($_GET['wyslij_zg_of']))
if ($_GET['action'] == 'emailform') 
{

$identbiura = "1";
	
include "concfg.inc";

$sqlofe = "select nazwa_b, adres_b, tel_b, fax_b, tel_kom_b, email_b, www_b from tab_biur where id_b = '$identbiura';";

	$resultofe = @pg_exec($conn, $sqlofe);
		
		$nazbiu = pg_result($resultofe, 0, "nazwa_b");
		$adrbiu = pg_result($resultofe, 0, "adres_b");
		$telbiu = pg_result($resultofe, 0, "tel_b");
		$faxbiu = pg_result($resultofe, 0, "fax_b");
		$telkombiu = pg_result($resultofe, 0, "tel_kom_b");
		$emailbiu = pg_result($resultofe, 0, "email_b");
		$wwwbiu = pg_result($resultofe, 0, "www_b");

$yourname = $nazbiu;

$youremail = $emailbiu;

	$headers  = "MIME-Version: 1.0\n";
	$headers .= "X-Mailer: ".$_GET['imieinazwisko']."\n"; 	// mailer
	$headers .= "From: ".$_GET['email']."\n";
	$headers .= "X-Sender: <".$_GET['email'].">\n"; 
	$headers .= "X-Priority: 3\n"; 				// 1-Urgent message! 2-very 3-normal
	$headers .= "Return-Path: ".$_GET['email']."\n";  		// Return path for errors
	$headers .= "Content-Type: text/plain; charset=ISO-8859-2\n";
	$headers .= "Content-transfer-encoding: 8BIT";

    $wiadomosc = UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$imie), $_SESSION[$jezyk]).' '.
    UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$i), $_SESSION[$jezyk]).' '.
    UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nazwisko), $_SESSION[$jezyk]).':\r\n  '.$_GET['imieinazwisko'].'\r\n'.
    UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$telefon), $_SESSION[$jezyk]).':\r\n  '.$_GET['telefon'].'\r\n'.
    UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$rodzaj_zgloszenia), $_SESSION[$jezyk]).':\r\n  '.$_GET['Rodzajzgloszenia'].'\r\n'.
    UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$przedmiot_zgloszenia), $_SESSION[$jezyk]).':\r\n  '.$_GET['Przedmiotzgloszenia'].'\r\n'.
    UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$lokalizacja), $_SESSION[$jezyk]).':\r\n  '.$_GET['Lokalizacja'].'\r\n'.
    UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$cena), $_SESSION[$jezyk]).':\r\n  '.$_GET['Cena'].'\r\n'.
    UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$opis), $_SESSION[$jezyk]).':\r\n  '.$_GET['opis'].'\r\n'.
    UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$adres_email), $_SESSION[$jezyk]).':\r\n  '.$_GET['email'];
    
    mail($_GET['toemail'], $_GET['subject'], $wiadomosc, $headers);

    if ($_GET['email'] != "") 
    {
        $nazwab = UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$biuro_nieruchomosci), $_SESSION[$jezyk]).' '.$AZG;

        $headers  = "MIME-Version: 1.0\n";
	    $headersz .= "X-Mailer: $nazwab\n"; 	// mailer
	    $headersz .= "From: ".$_GET['toemail']."\n";
	    $headersz .= "X-Sender: <".$_GET['toemail'].">\n"; 
	    $headersz .= "X-Priority: 3\n"; 				// 1-Urgent message! 2-very 3-normal
	    $headersz .= "Return-Path: ".$_GET['toemail']."\n";  		// Return path for errors
	    $headersz .= "Content-Type: text/plain; charset=ISO-8859-2\n";
	    $headersz .= "Content-transfer-encoding: 8BIT";

        $subjectz = UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$potwierdzenie_zgloszenia), $_SESSION[$jezyk]).'.'; //Dziêkuj±c za zainteresowanie us³ugami naszego biura, niniejszym potwierdzamy przyjêcie Pañstwa zg³oszenia.
        mail($email,$subjectz, UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$szanowni_panstwo), $_SESSION[$jezyk]).'.\r\n'.
        UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$dziekujac_za_zainteresowanie_uslugami), $_SESSION[$jezyk]).'\r\n'.$nazwab, $headersz);
}


}
//<li span class=\"polecam\">W przypadku z³ego wype³nienia oferty przyci¶nij przycisk : &quot;SKASUJ&quot;
echo '<ul><li span class="polecam">'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$po_prawidlowym_wypelnieniu_oferty_przycisnij_przycisk), $_SESSION[$jezyk]).': &quot;'.
UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zatwierdz), $_SESSION[$jezyk]).'&quot;</ul>';
echo '<span class="polecam">'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zgodnia_z_ustawa_z_dnia), $_SESSION[$jezyk]).'.</span>';
?>
