<?
$identbiura = "1";
$ok = "_b";
// polaczenie z baza
$conn = pg_connect ("host=10.1.0.223 user=azg password=grrrBONNN23 dbname=nierazg");
if (!conn){
	echo "Przykro nam w tej chwili baza ofert jest chwilowo nieczynna.\n";
	exit;
}	

if ($action == '') {
$action = 'wynajemm';
}

if ($action == 'wynajemm') {

$sql0 = "select id_m from tab_mie_w where loka = '1' and pokaz = 't' and usunm = 'f' and id_b = '$identbiura' order by datawp_m desc;";

$result_set0 = pg_Exec($conn, $sql0);

$rows0 = pg_NumRows($result_set0);		// liczba zwroconych wierszy

if ((!$result_set0) || ($rows0 > 0)) { 

echo "<center>";
echo "<span class=\"nag2b\">";
echo "<b>WYNAJEM MIESZKAÑ</b>";
echo "<br>";
echo "<b>(OPOLE)</b>";
echo "</span>";
echo "</center>";
}

$sql1 = "select id_m, no_m,  lok_m, powuzyt_m, cm_m, cm_m2, zd1, wyl_m, sm_m, std from tab_mie_w where lp_m = '1' and loka = '1' and pokaz = 't' and usunm = 'f' and id_b = '$identbiura' order by datawp_m desc;";

$result_set1 = pg_Exec($conn, $sql1);

$rows1 = pg_NumRows($result_set1);		// liczba zwroconych wierszy

if ((!$result_set1) || ($rows1 > 0)) { 

echo "<br>";
echo "<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" frame border=\"0\">";
echo "<tr><td><img src=\"img/black.gif\" width=\"100%\" height=\"1\" border=\"0\" alt=\"\"></img></td></tr>";
echo "<tr valign=\"left\"><td height=\"7\" bgcolor=\"#5865E5\">";
echo "<center>";
echo "<span class=\"nag1wb\">";
echo "1 pokojowe";
echo "</span>";
echo "</center>";
echo "</td></tr>";
echo "<tr><td><img src=\"img/black.gif\" width=\"100%\" height=\"1\" border=\"0\" alt=\"\"></img></td></tr>";
echo "</table>";


echo "<table width=\"516\" cellpadding=\"0\" cellspacing=\"0\" frame border=\"0\">";
	for ($i=0; $i < $rows1; $i++) {

		$id1 = pg_result($result_set1, $i, "id_m");
		$nod1 = pg_result($result_set1, $i, "no_m");
		$lok1 = pg_result($result_set1, $i, "lok_m");
		$powuzyt1 = pg_result($result_set1, $i, "powuzyt_m");
		$cena1 = pg_result($result_set1, $i, "cm_m");
		$dod1 = pg_result($result_set1, $i, "cm_m2");
		$zdj1 = pg_result($result_set1, $i, "zd1");
		$wylacznosc1 = pg_result($result_set1, $i, "wyl_m");
		$status1 = pg_result($result_set1, $i, "sm_m");
		$std1 = pg_result($result_set1, $i, "std");
		$sqlstands = "SELECT nazwa_stan FROM standard where id = '$std1';";
			
			$resultstands = @pg_Exec($conn, $sqlstands);
			$stad1 = pg_result($resultstands, 0, "nazwa_stan");

if ($status1 == "2") {
$stat1 = "<span class=\"zawna\">OFERTA ZAWIESZONA</span>";
$wpstatp1 = "<span class=\"zawo\">";
$wpstatk1 = "</span>";
}
else {
$stat1 ="";
$wpstatp1 = "";
$wpstatk1 = "";
}

if ($wylacznosc1 == "2") {
$wyl1 = "<span class=\"wyl\">WY£¡CZNO¦Æ</span>";
}
else {
$wyl1 = "";
}

$tekst1 = "<a href = \"$PHP_SELF?action=wynajemmzd&nu=$id1\">wiêcej ...</a>";

echo "<tr>";

if ($zdj1 != 0) {
	echo "<td width=\"126\" height=\"63\" rowspan = \"5\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=wynajemmzd&nu=$id1\">";
	echo "<img src=\"../img/zd$zdj1.jpg\" width=\"90\" height=\"60\" border=\"0\" class=\"ira\" alt=\"Zdjêcie nr$zdj1\"></img></a><br>";
	echo "</center>";
	echo "</td>";
}
else {
	echo "<td width=\"126\" height=\"63\" rowspan = \"5\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=wynajemmzd&nu=$id1\">";
	echo "<img src=\"../img/zd0.jpg\" width=\"90\" height=\"60\" alt=\"Brak zdjêcia\" class=\"ira\"></img></a><br>";
	echo "</center>";
	echo "</td>";
}

echo "<td align = \"left\">";

echo "<tr>";

echo "<td width=\"130\" align = \"left\">$wpstatp1";
echo "<b>Numer Oferty:</b> $nod1";
echo "$wpstatk1</td>";

echo "<td width=\"260\" align = \"left\" colspan = \"2\">$wpstatp1";
echo "<b>Lokalizacja:</b> $lok1";
echo "$wpstatk1</td>";

echo "</tr>";

echo "<tr>";

echo "<td width=\"130\" align = \"left\">$wpstatp1";
echo "<b>Pow.u¿ytk.:</b> $powuzyt1 m2";
echo "$wpstatk1</td>";

echo "<td width=\"130\" align = \"left\">$wpstatp1";
echo "<b>Standard:</b> $stad1";
echo "$wpstatk1</td>";

$cena1 = number_format($cena1,'', '.', '.');

echo "<td width=\"130\" align = \"left\">$wpstatp1";
echo "<b>Cena:</b> $cena1 z³.";
echo "$wpstatk1</td>";

echo "</tr>";

echo "<tr>";
echo "<td align = \"left\" colspan = \"3\">";
echo "$wpstatp1";
echo "&nbsp;Dodatkowe op³aty: $dod1";
echo "$wpstatk1";
echo "</td>";
echo "</tr>";

echo "<tr>";

echo "<td width=\"130\" align = \"left\">";
echo "$stat1";
echo "</td>";

echo "<td width=\"130\" align = \"left\">";
echo "$wyl1";
echo "</td>";

echo "<td width=\"130\" align = \"left\">";
echo "$tekst1";
echo "</td>";

echo "</tr>";

echo "</td>";

echo "</tr>";

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}
echo "</table>";
}


$sql2 = "select id_m, no_m,  lok_m, powuzyt_m, cm_m, cm_m2, zd1, wyl_m, sm_m, std from tab_mie_w where lp_m = '2' and loka = '1' and pokaz = 't' and usunm = 'f' and id_b = '$identbiura' order by datawp_m desc;";

$result_set2 = pg_Exec($conn, $sql2);

$rows2 = pg_NumRows($result_set2);		// liczba zwroconych wierszy

if ((!$result_set2) || ($rows2 > 0)) { 

echo "<br>";
echo "<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" frame border=\"0\">";
echo "<tr><td><img src=\"img/black.gif\" width=\"100%\" height=\"1\" border=\"0\" alt=\"\"></img></td></tr>";
echo "<tr valign=\"left\"><td height=\"7\" bgcolor=\"#5865E5\">";
echo "<center>";
echo "<span class=\"nag1wb\">";
echo "2 pokojowe";
echo "</span>";
echo "</center>";
echo "</td></tr>";
echo "<tr><td><img src=\"img/black.gif\" width=\"100%\" height=\"1\" border=\"0\" alt=\"\"></img></td></tr>";
echo "</table>";


echo "<table width=\"516\" cellpadding=\"0\" cellspacing=\"0\" frame border=\"0\">";
	for ($i=0; $i < $rows2; $i++) {

		$id2 = pg_result($result_set2, $i, "id_m");
		$nod2 = pg_result($result_set2, $i, "no_m");
		$lok2 = pg_result($result_set2, $i, "lok_m");
		$powuzyt2 = pg_result($result_set2, $i, "powuzyt_m");
		$np2 = pg_result($result_set2, $i, "np_m");
		$cena2 = pg_result($result_set2, $i, "cm_m");
		$dod2 = pg_result($result_set2, $i, "cm_m2");
		$zdj2 = pg_result($result_set2, $i, "zd1");
		$wylacznosc2 = pg_result($result_set2, $i, "wyl_m");
		$status2 = pg_result($result_set2, $i, "sm_m");
		$std2 = pg_result($result_set2, $i, "std");
		$sqlstands2 = "SELECT nazwa_stan FROM standard where id = '$std2';";
			
			$resultstands2 = @pg_Exec($conn, $sqlstands2);
			$stad2 = pg_result($resultstands2, 0, "nazwa_stan");

if ($status2 == "2") {
$stat2 = "<span class=\"zawna\">OFERTA ZAWIESZONA</span>";
$wpstatp2 = "<span class=\"zawo\">";
$wpstatk2 = "</span>";
}
else {
$stat2 ="";
$wpstatp2 = "";
$wpstatk2 = "";
}

if ($wylacznosc2 == "2") {
$wyl2 = "<span class=\"wyl\">WY£¡CZNO¦Æ</span>";
}
else {
$wyl2 = "";
}

$tekst2 = "<a href = \"$PHP_SELF?action=wynajemmzd&nu=$id2\">wiêcej ...</a>";

echo "<tr>";
if ($zdj2 != 0) {
	echo "<td width=\"126\" height=\"63\" rowspan = \"5\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=wynajemmzd&nu=$id2\">";
	echo "<img src=\"../img/zd$zdj2.jpg\" width=\"90\" height=\"60\" border=\"0\" class=\"ira\" alt=\"Zdjêcie nr$zdj2\"></img></a><br>";
	echo "</center>";
	echo "</td>";
}
else {
	echo "<td width=\"126\" height=\"63\" rowspan = \"5\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=wynajemmzd&nu=$id2\">";
	echo "<img src=\"../img/zd0.jpg\" width=\"90\" height=\"60\" alt=\"Brak zdjêcia\" class=\"ira\"></img></a><br>";
	echo "</center>";
	echo "</td>";
}

echo "<td align = \"left\">";

echo "<tr>";

echo "<td width=\"130\" align = \"left\">$wpstatp2";
echo "<b>Numer Oferty:</b> $nod2";
echo "$wpstatk2</td>";

echo "<td width=\"260\" align = \"left\" colspan = \"2\">$wpstatp2";
echo "<b>Lokalizacja:</b> $lok2";
echo "$wpstatk2</td>";

echo "</tr>";

echo "<tr>";

echo "<td width=\"130\" align = \"left\">$wpstatp2";
echo "<b>Pow.u¿ytk.:</b> $powuzyt2 m2";
echo "$wpstatk2</td>";

echo "<td width=\"130\" align = \"left\">$wpstatp2";
echo "<b>Standard:</b> $stad2";
echo "$wpstatk2</td>";

$cena2 = number_format($cena2,'', '.', '.');

echo "<td width=\"130\" align = \"left\">$wpstatp2";
echo "<b>Cena:</b> $cena2 z³.";
echo "$wpstatk2</td>";

echo "</tr>";

echo "<tr>";
echo "<td align = \"left\" colspan = \"3\">";
echo "$wpstatp2";
echo "&nbsp;Dodatkowe op³aty: $dod2";
echo "$wpstatk2";
echo "</td>";
echo "</tr>";

echo "<tr>";

echo "<td width=\"130\" align = \"left\">";
echo "$stat2";
echo "</td>";

echo "<td width=\"130\" align = \"left\">";
echo "$wyl2";
echo "</td>";

echo "<td width=\"130\" align = \"left\">";
echo "$tekst2";
echo "</td>";

echo "</tr>";

echo "</td>";

echo "</tr>";

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}
echo "</table>";
}

$sql3 = "select id_m, no_m,  lok_m, powuzyt_m, cm_m, cm_m2, zd1, wyl_m, sm_m, std from tab_mie_w where lp_m = '3' and loka = '1' and pokaz = 't' and usunm = 'f' and id_b = '$identbiura' order by datawp_m desc;";

$result_set3 = pg_Exec($conn, $sql3);

$rows3 = pg_NumRows($result_set3);		// liczba zwroconych wierszy

if ((!$result_set3) || ($rows3 > 0)) { 

echo "<br>";
echo "<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" frame border=\"0\">";
echo "<tr><td><img src=\"img/black.gif\" width=\"100%\" height=\"1\" border=\"0\" alt=\"\"></img></td></tr>";
echo "<tr valign=\"left\"><td height=\"7\" bgcolor=\"#5865E5\">";
echo "<center>";
echo "<span class=\"nag1wb\">";
echo "3 pokojowe";
echo "</span>";
echo "</center>";
echo "</td></tr>";
echo "<tr><td><img src=\"img/black.gif\" width=\"100%\" height=\"1\" border=\"0\" alt=\"\"></img></td></tr>";
echo "</table>";


echo "<table width=\"516\" cellpadding=\"0\" cellspacing=\"0\" frame border=\"0\">";
	for ($i=0; $i < $rows3; $i++) {

		$id3 = pg_result($result_set3, $i, "id_m");
		$nod3 = pg_result($result_set3, $i, "no_m");
		$lok3 = pg_result($result_set3, $i, "lok_m");
		$powuzyt3 = pg_result($result_set3, $i, "powuzyt_m");
		$cena3 = pg_result($result_set3, $i, "cm_m");
		$dod3 = pg_result($result_set3, $i, "cm_m2");
		$zdj3 = pg_result($result_set3, $i, "zd1");
		$wylacznosc3 = pg_result($result_set3, $i, "wyl_m");
		$status3 = pg_result($result_set3, $i, "sm_m");
		$std3 = pg_result($result_set3, $i, "std");
		$sqlstands3 = "SELECT nazwa_stan FROM standard where id = '$std3';";
			
			$resultstands3 = @pg_Exec($conn, $sqlstands3);
			$stad3 = pg_result($resultstands3, 0, "nazwa_stan");

if ($status3 == "2") {
$stat3 = "<span class=\"zawna\">OFERTA ZAWIESZONA</span>";
$wpstatp3 = "<span class=\"zawo\">";
$wpstatk3 = "</span>";
}
else {
$stat3 ="";
$wpstatp3 = "";
$wpstatk3 = "";
}

if ($wylacznosc3 == "2") {
$wyl3 = "<span class=\"wyl\">WY£¡CZNO¦Æ</span>";
}
else {
$wyl3 = "";
}

$tekst3 = "<a href = \"$PHP_SELF?action=wynajemmzd&nu=$id3\">wiêcej ...</a>";

echo "<tr>";
if ($zdj3 != 0) {
	echo "<td width=\"126\" height=\"63\" rowspan = \"5\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=wynajemmzd&nu=$id3\">";
	echo "<img src=\"../img/zd$zdj3.jpg\" width=\"90\" height=\"60\" border=\"0\" class=\"ira\" alt=\"Zdjêcie nr$zdj3\"></img></a><br>";
	echo "</center>";
	echo "</td>";
}
else {
	echo "<td width=\"126\" height=\"63\" rowspan = \"5\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=wynajemmzd&nu=$id3\">";
	echo "<img src=\"../img/zd0.jpg\" width=\"90\" height=\"60\" alt=\"Brak zdjêcia\" class=\"ira\"></img></a><br>";
	echo "</center>";
	echo "</td>";
}

echo "<td align = \"left\">";

echo "<tr>";

echo "<td width=\"130\" align = \"left\">$wpstatp3";
echo "<b>Numer Oferty:</b> $nod3";
echo "$wpstatk3</td>";

echo "<td width=\"260\" align = \"left\" colspan = \"2\">$wpstatp3";
echo "<b>Lokalizacja:</b> $lok3";
echo "$wpstatk3</td>";

echo "</tr>";

echo "<tr>";

echo "<td width=\"130\" align = \"left\">$wpstatp3";
echo "<b>Pow.u¿ytk.:</b> $powuzyt3 m2";
echo "$wpstatk3</td>";

echo "<td width=\"130\" align = \"left\">$wpstatp3";
echo "<b>Standard:</b> $stad3";
echo "$wpstatk3</td>";

$cena3 = number_format($cena3,'', '.', '.');

echo "<td width=\"130\" align = \"left\">$wpstatp3";
echo "<b>Cena:</b> $cena3 z³.";
echo "$wpstatk3</td>";

echo "</tr>";

echo "<tr>";
echo "<td align = \"left\" colspan = \"3\">";
echo "$wpstatp3";
echo "&nbsp;Dodatkowe op³aty: $dod3";
echo "$wpstatk3";
echo "</td>";
echo "</tr>";

echo "<tr>";

echo "<td width=\"130\" align = \"left\">";
echo "$stat3";
echo "</td>";

echo "<td width=\"130\" align = \"left\">";
echo "$wyl3";
echo "</td>";

echo "<td width=\"130\" align = \"left\">";
echo "$tekst3";
echo "</td>";

echo "</tr>";

echo "</td>";

echo "</tr>";

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}
echo "</table>";
}

$sql4 = "select id_m, no_m,  lok_m, powuzyt_m, np_m, cm_m2, cm_m, zd1, wyl_m, sm_m, std from tab_mie_w where lp_m = '4' and loka = '1' and pokaz = 't' and usunm = 'f' and id_b = '$identbiura' order by datawp_m desc;";

$result_set4 = pg_Exec($conn, $sql4);

$rows4 = pg_NumRows($result_set4);		// liczba zwroconych wierszy

if ((!$result_set4) || ($rows4 > 0)) { 

echo "<br>";
echo "<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" frame border=\"0\">";
echo "<tr><td><img src=\"img/black.gif\" width=\"100%\" height=\"1\" border=\"0\" alt=\"\"></img></td></tr>";
echo "<tr valign=\"left\"><td height=\"7\" bgcolor=\"#5865E5\">";
echo "<center>";
echo "<span class=\"nag1wb\">";
echo "4 pokojowe";
echo "</span>";
echo "</center>";
echo "</td></tr>";
echo "<tr><td><img src=\"img/black.gif\" width=\"100%\" height=\"1\" border=\"0\" alt=\"\"></img></td></tr>";
echo "</table>";


echo "<table width=\"516\" cellpadding=\"0\" cellspacing=\"0\" frame border=\"0\">";
	for ($i=0; $i < $rows4; $i++) {

		$id4 = pg_result($result_set4, $i, "id_m");
		$nod4 = pg_result($result_set4, $i, "no_m");
		$lok4 = pg_result($result_set4, $i, "lok_m");
		$powuzyt4 = pg_result($result_set4, $i, "powuzyt_m");
		$cena4 = pg_result($result_set4, $i, "cm_m");
		$dod4 = pg_result($result_set4, $i, "cm_m2");
		$zdj4 = pg_result($result_set4, $i, "zd1");
		$wylacznosc4 = pg_result($result_set4, $i, "wyl_m");
		$status4 = pg_result($result_set4, $i, "sm_m");
		$std4 = pg_result($result_set4, $i, "std");
		$sqlstands4 = "SELECT nazwa_stan FROM standard where id = '$std4';";
			
			$resultstands4 = @pg_Exec($conn, $sqlstands4);
			$stad4 = pg_result($resultstands4, 0, "nazwa_stan");

if ($status4 == "2") {
$stat4 = "<span class=\"zawna\">OFERTA ZAWIESZONA</span>";
$wpstatp4 = "<span class=\"zawo\">";
$wpstatk4 = "</span>";
}
else {
$stat4 ="";
$wpstatp4 = "";
$wpstatk4 = "";
}

if ($wylacznosc4 == "2") {
$wyl4 = "<span class=\"wyl\">WY£¡CZNO¦Æ</span>";
}
else {
$wyl4 = "";
}

$tekst4 = "<a href = \"$PHP_SELF?action=wynajemmzd&nu=$id4\">wiêcej ...</a>";

echo "<tr>";

if ($zdj4 != 0) {
	echo "<td width=\"126\" height=\"63\" rowspan = \"5\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=wynajemmzd&nu=$id4\">";
	echo "<img src=\"../img/zd$zdj4.jpg\" width=\"90\" height=\"60\" border=\"0\" class=\"ira\" alt=\"Zdjêcie nr$zdj4\"></img></a><br>";
	echo "</center>";
	echo "</td>";
}
else {
	echo "<td width=\"126\" height=\"63\" rowspan = \"5\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=wynajemmzd&nu=$id4\">";
	echo "<img src=\"../img/zd0.jpg\" width=\"90\" height=\"60\" alt=\"Brak zdjêcia\" class=\"ira\"></img></a><br>";
	echo "</center>";
	echo "</td>";
}

echo "<td align = \"left\">";

echo "<tr>";

echo "<td width=\"130\" align = \"left\">$wpstatp4";
echo "<b>Numer Oferty:</b> $nod4";
echo "$wpstatk4</td>";

echo "<td width=\"260\" align = \"left\" colspan = \"2\">$wpstatp4";
echo "<b>Lokalizacja:</b> $lok4";
echo "$wpstatk4</td>";

echo "</tr>";

echo "<tr>";

echo "<td width=\"130\" align = \"left\">$wpstatp4";
echo "<b>Pow.u¿ytk.:</b> $powuzyt4 m2";
echo "$wpstatk4</td>";

echo "<td width=\"130\" align = \"left\">$wpstatp4";
echo "<b>Standard:</b> $stad4";
echo "$wpstatk4</td>";

$cena4 = number_format($cena4,'', '.', '.');

echo "<td width=\"130\" align = \"left\">$wpstatp4";
echo "<b>Cena:</b> $cena4 z³.";
echo "$wpstatk4</td>";

echo "</tr>";

echo "<tr>";
echo "<td align = \"left\" colspan = \"3\">";
echo "$wpstatp4";
echo "&nbsp;Dodatkowe op³aty: $dod4";
echo "$wpstatk4";
echo "</td>";
echo "</tr>";

echo "<tr>";

echo "<td width=\"130\" align = \"left\">";
echo "$stat4";
echo "</td>";

echo "<td width=\"130\" align = \"left\">";
echo "$wyl4";
echo "</td>";

echo "<td width=\"130\" align = \"left\">";
echo "$tekst4";
echo "</td>";

echo "</tr>";

echo "</td>";

echo "</tr>";



echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}
echo "</table>";
}

$sql5 = "select id_m, no_m, lok_m, powuzyt_m, np_m, cm_m2, cm_m, zd1, wyl_m, sm_m, std from tab_mie_w where lp_m = '5' and loka = '1' and pokaz = 't' and usunm = 'f' and  id_b = '$identbiura' order by datawp_m desc;";

$result_set5 = pg_Exec($conn, $sql5);

$rows5 = pg_NumRows($result_set5);		// liczba zwroconych wierszy

if ((!$result_set5) || ($rows5 > 0)) { 

echo "<br>";
echo "<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" frame border=\"0\">";
echo "<tr><td><img src=\"img/black.gif\" width=\"100%\" height=\"1\" border=\"0\" alt=\"\"></img></td></tr>";
echo "<tr valign=\"left\"><td height=\"7\" bgcolor=\"#5865E5\">";
echo "<center>";
echo "<span class=\"nag1wb\">";
echo "5 pokojowe";
echo "</span>";
echo "</center>";
echo "</td></tr>";
echo "<tr><td><img src=\"img/black.gif\" width=\"100%\" height=\"1\" border=\"0\" alt=\"\"></img></td></tr>";
echo "</table>";


echo "<table width=\"516\" cellpadding=\"0\" cellspacing=\"0\" frame border=\"0\">";
	for ($i=0; $i < $rows5; $i++) {

		$id5 = pg_result($result_set5, $i, "id_m");
		$nod5 = pg_result($result_set5, $i, "no_m");
		$lok5 = pg_result($result_set5, $i, "lok_m");
		$powuzyt5 = pg_result($result_set5, $i, "powuzyt_m");
		$cena5 = pg_result($result_set5, $i, "cm_m");
		$dod5 = pg_result($result_set5, $i, "cm_m2");
		$zdj5 = pg_result($result_set5, $i, "zd1");
		$wylacznosc5 = pg_result($result_set5, $i, "wyl_m");
		$status5 = pg_result($result_set5, $i, "sm_m");
		$std5 = pg_result($result_set5, $i, "std");
		$sqlstands5 = "SELECT nazwa_stan FROM standard where id = '$std5';";
			
			$resultstands5 = @pg_Exec($conn, $sqlstands5);
			$stad5 = pg_result($resultstands5, 0, "nazwa_stan");

if ($status5 == "2") {
$stat5 = "<span class=\"zawna\">OFERTA ZAWIESZONA</span>";
$wpstatp5 = "<span class=\"zawo\">";
$wpstatk5 = "</span>";
}
else {
$stat5 ="";
$wpstatp5 = "";
$wpstatk5 = "";
}

if ($wylacznosc5 == "2") {
$wyl5 = "<span class=\"wyl\">WY£¡CZNO¦Æ</span>";
}
else {
$wyl5 = "";
}

$tekst5 = "<a href = \"$PHP_SELF?action=wynajemmzd&nu=$id5\">wiêcej ...</a>";

echo "<tr>";

if ($zdj5 != 0) {
	echo "<td width=\"126\" height=\"63\" rowspan = \"5\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=wynajemmzd&nu=$id5\">";
	echo "<img src=\"../img/zd$zdj5.jpg\" width=\"90\" height=\"60\" border=\"0\" class=\"ira\" alt=\"Zdjêcie nr$zdj5\"></img></a><br>";
	echo "</center>";
	echo "</td>";
}
else {
	echo "<td width=\"126\" height=\"63\" rowspan = \"5\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=wynajemmzd&nu=$id5\">";
	echo "<img src=\"../img/zd0.jpg\" width=\"90\" height=\"60\" alt=\"Brak zdjêcia\" class=\"ira\"></img></a><br>";
	echo "</center>";
	echo "</td>";
}

echo "<td align = \"left\">";

echo "<tr>";

echo "<td width=\"130\" align = \"left\">$wpstatp5";
echo "<b>Numer Oferty:</b> $nod5";
echo "$wpstatk5</td>";

echo "<td width=\"260\" align = \"left\" colspan = \"2\">$wpstatp5";
echo "<b>Lokalizacja:</b> $lok5";
echo "$wpstatk5</td>";

echo "</tr>";

echo "<tr>";

echo "<td width=\"130\" align = \"left\">$wpstatp5";
echo "<b>Pow.u¿ytk.:</b> $powuzyt5 m2";
echo "$wpstatk5</td>";

echo "<td width=\"130\" align = \"left\">$wpstatp5";
echo "<b>Standard:</b> $stad5";
echo "$wpstatk5</td>";

$cena1 = number_format($cena1,'', '.', '.');

echo "<td width=\"130\" align = \"left\">$wpstatp5";
echo "<b>Cena:</b> $cena5 z³.";
echo "$wpstatk5</td>";

echo "</tr>";

echo "<tr>";
echo "<td align = \"left\" colspan = \"3\">";
echo "$wpstatp5";
echo "&nbsp;Dodatkowe op³aty: $dod5";
echo "$wpstatk5";
echo "</td>";
echo "</tr>";

echo "<tr>";

echo "<td width=\"130\" align = \"left\">";
echo "$stat5";
echo "</td>";

echo "<td width=\"130\" align = \"left\">";
echo "$wyl5";
echo "</td>";

echo "<td width=\"130\" align = \"left\">";
echo "$tekst5";
echo "</td>";

echo "</tr>";

echo "</td>";

echo "</tr>";

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}
echo "</table>";
}

$sql6 = "select id_m, no_m, lok_m, powuzyt_m, np_m, cm_m2, cm_m, zd1, wyl_m, sm_m, std from tab_mie_w where lp_m = '6' and loka = '1' and pokaz = 't' and usunm = 'f' and id_b = '$identbiura' order by datawp_m desc;";

$result_set6 = pg_Exec($conn, $sql6);

$rows6 = pg_NumRows($result_set6);		// liczba zwroconych wierszy

if ((!$result_set6) || ($rows6 > 0)) { 

echo "<br>";
echo "<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" frame border=\"0\">";
echo "<tr><td><img src=\"img/black.gif\" width=\"100%\" height=\"1\" border=\"0\" alt=\"\"></img></td></tr>";
echo "<tr valign=\"left\"><td height=\"7\" bgcolor=\"#5865E5\">";
echo "<center>";
echo "<span class=\"nag1wb\">";
echo "6 pokojowe";
echo "</span>";
echo "</center>";
echo "</td></tr>";
echo "<tr><td><img src=\"img/black.gif\" width=\"100%\" height=\"1\" border=\"0\" alt=\"\"></img></td></tr>";
echo "</table>";


echo "<table width=\"516\" cellpadding=\"0\" cellspacing=\"0\" frame border=\"0\">";
	for ($i=0; $i < $rows6; $i++) {

		$id6 = pg_result($result_set6, $i, "id_m");
		$nod6 = pg_result($result_set6, $i, "no_m");
		$lok6 = pg_result($result_set6, $i, "lok_m");
		$powuzyt6 = pg_result($result_set6, $i, "powuzyt_m");
		$cena6 = pg_result($result_set6, $i, "cm_m");
		$dod6 = pg_result($result_set6, $i, "cm_m2");
		$zdj6 = pg_result($result_set6, $i, "zd1");
		$wylacznosc6 = pg_result($result_set6, $i, "wyl_m");
		$status6 = pg_result($result_set6, $i, "sm_m");
		$std6 = pg_result($result_set6, $i, "std");
		$sqlstands6 = "SELECT nazwa_stan FROM standard where id = '$std6';";
			
			$resultstands6 = @pg_Exec($conn, $sqlstands6);
			$stad6 = pg_result($resultstands6, 0, "nazwa_stan");

if ($status6 == "2") {
$stat6 = "<span class=\"zawna\">OFERTA ZAWIESZONA</span>";
$wpstatp6 = "<span class=\"zawo\">";
$wpstatk6 = "</span>";
}
else {
$stat6 ="";
$wpstatp6 = "";
$wpstatk6 = "";
}

if ($wylacznosc6 == "2") {
$wyl6 = "<span class=\"wyl\">WY£¡CZNO¦Æ</span>";
}
else {
$wyl6 = "";
}
$tekst6 = "<a href = \"$PHP_SELF?action=wynajemmzd&nu=$id6\">wiêcej ...</a>";

echo "<tr>";


if ($zdj6 != 0) {
	echo "<td width=\"126\" height=\"63\" rowspan = \"5\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=wynajemmzd&nu=$id6\">";
	echo "<img src=\"../img/zd$zdj6.jpg\" width=\"90\" height=\"60\" border=\"0\" class=\"ira\" alt=\"Zdjêcie nr$zdj6\"></img></a><br>";
	echo "</center>";
	echo "</td>";
}
else {
	echo "<td width=\"126\" height=\"63\" rowspan = \"5\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=wynajemmzd&nu=$id6\">";
	echo "<img src=\"../img/zd0.jpg\" width=\"90\" height=\"60\" alt=\"Brak zdjêcia\" class=\"ira\"></img></a><br>";
	echo "</center>";
	echo "</td>";
}

echo "<td align = \"left\">";

echo "<tr>";

echo "<td width=\"130\" align = \"left\">$wpstatp6";
echo "<b>Numer Oferty:</b> $nod6";
echo "$wpstatk6</td>";

echo "<td width=\"260\" align = \"left\" colspan = \"2\">$wpstatp6";
echo "<b>Lokalizacja:</b> $lok6";
echo "$wpstatk6</td>";

echo "</tr>";

echo "<tr>";

echo "<td width=\"130\" align = \"left\">$wpstatp6";
echo "<b>Pow.u¿ytk.:</b> $powuzyt6 m2";
echo "$wpstatk6</td>";

echo "<td width=\"130\" align = \"left\">$wpstatp6";
echo "<b>Standard:</b> $stad6";
echo "$wpstatk6</td>";

$cena6 = number_format($cena6,'', '.', '.');

echo "<td width=\"130\" align = \"left\">$wpstatp6";
echo "<b>Cena:</b> $cena6 z³.";
echo "$wpstatk6</td>";

echo "</tr>";

echo "<tr>";
echo "<td align = \"left\" colspan = \"3\">";
echo "$wpstatp6";
echo "&nbsp;Dodatkowe op³aty: $dod6";
echo "$wpstatk6";
echo "</td>";
echo "</tr>";

echo "<tr>";

echo "<td width=\"130\" align = \"left\">";
echo "$stat6";
echo "</td>";

echo "<td width=\"130\" align = \"left\">";
echo "$wyl6";
echo "</td>";

echo "<td width=\"130\" align = \"left\">";
echo "$tekst6";
echo "</td>";

echo "</tr>";

echo "</td>";

echo "</tr>";

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}
echo "</table>";
}



$sql01 = "select id_m from tab_mie_w where loka = '2' and pokaz = 't' and usunm = 'f' and id_b = '$identbiura' order by datawp_m desc;";

$result_set01 = pg_Exec($conn, $sql01);

$rows01 = pg_NumRows($result_set01);		// liczba zwroconych wierszy

if ((!$result_set01) || ($rows01 > 0)) { 

echo "<center>";
echo "<span class=\"nag2b\">";
echo "<b>WYNAJEM MIESZKAÑ</b>";
echo "<br>";
echo "<b>(POZA OPOLEM)</b>";
echo "</span>";
echo "</center>";
}

$sql7 = "select id_m,  lok_m, powuzyt_m, np_m, cm_m2, cm_m, zd1, wyl_m, sm_m from tab_mie_w where lp_m = '1' and loka = '2' and pokaz = 't' and usunm = 'f' and id_b = '$identbiura' order by datawp_m desc;";

$result_set7 = pg_Exec($conn, $sql7);

$rows7 = pg_NumRows($result_set7);		// liczba zwroconych wierszy

if ((!$result_set7) || ($rows7 > 0)) { 

echo "<br>";
echo "<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" frame border=\"0\">";
echo "<tr><td><img src=\"img/black.gif\" width=\"100%\" height=\"1\" border=\"0\" alt=\"\"></img></td></tr>";
echo "<tr valign=\"left\"><td height=\"7\" bgcolor=\"#5865E5\">";
echo "<center>";
echo "<span class=\"nag1wb\">";
echo "1 pokojowe";
echo "</span>";
echo "</center>";
echo "</td></tr>";
echo "<tr><td><img src=\"img/black.gif\" width=\"100%\" height=\"1\" border=\"0\" alt=\"\"></img></td></tr>";
echo "</table>";


echo "<table width=\"516\" cellpadding=\"0\" cellspacing=\"0\" frame border=\"0\">";
	for ($i=0; $i < $rows7; $i++) {

		$id7 = pg_result($result_set7, $i, "id_m");
		$nod7 = pg_result($result_set7, $i, "no_m");
		$lok7 = pg_result($result_set7, $i, "lok_m");
		$powuzyt7 = pg_result($result_set7, $i, "powuzyt_m");
		$cena7 = pg_result($result_set7, $i, "cm_m");
		$dod7 = pg_result($result_set7, $i, "cm_m2");
		$zdj7 = pg_result($result_set7, $i, "zd1");
		$wylacznosc7 = pg_result($result_set7, $i, "wyl_m");
		$status7 = pg_result($result_set7, $i, "sm_m");
		$std7 = pg_result($result_set7, $i, "std");
		$sqlstands7 = "SELECT nazwa_stan FROM standard where id = '$std7';";
			
			$resultstands7 = @pg_Exec($conn, $sqlstands7);
			$stad7 = pg_result($resultstands7, 0, "nazwa_stan");

if ($status7 == "2") {
$stat7 = "<span class=\"zawna\">OFERTA ZAWIESZONA</span>";
$wpstatp7 = "<span class=\"zawo\">";
$wpstatk7 = "</span>";
}
else {
$stat7 ="";
$wpstatp7 = "";
$wpstatk7 = "";
}

if ($wylacznosc7 == "2") {
$wyl7 = "<span class=\"wyl\">WY£¡CZNO¦Æ</span>";
}
else {
$wyl7 = "";
}

$tekst7 = "<a href = \"$PHP_SELF?action=wynajemmzd&nu=$id7\">wiêcej ...</a>";

echo "<tr>";

if ($zdj7 != 0) {
	echo "<td width=\"126\" height=\"63\" rowspan = \"5\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=wynajemmzd&nu=$id7\">";
	echo "<img src=\"../img/zd$zdj7.jpg\" width=\"90\" height=\"60\" border=\"0\" class=\"ira\" alt=\"Zdjêcie nr$zdj7\"></img></a><br>";
	echo "</center>";
	echo "</td>";
}
else {
	echo "<td width=\"126\" height=\"63\" rowspan = \"5\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=wynajemmzd&nu=$id7\">";
	echo "<img src=\"../img/zd0.jpg\" width=\"90\" height=\"60\" alt=\"Brak zdjêcia\" class=\"ira\"></img></a><br>";
	echo "</center>";
	echo "</td>";
}

echo "<td align = \"left\">";

echo "<tr>";

echo "<td width=\"130\" align = \"left\">$wpstatp7";
echo "<b>Numer Oferty:</b> $nod7";
echo "$wpstatk7</td>";

echo "<td width=\"260\" align = \"left\" colspan = \"2\">$wpstatp7";
echo "<b>Lokalizacja:</b> $lok7";
echo "$wpstatk7</td>";

echo "</tr>";

echo "<tr>";

echo "<td width=\"130\" align = \"left\">$wpstatp7";
echo "<b>Pow.u¿ytk.:</b> $powuzyt7 m2";
echo "$wpstatk7</td>";

echo "<td width=\"130\" align = \"left\">$wpstatp7";
echo "<b>Standard:</b> $stad7";
echo "$wpstatk7</td>";

$cena7 = number_format($cena7,'', '.', '.');

echo "<td width=\"130\" align = \"left\">$wpstatp7";
echo "<b>Cena:</b> $cena7 z³.";
echo "$wpstatk7</td>";

echo "</tr>";

echo "<tr>";
echo "<td align = \"left\" colspan = \"3\">";
echo "$wpstatp7";
echo "&nbsp;Dodatkowe op³aty: $dod7";
echo "$wpstatk7";
echo "</td>";
echo "</tr>";

echo "<tr>";

echo "<td width=\"130\" align = \"left\">";
echo "$stat7";
echo "</td>";

echo "<td width=\"130\" align = \"left\">";
echo "$wyl7";
echo "</td>";

echo "<td width=\"130\" align = \"left\">";
echo "$tekst7";
echo "</td>";

echo "</tr>";

echo "</td>";

echo "</tr>";


echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}
echo "</table>";
}


$sql8 = "select id_m, no_m,  lok_m, powuzyt_m, np_m, cm_m2, cm_m, zd1, wyl_m, sm_m, std from tab_mie_w where lp_m = '2' and loka = '2' and pokaz = 't' and usunm = 'f' and id_b = '$identbiura' order by datawp_m desc;";

$result_set8 = pg_Exec($conn, $sql8);

$rows8 = pg_NumRows($result_set8);		// liczba zwroconych wierszy

if ((!$result_set8) || ($rows8 > 0)) { 

echo "<br>";
echo "<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" frame border=\"0\">";
echo "<tr><td><img src=\"img/black.gif\" width=\"100%\" height=\"1\" border=\"0\" alt=\"\"></img></td></tr>";
echo "<tr valign=\"left\"><td height=\"7\" bgcolor=\"#5865E5\">";
echo "<center>";
echo "<span class=\"nag1wb\">";
echo "2 pokojowe";
echo "</span>";
echo "</center>";
echo "</td></tr>";
echo "<tr><td><img src=\"img/black.gif\" width=\"100%\" height=\"1\" border=\"0\" alt=\"\"></img></td></tr>";
echo "</table>";


echo "<table width=\"516\" cellpadding=\"0\" cellspacing=\"0\" frame border=\"0\">";
	for ($i=0; $i < $rows8; $i++) {

		$id8 = pg_result($result_set8, $i, "id_m");
		$nod8 = pg_result($result_set8, $i, "no_m");
		$lok8 = pg_result($result_set8, $i, "lok_m");
		$powuzyt8 = pg_result($result_set8, $i, "powuzyt_m");
		$cena8 = pg_result($result_set8, $i, "cm_m");
		$dod88 = pg_result($result_set8, $i, "cm_m2");
		$zdj8 = pg_result($result_set8, $i, "zd1");
		$wylacznosc8 = pg_result($result_set8, $i, "wyl_m");
		$status8 = pg_result($result_set8, $i, "sm_m");
		$std8 = pg_result($result_set8, $i, "std");
		$sqlstands8 = "SELECT nazwa_stan FROM standard where id = '$std8';";
			
			$resultstands8 = @pg_Exec($conn, $sqlstands8);
			$stad8 = pg_result($resultstands8, 0, "nazwa_stan");

if ($status8 == "2") {
$stat8 = "<span class=\"zawna\">OFERTA ZAWIESZONA</span>";
$wpstatp8 = "<span class=\"zawo\">";
$wpstatk8 = "</span>";
}
else {
$stat8 ="";
$wpstatp8 = "";
$wpstatk8 = "";
}

if ($wylacznosc8 == "2") {
$wyl8 = "<span class=\"wyl\">WY£¡CZNO¦Æ</span>";
}
else {
$wyl8 = "";
}

$tekst8 = "<a href = \"$PHP_SELF?action=wynajemmzd&nu=$id8\">wiêcej ...</a>";

echo "<tr>";

if ($zdj8 != 0) {
	echo "<td width=\"126\" height=\"63\" rowspan = \"5\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=wynajemmzd&nu=$id8\">";
	echo "<img src=\"../img/zd$zdj8.jpg\" width=\"90\" height=\"60\" border=\"0\" class=\"ira\" alt=\"Zdjêcie nr$zdj8\"></img></a><br>";
	echo "</center>";
	echo "</td>";
}
else {
	echo "<td width=\"126\" height=\"63\" rowspan = \"5\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=wynajemmzd&nu=$id8\">";
	echo "<img src=\"../img/zd0.jpg\" width=\"90\" height=\"60\" alt=\"Brak zdjêcia\" class=\"ira\"></img></a><br>";
	echo "</center>";
	echo "</td>";
}

echo "<td align = \"left\">";

echo "<tr>";

echo "<td width=\"130\" align = \"left\">$wpstatp8";
echo "<b>Numer Oferty:</b> $nod8";
echo "$wpstatk8</td>";

echo "<td width=\"260\" align = \"left\" colspan = \"2\">$wpstatp8";
echo "<b>Lokalizacja:</b> $lok8";
echo "$wpstatk8</td>";

echo "</tr>";

echo "<tr>";

echo "<td width=\"130\" align = \"left\">$wpstatp8";
echo "<b>Pow.u¿ytk.:</b> $powuzyt8 m2";
echo "$wpstatk8</td>";

echo "<td width=\"130\" align = \"left\">$wpstatp8";
echo "<b>Standard:</b> $stad8";
echo "$wpstatk8</td>";

$cena8 = number_format($cena8,'', '.', '.');

echo "<td width=\"130\" align = \"left\">$wpstatp8";
echo "<b>Cena:</b> $cena8 z³.";
echo "$wpstatk8</td>";

echo "</tr>";

echo "<tr>";
echo "<td align = \"left\" colspan = \"3\">";
echo "$wpstatp8";
echo "&nbsp;Dodatkowe op³aty: $dod8";
echo "$wpstatk8";
echo "</td>";
echo "</tr>";

echo "<tr>";

echo "<td width=\"130\" align = \"left\">";
echo "$stat8";
echo "</td>";

echo "<td width=\"130\" align = \"left\">";
echo "$wyl8";
echo "</td>";

echo "<td width=\"130\" align = \"left\">";
echo "$tekst8";
echo "</td>";

echo "</tr>";

echo "</td>";

echo "</tr>";



echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}
echo "</table>";
}

$sql9 = "select id_m, no_m,  lok_m, powuzyt_m, np_m, cm_m2, cm_m, zd1, wyl_m, sm_m, std from tab_mie_w where lp_m = '3' and loka = '2' and pokaz = 't' and usunm = 'f' and id_b = '$identbiura' order by datawp_m desc;";

$result_set9 = pg_Exec($conn, $sql9);

$rows9 = pg_NumRows($result_set9);		// liczba zwroconych wierszy

if ((!$result_set9) || ($rows9 > 0)) { 

echo "<br>";
echo "<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" frame border=\"0\">";
echo "<tr><td><img src=\"img/black.gif\" width=\"100%\" height=\"1\" border=\"0\" alt=\"\"></img></td></tr>";
echo "<tr valign=\"left\"><td height=\"7\" bgcolor=\"#5865E5\">";
echo "<center>";
echo "<span class=\"nag1wb\">";
echo "3 pokojowe";
echo "</span>";
echo "</center>";
echo "</td></tr>";
echo "<tr><td><img src=\"img/black.gif\" width=\"100%\" height=\"1\" border=\"0\" alt=\"\"></img></td></tr>";
echo "</table>";


echo "<table width=\"516\" cellpadding=\"0\" cellspacing=\"0\" frame border=\"0\">";
	for ($i=0; $i < $rows9; $i++) {

		$id9 = pg_result($result_set9, $i, "id_m");
		$nod9 = pg_result($result_set9, $i, "no_m");
		$lok9 = pg_result($result_set9, $i, "lok_m");
		$powuzyt9 = pg_result($result_set9, $i, "powuzyt_m");
		$cena9 = pg_result($result_set9, $i, "cm_m");
		$dod9 = pg_result($result_set9, $i, "cm_m2");
		$zdj9 = pg_result($result_set9, $i, "zd1");
		$wylacznosc9 = pg_result($result_set9, $i, "wyl_m");
		$status9 = pg_result($result_set9, $i, "sm_m");
		$std9 = pg_result($result_set9, $i, "std");
		$sqlstands9 = "SELECT nazwa_stan FROM standard where id = '$std9';";
			
			$resultstands9 = @pg_Exec($conn, $sqlstands9);
			$stad9 = pg_result($resultstands9, 0, "nazwa_stan");

if ($status9 == "2") {
$stat9 = "<span class=\"zawna\">OFERTA ZAWIESZONA</span>";
$wpstatp9 = "<span class=\"zawo\">";
$wpstatk9 = "</span>";
}
else {
$stat9 ="";
$wpstatp9 = "";
$wpstatk9 = "";
}

if ($wylacznosc9 == "2") {
$wyl9 = "<span class=\"wyl\">WY£¡CZNO¦Æ</span>";
}
else {
$wyl9 = "";
}

$tekst9 = "<a href = \"$PHP_SELF?action=wynajemmzd&nu=$id9\">wiêcej ...</a>";

echo "<tr>";
if ($zdj9 != 0) {
	echo "<td width=\"126\" height=\"63\" rowspan = \"5\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=wynajemmzd&nu=$id9\">";
	echo "<img src=\"../img/zd$zdj9.jpg\" width=\"90\" height=\"60\" border=\"0\" class=\"ira\" alt=\"Zdjêcie nr$zdj9\"></img></a><br>";
	echo "</center>";
	echo "</td>";
}
else {
	echo "<td width=\"126\" height=\"63\" rowspan = \"5\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=wynajemmzd&nu=$id9\">";
	echo "<img src=\"../img/zd0.jpg\" width=\"90\" height=\"60\" alt=\"Brak zdjêcia\" class=\"ira\"></img></a><br>";
	echo "</center>";
	echo "</td>";
}

echo "<td align = \"left\">";

echo "<tr>";

echo "<td width=\"130\" align = \"left\">$wpstatp9";
echo "<b>Numer Oferty:</b> $nod9";
echo "$wpstatk9</td>";

echo "<td width=\"260\" align = \"left\" colspan = \"2\">$wpstatp9";
echo "<b>Lokalizacja:</b> $lok9";
echo "$wpstatk9</td>";

echo "</tr>";

echo "<tr>";

echo "<td width=\"130\" align = \"left\">$wpstatp9";
echo "<b>Pow.u¿ytk.:</b> $powuzyt9 m2";
echo "$wpstatk9</td>";

echo "<td width=\"130\" align = \"left\">$wpstatp9";
echo "<b>Standard:</b> $stad9";
echo "$wpstatk9</td>";

$cena9 = number_format($cena9,'', '.', '.');

echo "<td width=\"130\" align = \"left\">$wpstatp9";
echo "<b>Cena:</b> $cena9 z³.";
echo "$wpstatk9</td>";

echo "</tr>";

echo "<tr>";
echo "<td align = \"left\" colspan = \"3\">";
echo "$wpstatp9";
echo "&nbsp;Dodatkowe op³aty: $dod9";
echo "$wpstatk9";
echo "</td>";
echo "</tr>";

echo "<tr>";

echo "<td width=\"130\" align = \"left\">";
echo "$stat9";
echo "</td>";

echo "<td width=\"130\" align = \"left\">";
echo "$wyl9";
echo "</td>";

echo "<td width=\"130\" align = \"left\">";
echo "$tekst9";
echo "</td>";

echo "</tr>";

echo "</td>";

echo "</tr>";

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}
echo "</table>";
}

$sql10 = "select id_m, no_m,  lok_m, powuzyt_m, np_m, cm_m2, cm_m, zd1, wyl_m, sm_m, std from tab_mie_w where lp_m = '4' and loka = '2' and pokaz = 't' and usunm = 'f' and id_b = '$identbiura' order by datawp_m desc;";

$result_set10 = pg_Exec($conn, $sql10);

$rows10 = pg_NumRows($result_set10);		// liczba zwroconych wierszy

if ((!$result_set10) || ($rows10 > 0)) { 

echo "<br>";
echo "<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" frame border=\"0\">";
echo "<tr><td><img src=\"img/black.gif\" width=\"100%\" height=\"1\" border=\"0\" alt=\"\"></img></td></tr>";
echo "<tr valign=\"left\"><td height=\"7\" bgcolor=\"#5865E5\">";
echo "<center>";
echo "<span class=\"nag1wb\">";
echo "4 pokojowe";
echo "</span>";
echo "</center>";
echo "</td></tr>";
echo "<tr><td><img src=\"img/black.gif\" width=\"100%\" height=\"1\" border=\"0\" alt=\"\"></img></td></tr>";
echo "</table>";


echo "<table width=\"516\" cellpadding=\"0\" cellspacing=\"0\" frame border=\"0\">";
	for ($i=0; $i < $rows10; $i++) {

		$id10 = pg_result($result_set10, $i, "id_m");
		$nod10 = pg_result($result_set10, $i, "no_m");
		$lok10 = pg_result($result_set10, $i, "lok_m");
		$powuzyt10 = pg_result($result_set10, $i, "powuzyt_m");
		$cena10 = pg_result($result_set10, $i, "cm_m");
		$dod10 = pg_result($result_set10, $i, "cm_m2");
		$zdj10 = pg_result($result_set10, $i, "zd1");
		$wylacznosc10 = pg_result($result_set10, $i, "wyl_m");
		$status10 = pg_result($result_set10, $i, "sm_m");
		$std10 = pg_result($result_set10, $i, "std");
		$sqlstands10 = "SELECT nazwa_stan FROM standard where id = '$std10';";
			
			$resultstands10 = @pg_Exec($conn, $sqlstands10);
			$stad10 = pg_result($resultstands10, 0, "nazwa_stan");

if ($status10 == "2") {
$stat10 = "<span class=\"zawna\">OFERTA ZAWIESZONA</span>";
$wpstatp10 = "<span class=\"zawo\">";
$wpstatk10 = "</span>";
}
else {
$stat10 ="";
$wpstatp10 = "";
$wpstatk10 = "";
}

if ($wylacznosc10 == "2") {
$wyl10 = "<span class=\"wyl\">WY£¡CZNO¦Æ</span>";
}
else {
$wyl10 = "";
}

$tekst10 = "<a href = \"$PHP_SELF?action=wynajemmzd&nu=$id10\">wiêcej ...</a>";

echo "<tr>";

if ($zdj10 != 0) {
	echo "<td width=\"126\" height=\"63\" rowspan = \"5\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=wynajemmzd&nu=$id10\">";
	echo "<img src=\"../img/zd$zdj10.jpg\" width=\"90\" height=\"60\" border=\"0\" class=\"ira\" alt=\"Zdjêcie nr$zdj10\"></img></a><br>";
	echo "</center>";
	echo "</td>";
}
else {
	echo "<td width=\"126\" height=\"63\" rowspan = \"5\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=wynajemmzd&nu=$id10\">";
	echo "<img src=\"../img/zd0.jpg\" width=\"90\" height=\"60\" alt=\"Brak zdjêcia\" class=\"ira\"></img></a><br>";
	echo "</center>";
	echo "</td>";
}

echo "<td align = \"left\">";

echo "<tr>";

echo "<td width=\"130\" align = \"left\">$wpstatp10";
echo "<b>Numer Oferty:</b> $nod10";
echo "$wpstatk10</td>";

echo "<td width=\"260\" align = \"left\" colspan = \"2\">$wpstatp10";
echo "<b>Lokalizacja:</b> $lok10";
echo "$wpstatk10</td>";

echo "</tr>";

echo "<tr>";

echo "<td width=\"130\" align = \"left\">$wpstatp10";
echo "<b>Pow.u¿ytk.:</b> $powuzyt10 m2";
echo "$wpstatk10</td>";

echo "<td width=\"130\" align = \"left\">$wpstatp10";
echo "<b>Standard:</b> $stad10";
echo "$wpstatk10</td>";

$cena10 = number_format($cena10,'', '.', '.');

echo "<td width=\"130\" align = \"left\">$wpstatp10";
echo "<b>Cena:</b> $cena10 z³.";
echo "$wpstatk10</td>";

echo "</tr>";

echo "<tr>";
echo "<td align = \"left\" colspan = \"3\">";
echo "$wpstatp10";
echo "&nbsp;Dodatkowe op³aty: $dod10";
echo "$wpstatk10";
echo "</td>";
echo "</tr>";

echo "<tr>";

echo "<td width=\"130\" align = \"left\">";
echo "$stat10";
echo "</td>";

echo "<td width=\"130\" align = \"left\">";
echo "$wyl10";
echo "</td>";

echo "<td width=\"130\" align = \"left\">";
echo "$tekst10";
echo "</td>";

echo "</tr>";

echo "</td>";

echo "</tr>";

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}
echo "</table>";
}

$sql11 = "select id_m, no_m,  lok_m, powuzyt_m, np_m, cm_m2, cm_m, zd1, wyl_m, sm_m, std from tab_mie_w where lp_m = '5' and loka = '2' and pokaz = 't' and usunm = 'f' and  id_b = '$identbiura' order by datawp_m desc;";

$result_set11 = pg_Exec($conn, $sql11);

$rows11 = pg_NumRows($result_set11);		// liczba zwroconych wierszy

if ((!$result_set11) || ($rows11 > 0)) { 

echo "<br>";
echo "<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" frame border=\"0\">";
echo "<tr><td><img src=\"img/black.gif\" width=\"100%\" height=\"1\" border=\"0\" alt=\"\"></img></td></tr>";
echo "<tr valign=\"left\"><td height=\"7\" bgcolor=\"#5865E5\">";
echo "<center>";
echo "<span class=\"nag1wb\">";
echo "5 pokojowe";
echo "</span>";
echo "</center>";
echo "</td></tr>";
echo "<tr><td><img src=\"img/black.gif\" width=\"100%\" height=\"1\" border=\"0\" alt=\"\"></img></td></tr>";
echo "</table>";


echo "<table width=\"516\" cellpadding=\"0\" cellspacing=\"0\" frame border=\"0\">";
	for ($i=0; $i < $rows11; $i++) {

		$id11 = pg_result($result_set11, $i, "id_m");
		$nod11 = pg_result($result_set11, $i, "no_m");
		$lok11 = pg_result($result_set11, $i, "lok_m");
		$powuzyt11 = pg_result($result_set11, $i, "powuzyt_m");
		$cena11 = pg_result($result_set11, $i, "cm_m");
		$dod11 = pg_result($result_set11, $i, "cm_m2");
		$zdj11 = pg_result($result_set11, $i, "zd1");
		$wylacznosc11 = pg_result($result_set11, $i, "wyl_m");
		$status11 = pg_result($result_set11, $i, "sm_m");
		$std11 = pg_result($result_set11, $i, "std");
		$sqlstands11 = "SELECT nazwa_stan FROM standard where id = '$std11';";
			
			$resultstands11 = @pg_Exec($conn, $sqlstands11);
			$stad11 = pg_result($resultstands11, 0, "nazwa_stan");

if ($status11 == "2") {
$stat11 = "<span class=\"zawna\">OFERTA ZAWIESZONA</span>";
$wpstatp11 = "<span class=\"zawo\">";
$wpstatk11 = "</span>";
}
else {
$stat11 ="";
$wpstatp11 = "";
$wpstatk11 = "";
}

if ($wylacznosc11 == "2") {
$wyl11 = "<span class=\"wyl\">WY£¡CZNO¦Æ</span>";
}
else {
$wyl11 = "";
}

$tekst11 = "<a href = \"$PHP_SELF?action=wynajemmzd&nu=$id11\">wiêcej ...</a>";

echo "<tr>";
if ($zdj11 != 0) {
	echo "<td width=\"126\" height=\"63\" rowspan = \"5\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=wynajemmzd&nu=$id11\">";
	echo "<img src=\"../img/zd$zdj11.jpg\" width=\"90\" height=\"60\" border=\"0\" class=\"ira\" alt=\"Zdjêcie nr$zdj11\"></img></a><br>";
	echo "</center>";
	echo "</td>";
}
else {
	echo "<td width=\"126\" height=\"63\" rowspan = \"5\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=wynajemmzd&nu=$id11\">";
	echo "<img src=\"../img/zd0.jpg\" width=\"90\" height=\"60\" alt=\"Brak zdjêcia\" class=\"ira\"></img></a><br>";
	echo "</center>";
	echo "</td>";
}

echo "<td align = \"left\">";

echo "<tr>";

echo "<td width=\"130\" align = \"left\">$wpstatp11";
echo "<b>Numer Oferty:</b> $nod11";
echo "$wpstatk11</td>";

echo "<td width=\"260\" align = \"left\" colspan = \"2\">$wpstatp11";
echo "<b>Lokalizacja:</b> $lok11";
echo "$wpstatk11</td>";

echo "</tr>";

echo "<tr>";

echo "<td width=\"130\" align = \"left\">$wpstatp11";
echo "<b>Pow.u¿ytk.:</b> $powuzyt11 m2";
echo "$wpstatk11</td>";

echo "<td width=\"130\" align = \"left\">$wpstatp11";
echo "<b>Standard:</b> $stad11";
echo "$wpstatk11</td>";

$cena11 = number_format($cena11,'', '.', '.');

echo "<td width=\"130\" align = \"left\">$wpstatp11";
echo "<b>Cena:</b> $cena11 z³.";
echo "$wpstatk11</td>";

echo "</tr>";

echo "<tr>";
echo "<td align = \"left\" colspan = \"3\">";
echo "$wpstatp11";
echo "&nbsp;Dodatkowe op³aty: $dod11";
echo "$wpstatk11";
echo "</td>";
echo "</tr>";

echo "<tr>";

echo "<td width=\"130\" align = \"left\">";
echo "$stat11";
echo "</td>";

echo "<td width=\"130\" align = \"left\">";
echo "$wyl11";
echo "</td>";

echo "<td width=\"130\" align = \"left\">";
echo "$tekst11";
echo "</td>";

echo "</tr>";

echo "</td>";

echo "</tr>";

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}
echo "</table>";
}

$sql12 = "select id_m, no_m, lok_m, powuzyt_m, np_m, cm_m2, cm_m, zd1, wyl_m, sm_m, std from tab_mie_w where lp_m = '6' and loka = '2' and pokaz = 't' and usunm = 'f' and id_b = '$identbiura' order by datawp_m desc;";

$result_set12 = pg_Exec($conn, $sql12);

$rows12 = pg_NumRows($result_set12);		// liczba zwroconych wierszy

if ((!$result_set12) || ($rows12 > 0)) { 

echo "<br>";
echo "<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" frame border=\"0\">";
echo "<tr><td><img src=\"img/black.gif\" width=\"100%\" height=\"1\" border=\"0\" alt=\"\"></img></td></tr>";
echo "<tr valign=\"left\"><td height=\"7\" bgcolor=\"#5865E5\">";
echo "<center>";
echo "<span class=\"nag1wb\">";
echo "6 pokojowe";
echo "</span>";
echo "</center>";
echo "</td></tr>";
echo "<tr><td><img src=\"img/black.gif\" width=\"100%\" height=\"1\" border=\"0\" alt=\"\"></img></td></tr>";
echo "</table>";


echo "<table width=\"516\" cellpadding=\"0\" cellspacing=\"0\" frame border=\"0\">";
	for ($i=0; $i < $rows12; $i++) {

		$id12 = pg_result($result_set12, $i, "id_m");
		$nod12 = pg_result($result_set12, $i, "no_m");
		$lok12 = pg_result($result_set12, $i, "lok_m");
		$powuzyt12 = pg_result($result_set12, $i, "powuzyt_m");
		$cena12 = pg_result($result_set12, $i, "cm_m");
		$dod12 = pg_result($result_set12, $i, "cm_m2");
		$zdj12 = pg_result($result_set12, $i, "zd1");
		$wylacznosc12 = pg_result($result_set12, $i, "wyl_m");
		$status12 = pg_result($result_set12, $i, "sm_m");
		$std12 = pg_result($result_set12, $i, "std");
		$sqlstands12 = "SELECT nazwa_stan FROM standard where id = '$std12';";
			
			$resultstands12 = @pg_Exec($conn, $sqlstands12);
			$stad12 = pg_result($resultstands12, 0, "nazwa_stan");

if ($status12 == "2") {
$stat12 = "<span class=\"zawna\">OFERTA ZAWIESZONA</span>";
$wpstatp12 = "<span class=\"zawo\">";
$wpstatk12 = "</span>";
}
else {
$stat12 ="";
$wpstatp12 = "";
$wpstatk12 = "";
}

if ($wylacznosc12 == "2") {
$wyl12 = "<span class=\"wyl\">WY£¡CZNO¦Æ</span>";
}
else {
$wyl12 = "";
}

$tekst12 = "<a href = \"$PHP_SELF?action=wynajemmzd&nu=$id12\">wiêcej ...</a>";

echo "<tr>";

if ($zdj12 != 0) {
	echo "<td width=\"126\" height=\"63\" rowspan = \"5\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=wynajemmzd&nu=$id12\">";
	echo "<img src=\"../img/zd$zdj12.jpg\" width=\"90\" height=\"60\" border=\"0\" class=\"ira\" alt=\"Zdjêcie nr$zdj12\"></img></a><br>";
	echo "</center>";
	echo "</td>";
}
else {
	echo "<td width=\"126\" height=\"63\" rowspan = \"5\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=wynajemmzd&nu=$id12\">";
	echo "<img src=\"../img/zd0.jpg\" width=\"90\" height=\"60\" alt=\"Brak zdjêcia\" class=\"ira\"></img></a><br>";
	echo "</center>";
	echo "</td>";
}

echo "<td align = \"left\">";

echo "<tr>";

echo "<td width=\"130\" align = \"left\">$wpstatp12";
echo "<b>Numer Oferty:</b> $nod12";
echo "$wpstatk12</td>";

echo "<td width=\"260\" align = \"left\" colspan = \"2\">$wpstatp12";
echo "<b>Lokalizacja:</b> $lok12";
echo "$wpstatk12</td>";

echo "</tr>";

echo "<tr>";

echo "<td width=\"130\" align = \"left\">$wpstatp12";
echo "<b>Pow.u¿ytk.:</b> $powuzyt12 m2";
echo "$wpstatk12</td>";

echo "<td width=\"130\" align = \"left\">$wpstatp12";
echo "<b>Standard:</b> $stad12";
echo "$wpstatk12</td>";

$cena12 = number_format($cena12,'', '.', '.');

echo "<td width=\"130\" align = \"left\">$wpstatp12";
echo "<b>Cena:</b> $cena12 z³.";
echo "$wpstatk12</td>";

echo "</tr>";

echo "<tr>";
echo "<td align = \"left\" colspan = \"3\">";
echo "$wpstatp12";
echo "&nbsp;Dodatkowe op³aty: $dod12";
echo "$wpstatk12";
echo "</td>";
echo "</tr>";

echo "<tr>";

echo "<td width=\"130\" align = \"left\">";
echo "$stat12";
echo "</td>";

echo "<td width=\"130\" align = \"left\">";
echo "$wyl12";
echo "</td>";

echo "<td width=\"130\" align = \"left\">";
echo "$tekst12";
echo "</td>";

echo "</tr>";

echo "</td>";

echo "</tr>";


echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}
echo "</table>";
}

}

if ($action == 'wynajemmzd') {

echo "<center>";
echo "<span class=\"nag2b\">";
echo "<b>WYNAJEM MIESZKAÑ</b>";
echo "<br>";
echo "</span>";
echo "</center>";

echo "<table width=\"512\" cellpadding=\"0\" cellspacing=\"0\" border = \"0\">";
echo "<tr>";
echo "<td width=\"50%\"  align = \"left\">";

?>
<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,0,0" width="40" height="20" id="backwm" align="middle">
<param name="allowScriptAccess" value="sameDomain" />
<param name="movie" value="backwm.swf" />
<param name="quality" value="high" />
<param name="wmode" value="transparent" />
<param name="bgcolor" value="#ffffff" />
<embed src="backwm.swf" quality="high" wmode="transparent" bgcolor="#ffffff" width="40" height="20" name="backwm" align="middle" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />
</object>
<?

echo "</td>";
echo "<td width=\"50%\" align = \"right\">";
echo "<a href=\"drukwm.php?nu=$nu\" target = \"_blank\"><img src=\"img/printer.gif\" width=\"15\" height=\"17\" border=\"0\"></img>&nbsp;&nbsp;Wydrukuj ze zdjeciami</a><br>";
echo "<a href=\"drukwmb.php?nu=$nu\" target = \"_blank\"><img src=\"img/printer.gif\" width=\"15\" height=\"17\" border=\"0\"></img>&nbsp;&nbsp;Wydrukuj bez zdjêæ</a>";
echo "</td>";
echo "</tr>";
echo "</table>";

echo "<br>";

echo "<center>";
echo "<table width=\"512\" cellpadding=\"0\" cellspacing=\"0\" border = \"1\" frame = \"above,below,rhs\" rules = \"groups\">";

$sqlno = "SELECT no_m, no_m_bo FROM tab_mie_w where id_m = '$nu';";	
	$resultno = @pg_Exec($conn, $sqlno);
	$rowsno = pg_NumRows($resultno);		// liczba zwroconych wierszy
	$noms = pg_result($resultno, 0, "no_m");
	$nomsp = pg_result($resultno, 0, "no_m_bo");

$sqlstatus = "SELECT sm_m, sm_m_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultstatus = @pg_Exec($conn, $sqlstatus);
			$status = pg_result($resultstatus, 0, "sm_m");
			$statusbo = pg_result($resultstatus, 0, "sm_m_bo");
	
	$sqlstatuss = "SELECT nazwa_st FROM status where id = '$status';";
			
			$resultstatuss = @pg_Exec($conn, $sqlstatuss);
			$statuss = pg_result($resultstatuss, 0, "nazwa_st");

$sqlagent = "SELECT id_a FROM tab_mie_w where id_m = '$nu';";
			
			$resultagent = @pg_Exec($conn, $sqlagent);
			$agent = pg_result($resultagent, 0, "id_a");

	$sqlagents = "SELECT nazwa_a, tel_a, tel_kom_a, email_a FROM tab_agent where id_a = '$agent';";
			
			$resultagents = @pg_Exec($conn, $sqlagents);
			$nazwaagenta = pg_result($resultagents, 0, "nazwa_a");
			$nazwatel = pg_result($resultagents, 0, "tel_a");
			$nazwatelkom = pg_result($resultagents, 0, "tel_kom_a");
			$nazwaemail = pg_result($resultagents, 0, "email_a");

$sqllok = "SELECT lok_m, lok_m_bo FROM tab_mie_w where id_m = '$nu';";	
	$resultlok = @pg_Exec($conn, $sqllok);
	$lokas = pg_result($resultlok, 0, "lok_m");
	$lokasp = pg_result($resultlok, 0, "lok_m_bo");

$sqlwoj = "SELECT lok_w, lok_w_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultwoj = @pg_Exec($conn, $sqlwoj);
			$wojn = pg_result($resultwoj, 0, "lok_w");
			$wojnbo = pg_result($resultwoj, 0, "lok_w_bo");
	
	$sqlwojs = "SELECT nazwa_w FROM wojewodztwa where id_w = '$wojn';";
			
			$resultwojs = @pg_Exec($conn, $sqlwojs);
			$wojns = pg_result($resultwojs, 0, "nazwa_w");

$sqlpowiat = "SELECT lok_p, lok_p_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultpowiat = @pg_Exec($conn, $sqlpowiat);
			$powiatn = pg_result($resultpowiat, 0, "lok_p");
			$powiatbo = pg_result($resultpowiat, 0, "lok_p_bo");
	
	$sqlpowiats = "SELECT nazwa_p FROM powiaty where id_pow = '$powiatn';";
			
			$resultpowiats = @pg_Exec($conn, $sqlpowiats);
			$powiatns = pg_result($resultpowiats, 0, "nazwa_p");

$sqlcena = "SELECT cm_m, cm_m_bo FROM tab_mie_w where id_m = '$nu';";	
	$resultcena = @pg_Exec($conn, $sqlcena);
	$cenas = pg_result($resultcena, 0, "cm_m");
	$cenasp = pg_result($resultcena, 0, "cm_m_bo");
	
$sqlpowuzyt = "SELECT powuzyt_m, powuzyt_m_bo FROM tab_mie_w where id_m = '$nu';";	
	$resultpowuzyt = @pg_Exec($conn, $sqlpowuzyt);
	$powuzyts = pg_result($resultpowuzyt, 0, "powuzyt_m");
	$powuzytsp = pg_result($resultpowuzyt, 0, "powuzyt_m_bo");
	
$sqlnump = "SELECT np_m, np_m_bo FROM tab_mie_w where id_m = '$nu';";	
	$resultnump = @pg_Exec($conn, $sqlnump);
	$numps = pg_result($resultnump, 0, "np_m");
	$numpsp = pg_result($resultnump, 0, "np_m_bo");		

$sqlpietro = "SELECT lpi_m, lpi_m_bo FROM tab_mie_w where id_m = '$nu';";	
	$resultpietro = @pg_Exec($conn, $sqlpietro);
	$pietros = pg_result($resultpietro, 0, "lpi_m");
	$pietrosp = pg_result($resultpietro, 0, "lpi_m_bo");
	
$sqlcm2 = "SELECT cm_m2, cm_m2_bo FROM tab_mie_w where id_m = '$nu';";	
	$resultcm2 = @pg_Exec($conn, $sqlcm2);
	$cenam2 = pg_result($resultcm2, 0, "cm_m2");
	$cenam2bo = pg_result($resultcm2, 0, "cm_m2_bo");
	
$sqlczynsz = "SELECT wys_cz_m, wys_cz_m_bo FROM tab_mie_w where id_m = '$nu';";	
	$resultczynsz = @pg_Exec($conn, $sqlczynsz);
	$czynszs = pg_result($resultczynsz, 0, "wys_cz_m");
	$czynszsp = pg_result($resultczynsz, 0, "wys_cz_m_bo");

$sqlczasp = "SELECT cz_prze_m, cz_prze_m_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultczasp = @pg_Exec($conn, $sqlczasp);
			$czasp = pg_result($resultczasp, 0, "cz_prze_m");
			$czaspbo = pg_result($resultczasp, 0, "cz_prze_m_bo");
	
	$sqlczasps = "SELECT nazwa_prz FROM czas_prz where id = '$czasp';";
			
			$resultczasps = @pg_Exec($conn, $sqlczasps);
			$czasps = pg_result($resultczasps, 0, "nazwa_prz");

$sqlksiega = "SELECT kw_m, kw_m_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultksiega = @pg_Exec($conn, $sqlksiega);
			$ksiega = pg_result($resultksiega, 0, "kw_m");
			$ksiegabo = pg_result($resultksiega, 0, "kw_m_bo");
	
	$sqlksiegas = "SELECT nazwa_k FROM ksiega where id = '$ksiega';";
			
			$resultksiegas = @pg_Exec($conn, $sqlksiegas);
			$ksiegass = pg_result($resultksiegas, 0, "nazwa_k");

$sqlprawny = "SELECT spr_m, spr_m_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultprawny = @pg_Exec($conn, $sqlprawny);
			$prawny = pg_result($resultprawny, 0, "spr_m");
			$prawnybo = pg_result($resultprawny, 0, "spr_m_bo");
	
	$sqlprawnys = "SELECT nazwa_pr FROM stan_pr where id = '$prawny';";
			
			$resultprawnys = @pg_Exec($conn, $sqlprawnys);
			$prawnyss = pg_result($resultprawnys, 0, "nazwa_pr");

$sqlrynek = "SELECT rr_m, rr_m_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultrynek = @pg_Exec($conn, $sqlrynek);
			$rrynek = pg_result($resultrynek, 0, "rr_m");
			$rrynekbo = pg_result($resultrynek, 0, "rr_m_bo");
	
	$sqlryneks = "SELECT nazwa_r FROM rodzaj_ryn where id = '$rrynek';";
			
			$resultryneks = @pg_Exec($conn, $sqlryneks);
			$rryneks = pg_result($resultryneks, 0, "nazwa_r");			

$sqldw = "SELECT datawp_m, datawp_m_bo FROM tab_mie_w where id_m = '$nu';";
	$resultdw = @pg_Exec($conn, $sqldw);
	$datw = pg_result($resultdw, 0, "datawp_m");
	$datwp = pg_result($resultdw, 0, "datawp_m_bo");

if (($lokasp == 't')  || ($wojnbo == 't') || ($powiatbo == 't')  || ($cenasp == 't') || ($powuzytsp == 't')  || ($numpsp == 't') || ($pietrosp == 't')  || ($cenam2bo == 't') || ($czynszsp == 't')  || ($czaspbo == 't') || ($ksiegabo == 't')  || ($prawnybo == 't') || ($rrynekbo == 't')  || ($datwp == 't')) {

echo "<tr><td colspan=\"40\" height=\"7\" bgcolor=\"#5865E5\">";
echo "<span class=\"nag1wb\">";
echo "&nbsp;Informacje podstawowe";
echo "</span>";
echo "</td></tr>";

}
	
echo "<tr>";

if ($nomsp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Numer:</b><br>&nbsp;$noms";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}	

if ($statusbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Status:</b><br>&nbsp;$statuss";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Po¶rednik:</b><br>&nbsp;<a href=\"mailto:$nazwaemail\">$nazwaagenta</a>&nbsp;<b>Tel.kom.:</b>&nbsp;$nazwatelkom";
echo "</td>";

echo "</tr>";

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"512\" height=\"1\" border=\"0\"></img></td></tr>";

if ( ($lokasp == 't')  || ($wojnbo == 't') || ($powiatbo == 't')  || ($cenasp == 't')) {

echo "<tr>";
}

if ($lokasp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Lokalizacja:</b><br>&nbsp;$lokas";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}


if ($wojnbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Województwo:</b><br>&nbsp;$wojns";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($powiatbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Powiat:</b><br>&nbsp;$powiatns";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($cenasp == 't') {

$cenas = number_format($cenas,'', '.', '.');

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Cena wynajmu:</b><br>&nbsp;$cenas z³.";
echo "</td>";

}



if ( ($lokasp == 't')  || ($wojnbo == 't') || ($powiatbo == 't')  || ($cenasp == 't')) {

echo "</tr>";

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}

if ( ($powuzytsp == 't')  || ($numpsp == 't') || ($pietrosp == 't')  || ($cenam2bo == 't')) {
echo "<tr>";
}

if ($powuzytsp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pow. u¿ytkowa:</b><br>&nbsp;$powuzyts m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($numpsp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Numer piêtra:</b><br>&nbsp;$numps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($pietrosp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Liczba piêter:</b><br>&nbsp;$pietros";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($cenam2bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Dodatkowe op³aty:</b><br>&nbsp;$cenam2";
echo "</td>";

}


if ( ($powuzytsp == 't')  || ($numpsp == 't') || ($pietrosp == 't')  || ($cenam2bo == 't')) {

echo "</tr>";

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}

if ( ($czynszsp == 't')  || ($czaspbo == 't') || ($ksiegabo == 't')  || ($prawnybo == 't')) {

echo "<tr>";
}

if ($czynszsp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Czynsz:</b><br>&nbsp;$czynszs z³.";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($czaspbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Czas przekazania:</b><br>&nbsp;$czasps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($ksiegabo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Ksiêga Wieczysta:</b><br>&nbsp;$ksiegass";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($prawnybo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Stan prawny:</b><br>&nbsp;$prawnyss";
echo "</td>";

}


if ( ($czynszsp == 't')  || ($czaspbo == 't') || ($ksiegabo == 't')  || ($prawnybo == 't')) {

echo "</tr>";

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}

if (($rrynekbo == 't')  || ($datwp == 't')) {
echo "<tr>";
}

if ($rrynekbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Rodzaj rynku:</b><br>&nbsp;$rryneks";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($datwp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Data oferty:</b><br>&nbsp;$datw";
echo "</td>";

}

if (($rrynekbo == 't')  || ($datwp == 't')) {

echo "</tr>";

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}

$sqlfil1 = "SELECT film1 FROM tab_mie_w where id_m = '$nu';";
			
	$resultfil1 = @pg_Exec($conn, $sqlfil1);
	$fil1ms = pg_result($resultfil1, 0, "film1");

$sqlfil2 = "SELECT film2 FROM tab_mie_w where id_m = '$nu';";
			
	$resultfil2 = @pg_Exec($conn, $sqlfil2);
	$fil2ms = pg_result($resultfil2, 0, "film2");

$sqlfil3 = "SELECT film3 FROM tab_mie_w where id_m = '$nu';";
			
	$resultfil3 = @pg_Exec($conn, $sqlfil3);
	$fil3ms = pg_result($resultfil3, 0, "film3");


if (($fil1ms != '0') || ($fil2ms != '0') || ($fil3ms != '0')) {

echo "<tr><td colspan=\"40\" height=\"7\" bgcolor=\"#5865E5\">";
echo "<span class=\"nag1wb\">";
echo "&nbsp;Klipy video";
echo "</span>";
echo "</td></tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

echo "<tr>"; 

}


 if ($fil1ms != '0') {

	echo "<td width=\"127\">";
	echo "<center>";
	echo "<a href=\"filmy/$fil1ms.wmv\"><img src=\"img/camera2.jpg\" width=\"50\" height=\"42\" align =\"left\" border=\"0\"></img></a>";
	echo "<a href=\"filmy/$fil1ms.wmv\">Film nr $fil1ms</a>";
	echo "</span>";
	echo "</center>";
	echo "</td>";
	
	echo "<td width=\"1\" height=\"100%\">";
	echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
	echo "</td>";
}

if ($fil2ms != '0') {

	echo "<td width=\"127\">";
	echo "<center>";
	echo "<a href=\"filmy/$fil2ms.wmv\"><img src=\"img/camera2.jpg\" width=\"50\" height=\"42\" align =\"left\" border=\"0\"></img></a>";
	echo "<a href=\"filmy/$fil2ms.wmv\">Film nr $fil2ms</a>";
	echo "</span>";
	echo "</center>";
	echo "</td>";
	
	echo "<td width=\"1\" height=\"100%\">";
	echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
	echo "</td>";

}

if ($fil3ms != '0') {

	echo "<td width=\"127\">";
	echo "<center>";
	echo "<a href=\"filmy/$fil3ms.wmv\"><img src=\"img/camera2.jpg\" width=\"50\" height=\"42\" align =\"left\" border=\"0\"></img></a>";
	echo "<a href=\"filmy/$fil3ms.wmv\">Film nr $fil3ms</a>";
	echo "</span>";
	echo "</center>";
	echo "</td>";

}


if (($fil1ms != '0')  || ($fil2ms != '0') || ($fil3ms != '0')) {

echo "</tr>";

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}



$sqlzd1 = "SELECT zd1 FROM tab_mie_w where id_m = '$nu';";
			
	$resultzd1s = @pg_Exec($conn, $sqlzd1);
	$zd1ms = pg_result($resultzd1s, 0, "zd1");

$sqlzd2 = "SELECT zd2 FROM tab_mie_w where id_m = '$nu';";
			
	$resultzd2s = @pg_Exec($conn, $sqlzd2);
	$zd2ms = pg_result($resultzd2s, 0, "zd2");

$sqlzd3 = "SELECT zd3 FROM tab_mie_w where id_m = '$nu';";
			
	$resultzd3s = @pg_Exec($conn, $sqlzd3);
	$zd3ms = pg_result($resultzd3s, 0, "zd3");

$sqlzd4 = "SELECT zd4 FROM tab_mie_w where id_m = '$nu';";
			
	$resultzd4s = @pg_Exec($conn, $sqlzd4);
	$zd4ms = pg_result($resultzd4s, 0, "zd4");


if (($zd1ms != '0')  || ($zd2ms != '0') || ($zd3ms != '0')  || ($zd4ms != '0')) {

echo "<tr><td colspan=\"40\" height=\"7\" bgcolor=\"#5865E5\">";
echo "<span class=\"nag1wb\">";
echo "&nbsp;Zdjêcia oferty";
echo "</span>";
echo "</td></tr>";

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

echo "<tr>"; 

}


if ($zd1ms != '0') {

	echo "<td width=\"127\">";
	echo "<center>";
	echo "<a href=\"image.php?p=img/zd$zd1ms$ok&w=550&h=350&i=Zdjêcie%20nr\"$zd1ms\"\" onclick=\"NewWindow(this.href,'name','570','370','no');return false;\">";
	echo "<img src=\"../img/zd$zd1ms.jpg\" width=\"125\" height=\"100\" border=\"0\" alt=\"Zdjêcie nr$zd1ms\"></img></a><br><span class=\"\">";
	echo "Zdjêcie nr $zd1ms";
	echo "</span>";
	echo "</center>";
	echo "</td>";
	
	echo "<td width=\"1\" height=\"100%\">";
	echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
	echo "</td>";
}

if ($zd2ms != '0') {
	
	echo "<td width=\"127\">";
	echo "<center>";
	echo "<a href=\"image.php?p=img/zd$zd2ms$ok&w=550&h=350&i=Zdjêcie%20nr\"$zd2ms\"\" onclick=\"NewWindow(this.href,'name','570','370','no');return false;\">";
	echo "<img src=\"img/zd$zd2ms.jpg\" width=\"125\" height=\"100\" border=\"0\" alt=\"Zdjêcie nr$zd2ms\"></img></a><br><span class=\"\">";
	echo "Zdjêcie nr $zd2ms";
	echo "</span>";
	echo "</center>";
	echo "</td>";
	
	echo "<td width=\"1\" height=\"100%\">";
	echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
	echo "</td>";
	
}

if ($zd3ms != '0') {
	
	echo "<td width=\"127\">";
	echo "<center>";
	echo "<a href=\"image.php?p=img/zd$zd3ms$ok&w=550&h=350&i=Zdjêcie%20nr\"$zd3ms\"\" onclick=\"NewWindow(this.href,'name','570','370','no');return false;\">";
	echo "<img src=\"img/zd$zd3ms.jpg\" width=\"125\" height=\"100\" border=\"0\" alt=\"Zdjêcie nr$zd3ms\"></img></a><br><span class=\"\">";
	echo "Zdjêcie nr $zd3ms";
	echo "</span>";
	echo "</center>";
	echo "</td>";
	
	echo "<td width=\"1\" height=\"100%\">";
	echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
	echo "</td>";
	
}


if ($zd4ms != '0') {

	echo "<td  width=\"127\">";
	echo "<center>";
	echo "<a href=\"image.php?p=img/zd$zd4ms$ok&w=550&h=350&i=Zdjêcie%20nr\"$zd4ms\"\" onclick=\"NewWindow(this.href,'name','570','370','no');return false;\">";
	echo "<img src=\"img/zd$zd4ms.jpg\" width=\"125\" height=\"100\" border=\"0\" alt=\"Zdjêcie nr$zd4ms\"></img></a><br><span class=\"\">";
	echo "Zdjêcie nr $zd4ms";
	echo "</span>";
	echo "</center>";
	echo "</td>";

}


if (($zd1ms != '0')  || ($zd2ms != '0') || ($zd3ms != '0')  || ($zd4ms != '0')) {

echo "</tr>";

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}

$sqlpow1 = "SELECT pp1, pp1_bo FROM tab_mie_w where id_m = '$nu';";	
	$resultpow1 = @pg_Exec($conn, $sqlpow1);
	$pow1s = pg_result($resultpow1, 0, "pp1");
	$pow1sp = pg_result($resultpow1, 0, "pp1_bo");

$sqlpop1 = "SELECT pop1, pop1_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultpop1 = @pg_Exec($conn, $sqlpop1);
			$pop1s = pg_result($resultpop1, 0, "pop1");
			$pop1bo = pg_result($resultpop1, 0, "pop1_bo");
				
	$sqlpop1s = "SELECT nazwa_pod FROM podlogi where id = '$pop1s';";
			
			$resultpop1s = @pg_Exec($conn, $sqlpop1s);
			$pop1ps = pg_result($resultpop1s, 0, "nazwa_pod");

$sqlsc1 = "SELECT ps1, ps1_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultsc1 = @pg_Exec($conn, $sqlsc1);
			$psc1s = pg_result($resultsc1, 0, "ps1");
			$psc1bo = pg_result($resultsc1, 0, "ps1_bo");
				
	$sqlsc1s = "SELECT nazwa_sc FROM sciany where id = '$psc1s';";
			
			$resultsc1s = @pg_Exec($conn, $sqlsc1s);
			$psc1ps = pg_result($resultsc1s, 0, "nazwa_sc");

$sqlsuf1 = "SELECT psu1, psu1_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultsuf1 = @pg_Exec($conn, $sqlsuf1);
			$suf1s = pg_result($resultsuf1, 0, "psu1");
			$suf1bo = pg_result($resultsuf1, 0, "psu1_bo");
				
	$sqlsuf1s = "SELECT nazwa_su FROM sufit where id = '$suf1s';";
			
			$resultsuf1s = @pg_Exec($conn, $sqlsuf1s);
			$suf1ps = pg_result($resultsuf1s, 0, "nazwa_su");

$sqlwyp1 = "SELECT wyp1, wyp1_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultwyp1 = @pg_Exec($conn, $sqlwyp1);
			$wyp1s = pg_result($resultwyp1, 0, "wyp1");
			$wyp1bo = pg_result($resultwyp1, 0, "wyp1_bo");
				
	$sqlwyp1s = "SELECT nazwa_wp FROM wyposazenie where id = '$wyp1s';";
			
			$resultwyp1s = @pg_Exec($conn, $sqlwyp1s);
			$wyp1ps = pg_result($resultwyp1s, 0, "nazwa_wp");
			
$sqlpow2 = "SELECT pp2, pp2_bo FROM tab_mie_w where id_m = '$nu';";	
	$resultpow2 = @pg_Exec($conn, $sqlpow2);
	$pow2s = pg_result($resultpow2, 0, "pp2");
	$pow2sp = pg_result($resultpow2, 0, "pp2_bo");

$sqlpop2 = "SELECT pop2, pop2_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultpop2 = @pg_Exec($conn, $sqlpop2);
			$pop2s = pg_result($resultpop2, 0, "pop2");
			$pop2bo = pg_result($resultpop2, 0, "pop2_bo");
				
	$sqlpop2s = "SELECT nazwa_pod FROM podlogi where id = '$pop2s';";
			
			$resultpop2s = @pg_Exec($conn, $sqlpop2s);
			$pop2ps = pg_result($resultpop2s, 0, "nazwa_pod");

$sqlsc2 = "SELECT ps2, ps2_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultsc2 = @pg_Exec($conn, $sqlsc2);
			$psc2s = pg_result($resultsc2, 0, "ps2");
			$psc2bo = pg_result($resultsc2, 0, "ps2_bo");
				
	$sqlsc2s = "SELECT nazwa_sc FROM sciany where id = '$psc2s';";
			
			$resultsc2s = @pg_Exec($conn, $sqlsc2s);
			$psc2ps = pg_result($resultsc2s, 0, "nazwa_sc");

$sqlsuf2 = "SELECT psu2, psu2_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultsuf2 = @pg_Exec($conn, $sqlsuf2);
			$suf2s = pg_result($resultsuf2, 0, "psu2");
			$suf2bo = pg_result($resultsuf2, 0, "psu2_bo");
				
	$sqlsuf2s = "SELECT nazwa_su FROM sufit where id = '$suf2s';";
			
			$resultsuf2s = @pg_Exec($conn, $sqlsuf2s);
			$suf2ps = pg_result($resultsuf2s, 0, "nazwa_su");

$sqlwyp2 = "SELECT wyp2, wyp2_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultwyp2 = @pg_Exec($conn, $sqlwyp2);
			$wyp2s = pg_result($resultwyp2, 0, "wyp2");
			$wyp2bo = pg_result($resultwyp2, 0, "wyp2_bo");
				
	$sqlwyp2s = "SELECT nazwa_wp FROM wyposazenie where id = '$wyp2s';";
			
			$resultwyp2s = @pg_Exec($conn, $sqlwyp2s);
			$wyp2ps = pg_result($resultwyp2s, 0, "nazwa_wp");

$sqlpow3 = "SELECT pp3, pp3_bo FROM tab_mie_w where id_m = '$nu';";	
	$resultpow3 = @pg_Exec($conn, $sqlpow3);
	$pow3s = pg_result($resultpow3, 0, "pp3");
	$pow3sp = pg_result($resultpow3, 0, "pp3_bo");

$sqlpop3 = "SELECT pop3, pop3_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultpop3 = @pg_Exec($conn, $sqlpop3);
			$pop3s = pg_result($resultpop3, 0, "pop3");
			$pop3bo = pg_result($resultpop3, 0, "pop3_bo");
				
	$sqlpop3s = "SELECT nazwa_pod FROM podlogi where id = '$pop3s';";
			
			$resultpop3s = @pg_Exec($conn, $sqlpop3s);
			$pop3ps = pg_result($resultpop3s, 0, "nazwa_pod");

$sqlsc3 = "SELECT ps3, ps3_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultsc3 = @pg_Exec($conn, $sqlsc3);
			$psc3s = pg_result($resultsc3, 0, "ps3");
			$psc3bo = pg_result($resultsc3, 0, "ps3_bo");
				
	$sqlsc3s = "SELECT nazwa_sc FROM sciany where id = '$psc3s';";
			
			$resultsc3s = @pg_Exec($conn, $sqlsc3s);
			$psc3ps = pg_result($resultsc3s, 0, "nazwa_sc");

$sqlsuf3 = "SELECT psu3, psu3_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultsuf3 = @pg_Exec($conn, $sqlsuf3);
			$suf3s = pg_result($resultsuf3, 0, "psu3");
			$suf3bo = pg_result($resultsuf3, 0, "psu3_bo");
				
	$sqlsuf3s = "SELECT nazwa_su FROM sufit where id = '$suf3s';";
			
			$resultsuf3s = @pg_Exec($conn, $sqlsuf3s);
			$suf3ps = pg_result($resultsuf3s, 0, "nazwa_su");

$sqlwyp3 = "SELECT wyp3, wyp3_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultwyp3 = @pg_Exec($conn, $sqlwyp3);
			$wyp3s = pg_result($resultwyp3, 0, "wyp3");
			$wyp3bo = pg_result($resultwyp3, 0, "wyp3_bo");
				
	$sqlwyp3s = "SELECT nazwa_wp FROM wyposazenie where id = '$wyp3s';";
			
			$resultwyp3s = @pg_Exec($conn, $sqlwyp3s);
			$wyp3ps = pg_result($resultwyp3s, 0, "nazwa_wp");

$sqlpow4 = "SELECT pp4, pp4_bo FROM tab_mie_w where id_m = '$nu';";	
	$resultpow4 = @pg_Exec($conn, $sqlpow4);
	$pow4s = pg_result($resultpow4, 0, "pp4");
	$pow4sp = pg_result($resultpow4, 0, "pp4_bo");

$sqlpop4 = "SELECT pop4, pop4_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultpop4 = @pg_Exec($conn, $sqlpop4);
			$pop4s = pg_result($resultpop4, 0, "pop4");
			$pop4bo = pg_result($resultpop4, 0, "pop4_bo");
				
	$sqlpop4s = "SELECT nazwa_pod FROM podlogi where id = '$pop4s';";
			
			$resultpop4s = @pg_Exec($conn, $sqlpop4s);
			$pop4ps = pg_result($resultpop4s, 0, "nazwa_pod");

$sqlsc4 = "SELECT ps4, ps4_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultsc4 = @pg_Exec($conn, $sqlsc4);
			$psc4s = pg_result($resultsc4, 0, "ps4");
			$psc4bo = pg_result($resultsc4, 0, "ps4_bo");
				
	$sqlsc4s = "SELECT nazwa_sc FROM sciany where id = '$psc4s';";
			
			$resultsc4s = @pg_Exec($conn, $sqlsc4s);
			$psc4ps = pg_result($resultsc4s, 0, "nazwa_sc");

$sqlsuf4 = "SELECT psu4, psu4_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultsuf4 = @pg_Exec($conn, $sqlsuf4);
			$suf4s = pg_result($resultsuf4, 0, "psu4");
			$suf4bo = pg_result($resultsuf4, 0, "psu4_bo");
				
	$sqlsuf4s = "SELECT nazwa_su FROM sufit where id = '$suf4s';";
			
			$resultsuf4s = @pg_Exec($conn, $sqlsuf4s);
			$suf4ps = pg_result($resultsuf4s, 0, "nazwa_su");

$sqlwyp4 = "SELECT wyp4, wyp4_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultwyp4 = @pg_Exec($conn, $sqlwyp4);
			$wyp4s = pg_result($resultwyp4, 0, "wyp4");
			$wyp4bo = pg_result($resultwyp4, 0, "wyp4_bo");
				
	$sqlwyp4s = "SELECT nazwa_wp FROM wyposazenie where id = '$wyp4s';";
			
			$resultwyp4s = @pg_Exec($conn, $sqlwyp4s);
			$wyp4ps = pg_result($resultwyp4s, 0, "nazwa_wp");
			
$sqlpow5 = "SELECT pp5, pp5_bo FROM tab_mie_w where id_m = '$nu';";	
	$resultpow5 = @pg_Exec($conn, $sqlpow5);
	$pow5s = pg_result($resultpow5, 0, "pp5");
	$pow5sp = pg_result($resultpow5, 0, "pp5_bo");

$sqlpop5 = "SELECT pop5, pop5_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultpop5 = @pg_Exec($conn, $sqlpop5);
			$pop5s = pg_result($resultpop5, 0, "pop5");
			$pop5bo = pg_result($resultpop5, 0, "pop5_bo");
				
	$sqlpop5s = "SELECT nazwa_pod FROM podlogi where id = '$pop5s';";
			
			$resultpop5s = @pg_Exec($conn, $sqlpop5s);
			$pop5ps = pg_result($resultpop5s, 0, "nazwa_pod");

$sqlsc5 = "SELECT ps5, ps5_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultsc5 = @pg_Exec($conn, $sqlsc5);
			$psc5s = pg_result($resultsc5, 0, "ps5");
			$psc5bo = pg_result($resultsc5, 0, "ps5_bo");
				
	$sqlsc5s = "SELECT nazwa_sc FROM sciany where id = '$psc5s';";
			
			$resultsc5s = @pg_Exec($conn, $sqlsc5s);
			$psc5ps = pg_result($resultsc5s, 0, "nazwa_sc");

$sqlsuf5 = "SELECT psu5, psu5_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultsuf5 = @pg_Exec($conn, $sqlsuf5);
			$suf5s = pg_result($resultsuf5, 0, "psu5");
			$suf5bo = pg_result($resultsuf5, 0, "psu5_bo");
				
	$sqlsuf5s = "SELECT nazwa_su FROM sufit where id = '$suf5s';";
			
			$resultsuf5s = @pg_Exec($conn, $sqlsuf5s);
			$suf5ps = pg_result($resultsuf5s, 0, "nazwa_su");

$sqlwyp5 = "SELECT wyp5, wyp5_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultwyp5 = @pg_Exec($conn, $sqlwyp5);
			$wyp5s = pg_result($resultwyp5, 0, "wyp5");
			$wyp5bo = pg_result($resultwyp5, 0, "wyp5_bo");
				
	$sqlwyp5s = "SELECT nazwa_wp FROM wyposazenie where id = '$wyp5s';";
			
			$resultwyp5s = @pg_Exec($conn, $sqlwyp5s);
			$wyp5ps = pg_result($resultwyp5s, 0, "nazwa_wp");

$sqlpow6 = "SELECT pp6, pp6_bo FROM tab_mie_w where id_m = '$nu';";	
	$resultpow6 = @pg_Exec($conn, $sqlpow6);
	$pow6s = pg_result($resultpow6, 0, "pp6");
	$pow6sp = pg_result($resultpow6, 0, "pp6_bo");

$sqlpop6 = "SELECT pop6, pop6_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultpop6 = @pg_Exec($conn, $sqlpop6);
			$pop6s = pg_result($resultpop6, 0, "pop6");
			$pop6bo = pg_result($resultpop6, 0, "pop6_bo");
				
	$sqlpop6s = "SELECT nazwa_pod FROM podlogi where id = '$pop6s';";
			
			$resultpop6s = @pg_Exec($conn, $sqlpop6s);
			$pop6ps = pg_result($resultpop6s, 0, "nazwa_pod");

$sqlsc6 = "SELECT ps6, ps6_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultsc6 = @pg_Exec($conn, $sqlsc6);
			$psc6s = pg_result($resultsc6, 0, "ps6");
			$psc6bo = pg_result($resultsc6, 0, "ps6_bo");
				
	$sqlsc6s = "SELECT nazwa_sc FROM sciany where id = '$psc6s';";
			
			$resultsc6s = @pg_Exec($conn, $sqlsc6s);
			$psc6ps = pg_result($resultsc6s, 0, "nazwa_sc");

$sqlsuf6 = "SELECT psu6, psu6_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultsuf6 = @pg_Exec($conn, $sqlsuf6);
			$suf6s = pg_result($resultsuf6, 0, "psu6");
			$suf6bo = pg_result($resultsuf6, 0, "psu6_bo");
				
	$sqlsuf6s = "SELECT nazwa_su FROM sufit where id = '$suf6s';";
			
			$resultsuf6s = @pg_Exec($conn, $sqlsuf6s);
			$suf6ps = pg_result($resultsuf6s, 0, "nazwa_su");

$sqlwyp6 = "SELECT wyp6, wyp6_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultwyp6 = @pg_Exec($conn, $sqlwyp6);
			$wyp6s = pg_result($resultwyp6, 0, "wyp6");
			$wyp6bo = pg_result($resultwyp6, 0, "wyp6_bo");
				
	$sqlwyp6s = "SELECT nazwa_wp FROM wyposazenie where id = '$wyp6s';";
			
			$resultwyp6s = @pg_Exec($conn, $sqlwyp6s);
			$wyp6ps = pg_result($resultwyp6s, 0, "nazwa_wp");




if (($pow1sp == 't')  || ($pop1bo == 't') || ($psc1bo == 't')  || ($suf1bo == 't') || ($wyp1bo == 't') || ($pow2sp == 't')  || ($pop2bo == 't') || ($psc2bo == 't')  || ($suf2bo == 't') || ($wyp2bo == 't') || ($pow3sp == 't')  || ($pop3bo == 't') || ($psc3bo == 't')  || ($suf3bo == 't') || ($wyp3bo == 't') || ($pow4sp == 't')  || ($pop4bo == 't') || ($psc4bo == 't')  || ($suf4bo == 't') || ($wyp4bo == 't') || ($pow5sp == 't')  || ($pop5bo == 't') || ($psc5bo == 't')  || ($suf5bo == 't') || ($wyp5bo == 't') || ($pow6sp == 't')  || ($pop6bo == 't') || ($psc6bo == 't')  || ($suf6bo == 't') || ($wyp6bo == 't')) {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

echo "<tr><td colspan=\"40\" height=\"7\" bgcolor=\"#5865E5\">";
echo "<span class=\"nag1wb\">";
echo "&nbsp;Pokoje";
echo "</span>";
echo "</td></tr>";

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}

if (($pow1sp == 't')  || ($pop1bo == 't') || ($psc1bo == 't')  || ($suf1bo == 't')) {

echo "<tr>"; 

}

if ($pow1sp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pow. pokój 1:</b><br>&nbsp;$pow1s m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($pop1bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pod³oga pokój 1:</b><br>&nbsp;$pop1ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($psc1bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>¦ciana pokój 1:</b><br>&nbsp;$psc1ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($suf1bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Sufit pokój 1:</b><br>&nbsp;$suf1ps";
echo "</td>";

}

if (($pow1sp == 't')  || ($pop1bo == 't') || ($psc1bo == 't')  || ($suf1bo == 't')) {

echo "</tr>";

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}


if ($wyp1bo == 't') {

echo "<tr>";

echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Wyposa¿enie pokój 1:</b><br>&nbsp;$wyp1ps";
echo "</td>";

echo "</tr>";
}	

if ($wyp1bo == 't') {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}

if ( ($pow2sp == 't')  || ($pop2bo == 't') || ($psc2bo == 't')  || ($suf2bo == 't')) {

echo "<tr>"; 

}

if ($pow2sp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pow. pokój 2:</b><br>&nbsp;$pow2s m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($pop2bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pod³oga pokój 2:</b><br>&nbsp;$pop2ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($psc2bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>¦ciana pokój 2:</b><br>&nbsp;$psc2ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($suf2bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Sufit pokój 2:</b><br>&nbsp;$suf2ps";
echo "</td>";

}


if ( ($pow2sp == 't')  || ($pop2bo == 't') || ($psc2bo == 't')  || ($suf2bo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}

if ($wyp2bo == 't') {

echo "<tr>";

echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Wyposa¿enie pokój 2:</b><br>&nbsp;$wyp2ps";
echo "</td>";

echo "</tr>";

}	

if ($wyp2bo == 't') {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}

if ( ($pow3sp == 't')  || ($pop3bo == 't') || ($psc3bo == 't')  || ($suf3bo == 't')) {

echo "<tr>"; 
}

if ($pow3sp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pow. pokój 3:</b><br>&nbsp;$pow3s m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($pop3bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pod³oga pokój 3:</b><br>&nbsp;$pop3ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($psc3bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>¦ciana pokój 3:</b><br>&nbsp;$psc3ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($suf3bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Sufit pokój 3:</b><br>&nbsp;$suf3ps";
echo "</td>";

}


if ( ($pow3sp == 't')  || ($pop3bo == 't') || ($psc3bo == 't')  || ($suf3bo == 't')) {

echo "</tr>";

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}

if ($wyp3bo == 't') {

echo "<tr>";

echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Wyposa¿enie pokój 3:</b><br>&nbsp;$wyp3ps";
echo "</td>";

echo "</tr>";

}	

if ($wyp3bo == 't') {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}

if ( ($pow4sp == 't')  || ($pop4bo == 't') || ($psc4bo == 't')  || ($suf4bo == 't')) {
echo "<tr>"; 
}

if ($pow4sp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pow. pokój 4:</b><br>&nbsp;$pow4s m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($pop4bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pod³oga pokój 4:</b><br>&nbsp;$pop4ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($psc4bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>¦ciana pokój 4:</b><br>&nbsp;$psc4ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($suf4bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Sufit pokój 4:</b><br>&nbsp;$suf4ps";
echo "</td>";

}

if ( ($pow4sp == 't')  || ($pop4bo == 't') || ($psc4bo == 't')  || ($suf4bo == 't')) {

echo "</tr>";

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}

if ($wyp4bo == 't') {

echo "<tr>";

echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Wyposa¿enie pokój 4:</b><br>&nbsp;$wyp4ps";
echo "</td>";

echo "</tr>";

}	

if ($wyp4bo == 't') {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}
if ( ($pow5sp == 't')  || ($pop5bo == 't') || ($psc5bo == 't')  || ($suf5bo == 't')) {
echo "<tr>"; 
}
if ($pow5sp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pow. pokój 5:</b><br>&nbsp;$pow5s m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($pop5bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pod³oga pokój 5:</b><br>&nbsp;$pop5ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($psc5bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>¦ciana pokój 5:</b><br>&nbsp;$psc5ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($suf5bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Sufit pokój 5:</b><br>&nbsp;$suf5ps";
echo "</td>";

}


if ( ($pow5sp == 't')  || ($pop5bo == 't') || ($psc5bo == 't')  || ($suf5bo == 't')) {

echo "</tr>";

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}

if ($wyp5bo == 't') {

echo "<tr>";

echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Wyposa¿enie pokój 5:</b><br>&nbsp;$wyp5ps";
echo "</td>";

echo "</tr>";

}	

if ($wyp5bo == 't') {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}
if ( ($pow6sp == 't')  || ($pop6bo == 't') || ($psc6bo == 't')  || ($suf6bo == 't')) {
echo "<tr>"; 
}

if ($pow6sp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pow. pokój 6:</b><br>&nbsp;$pow6s m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($pop6bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pod³oga pokój 6:</b><br>&nbsp;$pop6ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($psc6bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>¦ciana pokój 6:</b><br>&nbsp;$psc6ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($suf6bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Sufit pokój 6:</b><br>&nbsp;$suf6ps";
echo "</td>";

}

if ( ($pow6sp == 't')  || ($pop6bo == 't') || ($psc6bo == 't')  || ($suf6bo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}

if ($wyp6bo == 't') {

echo "<tr>";

echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Wyposa¿enie pokój 6:</b><br>&nbsp;$wyp6ps";
echo "</td>";

echo "</tr>";

}	

if ($wyp6bo == 't') {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}


$sqlzd5 = "SELECT zd5 FROM tab_mie_w where id_m = '$nu';";
			
	$resultzd5s = @pg_Exec($conn, $sqlzd5);
	$zd5ms = pg_result($resultzd5s, 0, "zd5");

$sqlzd6 = "SELECT zd6 FROM tab_mie_w where id_m = '$nu';";
			
	$resultzd6s = @pg_Exec($conn, $sqlzd6);
	$zd6ms = pg_result($resultzd6s, 0, "zd6");

$sqlzd7 = "SELECT zd7 FROM tab_mie_w where id_m = '$nu';";
			
	$resultzd7s = @pg_Exec($conn, $sqlzd7);
	$zd7ms = pg_result($resultzd7s, 0, "zd7");

$sqlzd8 = "SELECT zd8 FROM tab_mie_w where id_m = '$nu';";
			
	$resultzd8s = @pg_Exec($conn, $sqlzd8);
	$zd8ms = pg_result($resultzd8s, 0, "zd8");

if (($zd5ms != '0')  || ($zd6ms != '0') || ($zd7ms != '0')  || ($zd8ms != '0')) {

echo "<tr><td colspan=\"40\" height=\"7\" bgcolor=\"#5865E5\">";
echo "<span class=\"nag1wb\">";
echo "&nbsp;Zdjêcia oferty";
echo "</span>";
echo "</td></tr>";

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
echo "<tr>"; 
}


if ($zd5ms != '0') {	

	echo "<td width=\"127\">";
	echo "<center>";
	echo "<a href=\"image.php?p=img/zd$zd5ms$ok&w=550&h=350&i=Zdjêcie%20nr\"$zd5ms\"\" onclick=\"NewWindow(this.href,'name','570','370','no');return false;\">";
	echo "<img src=\"../img/zd$zd5ms.jpg\" width=\"125\" height=\"100\" border=\"0\" alt=\"Zdjêcie nr$zd5ms\"></img></a><br><span class=\"\">";
	echo "Zdjêcie nr $zd5ms";
	echo "</span>";
	echo "</center>";
	echo "</td>";
	
	echo "<td width=\"1\" height=\"100%\">";
	echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
	echo "</td>";
}


if ($zd6ms != '0') {
	
	echo "<td width=\"127\">";
	echo "<center>";
	echo "<a href=\"image.php?p=img/zd$zd6ms$ok&w=550&h=350&i=Zdjêcie%20nr\"$zd6ms\"\" onclick=\"NewWindow(this.href,'name','570','370','no');return false;\">";
	echo "<img src=\"img/zd$zd6ms.jpg\" width=\"125\" height=\"100\" border=\"0\" alt=\"Zdjêcie nr$zd6ms\"></img></a><br><span class=\"\">";
	echo "Zdjêcie nr $zd6ms";
	echo "</span>";
	echo "</center>";
	echo "</td>";
	
	echo "<td width=\"1\" height=\"100%\">";
	echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
	echo "</td>";
	
}


if ($zd7ms != '0') {
	
	echo "<td width=\"127\">";
	echo "<center>";
	echo "<a href=\"image.php?p=img/zd$zd7ms$ok&w=550&h=350&i=Zdjêcie%20nr\"$zd7ms\"\" onclick=\"NewWindow(this.href,'name','570','370','no');return false;\">";
	echo "<img src=\"img/zd$zd7ms.jpg\" width=\"125\" height=\"100\" border=\"0\" alt=\"Zdjêcie nr$zd7ms\"></img></a><br><span class=\"\">";
	echo "Zdjêcie nr $zd7ms";
	echo "</span>";
	echo "</center>";
	echo "</td>";
	
	echo "<td width=\"1\" height=\"100%\">";
	echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
	echo "</td>";
	
}

if ($zd8ms != '0') {

	echo "<td  width=\"127\">";
	echo "<center>";
	echo "<a href=\"image.php?p=img/zd$zd8ms$ok&w=550&h=350&i=Zdjêcie%20nr\"$zd8ms\"\" onclick=\"NewWindow(this.href,'name','570','370','no');return false;\">";
	echo "<img src=\"img/zd$zd8ms.jpg\" width=\"125\" height=\"100\" border=\"0\" alt=\"Zdjêcie nr$zd8ms\"></img></a><br><span class=\"\">";
	echo "Zdjêcie nr $zd8ms";
	echo "</span>";
	echo "</center>";
	echo "</td>";

}


if (($zd5ms != '0')  || ($zd6ms != '0') || ($zd7ms != '0')  || ($zd8ms != '0')) {

echo "</tr>";

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}


$sqlkuch = "SELECT tk, tk_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultkuch = @pg_Exec($conn, $sqlkuch);
			$kuchs = pg_result($resultkuch, 0, "tk");
			$kuchbo = pg_result($resultkuch, 0, "tk_bo");
				
	$sqlkuchs = "SELECT nazwa_ku FROM typ_kuchni where id = '$kuchs';";
			
			$resultkuchs = @pg_Exec($conn, $sqlkuchs);
			$kuchps = pg_result($resultkuchs, 0, "nazwa_ku");

$sqlrokuch = "SELECT rk, rk_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultrokuch = @pg_Exec($conn, $sqlrokuch);
			$rokuchs = pg_result($resultrokuch, 0, "rk");
			$rokuchbo = pg_result($resultrokuch, 0, "rk_bo");
				
	$sqlrokuchs = "SELECT nazwa_kuch FROM rodzaj_kuchni where id = '$rokuchs';";
			
			$resultrokuchs = @pg_Exec($conn, $sqlrokuchs);
			$rokuchps = pg_result($resultrokuchs, 0, "nazwa_kuch");

$sqlpowkuch = "SELECT kp, kp_bo FROM tab_mie_w where id_m = '$nu';";	
	$resultpowkuch = @pg_Exec($conn, $sqlpowkuch);
	$powkuch = pg_result($resultpowkuch, 0, "kp");
	$powkuchp = pg_result($resultpowkuch, 0, "kp_bo");


$sqlpodkuch = "SELECT kpo, kpo_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultpodkuch = @pg_Exec($conn, $sqlpodkuch);
			$podkuch = pg_result($resultpodkuch, 0, "kpo");
			$podkuchbo = pg_result($resultpodkuch, 0, "kpo_bo");
				
	$sqlpodkuchs = "SELECT nazwa_pod FROM podlogi where id = '$podkuch';";
			
			$resultpodkuchs = @pg_Exec($conn, $sqlpodkuchs);
			$podkuchps = pg_result($resultpodkuchs, 0, "nazwa_pod");

$sqlkuchsc = "SELECT kps, kps_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultkuchsc = @pg_Exec($conn, $sqlkuchsc);
			$kuchsc = pg_result($resultkuchsc, 0, "kps");
			$kuchscbo = pg_result($resultkuchsc, 0, "kps_bo");
				
$sqlkuchscs = "SELECT nazwa_sc FROM sciany where id = '$kuchsc';";
			
			$resultkuchscs = @pg_Exec($conn, $sqlkuchscs);
			$kuchscps = pg_result($resultkuchscs, 0, "nazwa_sc");

$sqlkuchsuf = "SELECT kpsu, kpsu_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultkuchsuf = @pg_Exec($conn, $sqlkuchsuf);
			$kuchsuf = pg_result($resultkuchsuf, 0, "kpsu");
			$kuchsufbo = pg_result($resultkuchsuf, 0, "kpsu_bo");
				
	$sqlkuchsufs = "SELECT nazwa_su FROM sufit where id = '$kuchsuf';";
			
			$resultkuchsufs = @pg_Exec($conn, $sqlkuchsufs);
			$kuchsufps = pg_result($resultkuchsufs, 0, "nazwa_su");

$sqlkuchwyp = "SELECT kwyp, kwyp_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultkuchwyp = @pg_Exec($conn, $sqlkuchwyp);
			$kuchwyp = pg_result($resultkuchwyp, 0, "kwyp");
			$kuchwypbo = pg_result($resultkuchwyp, 0, "kwyp_bo");
				
	$sqlkuchwyps = "SELECT nazwa_wp FROM wyposazenie where id = '$kuchwyp';";
			
			$resultkuchwyps = @pg_Exec($conn, $sqlkuchwyps);
			$kuchwypps = pg_result($resultkuchwyps, 0, "nazwa_wp");



if (($kuchbo == 't')  || ($rokuchbo == 't') || ($powkuchp == 't')  || ($podkuchbo == 't') || ($kuchscbo == 't') || ($kuchsufbo == 't')  || ($kuchwypbo == 't')) {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
echo "<tr><td colspan=\"40\" height=\"7\" bgcolor=\"#5865E5\">";
echo "<span class=\"nag1wb\">";
echo "&nbsp;Kuchnia";
echo "</span>";
echo "</td></tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}
if ( ($kuchbo == 't')  || ($rokuchbo == 't') || ($powkuchp == 't')  || ($podkuchbo == 't')) {
echo "<tr>"; 
}
if ($kuchbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Typ kuchni:</b><br>&nbsp;$kuchps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}


if ($rokuchbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Rodzaj kuchni:</b><br>&nbsp;$rokuchps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($powkuchp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pow. kuchni:</b><br>&nbsp;$powkuch m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($podkuchbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pod³oga kuchni:</b><br>&nbsp;$podkuchps";
echo "</td>";

}


if ( ($kuchbo == 't')  || ($rokuchbo == 't') || ($powkuchp == 't')  || ($podkuchbo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}
if ( ($kuchscbo == 't') || ($kuchsufbo == 't')  || ($kuchwypbo == 't')) {
echo "<tr>";
}
if ($kuchscbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>¦ciany kuchni:</b><br>&nbsp;$kuchscps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($kuchsufbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Sufit kuchni:</b><br>&nbsp;$kuchsufps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($kuchwypbo == 't') {

echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Wyposa¿enie kuchni:</b><br>&nbsp;$kuchwypps";
echo "</td>";

}


if ( ($kuchscbo == 't') || ($kuchsufbo == 't')  || ($kuchwypbo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}


$sqlpowla = "SELECT pl, pl_bo FROM tab_mie_w where id_m = '$nu';";	
	$resultpowla = @pg_Exec($conn, $sqlpowla);
	$powla = pg_result($resultpowla, 0, "pl");
	$powlasp = pg_result($resultpowla, 0, "pl_bo");

$sqlpodla = "SELECT lpo, lpo_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultpodla = @pg_Exec($conn, $sqlpodla);
			$podla = pg_result($resultpodla, 0, "lpo");
			$podlabo = pg_result($resultpodla, 0, "lpo_bo");
				
	$sqlpodlas = "SELECT nazwa_pod FROM podlogi where id = '$podla';";
			
			$resultpodlas = @pg_Exec($conn, $sqlpodlas);
			$podlaps = pg_result($resultpodlas, 0, "nazwa_pod");

$sqlscla = "SELECT ls, ls_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultscla = @pg_Exec($conn, $sqlscla);
			$sclas = pg_result($resultscla, 0, "ls");
			$sclabo = pg_result($resultscla, 0, "ls_bo");
				
	$sqlsclas = "SELECT nazwa_sc FROM sciany where id = '$sclas';";
			
			$resultsclas = @pg_Exec($conn, $sqlsclas);
			$sclaps = pg_result($resultsclas, 0, "nazwa_sc");

$sqllasuf = "SELECT lsu, lsu_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultlasuf = @pg_Exec($conn, $sqllasuf);
			$lasuf = pg_result($resultlasuf, 0, "lsu");
			$lasufbo = pg_result($resultlasuf, 0, "lsu_bo");
				
	$sqllasufs = "SELECT nazwa_su FROM sufit where id = '$lasuf';";
			
			$resultlasufs = @pg_Exec($conn, $sqllasufs);
			$lasufps = pg_result($resultlasufs, 0, "nazwa_su");

	$sqllawyp = "SELECT lawyp, lawyp_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultlawyp = @pg_Exec($conn, $sqllawyp);
			$lawyp = pg_result($resultlawyp, 0, "lawyp");
			$lawypbo = pg_result($resultlawyp, 0, "lawyp_bo");
				
	$sqllawyps = "SELECT nazwa_wp FROM wyposazenie where id = '$lawyp';";
			
			$resultlawyps = @pg_Exec($conn, $sqllawyps);
			$lawypps = pg_result($resultlawyps, 0, "nazwa_wp");

if (($powlasp == 't')  || ($podlabo == 't') || ($sclabo == 't')  || ($lasufbo == 't') || ($lawypbo == 't')) {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
echo "<tr><td colspan=\"40\" height=\"7\" bgcolor=\"#5865E5\">";
echo "<span class=\"nag1wb\">";
echo "&nbsp;£azienka";
echo "</span>";
echo "</td></tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}
if ( ($powlasp == 't')  || ($podlabo == 't') || ($sclabo == 't')  || ($lasufbo == 't')) {
echo "<tr>"; 
}
if ($powlasp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pow. ³azienki:</b><br>&nbsp;$powla m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($podlabo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pod³oga ³azienka:</b><br>&nbsp;$podlaps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($sclabo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>¦ciany ³azienki:</b><br>&nbsp;$sclaps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($lasufbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Sufit ³azienki:</b><br>&nbsp;$lasufps";
echo "</td>";

}


if ( ($powlasp == 't')  || ($podlabo == 't') || ($sclabo == 't')  || ($lasufbo == 't')) {
echo "</tr>"; 
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}

if ($lawypbo == 't') {
echo "<tr>";

echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Wyposa¿enie ³azienki:</b><br>&nbsp;$lawypps";
echo "</td>";

echo "</tr>";

}


if ($lawypbo == 't') {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}


$sqlwc = "SELECT twc, twc_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultwc = @pg_Exec($conn, $sqlwc);
			$wcs = pg_result($resultwc, 0, "twc");
			$wcbo = pg_result($resultwc, 0, "twc_bo");
				
	$sqlwcs = "SELECT nazwa_wc FROM typ_wc where id = '$wcs';";
			
			$resultwcs = @pg_Exec($conn, $sqlwcs);
			$wcps = pg_result($resultwcs, 0, "nazwa_wc");

$sqlpowwc = "SELECT pwc, pwc_bo FROM tab_mie_w where id_m = '$nu';";	
	$resultpowwc = @pg_Exec($conn, $sqlpowwc);
	$powwc = pg_result($resultpowwc, 0, "pwc");
	$powwcsp = pg_result($resultpowwc, 0, "pwc_bo");

$sqlpodwc = "SELECT wcpo, wcpo_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultpodwc = @pg_Exec($conn, $sqlpodwc);
			$podwc = pg_result($resultpodwc, 0, "wcpo");
			$podwcbo = pg_result($resultpodwc, 0, "wcpo_bo");
				
	$sqlpodwcs = "SELECT nazwa_pod FROM podlogi where id = '$podwc';";
			
			$resultpodwcs = @pg_Exec($conn, $sqlpodwcs);
			$podwcps = pg_result($resultpodwcs, 0, "nazwa_pod");

$sqlscwc = "SELECT wcs, wcs_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultscwc = @pg_Exec($conn, $sqlscwc);
			$scwc = pg_result($resultscwc, 0, "wcs");
			$scwcbo = pg_result($resultscwc, 0, "wcs_bo");
				
	$sqlscwcs = "SELECT nazwa_sc FROM sciany where id = '$scwc';";
			
			$resultscwcs = @pg_Exec($conn, $sqlscwcs);
			$scwcps = pg_result($resultscwcs, 0, "nazwa_sc");

	$sqlwcsuf = "SELECT wcsu, wcsu_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultwcsuf = @pg_Exec($conn, $sqlwcsuf);
			$wcsuf = pg_result($resultwcsuf, 0, "wcsu");
			$wcsufbo = pg_result($resultwcsuf, 0, "wcsu_bo");
				
	$sqlwcsufs = "SELECT nazwa_su FROM sufit where id = '$wcsuf';";
			
			$resultwcsufs = @pg_Exec($conn, $sqlwcsufs);
			$wcsufps = pg_result($resultwcsufs, 0, "nazwa_su");

$sqlwcwyp = "SELECT wcwyp, wcwyp_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultwcwyp = @pg_Exec($conn, $sqlwcwyp);
			$wcwyp = pg_result($resultwcwyp, 0, "wcwyp");
			$wcwypbo = pg_result($resultwcwyp, 0, "wcwyp_bo");
				
	$sqlwcwyps = "SELECT nazwa_wp FROM wyposazenie where id = '$wcwyp';";
			
			$resultwcwyps = @pg_Exec($conn, $sqlwcwyps);
			$wcwypps = pg_result($resultwcwyps, 0, "nazwa_wp");

if (($wcbo == 't')  || ($powwcsp == 't') || ($podwcbo == 't')  || ($scwcbo == 't') || ($wcsufbo == 't') || ($wcwypbo == 't')) {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
echo "<tr><td colspan=\"40\" height=\"7\" bgcolor=\"#5865E5\">";
echo "<span class=\"nag1wb\">";
echo "&nbsp;WC";
echo "</span>";
echo "</td></tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}
if (($wcbo == 't')  || ($powwcsp == 't') || ($podwcbo == 't')  || ($scwcbo == 't')) {
echo "<tr>"; 
}
if ($wcbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Typ wc:</b><br>&nbsp;$wcps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($powwcsp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pow. wc:</b><br>&nbsp;$powwc m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($podwcbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pod³oga wc:</b><br>&nbsp;$podwcps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($scwcbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>¦ciany wc:</b><br>&nbsp;$scwcps";
echo "</td>";

}


if (($wcbo == 't')  || ($powwcsp == 't') || ($podwcbo == 't')  || ($scwcbo == 't')) {
echo "</tr>"; 
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}
if (($wcsufbo == 't') || ($wcwypbo == 't')) {
echo "<tr>"; 
}
if ($wcsufbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Sufit wc:</b><br>&nbsp;$wcsufps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($wcwypbo == 't') {

echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Wyposa¿enie wc:</b><br>&nbsp;$wcwypps";
echo "</td>";
}


if (($wcsufbo == 't') || ($wcwypbo == 't')) {
echo "</tr>"; 
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}


$sqlpowprz = "SELECT pprz, pprz_bo FROM tab_mie_w where id_m = '$nu';";	
	$resultpowprz = @pg_Exec($conn, $sqlpowprz);
	$powprz = pg_result($resultpowprz, 0, "pprz");
	$powprzsp = pg_result($resultpowprz, 0, "pprz_bo");

$sqlpodprz = "SELECT przpo, przpo_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultpodprz = @pg_Exec($conn, $sqlpodprz);
			$podprz = pg_result($resultpodprz, 0, "przpo");
			$podprzbo = pg_result($resultpodprz, 0, "przpo_bo");
				
	$sqlpodprzs = "SELECT nazwa_pod FROM podlogi where id = '$podprz';";
			
			$resultpodprzs = @pg_Exec($conn, $sqlpodprzs);
			$podprzps = pg_result($resultpodprzs, 0, "nazwa_pod");

$sqlscprz = "SELECT przs, przs_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultscprz = @pg_Exec($conn, $sqlscprz);
			$scprzs = pg_result($resultscprz, 0, "przs");
			$scprzbo = pg_result($resultscprz, 0, "przs_bo");
				
	$sqlscprzs = "SELECT nazwa_sc FROM sciany where id = '$scprzs';";
			
			$resultscprzs = @pg_Exec($conn, $sqlscprzs);
			$scprzps = pg_result($resultscprzs, 0, "nazwa_sc");

$sqlprzsuf = "SELECT przsu, przsu_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultprzsuf = @pg_Exec($conn, $sqlprzsuf);
			$przsuf = pg_result($resultprzsuf, 0, "przsu");
			$przsufbo = pg_result($resultprzsuf, 0, "przsu_bo");
				
	$sqlprzsufs = "SELECT nazwa_su FROM sufit where id = '$przsuf';";
			
			$resultprzsufs = @pg_Exec($conn, $sqlprzsufs);
			$przsufps = pg_result($resultprzsufs, 0, "nazwa_su");

	$sqlprzwyp = "SELECT przwyp, przwyp_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultprzwyp = @pg_Exec($conn, $sqlprzwyp);
			$przwyp = pg_result($resultprzwyp, 0, "przwyp");
			$przwypbo = pg_result($resultprzwyp, 0, "przwyp_bo");
				
	$sqlprzwyps = "SELECT nazwa_wp FROM wyposazenie where id = '$przwyp';";
			
			$resultprzwyps = @pg_Exec($conn, $sqlprzwyps);
			$przwypps = pg_result($resultprzwyps, 0, "nazwa_wp");


if (($powprzsp == 't')  || ($podprzbo == 't') || ($scprzbo == 't')  || ($przsufbo == 't') || ($przwypbo == 't')) {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
echo "<tr><td colspan=\"40\" height=\"7\" bgcolor=\"#5865E5\">";
echo "<span class=\"nag1wb\">";
echo "&nbsp;Przedpokój";
echo "</span>";
echo "</td></tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}
if ( ($powprzsp == 't')  || ($podprzbo == 't') || ($scprzbo == 't')  || ($przsufbo == 't')) {
echo "<tr>"; 
}
if ($powprzsp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pow. przedpokoju:</b><br>&nbsp;$powprz m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($podprzbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pod³oga przedpokój:</b><br>&nbsp;$podprzps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($scprzbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>¦ciany przedpokoju:</b><br>&nbsp;$scprzps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($przsufbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Sufit przedpokój:</b><br>&nbsp;$przsufps";
echo "</td>";

}

if ( ($powprzsp == 't')  || ($podprzbo == 't') || ($scprzbo == 't')  || ($przsufbo == 't')) {
echo "</tr>"; 
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}

if ($przwypbo == 't') {
echo "<tr>";

echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Wyposa¿enie przedpokoju:</b><br>&nbsp;$przwypps";
echo "</td>";

echo "</tr>";

}


if ($przwypbo == 't') {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}



	$sqlbal = "SELECT tb, tb_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultbal = @pg_Exec($conn, $sqlbal);
			$bals = pg_result($resultbal, 0, "tb");
			$balbo = pg_result($resultbal, 0, "tb_bo");
				
	$sqlbals = "SELECT nazwa_ba FROM typ_balkonu where id = '$bals';";
			
			$resultbals = @pg_Exec($conn, $sqlbals);
			$balps = pg_result($resultbals, 0, "nazwa_ba");

$sqlpowbal = "SELECT pb, pb_bo FROM tab_mie_w where id_m = '$nu';";	
	$resultpowbal = @pg_Exec($conn, $sqlpowbal);
	$powbal = pg_result($resultpowbal, 0, "pb");
	$powbalsp = pg_result($resultpowbal, 0, "pb_bo");

$sqlpodbal = "SELECT pob, pob_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultpodbal = @pg_Exec($conn, $sqlpodbal);
			$podbal = pg_result($resultpodbal, 0, "pob");
			$podbalbo = pg_result($resultpodbal, 0, "pob_bo");
				
	$sqlpodbals = "SELECT nazwa_pod FROM podlogi where id = '$podbal';";
			
			$resultpodbals = @pg_Exec($conn, $sqlpodbals);
			$podbalps = pg_result($resultpodbals, 0, "nazwa_pod");

$sqlscbal = "SELECT sb, sb_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultscbal = @pg_Exec($conn, $sqlscbal);
			$scbals = pg_result($resultscbal, 0, "sb");
			$scbalbo = pg_result($resultscbal, 0, "sb_bo");
				
	$sqlscbals = "SELECT nazwa_sc FROM sciany where id = '$scbals';";
			
			$resultscbals = @pg_Exec($conn, $sqlscbals);
			$scbalps = pg_result($resultscbals, 0, "nazwa_sc");

if (($balbo == 't')  || ($powbalsp == 't') || ($podbalbo == 't')  || ($scbalbo == 't')) {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
echo "<tr><td colspan=\"40\" height=\"7\" bgcolor=\"#5865E5\">";
echo "<span class=\"nag1wb\">";
echo "&nbsp;Balkon";
echo "</span>";
echo "</td></tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}
if (($balbo == 't')  || ($powbalsp == 't') || ($podbalbo == 't')  || ($scbalbo == 't')) {
echo "<tr>"; 
}
if ($balbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Typ balkonu:</b><br>&nbsp;$balps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($powbalsp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pow. balkonu:</b><br>&nbsp;$powbal m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($podbalbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pod³oga balkon:</b><br>&nbsp;$podbalps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}


if ($scbalbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>¦ciany balkon:</b><br>&nbsp;$scbalps";
echo "</td>";

}


if (($balbo == 't')  || ($powbalsp == 't') || ($podbalbo == 't')  || ($scbalbo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}



$sqlzd9 = "SELECT zd9 FROM tab_mie_w where id_m = '$nu';";
			
	$resultzd9s = @pg_Exec($conn, $sqlzd9);
	$zd9ms = pg_result($resultzd9s, 0, "zd9");

$sqlzd10 = "SELECT zd10 FROM tab_mie_w where id_m = '$nu';";
			
	$resultzd10s = @pg_Exec($conn, $sqlzd10);
	$zd10ms = pg_result($resultzd10s, 0, "zd10");

$sqlzd11 = "SELECT zd11 FROM tab_mie_w where id_m = '$nu';";
			
	$resultzd11s = @pg_Exec($conn, $sqlzd11);
	$zd11ms = pg_result($resultzd11s, 0, "zd11");

$sqlzd12 = "SELECT zd12 FROM tab_mie_w where id_m = '$nu';";
			
	$resultzd12s = @pg_Exec($conn, $sqlzd12);
	$zd12ms = pg_result($resultzd12s, 0, "zd12");

if (($zd9ms != '0')  || ($zd10ms != '0') || ($zd11ms != '0')  || ($zd12ms != '0')) {

echo "<tr><td colspan=\"40\" height=\"7\" bgcolor=\"#5865E5\">";
echo "<span class=\"nag1wb\">";
echo "&nbsp;Zdjêcia oferty";
echo "</span>";
echo "</td></tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
echo "<tr>"; 
}


if ($zd9ms != '0') {
	
	echo "<td width=\"127\">";
	echo "<center>";
	echo "<a href=\"image.php?p=img/zd$zd9ms$ok&w=550&h=350&i=Zdjêcie%20nr\"$zd9ms\"\" onclick=\"NewWindow(this.href,'name','570','370','no');return false;\">";
	echo "<img src=\"../img/zd$zd9ms.jpg\" width=\"125\" height=\"100\" border=\"0\" alt=\"Zdjêcie nr$zd9ms\"></img></a><br><span class=\"\">";
	echo "Zdjêcie nr $zd9ms";
	echo "</span>";
	echo "</center>";
	echo "</td>";
	
	echo "<td width=\"1\" height=\"100%\">";
	echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
	echo "</td>";
}


if ($zd10ms != '0') {
	
	echo "<td width=\"127\">";
	echo "<center>";
	echo "<a href=\"image.php?p=img/zd$zd10ms$ok&w=550&h=350&i=Zdjêcie%20nr\"$zd10ms\"\" onclick=\"NewWindow(this.href,'name','570','370','no');return false;\">";
	echo "<img src=\"img/zd$zd10ms.jpg\" width=\"125\" height=\"100\" border=\"0\" alt=\"Zdjêcie nr$zd10ms\"></img></a><br><span class=\"\">";
	echo "Zdjêcie nr $zd10ms";
	echo "</span>";
	echo "</center>";
	echo "</td>";
	
	echo "<td width=\"1\" height=\"100%\">";
	echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
	echo "</td>";
}

if ($zd11ms != '0') {
	
	echo "<td width=\"127\">";
	echo "<center>";
	echo "<a href=\"image.php?p=img/zd$zd11ms$ok&w=550&h=350&i=Zdjêcie%20nr\"$zd11ms\"\" onclick=\"NewWindow(this.href,'name','570','370','no');return false;\">";
	echo "<img src=\"img/zd$zd11ms.jpg\" width=\"125\" height=\"100\" border=\"0\" alt=\"Zdjêcie nr$zd11ms\"></img></a><br><span class=\"\">";
	echo "Zdjêcie nr $zd11ms";
	echo "</span>";
	echo "</center>";
	echo "</td>";
	
	echo "<td width=\"1\" height=\"100%\">";
	echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
	echo "</td>";
	
}

if ($zd12ms != '0') {

	echo "<td  width=\"127\">";
	echo "<center>";
	echo "<a href=\"image.php?p=img/zd$zd12ms$ok&w=550&h=350&i=Zdjêcie%20nr\"$zd12ms\"\" onclick=\"NewWindow(this.href,'name','570','370','no');return false;\">";
	echo "<img src=\"img/zd$zd12ms.jpg\" width=\"125\" height=\"100\" border=\"0\" alt=\"Zdjêcie nr$zd12ms\"></img></a><br><span class=\"\">";
	echo "Zdjêcie nr $zd12ms";
	echo "</span>";
	echo "</center>";
	echo "</td>";

}


if (($zd9ms != '0')  || ($zd10ms != '0') || ($zd11ms != '0')  || ($zd12ms != '0')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}


	$sqlrobu = "SELECT rb, rb_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultrobu = @pg_Exec($conn, $sqlrobu);
			$robus = pg_result($resultrobu, 0, "rb");
			$robubo = pg_result($resultrobu, 0, "rb_bo");
				
	$sqlrobus = "SELECT nazwa_b FROM rodzaj_b where id = '$robus';";
			
			$resultrobus = @pg_Exec($conn, $sqlrobus);
			$robups = pg_result($resultrobus, 0, "nazwa_b");

$sqltechb = "SELECT teb, teb_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resulttechb = @pg_Exec($conn, $sqltechb);
			$techbs = pg_result($resulttechb, 0, "teb");
			$techbbo = pg_result($resulttechb, 0, "teb_bo");
				
	$sqltechbs = "SELECT nazwat_b FROM techno_b where id = '$techbs';";
			
			$resulttechbs = @pg_Exec($conn, $sqltechbs);
			$techbps = pg_result($resulttechbs, 0, "nazwat_b");

$sqlmatb = "SELECT mat, mat_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultmatb = @pg_Exec($conn, $sqlmatb);
			$matbs = pg_result($resultmatb, 0, "mat");
			$matbbo = pg_result($resultmatb, 0, "mat_bo");
				
	$sqlmatbs = "SELECT nazwa_m FROM material_b where id = '$matbs';";
			
			$resultmatbs = @pg_Exec($conn, $sqlmatbs);
			$matbps = pg_result($resultmatbs, 0, "nazwa_m");

$sqlrokbu = "SELECT rokb, rokb_bo FROM tab_mie_w where id_m = '$nu';";	
	$resultrokbu = @pg_Exec($conn, $sqlrokbu);
	$rokbus = pg_result($resultrokbu, 0, "rokb");
	$rokbusp = pg_result($resultrokbu, 0, "rokb_bo");

$sqlwysok = "SELECT wo, wo_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultwysok = @pg_Exec($conn, $sqlwysok);
			$wysoks = pg_result($resultwysok, 0, "wo");
			$wysokbo = pg_result($resultwysok, 0, "wo_bo");
				
	$sqlwysoks = "SELECT nazwa_wy FROM wystawka_o where id = '$wysoks';";
			
			$resultwysoks = @pg_Exec($conn, $sqlwysoks);
			$wysokps = pg_result($resultwysoks, 0, "nazwa_wy");	

$sqlwyspo = "SELECT ws, ws_bo FROM tab_mie_w where id_m = '$nu';";	
	$resultwyspo = @pg_Exec($conn, $sqlwyspo);
	$wyspos = pg_result($resultwyspo, 0, "ws");
	$wysposp = pg_result($resultwyspo, 0, "ws_bo");	


	$sqlokna = "SELECT okn, okn_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultokna = @pg_Exec($conn, $sqlokna);
			$oknas = pg_result($resultokna, 0, "okn");
			$oknabo = pg_result($resultokna, 0, "okn_bo");
				
	$sqloknas = "SELECT nazwa_ok FROM okna where id = '$oknas';";
			
			$resultoknas = @pg_Exec($conn, $sqloknas);
			$oknaps = pg_result($resultoknas, 0, "nazwa_ok");


if (($robubo == 't')  || ($techbbo == 't') || ($matbbo == 't')  || ($rokbusp == 't') || ($wysokbo == 't')  || ($wysposp == 't') || ($oknabo == 't')) {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
echo "<tr><td colspan=\"40\" height=\"7\" bgcolor=\"#5865E5\">";
echo "<span class=\"nag1wb\">";
echo "&nbsp;Informacje techniczne";
echo "</span>";
echo "</td></tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}
if (($robubo == 't')  || ($techbbo == 't') || ($matbbo == 't')  || ($rokbusp == 't')) {
echo "<tr>"; 
}
if ($robubo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Rodzaj budynku:</b><br>&nbsp;$robups";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($techbbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Tech. budowlana:</b><br>&nbsp;$techbps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($matbbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Materia³ budowlany:</b><br>&nbsp;$matbps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($rokbusp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Rok budowy:</b><br>&nbsp;$rokbus";
echo "</td>";

}

if (($robubo == 't')  || ($techbbo == 't') || ($matbbo == 't')  || ($rokbusp == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}
if (($wysokbo == 't')  || ($wysposp == 't') || ($oknabo == 't')) {
echo "<tr>";
}
if ($wysokbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Wystawka okien:</b><br>&nbsp;$wysokps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($wysposp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Wysoko¶æ pom.:</b><br>&nbsp;$wyspos m";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($oknabo == 't') {

echo "<td height=\"25\" colspan = \"20\">";
echo "&nbsp;<b>Okna:</b><br>&nbsp;$oknaps";
echo "</td>";

}


if (($wysokbo == 't')  || ($wysposp == 't') || ($oknabo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}


	$sqlogrze = "SELECT ogrz, ogrz_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultogrze = @pg_Exec($conn, $sqlogrze);
			$ogrzes = pg_result($resultogrze, 0, "ogrz");
			$ogrzebo = pg_result($resultogrze, 0, "ogrz_bo");
				
	$sqlogrzes = "SELECT nazwa_grz FROM ogrzewanie where id = '$ogrzes';";
			
			$resultogrzes = @pg_Exec($conn, $sqlogrzes);
			$ogrzeps = pg_result($resultogrzes, 0, "nazwa_grz");
	
$sqlciepwo = "SELECT cwod, cwod_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultciepwo = @pg_Exec($conn, $sqlciepwo);
			$ciepwos = pg_result($resultciepwo, 0, "cwod");
			$ciepwobo = pg_result($resultciepwo, 0, "cwod_bo");
				
	$sqlciepwos = "SELECT nazwa_wo FROM ciepla_woda where id = '$ciepwos';";
			
			$resultciepwos = @pg_Exec($conn, $sqlciepwos);
			$ciepwops = pg_result($resultciepwos, 0, "nazwa_wo");

$sqlsila = "SELECT si, si_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultsila = @pg_Exec($conn, $sqlsila);
			$silas = pg_result($resultsila, 0, "si");
			$silabo = pg_result($resultsila, 0, "si_bo");
				
	$sqlsilas = "SELECT nazwa_si FROM sila where id = '$silas';";
			
			$resultsilas = @pg_Exec($conn, $sqlsilas);
			$silaps = pg_result($resultsilas, 0, "nazwa_si");

$sqlgaz = "SELECT gaz, gaz_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultgaz = @pg_Exec($conn, $sqlgaz);
			$gazs = pg_result($resultgaz, 0, "gaz");
			$gazbo = pg_result($resultgaz, 0, "gaz_bo");
				
	$sqlgazs = "SELECT nazwa_g FROM gaz where id = '$gazs';";
			
			$resultgazs = @pg_Exec($conn, $sqlgazs);
			$gazps = pg_result($resultgazs, 0, "nazwa_g");

$sqlkanal = "SELECT kan, kan_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultkanal = @pg_Exec($conn, $sqlkanal);
			$kanals = pg_result($resultkanal, 0, "kan");
			$kanalbo = pg_result($resultkanal, 0, "kan_bo");
				
	$sqlkanals = "SELECT nazwa_ka FROM kanaliza where id = '$kanals';";
			
			$resultkanals = @pg_Exec($conn, $sqlkanals);
			$kanalps = pg_result($resultkanals, 0, "nazwa_ka");

$sqltel = "SELECT tel, tel_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resulttel = @pg_Exec($conn, $sqltel);
			$tels = pg_result($resulttel, 0, "tel");
			$telbo = pg_result($resulttel, 0, "tel_bo");
				
	$sqltels = "SELECT nazwa_te FROM telefon where id = '$tels';";
			
			$resulttels = @pg_Exec($conn, $sqltels);
			$telps = pg_result($resulttels, 0, "nazwa_te");

$sqlkabl = "SELECT sk, sk_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultkabl = @pg_Exec($conn, $sqlkabl);
			$kabls = pg_result($resultkabl, 0, "sk");
			$kablbo = pg_result($resultkabl, 0, "sk_bo");
				
	$sqlkabls = "SELECT nazwa_kab FROM kablowa where id = '$kabls';";
			
			$resultkabls = @pg_Exec($conn, $sqlkabls);
			$kablps = pg_result($resultkabls, 0, "nazwa_kab");

$sqlantena = "SELECT ant, ant_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultantena = @pg_Exec($conn, $sqlantena);
			$antenas = pg_result($resultantena, 0, "ant");
			$antenabo = pg_result($resultantena, 0, "ant_bo");
				
	$sqlantenas = "SELECT nazwa_an FROM antena where id = '$antenas';";
			
			$resultantenas = @pg_Exec($conn, $sqlantenas);
			$antenaps = pg_result($resultantenas, 0, "nazwa_an");

$sqlsiec = "SELECT siec, siec_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultsiec = @pg_Exec($conn, $sqlsiec);
			$siecs = pg_result($resultsiec, 0, "siec");
			$siecbo = pg_result($resultsiec, 0, "siec_bo");
				
	$sqlsiecs = "SELECT nazwa_siec FROM siec_inter where id = '$siecs';";
			
			$resultsiecs = @pg_Exec($conn, $sqlsiecs);
			$siecps = pg_result($resultsiecs, 0, "nazwa_siec");



if (($ogrzebo == 't')  || ($ciepwobo == 't') || ($silabo == 't') || ($gazbo == 't') || ($kanalbo == 't')  || ($telbo == 't') || ($kablbo == 't') || ($antenabo == 't') || ($siecbo == 't')) {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
echo "<tr><td colspan=\"40\" height=\"7\" bgcolor=\"#5865E5\">";
echo "<span class=\"nag1wb\">";
echo "&nbsp;Media";
echo "</span>";
echo "</td></tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}
if (($ogrzebo == 't')  || ($ciepwobo == 't') || ($silabo == 't') || ($gazbo == 't')) {
echo "<tr>"; 
}
if ($ogrzebo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Ogrzewanie:</b><br>&nbsp;$ogrzeps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($ciepwobo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Ciep³a woda:</b><br>&nbsp;$ciepwops";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($silabo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Si³a:</b><br>&nbsp;$silaps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($gazbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Gaz:</b><br>&nbsp;$gazps";
echo "</td>";

}

if (($ogrzebo == 't')  || ($ciepwobo == 't') || ($silabo == 't') || ($gazbo == 't')) {
echo "</tr>"; 
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}
if (($kanalbo == 't')  || ($telbo == 't') || ($kablbo == 't') || ($antenabo == 't')) {
echo "<tr>"; 
}
if ($kanalbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Kanalizacja:</b><br>&nbsp;$kanalps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($telbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Telefon:</b><br>&nbsp;$telps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($kablbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Sieæ kablowa:</b><br>&nbsp;$kablps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($antenabo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Antena:</b><br>&nbsp;$antenaps";
echo "</td>";

}


if (($kanalbo == 't')  || ($telbo == 't') || ($kablbo == 't') || ($antenabo == 't')) {
echo "</tr>"; 
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}

if ($siecbo == 't') {
echo "<tr>"; 
echo "<td height=\"25\" colspan = \"20\">";
echo "&nbsp;<b>Sieæ internetowa:</b><br>&nbsp;$siecps";
echo "</td>";
echo "</tr>";
}



if ($siecbo == 't') {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}


	$sqlosiedle = "SELECT oss, oss_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultosiedle = @pg_Exec($conn, $sqlosiedle);
			$osiedle = pg_result($resultosiedle, 0, "oss");
			$osiedlebo = pg_result($resultosiedle, 0, "oss_bo");
				
	$sqlosiedles = "SELECT nazwa_os FROM osiedle_st where id = '$osiedle';";
			
			$resultosiedles = @pg_Exec($conn, $sqlosiedles);
			$osiedleps = pg_result($resultosiedles, 0, "nazwa_os");
	
$sqldfon = "SELECT dom, dom_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultdfon = @pg_Exec($conn, $sqldfon);
			$dfon = pg_result($resultdfon, 0, "dom");
			$dfonbo = pg_result($resultdfon, 0, "dom_bo");
				
	$sqldfons = "SELECT nazwa_do FROM domofon where id = '$dfon';";
			
			$resultdfons = @pg_Exec($conn, $sqldfons);
			$dfonps = pg_result($resultdfons, 0, "nazwa_do");

$sqldanty = "SELECT drz, drz_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultdanty = @pg_Exec($conn, $sqldanty);
			$danty = pg_result($resultdanty, 0, "drz");
			$dantybo = pg_result($resultdanty, 0, "drz_bo");
				
	$sqldantys = "SELECT nazwa_dz FROM drzwi_anty where id = '$danty';";
			
			$resultdantys = @pg_Exec($conn, $sqldantys);
			$dantyps = pg_result($resultdantys, 0, "nazwa_dz");

$sqlrolety = "SELECT rol, rol_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultrolety = @pg_Exec($conn, $sqlrolety);
			$rolety = pg_result($resultrolety, 0, "rol");
			$roletybo = pg_result($resultrolety, 0, "rol_bo");
				
	$sqlroletys = "SELECT nazwa_ro FROM rolety where id = '$rolety';";
			
			$resultroletys = @pg_Exec($conn, $sqlroletys);
			$roletyps = pg_result($resultroletys, 0, "nazwa_ro");

$sqlkamery = "SELECT kv, kv_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultkamery = @pg_Exec($conn, $sqlkamery);
			$kamery = pg_result($resultkamery, 0, "kv");
			$kamerybo = pg_result($resultkamery, 0, "kv_bo");
				
	$sqlkamerys = "SELECT nazwa_kam FROM kamery where id = '$kamery';";
			
			$resultkamerys = @pg_Exec($conn, $sqlkamerys);
			$kameryps = pg_result($resultkamerys, 0, "nazwa_kam");

$sqlalarm = "SELECT al, al_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultalarm = @pg_Exec($conn, $sqlalarm);
			$alarm = pg_result($resultalarm, 0, "al");
			$alarmbo = pg_result($resultalarm, 0, "al_bo");
				
	$sqlalarms = "SELECT nazwa_al FROM alarm where id = '$alarm';";
			
			$resultalarms = @pg_Exec($conn, $sqlalarms);
			$alarmps = pg_result($resultalarms, 0, "nazwa_al");

$sqlokanty = "SELECT okan, okan_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultokanty = @pg_Exec($conn, $sqlokanty);
			$okanty = pg_result($resultokanty, 0, "okan");
			$okantybo = pg_result($resultokanty, 0, "okan_bo");
				
	$sqlokantys = "SELECT nazwao_anty FROM okna_anty where id = '$okanty';";
			
			$resultokantys = @pg_Exec($conn, $sqlokantys);
			$okantyps = pg_result($resultokantys, 0, "nazwao_anty");


if (($osiedlebo == 't')  || ($dfonbo == 't') || ($dantybo == 't') || ($roletybo == 't') || ($kamerybo == 't') || ($alarmbo == 't') || ($okantybo == 't')) {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
echo "<tr><td colspan=\"40\" height=\"7\" bgcolor=\"#5865E5\">";
echo "<span class=\"nag1wb\">";
echo "&nbsp;Zabezpieczenia";
echo "</span>";
echo "</td></tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}
if (($osiedlebo == 't')  || ($dfonbo == 't') || ($dantybo == 't') || ($roletybo == 't')) {
echo "<tr>"; 
}
if ($osiedlebo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Osiedle strze¿one:</b><br>&nbsp;$osiedleps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($dfonbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Domofon:</b><br>&nbsp;$dfonps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($dantybo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Drzwi antyw³am.:</b><br>&nbsp;$dantyps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($roletybo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Rolety:</b><br>&nbsp;$roletyps";
echo "</td>";

}


if (($osiedlebo == 't')  || ($dfonbo == 't') || ($dantybo == 't') || ($roletybo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}
if (($kamerybo == 't') || ($alarmbo == 't') || ($okantybo == 't')) {
echo "<tr>"; 
}
if ($kamerybo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Kamery:</b><br>&nbsp;$kameryps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($alarmbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Alarm:</b><br>&nbsp;$alarmps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($okantybo == 't') {

echo "<td height=\"25\" colspan = \"20\">";
echo "&nbsp;<b>Okna antyw³am.:</b><br>&nbsp;$okantyps";
echo "</td>";
}

if (($kamerybo == 't') || ($alarmbo == 't') || ($okantybo == 't')) {
echo "</tr>"; 
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}


$sqlklim = "SELECT klim, klim_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultklim = @pg_Exec($conn, $sqlklim);
			$klima = pg_result($resultklim, 0, "klim");
			$klimabo = pg_result($resultklim, 0, "klim_bo");
				
	$sqlklims = "SELECT nazwa_kli FROM klima where id = '$klima';";
			
			$resultklims = @pg_Exec($conn, $sqlklims);
			$klimps = pg_result($resultklims, 0, "nazwa_kli");

$sqlkomi = "SELECT komi, komi_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultkomi = @pg_Exec($conn, $sqlkomi);
			$komin = pg_result($resultkomi, 0, "komi");
			$kominbo = pg_result($resultkomi, 0, "komi_bo");
				
	$sqlkomis = "SELECT nazwa_ko FROM kominek where id = '$komin';";
			
			$resultkomis = @pg_Exec($conn, $sqlkomis);
			$kominps = pg_result($resultkomis, 0, "nazwa_ko");

$sqljac = "SELECT jac, jac_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultjac = @pg_Exec($conn, $sqljac);
			$jacc = pg_result($resultjac, 0, "jac");
			$jacbo = pg_result($resultjac, 0, "jac_bo");
				
	$sqljacs = "SELECT nazwa_ja FROM jaccuzi where id = '$jacc';";
			
			$resultjacs = @pg_Exec($conn, $sqljacs);
			$jacps = pg_result($resultjacs, 0, "nazwa_ja");

$sqlogr = "SELECT ogr, ogr_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultogr = @pg_Exec($conn, $sqlogr);
			$ogr = pg_result($resultogr, 0, "ogr");
			$ogrbo = pg_result($resultogr, 0, "ogr_bo");
				
	$sqlogrs = "SELECT nazwa_ogr FROM ogrodek where id = '$ogr';";
			
			$resultogrs = @pg_Exec($conn, $sqlogrs);
			$ogrps = pg_result($resultogrs, 0, "nazwa_ogr");

$sqlpiwn = "SELECT piw, piw_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultpiwn = @pg_Exec($conn, $sqlpiwn);
			$piwn = pg_result($resultpiwn, 0, "piw");
			$piwnbo = pg_result($resultpiwn, 0, "piw_bo");
				
	$sqlpiwns = "SELECT nazwa_pi FROM piwnica where id = '$piwn';";
			
			$resultpiwns = @pg_Exec($conn, $sqlpiwns);
			$piwnps = pg_result($resultpiwns, 0, "nazwa_pi");

$sqlzsyp = "SELECT zs, zs_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultzsyp = @pg_Exec($conn, $sqlzsyp);
			$zsyp = pg_result($resultzsyp, 0, "zs");
			$zsypbo = pg_result($resultzsyp, 0, "zs_bo");
				
	$sqlzsyps = "SELECT nazwa_zs FROM zsyp where id = '$zsyp';";
			
			$resultzsyps = @pg_Exec($conn, $sqlzsyps);
			$zsypps = pg_result($resultzsyps, 0, "nazwa_zs");

$sqlwin = "SELECT wi, wi_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultwin = @pg_Exec($conn, $sqlwin);
			$wind = pg_result($resultwin, 0, "wi");
			$windbo = pg_result($resultwin, 0, "wi_bo");
				
	$sqlwins = "SELECT nazwa_wi FROM winda where id = '$wind';";
			
			$resultwins = @pg_Exec($conn, $sqlwins);
			$windps = pg_result($resultwins, 0, "nazwa_wi");

	$sqlmiej = "SELECT mip, mip_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultmiej = @pg_Exec($conn, $sqlmiej);
			$miej = pg_result($resultmiej, 0, "mip");
			$miejbo = pg_result($resultmiej, 0, "mip_bo");
				
	$sqlmiejs = "SELECT nazwa_pa FROM parking where id = '$miej';";
			
			$resultmiejs = @pg_Exec($conn, $sqlmiejs);
			$miejps = pg_result($resultmiejs, 0, "nazwa_pa");

$sqludog = "SELECT unie, unie_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultudog = @pg_Exec($conn, $sqludog);
			$udog = pg_result($resultudog, 0, "unie");
			$udogbo = pg_result($resultudog, 0, "unie_bo");
				
	$sqludogs = "SELECT nazwa_nie FROM niepelno where id = '$udog';";
			
			$resultudogs = @pg_Exec($conn, $sqludogs);
			$udogps = pg_result($resultudogs, 0, "nazwa_nie");





if (($klimabo == 't') || ($kominbo == 't') || ($jacbo == 't') || ($ogrbo == 't') || ($piwnbo == 't') || ($zsypbo == 't') || ($windbo == 't') || ($miejbo == 't') || ($udogbo == 't')) {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
echo "<tr><td colspan=\"40\" height=\"7\" bgcolor=\"#5865E5\">";
echo "<span class=\"nag1wb\">";
echo "&nbsp;Udogodnienia";
echo "</span>";
echo "</td></tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}
if (($klimabo == 't') || ($kominbo == 't') || ($jacbo == 't') || ($ogrbo == 't')) {
echo "<tr>"; 
}
if ($klimabo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Klimatyzacja:</b><br>&nbsp;$klimps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($kominbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Kominek:</b><br>&nbsp;$kominps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($jacbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Jaccuzi:</b><br>&nbsp;$jacps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($ogrbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Ogródek:</b><br>&nbsp;$ogrps";
echo "</td>";

}

if (($klimabo == 't') || ($kominbo == 't') || ($jacbo == 't') || ($ogrbo == 't')) {
echo "</tr>"; 
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}
if (($piwnbo == 't') || ($zsypbo == 't') || ($windbo == 't') || ($miejbo == 't')) {
echo "<tr>"; 
}
if ($piwnbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Piwnica:</b><br>&nbsp;$piwnps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($zsypbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Zsyp:</b><br>&nbsp;$zsypps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($windbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Winda:</b><br>&nbsp;$windps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($miejbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Miejsca parkingowe:</b><br>&nbsp;$miejps";
echo "</td>";

}


if (($piwnbo == 't') || ($zsypbo == 't') || ($windbo == 't') || ($miejbo == 't')) {
echo "</tr>"; 
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}


if ($udogbo == 't') {
echo "<tr>"; 
echo "<td height=\"25\" colspan = \"20\">";
echo "&nbsp;<b>Udog. dla niepe³nosp.:</b><br>&nbsp;$udogps";
echo "</td>";
echo "</tr>";
}

if ($udogbo == 't') {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}


$sqluli = "SELECT tdr, tdr_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultuli = @pg_Exec($conn, $sqluli);
			$uli = pg_result($resultuli, 0, "tdr");
			$ulibo = pg_result($resultuli, 0, "tdr_bo");
				
	$sqlulis = "SELECT nazwa_ul FROM typ_ulicy where id = '$uli';";
			
			$resultulis = @pg_Exec($conn, $sqlulis);
			$ulips = pg_result($resultulis, 0, "nazwa_ul");

$sqlnadr = "SELECT ndr, ndr_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultnadr = @pg_Exec($conn, $sqlnadr);
			$nadr = pg_result($resultnadr, 0, "ndr");
			$nadrbo = pg_result($resultnadr, 0, "ndr_bo");
				
	$sqlnadrs = "SELECT nazwa_na FROM nawierzchnia where id = '$nadr';";
			
			$resultnadrs = @pg_Exec($conn, $sqlnadrs);
			$nadrps = pg_result($resultnadrs, 0, "nazwa_na");

$sqlkomu = "SELECT kom, kom_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultkomu = @pg_Exec($conn, $sqlkomu);
			$komu = pg_result($resultkomu, 0, "kom");
			$komubo = pg_result($resultkomu, 0, "kom_bo");
				
	$sqlkomus = "SELECT nazwa_kom FROM komunikacja where id = '$komu';";
			
			$resultkomus = @pg_Exec($conn, $sqlkomus);
			$komups = pg_result($resultkomus, 0, "nazwa_kom");

$sqlodcm = "SELECT odlce, odlce_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultodcm = @pg_Exec($conn, $sqlodcm);
			$odcm = pg_result($resultodcm, 0, "odlce");
			$odcmbo = pg_result($resultodcm, 0, "odlce_bo");

$sqlodsp = "SELECT odlprz, odlprz_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultodsp = @pg_Exec($conn, $sqlodsp);
			$odsp = pg_result($resultodsp, 0, "odlprz");
			$odspbo = pg_result($resultodsp, 0, "odlprz_bo");

$sqlotocz = "SELECT otnie, otnie_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultotocz = @pg_Exec($conn, $sqlotocz);
			$otocz = pg_result($resultotocz, 0, "otnie");
			$otoczbo = pg_result($resultotocz, 0, "otnie_bo");
				
	$sqlotoczs = "SELECT nazwa_oto FROM otoczenie where id = '$otocz';";
			
			$resultotoczs = @pg_Exec($conn, $sqlotoczs);
			$otoczps = pg_result($resultotoczs, 0, "nazwa_oto");	

if (($ulibo == 't') || ($nadrbo == 't') || ($komubo == 't') || ($odcmbo == 't') || ($odspbo == 't') || ($otoczbo == 't')) {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
echo "<tr><td colspan=\"40\" height=\"7\" bgcolor=\"#5865E5\">";
echo "<span class=\"nag1wb\">";
echo "&nbsp;Usytuowanie";
echo "</span>";
echo "</td></tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}
if (($ulibo == 't') || ($nadrbo == 't') || ($komubo == 't') || ($odcmbo == 't')) {
echo "<tr>"; 
}
if ($ulibo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Typ ulicy/drogi:</b><br>&nbsp;$ulips";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($nadrbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Nawierzchnia drogi:</b><br>&nbsp;$nadrps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($komubo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Komunikacja:</b><br>&nbsp;$komups";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($odcmbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Odl. od centrum:</b><br>&nbsp;$odcm m";
echo "</td>";

}



if (($ulibo == 't') || ($nadrbo == 't') || ($komubo == 't') || ($odcmbo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}
if (($odspbo == 't') || ($otoczbo == 't')) {
echo "<tr>"; 
}
if ($odspbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Odl. od szko³y:</b><br>&nbsp;$odsp m";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($otoczbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Otoczenie nieuci±¿l.:</b><br>&nbsp;$otoczps";
echo "</td>";
}


if (($odspbo == 't') || ($otoczbo == 't')) {
echo "</tr>"; 
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}


$sqllas = "SELECT las, las_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultlas = @pg_Exec($conn, $sqllas);
			$las = pg_result($resultlas, 0, "las");
			$lasbo = pg_result($resultlas, 0, "las_bo");
				
	$sqllass = "SELECT nazwa_la FROM las where id = '$las';";
			
			$resultlass = @pg_Exec($conn, $sqllass);
			$lasps = pg_result($resultlass, 0, "nazwa_la");

$sqlpark = "SELECT park, park_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultpark = @pg_Exec($conn, $sqlpark);
			$park = pg_result($resultpark, 0, "park");
			$parkbo = pg_result($resultpark, 0, "park_bo");
				
	$sqlparks = "SELECT nazwa_par FROM park where id = '$park';";
			
			$resultparks = @pg_Exec($conn, $sqlparks);
			$parkps = pg_result($resultparks, 0, "nazwa_par");

$sqlrzeka = "SELECT rzeka, rzeka_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultrzeka = @pg_Exec($conn, $sqlrzeka);
			$rzeka = pg_result($resultrzeka, 0, "rzeka");
			$rzekabo = pg_result($resultrzeka, 0, "rzeka_bo");
				
	$sqlrzekas = "SELECT nazwa_rz FROM rzeka where id = '$rzeka';";
			
			$resultrzekas = @pg_Exec($conn, $sqlrzekas);
			$rzekaps = pg_result($resultrzekas, 0, "nazwa_rz");

$sqljezioro = "SELECT jezioro, jezioro_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultjezioro = @pg_Exec($conn, $sqljezioro);
			$jezioro = pg_result($resultjezioro, 0, "jezioro");
			$jeziorobo = pg_result($resultjezioro, 0, "jezioro_bo");
				
	$sqljezioros = "SELECT nazwa_je FROM jezioro where id = '$jezioro';";
			
			$resultjezioros = @pg_Exec($conn, $sqljezioros);
			$jeziorops = pg_result($resultjezioros, 0, "nazwa_je");

$sqlstaw = "SELECT staw, staw_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultstaw = @pg_Exec($conn, $sqlstaw);
			$staw = pg_result($resultstaw, 0, "staw");
			$stawbo = pg_result($resultstaw, 0, "staw_bo");
				
	$sqlstaws = "SELECT nazwa_sta FROM staw where id = '$staw';";
			
			$resultstaws = @pg_Exec($conn, $sqlstaws);
			$stawps = pg_result($resultstaws, 0, "nazwa_sta");

$sqlgory = "SELECT gory, gory_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultgory = @pg_Exec($conn, $sqlgory);
			$gory = pg_result($resultgory, 0, "gory");
			$gorybo = pg_result($resultgory, 0, "gory_bo");
				
	$sqlgorys = "SELECT nazwa_go FROM gory where id = '$gory';";
			
			$resultgorys = @pg_Exec($conn, $sqlgorys);
			$goryps = pg_result($resultgorys, 0, "nazwa_go");

$sqlfit = "SELECT fc, fc_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultfit = @pg_Exec($conn, $sqlfit);
			$fit = pg_result($resultfit, 0, "fc");
			$fitbo = pg_result($resultfit, 0, "fc_bo");
				
	$sqlfits = "SELECT nazwa_fi FROM fitness where id = '$fit';";
			
			$resultfits = @pg_Exec($conn, $sqlfits);
			$fitps = pg_result($resultfits, 0, "nazwa_fi");

$sqlplac = "SELECT pz, pz_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultplac = @pg_Exec($conn, $sqlplac);
			$plac = pg_result($resultplac, 0, "pz");
			$placbo = pg_result($resultplac, 0, "pz_bo");
				
	$sqlplacs = "SELECT nazwa_zab FROM plac_zabaw where id = '$plac';";
			
			$resultplacs = @pg_Exec($conn, $sqlplacs);
			$placps = pg_result($resultplacs, 0, "nazwa_zab");

$sqlsauna = "SELECT sau, sau_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultsauna = @pg_Exec($conn, $sqlsauna);
			$sauna = pg_result($resultsauna, 0, "sau");
			$saunabo = pg_result($resultsauna, 0, "sau_bo");
				
	$sqlsaunas = "SELECT nazwa_sa FROM sauna where id = '$sauna';";
			
			$resultsaunas = @pg_Exec($conn, $sqlsaunas);
			$saunaps = pg_result($resultsaunas, 0, "nazwa_sa");

$sqlbasen = "SELECT bas, bas_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultbasen = @pg_Exec($conn, $sqlbasen);
			$basen = pg_result($resultbasen, 0, "bas");
			$basenbo = pg_result($resultbasen, 0, "bas_bo");
				
	$sqlbasens = "SELECT nazwa_bas FROM basen where id = '$basen';";
			
			$resultbasens = @pg_Exec($conn, $sqlbasens);
			$basenps = pg_result($resultbasens, 0, "nazwa_bas");

$sqlkort = "SELECT kt, kt_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultkort = @pg_Exec($conn, $sqlkort);
			$kort = pg_result($resultkort, 0, "kt");
			$kortbo = pg_result($resultkort, 0, "kt_bo");
				
	$sqlkorts = "SELECT nazwa_kor FROM kort_te where id = '$kort';";
			
			$resultkorts = @pg_Exec($conn, $sqlkorts);
			$kortps = pg_result($resultkorts, 0, "nazwa_kor");


if (($lasbo == 't') || ($parkbo == 't') || ($rzekabo == 't') || ($jeziorobo == 't') || ($stawbo == 't') || ($gorybo == 't') || ($fitbo == 't') || ($placbo == 't') || ($saunabo == 't') || ($basenbo == 't') || ($kortbo == 't')) {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
echo "<tr><td colspan=\"40\" height=\"7\" bgcolor=\"#5865E5\">";
echo "<span class=\"nag1wb\">";
echo "&nbsp;Okolice";
echo "</span>";
echo "</td></tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}
if (($lasbo == 't') || ($parkbo == 't') || ($rzekabo == 't') || ($jeziorobo == 't')) {
echo "<tr>"; 
}
if ($lasbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Las w pobli¿u:</b><br>&nbsp;$lasps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($parkbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Park w pobli¿u:</b><br>&nbsp;$parkps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($rzekabo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Rzeka w pobli¿u:</b><br>&nbsp;$rzekaps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($jeziorobo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Jezioro w pobli¿u:</b><br>&nbsp;$jeziorops";
echo "</td>";

}

if (($lasbo == 't') || ($parkbo == 't') || ($rzekabo == 't') || ($jeziorobo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}

if (($stawbo == 't') || ($gorybo == 't') || ($fitbo == 't') || ($placbo == 't')) {
echo "<tr>";
}
if ($stawbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Staw w pobli¿u:</b><br>&nbsp;$stawps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($gorybo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Góry w pobli¿u:</b><br>&nbsp;$goryps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($fitbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Fitness club:</b><br>&nbsp;$fitps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($placbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Plac zabaw:</b><br>&nbsp;$placps";
echo "</td>";

}

if (($stawbo == 't') || ($gorybo == 't') || ($fitbo == 't') || ($placbo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}
if (($saunabo == 't') || ($basenbo == 't') || ($kortbo == 't')) {
echo "<tr>";
}
if ($saunabo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Sauna:</b><br>&nbsp;$saunaps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($basenbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Basen:</b><br>&nbsp;$basenps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($kortbo == 't') {

echo "<td height=\"25\" colspan = \"20\">";
echo "&nbsp;<b>Kort tenisowy:</b><br>&nbsp;$kortps";
echo "</td>";

}

if (($saunabo == 't') || ($basenbo == 't') || ($kortbo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}


$sqlstand = "SELECT std, std_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultstand = @pg_Exec($conn, $sqlstand);
			$stand = pg_result($resultstand, 0, "std");
			$standbo = pg_result($resultstand, 0, "std_bo");
				
	$sqlstands = "SELECT nazwa_stan FROM standard where id = '$stand';";
			
			$resultstands = @pg_Exec($conn, $sqlstands);
			$standps = pg_result($resultstands, 0, "nazwa_stan");

$sqlstan = "SELECT sta, sta_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultstan = @pg_Exec($conn, $sqlstan);
			$stan = pg_result($resultstan, 0, "sta");
			$stanbo = pg_result($resultstan, 0, "sta_bo");
				
	$sqlstans = "SELECT nazwa_sst FROM stan where id = '$stan';";
			
			$resultstans = @pg_Exec($conn, $sqlstans);
			$stanps = pg_result($resultstans, 0, "nazwa_sst");

$sqlprzek = "SELECT moprz, moprz_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultprzek = @pg_Exec($conn, $sqlprzek);
			$przek = pg_result($resultprzek, 0, "moprz");
			$przekbo = pg_result($resultprzek, 0, "moprz_bo");
				
	$sqlprzeks = "SELECT nazwa_przek FROM przeksztalcenie where id = '$przek';";
			
			$resultprzeks = @pg_Exec($conn, $sqlprzeks);
			$przekps = pg_result($resultprzeks, 0, "nazwa_przek");

$sqldodop = "SELECT dodopis, dodopis_bo FROM tab_mie_w where id_m = '$nu';";
			
			$resultdodop = @pg_Exec($conn, $sqldodop);
			$dodop = pg_result($resultdodop, 0, "dodopis");
			$dodopbo = pg_result($resultdodop, 0, "dodopis_bo");



if (($standbo == 't') || ($stanbo == 't') || ($przekbo == 't') || ($dodopbo == 't')) {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
echo "<tr><td colspan=\"40\" height=\"7\" bgcolor=\"#5865E5\">";
echo "<span class=\"nag1wb\">";
echo "&nbsp;Informacje dodatkowe";
echo "</span>";
echo "</td></tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}

if (($standbo == 't') || ($stanbo == 't') || ($przekbo == 't')) {
echo "<tr>"; 
}

if ($standbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Standard:</b><br>&nbsp;$standps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($stanbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Stan:</b><br>&nbsp;$stanps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($przekbo == 't') {

echo "<td height=\"25\" colspan = \"20\">";
echo "&nbsp;<b>Mo¿liwo¶c przekszta³cenia na:</b><br>&nbsp;$przekps";
echo "</td>";

}

if (($standbo == 't') || ($stanbo == 't') || ($przekbo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}


if ($dodopbo == 't') {
echo "<tr>";
echo "<td height=\"25\" colspan = \"20\">";
echo "&nbsp;<b>Dodatkowy opis:</b><br>&nbsp;$dodop";
echo "</td>";
echo "</tr>";
}


if ($dodopbo == 't') {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}



echo "</table>";
echo "</center>";



}

?>