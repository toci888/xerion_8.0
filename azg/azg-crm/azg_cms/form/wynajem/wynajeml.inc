<?
$identbiura = "1";
$ok = "_b";
// polaczenie z baza
include "../concfg.inc";


if ($action == 'wynajeml') {

$sql0 = "select id_d from tab_lok_w where loka = '1' and pokaz = 't' and usund = 'f' and id_b = '$identbiura' order by datawp_d desc;";

$result_set0 = pg_Exec($conn, $sql0);

$rows0 = pg_NumRows($result_set0);		// liczba zwroconych wierszy

if ((!$result_set0) || ($rows0 > 0)) { 

echo "<center>";
echo "<span class=\"nag2b\">";
echo "<b>WYNAJEM LOKALI</b>";
echo "<br>";
echo "<b>(OPOLE)</b>";
echo "</span>";
echo "</center>";
}

$sql1 = "select id_d, no_d, lok_d, powuzyt_d, powdzi_d, cd, cm2_d, zd1, wyl_d, sm_d from tab_lok_w where loka = '1' and rof_d  = '1' and pokaz = 't' and usund = 'f' and id_b = '$identbiura' order by datawp_d desc;";

$result_set1 = pg_Exec($conn, $sql1);

$rows1 = pg_NumRows($result_set1);		// liczba zwroconych wierszy

if ((!$result_set1) || ($rows1 > 0)) { 

echo "<br>";
echo "<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" frame border=\"0\">";
echo "<tr><td><img src=\"img/black.gif\" width=\"100%\" height=\"1\" border=\"0\" alt=\"\"></img></td></tr>";
echo "<tr valign=\"left\"><td height=\"7\" bgcolor=\"#5865E5\">";
echo "<center>";
echo "<span class=\"nag1wb\">";
echo "Lokale handlowo - us³ugowe";
echo "</span>";
echo "</center>";
echo "</td></tr>";
echo "<tr><td><img src=\"img/black.gif\" width=\"100%\" height=\"1\" border=\"0\" alt=\"\"></img></td></tr>";
echo "</table>";


echo "<table width=\"516\" cellpadding=\"0\" cellspacing=\"0\" frame border=\"0\">";
	for ($i=0; $i < $rows1; $i++) {

		$id1 = pg_result($result_set1, $i, "id_d");
		$nod1 = pg_result($result_set1, $i, "no_d");
		$lok1 = pg_result($result_set1, $i, "lok_d");
		$powuzyt1 = pg_result($result_set1, $i, "powuzyt_d");
		$powdz1 = pg_result($result_set1, $i, "powdzi_d");
		$cena1 = pg_result($result_set1, $i, "cd");
		$dod1 = pg_result($result_set1, $i, "cm2_d");
		$zdj1 = pg_result($result_set1, $i, "zd1");
		$wylacznosc1 = pg_result($result_set1, $i, "wyl_d");
		$status1 = pg_result($result_set1, $i, "sm_d");
		

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

$tekst1 = "<a href = \"$PHP_SELF?action=wynajemlzd&nu=$id1\">wiêcej ...</a>";

echo "<tr>";
if ($zdj1 != 0) {
	echo "<td width=\"126\" height=\"63\" rowspan = \"5\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=wynajemlzd&nu=$id1\">";
	echo "<img src=\"../img/zd$zdj1.jpg\" width=\"90\" height=\"60\" border=\"0\" alt=\"Zdjêcie nr$zdj1\" class=\"ira\"></img></a><br>";
	echo "</center>";
	echo "</td>";
}
else {
	echo "<td width=\"126\" height=\"63\" rowspan = \"5\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=wynajemlzd&nu=$id1\">";
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
echo "<b>Pow. dzia³ki:</b> $powdz1 ar.";
echo "$wpstatk1</td>";

$cena1 = number_format($cena1,'', '.', '.');

echo "<td width=\"130\" align = \"left\">$wpstatp1";
echo "<b>Cena:</b> $cena1 z³.";
echo "$wpstatk1</td>";

echo "</tr>";

echo "<tr>";

echo "<td colspan=\"3\" align = \"left\">$wpstatp1";
echo "<b>Dodatkowe op³aty:</b> $dod1";
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

echo "<tr><td colspan=\"4\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}
echo "</table>";
}

$sql2 = "select id_d, no_d, lok_d, powuzyt_d, powdzi_d, cd, cm2_d, zd1, wyl_d, sm_d from tab_lok_w where loka = '1' and rof_d  = '2' and pokaz = 't' and usund = 'f' and id_b = '$identbiura' order by datawp_d desc;";

$result_set2 = pg_Exec($conn, $sql2);

$rows2 = pg_NumRows($result_set2);		// liczba zwroconych wierszy

if ((!$result_set2) || ($rows2 > 0)) { 

echo "<br>";
echo "<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" frame border=\"0\">";
echo "<tr><td><img src=\"img/black.gif\" width=\"100%\" height=\"1\" border=\"0\" alt=\"\"></img></td></tr>";
echo "<tr valign=\"left\"><td height=\"7\" bgcolor=\"#5865E5\">";
echo "<center>";
echo "<span class=\"nag1wb\">";
echo "Lokale biurowe";
echo "</span>";
echo "</center>";
echo "</td></tr>";
echo "<tr><td><img src=\"img/black.gif\" width=\"100%\" height=\"1\" border=\"0\" alt=\"\"></img></td></tr>";
echo "</table>";


echo "<table width=\"516\" cellpadding=\"0\" cellspacing=\"0\" frame border=\"0\">";
	for ($i=0; $i < $rows2; $i++) {

		$id2 = pg_result($result_set2, $i, "id_d");
		$nod2 = pg_result($result_set2, $i, "no_d");
		$lok2 = pg_result($result_set2, $i, "lok_d");
		$powuzyt2 = pg_result($result_set2, $i, "powuzyt_d");
		$powdz2 = pg_result($result_set2, $i, "powdzi_d");
		$cena2 = pg_result($result_set2, $i, "cd");
		$dod2 = pg_result($result_set2, $i, "cm2_d");
		$zdj2 = pg_result($result_set2, $i, "zd1");
		$wylacznosc2 = pg_result($result_set2, $i, "wyl_d");
		$status2 = pg_result($result_set2, $i, "sm_d");
		

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

$tekst2 = "<a href = \"$PHP_SELF?action=wynajemlzd&nu=$id2\">wiêcej ...</a>";

echo "<tr>";
if ($zdj2 != 0) {
	echo "<td width=\"126\" height=\"63\" rowspan = \"5\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=wynajemlzd&nu=$id2\">";
	echo "<img src=\"../img/zd$zdj2.jpg\" width=\"90\" height=\"60\" border=\"0\" alt=\"Zdjêcie nr$zdj2\" class=\"ira\"></img></a><br>";
	echo "</center>";
	echo "</td>";
}
else {
	echo "<td width=\"126\" height=\"63\" rowspan = \"5\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=wynajemlzd&nu=$id2\">";
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
echo "<b>Pow. dzia³ki:</b> $powdz2 ar.";
echo "$wpstatk2</td>";

$cena2 = number_format($cena2,'', '.', '.');

echo "<td width=\"130\" align = \"left\">$wpstatp2";
echo "<b>Cena:</b> $cena2 z³.";
echo "$wpstatk2</td>";

echo "</tr>";

echo "<tr>";

echo "<td colspan=\"3\" align = \"left\">$wpstatp2";
echo "<b>Dodatkowe op³aty:</b> $dod2";
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

echo "<tr><td colspan=\"4\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}
echo "</table>";
}


$sql3 = "select id_d, no_d, lok_d, powuzyt_d, powdzi_d, cd, cm2_d, zd1, wyl_d, sm_d from tab_lok_w where loka = '1' and rof_d  = '3' and pokaz = 't' and usund = 'f' and id_b = '$identbiura' order by datawp_d desc;";

$result_set3 = pg_Exec($conn, $sql3);

$rows3 = pg_NumRows($result_set3);		// liczba zwroconych wierszy

if ((!$result_set3) || ($rows3 > 0)) { 

echo "<br>";
echo "<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" frame border=\"0\">";
echo "<tr><td><img src=\"img/black.gif\" width=\"100%\" height=\"1\" border=\"0\" alt=\"\"></img></td></tr>";
echo "<tr valign=\"left\"><td height=\"7\" bgcolor=\"#5865E5\">";
echo "<center>";
echo "<span class=\"nag1wb\">";
echo "Lokale magazyny";
echo "</span>";
echo "</center>";
echo "</td></tr>";
echo "<tr><td><img src=\"img/black.gif\" width=\"100%\" height=\"1\" border=\"0\" alt=\"\"></img></td></tr>";
echo "</table>";


echo "<table width=\"516\" cellpadding=\"0\" cellspacing=\"0\" frame border=\"0\">";
	for ($i=0; $i < $rows3; $i++) {

		$id3 = pg_result($result_set3, $i, "id_d");
		$nod3 = pg_result($result_set3, $i, "no_d");
		$lok3 = pg_result($result_set3, $i, "lok_d");
		$powuzyt3 = pg_result($result_set3, $i, "powuzyt_d");
		$powdz3 = pg_result($result_set3, $i, "powdzi_d");
		$lp3 = pg_result($result_set3, $i, "lp_d");
		$cena3 = pg_result($result_set3, $i, "cd");
		$dod3 = pg_result($result_set3, $i, "cm2_d");
		$zdj3 = pg_result($result_set3, $i, "zd1");
		$wylacznosc3 = pg_result($result_set3, $i, "wyl_d");
		$status3 = pg_result($result_set3, $i, "sm_d");
		

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

$tekst3 = "<a href = \"$PHP_SELF?action=wynajemlzd&nu=$id3\">wiêcej ...</a>";

echo "<tr>";
if ($zdj3 != 0) {
	echo "<td width=\"126\" height=\"63\" rowspan = \"5\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=wynajemlzd&nu=$id3\">";
	echo "<img src=\"../img/zd$zdj3.jpg\" width=\"90\" height=\"60\" border=\"0\" alt=\"Zdjêcie nr$zdj3\" class=\"ira\"></img></a><br>";
	echo "</center>";
	echo "</td>";
}
else {
	echo "<td width=\"126\" height=\"63\" rowspan = \"5\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=wynajemlzd&nu=$id3\">";
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
echo "<b>Pow. dzia³ki:</b> $powdz3 ar.";
echo "$wpstatk3</td>";

$cena3 = number_format($cena3,'', '.', '.');

echo "<td width=\"130\" align = \"left\">$wpstatp3";
echo "<b>Cena:</b> $cena3 z³.";
echo "$wpstatk3</td>";

echo "</tr>";

echo "<tr>";

echo "<td colspan=\"3\" align = \"left\">$wpstatp3";
echo "<b>Dodatkowe op³aty:</b> $dod3";
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

echo "<tr><td colspan=\"4\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}
echo "</table>";
}


$sql4 = "select id_d, no_d, lok_d, powuzyt_d, powdzi_d, cd, cm2_d, zd1, wyl_d, sm_d from tab_lok_w where loka = '1' and rof_d  = '4' and pokaz = 't' and usund = 'f' and id_b = '$identbiura' order by datawp_d desc;";

$result_set4 = pg_Exec($conn, $sql4);

$rows4 = pg_NumRows($result_set4);		// liczba zwroconych wierszy

if ((!$result_set4) || ($rows4 > 0)) { 

echo "<br>";
echo "<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" frame border=\"0\">";
echo "<tr><td><img src=\"img/black.gif\" width=\"100%\" height=\"1\" border=\"0\" alt=\"\"></img></td></tr>";
echo "<tr valign=\"left\"><td height=\"7\" bgcolor=\"#5865E5\">";
echo "<center>";
echo "<span class=\"nag1wb\">";
echo "Lokale hale";
echo "</span>";
echo "</center>";
echo "</td></tr>";
echo "<tr><td><img src=\"img/black.gif\" width=\"100%\" height=\"1\" border=\"0\" alt=\"\"></img></td></tr>";
echo "</table>";


echo "<table width=\"516\" cellpadding=\"0\" cellspacing=\"0\" frame border=\"0\">";
	for ($i=0; $i < $rows4; $i++) {

		$id4 = pg_result($result_set4, $i, "id_d");
		$nod4 = pg_result($result_set4, $i, "no_d");
		$lok4 = pg_result($result_set4, $i, "lok_d");
		$powuzyt4 = pg_result($result_set4, $i, "powuzyt_d");
		$powdz4 = pg_result($result_set4, $i, "powdzi_d");
		$cena4 = pg_result($result_set4, $i, "cd");
		$dod4 = pg_result($result_set4, $i, "cm2_d");
		$zdj4 = pg_result($result_set4, $i, "zd1");
		$wylacznosc4 = pg_result($result_set4, $i, "wyl_d");
		$status4 = pg_result($result_set4, $i, "sm_d");
		

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

$tekst4 = "<a href = \"$PHP_SELF?action=wynajemlzd&nu=$id4\">wiêcej ...</a>";

echo "<tr>";
if ($zdj4 != 0) {
	echo "<td width=\"126\" height=\"63\" rowspan = \"5\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=wynajemlzd&nu=$id4\">";
	echo "<img src=\"../img/zd$zdj4.jpg\" width=\"90\" height=\"60\" border=\"0\" alt=\"Zdjêcie nr$zdj4\" class=\"ira\"></img></a><br>";
	echo "</center>";
	echo "</td>";
}
else {
	echo "<td width=\"126\" height=\"63\" rowspan = \"5\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=wynajemlzd&nu=$id4\">";
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
echo "<b>Pow. dzia³ki:</b> $powdz4 ar.";
echo "$wpstatk4</td>";

$cena4 = number_format($cena4,'', '.', '.');

echo "<td width=\"130\" align = \"left\">$wpstatp4";
echo "<b>Cena:</b> $cena4 z³.";
echo "$wpstatk4</td>";

echo "</tr>";

echo "<tr>";

echo "<td colspan=\"3\" align = \"left\">$wpstatp4";
echo "<b>Dodatkowe op³aty:</b> $dod4";
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

echo "<tr><td colspan=\"4\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}
echo "</table>";
}

$sql5 = "select id_d, no_d, lok_d, powuzyt_d, powdzi_d, cd, cm2_d, zd1, wyl_d, sm_d from tab_lok_w where loka = '1' and rof_d  = '5' and pokaz = 't' and usund = 'f' and id_b = '$identbiura' order by datawp_d desc;";

$result_set5 = pg_Exec($conn, $sql5);

$rows5 = pg_NumRows($result_set5);		// liczba zwroconych wierszy

if ((!$result_set5) || ($rows5 > 0)) { 

echo "<br>";
echo "<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" frame border=\"0\">";
echo "<tr><td><img src=\"img/black.gif\" width=\"100%\" height=\"1\" border=\"0\" alt=\"\"></img></td></tr>";
echo "<tr valign=\"left\"><td height=\"7\" bgcolor=\"#5865E5\">";
echo "<center>";
echo "<span class=\"nag1wb\">";
echo "Lokale gara¿e";
echo "</span>";
echo "</center>";
echo "</td></tr>";
echo "<tr><td><img src=\"img/black.gif\" width=\"100%\" height=\"1\" border=\"0\" alt=\"\"></img></td></tr>";
echo "</table>";


echo "<table width=\"516\" cellpadding=\"0\" cellspacing=\"0\" frame border=\"0\">";
	for ($i=0; $i < $rows5; $i++) {

		$id5 = pg_result($result_set5, $i, "id_d");
		$nod5 = pg_result($result_set5, $i, "no_d");
		$lok5 = pg_result($result_set5, $i, "lok_d");
		$powuzyt5 = pg_result($result_set5, $i, "powuzyt_d");
		$powdz5 = pg_result($result_set5, $i, "powdzi_d");
		$cena5 = pg_result($result_set5, $i, "cd");
		$dod5 = pg_result($result_set5, $i, "cm2_d");
		$zdj5 = pg_result($result_set5, $i, "zd1");
		$wylacznosc5 = pg_result($result_set5, $i, "wyl_d");
		$status5 = pg_result($result_set5, $i, "sm_d");
		

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

$tekst5 = "<a href = \"$PHP_SELF?action=wynajemlzd&nu=$id5\">wiêcej ...</a>";

echo "<tr>";
if ($zdj5 != 0) {
	echo "<td width=\"126\" height=\"63\" rowspan = \"5\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=wynajemlzd&nu=$id5\">";
	echo "<img src=\"../img/zd$zdj5.jpg\" width=\"90\" height=\"60\" border=\"0\" alt=\"Zdjêcie nr$zdj5\" class=\"ira\"></img></a><br>";
	echo "</center>";
	echo "</td>";
}
else {
	echo "<td width=\"126\" height=\"63\" rowspan = \"5\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=wynajemlzd&nu=$id5\">";
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
echo "<b>Pow. dzia³ki:</b> $powdz5 ar.";
echo "$wpstatk5</td>";

$cena5 = number_format($cena5,'', '.', '.');

echo "<td width=\"130\" align = \"left\">$wpstatp5";
echo "<b>Cena:</b> $cena5 z³.";
echo "$wpstatk5</td>";

echo "</tr>";

echo "<tr>";

echo "<td colspan=\"3\" align = \"left\">$wpstatp5";
echo "<b>Dodatkowe op³aty:</b> $dod5";
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

echo "<tr><td colspan=\"4\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}
echo "</table>";
}

$sql05 = "select id_d, no_d, lok_d, powuzyt_d, powdzi_d, cd, cm2_d, zd1, wyl_d, sm_d from tab_lok_w where loka = '1' and rof_d  = '6' and pokaz = 't' and usund = 'f' and id_b = '$identbiura' order by datawp_d desc;";

$result_set05 = pg_Exec($conn, $sql05);

$rows05 = pg_NumRows($result_set05);		// liczba zwroconych wierszy

if ((!$result_set05) || ($rows05 > 0)) { 

echo "<br>";
echo "<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" frame border=\"0\">";
echo "<tr><td><img src=\"img/black.gif\" width=\"100%\" height=\"1\" border=\"0\" alt=\"\"></img></td></tr>";
echo "<tr valign=\"left\"><td height=\"7\" bgcolor=\"#5865E5\">";
echo "<center>";
echo "<span class=\"nag1wb\">";
echo "Lokale inne";
echo "</span>";
echo "</center>";
echo "</td></tr>";
echo "<tr><td><img src=\"img/black.gif\" width=\"100%\" height=\"1\" border=\"0\" alt=\"\"></img></td></tr>";
echo "</table>";


echo "<table width=\"516\" cellpadding=\"0\" cellspacing=\"0\" frame border=\"0\">";
	for ($i=0; $i < $rows05; $i++) {

		$id05 = pg_result($result_set05, $i, "id_d");
		$nod05 = pg_result($result_set05, $i, "no_d");
		$lok05 = pg_result($result_set05, $i, "lok_d");
		$powuzyt05 = pg_result($result_set05, $i, "powuzyt_d");
		$powdz05 = pg_result($result_set05, $i, "powdzi_d");
		$cena05 = pg_result($result_set05, $i, "cd");
		$dod05 = pg_result($result_set05, $i, "cm2_d");
		$zdj05 = pg_result($result_set05, $i, "zd1");
		$wylacznosc05 = pg_result($result_set05, $i, "wyl_d");
		$status05 = pg_result($result_set05, $i, "sm_d");
		

if ($status05 == "2") {
$stat05 = "<span class=\"zawna\">OFERTA ZAWIESZONA</span>";
$wpstatp05 = "<span class=\"zawo\">";
$wpstatk05 = "</span>";
}
else {
$stat05 ="";
$wpstatp05 = "";
$wpstatk05 = "";
}

if ($wylacznosc05 == "2") {
$wyl05 = "<span class=\"wyl\">WY£¡CZNO¦Æ</span>";
}
else {
$wyl05 = "";
}

$tekst05 = "<a href = \"$PHP_SELF?action=wynajemlzd&nu=$id05\">wiêcej ...</a>";

echo "<tr>";
if ($zdj05 != 0) {
	echo "<td width=\"126\" height=\"63\" rowspan = \"5\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=wynajemlzd&nu=$id05\">";
	echo "<img src=\"../img/zd$zdj05.jpg\" width=\"90\" height=\"60\" border=\"0\" alt=\"Zdjêcie nr$zdj05\" class=\"ira\"></img></a><br>";
	echo "</center>";
	echo "</td>";
}
else {
	echo "<td width=\"126\" height=\"63\" rowspan = \"5\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=wynajemlzd&nu=$id05\">";
	echo "<img src=\"../img/zd0.jpg\" width=\"90\" height=\"60\" alt=\"Brak zdjêcia\" class=\"ira\"></img></a><br>";
	echo "</center>";
	echo "</td>";
}
echo "<td align = \"left\">";

echo "<tr>";

echo "<td width=\"130\" align = \"left\">$wpstatp05";
echo "<b>Numer Oferty:</b> $nod05";
echo "$wpstatk05</td>";

echo "<td width=\"260\" align = \"left\" colspan = \"2\">$wpstatp05";
echo "<b>Lokalizacja:</b> $lok05";
echo "$wpstatk05</td>";

echo "</tr>";

echo "<tr>";

echo "<td width=\"130\" align = \"left\">$wpstatp05";
echo "<b>Pow.u¿ytk.:</b> $powuzyt05 m2";
echo "$wpstatk05</td>";

echo "<td width=\"130\" align = \"left\">$wpstatp05";
echo "<b>Pow. dzia³ki:</b> $powdz05 ar.";
echo "$wpstatk05</td>";

$cena05 = number_format($cena05,'', '.', '.');

echo "<td width=\"130\" align = \"left\">$wpstatp05";
echo "<b>Cena:</b> $cena05 z³.";
echo "$wpstatk05</td>";

echo "</tr>";

echo "<tr>";

echo "<td colspan=\"3\" align = \"left\">$wpstatp05";
echo "<b>Dodatkowe op³aty:</b> $dod05";
echo "$wpstatk05</td>";

echo "</tr>";

echo "<tr>";

echo "<td width=\"130\" align = \"left\">";
echo "$stat05";
echo "</td>";

echo "<td width=\"130\" align = \"left\">";
echo "$wyl05";
echo "</td>";

echo "<td width=\"130\" align = \"left\">";
echo "$tekst05";
echo "</td>";

echo "</tr>";

echo "</td>";

echo "</tr>";

echo "<tr><td colspan=\"4\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}
echo "</table>";
}

$sql02 = "select id_d from tab_lok_w where loka = '2' and pokaz = 't' and usund = 'f' and id_b = '$identbiura' order by datawp_d desc;";

$result_set02 = pg_Exec($conn, $sql02);

$rows02 = pg_NumRows($result_set02);		// liczba zwroconych wierszy

if ((!$result_set02) || ($rows02 > 0)) { 

echo "<center>";
echo "<span class=\"nag2b\">";
echo "<b>WYNAJEM LOKALI</b>";
echo "<br>";
echo "<b>(POZA OPOLEM)</b>";
echo "</span>";
echo "</center>";
}

$sql6 = "select id_d, no_d, lok_d, powuzyt_d, powdzi_d, cd, cm2_d, zd1, wyl_d, sm_d from tab_lok_w where loka = '2' and rof_d  = '1' and pokaz = 't' and usund = 'f' and id_b = '$identbiura' order by datawp_d desc;";

$result_set6 = pg_Exec($conn, $sql6);

$rows6 = pg_NumRows($result_set6);		// liczba zwroconych wierszy

if ((!$result_set6) || ($rows6 > 0)) { 

echo "<br>";
echo "<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" frame border=\"0\">";
echo "<tr><td><img src=\"img/black.gif\" width=\"100%\" height=\"1\" border=\"0\" alt=\"\"></img></td></tr>";
echo "<tr valign=\"left\"><td height=\"7\" bgcolor=\"#5865E5\">";
echo "<center>";
echo "<span class=\"nag1wb\">";
echo "Lokale handlowo - us³ugowe";
echo "</span>";
echo "</center>";
echo "</td></tr>";
echo "<tr><td><img src=\"img/black.gif\" width=\"100%\" height=\"1\" border=\"0\" alt=\"\"></img></td></tr>";
echo "</table>";


echo "<table width=\"516\" cellpadding=\"0\" cellspacing=\"0\" frame border=\"0\">";
	for ($i=0; $i < $rows6; $i++) {

		$id6 = pg_result($result_set6, $i, "id_d");
		$nod6 = pg_result($result_set6, $i, "no_d");
		$lok6 = pg_result($result_set6, $i, "lok_d");
		$powuzyt6 = pg_result($result_set6, $i, "powuzyt_d");
		$powdz6 = pg_result($result_set6, $i, "powdzi_d");
		$cena6 = pg_result($result_set6, $i, "cd");
		$dod6 = pg_result($result_set6, $i, "cm2_d");
		$zdj6 = pg_result($result_set6, $i, "zd1");
		$wylacznosc6 = pg_result($result_set6, $i, "wyl_d");
		$status6 = pg_result($result_set6, $i, "sm_d");
		

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

$tekst6 = "<a href = \"$PHP_SELF?action=wynajemlzd&nu=$id6\">wiêcej ...</a>";

echo "<tr>";
if ($zdj6 != 0) {
	echo "<td width=\"126\" height=\"63\" rowspan = \"5\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=wynajemlzd&nu=$id6\">";
	echo "<img src=\"../img/zd$zdj6.jpg\" width=\"90\" height=\"60\" border=\"0\" alt=\"Zdjêcie nr$zdj6\" class=\"ira\"></img></a><br>";
	echo "</center>";
	echo "</td>";
}
else {
	echo "<td width=\"126\" height=\"63\" rowspan = \"5\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=wynajemlzd&nu=$id6\">";
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
echo "<b>Pow. dzia³ki:</b> $powdz6 ar.";
echo "$wpstatk6</td>";

$cena6 = number_format($cena6,'', '.', '.');

echo "<td width=\"130\" align = \"left\">$wpstatp6";
echo "<b>Cena:</b> $cena6 z³.";
echo "$wpstatk6</td>";

echo "</tr>";

echo "<tr>";

echo "<td colspan=\"3\" align = \"left\">$wpstatp6";
echo "<b>Dodatkowe op³aty:</b> $dod6";
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

echo "<tr><td colspan=\"4\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}
echo "</table>";
}


$sql7 = "select id_d, no_d, lok_d, powuzyt_d, powdzi_d, cd, cm2_d, zd1, wyl_d, sm_d from tab_lok_w where loka = '2' and rof_d  = '2' and pokaz = 't' and usund = 'f' and id_b = '$identbiura' order by datawp_d desc;";

$result_set7 = pg_Exec($conn, $sql7);

$rows7 = pg_NumRows($result_set7);		// liczba zwroconych wierszy

if ((!$result_set7) || ($rows7 > 0)) { 

echo "<br>";
echo "<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" frame border=\"0\">";
echo "<tr><td><img src=\"img/black.gif\" width=\"100%\" height=\"1\" border=\"0\" alt=\"\"></img></td></tr>";
echo "<tr valign=\"left\"><td height=\"7\" bgcolor=\"#5865E5\">";
echo "<center>";
echo "<span class=\"nag1wb\">";
echo "Lokale biurowe";
echo "</span>";
echo "</center>";
echo "</td></tr>";
echo "<tr><td><img src=\"img/black.gif\" width=\"100%\" height=\"1\" border=\"0\" alt=\"\"></img></td></tr>";
echo "</table>";


echo "<table width=\"516\" cellpadding=\"0\" cellspacing=\"0\" frame border=\"0\">";
	for ($i=0; $i < $rows7; $i++) {

		$id7 = pg_result($result_set7, $i, "id_d");
		$nod7 = pg_result($result_set7, $i, "no_d");
		$lok7 = pg_result($result_set7, $i, "lok_d");
		$powuzyt7 = pg_result($result_set7, $i, "powuzyt_d");
		$powdz7 = pg_result($result_set7, $i, "powdzi_d");
		$cena7 = pg_result($result_set7, $i, "cd");
		$dod7 = pg_result($result_set7, $i, "cm2_d");
		$zdj7 = pg_result($result_set7, $i, "zd1");
		$wylacznosc7 = pg_result($result_set7, $i, "wyl_d");
		$status7 = pg_result($result_set7, $i, "sm_d");
		

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

$tekst7 = "<a href = \"$PHP_SELF?action=wynajemlzd&nu=$id7\">wiêcej ...</a>";


echo "<tr>";
if ($zdj7 != 0) {
	echo "<td width=\"126\" height=\"63\" rowspan = \"5\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=wynajemlzd&nu=$id7\">";
	echo "<img src=\"../img/zd$zdj7.jpg\" width=\"90\" height=\"60\" border=\"0\" alt=\"Zdjêcie nr$zdj7\" class=\"ira\"></img></a><br>";
	echo "</center>";
	echo "</td>";
}
else {
	echo "<td width=\"126\" height=\"63\" rowspan = \"5\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=wynajemlzd&nu=$id7\">";
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
echo "<b>Pow. dzia³ki:</b> $powdz7 ar.";
echo "$wpstatk7</td>";

$cena7 = number_format($cena7,'', '.', '.');

echo "<td width=\"130\" align = \"left\">$wpstatp7";
echo "<b>Cena:</b> $cena7 z³.";
echo "$wpstatk7</td>";

echo "</tr>";

echo "<tr>";

echo "<td colspan=\"3\" align = \"left\">$wpstatp7";
echo "<b>Dodatkowe op³aty:</b> $dod7";
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

echo "<tr><td colspan=\"4\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}
echo "</table>";
}


$sql8 = "select id_d, no_d, lok_d, powuzyt_d, powdzi_d, cd, cm2_d, zd1, wyl_d, sm_d from tab_lok_w where loka = '2' and rof_d  = '3' and pokaz = 't' and usund = 'f' and id_b = '$identbiura' order by datawp_d desc;";

$result_set8 = pg_Exec($conn, $sql8);

$rows8 = pg_NumRows($result_set8);		// liczba zwroconych wierszy

if ((!$result_set8) || ($rows8 > 0)) { 

echo "<br>";
echo "<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" frame border=\"0\">";
echo "<tr><td><img src=\"img/black.gif\" width=\"100%\" height=\"1\" border=\"0\" alt=\"\"></img></td></tr>";
echo "<tr valign=\"left\"><td height=\"7\" bgcolor=\"#5865E5\">";
echo "<center>";
echo "<span class=\"nag1wb\">";
echo "Lokale magazyny";
echo "</span>";
echo "</center>";
echo "</td></tr>";
echo "<tr><td><img src=\"img/black.gif\" width=\"100%\" height=\"1\" border=\"0\" alt=\"\"></img></td></tr>";
echo "</table>";


echo "<table width=\"516\" cellpadding=\"0\" cellspacing=\"0\" frame border=\"0\">";
	for ($i=0; $i < $rows8; $i++) {

		$id8 = pg_result($result_set8, $i, "id_d");
		$nod8 = pg_result($result_set8, $i, "no_d");
		$lok8 = pg_result($result_set8, $i, "lok_d");
		$powuzyt8 = pg_result($result_set8, $i, "powuzyt_d");
		$powdz8 = pg_result($result_set8, $i, "powdzi_d");
		$cena8 = pg_result($result_set8, $i, "cd");
		$dod8 = pg_result($result_set8, $i, "cm2_d");
		$zdj8 = pg_result($result_set8, $i, "zd1");
		$wylacznosc8 = pg_result($result_set8, $i, "wyl_d");
		$status8 = pg_result($result_set8, $i, "sm_d");
		

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

$tekst8 = "<a href = \"$PHP_SELF?action=wynajemlzd&nu=$id8\">wiêcej ...</a>";

echo "<tr>";
if ($zdj8 != 0) {
	echo "<td width=\"126\" height=\"63\" rowspan = \"5\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=wynajemlzd&nu=$id8\">";
	echo "<img src=\"../img/zd$zdj8.jpg\" width=\"90\" height=\"60\" border=\"0\" alt=\"Zdjêcie nr$zdj8\" class=\"ira\"></img></a><br>";
	echo "</center>";
	echo "</td>";
}
else {
	echo "<td width=\"126\" height=\"63\" rowspan = \"5\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=wynajemlzd&nu=$id8\">";
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
echo "<b>Pow. dzia³ki:</b> $powdz8 ar.";
echo "$wpstatk8</td>";

$cena8 = number_format($cena8,'', '.', '.');

echo "<td width=\"130\" align = \"left\">$wpstatp8";
echo "<b>Cena:</b> $cena8 z³.";
echo "$wpstatk8</td>";

echo "</tr>";

echo "<tr>";

echo "<td colspan=\"3\" align = \"left\">$wpstatp8";
echo "<b>Dodatkowe op³aty:</b> $dod8";
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

echo "<tr><td colspan=\"4\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}
echo "</table>";
}


$sql9 = "select id_d, no_d, lok_d, powuzyt_d, powdzi_d, cd, cm2_d, zd1, wyl_d, sm_d from tab_lok_w where loka = '2' and rof_d  = '4' and pokaz = 't' and usund = 'f' and id_b = '$identbiura' order by datawp_d desc;";

$result_set9 = pg_Exec($conn, $sql9);

$rows9 = pg_NumRows($result_set9);		// liczba zwroconych wierszy

if ((!$result_set9) || ($rows9 > 0)) { 

echo "<br>";
echo "<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" frame border=\"0\">";
echo "<tr><td><img src=\"img/black.gif\" width=\"100%\" height=\"1\" border=\"0\" alt=\"\"></img></td></tr>";
echo "<tr valign=\"left\"><td height=\"7\" bgcolor=\"#5865E5\">";
echo "<center>";
echo "<span class=\"nag1wb\">";
echo "Lokale hale";
echo "</span>";
echo "</center>";
echo "</td></tr>";
echo "<tr><td><img src=\"img/black.gif\" width=\"100%\" height=\"1\" border=\"0\" alt=\"\"></img></td></tr>";
echo "</table>";


echo "<table width=\"516\" cellpadding=\"0\" cellspacing=\"0\" frame border=\"0\">";
	for ($i=0; $i < $rows9; $i++) {

		$id9 = pg_result($result_set9, $i, "id_d");
		$nod9 = pg_result($result_set9, $i, "no_d");
		$lok9 = pg_result($result_set9, $i, "lok_d");
		$powuzyt9 = pg_result($result_set9, $i, "powuzyt_d");
		$powdz9 = pg_result($result_set9, $i, "powdzi_d");
		$cena9 = pg_result($result_set9, $i, "cd");
		$dod9 = pg_result($result_set9, $i, "cm2_d");
		$zdj9 = pg_result($result_set9, $i, "zd1");
		$wylacznosc9 = pg_result($result_set9, $i, "wyl_d");
		$status9 = pg_result($result_set9, $i, "sm_d");
		

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

$tekst9 = "<a href = \"$PHP_SELF?action=wynajemlzd&nu=$id9\">wiêcej ...</a>";

echo "<tr>";
if ($zdj9 != 0) {
	echo "<td width=\"126\" height=\"63\" rowspan = \"5\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=wynajemlzd&nu=$id9\">";
	echo "<img src=\"../img/zd$zdj9.jpg\" width=\"90\" height=\"60\" border=\"0\" alt=\"Zdjêcie nr$zdj9\" class=\"ira\"></img></a><br>";
	echo "</center>";
	echo "</td>";
}
else {
	echo "<td width=\"126\" height=\"63\" rowspan = \"5\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=wynajemlzd&nu=$id9\">";
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
echo "<b>Pow. dzia³ki:</b> $powdz9 ar.";
echo "$wpstatk9</td>";

$cena9 = number_format($cena9,'', '.', '.');

echo "<td width=\"130\" align = \"left\">$wpstatp9";
echo "<b>Cena:</b> $cena9 z³.";
echo "$wpstatk9</td>";

echo "</tr>";


echo "<tr>";

echo "<td colspan=\"3\" align = \"left\">$wpstatp9";
echo "<b>Dodatkowe op³aty:</b> $dod9";
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

echo "<tr><td colspan=\"4\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}
echo "</table>";
}

$sql10 = "select id_d, no_d, lok_d, powuzyt_d, powdzi_d, cd, cm2_d, zd1, wyl_d, sm_d from tab_lok_w where loka = '2' and rof_d  = '5' and pokaz = 't' and usund = 'f' and id_b = '$identbiura' order by datawp_d desc;";

$result_set10 = pg_Exec($conn, $sql10);

$rows10 = pg_NumRows($result_set10);		// liczba zwroconych wierszy

if ((!$result_set10) || ($rows10 > 0)) { 

echo "<br>";
echo "<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" frame border=\"0\">";
echo "<tr><td><img src=\"img/black.gif\" width=\"100%\" height=\"1\" border=\"0\" alt=\"\"></img></td></tr>";
echo "<tr valign=\"left\"><td height=\"7\" bgcolor=\"#5865E5\">";
echo "<center>";
echo "<span class=\"nag1wb\">";
echo "Lokale gara¿e";
echo "</span>";
echo "</center>";
echo "</td></tr>";
echo "<tr><td><img src=\"img/black.gif\" width=\"100%\" height=\"1\" border=\"0\" alt=\"\"></img></td></tr>";
echo "</table>";


echo "<table width=\"516\" cellpadding=\"0\" cellspacing=\"0\" frame border=\"0\">";
	for ($i=0; $i < $rows10; $i++) {

		$id10 = pg_result($result_set10, $i, "id_d");
		$nod10 = pg_result($result_set10, $i, "no_d");
		$lok10 = pg_result($result_set10, $i, "lok_d");
		$powuzyt10 = pg_result($result_set10, $i, "powuzyt_d");
		$powdz10 = pg_result($result_set10, $i, "powdzi_d");
		$cena10 = pg_result($result_set10, $i, "cd");
		$dod10 = pg_result($result_set10, $i, "cm2_d");
		$zdj10 = pg_result($result_set10, $i, "zd1");
		$wylacznosc10 = pg_result($result_set10, $i, "wyl_d");
		$status10 = pg_result($result_set10, $i, "sm_d");
		

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

$tekst10 = "<a href = \"$PHP_SELF?action=wynajemlzd&nu=$id10\">wiêcej ...</a>";

echo "<tr>";
if ($zdj10 != 0) {
	echo "<td width=\"126\" height=\"63\" rowspan = \"5\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=wynajemlzd&nu=$id10\">";
	echo "<img src=\"../img/zd$zdj10.jpg\" width=\"90\" height=\"60\" border=\"0\" alt=\"Zdjêcie nr$zdj10\" class=\"ira\"></img></a><br>";
	echo "</center>";
	echo "</td>";
}
else {
	echo "<td width=\"126\" height=\"63\" rowspan = \"5\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=wynajemlzd&nu=$id10\">";
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
echo "<b>Pow. dzia³ki:</b> $powdz10 ar.";
echo "$wpstatk10</td>";

$cena10 = number_format($cena10,'', '.', '.');

echo "<td width=\"130\" align = \"left\">$wpstatp10";
echo "<b>Cena:</b> $cena10 z³.";
echo "$wpstatk10</td>";

echo "</tr>";

echo "<tr>";

echo "<td colspan=\"3\" align = \"left\">$wpstatp10";
echo "<b>Dodatkowe op³aty:</b> $dod10";
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

echo "<tr><td colspan=\"4\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}
echo "</table>";
}

$sql11 = "select id_d, no_d, lok_d, powuzyt_d, powdzi_d, cd, cm2_d, zd1, wyl_d, sm_d from tab_lok_w where loka = '2' and rof_d  = '6' and pokaz = 't' and usund = 'f' and id_b = '$identbiura' order by datawp_d desc;";

$result_set11 = pg_Exec($conn, $sql11);

$rows11 = pg_NumRows($result_set11);		// liczba zwroconych wierszy

if ((!$result_set11) || ($rows11 > 0)) { 

echo "<br>";
echo "<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" frame border=\"0\">";
echo "<tr><td><img src=\"img/black.gif\" width=\"100%\" height=\"1\" border=\"0\" alt=\"\"></img></td></tr>";
echo "<tr valign=\"left\"><td height=\"7\" bgcolor=\"#5865E5\">";
echo "<center>";
echo "<span class=\"nag1wb\">";
echo "Lokale inne";
echo "</span>";
echo "</center>";
echo "</td></tr>";
echo "<tr><td><img src=\"img/black.gif\" width=\"100%\" height=\"1\" border=\"0\" alt=\"\"></img></td></tr>";
echo "</table>";


echo "<table width=\"516\" cellpadding=\"0\" cellspacing=\"0\" frame border=\"0\">";
	for ($i=0; $i < $rows11; $i++) {

		$id11 = pg_result($result_set11, $i, "id_d");
		$nod11 = pg_result($result_set11, $i, "no_d");
		$lok11 = pg_result($result_set11, $i, "lok_d");
		$powuzyt11 = pg_result($result_set11, $i, "powuzyt_d");
		$powdz11 = pg_result($result_set11, $i, "powdzi_d");
		$cena11 = pg_result($result_set11, $i, "cd");
		$dod11 = pg_result($result_set11, $i, "cm2_d");
		$zdj11 = pg_result($result_set11, $i, "zd1");
		$wylacznosc11 = pg_result($result_set11, $i, "wyl_d");
		$status11 = pg_result($result_set11, $i, "sm_d");
		

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

$tekst11 = "<a href = \"$PHP_SELF?action=wynajemlzd&nu=$id11\">wiêcej ...</a>";

echo "<tr>";
if ($zdj11 != 0) {
	echo "<td width=\"126\" height=\"63\" rowspan = \"5\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=wynajemlzd&nu=$id11\">";
	echo "<img src=\"../img/zd$zdj11.jpg\" width=\"90\" height=\"60\" border=\"0\" alt=\"Zdjêcie nr$zdj11\" class=\"ira\"></img></a><br>";
	echo "</center>";
	echo "</td>";
}
else {
	echo "<td width=\"126\" height=\"63\" rowspan = \"5\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=wynajemlzd&nu=$id11\">";
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
echo "<b>Pow. dzia³ki:</b> $powdz11 ar.";
echo "$wpstatk11</td>";

$cena11 = number_format($cena11,'', '.', '.');

echo "<td width=\"130\" align = \"left\">$wpstatp11";
echo "<b>Cena:</b> $cena11 z³.";
echo "$wpstatk11</td>";

echo "</tr>";

echo "<tr>";

echo "<td colspan=\"3\" align = \"left\">$wpstatp11";
echo "<b>Dodatkowe op³aty:</b> $dod11";
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

echo "<tr><td colspan=\"4\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}
echo "</table>";
}

}


if ($action == 'wynajemlzd') {

echo "<center>";
echo "<span class=\"nag2b\">";
echo "<b>WYNAJEM LOKALI</b>";
echo "<br>";
echo "</span>";
echo "</center>";

echo "<table width=\"512\" cellpadding=\"0\" cellspacing=\"0\" border = \"0\">";
echo "<tr>";
echo "<td width=\"50%\"  align = \"left\">";

?>
<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,0,0" width="40" height="20" id="backwl" align="middle">
<param name="allowScriptAccess" value="sameDomain" />
<param name="movie" value="backwl.swf" />
<param name="quality" value="high" />
<param name="wmode" value="transparent" />
<param name="bgcolor" value="#ffffff" />
<embed src="backwl.swf" quality="high" wmode="transparent" bgcolor="#ffffff" width="40" height="20" name="backwl" align="middle" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />
</object>
<?

echo "</td>";
echo "<td width=\"50%\" align = \"right\">";
echo "<a href=\"drukwl.php?nu=$nu\" target = \"_blank\"><img src=\"img/printer.gif\" width=\"15\" height=\"17\" border=\"0\"></img>&nbsp;&nbsp;Wydrukuj ze zdjeciami</a><br>";
echo "<a href=\"drukwlb.php?nu=$nu\" target = \"_blank\"><img src=\"img/printer.gif\" width=\"15\" height=\"17\" border=\"0\"></img>&nbsp;&nbsp;Wydrukuj bez zdjêæ</a>";
echo "</td>";
echo "</tr>";
echo "</table>";

echo "<br>";

echo "<center>";
echo "<table width=\"512\" cellpadding=\"0\" cellspacing=\"0\" border = \"1\" frame = \"above,below,rhs\" rules = \"groups\">";

$sqlno = "SELECT no_d, no_d_bo FROM tab_lok_w where id_d = '$nu';";
	$resultno = @pg_Exec($conn, $sqlno);
	$rowsno = pg_NumRows($resultno);		// liczba zwroconych wierszy
	$noms = pg_result($resultno, 0, "no_d");
	$nomsp = pg_result($resultno, 0, "no_d_bo");

$sqlstatus = "SELECT sm_d, sm_d_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultstatus = @pg_Exec($conn, $sqlstatus);
			$status = pg_result($resultstatus, 0, "sm_d");
			$statusbo = pg_result($resultstatus, 0, "sm_d_bo");
	
	$sqlstatuss = "SELECT nazwa_st FROM status where id = '$status';";
			
			$resultstatuss = @pg_Exec($conn, $sqlstatuss);
			$statuss = pg_result($resultstatuss, 0, "nazwa_st");

$sqlagent = "SELECT id_a FROM tab_lok_w where id_d = '$nu';";
			
			$resultagent = @pg_Exec($conn, $sqlagent);
			$agent = pg_result($resultagent, 0, "id_a");

	$sqlagents = "SELECT nazwa_a, tel_a, tel_kom_a, email_a FROM tab_agent where id_a = '$agent';";
			
			$resultagents = @pg_Exec($conn, $sqlagents);
			$nazwaagenta = pg_result($resultagents, 0, "nazwa_a");
			$nazwatel = pg_result($resultagents, 0, "tel_a");
			$nazwatelkom = pg_result($resultagents, 0, "tel_kom_a");
			$nazwaemail = pg_result($resultagents, 0, "email_a");

$sqllok = "SELECT lok_d, lok_d_bo FROM tab_lok_w where id_d = '$nu';";	
	$resultlok = @pg_Exec($conn, $sqllok);
	$lokas = pg_result($resultlok, 0, "lok_d");
	$lokasp = pg_result($resultlok, 0, "lok_d_bo");

$sqlwoj = "SELECT lok_w, lok_w_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultwoj = @pg_Exec($conn, $sqlwoj);
			$wojn = pg_result($resultwoj, 0, "lok_w");
			$wojnbo = pg_result($resultwoj, 0, "lok_w_bo");
	
	$sqlwojs = "SELECT nazwa_w FROM wojewodztwa where id_w = '$wojn';";
			
			$resultwojs = @pg_Exec($conn, $sqlwojs);
			$wojns = pg_result($resultwojs, 0, "nazwa_w");

$sqlpowiat = "SELECT lok_p, lok_p_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultpowiat = @pg_Exec($conn, $sqlpowiat);
			$powiatn = pg_result($resultpowiat, 0, "lok_p");
			$powiatbo = pg_result($resultpowiat, 0, "lok_p_bo");
	
	$sqlpowiats = "SELECT nazwa_p FROM powiaty where id_pow = '$powiatn';";
			
			$resultpowiats = @pg_Exec($conn, $sqlpowiats);
			$powiatns = pg_result($resultpowiats, 0, "nazwa_p");

$sqlcena = "SELECT cd, cd_bo FROM tab_lok_w where id_d = '$nu';";	
	$resultcena = @pg_Exec($conn, $sqlcena);
	$cenas = pg_result($resultcena, 0, "cd");
	$cenasp = pg_result($resultcena, 0, "cd_bo");
	
$sqlpowuzyt = "SELECT powuzyt_d, powuzyt_d_bo FROM tab_lok_w where id_d = '$nu';";	
	$resultpowuzyt = @pg_Exec($conn, $sqlpowuzyt);
	$powuzyts = pg_result($resultpowuzyt, 0, "powuzyt_d");
	$powuzytsp = pg_result($resultpowuzyt, 0, "powuzyt_d_bo");
	
$sqlpowcal = "SELECT powcal_d, powcal_d_bo FROM tab_lok_w where id_d = '$nu';";	
	$resultpowcal = @pg_Exec($conn, $sqlpowcal);
	$powcals = pg_result($resultpowcal, 0, "powcal_d");
	$powcalsp = pg_result($resultpowcal, 0, "powcal_d_bo");

$sqlpowdzi = "SELECT powdzi_d, powdzi_d_bo FROM tab_lok_w where id_d = '$nu';";	
	$resultpowdzi = @pg_Exec($conn, $sqlpowdzi);
	$powdzis = pg_result($resultpowdzi, 0, "powdzi_d");
	$powdzisp = pg_result($resultpowdzi, 0, "powdzi_d_bo");

$sqlpowpom = "SELECT powpom_d, powpom_d_bo FROM tab_lok_w where id_d = '$nu';";	
	$resultpowpom = @pg_Exec($conn, $sqlpowpom);
	$powpoms = pg_result($resultpowpom, 0, "powpom_d");
	$powpomsp = pg_result($resultpowpom, 0, "powpom_d_bo");

$sqlpowwit = "SELECT powwit_d, powwit_d_bo FROM tab_lok_w where id_d = '$nu';";	
	$resultpowwit = @pg_Exec($conn, $sqlpowwit);
	$powwits = pg_result($resultpowwit, 0, "powwit_d");
	$powwitsp = pg_result($resultpowwit, 0, "powwit_d_bo");

$sqlpowpomg = "SELECT powpomg_d, powpomg_d_bo FROM tab_lok_w where id_d = '$nu';";	
	$resultpomg = @pg_Exec($conn, $sqlpowpomg);
	$powpomgs = pg_result($resultpomg, 0, "powpomg_d");
	$powpomgsp = pg_result($resultpomg, 0, "powpomg_d_bo");
	
$sqlpowpoms = "SELECT powpoms_d, powpoms_d_bo FROM tab_lok_w where id_d = '$nu';";	
	$resultpoms = @pg_Exec($conn, $sqlpowpoms);
	$powpomss = pg_result($resultpoms, 0, "powpoms_d");
	$powpomssp = pg_result($resultpoms, 0, "powpoms_d_bo");


$sqllpom = "SELECT lpom_d, lpom_d_bo FROM tab_lok_w where id_d = '$nu';";	
	$resultlpom = @pg_Exec($conn, $sqllpom);
	$lpoms = pg_result($resultlpom, 0, "lpom_d");
	$lpomsp = pg_result($resultlpom, 0, "lpom_d_bo");

$sqllwit = "SELECT lwit_d, lwit_d_bo FROM tab_lok_w where id_d = '$nu';";	
	$resultlwit = @pg_Exec($conn, $sqllwit);
	$lwits = pg_result($resultlwit, 0, "lwit_d");
	$lwitsp = pg_result($resultlwit, 0, "lwit_d_bo");

$sqllpomg = "SELECT lpomg_d, lpomg_d_bo FROM tab_lok_w where id_d = '$nu';";	
	$resultlpomg = @pg_Exec($conn, $sqllpomg);
	$lpomgs = pg_result($resultlpomg, 0, "lpomg_d");
	$lpomgsp = pg_result($resultlpomg, 0, "lpomg_d_bo");

$sqllpoms = "SELECT lpoms_d, lpoms_d_bo FROM tab_lok_w where id_d = '$nu';";	
	$resultllpoms = @pg_Exec($conn, $sqllpoms);
	$lpomss = pg_result($resultllpoms, 0, "lpoms_d");
	$lpomssp = pg_result($resultllpoms, 0, "lpoms_d_bo");

$sqllkond = "SELECT lkond, lkond_bo FROM tab_lok_w where id_d = '$nu';";	
	$resultlkond = @pg_Exec($conn, $sqllkond);
	$lkonds = pg_result($resultlkond, 0, "lkond");
	$lkondsp = pg_result($resultlkond, 0, "lkond_bo");

$sqlrynek = "SELECT rr_d, rr_d_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultrynek = @pg_Exec($conn, $sqlrynek);
			$rrynek = pg_result($resultrynek, 0, "rr_d");
			$rrynekbo = pg_result($resultrynek, 0, "rr_d_bo");
	
$sqlryneks = "SELECT nazwa_r FROM rodzaj_ryn where id = '$rrynek';";
			
			$resultryneks = @pg_Exec($conn, $sqlryneks);
			$rryneks = pg_result($resultryneks, 0, "nazwa_r");


$sqlcm2 = "SELECT cm2_d, cm2_d_bo FROM tab_lok_w where id_d = '$nu';";	
	$resultcm2 = @pg_Exec($conn, $sqlcm2);
	$cenad2 = pg_result($resultcm2, 0, "cm2_d");
	$cenad2bo = pg_result($resultcm2, 0, "cm2_d_bo");
	
$sqlczynsz = "SELECT wysop_d, wysop_d_bo FROM tab_lok_w where id_d = '$nu';";
	$resultczynsz = @pg_Exec($conn, $sqlczynsz);
	$czynszs = pg_result($resultczynsz, 0, "wysop_d");
	$czynszsp = pg_result($resultczynsz, 0, "wysop_d_bo");

$sqlczasp = "SELECT cz_prze_d, cz_prze_d_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultczasp = @pg_Exec($conn, $sqlczasp);
			$czasp = pg_result($resultczasp, 0, "cz_prze_d");
			$czaspbo = pg_result($resultczasp, 0, "cz_prze_d_bo");
	
	$sqlczasps = "SELECT nazwa_prz FROM czas_prz where id = '$czasp';";
			
			$resultczasps = @pg_Exec($conn, $sqlczasps);
			$czasps = pg_result($resultczasps, 0, "nazwa_prz");

$sqlksiega = "SELECT kw_d, kw_d_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultksiega = @pg_Exec($conn, $sqlksiega);
			$ksiega = pg_result($resultksiega, 0, "kw_d");
			$ksiegabo = pg_result($resultksiega, 0, "kw_d_bo");
	
	$sqlksiegas = "SELECT nazwa_k FROM ksiega where id = '$ksiega';";
			
			$resultksiegas = @pg_Exec($conn, $sqlksiegas);
			$ksiegass = pg_result($resultksiegas, 0, "nazwa_k");

$sqlprawny = "SELECT spr_d, spr_d_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultprawny = @pg_Exec($conn, $sqlprawny);
			$prawny = pg_result($resultprawny, 0, "spr_d");
			$prawnybo = pg_result($resultprawny, 0, "spr_d_bo");
	
	$sqlprawnys = "SELECT nazwa_pr FROM stan_pr where id = '$prawny';";
			
			$resultprawnys = @pg_Exec($conn, $sqlprawnys);
			$prawnyss = pg_result($resultprawnys, 0, "nazwa_pr");

$sqlprawnydz = "SELECT spr_dz, spr_dz_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultprawnydz = @pg_Exec($conn, $sqlprawnydz);
			$prawnydz = pg_result($resultprawnydz, 0, "spr_dz");
			$prawnydzbo = pg_result($resultprawnydz, 0, "spr_dz_bo");
	
	$sqlprawnydzs = "SELECT nazwa_pr FROM stan_pr where id = '$prawnydz';";
			
			$resultprawnydzs = @pg_Exec($conn, $sqlprawnydzs);
			$prawnydzss = pg_result($resultprawnydzs, 0, "nazwa_pr");


$sqldw = "SELECT datawp_d, datawp_d_bo FROM tab_lok_w where id_d = '$nu';";
	$resultdw = @pg_Exec($conn, $sqldw);
	$datw = pg_result($resultdw, 0, "datawp_d");
	$datwp = pg_result($resultdw, 0, "datawp_d_bo");

$sqlprof = "SELECT rof_d, rof_d_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultprof = @pg_Exec($conn, $sqlprof);
			$profn = pg_result($resultprof, 0, "rof_d");
			$profnbo = pg_result($resultprof, 0, "rof_d_bo");
	
	$sqlprofs = "SELECT rodzaj_of FROM rodzaj_of_lok where id = '$profn';";
			
			$resultprofs = @pg_Exec($conn, $sqlprofs);
			$profns = pg_result($resultprofs, 0, "rodzaj_of");

if (($lokasp == 't')  || ($wojnbo == 't') || ($powiatbo == 't')  || ($cenasp == 't') || ($powuzytsp == 't') || ($powcalsp == 't') || ($powdzisp == 't') || ($powpomsp == 't') || ($powwitsp == 't')  || ($powpomgsp == 't')  || ($powpomssp == 't')  || ($lpomsp == 't') || ($lwitsp == 't') || ($lpomgsp == 't') || ($lpomssp == 't') || ($lkondsp == 't')  || ($cenad2bo == 't') || ($czynszsp == 't')  || ($czaspbo == 't') || ($ksiegabo == 't')  || ($prawnybo == 't')  || ($prawnydzbo == 't') || ($rrynekbo == 't')  || ($datwp == 't') || ($profnbo == 't')) {

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
if ( ($powuzytsp == 't')  || ($powcalsp == 't') || ($powpomsp == 't')  || ($powdzisp == 't')) {
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

if ($powcalsp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pow. ca³kowita:</b><br>&nbsp;$powcals m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($powdzisp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pow. dzia³ki:</b><br>&nbsp;$powdzis ar";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($powpomsp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pow. pom. biurowych:</b><br>&nbsp;$powpoms m2";
echo "</td>";

}

if ( ($powuzytsp == 't')  || ($powcalsp == 't') || ($powpomsp == 't')  || ($powdzisp == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}
if ( ($powwitsp == 't')  || ($powpomgsp == 't') || ($powpomssp == 't')  || ($lpomsp == 't')) {
echo "<tr>";
}
if ($powwitsp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pow. witryny:</b><br>&nbsp;$powwits m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($powpomgsp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pow. pom.:</b><br>&nbsp;$powpomgs m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($powpomssp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pow. pom. socjaln.:</b><br>&nbsp;$powpomss m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($lpomsp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Liczba pom.biurowych</b><br>&nbsp;$lpoms";
echo "</td>";

}

if ( ($powwitsp == 't')  || ($powpomgsp == 't') || ($powpomssp == 't')  || ($lpomsp == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}

if (($lwitsp == 't') || ($lpomgsp == 't') || ($lpomssp == 't') || ($lkondsp == 't')) {
echo "<tr>";
}
if ($lwitsp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Liczba witryn:</b><br>&nbsp;$lwits";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($lpomgsp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Liczba pom.:</b><br>&nbsp;$lpomgs";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($lpomssp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Liczba pom. socjaln.:</b><br>&nbsp;$lpomss";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($lkondsp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Liczba kondygnacji:</b><br>&nbsp;$lkonds";
echo "</td>";

}

if (($lwitsp == 't') || ($lpomgsp == 't') || ($lpomssp == 't') || ($lkondsp == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}
if (($rrynekbo == 't') || ($cenad2bo == 't') || ($czynszsp == 't') || ($czaspbo == 't')) {
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

if ($cenad2bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Dodatkowe op³aty:</b><br>&nbsp;$cenad2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

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

}

if (($rrynekbo == 't') || ($cenad2bo == 't') || ($czynszsp == 't') || ($czaspbo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}

if (($ksiegabo == 't') || ($prawnybo == 't') || ($prawnydzbo == 't') || ($datwp == 't')) {
echo "<tr>";
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
echo "&nbsp;<b>Stan prawny lokalu:</b><br>&nbsp;$prawnyss";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($prawnydzbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Stan prawny dzia³ki:</b><br>&nbsp;$prawnydzss";
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


if (($ksiegabo == 't') || ($prawnybo == 't') || ($prawnydzbo == 't') || ($datwp == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}

if ($profnbo == 't') {
echo "<tr>";
echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Rodzaj oferty:</b><br>&nbsp;$profns";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
echo "</tr>";
}



if ($profnbo == 't') {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}



$sqlfil1 = "SELECT film1 FROM tab_lok_w where id_d = '$nu';";
			
	$resultfil1 = @pg_Exec($conn, $sqlfil1);
	$fil1ms = pg_result($resultfil1, 0, "film1");

$sqlfil2 = "SELECT film2 FROM tab_lok_w where id_d = '$nu';";
			
	$resultfil2 = @pg_Exec($conn, $sqlfil2);
	$fil2ms = pg_result($resultfil2, 0, "film2");

$sqlfil3 = "SELECT film3 FROM tab_lok_w where id_d = '$nu';";
			
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



$sqlzd1 = "SELECT zd1 FROM tab_lok_w where id_d = '$nu';";
			
	$resultzd1s = @pg_Exec($conn, $sqlzd1);
	$zd1ms = pg_result($resultzd1s, 0, "zd1");

$sqlzd2 = "SELECT zd2 FROM tab_lok_w where id_d = '$nu';";
			
	$resultzd2s = @pg_Exec($conn, $sqlzd2);
	$zd2ms = pg_result($resultzd2s, 0, "zd2");

$sqlzd3 = "SELECT zd3 FROM tab_lok_w where id_d = '$nu';";
			
	$resultzd3s = @pg_Exec($conn, $sqlzd3);
	$zd3ms = pg_result($resultzd3s, 0, "zd3");

$sqlzd4 = "SELECT zd4 FROM tab_lok_w where id_d = '$nu';";
			
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

$sqlpow1 = "SELECT pp1, pp1_bo FROM tab_lok_w where id_d = '$nu';";	
	$resultpow1 = @pg_Exec($conn, $sqlpow1);
	$pow1s = pg_result($resultpow1, 0, "pp1");
	$pow1sp = pg_result($resultpow1, 0, "pp1_bo");

$sqlpop1 = "SELECT pop1, pop1_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultpop1 = @pg_Exec($conn, $sqlpop1);
			$pop1s = pg_result($resultpop1, 0, "pop1");
			$pop1bo = pg_result($resultpop1, 0, "pop1_bo");
				
	$sqlpop1s = "SELECT nazwa_pod FROM podlogi where id = '$pop1s';";
			
			$resultpop1s = @pg_Exec($conn, $sqlpop1s);
			$pop1ps = pg_result($resultpop1s, 0, "nazwa_pod");

$sqlsc1 = "SELECT ps1, ps1_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultsc1 = @pg_Exec($conn, $sqlsc1);
			$psc1s = pg_result($resultsc1, 0, "ps1");
			$psc1bo = pg_result($resultsc1, 0, "ps1_bo");
				
	$sqlsc1s = "SELECT nazwa_sc FROM sciany where id = '$psc1s';";
			
			$resultsc1s = @pg_Exec($conn, $sqlsc1s);
			$psc1ps = pg_result($resultsc1s, 0, "nazwa_sc");

$sqlsuf1 = "SELECT psu1, psu1_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultsuf1 = @pg_Exec($conn, $sqlsuf1);
			$suf1s = pg_result($resultsuf1, 0, "psu1");
			$suf1bo = pg_result($resultsuf1, 0, "psu1_bo");
				
	$sqlsuf1s = "SELECT nazwa_su FROM sufit where id = '$suf1s';";
			
			$resultsuf1s = @pg_Exec($conn, $sqlsuf1s);
			$suf1ps = pg_result($resultsuf1s, 0, "nazwa_su");

$sqlwyp1 = "SELECT wyp1, wyp1_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultwyp1 = @pg_Exec($conn, $sqlwyp1);
			$wyp1s = pg_result($resultwyp1, 0, "wyp1");
			$wyp1bo = pg_result($resultwyp1, 0, "wyp1_bo");
				
	$sqlwyp1s = "SELECT nazwa_wp FROM wyposazenie where id = '$wyp1s';";
			
			$resultwyp1s = @pg_Exec($conn, $sqlwyp1s);
			$wyp1ps = pg_result($resultwyp1s, 0, "nazwa_wp");
			
$sqlpow2 = "SELECT pp2, pp2_bo FROM tab_lok_w where id_d = '$nu';";	
	$resultpow2 = @pg_Exec($conn, $sqlpow2);
	$pow2s = pg_result($resultpow2, 0, "pp2");
	$pow2sp = pg_result($resultpow2, 0, "pp2_bo");

$sqlpop2 = "SELECT pop2, pop2_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultpop2 = @pg_Exec($conn, $sqlpop2);
			$pop2s = pg_result($resultpop2, 0, "pop2");
			$pop2bo = pg_result($resultpop2, 0, "pop2_bo");
				
	$sqlpop2s = "SELECT nazwa_pod FROM podlogi where id = '$pop2s';";
			
			$resultpop2s = @pg_Exec($conn, $sqlpop2s);
			$pop2ps = pg_result($resultpop2s, 0, "nazwa_pod");

$sqlsc2 = "SELECT ps2, ps2_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultsc2 = @pg_Exec($conn, $sqlsc2);
			$psc2s = pg_result($resultsc2, 0, "ps2");
			$psc2bo = pg_result($resultsc2, 0, "ps2_bo");
				
	$sqlsc2s = "SELECT nazwa_sc FROM sciany where id = '$psc2s';";
			
			$resultsc2s = @pg_Exec($conn, $sqlsc2s);
			$psc2ps = pg_result($resultsc2s, 0, "nazwa_sc");

$sqlsuf2 = "SELECT psu2, psu2_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultsuf2 = @pg_Exec($conn, $sqlsuf2);
			$suf2s = pg_result($resultsuf2, 0, "psu2");
			$suf2bo = pg_result($resultsuf2, 0, "psu2_bo");
				
	$sqlsuf2s = "SELECT nazwa_su FROM sufit where id = '$suf2s';";
			
			$resultsuf2s = @pg_Exec($conn, $sqlsuf2s);
			$suf2ps = pg_result($resultsuf2s, 0, "nazwa_su");

$sqlwyp2 = "SELECT wyp2, wyp2_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultwyp2 = @pg_Exec($conn, $sqlwyp2);
			$wyp2s = pg_result($resultwyp2, 0, "wyp2");
			$wyp2bo = pg_result($resultwyp2, 0, "wyp2_bo");
				
	$sqlwyp2s = "SELECT nazwa_wp FROM wyposazenie where id = '$wyp2s';";
			
			$resultwyp2s = @pg_Exec($conn, $sqlwyp2s);
			$wyp2ps = pg_result($resultwyp2s, 0, "nazwa_wp");

$sqlpow3 = "SELECT pp3, pp3_bo FROM tab_lok_w where id_d = '$nu';";	
	$resultpow3 = @pg_Exec($conn, $sqlpow3);
	$pow3s = pg_result($resultpow3, 0, "pp3");
	$pow3sp = pg_result($resultpow3, 0, "pp3_bo");

$sqlpop3 = "SELECT pop3, pop3_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultpop3 = @pg_Exec($conn, $sqlpop3);
			$pop3s = pg_result($resultpop3, 0, "pop3");
			$pop3bo = pg_result($resultpop3, 0, "pop3_bo");
				
	$sqlpop3s = "SELECT nazwa_pod FROM podlogi where id = '$pop3s';";
			
			$resultpop3s = @pg_Exec($conn, $sqlpop3s);
			$pop3ps = pg_result($resultpop3s, 0, "nazwa_pod");

$sqlsc3 = "SELECT ps3, ps3_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultsc3 = @pg_Exec($conn, $sqlsc3);
			$psc3s = pg_result($resultsc3, 0, "ps3");
			$psc3bo = pg_result($resultsc3, 0, "ps3_bo");
				
	$sqlsc3s = "SELECT nazwa_sc FROM sciany where id = '$psc3s';";
			
			$resultsc3s = @pg_Exec($conn, $sqlsc3s);
			$psc3ps = pg_result($resultsc3s, 0, "nazwa_sc");

$sqlsuf3 = "SELECT psu3, psu3_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultsuf3 = @pg_Exec($conn, $sqlsuf3);
			$suf3s = pg_result($resultsuf3, 0, "psu3");
			$suf3bo = pg_result($resultsuf3, 0, "psu3_bo");
				
	$sqlsuf3s = "SELECT nazwa_su FROM sufit where id = '$suf3s';";
			
			$resultsuf3s = @pg_Exec($conn, $sqlsuf3s);
			$suf3ps = pg_result($resultsuf3s, 0, "nazwa_su");

$sqlwyp3 = "SELECT wyp3, wyp3_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultwyp3 = @pg_Exec($conn, $sqlwyp3);
			$wyp3s = pg_result($resultwyp3, 0, "wyp3");
			$wyp3bo = pg_result($resultwyp3, 0, "wyp3_bo");
				
	$sqlwyp3s = "SELECT nazwa_wp FROM wyposazenie where id = '$wyp3s';";
			
			$resultwyp3s = @pg_Exec($conn, $sqlwyp3s);
			$wyp3ps = pg_result($resultwyp3s, 0, "nazwa_wp");

$sqlpow4 = "SELECT pp4, pp4_bo FROM tab_lok_w where id_d = '$nu';";	
	$resultpow4 = @pg_Exec($conn, $sqlpow4);
	$pow4s = pg_result($resultpow4, 0, "pp4");
	$pow4sp = pg_result($resultpow4, 0, "pp4_bo");

$sqlpop4 = "SELECT pop4, pop4_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultpop4 = @pg_Exec($conn, $sqlpop4);
			$pop4s = pg_result($resultpop4, 0, "pop4");
			$pop4bo = pg_result($resultpop4, 0, "pop4_bo");
				
	$sqlpop4s = "SELECT nazwa_pod FROM podlogi where id = '$pop4s';";
			
			$resultpop4s = @pg_Exec($conn, $sqlpop4s);
			$pop4ps = pg_result($resultpop4s, 0, "nazwa_pod");

$sqlsc4 = "SELECT ps4, ps4_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultsc4 = @pg_Exec($conn, $sqlsc4);
			$psc4s = pg_result($resultsc4, 0, "ps4");
			$psc4bo = pg_result($resultsc4, 0, "ps4_bo");
				
	$sqlsc4s = "SELECT nazwa_sc FROM sciany where id = '$psc4s';";
			
			$resultsc4s = @pg_Exec($conn, $sqlsc4s);
			$psc4ps = pg_result($resultsc4s, 0, "nazwa_sc");

$sqlsuf4 = "SELECT psu4, psu4_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultsuf4 = @pg_Exec($conn, $sqlsuf4);
			$suf4s = pg_result($resultsuf4, 0, "psu4");
			$suf4bo = pg_result($resultsuf4, 0, "psu4_bo");
				
	$sqlsuf4s = "SELECT nazwa_su FROM sufit where id = '$suf4s';";
			
			$resultsuf4s = @pg_Exec($conn, $sqlsuf4s);
			$suf4ps = pg_result($resultsuf4s, 0, "nazwa_su");

$sqlwyp4 = "SELECT wyp4, wyp4_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultwyp4 = @pg_Exec($conn, $sqlwyp4);
			$wyp4s = pg_result($resultwyp4, 0, "wyp4");
			$wyp4bo = pg_result($resultwyp4, 0, "wyp4_bo");
				
	$sqlwyp4s = "SELECT nazwa_wp FROM wyposazenie where id = '$wyp4s';";
			
			$resultwyp4s = @pg_Exec($conn, $sqlwyp4s);
			$wyp4ps = pg_result($resultwyp4s, 0, "nazwa_wp");
			
$sqlpow5 = "SELECT pp5, pp5_bo FROM tab_lok_w where id_d = '$nu';";	
	$resultpow5 = @pg_Exec($conn, $sqlpow5);
	$pow5s = pg_result($resultpow5, 0, "pp5");
	$pow5sp = pg_result($resultpow5, 0, "pp5_bo");

$sqlpop5 = "SELECT pop5, pop5_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultpop5 = @pg_Exec($conn, $sqlpop5);
			$pop5s = pg_result($resultpop5, 0, "pop5");
			$pop5bo = pg_result($resultpop5, 0, "pop5_bo");
				
	$sqlpop5s = "SELECT nazwa_pod FROM podlogi where id = '$pop5s';";
			
			$resultpop5s = @pg_Exec($conn, $sqlpop5s);
			$pop5ps = pg_result($resultpop5s, 0, "nazwa_pod");

$sqlsc5 = "SELECT ps5, ps5_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultsc5 = @pg_Exec($conn, $sqlsc5);
			$psc5s = pg_result($resultsc5, 0, "ps5");
			$psc5bo = pg_result($resultsc5, 0, "ps5_bo");
				
	$sqlsc5s = "SELECT nazwa_sc FROM sciany where id = '$psc5s';";
			
			$resultsc5s = @pg_Exec($conn, $sqlsc5s);
			$psc5ps = pg_result($resultsc5s, 0, "nazwa_sc");

$sqlsuf5 = "SELECT psu5, psu5_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultsuf5 = @pg_Exec($conn, $sqlsuf5);
			$suf5s = pg_result($resultsuf5, 0, "psu5");
			$suf5bo = pg_result($resultsuf5, 0, "psu5_bo");
				
	$sqlsuf5s = "SELECT nazwa_su FROM sufit where id = '$suf5s';";
			
			$resultsuf5s = @pg_Exec($conn, $sqlsuf5s);
			$suf5ps = pg_result($resultsuf5s, 0, "nazwa_su");

$sqlwyp5 = "SELECT wyp5, wyp5_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultwyp5 = @pg_Exec($conn, $sqlwyp5);
			$wyp5s = pg_result($resultwyp5, 0, "wyp5");
			$wyp5bo = pg_result($resultwyp5, 0, "wyp5_bo");
				
	$sqlwyp5s = "SELECT nazwa_wp FROM wyposazenie where id = '$wyp5s';";
			
			$resultwyp5s = @pg_Exec($conn, $sqlwyp5s);
			$wyp5ps = pg_result($resultwyp5s, 0, "nazwa_wp");

$sqlpow6 = "SELECT pp6, pp6_bo FROM tab_lok_w where id_d = '$nu';";	
	$resultpow6 = @pg_Exec($conn, $sqlpow6);
	$pow6s = pg_result($resultpow6, 0, "pp6");
	$pow6sp = pg_result($resultpow6, 0, "pp6_bo");

$sqlpop6 = "SELECT pop6, pop6_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultpop6 = @pg_Exec($conn, $sqlpop6);
			$pop6s = pg_result($resultpop6, 0, "pop6");
			$pop6bo = pg_result($resultpop6, 0, "pop6_bo");
				
	$sqlpop6s = "SELECT nazwa_pod FROM podlogi where id = '$pop6s';";
			
			$resultpop6s = @pg_Exec($conn, $sqlpop6s);
			$pop6ps = pg_result($resultpop6s, 0, "nazwa_pod");

$sqlsc6 = "SELECT ps6, ps6_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultsc6 = @pg_Exec($conn, $sqlsc6);
			$psc6s = pg_result($resultsc6, 0, "ps6");
			$psc6bo = pg_result($resultsc6, 0, "ps6_bo");
				
	$sqlsc6s = "SELECT nazwa_sc FROM sciany where id = '$psc6s';";
			
			$resultsc6s = @pg_Exec($conn, $sqlsc6s);
			$psc6ps = pg_result($resultsc6s, 0, "nazwa_sc");

$sqlsuf6 = "SELECT psu6, psu6_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultsuf6 = @pg_Exec($conn, $sqlsuf6);
			$suf6s = pg_result($resultsuf6, 0, "psu6");
			$suf6bo = pg_result($resultsuf6, 0, "psu6_bo");
				
	$sqlsuf6s = "SELECT nazwa_su FROM sufit where id = '$suf6s';";
			
			$resultsuf6s = @pg_Exec($conn, $sqlsuf6s);
			$suf6ps = pg_result($resultsuf6s, 0, "nazwa_su");

$sqlwyp6 = "SELECT wyp6, wyp6_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultwyp6 = @pg_Exec($conn, $sqlwyp6);
			$wyp6s = pg_result($resultwyp6, 0, "wyp6");
			$wyp6bo = pg_result($resultwyp6, 0, "wyp6_bo");
				
	$sqlwyp6s = "SELECT nazwa_wp FROM wyposazenie where id = '$wyp6s';";
			
			$resultwyp6s = @pg_Exec($conn, $sqlwyp6s);
			$wyp6ps = pg_result($resultwyp6s, 0, "nazwa_wp");

$sqlpow7 = "SELECT pp7, pp7_bo FROM tab_lok_w where id_d = '$nu';";	
	$resultpow7 = @pg_Exec($conn, $sqlpow7);
	$pow7s = pg_result($resultpow7, 0, "pp7");
	$pow7sp = pg_result($resultpow7, 0, "pp7_bo");

$sqlpop7 = "SELECT pop7, pop7_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultpop7 = @pg_Exec($conn, $sqlpop7);
			$pop7s = pg_result($resultpop7, 0, "pop7");
			$pop7bo = pg_result($resultpop7, 0, "pop7_bo");
				
	$sqlpop7s = "SELECT nazwa_pod FROM podlogi where id = '$pop7s';";
			
			$resultpop7s = @pg_Exec($conn, $sqlpop7s);
			$pop7ps = pg_result($resultpop7s, 0, "nazwa_pod");

$sqlsc7 = "SELECT ps7, ps7_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultsc7 = @pg_Exec($conn, $sqlsc7);
			$psc7s = pg_result($resultsc7, 0, "ps7");
			$psc7bo = pg_result($resultsc7, 0, "ps7_bo");
				
	$sqlsc7s = "SELECT nazwa_sc FROM sciany where id = '$psc7s';";
			
			$resultsc7s = @pg_Exec($conn, $sqlsc7s);
			$psc7ps = pg_result($resultsc7s, 0, "nazwa_sc");

$sqlsuf7 = "SELECT psu7, psu7_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultsuf7 = @pg_Exec($conn, $sqlsuf7);
			$suf7s = pg_result($resultsuf7, 0, "psu7");
			$suf7bo = pg_result($resultsuf7, 0, "psu7_bo");
				
	$sqlsuf7s = "SELECT nazwa_su FROM sufit where id = '$suf7s';";
			
			$resultsuf7s = @pg_Exec($conn, $sqlsuf7s);
			$suf7ps = pg_result($resultsuf7s, 0, "nazwa_su");

$sqlwyp7 = "SELECT wyp7, wyp7_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultwyp7 = @pg_Exec($conn, $sqlwyp7);
			$wyp7s = pg_result($resultwyp7, 0, "wyp7");
			$wyp7bo = pg_result($resultwyp7, 0, "wyp7_bo");
				
	$sqlwyp7s = "SELECT nazwa_wp FROM wyposazenie where id = '$wyp7s';";
			
			$resultwyp7s = @pg_Exec($conn, $sqlwyp7s);
			$wyp7ps = pg_result($resultwyp7s, 0, "nazwa_wp");


$sqlpow8 = "SELECT pp8, pp8_bo FROM tab_lok_w where id_d = '$nu';";	
	$resultpow8 = @pg_Exec($conn, $sqlpow8);
	$pow8s = pg_result($resultpow8, 0, "pp8");
	$pow8sp = pg_result($resultpow8, 0, "pp8_bo");

$sqlpop8 = "SELECT pop8, pop8_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultpop8 = @pg_Exec($conn, $sqlpop8);
			$pop8s = pg_result($resultpop8, 0, "pop8");
			$pop8bo = pg_result($resultpop8, 0, "pop8_bo");
				
	$sqlpop8s = "SELECT nazwa_pod FROM podlogi where id = '$pop8s';";
			
			$resultpop8s = @pg_Exec($conn, $sqlpop8s);
			$pop8ps = pg_result($resultpop8s, 0, "nazwa_pod");

$sqlsc8 = "SELECT ps8, ps8_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultsc8 = @pg_Exec($conn, $sqlsc8);
			$psc8s = pg_result($resultsc8, 0, "ps8");
			$psc8bo = pg_result($resultsc8, 0, "ps8_bo");
				
	$sqlsc8s = "SELECT nazwa_sc FROM sciany where id = '$psc8s';";
			
			$resultsc8s = @pg_Exec($conn, $sqlsc8s);
			$psc8ps = pg_result($resultsc8s, 0, "nazwa_sc");

$sqlsuf8 = "SELECT psu8, psu8_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultsuf8 = @pg_Exec($conn, $sqlsuf8);
			$suf8s = pg_result($resultsuf8, 0, "psu8");
			$suf8bo = pg_result($resultsuf8, 0, "psu8_bo");
				
	$sqlsuf8s = "SELECT nazwa_su FROM sufit where id = '$suf8s';";
			
			$resultsuf8s = @pg_Exec($conn, $sqlsuf8s);
			$suf8ps = pg_result($resultsuf8s, 0, "nazwa_su");

$sqlwyp8 = "SELECT wyp8, wyp8_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultwyp8 = @pg_Exec($conn, $sqlwyp8);
			$wyp8s = pg_result($resultwyp8, 0, "wyp8");
			$wyp8bo = pg_result($resultwyp8, 0, "wyp8_bo");
				
	$sqlwyp8s = "SELECT nazwa_wp FROM wyposazenie where id = '$wyp8s';";
			
			$resultwyp8s = @pg_Exec($conn, $sqlwyp8s);
			$wyp8ps = pg_result($resultwyp8s, 0, "nazwa_wp");

$sqlpow9 = "SELECT pp9, pp9_bo FROM tab_lok_w where id_d = '$nu';";	
	$resultpow9 = @pg_Exec($conn, $sqlpow9);
	$pow9s = pg_result($resultpow9, 0, "pp9");
	$pow9sp = pg_result($resultpow9, 0, "pp9_bo");

$sqlpop9 = "SELECT pop9, pop9_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultpop9 = @pg_Exec($conn, $sqlpop9);
			$pop9s = pg_result($resultpop9, 0, "pop9");
			$pop9bo = pg_result($resultpop9, 0, "pop9_bo");
				
	$sqlpop9s = "SELECT nazwa_pod FROM podlogi where id = '$pop9s';";
			
			$resultpop9s = @pg_Exec($conn, $sqlpop9s);
			$pop9ps = pg_result($resultpop9s, 0, "nazwa_pod");

$sqlsc9 = "SELECT ps9, ps9_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultsc9 = @pg_Exec($conn, $sqlsc9);
			$psc9s = pg_result($resultsc9, 0, "ps9");
			$psc9bo = pg_result($resultsc9, 0, "ps9_bo");
				
	$sqlsc9s = "SELECT nazwa_sc FROM sciany where id = '$psc9s';";
			
			$resultsc9s = @pg_Exec($conn, $sqlsc9s);
			$psc9ps = pg_result($resultsc9s, 0, "nazwa_sc");

$sqlsuf9 = "SELECT psu9, psu9_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultsuf9 = @pg_Exec($conn, $sqlsuf9);
			$suf9s = pg_result($resultsuf9, 0, "psu9");
			$suf9bo = pg_result($resultsuf9, 0, "psu9_bo");
				
	$sqlsuf9s = "SELECT nazwa_su FROM sufit where id = '$suf9s';";
			
			$resultsuf9s = @pg_Exec($conn, $sqlsuf9s);
			$suf9ps = pg_result($resultsuf9s, 0, "nazwa_su");

$sqlwyp9 = "SELECT wyp9, wyp9_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultwyp9 = @pg_Exec($conn, $sqlwyp9);
			$wyp9s = pg_result($resultwyp9, 0, "wyp9");
			$wyp9bo = pg_result($resultwyp9, 0, "wyp9_bo");
				
	$sqlwyp9s = "SELECT nazwa_wp FROM wyposazenie where id = '$wyp9s';";
			
			$resultwyp9s = @pg_Exec($conn, $sqlwyp9s);
			$wyp9ps = pg_result($resultwyp9s, 0, "nazwa_wp");

$sqlpow10 = "SELECT pp10, pp10_bo FROM tab_lok_w where id_d = '$nu';";	
	$resultpow10 = @pg_Exec($conn, $sqlpow10);
	$pow10s = pg_result($resultpow10, 0, "pp10");
	$pow10sp = pg_result($resultpow10, 0, "pp10_bo");

$sqlpop10 = "SELECT pop10, pop10_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultpop10 = @pg_Exec($conn, $sqlpop10);
			$pop10s = pg_result($resultpop10, 0, "pop10");
			$pop10bo = pg_result($resultpop10, 0, "pop10_bo");
				
	$sqlpop10s = "SELECT nazwa_pod FROM podlogi where id = '$pop10s';";
			
			$resultpop10s = @pg_Exec($conn, $sqlpop10s);
			$pop10ps = pg_result($resultpop10s, 0, "nazwa_pod");

$sqlsc10 = "SELECT ps10, ps10_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultsc10 = @pg_Exec($conn, $sqlsc10);
			$psc10s = pg_result($resultsc10, 0, "ps10");
			$psc10bo = pg_result($resultsc10, 0, "ps10_bo");
				
	$sqlsc10s = "SELECT nazwa_sc FROM sciany where id = '$psc10s';";
			
			$resultsc10s = @pg_Exec($conn, $sqlsc10s);
			$psc10ps = pg_result($resultsc10s, 0, "nazwa_sc");

$sqlsuf10 = "SELECT psu10, psu10_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultsuf10 = @pg_Exec($conn, $sqlsuf10);
			$suf10s = pg_result($resultsuf10, 0, "psu10");
			$suf10bo = pg_result($resultsuf10, 0, "psu10_bo");
				
	$sqlsuf10s = "SELECT nazwa_su FROM sufit where id = '$suf10s';";
			
			$resultsuf10s = @pg_Exec($conn, $sqlsuf10s);
			$suf10ps = pg_result($resultsuf10s, 0, "nazwa_su");

$sqlwyp10 = "SELECT wyp10, wyp10_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultwyp10 = @pg_Exec($conn, $sqlwyp10);
			$wyp10s = pg_result($resultwyp10, 0, "wyp10");
			$wyp10bo = pg_result($resultwyp10, 0, "wyp10_bo");
				
	$sqlwyp10s = "SELECT nazwa_wp FROM wyposazenie where id = '$wyp10s';";
			
			$resultwyp10s = @pg_Exec($conn, $sqlwyp10s);
			$wyp10ps = pg_result($resultwyp10s, 0, "nazwa_wp");

$sqlpow11 = "SELECT pp11, pp11_bo FROM tab_lok_w where id_d = '$nu';";	
	$resultpow11 = @pg_Exec($conn, $sqlpow11);
	$pow11s = pg_result($resultpow11, 0, "pp11");
	$pow11sp = pg_result($resultpow11, 0, "pp11_bo");

$sqlpop11 = "SELECT pop11, pop11_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultpop11 = @pg_Exec($conn, $sqlpop11);
			$pop11s = pg_result($resultpop11, 0, "pop11");
			$pop11bo = pg_result($resultpop11, 0, "pop11_bo");
				
	$sqlpop11s = "SELECT nazwa_pod FROM podlogi where id = '$pop11s';";
			
			$resultpop11s = @pg_Exec($conn, $sqlpop11s);
			$pop11ps = pg_result($resultpop11s, 0, "nazwa_pod");

$sqlsc11 = "SELECT ps11, ps11_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultsc11 = @pg_Exec($conn, $sqlsc11);
			$psc11s = pg_result($resultsc11, 0, "ps11");
			$psc11bo = pg_result($resultsc11, 0, "ps11_bo");
				
	$sqlsc11s = "SELECT nazwa_sc FROM sciany where id = '$psc11s';";
			
			$resultsc11s = @pg_Exec($conn, $sqlsc11s);
			$psc11ps = pg_result($resultsc11s, 0, "nazwa_sc");

$sqlsuf11 = "SELECT psu11, psu11_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultsuf11 = @pg_Exec($conn, $sqlsuf11);
			$suf11s = pg_result($resultsuf11, 0, "psu11");
			$suf11bo = pg_result($resultsuf11, 0, "psu11_bo");
				
	$sqlsuf11s = "SELECT nazwa_su FROM sufit where id = '$suf11s';";
			
			$resultsuf11s = @pg_Exec($conn, $sqlsuf11s);
			$suf11ps = pg_result($resultsuf11s, 0, "nazwa_su");

$sqlwyp11 = "SELECT wyp11, wyp11_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultwyp11 = @pg_Exec($conn, $sqlwyp11);
			$wyp11s = pg_result($resultwyp11, 0, "wyp11");
			$wyp11bo = pg_result($resultwyp11, 0, "wyp11_bo");
				
	$sqlwyp11s = "SELECT nazwa_wp FROM wyposazenie where id = '$wyp11s';";
			
			$resultwyp11s = @pg_Exec($conn, $sqlwyp11s);
			$wyp11ps = pg_result($resultwyp11s, 0, "nazwa_wp");

$sqlpow12 = "SELECT pp12, pp12_bo FROM tab_lok_w where id_d = '$nu';";	
	$resultpow12 = @pg_Exec($conn, $sqlpow12);
	$pow12s = pg_result($resultpow12, 0, "pp12");
	$pow12sp = pg_result($resultpow12, 0, "pp12_bo");

$sqlpop12 = "SELECT pop12, pop12_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultpop12 = @pg_Exec($conn, $sqlpop12);
			$pop12s = pg_result($resultpop12, 0, "pop12");
			$pop12bo = pg_result($resultpop12, 0, "pop12_bo");
				
	$sqlpop12s = "SELECT nazwa_pod FROM podlogi where id = '$pop12s';";
			
			$resultpop12s = @pg_Exec($conn, $sqlpop12s);
			$pop12ps = pg_result($resultpop12s, 0, "nazwa_pod");

$sqlsc12 = "SELECT ps12, ps12_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultsc12 = @pg_Exec($conn, $sqlsc12);
			$psc12s = pg_result($resultsc12, 0, "ps12");
			$psc12bo = pg_result($resultsc12, 0, "ps12_bo");
				
	$sqlsc12s = "SELECT nazwa_sc FROM sciany where id = '$psc12s';";
			
			$resultsc12s = @pg_Exec($conn, $sqlsc12s);
			$psc12ps = pg_result($resultsc12s, 0, "nazwa_sc");

$sqlsuf12 = "SELECT psu12, psu12_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultsuf12 = @pg_Exec($conn, $sqlsuf12);
			$suf12s = pg_result($resultsuf12, 0, "psu12");
			$suf12bo = pg_result($resultsuf12, 0, "psu12_bo");
				
	$sqlsuf12s = "SELECT nazwa_su FROM sufit where id = '$suf12s';";
			
			$resultsuf12s = @pg_Exec($conn, $sqlsuf12s);
			$suf12ps = pg_result($resultsuf12s, 0, "nazwa_su");

$sqlwyp12 = "SELECT wyp12, wyp12_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultwyp12 = @pg_Exec($conn, $sqlwyp12);
			$wyp12s = pg_result($resultwyp12, 0, "wyp12");
			$wyp12bo = pg_result($resultwyp12, 0, "wyp12_bo");
				
	$sqlwyp12s = "SELECT nazwa_wp FROM wyposazenie where id = '$wyp12s';";
			
			$resultwyp12s = @pg_Exec($conn, $sqlwyp12s);
			$wyp12ps = pg_result($resultwyp12s, 0, "nazwa_wp");

if (($pow1sp == 't')  || ($pop1bo == 't') || ($psc1bo == 't')  || ($suf1bo == 't') || ($wyp1bo == 't') || ($pow2sp == 't')  || ($pop2bo == 't') || ($psc2bo == 't')  || ($suf2bo == 't') || ($wyp2bo == 't') || ($pow3sp == 't')  || ($pop3bo == 't') || ($psc3bo == 't')  || ($suf3bo == 't') || ($wyp3bo == 't') || ($pow4sp == 't')  || ($pop4bo == 't') || ($psc4bo == 't')  || ($suf4bo == 't') || ($wyp4bo == 't') || ($pow5sp == 't')  || ($pop5bo == 't') || ($psc5bo == 't')  || ($suf5bo == 't') || ($wyp5bo == 't') || ($pow6sp == 't')  || ($pop6bo == 't') || ($psc6bo == 't')  || ($suf6bo == 't') || ($wyp6bo == 't') || ($pow7sp == 't')  || ($pop7bo == 't') || ($psc7bo == 't')  || ($suf7bo == 't') || ($wyp7bo == 't') || ($pow8sp == 't')  || ($pop8bo == 't') || ($psc8bo == 't')  || ($suf8bo == 't') || ($wyp8bo == 't') || ($pow9sp == 't')  || ($pop9bo == 't') || ($psc9bo == 't')  || ($suf9bo == 't') || ($wyp9bo == 't') || ($pow10sp == 't')  || ($pop10bo == 't') || ($psc10bo == 't')  || ($suf10bo == 't') || ($wyp10bo == 't') || ($pow11sp == 't')  || ($pop11bo == 't') || ($psc11bo == 't')  || ($suf11bo == 't') || ($wyp11bo == 't') || ($pow12sp == 't')  || ($pop12bo == 't') || ($psc12bo == 't')  || ($suf12bo == 't') || ($wyp12bo == 't')) {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

echo "<tr><td colspan=\"40\" height=\"7\" bgcolor=\"#5865E5\">";
echo "<span class=\"nag1wb\">";
echo "&nbsp;Pomieszczenia gospodarcze";
echo "</span>";
echo "</td></tr>";

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}
if (($pow1sp == 't')  || ($pop1bo == 't') || ($psc1bo == 't')  || ($suf1bo == 't')) {
echo "<tr>"; 
}
if ($pow1sp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pow. pom. 1:</b><br>&nbsp;$pow1s m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($pop1bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pod³oga pom. 1:</b><br>&nbsp;$pop1ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($psc1bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>¦ciana pom. 1:</b><br>&nbsp;$psc1ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($suf1bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Sufit pom. 1:</b><br>&nbsp;$suf1ps";
echo "</td>";

}

if (($pow1sp == 't')  || ($pop1bo == 't') || ($psc1bo == 't')  || ($suf1bo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}


if ($wyp1bo == 't') {

echo "<tr>";
echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Wyposa¿enie pom. 1:</b><br>&nbsp;$wyp1ps";
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
echo "&nbsp;<b>Pow. pom. 2:</b><br>&nbsp;$pow2s m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($pop2bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pod³oga pom. 2:</b><br>&nbsp;$pop2ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($psc2bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>¦ciana pom. 2:</b><br>&nbsp;$psc2ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($suf2bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Sufit pom. 2:</b><br>&nbsp;$suf2ps";
echo "</td>";

}

if ( ($pow2sp == 't')  || ($pop2bo == 't') || ($psc2bo == 't')  || ($suf2bo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}

if ($wyp2bo == 't') {
echo "<tr>";
echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Wyposa¿enie pom. 2:</b><br>&nbsp;$wyp2ps";
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
echo "&nbsp;<b>Pow. pom. 3:</b><br>&nbsp;$pow3s m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($pop3bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pod³oga pom. 3:</b><br>&nbsp;$pop3ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($psc3bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>¦ciana pom. 3:</b><br>&nbsp;$psc3ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($suf3bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Sufit pom. 3:</b><br>&nbsp;$suf3ps";
echo "</td>";

}

if ( ($pow3sp == 't')  || ($pop3bo == 't') || ($psc3bo == 't')  || ($suf3bo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}

if ($wyp3bo == 't') {
echo "<tr>";
echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Wyposa¿enie pom. 3:</b><br>&nbsp;$wyp3ps";
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
echo "&nbsp;<b>Pow. pom. 4:</b><br>&nbsp;$pow4s m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($pop4bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pod³oga pom. 4:</b><br>&nbsp;$pop4ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($psc4bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>¦ciana pom. 4:</b><br>&nbsp;$psc4ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($suf4bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Sufit pom. 4:</b><br>&nbsp;$suf4ps";
echo "</td>";

}

if ( ($pow4sp == 't')  || ($pop4bo == 't') || ($psc4bo == 't')  || ($suf4bo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}

if ($wyp4bo == 't') {
echo "<tr>";
echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Wyposa¿enie pom. 4:</b><br>&nbsp;$wyp4ps";
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
echo "&nbsp;<b>Pow. pom. 5:</b><br>&nbsp;$pow5s m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($pop5bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pod³oga pom. 5:</b><br>&nbsp;$pop5ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($psc5bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>¦ciana pom. 5:</b><br>&nbsp;$psc5ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($suf5bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Sufit pom. 5:</b><br>&nbsp;$suf5ps";
echo "</td>";

}

if ( ($pow5sp == 't')  || ($pop5bo == 't') || ($psc5bo == 't')  || ($suf5bo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}

if ($wyp5bo == 't') {
echo "<tr>";
echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Wyposa¿enie pom. 5:</b><br>&nbsp;$wyp5ps";
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
echo "&nbsp;<b>Pow. pom. 6:</b><br>&nbsp;$pow6s m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($pop6bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pod³oga pom. 6:</b><br>&nbsp;$pop6ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($psc6bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>¦ciana pom. 6:</b><br>&nbsp;$psc6ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($suf6bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Sufit pom. 6:</b><br>&nbsp;$suf6ps";
echo "</td>";

}

if ( ($pow6sp == 't')  || ($pop6bo == 't') || ($psc6bo == 't')  || ($suf6bo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}

if ($wyp6bo == 't') {
echo "<tr>";
echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Wyposa¿enie pom. 6:</b><br>&nbsp;$wyp6ps";
echo "</td>";
echo "</tr>";

}	

if ($wyp6bo == 't') {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}

if ( ($pow7sp == 't')  || ($pop7bo == 't') || ($psc7bo == 't')  || ($suf7bo == 't')) {
echo "<tr>"; 
}
if ($pow7sp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pow. pom. 7:</b><br>&nbsp;$pow7s m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($pop7bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pod³oga pom. 7:</b><br>&nbsp;$pop7ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($psc7bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>¦ciana pom. 7:</b><br>&nbsp;$psc7ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($suf7bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Sufit pom. 7:</b><br>&nbsp;$suf7ps";
echo "</td>";

}

if ( ($pow7sp == 't')  || ($pop7bo == 't') || ($psc7bo == 't')  || ($suf7bo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}

if ($wyp7bo == 't') {
echo "<tr>";
echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Wyposa¿enie pom. 7:</b><br>&nbsp;$wyp7ps";
echo "</td>";
echo "</tr>";
}	

if ($wyp7bo == 't') {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}

if ( ($pow8sp == 't')  || ($pop8bo == 't') || ($psc8bo == 't')  || ($suf8bo == 't')) {
echo "<tr>"; 
}
if ($pow8sp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pow. pom. 8:</b><br>&nbsp;$pow8s m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($pop8bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pod³oga pom. 8:</b><br>&nbsp;$pop8ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($psc8bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>¦ciana pom. 8:</b><br>&nbsp;$psc8ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($suf8bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Sufit pom. 8:</b><br>&nbsp;$suf8ps";
echo "</td>";

}

if ( ($pow8sp == 't')  || ($pop8bo == 't') || ($psc8bo == 't')  || ($suf8bo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}

if ($wyp8bo == 't') {
echo "<tr>";
echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Wyposa¿enie pom. 8:</b><br>&nbsp;$wyp8ps";
echo "</td>";
echo "</tr>";
}	

if ($wyp8bo == 't') {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}

if ( ($pow9sp == 't')  || ($pop9bo == 't') || ($psc9bo == 't')  || ($suf9bo == 't')) {
echo "<tr>"; 
}
if ($pow9sp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pow. pom. 9:</b><br>&nbsp;$pow9s m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($pop9bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pod³oga pom. 9:</b><br>&nbsp;$pop9ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($psc9bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>¦ciana pom. 9:</b><br>&nbsp;$psc9ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($suf9bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Sufit pom. 9:</b><br>&nbsp;$suf9ps";
echo "</td>";

}

if ( ($pow9sp == 't')  || ($pop9bo == 't') || ($psc9bo == 't')  || ($suf9bo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}

if ($wyp9bo == 't') {
echo "<tr>";
echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Wyposa¿enie pom. 9:</b><br>&nbsp;$wyp9ps";
echo "</td>";
echo "</tr>";
}	

if ($wyp9bo == 't') {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}
if ( ($pow10sp == 't')  || ($pop10bo == 't') || ($psc10bo == 't')  || ($suf10bo == 't')) {
echo "<tr>"; 
}
if ($pow10sp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pow. pom. 10:</b><br>&nbsp;$pow10s m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($pop10bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pod³oga pom. 10:</b><br>&nbsp;$pop10ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($psc10bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>¦ciana pom. 10:</b><br>&nbsp;$psc10ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($suf10bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Sufit pom. 10:</b><br>&nbsp;$suf10ps";
echo "</td>";

}

if ( ($pow10sp == 't')  || ($pop10bo == 't') || ($psc10bo == 't')  || ($suf10bo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}

if ($wyp10bo == 't') {
echo "<tr>";
echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Wyposa¿enie pom. 10:</b><br>&nbsp;$wyp10ps";
echo "</td>";
echo "</tr>";
}	

if ($wyp10bo == 't') {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}
if ( ($pow11sp == 't')  || ($pop11bo == 't') || ($psc11bo == 't')  || ($suf11bo == 't')) {
echo "<tr>"; 
}
if ($pow11sp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pow. pom. 11:</b><br>&nbsp;$pow11s m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($pop11bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pod³oga pom. 11:</b><br>&nbsp;$pop11ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($psc11bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>¦ciana pom. 11:</b><br>&nbsp;$psc11ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($suf11bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Sufit pom. 11:</b><br>&nbsp;$suf11ps";
echo "</td>";

}


if ( ($pow11sp == 't')  || ($pop11bo == 't') || ($psc11bo == 't')  || ($suf11bo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}

if ($wyp11bo == 't') {
echo "<tr>";
echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Wyposa¿enie pom. 11:</b><br>&nbsp;$wyp11ps";
echo "</td>";
echo "</tr>";
}	

if ($wyp11bo == 't') {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}

if ( ($pow12sp == 't')  || ($pop12bo == 't') || ($psc12bo == 't')  || ($suf12bo == 't')) {
echo "<tr>"; 
}

if ($pow12sp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pow. pom. 12:</b><br>&nbsp;$pow12s m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($pop12bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pod³oga pom. 12:</b><br>&nbsp;$pop12ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($psc12bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>¦ciana pom. 12:</b><br>&nbsp;$psc12ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($suf12bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Sufit pom. 12:</b><br>&nbsp;$suf12ps";
echo "</td>";

}

if ( ($pow12sp == 't')  || ($pop12bo == 't') || ($psc12bo == 't')  || ($suf12bo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}

if ($wyp12bo == 't') {
echo "<tr>";
echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Wyposa¿enie pom. 12:</b><br>&nbsp;$wyp12ps";
echo "</td>";
echo "</tr>";
}	

if ($wyp12bo == 't') {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}


$sqlzd5 = "SELECT zd5 FROM tab_lok_w where id_d = '$nu';";
			
	$resultzd5s = @pg_Exec($conn, $sqlzd5);
	$zd5ms = pg_result($resultzd5s, 0, "zd5");

$sqlzd6 = "SELECT zd6 FROM tab_lok_w where id_d = '$nu';";
			
	$resultzd6s = @pg_Exec($conn, $sqlzd6);
	$zd6ms = pg_result($resultzd6s, 0, "zd6");

$sqlzd7 = "SELECT zd7 FROM tab_lok_w where id_d = '$nu';";
			
	$resultzd7s = @pg_Exec($conn, $sqlzd7);
	$zd7ms = pg_result($resultzd7s, 0, "zd7");

$sqlzd8 = "SELECT zd8 FROM tab_lok_w where id_d = '$nu';";
			
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

$sqlpowb1 = "SELECT ppb1, ppb1_bo FROM tab_lok_w where id_d = '$nu';";	
	$resultpowb1 = @pg_Exec($conn, $sqlpowb1);
	$powb1s = pg_result($resultpowb1, 0, "ppb1");
	$powb1sp = pg_result($resultpowb1, 0, "ppb1_bo");

$sqlpopb1 = "SELECT popb1, popb1_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultpopb1 = @pg_Exec($conn, $sqlpopb1);
			$popb1s = pg_result($resultpopb1, 0, "popb1");
			$popb1bo = pg_result($resultpopb1, 0, "popb1_bo");
				
	$sqlpopb1s = "SELECT nazwa_pod FROM podlogi where id = '$popb1s';";
			
			$resultpopb1s = @pg_Exec($conn, $sqlpopb1s);
			$popb1ps = pg_result($resultpopb1s, 0, "nazwa_pod");

$sqlsb1 = "SELECT psb1, psb1_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultsb1 = @pg_Exec($conn, $sqlsb1);
			$psb1s = pg_result($resultsb1, 0, "psb1");
			$psb1bo = pg_result($resultsb1, 0, "psb1_bo");
				
	$sqlsb1s = "SELECT nazwa_sc FROM sciany where id = '$psb1s';";
			
			$resultsb1s = @pg_Exec($conn, $sqlsb1s);
			$psb1ps = pg_result($resultsb1s, 0, "nazwa_sc");

$sqlsufb1 = "SELECT psub1, psub1_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultsufb1 = @pg_Exec($conn, $sqlsufb1);
			$sufb1s = pg_result($resultsufb1, 0, "psub1");
			$sufb1bo = pg_result($resultsufb1, 0, "psub1_bo");
				
	$sqlsufb1s = "SELECT nazwa_su FROM sufit where id = '$sufb1s';";
			
			$resultsufb1s = @pg_Exec($conn, $sqlsufb1s);
			$sufb1ps = pg_result($resultsufb1s, 0, "nazwa_su");

$sqlwypb1 = "SELECT wypb1, wypb1_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultwypb1 = @pg_Exec($conn, $sqlwypb1);
			$wypb1s = pg_result($resultwypb1, 0, "wypb1");
			$wypb1bo = pg_result($resultwypb1, 0, "wypb1_bo");
				
	$sqlwypb1s = "SELECT nazwa_wp FROM wyposazenie where id = '$wypb1s';";
			
			$resultwypb1s = @pg_Exec($conn, $sqlwypb1s);
			$wypb1ps = pg_result($resultwypb1s, 0, "nazwa_wp");


$sqlpowb2 = "SELECT ppb2, ppb2_bo FROM tab_lok_w where id_d = '$nu';";	
	$resultpowb2 = @pg_Exec($conn, $sqlpowb2);
	$powb2s = pg_result($resultpowb2, 0, "ppb2");
	$powb2sp = pg_result($resultpowb2, 0, "ppb2_bo");

$sqlpopb2 = "SELECT popb2, popb2_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultpopb2 = @pg_Exec($conn, $sqlpopb2);
			$popb2s = pg_result($resultpopb2, 0, "popb2");
			$popb2bo = pg_result($resultpopb2, 0, "popb2_bo");
				
	$sqlpopb2s = "SELECT nazwa_pod FROM podlogi where id = '$popb2s';";
			
			$resultpopb2s = @pg_Exec($conn, $sqlpopb2s);
			$popb2ps = pg_result($resultpopb2s, 0, "nazwa_pod");

$sqlsb2 = "SELECT psb2, psb2_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultsb2 = @pg_Exec($conn, $sqlsb2);
			$psb2s = pg_result($resultsb2, 0, "psb2");
			$psb2bo = pg_result($resultsb2, 0, "psb2_bo");
				
	$sqlsb2s = "SELECT nazwa_sc FROM sciany where id = '$psb2s';";
			
			$resultsb2s = @pg_Exec($conn, $sqlsb2s);
			$psb2ps = pg_result($resultsb2s, 0, "nazwa_sc");

$sqlsufb2 = "SELECT psub2, psub2_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultsufb2 = @pg_Exec($conn, $sqlsufb2);
			$sufb2s = pg_result($resultsufb2, 0, "psub2");
			$sufb2bo = pg_result($resultsufb2, 0, "psub2_bo");
				
	$sqlsufb2s = "SELECT nazwa_su FROM sufit where id = '$sufb2s';";
			
			$resultsufb2s = @pg_Exec($conn, $sqlsufb2s);
			$sufb2ps = pg_result($resultsufb2s, 0, "nazwa_su");

$sqlwypb2 = "SELECT wypb2, wypb2_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultwypb2 = @pg_Exec($conn, $sqlwypb2);
			$wypb2s = pg_result($resultwypb2, 0, "wypb2");
			$wypb2bo = pg_result($resultwypb2, 0, "wypb2_bo");
				
	$sqlwypb2s = "SELECT nazwa_wp FROM wyposazenie where id = '$wypb2s';";
			
			$resultwypb2s = @pg_Exec($conn, $sqlwypb2s);
			$wypb2ps = pg_result($resultwypb2s, 0, "nazwa_wp");


$sqlpowb3 = "SELECT ppb3, ppb3_bo FROM tab_lok_w where id_d = '$nu';";	
	$resultpowb3 = @pg_Exec($conn, $sqlpowb3);
	$powb3s = pg_result($resultpowb3, 0, "ppb3");
	$powb3sp = pg_result($resultpowb3, 0, "ppb3_bo");

$sqlpopb3 = "SELECT popb3, popb3_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultpopb3 = @pg_Exec($conn, $sqlpopb3);
			$popb3s = pg_result($resultpopb3, 0, "popb3");
			$popb3bo = pg_result($resultpopb3, 0, "popb3_bo");
				
	$sqlpopb3s = "SELECT nazwa_pod FROM podlogi where id = '$popb3s';";
			
			$resultpopb3s = @pg_Exec($conn, $sqlpopb3s);
			$popb3ps = pg_result($resultpopb3s, 0, "nazwa_pod");

$sqlsb3 = "SELECT psb3, psb3_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultsb3 = @pg_Exec($conn, $sqlsb3);
			$psb3s = pg_result($resultsb3, 0, "psb3");
			$psb3bo = pg_result($resultsb3, 0, "psb3_bo");
				
	$sqlsb3s = "SELECT nazwa_sc FROM sciany where id = '$psb3s';";
			
			$resultsb3s = @pg_Exec($conn, $sqlsb3s);
			$psb3ps = pg_result($resultsb3s, 0, "nazwa_sc");

$sqlsufb3 = "SELECT psub3, psub3_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultsufb3 = @pg_Exec($conn, $sqlsufb3);
			$sufb3s = pg_result($resultsufb3, 0, "psub3");
			$sufb3bo = pg_result($resultsufb3, 0, "psub3_bo");
				
	$sqlsufb3s = "SELECT nazwa_su FROM sufit where id = '$sufb3s';";
			
			$resultsufb3s = @pg_Exec($conn, $sqlsufb3s);
			$sufb3ps = pg_result($resultsufb3s, 0, "nazwa_su");

$sqlwypb3 = "SELECT wypb3, wypb3_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultwypb3 = @pg_Exec($conn, $sqlwypb3);
			$wypb3s = pg_result($resultwypb3, 0, "wypb3");
			$wypb3bo = pg_result($resultwypb3, 0, "wypb3_bo");
				
	$sqlwypb3s = "SELECT nazwa_wp FROM wyposazenie where id = '$wypb3s';";
			
			$resultwypb3s = @pg_Exec($conn, $sqlwypb3s);
			$wypb3ps = pg_result($resultwypb3s, 0, "nazwa_wp");

$sqlpowb4 = "SELECT ppb4, ppb4_bo FROM tab_lok_w where id_d = '$nu';";	
	$resultpowb4 = @pg_Exec($conn, $sqlpowb4);
	$powb4s = pg_result($resultpowb4, 0, "ppb4");
	$powb4sp = pg_result($resultpowb4, 0, "ppb4_bo");

$sqlpopb4 = "SELECT popb4, popb4_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultpopb4 = @pg_Exec($conn, $sqlpopb4);
			$popb4s = pg_result($resultpopb4, 0, "popb4");
			$popb4bo = pg_result($resultpopb4, 0, "popb4_bo");
				
	$sqlpopb4s = "SELECT nazwa_pod FROM podlogi where id = '$popb4s';";
			
			$resultpopb4s = @pg_Exec($conn, $sqlpopb4s);
			$popb4ps = pg_result($resultpopb4s, 0, "nazwa_pod");

$sqlsb4 = "SELECT psb4, psb4_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultsb4 = @pg_Exec($conn, $sqlsb4);
			$psb4s = pg_result($resultsb4, 0, "psb4");
			$psb4bo = pg_result($resultsb4, 0, "psb4_bo");
				
	$sqlsb4s = "SELECT nazwa_sc FROM sciany where id = '$psb4s';";
			
			$resultsb4s = @pg_Exec($conn, $sqlsb4s);
			$psb4ps = pg_result($resultsb4s, 0, "nazwa_sc");

$sqlsufb4 = "SELECT psub4, psub4_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultsufb4 = @pg_Exec($conn, $sqlsufb4);
			$sufb4s = pg_result($resultsufb4, 0, "psub4");
			$sufb4bo = pg_result($resultsufb4, 0, "psub4_bo");
				
	$sqlsufb4s = "SELECT nazwa_su FROM sufit where id = '$sufb4s';";
			
			$resultsufb4s = @pg_Exec($conn, $sqlsufb4s);
			$sufb4ps = pg_result($resultsufb4s, 0, "nazwa_su");

$sqlwypb4 = "SELECT wypb4, wypb4_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultwypb4 = @pg_Exec($conn, $sqlwypb4);
			$wypb4s = pg_result($resultwypb4, 0, "wypb4");
			$wypb4bo = pg_result($resultwypb4, 0, "wypb4_bo");
				
	$sqlwypb4s = "SELECT nazwa_wp FROM wyposazenie where id = '$wypb4s';";
			
			$resultwypb4s = @pg_Exec($conn, $sqlwypb4s);
			$wypb4ps = pg_result($resultwypb4s, 0, "nazwa_wp");

$sqlpowb5 = "SELECT ppb5, ppb5_bo FROM tab_lok_w where id_d = '$nu';";	
	$resultpowb5 = @pg_Exec($conn, $sqlpowb5);
	$powb5s = pg_result($resultpowb5, 0, "ppb5");
	$powb5sp = pg_result($resultpowb5, 0, "ppb5_bo");

$sqlpopb5 = "SELECT popb5, popb5_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultpopb5 = @pg_Exec($conn, $sqlpopb5);
			$popb5s = pg_result($resultpopb5, 0, "popb5");
			$popb5bo = pg_result($resultpopb5, 0, "popb5_bo");
				
	$sqlpopb5s = "SELECT nazwa_pod FROM podlogi where id = '$popb5s';";
			
			$resultpopb5s = @pg_Exec($conn, $sqlpopb5s);
			$popb5ps = pg_result($resultpopb5s, 0, "nazwa_pod");

$sqlsb5 = "SELECT psb5, psb5_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultsb5 = @pg_Exec($conn, $sqlsb5);
			$psb5s = pg_result($resultsb5, 0, "psb5");
			$psb5bo = pg_result($resultsb5, 0, "psb5_bo");
				
	$sqlsb5s = "SELECT nazwa_sc FROM sciany where id = '$psb5s';";
			
			$resultsb5s = @pg_Exec($conn, $sqlsb5s);
			$psb5ps = pg_result($resultsb5s, 0, "nazwa_sc");

$sqlsufb5 = "SELECT psub5, psub5_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultsufb5 = @pg_Exec($conn, $sqlsufb5);
			$sufb5s = pg_result($resultsufb5, 0, "psub5");
			$sufb5bo = pg_result($resultsufb5, 0, "psub5_bo");
				
	$sqlsufb5s = "SELECT nazwa_su FROM sufit where id = '$sufb5s';";
			
			$resultsufb5s = @pg_Exec($conn, $sqlsufb5s);
			$sufb5ps = pg_result($resultsufb5s, 0, "nazwa_su");

$sqlwypb5 = "SELECT wypb5, wypb5_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultwypb5 = @pg_Exec($conn, $sqlwypb5);
			$wypb5s = pg_result($resultwypb5, 0, "wypb5");
			$wypb5bo = pg_result($resultwypb5, 0, "wypb5_bo");
				
	$sqlwypb5s = "SELECT nazwa_wp FROM wyposazenie where id = '$wypb5s';";
			
			$resultwypb5s = @pg_Exec($conn, $sqlwypb5s);
			$wypb5ps = pg_result($resultwypb5s, 0, "nazwa_wp");

$sqlpowb6 = "SELECT ppb6, ppb6_bo FROM tab_lok_w where id_d = '$nu';";	
	$resultpowb6 = @pg_Exec($conn, $sqlpowb6);
	$powb6s = pg_result($resultpowb6, 0, "ppb6");
	$powb6sp = pg_result($resultpowb6, 0, "ppb6_bo");

$sqlpopb6 = "SELECT popb6, popb6_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultpopb6 = @pg_Exec($conn, $sqlpopb6);
			$popb6s = pg_result($resultpopb6, 0, "popb6");
			$popb6bo = pg_result($resultpopb6, 0, "popb6_bo");
				
	$sqlpopb6s = "SELECT nazwa_pod FROM podlogi where id = '$popb6s';";
			
			$resultpopb6s = @pg_Exec($conn, $sqlpopb6s);
			$popb6ps = pg_result($resultpopb6s, 0, "nazwa_pod");

$sqlsb6 = "SELECT psb6, psb6_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultsb6 = @pg_Exec($conn, $sqlsb6);
			$psb6s = pg_result($resultsb6, 0, "psb6");
			$psb6bo = pg_result($resultsb6, 0, "psb6_bo");
				
	$sqlsb6s = "SELECT nazwa_sc FROM sciany where id = '$psb6s';";
			
			$resultsb6s = @pg_Exec($conn, $sqlsb6s);
			$psb6ps = pg_result($resultsb6s, 0, "nazwa_sc");

$sqlsufb6 = "SELECT psub6, psub6_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultsufb6 = @pg_Exec($conn, $sqlsufb6);
			$sufb6s = pg_result($resultsufb6, 0, "psub6");
			$sufb6bo = pg_result($resultsufb6, 0, "psub6_bo");
				
	$sqlsufb6s = "SELECT nazwa_su FROM sufit where id = '$sufb6s';";
			
			$resultsufb6s = @pg_Exec($conn, $sqlsufb6s);
			$sufb6ps = pg_result($resultsufb6s, 0, "nazwa_su");

$sqlwypb6 = "SELECT wypb6, wypb6_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultwypb6 = @pg_Exec($conn, $sqlwypb6);
			$wypb6s = pg_result($resultwypb6, 0, "wypb6");
			$wypb6bo = pg_result($resultwypb6, 0, "wypb6_bo");
				
	$sqlwypb6s = "SELECT nazwa_wp FROM wyposazenie where id = '$wypb6s';";
			
			$resultwypb6s = @pg_Exec($conn, $sqlwypb6s);
			$wypb6ps = pg_result($resultwypb6s, 0, "nazwa_wp");

$sqlpowb7 = "SELECT ppb7, ppb7_bo FROM tab_lok_w where id_d = '$nu';";	
	$resultpowb7 = @pg_Exec($conn, $sqlpowb7);
	$powb7s = pg_result($resultpowb7, 0, "ppb7");
	$powb7sp = pg_result($resultpowb7, 0, "ppb7_bo");

$sqlpopb7 = "SELECT popb7, popb7_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultpopb7 = @pg_Exec($conn, $sqlpopb7);
			$popb7s = pg_result($resultpopb7, 0, "popb7");
			$popb7bo = pg_result($resultpopb7, 0, "popb7_bo");
				
	$sqlpopb7s = "SELECT nazwa_pod FROM podlogi where id = '$popb7s';";
			
			$resultpopb7s = @pg_Exec($conn, $sqlpopb7s);
			$popb7ps = pg_result($resultpopb7s, 0, "nazwa_pod");

$sqlsb7 = "SELECT psb7, psb7_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultsb7 = @pg_Exec($conn, $sqlsb7);
			$psb7s = pg_result($resultsb7, 0, "psb7");
			$psb7bo = pg_result($resultsb7, 0, "psb7_bo");
				
	$sqlsb7s = "SELECT nazwa_sc FROM sciany where id = '$psb7s';";
			
			$resultsb7s = @pg_Exec($conn, $sqlsb7s);
			$psb7ps = pg_result($resultsb7s, 0, "nazwa_sc");

$sqlsufb7 = "SELECT psub7, psub7_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultsufb7 = @pg_Exec($conn, $sqlsufb7);
			$sufb7s = pg_result($resultsufb7, 0, "psub7");
			$sufb7bo = pg_result($resultsufb7, 0, "psub7_bo");
				
	$sqlsufb7s = "SELECT nazwa_su FROM sufit where id = '$sufb7s';";
			
			$resultsufb7s = @pg_Exec($conn, $sqlsufb7s);
			$sufb7ps = pg_result($resultsufb7s, 0, "nazwa_su");

$sqlwypb7 = "SELECT wypb7, wypb7_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultwypb7 = @pg_Exec($conn, $sqlwypb7);
			$wypb7s = pg_result($resultwypb7, 0, "wypb7");
			$wypb7bo = pg_result($resultwypb7, 0, "wypb7_bo");
				
	$sqlwypb7s = "SELECT nazwa_wp FROM wyposazenie where id = '$wypb7s';";
			
			$resultwypb7s = @pg_Exec($conn, $sqlwypb7s);
			$wypb7ps = pg_result($resultwypb7s, 0, "nazwa_wp");

$sqlpowb8 = "SELECT ppb8, ppb8_bo FROM tab_lok_w where id_d = '$nu';";	
	$resultpowb8 = @pg_Exec($conn, $sqlpowb8);
	$powb8s = pg_result($resultpowb8, 0, "ppb8");
	$powb8sp = pg_result($resultpowb8, 0, "ppb8_bo");

$sqlpopb8 = "SELECT popb8, popb8_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultpopb8 = @pg_Exec($conn, $sqlpopb8);
			$popb8s = pg_result($resultpopb8, 0, "popb8");
			$popb8bo = pg_result($resultpopb8, 0, "popb8_bo");
				
	$sqlpopb8s = "SELECT nazwa_pod FROM podlogi where id = '$popb8s';";
			
			$resultpopb8s = @pg_Exec($conn, $sqlpopb8s);
			$popb8ps = pg_result($resultpopb8s, 0, "nazwa_pod");

$sqlsb8 = "SELECT psb8, psb8_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultsb8 = @pg_Exec($conn, $sqlsb8);
			$psb8s = pg_result($resultsb8, 0, "psb8");
			$psb8bo = pg_result($resultsb8, 0, "psb8_bo");
				
	$sqlsb8s = "SELECT nazwa_sc FROM sciany where id = '$psb8s';";
			
			$resultsb8s = @pg_Exec($conn, $sqlsb8s);
			$psb8ps = pg_result($resultsb8s, 0, "nazwa_sc");

$sqlsufb8 = "SELECT psub8, psub8_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultsufb8 = @pg_Exec($conn, $sqlsufb8);
			$sufb8s = pg_result($resultsufb8, 0, "psub8");
			$sufb8bo = pg_result($resultsufb8, 0, "psub8_bo");
				
	$sqlsufb8s = "SELECT nazwa_su FROM sufit where id = '$sufb8s';";
			
			$resultsufb8s = @pg_Exec($conn, $sqlsufb8s);
			$sufb8ps = pg_result($resultsufb8s, 0, "nazwa_su");

$sqlwypb8 = "SELECT wypb8, wypb8_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultwypb8 = @pg_Exec($conn, $sqlwypb8);
			$wypb8s = pg_result($resultwypb8, 0, "wypb8");
			$wypb8bo = pg_result($resultwypb8, 0, "wypb8_bo");
				
	$sqlwypb8s = "SELECT nazwa_wp FROM wyposazenie where id = '$wypb8s';";
			
			$resultwypb8s = @pg_Exec($conn, $sqlwypb8s);
			$wypb8ps = pg_result($resultwypb8s, 0, "nazwa_wp");

$sqlpowb9 = "SELECT ppb9, ppb9_bo FROM tab_lok_w where id_d = '$nu';";	
	$resultpowb9 = @pg_Exec($conn, $sqlpowb9);
	$powb9s = pg_result($resultpowb9, 0, "ppb9");
	$powb9sp = pg_result($resultpowb9, 0, "ppb9_bo");

$sqlpopb9 = "SELECT popb9, popb9_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultpopb9 = @pg_Exec($conn, $sqlpopb9);
			$popb9s = pg_result($resultpopb9, 0, "popb9");
			$popb9bo = pg_result($resultpopb9, 0, "popb9_bo");
				
	$sqlpopb9s = "SELECT nazwa_pod FROM podlogi where id = '$popb9s';";
			
			$resultpopb9s = @pg_Exec($conn, $sqlpopb9s);
			$popb9ps = pg_result($resultpopb9s, 0, "nazwa_pod");

$sqlsb9 = "SELECT psb9, psb9_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultsb9 = @pg_Exec($conn, $sqlsb9);
			$psb9s = pg_result($resultsb9, 0, "psb9");
			$psb9bo = pg_result($resultsb9, 0, "psb9_bo");
				
	$sqlsb9s = "SELECT nazwa_sc FROM sciany where id = '$psb9s';";
			
			$resultsb9s = @pg_Exec($conn, $sqlsb9s);
			$psb9ps = pg_result($resultsb9s, 0, "nazwa_sc");

$sqlsufb9 = "SELECT psub9, psub9_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultsufb9 = @pg_Exec($conn, $sqlsufb9);
			$sufb9s = pg_result($resultsufb9, 0, "psub9");
			$sufb9bo = pg_result($resultsufb9, 0, "psub9_bo");
				
	$sqlsufb9s = "SELECT nazwa_su FROM sufit where id = '$sufb9s';";
			
			$resultsufb9s = @pg_Exec($conn, $sqlsufb9s);
			$sufb9ps = pg_result($resultsufb9s, 0, "nazwa_su");

$sqlwypb9 = "SELECT wypb9, wypb9_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultwypb9 = @pg_Exec($conn, $sqlwypb9);
			$wypb9s = pg_result($resultwypb9, 0, "wypb9");
			$wypb9bo = pg_result($resultwypb9, 0, "wypb9_bo");
				
	$sqlwypb9s = "SELECT nazwa_wp FROM wyposazenie where id = '$wypb9s';";
			
			$resultwypb9s = @pg_Exec($conn, $sqlwypb9s);
			$wypb9ps = pg_result($resultwypb9s, 0, "nazwa_wp");

$sqlpowb10 = "SELECT ppb10, ppb10_bo FROM tab_lok_w where id_d = '$nu';";	
	$resultpowb10 = @pg_Exec($conn, $sqlpowb10);
	$powb10s = pg_result($resultpowb10, 0, "ppb10");
	$powb10sp = pg_result($resultpowb10, 0, "ppb10_bo");

$sqlpopb10 = "SELECT popb10, popb10_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultpopb10 = @pg_Exec($conn, $sqlpopb10);
			$popb10s = pg_result($resultpopb10, 0, "popb10");
			$popb10bo = pg_result($resultpopb10, 0, "popb10_bo");
				
	$sqlpopb10s = "SELECT nazwa_pod FROM podlogi where id = '$popb10s';";
			
			$resultpopb10s = @pg_Exec($conn, $sqlpopb10s);
			$popb10ps = pg_result($resultpopb10s, 0, "nazwa_pod");

$sqlsb10 = "SELECT psb10, psb10_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultsb10 = @pg_Exec($conn, $sqlsb10);
			$psb10s = pg_result($resultsb10, 0, "psb10");
			$psb10bo = pg_result($resultsb10, 0, "psb10_bo");
				
	$sqlsb10s = "SELECT nazwa_sc FROM sciany where id = '$psb10s';";
			
			$resultsb10s = @pg_Exec($conn, $sqlsb10s);
			$psb10ps = pg_result($resultsb10s, 0, "nazwa_sc");

$sqlsufb10 = "SELECT psub10, psub10_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultsufb10 = @pg_Exec($conn, $sqlsufb10);
			$sufb10s = pg_result($resultsufb10, 0, "psub10");
			$sufb10bo = pg_result($resultsufb10, 0, "psub10_bo");
				
	$sqlsufb10s = "SELECT nazwa_su FROM sufit where id = '$sufb10s';";
			
			$resultsufb10s = @pg_Exec($conn, $sqlsufb10s);
			$sufb10ps = pg_result($resultsufb10s, 0, "nazwa_su");

$sqlwypb10 = "SELECT wypb10, wypb10_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultwypb10 = @pg_Exec($conn, $sqlwypb10);
			$wypb10s = pg_result($resultwypb10, 0, "wypb10");
			$wypb10bo = pg_result($resultwypb10, 0, "wypb10_bo");
				
	$sqlwypb10s = "SELECT nazwa_wp FROM wyposazenie where id = '$wypb10s';";
			
			$resultwypb10s = @pg_Exec($conn, $sqlwypb10s);
			$wypb10ps = pg_result($resultwypb10s, 0, "nazwa_wp");

$sqlpowb11 = "SELECT ppb11, ppb11_bo FROM tab_lok_w where id_d = '$nu';";	
	$resultpowb11 = @pg_Exec($conn, $sqlpowb11);
	$powb11s = pg_result($resultpowb11, 0, "ppb11");
	$powb11sp = pg_result($resultpowb11, 0, "ppb11_bo");

$sqlpopb11 = "SELECT popb11, popb11_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultpopb11 = @pg_Exec($conn, $sqlpopb11);
			$popb11s = pg_result($resultpopb11, 0, "popb11");
			$popb11bo = pg_result($resultpopb11, 0, "popb11_bo");
				
	$sqlpopb11s = "SELECT nazwa_pod FROM podlogi where id = '$popb11s';";
			
			$resultpopb11s = @pg_Exec($conn, $sqlpopb11s);
			$popb11ps = pg_result($resultpopb11s, 0, "nazwa_pod");

$sqlsb11 = "SELECT psb11, psb11_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultsb11 = @pg_Exec($conn, $sqlsb11);
			$psb11s = pg_result($resultsb11, 0, "psb11");
			$psb11bo = pg_result($resultsb11, 0, "psb11_bo");
				
	$sqlsb11s = "SELECT nazwa_sc FROM sciany where id = '$psb11s';";
			
			$resultsb11s = @pg_Exec($conn, $sqlsb11s);
			$psb11ps = pg_result($resultsb11s, 0, "nazwa_sc");

$sqlsufb11 = "SELECT psub11, psub11_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultsufb11 = @pg_Exec($conn, $sqlsufb11);
			$sufb11s = pg_result($resultsufb11, 0, "psub11");
			$sufb11bo = pg_result($resultsufb11, 0, "psub11_bo");
				
	$sqlsufb11s = "SELECT nazwa_su FROM sufit where id = '$sufb11s';";
			
			$resultsufb11s = @pg_Exec($conn, $sqlsufb11s);
			$sufb11ps = pg_result($resultsufb11s, 0, "nazwa_su");

$sqlwypb11 = "SELECT wypb11, wypb11_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultwypb11 = @pg_Exec($conn, $sqlwypb11);
			$wypb11s = pg_result($resultwypb11, 0, "wypb11");
			$wypb11bo = pg_result($resultwypb11, 0, "wypb11_bo");
				
	$sqlwypb11s = "SELECT nazwa_wp FROM wyposazenie where id = '$wypb11s';";
			
			$resultwypb11s = @pg_Exec($conn, $sqlwypb11s);
			$wypb11ps = pg_result($resultwypb11s, 0, "nazwa_wp");

$sqlpowb12 = "SELECT ppb12, ppb12_bo FROM tab_lok_w where id_d = '$nu';";	
	$resultpowb12 = @pg_Exec($conn, $sqlpowb12);
	$powb12s = pg_result($resultpowb12, 0, "ppb12");
	$powb12sp = pg_result($resultpowb12, 0, "ppb12_bo");

$sqlpopb12 = "SELECT popb12, popb12_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultpopb12 = @pg_Exec($conn, $sqlpopb12);
			$popb12s = pg_result($resultpopb12, 0, "popb12");
			$popb12bo = pg_result($resultpopb12, 0, "popb12_bo");
				
	$sqlpopb12s = "SELECT nazwa_pod FROM podlogi where id = '$popb12s';";
			
			$resultpopb12s = @pg_Exec($conn, $sqlpopb12s);
			$popb12ps = pg_result($resultpopb12s, 0, "nazwa_pod");

$sqlsb12 = "SELECT psb12, psb12_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultsb12 = @pg_Exec($conn, $sqlsb12);
			$psb12s = pg_result($resultsb12, 0, "psb12");
			$psb12bo = pg_result($resultsb12, 0, "psb12_bo");
				
	$sqlsb12s = "SELECT nazwa_sc FROM sciany where id = '$psb12s';";
			
			$resultsb12s = @pg_Exec($conn, $sqlsb12s);
			$psb12ps = pg_result($resultsb12s, 0, "nazwa_sc");

$sqlsufb12 = "SELECT psub12, psub12_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultsufb12 = @pg_Exec($conn, $sqlsufb12);
			$sufb12s = pg_result($resultsufb12, 0, "psub12");
			$sufb12bo = pg_result($resultsufb12, 0, "psub12_bo");
				
	$sqlsufb12s = "SELECT nazwa_su FROM sufit where id = '$sufb12s';";
			
			$resultsufb12s = @pg_Exec($conn, $sqlsufb12s);
			$sufb12ps = pg_result($resultsufb12s, 0, "nazwa_su");

$sqlwypb12 = "SELECT wypb12, wypb12_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultwypb12 = @pg_Exec($conn, $sqlwypb12);
			$wypb12s = pg_result($resultwypb12, 0, "wypb12");
			$wypb12bo = pg_result($resultwypb12, 0, "wypb12_bo");
				
	$sqlwypb12s = "SELECT nazwa_wp FROM wyposazenie where id = '$wypb12s';";
			
			$resultwypb12s = @pg_Exec($conn, $sqlwypb12s);
			$wypb12ps = pg_result($resultwypb12s, 0, "nazwa_wp");


if (($powb1sp == 't')  || ($popb1bo == 't') || ($psb1bo == 't')  || ($sufb1bo == 't') || ($wypb1bo == 't') || ($powb2sp == 't')  || ($popb2bo == 't') || ($psb2bo == 't')  || ($sufb2bo == 't') || ($wypb2bo == 't') || ($powb3sp == 't')  || ($popb3bo == 't') || ($psb3bo == 't')  || ($sufb3bo == 't') || ($wypb3bo == 't') || ($powb4sp == 't')  || ($popb4bo == 't') || ($psb4bo == 't')  || ($sufb4bo == 't') || ($wypb4bo == 't') || ($powb5sp == 't')  || ($popb5bo == 't') || ($psb5bo == 't')  || ($sufb5bo == 't') || ($wypb5bo == 't') || ($powb6sp == 't')  || ($popb6bo == 't') || ($psb6bo == 't')  || ($sufb6bo == 't') || ($wypb6bo == 't') || ($powb7sp == 't')  || ($popb7bo == 't') || ($psb7bo == 't')  || ($sufb7bo == 't') || ($wypb7bo == 't') || ($powb8sp == 't')  || ($popb8bo == 't') || ($psb8bo == 't')  || ($sufb8bo == 't') || ($wypb8bo == 't') || ($powb9sp == 't')  || ($popb9bo == 't') || ($psb9bo == 't')  || ($sufb9bo == 't') || ($wypb9bo == 't') || ($powb10sp == 't')  || ($popb10bo == 't') || ($psb10bo == 't')  || ($sufb10bo == 't') || ($wypb10bo == 't') || ($powb11sp == 't') || ($popb11bo == 't') || ($psb11bo == 't')  || ($sufb11bo == 't') || ($wypb11bo == 't') || ($powb12sp == 't')  || ($popb12bo == 't') || ($psb12bo == 't')  || ($sufb12bo == 't') || ($wypb12bo == 't')) {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

echo "<tr><td colspan=\"40\" height=\"7\" bgcolor=\"#5865E5\">";
echo "<span class=\"nag1wb\">";
echo "&nbsp;Pomieszczenia biurowe";
echo "</span>";
echo "</td></tr>";

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}
if (($powb1sp == 't')  || ($popb1bo == 't') || ($psb1bo == 't')  || ($sufb1bo == 't')) {
echo "<tr>"; 
}
if ($powb1sp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pow. pom. 1:</b><br>&nbsp;$powb1s m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($popb1bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pod³oga pom. 1:</b><br>&nbsp;$popb1ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($psb1bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>¦ciana pom. 1:</b><br>&nbsp;$psb1ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($sufb1bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Sufit pom. 1:</b><br>&nbsp;$sufb1ps";
echo "</td>";

}

if (($powb1sp == 't')  || ($popb1bo == 't') || ($psb1bo == 't')  || ($sufb1bo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}


if ($wypb1bo == 't') {
echo "<tr>";
echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Wyposa¿enie pom. 1:</b><br>&nbsp;$wypb1ps";
echo "</td>";
echo "</tr>";
}	

if ($wypb1bo == 't') {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}
if (($powb2sp == 't')  || ($popb2bo == 't') || ($psb2bo == 't')  || ($sufb2bo == 't')) {
echo "<tr>"; 
}
if ($powb2sp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pow. pom. 2:</b><br>&nbsp;$powb2s m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($popb2bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pod³oga pom. 2:</b><br>&nbsp;$popb2ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($psb2bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>¦ciana pom. 2:</b><br>&nbsp;$psb2ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($sufb2bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Sufit pom. 2:</b><br>&nbsp;$sufb2ps";
echo "</td>";

}

if (($powb2sp == 't')  || ($popb2bo == 't') || ($psb2bo == 't')  || ($sufb2bo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}


if ($wypb2bo == 't') {
echo "<tr>";
echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Wyposa¿enie pom. 2:</b><br>&nbsp;$wypb2ps";
echo "</td>";
echo "</tr>";
}	

if ($wypb2bo == 't') {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}

if (($powb3sp == 't')  || ($popb3bo == 't') || ($psb3bo == 't')  || ($sufb3bo == 't')) {
echo "<tr>"; 
}
if ($powb3sp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pow. pom. 3:</b><br>&nbsp;$powb3s m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($popb3bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pod³oga pom. 3:</b><br>&nbsp;$popb3ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($psb3bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>¦ciana pom. 3:</b><br>&nbsp;$psb3ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($sufb3bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Sufit pom. 3:</b><br>&nbsp;$sufb3ps";
echo "</td>";

}

if (($powb3sp == 't')  || ($popb3bo == 't') || ($psb3bo == 't')  || ($sufb3bo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}


if ($wypb3bo == 't') {
echo "<tr>";
echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Wyposa¿enie pom. 3:</b><br>&nbsp;$wypb3ps";
echo "</td>";
echo "</tr>";
}	

if ($wypb3bo == 't') {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}

if (($powb4sp == 't')  || ($popb4bo == 't') || ($psb4bo == 't')  || ($sufb4bo == 't')) {
echo "<tr>"; 
}
if ($powb4sp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pow. pom. 4:</b><br>&nbsp;$powb4s m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($popb4bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pod³oga pom. 4:</b><br>&nbsp;$popb4ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($psb4bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>¦ciana pom. 4:</b><br>&nbsp;$psb4ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($sufb4bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Sufit pom. 4:</b><br>&nbsp;$sufb4ps";
echo "</td>";

}

if (($powb4sp == 't')  || ($popb4bo == 't') || ($psb4bo == 't')  || ($sufb4bo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}


if ($wypb4bo == 't') {
echo "<tr>";
echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Wyposa¿enie pom. 4:</b><br>&nbsp;$wypb4ps";
echo "</td>";
echo "</tr>";
}	

if ($wypb4bo == 't') {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}


if (($powb5sp == 't')  || ($popb5bo == 't') || ($psb5bo == 't')  || ($sufb5bo == 't')) {
echo "<tr>"; 
}

if ($powb5sp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pow. pom. 5:</b><br>&nbsp;$powb5s m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($popb5bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pod³oga pom. 5:</b><br>&nbsp;$popb5ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($psb5bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>¦ciana pom. 5:</b><br>&nbsp;$psb5ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($sufb5bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Sufit pom. 5:</b><br>&nbsp;$sufb5ps";
echo "</td>";

}

if (($powb5sp == 't')  || ($popb5bo == 't') || ($psb5bo == 't')  || ($sufb5bo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}


if ($wypb5bo == 't') {
echo "<tr>";
echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Wyposa¿enie pom. 5:</b><br>&nbsp;$wypb5ps";
echo "</td>";
echo "</tr>";
}	

if ($wypb5bo == 't') {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}

if (($powb6sp == 't')  || ($popb6bo == 't') || ($psb6bo == 't')  || ($sufb6bo == 't')) {
echo "<tr>"; 
}

if ($powb6sp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pow. pom. 6:</b><br>&nbsp;$powb6s m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($popb6bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pod³oga pom. 6:</b><br>&nbsp;$popb6ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($psb6bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>¦ciana pom. 6:</b><br>&nbsp;$psb6ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($sufb6bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Sufit pom. 6:</b><br>&nbsp;$sufb6ps";
echo "</td>";

}

if (($powb6sp == 't')  || ($popb6bo == 't') || ($psb6bo == 't')  || ($sufb6bo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}


if ($wypb6bo == 't') {
echo "<tr>";
echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Wyposa¿enie pom. 6:</b><br>&nbsp;$wypb6ps";
echo "</td>";
echo "</tr>";
}	

if ($wypb6bo == 't') {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}
if (($powb7sp == 't')  || ($popb7bo == 't') || ($psb7bo == 't')  || ($sufb7bo == 't')) {
echo "<tr>"; 
}
if ($powb7sp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pow. pom. 7:</b><br>&nbsp;$powb7s m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($popb7bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pod³oga pom. 7:</b><br>&nbsp;$popb7ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($psb7bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>¦ciana pom. 7:</b><br>&nbsp;$psb7ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($sufb7bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Sufit pom. 7:</b><br>&nbsp;$sufb7ps";
echo "</td>";

}

if (($powb7sp == 't')  || ($popb7bo == 't') || ($psb7bo == 't')  || ($sufb7bo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}


if ($wypb7bo == 't') {
echo "<tr>";
echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Wyposa¿enie pom. 7:</b><br>&nbsp;$wypb7ps";
echo "</td>";
echo "</tr>";
}	

if ($wypb7bo == 't') {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}
if (($powb8sp == 't')  || ($popb8bo == 't') || ($psb8bo == 't')  || ($sufb8bo == 't')) {
echo "<tr>"; 
}
if ($powb8sp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pow. pom. 8:</b><br>&nbsp;$powb8s m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($popb8bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pod³oga pom. 8:</b><br>&nbsp;$popb8ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($psb8bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>¦ciana pom. 8:</b><br>&nbsp;$psb8ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($sufb8bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Sufit pom. 8:</b><br>&nbsp;$sufb8ps";
echo "</td>";

}

if (($powb8sp == 't')  || ($popb8bo == 't') || ($psb8bo == 't')  || ($sufb8bo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}


if ($wypb8bo == 't') {
echo "<tr>";
echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Wyposa¿enie pom. 8:</b><br>&nbsp;$wypb8ps";
echo "</td>";
echo "</tr>";
}	

if ($wypb8bo == 't') {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}
if (($powb9sp == 't')  || ($popb9bo == 't') || ($psb9bo == 't')  || ($sufb9bo == 't')) {
echo "<tr>"; 
}
if ($powb9sp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pow. pom. 9:</b><br>&nbsp;$powb9s m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($popb9bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pod³oga pom. 9:</b><br>&nbsp;$popb9ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($psb9bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>¦ciana pom. 9:</b><br>&nbsp;$psb9ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($sufb9bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Sufit pom. 9:</b><br>&nbsp;$sufb9ps";
echo "</td>";

}

if (($powb9sp == 't')  || ($popb9bo == 't') || ($psb9bo == 't')  || ($sufb9bo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}


if ($wypb9bo == 't') {
echo "<tr>";
echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Wyposa¿enie pom. 9:</b><br>&nbsp;$wypb9ps";
echo "</td>";
echo "</tr>";
}	

if ($wypb9bo == 't') {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}
if (($powb10sp == 't')  || ($popb10bo == 't') || ($psb10bo == 't')  || ($sufb10bo == 't')) {
echo "<tr>"; 
}
if ($powb10sp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pow. pom. 10:</b><br>&nbsp;$powb10s m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($popb10bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pod³oga pom. 10:</b><br>&nbsp;$popb10ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($psb10bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>¦ciana pom. 10:</b><br>&nbsp;$psb10ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($sufb10bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Sufit pom. 10:</b><br>&nbsp;$sufb10ps";
echo "</td>";

}

if (($powb10sp == 't')  || ($popb10bo == 't') || ($psb10bo == 't')  || ($sufb10bo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}


if ($wypb10bo == 't') {
echo "<tr>";
echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Wyposa¿enie pom. 10:</b><br>&nbsp;$wypb10ps";
echo "</td>";
echo "</tr>";
}	

if ($wypb10bo == 't') {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}
if (($powb11sp == 't')  || ($popb11bo == 't') || ($psb11bo == 't')  || ($sufb11bo == 't')) {
echo "<tr>"; 
}
if ($powb11sp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pow. pom. 11:</b><br>&nbsp;$powb11s m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($popb11bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pod³oga pom. 11:</b><br>&nbsp;$popb11ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($psb11bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>¦ciana pom. 11:</b><br>&nbsp;$psb11ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($sufb11bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Sufit pom. 11:</b><br>&nbsp;$sufb11ps";
echo "</td>";

}

if (($powb11sp == 't')  || ($popb11bo == 't') || ($psb11bo == 't')  || ($sufb11bo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}


if ($wypb11bo == 't') {
echo "<tr>";
echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Wyposa¿enie pom. 11:</b><br>&nbsp;$wypb11ps";
echo "</td>";
echo "</tr>";
}	

if ($wypb11bo == 't') {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}
if (($powb12sp == 't')  || ($popb12bo == 't') || ($psb12bo == 't')  || ($sufb12bo == 't')) {
echo "<tr>"; 
}
if ($powb12sp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pow. pom. 12:</b><br>&nbsp;$powb12s m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($popb12bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pod³oga pom. 12:</b><br>&nbsp;$popb12ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($psb12bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>¦ciana pom. 12:</b><br>&nbsp;$psb12ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($sufb12bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Sufit pom. 12:</b><br>&nbsp;$sufb12ps";
echo "</td>";

}

if (($powb12sp == 't')  || ($popb12bo == 't') || ($psb12bo == 't')  || ($sufb12bo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}


if ($wypb12bo == 't') {
echo "<tr>";
echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Wyposa¿enie pom. 12:</b><br>&nbsp;$wypb12ps";
echo "</td>";
echo "</tr>";
}	

if ($wypb12bo == 't') {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}


$sqlpowss1 = "SELECT pps1, pps1_bo FROM tab_lok_w where id_d = '$nu';";	
	$resultpowss1 = @pg_Exec($conn, $sqlpowss1);
	$powss1s = pg_result($resultpowss1, 0, "pps1");
	$powss1sp = pg_result($resultpowss1, 0, "pps1_bo");

$sqlpopss1 = "SELECT pops1, pops1_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultpopss1 = @pg_Exec($conn, $sqlpopss1);
			$popss1s = pg_result($resultpopss1, 0, "pops1");
			$popss1bo = pg_result($resultpopss1, 0, "pops1_bo");
				
	$sqlpopss1s = "SELECT nazwa_pod FROM podlogi where id = '$popss1s';";
			
			$resultpopss1s = @pg_Exec($conn, $sqlpopss1s);
			$popss1ps = pg_result($resultpopss1s, 0, "nazwa_pod");

$sqlss1 = "SELECT pss1, pss1_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultss1 = @pg_Exec($conn, $sqlss1);
			$pss1s = pg_result($resultss1, 0, "pss1");
			$pss1bo = pg_result($resultss1, 0, "pss1_bo");
				
	$sqlss1s = "SELECT nazwa_sc FROM sciany where id = '$pss1s';";
			
			$resultss1s = @pg_Exec($conn, $sqlss1s);
			$pss1ps = pg_result($resultss1s, 0, "nazwa_sc");

$sqlsufs1 = "SELECT psus1, psus1_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultsufs1 = @pg_Exec($conn, $sqlsufs1);
			$sufs1s = pg_result($resultsufs1, 0, "psus1");
			$sufs1bo = pg_result($resultsufs1, 0, "psus1_bo");
				
	$sqlsufs1s = "SELECT nazwa_su FROM sufit where id = '$sufs1s';";
			
			$resultsufs1s = @pg_Exec($conn, $sqlsufs1s);
			$sufs1ps = pg_result($resultsufs1s, 0, "nazwa_su");

$sqlwyps1 = "SELECT wyps1, wyps1_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultwyps1 = @pg_Exec($conn, $sqlwyps1);
			$wyps1s = pg_result($resultwyps1, 0, "wyps1");
			$wyps1bo = pg_result($resultwyps1, 0, "wyps1_bo");
				
	$sqlwyps1s = "SELECT nazwa_wp FROM wyposazenie where id = '$wyps1s';";
			
			$resultwyps1s = @pg_Exec($conn, $sqlwyps1s);
			$wyps1ps = pg_result($resultwyps1s, 0, "nazwa_wp");

$sqlpowss2 = "SELECT pps2, pps2_bo FROM tab_lok_w where id_d = '$nu';";	
	$resultpowss2 = @pg_Exec($conn, $sqlpowss2);
	$powss2s = pg_result($resultpowss2, 0, "pps2");
	$powss2sp = pg_result($resultpowss2, 0, "pps2_bo");

$sqlpopss2 = "SELECT pops2, pops2_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultpopss2 = @pg_Exec($conn, $sqlpopss2);
			$popss2s = pg_result($resultpopss2, 0, "pops2");
			$popss2bo = pg_result($resultpopss2, 0, "pops2_bo");
				
	$sqlpopss2s = "SELECT nazwa_pod FROM podlogi where id = '$popss2s';";
			
			$resultpopss2s = @pg_Exec($conn, $sqlpopss2s);
			$popss2ps = pg_result($resultpopss2s, 0, "nazwa_pod");

$sqlss2 = "SELECT pss2, pss2_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultss2 = @pg_Exec($conn, $sqlss2);
			$pss2s = pg_result($resultss2, 0, "pss2");
			$pss2bo = pg_result($resultss2, 0, "pss2_bo");
				
	$sqlss2s = "SELECT nazwa_sc FROM sciany where id = '$pss2s';";
			
			$resultss2s = @pg_Exec($conn, $sqlss2s);
			$pss2ps = pg_result($resultss2s, 0, "nazwa_sc");

$sqlsufs2 = "SELECT psus2, psus2_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultsufs2 = @pg_Exec($conn, $sqlsufs2);
			$sufs2s = pg_result($resultsufs2, 0, "psus2");
			$sufs2bo = pg_result($resultsufs2, 0, "psus2_bo");
				
	$sqlsufs2s = "SELECT nazwa_su FROM sufit where id = '$sufs2s';";
			
			$resultsufs2s = @pg_Exec($conn, $sqlsufs2s);
			$sufs2ps = pg_result($resultsufs2s, 0, "nazwa_su");

$sqlwyps2 = "SELECT wyps2, wyps2_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultwyps2 = @pg_Exec($conn, $sqlwyps2);
			$wyps2s = pg_result($resultwyps2, 0, "wyps2");
			$wyps2bo = pg_result($resultwyps2, 0, "wyps2_bo");
				
	$sqlwyps2s = "SELECT nazwa_wp FROM wyposazenie where id = '$wyps2s';";
			
			$resultwyps2s = @pg_Exec($conn, $sqlwyps2s);
			$wyps2ps = pg_result($resultwyps2s, 0, "nazwa_wp");

$sqlpowss3 = "SELECT pps3, pps3_bo FROM tab_lok_w where id_d = '$nu';";	
	$resultpowss3 = @pg_Exec($conn, $sqlpowss3);
	$powss3s = pg_result($resultpowss3, 0, "pps3");
	$powss3sp = pg_result($resultpowss3, 0, "pps3_bo");

$sqlpopss3 = "SELECT pops3, pops3_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultpopss3 = @pg_Exec($conn, $sqlpopss3);
			$popss3s = pg_result($resultpopss3, 0, "pops3");
			$popss3bo = pg_result($resultpopss3, 0, "pops3_bo");
				
	$sqlpopss3s = "SELECT nazwa_pod FROM podlogi where id = '$popss3s';";
			
			$resultpopss3s = @pg_Exec($conn, $sqlpopss3s);
			$popss3ps = pg_result($resultpopss3s, 0, "nazwa_pod");

$sqlss3 = "SELECT pss3, pss3_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultss3 = @pg_Exec($conn, $sqlss3);
			$pss3s = pg_result($resultss3, 0, "pss3");
			$pss3bo = pg_result($resultss3, 0, "pss3_bo");
				
	$sqlss3s = "SELECT nazwa_sc FROM sciany where id = '$pss3s';";
			
			$resultss3s = @pg_Exec($conn, $sqlss3s);
			$pss3ps = pg_result($resultss3s, 0, "nazwa_sc");

$sqlsufs3 = "SELECT psus3, psus3_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultsufs3 = @pg_Exec($conn, $sqlsufs3);
			$sufs3s = pg_result($resultsufs3, 0, "psus3");
			$sufs3bo = pg_result($resultsufs3, 0, "psus3_bo");
				
	$sqlsufs3s = "SELECT nazwa_su FROM sufit where id = '$sufs3s';";
			
			$resultsufs3s = @pg_Exec($conn, $sqlsufs3s);
			$sufs3ps = pg_result($resultsufs3s, 0, "nazwa_su");

$sqlwyps3 = "SELECT wyps3, wyps3_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultwyps3 = @pg_Exec($conn, $sqlwyps3);
			$wyps3s = pg_result($resultwyps3, 0, "wyps3");
			$wyps3bo = pg_result($resultwyps3, 0, "wyps3_bo");
				
	$sqlwyps3s = "SELECT nazwa_wp FROM wyposazenie where id = '$wyps3s';";
			
			$resultwyps3s = @pg_Exec($conn, $sqlwyps3s);
			$wyps3ps = pg_result($resultwyps3s, 0, "nazwa_wp");

$sqlpowss4 = "SELECT pps4, pps4_bo FROM tab_lok_w where id_d = '$nu';";	
	$resultpowss4 = @pg_Exec($conn, $sqlpowss4);
	$powss4s = pg_result($resultpowss4, 0, "pps4");
	$powss4sp = pg_result($resultpowss4, 0, "pps4_bo");

$sqlpopss4 = "SELECT pops4, pops4_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultpopss4 = @pg_Exec($conn, $sqlpopss4);
			$popss4s = pg_result($resultpopss4, 0, "pops4");
			$popss4bo = pg_result($resultpopss4, 0, "pops4_bo");
				
	$sqlpopss4s = "SELECT nazwa_pod FROM podlogi where id = '$popss4s';";
			
			$resultpopss4s = @pg_Exec($conn, $sqlpopss4s);
			$popss4ps = pg_result($resultpopss4s, 0, "nazwa_pod");

$sqlss4 = "SELECT pss4, pss4_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultss4 = @pg_Exec($conn, $sqlss4);
			$pss4s = pg_result($resultss4, 0, "pss4");
			$pss4bo = pg_result($resultss4, 0, "pss4_bo");
				
	$sqlss4s = "SELECT nazwa_sc FROM sciany where id = '$pss4s';";
			
			$resultss4s = @pg_Exec($conn, $sqlss4s);
			$pss4ps = pg_result($resultss4s, 0, "nazwa_sc");

$sqlsufs4 = "SELECT psus4, psus4_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultsufs4 = @pg_Exec($conn, $sqlsufs4);
			$sufs4s = pg_result($resultsufs4, 0, "psus4");
			$sufs4bo = pg_result($resultsufs4, 0, "psus4_bo");
				
	$sqlsufs4s = "SELECT nazwa_su FROM sufit where id = '$sufs4s';";
			
			$resultsufs4s = @pg_Exec($conn, $sqlsufs4s);
			$sufs4ps = pg_result($resultsufs4s, 0, "nazwa_su");

$sqlwyps4 = "SELECT wyps4, wyps4_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultwyps4 = @pg_Exec($conn, $sqlwyps4);
			$wyps4s = pg_result($resultwyps4, 0, "wyps4");
			$wyps4bo = pg_result($resultwyps4, 0, "wyps4_bo");
				
	$sqlwyps4s = "SELECT nazwa_wp FROM wyposazenie where id = '$wyps4s';";
			
			$resultwyps4s = @pg_Exec($conn, $sqlwyps4s);
			$wyps4ps = pg_result($resultwyps4s, 0, "nazwa_wp");

$sqlpowss5 = "SELECT pps5, pps5_bo FROM tab_lok_w where id_d = '$nu';";	
	$resultpowss5 = @pg_Exec($conn, $sqlpowss5);
	$powss5s = pg_result($resultpowss5, 0, "pps5");
	$powss5sp = pg_result($resultpowss5, 0, "pps5_bo");

$sqlpopss5 = "SELECT pops5, pops5_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultpopss5 = @pg_Exec($conn, $sqlpopss5);
			$popss5s = pg_result($resultpopss5, 0, "pops5");
			$popss5bo = pg_result($resultpopss5, 0, "pops5_bo");
				
	$sqlpopss5s = "SELECT nazwa_pod FROM podlogi where id = '$popss5s';";
			
			$resultpopss5s = @pg_Exec($conn, $sqlpopss5s);
			$popss5ps = pg_result($resultpopss5s, 0, "nazwa_pod");

$sqlss5 = "SELECT pss5, pss5_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultss5 = @pg_Exec($conn, $sqlss5);
			$pss5s = pg_result($resultss5, 0, "pss5");
			$pss5bo = pg_result($resultss5, 0, "pss5_bo");
				
	$sqlss5s = "SELECT nazwa_sc FROM sciany where id = '$pss5s';";
			
			$resultss5s = @pg_Exec($conn, $sqlss5s);
			$pss5ps = pg_result($resultss5s, 0, "nazwa_sc");

$sqlsufs5 = "SELECT psus5, psus5_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultsufs5 = @pg_Exec($conn, $sqlsufs5);
			$sufs5s = pg_result($resultsufs5, 0, "psus5");
			$sufs5bo = pg_result($resultsufs5, 0, "psus5_bo");
				
	$sqlsufs5s = "SELECT nazwa_su FROM sufit where id = '$sufs5s';";
			
			$resultsufs5s = @pg_Exec($conn, $sqlsufs5s);
			$sufs5ps = pg_result($resultsufs5s, 0, "nazwa_su");

$sqlwyps5 = "SELECT wyps5, wyps5_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultwyps5 = @pg_Exec($conn, $sqlwyps5);
			$wyps5s = pg_result($resultwyps5, 0, "wyps5");
			$wyps5bo = pg_result($resultwyps5, 0, "wyps5_bo");
				
	$sqlwyps5s = "SELECT nazwa_wp FROM wyposazenie where id = '$wyps5s';";
			
			$resultwyps5s = @pg_Exec($conn, $sqlwyps5s);
			$wyps5ps = pg_result($resultwyps5s, 0, "nazwa_wp");

$sqlpowss6 = "SELECT pps6, pps6_bo FROM tab_lok_w where id_d = '$nu';";	
	$resultpowss6 = @pg_Exec($conn, $sqlpowss6);
	$powss6s = pg_result($resultpowss6, 0, "pps6");
	$powss6sp = pg_result($resultpowss6, 0, "pps6_bo");

$sqlpopss6 = "SELECT pops6, pops6_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultpopss6 = @pg_Exec($conn, $sqlpopss6);
			$popss6s = pg_result($resultpopss6, 0, "pops6");
			$popss6bo = pg_result($resultpopss6, 0, "pops6_bo");
				
	$sqlpopss6s = "SELECT nazwa_pod FROM podlogi where id = '$popss6s';";
			
			$resultpopss6s = @pg_Exec($conn, $sqlpopss6s);
			$popss6ps = pg_result($resultpopss6s, 0, "nazwa_pod");

$sqlss6 = "SELECT pss6, pss6_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultss6 = @pg_Exec($conn, $sqlss6);
			$pss6s = pg_result($resultss6, 0, "pss6");
			$pss6bo = pg_result($resultss6, 0, "pss6_bo");
				
	$sqlss6s = "SELECT nazwa_sc FROM sciany where id = '$pss6s';";
			
			$resultss6s = @pg_Exec($conn, $sqlss6s);
			$pss6ps = pg_result($resultss6s, 0, "nazwa_sc");

$sqlsufs6 = "SELECT psus6, psus6_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultsufs6 = @pg_Exec($conn, $sqlsufs6);
			$sufs6s = pg_result($resultsufs6, 0, "psus6");
			$sufs6bo = pg_result($resultsufs6, 0, "psus6_bo");
				
	$sqlsufs6s = "SELECT nazwa_su FROM sufit where id = '$sufs6s';";
			
			$resultsufs6s = @pg_Exec($conn, $sqlsufs6s);
			$sufs6ps = pg_result($resultsufs6s, 0, "nazwa_su");

$sqlwyps6 = "SELECT wyps6, wyps6_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultwyps6 = @pg_Exec($conn, $sqlwyps6);
			$wyps6s = pg_result($resultwyps6, 0, "wyps6");
			$wyps6bo = pg_result($resultwyps6, 0, "wyps6_bo");
				
	$sqlwyps6s = "SELECT nazwa_wp FROM wyposazenie where id = '$wyps6s';";
			
			$resultwyps6s = @pg_Exec($conn, $sqlwyps6s);
			$wyps6ps = pg_result($resultwyps6s, 0, "nazwa_wp");

$sqlpowss7 = "SELECT pps7, pps7_bo FROM tab_lok_w where id_d = '$nu';";	
	$resultpowss7 = @pg_Exec($conn, $sqlpowss7);
	$powss7s = pg_result($resultpowss7, 0, "pps7");
	$powss7sp = pg_result($resultpowss7, 0, "pps7_bo");

$sqlpopss7 = "SELECT pops7, pops7_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultpopss7 = @pg_Exec($conn, $sqlpopss7);
			$popss7s = pg_result($resultpopss7, 0, "pops7");
			$popss7bo = pg_result($resultpopss7, 0, "pops7_bo");
				
	$sqlpopss7s = "SELECT nazwa_pod FROM podlogi where id = '$popss7s';";
			
			$resultpopss7s = @pg_Exec($conn, $sqlpopss7s);
			$popss7ps = pg_result($resultpopss7s, 0, "nazwa_pod");

$sqlss7 = "SELECT pss7, pss7_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultss7 = @pg_Exec($conn, $sqlss7);
			$pss7s = pg_result($resultss7, 0, "pss7");
			$pss7bo = pg_result($resultss7, 0, "pss7_bo");
				
	$sqlss7s = "SELECT nazwa_sc FROM sciany where id = '$pss7s';";
			
			$resultss7s = @pg_Exec($conn, $sqlss7s);
			$pss7ps = pg_result($resultss7s, 0, "nazwa_sc");

$sqlsufs7 = "SELECT psus7, psus7_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultsufs7 = @pg_Exec($conn, $sqlsufs7);
			$sufs7s = pg_result($resultsufs7, 0, "psus7");
			$sufs7bo = pg_result($resultsufs7, 0, "psus7_bo");
				
	$sqlsufs7s = "SELECT nazwa_su FROM sufit where id = '$sufs7s';";
			
			$resultsufs7s = @pg_Exec($conn, $sqlsufs7s);
			$sufs7ps = pg_result($resultsufs7s, 0, "nazwa_su");

$sqlwyps7 = "SELECT wyps7, wyps7_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultwyps7 = @pg_Exec($conn, $sqlwyps7);
			$wyps7s = pg_result($resultwyps7, 0, "wyps7");
			$wyps7bo = pg_result($resultwyps7, 0, "wyps7_bo");
				
	$sqlwyps7s = "SELECT nazwa_wp FROM wyposazenie where id = '$wyps7s';";
			
			$resultwyps7s = @pg_Exec($conn, $sqlwyps7s);
			$wyps7ps = pg_result($resultwyps7s, 0, "nazwa_wp");

$sqlpowss8 = "SELECT pps8, pps8_bo FROM tab_lok_w where id_d = '$nu';";	
	$resultpowss8 = @pg_Exec($conn, $sqlpowss8);
	$powss8s = pg_result($resultpowss8, 0, "pps8");
	$powss8sp = pg_result($resultpowss8, 0, "pps8_bo");

$sqlpopss8 = "SELECT pops8, pops8_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultpopss8 = @pg_Exec($conn, $sqlpopss8);
			$popss8s = pg_result($resultpopss8, 0, "pops8");
			$popss8bo = pg_result($resultpopss8, 0, "pops8_bo");
				
	$sqlpopss8s = "SELECT nazwa_pod FROM podlogi where id = '$popss8s';";
			
			$resultpopss8s = @pg_Exec($conn, $sqlpopss8s);
			$popss8ps = pg_result($resultpopss8s, 0, "nazwa_pod");

$sqlss8 = "SELECT pss8, pss8_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultss8 = @pg_Exec($conn, $sqlss8);
			$pss8s = pg_result($resultss8, 0, "pss8");
			$pss8bo = pg_result($resultss8, 0, "pss8_bo");
				
	$sqlss8s = "SELECT nazwa_sc FROM sciany where id = '$pss8s';";
			
			$resultss8s = @pg_Exec($conn, $sqlss8s);
			$pss8ps = pg_result($resultss8s, 0, "nazwa_sc");

$sqlsufs8 = "SELECT psus8, psus8_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultsufs8 = @pg_Exec($conn, $sqlsufs8);
			$sufs8s = pg_result($resultsufs8, 0, "psus8");
			$sufs8bo = pg_result($resultsufs8, 0, "psus8_bo");
				
	$sqlsufs8s = "SELECT nazwa_su FROM sufit where id = '$sufs8s';";
			
			$resultsufs8s = @pg_Exec($conn, $sqlsufs8s);
			$sufs8ps = pg_result($resultsufs8s, 0, "nazwa_su");

$sqlwyps8 = "SELECT wyps8, wyps8_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultwyps8 = @pg_Exec($conn, $sqlwyps8);
			$wyps8s = pg_result($resultwyps8, 0, "wyps8");
			$wyps8bo = pg_result($resultwyps8, 0, "wyps8_bo");
				
	$sqlwyps8s = "SELECT nazwa_wp FROM wyposazenie where id = '$wyps8s';";
			
			$resultwyps8s = @pg_Exec($conn, $sqlwyps8s);
			$wyps8ps = pg_result($resultwyps8s, 0, "nazwa_wp");

$sqlpowss9 = "SELECT pps9, pps9_bo FROM tab_lok_w where id_d = '$nu';";	
	$resultpowss9 = @pg_Exec($conn, $sqlpowss9);
	$powss9s = pg_result($resultpowss9, 0, "pps9");
	$powss9sp = pg_result($resultpowss9, 0, "pps9_bo");

$sqlpopss9 = "SELECT pops9, pops9_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultpopss9 = @pg_Exec($conn, $sqlpopss9);
			$popss9s = pg_result($resultpopss9, 0, "pops9");
			$popss9bo = pg_result($resultpopss9, 0, "pops9_bo");
				
	$sqlpopss9s = "SELECT nazwa_pod FROM podlogi where id = '$popss9s';";
			
			$resultpopss9s = @pg_Exec($conn, $sqlpopss9s);
			$popss9ps = pg_result($resultpopss9s, 0, "nazwa_pod");

$sqlss9 = "SELECT pss9, pss9_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultss9 = @pg_Exec($conn, $sqlss9);
			$pss9s = pg_result($resultss9, 0, "pss9");
			$pss9bo = pg_result($resultss9, 0, "pss9_bo");
				
	$sqlss9s = "SELECT nazwa_sc FROM sciany where id = '$pss9s';";
			
			$resultss9s = @pg_Exec($conn, $sqlss9s);
			$pss9ps = pg_result($resultss9s, 0, "nazwa_sc");

$sqlsufs9 = "SELECT psus9, psus9_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultsufs9 = @pg_Exec($conn, $sqlsufs9);
			$sufs9s = pg_result($resultsufs9, 0, "psus9");
			$sufs9bo = pg_result($resultsufs9, 0, "psus9_bo");
				
	$sqlsufs9s = "SELECT nazwa_su FROM sufit where id = '$sufs9s';";
			
			$resultsufs9s = @pg_Exec($conn, $sqlsufs9s);
			$sufs9ps = pg_result($resultsufs9s, 0, "nazwa_su");

$sqlwyps9 = "SELECT wyps9, wyps9_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultwyps9 = @pg_Exec($conn, $sqlwyps9);
			$wyps9s = pg_result($resultwyps9, 0, "wyps9");
			$wyps9bo = pg_result($resultwyps9, 0, "wyps9_bo");
				
	$sqlwyps9s = "SELECT nazwa_wp FROM wyposazenie where id = '$wyps9s';";
			
			$resultwyps9s = @pg_Exec($conn, $sqlwyps9s);
			$wyps9ps = pg_result($resultwyps9s, 0, "nazwa_wp");

$sqlpowss10 = "SELECT pps10, pps10_bo FROM tab_lok_w where id_d = '$nu';";	
	$resultpowss10 = @pg_Exec($conn, $sqlpowss10);
	$powss10s = pg_result($resultpowss10, 0, "pps10");
	$powss10sp = pg_result($resultpowss10, 0, "pps10_bo");

$sqlpopss10 = "SELECT pops10, pops10_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultpopss10 = @pg_Exec($conn, $sqlpopss10);
			$popss10s = pg_result($resultpopss10, 0, "pops10");
			$popss10bo = pg_result($resultpopss10, 0, "pops10_bo");
				
	$sqlpopss10s = "SELECT nazwa_pod FROM podlogi where id = '$popss10s';";
			
			$resultpopss10s = @pg_Exec($conn, $sqlpopss10s);
			$popss10ps = pg_result($resultpopss10s, 0, "nazwa_pod");

$sqlss10 = "SELECT pss10, pss10_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultss10 = @pg_Exec($conn, $sqlss10);
			$pss10s = pg_result($resultss10, 0, "pss10");
			$pss10bo = pg_result($resultss10, 0, "pss10_bo");
				
	$sqlss10s = "SELECT nazwa_sc FROM sciany where id = '$pss10s';";
			
			$resultss10s = @pg_Exec($conn, $sqlss10s);
			$pss10ps = pg_result($resultss10s, 0, "nazwa_sc");

$sqlsufs10 = "SELECT psus10, psus10_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultsufs10 = @pg_Exec($conn, $sqlsufs10);
			$sufs10s = pg_result($resultsufs10, 0, "psus10");
			$sufs10bo = pg_result($resultsufs10, 0, "psus10_bo");
				
	$sqlsufs10s = "SELECT nazwa_su FROM sufit where id = '$sufs10s';";
			
			$resultsufs10s = @pg_Exec($conn, $sqlsufs10s);
			$sufs10ps = pg_result($resultsufs10s, 0, "nazwa_su");

$sqlwyps10 = "SELECT wyps10, wyps10_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultwyps10 = @pg_Exec($conn, $sqlwyps10);
			$wyps10s = pg_result($resultwyps10, 0, "wyps10");
			$wyps10bo = pg_result($resultwyps10, 0, "wyps10_bo");
				
	$sqlwyps10s = "SELECT nazwa_wp FROM wyposazenie where id = '$wyps10s';";
			
			$resultwyps10s = @pg_Exec($conn, $sqlwyps10s);
			$wyps10ps = pg_result($resultwyps10s, 0, "nazwa_wp");

$sqlpowss11 = "SELECT pps11, pps11_bo FROM tab_lok_w where id_d = '$nu';";	
	$resultpowss11 = @pg_Exec($conn, $sqlpowss11);
	$powss11s = pg_result($resultpowss11, 0, "pps11");
	$powss11sp = pg_result($resultpowss11, 0, "pps11_bo");

$sqlpopss11 = "SELECT pops11, pops11_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultpopss11 = @pg_Exec($conn, $sqlpopss11);
			$popss11s = pg_result($resultpopss11, 0, "pops11");
			$popss11bo = pg_result($resultpopss11, 0, "pops11_bo");
				
	$sqlpopss11s = "SELECT nazwa_pod FROM podlogi where id = '$popss11s';";
			
			$resultpopss11s = @pg_Exec($conn, $sqlpopss11s);
			$popss11ps = pg_result($resultpopss11s, 0, "nazwa_pod");

$sqlss11 = "SELECT pss11, pss11_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultss11 = @pg_Exec($conn, $sqlss11);
			$pss11s = pg_result($resultss11, 0, "pss11");
			$pss11bo = pg_result($resultss11, 0, "pss11_bo");
				
	$sqlss11s = "SELECT nazwa_sc FROM sciany where id = '$pss11s';";
			
			$resultss11s = @pg_Exec($conn, $sqlss11s);
			$pss11ps = pg_result($resultss11s, 0, "nazwa_sc");

$sqlsufs11 = "SELECT psus11, psus11_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultsufs11 = @pg_Exec($conn, $sqlsufs11);
			$sufs11s = pg_result($resultsufs11, 0, "psus11");
			$sufs11bo = pg_result($resultsufs11, 0, "psus11_bo");
				
	$sqlsufs11s = "SELECT nazwa_su FROM sufit where id = '$sufs11s';";
			
			$resultsufs11s = @pg_Exec($conn, $sqlsufs11s);
			$sufs11ps = pg_result($resultsufs11s, 0, "nazwa_su");

$sqlwyps11 = "SELECT wyps11, wyps11_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultwyps11 = @pg_Exec($conn, $sqlwyps11);
			$wyps11s = pg_result($resultwyps11, 0, "wyps11");
			$wyps11bo = pg_result($resultwyps11, 0, "wyps11_bo");
				
	$sqlwyps11s = "SELECT nazwa_wp FROM wyposazenie where id = '$wyps11s';";
			
			$resultwyps11s = @pg_Exec($conn, $sqlwyps11s);
			$wyps11ps = pg_result($resultwyps11s, 0, "nazwa_wp");

$sqlpowss12 = "SELECT pps12, pps12_bo FROM tab_lok_w where id_d = '$nu';";	
	$resultpowss12 = @pg_Exec($conn, $sqlpowss12);
	$powss12s = pg_result($resultpowss12, 0, "pps12");
	$powss12sp = pg_result($resultpowss12, 0, "pps12_bo");

$sqlpopss12 = "SELECT pops12, pops12_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultpopss12 = @pg_Exec($conn, $sqlpopss12);
			$popss12s = pg_result($resultpopss12, 0, "pops12");
			$popss12bo = pg_result($resultpopss12, 0, "pops12_bo");
				
	$sqlpopss12s = "SELECT nazwa_pod FROM podlogi where id = '$popss12s';";
			
			$resultpopss12s = @pg_Exec($conn, $sqlpopss12s);
			$popss12ps = pg_result($resultpopss12s, 0, "nazwa_pod");

$sqlss12 = "SELECT pss12, pss12_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultss12 = @pg_Exec($conn, $sqlss12);
			$pss12s = pg_result($resultss12, 0, "pss12");
			$pss12bo = pg_result($resultss12, 0, "pss12_bo");
				
	$sqlss12s = "SELECT nazwa_sc FROM sciany where id = '$pss12s';";
			
			$resultss12s = @pg_Exec($conn, $sqlss12s);
			$pss12ps = pg_result($resultss12s, 0, "nazwa_sc");

$sqlsufs12 = "SELECT psus12, psus12_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultsufs12 = @pg_Exec($conn, $sqlsufs12);
			$sufs12s = pg_result($resultsufs12, 0, "psus12");
			$sufs12bo = pg_result($resultsufs12, 0, "psus12_bo");
				
	$sqlsufs12s = "SELECT nazwa_su FROM sufit where id = '$sufs12s';";
			
			$resultsufs12s = @pg_Exec($conn, $sqlsufs12s);
			$sufs12ps = pg_result($resultsufs12s, 0, "nazwa_su");

$sqlwyps12 = "SELECT wyps12, wyps12_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultwyps12 = @pg_Exec($conn, $sqlwyps12);
			$wyps12s = pg_result($resultwyps12, 0, "wyps12");
			$wyps12bo = pg_result($resultwyps12, 0, "wyps12_bo");
				
	$sqlwyps12s = "SELECT nazwa_wp FROM wyposazenie where id = '$wyps12s';";
			
			$resultwyps12s = @pg_Exec($conn, $sqlwyps12s);
			$wyps12ps = pg_result($resultwyps12s, 0, "nazwa_wp");

if (($powss1sp == 't')  || ($popss1bo == 't') || ($pss1bo == 't')  || ($sufs1bo == 't') || ($wyps1bo == 't') || ($powss2sp == 't')  || ($popss2bo == 't') || ($pss2bo == 't')  || ($sufs2bo == 't') || ($wyps2bo == 't') || ($powss3sp == 't')  || ($popss3bo == 't') || ($pss3bo == 't')  || ($sufs3bo == 't') || ($wyps3bo == 't') || ($powss4sp == 't')  || ($popss4bo == 't') || ($pss4bo == 't')  || ($sufs4bo == 't') || ($wyps4bo == 't') || ($powss5sp == 't')  || ($popss5bo == 't') || ($pss5bo == 't')  || ($sufs5bo == 't') || ($wyps5bo == 't') || ($powss6sp == 't')  || ($popss6bo == 't') || ($pss6bo == 't')  || ($sufs6bo == 't') || ($wyps6bo == 't') || ($powss7sp == 't')  || ($popss7bo == 't') || ($pss7bo == 't')  || ($sufs7bo == 't') || ($wyps7bo == 't') || ($powss8sp == 't')  || ($popss8bo == 't') || ($pss8bo == 't')  || ($sufs8bo == 't') || ($wyps8bo == 't') || ($powss9sp == 't')  || ($popss9bo == 't') || ($pss9bo == 't')  || ($sufs9bo == 't') || ($wyps9bo == 't') || ($powss10sp == 't')  || ($popss10bo == 't') || ($pss10bo == 't')  || ($sufs10bo == 't') || ($wyps10bo == 't') || ($powss11sp == 't')  || ($popss11bo == 't') || ($pss11bo == 't')  || ($sufs11bo == 't') || ($wyps11bo == 't') || ($powss12sp == 't')  || ($popss12bo == 't') || ($pss12bo == 't')  || ($sufs12bo == 't') || ($wyps12bo == 't')) {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

echo "<tr><td colspan=\"40\" height=\"7\" bgcolor=\"#5865E5\">";
echo "<span class=\"nag1wb\">";
echo "&nbsp;Pomieszczenia socjalne";
echo "</span>";
echo "</td></tr>";

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}
if (($powss1sp == 't')  || ($popss1bo == 't') || ($pss1bo == 't')  || ($sufs1bo == 't')) {
echo "<tr>"; 
}
if ($powss1sp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pow. pom. 1:</b><br>&nbsp;$powss1s m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($popss1bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pod³oga pom. 1:</b><br>&nbsp;$popss1ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($pss1bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>¦ciana pom. 1:</b><br>&nbsp;$pss1ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($sufs1bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Sufit pom. 1:</b><br>&nbsp;$sufs1ps";
echo "</td>";

}

if (($powss1sp == 't')  || ($popss1bo == 't') || ($pss1bo == 't')  || ($sufs1bo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}


if ($wyps1bo == 't') {
echo "<tr>";
echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Wyposa¿enie pom. 1:</b><br>&nbsp;$wyps1ps";
echo "</td>";
echo "</tr>";
}	

if ($wyps1bo == 't') {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}
if (($powss2sp == 't')  || ($popss2bo == 't') || ($pss2bo == 't')  || ($sufs2bo == 't')) {
echo "<tr>"; 
}
if ($powss2sp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pow. pom. 2:</b><br>&nbsp;$powss2s m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($popss2bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pod³oga pom. 2:</b><br>&nbsp;$popss2ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($pss2bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>¦ciana pom. 2:</b><br>&nbsp;$pss2ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($sufs2bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Sufit pom. 2:</b><br>&nbsp;$sufs2ps";
echo "</td>";

}

if (($powss2sp == 't')  || ($popss2bo == 't') || ($pss2bo == 't')  || ($sufs2bo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}


if ($wyps2bo == 't') {
echo "<tr>";
echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Wyposa¿enie pom. 2:</b><br>&nbsp;$wyps2ps";
echo "</td>";
echo "</tr>";
}	

if ($wyps2bo == 't') {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}
if (($powss3sp == 't')  || ($popss3bo == 't') || ($pss3bo == 't')  || ($sufs3bo == 't')) {
echo "<tr>"; 
}
if ($powss3sp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pow. pom. 3:</b><br>&nbsp;$powss3s m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($popss3bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pod³oga pom. 3:</b><br>&nbsp;$popss3ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($pss3bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>¦ciana pom. 3:</b><br>&nbsp;$pss3ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($sufs3bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Sufit pom. 3:</b><br>&nbsp;$sufs3ps";
echo "</td>";

}

if (($powss3sp == 't')  || ($popss3bo == 't') || ($pss3bo == 't')  || ($sufs3bo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}


if ($wyps3bo == 't') {
echo "<tr>";
echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Wyposa¿enie pom. 3:</b><br>&nbsp;$wyps3ps";
echo "</td>";
echo "</tr>";
}	

if ($wyps3bo == 't') {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}
if (($powss4sp == 't')  || ($popss4bo == 't') || ($pss4bo == 't')  || ($sufs4bo == 't')) {
echo "<tr>"; 
}
if ($powss4sp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pow. pom. 4:</b><br>&nbsp;$powss4s m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($popss4bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pod³oga pom. 4:</b><br>&nbsp;$popss4ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($pss4bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>¦ciana pom. 4:</b><br>&nbsp;$pss4ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($sufs4bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Sufit pom. 4:</b><br>&nbsp;$sufs4ps";
echo "</td>";

}

if (($powss4sp == 't')  || ($popss4bo == 't') || ($pss4bo == 't')  || ($sufs4bo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}


if ($wyps4bo == 't') {
echo "<tr>";
echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Wyposa¿enie pom. 4:</b><br>&nbsp;$wyps4ps";
echo "</td>";
echo "</tr>";
}	

if ($wyps4bo == 't') {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}
if (($powss5sp == 't')  || ($popss5bo == 't') || ($pss5bo == 't')  || ($sufs5bo == 't')) {
echo "<tr>"; 
}
if ($powss5sp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pow. pom. 5:</b><br>&nbsp;$powss5s m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($popss5bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pod³oga pom. 5:</b><br>&nbsp;$popss5ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($pss5bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>¦ciana pom. 5:</b><br>&nbsp;$pss5ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($sufs5bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Sufit pom. 5:</b><br>&nbsp;$sufs5ps";
echo "</td>";

}

if (($powss5sp == 't')  || ($popss5bo == 't') || ($pss5bo == 't')  || ($sufs5bo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}


if ($wyps5bo == 't') {
echo "<tr>";
echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Wyposa¿enie pom. 5:</b><br>&nbsp;$wyps5ps";
echo "</td>";
echo "</tr>";
}	

if ($wyps5bo == 't') {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}
if (($powss6sp == 't')  || ($popss6bo == 't') || ($pss6bo == 't')  || ($sufs6bo == 't')) {
echo "<tr>"; 
}
if ($powss6sp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pow. pom. 6:</b><br>&nbsp;$powss6s m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($popss6bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pod³oga pom. 6:</b><br>&nbsp;$popss6ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($pss6bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>¦ciana pom. 6:</b><br>&nbsp;$pss6ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($sufs6bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Sufit pom. 6:</b><br>&nbsp;$sufs6ps";
echo "</td>";

}

if (($powss6sp == 't')  || ($popss6bo == 't') || ($pss6bo == 't')  || ($sufs6bo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}


if ($wyps6bo == 't') {
echo "<tr>";
echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Wyposa¿enie pom. 6:</b><br>&nbsp;$wyps6ps";
echo "</td>";
echo "</tr>";
}	

if ($wyps6bo == 't') {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}
if (($powss7sp == 't')  || ($popss7bo == 't') || ($pss7bo == 't')  || ($sufs7bo == 't')) {
echo "<tr>"; 
}
if ($powss7sp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pow. pom. 7:</b><br>&nbsp;$powss7s m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($popss7bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pod³oga pom. 7:</b><br>&nbsp;$popss7ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($pss7bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>¦ciana pom. 7:</b><br>&nbsp;$pss7ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($sufs7bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Sufit pom. 7:</b><br>&nbsp;$sufs7ps";
echo "</td>";

}

if (($powss7sp == 't')  || ($popss7bo == 't') || ($pss7bo == 't')  || ($sufs7bo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}


if ($wyps7bo == 't') {
echo "<tr>";
echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Wyposa¿enie pom. 7:</b><br>&nbsp;$wyps7ps";
echo "</td>";
echo "</tr>";
}	

if ($wyps7bo == 't') {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}
if (($powss8sp == 't')  || ($popss8bo == 't') || ($pss8bo == 't')  || ($sufs8bo == 't')) {
echo "<tr>"; 
}
if ($powss8sp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pow. pom. 8:</b><br>&nbsp;$powss8s m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($popss8bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pod³oga pom. 8:</b><br>&nbsp;$popss8ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($pss8bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>¦ciana pom. 8:</b><br>&nbsp;$pss8ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($sufs8bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Sufit pom. 8:</b><br>&nbsp;$sufs8ps";
echo "</td>";

}

if (($powss8sp == 't')  || ($popss8bo == 't') || ($pss8bo == 't')  || ($sufs8bo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}


if ($wyps8bo == 't') {
echo "<tr>";
echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Wyposa¿enie pom. 8:</b><br>&nbsp;$wyps8ps";
echo "</td>";
echo "</tr>";
}	

if ($wyps8bo == 't') {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}
if (($powss9sp == 't')  || ($popss9bo == 't') || ($pss9bo == 't')  || ($sufs9bo == 't')) {
echo "<tr>"; 
}
if ($powss9sp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pow. pom. 9:</b><br>&nbsp;$powss9s m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($popss9bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pod³oga pom. 9:</b><br>&nbsp;$popss9ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($pss9bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>¦ciana pom. 9:</b><br>&nbsp;$pss9ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($sufs9bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Sufit pom. 9:</b><br>&nbsp;$sufs9ps";
echo "</td>";

}

if (($powss9sp == 't')  || ($popss9bo == 't') || ($pss9bo == 't')  || ($sufs9bo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}


if ($wyps9bo == 't') {
echo "<tr>";
echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Wyposa¿enie pom. 9:</b><br>&nbsp;$wyps9ps";
echo "</td>";
echo "</tr>";
}	

if ($wyps9bo == 't') {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}
if (($powss10sp == 't')  || ($popss10bo == 't') || ($pss10bo == 't')  || ($sufs10bo == 't')) {
echo "<tr>"; 
}
if ($powss10sp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pow. pom. 10:</b><br>&nbsp;$powss10s m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($popss10bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pod³oga pom. 10:</b><br>&nbsp;$popss10ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($pss10bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>¦ciana pom. 10:</b><br>&nbsp;$pss10ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($sufs10bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Sufit pom. 10:</b><br>&nbsp;$sufs10ps";
echo "</td>";

}

if (($powss10sp == 't')  || ($popss10bo == 't') || ($pss10bo == 't')  || ($sufs10bo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}


if ($wyps10bo == 't') {
echo "<tr>";
echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Wyposa¿enie pom. 10:</b><br>&nbsp;$wyps10ps";
echo "</td>";
echo "</tr>";
}	

if ($wyps10bo == 't') {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}
if (($powss11sp == 't')  || ($popss11bo == 't') || ($pss11bo == 't')  || ($sufs11bo == 't')) {
echo "<tr>"; 
}
if ($powss11sp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pow. pom. 11:</b><br>&nbsp;$powss11s m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($popss11bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pod³oga pom. 11:</b><br>&nbsp;$popss11ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($pss11bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>¦ciana pom. 11:</b><br>&nbsp;$pss11ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($sufs11bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Sufit pom. 11:</b><br>&nbsp;$sufs11ps";
echo "</td>";

}

if (($powss11sp == 't')  || ($popss11bo == 't') || ($pss11bo == 't')  || ($sufs11bo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}


if ($wyps11bo == 't') {
echo "<tr>";
echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Wyposa¿enie pom. 11:</b><br>&nbsp;$wyps11ps";
echo "</td>";
echo "</tr>";
}	

if ($wyps11bo == 't') {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}

if (($powss12sp == 't')  || ($popss12bo == 't') || ($pss12bo == 't')  || ($sufs12bo == 't')) {
echo "<tr>"; 
}
if ($powss12sp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pow. pom. 12:</b><br>&nbsp;$powss12s m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($popss12bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pod³oga pom. 12:</b><br>&nbsp;$popss12ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($pss12bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>¦ciana pom. 12:</b><br>&nbsp;$pss12ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($sufs12bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Sufit pom. 12:</b><br>&nbsp;$sufs12ps";
echo "</td>";

}

if (($powss12sp == 't')  || ($popss12bo == 't') || ($pss12bo == 't')  || ($sufs12bo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}


if ($wyps12bo == 't') {
echo "<tr>";
echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Wyposa¿enie pom. 12:</b><br>&nbsp;$wyps12ps";
echo "</td>";
echo "</tr>";
}	

if ($wyps12bo == 't') {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}



$sqlzd9 = "SELECT zd9 FROM tab_lok_w where id_d = '$nu';";
			
	$resultzd9s = @pg_Exec($conn, $sqlzd9);
	$zd9ms = pg_result($resultzd9s, 0, "zd9");

$sqlzd10 = "SELECT zd10 FROM tab_lok_w where id_d = '$nu';";
			
	$resultzd10s = @pg_Exec($conn, $sqlzd10);
	$zd10ms = pg_result($resultzd10s, 0, "zd10");

$sqlzd11 = "SELECT zd11 FROM tab_lok_w where id_d = '$nu';";
			
	$resultzd11s = @pg_Exec($conn, $sqlzd11);
	$zd11ms = pg_result($resultzd11s, 0, "zd11");

$sqlzd12 = "SELECT zd12 FROM tab_lok_w where id_d = '$nu';";
			
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

$sqlrobu = "SELECT rr_b, rr_b_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultrobu = @pg_Exec($conn, $sqlrobu);
			$robus = pg_result($resultrobu, 0, "rr_b");
			$robubo = pg_result($resultrobu, 0, "rr_b_bo");
				
	$sqlrobus = "SELECT nazwa_b FROM rodzaj_b where id = '$robus';";
			
			$resultrobus = @pg_Exec($conn, $sqlrobus);
			$robups = pg_result($resultrobus, 0, "nazwa_b");


$sqltechb = "SELECT teb_d, teb_d_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resulttechb = @pg_Exec($conn, $sqltechb);
			$techbs = pg_result($resulttechb, 0, "teb_d");
			$techbbo = pg_result($resulttechb, 0, "teb_d_bo");
				
	$sqltechbs = "SELECT nazwat_b FROM techno_b where id = '$techbs';";
			
			$resulttechbs = @pg_Exec($conn, $sqltechbs);
			$techbps = pg_result($resulttechbs, 0, "nazwat_b");

$sqlmatb = "SELECT mat_d, mat_d_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultmatb = @pg_Exec($conn, $sqlmatb);
			$matbs = pg_result($resultmatb, 0, "mat_d");
			$matbbo = pg_result($resultmatb, 0, "mat_d_bo");
				
	$sqlmatbs = "SELECT nazwa_m FROM material_b where id = '$matbs';";
			
			$resultmatbs = @pg_Exec($conn, $sqlmatbs);
			$matbps = pg_result($resultmatbs, 0, "nazwa_m");

$sqldachd = "SELECT kdach_d, kdach_d_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultdachd = @pg_Exec($conn, $sqldachd);
			$dachds = pg_result($resultdachd, 0, "kdach_d");
			$dachdbo = pg_result($resultdachd, 0, "kdach_d_bo");
				
	$sqldachds = "SELECT nazwa_da FROM dach where id = '$dachds';";
			
			$resultkdachds = @pg_Exec($conn, $sqldachds);
			$dachdps = pg_result($resultkdachds, 0, "nazwa_da");

$sqlrokbu = "SELECT rok_d, rok_d_bo FROM tab_lok_w where id_d = '$nu';";	
	$resultrokbu = @pg_Exec($conn, $sqlrokbu);
	$rokbus = pg_result($resultrokbu, 0, "rok_d");
	$rokbusp = pg_result($resultrokbu, 0, "rok_d_bo");

$sqlwysok = "SELECT wo_d, wo_d_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultwysok = @pg_Exec($conn, $sqlwysok);
			$wysoks = pg_result($resultwysok, 0, "wo_d");
			$wysokbo = pg_result($resultwysok, 0, "wo_d_bo");
				
	$sqlwysoks = "SELECT nazwa_wy FROM wystawka_o where id = '$wysoks';";
			
			$resultwysoks = @pg_Exec($conn, $sqlwysoks);
			$wysokps = pg_result($resultwysoks, 0, "nazwa_wy");	

$sqlwyspo = "SELECT ws_d, ws_d_bo FROM tab_lok_w where id_d = '$nu';";	
	$resultwyspo = @pg_Exec($conn, $sqlwyspo);
	$wyspos = pg_result($resultwyspo, 0, "ws_d");
	$wysposp = pg_result($resultwyspo, 0, "ws_d_bo");	


	$sqlokna = "SELECT okn_d, okn_d_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultokna = @pg_Exec($conn, $sqlokna);
			$oknas = pg_result($resultokna, 0, "okn_d");
			$oknabo = pg_result($resultokna, 0, "okn_d_bo");
				
	$sqloknas = "SELECT nazwa_ok FROM okna where id = '$oknas';";
			
			$resultoknas = @pg_Exec($conn, $sqloknas);
			$oknaps = pg_result($resultoknas, 0, "nazwa_ok");


if (($robubo == 't') || ($techbbo == 't') || ($matbbo == 't') || ($dachdbo == 't')  || ($rokbusp == 't') || ($wysokbo == 't')  || ($wysposp == 't') || ($oknabo == 't')) {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
echo "<tr><td colspan=\"40\" height=\"7\" bgcolor=\"#5865E5\">";
echo "<span class=\"nag1wb\">";
echo "&nbsp;Informacje techniczne";
echo "</span>";
echo "</td></tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}
if (($robubo == 't') || ($techbbo == 't') || ($matbbo == 't') || ($dachdbo == 't')) {
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

if ($dachdbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Krycie dachu:</b><br>&nbsp;$dachdps";
echo "</td>";

}


if (($robubo == 't') || ($techbbo == 't') || ($matbbo == 't') || ($dachdbo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}
if (($rokbusp == 't') || ($wysokbo == 't')  || ($wysposp == 't') || ($oknabo == 't')) {
echo "<tr>";
}
if ($rokbusp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Rok budowy:</b><br>&nbsp;$rokbus";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

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

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Okna:</b><br>&nbsp;$oknaps";
echo "</td>";

}

if (($rokbusp == 't') || ($wysokbo == 't')  || ($wysposp == 't') || ($oknabo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}


$sqlkszdz = "SELECT ksdzi_d, ksdzi_d_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultkszdz = @pg_Exec($conn, $sqlkszdz);
			$kszdzs = pg_result($resultkszdz, 0, "ksdzi_d");
			$kszdzbo = pg_result($resultkszdz, 0, "ksdzi_d_bo");
				
	$sqlkszdzs = "SELECT nazwa_dz FROM dzialka where id = '$kszdzs';";
			
			$resultkszdzs = @pg_Exec($conn, $sqlkszdzs);
			$kszdzps = pg_result($resultkszdzs, 0, "nazwa_dz");


$sqlszdz = "SELECT szdzi_d, szdzi_d_bo FROM tab_lok_w where id_d = '$nu';";	
	$resultszdz = @pg_Exec($conn, $sqlszdz);
	$szdzis = pg_result($resultszdz, 0, "szdzi_d");
	$szdzisp = pg_result($resultszdz, 0, "szdzi_d_bo");

$sqldldz = "SELECT dldz_d, dldz_d_bo FROM tab_lok_w where id_d = '$nu';";	
	$resultdldz = @pg_Exec($conn, $sqldldz);
	$dldzs = pg_result($resultdldz, 0, "dldz_d");
	$dldzsp = pg_result($resultdldz, 0, "dldz_d_bo");

$sqlnardz = "SELECT dzinar_d, dzinar_d_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultnardz = @pg_Exec($conn, $sqlnardz);
			$nardzs = pg_result($resultnardz, 0, "dzinar_d");
			$nardzbo = pg_result($resultnardz, 0, "dzinar_d_bo");
				
	$sqlnardzs = "SELECT nazwa_nar FROM dzialka_nar where id = '$nardzs';";
			
			$resultnardzs = @pg_Exec($conn, $sqlnardzs);
			$nardzps = pg_result($resultnardzs, 0, "nazwa_nar");

$sqlogrdz = "SELECT dziogr_d, dziogr_d_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultogrdz = @pg_Exec($conn, $sqlogrdz);
			$ogrdzs = pg_result($resultogrdz, 0, "dziogr_d");
			$ogrdzbo = pg_result($resultogrdz, 0, "dziogr_d_bo");
				
	$sqlogrdzs = "SELECT nazwa_og FROM dzialka_og where id = '$ogrdzs';";
			
			$resultogrdzs = @pg_Exec($conn, $sqlogrdzs);
			$ogrdzps = pg_result($resultogrdzs, 0, "nazwa_og");


	$sqluksz = "SELECT uksz_d, uksz_d_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultuksz = @pg_Exec($conn, $sqluksz);
			$ukszs = pg_result($resultuksz, 0, "uksz_d");
			$ukszbo = pg_result($resultuksz, 0, "uksz_d_bo");
				
	$sqlukszs = "SELECT nazwa_uk FROM dzialka_uk where id = '$ukszs';";
			
			$resultukszs = @pg_Exec($conn, $sqlukszs);
			$ukszps = pg_result($resultukszs, 0, "nazwa_uk");

$sqlzad = "SELECT zaddzi_d, zaddzi_d_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultzad = @pg_Exec($conn, $sqlzad);
			$zads = pg_result($resultzad, 0, "zaddzi_d");
			$zadbo = pg_result($resultzad, 0, "zaddzi_d_bo");
				
	$sqlzads = "SELECT nazwa_za FROM dzialka_za where id = '$zads';";
			
			$resultzads = @pg_Exec($conn, $sqlzads);
			$zadps = pg_result($resultzads, 0, "nazwa_za");

if (($kszdzbo == 't') || ($szdzisp == 't') || ($dldzsp == 't')  || ($nardzbo == 't') || ($ogrdzbo == 't')  || ($ukszbo == 't') || ($zadbo == 't')) {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
echo "<tr><td colspan=\"40\" height=\"7\" bgcolor=\"#5865E5\">";
echo "<span class=\"nag1wb\">";
echo "&nbsp;Dzia³ka";
echo "</span>";
echo "</td></tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}
if (($kszdzbo == 't') || ($szdzisp == 't') || ($dldzsp == 't') || ($nardzbo == 't')) {
echo "<tr>"; 
}
if ($kszdzbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Kszta³t dzia³ki:</b><br>&nbsp;$kszdzps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($szdzisp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Szereko¶æ dzia³ki:</b><br>&nbsp;$szdzis m";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($dldzsp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>D³ugo¶æ dzia³ki:</b><br>&nbsp;$dldzs m";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($nardzbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Dzia³ka naro¿na:</b><br>&nbsp;$nardzps";
echo "</td>";

}

if (($kszdzbo == 't') || ($szdzisp == 't') || ($dldzsp == 't') || ($nardzbo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}
if (($ogrdzbo == 't')  || ($ukszbo == 't') || ($zadbo == 't')) {
echo "<tr>";
}
if ($ogrdzbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Dzia³ka ogrodzona:</b><br>&nbsp;$ogrdzps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($ukszbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Ukszta³t. pionowe:</b><br>&nbsp;$ukszps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($zadbo == 't') {

echo "<td height=\"25\" colspan = \"20\">";
echo "&nbsp;<b>Zadrzewienie dzia³ki:</b><br>&nbsp;$zadps";
echo "</td>";

}

if (($ogrdzbo == 't')  || ($ukszbo == 't') || ($zadbo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}


	$sqlogrze = "SELECT ogrz_d, ogrz_d_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultogrze = @pg_Exec($conn, $sqlogrze);
			$ogrzes = pg_result($resultogrze, 0, "ogrz_d");
			$ogrzebo = pg_result($resultogrze, 0, "ogrz_d_bo");
				
	$sqlogrzes = "SELECT nazwa_grz FROM ogrzewanie where id = '$ogrzes';";
			
			$resultogrzes = @pg_Exec($conn, $sqlogrzes);
			$ogrzeps = pg_result($resultogrzes, 0, "nazwa_grz");
	
$sqlciepwo = "SELECT ciewod_d, ciewod_d_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultciepwo = @pg_Exec($conn, $sqlciepwo);
			$ciepwos = pg_result($resultciepwo, 0, "ciewod_d");
			$ciepwobo = pg_result($resultciepwo, 0, "ciewod_d_bo");
				
	$sqlciepwos = "SELECT nazwa_wo FROM ciepla_woda where id = '$ciepwos';";
			
			$resultciepwos = @pg_Exec($conn, $sqlciepwos);
			$ciepwops = pg_result($resultciepwos, 0, "nazwa_wo");

$sqlsila = "SELECT sila_d, sila_d_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultsila = @pg_Exec($conn, $sqlsila);
			$silas = pg_result($resultsila, 0, "sila_d");
			$silabo = pg_result($resultsila, 0, "sila_d_bo");
				
	$sqlsilas = "SELECT nazwa_si FROM sila where id = '$silas';";
			
			$resultsilas = @pg_Exec($conn, $sqlsilas);
			$silaps = pg_result($resultsilas, 0, "nazwa_si");

$sqlmoc = "SELECT moc_d, moc_d_bo FROM tab_lok_w where id_d = '$nu';";	
	$resultmoc = @pg_Exec($conn, $sqlmoc);
	$mocs = pg_result($resultmoc, 0, "moc_d");
	$mocsp = pg_result($resultmoc, 0, "moc_d_bo");

$sqlwoda = "SELECT wod_d, wod_d_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultwodat = @pg_Exec($conn, $sqlwoda);
			$wodas = pg_result($resultwodat, 0, "wod_d");
			$wodabo = pg_result($resultwodat, 0, "wod_d_bo");
				
	$sqlwodas = "SELECT nazwa_wo FROM woda where id = '$wodas';";
			
			$resultwodas = @pg_Exec($conn, $sqlwodas);
			$wodaps = pg_result($resultwodas, 0, "nazwa_wo");

$sqlgaz = "SELECT gaz_d, gaz_d_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultgaz = @pg_Exec($conn, $sqlgaz);
			$gazs = pg_result($resultgaz, 0, "gaz_d");
			$gazbo = pg_result($resultgaz, 0, "gaz_d_bo");
				
	$sqlgazs = "SELECT nazwa_g FROM gaz where id = '$gazs';";
			
			$resultgazs = @pg_Exec($conn, $sqlgazs);
			$gazps = pg_result($resultgazs, 0, "nazwa_g");

$sqlkanal = "SELECT kanal_d, kanal_d_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultkanal = @pg_Exec($conn, $sqlkanal);
			$kanals = pg_result($resultkanal, 0, "kanal_d");
			$kanalbo = pg_result($resultkanal, 0, "kanal_d_bo");
				
	$sqlkanals = "SELECT nazwa_ka FROM kanaliza where id = '$kanals';";
			
			$resultkanals = @pg_Exec($conn, $sqlkanals);
			$kanalps = pg_result($resultkanals, 0, "nazwa_ka");

$sqltel = "SELECT tel_d, tel_d_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resulttel = @pg_Exec($conn, $sqltel);
			$tels = pg_result($resulttel, 0, "tel_d");
			$telbo = pg_result($resulttel, 0, "tel_d_bo");
				
	$sqltels = "SELECT nazwa_te FROM telefon where id = '$tels';";
			
			$resulttels = @pg_Exec($conn, $sqltels);
			$telps = pg_result($resulttels, 0, "nazwa_te");

$sqlkabl = "SELECT siecka_d, siecka_d_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultkabl = @pg_Exec($conn, $sqlkabl);
			$kabls = pg_result($resultkabl, 0, "siecka_d");
			$kablbo = pg_result($resultkabl, 0, "siecka_d_bo");
				
	$sqlkabls = "SELECT nazwa_kab FROM kablowa where id = '$kabls';";
			
			$resultkabls = @pg_Exec($conn, $sqlkabls);
			$kablps = pg_result($resultkabls, 0, "nazwa_kab");

$sqlantena = "SELECT antena_d, antena_d_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultantena = @pg_Exec($conn, $sqlantena);
			$antenas = pg_result($resultantena, 0, "antena_d");
			$antenabo = pg_result($resultantena, 0, "antena_d_bo");
				
	$sqlantenas = "SELECT nazwa_an FROM antena where id = '$antenas';";
			
			$resultantenas = @pg_Exec($conn, $sqlantenas);
			$antenaps = pg_result($resultantenas, 0, "nazwa_an");

$sqlsiec = "SELECT siecint_d, siecint_d_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultsiec = @pg_Exec($conn, $sqlsiec);
			$siecs = pg_result($resultsiec, 0, "siecint_d");
			$siecbo = pg_result($resultsiec, 0, "siecint_d_bo");
				
	$sqlsiecs = "SELECT nazwa_siec FROM siec_inter where id = '$siecs';";
			
			$resultsiecs = @pg_Exec($conn, $sqlsiecs);
			$siecps = pg_result($resultsiecs, 0, "nazwa_siec");



if (($ogrzebo == 't')  || ($ciepwobo == 't') || ($silabo == 't') || ($mocsp == 't') || ($wodabo == 't') || ($gazbo == 't') || ($kanalbo == 't')  || ($telbo == 't') || ($kablbo == 't') || ($antenabo == 't') || ($siecbo == 't')) {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
echo "<tr><td colspan=\"40\" height=\"7\" bgcolor=\"#5865E5\">";
echo "<span class=\"nag1wb\">";
echo "&nbsp;Media";
echo "</span>";
echo "</td></tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}
if (($ogrzebo == 't')  || ($ciepwobo == 't') || ($silabo == 't') || ($mocsp == 't')) {
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

if ($mocsp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Moc KW:</b><br>&nbsp;$mocs";
echo "</td>";

}

if (($ogrzebo == 't')  || ($ciepwobo == 't') || ($silabo == 't') || ($mocsp == 't')) {
echo "</tr>"; 
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}
if (($wodabo == 't') || ($gazbo == 't') || ($kanalbo == 't')  || ($telbo == 't')) {
echo "<tr>"; 
}
if ($wodabo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Woda:</b><br>&nbsp;$wodaps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($gazbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Gaz:</b><br>&nbsp;$gazps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

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

}


if (($wodabo == 't') || ($gazbo == 't') || ($kanalbo == 't')  || ($telbo == 't')) {
echo "</tr>"; 
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}
if (($kablbo == 't') || ($antenabo == 't') || ($siecbo == 't')) {
echo "<tr>"; 
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

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($siecbo == 't') {
echo "<td height=\"25\" colspan = \"20\">";
echo "&nbsp;<b>Sieæ internetowa:</b><br>&nbsp;$siecps";
echo "</td>";

}

if (($kablbo == 't') || ($antenabo == 't') || ($siecbo == 't')) {
echo "</tr>"; 
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}


	$sqlochrn = "SELECT ochr_d, ochr_d_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultochrn = @pg_Exec($conn, $sqlochrn);
			$ochron = pg_result($resultochrn, 0, "ochr_d");
			$ochronbo = pg_result($resultochrn, 0, "ochr_d_bo");
				
	$sqlochrns = "SELECT nazwa_och FROM ochrona where id = '$ochron';";
			
			$resultochrns = @pg_Exec($conn, $sqlochrns);
			$ochronps = pg_result($resultochrns, 0, "nazwa_och");

		
$sqldfon = "SELECT domof_d, domof_d_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultdfon = @pg_Exec($conn, $sqldfon);
			$dfon = pg_result($resultdfon, 0, "domof_d");
			$dfonbo = pg_result($resultdfon, 0, "domof_d_bo");
				
	$sqldfons = "SELECT nazwa_do FROM domofon where id = '$dfon';";
			
			$resultdfons = @pg_Exec($conn, $sqldfons);
			$dfonps = pg_result($resultdfons, 0, "nazwa_do");

$sqldanty = "SELECT drzwant_d, drzwant_d_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultdanty = @pg_Exec($conn, $sqldanty);
			$danty = pg_result($resultdanty, 0, "drzwant_d");
			$dantybo = pg_result($resultdanty, 0, "drzwant_d_bo");
				
	$sqldantys = "SELECT nazwa_dz FROM drzwi_anty where id = '$danty';";
			
			$resultdantys = @pg_Exec($conn, $sqldantys);
			$dantyps = pg_result($resultdantys, 0, "nazwa_dz");

$sqlrolety = "SELECT rol_d, rol_d_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultrolety = @pg_Exec($conn, $sqlrolety);
			$rolety = pg_result($resultrolety, 0, "rol_d");
			$roletybo = pg_result($resultrolety, 0, "rol_d_bo");
				
	$sqlroletys = "SELECT nazwa_ro FROM rolety where id = '$rolety';";
			
			$resultroletys = @pg_Exec($conn, $sqlroletys);
			$roletyps = pg_result($resultroletys, 0, "nazwa_ro");

$sqlkamery = "SELECT kv_d, kv_d_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultkamery = @pg_Exec($conn, $sqlkamery);
			$kamery = pg_result($resultkamery, 0, "kv_d");
			$kamerybo = pg_result($resultkamery, 0, "kv_d_bo");
				
	$sqlkamerys = "SELECT nazwa_kam FROM kamery where id = '$kamery';";
			
			$resultkamerys = @pg_Exec($conn, $sqlkamerys);
			$kameryps = pg_result($resultkamerys, 0, "nazwa_kam");

$sqlkraty = "SELECT kra_d, kra_d_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultkraty = @pg_Exec($conn, $sqlkraty);
			$kratys = pg_result($resultkraty, 0, "kra_d");
			$kratybo = pg_result($resultkraty, 0, "kra_d_bo");
				
	$sqlkratys = "SELECT nazwa_kr FROM kraty where id = '$kratys';";
			
			$resultkratys = @pg_Exec($conn, $sqlkratys);
			$kratyps = pg_result($resultkratys, 0, "nazwa_kr");


$sqlalarm = "SELECT alar_d, alar_d_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultalarm = @pg_Exec($conn, $sqlalarm);
			$alarm = pg_result($resultalarm, 0, "alar_d");
			$alarmbo = pg_result($resultalarm, 0, "alar_d_bo");
				
	$sqlalarms = "SELECT nazwa_al FROM alarm where id = '$alarm';";
			
			$resultalarms = @pg_Exec($conn, $sqlalarms);
			$alarmps = pg_result($resultalarms, 0, "nazwa_al");

$sqlokanty = "SELECT okant_d, okant_d_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultokanty = @pg_Exec($conn, $sqlokanty);
			$okanty = pg_result($resultokanty, 0, "okant_d");
			$okantybo = pg_result($resultokanty, 0, "okant_d_bo");
				
	$sqlokantys = "SELECT nazwao_anty FROM okna_anty where id = '$okanty';";
			
			$resultokantys = @pg_Exec($conn, $sqlokantys);
			$okantyps = pg_result($resultokantys, 0, "nazwao_anty");

	$sqlrecep = "SELECT rec_d, rec_d_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultrecep = @pg_Exec($conn, $sqlrecep);
			$receps = pg_result($resultrecep, 0, "rec_d");
			$recepbo = pg_result($resultrecep, 0, "rec_d_bo");
				
	$sqlreceps = "SELECT nazwa_rec FROM recepcja where id = '$receps';";
			
			$resultreceps = @pg_Exec($conn, $sqlreceps);
			$recepps = pg_result($resultreceps, 0, "nazwa_rec");


if (($ochronbo == 't')  || ($dfonbo == 't') || ($dantybo == 't') || ($roletybo == 't') || ($kamerybo == 't') || ($kratybo == 't') || ($alarmbo == 't') || ($okantybo == 't') || ($recepbo == 't')) {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
echo "<tr><td colspan=\"40\" height=\"7\" bgcolor=\"#5865E5\">";
echo "<span class=\"nag1wb\">";
echo "&nbsp;Zabezpieczenia";
echo "</span>";
echo "</td></tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}
if (($ochronbo == 't')  || ($dfonbo == 't') || ($dantybo == 't') || ($roletybo == 't')) {
echo "<tr>"; 
}
if ($ochronbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Ochrona:</b><br>&nbsp;$ochronps";
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

if (($ochronbo == 't')  || ($dfonbo == 't') || ($dantybo == 't') || ($roletybo == 't')) {
echo "</tr>"; 
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}
if (($kamerybo == 't') || ($kratybo == 't') || ($alarmbo == 't') || ($okantybo == 't')) {
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

if ($kratybo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Kraty:</b><br>&nbsp;$kratyps";
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

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Okna antyw³am.:</b><br>&nbsp;$okantyps";
echo "</td>";
}

if (($kamerybo == 't') || ($kratybo == 't') || ($alarmbo == 't') || ($okantybo == 't')) {
echo "</tr>"; 
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}

if ($recepbo == 't') {
echo "<tr>"; 
echo "<td height=\"25\" colspan = \"20\">";
echo "&nbsp;<b>Recepcja:</b><br>&nbsp;$recepps";
echo "</td>";
echo "</tr>";
}

 

if ($recepbo == 't') {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}

$sqlklim = "SELECT klim_d, klim_d_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultklim = @pg_Exec($conn, $sqlklim);
			$klima = pg_result($resultklim, 0, "klim_d");
			$klimabo = pg_result($resultklim, 0, "klim_d_bo");
				
	$sqlklims = "SELECT nazwa_kli FROM klima where id = '$klima';";
			
			$resultklims = @pg_Exec($conn, $sqlklims);
			$klimps = pg_result($resultklims, 0, "nazwa_kli");

$sqlpiwn = "SELECT piwn_d, piwn_d_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultpiwn = @pg_Exec($conn, $sqlpiwn);
			$piwn = pg_result($resultpiwn, 0, "piwn_d");
			$piwnbo = pg_result($resultpiwn, 0, "piwn_d_bo");
				
	$sqlpiwns = "SELECT nazwa_pi FROM piwnica where id = '$piwn';";
			
			$resultpiwns = @pg_Exec($conn, $sqlpiwns);
			$piwnps = pg_result($resultpiwns, 0, "nazwa_pi");

$sqlpoddy = "SELECT poddy_d, poddy_d_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultpoddy = @pg_Exec($conn, $sqlpoddy);
			$poddys = pg_result($resultpoddy, 0, "poddy_d");
			$poddybo = pg_result($resultpoddy, 0, "poddy_d_bo");
				
	$sqlpoddys = "SELECT nazwa_pod FROM poddyst where id = '$poddys';";
			
			$resultpoddys = @pg_Exec($conn, $sqlpoddys);
			$poddyps = pg_result($resultpoddys, 0, "nazwa_pod");

$sqlosra = "SELECT osw_d, osw_d_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultosra = @pg_Exec($conn, $sqlosra);
			$osra = pg_result($resultosra, 0, "osw_d");
			$osrabo = pg_result($resultosra, 0, "osw_d_bo");
				
	$sqlosras = "SELECT nazwa_osw FROM oswietlenie where id = '$osra';";
			
			$resultosras = @pg_Exec($conn, $sqlosras);
			$osraps = pg_result($resultosras, 0, "nazwa_osw");

$sqlwarsz = "SELECT warsz_d, warsz_d_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultwarsz = @pg_Exec($conn, $sqlwarsz);
			$warszt = pg_result($resultwarsz, 0, "warsz_d");
			$warsztbo = pg_result($resultwarsz, 0, "warsz_d_bo");
				
	$sqlwarszs = "SELECT nazwa_wa FROM warsztat where id = '$warszt';";
			
			$resultwarszts = @pg_Exec($conn, $sqlwarszs);
			$warsztps = pg_result($resultwarszts, 0, "nazwa_wa");

	$sqlmiej = "SELECT mip_d, mip_d_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultmiej = @pg_Exec($conn, $sqlmiej);
			$miej = pg_result($resultmiej, 0, "mip_d");
			$miejbo = pg_result($resultmiej, 0, "mip_d_bo");
				
	$sqlmiejs = "SELECT nazwa_pa FROM parking where id = '$miej';";
			
			$resultmiejs = @pg_Exec($conn, $sqlmiejs);
			$miejps = pg_result($resultmiejs, 0, "nazwa_pa");

$sqludog = "SELECT udog_d, udog_d_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultudog = @pg_Exec($conn, $sqludog);
			$udog = pg_result($resultudog, 0, "udog_d");
			$udogbo = pg_result($resultudog, 0, "udog_d_bo");
				
	$sqludogs = "SELECT nazwa_nie FROM niepelno where id = '$udog';";
			
			$resultudogs = @pg_Exec($conn, $sqludogs);
			$udogps = pg_result($resultudogs, 0, "nazwa_nie");

$sqlligar = "SELECT ligar_d, ligar_d_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultligar = @pg_Exec($conn, $sqlligar);
			$lgar = pg_result($resultligar, 0, "ligar_d");
			$lgarbo = pg_result($resultligar, 0, "ligar_d_bo");


$sqlusgar = "SELECT usgar_d, usgar_d_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultusgar = @pg_Exec($conn, $sqlusgar);
			$usgars = pg_result($resultusgar, 0, "usgar_d");
			$usgarbo = pg_result($resultusgar, 0, "usgar_d_bo");
				
	$sqlusgars = "SELECT nazwa_usyt FROM garaz_usyt where id = '$usgars';";
			
			$resultusgars = @pg_Exec($conn, $sqlusgars);
			$usgarps = pg_result($resultusgars, 0, "nazwa_usyt");

$sqlrest = "SELECT resta_d, resta_d_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultrest = @pg_Exec($conn, $sqlrest);
			$rests = pg_result($resultrest, 0, "resta_d");
			$restbo = pg_result($resultrest, 0, "resta_d_bo");
				
	$sqlrests = "SELECT nazwa_res FROM restauracja where id = '$rests';";
			
			$resultrests = @pg_Exec($conn, $sqlrests);
			$restps = pg_result($resultrests, 0, "nazwa_res");

$sqlban = "SELECT bank_d, bank_d_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultban = @pg_Exec($conn, $sqlban);
			$bans = pg_result($resultban, 0, "bank_d");
			$banbo = pg_result($resultban, 0, "bank_d_bo");
				
	$sqlbans = "SELECT nazwa_ba FROM bank where id = '$bans';";
			
			$resultbans = @pg_Exec($conn, $sqlbans);
			$banps = pg_result($resultbans, 0, "nazwa_ba");

$sqlcent = "SELECT cenha_d, cenha_d_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultcent = @pg_Exec($conn, $sqlcent);
			$cents = pg_result($resultcent, 0, "cenha_d");
			$centbo = pg_result($resultcent, 0, "cenha_d_bo");
				
	$sqlcents = "SELECT nazwa_ce FROM centrum where id = '$cents';";
			
			$resultcents = @pg_Exec($conn, $sqlcents);
			$centps = pg_result($resultcents, 0, "nazwa_ce");


if (($klimabo == 't') || ($piwnbo == 't') || ($poddybo == 't') || ($osrabo == 't') || ($warsztbo == 't') || ($miejbo == 't') || ($udogbo == 't') || ($lgarbo == 't') || ($usgarbo == 't') || ($restbo == 't') || ($banbo == 't') || ($centbo == 't')) {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
echo "<tr><td colspan=\"40\" height=\"7\" bgcolor=\"#5865E5\">";
echo "<span class=\"nag1wb\">";
echo "&nbsp;Udogodnienia";
echo "</span>";
echo "</td></tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}
if (($klimabo == 't') || ($piwnbo == 't') || ($poddybo == 't') || ($osrabo == 't')) {
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

if ($piwnbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Piwnica:</b><br>&nbsp;$piwnps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($poddybo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pod³ogi dystansowe:</b><br>&nbsp;$poddyps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($osrabo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>O¶wietlenie rastrowe:</b><br>&nbsp;$osraps";
echo "</td>";

}

if (($klimabo == 't') || ($piwnbo == 't') || ($poddybo == 't') || ($osrabo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}
if (($warsztbo == 't') || ($miejbo == 't') || ($udogbo == 't') || ($lgarbo == 't')) {
echo "<tr>"; 
}
if ($warsztbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Warsztat:</b><br>&nbsp;$warsztps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($miejbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Miejsca parkingowe:</b><br>&nbsp;$miejps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($udogbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Udog. dla niepe³nosp.:</b><br>&nbsp;$udogps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($lgarbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Liczba gara¿y:</b><br>&nbsp;$lgar";
echo "</td>";

}

if (($warsztbo == 't') || ($miejbo == 't') || ($udogbo == 't') || ($lgarbo == 't')) {
echo "</tr>"; 
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}
if (($usgarbo == 't') || ($restbo == 't') || ($banbo == 't') || ($centbo == 't')) {
echo "<tr>"; 
}
if ($usgarbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Usyt. gara¿y:</b><br>&nbsp;$usgarps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($restbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Restauracja:</b><br>&nbsp;$restps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($banbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Bank:</b><br>&nbsp;$banps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($centbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Cen. handlowe:</b><br>&nbsp;$centps";
echo "</td>";

}

if (($usgarbo == 't') || ($restbo == 't') || ($banbo == 't') || ($centbo == 't')) {
echo "</tr>"; 
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}




$sqluli = "SELECT tdr_d, tdr_d_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultuli = @pg_Exec($conn, $sqluli);
			$uli = pg_result($resultuli, 0, "tdr_d");
			$ulibo = pg_result($resultuli, 0, "tdr_d_bo");
				
	$sqlulis = "SELECT nazwa_ul FROM typ_ulicy where id = '$uli';";
			
			$resultulis = @pg_Exec($conn, $sqlulis);
			$ulips = pg_result($resultulis, 0, "nazwa_ul");

$sqlnadr = "SELECT ndr_d, ndr_d_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultnadr = @pg_Exec($conn, $sqlnadr);
			$nadr = pg_result($resultnadr, 0, "ndr_d");
			$nadrbo = pg_result($resultnadr, 0, "ndr_d_bo");
				
	$sqlnadrs = "SELECT nazwa_na FROM nawierzchnia where id = '$nadr';";
			
			$resultnadrs = @pg_Exec($conn, $sqlnadrs);
			$nadrps = pg_result($resultnadrs, 0, "nazwa_na");

$sqlkomu = "SELECT kmod_d, kmod_d_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultkomu = @pg_Exec($conn, $sqlkomu);
			$komu = pg_result($resultkomu, 0, "kmod_d");
			$komubo = pg_result($resultkomu, 0, "kmod_d_bo");
				
	$sqlkomus = "SELECT nazwa_kom FROM komunikacja where id = '$komu';";
			
			$resultkomus = @pg_Exec($conn, $sqlkomus);
			$komups = pg_result($resultkomus, 0, "nazwa_kom");

$sqlodcm = "SELECT odlce_d, odlce_d_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultodcm = @pg_Exec($conn, $sqlodcm);
			$odcm = pg_result($resultodcm, 0, "odlce_d");
			$odcmbo = pg_result($resultodcm, 0, "odlce_d_bo");

$sqlotocz = "SELECT otnie_d, otnie_d_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultotocz = @pg_Exec($conn, $sqlotocz);
			$otocz = pg_result($resultotocz, 0, "otnie_d");
			$otoczbo = pg_result($resultotocz, 0, "otnie_d_bo");
				
	$sqlotoczs = "SELECT nazwa_oto FROM otoczenie where id = '$otocz';";
			
			$resultotoczs = @pg_Exec($conn, $sqlotoczs);
			$otoczps = pg_result($resultotoczs, 0, "nazwa_oto");	
			

if (($ulibo == 't') || ($nadrbo == 't') || ($komubo == 't') || ($odcmbo == 't') || ($otoczbo == 't')) {

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

if ($otoczbo == 't') {
echo "<tr>"; 
echo "<td height=\"25\" colspan = \"20\">";
echo "&nbsp;<b>Otoczenie nieuci±¿l.:</b><br>&nbsp;$otoczps";
echo "</td>";
echo "</tr>";
}

if ($otoczbo == 't') {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}



$sqllas = "SELECT las_d, las_d_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultlas = @pg_Exec($conn, $sqllas);
			$las = pg_result($resultlas, 0, "las_d");
			$lasbo = pg_result($resultlas, 0, "las_d_bo");
				
	$sqllass = "SELECT nazwa_la FROM las where id = '$las';";
			
			$resultlass = @pg_Exec($conn, $sqllass);
			$lasps = pg_result($resultlass, 0, "nazwa_la");

$sqlpark = "SELECT park_d, park_d_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultpark = @pg_Exec($conn, $sqlpark);
			$park = pg_result($resultpark, 0, "park_d");
			$parkbo = pg_result($resultpark, 0, "park_d_bo");
				
	$sqlparks = "SELECT nazwa_par FROM park where id = '$park';";
			
			$resultparks = @pg_Exec($conn, $sqlparks);
			$parkps = pg_result($resultparks, 0, "nazwa_par");

$sqlrzeka = "SELECT rzeka_d, rzeka_d_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultrzeka = @pg_Exec($conn, $sqlrzeka);
			$rzeka = pg_result($resultrzeka, 0, "rzeka_d");
			$rzekabo = pg_result($resultrzeka, 0, "rzeka_d_bo");
				
	$sqlrzekas = "SELECT nazwa_rz FROM rzeka where id = '$rzeka';";
			
			$resultrzekas = @pg_Exec($conn, $sqlrzekas);
			$rzekaps = pg_result($resultrzekas, 0, "nazwa_rz");

$sqljezioro = "SELECT jezioro_d, jezioro_d_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultjezioro = @pg_Exec($conn, $sqljezioro);
			$jezioro = pg_result($resultjezioro, 0, "jezioro_d");
			$jeziorobo = pg_result($resultjezioro, 0, "jezioro_d_bo");
				
	$sqljezioros = "SELECT nazwa_je FROM jezioro where id = '$jezioro';";
			
			$resultjezioros = @pg_Exec($conn, $sqljezioros);
			$jeziorops = pg_result($resultjezioros, 0, "nazwa_je");

$sqlstaw = "SELECT staw_d, staw_d_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultstaw = @pg_Exec($conn, $sqlstaw);
			$staw = pg_result($resultstaw, 0, "staw_d");
			$stawbo = pg_result($resultstaw, 0, "staw_d_bo");
				
	$sqlstaws = "SELECT nazwa_sta FROM staw where id = '$staw';";
			
			$resultstaws = @pg_Exec($conn, $sqlstaws);
			$stawps = pg_result($resultstaws, 0, "nazwa_sta");

$sqlgory = "SELECT gory_d, gory_d_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultgory = @pg_Exec($conn, $sqlgory);
			$gory = pg_result($resultgory, 0, "gory_d");
			$gorybo = pg_result($resultgory, 0, "gory_d_bo");
				
	$sqlgorys = "SELECT nazwa_go FROM gory where id = '$gory';";
			
			$resultgorys = @pg_Exec($conn, $sqlgorys);
			$goryps = pg_result($resultgorys, 0, "nazwa_go");




if (($lasbo == 't') || ($parkbo == 't') || ($rzekabo == 't') || ($jeziorobo == 't') || ($stawbo == 't') || ($gorybo == 't')) {

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
if (($stawbo == 't') || ($gorybo == 't')) {
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

if (($stawbo == 't') || ($gorybo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}


$sqlstand = "SELECT std_d, std_d_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultstand = @pg_Exec($conn, $sqlstand);
			$stand = pg_result($resultstand, 0, "std_d");
			$standbo = pg_result($resultstand, 0, "std_d_bo");
				
	$sqlstands = "SELECT nazwa_stan FROM standard where id = '$stand';";
			
			$resultstands = @pg_Exec($conn, $sqlstands);
			$standps = pg_result($resultstands, 0, "nazwa_stan");

$sqlstan = "SELECT sta_d, sta_d_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultstan = @pg_Exec($conn, $sqlstan);
			$stan = pg_result($resultstan, 0, "sta_d");
			$stanbo = pg_result($resultstan, 0, "sta_d_bo");
				
	$sqlstans = "SELECT nazwa_sst FROM stan where id = '$stan';";
			
			$resultstans = @pg_Exec($conn, $sqlstans);
			$stanps = pg_result($resultstans, 0, "nazwa_sst");

$sqlprzek = "SELECT moprz_d, moprz_d_bo FROM tab_lok_w where id_d = '$nu';";
			
			$resultprzek = @pg_Exec($conn, $sqlprzek);
			$przek = pg_result($resultprzek, 0, "moprz_d");
			$przekbo = pg_result($resultprzek, 0, "moprz_d_bo");
				
	$sqlprzeks = "SELECT nazwa_przek FROM przeksztalcenie where id = '$przek';";
			
			$resultprzeks = @pg_Exec($conn, $sqlprzeks);
			$przekps = pg_result($resultprzeks, 0, "nazwa_przek");

$sqldodop = "SELECT dodopis, dodopis_bo FROM tab_lok_w where id_d = '$nu';";
			
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