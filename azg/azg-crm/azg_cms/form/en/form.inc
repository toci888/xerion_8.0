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
<span class= \"polecam\"><b>APPLICATION FORM OF THE PROPERTY<br>$nazbiu</b></span>
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
Give us your first name and surname:<br>
<input name=\"imieinazwisko\">
</td>
<td span class=\"polecam\">
Give telephone number:<br>
<input name=\"telefon\">
</td>
</tr>

<tr align=\"center\">
<td span class=\"polecam\">
Choose the kind of the application:<br>
<select name=\"Rodzajzgloszenia\">

<option> Sale
<option> Purchase
<option> Rent
<option> Lease
<option> Exchange
</select>
</td>
<td span class=\"polecam\">
Choose the category of the application:<br>
<select name=\"Przedmiotzgloszenia\">
<option> Flat
<option> House
<option> Premise
<option> Object
<option> Plot
<option> Area
</select>
</td>
</tr>

<tr align=\"center\">
<td span class=\"polecam\">
Location of the property:<br>
<input name=\"Lokalizacja\">
</td>
<td span class=\"polecam\">
Price of the property:<br>
<input name=\"Cena\">
</td>
</tr>

<tr align=\"center\">
<td colspan =\"2\" span class=\"polecam\">
Description of the property:<br>";
?>
<TEXTAREA tabIndex=11 name=opis rows=5 cols=30\'></TEXTAREA>
<?
echo "
</td>
</tr>

<tr align=\"center\">
<td colspan =\"2\" span class=\"polecam\">
Your E-mail: <br>
<input name=\"email\" size=\"30\">
</td>
</tr>

<tr align=\"center\">
<td colspan =\"2\" span class=\"polecam\">
<input type=\"submit\" value=\"SEND\" name=\"WY¦LIJ\"> 
<input type=\"reset\" value=\"CANCEL\" name=\"SKASUJ\">
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
$nazwab = "Biuro Nieruchomo¶ci $nazbiu";

$headers  = "MIME-Version: 1.0\n";
	$headersz .= "X-Mailer: $nazwab\n"; 	// mailer
	$headersz .= "From: $toemail\n";
	$headersz .= "X-Sender: <$toemail>\n"; 
	$headersz .= "X-Priority: 3\n"; 				// 1-Urgent message! 2-very 3-normal
	$headersz .= "Return-Path: $toemail\n";  		// Return path for errors
	$headersz .= "Content-Type: text/plain; charset=ISO-8859-2\n";
	$headersz .= "Content-transfer-encoding: 8BIT";

$subjectz = "Confirming of the application.";
mail($email,$subjectz,"We are thanking for the interest in services of our office and we confirm the reception of your application. \r\n $nazbiu",$headersz);
}
}


echo "
<ul>
<li span class=\"polecam\">In case, you've made mistake filling the form, press: &quot;CANCEL&quot; - button.
<li span class=\"polecam\">In case, you've finished filling the form, press: &quot;SEND&quot; - button.
</ul>
<span class=\"polecam\">In accordance with the Act of 29th August 1997 on protection of personal details - (Dz.U. No. 133, item 833) - I agree to process my personal details included in the offer of the purchase, sale and lease.</span>";
?>