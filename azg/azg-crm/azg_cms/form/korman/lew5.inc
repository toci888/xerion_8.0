<?
$identbiura = "1";
$ok = "_b";
// polaczenie z baza
$conn = pg_connect ("host=10.1.0.223 user=azg password=grrrBONNN23 dbname=nierazg");
if (!conn){
	echo "Przykro nam w tej chwili baza ofert jest chwilowo nieczynna.\n";
	exit;
}	

$sql0 = "select kat_of, rodz_nie, id_of, no_of from lewa where num_okn = '5' and id_b = '$identbiura';";

$result_set0 = pg_Exec($conn, $sql0);

		$kate = pg_result($result_set0, 0, "kat_of");
		$rodze = pg_result($result_set0, 0, "rodz_nie");
		$ideof = pg_result($result_set0, 0, "id_of");
		$numeof = pg_result($result_set0, 0, "no_of");


if (($kate == 'sprzedaz') & ($rodze == 'mieszkanie')) {

echo "<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" frame border=\"0\">";

$sql1 = "select lok_m, powuzyt_m, cm_m, zd1 from tab_mie where id_m = '$ideof' and id_b = '$identbiura';";
$result_set1 = pg_Exec($conn, $sql1);

		$lok1 = pg_result($result_set1, 0, "lok_m");
		$powuzyt1 = pg_result($result_set1, 0, "powuzyt_m");
		$cena1 = pg_result($result_set1, 0, "cm_m");
		$zdj1 = pg_result($result_set1, 0, "zd1");

$tekst1 = "<a href = \"$PHP_SELF?action=sprzedazmzd&nu=$ideof\">wi�cej ...</a>";

echo "<tr align=\"left\"><td colspan = \"20\" height=\"2\">";
echo "</td></tr>";

echo "<tr valign = \"top\">";

if ($zdj1 != 0) {
	echo "<td width=\"125\" height=\"100\" align = \"left\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=sprzedazmzd&nu=$ideof\">";
	echo "<img src=\"../img/zd$zdj1.jpg\" width=\"120\" height=\"90\" border=\"0\" alt=\"Zdj�cie nr$zdj1\"></img></a>";
	echo "<center>";
	echo "<span class=\"poleca\">";
	echo "<a href = \"$PHP_SELF?action=sprzedazmzd&nu=$ideof\">";
	echo "Mieszkanie - Sprzeda�";
	echo "</a>";
	echo "</span>";
	echo "</center>";
	echo "</td>";
}
else {
	echo "<td width=\"125\" height=\"100\" align = \"left\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=sprzedazmzd&nu=$ideof\">";
	echo "<img src=\"../img/zd0.jpg\" width=\"120\" height=\"90\" alt=\"Brak zdj�cia\"></img></a>";
	echo "</center>";
	echo "<center>";
	echo "<span class=\"poleca\">";
	echo "<br>";
	echo "<a href = \"$PHP_SELF?action=sprzedazmzd&nu=$ideof\">";
	echo "Mieszkanie - Sprzeda�";
	echo "</a>";
	echo "</span>";
	echo "</center>";
	echo "</td>";
}
echo"</tr>
<tr><td colspan = \"20\"><img src=\"img/red.gif\" width=\"128\" height=\"1\" border=\"0\" alt=\"\"></td></tr>";

echo "</table>";		
}

if (($kate == 'sprzedaz') & ($rodze == 'dom')) {

echo "<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" frame border=\"0\">";

$sql1 = "select lok_d, powuzyt_d, cd, zd1 from tab_dom where id_d = '$ideof' and id_b = '$identbiura';";
$result_set1 = pg_Exec($conn, $sql1);

		$lok1 = pg_result($result_set1, 0, "lok_d");
		$powuzyt1 = pg_result($result_set1, 0, "powuzyt_d");
		$cena1 = pg_result($result_set1, 0, "cd");
		$zdj1 = pg_result($result_set1, 0, "zd1");

$tekst1 = "<a href = \"$PHP_SELF?action=sprzedazdzd&nu=$ideof\">wi�cej ...</a>";

echo "<tr align=\"left\"><td colspan = \"20\" height=\"2\">";
echo "</td></tr>";

echo "<tr valign = \"top\">";

if ($zdj1 != 0) {
	echo "<td width=\"125\" height=\"100\" align = \"left\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=sprzedazdzd&nu=$ideof\">";
	echo "<img src=\"../img/zd$zdj1.jpg\" width=\"120\" height=\"90\" border=\"0\" alt=\"Zdj�cie nr$zdj1\"></img></a>";
	echo "<center>";
	echo "<span class=\"poleca\">";
	echo "<a href = \"$PHP_SELF?action=sprzedazdzd&nu=$ideof\">";
	echo "Dom - Sprzeda�";
	echo "</a>";
	echo "</span>";
	echo "</center>";
	echo "</td>";
}
else {
	echo "<td width=\"125\" height=\"100\" align = \"left\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=sprzedazdzd&nu=$ideof\">";
	echo "<img src=\"../img/zd0.jpg\" width=\"120\" height=\"90\" alt=\"Brak zdj�cia\"></img></a>";
	echo "</center>";
	echo "<center>";
	echo "<span class=\"poleca\">";
	echo "<br>";
	echo "<a href = \"$PHP_SELF?action=sprzedazdzd&nu=$ideof\">";
	echo "Dom - Sprzeda�";
	echo "</a>";
	echo "</span>";
	echo "</center>";
	echo "</td>";
}
echo"</tr>
<tr><td colspan = \"20\"><img src=\"img/red.gif\" width=\"128\" height=\"1\" border=\"0\" alt=\"\"></td></tr>";

echo "</table>";		
}

if (($kate == 'sprzedaz') & ($rodze == 'lokal')) {

echo "<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" frame border=\"0\">";

$sql1 = "select lok_d, powuzyt_d, cd, zd1 from tab_lok where id_d = '$ideof' and id_b = '$identbiura';";
$result_set1 = pg_Exec($conn, $sql1);

		$lok1 = pg_result($result_set1, 0, "lok_d");
		$powuzyt1 = pg_result($result_set1, 0, "powuzyt_d");
		$cena1 = pg_result($result_set1, 0, "cd");
		$zdj1 = pg_result($result_set1, 0, "zd1");

$tekst1 = "<a href = \"$PHP_SELF?action=sprzedazlzd&nu=$ideof\">wi�cej ...</a>";

echo "<tr align=\"left\"><td colspan = \"20\" height=\"2\">";
echo "</td></tr>";

echo "<tr valign = \"top\">";

if ($zdj1 != 0) {
	echo "<td width=\"125\" height=\"100\" align = \"left\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=sprzedazlzd&nu=$ideof\">";
	echo "<img src=\"../img/zd$zdj1.jpg\" width=\"120\" height=\"90\" border=\"0\" alt=\"Zdj�cie nr$zdj1\"></img></a>";
	echo "<center>";
	echo "<span class=\"poleca\">";
	echo "<a href = \"$PHP_SELF?action=sprzedazlzd&nu=$ideof\">";
	echo "Lokal - Sprzeda�";
	echo "</a>";
	echo "</span>";
	echo "</center>";
	echo "</td>";
}
else {
	echo "<td width=\"125\" height=\"100\" align = \"left\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=sprzedazlzd&nu=$ideof\">";
	echo "<img src=\"../img/zd0.jpg\" width=\"120\" height=\"90\" alt=\"Brak zdj�cia\"></img></a>";
	echo "</center>";
	echo "<center>";
	echo "<span class=\"poleca\">";
	echo "<br>";
	echo "<a href = \"$PHP_SELF?action=sprzedazlzd&nu=$ideof\">";
	echo "Lokal - Sprzeda�";
	echo "</a>";
	echo "</span>";
	echo "</center>";
	echo "</td>";
}
echo"</tr>
<tr><td colspan = \"20\"><img src=\"img/red.gif\" width=\"128\" height=\"1\" border=\"0\" alt=\"\"></td></tr>";

echo "</table>";		
}

if (($kate == 'sprzedaz') & ($rodze == 'obiekt')) {

echo "<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" frame border=\"0\">";

$sql1 = "select lok_d, powuzyt_d, cd, zd1 from tab_obi where id_d = '$ideof' and id_b = '$identbiura';";
$result_set1 = pg_Exec($conn, $sql1);

		$lok1 = pg_result($result_set1, 0, "lok_d");
		$powuzyt1 = pg_result($result_set1, 0, "powuzyt_d");
		$cena1 = pg_result($result_set1, 0, "cd");
		$zdj1 = pg_result($result_set1, 0, "zd1");

$tekst1 = "<a href = \"$PHP_SELF?action=sprzedazozd&nu=$ideof\">wi�cej ...</a>";

echo "<tr align=\"left\"><td colspan = \"20\" height=\"2\">";
echo "</td></tr>";

echo "<tr valign = \"top\">";

if ($zdj1 != 0) {
	echo "<td width=\"125\" height=\"100\" align = \"left\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=sprzedazozd&nu=$ideof\">";
	echo "<img src=\"../img/zd$zdj1.jpg\" width=\"120\" height=\"90\" border=\"0\" alt=\"Zdj�cie nr$zdj1\"></img></a>";
	echo "<center>";
	echo "<span class=\"poleca\">";
	echo "<a href = \"$PHP_SELF?action=sprzedazozd&nu=$ideof\">";
	echo "Obiekt - Sprzeda�";
	echo "</a>";
	echo "</span>";
	echo "</center>";
	echo "</td>";
}
else {
	echo "<td width=\"125\" height=\"100\" align = \"left\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=sprzedazozd&nu=$ideof\">";
	echo "<img src=\"../img/zd0.jpg\" width=\"120\" height=\"90\" alt=\"Brak zdj�cia\"></img></a>";
	echo "</center>";
	echo "<center>";
	echo "<span class=\"poleca\">";
	echo "<br>";
	echo "<a href = \"$PHP_SELF?action=sprzedazozd&nu=$ideof\">";
	echo "Obiekt - Sprzeda�";
	echo "</a>";
	echo "</span>";
	echo "</center>";
	echo "</td>";
}
echo"</tr>
<tr><td colspan = \"20\"><img src=\"img/red.gif\" width=\"128\" height=\"1\" border=\"0\" alt=\"\"></td></tr>";

echo "</table>";		
}

if (($kate == 'sprzedaz') & ($rodze == 'dzialka')) {

echo "<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" frame border=\"0\">";

$sql1 = "select lok_d, powdzi_d, cd, zd1 from tab_dzi where id_d = '$ideof' and id_b = '$identbiura';";
$result_set1 = pg_Exec($conn, $sql1);

		$lok1 = pg_result($result_set1, 0, "lok_d");
		$powuzyt1 = pg_result($result_set1, 0, "powuzyt_d");
		$cena1 = pg_result($result_set1, 0, "cd");
		$zdj1 = pg_result($result_set1, 0, "zd1");

$tekst1 = "<a href = \"$PHP_SELF?action=sprzedazdzzd&nu=$ideof\">wi�cej ...</a>";

echo "<tr align=\"left\"><td colspan = \"20\" height=\"2\">";
echo "</td></tr>";

echo "<tr valign = \"top\">";

if ($zdj1 != 0) {
	echo "<td width=\"125\" height=\"100\" align = \"left\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=sprzedazdzzd&nu=$ideof\">";
	echo "<img src=\"../img/zd$zdj1.jpg\" width=\"120\" height=\"90\" border=\"0\" alt=\"Zdj�cie nr$zdj1\"></img></a>";
	echo "<center>";
	echo "<span class=\"poleca\">";
	echo "<a href = \"$PHP_SELF?action=sprzedazdzzd&nu=$ideof\">";
	echo "Dzia�ka - Sprzeda�";
	echo "</a>";
	echo "</span>";
	echo "</center>";
	echo "</td>";
}
else {
	echo "<td width=\"125\" height=\"100\" align = \"left\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=sprzedazdzzd&nu=$ideof\">";
	echo "<img src=\"../img/zd0.jpg\" width=\"120\" height=\"90\" alt=\"Brak zdj�cia\"></img></a>";
	echo "</center>";
	echo "<center>";
	echo "<span class=\"poleca\">";
	echo "<br>";
	echo "<a href = \"$PHP_SELF?action=sprzedazdzzd&nu=$ideof\">";
	echo "Dzia�ka - Sprzeda�";
	echo "</a>";
	echo "</span>";
	echo "</center>";
	echo "</td>";
}
echo"</tr>
<tr><td colspan = \"20\"><img src=\"img/red.gif\" width=\"128\" height=\"1\" border=\"0\" alt=\"\"></td></tr>";

echo "</table>";		
}


if (($kate == 'sprzedaz') & ($rodze == 'teren')) {

echo "<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" frame border=\"0\">";
$sql1 = "select lok_d, powuzyt_d, cd, zd1 from tab_te where id_d = '$ideof' and id_b = '$identbiura';";
$result_set1 = pg_Exec($conn, $sql1);

		$lok1 = pg_result($result_set1, 0, "lok_d");
		$powuzyt1 = pg_result($result_set1, 0, "powuzyt_d");
		$cena1 = pg_result($result_set1, 0, "cd");
		$zdj1 = pg_result($result_set1, 0, "zd1");

$tekst1 = "<a href = \"$PHP_SELF?action=sprzedaztezd&nu=$ideof\">wi�cej ...</a>";

echo "<tr align=\"left\"><td colspan = \"20\" height=\"2\">";
echo "</td></tr>";

echo "<tr valign = \"top\">";

if ($zdj1 != 0) {
	echo "<td width=\"125\" height=\"100\" align = \"left\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=sprzedaztezd&nu=$ideof\">";
	echo "<img src=\"../img/zd$zdj1.jpg\" width=\"120\" height=\"90\" border=\"0\" alt=\"Zdj�cie nr$zdj1\"></img></a>";
	echo "<center>";
	echo "<span class=\"poleca\">";
	echo "<a href = \"$PHP_SELF?action=sprzedaztezd&nu=$ideof\">";
	echo "Teren - Sprzeda�";
	echo "</a>";
	echo "</span>";
	echo "</center>";
	echo "</td>";
}
else {
	echo "<td width=\"125\" height=\"100\" align = \"left\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=sprzedaztezd&nu=$ideof\">";
	echo "<img src=\"../img/zd0.jpg\" width=\"120\" height=\"90\" alt=\"Brak zdj�cia\"></img></a>";
	echo "</center>";
	echo "<center>";
	echo "<span class=\"poleca\">";
	echo "<br>";
	echo "<a href = \"$PHP_SELF?action=sprzedaztezd&nu=$ideof\">";
	echo "Teren - Sprzeda�";
	echo "</a>";
	echo "</span>";
	echo "</center>";
	echo "</td>";
}
echo"</tr>
<tr><td colspan = \"20\"><img src=\"img/red.gif\" width=\"128\" height=\"1\" border=\"0\" alt=\"\"></td></tr>";

echo "</table>";		
}

if (($kate == 'wynajem') & ($rodze == 'mieszkanie')) {

echo "<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" frame border=\"0\">";


$sql1 = "select lok_m, powuzyt_m, cm_m, zd1 from tab_mie_w where id_m = '$ideof' and id_b = '$identbiura';";
$result_set1 = pg_Exec($conn, $sql1);

		$lok1 = pg_result($result_set1, 0, "lok_m");
		$powuzyt1 = pg_result($result_set1, 0, "powuzyt_m");
		$cena1 = pg_result($result_set1, 0, "cm_m");
		$zdj1 = pg_result($result_set1, 0, "zd1");

$tekst1 = "<a href = \"$PHP_SELF?action=wynajemmzd&nu=$ideof\">wi�cej ...</a>";

echo "<tr align=\"left\"><td colspan = \"20\" height=\"2\">";
echo "</td></tr>";

echo "<tr valign = \"top\">";

if ($zdj1 != 0) {
	echo "<td width=\"125\" height=\"100\" align = \"left\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=wynajemmzd&nu=$ideof\">";
	echo "<img src=\"../img/zd$zdj1.jpg\" width=\"120\" height=\"90\" border=\"0\" alt=\"Zdj�cie nr$zdj1\"></img></a>";
	echo "<center>";
	echo "<span class=\"poleca\">";
	echo "<a href = \"$PHP_SELF?action=wynajemmzd&nu=$ideof\">";
	echo "Mieszkanie - Wynajem";
	echo "</a>";
	echo "</span>";
	echo "</center>";
	echo "</td>";
}
else {
	echo "<td width=\"125\" height=\"100\" align = \"left\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=wynajemmzd&nu=$ideof\">";
	echo "<img src=\"../img/zd0.jpg\" width=\"120\" height=\"90\" alt=\"Brak zdj�cia\"></img></a>";
	echo "</center>";
	echo "<center>";
	echo "<span class=\"poleca\">";
	echo "<br>";
	echo "<a href = \"$PHP_SELF?action=wynajemmzd&nu=$ideof\">";
	echo "Mieszkanie - Wynajem";
	echo "</a>";
	echo "</span>";
	echo "</center>";
	echo "</td>";
}
echo"</tr>
<tr><td colspan = \"20\"><img src=\"img/red.gif\" width=\"128\" height=\"1\" border=\"0\" alt=\"\"></td></tr>";

echo "</table>";		
}

if (($kate == 'wynajem') & ($rodze == 'dom')) {

echo "<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" frame border=\"0\">";
$sql1 = "select lok_d, powuzyt_d, cd, zd1 from tab_dom_w where id_d = '$ideof' and id_b = '$identbiura';";
$result_set1 = pg_Exec($conn, $sql1);

		$lok1 = pg_result($result_set1, 0, "lok_d");
		$powuzyt1 = pg_result($result_set1, 0, "powuzyt_d");
		$cena1 = pg_result($result_set1, 0, "cd");
		$zdj1 = pg_result($result_set1, 0, "zd1");

$tekst1 = "<a href = \"$PHP_SELF?action=wynajemdzd&nu=$ideof\">wi�cej ...</a>";

echo "<tr align=\"left\"><td colspan = \"20\" height=\"2\">";
echo "</td></tr>";

echo "<tr valign = \"top\">";

if ($zdj1 != 0) {
	echo "<td width=\"125\" height=\"100\" align = \"left\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=wynajemdzd&nu=$ideof\">";
	echo "<img src=\"../img/zd$zdj1.jpg\" width=\"120\" height=\"90\" border=\"0\" alt=\"Zdj�cie nr$zdj1\"></img></a>";
	echo "<center>";
	echo "<span class=\"poleca\">";
	echo "<a href = \"$PHP_SELF?action=wynajemdzd&nu=$ideof\">";
	echo "Dom - Wynajem";
	echo "</a>";
	echo "</span>";
	echo "</center>";
	echo "</td>";
}
else {
	echo "<td width=\"125\" height=\"100\" align = \"left\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=wynajemdzd&nu=$ideof\">";
	echo "<img src=\"../img/zd0.jpg\" width=\"120\" height=\"90\" alt=\"Brak zdj�cia\"></img></a>";
	echo "</center>";
	echo "<center>";
	echo "<span class=\"poleca\">";
	echo "<br>";
	echo "<a href = \"$PHP_SELF?action=wynajemdzd&nu=$ideof\">";
	echo "Dom - Wynajem";
	echo "</a>";
	echo "</span>";
	echo "</center>";
	echo "</td>";
}
echo"</tr>
<tr><td colspan = \"20\"><img src=\"img/red.gif\" width=\"128\" height=\"1\" border=\"0\" alt=\"\"></td></tr>";

echo "</table>";		
}

if (($kate == 'wynajem') & ($rodze == 'lokal')) {

echo "<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" frame border=\"0\">";
$sql1 = "select lok_d, powuzyt_d, cd, zd1 from tab_lok_w where id_d = '$ideof' and id_b = '$identbiura';";
$result_set1 = pg_Exec($conn, $sql1);

		$lok1 = pg_result($result_set1, 0, "lok_d");
		$powuzyt1 = pg_result($result_set1, 0, "powuzyt_d");
		$cena1 = pg_result($result_set1, 0, "cd");
		$zdj1 = pg_result($result_set1, 0, "zd1");

$tekst1 = "<a href = \"$PHP_SELF?action=wynajemlzd&nu=$ideof\">wi�cej ...</a>";

echo "<tr align=\"left\"><td colspan = \"20\" height=\"2\">";
echo "</td></tr>";

echo "<tr valign = \"top\">";

if ($zdj1 != 0) {
	echo "<td width=\"125\" height=\"100\" align = \"left\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=wynajemlzd&nu=$ideof\">";
	echo "<img src=\"../img/zd$zdj1.jpg\" width=\"120\" height=\"90\" border=\"0\" alt=\"Zdj�cie nr$zdj1\"></img></a>";
	echo "<center>";
	echo "<span class=\"poleca\">";
	echo "<a href = \"$PHP_SELF?action=wynajemlzd&nu=$ideof\">";
	echo "Lokal - Wynajem";
	echo "</a>";
	echo "</span>";
	echo "</center>";
	echo "</td>";
}
else {
	echo "<td width=\"125\" height=\"100\" align = \"left\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=wynajemlzd&nu=$ideof\">";
	echo "<img src=\"../img/zd0.jpg\" width=\"120\" height=\"90\" alt=\"Brak zdj�cia\"></img></a>";
	echo "</center>";
	echo "<center>";
	echo "<span class=\"poleca\">";
	echo "<br>";
	echo "<a href = \"$PHP_SELF?action=wynajemlzd&nu=$ideof\">";
	echo "Lokal - Wynajem";
	echo "</a>";
	echo "</span>";
	echo "</center>";
	echo "</td>";
}
echo"</tr>
<tr><td colspan = \"20\"><img src=\"img/red.gif\" width=\"128\" height=\"1\" border=\"0\" alt=\"\"></td></tr>";

echo "</table>";		
}

if (($kate == 'wynajem') & ($rodze == 'obiekt')) {

echo "<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" frame border=\"0\">";
$sql1 = "select lok_d, powuzyt_d, cd, zd1 from tab_obi_w where id_d = '$ideof' and id_b = '$identbiura';";
$result_set1 = pg_Exec($conn, $sql1);

		$lok1 = pg_result($result_set1, 0, "lok_d");
		$powuzyt1 = pg_result($result_set1, 0, "powuzyt_d");
		$cena1 = pg_result($result_set1, 0, "cd");
		$zdj1 = pg_result($result_set1, 0, "zd1");

$tekst1 = "<a href = \"$PHP_SELF?action=wynajemozd&nu=$ideof\">wi�cej ...</a>";

echo "<tr align=\"left\"><td colspan = \"20\" height=\"2\">";
echo "</td></tr>";

echo "<tr valign = \"top\">";

if ($zdj1 != 0) {
	echo "<td width=\"125\" height=\"100\" align = \"left\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=wynajemozd&nu=$ideof\">";
	echo "<img src=\"../img/zd$zdj1.jpg\" width=\"120\" height=\"90\" border=\"0\" alt=\"Zdj�cie nr$zdj1\"></img></a>";
	echo "<center>";
	echo "<span class=\"poleca\">";
	echo "<a href = \"$PHP_SELF?action=wynajemozd&nu=$ideof\">";
	echo "Obiekt - Wynajem";
	echo "</a>";
	echo "</span>";
	echo "</center>";
	echo "</td>";
}
else {
	echo "<td width=\"125\" height=\"100\" align = \"left\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=wynajemozd&nu=$ideof\">";
	echo "<img src=\"../img/zd0.jpg\" width=\"120\" height=\"90\" alt=\"Brak zdj�cia\"></img></a>";
	echo "</center>";
	echo "<center>";
	echo "<span class=\"poleca\">";
	echo "<br>";
	echo "<a href = \"$PHP_SELF?action=wynajemozd&nu=$ideof\">";
	echo "Obiekt - Wynajem";
	echo "</a>";
	echo "</span>";
	echo "</center>";
	echo "</td>";
}
echo"</tr>
<tr><td colspan = \"20\"><img src=\"img/red.gif\" width=\"128\" height=\"1\" border=\"0\" alt=\"\"></td></tr>";

echo "</table>";		
}


if (($kate == 'wynajem') & ($rodze == 'dzialka')) {

echo "<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" frame border=\"0\">";
$sql1 = "select lok_d, powdzi_d, cd, zd1 from tab_dzi_w where id_d = '$ideof' and id_b = '$identbiura';";
$result_set1 = pg_Exec($conn, $sql1);

		$lok1 = pg_result($result_set1, 0, "lok_d");
		$powuzyt1 = pg_result($result_set1, 0, "powuzyt_d");
		$cena1 = pg_result($result_set1, 0, "cd");
		$zdj1 = pg_result($result_set1, 0, "zd1");

$tekst1 = "<a href = \"$PHP_SELF?action=wynajemdzzd&nu=$ideof\">wi�cej ...</a>";

echo "<tr align=\"left\"><td colspan = \"20\" height=\"2\">";
echo "</td></tr>";

echo "<tr valign = \"top\">";

if ($zdj1 != 0) {
	echo "<td width=\"125\" height=\"100\" align = \"left\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=wynajemdzzd&nu=$ideof\">";
	echo "<img src=\"../img/zd$zdj1.jpg\" width=\"120\" height=\"90\" border=\"0\" alt=\"Zdj�cie nr$zdj1\"></img></a>";
	echo "<center>";
	echo "<span class=\"poleca\">";
	echo "<a href = \"$PHP_SELF?action=wynajemdzzd&nu=$ideof\">";
	echo "Dzia�ki - Wynajem";
	echo "</a>";
	echo "</span>";
	echo "</center>";
	echo "</td>";
}
else {
	echo "<td width=\"125\" height=\"100\" align = \"left\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=wynajemdzzd&nu=$ideof\">";
	echo "<img src=\"../img/zd0.jpg\" width=\"120\" height=\"90\" alt=\"Brak zdj�cia\"></img></a>";
	echo "</center>";
	echo "<center>";
	echo "<span class=\"poleca\">";
	echo "<br>";
	echo "<a href = \"$PHP_SELF?action=wynajemdzzd&nu=$ideof\">";
	echo "Dzia�ki - Wynajem";
	echo "</a>";
	echo "</span>";
	echo "</center>";
	echo "</td>";
}
echo"</tr>
<tr><td colspan = \"20\"><img src=\"img/red.gif\" width=\"128\" height=\"1\" border=\"0\" alt=\"\"></td></tr>";

echo "</table>";		
}


if (($kate == 'wynajem') & ($rodze == 'teren')) {

echo "<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" frame border=\"0\">";
$sql1 = "select lok_d, powuzyt_d, cd, zd1 from tab_te_w where id_d = '$ideof' and id_b = '$identbiura';";
$result_set1 = pg_Exec($conn, $sql1);

		$lok1 = pg_result($result_set1, 0, "lok_d");
		$powuzyt1 = pg_result($result_set1, 0, "powuzyt_d");
		$cena1 = pg_result($result_set1, 0, "cd");
		$zdj1 = pg_result($result_set1, 0, "zd1");

$tekst1 = "<a href = \"$PHP_SELF?action=wynajemtezd&nu=$ideof\">wi�cej ...</a>";


echo "<tr align=\"left\"><td colspan = \"20\" height=\"2\">";
echo "</td></tr>";

echo "<tr valign = \"top\">";

if ($zdj1 != 0) {
	echo "<td width=\"125\" height=\"100\" align = \"left\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=wynajemtezd&nu=$ideof\">";
	echo "<img src=\"../img/zd$zdj1.jpg\" width=\"120\" height=\"90\" border=\"0\" alt=\"Zdj�cie nr$zdj1\"></img></a>";
	echo "<center>";
	echo "<span class=\"poleca\">";
	echo "<a href = \"$PHP_SELF?action=wynajemtezd&nu=$ideof\">";
	echo "Teren - Wynajem";
	echo "</a>";
	echo "</span>";
	echo "</center>";
	echo "</td>";
}
else {
	echo "<td width=\"125\" height=\"100\" align = \"left\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=wynajemtezd&nu=$ideof\">";
	echo "<img src=\"../img/zd0.jpg\" width=\"120\" height=\"90\" alt=\"Brak zdj�cia\"></img></a>";
	echo "</center>";
	echo "<center>";
	echo "<span class=\"poleca\">";
	echo "<br>";
	echo "<a href = \"$PHP_SELF?action=wynajemtezd&nu=$ideof\">";
	echo "Teren - Wynajem";
	echo "</a>";
	echo "</span>";
	echo "</center>";
	echo "</td>";
}
echo"</tr>
<tr><td colspan = \"20\"><img src=\"img/red.gif\" width=\"128\" height=\"1\" border=\"0\" alt=\"\"></td></tr>";

echo "</table>";		
}


?>