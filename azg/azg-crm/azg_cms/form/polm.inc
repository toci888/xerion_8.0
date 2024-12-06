<?
$identbiura = "1";
$ok = "_b";
// polaczenie z baza
include "concfg.inc";
if (!conn){
	echo "Przykro nam w tej chwili baza ofert jest chwilowo nieczynna.\n";
	exit;
}	



$sql0 = "select kat_of, rodz_nie, id_of, no_of from polecamy where num_okn = '1' and id_b = '$identbiura';";

$result_set0 = pg_Exec($conn, $sql0);

		$kate = pg_result($result_set0, 0, "kat_of");
		$rodze = pg_result($result_set0, 0, "rodz_nie");
		$ideof = pg_result($result_set0, 0, "id_of");
		$numeof = pg_result($result_set0, 0, "no_of");

if (($kate == 'sprzedaz') & ($rodze == 'mieszkanie')) {

echo "<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" frame border=\"0\">";
echo "<tr align=\"left\"><td colspan = \"20\" height=\"7\">";
echo "<center>";
echo "<span class=\"nag1bb\">";
echo "MIESZKANIE - SPRZEDA¯";
echo "</span>";
echo "</center>";
echo "</td></tr>";

$sql1 = "select lok_m, powuzyt_m, cm_m, zd1 from tab_mie where id_m = '$ideof' and id_b = '$identbiura';";
$result_set1 = pg_Exec($conn, $sql1);

		$lok1 = pg_result($result_set1, 0, "lok_m");
		$powuzyt1 = pg_result($result_set1, 0, "powuzyt_m");
		$cena1 = pg_result($result_set1, 0, "cm_m");
		$zdj1 = pg_result($result_set1, 0, "zd1");

$tekst1 = "<a href = \"$PHP_SELF?action=sprzedazmzd&nu=$ideof\">wiêcej ...</a>";

echo "<tr align=\"left\"><td colspan = \"20\" height=\"3\">";
echo "</td></tr>";

echo "<tr valign = \"top\">";

if ($zdj1 != 0) {
	echo "<td width=\"84\" height=\"55\" align = \"left\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=sprzedazmzd&nu=$ideof\">";
	echo "<img src=\"../img/zd$zdj1.jpg\" width=\"80\" height=\"50\" border=\"0\" class=\"ira\" alt=\"Zdjêcie nr$zdj1\"></img></a><br>";
	echo "</center>";
	echo "</td>";
}
else {
	echo "<td width=\"84\" height=\"55\" align = \"left\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=sprzedazmzd&nu=$ideof\">";
	echo "<img src=\"../img/zd0.jpg\" width=\"80\" height=\"50\" alt=\"Brak zdjêcia\" class=\"ira\"></img></a><br>";
	echo "</center>";
	echo "</td>";
}

$cena1 = number_format($cena1,'', '.', '.');

echo "<td align = \"left\" width=\"110\"><span class=\"poleca\">";
echo "<b>Lok.:</b> $lok1";
echo "<br>";
echo "<b>Pow.:</b> $powuzyt1 m2";
echo "<br>";
echo "<b>Cena:</b> $cena1 z³.";
echo "<br>";
echo "$tekst1";
echo "</span></td>";
echo "</tr>";
echo "</table>";		
}


if (($kate == 'sprzedaz') & ($rodze == 'dom')) {

echo "<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" frame border=\"0\">";
echo "<tr align=\"left\"><td colspan = \"20\" height=\"7\">";
echo "<center>";
echo "<span class=\"nag1bb\">";
echo "MIESZKANIE - DOM";
echo "</span>";
echo "</center>";
echo "</td></tr>";

$sql1 = "select lok_d, powuzyt_d, cd, zd1 from tab_dom where id_d = '$ideof' and id_b = '$identbiura';";
$result_set1 = pg_Exec($conn, $sql1);

		$lok1 = pg_result($result_set1, 0, "lok_d");
		$powuzyt1 = pg_result($result_set1, 0, "powuzyt_d");
		$cena1 = pg_result($result_set1, 0, "cd");
		$zdj1 = pg_result($result_set1, 0, "zd1");

$tekst1 = "<a href = \"$PHP_SELF?action=sprzedazdzd&nu=$ideof\">wiêcej ...</a>";

echo "<tr align=\"left\"><td colspan = \"20\" height=\"3\">";
echo "</td></tr>";

echo "<tr valign = \"top\">";

if ($zdj1 != 0) {
	echo "<td width=\"84\" height=\"55\" align = \"left\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=sprzedazdzd&nu=$ideof\">";
	echo "<img src=\"../img/zd$zdj1.jpg\" width=\"80\" height=\"50\" border=\"0\" class=\"ira\" alt=\"Zdjêcie nr$zdj1\"></img></a><br>";
	echo "</center>";
	echo "</td>";
}
else {
	echo "<td width=\"84\" height=\"55\" align = \"left\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=sprzedazdzd&nu=$ideof\">";
	echo "<img src=\"../img/zd0.jpg\" width=\"80\" height=\"50\" alt=\"Brak zdjêcia\" class=\"ira\"></img></a><br>";
	echo "</center>";
	echo "</td>";
}

$cena1 = number_format($cena1,'', '.', '.');

echo "<td align = \"left\" width=\"110\"><span class=\"poleca\">";
echo "<b>Lok.:</b> $lok1";
echo "<br>";
echo "<b>Pow.:</b> $powuzyt1 m2";
echo "<br>";
echo "<b>Cena:</b> $cena1 z³.";
echo "<br>";
echo "$tekst1";
echo "</span></td>";
echo "</tr>";
echo "</table>";		
}



?>