<?
$identbiura = "1";
	
include "../concfg.inc";

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
<span class= \"polecam\"><b>ANGEBOTSFORMULAR DES IMMOBILIENBÜROS<br>$nazbiu</b></span>
</center>
<br>
</td>
</tr>
</table>
<table border=\"0\" width=\"100 %\">

<form action=\"$PHP_SELF\" method=\"POST\">
<input type=\"hidden\" name=\"action\" value=\"emailform\">
<INPUT TYPE=\"hidden\" NAME=\"subject\" VALUE=\"OFFER - $nazbiu\">
<INPUT TYPE=\"hidden\" NAME=\"toemail\" VALUE=\"$emailbiu\">

<tr align=\"center\">
<td span class=\"polecam\">
Geben Sie bitte Ihren Namen und Vornamen an:<br>
<input name=\"imieinazwisko\">
</td>
<td span class=\"polecam\">
Geben Sie bitte Ihren Ruf:<br>
<input name=\"telefon\">
</td>
</tr>

<tr align=\"center\">
<td span class=\"polecam\">
Wählen Sie bitte die Angebotsart:<br>
<select name=\"Rodzajzgloszenia\">

<option> Verkauf
<option> Kauf
<option> Ich suche zum Mieten
<option> Ich habe zum Mieten
<option> Tausch
</select>
</td>
<td span class=\"polecam\">
Wählen Sie bitte die Immobilienart:<br>
<select name=\"Przedmiotzgloszenia\">
<option> Wohnung
<option> Haus
<option> Raum
<option> Objekt
<option> Grundstück
<option> Gelände
</select>
</td>
</tr>

<tr align=\"center\">
<td span class=\"polecam\">
 Immobilienlokalisation:<br>
<input name=\"Lokalizacja\">
</td>
<td span class=\"polecam\">
Immobilienpreis:<br>
<input name=\"Cena\">
</td>
</tr>

<tr align=\"center\">
<td colspan =\"2\" span class=\"polecam\">
Beschreibung der Immobilien:<br>";
?>
<TEXTAREA tabIndex=11 name=opis rows=5 cols=30\'></TEXTAREA>
<?
echo "
</td>
</tr>

<tr align=\"center\">
<td colspan =\"2\" span class=\"polecam\">
Ihre E-Mail: <br>
<input name=\"email\" size=\"30\">
</td>
</tr>

<tr align=\"center\">
<td colspan =\"2\" span class=\"polecam\">
<input type=\"submit\" value=\"SENDEN\" name=\"WY¦LIJ\"> 
<input type=\"reset\" value=\"LÖSCHEN\" name=\"SKASUJ\">
</td>
</tr>

</form>
</table>
";

if ($action == 'emailform') {

$identbiura = "1";
	
include "../concfg.inc";

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
	$headers .= "X-Mailer: $imieinazwisko\n"; 	// mailer
	$headers .= "From: $email\n";
	$headers .= "X-Sender: <$email>\n"; 
	$headers .= "X-Priority: 3\n"; 				// 1-Urgent message! 2-very 3-normal
	$headers .= "Return-Path: $email\n";  		// Return path for errors
	$headers .= "Content-Type: text/plain; charset=ISO-8859-2\n";
	$headers .= "Content-transfer-encoding: 8BIT";

mail($toemail,"$subject","Imiê i Nazwisko:\r\n  $imieinazwisko\r\nTelefon:\r\n  $telefon\r\nRodzaj zg³oszenia:\r\n  $Rodzajzgloszenia\r\nPrzedmiot zg³oszenia:\r\n  $Przedmiotzgloszenia\r\nLokalizacja:\r\n  $Lokalizacja\r\nCena:\r\n  $Cena\r\nOpis:\r\n  $opis\r\nE-mail:\r\n  $email",$headers);
if ($email != "") {
$nazwab = " Immobilien $nazbiu";

$headers  = "MIME-Version: 1.0\n";
	$headersz .= "X-Mailer: $nazwab\n"; 	// mailer
	$headersz .= "From: $toemail\n";
	$headersz .= "X-Sender: <$toemail>\n"; 
	$headersz .= "X-Priority: 3\n"; 				// 1-Urgent message! 2-very 3-normal
	$headersz .= "Return-Path: $toemail\n";  		// Return path for errors
	$headersz .= "Content-Type: text/plain; charset=ISO-8859-2\n";
	$headersz .= "Content-transfer-encoding: 8BIT";

$subjectz = "Immobilien - Angebot.";
mail($email,$subjectz,"Wir bedanken uns bei Ihnen für Ihre Interesse an unsere Dienstleistungen.\r\nGleichzeitig bestätigen wir Ihnen Ihr Angebot.\r\n $nazbiu",$headersz);
}
}

echo "
<ul>
<li span class=\"polecam\">Im fehlerhaften Fall drücken Sie: &quot;LÖSCHEN&quot;
<li span class=\"polecam\">Nach korrektem Ausfühlen des Angebots drücken Sie: &quot;SENDEN&quot;
</ul>
<span class=\"polecam\">
Laut des Gesetzes vom 29 August 1997 über den personalen Datenschutz (Gesetzblatt Nr. 133, Position 833) erlaube ich die Verarbeitung meiner personalen Daten in den Angeboten von Kauf und Verkauf, Mieten und Vermieten von Immobilien.
</span>";

?>
