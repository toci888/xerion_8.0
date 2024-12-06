<?

$identbiura = "1";
$nowdate = date("Y-m-d");

echo "
<br>
<center>
<span class= \"menu\"><b>SUBSKRYPCJA BIURA NIERUCHOMO¦CI</span>
</center>
<br>
";

if ($action == 'dodajsub') {
echo "
<span class = \"poleca\">Wpisuj±c swój E-mail na bie¿±co bêdziesz informowany o pojawiaj±cych siê w naszym biurze ofertach, spe³niaj±cych podane przez ciebie kryteria.</span>
<br>
<span class =\"poleca\">Dla poprawnego dzia³ania subskrypcji wymagane jest wype³nienie wszystkich pól w obszarze wybranej opcji - kupna lub najmu.</span>
<form action=\"$PHP_SELF\" method=\"POST\">
<input type=\"hidden\" name=\"action\" value=\"wprowadzsub\">
<input type=\"hidden\" name=\"rodzajz\" value=\"K\">
<table border=\"0\" width=\"100%\">

<tr>
<td colspan=\"4\" align=\"center\">
<span class=\"poleca\">
<b>SZUKAM NIERUCHOMO¦CI DO KUPNA</b>
<br>
</td>
</tr>

<tr>
<td>
<span class=\"poleca\">
Rodzaj nieruchomo¶ci:<br>
<select name=\"rodzajn\" value=\"$rodzajn\" >
<option value=\"\" selected>
<option value=\"M\">Mieszkanie
<option value=\"D\">Dom
<option value=\"L\">Lokal
<option value=\"O\">Obiekt
<option value=\"Dz\">Dzia³ka
<option value=\"T\">Teren
</select>
</td>
<td>
<span class=\"poleca\">
Wed³ug ceny: <br>
od &nbsp;&nbsp;
</span>
<input type=\"text\" class=\"input1\" size=\"8\" name= \"cenastart\" value = \"$cenastart\">
<span class=\"poleca\">
&nbsp;&nbsp;do&nbsp;&nbsp;
</span>
<input type=\"text\" class=\"input1\" size=\"8\" name= \"cenastop\" value = \"$cenastop\">
</td>

<td>
<span class=\"poleca\">
Podaj swój E-mail: <br>
<input name=\"email\" size=\"13\">
</td>
</tr>


<tr align=\"center\">
<td colspan =\"4\">
<span class=\"poleca\">
<input type=\"submit\" value=\"WY¦LIJ\" name=\"WY¦LIJ\"> 
<input type=\"reset\" value=\"SKASUJ\" name=\"SKASUJ\">
</td>
</tr>
<tr><td colspan=\"4\"><img src=\"img/black.gif\" width=\"100%\" height=\"1\" border=\"0\" alt=\"\"></td></tr>
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
<b>SZUKAM NIERUCHOMO¦CI DO NAJMU</b>
<br>
</td>
</tr>

<tr>
<td span class=\"poleca\">
Rodzaj nieruchomo¶ci:<br>
<select name=\"rodzajn\" value=\"$rodzajn\" >
<option value=\"\" selected>
<option value=\"M\">Mieszkanie
<option value=\"D\">Dom
<option value=\"L\">Lokal
<option value=\"O\">Obiekt
<option value=\"Dz\">Dzia³ka
<option value=\"T\">Teren
</select>
</td>
<td>
<span class=\"poleca\">
Wed³ug ceny za 1 m2: <br>
od &nbsp;&nbsp;
</span>
<input type=\"text\" class=\"input1\" size=\"8\" name= \"cenastart\" value = \"$cenastart\">
<span class=\"nazwa1\">
&nbsp;&nbsp;do&nbsp;&nbsp;
</span>
<input type=\"text\" class=\"input1\" size=\"8\" name= \"cenastop\" value = \"$cenastop\">
</td>
<td colspan =\"2\">
<span class=\"poleca\">
Podaj swój E-mail: <br>
<input name=\"email\" size=\"13\">
</td>
</tr>


<tr align=\"center\">
<td colspan =\"4\">
<span class=\"poleca\">
<input type=\"submit\" value=\"WY¦LIJ\" name=\"WY¦LIJ\"> 
<input type=\"reset\" value=\"SKASUJ\" name=\"SKASUJ\">
</td>
</tr>
<tr><td colspan=\"4\"><img src=\"img/black.gif\" width=\"100%\" height=\"1\" border=\"0\" alt=\"\"></td></tr>
</table>

</form>
";

}

if ($action == 'wprowadzsub') {

$conn = pg_connect ("host=10.1.0.223 user=azg password=grrrBONNN23 dbname=nierazg");
	
		
$result1 = pg_Exec ($conn, "INSERT INTO SUB (\"rodz_zg\", \"rodzn_zg\",\"cena_zg_od\",\"cena_zg_do\", \"email_zg\",\"data_zg\", \"id_b\") VALUES ('$rodzajz', '$rodzajn', '$cenastart', '$cenastop', '$email','$nowdate','$identbiura');");
		
	echo "<p align = \"center\"><span class=\"poleca\">Twoje zg³oszenie zosta³o przyjête.</span></p>";

}

?>