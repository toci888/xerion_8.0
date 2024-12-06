<?
$identbiura = "1";
$ok = "_b";
// polaczenie z baza
include "../concfg.inc";


if ($action == 'wynajemte') {

$sql0 = "select id_d from tab_te_w where loka = '1' and pokaz = 't' and usund = 'f' and id_b = '$identbiura' order by datawp_d desc;";

$result_set0 = pg_Exec($conn, $sql0);

$rows0 = pg_NumRows($result_set0);		// liczba zwroconych wierszy

if ((!$result_set0) || ($rows0 > 0)) { 

echo "<center>";
echo "<span class=\"nag2b\">";
echo "<b>WYNAJEM TERENÓW</b>";
echo "<br>";
echo "<b>(OPOLE)</b>";
echo "</span>";
echo "</center>";
}

$sql1 = "select id_d, no_d, lok_d, powdzi_d, cd, cm2_d, zd1, wyl_d, sm_d from tab_te_w where loka = '1' and rof_d  = '1' and pokaz = 't' and usund = 'f' and id_b = '$identbiura' order by datawp_d desc;";

$result_set1 = pg_Exec($conn, $sql1);

$rows1 = pg_NumRows($result_set1);		// liczba zwroconych wierszy

if ((!$result_set1) || ($rows1 > 0)) { 

echo "<br>";
echo "<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" frame border=\"0\">";
echo "<tr><td><img src=\"img/black.gif\" width=\"100%\" height=\"1\" border=\"0\" alt=\"\"></img></td></tr>";
echo "<tr valign=\"left\"><td height=\"7\" bgcolor=\"#5865E5\">";
echo "<center>";
echo "<span class=\"nag1wb\">";
echo "Tereny handlowe";
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

$tekst1 = "<a href = \"$PHP_SELF?action=wynajemtezd&nu=$id1\">wiêcej ...</a>";

echo "<tr>";
if ($zdj1 != 0) {
	echo "<td width=\"126\" height=\"63\" rowspan = \"5\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=wynajemtezd&nu=$id1\">";
	echo "<img src=\"../img/zd$zdj1.jpg\" width=\"90\" height=\"60\" border=\"0\" alt=\"Zdjêcie nr$zdj1\" class=\"ira\"></img></a><br>";
	echo "</center>";
	echo "</td>";
}
else {
	echo "<td width=\"126\" height=\"63\" rowspan = \"5\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=wynajemtezd&nu=$id1\">";
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

echo "<td align = \"left\">$wpstatp1";
echo "<b>Pow. terenu:</b> $powdz1 ar.";
echo "$wpstatk1</td>";

$cena1 = number_format($cena1,'', '.', '.');

echo "<td align = \"left\" colspan = \"2\">$wpstatp1";
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


$sql2 = "select id_d, no_d, lok_d, powdzi_d, cd, cm2_d, zd1, wyl_d, sm_d from tab_te_w where loka = '1' and rof_d  = '2' and pokaz = 't' and usund = 'f' and id_b = '$identbiura' order by datawp_d desc;";

$result_set2 = pg_Exec($conn, $sql2);

$rows2 = pg_NumRows($result_set2);		// liczba zwroconych wierszy

if ((!$result_set2) || ($rows2 > 0)) { 

echo "<br>";
echo "<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" frame border=\"0\">";
echo "<tr><td><img src=\"img/black.gif\" width=\"100%\" height=\"1\" border=\"0\" alt=\"\"></img></td></tr>";
echo "<tr valign=\"left\"><td height=\"7\" bgcolor=\"#5865E5\">";
echo "<center>";
echo "<span class=\"nag1wb\">";
echo "Tereny us³ugowe";
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

$tekst2 = "<a href = \"$PHP_SELF?action=wynajemtezd&nu=$id2\">wiêcej ...</a>";


echo "<tr>";
if ($zdj2 != 0) {
	echo "<td width=\"126\" height=\"63\" rowspan = \"5\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=wynajemtezd&nu=$id2\">";
	echo "<img src=\"../img/zd$zdj2.jpg\" width=\"90\" height=\"60\" border=\"0\" alt=\"Zdjêcie nr$zdj2\" class=\"ira\"></img></a><br>";
	echo "</center>";
	echo "</td>";
}
else {
	echo "<td width=\"126\" height=\"63\" rowspan = \"5\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=wynajemtezd&nu=$id2\">";
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

echo "<td align = \"left\">$wpstatp2";
echo "<b>Pow. terenu:</b> $powdz2 ar.";
echo "$wpstatk2</td>";

$cena2 = number_format($cena2,'', '.', '.');

echo "<td align = \"left\" colspan = \"2\">$wpstatp2";
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


$sql3 = "select id_d, no_d, lok_d, powdzi_d, cd, cm2_d, zd1, wyl_d, sm_d from tab_te_w where loka = '1' and rof_d  = '3' and pokaz = 't' and usund = 'f' and id_b = '$identbiura' order by datawp_d desc;";

$result_set3 = pg_Exec($conn, $sql3);

$rows3 = pg_NumRows($result_set3);		// liczba zwroconych wierszy

if ((!$result_set3) || ($rows3 > 0)) { 

echo "<br>";
echo "<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" frame border=\"0\">";
echo "<tr><td><img src=\"img/black.gif\" width=\"100%\" height=\"1\" border=\"0\" alt=\"\"></img></td></tr>";
echo "<tr valign=\"left\"><td height=\"7\" bgcolor=\"#5865E5\">";
echo "<center>";
echo "<span class=\"nag1wb\">";
echo "Tereny produkcyjne";
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

$tekst3 = "<a href = \"$PHP_SELF?action=wynajemtezd&nu=$id3\">wiêcej ...</a>";

echo "<tr>";
if ($zdj3 != 0) {
	echo "<td width=\"126\" height=\"63\" rowspan = \"5\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=wynajemtezd&nu=$id3\">";
	echo "<img src=\"../img/zd$zdj3.jpg\" width=\"90\" height=\"60\" border=\"0\" alt=\"Zdjêcie nr$zdj3\" class=\"ira\"></img></a><br>";
	echo "</center>";
	echo "</td>";
}
else {
	echo "<td width=\"126\" height=\"63\" rowspan = \"5\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=wynajemtezd&nu=$id3\">";
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

echo "<td align = \"left\">$wpstatp3";
echo "<b>Pow. terenu:</b> $powdz3 ar.";
echo "$wpstatk3</td>";

$cena3 = number_format($cena3,'', '.', '.');

echo "<td align = \"left\" colspan = \"2\">$wpstatp3";
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


$sql4 = "select id_d, no_d, lok_d, powdzi_d, cd, cm2_d, zd1, wyl_d, sm_d from tab_te_w where loka = '1' and rof_d  = '4' and pokaz = 't' and usund = 'f' and id_b = '$identbiura' order by datawp_d desc;";

$result_set4 = pg_Exec($conn, $sql4);

$rows4 = pg_NumRows($result_set4);		// liczba zwroconych wierszy

if ((!$result_set4) || ($rows4 > 0)) { 

echo "<br>";
echo "<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" frame border=\"0\">";
echo "<tr><td><img src=\"img/black.gif\" width=\"100%\" height=\"1\" border=\"0\" alt=\"\"></img></td></tr>";
echo "<tr valign=\"left\"><td height=\"7\" bgcolor=\"#5865E5\">";
echo "<center>";
echo "<span class=\"nag1wb\">";
echo "Tereny magazynowe";
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

$tekst4 = "<a href = \"$PHP_SELF?action=wynajemtezd&nu=$id4\">wiêcej ...</a>";

echo "<tr>";
if ($zdj4 != 0) {
	echo "<td width=\"126\" height=\"63\" rowspan = \"5\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=wynajemtezd&nu=$id4\">";
	echo "<img src=\"../img/zd$zdj4.jpg\" width=\"90\" height=\"60\" border=\"0\" alt=\"Zdjêcie nr$zdj4\" class=\"ira\"></img></a><br>";
	echo "</center>";
	echo "</td>";
}
else {
	echo "<td width=\"126\" height=\"63\" rowspan = \"5\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=wynajemtezd&nu=$id4\">";
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

echo "<td align = \"left\">$wpstatp4";
echo "<b>Pow. terenu:</b> $powdz4 ar.";
echo "$wpstatk4</td>";

$cena4 = number_format($cena4,'', '.', '.');

echo "<td align = \"left\" colspan = \"2\">$wpstatp4";
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

$sql5 = "select id_d, no_d, lok_d, powdzi_d, cd, cm2_d, zd1, wyl_d, sm_d from tab_te_w where loka = '1' and rof_d  = '5' and pokaz = 't' and usund = 'f' and id_b = '$identbiura' order by datawp_d desc;";

$result_set5 = pg_Exec($conn, $sql5);

$rows5 = pg_NumRows($result_set5);		// liczba zwroconych wierszy

if ((!$result_set5) || ($rows5 > 0)) { 

echo "<br>";
echo "<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" frame border=\"0\">";
echo "<tr><td><img src=\"img/black.gif\" width=\"100%\" height=\"1\" border=\"0\" alt=\"\"></img></td></tr>";
echo "<tr valign=\"left\"><td height=\"7\" bgcolor=\"#5865E5\">";
echo "<center>";
echo "<span class=\"nag1wb\">";
echo "Tereny inne";
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

$tekst5 = "<a href = \"$PHP_SELF?action=wynajemtezd&nu=$id5\">wiêcej ...</a>";

echo "<tr>";
if ($zdj5 != 0) {
	echo "<td width=\"126\" height=\"63\" rowspan = \"5\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=wynajemtezd&nu=$id5\">";
	echo "<img src=\"../img/zd$zdj5.jpg\" width=\"90\" height=\"60\" border=\"0\" alt=\"Zdjêcie nr$zdj5\" class=\"ira\"></img></a><br>";
	echo "</center>";
	echo "</td>";
}
else {
	echo "<td width=\"126\" height=\"63\" rowspan = \"5\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=wynajemtezd&nu=$id5\">";
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

echo "<td align = \"left\">$wpstatp5";
echo "<b>Pow. terenu:</b> $powdz5 ar.";
echo "$wpstatk5</td>";

$cena5 = number_format($cena5,'', '.', '.');

echo "<td align = \"left\" colspan = \"2\">$wpstatp5";
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

$sql001 = "select id_d from tab_te_w where loka = '2' and pokaz = 't' and usund = 'f' and id_b = '$identbiura' order by datawp_d desc;";

$result_set001 = pg_Exec($conn, $sql001);

$rows001 = pg_NumRows($result_set001);		// liczba zwroconych wierszy

if ((!$result_set001) || ($rows001 > 0)) { 

echo "<center>";
echo "<span class=\"nag2b\">";
echo "<b>WYNAJEM TERENÓW</b>";
echo "<br>";
echo "<b>(POZA OPOLEM)</b>";
echo "</span>";
echo "</center>";
}


$sql01 = "select id_d, no_d, lok_d,powdzi_d, cd, cm2_d, zd1, wyl_d, sm_d from tab_te_w where loka = '2' and rof_d  = '1' and pokaz = 't' and usund = 'f' and id_b = '$identbiura' order by datawp_d desc;";

$result_set01 = pg_Exec($conn, $sql01);

$rows01 = pg_NumRows($result_set01);		// liczba zwroconych wierszy

if ((!$result_set01) || ($rows01 > 0)) { 

echo "<br>";
echo "<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" frame border=\"0\">";
echo "<tr><td><img src=\"img/black.gif\" width=\"100%\" height=\"1\" border=\"0\" alt=\"\"></img></td></tr>";
echo "<tr valign=\"left\"><td height=\"7\" bgcolor=\"#5865E5\">";
echo "<center>";
echo "<span class=\"nag1wb\">";
echo "Tereny handlowe";
echo "</span>";
echo "</center>";
echo "</td></tr>";
echo "<tr><td><img src=\"img/black.gif\" width=\"100%\" height=\"1\" border=\"0\" alt=\"\"></img></td></tr>";
echo "</table>";


echo "<table width=\"516\" cellpadding=\"0\" cellspacing=\"0\" frame border=\"0\">";
	for ($i=0; $i < $rows01; $i++) {

		$id01 = pg_result($result_set01, $i, "id_d");
		$nod01 = pg_result($result_set01, $i, "no_d");
		$lok01 = pg_result($result_set01, $i, "lok_d");
		$powdz01 = pg_result($result_set01, $i, "powdzi_d");
		$cena01 = pg_result($result_set01, $i, "cd");
		$dod01 = pg_result($result_set01, $i, "cm2_d");
		$zdj01 = pg_result($result_set01, $i, "zd1");
		$wylacznosc01 = pg_result($result_set01, $i, "wyl_d");
		$status01 = pg_result($result_set01, $i, "sm_d");
		

if ($status01 == "2") {
$stat01 = "<span class=\"zawna\">OFERTA ZAWIESZONA</span>";
$wpstatp01 = "<span class=\"zawo\">";
$wpstatk01 = "</span>";
}
else {
$stat01 ="";
$wpstatp01 = "";
$wpstatk01 = "";
}

if ($wylacznosc01 == "2") {
$wyl01 = "<span class=\"wyl\">WY£¡CZNO¦Æ</span>";
}
else {
$wyl01 = "";
}

$tekst01 = "<a href = \"$PHP_SELF?action=wynajemtezd&nu=$id01\">wiêcej ...</a>";

echo "<tr>";
if ($zdj01 != 0) {
	echo "<td width=\"126\" height=\"63\" rowspan = \"5\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=wynajemtezd&nu=$id01\">";
	echo "<img src=\"../img/zd$zdj01.jpg\" width=\"90\" height=\"60\" border=\"0\" alt=\"Zdjêcie nr$zdj01\" class=\"ira\"></img></a><br>";
	echo "</center>";
	echo "</td>";
}
else {
	echo "<td width=\"126\" height=\"63\" rowspan = \"5\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=wynajemtezd&nu=$id01\">";
	echo "<img src=\"../img/zd0.jpg\" width=\"90\" height=\"60\" alt=\"Brak zdjêcia\" class=\"ira\"></img></a><br>";
	echo "</center>";
	echo "</td>";
}
echo "<td align = \"left\">";

echo "<tr>";

echo "<td width=\"130\" align = \"left\">$wpstatp01";
echo "<b>Numer Oferty:</b> $nod01";
echo "$wpstatk01</td>";

echo "<td width=\"260\" align = \"left\" colspan = \"2\">$wpstatp01";
echo "<b>Lokalizacja:</b> $lok01";
echo "$wpstatk01</td>";

echo "</tr>";

echo "<tr>";

echo "<td align = \"left\">$wpstatp01";
echo "<b>Pow. terenu:</b> $powdz01 ar.";
echo "$wpstatk01</td>";

$cena01 = number_format($cena01,'', '.', '.');

echo "<td align = \"left\" colspan = \"2\">$wpstatp01";
echo "<b>Cena:</b> $cena01 z³.";
echo "$wpstatk01</td>";

echo "</tr>";

echo "<tr>";

echo "<td colspan=\"3\" align = \"left\">$wpstatp01";
echo "<b>Dodatkowe op³aty:</b> $dod01";
echo "$wpstatk01</td>";

echo "</tr>";

echo "<tr>";

echo "<td width=\"130\" align = \"left\">";
echo "$stat01";
echo "</td>";

echo "<td width=\"130\" align = \"left\">";
echo "$wyl01";
echo "</td>";

echo "<td width=\"130\" align = \"left\">";
echo "$tekst01";
echo "</td>";

echo "</tr>";

echo "</td>";

echo "</tr>";

echo "<tr><td colspan=\"4\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}
echo "</table>";
}



$sql02 = "select id_d, no_d, lok_d, powdzi_d, cd, cm2_d, zd1, wyl_d, sm_d from tab_te_w where loka = '2' and rof_d  = '2' and pokaz = 't' and usund = 'f' and id_b = '$identbiura' order by datawp_d desc;";

$result_set02 = pg_Exec($conn, $sql02);

$rows02 = pg_NumRows($result_set02);		// liczba zwroconych wierszy

if ((!$result_set02) || ($rows02 > 0)) { 

echo "<br>";
echo "<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" frame border=\"0\">";
echo "<tr><td><img src=\"img/black.gif\" width=\"100%\" height=\"1\" border=\"0\" alt=\"\"></img></td></tr>";
echo "<tr valign=\"left\"><td height=\"7\" bgcolor=\"#5865E5\">";
echo "<center>";
echo "<span class=\"nag1wb\">";
echo "Tereny us³ugowe";
echo "</span>";
echo "</center>";
echo "</td></tr>";
echo "<tr><td><img src=\"img/black.gif\" width=\"100%\" height=\"1\" border=\"0\" alt=\"\"></img></td></tr>";
echo "</table>";


echo "<table width=\"516\" cellpadding=\"0\" cellspacing=\"0\" frame border=\"0\">";
	for ($i=0; $i < $rows02; $i++) {

		$id02 = pg_result($result_set02, $i, "id_d");
		$nod02 = pg_result($result_set02, $i, "no_d");
		$lok02 = pg_result($result_set02, $i, "lok_d");
		$powdz02 = pg_result($result_set02, $i, "powdzi_d");
		$cena02 = pg_result($result_set02, $i, "cd");
		$dod02 = pg_result($result_set02, $i, "cm2_d");
		$zdj02 = pg_result($result_set02, $i, "zd1");
		$wylacznosc02 = pg_result($result_set02, $i, "wyl_d");
		$status02 = pg_result($result_set02, $i, "sm_d");
		

if ($status02 == "2") {
$stat02 = "<span class=\"zawna\">OFERTA ZAWIESZONA</span>";
$wpstatp02 = "<span class=\"zawo\">";
$wpstatk02 = "</span>";
}
else {
$stat02 ="";
$wpstatp02 = "";
$wpstatk02 = "";
}

if ($wylacznosc02 == "2") {
$wyl02 = "<span class=\"wyl\">WY£¡CZNO¦Æ</span>";
}
else {
$wyl02 = "";
}


$tekst02 = "<a href = \"$PHP_SELF?action=wynajemtezd&nu=$id02\">wiêcej ...</a>";

echo "<tr>";
if ($zdj02 != 0) {
	echo "<td width=\"126\" height=\"63\" rowspan = \"5\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=wynajemtezd&nu=$id02\">";
	echo "<img src=\"../img/zd$zdj02.jpg\" width=\"90\" height=\"60\" border=\"0\" alt=\"Zdjêcie nr$zdj02\" class=\"ira\"></img></a><br>";
	echo "</center>";
	echo "</td>";
}
else {
	echo "<td width=\"126\" height=\"63\" rowspan = \"5\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=wynajemtezd&nu=$id02\">";
	echo "<img src=\"../img/zd0.jpg\" width=\"90\" height=\"60\" alt=\"Brak zdjêcia\" class=\"ira\"></img></a><br>";
	echo "</center>";
	echo "</td>";
}
echo "<td align = \"left\">";

echo "<tr>";

echo "<td width=\"130\" align = \"left\">$wpstatp02";
echo "<b>Numer Oferty:</b> $nod02";
echo "$wpstatk02</td>";

echo "<td width=\"260\" align = \"left\" colspan = \"2\">$wpstatp02";
echo "<b>Lokalizacja:</b> $lok02";
echo "$wpstatk02</td>";

echo "</tr>";

echo "<tr>";

echo "<td align = \"left\">$wpstatp02";
echo "<b>Pow. terenu:</b> $powdz02 ar.";
echo "$wpstatk02</td>";

$cena02 = number_format($cena02,'', '.', '.');

echo "<td align = \"left\" colspan = \"2\">$wpstatp02";
echo "<b>Cena:</b> $cena02 z³.";
echo "$wpstatk02</td>";

echo "</tr>";

echo "<tr>";

echo "<td colspan=\"3\" align = \"left\">$wpstatp02";
echo "<b>Dodatkowe op³aty:</b> $dod02";
echo "$wpstatk02</td>";

echo "</tr>";

echo "<tr>";

echo "<td width=\"130\" align = \"left\">";
echo "$stat02";
echo "</td>";

echo "<td width=\"130\" align = \"left\">";
echo "$wyl02";
echo "</td>";

echo "<td width=\"130\" align = \"left\">";
echo "$tekst02";
echo "</td>";

echo "</tr>";

echo "</td>";

echo "</tr>";

echo "<tr><td colspan=\"4\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}
echo "</table>";
}


$sql03 = "select id_d, no_d, lok_d, powdzi_d, cd, cm2_d, zd1, wyl_d, sm_d from tab_te_w where loka = '2' and rof_d  = '3' and pokaz = 't' and usund = 'f' and id_b = '$identbiura' order by datawp_d desc;";

$result_set03 = pg_Exec($conn, $sql03);

$rows03 = pg_NumRows($result_set03);		// liczba zwroconych wierszy

if ((!$result_set03) || ($rows03 > 0)) { 

echo "<br>";
echo "<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" frame border=\"0\">";
echo "<tr><td><img src=\"img/black.gif\" width=\"100%\" height=\"1\" border=\"0\" alt=\"\"></img></td></tr>";
echo "<tr valign=\"left\"><td height=\"7\" bgcolor=\"#5865E5\">";
echo "<center>";
echo "<span class=\"nag1wb\">";
echo "Tereny produkcyjne";
echo "</span>";
echo "</center>";
echo "</td></tr>";
echo "<tr><td><img src=\"img/black.gif\" width=\"100%\" height=\"1\" border=\"0\" alt=\"\"></img></td></tr>";
echo "</table>";


echo "<table width=\"516\" cellpadding=\"0\" cellspacing=\"0\" frame border=\"0\">";
	for ($i=0; $i < $rows03; $i++) {

		$id03 = pg_result($result_set03, $i, "id_d");
		$nod03 = pg_result($result_set03, $i, "no_d");
		$lok03 = pg_result($result_set03, $i, "lok_d");
		$powdz03 = pg_result($result_set03, $i, "powdzi_d");
		$lp03 = pg_result($result_set03, $i, "lp_d");
		$cena03 = pg_result($result_set03, $i, "cd");
		$dod03 = pg_result($result_set03, $i, "cm2_d");
		$zdj03 = pg_result($result_set03, $i, "zd1");
		$wylacznosc03 = pg_result($result_set03, $i, "wyl_d");
		$status03 = pg_result($result_set03, $i, "sm_d");
		

if ($status03 == "2") {
$stat03 = "<span class=\"zawna\">OFERTA ZAWIESZONA</span>";
$wpstatp03 = "<span class=\"zawo\">";
$wpstatk03 = "</span>";
}
else {
$stat03 ="";
$wpstatp03 = "";
$wpstatk03 = "";
}

if ($wylacznosc03 == "2") {
$wyl03 = "<span class=\"wyl\">WY£¡CZNO¦Æ</span>";
}
else {
$wyl03 = "";
}

$tekst03 = "<a href = \"$PHP_SELF?action=wynajemtezd&nu=$id03\">wiêcej ...</a>";

echo "<tr>";
if ($zdj03 != 0) {
	echo "<td width=\"126\" height=\"63\" rowspan = \"5\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=wynajemtezd&nu=$id03\">";
	echo "<img src=\"../img/zd$zdj03.jpg\" width=\"90\" height=\"60\" border=\"0\" alt=\"Zdjêcie nr$zdj03\" class=\"ira\"></img></a><br>";
	echo "</center>";
	echo "</td>";
}
else {
	echo "<td width=\"126\" height=\"63\" rowspan = \"5\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=wynajemtezd&nu=$id03\">";
	echo "<img src=\"../img/zd0.jpg\" width=\"90\" height=\"60\" alt=\"Brak zdjêcia\" class=\"ira\"></img></a><br>";
	echo "</center>";
	echo "</td>";
}
echo "<td align = \"left\">";

echo "<tr>";

echo "<td width=\"130\" align = \"left\">$wpstatp03";
echo "<b>Numer Oferty:</b> $nod03";
echo "$wpstatk03</td>";

echo "<td width=\"260\" align = \"left\" colspan = \"2\">$wpstatp03";
echo "<b>Lokalizacja:</b> $lok03";
echo "$wpstatk03</td>";

echo "</tr>";

echo "<tr>";

echo "<td align = \"left\">$wpstatp03";
echo "<b>Pow. terenu:</b> $powdz03 ar.";
echo "$wpstatk03</td>";

$cena03 = number_format($cena03,'', '.', '.');

echo "<td align = \"left\" colspan = \"2\">$wpstatp03";
echo "<b>Cena:</b> $cena03 z³.";
echo "$wpstatk03</td>";

echo "</tr>";

echo "<tr>";

echo "<td colspan=\"3\" align = \"left\">$wpstatp03";
echo "<b>Dodatkowe op³aty:</b> $dod03";
echo "$wpstatk03</td>";

echo "</tr>";

echo "<tr>";

echo "<td width=\"130\" align = \"left\">";
echo "$stat03";
echo "</td>";

echo "<td width=\"130\" align = \"left\">";
echo "$wyl03";
echo "</td>";

echo "<td width=\"130\" align = \"left\">";
echo "$tekst03";
echo "</td>";

echo "</tr>";

echo "</td>";

echo "</tr>";

echo "<tr><td colspan=\"4\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}
echo "</table>";
}

$sql04 = "select id_d, no_d, lok_d, powdzi_d, cd, cm2_d, zd1, wyl_d, sm_d from tab_te_w where loka = '2' and rof_d  = '4' and pokaz = 't' and usund = 'f' and id_b = '$identbiura' order by datawp_d desc;";

$result_set04 = pg_Exec($conn, $sql04);

$rows04 = pg_NumRows($result_set04);		// liczba zwroconych wierszy

if ((!$result_set04) || ($rows04 > 0)) { 

echo "<br>";
echo "<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" frame border=\"0\">";
echo "<tr><td><img src=\"img/black.gif\" width=\"100%\" height=\"1\" border=\"0\" alt=\"\"></img></td></tr>";
echo "<tr valign=\"left\"><td height=\"7\" bgcolor=\"#5865E5\">";
echo "<center>";
echo "<span class=\"nag1wb\">";
echo "Tereny magazynowe";
echo "</span>";
echo "</center>";
echo "</td></tr>";
echo "<tr><td><img src=\"img/black.gif\" width=\"100%\" height=\"1\" border=\"0\" alt=\"\"></img></td></tr>";
echo "</table>";


echo "<table width=\"516\" cellpadding=\"0\" cellspacing=\"0\" frame border=\"0\">";
	for ($i=0; $i < $rows04; $i++) {

		$id04 = pg_result($result_set04, $i, "id_d");
		$nod04 = pg_result($result_set04, $i, "no_d");
		$lok04 = pg_result($result_set04, $i, "lok_d");
		$powdz04 = pg_result($result_set04, $i, "powdzi_d");
		$cena04 = pg_result($result_set04, $i, "cd");
		$dod04 = pg_result($result_set04, $i, "cm2_d");
		$zdj04 = pg_result($result_set04, $i, "zd1");
		$wylacznosc04 = pg_result($result_set04, $i, "wyl_d");
		$status04 = pg_result($result_set04, $i, "sm_d");
		

if ($status04 == "2") {
$stat04 = "<span class=\"zawna\">OFERTA ZAWIESZONA</span>";
$wpstatp04 = "<span class=\"zawo\">";
$wpstatk04 = "</span>";
}
else {
$stat04 ="";
$wpstatp04 = "";
$wpstatk04 = "";
}

if ($wylacznosc04 == "2") {
$wyl04 = "<span class=\"wyl\">WY£¡CZNO¦Æ</span>";
}
else {
$wyl04 = "";
}

$tekst04 = "<a href = \"$PHP_SELF?action=wynajemtezd&nu=$id04\">wiêcej ...</a>";

echo "<tr>";
if ($zdj04 != 0) {
	echo "<td width=\"126\" height=\"63\" rowspan = \"5\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=wynajemtezd&nu=$id04\">";
	echo "<img src=\"../img/zd$zdj04.jpg\" width=\"90\" height=\"60\" border=\"0\" alt=\"Zdjêcie nr$zdj04\" class=\"ira\"></img></a><br>";
	echo "</center>";
	echo "</td>";
}
else {
	echo "<td width=\"126\" height=\"63\" rowspan = \"5\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=wynajemtezd&nu=$id04\">";
	echo "<img src=\"../img/zd0.jpg\" width=\"90\" height=\"60\" alt=\"Brak zdjêcia\" class=\"ira\"></img></a><br>";
	echo "</center>";
	echo "</td>";
}
echo "<td align = \"left\">";

echo "<tr>";

echo "<td width=\"130\" align = \"left\">$wpstatp04";
echo "<b>Numer Oferty:</b> $nod04";
echo "$wpstatk04</td>";

echo "<td width=\"260\" align = \"left\" colspan = \"2\">$wpstatp04";
echo "<b>Lokalizacja:</b> $lok04";
echo "$wpstatk04</td>";

echo "</tr>";

echo "<tr>";

echo "<td align = \"left\">$wpstatp04";
echo "<b>Pow. terenu:</b> $powdz04 ar.";
echo "$wpstatk04</td>";

$cena04 = number_format($cena04,'', '.', '.');

echo "<td align = \"left\" colspan = \"2\">$wpstatp04";
echo "<b>Cena:</b> $cena04 z³.";
echo "$wpstatk04</td>";

echo "</tr>";

echo "<tr>";

echo "<td colspan=\"3\" align = \"left\">$wpstatp04";
echo "<b>Dodatkowe op³aty:</b> $dod04";
echo "$wpstatk04</td>";

echo "</tr>";

echo "<tr>";

echo "<td width=\"130\" align = \"left\">";
echo "$stat04";
echo "</td>";

echo "<td width=\"130\" align = \"left\">";
echo "$wyl04";
echo "</td>";

echo "<td width=\"130\" align = \"left\">";
echo "$tekst04";
echo "</td>";

echo "</tr>";

echo "</td>";

echo "</tr>";

echo "<tr><td colspan=\"4\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}
echo "</table>";
}

$sql05 = "select id_d, no_d, lok_d, powdzi_d, cd, cm2_d, zd1, wyl_d, sm_d from tab_te_w where loka = '2' and rof_d  = '5' and pokaz = 't' and usund = 'f' and id_b = '$identbiura' order by datawp_d desc;";

$result_set05 = pg_Exec($conn, $sql05);

$rows05 = pg_NumRows($result_set05);		// liczba zwroconych wierszy

if ((!$result_set05) || ($rows05 > 0)) { 

echo "<br>";
echo "<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" frame border=\"0\">";
echo "<tr><td><img src=\"img/black.gif\" width=\"100%\" height=\"1\" border=\"0\" alt=\"\"></img></td></tr>";
echo "<tr valign=\"left\"><td height=\"7\" bgcolor=\"#5865E5\">";
echo "<center>";
echo "<span class=\"nag1wb\">";
echo "Tereny inne";
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

if ($zdj05 != 0) {
$wiec05 = "<a href = \"$PHP_SELF?action=wynajemtezd&nu=$id05\"><img src=\"img/fotob.gif\" width=\"28\" height=\"18\" border=\"0\"></img></a>";
}
else {
$wiec05 = "";
}

if ($zdj05 =='0' ) {
$tekst05 = "<a href = \"$PHP_SELF?action=wynajemtezd&nu=$id05\">wiêcej ...</a>";
}
else {
$tekst05 = "";
}

echo "<tr>";
if ($zdj05 != 0) {
	echo "<td width=\"126\" height=\"63\" rowspan = \"5\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=wynajemtezd&nu=$id05\">";
	echo "<img src=\"../img/zd$zdj05.jpg\" width=\"90\" height=\"60\" border=\"0\" alt=\"Zdjêcie nr$zdj05\" class=\"ira\"></img></a><br>";
	echo "</center>";
	echo "</td>";
}
else {
	echo "<td width=\"126\" height=\"63\" rowspan = \"5\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=wynajemtezd&nu=$id05\">";
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

echo "<td align = \"left\">$wpstatp05";
echo "<b>Pow. terenu:</b> $powdz05 ar.";
echo "$wpstatk05</td>";

$cena05 = number_format($cena05,'', '.', '.');

echo "<td align = \"left\" colspan = \"2\">$wpstatp05";
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

}


if ($action == 'wynajemtezd') {

echo "<center>";
echo "<span class=\"nag2b\">";
echo "<b>WYNAJEM TERENÓW</b>";
echo "<br>";
echo "</span>";
echo "</center>";

echo "<table width=\"512\" cellpadding=\"0\" cellspacing=\"0\" border = \"0\">";
echo "<tr>";
echo "<td width=\"50%\"  align = \"left\">";

?>
<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,0,0" width="40" height="20" id="backwte" align="middle">
<param name="allowScriptAccess" value="sameDomain" />
<param name="movie" value="backwte.swf" />
<param name="quality" value="high" />
<param name="wmode" value="transparent" />
<param name="bgcolor" value="#ffffff" />
<embed src="backwte.swf" quality="high" wmode="transparent" bgcolor="#ffffff" width="40" height="20" name="backwte" align="middle" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />
</object>
<?

echo "</td>";
echo "<td width=\"50%\" align = \"right\">";
echo "<a href=\"drukwte.php?nu=$nu\" target = \"_blank\"><img src=\"img/printer.gif\" width=\"15\" height=\"17\" border=\"0\"></img>&nbsp;&nbsp;Wydrukuj ze zdjeciami</a><br>";
echo "<a href=\"drukwteb.php?nu=$nu\" target = \"_blank\"><img src=\"img/printer.gif\" width=\"15\" height=\"17\" border=\"0\"></img>&nbsp;&nbsp;Wydrukuj bez zdjêæ</a>";
echo "</td>";
echo "</tr>";
echo "</table>";

echo "<br>";

echo "<center>";
echo "<table width=\"512\" cellpadding=\"0\" cellspacing=\"0\" border = \"1\" frame = \"above,below,rhs\" rules = \"groups\">";

$sqlno = "SELECT no_d, no_d_bo FROM tab_te_w where id_d = '$nu';";
	$resultno = @pg_Exec($conn, $sqlno);
	$rowsno = pg_NumRows($resultno);		// liczba zwroconych wierszy
	$noms = pg_result($resultno, 0, "no_d");
	$nomsp = pg_result($resultno, 0, "no_d_bo");

$sqlstatus = "SELECT sm_d, sm_d_bo FROM tab_te_w where id_d = '$nu';";
			
			$resultstatus = @pg_Exec($conn, $sqlstatus);
			$status = pg_result($resultstatus, 0, "sm_d");
			$statusbo = pg_result($resultstatus, 0, "sm_d_bo");
	
	$sqlstatuss = "SELECT nazwa_st FROM status where id = '$status';";
			
			$resultstatuss = @pg_Exec($conn, $sqlstatuss);
			$statuss = pg_result($resultstatuss, 0, "nazwa_st");

$sqlagent = "SELECT id_a FROM tab_te_w where id_d = '$nu';";
			
			$resultagent = @pg_Exec($conn, $sqlagent);
			$agent = pg_result($resultagent, 0, "id_a");

	$sqlagents = "SELECT nazwa_a, tel_a, tel_kom_a, email_a FROM tab_agent where id_a = '$agent';";
			
			$resultagents = @pg_Exec($conn, $sqlagents);
			$nazwaagenta = pg_result($resultagents, 0, "nazwa_a");
			$nazwatel = pg_result($resultagents, 0, "tel_a");
			$nazwatelkom = pg_result($resultagents, 0, "tel_kom_a");
			$nazwaemail = pg_result($resultagents, 0, "email_a");

$sqllok = "SELECT lok_d, lok_d_bo FROM tab_te_w where id_d = '$nu';";	
	$resultlok = @pg_Exec($conn, $sqllok);
	$lokas = pg_result($resultlok, 0, "lok_d");
	$lokasp = pg_result($resultlok, 0, "lok_d_bo");

$sqlwoj = "SELECT lok_w, lok_w_bo FROM tab_te_w where id_d = '$nu';";
			
			$resultwoj = @pg_Exec($conn, $sqlwoj);
			$wojn = pg_result($resultwoj, 0, "lok_w");
			$wojnbo = pg_result($resultwoj, 0, "lok_w_bo");
	
	$sqlwojs = "SELECT nazwa_w FROM wojewodztwa where id_w = '$wojn';";
			
			$resultwojs = @pg_Exec($conn, $sqlwojs);
			$wojns = pg_result($resultwojs, 0, "nazwa_w");

$sqlpowiat = "SELECT lok_p, lok_p_bo FROM tab_te_w where id_d = '$nu';";
			
			$resultpowiat = @pg_Exec($conn, $sqlpowiat);
			$powiatn = pg_result($resultpowiat, 0, "lok_p");
			$powiatbo = pg_result($resultpowiat, 0, "lok_p_bo");
	
	$sqlpowiats = "SELECT nazwa_p FROM powiaty where id_pow = '$powiatn';";
			
			$resultpowiats = @pg_Exec($conn, $sqlpowiats);
			$powiatns = pg_result($resultpowiats, 0, "nazwa_p");

$sqlcena = "SELECT cd, cd_bo FROM tab_te_w where id_d = '$nu';";	
	$resultcena = @pg_Exec($conn, $sqlcena);
	$cenas = pg_result($resultcena, 0, "cd");
	$cenasp = pg_result($resultcena, 0, "cd_bo");
	

$sqlpowdzi = "SELECT powdzi_d, powdzi_d_bo FROM tab_te_w where id_d = '$nu';";	
	$resultpowdzi = @pg_Exec($conn, $sqlpowdzi);
	$powdzis = pg_result($resultpowdzi, 0, "powdzi_d");
	$powdzisp = pg_result($resultpowdzi, 0, "powdzi_d_bo");

$sqlrynek = "SELECT rr_d, rr_d_bo FROM tab_te_w where id_d = '$nu';";
			
			$resultrynek = @pg_Exec($conn, $sqlrynek);
			$rrynek = pg_result($resultrynek, 0, "rr_d");
			$rrynekbo = pg_result($resultrynek, 0, "rr_d_bo");
	
$sqlryneks = "SELECT nazwa_r FROM rodzaj_ryn where id = '$rrynek';";
			
			$resultryneks = @pg_Exec($conn, $sqlryneks);
			$rryneks = pg_result($resultryneks, 0, "nazwa_r");


$sqlcm2 = "SELECT cm2_d, cm2_d_bo FROM tab_te_w where id_d = '$nu';";	
	$resultcm2 = @pg_Exec($conn, $sqlcm2);
	$cenad2 = pg_result($resultcm2, 0, "cm2_d");
	$cenad2bo = pg_result($resultcm2, 0, "cm2_d_bo");
	
$sqlczynsz = "SELECT wysop_d, wysop_d_bo FROM tab_te_w where id_d = '$nu';";
	$resultczynsz = @pg_Exec($conn, $sqlczynsz);
	$czynszs = pg_result($resultczynsz, 0, "wysop_d");
	$czynszsp = pg_result($resultczynsz, 0, "wysop_d_bo");

$sqlczasp = "SELECT cz_prze_d, cz_prze_d_bo FROM tab_te_w where id_d = '$nu';";
			
			$resultczasp = @pg_Exec($conn, $sqlczasp);
			$czasp = pg_result($resultczasp, 0, "cz_prze_d");
			$czaspbo = pg_result($resultczasp, 0, "cz_prze_d_bo");
	
	$sqlczasps = "SELECT nazwa_prz FROM czas_prz where id = '$czasp';";
			
			$resultczasps = @pg_Exec($conn, $sqlczasps);
			$czasps = pg_result($resultczasps, 0, "nazwa_prz");

$sqlksiega = "SELECT kw_d, kw_d_bo FROM tab_te_w where id_d = '$nu';";
			
			$resultksiega = @pg_Exec($conn, $sqlksiega);
			$ksiega = pg_result($resultksiega, 0, "kw_d");
			$ksiegabo = pg_result($resultksiega, 0, "kw_d_bo");
	
	$sqlksiegas = "SELECT nazwa_k FROM ksiega where id = '$ksiega';";
			
			$resultksiegas = @pg_Exec($conn, $sqlksiegas);
			$ksiegass = pg_result($resultksiegas, 0, "nazwa_k");


$sqlprawnydz = "SELECT spr_dz, spr_dz_bo FROM tab_te_w where id_d = '$nu';";
			
			$resultprawnydz = @pg_Exec($conn, $sqlprawnydz);
			$prawnydz = pg_result($resultprawnydz, 0, "spr_dz");
			$prawnydzbo = pg_result($resultprawnydz, 0, "spr_dz_bo");
	
	$sqlprawnydzs = "SELECT nazwa_pr FROM stan_pr where id = '$prawnydz';";
			
			$resultprawnydzs = @pg_Exec($conn, $sqlprawnydzs);
			$prawnydzss = pg_result($resultprawnydzs, 0, "nazwa_pr");


$sqldw = "SELECT datawp_d, datawp_d_bo FROM tab_te_w where id_d = '$nu';";
	$resultdw = @pg_Exec($conn, $sqldw);
	$datw = pg_result($resultdw, 0, "datawp_d");
	$datwp = pg_result($resultdw, 0, "datawp_d_bo");

$sqlprof = "SELECT rof_d, rof_d_bo FROM tab_te_w where id_d = '$nu';";
			
			$resultprof = @pg_Exec($conn, $sqlprof);
			$profn = pg_result($resultprof, 0, "rof_d");
			$profnbo = pg_result($resultprof, 0, "rof_d_bo");
	
	$sqlprofs = "SELECT rodzaj_of FROM rodzaj_of_te where id = '$profn';";
			
			$resultprofs = @pg_Exec($conn, $sqlprofs);
			$profns = pg_result($resultprofs, 0, "rodzaj_of");

if (($lokasp == 't')  || ($wojnbo == 't') || ($powiatbo == 't')  || ($cenasp == 't') || ($powdzisp == 't') || ($cenad2bo == 't') || ($czynszsp == 't')  || ($czaspbo == 't') || ($ksiegabo == 't')  || ($prawnydzbo == 't') || ($rrynekbo == 't')  || ($datwp == 't') || ($profnbo == 't')) {

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

if (($rrynekbo == 't') || ($cenad2bo == 't') || ($powdzisp == 't') || ($czynszsp == 't')) {
echo "<tr>";
}

if ($powdzisp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pow. terenu:</b><br>&nbsp;$powdzis ar";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
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
echo "&nbsp;<b>Op³aty:</b><br>&nbsp;$czynszs z³.";
echo "</td>";

}


if (($powdzisp == 't') || ($rrynekbo == 't') || ($cenad2bo == 't') || ($czynszsp == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}


if (($czaspbo == 't') || ($ksiegabo == 't') || ($prawnydzbo == 't') || ($datwp == 't')) {
echo "<tr>";
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

if ($prawnydzbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Stan prawny terenu:</b><br>&nbsp;$prawnydzss";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($datwp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Data oferty:</b><br>&nbsp;$datw";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}


if (($czaspbo == 't') || ($ksiegabo == 't') || ($prawnydzbo == 't') || ($datwp == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}

if ($profnbo == 't') {
echo "<tr>";
}


if ($profnbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Rodzaj oferty:</b><br>&nbsp;$profns";
echo "</td>";

}

if ($profnbo == 't') {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}

$sqlfil1 = "SELECT film1 FROM tab_te_w where id_d = '$nu';";
			
	$resultfil1 = @pg_Exec($conn, $sqlfil1);
	$fil1ms = pg_result($resultfil1, 0, "film1");

$sqlfil2 = "SELECT film2 FROM tab_te_w where id_d = '$nu';";
			
	$resultfil2 = @pg_Exec($conn, $sqlfil2);
	$fil2ms = pg_result($resultfil2, 0, "film2");

$sqlfil3 = "SELECT film3 FROM tab_te_w where id_d = '$nu';";
			
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



$sqlzd1 = "SELECT zd1 FROM tab_te_w where id_d = '$nu';";
			
	$resultzd1s = @pg_Exec($conn, $sqlzd1);
	$zd1ms = pg_result($resultzd1s, 0, "zd1");

$sqlzd2 = "SELECT zd2 FROM tab_te_w where id_d = '$nu';";
			
	$resultzd2s = @pg_Exec($conn, $sqlzd2);
	$zd2ms = pg_result($resultzd2s, 0, "zd2");

$sqlzd3 = "SELECT zd3 FROM tab_te_w where id_d = '$nu';";
			
	$resultzd3s = @pg_Exec($conn, $sqlzd3);
	$zd3ms = pg_result($resultzd3s, 0, "zd3");

$sqlzd4 = "SELECT zd4 FROM tab_te_w where id_d = '$nu';";
			
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

$sqlkszdz = "SELECT ksdzi_d, ksdzi_d_bo FROM tab_te_w where id_d = '$nu';";
			
			$resultkszdz = @pg_Exec($conn, $sqlkszdz);
			$kszdzs = pg_result($resultkszdz, 0, "ksdzi_d");
			$kszdzbo = pg_result($resultkszdz, 0, "ksdzi_d_bo");
				
	$sqlkszdzs = "SELECT nazwa_dz FROM dzialka where id = '$kszdzs';";
			
			$resultkszdzs = @pg_Exec($conn, $sqlkszdzs);
			$kszdzps = pg_result($resultkszdzs, 0, "nazwa_dz");


$sqlszdz = "SELECT szdzi_d, szdzi_d_bo FROM tab_te_w where id_d = '$nu';";	
	$resultszdz = @pg_Exec($conn, $sqlszdz);
	$szdzis = pg_result($resultszdz, 0, "szdzi_d");
	$szdzisp = pg_result($resultszdz, 0, "szdzi_d_bo");

$sqldldz = "SELECT dldz_d, dldz_d_bo FROM tab_te_w where id_d = '$nu';";	
	$resultdldz = @pg_Exec($conn, $sqldldz);
	$dldzs = pg_result($resultdldz, 0, "dldz_d");
	$dldzsp = pg_result($resultdldz, 0, "dldz_d_bo");

$sqlnardz = "SELECT dzinar_d, dzinar_d_bo FROM tab_te_w where id_d = '$nu';";
			
			$resultnardz = @pg_Exec($conn, $sqlnardz);
			$nardzs = pg_result($resultnardz, 0, "dzinar_d");
			$nardzbo = pg_result($resultnardz, 0, "dzinar_d_bo");
				
	$sqlnardzs = "SELECT nazwa_nar FROM dzialka_nar where id = '$nardzs';";
			
			$resultnardzs = @pg_Exec($conn, $sqlnardzs);
			$nardzps = pg_result($resultnardzs, 0, "nazwa_nar");

$sqlogrdz = "SELECT dziogr_d, dziogr_d_bo FROM tab_te_w where id_d = '$nu';";
			
			$resultogrdz = @pg_Exec($conn, $sqlogrdz);
			$ogrdzs = pg_result($resultogrdz, 0, "dziogr_d");
			$ogrdzbo = pg_result($resultogrdz, 0, "dziogr_d_bo");
				
	$sqlogrdzs = "SELECT nazwa_og FROM dzialka_og where id = '$ogrdzs';";
			
			$resultogrdzs = @pg_Exec($conn, $sqlogrdzs);
			$ogrdzps = pg_result($resultogrdzs, 0, "nazwa_og");


	$sqluksz = "SELECT uksz_d, uksz_d_bo FROM tab_te_w where id_d = '$nu';";
			
			$resultuksz = @pg_Exec($conn, $sqluksz);
			$ukszs = pg_result($resultuksz, 0, "uksz_d");
			$ukszbo = pg_result($resultuksz, 0, "uksz_d_bo");
				
	$sqlukszs = "SELECT nazwa_uk FROM dzialka_uk where id = '$ukszs';";
			
			$resultukszs = @pg_Exec($conn, $sqlukszs);
			$ukszps = pg_result($resultukszs, 0, "nazwa_uk");

$sqlzad = "SELECT zaddzi_d, zaddzi_d_bo FROM tab_te_w where id_d = '$nu';";
			
			$resultzad = @pg_Exec($conn, $sqlzad);
			$zads = pg_result($resultzad, 0, "zaddzi_d");
			$zadbo = pg_result($resultzad, 0, "zaddzi_d_bo");
				
	$sqlzads = "SELECT nazwa_za FROM dzialka_za where id = '$zads';";
			
			$resultzads = @pg_Exec($conn, $sqlzads);
			$zadps = pg_result($resultzads, 0, "nazwa_za");

$sqlmozpod = "SELECT mozpod, mozpod_bo FROM tab_te_w where id_d = '$nu';";
			
			$resultmozpod = @pg_Exec($conn, $sqlmozpod);
			$mozpods = pg_result($resultmozpod, 0, "mozpod");
			$mozpodbo = pg_result($resultmozpod, 0, "mozpod_bo");
				
	$sqlmozpods = "SELECT nazwa_mo FROM mozpod where id = '$mozpods';";
			
			$resultmozpods = @pg_Exec($conn, $sqlmozpods);
			$mozpodps = pg_result($resultmozpods, 0, "nazwa_mo");


if (($kszdzbo == 't') || ($szdzisp == 't') || ($dldzsp == 't')  || ($nardzbo == 't') || ($ogrdzbo == 't')  || ($ukszbo == 't') || ($zadbo == 't') || ($mozpodbo == 't')) {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
echo "<tr><td colspan=\"40\" height=\"7\" bgcolor=\"#5865E5\">";
echo "<span class=\"nag1wb\">";
echo "&nbsp;Teren";
echo "</span>";
echo "</td></tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}

if (($kszdzbo == 't') || ($szdzisp == 't') || ($dldzsp == 't') || ($nardzbo == 't')) {
echo "<tr>"; 
}

if ($kszdzbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Kszta³t terenu:</b><br>&nbsp;$kszdzps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($szdzisp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Szereko¶æ terenu:</b><br>&nbsp;$szdzis m";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($dldzsp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>D³ugo¶æ terenu:</b><br>&nbsp;$dldzs m";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($nardzbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Teren naro¿ny:</b><br>&nbsp;$nardzps";
echo "</td>";

}

if (($kszdzbo == 't') || ($szdzisp == 't') || ($dldzsp == 't') || ($nardzbo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}
if (($ogrdzbo == 't')  || ($ukszbo == 't') || ($zadbo == 't') || ($mozpodbo == 't')) {
echo "<tr>";
}
if ($ogrdzbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Teren ogrodzony:</b><br>&nbsp;$ogrdzps";
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

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Zadrzewienie terenu:</b><br>&nbsp;$zadps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($mozpodbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Mo¿liwo¶æ podzia³u:</b><br>&nbsp;$mozpodps";
echo "</td>";

}

if (($ogrdzbo == 't')  || ($ukszbo == 't') || ($zadbo == 't') || ($mozpodbo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}



$sqlzd5 = "SELECT zd5 FROM tab_te_w where id_d = '$nu';";
			
	$resultzd5s = @pg_Exec($conn, $sqlzd5);
	$zd5ms = pg_result($resultzd5s, 0, "zd5");

$sqlzd6 = "SELECT zd6 FROM tab_te_w where id_d = '$nu';";
			
	$resultzd6s = @pg_Exec($conn, $sqlzd6);
	$zd6ms = pg_result($resultzd6s, 0, "zd6");

$sqlzd7 = "SELECT zd7 FROM tab_te_w where id_d = '$nu';";
			
	$resultzd7s = @pg_Exec($conn, $sqlzd7);
	$zd7ms = pg_result($resultzd7s, 0, "zd7");

$sqlzd8 = "SELECT zd8 FROM tab_te_w where id_d = '$nu';";
			
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

$sqluslu = "SELECT usl_d, usl_d_bo FROM tab_te_w where id_d = '$nu';";
			
			$resultuslu = @pg_Exec($conn, $sqluslu);
			$uslus = pg_result($resultuslu, 0, "usl_d");
			$uslubo = pg_result($resultuslu, 0, "usl_d_bo");
				
	$sqluslus = "SELECT nazwa_us FROM uslugi where id = '$uslus';";
			
			$resultuslus = @pg_Exec($conn, $sqluslus);
			$uslups = pg_result($resultuslus, 0, "nazwa_us");

$sqlprze = "SELECT przem_d, przem_d_bo FROM tab_te_w where id_d = '$nu';";
			
			$resultprze = @pg_Exec($conn, $sqlprze);
			$przes = pg_result($resultprze, 0, "przem_d");
			$przebo = pg_result($resultprze, 0, "przem_d_bo");
				
	$sqlprzes = "SELECT nazwa_prze FROM przemysl where id = '$przes';";
			
			$resultprzes = @pg_Exec($conn, $sqlprzes);
			$przeps = pg_result($resultprzes, 0, "nazwa_prze");

$sqlbdj = "SELECT bdj_d, bdj_d_bo FROM tab_te_w where id_d = '$nu';";
			
			$resultbdj = @pg_Exec($conn, $sqlbdj);
			$bdjs = pg_result($resultbdj, 0, "bdj_d");
			$bdjbo = pg_result($resultbdj, 0, "bdj_d_bo");
				
	$sqlbdjs = "SELECT nazwa_bu FROM budjedind where id = '$bdjs';";
			
			$resultbdjs = @pg_Exec($conn, $sqlbdjs);
			$bdjps = pg_result($resultbdjs, 0, "nazwa_bu");

$sqlbdjsze = "SELECT bdjs_d, bdjs_d_bo FROM tab_te_w where id_d = '$nu';";
			
			$resultbdjsze = @pg_Exec($conn, $sqlbdjsze);
			$bdjszes = pg_result($resultbdjsze, 0, "bdjs_d");
			$bdjszebo = pg_result($resultbdjsze, 0, "bdjs_d_bo");
				
	$sqlbdjszes = "SELECT nazwa_bu FROM budjedsze where id = '$bdjszes';";
			
			$resultbdjszes = @pg_Exec($conn, $sqlbdjszes);
			$bdjszeps = pg_result($resultbdjszes, 0, "nazwa_bu");

$sqlbwd = "SELECT bw_d, bw_d_bo FROM tab_te_w where id_d = '$nu';";
			
			$resultbwd = @pg_Exec($conn, $sqlbwd);
			$bwds = pg_result($resultbwd, 0, "bw_d");
			$bwdbo = pg_result($resultbwd, 0, "bw_d_bo");
				
	$sqlbwds = "SELECT nazwa_bu FROM budwiel where id = '$bwds';";
			
			$resultbwds = @pg_Exec($conn, $sqlbwds);
			$bwdps = pg_result($resultbwds, 0, "nazwa_bu");

$sqlmkd = "SELECT lmk_d, lmk_d_bo FROM tab_te_w where id_d = '$nu';";	
	$resultmkd = @pg_Exec($conn, $sqlmkd);
	$mkds = pg_result($resultmkd, 0, "lmk_d");
	$mkdsp = pg_result($resultmkd, 0, "lmk_d_bo");


$sqlpmza = "SELECT pmza_d, pmza_d_bo FROM tab_te_w where id_d = '$nu';";	
	$resultpmza = @pg_Exec($conn, $sqlpmza);
	$pmzas = pg_result($resultpmza, 0, "pmza_d");
	$pmzasp = pg_result($resultpmza, 0, "pmza_d_bo");

$sqlpena = "SELECT pnab_d, pnab_d_bo FROM tab_te_w where id_d = '$nu';";
			
			$resultpena = @pg_Exec($conn, $sqlpena);
			$penas = pg_result($resultpena, 0, "pnab_d");
			$penabo = pg_result($resultpena, 0, "pnab_d_bo");
				
	$sqlpenas = "SELECT nazwa_po FROM pozbud where id = '$penas';";
			
			$resultpenas = @pg_Exec($conn, $sqlpenas);
			$penaps = pg_result($resultpenas, 0, "nazwa_po");

$sqlodrol = "SELECT odrol_d, odrol_d_bo FROM tab_te_w where id_d = '$nu';";
			
			$resultodrol = @pg_Exec($conn, $sqlodrol);
			$odrols = pg_result($resultodrol, 0, "odrol_d");
			$odrolbo = pg_result($resultodrol, 0, "odrol_d_bo");
				
	$sqlodrols = "SELECT nazwa_od FROM odrolniona where id = '$odrols';";
			
			$resultodrols = @pg_Exec($conn, $sqlodrols);
			$odrolps = pg_result($resultodrols, 0, "nazwa_od");

$sqlwarza = "SELECT warza_d, warza_d_bo FROM tab_te_w where id_d = '$nu';";
			
			$resultwarza = @pg_Exec($conn, $sqlwarza);
			$warzap = pg_result($resultwarza, 0, "warza_d");
			$warzabo = pg_result($resultwarza, 0, "warza_d_bo");

$sqlprzgr = "SELECT przgr_d, przgr_d_bo FROM tab_te_w where id_d = '$nu';";
			
			$resultprzgr = @pg_Exec($conn, $sqlprzgr);
			$przgrp = pg_result($resultprzgr, 0, "przgr_d");
			$przgrbo = pg_result($resultprzgr, 0, "przgr_d_bo");

$sqlpowmza = "SELECT powmza_d, powmza_d_bo FROM tab_te_w where id_d = '$nu';";
			
			$resultpowmza = @pg_Exec($conn, $sqlpowmza);
			$powmzas = pg_result($resultpowmza, 0, "powmza_d");
			$powmzabo = pg_result($resultpowmza, 0, "powmza_d_bo");

if (($uslubo == 't') || ($przebo == 't') || ($bdjbo == 't')  || ($bdjszebo == 't') || ($bwdbo == 't')  || ($mkdsp == 't') || ($pmzasp == 't') || ($penabo == 't') || ($odrolbo == 't') || ($warzabo == 't') || ($przgrbo == 't') || ($powmzabo == 't')) {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
echo "<tr><td colspan=\"40\" height=\"7\" bgcolor=\"#5865E5\">";
echo "<span class=\"nag1wb\">";
echo "&nbsp;Mo¿liwo¶æ zabudowy";
echo "</span>";
echo "</td></tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}

if (($uslubo == 't') || ($przebo == 't') || ($bdjbo == 't')  || ($bdjszebo == 't')) {
echo "<tr>"; 
}

if ($uslubo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Us³ugi:</b><br>&nbsp;$uslups";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($przebo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Przemys³:</b><br>&nbsp;$przeps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($bdjbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Budow. jedn. indyw.:</b><br>&nbsp;$bdjps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($bdjszebo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Budow. jedn. szereg.:</b><br>&nbsp;$bdjszeps";
echo "</td>";

}

if (($uslubo == 't') || ($przebo == 't') || ($bdjbo == 't')  || ($bdjszebo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}

if (($bwdbo == 't') || ($mkdsp == 't') || ($pmzasp == 't')  || ($penabo == 't')) {
echo "<tr>"; 
}

if ($bwdbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Budow. wielorodz.:</b><br>&nbsp;$bwdps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($mkdsp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Mo¿liwe kondyg.:</b><br>&nbsp;$mkds";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($pmzasp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Mo¿liwa zabudowa:</b><br>&nbsp;$pmzas  %";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($penabo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pozwolenie na bud.:</b><br>&nbsp;$penaps";
echo "</td>";

}

if (($odrolbo == 't') || ($powmzabo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}

if (($odrolbo == 't') || ($powmzabo == 't')) {
echo "<tr>"; 
}

if ($odrolbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Odrolniony:</b><br>&nbsp;$odrolps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($powmzabo == 't') {

echo "<td height=\"25\" colspan = \"20\">";
echo "&nbsp;<b>Pow. mo¿li. zabudowy:</b><br>&nbsp;$powmzas ar";
echo "</td>";

}

if (($odrolbo == 't') || ($powmzabo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}


if ($warzabo == 't') {
echo "<tr>";
echo "<td height=\"25\" colspan = \"20\">";
echo "&nbsp;<b>Warunki zabudowy:</b><br>&nbsp;$warzap";
echo "</td>";
echo "</tr>";
}

if ($warzabo == 't') {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}

if ($przgrbo == 't') {
echo "<tr>";
echo "<td height=\"25\" colspan = \"20\">";
echo "&nbsp;<b>Przeznaczenie terenu:</b><br>&nbsp;$przgrp";
echo "</td>";
echo "</tr>";
}

if ($przgrbo == 't') {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}


$sqlzd9 = "SELECT zd9 FROM tab_te_w where id_d = '$nu';";
			
	$resultzd9s = @pg_Exec($conn, $sqlzd9);
	$zd9ms = pg_result($resultzd9s, 0, "zd9");

$sqlzd10 = "SELECT zd10 FROM tab_te_w where id_d = '$nu';";
			
	$resultzd10s = @pg_Exec($conn, $sqlzd10);
	$zd10ms = pg_result($resultzd10s, 0, "zd10");

$sqlzd11 = "SELECT zd11 FROM tab_te_w where id_d = '$nu';";
			
	$resultzd11s = @pg_Exec($conn, $sqlzd11);
	$zd11ms = pg_result($resultzd11s, 0, "zd11");

$sqlzd12 = "SELECT zd12 FROM tab_te_w where id_d = '$nu';";
			
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






	$sqlogrze = "SELECT ogrz_d, ogrz_d_bo FROM tab_te_w where id_d = '$nu';";
			
			$resultogrze = @pg_Exec($conn, $sqlogrze);
			$ogrzes = pg_result($resultogrze, 0, "ogrz_d");
			$ogrzebo = pg_result($resultogrze, 0, "ogrz_d_bo");
				
	$sqlogrzes = "SELECT nazwa_grz FROM ogrzewanie where id = '$ogrzes';";
			
			$resultogrzes = @pg_Exec($conn, $sqlogrzes);
			$ogrzeps = pg_result($resultogrzes, 0, "nazwa_grz");
	
$sqlciepwo = "SELECT ciewod_d, ciewod_d_bo FROM tab_te_w where id_d = '$nu';";
			
			$resultciepwo = @pg_Exec($conn, $sqlciepwo);
			$ciepwos = pg_result($resultciepwo, 0, "ciewod_d");
			$ciepwobo = pg_result($resultciepwo, 0, "ciewod_d_bo");
				
	$sqlciepwos = "SELECT nazwa_wo FROM ciepla_woda where id = '$ciepwos';";
			
			$resultciepwos = @pg_Exec($conn, $sqlciepwos);
			$ciepwops = pg_result($resultciepwos, 0, "nazwa_wo");

$sqlpra = "SELECT pra_d, pra_d_bo FROM tab_te_w where id_d = '$nu';";
			
			$resultpra = @pg_Exec($conn, $sqlpra);
			$pras = pg_result($resultpra, 0, "pra_d");
			$prabo = pg_result($resultpra, 0, "pra_d_bo");
				
	$sqlpras = "SELECT nazwa_pa FROM prad where id = '$pras';";
			
			$resultpras = @pg_Exec($conn, $sqlpras);
			$praps = pg_result($resultpras, 0, "nazwa_pa");

$sqlsila = "SELECT sila_d, sila_d_bo FROM tab_te_w where id_d = '$nu';";
			
			$resultsila = @pg_Exec($conn, $sqlsila);
			$silas = pg_result($resultsila, 0, "sila_d");
			$silabo = pg_result($resultsila, 0, "sila_d_bo");
				
	$sqlsilas = "SELECT nazwa_si FROM sila where id = '$silas';";
			
			$resultsilas = @pg_Exec($conn, $sqlsilas);
			$silaps = pg_result($resultsilas, 0, "nazwa_si");

$sqlmoc = "SELECT moc_d, moc_d_bo FROM tab_te_w where id_d = '$nu';";	
	$resultmoc = @pg_Exec($conn, $sqlmoc);
	$mocs = pg_result($resultmoc, 0, "moc_d");
	$mocsp = pg_result($resultmoc, 0, "moc_d_bo");

$sqlwoda = "SELECT wod_d, wod_d_bo FROM tab_te_w where id_d = '$nu';";
			
			$resultwodat = @pg_Exec($conn, $sqlwoda);
			$wodas = pg_result($resultwodat, 0, "wod_d");
			$wodabo = pg_result($resultwodat, 0, "wod_d_bo");
				
	$sqlwodas = "SELECT nazwa_wo FROM woda where id = '$wodas';";
			
			$resultwodas = @pg_Exec($conn, $sqlwodas);
			$wodaps = pg_result($resultwodas, 0, "nazwa_wo");

$sqlgaz = "SELECT gaz_d, gaz_d_bo FROM tab_te_w where id_d = '$nu';";
			
			$resultgaz = @pg_Exec($conn, $sqlgaz);
			$gazs = pg_result($resultgaz, 0, "gaz_d");
			$gazbo = pg_result($resultgaz, 0, "gaz_d_bo");
				
	$sqlgazs = "SELECT nazwa_g FROM gaz where id = '$gazs';";
			
			$resultgazs = @pg_Exec($conn, $sqlgazs);
			$gazps = pg_result($resultgazs, 0, "nazwa_g");

$sqlkanal = "SELECT kanal_d, kanal_d_bo FROM tab_te_w where id_d = '$nu';";
			
			$resultkanal = @pg_Exec($conn, $sqlkanal);
			$kanals = pg_result($resultkanal, 0, "kanal_d");
			$kanalbo = pg_result($resultkanal, 0, "kanal_d_bo");
				
	$sqlkanals = "SELECT nazwa_ka FROM kanaliza where id = '$kanals';";
			
			$resultkanals = @pg_Exec($conn, $sqlkanals);
			$kanalps = pg_result($resultkanals, 0, "nazwa_ka");

$sqltel = "SELECT tel_d, tel_d_bo FROM tab_te_w where id_d = '$nu';";
			
			$resulttel = @pg_Exec($conn, $sqltel);
			$tels = pg_result($resulttel, 0, "tel_d");
			$telbo = pg_result($resulttel, 0, "tel_d_bo");
				
	$sqltels = "SELECT nazwa_te FROM telefon where id = '$tels';";
			
			$resulttels = @pg_Exec($conn, $sqltels);
			$telps = pg_result($resulttels, 0, "nazwa_te");

$sqlkabl = "SELECT siecka_d, siecka_d_bo FROM tab_te_w where id_d = '$nu';";
			
			$resultkabl = @pg_Exec($conn, $sqlkabl);
			$kabls = pg_result($resultkabl, 0, "siecka_d");
			$kablbo = pg_result($resultkabl, 0, "siecka_d_bo");
				
	$sqlkabls = "SELECT nazwa_kab FROM kablowa where id = '$kabls';";
			
			$resultkabls = @pg_Exec($conn, $sqlkabls);
			$kablps = pg_result($resultkabls, 0, "nazwa_kab");

$sqlantena = "SELECT antena_d, antena_d_bo FROM tab_te_w where id_d = '$nu';";
			
			$resultantena = @pg_Exec($conn, $sqlantena);
			$antenas = pg_result($resultantena, 0, "antena_d");
			$antenabo = pg_result($resultantena, 0, "antena_d_bo");
				
	$sqlantenas = "SELECT nazwa_an FROM antena where id = '$antenas';";
			
			$resultantenas = @pg_Exec($conn, $sqlantenas);
			$antenaps = pg_result($resultantenas, 0, "nazwa_an");

$sqlsiec = "SELECT siecint_d, siecint_d_bo FROM tab_te_w where id_d = '$nu';";
			
			$resultsiec = @pg_Exec($conn, $sqlsiec);
			$siecs = pg_result($resultsiec, 0, "siecint_d");
			$siecbo = pg_result($resultsiec, 0, "siecint_d_bo");
				
	$sqlsiecs = "SELECT nazwa_siec FROM siec_inter where id = '$siecs';";
			
			$resultsiecs = @pg_Exec($conn, $sqlsiecs);
			$siecps = pg_result($resultsiecs, 0, "nazwa_siec");



if (($ogrzebo == 't')  || ($ciepwobo == 't') || ($prabo == 't') || ($silabo == 't') || ($mocsp == 't') || ($wodabo == 't') || ($gazbo == 't') || ($kanalbo == 't')  || ($telbo == 't') || ($kablbo == 't') || ($antenabo == 't') || ($siecbo == 't')) {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
echo "<tr><td colspan=\"40\" height=\"7\" bgcolor=\"#5865E5\">";
echo "<span class=\"nag1wb\">";
echo "&nbsp;Media";
echo "</span>";
echo "</td></tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}
if (($ogrzebo == 't')  || ($ciepwobo == 't') || ($prabo == 't') || ($silabo == 't')) {
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

if ($prabo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pr±d:</b><br>&nbsp;$praps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($silabo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Si³a:</b><br>&nbsp;$silaps";
echo "</td>";

}

if (($ogrzebo == 't')  || ($ciepwobo == 't') || ($prabo == 't') || ($silabo == 't')) {
echo "</tr>"; 
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}

if (($mocsp == 't') || ($wodabo == 't') || ($gazbo == 't') || ($kanalbo == 't')) {
echo "<tr>"; 
}

if ($mocsp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Moc KW:</b><br>&nbsp;$mocs";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

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

}

if (($mocsp == 't') || ($wodabo == 't') || ($gazbo == 't') || ($kanalbo == 't')) {
echo "</tr>"; 
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}

if (($telbo == 't') || ($kablbo == 't') || ($antenabo == 't') || ($siecbo == 't')) {
echo "<tr>"; 
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

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($siecbo == 't') {
echo "<td height=\"25\" colspan = \"20\">";
echo "&nbsp;<b>Sieæ internetowa:</b><br>&nbsp;$siecps";
echo "</td>";

}

if (($telbo == 't') || ($kablbo == 't') || ($antenabo == 't') || ($siecbo == 't')) {
echo "</tr>"; 
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}


$sqluli = "SELECT tdr_d, tdr_d_bo FROM tab_te_w where id_d = '$nu';";
			
			$resultuli = @pg_Exec($conn, $sqluli);
			$uli = pg_result($resultuli, 0, "tdr_d");
			$ulibo = pg_result($resultuli, 0, "tdr_d_bo");
				
	$sqlulis = "SELECT nazwa_ul FROM typ_ulicy where id = '$uli';";
			
			$resultulis = @pg_Exec($conn, $sqlulis);
			$ulips = pg_result($resultulis, 0, "nazwa_ul");

$sqlnadr = "SELECT ndr_d, ndr_d_bo FROM tab_te_w where id_d = '$nu';";
			
			$resultnadr = @pg_Exec($conn, $sqlnadr);
			$nadr = pg_result($resultnadr, 0, "ndr_d");
			$nadrbo = pg_result($resultnadr, 0, "ndr_d_bo");
				
	$sqlnadrs = "SELECT nazwa_na FROM nawierzchnia where id = '$nadr';";
			
			$resultnadrs = @pg_Exec($conn, $sqlnadrs);
			$nadrps = pg_result($resultnadrs, 0, "nazwa_na");

$sqlkomu = "SELECT kmod_d, kmod_d_bo FROM tab_te_w where id_d = '$nu';";
			
			$resultkomu = @pg_Exec($conn, $sqlkomu);
			$komu = pg_result($resultkomu, 0, "kmod_d");
			$komubo = pg_result($resultkomu, 0, "kmod_d_bo");
				
	$sqlkomus = "SELECT nazwa_kom FROM komunikacja where id = '$komu';";
			
			$resultkomus = @pg_Exec($conn, $sqlkomus);
			$komups = pg_result($resultkomus, 0, "nazwa_kom");

$sqlodcm = "SELECT odlce_d, odlce_d_bo FROM tab_te_w where id_d = '$nu';";
			
			$resultodcm = @pg_Exec($conn, $sqlodcm);
			$odcm = pg_result($resultodcm, 0, "odlce_d");
			$odcmbo = pg_result($resultodcm, 0, "odlce_d_bo");

$sqlotocz = "SELECT otnie_d, otnie_d_bo FROM tab_te_w where id_d = '$nu';";
			
			$resultotocz = @pg_Exec($conn, $sqlotocz);
			$otocz = pg_result($resultotocz, 0, "otnie_d");
			$otoczbo = pg_result($resultotocz, 0, "otnie_d_bo");
				
	$sqlotoczs = "SELECT nazwa_oto FROM otoczenie where id = '$otocz';";
			
			$resultotoczs = @pg_Exec($conn, $sqlotoczs);
			$otoczps = pg_result($resultotoczs, 0, "nazwa_oto");	
			
$sqlpoloz = "SELECT polo_d, polo_d_bo FROM tab_te_w where id_d = '$nu';";
			
			$resultpoloz = @pg_Exec($conn, $sqlpoloz);
			$poloz = pg_result($resultpoloz, 0, "polo_d");
			$polobo = pg_result($resultpoloz, 0, "polo_d_bo");
				
	$sqlpolozs = "SELECT nazwa_po FROM polo where id = '$poloz';";
			
			$resultpolozs = @pg_Exec($conn, $sqlpolozs);
			$polops = pg_result($resultpolozs, 0, "nazwa_po");
			

if (($ulibo == 't') || ($nadrbo == 't') || ($komubo == 't') || ($odcmbo == 't') || ($otoczbo == 't') || ($polobo == 't')) {

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

if (($otoczbo == 't') || ($polobo == 't')) {
echo "<tr>"; 
}

if ($otoczbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Otoczenie nieuci±¿l.:</b><br>&nbsp;$otoczps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

} 

if ($polobo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Po³o¿enie:</b><br>&nbsp;$polops";
echo "</td>";
} 


if (($otoczbo == 't') || ($polobo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}



$sqllas = "SELECT las_d, las_d_bo FROM tab_te_w where id_d = '$nu';";
			
			$resultlas = @pg_Exec($conn, $sqllas);
			$las = pg_result($resultlas, 0, "las_d");
			$lasbo = pg_result($resultlas, 0, "las_d_bo");
				
	$sqllass = "SELECT nazwa_la FROM las where id = '$las';";
			
			$resultlass = @pg_Exec($conn, $sqllass);
			$lasps = pg_result($resultlass, 0, "nazwa_la");

$sqlpark = "SELECT park_d, park_d_bo FROM tab_te_w where id_d = '$nu';";
			
			$resultpark = @pg_Exec($conn, $sqlpark);
			$park = pg_result($resultpark, 0, "park_d");
			$parkbo = pg_result($resultpark, 0, "park_d_bo");
				
	$sqlparks = "SELECT nazwa_par FROM park where id = '$park';";
			
			$resultparks = @pg_Exec($conn, $sqlparks);
			$parkps = pg_result($resultparks, 0, "nazwa_par");

$sqlrzeka = "SELECT rzeka_d, rzeka_d_bo FROM tab_te_w where id_d = '$nu';";
			
			$resultrzeka = @pg_Exec($conn, $sqlrzeka);
			$rzeka = pg_result($resultrzeka, 0, "rzeka_d");
			$rzekabo = pg_result($resultrzeka, 0, "rzeka_d_bo");
				
	$sqlrzekas = "SELECT nazwa_rz FROM rzeka where id = '$rzeka';";
			
			$resultrzekas = @pg_Exec($conn, $sqlrzekas);
			$rzekaps = pg_result($resultrzekas, 0, "nazwa_rz");

$sqljezioro = "SELECT jezioro_d, jezioro_d_bo FROM tab_te_w where id_d = '$nu';";
			
			$resultjezioro = @pg_Exec($conn, $sqljezioro);
			$jezioro = pg_result($resultjezioro, 0, "jezioro_d");
			$jeziorobo = pg_result($resultjezioro, 0, "jezioro_d_bo");
				
	$sqljezioros = "SELECT nazwa_je FROM jezioro where id = '$jezioro';";
			
			$resultjezioros = @pg_Exec($conn, $sqljezioros);
			$jeziorops = pg_result($resultjezioros, 0, "nazwa_je");

$sqlstaw = "SELECT staw_d, staw_d_bo FROM tab_te_w where id_d = '$nu';";
			
			$resultstaw = @pg_Exec($conn, $sqlstaw);
			$staw = pg_result($resultstaw, 0, "staw_d");
			$stawbo = pg_result($resultstaw, 0, "staw_d_bo");
				
	$sqlstaws = "SELECT nazwa_sta FROM staw where id = '$staw';";
			
			$resultstaws = @pg_Exec($conn, $sqlstaws);
			$stawps = pg_result($resultstaws, 0, "nazwa_sta");

$sqlgory = "SELECT gory_d, gory_d_bo FROM tab_te_w where id_d = '$nu';";
			
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



$sqldodop = "SELECT dodopis, dodopis_bo FROM tab_te_w where id_d = '$nu';";
			
			$resultdodop = @pg_Exec($conn, $sqldodop);
			$dodop = pg_result($resultdodop, 0, "dodopis");
			$dodopbo = pg_result($resultdodop, 0, "dodopis_bo");



if ($dodopbo == 't') {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
echo "<tr><td colspan=\"40\" height=\"7\" bgcolor=\"#5865E5\">";
echo "<span class=\"nag1wb\">";
echo "&nbsp;Informacje dodatkowe";
echo "</span>";
echo "</td></tr>";
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