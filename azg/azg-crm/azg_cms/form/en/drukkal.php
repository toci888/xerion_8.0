<HTML LANG="pl">
<HEAD>
<META http-equiv="content-type" content="text/html; charset=ISO-8859-2">
<LINK REL="stylesheet" HREF="azg.css">
<TITLE>"REAL ESTATE AGENCY IN OPOLE - A.Z.GWARANCJA"</TITLE>

</HEAD>

<BODY bgcolor='white' marginheight="0" marginwidth="0" topmargin="0" leftmargin="0">

<center>
<table width=100% cellpadding=0 cellspacing=0 frame border=0>
<tr>
	<td colspan = 4 height=5 ></td>
</tr>

<tr>
<td width=23% order=0 align=left rowspan = 3>

<img src=logom.jpg width=181 height=90 border=0></img>

</td>

<td width=77% border=0 align=right colspan = 5>
<span class=tytulna><b>
REAL ESTATE AGENCY IN OPOLE - A.Z.GWARANCJA
</span>
</td>
</tr>

<tr>

<td height=5 width=25% border=0 align=right>
<span class=tytul><b>
<u>THE FIRM:</u><br>
st. Szarych Szeregów 34 d,<br>
45-285 Opole<br>
tel./fax.(077)402-75-20,<br>
</b>
</span>
</td>

<td width=1% height=100% align=right><img src=black.gif width=1 height=100% border=0></td>

<td height=5 width=25% border=0 align=right>
<span class=tytul><b>
<u>AGENCY Nr 1:</u><br>
st. Bytnara Rudego 13,<br>
45-265 Opole<br>
tel./fax.(077)458-00-94, <br>
</b>
</span>
</td>

<td width=1% height=100% align=right><img src=black.gif width=1 height=100% border=0></td>


<td height=5 width=25% border=0 align=right>
<span class=tytul><b>
<u>AGENCY Nr 2:</u><br>
st. Sosnkowskiego 40-42,<br>
45-284 Opole<br>
tel./fax.(077)457-96-99<br>
</b>
</span>
</td>

</tr>
<tr>
<td width=100% border=0 align=right colspan = 5>
<span class=tytulna><b>
mobile 0602-531-334, wwww: www.azg.pl, e-mail: azgwarancja@azg.pl
</b>
</span>
</td>

</tr>

	<tr>
	<td colspan = 6><img src=black.gif width=100% height=3 border=0></td>
	</tr>

</table>
</center>
<br>

<?

include "../concfg.inc";


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
$cena zł.
</td>
</tr>

<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>TAX:</b>
</td>";
$podatekcywilny = $cena * 0.02;
echo "
<td width=\"20 %\" span class=\"polecam\">$podatekcywilny zł.</td>
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
<td width=\"20 %\" span class=\"polecam\">$taksanot zł.</td>
</tr>

<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Vat tax of notarized tax:</b>
</td>";
$podatekvat = $taksanot * 0.22;
echo "
<td width=\"20 %\" span class=\"polecam\">$podatekvat zł.</td>
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
<td width=\"20 %\" span class=\"polecam\">$prow zł.</td>
</tr>

<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Vat tax of agency commission value:</b>
</td>";
$podatekvatp = $prow * 0.22;
echo "
<td width=\"20 %\" span class=\"polecam\">$podatekvatp zł.</td>
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
$wakt = 'around 200 zł.';
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
<td width=\"20 %\" span class=\"polecam\">$sumaod zł.</td>
</tr>

<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Amount:</b>
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
<b>RESULT OF FEES<br>
HOUSING ASSOCIATION FLAT<br>
WITH THE REAL ESTATE REGISTER<br><br></b></span>

<table width=\"70 %\" border frame = \"box\">
<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Price of the property: </b>
</td>
<td width=\"20 %\" span class=\"polecam\">
$cena zł.
</td>
</tr>

<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>TAX:</b>
</td>";
$podatekcywilny = $cena * 0.02;
echo "
<td width=\"20 %\" span class=\"polecam\">$podatekcywilny zł.</td>
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
<td width=\"20 %\" span class=\"polecam\">$taksanot zł.</td>
</tr>

<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Vat tax of notarized tax:</b>
</td>";
$podatekvat = $taksanot * 0.22;
echo "
<td width=\"20 %\" span class=\"polecam\">$podatekvat zł.</td>
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
<td width=\"20 %\" span class=\"polecam\">$prow zł.</td>
</tr>

<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Vat tax of agency commission value:</b>
</td>";
$podatekvatp = $prow * 0.22;
echo "
<td width=\"20 %\" span class=\"polecam\">$podatekvatp zł.</td>
</tr>

<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Court Fee:</b>
</td>";

$oplatasa = 200;


echo "
<td width=\"20 %\" span class=\"polecam\">$oplatasa zł.</td>
</tr>

<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Extracts of Acts:</b>
</td>";
$wakt = 'around 200 zł.';
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
<td width=\"20 %\" span class=\"polecam\">$sumaod zł.</td>
</tr>

<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Amount:</b>
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
<b>RESULT OF FEES<br>
OWNER - OCCUPIED FLAT, HOUSE, PLOT<br><br></b></span>

<table width=\"70 %\" border frame = \"box\">
<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Price of the property: </b>
</td>
<td width=\"20 %\" span class=\"polecam\">
$cena zł.
</td>
</tr>

<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>TAX:</b>
</td>";
$podatekcywilny = $cena * 0.02;
echo "
<td width=\"20 %\" span class=\"polecam\">$podatekcywilny zł.</td>
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
<td width=\"20 %\" span class=\"polecam\">$taksanot zł.</td>
</tr>

<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Vat tax of notarized tax:</b>
</td>";
$podatekvat = $taksanot * 0.22;
echo "
<td width=\"20 %\" span class=\"polecam\">$podatekvat zł.</td>
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
<td width=\"20 %\" span class=\"polecam\">$prow zł.</td>
</tr>

<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Vat tax of agency commission value:</b>
</td>";
$podatekvatp = $prow * 0.22;
echo "
<td width=\"20 %\" span class=\"polecam\">$podatekvatp zł.</td>
</tr>

<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Court Fee:</b>
</td>";

$oplatasa = 200;

echo "
<td width=\"20 %\" span class=\"polecam\">$oplatasa zł.</td>
</tr>

<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Extracts of Acts:</b>
</td>";
$wakt = 'around 200 zł.';
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
<td width=\"20 %\" span class=\"polecam\">$sumaod zł.</td>
</tr>

<tr>
<td width=\"50 %\" span class=\"polecam\" align = \"right\" bgColor=\"#e7e7e7\">
<b>Amount:</b>
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