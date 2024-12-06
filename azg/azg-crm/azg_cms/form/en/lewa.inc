<?
$identbiura = "1";
$ok = "_b";
// polaczenie z baza
include "../concfg.inc";
if (!$conn){
	echo "Przykro nam w tej chwili baza ofert jest chwilowo nieczynna.\n";
	exit;
}	

echo "<table width=\"128\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">";

echo "<tr><td height=\"5\" bgcolor=\"#5865E5\">
	<center>
	<span class=\"nag1wb\">CURRENT INFO</span>
	</center>
	</td></tr>
<tr><td><img src=\"../img/red.gif\" width=\"128\" height=\"1\" border=\"0\" alt=\"\"></td></tr>
<tr>
<td>
<center>";

$sqlak = "select tresc_en from aktu where id_b = '$identbiura';";
$result_setaktu = pg_Exec($conn, $sqlak);

		$trescda = pg_result($result_setaktu, 0, "tresc_en");
		
echo"<span class=\"poleca\">";
echo "$trescda";
echo "</span>";

echo "</center>
</td>
</tr>";

echo "
<tr><td><img src=\"../img/red.gif\" width=\"128\" height=\"1\" border=\"0\" alt=\"\"></td></tr>";
echo "<tr><td height=\"5\" bgcolor=\"#5865E5\">
	<center>
	<span class=\"nag1wb\">THE NEWEST OFFERS</span>
	</center>
	</td></tr>
<tr><td><img src=\"../img/red.gif\" width=\"128\" height=\"1\" border=\"0\" alt=\"\"></td></tr>
<tr>
<td>
<center>";

include "lew1.inc";

include "lew2.inc";

include "lew3.inc";

include "lew4.inc";

include "lew5.inc";

include "lew6.inc";

include "lew7.inc";

include "lew8.inc";

include "lew9.inc";

include "lew10.inc";

echo "</center>
</td>
</tr>";


echo "</table>";		


?>