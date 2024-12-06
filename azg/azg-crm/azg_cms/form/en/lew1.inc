<?
$identbiura = "1";
$ok = "_b";
// polaczenie z baza
include "../concfg.inc";
if (!$conn){
	echo "W are very sorry.\n";
	exit;
}	

$sql0 = "select kat_of, rodz_nie, id_of, no_of from lewa where num_okn = '1' and id_b = '$identbiura';";

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

$tekst1 = "<a href = \"".$_SERVER['PHP_SELF']."?action=sprzedazmzd&nu=$ideof\">wiêcej ...</a>";

echo "<tr align=\"left\"><td colspan = \"20\" height=\"2\">";
echo "</td></tr>";

echo "<tr valign = \"top\">";

if ($zdj1 != 0) {
	echo "<td width=\"125\" height=\"100\" align = \"left\">";
	echo "<center>";
	echo "<a href = \"".$_SERVER['PHP_SELF']."?action=sprzedazmzd&nu=$ideof\">";
	echo "<img src=\"../img/zd$zdj1.jpg\" width=\"120\" height=\"90\" border=\"0\" alt=\"Zdjêcie nr$zdj1\"></img></a>";
	echo "<center>";
	echo "<span class=\"poleca\">";
	echo "<a href = \"".$_SERVER['PHP_SELF']."?action=sprzedazmzd&nu=$ideof\">";
	echo "Flat - Sale";
	echo "</a>";
	echo "</span>";
	echo "</center>";
	echo "</td>";
}
else {
	echo "<td width=\"125\" height=\"100\" align = \"left\">";
	echo "<center>";
	echo "<a href = \"".$_SERVER['PHP_SELF']."?action=sprzedazmzd&nu=$ideof\">";
	echo "<img src=\"../img/zd0.jpg\" width=\"120\" height=\"90\" alt=\"Brak zdjêcia\"></img></a>";
	echo "</center>";
	echo "<center>";
	echo "<span class=\"poleca\">";
	echo "<br>";
	echo "<a href = \"".$_SERVER['PHP_SELF']."?action=sprzedazmzd&nu=$ideof\">";
	echo "Flat - Sale";
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

$tekst1 = "<a href = \"".$_SERVER['PHP_SELF']."?action=sprzedazdzd&nu=$ideof\">wiêcej ...</a>";

echo "<tr align=\"left\"><td colspan = \"20\" height=\"2\">";
echo "</td></tr>";

echo "<tr valign = \"top\">";

if ($zdj1 != 0) {
	echo "<td width=\"125\" height=\"100\" align = \"left\">";
	echo "<center>";
	echo "<a href = \"".$_SERVER['PHP_SELF']."?action=sprzedazdzd&nu=$ideof\">";
	echo "<img src=\"../img/zd$zdj1.jpg\" width=\"120\" height=\"90\" border=\"0\" alt=\"Zdjêcie nr$zdj1\"></img></a>";
	echo "<center>";
	echo "<span class=\"poleca\">";
	echo "<a href = \"".$_SERVER['PHP_SELF']."?action=sprzedazdzd&nu=$ideof\">";
	echo "House - Sale";
	echo "</a>";
	echo "</span>";
	echo "</center>";
	echo "</td>";
}
else {
	echo "<td width=\"125\" height=\"100\" align = \"left\">";
	echo "<center>";
	echo "<a href = \"".$_SERVER['PHP_SELF']."?action=sprzedazdzd&nu=$ideof\">";
	echo "<img src=\"../img/zd0.jpg\" width=\"120\" height=\"90\" alt=\"Brak zdjêcia\"></img></a>";
	echo "</center>";
	echo "<center>";
	echo "<span class=\"poleca\">";
	echo "<br>";
	echo "<a href = \"".$_SERVER['PHP_SELF']."?action=sprzedazdzd&nu=$ideof\">";
	echo "House - Sale";
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

$tekst1 = "<a href = \"".$_SERVER['PHP_SELF']."?action=sprzedazlzd&nu=$ideof\">wiêcej ...</a>";

echo "<tr align=\"left\"><td colspan = \"20\" height=\"2\">";
echo "</td></tr>";

echo "<tr valign = \"top\">";

if ($zdj1 != 0) {
	echo "<td width=\"125\" height=\"100\" align = \"left\">";
	echo "<center>";
	echo "<a href = \"".$_SERVER['PHP_SELF']."?action=sprzedazlzd&nu=$ideof\">";
	echo "<img src=\"../img/zd$zdj1.jpg\" width=\"120\" height=\"90\" border=\"0\" alt=\"Zdjêcie nr$zdj1\"></img></a>";
	echo "<center>";
	echo "<span class=\"poleca\">";
	echo "<a href = \"".$_SERVER['PHP_SELF']."?action=sprzedazlzd&nu=$ideof\">";
	echo "Premises - Sale";
	echo "</a>";
	echo "</span>";
	echo "</center>";
	echo "</td>";
}
else {
	echo "<td width=\"125\" height=\"100\" align = \"left\">";
	echo "<center>";
	echo "<a href = \"".$_SERVER['PHP_SELF']."?action=sprzedazlzd&nu=$ideof\">";
	echo "<img src=\"../img/zd0.jpg\" width=\"120\" height=\"90\" alt=\"Brak zdjêcia\"></img></a>";
	echo "</center>";
	echo "<center>";
	echo "<span class=\"poleca\">";
	echo "<br>";
	echo "<a href = \"".$_SERVER['PHP_SELF']."?action=sprzedazlzd&nu=$ideof\">";
	echo "Premises - Sale";
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

$tekst1 = "<a href = \"".$_SERVER['PHP_SELF']."?action=sprzedazozd&nu=$ideof\">wiêcej ...</a>";

echo "<tr align=\"left\"><td colspan = \"20\" height=\"2\">";
echo "</td></tr>";

echo "<tr valign = \"top\">";

if ($zdj1 != 0) {
	echo "<td width=\"125\" height=\"100\" align = \"left\">";
	echo "<center>";
	echo "<a href = \"".$_SERVER['PHP_SELF']."?action=sprzedazozd&nu=$ideof\">";
	echo "<img src=\"../img/zd$zdj1.jpg\" width=\"120\" height=\"90\" border=\"0\" alt=\"Zdjêcie nr$zdj1\"></img></a>";
	echo "<center>";
	echo "<span class=\"poleca\">";
	echo "<a href = \"".$_SERVER['PHP_SELF']."?action=sprzedazozd&nu=$ideof\">";
	echo "Object - Sale";
	echo "</a>";
	echo "</span>";
	echo "</center>";
	echo "</td>";
}
else {
	echo "<td width=\"125\" height=\"100\" align = \"left\">";
	echo "<center>";
	echo "<a href = \"".$_SERVER['PHP_SELF']."?action=sprzedazozd&nu=$ideof\">";
	echo "<img src=\"../img/zd0.jpg\" width=\"120\" height=\"90\" alt=\"Brak zdjêcia\"></img></a>";
	echo "</center>";
	echo "<center>";
	echo "<span class=\"poleca\">";
	echo "<br>";
	echo "<a href = \"".$_SERVER['PHP_SELF']."?action=sprzedazozd&nu=$ideof\">";
	echo "Object - Sale";
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

$tekst1 = "<a href = \"".$_SERVER['PHP_SELF']."?action=sprzedazdzzd&nu=$ideof\">wiêcej ...</a>";

echo "<tr align=\"left\"><td colspan = \"20\" height=\"2\">";
echo "</td></tr>";

echo "<tr valign = \"top\">";

if ($zdj1 != 0) {
	echo "<td width=\"125\" height=\"100\" align = \"left\">";
	echo "<center>";
	echo "<a href = \"".$_SERVER['PHP_SELF']."?action=sprzedazdzzd&nu=$ideof\">";
	echo "<img src=\"../img/zd$zdj1.jpg\" width=\"120\" height=\"90\" border=\"0\" alt=\"Zdjêcie nr$zdj1\"></img></a>";
	echo "<center>";
	echo "<span class=\"poleca\">";
	echo "<a href = \"".$_SERVER['PHP_SELF']."?action=sprzedazdzzd&nu=$ideof\">";
	echo "Plot - Sale";
	echo "</a>";
	echo "</span>";
	echo "</center>";
	echo "</td>";
}
else {
	echo "<td width=\"125\" height=\"100\" align = \"left\">";
	echo "<center>";
	echo "<a href = \"".$_SERVER['PHP_SELF']."?action=sprzedazdzzd&nu=$ideof\">";
	echo "<img src=\"../img/zd0.jpg\" width=\"120\" height=\"90\" alt=\"Brak zdjêcia\"></img></a>";
	echo "</center>";
	echo "<center>";
	echo "<span class=\"poleca\">";
	echo "<br>";
	echo "<a href = \"".$_SERVER['PHP_SELF']."?action=sprzedazdzzd&nu=$ideof\">";
	echo "Plot - Sale";
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

$tekst1 = "<a href = \"".$_SERVER['PHP_SELF']."?action=sprzedaztezd&nu=$ideof\">wiêcej ...</a>";

echo "<tr align=\"left\"><td colspan = \"20\" height=\"2\">";
echo "</td></tr>";

echo "<tr valign = \"top\">";

if ($zdj1 != 0) {
	echo "<td width=\"125\" height=\"100\" align = \"left\">";
	echo "<center>";
	echo "<a href = \"".$_SERVER['PHP_SELF']."?action=sprzedaztezd&nu=$ideof\">";
	echo "<img src=\"../img/zd$zdj1.jpg\" width=\"120\" height=\"90\" border=\"0\" alt=\"Zdjêcie nr$zdj1\"></img></a>";
	echo "<center>";
	echo "<span class=\"poleca\">";
	echo "<a href = \"".$_SERVER['PHP_SELF']."?action=sprzedaztezd&nu=$ideof\">";
	echo "Area - Sale";
	echo "</a>";
	echo "</span>";
	echo "</center>";
	echo "</td>";
}
else {
	echo "<td width=\"125\" height=\"100\" align = \"left\">";
	echo "<center>";
	echo "<a href = \"".$_SERVER['PHP_SELF']."?action=sprzedaztezd&nu=$ideof\">";
	echo "<img src=\"../img/zd0.jpg\" width=\"120\" height=\"90\" alt=\"Brak zdjêcia\"></img></a>";
	echo "</center>";
	echo "<center>";
	echo "<span class=\"poleca\">";
	echo "<br>";
	echo "<a href = \"".$_SERVER['PHP_SELF']."?action=sprzedaztezd&nu=$ideof\">";
	echo "Area - Sale";
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

$tekst1 = "<a href = \"".$_SERVER['PHP_SELF']."?action=wynajemmzd&nu=$ideof\">wiêcej ...</a>";

echo "<tr align=\"left\"><td colspan = \"20\" height=\"2\">";
echo "</td></tr>";

echo "<tr valign = \"top\">";

if ($zdj1 != 0) {
	echo "<td width=\"125\" height=\"100\" align = \"left\">";
	echo "<center>";
	echo "<a href = \"".$_SERVER['PHP_SELF']."?action=wynajemmzd&nu=$ideof\">";
	echo "<img src=\"../img/zd$zdj1.jpg\" width=\"120\" height=\"90\" border=\"0\" alt=\"Zdjêcie nr$zdj1\"></img></a>";
	echo "<center>";
	echo "<span class=\"poleca\">";
	echo "<a href = \"".$_SERVER['PHP_SELF']."?action=wynajemmzd&nu=$ideof\">";
	echo "Flat - Rent";
	echo "</a>";
	echo "</span>";
	echo "</center>";
	echo "</td>";
}
else {
	echo "<td width=\"125\" height=\"100\" align = \"left\">";
	echo "<center>";
	echo "<a href = \"".$_SERVER['PHP_SELF']."?action=wynajemmzd&nu=$ideof\">";
	echo "<img src=\"../img/zd0.jpg\" width=\"120\" height=\"90\" alt=\"Brak zdjêcia\"></img></a>";
	echo "</center>";
	echo "<center>";
	echo "<span class=\"poleca\">";
	echo "<br>";
	echo "<a href = \"".$_SERVER['PHP_SELF']."?action=wynajemmzd&nu=$ideof\">";
	echo "Flat - Rent";
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

$tekst1 = "<a href = \"".$_SERVER['PHP_SELF']."?action=wynajemdzd&nu=$ideof\">wiêcej ...</a>";

echo "<tr align=\"left\"><td colspan = \"20\" height=\"2\">";
echo "</td></tr>";

echo "<tr valign = \"top\">";

if ($zdj1 != 0) {
	echo "<td width=\"125\" height=\"100\" align = \"left\">";
	echo "<center>";
	echo "<a href = \"".$_SERVER['PHP_SELF']."?action=wynajemdzd&nu=$ideof\">";
	echo "<img src=\"../img/zd$zdj1.jpg\" width=\"120\" height=\"90\" border=\"0\" alt=\"Zdjêcie nr$zdj1\"></img></a>";
	echo "<center>";
	echo "<span class=\"poleca\">";
	echo "<a href = \"".$_SERVER['PHP_SELF']."?action=wynajemdzd&nu=$ideof\">";
	echo "House - Rent";
	echo "</a>";
	echo "</span>";
	echo "</center>";
	echo "</td>";
}
else {
	echo "<td width=\"125\" height=\"100\" align = \"left\">";
	echo "<center>";
	echo "<a href = \"".$_SERVER['PHP_SELF']."?action=wynajemdzd&nu=$ideof\">";
	echo "<img src=\"../img/zd0.jpg\" width=\"120\" height=\"90\" alt=\"Brak zdjêcia\"></img></a>";
	echo "</center>";
	echo "<center>";
	echo "<span class=\"poleca\">";
	echo "<br>";
	echo "<a href = \"".$_SERVER['PHP_SELF']."?action=wynajemdzd&nu=$ideof\">";
	echo "House - Rent";
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

$tekst1 = "<a href = \"".$_SERVER['PHP_SELF']."?action=wynajemlzd&nu=$ideof\">wiêcej ...</a>";

echo "<tr align=\"left\"><td colspan = \"20\" height=\"2\">";
echo "</td></tr>";

echo "<tr valign = \"top\">";

if ($zdj1 != 0) {
	echo "<td width=\"125\" height=\"100\" align = \"left\">";
	echo "<center>";
	echo "<a href = \"".$_SERVER['PHP_SELF']."?action=wynajemlzd&nu=$ideof\">";
	echo "<img src=\"../img/zd$zdj1.jpg\" width=\"120\" height=\"90\" border=\"0\" alt=\"Zdjêcie nr$zdj1\"></img></a>";
	echo "<center>";
	echo "<span class=\"poleca\">";
	echo "<a href = \"".$_SERVER['PHP_SELF']."?action=wynajemlzd&nu=$ideof\">";
	echo "Premises - Rent";
	echo "</a>";
	echo "</span>";
	echo "</center>";
	echo "</td>";
}
else {
	echo "<td width=\"125\" height=\"100\" align = \"left\">";
	echo "<center>";
	echo "<a href = \"".$_SERVER['PHP_SELF']."?action=wynajemlzd&nu=$ideof\">";
	echo "<img src=\"../img/zd0.jpg\" width=\"120\" height=\"90\" alt=\"Brak zdjêcia\"></img></a>";
	echo "</center>";
	echo "<center>";
	echo "<span class=\"poleca\">";
	echo "<br>";
	echo "<a href = \"".$_SERVER['PHP_SELF']."?action=wynajemlzd&nu=$ideof\">";
	echo "Premises - Rent";
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

$tekst1 = "<a href = \"".$_SERVER['PHP_SELF']."?action=wynajemozd&nu=$ideof\">wiêcej ...</a>";

echo "<tr align=\"left\"><td colspan = \"20\" height=\"2\">";
echo "</td></tr>";

echo "<tr valign = \"top\">";

if ($zdj1 != 0) {
	echo "<td width=\"125\" height=\"100\" align = \"left\">";
	echo "<center>";
	echo "<a href = \"".$_SERVER['PHP_SELF']."?action=wynajemozd&nu=$ideof\">";
	echo "<img src=\"../img/zd$zdj1.jpg\" width=\"120\" height=\"90\" border=\"0\" alt=\"Zdjêcie nr$zdj1\"></img></a>";
	echo "<center>";
	echo "<span class=\"poleca\">";
	echo "<a href = \"".$_SERVER['PHP_SELF']."?action=wynajemozd&nu=$ideof\">";
	echo "Object - Rent";
	echo "</a>";
	echo "</span>";
	echo "</center>";
	echo "</td>";
}
else {
	echo "<td width=\"125\" height=\"100\" align = \"left\">";
	echo "<center>";
	echo "<a href = \"".$_SERVER['PHP_SELF']."?action=wynajemozd&nu=$ideof\">";
	echo "<img src=\"../img/zd0.jpg\" width=\"120\" height=\"90\" alt=\"Brak zdjêcia\"></img></a>";
	echo "</center>";
	echo "<center>";
	echo "<span class=\"poleca\">";
	echo "<br>";
	echo "<a href = \"".$_SERVER['PHP_SELF']."?action=wynajemozd&nu=$ideof\">";
	echo "Object - Rent";
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

$tekst1 = "<a href = \"".$_SERVER['PHP_SELF']."?action=wynajemdzzd&nu=$ideof\">wiêcej ...</a>";

echo "<tr align=\"left\"><td colspan = \"20\" height=\"2\">";
echo "</td></tr>";

echo "<tr valign = \"top\">";

if ($zdj1 != 0) {
	echo "<td width=\"125\" height=\"100\" align = \"left\">";
	echo "<center>";
	echo "<a href = \"".$_SERVER['PHP_SELF']."?action=wynajemdzzd&nu=$ideof\">";
	echo "<img src=\"../img/zd$zdj1.jpg\" width=\"120\" height=\"90\" border=\"0\" alt=\"Zdjêcie nr$zdj1\"></img></a>";
	echo "<center>";
	echo "<span class=\"poleca\">";
	echo "<a href = \"".$_SERVER['PHP_SELF']."?action=wynajemdzzd&nu=$ideof\">";
	echo "Plot - Rent";
	echo "</a>";
	echo "</span>";
	echo "</center>";
	echo "</td>";
}
else {
	echo "<td width=\"125\" height=\"100\" align = \"left\">";
	echo "<center>";
	echo "<a href = \"".$_SERVER['PHP_SELF']."?action=wynajemdzzd&nu=$ideof\">";
	echo "<img src=\"../img/zd0.jpg\" width=\"120\" height=\"90\" alt=\"Brak zdjêcia\"></img></a>";
	echo "</center>";
	echo "<center>";
	echo "<span class=\"poleca\">";
	echo "<br>";
	echo "<a href = \"".$_SERVER['PHP_SELF']."?action=wynajemdzzd&nu=$ideof\">";
	echo "Plot - Rent";
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

$tekst1 = "<a href = \"".$_SERVER['PHP_SELF']."?action=wynajemtezd&nu=$ideof\">wiêcej ...</a>";


echo "<tr align=\"left\"><td colspan = \"20\" height=\"2\">";
echo "</td></tr>";

echo "<tr valign = \"top\">";

if ($zdj1 != 0) {
	echo "<td width=\"125\" height=\"100\" align = \"left\">";
	echo "<center>";
	echo "<a href = \"".$_SERVER['PHP_SELF']."?action=wynajemtezd&nu=$ideof\">";
	echo "<img src=\"../img/zd$zdj1.jpg\" width=\"120\" height=\"90\" border=\"0\" alt=\"Zdjêcie nr$zdj1\"></img></a>";
	echo "<center>";
	echo "<span class=\"poleca\">";
	echo "<a href = \"".$_SERVER['PHP_SELF']."?action=wynajemtezd&nu=$ideof\">";
	echo "Area - Rent";
	echo "</a>";
	echo "</span>";
	echo "</center>";
	echo "</td>";
}
else {
	echo "<td width=\"125\" height=\"100\" align = \"left\">";
	echo "<center>";
	echo "<a href = \"".$_SERVER['PHP_SELF']."?action=wynajemtezd&nu=$ideof\">";
	echo "<img src=\"../img/zd0.jpg\" width=\"120\" height=\"90\" alt=\"Brak zdjêcia\"></img></a>";
	echo "</center>";
	echo "<center>";
	echo "<span class=\"poleca\">";
	echo "<br>";
	echo "<a href = \"".$_SERVER['PHP_SELF']."?action=wynajemtezd&nu=$ideof\">";
	echo "Area - Rent";
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