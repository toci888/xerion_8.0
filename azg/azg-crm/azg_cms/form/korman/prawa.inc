<?
$identbiura = "1";
$ok = "_b";
// polaczenie z baza
$conn = pg_connect ("host=10.1.0.223 user=azg password=grrrBONNN23 dbname=nierazg");
if (!$conn){
	echo "Przykro nam w tej chwili baza ofert jest chwilowo nieczynna.\n";
	exit;
}	

echo "<table width=\"128\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">";

echo "<tr><td colspan=\"2\" height=\"5\" bgcolor=\"#5865E5\">
	<center>
	<span class=\"nag1wb\">KONTAKT</span>
	</center>
	</td></tr>
<tr><td colspan=\"2\"><img src=\"img/red.gif\" width=\"128\" height=\"1\" border=\"0\" alt=\"\"></td></tr>
<tr>
<td colspan=\"2\">
<center>";

$sql1 = "select nazwa_b, adres_b, tel_b, fax_b,  tel_kom_b, email_b from tab_biur where id_b = '$identbiura';";
$result_set1 = pg_Exec($conn, $sql1);
		$nazbiu = pg_result($result_set1, 0, "nazwa_b");
		$adresb = pg_result($result_set1, 0, "adres_b");
		$telb = pg_result($result_set1, 0, "tel_b");
		$faxb = pg_result($result_set1, 0, "fax_b");
		$telkomb = pg_result($result_set1, 0, "tel_kom_b");
		$emailb = pg_result($result_set1, 0, "email_b");

echo"<span class=\"poleca\">";
echo "<b>NIERUCHOMO¦CI</b>";
echo "<br>";
echo "<b>$nazbiu</b>";
echo "<br>";
echo "$adresb";
echo "<br>";
echo "tel./ fax$telb";
echo "<br>";
echo "tel.kom. $telkomb";
echo "<br>";
echo "<a href=\"mailto:$emailb\">$emailb";
echo "</a>";
echo "<br>
pn. - pt. 10.00 - 18.00<br>
sob. 10.00 - 14.00<br>
</center>
</td></tr>";
echo "<tr><td colspan=\"2\"><img src=\"img/red.gif\" width=\"128\" height=\"1\" border=\"0\" alt=\"\"></td></tr>";
echo "
<tr>
<td colspan=\"2\">
<center>
<span class=\"poleca\">
<b>FILIA</b><br>
Budynek Spó³dzielni Mieszkaniowej ZWM<br>
I piêtro, pok.118A<br>
ul. Sosnkowskiego 40-42<br>
45-284 OPOLE<br>
tel./fax: 457-96-99<br>
pn. - pt. 8.00 - 15.00<br>
wt. 8.00 - 17.00<br>";
echo "</span>";
echo "</center></td></tr>";

echo "<tr><td colspan=\"2\"><img src=\"img/red.gif\" width=\"128\" height=\"1\" border=\"0\" alt=\"\"></td></tr>";
echo "<tr><td colspan=\"2\" height=\"5\" bgcolor=\"#5865E5\">
	<center>
	<span class=\"nag1wb\">ZG³O¦ OFERTÊ</span>
	</center>
	</td></tr>
<tr><td colspan=\"2\"><img src=\"img/red.gif\" width=\"128\" height=\"1\" border=\"0\" alt=\"\"></td></tr>
<tr>
<td colspan=\"2\">
<center>";

echo"<span class=\"poleca\">";
echo "Zg³o¶ nieruchomo¶æ<br>kliknij na poni¿szy link:<br>";
echo "<a href=\"index.php?action=dodajform\">&#171; Zg³o¶ &#187;";
echo "</a>";
echo "<br>";
echo "</span>";
echo "</center>
</td>
</tr>";

echo "<tr><td colspan=\"2\"><img src=\"img/red.gif\" width=\"128\" height=\"1\" border=\"0\" alt=\"\"></td></tr>";
echo "<tr><td colspan=\"2\" height=\"5\" bgcolor=\"#5865E5\">
	<center>
	<span class=\"nag1wb\">SUBSKRYPCJA</span>
	</center>
	</td></tr>
<tr><td colspan=\"2\"><img src=\"img/red.gif\" width=\"128\" height=\"1\" border=\"0\" alt=\"\"></td></tr>
<tr>
<td colspan=\"2\">
<center>";

echo"<span class=\"poleca\">";
echo "Aby otrzymaæ informacje<br>o najnowszych ofertach<br>kliknij na poni¿szy link:<br>";
echo "<a href=\"index.php?action=dodajsub\">&#171; Formularz &#187;";
echo "</a>";
echo "<br>";
echo "</span>";
echo "</center>
</td>
</tr>";
echo "<tr><td colspan=\"2\"><img src=\"img/red.gif\" width=\"128\" height=\"1\" border=\"0\" alt=\"\"></td></tr>";
echo "<tr><td colspan=\"2\" height=\"5\" bgcolor=\"#5865E5\">
	<center>
	<span class=\"nag1wb\">KURSY WALUT</span>
	</center>
	</td></tr>
<tr><td colspan=\"2\"><img src=\"img/red.gif\" width=\"128\" height=\"1\" border=\"0\" alt=\"\"></td></tr>
<tr>
<td colspan=\"2\">
<center>";


// Pocz±tek pobierania linku do kursu walut w formacie XML...
$a = "0";
$connect = fopen("http://www.nbp.pl/kursy/kursya.html", "r");
if ($connect) {
while (!feof ($connect)) {
   $a++;
   $buffer = fgets($connect, 4096);
   if($a=="166") {
   $link = $buffer;
   }
}
};
fclose($connect);
// Koniec pobierania linku do kursu walut w formacie XML

// Wycinanie linku
$link1 = strstr($link, 'xml');
$link2 = substr($link1, '0', '19');
$link = "http://www.nbp.pl/kursy/".$link2;
// Koniec. Link w zmiennej $link.

// Pobieranie arkusza XML
$a = "0";
$connect = fopen($link, "r");
if ($connect) {
while (!feof ($connect)) {
   $a++;
   $buffer = fgets($connect, 4096);
   if($a=="4") {
   $datak = $buffer;
   }
   elseif($a=="3") {
   $numerk = $buffer;
   }
   elseif($a=="6") {
   $waluta1 = $buffer;
   }
   elseif($a=="8") {
   $symbol1 = $buffer;
   }
   elseif($a=="9") {
   $kurs1 = $buffer;
   }
   elseif($a=="30") {
   $waluta2 = $buffer;
   }
   elseif($a=="32") {
   $symbol2 = $buffer;
   }
   elseif($a=="33") {
   $kurs2 = $buffer;
   }
   elseif($a=="24") {
   $waluta3 = $buffer;
   }
   elseif($a=="26") {
   $symbol3 = $buffer;
   }
   elseif($a=="27") {
   $kurs3 = $buffer;
   }
   elseif($a=="54") {
   $waluta4 = $buffer;
   }
   elseif($a=="56") {
   $symbol4 = $buffer;
   }
   elseif($a=="57") {
   $kurs4 = $buffer;
   }
}
};
fclose($connect);
echo "<span class = \"poleca\"><b>".$datak.", wg NBP:</b><br>1 ".$symbol1." - ".$kurs1."z³.<br>1 ".$symbol2." - ".$kurs2." z³.<br>1 ".$symbol3." - ".$kurs3." z³.<br>1 ".$symbol4." - ".$kurs4."z³.</span>";
echo "</center>
</td>
</tr>";

echo "<tr><td colspan=\"2\"><img src=\"img/red.gif\" width=\"128\" height=\"1\" border=\"0\" alt=\"\"></td></tr>";
echo "<tr><td colspan=\"2\" height=\"5\" bgcolor=\"#5865E5\">
	<center>
	<span class=\"nag1wb\">NALE¯YMY DO</span>
	</center>
	</td></tr>
<tr><td colspan=\"2\"><img src=\"img/red.gif\" width=\"128\" height=\"1\" border=\"0\" alt=\"\"></td></tr>
<tr>
<td colspan=\"2\">
<center>";

echo "<tr><td width = \"62\"><img src=\"img/ospprn.jpg\" width=\"62\" height=\"80\" border=\"0\" alt=\"\"></td>";
echo "<td width = \"62\"><img src=\"img/pfrns.jpg\" width=\"62\" height=\"80\" border=\"0\" alt=\"\"></td></tr>";
echo "<tr><td colspan =\"2\" width = \"62\"><center><img src=\"img/pte.jpg\" width=\"62\" height=\"80\" border=\"0\" alt=\"\"></center></td>";
echo "</table>";		


?>