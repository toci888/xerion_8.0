<table width="100%" cellpadding="0" cellspacing="0" frame border="0" border="0">
<tr border="0">
<td>
<?

echo "
<center>
<span class= \"menub\"><b>
KOSTENRECHNER DER NOTARGEBÜHREN<br>DES IMMOBILIENBÜROS A.Z.GWARANCJA
</b></span>

<br>
<form action=\"$PHP_SELF\" method=\"POST\">
<input type=\"hidden\" name=\"action\" value=\"oblicz\">
<table border=\"0\" width=\"95%\">

<tr align=\"center\">
<td span class=\"polecam\">";
echo "Geben Sie den Immobilienpreis an:<br>";
echo "<input type=\"char\" name=cena value=\"$cena\">";
echo "</td>";
echo "</tr>";
echo "
<tr align=\"center\">
<td span class=\"polecam\">
Wählen Sie die Immobilienart:<br>";
	echo "<select name=rodzaj value=\"$rodzaj\">";
	echo "<option value=\"msp\">Genossenschaftseigentumswohnung";
	echo "<option value=\"mspkw\">Genossenschaftseigentumswohnung mit dem Grundbuch";
	echo "<option value=\"mhdd\">Hypothekwohnung, Haus, Grundstück";
	echo "</option>";
	echo "</select>";
echo "
</td>
</tr>
";
echo "<tr align=\"center\">
<td span class=\"polecam\">
Geben Sie bitte Provisionshöhe des Büros an (z.B. 2,5%):<br>";
echo "<input type=\"char\" name=prowizja value=\"$prowizja\">
</td>
</tr>

<tr align=\"center\">
<td colspan =\"2\" span class=\"polecam\">
<input type=\"submit\" value=\"BERECHNE\" name=\"BERECHNE\"> 
<input type=\"reset\" value=\"LÖSCHEN\" name=\"LÖSCHEN\">
</td>
</tr>
</center>
</table>
</form>
";
if ($action == 'oblicz') {

echo "<table width=\"512\" cellpadding=\"0\" cellspacing=\"0\" border = \"0\">";
echo "<td width=\"100%\" align = \"right\">";
echo "<a href=\"drukkal.php?cena=$cena&rodzaj=$rodzaj&prowizja=$prowizja\" target = \"_blank\"><img src=\"../img/printer.gif\" width=\"15\" height=\"17\" border=\"0\"></img>&nbsp;&nbsp;Drucke der Gebühren</a><br>";
echo "</td>";
echo "</tr>";
echo "</table>";

if ($rodzaj == 'msp') {

echo "
<center>
<span class=\"napis55\">
<b>GEBÜHRERGEBINS<br>
GENOSSENSCHAFTSEIGENTUMSWOHNUNG
<br><br></b></span>

<table width=\"70 %\" border frame = \"box\">
<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Immobilienpreis: </b>
</td>
<td width=\"20 %\" span class=\"polecam\">
$cena zl.
</td>
</tr>

<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Steuer von den privatjuristischen Tätigkeiten:</b>
</td>";
$podatekcywilny = $cena * 0.02;
echo "
<td width=\"20 %\" span class=\"polecam\">$podatekcywilny zl.</td>
</tr>

<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Notargebühr:</b>
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
<td width=\"20 %\" span class=\"polecam\">$taksanot zl.</td>
</tr>

<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>MWS von der Notargebühr:</b>
</td>";
$podatekvat = $taksanot * 0.22;
echo "
<td width=\"20 %\" span class=\"polecam\">$podatekvat zl.</td>
</tr>

<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Büroprovision ($prowizja  %):</b>
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
<td width=\"20 %\" span class=\"polecam\">$prow zl.</td>
</tr>

<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Steuer von der Büroprovision:</b>
</td>";
$podatekvatp = $prow * 0.22;
echo "
<td width=\"20 %\" span class=\"polecam\">$podatekvatp zl.</td>
</tr>

<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Gerichtsgebühr:</b>
</td>";
$oplatasa = 'no';
echo "
<td width=\"20 %\" span class=\"polecam\">$oplatasa</td>
</tr>

<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Aktenauszüge:</b>
</td>";
$wakt = ' 200 zl.';
echo "
<td width=\"20 %\" span class=\"polecam\">$wakt</td>
</tr>

<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Summe der Zusatzgebühren:</b>
</td>";
$wp1 = 200;
$sumaod = $podatekcywilny + $taksanot + $podatekvat + $prow + $podatekvatp + $wp1;
echo "
<td width=\"20 %\" span class=\"polecam\">$sumaod zl.</td>
</tr>

<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Gesamt:</b>
</td>";
$suma = $cena + $podatekcywilny + $taksanot + $podatekvat + $prow + $podatekvatp + $wp1;
echo "
<td width=\"20 %\" span class=\"polecam\">$suma zl.</td>
</tr>

</table>";
}


if ($rodzaj == 'mspkw') {


echo "
<center>
<span class=\"napis55\">
<b>GEBÜHRERGEBINS<br>
GENOSSENSCHAFTSEIGENTUMSWOHNUNG MIT DEM GRUNDBUCH<br><br></b></span>

<table width=\"70 %\" border frame = \"box\">
<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Immobilienpreis: </b>
</td>
<td width=\"20 %\" span class=\"polecam\">
$cena zl.
</td>
</tr>

<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Steuer von den privatjuristischen Tätigkeiten:</b>
</td>";
$podatekcywilny = $cena * 0.02;
echo "
<td width=\"20 %\" span class=\"polecam\">$podatekcywilny zl.</td>
</tr>

<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Notargebühr:</b>
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
<td width=\"20 %\" span class=\"polecam\">$taksanot zl.</td>
</tr>

<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>MWS von der Notargebühr:</b>
</td>";
$podatekvat = $taksanot * 0.22;
echo "
<td width=\"20 %\" span class=\"polecam\">$podatekvat zl.</td>
</tr>

<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Büroprovision ($prowizja  %):</b>
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
<td width=\"20 %\" span class=\"polecam\">$prow zl.</td>
</tr>

<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Steuer von der Büroprovision:</b>
</td>";
$podatekvatp = $prow * 0.22;
echo "
<td width=\"20 %\" span class=\"polecam\">$podatekvatp zl.</td>
</tr>

<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Gerichtsgebühr:</b>
</td>";

$oplatasa = 200;

echo "
<td width=\"20 %\" span class=\"polecam\">$oplatasa zl.</td>
</tr>

<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Aktenauszüge:</b>
</td>";
$wakt = ' 200 zl.';
echo "
<td width=\"20 %\" span class=\"polecam\">$wakt</td>
</tr>

<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Summe der Zusatzgebühren:</b>
</td>";
$wp2 = 200;
$sumaod = $podatekcywilny + $taksanot + $podatekvat + $prow + $oplatasa + $podatekvatp + $wp2;
echo "
<td width=\"20 %\" span class=\"polecam\">$sumaod zl.</td>
</tr>

<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Gesamt:</b>
</td>";
$suma = $cena + $podatekcywilny + $taksanot + $podatekvat + $prow + $oplatasa + $podatekvatp + $wp2;
echo "
<td width=\"20 %\" span class=\"polecam\">$suma zl.</td>
</tr>

</table>";
}


if ($rodzaj == 'mhdd') {
echo "
<center>
<span class=\"napis55\">
<b>GEBÜHRERGEBINS<br>
HYPOTHEKWOHNUNG, HAUS, GRUNDSTÜCK<br><br></b></span>

<table width=\"70 %\" border frame = \"box\">
<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Immobilienpreis: </b>
</td>
<td width=\"20 %\" span class=\"polecam\">
$cena zl.
</td>
</tr>
<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Steuer von den privatjuristischen Tätigkeiten:</b>
</td>";
$podatekcywilny = $cena * 0.02;
echo "
<td width=\"20 %\" span class=\"polecam\">$podatekcywilny zl.</td>
</tr>
<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Notargebühr:</b>
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
<td width=\"20 %\" span class=\"polecam\">$taksanot zl.</td>
</tr>

<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>MWS von der Notargebühr:</b>
</td>";
$podatekvat = $taksanot * 0.22;
echo "
<td width=\"20 %\" span class=\"polecam\">$podatekvat zl.</td>
</tr>

<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Büroprovision ($prowizja  %):</b>
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
<td width=\"20 %\" span class=\"polecam\">$prow zl.</td>
</tr>

<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Steuer von der Büroprovision:</b>
</td>";
$podatekvatp = $prow * 0.22;
echo "
<td width=\"20 %\" span class=\"polecam\">$podatekvatp zl.</td>
</tr>

<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Gerichtsgebühr:</b>
</td>";

$oplatasa = 200;

echo "
<td width=\"20 %\" span class=\"polecam\">$oplatasa zl.</td>
</tr>

<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Aktenauszüge:</b>
</td>";
$wakt = ' 200 zl.';
echo "
<td width=\"20 %\" span class=\"polecam\">$wakt</td>
</tr>

<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Summe der Zusatzgebühren:</b>
</td>";
$wp3 = 200;
$sumaod = $podatekcywilny + $taksanot + $podatekvat + $prow + $oplatasa + $podatekvatp + $wp3;
echo "
<td width=\"20 %\" span class=\"polecam\">$sumaod zl.</td>
</tr>

<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Gesamt:</b>
</td>";
$suma = $cena + $podatekcywilny + $taksanot + $podatekvat + $prow + $oplatasa + $podatekvatp + $wp3;
echo "
<td width=\"20 %\" span class=\"polecam\">$suma zl.</td>
</tr>

</table>";
}


}
?>
<td>
</tr>
</table>