<?

$identbiura = "1";
$nowdate = date("Y-m-d");

echo "
<br>
<center>
<span class= \"menu\"><b>SUBSCRIPTION OF THE PROPERTY</span>
</center>
<br>
";

if ($action == 'dodajsub') {
echo "
<span class = \"poleca\">Write yoru E-mail and you will be informed about our newest offers fulfilling criteria given by you.</span>
<span class =\"poleca\">For correct working of the subcription is required to fill all fields of the option.</span>
<form action=\"$PHP_SELF\" method=\"POST\">
<input type=\"hidden\" name=\"action\" value=\"wprowadzsub\">
<input type=\"hidden\" name=\"rodzajz\" value=\"K\">
<table border=\"0\" width=\"100%\">

<tr>
<td colspan=\"4\" align=\"center\">
<span class=\"poleca\">
<b>I'M LOOKING FOR PROPERTIES TO PURCHASE</b>
<br>
</td>
</tr>

<tr>
<td>
<span class=\"poleca\">
The kind of the properties:<br>
<select name=\"rodzajn\" value=\"$rodzajn\" >
<option value=\"\" selected>
<option value=\"M\">Flat
<option value=\"D\">House
<option value=\"L\">Premise
<option value=\"O\">Object
<option value=\"Dz\">Plot
<option value=\"T\">Area
</select>
</td>
<td>
<span class=\"poleca\">
According to the price: <br>
from &nbsp;&nbsp;
</span>
<input type=\"text\" class=\"input1\" size=\"8\" name= \"cenastart\" value = \"$cenastart\">
<span class=\"poleca\">
&nbsp;&nbsp;to&nbsp;&nbsp;
</span>
<input type=\"text\" class=\"input1\" size=\"8\" name= \"cenastop\" value = \"$cenastop\">
</td>

<td>
<span class=\"poleca\">
Give us your E-mail: <br>
<input name=\"email\" size=\"13\">
</td>
</tr>


<tr align=\"center\">
<td colspan =\"4\">
<span class=\"poleca\">
<input type=\"submit\" value=\"SEND\" name=\"WY¦LIJ\"> 
<input type=\"reset\" value=\"CANCEL\" name=\"SKASUJ\">
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
<b>I'M LOOKING FOR PROPERTIES TO LEASE</b>
<br>
</td>
</tr>

<tr>
<td span class=\"poleca\">
The kind of the properties:<br>
<select name=\"rodzajn\" value=\"$rodzajn\" >
<option value=\"\" selected>
<option value=\"M\">Flat
<option value=\"D\">House
<option value=\"L\">Premise
<option value=\"O\">Object
<option value=\"Dz\">Plot
<option value=\"T\">Area
</select>
</td>
<td>
<span class=\"poleca\">
According to the price for 1 m2: <br>
from &nbsp;&nbsp;
</span>
<input type=\"text\" class=\"input1\" size=\"8\" name= \"cenastart\" value = \"$cenastart\">
<span class=\"nazwa1\">
&nbsp;&nbsp;to&nbsp;&nbsp;
</span>
<input type=\"text\" class=\"input1\" size=\"8\" name= \"cenastop\" value = \"$cenastop\">
</td>
<td colspan =\"2\">
<span class=\"poleca\">
Give us your E-mail: <br>
<input name=\"email\" size=\"13\">
</td>
</tr>


<tr align=\"center\">
<td colspan =\"4\">
<span class=\"poleca\">
<input type=\"submit\" value=\"SEND\" name=\"WY¦LIJ\"> 
<input type=\"reset\" value=\"CANCEL\" name=\"SKASUJ\">
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