<?
$identbiura = "1";
$ok = "_b";
// polaczenie z baza
$conn = pg_connect ("host=10.1.0.223 user=azg password=grrrBONNN23 dbname=nierazg");
if (!conn){
	echo "Przykro nam w tej chwili baza ofert jest chwilowo nieczynna.\n";
	exit;
}	

if ($action == 'kupnodz') {

$sql1 = "select id, numer, lok, pow_uzytk1, pow_uzytk2, opis, cena1, cena2 from tab_dzi_ku where usun = 'f' and id_b = '$identbiura' order by data;";

$result_set1 = pg_Exec($conn, $sql1);

$rows1 = pg_NumRows($result_set1);		// liczba zwroconych wierszy

if ((!$result_set1) || ($rows1 > 0)) { 

echo "<center>";
echo "<span class=\"nag2b\">";
echo "<b>KUPNO DZIA£EK</b>";
echo "<br>";
echo "</span>";
echo "</center>";

echo "<table width=\"512\" cellpadding=\"0\" cellspacing=\"0\" border = \"0\">";
echo "<tr>";
echo "<td width=\"100%\" align = \"right\">";
echo "<a href=\"drukkdz.php?nu=$nu\" target = \"_blank\"><img src=\"img/printer.gif\" width=\"15\" height=\"17\" border=\"0\"></img>&nbsp;&nbsp;Wydrukuj</a><br>";
echo "</td>";
echo "</tr>";
echo "</table>";
echo "<br>";
}


echo "<table width=\"516\" cellpadding=\"0\" cellspacing=\"0\" frame border=\"0\">";
if ((!$result_set1) || ($rows1 > 0)) { 
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}

	for ($i=0; $i < $rows1; $i++) {

		$id1 = pg_result($result_set1, $i, "id");
		$numer1 = pg_result($result_set1, $i, "numer");
		$lok1 = pg_result($result_set1, $i, "lok");
		$powuzyt1 = pg_result($result_set1, $i, "pow_uzytk1");
		$powuzyt2 = pg_result($result_set1, $i, "pow_uzytk2");
		$pietro1m = pg_result($result_set1, $i, "pietro1");
		$pietro2m = pg_result($result_set1, $i, "pietro2");
		$opis1 = pg_result($result_set1, $i, "opis");
		$cena1m = pg_result($result_set1, $i, "cena1");
		$cena2m = pg_result($result_set1, $i, "cena2");



		

echo "<tr bgcolor=\"#5865E5\">";
echo "<td width=\"103\" align = \"left\">";
echo "<span class=\"nag1wb\">";
echo "&nbsp;Numer:";
echo "</span>";
echo "</td>";

echo "<td width=\"300\" align = \"left\">";
echo "<span class=\"nag1wb\">";
echo "&nbsp;Lokalizacja:";
echo "</span>";
echo "</td>";

echo "<td width=\"113\" align = \"left\">";
echo "<span class=\"nag1wb\">";
echo "&nbsp;Pow. u¿ytkowa:";
echo "</span>";
echo "</td>";

echo "</tr>";

echo "<tr>";
echo "<td width=\"103\" align = \"left\">";
echo "$numer1";
echo "</td>";

echo "<td width=\"300\" align = \"left\">";
echo "$lok1";
echo "</td>";

echo "<td width=\"113\" align = \"left\">";
echo "od $powuzyt1 m2 do $powuzyt2 m2";
echo "</td>";

echo "</tr>";

echo "<tr bgcolor=\"#5865E5\">";

echo "<td align = \"left\" colspan = \"3\">";
echo "<span class=\"nag1wb\">";
echo "&nbsp;Cena:";
echo "</span>";
echo "</td>";

echo "</tr>";

echo "<tr>";

$cena1m = number_format($cena1m,'', '.', '.');
$cena2m = number_format($cena2m,'', '.', '.');

echo "<td align = \"left\" colspan = \"3\">";
echo "od $cena1m z³. do $cena2m z³.";
echo "</td>";

echo "</tr>";

echo "<tr bgcolor=\"#5865E5\">";

echo "<td align = \"left\" colspan = \"5\">";
echo "<span class=\"nag1wb\">";
echo "&nbsp;Opis:";
echo "</span>";
echo "</td>";

echo "</tr>";

echo "<tr>";
echo "<td align = \"left\" colspan = \"5\">";
echo "&nbsp;$opis1";
echo "</td>";
echo "</tr>";

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

echo "<tr><td colspan=\"40\">";
echo "<br>";
echo "</td>";
echo "</tr>";

}
echo "</table>";
}

?>