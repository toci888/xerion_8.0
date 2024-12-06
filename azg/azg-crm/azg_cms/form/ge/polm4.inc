<?
$identbiura = "1";
$ok = "_b";
// polaczenie z baza
include "../concfg.inc";
if (!$conn){
	echo "Przykro nam w tej chwili baza ofert jest chwilowo nieczynna.\n";
	exit;
}	



$sql0 = "select kat_of, rodz_nie, id_of, no_of from polecamy where num_okn = '4' and id_b = '$identbiura';";

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
echo "WOHNUNG-VERKAUF";
echo "</span>";
echo "</center>";
echo "</td></tr>";

$sql1 = "select lok_m, powuzyt_m, cm_m, zd1, film1 from tab_mie where id_m = '$ideof' and id_b = '$identbiura';";
$result_set1 = pg_Exec($conn, $sql1);

		$lok1 = pg_result($result_set1, 0, "lok_m");
		$powuzyt1 = pg_result($result_set1, 0, "powuzyt_m");
		$cena1 = pg_result($result_set1, 0, "cm_m");
		$zdj1 = pg_result($result_set1, 0, "zd1");
		$fil1 = pg_result($result_set1, 0, "film1");
		

$tekst1 = "<a href = \"".$_SERVER['PHP_SELF']."?action=sprzedazmzd&nu=$ideof\">mehr ...</a>";

echo "<tr align=\"left\"><td colspan = \"20\" height=\"3\">";
echo "</td></tr>";

echo "<tr valign = \"top\">";

if ($zdj1 != 0) {
	echo "<td width=\"84\" height=\"55\" align = \"left\">";
	echo "<center>";
	echo "<a href = \"".$_SERVER['PHP_SELF']."?action=sprzedazmzd&nu=$ideof\">";
	echo "<img src=\"../img/zd$zdj1.jpg\" width=\"80\" height=\"50\" border=\"0\" class=\"ira\" alt=\"Zdjêcie nr$zdj1\"></img></a><br>";
		echo "</center>";
	echo "</td>";
}
else {
	echo "<td width=\"84\" height=\"55\" align = \"left\">";
	echo "<center>";
	echo "<a href = \"".$_SERVER['PHP_SELF']."?action=sprzedazmzd&nu=$ideof\">";
	echo "<img src=\"../img/zd0.jpg\" width=\"80\" height=\"50\" alt=\"Brak zdjêcia\" class=\"ira\"></img></a><br>";
	echo "</center>";
	echo "</td>";
}

$cena1 = number_format($cena1,'', '.', '.');

echo "<td align = \"left\" width=\"110\"><span class=\"poleca\">";
echo "<b>Lok.:</b> $lok1";
echo "<br>";
echo "<b>Fläche:</b> $powuzyt1 m2";
echo "<br>";
echo "<b>Preis:</b> $cena1 zl.";
echo "<br>";
echo "$tekst1";
if ($fil1 != '0') {
echo "<a href=\"".$_SERVER['PHP_SELF']."?action=sprzedazmzd&nu=$ideof\"><img src=\"../img/camera2.jpg\" width=\"25\" height=\"21\" border=\"0\"></img></a>";
}
echo "</span></td>";
echo "</tr>";
echo "</table>";		
}


if (($kate == 'sprzedaz') & ($rodze == 'dom')) {

echo "<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" frame border=\"0\">";
echo "<tr align=\"left\"><td colspan = \"20\" height=\"7\">";
echo "<center>";
echo "<span class=\"nag1bb\">";
echo "HAUS-VERKAUF";
echo "</span>";
echo "</center>";
echo "</td></tr>";

$sql1 = "select lok_d, powuzyt_d, cd, zd1, film1 from tab_dom where id_d = '$ideof' and id_b = '$identbiura';";
$result_set1 = pg_Exec($conn, $sql1);

		$lok1 = pg_result($result_set1, 0, "lok_d");
		$powuzyt1 = pg_result($result_set1, 0, "powuzyt_d");
		$cena1 = pg_result($result_set1, 0, "cd");
		$zdj1 = pg_result($result_set1, 0, "zd1");
		$fil1 = pg_result($result_set1, 0, "film1");

$tekst1 = "<a href = \"".$_SERVER['PHP_SELF']."?action=sprzedazdzd&nu=$ideof\">mehr ...</a>";

echo "<tr align=\"left\"><td colspan = \"20\" height=\"3\">";
echo "</td></tr>";

echo "<tr valign = \"top\">";

if ($zdj1 != 0) {
	echo "<td width=\"84\" height=\"55\" align = \"left\">";
	echo "<center>";
	echo "<a href = \"".$_SERVER['PHP_SELF']."?action=sprzedazdzd&nu=$ideof\">";
	echo "<img src=\"../img/zd$zdj1.jpg\" width=\"80\" height=\"50\" border=\"0\" class=\"ira\" alt=\"Zdjêcie nr$zdj1\"></img></a><br>";
	echo "</center>";
	echo "</td>";
}
else {
	echo "<td width=\"84\" height=\"55\" align = \"left\">";
	echo "<center>";
	echo "<a href = \"".$_SERVER['PHP_SELF']."?action=sprzedazdzd&nu=$ideof\">";
	echo "<img src=\"../img/zd0.jpg\" width=\"80\" height=\"50\" alt=\"Brak zdjêcia\" class=\"ira\"></img></a><br>";
	echo "</center>";
	echo "</td>";
}

$cena1 = number_format($cena1,'', '.', '.');

echo "<td align = \"left\" width=\"110\"><span class=\"poleca\">";
echo "<b>Lok.:</b> $lok1";
echo "<br>";
echo "<b>Fläche:</b> $powuzyt1 m2";
echo "<br>";
echo "<b>Preis:</b> $cena1 zl.";
echo "<br>";
echo "$tekst1";
if ($fil1 != '0') {
echo "<a href=\"".$_SERVER['PHP_SELF']."?action=sprzedazdzd&nu=$ideof\"><img src=\"../img/camera2.jpg\" width=\"25\" height=\"21\" border=\"0\"></img></a>";
}
echo "</span></td>";
echo "</tr>";
echo "</table>";		
}

if (($kate == 'sprzedaz') & ($rodze == 'lokal')) {

echo "<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" frame border=\"0\">";
echo "<tr align=\"left\"><td colspan = \"20\" height=\"7\">";
echo "<center>";
echo "<span class=\"nag1bb\">";
echo "RAUM-VERKAUF";
echo "</span>";
echo "</center>";
echo "</td></tr>";

$sql1 = "select lok_d, powuzyt_d, cd, zd1, film1 from tab_lok where id_d = '$ideof' and id_b = '$identbiura';";
$result_set1 = pg_Exec($conn, $sql1);

		$lok1 = pg_result($result_set1, 0, "lok_d");
		$powuzyt1 = pg_result($result_set1, 0, "powuzyt_d");
		$cena1 = pg_result($result_set1, 0, "cd");
		$zdj1 = pg_result($result_set1, 0, "zd1");
		$fil1 = pg_result($result_set1, 0, "film1");

$tekst1 = "<a href = \"".$_SERVER['PHP_SELF']."?action=sprzedazlzd&nu=$ideof\">mehr ...</a>";

echo "<tr align=\"left\"><td colspan = \"20\" height=\"3\">";
echo "</td></tr>";

echo "<tr valign = \"top\">";

if ($zdj1 != 0) {
	echo "<td width=\"84\" height=\"55\" align = \"left\">";
	echo "<center>";
	echo "<a href = \"".$_SERVER['PHP_SELF']."?action=sprzedazlzd&nu=$ideof\">";
	echo "<img src=\"../img/zd$zdj1.jpg\" width=\"80\" height=\"50\" border=\"0\" class=\"ira\" alt=\"Zdjêcie nr$zdj1\"></img></a><br>";
	echo "</center>";
	echo "</td>";
}
else {
	echo "<td width=\"84\" height=\"55\" align = \"left\">";
	echo "<center>";
	echo "<a href = \"".$_SERVER['PHP_SELF']."?action=sprzedazlzd&nu=$ideof\">";
	echo "<img src=\"../img/zd0.jpg\" width=\"80\" height=\"50\" alt=\"Brak zdjêcia\" class=\"ira\"></img></a><br>";
	echo "</center>";
	echo "</td>";
}

$cena1 = number_format($cena1,'', '.', '.');

echo "<td align = \"left\" width=\"110\"><span class=\"poleca\">";
echo "<b>Lok.:</b> $lok1";
echo "<br>";
echo "<b>Fläche:</b> $powuzyt1 m2";
echo "<br>";
echo "<b>Preis:</b> $cena1 zl.";
echo "<br>";
echo "$tekst1";
if ($fil1 != '0') {
echo "<a href=\"".$_SERVER['PHP_SELF']."?action=sprzedazlzd&nu=$ideof\"><img src=\"../img/camera2.jpg\" width=\"25\" height=\"21\" border=\"0\"></img></a>";
}
echo "</span></td>";
echo "</tr>";
echo "</table>";		
}

if (($kate == 'sprzedaz') & ($rodze == 'obiekt')) {

echo "<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" frame border=\"0\">";
echo "<tr align=\"left\"><td colspan = \"20\" height=\"7\">";
echo "<center>";
echo "<span class=\"nag1bb\">";
echo "OBJEKT-VERKAUF";
echo "</span>";
echo "</center>";
echo "</td></tr>";

$sql1 = "select lok_d, powuzyt_d, cd, zd1, film1 from tab_obi where id_d = '$ideof' and id_b = '$identbiura';";
$result_set1 = pg_Exec($conn, $sql1);

		$lok1 = pg_result($result_set1, 0, "lok_d");
		$powuzyt1 = pg_result($result_set1, 0, "powuzyt_d");
		$cena1 = pg_result($result_set1, 0, "cd");
		$zdj1 = pg_result($result_set1, 0, "zd1");
		$fil1 = pg_result($result_set1, 0, "film1");

$tekst1 = "<a href = \"".$_SERVER['PHP_SELF']."?action=sprzedazozd&nu=$ideof\">mehr ...</a>";

echo "<tr align=\"left\"><td colspan = \"20\" height=\"3\">";
echo "</td></tr>";

echo "<tr valign = \"top\">";

if ($zdj1 != 0) {
	echo "<td width=\"84\" height=\"55\" align = \"left\">";
	echo "<center>";
	echo "<a href = \"".$_SERVER['PHP_SELF']."?action=sprzedazozd&nu=$ideof\">";
	echo "<img src=\"../img/zd$zdj1.jpg\" width=\"80\" height=\"50\" border=\"0\" class=\"ira\" alt=\"Zdjêcie nr$zdj1\"></img></a><br>";
	echo "</center>";
	echo "</td>";
}
else {
	echo "<td width=\"84\" height=\"55\" align = \"left\">";
	echo "<center>";
	echo "<a href = \"".$_SERVER['PHP_SELF']."?action=sprzedazozd&nu=$ideof\">";
	echo "<img src=\"../img/zd0.jpg\" width=\"80\" height=\"50\" alt=\"Brak zdjêcia\" class=\"ira\"></img></a><br>";
	echo "</center>";
	echo "</td>";
}

$cena1 = number_format($cena1,'', '.', '.');

echo "<td align = \"left\" width=\"110\"><span class=\"poleca\">";
echo "<b>Lok.:</b> $lok1";
echo "<br>";
echo "<b>Fläche:</b> $powuzyt1 m2";
echo "<br>";
echo "<b>Preis:</b> $cena1 zl.";
echo "<br>";
echo "$tekst1";
if ($fil1 != '0') {
echo "<a href=\"".$_SERVER['PHP_SELF']."?action=sprzedazozd&nu=$ideof\"><img src=\"../img/camera2.jpg\" width=\"25\" height=\"21\" border=\"0\"></img></a>";
}
echo "</span></td>";
echo "</tr>";
echo "</table>";		
}


if (($kate == 'sprzedaz') & ($rodze == 'dzialka')) {

echo "<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" frame border=\"0\">";
echo "<tr align=\"left\"><td colspan = \"20\" height=\"7\">";
echo "<center>";
echo "<span class=\"nag1bb\">";
echo "GRUNDSTÜCK-VERKAUF";
echo "</span>";
echo "</center>";
echo "</td></tr>";

$sql1 = "select lok_d, powdzi_d, cd, zd1, film1 from tab_dzi where id_d = '$ideof' and id_b = '$identbiura';";
$result_set1 = pg_Exec($conn, $sql1);

		$lok1 = pg_result($result_set1, 0, "lok_d");
		$powuzyt1 = pg_result($result_set1, 0, "powdzi_d");
		$cena1 = pg_result($result_set1, 0, "cd");
		$zdj1 = pg_result($result_set1, 0, "zd1");
		$fil1 = pg_result($result_set1, 0, "film1");

$tekst1 = "<a href = \"".$_SERVER['PHP_SELF']."?action=sprzedazdzzd&nu=$ideof\">mehr ...</a>";

echo "<tr align=\"left\"><td colspan = \"20\" height=\"3\">";
echo "</td></tr>";

echo "<tr valign = \"top\">";

if ($zdj1 != 0) {
	echo "<td width=\"84\" height=\"55\" align = \"left\">";
	echo "<center>";
	echo "<a href = \"".$_SERVER['PHP_SELF']."?action=sprzedazdzzd&nu=$ideof\">";
	echo "<img src=\"../img/zd$zdj1.jpg\" width=\"80\" height=\"50\" border=\"0\" class=\"ira\" alt=\"Zdjêcie nr$zdj1\"></img></a><br>";
	echo "</center>";
	echo "</td>";
}
else {
	echo "<td width=\"84\" height=\"55\" align = \"left\">";
	echo "<center>";
	echo "<a href = \"".$_SERVER['PHP_SELF']."?action=sprzedazdzzd&nu=$ideof\">";
	echo "<img src=\"../img/zd0.jpg\" width=\"80\" height=\"50\" alt=\"Brak zdjêcia\" class=\"ira\"></img></a><br>";
	echo "</center>";
	echo "</td>";
}

$cena1 = number_format($cena1,'', '.', '.');

echo "<td align = \"left\" width=\"110\"><span class=\"poleca\">";
echo "<b>Lok.:</b> $lok1";
echo "<br>";
echo "<b>Fläche:</b> $powuzyt1 ar";
echo "<br>";
echo "<b>Preis:</b> $cena1 zl.";
echo "<br>";
echo "$tekst1";
if ($fil1 != '0') {
echo "<a href=\"".$_SERVER['PHP_SELF']."?action=sprzedazdzzd&nu=$ideof\"><img src=\"../img/camera2.jpg\" width=\"25\" height=\"21\" border=\"0\"></img></a>";
}
echo "</span></td>";
echo "</tr>";
echo "</table>";		
}


if (($kate == 'sprzedaz') & ($rodze == 'teren')) {

echo "<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" frame border=\"0\">";
echo "<tr align=\"left\"><td colspan = \"20\" height=\"7\">";
echo "<center>";
echo "<span class=\"nag1bb\">";
echo "GELÄNDE-VERKAUF";
echo "</span>";
echo "</center>";
echo "</td></tr>";

$sql1 = "select lok_d, powdzi_d, cd, zd1, film1 from tab_te where id_d = '$ideof' and id_b = '$identbiura';";
$result_set1 = pg_Exec($conn, $sql1);

		$lok1 = pg_result($result_set1, 0, "lok_d");
		$powuzyt1 = pg_result($result_set1, 0, "powdzi_d");
		$cena1 = pg_result($result_set1, 0, "cd");
		$zdj1 = pg_result($result_set1, 0, "zd1");
		$fil1 = pg_result($result_set1, 0, "film1");

$tekst1 = "<a href = \"".$_SERVER['PHP_SELF']."?action=sprzedaztezd&nu=$ideof\">mehr ...</a>";

echo "<tr align=\"left\"><td colspan = \"20\" height=\"3\">";
echo "</td></tr>";

echo "<tr valign = \"top\">";

if ($zdj1 != 0) {
	echo "<td width=\"84\" height=\"55\" align = \"left\">";
	echo "<center>";
	echo "<a href = \"".$_SERVER['PHP_SELF']."?action=sprzedaztezd&nu=$ideof\">";
	echo "<img src=\"../img/zd$zdj1.jpg\" width=\"80\" height=\"50\" border=\"0\" class=\"ira\" alt=\"Zdjêcie nr$zdj1\"></img></a><br>";
	echo "</center>";
	echo "</td>";
}
else {
	echo "<td width=\"84\" height=\"55\" align = \"left\">";
	echo "<center>";
	echo "<a href = \"".$_SERVER['PHP_SELF']."?action=sprzedaztezd&nu=$ideof\">";
	echo "<img src=\"../img/zd0.jpg\" width=\"80\" height=\"50\" alt=\"Brak zdjêcia\" class=\"ira\"></img></a><br>";
	echo "</center>";
	echo "</td>";
}

$cena1 = number_format($cena1,'', '.', '.');

echo "<td align = \"left\" width=\"110\"><span class=\"poleca\">";
echo "<b>Lok.:</b> $lok1";
echo "<br>";
echo "<b>Fläche:</b> $powuzyt1 ar";
echo "<br>";
echo "<b>Preis:</b> $cena1 zl.";
echo "<br>";
echo "$tekst1";
if ($fil1 != '0') {
echo "<a href=\"".$_SERVER['PHP_SELF']."?action=sprzedaztezd&nu=$ideof\"><img src=\"../img/camera2.jpg\" width=\"25\" height=\"21\" border=\"0\"></img></a>";
}
echo "</span></td>";
echo "</tr>";
echo "</table>";		
}

if (($kate == 'wynajem') & ($rodze == 'mieszkanie')) {

echo "<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" frame border=\"0\">";
echo "<tr align=\"left\"><td colspan = \"20\" height=\"7\">";
echo "<center>";
echo "<span class=\"nag1bb\">";
echo "WOHNUNG-MIETE";
echo "</span>";
echo "</center>";
echo "</td></tr>";

$sql1 = "select lok_m, powuzyt_m, cm_m, zd1, film1 from tab_mie_w where id_m = '$ideof' and id_b = '$identbiura';";
$result_set1 = pg_Exec($conn, $sql1);

		$lok1 = pg_result($result_set1, 0, "lok_m");
		$powuzyt1 = pg_result($result_set1, 0, "powuzyt_m");
		$cena1 = pg_result($result_set1, 0, "cm_m");
		$zdj1 = pg_result($result_set1, 0, "zd1");
		$fil1 = pg_result($result_set1, 0, "film1");

$tekst1 = "<a href = \"".$_SERVER['PHP_SELF']."?action=wynajemmzd&nu=$ideof\">mehr ...</a>";

echo "<tr align=\"left\"><td colspan = \"20\" height=\"3\">";
echo "</td></tr>";

echo "<tr valign = \"top\">";

if ($zdj1 != 0) {
	echo "<td width=\"84\" height=\"55\" align = \"left\">";
	echo "<center>";
	echo "<a href = \"".$_SERVER['PHP_SELF']."?action=wynajemmzd&nu=$ideof\">";
	echo "<img src=\"../img/zd$zdj1.jpg\" width=\"80\" height=\"50\" border=\"0\" class=\"ira\" alt=\"Zdjêcie nr$zdj1\"></img></a><br>";
	echo "</center>";
	echo "</td>";
}
else {
	echo "<td width=\"84\" height=\"55\" align = \"left\">";
	echo "<center>";
	echo "<a href = \"".$_SERVER['PHP_SELF']."?action=wynajemmzd&nu=$ideof\">";
	echo "<img src=\"../img/zd0.jpg\" width=\"80\" height=\"50\" alt=\"Brak zdjêcia\" class=\"ira\"></img></a><br>";
	echo "</center>";
	echo "</td>";
}

$cena1 = number_format($cena1,'', '.', '.');

echo "<td align = \"left\" width=\"110\"><span class=\"poleca\">";
echo "<b>Lok.:</b> $lok1";
echo "<br>";
echo "<b>Fläche:</b> $powuzyt1 m2";
echo "<br>";
echo "<b>Preis:</b> $cena1 zl.";
echo "<br>";
echo "$tekst1";
if ($fil1 != '0') {
echo "<a href=\"".$_SERVER['PHP_SELF']."?action=wynajemmzd&nu=$ideof\"><img src=\"../img/camera2.jpg\" width=\"25\" height=\"21\" border=\"0\"></img></a>";
}
echo "</span></td>";
echo "</tr>";
echo "</table>";		
}


if (($kate == 'wynajem') & ($rodze == 'dom')) {

echo "<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" frame border=\"0\">";
echo "<tr align=\"left\"><td colspan = \"20\" height=\"7\">";
echo "<center>";
echo "<span class=\"nag1bb\">";
echo "HAUS-MIETE";
echo "</span>";
echo "</center>";
echo "</td></tr>";

$sql1 = "select lok_d, powuzyt_d, cd, zd1, film1 from tab_dom_w where id_d = '$ideof' and id_b = '$identbiura';";
$result_set1 = pg_Exec($conn, $sql1);

		$lok1 = pg_result($result_set1, 0, "lok_d");
		$powuzyt1 = pg_result($result_set1, 0, "powuzyt_d");
		$cena1 = pg_result($result_set1, 0, "cd");
		$zdj1 = pg_result($result_set1, 0, "zd1");
		$fil1 = pg_result($result_set1, 0, "film1");

$tekst1 = "<a href = \"".$_SERVER['PHP_SELF']."?action=wynajemdzd&nu=$ideof\">mehr ...</a>";

echo "<tr align=\"left\"><td colspan = \"20\" height=\"3\">";
echo "</td></tr>";

echo "<tr valign = \"top\">";

if ($zdj1 != 0) {
	echo "<td width=\"84\" height=\"55\" align = \"left\">";
	echo "<center>";
	echo "<a href = \"".$_SERVER['PHP_SELF']."?action=wynajemdzd&nu=$ideof\">";
	echo "<img src=\"../img/zd$zdj1.jpg\" width=\"80\" height=\"50\" border=\"0\" class=\"ira\" alt=\"Zdjêcie nr$zdj1\"></img></a><br>";
	echo "</center>";
	echo "</td>";
}
else {
	echo "<td width=\"84\" height=\"55\" align = \"left\">";
	echo "<center>";
	echo "<a href = \"".$_SERVER['PHP_SELF']."?action=wynajemdzd&nu=$ideof\">";
	echo "<img src=\"../img/zd0.jpg\" width=\"80\" height=\"50\" alt=\"Brak zdjêcia\" class=\"ira\"></img></a><br>";
	echo "</center>";
	echo "</td>";
}

$cena1 = number_format($cena1,'', '.', '.');

echo "<td align = \"left\" width=\"110\"><span class=\"poleca\">";
echo "<b>Lok.:</b> $lok1";
echo "<br>";
echo "<b>Fläche:</b> $powuzyt1 m2";
echo "<br>";
echo "<b>Preis:</b> $cena1 zl.";
echo "<br>";
echo "$tekst1";
if ($fil1 != '0') {
echo "<a href=\"".$_SERVER['PHP_SELF']."?action=wynajemdzd&nu=$ideof\"><img src=\"../img/camera2.jpg\" width=\"25\" height=\"21\" border=\"0\"></img></a>";
}
echo "</span></td>";
echo "</tr>";
echo "</table>";		
}

if (($kate == 'wynajem') & ($rodze == 'lokal')) {

echo "<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" frame border=\"0\">";
echo "<tr align=\"left\"><td colspan = \"20\" height=\"7\">";
echo "<center>";
echo "<span class=\"nag1bb\">";
echo "RAUM-MIETE";
echo "</span>";
echo "</center>";
echo "</td></tr>";

$sql1 = "select lok_d, powuzyt_d, cd, zd1, film1 from tab_lok_w where id_d = '$ideof' and id_b = '$identbiura';";
$result_set1 = pg_Exec($conn, $sql1);

		$lok1 = pg_result($result_set1, 0, "lok_d");
		$powuzyt1 = pg_result($result_set1, 0, "powuzyt_d");
		$cena1 = pg_result($result_set1, 0, "cd");
		$zdj1 = pg_result($result_set1, 0, "zd1");
		$fil1 = pg_result($result_set1, 0, "film1");

$tekst1 = "<a href = \"".$_SERVER['PHP_SELF']."?action=wynajemlzd&nu=$ideof\">mehr ...</a>";

echo "<tr align=\"left\"><td colspan = \"20\" height=\"3\">";
echo "</td></tr>";

echo "<tr valign = \"top\">";

if ($zdj1 != 0) {
	echo "<td width=\"84\" height=\"55\" align = \"left\">";
	echo "<center>";
	echo "<a href = \"".$_SERVER['PHP_SELF']."?action=wynajemlzd&nu=$ideof\">";
	echo "<img src=\"../img/zd$zdj1.jpg\" width=\"80\" height=\"50\" border=\"0\" class=\"ira\" alt=\"Zdjêcie nr$zdj1\"></img></a><br>";
	echo "</center>";
	echo "</td>";
}
else {
	echo "<td width=\"84\" height=\"55\" align = \"left\">";
	echo "<center>";
	echo "<a href = \"".$_SERVER['PHP_SELF']."?action=wynajemlzd&nu=$ideof\">";
	echo "<img src=\"../img/zd0.jpg\" width=\"80\" height=\"50\" alt=\"Brak zdjêcia\" class=\"ira\"></img></a><br>";
	echo "</center>";
	echo "</td>";
}

$cena1 = number_format($cena1,'', '.', '.');

echo "<td align = \"left\" width=\"110\"><span class=\"poleca\">";
echo "<b>Lok.:</b> $lok1";
echo "<br>";
echo "<b>Fläche:</b> $powuzyt1 m2";
echo "<br>";
echo "<b>Preis:</b> $cena1 zl.";
echo "<br>";
echo "$tekst1";
if ($fil1 != '0') {
echo "<a href=\"".$_SERVER['PHP_SELF']."?action=wynajemlzd&nu=$ideof\"><img src=\"../img/camera2.jpg\" width=\"25\" height=\"21\" border=\"0\"></img></a>";
}
echo "</span></td>";
echo "</tr>";
echo "</table>";		
}

if (($kate == 'wynajem') & ($rodze == 'obiekt')) {

echo "<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" frame border=\"0\">";
echo "<tr align=\"left\"><td colspan = \"20\" height=\"7\">";
echo "<center>";
echo "<span class=\"nag1bb\">";
echo "OBJEKT-MIETE";
echo "</span>";
echo "</center>";
echo "</td></tr>";

$sql1 = "select lok_d, powuzyt_d, cd, zd1, film1 from tab_obi_w where id_d = '$ideof' and id_b = '$identbiura';";
$result_set1 = pg_Exec($conn, $sql1);

		$lok1 = pg_result($result_set1, 0, "lok_d");
		$powuzyt1 = pg_result($result_set1, 0, "powuzyt_d");
		$cena1 = pg_result($result_set1, 0, "cd");
		$zdj1 = pg_result($result_set1, 0, "zd1");
		$fil1 = pg_result($result_set1, 0, "film1");

$tekst1 = "<a href = \"".$_SERVER['PHP_SELF']."?action=wynajemozd&nu=$ideof\">mehr ...</a>";

echo "<tr align=\"left\"><td colspan = \"20\" height=\"3\">";
echo "</td></tr>";

echo "<tr valign = \"top\">";

if ($zdj1 != 0) {
	echo "<td width=\"84\" height=\"55\" align = \"left\">";
	echo "<center>";
	echo "<a href = \"".$_SERVER['PHP_SELF']."?action=wynajemozd&nu=$ideof\">";
	echo "<img src=\"../img/zd$zdj1.jpg\" width=\"80\" height=\"50\" border=\"0\" class=\"ira\" alt=\"Zdjêcie nr$zdj1\"></img></a><br>";
	echo "</center>";
	echo "</td>";
}
else {
	echo "<td width=\"84\" height=\"55\" align = \"left\">";
	echo "<center>";
	echo "<a href = \"".$_SERVER['PHP_SELF']."?action=wynajemozd&nu=$ideof\">";
	echo "<img src=\"../img/zd0.jpg\" width=\"80\" height=\"50\" alt=\"Brak zdjêcia\" class=\"ira\"></img></a><br>";
	echo "</center>";
	echo "</td>";
}

$cena1 = number_format($cena1,'', '.', '.');

echo "<td align = \"left\" width=\"110\"><span class=\"poleca\">";
echo "<b>Lok.:</b> $lok1";
echo "<br>";
echo "<b>Fläche:</b> $powuzyt1 m2";
echo "<br>";
echo "<b>Preis:</b> $cena1 zl.";
echo "<br>";
echo "$tekst1";
if ($fil1 != '0') {
echo "<a href=\"".$_SERVER['PHP_SELF']."?action=wynajemozd&nu=$ideof\"><img src=\"../img/camera2.jpg\" width=\"25\" height=\"21\" border=\"0\"></img></a>";
}
echo "</span></td>";
echo "</tr>";
echo "</table>";		
}


if (($kate == 'wynajem') & ($rodze == 'dzialka')) {

echo "<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" frame border=\"0\">";
echo "<tr align=\"left\"><td colspan = \"20\" height=\"7\">";
echo "<center>";
echo "<span class=\"nag1bb\">";
echo "GRUNDSTÜCK-MIETE";
echo "</span>";
echo "</center>";
echo "</td></tr>";

$sql1 = "select lok_d, powdzi_d, cd, zd1, film1 from tab_dzi_w where id_d = '$ideof' and id_b = '$identbiura';";
$result_set1 = pg_Exec($conn, $sql1);

		$lok1 = pg_result($result_set1, 0, "lok_d");
		$powuzyt1 = pg_result($result_set1, 0, "powdzi_d");
		$cena1 = pg_result($result_set1, 0, "cd");
		$zdj1 = pg_result($result_set1, 0, "zd1");
		$fil1 = pg_result($result_set1, 0, "film1");

$tekst1 = "<a href = \"".$_SERVER['PHP_SELF']."?action=wynajemdzzd&nu=$ideof\">mehr ...</a>";

echo "<tr align=\"left\"><td colspan = \"20\" height=\"3\">";
echo "</td></tr>";

echo "<tr valign = \"top\">";

if ($zdj1 != 0) {
	echo "<td width=\"84\" height=\"55\" align = \"left\">";
	echo "<center>";
	echo "<a href = \"".$_SERVER['PHP_SELF']."?action=wynajemdzzd&nu=$ideof\">";
	echo "<img src=\"../img/zd$zdj1.jpg\" width=\"80\" height=\"50\" border=\"0\" class=\"ira\" alt=\"Zdjêcie nr$zdj1\"></img></a><br>";
	echo "</center>";
	echo "</td>";
}
else {
	echo "<td width=\"84\" height=\"55\" align = \"left\">";
	echo "<center>";
	echo "<a href = \"".$_SERVER['PHP_SELF']."?action=wynajemdzzd&nu=$ideof\">";
	echo "<img src=\"../img/zd0.jpg\" width=\"80\" height=\"50\" alt=\"Brak zdjêcia\" class=\"ira\"></img></a><br>";
	echo "</center>";
	echo "</td>";
}

$cena1 = number_format($cena1,'', '.', '.');

echo "<td align = \"left\" width=\"110\"><span class=\"poleca\">";
echo "<b>Lok.:</b> $lok1";
echo "<br>";
echo "<b>Fläche:</b> $powuzyt1 ar";
echo "<br>";
echo "<b>Preis:</b> $cena1 zl.";
echo "<br>";
echo "$tekst1";
if ($fil1 != '0') {
echo "<a href=\"".$_SERVER['PHP_SELF']."?action=wynajemdzzd&nu=$ideof\"><img src=\"../img/camera2.jpg\" width=\"25\" height=\"21\" border=\"0\"></img></a>";
}
echo "</span></td>";
echo "</tr>";
echo "</table>";		
}


if (($kate == 'wynajem') & ($rodze == 'teren')) {

echo "<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" frame border=\"0\">";
echo "<tr align=\"left\"><td colspan = \"20\" height=\"7\">";
echo "<center>";
echo "<span class=\"nag1bb\">";
echo "GELÄNDE-MIETE";
echo "</span>";
echo "</center>";
echo "</td></tr>";

$sql1 = "select lok_d, powdzi_d, cd, zd1, film1 from tab_te_w where id_d = '$ideof' and id_b = '$identbiura';";
$result_set1 = pg_Exec($conn, $sql1);

		$lok1 = pg_result($result_set1, 0, "lok_d");
		$powuzyt1 = pg_result($result_set1, 0, "powdzi_d");
		$cena1 = pg_result($result_set1, 0, "cd");
		$zdj1 = pg_result($result_set1, 0, "zd1");
		$fil1 = pg_result($result_set1, 0, "film1");

$tekst1 = "<a href = \"".$_SERVER['PHP_SELF']."?action=wynajemtezd&nu=$ideof\">mehr ...</a>";

echo "<tr align=\"left\"><td colspan = \"20\" height=\"3\">";
echo "</td></tr>";

echo "<tr valign = \"top\">";

if ($zdj1 != 0) {
	echo "<td width=\"84\" height=\"55\" align = \"left\">";
	echo "<center>";
	echo "<a href = \"".$_SERVER['PHP_SELF']."?action=wynajemtezd&nu=$ideof\">";
	echo "<img src=\"../img/zd$zdj1.jpg\" width=\"80\" height=\"50\" border=\"0\" class=\"ira\" alt=\"Zdjêcie nr$zdj1\"></img></a><br>";
	echo "</center>";
	echo "</td>";
}
else {
	echo "<td width=\"84\" height=\"55\" align = \"left\">";
	echo "<center>";
	echo "<a href = \"".$_SERVER['PHP_SELF']."?action=wynajemtezd&nu=$ideof\">";
	echo "<img src=\"../img/zd0.jpg\" width=\"80\" height=\"50\" alt=\"Brak zdjêcia\" class=\"ira\"></img></a><br>";
	echo "</center>";
	echo "</td>";
}

$cena1 = number_format($cena1,'', '.', '.');

echo "<td align = \"left\" width=\"110\"><span class=\"poleca\">";
echo "<b>Lok.:</b> $lok1";
echo "<br>";
echo "<b>Fläche:</b> $powuzyt1 ar";
echo "<br>";
echo "<b>Preis:</b> $cena1 zl.";
echo "<br>";
echo "$tekst1";
if ($fil1 != '0') {
echo "<a href=\"".$_SERVER['PHP_SELF']."?action=wynajemtezd&nu=$ideof\"><img src=\"../img/camera2.jpg\" width=\"25\" height=\"21\" border=\"0\"></img></a>";
}
echo "</span></td>";
echo "</tr>";
echo "</table>";		
}

if (($kate == 'zamiana') & ($rodze == 'mieszkanie')) {

echo "<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" frame border=\"0\">";
echo "<tr align=\"left\"><td colspan = \"20\" height=\"7\">";
echo "<center>";
echo "<span class=\"nag1bb\">";
echo "WOHNUNG-TAUSCH";
echo "</span>";
echo "</center>";
echo "</td></tr>";

$sql1 = "select lok_m, powuzyt_m, cm_m, zd1, film1 from tab_mie_za where id_m = '$ideof' and id_b = '$identbiura';";
$result_set1 = pg_Exec($conn, $sql1);

		$lok1 = pg_result($result_set1, 0, "lok_m");
		$powuzyt1 = pg_result($result_set1, 0, "powuzyt_m");
		$cena1 = pg_result($result_set1, 0, "cm_m");
		$zdj1 = pg_result($result_set1, 0, "zd1");
		$fil1 = pg_result($result_set1, 0, "film1");

$tekst1 = "<a href = \"".$_SERVER['PHP_SELF']."?action=zamianamzd&nu=$ideof\">mehr ...</a>";

echo "<tr align=\"left\"><td colspan = \"20\" height=\"3\">";
echo "</td></tr>";

echo "<tr valign = \"top\">";

if ($zdj1 != 0) {
	echo "<td width=\"84\" height=\"55\" align = \"left\">";
	echo "<center>";
	echo "<a href = \"".$_SERVER['PHP_SELF']."?action=zamianamzd&nu=$ideof\">";
	echo "<img src=\"../img/zd$zdj1.jpg\" width=\"80\" height=\"50\" border=\"0\" class=\"ira\" alt=\"Zdjêcie nr$zdj1\"></img></a><br>";
	echo "</center>";
	echo "</td>";
}
else {
	echo "<td width=\"84\" height=\"55\" align = \"left\">";
	echo "<center>";
	echo "<a href = \"".$_SERVER['PHP_SELF']."?action=zamianamzd&nu=$ideof\">";
	echo "<img src=\"../img/zd0.jpg\" width=\"80\" height=\"50\" alt=\"Brak zdjêcia\" class=\"ira\"></img></a><br>";
	echo "</center>";
	echo "</td>";
}

$cena1 = number_format($cena1,'', '.', '.');

echo "<td align = \"left\" width=\"110\"><span class=\"poleca\">";
echo "<b>Lok.:</b> $lok1";
echo "<br>";
echo "<b>Fläche:</b> $powuzyt1 m2";
echo "<br>";
echo "<b>Preis:</b> $cena1 zl.";
echo "<br>";
if ($fil1 != '0') {
echo "<a href=\"".$_SERVER['PHP_SELF']."?action=zamianamzd&nu=$ideof\"><img src=\"../img/camera2.jpg\" width=\"25\" height=\"21\" border=\"0\"></img></a>";
}
echo "$tekst1";
echo "</span></td>";
echo "</tr>";
echo "</table>";		
}


if (($kate == 'zamiana') & ($rodze == 'dom')) {

echo "<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" frame border=\"0\">";
echo "<tr align=\"left\"><td colspan = \"20\" height=\"7\">";
echo "<center>";
echo "<span class=\"nag1bb\">";
echo "HAUS-TAUSCH";
echo "</span>";
echo "</center>";
echo "</td></tr>";

$sql1 = "select lok_d, powuzyt_d, cd, zd1, film1 from tab_dom_za where id_d = '$ideof' and id_b = '$identbiura';";
$result_set1 = pg_Exec($conn, $sql1);

		$lok1 = pg_result($result_set1, 0, "lok_d");
		$powuzyt1 = pg_result($result_set1, 0, "powuzyt_d");
		$cena1 = pg_result($result_set1, 0, "cd");
		$zdj1 = pg_result($result_set1, 0, "zd1");
		$fil1 = pg_result($result_set1, 0, "film1");

$tekst1 = "<a href = \"".$_SERVER['PHP_SELF']."?action=zamianadzd&nu=$ideof\">mehr ...</a>";

echo "<tr align=\"left\"><td colspan = \"20\" height=\"3\">";
echo "</td></tr>";

echo "<tr valign = \"top\">";

if ($zdj1 != 0) {
	echo "<td width=\"84\" height=\"55\" align = \"left\">";
	echo "<center>";
	echo "<a href = \"".$_SERVER['PHP_SELF']."?action=zamianadzd&nu=$ideof\">";
	echo "<img src=\"../img/zd$zdj1.jpg\" width=\"80\" height=\"50\" border=\"0\" class=\"ira\" alt=\"Zdjêcie nr$zdj1\"></img></a><br>";
	echo "</center>";
	echo "</td>";
}
else {
	echo "<td width=\"84\" height=\"55\" align = \"left\">";
	echo "<center>";
	echo "<a href = \"".$_SERVER['PHP_SELF']."?action=zamianadzd&nu=$ideof\">";
	echo "<img src=\"../img/zd0.jpg\" width=\"80\" height=\"50\" alt=\"Brak zdjêcia\" class=\"ira\"></img></a><br>";
	echo "</center>";
	echo "</td>";
}

$cena1 = number_format($cena1,'', '.', '.');

echo "<td align = \"left\" width=\"110\"><span class=\"poleca\">";
echo "<b>Lok.:</b> $lok1";
echo "<br>";
echo "<b>Fläche:</b> $powuzyt1 m2";
echo "<br>";
echo "<b>Preis:</b> $cena1 zl.";
echo "<br>";
echo "$tekst1";
if ($fil1 != '0') {
echo "<a href=\"".$_SERVER['PHP_SELF']."?action=zamianadzd&nu=$ideof\"><img src=\"../img/camera2.jpg\" width=\"25\" height=\"21\" border=\"0\"></img></a>";
}
echo "</span></td>";
echo "</tr>";
echo "</table>";		
}


?>