<table width="100%" cellpadding="0" cellspacing="0" frame border="0" border="0">
<tr border="0">
<td>
<?

echo "
<center>
<span class= \"menub\"><b>KALKULATOR OP£AT NOTARIALNYCH <br> BIURA NIERUCHOMO¦CI</b></span>

<br>
<form action=\"$PHP_SELF\" method=\"POST\">
<input type=\"hidden\" name=\"action\" value=\"oblicz\">
<table border=\"0\" width=\"95%\">

<tr align=\"center\">
<td span class=\"polecam\">";
echo "Podaj Cenê Nieruchomo¶ci:<br>";
echo "<input type=\"char\" name=cena value=\"$cena\">";
echo "</td>";
echo "</tr>";
echo "
<tr align=\"center\">
<td span class=\"polecam\">
Wybierz Rodzaj:<br>";
	echo "<select name=rodzaj value=\"$rodzaj\">";
	echo "<option value=\"msp\">Mieszkanie Spó³dzielcze W³asno¶ciowe";
	echo "<option value=\"mspkw\">Mieszkanie Spó³dzielcze W³asno¶ciowe z Ksiêg± Wieczyst±";
	echo "<option value=\"mhdd\">Mieszkanie Hipoteczne, Dom, Dzia³ka";
	echo "</option>";
	echo "</select>";
echo "
</td>
</tr>
";
echo "<tr align=\"center\">
<td span class=\"polecam\">
Podaj Wysoko¶æ Prowizji Biura (np. 2.5 %):<br>";
echo "<input type=\"char\" name=prowizja value=\"$prowizja\">
</td>
</tr>


<tr align=\"center\">
<td colspan =\"2\" span class=\"polecam\">
<input type=\"submit\" value=\"OBLICZ\" name=\"OBLICZ\"> 
<input type=\"reset\" value=\"SKASUJ\" name=\"SKASUJ\">
</td>
</tr>
</center>
</table>
</form>
";
if ($action == 'oblicz') {

echo "<table width=\"512\" cellpadding=\"0\" cellspacing=\"0\" border = \"0\">";
echo "<td width=\"100%\" align = \"right\">";
echo "<a href=\"drukkal.php?cena=$cena&rodzaj=$rodzaj&prowizja=$prowizja\" target = \"_blank\"><img src=\"img/printer.gif\" width=\"15\" height=\"17\" border=\"0\"></img>&nbsp;&nbsp;Wydrukuj op³aty</a><br>";
echo "</td>";
echo "</tr>";
echo "</table>";

if ($rodzaj == 'msp') {

echo "
<center>
<span class=\"napis55\">
<b>WYNIK OP£AT<br>
MIESZKANIE SPÓ£DZIELCZE W£ASNO¦CIOWE<br><br></b></span>

<table width=\"70 %\" border frame = \"box\">
<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Cena Nieruchomo¶ci: </b>
</td>
<td width=\"20 %\" span class=\"polecam\">
$cena z³.
</td>
</tr>

<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Podatek od Czynno¶ci Cywilnoprawnych:</b>
</td>";
$podatekcywilny = $cena * 0.02;
echo "
<td width=\"20 %\" span class=\"polecam\">$podatekcywilny z³.</td>
</tr>

<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Taksa Notarialna:</b>
</td>";

if (($cena > 0) && ($cena <= 3000)) {
$taksanot = 100;
}

if (($cena > 3000) && ($cena <= 10000)) {
$taksanot = (100 + (($cena - 3000) * 0.03))/2;
}

if (($cena > 10000) && ($cena <= 30000)) {
$taksanot = (310 + (($cena - 10000) * 0.02))/2;
}

if (($cena > 30000) && ($cena <= 60000)) {
$taksanot = (710 + (($cena - 30000) * 0.01))/2;
}

if (($cena > 60000) && ($cena <= 1000000)) {
$taksanot = (1010 + (($cena - 60000) * 0.005))/2;
}

if ($cena > 1000000) {
$taksanot = (5710 + (($cena - 1000000) * 0.0025))/2;
}

echo "
<td width=\"20 %\" span class=\"polecam\">$taksanot z³.</td>
</tr>

<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Podatek VAT od Taksy Notarialnej :</b>
</td>";
$podatekvat = $taksanot * 0.22;
echo "
<td width=\"20 %\" span class=\"polecam\">$podatekvat z³.</td>
</tr>

<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Prowizja Biura ($prowizja  %):</b>
</td>";

$liczba = $prowizja;
$zna = ',';
$pos = strpos($liczba,$zna);
if ($pos === false) { 
   $wynik = $liczba; 
} else { 

$pattern = "/(\d+),(\d+)/i"; 
$replacement = "\$1.\$2"; 
$wynik =  preg_replace($pattern, $replacement, $liczba);  
} 
$prowizja = $wynik;

$prow = $cena * $prowizja/100;
echo "
<td width=\"20 %\" span class=\"polecam\">$prow z³.</td>
</tr>

<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Podatek VAT od Prowizji Biura :</b>
</td>";
$podatekvatp = $prow * 0.22;
echo "
<td width=\"20 %\" span class=\"polecam\">$podatekvatp z³.</td>
</tr>

<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Op³ata S±dowa:</b>
</td>";
$oplatasa = 'nie ma';
echo "
<td width=\"20 %\" span class=\"polecam\">$oplatasa</td>
</tr>

<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Wypisy Aktów:</b>
</td>";
$wakt = 'oko³o 200 z³.';
echo "
<td width=\"20 %\" span class=\"polecam\">$wakt</td>
</tr>

<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Suma Op³at Dodatkowych:</b>
</td>";
$wp1 = 200;
$sumaod = $podatekcywilny + $taksanot + $podatekvat + $prow + $podatekvatp + $wp1;
echo "
<td width=\"20 %\" span class=\"polecam\">$sumaod z³.</td>
</tr>

<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Suma:</b>
</td>";
$suma = $cena + $podatekcywilny + $taksanot + $podatekvat + $prow + $podatekvatp + $wp1;
echo "
<td width=\"20 %\" span class=\"polecam\">$suma z³.</td>
</tr>

</table>";
}


if ($rodzaj == 'mspkw') {


echo "
<center>
<span class=\"napis55\">
<b>WYNIK OP£AT<br>
MIESZKANIE SPÓ£DZIELCZE W£ASNO¦CIOWE <br>
Z KSIÊG¡ WIECZYST¡<br><br></b></span>

<table width=\"70 %\" border frame = \"box\">
<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Cena Nieruchomo¶ci: </b>
</td>
<td width=\"20 %\" span class=\"polecam\">
$cena z³.
</td>
</tr>

<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Podatek od Czynno¶ci Cywilnoprawnych:</b>
</td>";
$podatekcywilny = $cena * 0.02;
echo "
<td width=\"20 %\" span class=\"polecam\">$podatekcywilny z³.</td>
</tr>

<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Taksa Notarialna:</b>
</td>";

if (($cena > 0) && ($cena <= 3000)) {
$taksanot = 100;
}

if (($cena > 3000) && ($cena <= 10000)) {
$taksanot = (100 + (($cena - 3000) * 0.03))/2;
}

if (($cena > 10000) && ($cena <= 30000)) {
$taksanot = (310 + (($cena - 10000) * 0.02))/2;
}

if (($cena > 30000) && ($cena <= 60000)) {
$taksanot = (710 + (($cena - 30000) * 0.01))/2;
}

if (($cena > 60000) && ($cena <= 1000000)) {
$taksanot = (1010 + (($cena - 60000) * 0.005))/2;
}

if ($cena > 1000000) {
$taksanot = (5710 + (($cena - 1000000) * 0.0025))/2;
}

echo "
<td width=\"20 %\" span class=\"polecam\">$taksanot z³.</td>
</tr>

<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Podatek VAT od Taksy Notarialnej :</b>
</td>";
$podatekvat = $taksanot * 0.22;
echo "
<td width=\"20 %\" span class=\"polecam\">$podatekvat z³.</td>
</tr>

<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Prowizja Biura ($prowizja %):</b>
</td>";

$liczba = $prowizja;
$zna = ',';
$pos = strpos($liczba,$zna);
if ($pos === false) { 
   $wynik = $liczba; 
} else { 

$pattern = "/(\d+),(\d+)/i"; 
$replacement = "\$1.\$2"; 
$wynik =  preg_replace($pattern, $replacement, $liczba);  
} 
$prowizja = $wynik;

$prow = $cena * $prowizja/100;
echo "
<td width=\"20 %\" span class=\"polecam\">$prow z³.</td>
</tr>

<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Podatek VAT od Prowizji Biura :</b>
</td>";
$podatekvatp = $prow * 0.22;
echo "
<td width=\"20 %\" span class=\"polecam\">$podatekvatp z³.</td>
</tr>

<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Op³ata S±dowa:</b>
</td>";

if (($cena > 0) && ($cena <= 10000)) {
$oplatas = $cena * 0.08;
}

if (($cena > 10000) && ($cena <= 50000)) {
$oplatas = 800 + (($cena - 10000) * 0.07);
}

if (($cena > 50000) && ($cena <= 100000)) {
$oplatas = 3600 + (($cena - 50000) * 0.06);
}

if ($cena > 100000) {
$oplatas = 6600 + (($cena - 100000) * 0.05);
}

$oplatasa = $oplatas * 0.2;

if ($oplatasa < 30) {
$oplatasa = 30;
}

if ($oplatasa > 100000) {
$oplatasa = 100000;
}

echo "
<td width=\"20 %\" span class=\"polecam\">$oplatasa z³.</td>
</tr>

<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Wypisy Aktów:</b>
</td>";
$wakt = 'oko³o 200 z³.';
echo "
<td width=\"20 %\" span class=\"polecam\">$wakt</td>
</tr>

<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Suma Op³at Dodatkowych:</b>
</td>";
$wp2 = 200;
$sumaod = $podatekcywilny + $taksanot + $podatekvat + $prow + $oplatasa + $podatekvatp + $wp2;
echo "
<td width=\"20 %\" span class=\"polecam\">$sumaod z³.</td>
</tr>

<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Suma:</b>
</td>";
$suma = $cena + $podatekcywilny + $taksanot + $podatekvat + $prow + $oplatasa + $podatekvatp + $wp2;
echo "
<td width=\"20 %\" span class=\"polecam\">$suma z³.</td>
</tr>

</table>";
}


if ($rodzaj == 'mhdd') {
echo "
<center>
<span class=\"napis55\">
<b>WYNIK OP£AT<br>
MIESZKANIE HIPOTECZNE, DOM, DZIA£KA<br><br></b></span>

<table width=\"70 %\" border frame = \"box\">
<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Cena Nieruchomo¶ci: </b>
</td>
<td width=\"20 %\" span class=\"polecam\">
$cena z³.
</td>
</tr>

<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Podatek od Czynno¶ci Cywilnoprawnych:</b>
</td>";
$podatekcywilny = $cena * 0.02;
echo "
<td width=\"20 %\" span class=\"polecam\">$podatekcywilny z³.</td>
</tr>

<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Taksa Notarialna:</b>
</td>";


if (($cena > 0) && ($cena <= 3000)) {
$taksanot = 100;
}

if (($cena > 3000) && ($cena <= 10000)) {
$taksanot = (100 + ($cena - 3000) * 0.03);
}

if (($cena > 10000) && ($cena <= 30000)) {
$taksanot = (310 + ($cena - 10000) * 0.02);
}

if (($cena > 30000) && ($cena <= 60000)) {
$taksanot = (710 + ($cena - 30000) * 0.01);
}

if (($cena > 60000) && ($cena <= 1000000)) {
$taksanot = (1010 + ($cena - 60000) * 0.005);
}

if ($cena > 1000000) {
$taksanot = (5710 + ($cena - 1000000) * 0.0025);
}

echo "
<td width=\"20 %\" span class=\"polecam\">$taksanot z³.</td>
</tr>

<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Podatek VAT od Taksy Notarialnej :</b>
</td>";
$podatekvat = $taksanot * 0.22;
echo "
<td width=\"20 %\" span class=\"polecam\">$podatekvat z³.</td>
</tr>

<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Prowizja Biura ($prowizja %):</b>
</td>";

$liczba = $prowizja;
$zna = ',';
$pos = strpos($liczba,$zna);
if ($pos === false) { 
   $wynik = $liczba; 
} else { 

$pattern = "/(\d+),(\d+)/i"; 
$replacement = "\$1.\$2"; 
$wynik =  preg_replace($pattern, $replacement, $liczba);  
} 
$prowizja = $wynik;

$prow = $cena * $prowizja/100;
echo "
<td width=\"20 %\" span class=\"polecam\">$prow z³.</td>
</tr>

<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Podatek VAT od Prowizji Biura :</b>
</td>";
$podatekvatp = $prow * 0.22;
echo "
<td width=\"20 %\" span class=\"polecam\">$podatekvatp z³.</td>
</tr>

<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Op³ata S±dowa:</b>
</td>";

if (($cena > 0) && ($cena <= 10000)) {
$oplatas = $cena * 0.08;
}

if (($cena > 10000) && ($cena <= 50000)) {
$oplatas = 800 + (($cena - 10000) * 0.07);
}

if (($cena > 50000) && ($cena <= 100000)) {
$oplatas = 3600 + (($cena - 50000) * 0.06);
}

if ($cena > 100000) {
$oplatas = 6600 + (($cena - 100000) * 0.05);
}

$oplatasa = $oplatas * 0.2;

if ($oplatasa < 30) {
$oplatasa = 30;
}

if ($oplatasa > 100000) {
$oplatasa = 100000;
}

echo "
<td width=\"20 %\" span class=\"polecam\">$oplatasa z³.</td>
</tr>

<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Wypisy Aktów:</b>
</td>";
$wakt = 'oko³o 200 z³.';
echo "
<td width=\"20 %\" span class=\"polecam\">$wakt</td>
</tr>

<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Suma Op³at Dodatkowych:</b>
</td>";
$wp3 = 200;
$sumaod = $podatekcywilny + $taksanot + $podatekvat + $prow + $oplatasa + $podatekvatp + $wp3;
echo "
<td width=\"20 %\" span class=\"polecam\">$sumaod z³.</td>
</tr>

<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Suma:</b>
</td>";
$suma = $cena + $podatekcywilny + $taksanot + $podatekvat + $prow + $oplatasa + $podatekvatp + $wp3;
echo "
<td width=\"20 %\" span class=\"polecam\">$suma z³.</td>
</tr>

</table>";
}


}
?>
<td>
</tr>
</table>