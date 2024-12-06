<?

$identbiura = "1";
$nowdate = date("Y-m-d");

echo "
<br>
<center>
<span class= \"menu\"><b>SUBSKRIPTION DES IMMOBILESBÜROS</span>
</center>
<br>
";

if ($action == 'dodajsub') {
echo "
<span class = \"poleca\">Nach der Angabe Ihrer E-Mailadresse werden Sie ständig über erscheinende (Ihren Kriterien entsprechenden) Angebote informiert.</span><br>
<span class =\"poleca\">Um eine korrekte Funktion der Subskription zu gewährleisten, sollen Sie alle Felder im Optionsbereich des Kaufes oder des Mietens ausfühlen.</span>
<form action=\"$PHP_SELF\" method=\"POST\">
<input type=\"hidden\" name=\"action\" value=\"wprowadzsub\">
<input type=\"hidden\" name=\"rodzajz\" value=\"K\">
<table border=\"0\" width=\"100%\">

<tr>
<td colspan=\"4\" align=\"center\">
<span class=\"poleca\">
<b>ICH SUCHE IMMOBIELEN ZUM KAUFEN</b>
<br>
</td>
</tr>

<tr>
<td>
<span class=\"poleca\">
Immobilienart:<br>
<select name=\"rodzajn\" value=\"$rodzajn\" >
<option value=\"\" selected>
<option value=\"M\">Wohnung
<option value=\"D\">Haus
<option value=\"L\">Raum
<option value=\"O\">Objekt
<option value=\"Dz\">Grundstück
<option value=\"T\">Gelände
</select>
</td>
<td>
<span class=\"poleca\">
Preis: <br>
von &nbsp;&nbsp;
</span>
<input type=\"text\" class=\"input1\" size=\"8\" name= \"cenastart\" value = \"$cenastart\">
<span class=\"poleca\">
&nbsp;&nbsp;bis&nbsp;&nbsp;
</span>
<input type=\"text\" class=\"input1\" size=\"8\" name= \"cenastop\" value = \"$cenastop\">
</td>

<td>
<span class=\"poleca\">
Ihre E-Mail: <br>
<input name=\"email\" size=\"13\">
</td>
</tr>


<tr align=\"center\">
<td colspan =\"4\">
<span class=\"poleca\">
<input type=\"submit\" value=\"SENDEN\" name=\"WY¦LIJ\"> 
<input type=\"reset\" value=\"LÖSCHEN\" name=\"SKASUJ\">
</td>
</tr>
<tr><td colspan=\"4\"><img src= \"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\" alt=\"\"></td></tr>
</table>

</form>
";

echo "
<form action=\"$PHP_SELF\" method=\"POST\">
<input type=\"hidden\" name=\"action\" value=\"wprowadzsub\">
<input type=\"hidden\" name=\"rodzajz\" value=\"N\">
<table border=\"0\" width=\"100%\">

<tr>
<td colspan=\"4\" align=\"center\">
<span class=\"poleca\">
<b>ICH SUCHE IMMOBILIEN ZUM MIETEN</b>
<br>
</td>
</tr>

<tr>
<td span class=\"poleca\">
Immobilenart:<br>
<select name=\"rodzajn\" value=\"$rodzajn\" >
<option value=\"\" selected>
<option value=\"M\">Wohnung
<option value=\"D\">Haus
<option value=\"L\">Raum
<option value=\"O\">Objekt
<option value=\"Dz\">Grundstück
<option value=\"T\">Gelände
</select>
</td>
<td>
<span class=\"poleca\">
Preis für 1m2: <br>
von &nbsp;&nbsp;
</span>
<input type=\"text\" class=\"input1\" size=\"8\" name= \"cenastart\" value = \"$cenastart\">
<span class=\"nazwa1\">
&nbsp;&nbsp;bis&nbsp;&nbsp;
</span>
<input type=\"text\" class=\"input1\" size=\"8\" name= \"cenastop\" value = \"$cenastop\">
</td>
<td colspan =\"2\">
<span class=\"poleca\">
Ihre E-Mail: <br>
<input name=\"email\" size=\"13\">
</td>
</tr>


<tr align=\"center\">
<td colspan =\"4\">
<span class=\"poleca\">
<input type=\"submit\" value=\"SENDEN\" name=\"WY¦LIJ\"> 
<input type=\"reset\" value=\"LÖSCHEN\" name=\"SKASUJ\">
</td>
</tr>
<tr><td colspan=\"4\"><img src= \"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\" alt=\"\"></td></tr>
</table>

</form>
";

}

if ($action == 'wprowadzsub') {

include "../concfg.inc";
	
		
$result1 = pg_Exec ($conn, "INSERT INTO SUB (\"rodz_zg\", \"rodzn_zg\",\"cena_zg_od\",\"cena_zg_do\", \"email_zg\",\"data_zg\", \"id_b\") VALUES ('$rodzajz', '$rodzajn', '$cenastart', '$cenastop', '$email','$nowdate','$identbiura');");
		
	echo "<p align = \"center\"><span class=\"poleca\">Your application was accepted.</span></p>";

}

?>