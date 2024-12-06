<HTML LANG="pl">
<HEAD>
<META http-equiv="content-type" content="text/html; charset=ISO-8859-2">
<LINK REL="stylesheet" HREF="azg.css">
<TITLE>"OPOLSKIE BIURO NIERUCHOMOŚCI - A.Z.GWARANCJA"</TITLE>

</HEAD>

<BODY bgcolor='white' marginheight="0" marginwidth="0" topmargin="0" leftmargin="0">


<center>

<table width=100% cellpadding=0 cellspacing=0 frame border=0>

<tr>
	<td colspan = 4 height=5 ></td>
</tr>

<tr>
<td width=40% order=0 align=left rowspan = 3>

<img src=http://www.azg.pl/form/logom.jpg width=181 height=90 border=0></img>

</td>

<td width=60% border=0 align=right colspan = 3>
<span class=tytulna><b>
BIURO NIERUCHOMOŚCI A.Z.GWARANCJA<br>
</span>
</td>
</tr>

<tr>
<td height=5 width=30% border=0 align=right>
<span class=tytul><b>
ul. Sosnkowskiego 40-42,<br>
45-284 Opole<br>
tel./fax. (077) 457-96-99<br>
</b>
</span>
</td>

<td width=2% height=100% align=right><img src=http://www.azg.pl/form/black.gif width=1 height=100% border=0></td>

<td height=5 width=28% border=0 align=right>
<span class=tytul><b>
ul. Bytnara Rudego 13, <br>45-265 Opole<br>
tel./fax. (077) 458-00-94, <br>
tel.kom.0602-531-334<br>
</b>
</span>
</td>
</tr>
<tr>
<td width=100% border=0 align=right colspan = 3>
<span class=tytul><b>
adres: <a href = http://www.azg.pl>www.azg.pl</a>, e-mail: <a href= mailto:azgwarancja@azg.pl>azgwarancja@azg.pl</a>
</b>
</span>
</td>

</tr>

	<tr>
	<td colspan = 4><img src=http://www.azg.pl/form/black.gif width=100% height=2 border=0></td>
	</tr>

</table>
<br>

<?

$conn = pg_connect ("host=10.1.0.223 user=azg password=grrrBONNN23 dbname=nierazg");

if ($rodzaj == 'msp') {

echo "
<center>
<span class=\"napis55\">
<b>WYNIK OPŁAT<br>
MIESZKANIE SPÓŁDZIELCZE WŁASNOŚCIOWE<br><br></b></span>

<table width=\"40 %\" border frame = \"box\">
<tr>
<td width=\"20 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Cena Nieruchomości: </b>
</td>
<td width=\"20 %\" span class=\"polecam\">
$cena zł.
</td>
</tr>

<tr>
<td width=\"20 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Podatek od Czynności Cywilnoprawnych:</b>
</td>";
$podatekcywilny = $cena * 0.02;
echo "
<td width=\"20 %\" span class=\"polecam\">$podatekcywilny zł.</td>
</tr>

<tr>
<td width=\"20 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
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
<td width=\"20 %\" span class=\"polecam\">$taksanot zł.</td>
</tr>

<tr>
<td width=\"20 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Podatek VAT od Taksy Notarialnej :</b>
</td>";
$podatekvat = $taksanot * 0.22;
echo "
<td width=\"20 %\" span class=\"polecam\">$podatekvat zł.</td>
</tr>

<tr>
<td width=\"20 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
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
<td width=\"20 %\" span class=\"polecam\">$prow zł.</td>
</tr>

<tr>
<td width=\"20 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Podatek VAT od Prowizji Biura :</b>
</td>";
$podatekvatp = $prow * 0.22;
echo "
<td width=\"20 %\" span class=\"polecam\">$podatekvatp zł.</td>
</tr>

<tr>
<td width=\"20 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Opłata Sądowa:</b>
</td>";
$oplatasa = 'nie ma';
echo "
<td width=\"20 %\" span class=\"polecam\">$oplatasa</td>
</tr>

<tr>
<td width=\"20 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Wpisy Aktów:</b>
</td>";
$wakt = 'około 200 zł.';
echo "
<td width=\"20 %\" span class=\"polecam\">$wakt</td>
</tr>

<tr>
<td width=\"20 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Suma Opłat Dodatkowych:</b>
</td>";
$wp1 = 200;
$sumaod = $podatekcywilny + $taksanot + $podatekvat + $prow + $podatekvatp + $wp1;
echo "
<td width=\"20 %\" span class=\"polecam\">$sumaod zł.</td>
</tr>

<tr>
<td width=\"20 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Suma:</b>
</td>";
$suma = $cena + $podatekcywilny + $taksanot + $podatekvat + $prow + $podatekvatp + $wp1;
echo "
<td width=\"20 %\" span class=\"polecam\">$suma zł.</td>
</tr>

</table>";
}


if ($rodzaj == 'mspkw') {


echo "
<center>
<span class=\"napis55\">
<b>WYNIK OPŁAT<br>
MIESZKANIE SPÓŁDZIELCZE WŁASNOŚCIOWE <br>
Z KSIĘGĄ WIECZYSTĄ<br><br></b></span>

<table width=\"40 %\" border frame = \"box\">
<tr>
<td width=\"20 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Cena Nieruchomości: </b>
</td>
<td width=\"20 %\" span class=\"polecam\">
$cena zł.
</td>
</tr>

<tr>
<td width=\"20 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Podatek od Czynności Cywilnoprawnych:</b>
</td>";
$podatekcywilny = $cena * 0.02;
echo "
<td width=\"20 %\" span class=\"polecam\">$podatekcywilny zł.</td>
</tr>

<tr>
<td width=\"20 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
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
<td width=\"20 %\" span class=\"polecam\">$taksanot zł.</td>
</tr>

<tr>
<td width=\"20 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Podatek VAT od Taksy Notarialnej :</b>
</td>";
$podatekvat = $taksanot * 0.22;
echo "
<td width=\"20 %\" span class=\"polecam\">$podatekvat zł.</td>
</tr>

<tr>
<td width=\"20 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
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
<td width=\"20 %\" span class=\"polecam\">$prow zł.</td>
</tr>

<tr>
<td width=\"20 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Podatek VAT od Prowizji Biura :</b>
</td>";
$podatekvatp = $prow * 0.22;
echo "
<td width=\"20 %\" span class=\"polecam\">$podatekvatp zł.</td>
</tr>

<tr>
<td width=\"20 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Opłata Sądowa:</b>
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
<td width=\"20 %\" span class=\"polecam\">$oplatasa zł.</td>
</tr>

<tr>
<td width=\"20 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Wpisy Aktów:</b>
</td>";
$wakt = 'około 200 zł.';
echo "
<td width=\"20 %\" span class=\"polecam\">$wakt</td>
</tr>

<tr>
<td width=\"20 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Suma Opłat Dodatkowych:</b>
</td>";
$wp2 = 200;
$sumaod = $podatekcywilny + $taksanot + $podatekvat + $prow + $oplatasa + $podatekvatp + $wp2;
echo "
<td width=\"20 %\" span class=\"polecam\">$sumaod zł.</td>
</tr>

<tr>
<td width=\"20 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Suma:</b>
</td>";
$suma = $cena + $podatekcywilny + $taksanot + $podatekvat + $prow + $oplatasa + $podatekvatp + $wp2;
echo "
<td width=\"20 %\" span class=\"polecam\">$suma zł.</td>
</tr>

</table>";
}


if ($rodzaj == 'mhdd') {
echo "
<center>
<span class=\"napis55\">
<b>WYNIK OPŁAT<br>
MIESZKANIE HIPOTECZNE, DOM, DZIAŁKA<br><br></b></span>

<table width=\"40 %\" border frame = \"box\">
<tr>
<td width=\"20 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Cena Nieruchomości: </b>
</td>
<td width=\"20 %\" span class=\"polecam\">
$cena zł.
</td>
</tr>

<tr>
<td width=\"20 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Podatek od Czynności Cywilnoprawnych:</b>
</td>";
$podatekcywilny = $cena * 0.02;
echo "
<td width=\"20 %\" span class=\"polecam\">$podatekcywilny zł.</td>
</tr>

<tr>
<td width=\"20 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
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
<td width=\"20 %\" span class=\"polecam\">$taksanot zł.</td>
</tr>

<tr>
<td width=\"20 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Podatek VAT od Taksy Notarialnej :</b>
</td>";
$podatekvat = $taksanot * 0.22;
echo "
<td width=\"20 %\" span class=\"polecam\">$podatekvat zł.</td>
</tr>

<tr>
<td width=\"20 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
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
<td width=\"20 %\" span class=\"polecam\">$prow zł.</td>
</tr>

<tr>
<td width=\"20 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Podatek VAT od Prowizji Biura :</b>
</td>";
$podatekvatp = $prow * 0.22;
echo "
<td width=\"20 %\" span class=\"polecam\">$podatekvatp zł.</td>
</tr>

<tr>
<td width=\"20 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Opłata Sądowa:</b>
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
<td width=\"20 %\" span class=\"polecam\">$oplatasa zł.</td>
</tr>

<tr>
<td width=\"20 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Wypisy Aktów:</b>
</td>";
$wakt = 'około 200 zł.';
echo "
<td width=\"20 %\" span class=\"polecam\">$wakt</td>
</tr>

<tr>
<td width=\"20 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Suma Opłat Dodatkowych:</b>
</td>";
$wp3 = 200;
$sumaod = $podatekcywilny + $taksanot + $podatekvat + $prow + $oplatasa + $podatekvatp + $wp3;
echo "
<td width=\"20 %\" span class=\"polecam\">$sumaod zł.</td>
</tr>

<tr>
<td width=\"20 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Suma:</b>
</td>";
$suma = $cena + $podatekcywilny + $taksanot + $podatekvat + $prow + $oplatasa + $podatekvatp + $wp3;
echo "
<td width=\"20 %\" span class=\"polecam\">$suma zł.</td>
</tr>

</table>";
}



?>
<SCRIPT language=JavaScript type=text/javascript>self.print()</SCRIPT>
</BODY>
</HTML>