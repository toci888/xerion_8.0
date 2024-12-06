<?
$identbiura = "1";
	
$conn = pg_connect ("host=10.1.0.223 user=azg password=grrrBONNN23 dbname=nierazg");

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
<span class= \"polecam\"><b>FORMULARZ ZG£OSZENIOWY BIURA NIERUCHOMO¦CI<br>$nazbiu</b></span>
</center>
<br>
</td>
</tr>
</table>
<table border=\"0\" width=\"100 %\">

<form action=\"$PHP_SELF\" method=\"POST\">
<input type=\"hidden\" name=\"action\" value=\"emailform\">
<INPUT TYPE=\"hidden\" NAME=\"subject\" VALUE=\"OFERTA - $nazbiu\">
<INPUT TYPE=\"hidden\" NAME=\"toemail\" VALUE=\"$emailbiu\">

<tr align=\"center\">
<td span class=\"polecam\">
Podaj swoje imiê i nazwisko:<br>
<input name=\"imieinazwisko\">
</td>
<td span class=\"polecam\">
Podaj telefon kontaktowy:<br>
<input name=\"telefon\">
</td>
</tr>

<tr align=\"center\">
<td span class=\"polecam\">
Wybierz rodzaj zg³oszenia:<br>
<select name=\"Rodzajzgloszenia\">

<option> Sprzeda¿
<option> Kupno
<option> Szukam do wynajêcia
<option> Mam do wynajêcia
<option> Zamiana
</select>
</td>
<td span class=\"polecam\">
Wybierz przedmiot zg³oszenia:<br>
<select name=\"Przedmiotzgloszenia\">
<option> Mieszkanie
<option> Dom
<option> Lokal
<option> Obiekt
<option> Dzia³ka
<option> Teren
</select>
</td>
</tr>

<tr align=\"center\">
<td span class=\"polecam\">
Lokalizacja Nieruchomo¶ci:<br>
<input name=\"Lokalizacja\">
</td>
<td span class=\"polecam\">
Cena Nieruchomo¶ci:<br>
<input name=\"Cena\">
</td>
</tr>

<tr align=\"center\">
<td colspan =\"2\" span class=\"polecam\">
Opis Nieruchomo¶ci:<br>";
?>
<TEXTAREA tabIndex=11 name=opis rows=5 cols=30\'></TEXTAREA>
<?
echo "
</td>
</tr>

<tr align=\"center\">
<td colspan =\"2\" span class=\"polecam\">
Twój E-mail: <br>
<input name=\"email\" size=\"30\">
</td>
</tr>

<tr align=\"center\">
<td colspan =\"2\" span class=\"polecam\">
<input type=\"submit\" value=\"WY¦LIJ\" name=\"WY¦LIJ\"> 
<input type=\"reset\" value=\"SKASUJ\" name=\"SKASUJ\">
</td>
</tr>

</form>
</table>
";

if ($action == 'emailform') {

$identbiura = "1";
	
$conn = pg_connect ("host=10.1.0.223 user=azg password=grrrBONNN23 dbname=nierazg");

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
$nazwab = "Biuro Nieruchomo¶ci $nazbiu";

$headers  = "MIME-Version: 1.0\n";
	$headersz .= "X-Mailer: $nazwab\n"; 	// mailer
	$headersz .= "From: $toemail\n";
	$headersz .= "X-Sender: <$toemail>\n"; 
	$headersz .= "X-Priority: 3\n"; 				// 1-Urgent message! 2-very 3-normal
	$headersz .= "Return-Path: $toemail\n";  		// Return path for errors
	$headersz .= "Content-Type: text/plain; charset=ISO-8859-2\n";
	$headersz .= "Content-transfer-encoding: 8BIT";

$subjectz = "Potwierdzenie zg³oszenia.";
mail($email,$subjectz,"Szanowni Pañstwo.\r\nDziêkuj±c za zainteresowanie us³ugami naszego biura, niniejszym potwierdzamy przyjêcie Pañstwa zg³oszenia.\r\nBIURO NIERUCHOMO¦CI\r\n $nazbiu",$headersz);
}


}

echo "
<ul>
<li span class=\"polecam\">W przypadku z³ego wype³nienia oferty przyci¶nij przycisk : &quot;SKASUJ&quot;
<li span class=\"polecam\">Po wype³nieniu oferty prawid³owo przyci¶nij przycisk: &quot;WY¦LIJ&quot;
</ul>
<span class=\"polecam\">Zgodnie z Ustaw± z dnia 29 sierpnia 1997r. o ochronie danych osobowych (Dz. U. nr.133, pozycja  833), wyra¿am zgodê na przetworzenie moich danych osobowych  zawartych w ofercie kupna, sprzeda¿y, najmu, wynajmu.</span>
";
?>
