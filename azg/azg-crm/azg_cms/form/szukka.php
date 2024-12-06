<?
$identbiura = "1";
$ok = "_b";

include "../concfg.inc";

if (!$conn){
	echo "Przykro nam w tej chwili baza ofert jest chwilowo nieczynna.\n";
	exit;
}	

if ($action == 'szukka') {

if ($rodza == 'M') {

if ($powstart == '')(
$pows1 = "";
}
else {
$pows1 = "powuzyt_m >= $powstart and";
}

if ($powstop == '')(
$pows2 = "";
}
else {
$pows2 = "powuzyt_m <= $powstop and";
}

if ($docen == '')(
$dc1 = "";
}
else {
$dc1 = "cm_m <= $docen and";
}

}


$sql0 = "select id_m from tab_mie where $pows1 $pows2 $dc1 loka = '1' and pokaz = 't' and usunm = 'f' and id_b = '$identbiura' order by cm_m;";

$result_set0 = pg_Exec($conn, $sql0);

$rows0 = pg_NumRows($result_set0);		// liczba zwroconych wierszy

if ((!$result_set0) || ($rows0 > 0)) { 

echo "<center>";
echo "<span class=\"nag2b\">";
echo "<b>SPRZEDA¯ MIESZKAÑ</b>";
echo "<br>";
echo "<b>(OPOLE)</b>";
echo "</span>";
echo "</center>";
}


$sql1 = "select id_m, no_m, lok_m, powuzyt_m, np_m, cm_m, zd1, wyl_m, sm_m, std from tab_mie where $pows1 $pows2 $dc1 lp_m = '1' and loka = '1' and pokaz = 't' and usunm = 'f' and id_b = '$identbiura' order by cm_m;";

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
		$np1 = pg_result($result_set1, $i, "np_m");
		$cena1 = pg_result($result_set1, $i, "cm_m");
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

$tekst1 = "<a href = \"$PHP_SELF?action=sprzedazmzd&nu=$id1\">wiêcej ...</a>";

if ($np1 == '3') {
$pietrop1 = "III p.";
}

if ($np1 == '2') {
$pietrop1 = "II p.";
}

if ($np1 == '1') {
$pietrop1 = "I p.";
}

if ($np1 == '0') {
$pietrop1 = "";
}

if ($np1 > 3) {
$pietrop1 = "";
}

echo "<tr>";

if ($zdj1 != 0) {
	echo "<td width=\"126\" height=\"63\" rowspan = \"4\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=sprzedazmzd&nu=$id1\">";
	echo "<img src=\"../img/zd$zdj1.jpg\" width=\"90\" height=\"60\" border=\"0\" class=\"ira\" alt=\"Zdjêcie nr$zdj1\"></img></a><br>";
	echo "</center>";
	echo "</td>";
}
else {
	echo "<td width=\"126\" height=\"63\" rowspan = \"4\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=sprzedazmzd&nu=$id1\">";
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


$sql2 = "select id_m, no_m,  lok_m, powuzyt_m, np_m, cm_m, zd1, wyl_m, sm_m, std from tab_mie where $pows1 $pows2 $dc1 lp_m = '2' and loka = '1' and pokaz = 't' and usunm = 'f' and id_b = '$identbiura' order by cm_m;";

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

$tekst2 = "<a href = \"$PHP_SELF?action=sprzedazmzd&nu=$id2\">wiêcej ...</a>";


if ($np2 == '3') {
$pietrop2 = "III p.";
}

if ($np2 == '2') {
$pietrop2 = "II p.";
}

if ($np2 == '1') {
$pietrop2 = "I p.";
}

if ($np2 == '0') {
$pietrop2 = "";
}

if ($np2 > 3) {
$pietrop2 = "";
}

echo "<tr>";
if ($zdj2 != 0) {
	echo "<td width=\"126\" height=\"63\" rowspan = \"4\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=sprzedazmzd&nu=$id2\">";
	echo "<img src=\"../img/zd$zdj2.jpg\" width=\"90\" height=\"60\" border=\"0\" class=\"ira\" alt=\"Zdjêcie nr$zdj2\"></img></a><br>";
	echo "</center>";
	echo "</td>";
}
else {
	echo "<td width=\"126\" height=\"63\" rowspan = \"4\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=sprzedazmzd&nu=$id2\">";
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

$sql3 = "select id_m, no_m,  lok_m, powuzyt_m, np_m, cm_m, zd1, wyl_m, sm_m, std from tab_mie where $pows1 $pows2 $dc1 lp_m = '3' and loka = '1' and pokaz = 't' and usunm = 'f' and id_b = '$identbiura' order by cm_m;";

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
		$np3 = pg_result($result_set3, $i, "np_m");
		$cena3 = pg_result($result_set3, $i, "cm_m");
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

$tekst3 = "<a href = \"$PHP_SELF?action=sprzedazmzd&nu=$id3\">wiêcej ...</a>";


if ($np3 == '3') {
$pietrop3 = "III p.";
}

if ($np3 == '2') {
$pietrop3 = "II p.";
}

if ($np3 == '1') {
$pietrop3 = "I p.";
}

if ($np3 == '0') {
$pietrop3 = "";
}

if ($np3 > 3) {
$pietrop3 = "";
}

echo "<tr>";

if ($zdj3 != 0) {
	echo "<td width=\"126\" height=\"63\" rowspan = \"4\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=sprzedazmzd&nu=$id3\">";
	echo "<img src=\"../img/zd$zdj3.jpg\" width=\"90\" height=\"60\" border=\"0\" class=\"ira\" alt=\"Zdjêcie nr$zdj3\"></img></a><br>";
	echo "</center>";
	echo "</td>";
}
else {
	echo "<td width=\"126\" height=\"63\" rowspan = \"4\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=sprzedazmzd&nu=$id3\">";
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

$sql4 = "select id_m, no_m, lok_m, powuzyt_m, np_m, cm_m, zd1, wyl_m, sm_m, std from tab_mie where $pows1 $pows2 $dc1 lp_m = '4' and loka = '1' and pokaz = 't' and usunm = 'f' and id_b = '$identbiura' order by cm_m;";

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
		$np4 = pg_result($result_set4, $i, "np_m");
		$cena4 = pg_result($result_set4, $i, "cm_m");
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

$tekst4 = "<a href = \"$PHP_SELF?action=sprzedazmzd&nu=$id4\">wiêcej ...</a>";

if ($np4 == '3') {
$pietrop4 = "III p.";
}

if ($np4 == '2') {
$pietrop4 = "II p.";
}

if ($np4 == '1') {
$pietrop4 = "I p.";
}

if ($np4 == '0') {
$pietrop4 = "";
}

if ($np4 > 3) {
$pietrop4 = "";
}

echo "<tr>";
if ($zdj4 != 0) {
	echo "<td width=\"126\" height=\"63\" rowspan = \"4\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=sprzedazmzd&nu=$id4\">";
	echo "<img src=\"../img/zd$zdj4.jpg\" width=\"90\" height=\"60\" border=\"0\" class=\"ira\" alt=\"Zdjêcie nr$zdj4\"></img></a><br>";
	echo "</center>";
	echo "</td>";
}
else {
	echo "<td width=\"126\" height=\"63\" rowspan = \"4\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=sprzedazmzd&nu=$id4\">";
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

$sql5 = "select id_m, no_m, lok_m, powuzyt_m, np_m, cm_m, zd1, wyl_m, sm_m, std from tab_mie where $pows1 $pows2 $dc1 lp_m = '5' and loka = '1' and pokaz = 't' and usunm = 'f' and  id_b = '$identbiura' order by cm_m;";

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
		$np5 = pg_result($result_set5, $i, "np_m");
		$cena5 = pg_result($result_set5, $i, "cm_m");
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

$tekst5 = "<a href = \"$PHP_SELF?action=sprzedazmzd&nu=$id5\">wiêcej ...</a>";

if ($np5 == '3') {
$pietrop5 = "III p.";
}

if ($np5 == '2') {
$pietrop5 = "II p.";
}

if ($np5 == '1') {
$pietrop5 = "I p.";
}

if ($np5 == '0') {
$pietrop5 = "";
}

if ($np5 > 3) {
$pietrop5 = "";
}

echo "<tr>";
if ($zdj5 != 0) {
	echo "<td width=\"126\" height=\"63\" rowspan = \"4\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=sprzedazmzd&nu=$id5\">";
	echo "<img src=\"../img/zd$zdj5.jpg\" width=\"90\" height=\"60\" border=\"0\" class=\"ira\" alt=\"Zdjêcie nr$zdj5\"></img></a><br>";
	echo "</center>";
	echo "</td>";
}
else {
	echo "<td width=\"126\" height=\"63\" rowspan = \"4\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=sprzedazmzd&nu=$id5\">";
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

$cena5 = number_format($cena5,'', '.', '.');

echo "<td width=\"130\" align = \"left\">$wpstatp5";
echo "<b>Cena:</b> $cena5 z³.";
echo "$wpstatk5</td>";

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

$sql6 = "select id_m, no_m, lok_m, powuzyt_m, np_m, cm_m, zd1, wyl_m, sm_m, std from tab_mie where $pows1 $pows2 $dc1 lp_m = '6' and loka = '1' and pokaz = 't' and usunm = 'f' and id_b = '$identbiura' order by cm_m;";

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
		$np6 = pg_result($result_set6, $i, "np_m");
		$cena6 = pg_result($result_set6, $i, "cm_m");
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

$tekst6 = "<a href = \"$PHP_SELF?action=sprzedazmzd&nu=$id6\">wiêcej ...</a>";

if ($np6 == '3') {
$pietrop6 = "III p.";
}

if ($np6 == '2') {
$pietrop6 = "II p.";
}

if ($np6 == '1') {
$pietrop6 = "I p.";
}

if ($np6 == '0') {
$pietrop6 = "";
}

if ($np6 > 3) {
$pietrop6 = "";
}

echo "<tr>";
if ($zdj6 != 0) {
	echo "<td width=\"126\" height=\"63\" rowspan = \"4\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=sprzedazmzd&nu=$id6\">";
	echo "<img src=\"../img/zd$zdj6.jpg\" width=\"90\" height=\"60\" border=\"0\" class=\"ira\" alt=\"Zdjêcie nr$zdj6\"></img></a><br>";
	echo "</center>";
	echo "</td>";
}
else {
	echo "<td width=\"126\" height=\"63\" rowspan = \"4\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=sprzedazmzd&nu=$id6\">";
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



$sql01 = "select id_m from tab_mie where $pows1 $pows2 $dc1 loka = '2' and pokaz = 't' and usunm = 'f' and id_b = '$identbiura' order by datawp_m desc;";

$result_set01 = pg_Exec($conn, $sql01);

$rows01 = pg_NumRows($result_set01);		// liczba zwroconych wierszy

if ((!$result_set01) || ($rows01 > 0)) { 

echo "<center>";
echo "<span class=\"nag2b\">";
echo "<b>SPRZEDA¯ MIESZKAÑ</b>";
echo "<br>";
echo "<b>(POZA OPOLEM)</b>";
echo "</span>";
echo "</center>";
}

$sql7 = "select id_m, no_m, lok_m, powuzyt_m, np_m, cm_m, zd1, wyl_m, sm_m, std from tab_mie where $pows1 $pows2 $dc1 lp_m = '1' and loka = '2' and pokaz = 't' and usunm = 'f' and id_b = '$identbiura' order by cm_m;";

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
		$std7 = pg_result($result_set7, $i, "std");
		$lok7 = pg_result($result_set7, $i, "lok_m");
		$powuzyt7 = pg_result($result_set7, $i, "powuzyt_m");
		$np7 = pg_result($result_set7, $i, "np_m");
		$cena7 = pg_result($result_set7, $i, "cm_m");
		$zdj7 = pg_result($result_set7, $i, "zd1");
		$wylacznosc7 = pg_result($result_set7, $i, "wyl_m");
		$status7 = pg_result($result_set7, $i, "sm_m");
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

$tekst7 = "<a href = \"$PHP_SELF?action=sprzedazmzd&nu=$id7\">wiêcej ...</a>";

if ($np7 == '3') {
$pietrop7 = "III p.";
}

if ($np7 == '2') {
$pietrop7 = "II p.";
}

if ($np7 == '1') {
$pietrop7 = "I p.";
}

if ($np7 == '0') {
$pietrop7 = "";
}

if ($np7 > 3) {
$pietrop7 = "";
}

echo "<tr>";

if ($zdj7 != 0) {
	echo "<td width=\"126\" height=\"63\" rowspan = \"4\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=sprzedazmzd&nu=$id7\">";
	echo "<img src=\"../img/zd$zdj7.jpg\" width=\"90\" height=\"60\" border=\"0\" alt=\"Zdjêcie nr$zdj7\" class=\"ira\"></img></a><br>";
	echo "</center>";
	echo "</td>";
}
else {
	echo "<td width=\"126\" height=\"63\" rowspan = \"4\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=sprzedazmzd&nu=$id7\">";
	echo "<img src=\"../img/zd0.jpg\" width=\"90\" height=\"60\" border=\"0\" alt=\"Brak zdjêcia\" class=\"ira\"></img></a><br>";
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


$sql8 = "select id_m, no_m, lok_m, powuzyt_m, np_m, cm_m, zd1, wyl_m, sm_m, std from tab_mie where $pows1 $pows2 $dc1 lp_m = '2' and loka = '2' and pokaz = 't' and usunm = 'f' and id_b = '$identbiura' order by cm_m;";

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
		$np8 = pg_result($result_set8, $i, "np_m");
		$cena8 = pg_result($result_set8, $i, "cm_m");
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

$tekst8 = "<a href = \"$PHP_SELF?action=sprzedazmzd&nu=$id8\">wiêcej ...</a>";

if ($np8 == '3') {
$pietrop8 = "III p.";
}

if ($np8 == '2') {
$pietrop8 = "II p.";
}

if ($np8 == '1') {
$pietrop8 = "I p.";
}

if ($np8 == '0') {
$pietrop8 = "";
}

if ($np8 > 3) {
$pietrop8 = "";
}

echo "<tr>";

if ($zdj8 != 0) {
	echo "<td width=\"126\" height=\"63\" rowspan = \"4\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=sprzedazmzd&nu=$id8\">";
	echo "<img src=\"../img/zd$zdj8.jpg\" width=\"90\" height=\"60\" border=\"0\" alt=\"Zdjêcie nr$zdj8\" class=\"ira\"></img></a><br>";
	echo "</center>";
	echo "</td>";
}
else {
	echo "<td width=\"126\" height=\"63\" rowspan = \"4\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=sprzedazmzd&nu=$id8\">";
	echo "<img src=\"../img/zd0.jpg\" width=\"90\" height=\"60\" border=\"0\" alt=\"Brak zdjêcia\" class=\"ira\"></img></a><br>";
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

$sql9 = "select id_m, no_m, lok_m, powuzyt_m, np_m, cm_m, zd1, wyl_m, sm_m, std from tab_mie where $pows1 $pows2 $dc1 lp_m = '3' and loka = '2' and pokaz = 't' and usunm = 'f' and id_b = '$identbiura' order by cm_m;";

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
		$np9 = pg_result($result_set9, $i, "np_m");
		$cena9 = pg_result($result_set9, $i, "cm_m");
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

$tekst9 = "<a href = \"$PHP_SELF?action=sprzedazmzd&nu=$id9\">wiêcej ...</a>";

if ($np9 == '3') {
$pietrop9 = "III p.";
}

if ($np9 == '2') {
$pietrop9 = "II p.";
}

if ($np9 == '1') {
$pietrop9 = "I p.";
}

if ($np9 == '0') {
$pietrop9 = "";
}

if ($np9 > 3) {
$pietrop9 = "";
}

echo "<tr>";
if ($zdj9 != 0) {
	echo "<td width=\"126\" height=\"63\" rowspan = \"4\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=sprzedazmzd&nu=$id9\">";
	echo "<img src=\"../img/zd$zdj9.jpg\" width=\"90\" height=\"60\" border=\"0\" alt=\"Zdjêcie nr$zdj9\" class=\"ira\"></img></a><br>";
	echo "</center>";
	echo "</td>";
}
else {
	echo "<td width=\"126\" height=\"63\" rowspan = \"4\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=sprzedazmzd&nu=$id9\">";
	echo "<img src=\"../img/zd0.jpg\" width=\"90\" height=\"60\" border=\"0\" alt=\"Brak zdjêcia\" class=\"ira\"></img></a><br>";
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

$sql10 = "select id_m, no_m,  lok_m, powuzyt_m, np_m, cm_m, zd1, wyl_m, sm_m, std from tab_mie where $pows1 $pows2 $dc1 lp_m = '4' and loka = '2' and pokaz = 't' and usunm = 'f' and id_b = '$identbiura' order by cm_m;";

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
		$np10 = pg_result($result_set10, $i, "np_m");
		$cena10 = pg_result($result_set10, $i, "cm_m");
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

$tekst10 = "<a href = \"$PHP_SELF?action=sprzedazmzd&nu=$id10\">wiêcej ...</a>";

if ($np10 == '3') {
$pietrop10 = "III p.";
}

if ($np10 == '2') {
$pietrop10 = "II p.";
}

if ($np10 == '1') {
$pietrop10 = "I p.";
}

if ($np10 == '0') {
$pietrop10 = "";
}

if ($np10 > 3) {
$pietrop10 = "";
}

echo "<tr>";
if ($zdj10 != 0) {
	echo "<td width=\"126\" height=\"63\" rowspan = \"4\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=sprzedazmzd&nu=$id10\">";
	echo "<img src=\"../img/zd$zdj10.jpg\" width=\"90\" height=\"60\" border=\"0\" alt=\"Zdjêcie nr$zdj10\" class=\"ira\"></img></a><br>";
	echo "</center>";
	echo "</td>";
}
else {
	echo "<td width=\"126\" height=\"63\" rowspan = \"4\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=sprzedazmzd&nu=$id10\">";
	echo "<img src=\"../img/zd0.jpg\" width=\"90\" height=\"60\" border=\"0\" alt=\"Brak zdjêcia\" class=\"ira\"></img></a><br>";
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

$sql11 = "select id_m, no_m, lok_m, powuzyt_m, np_m, cm_m, zd1, wyl_m, sm_m, std from tab_mie where $pows1 $pows2 $dc1 lp_m = '5' and loka = '2' and pokaz = 't' and usunm = 'f' and  id_b = '$identbiura' order by cm_;";

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
		$np11 = pg_result($result_set11, $i, "np_m");
		$cena11 = pg_result($result_set11, $i, "cm_m");
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

$tekst11 = "<a href = \"$PHP_SELF?action=sprzedazmzd&nu=$id11\">wiêcej ...</a>";

if ($np11 == '3') {
$pietrop11 = "III p.";
}

if ($np11 == '2') {
$pietrop11 = "II p.";
}

if ($np11 == '1') {
$pietrop11 = "I p.";
}

if ($np11 == '0') {
$pietrop11 = "";
}

if ($np11 > 3) {
$pietrop11 = "";
}

echo "<tr>";
if ($zdj11 != 0) {
	echo "<td width=\"126\" height=\"63\" rowspan = \"4\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=sprzedazmzd&nu=$id11\">";
	echo "<img src=\"../img/zd$zdj11.jpg\" width=\"90\" height=\"60\" border=\"0\" alt=\"Zdjêcie nr$zdj11\" class=\"ira\"></img></a><br>";
	echo "</center>";
	echo "</td>";
}
else {
	echo "<td width=\"126\" height=\"63\" rowspan = \"4\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=sprzedazmzd&nu=$id11\">";
	echo "<img src=\"../img/zd0.jpg\" width=\"90\" height=\"60\" border=\"0\" alt=\"Brak zdjêcia\" class=\"ira\"></img></a><br>";
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

$sql12 = "select id_m, no_m, lok_m, powuzyt_m, np_m, cm_m, zd1, wyl_m, sm_m, std from tab_mie where $pows1 $pows2 $dc1 lp_m = '6' and loka = '2' and pokaz = 't' and usunm = 'f' and id_b = '$identbiura' order by cm_m;";

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
		$np12 = pg_result($result_set12, $i, "np_m");
		$cena12 = pg_result($result_set12, $i, "cm_m");
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

$tekst12 = "<a href = \"$PHP_SELF?action=sprzedazmzd&nu=$id12\">wiêcej ...</a>";

if ($np12 == '3') {
$pietrop12 = "III p.";
}

if ($np12 == '2') {
$pietrop12 = "II p.";
}

if ($np12 == '1') {
$pietrop12 = "I p.";
}

if ($np12 == '0') {
$pietrop12 = "";
}

if ($np12 > 3) {
$pietrop12 = "";
}

echo "<tr>";
if ($zdj12 != 0) {
	echo "<td width=\"126\" height=\"63\" rowspan = \"4\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=sprzedazmzd&nu=$id12\">";
	echo "<img src=\"../img/zd$zdj12.jpg\" width=\"90\" height=\"60\" border=\"0\" alt=\"Zdjêcie nr$zdj12\" class=\"ira\"></img></a><br>";
	echo "</center>";
	echo "</td>";
}
else {
	echo "<td width=\"126\" height=\"63\" rowspan = \"4\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=sprzedazmzd&nu=$id12\">";
	echo "<img src=\"../img/zd0.jpg\" width=\"90\" height=\"60\" border=\"0\" alt=\"Brak zdjêcia\" class=\"ira\"></img></a><br>";
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
}


?>