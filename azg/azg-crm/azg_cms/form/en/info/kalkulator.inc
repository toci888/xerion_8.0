<table width="100%" cellpadding="0" cellspacing="0" frame border="0" border="0">
<tr border="0">
<td>
<?

echo "
<center>
<span class= \"menub\"><b>CALCULATOR OF FEES<br>AT THE PURCHASE OF THE PROPERTY IN POLAND</b></span>

<br>
<form action=\"$PHP_SELF\" method=\"POST\">
<input type=\"hidden\" name=\"action\" value=\"oblicz\">
<table border=\"0\" width=\"95%\">

<tr align=\"center\">
<td span class=\"polecam\">";
echo "Give the price of the property:<br>";
echo "<input type=\"char\" name=cena value=\"$cena\">";
echo "</td>";
echo "</tr>";
echo "
<tr align=\"center\">
<td span class=\"polecam\">
Choose the kind:<br>";
	echo "<select name=rodzaj value=\"$rodzaj\">";
	echo "<option value=\"msp\">Housing association flat";
	echo "<option value=\"mspkw\">Housing association flat with the real estate register";
	echo "<option value=\"mhdd\">Owner-occupied Flat, House, Plot";
	echo "</option>";
	echo "</select>";
echo "
</td>
</tr>
";
echo "<tr align=\"center\">
<td span class=\"polecam\">
Give th agency commission value (e.g. 2.5 %):<br>";
echo "<input type=\"char\" name=prowizja value=\"$prowizja\">
</td>
</tr>


<tr align=\"center\">
<td colspan =\"2\" span class=\"polecam\">
<input type=\"submit\" value=\"COUNT\" name=\"COUNT\"> 
<input type=\"reset\" value=\"CANCEL\" name=\"CANCEL\">
</td>
</tr>
</center>
</table>
</form>
";
if ($action == 'oblicz') {

echo "<table width=\"512\" cellpadding=\"0\" cellspacing=\"0\" border = \"0\">";
echo "<td width=\"100%\" align = \"right\">";
echo "<a href=\"drukkal.php?cena=$cena&rodzaj=$rodzaj&prowizja=$prowizja\" target = \"_blank\"><img src=\"../img/printer.gif\" width=\"15\" height=\"17\" border=\"0\"></img>&nbsp;&nbsp;Print the fees</a><br>";
echo "</td>";
echo "</tr>";
echo "</table>";

if ($rodzaj == 'msp') {

echo "
<center>
<span class=\"napis55\">
<b>RESULT OF FEES<br>
HOUSING ASSOCIATION FLAT<br><br></b></span>

<table width=\"70 %\" border frame = \"box\">
<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Price of the property: </b>
</td>
<td width=\"20 %\" span class=\"polecam\">
$cena z³.
</td>
</tr>

<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>TAX:</b>
</td>";
$podatekcywilny = $cena * 0.02;
echo "
<td width=\"20 %\" span class=\"polecam\">$podatekcywilny z³.</td>
</tr>

<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Notarized tax:</b>
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
<b>Vat tax of notarized tax:</b>
</td>";
$podatekvat = $taksanot * 0.22;
echo "
<td width=\"20 %\" span class=\"polecam\">$podatekvat z³.</td>
</tr>

<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Agency commission value ($prowizja  %):</b>
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
<b>Vat tax of agency commission value:</b>
</td>";
$podatekvatp = $prow * 0.22;
echo "
<td width=\"20 %\" span class=\"polecam\">$podatekvatp z³.</td>
</tr>

<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Court Fee:</b>
</td>";
$oplatasa = 'no';
echo "
<td width=\"20 %\" span class=\"polecam\">$oplatasa</td>
</tr>

<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Extracts of Acts:</b>
</td>";
$wakt = 'around 200 z³.';
echo "
<td width=\"20 %\" span class=\"polecam\">$wakt</td>
</tr>

<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Amount of extra fees:</b>
</td>";
$wp1 = 200;
$sumaod = $podatekcywilny + $taksanot + $podatekvat + $prow + $podatekvatp + $wp1;
echo "
<td width=\"20 %\" span class=\"polecam\">$sumaod z³.</td>
</tr>

<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Amount:</b>
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
<b>RESULT OF FEES<br>
HOUSING ASSOCIATION FLAT<br>
WITH THE REAL ESTATE REGISTER<br><br></b></span>

<table width=\"70 %\" border frame = \"box\">
<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Price of the property: </b>
</td>
<td width=\"20 %\" span class=\"polecam\">
$cena z³.
</td>
</tr>

<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>TAX:</b>
</td>";
$podatekcywilny = $cena * 0.02;
echo "
<td width=\"20 %\" span class=\"polecam\">$podatekcywilny z³.</td>
</tr>

<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Notarized tax:</b>
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
<b>Vat tax of notarized tax:</b>
</td>";
$podatekvat = $taksanot * 0.22;
echo "
<td width=\"20 %\" span class=\"polecam\">$podatekvat z³.</td>
</tr>

<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Agency commission value ($prowizja  %):</b>
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
<b>Vat tax of agency commission value:</b>
</td>";
$podatekvatp = $prow * 0.22;
echo "
<td width=\"20 %\" span class=\"polecam\">$podatekvatp z³.</td>
</tr>

<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Court Fee:</b>
</td>";

$oplatasa = 200;

echo "
<td width=\"20 %\" span class=\"polecam\">$oplatasa z³.</td>
</tr>

<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Extracts of Acts:</b>
</td>";
$wakt = 'around 200 z³.';
echo "
<td width=\"20 %\" span class=\"polecam\">$wakt</td>
</tr>

<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Amount of extra fees:</b>
</td>";
$wp2 = 200;
$sumaod = $podatekcywilny + $taksanot + $podatekvat + $prow + $oplatasa + $podatekvatp + $wp2;
echo "
<td width=\"20 %\" span class=\"polecam\">$sumaod z³.</td>
</tr>

<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Amount:</b>
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
<b>RESULT OF FEES<br>
OWNER - OCCUPIED FLAT, HOUSE, PLOT<br><br></b></span>

<table width=\"70 %\" border frame = \"box\">
<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Price of the property: </b>
</td>
<td width=\"20 %\" span class=\"polecam\">
$cena z³.
</td>
</tr>

<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>TAX:</b>
</td>";
$podatekcywilny = $cena * 0.02;
echo "
<td width=\"20 %\" span class=\"polecam\">$podatekcywilny z³.</td>
</tr>

<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Notarized tax:</b>
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
<b>Vat tax of notarized tax:</b>
</td>";
$podatekvat = $taksanot * 0.22;
echo "
<td width=\"20 %\" span class=\"polecam\">$podatekvat z³.</td>
</tr>

<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Agency commission value ($prowizja  %):</b>
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
<b>Vat tax of agency commission value:</b>
</td>";
$podatekvatp = $prow * 0.22;
echo "
<td width=\"20 %\" span class=\"polecam\">$podatekvatp z³.</td>
</tr>

<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Court Fee:</b>
</td>";

$oplatasa = 200;

echo "
<td width=\"20 %\" span class=\"polecam\">$oplatasa z³.</td>
</tr>

<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Extracts of Acts:</b>
</td>";
$wakt = 'around 200 z³.';
echo "
<td width=\"20 %\" span class=\"polecam\">$wakt</td>
</tr>

<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Amount of extra fees:</b>
</td>";
$wp3 = 200;
$sumaod = $podatekcywilny + $taksanot + $podatekvat + $prow + $oplatasa + $podatekvatp + $wp3;
echo "
<td width=\"20 %\" span class=\"polecam\">$sumaod z³.</td>
</tr>

<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Amount:</b>
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