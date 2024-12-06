<?
$identbiura = "1";
	
$conn = pg_connect ("host=10.1.0.223 user=azg password=grrrBONNN23 dbname=nierazg");

$nowdate = date("Y-m-d");

$sql1 = "select id_m, no_m, lok_m, lok_w, lok_p, lp_m, powuzyt_m, np_m, wys_cz_m, cz_prze_m, std, cm_m2, cm_m, zd1, zd2, wyl_m from tab_mie_w where datawp_m = '$nowdate' and id_b = '$identbiura';";

			$results1 = @pg_Exec($conn, $sql1);
			$rows1 = pg_NumRows($results1);		// liczba zwroconych wierszy
			
						
	for ($i=0; $i < $rows1; $i++) {

		$id1 = pg_result($results1, $i, "id_m");
		$numofe1 = pg_result($results1, $i, "no_m");
		$lok1 = pg_result($results1, $i, "lok_m");
		$lokw1 = pg_result($results1, $i, "lok_w");
		$lokp1 = pg_result($results1, $i, "lok_p");
		$lp1 = pg_result($results1, $i, "lp_m");
		$powuzyt1 = pg_result($results1, $i, "powuzyt_m");
		$np1 = pg_result($results1, $i, "np_m");
		$wys1 = pg_result($results1, $i, "wys_cz_m");
		$cza1 = pg_result($results1, $i, "cz_prze_m");
		$std1 = pg_result($results1, $i, "std");
		$cenm1 = pg_result($results1, $i, "cm_m2");
		$cena1 = pg_result($results1, $i, "cm_m");
		$zdj1 = pg_result($results1, $i, "zd1");
		$zdj2 = pg_result($results1, $i, "zd2");
		$wylacznosc1 = pg_result($results1, $i, "wyl_m");

	$sqlkm = "SELECT id_zg, rodz_zg, rodzn_zg, cena_zg_od, cena_zg_do, email_zg, data_zg FROM sub WHERE rodz_zg  = 'N' and rodzn_zg = 'M' and cena_zg_od  <= '$cena1' and cena_zg_do >= '$cena1' and id_b = '$identbiura';";

			$resultkm = @pg_Exec($conn, $sqlkm);
			$rowskm = pg_NumRows($resultkm);

$cena1 = number_format($cena1,'', '.', '.');			
						
			for ($j=0; $j < $rowskm; $j++) {
					
					$idkmzg = pg_result($resultkm, $j, "id_zg");
					$emailkmzg = pg_result($resultkm, $j, "email_zg");

$toemail = $emailkmzg;

$sqlofe = "SELECT nazwa_b, adres_b, tel_b, fax_b, tel_kom_b, email_b, www_b FROM tab_biur where id_b = '$identbiura';";

	$resultofe = @pg_Exec($conn, $sqlofe);
		
		$nazbiu = pg_result($resultofe, 0, "nazwa_b");
		$adrbiu = pg_result($resultofe, 0, "adres_b");
		$telbiu = pg_result($resultofe, 0, "tel_b");
		$faxbiu = pg_result($resultofe, 0, "fax_b");
		$telkombiu = pg_result($resultofe, 0, "tel_kom_b");
		$emailbiu = pg_result($resultofe, 0, "email_b");
		$wwwbiu = pg_result($resultofe, 0, "www_b");

		$yourname = $nazbiu;
		$subject = "SUBSKRYPCJA BIURA NIERUCHOMOŒCI";
		$youremail = $emailbiu;

$headers  = "MIME-Version: 1.0\n";
	$headers .= "X-Mailer: SYSTEM AZG\n"; 	// mailer
	$headers .= "From: $youremail\n";
	$headers .= "X-Sender: <$youremail>\n"; 
	$headers .= "X-Priority: 3\n"; 				// 1-Urgent message! 2-very 3-normal
	$headers .= "Return-Path: $youremail\n";  		// Return path for errors
	$headers .= "Content-Type: text/html\n";
	$headers .= "Content-Transfer-Encoding: 8bit\n";

$wiec1 = "&nbsp;<b>Link do strony:</b> <a href = http://$wwwbiu/index.php?action=wynajemmzd&nu=$id1>wiêcej ...</a>";

if ($wylacznosc1 == "2") {
$wyl1 = "<center><span class=wyl>WY£¡CZNO¦Æ</span></center>";
}
else {
$wyl1 = "";
}

if ($numofe1 != '0') {
$numofer1 = "&nbsp;<b>Numer oferty:</b> $numofe1<br>";
}
else {
$numofer1 = "";
}

if ($lok1 != '0') {
$lokpo1 = "&nbsp;<b>Lokalizacja:</b> $lok1<br>";
}
else {
$lokpo1 = "";
}

$sqlwojs = "SELECT nazwa_w FROM wojewodztwa where id_w = '$lokw1';";
			
			$resultwojs = @pg_Exec($conn, $sqlwojs);
			$wojns = pg_result($resultwojs, 0, "nazwa_w");

if ($lokw1 != '0') {
$lokwoj1 = "<b>&nbsp;Województwo:</b> $wojns<br>";
}
else {
$lokwoj1 = "";
}

$sqlpowiats = "SELECT nazwa_p FROM powiaty where id_pow = '$lokp1';";
			
			$resultpowiats = @pg_Exec($conn, $sqlpowiats);
			$powiatns = pg_result($resultpowiats, 0, "nazwa_p");

if ($lokp1 != '0') {
$lokpow1 = "&nbsp;<b>Powiat:</b> $powiatns<br>";
}
else {
$lokpow1 = "";
}

if ($lp1 != '0') {
$lpok1 = "&nbsp;<b>Liczba pokoi:</b> $lp1<br>";
}
else {
$lpok1 = "";
}

if ($powuzyt1 != '0') {
$powpo1 = "&nbsp;<b>Pow. u¿ytkowa:</b> $powuzyt1 m2<br>";
}
else {
$powpo1 = "";
}

if (($np1 != '0') || ($np1 > '3')) {
$piepo1 = "&nbsp;<b>Piêtro:</b> $np1<br>";
}
else {
$piepo1 = "";
}

if ($wys1 != '0') {
$wyscz1 = "&nbsp;<b>Czynsz:</b> $wys1 z³.<br>";
}
else {
$wyscz1 = "";
}

$sqlczasps = "SELECT nazwa_prz FROM czas_prz where id = '$cza1';";
			
			$resultczasps = @pg_Exec($conn, $sqlczasps);
			$czasps = pg_result($resultczasps, 0, "nazwa_prz");

if ($cza1 != '0') {
$czas1 = "&nbsp;<b>Czas przekazania:</b> $czasps<br>";
}
else {
$czas1 = "";
}

$sqlstands = "SELECT nazwa_stan FROM standard where id = '$std1';";
			
			$resultstands = @pg_Exec($conn, $sqlstands);
			$standps = pg_result($resultstands, 0, "nazwa_stan");

if ($std1 != '0') {
$stan1 = "&nbsp;<b>Standard:</b> $standps<br>";
}
else {
$stan1 = "";
}

if ($cenm1 != '0') {
$cename1 = "&nbsp;<b>Dodatkowe op³aty:</b> $cenm1<br>";
}
else {
$cename1 = "";
}

if ($cena1 != '0') {
$cenpo1 = "&nbsp;<b>Cena:</b> $cena1 z³.<br>";
}
else {
$cenpo1 = "";
}

if ($zdj1 == 0) {

$zdjecie1 = "
<td>
	
</td>";

}
else {

$zdjecie1 = "

<td width=128 height=70>
	<center>
	<a href = http://$wwwbiu/index.php?action=wynajemmzd&nu=$id1>
	<img src=http://$wwwbiu/img/zd$zdj1.jpg width=125 height=100 border=0 alt=Zdjêcie nr$zdj1></img></a><br>
	</center>
</td>";

}


if ($zdj2 == 0) {

$zdjecie2 = "
<td>
	
</td>";
	
}
else {
$zdjecie2 = "
<td width=128 height=70>
	<center>
	<a href = http://$wwwbiu/index.php?action=wynajemmzd&nu=$id1>
	<img src=http://$wwwbiu/img/zd$zdj2.jpg width=125 height=100 border=0 alt=Zdjêcie nr$zdj2></img></a><br>
	</center>
</td>";

}


$tresc = "
<HTML LANG=pl>
<HEAD>
<META http-equiv=content-type content=text/html; charset=ISO-8859-2>
<META HTTP-EQUIV=PRAGMA CONTENT=NO-CACHE>
<META HTTP-EQUIV=Creation-date CONTENT=2004-11-26T09:47:05Z>
<META HTTP-EQUIV=Author CONTENT=gambl@azg.pl>
<META NAME=keywords LANG=pl>
<META NAME=copright CONTENT=&copy;2004>
<LINK REL=stylesheet HREF=http://www.azg.pl/form/azgf.css>
</HEAD>
<BODY marginheight=0 marginwidth=0 topmargin=0 leftmargin=0>


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
BIURO NIERUCHOMO¦CI A.Z.GWARANCJA<br>
</span>
</td>
</tr>

<tr>
<td height=5 width=30% border=0 align=right>
<span class=tytul><b>
ul. Sosnkowskiego 40-42, 45-284 Opole<br>
tel./fax. (077) 457-96-99<br>
</b>
</span>
</td>

<td width=2% height=100% align=right><img src=http://www.azg.pl/form/black.gif width=1 height=100% border=0></td>

<td height=5 width=28% border=0 align=right>
<span class=tytul><b>
ul. Bytnara Rudego 13, 45-265 Opole<br>
tel./fax. (077) 458-00-94, 0602-531-334<br>
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
<table width=100% cellpadding=0 cellspacing=0 frame border=0 valign=center>
<tr><td><img src=http://www.azg.pl/form/black.gif width=100% height=1 border=0></td></tr>
<tr valign=center>
<td height=7 bgcolor=#5865E5 colspan=3>
<center>
<span class=nag1wbe>
OFERTA WYNAJMU MIESZKANIA
</span>
</center>
</td>
</tr>
<tr><td><img src=http://www.azg.pl/form/black.gif width=100% height=1 border=0></td></tr>
</table>
<table cellpadding=0 cellspacing=0 frame border=0 valign=center>
<tr>
<td width=261 align = left>
$wyl1
<br>
$numofer1
$lokpo1
$lokwoj1
$lokpow1
$lpok1
$powpo1
$piepo1
$wyscz1
$czas1
$stan1
$cename1
$cenpo1
$wiec1
</td>
$zdjecie1
$zdjecie2

</tr>

</table>
</BODY>
</HTML>
";

mail($toemail,$subject,$tresc,$headers);

	}
			
}


$sql2 = "select id_d, no_d, lok_d, lok_w, lok_p, rof_d, powdzi_d, powuzyt_d, wysop_d, cz_prze_d, std_d, cm2_d, cd, zd1, zd2, wyl_d from tab_dom_w where datawp_d = '$nowdate' and id_b = '$identbiura';";

$result_set2 = pg_Exec($conn, $sql2);
$rows2 = pg_NumRows($result_set2);		// liczba zwroconych wierszy

	for ($j=0; $j < $rows2; $j++) {
		$id1d = pg_result($result_set2, $j, "id_d");
		$numofe1d = pg_result($result_set2, $j, "no_d");
		$lok1d = pg_result($result_set2, $j, "lok_d");
		$lokw1d = pg_result($result_set2, $j, "lok_w");
		$lokp1d = pg_result($result_set2, $j, "lok_p");
		$rofd1d = pg_result($result_set2, $j, "rof_d");
		$powdzia1d = pg_result($result_set2, $j, "powdzi_d");
		$powuzyt1d = pg_result($result_set2, $j, "powuzyt_d");
		$wys1d = pg_result($result_set2, $j, "wysop_d");
		$cza1d = pg_result($result_set2, $j, "cz_prze_d");
		$std1d = pg_result($result_set2, $j, "std_d");
		$cenm1d = pg_result($result_set2, $j, "cm2_d");
		$cena1d = pg_result($result_set2, $j, "cd");
		$zdj1d = pg_result($result_set2, $j, "zd1");
		$zdj2d = pg_result($result_set2, $j, "zd2");
		$wylacznosc1d = pg_result($result_set2, $j, "wyl_d");

							
	$sqlkd = "SELECT id_zg, rodz_zg, rodzn_zg, cena_zg_od, cena_zg_do, email_zg, data_zg FROM sub WHERE rodz_zg  = 'N' and rodzn_zg = 'D' and cena_zg_od  <= '$cena1d' and cena_zg_do >= '$cena1d' and id_b = '$identbiura';";

			$resultkd = @pg_Exec($conn, $sqlkd);
			$rowskd = pg_NumRows($resultkd);

$cena1d = number_format($cena1d,'', '.', '.');			
						
			for ($k=0; $k < $rowskd; $k++) {
					
					$idkdzg = pg_result($resultkd, $k, "id_zg");
					$emailkdzg = pg_result($resultkd, $k, "email_zg");

$toemaild = $emailkdzg;

$sqlofe = "SELECT nazwa_b, adres_b, tel_b, fax_b, tel_kom_b, email_b, www_b FROM tab_biur where id_b = '$identbiura';";

	$resultofe = @pg_Exec($conn, $sqlofe);
		
		$nazbiu = pg_result($resultofe, 0, "nazwa_b");
		$adrbiu = pg_result($resultofe, 0, "adres_b");
		$telbiu = pg_result($resultofe, 0, "tel_b");
		$faxbiu = pg_result($resultofe, 0, "fax_b");
		$telkombiu = pg_result($resultofe, 0, "tel_kom_b");
		$emailbiu = pg_result($resultofe, 0, "email_b");
		$wwwbiu = pg_result($resultofe, 0, "www_b");

		$yournamed = $nazbiu;
		$subjectd = "SUBSKRYPCJA BIURA NIERUCHOMOŒCI";
		$youremaild = $emailbiu;

$headers  = "MIME-Version: 1.0\n";
	$headers .= "X-Mailer: SYSTEM AZG\n"; 	// mailer
	$headers .= "From: $youremail\n";
	$headers .= "X-Sender: <$youremail>\n"; 
	$headers .= "X-Priority: 3\n"; 				// 1-Urgent message! 2-very 3-normal
	$headers .= "Return-Path: $youremail\n";  		// Return path for errors
	$headers .= "Content-Type: text/html\n";
	$headers .= "Content-Transfer-Encoding: 8bit\n";

$wiec1d = "&nbsp;<b>Link do strony:</b> <a href = http://$wwwbiu/index.php?action=wynajemdzd&nu=$id1d>wiêcej ...</a>";

if ($wylacznosc1d == "2") {
$wyl1d = "<center><span class=wyl>WY£¡CZNO¦Æ</span></center>";
}
else {
$wyl1d = "";
}

if ($numofe1d != '0') {
$numofer1d = "&nbsp;<b>Numer oferty:</b> $numofe1d<br>";
}
else {
$numofer1d = "";
}

if ($lok1d != '0') {
$lokpo1d = "&nbsp;<b>Lokalizacja:</b> $lok1d<br>";
}
else {
$lokpo1d = "";
}

$sqlwojsd = "SELECT nazwa_w FROM wojewodztwa where id_w = '$lokw1d';";
			
			$resultwojsd = @pg_Exec($conn, $sqlwojsd);
			$wojnsd = pg_result($resultwojsd, 0, "nazwa_w");

if ($lokw1d != '0') {
$lokwoj1d = "<b>&nbsp;Województwo:</b> $wojnsd<br>";
}
else {
$lokwoj1d = "";
}

$sqlpowiatsd = "SELECT nazwa_p FROM powiaty where id_pow = '$lokp1d';";
			
			$resultpowiatsd = @pg_Exec($conn, $sqlpowiatsd);
			$powiatnsd = pg_result($resultpowiatsd, 0, "nazwa_p");

if ($lokp1d != '0') {
$lokpow1d = "&nbsp;<b>Powiat:</b> $powiatnsd<br>";
}
else {
$lokpow1d = "";
}

$sqlprofsd = "SELECT rodzaj_of FROM rodzaj_of where id = '$rofd1d';";
			
			$resultprofsd = @pg_Exec($conn, $sqlprofsd);
			$profnsd = pg_result($resultprofsd, 0, "rodzaj_of");

if ($rofd1d != '0') {
$rofdo1d = "&nbsp;<b>Rodzaj Domu:</b> $profnsd<br>";
}
else {
$rofdo1d = "";
}


if ($powuzyt1d != '0') {
$powpo1d = "&nbsp;<b>Pow. u¿ytkowa:</b> $powuzyt1d m2<br>";
}
else {
$powpo1d = "";
}

if ($powdzia1d != '0') {
$powdzial1d = "&nbsp;<b>Pow. dzia³ki:</b> $powdzia1d ar<br>";
}
else {
$powdzial1d = "";
}

if ($wys1d != '0') {
$wyscz1d = "&nbsp;<b>Op³aty:</b> $wys1d z³.<br>";
}
else {
$wyscz1d = "";
}

$sqlczaspsd = "SELECT nazwa_prz FROM czas_prz where id = '$cza1d';";
			
			$resultczaspsd = @pg_Exec($conn, $sqlczaspsd);
			$czaspsd = pg_result($resultczaspsd, 0, "nazwa_prz");

if ($cza1d != '0') {
$czas1d = "&nbsp;<b>Czas przekazania:</b> $czaspsd<br>";
}
else {
$czas1d = "";
}

$sqlstandsd = "SELECT nazwa_stan FROM standard where id = '$std1d';";
			
			$resultstandsd = @pg_Exec($conn, $sqlstandsd);
			$standpsd = pg_result($resultstandsd, 0, "nazwa_stan");

if ($std1d != '0') {
$stan1d = "&nbsp;<b>Standard:</b> $standpsd<br>";
}
else {
$stan1d = "";
}

if ($cenm1d != '0') {
$cename1d = "&nbsp;<b>Dodatkowe op³aty:</b> $cenm1d<br>";
}
else {
$cename1d = "";
}


if ($cena1d != '0') {
$cenpo1d = "&nbsp;<b>Cena:</b> $cena1d z³.<br>";
}
else {
$cenpo1d = "";
}

if ($zdj1d == 0) {

$zdjecie1d = "
<td>
	
</td>";

}
else {

$zdjecie1d = "

<td width=128 height=70>
	<center>
	<a href = http://$wwwbiu/index.php?action=wynajemdzd&nu=$id1d>
	<img src=http://$wwwbiu/img/zd$zdj1d.jpg width=125 height=100 border=0 alt=Zdjêcie nr$zdj1d></img></a><br>
	</center>
</td>";

}


if ($zdj2d == 0) {

$zdjecie2d = "
<td>
	
</td>";
	
}
else {
$zdjecie2d = "
<td width=128 height=70>
	<center>
	<a href = http://$wwwbiu/index.php?action=wynajemdzd&nu=$id1d>
	<img src=http://$wwwbiu/img/zd$zdj2d.jpg width=125 height=100 border=0 alt=Zdjêcie nr$zdj2d></img></a><br>
	</center>
</td>";

}


$trescd = "
<HTML LANG=pl>
<HEAD>
<META http-equiv=content-type content=text/html; charset=ISO-8859-2>
<META HTTP-EQUIV=PRAGMA CONTENT=NO-CACHE>
<META HTTP-EQUIV=Creation-date CONTENT=2004-11-26T09:47:05Z>
<META HTTP-EQUIV=Author CONTENT=gambl@azg.pl>
<META NAME=keywords LANG=pl>
<META NAME=copright CONTENT=&copy;2004>
<LINK REL=stylesheet HREF=http://www.azg.pl/form/azgf.css>
</HEAD>
<BODY marginheight=0 marginwidth=0 topmargin=0 leftmargin=0>


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
BIURO NIERUCHOMO¦CI A.Z.GWARANCJA<br>
</span>
</td>
</tr>

<tr>
<td height=5 width=30% border=0 align=right>
<span class=tytul><b>
ul. Sosnkowskiego 40-42, 45-284 Opole<br>
tel./fax. (077) 457-96-99<br>
</b>
</span>
</td>

<td width=2% height=100% align=right><img src=http://www.azg.pl/form/black.gif width=1 height=100% border=0></td>

<td height=5 width=28% border=0 align=right>
<span class=tytul><b>
ul. Bytnara Rudego 13, 45-265 Opole<br>
tel./fax. (077) 458-00-94, 0602-531-334<br>
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
<table width=100% cellpadding=0 cellspacing=0 frame border=0 valign=center>
<tr><td><img src=http://www.azg.pl/form/black.gif width=100% height=1 border=0></td></tr>
<tr valign=center>
<td height=7 bgcolor=#5865E5 colspan=3>
<center>
<span class=nag1wbe>
OFERTA WYNAJMU DOMU
</span>
</center>
</td>
</tr>
<tr><td><img src=http://www.azg.pl/form/black.gif width=100% height=1 border=0></td></tr>
</table>
<table cellpadding=0 cellspacing=0 frame border=0 valign=center>
<tr>
<td width=261 align = left>
$wyl1d
<br>
$numofer1d
$rofdo1d
$lokpo1d
$lokwoj1d
$lokpow1d
$powpo1d
$powdzial1d
$wyscz1d
$czas1d
$stan1d
$cename1d
$cenpo1d
$wiec1d
</td>
$zdjecie1d
$zdjecie2d

</tr>

</table>
</BODY>
</HTML>
";

mail($toemaild,$subjectd,$trescd,$headers);

	}
			
}



$sql3 = "select id_d, no_d, lok_d, lok_w, lok_p, rof_d, powdzi_d, powuzyt_d, wysop_d, cz_prze_d, std_d, cm2_d, cd, zd1, zd2, wyl_d from tab_lok_w where datawp_d = '$nowdate' and id_b = '$identbiura';";

$result_set3 = pg_Exec($conn, $sql3);
$rows3 = pg_NumRows($result_set3);		// liczba zwroconych wierszy

	for ($a=0; $a < $rows3; $a++) {
		$id1l = pg_result($result_set3, $a, "id_d");
		$numofe1l = pg_result($result_set3, $a, "no_d");
		$lok1l = pg_result($result_set3, $a, "lok_d");
		$lokw1l = pg_result($result_set3, $a, "lok_w");
		$lokp1l = pg_result($result_set3, $a, "lok_p");
		$rofd1l = pg_result($result_set3, $a, "rof_d");
		$powdzia1l = pg_result($result_set3, $a, "powdzi_d");
		$powuzyt1l = pg_result($result_set3, $a, "powuzyt_d");
		$wys1l = pg_result($result_set3, $a, "wysop_d");
		$cza1l = pg_result($result_set3, $a, "cz_prze_d");
		$std1l = pg_result($result_set3, $a, "std_d");
		$cenm1l = pg_result($result_set3, $a, "cm2_d");
		$cena1l = pg_result($result_set3, $a, "cd");
		$zdj1l = pg_result($result_set3, $a, "zd1");
		$zdj2l = pg_result($result_set3, $a, "zd2");
		$wylacznosc1l = pg_result($result_set3, $a, "wyl_d");

							
	$sqlkl = "SELECT id_zg, rodz_zg, rodzn_zg, cena_zg_od, cena_zg_do, email_zg, data_zg FROM sub WHERE rodz_zg  = 'N' and rodzn_zg = 'L' and cena_zg_od  <= '$cena1l' and cena_zg_do >= '$cena1l' and id_b = '$identbiura';";

			$resultkl = @pg_Exec($conn, $sqlkl);
			$rowskl = pg_NumRows($resultkl);

$cena1l = number_format($cena1l,'', '.', '.');			
						
			for ($c=0; $c < $rowskl; $c++) {
					
					$idklzg = pg_result($resultkl, $c, "id_zg");
					$emailklzg = pg_result($resultkl, $c, "email_zg");

$toemaill = $emailklzg;

$sqlofe = "SELECT nazwa_b, adres_b, tel_b, fax_b, tel_kom_b, email_b, www_b FROM tab_biur where id_b = '$identbiura';";

	$resultofe = @pg_Exec($conn, $sqlofe);
		
		$nazbiu = pg_result($resultofe, 0, "nazwa_b");
		$adrbiu = pg_result($resultofe, 0, "adres_b");
		$telbiu = pg_result($resultofe, 0, "tel_b");
		$faxbiu = pg_result($resultofe, 0, "fax_b");
		$telkombiu = pg_result($resultofe, 0, "tel_kom_b");
		$emailbiu = pg_result($resultofe, 0, "email_b");
		$wwwbiu = pg_result($resultofe, 0, "www_b");

		$yournamel = $nazbiu;
		$subjectl = "SUBSKRYPCJA BIURA NIERUCHOMOŒCI";
		$youremaill = $emailbiu;

$headers  = "MIME-Version: 1.0\n";
	$headers .= "X-Mailer: SYSTEM AZG\n"; 	// mailer
	$headers .= "From: $youremail\n";
	$headers .= "X-Sender: <$youremail>\n"; 
	$headers .= "X-Priority: 3\n"; 				// 1-Urgent message! 2-very 3-normal
	$headers .= "Return-Path: $youremail\n";  		// Return path for errors
	$headers .= "Content-Type: text/html\n";
	$headers .= "Content-Transfer-Encoding: 8bit\n";

$wiec1l = "&nbsp;<b>Link do strony:</b> <a href = http://$wwwbiu/index.php?action=wynajemlzd&nu=$id1l>wiêcej ...</a>";

if ($wylacznosc1l == "2") {
$wyl1l = "<center><span class=wyl>WY£¡CZNO¦Æ</span></center>";
}
else {
$wyl1l = "";
}

if ($numofe1l != '0') {
$numofer1l = "&nbsp;<b>Numer oferty:</b> $numofe1l<br>";
}
else {
$numofer1l = "";
}

if ($lok1l != '0') {
$lokpo1l = "&nbsp;<b>Lokalizacja:</b> $lok1l<br>";
}
else {
$lokpo1l = "";
}

$sqlwojsl = "SELECT nazwa_w FROM wojewodztwa where id_w = '$lokw1l';";
			
			$resultwojsl = @pg_Exec($conn, $sqlwojsl);
			$wojnsl = pg_result($resultwojsl, 0, "nazwa_w");

if ($lokw1l != '0') {
$lokwoj1l = "<b>&nbsp;Województwo:</b> $wojnsl<br>";
}
else {
$lokwoj1l = "";
}

$sqlpowiatsl = "SELECT nazwa_p FROM powiaty where id_pow = '$lokp1l';";
			
			$resultpowiatsl = @pg_Exec($conn, $sqlpowiatsl);
			$powiatnsl = pg_result($resultpowiatsl, 0, "nazwa_p");

if ($lokp1l != '0') {
$lokpow1l = "&nbsp;<b>Powiat:</b> $powiatnsl<br>";
}
else {
$lokpow1l = "";
}

$sqlprofsl = "SELECT rodzaj_of FROM rodzaj_of where id = '$rofd1l';";
			
			$resultprofsl = @pg_Exec($conn, $sqlprofsl);
			$profnsl = pg_result($resultprofsl, 0, "rodzaj_of");

if ($rofd1l != '0') {
$rofdo1l = "&nbsp;<b>Rodzaj Lokalu:</b> $profnsl<br>";
}
else {
$rofdo1l = "";
}


if ($powuzyt1l != '0') {
$powpo1l = "&nbsp;<b>Pow. u¿ytkowa:</b> $powuzyt1l m2<br>";
}
else {
$powpo1l = "";
}

if ($powdzia1l != '0') {
$powdzial1l = "&nbsp;<b>Pow. dzia³ki:</b> $powdzia1l ar<br>";
}
else {
$powdzial1l = "";
}

if ($wys1l != '0') {
$wyscz1l = "&nbsp;<b>Op³aty:</b> $wys1l z³.<br>";
}
else {
$wyscz1l = "";
}

$sqlczaspsl = "SELECT nazwa_prz FROM czas_prz where id = '$cza1l';";
			
			$resultczaspsl = @pg_Exec($conn, $sqlczaspsl);
			$czaspsl = pg_result($resultczaspsl, 0, "nazwa_prz");

if ($cza1l != '0') {
$czas1l = "&nbsp;<b>Czas przekazania:</b> $czaspsl<br>";
}
else {
$czas1l = "";
}

$sqlstandsl = "SELECT nazwa_stan FROM standard where id = '$std1l';";
			
			$resultstandsl = @pg_Exec($conn, $sqlstandsl);
			$standpsl = pg_result($resultstandsl, 0, "nazwa_stan");

if ($std1l != '0') {
$stan1l = "&nbsp;<b>Standard:</b> $standpsl<br>";
}
else {
$stan1l = "";
}

if ($cenm1l != '0') {
$cename1l = "&nbsp;<b>Dodatkowe op³aty:</b> $cenm1l<br>";
}
else {
$cename1l = "";
}


if ($cena1l != '0') {
$cenpo1l = "&nbsp;<b>Cena:</b> $cena1l z³.<br>";
}
else {
$cenpo1l = "";
}

if ($zdj1l == 0) {

$zdjecie1l = "
<td>
	
</td>";

}
else {

$zdjecie1l = "

<td width=128 height=70>
	<center>
	<a href = http://$wwwbiu/index.php?action=wynajemlzd&nu=$id1l>
	<img src=http://$wwwbiu/img/zd$zdj1l.jpg width=125 height=100 border=0 alt=Zdjêcie nr$zdj1l></img></a><br>
	</center>
</td>";

}


if ($zdj2l == 0) {

$zdjecie2l = "
<td>
	
</td>";
	
}
else {
$zdjecie2l = "
<td width=128 height=70>
	<center>
	<a href = http://$wwwbiu/index.php?action=wynajemlzd&nu=$id1l>
	<img src=http://$wwwbiu/img/zd$zdj2l.jpg width=125 height=100 border=0 alt=Zdjêcie nr$zdj2l></img></a><br>
	</center>
</td>";

}


$trescl = "
<HTML LANG=pl>
<HEAD>
<META http-equiv=content-type content=text/html; charset=ISO-8859-2>
<META HTTP-EQUIV=PRAGMA CONTENT=NO-CACHE>
<META HTTP-EQUIV=Creation-date CONTENT=2004-11-26T09:47:05Z>
<META HTTP-EQUIV=Author CONTENT=gambl@azg.pl>
<META NAME=keywords LANG=pl>
<META NAME=copright CONTENT=&copy;2004>
<LINK REL=stylesheet HREF=http://www.azg.pl/form/azgf.css>
</HEAD>
<BODY marginheight=0 marginwidth=0 topmargin=0 leftmargin=0>


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
BIURO NIERUCHOMO¦CI A.Z.GWARANCJA<br>
</span>
</td>
</tr>

<tr>
<td height=5 width=30% border=0 align=right>
<span class=tytul><b>
ul. Sosnkowskiego 40-42, 45-284 Opole<br>
tel./fax. (077) 457-96-99<br>
</b>
</span>
</td>

<td width=2% height=100% align=right><img src=http://www.azg.pl/form/black.gif width=1 height=100% border=0></td>

<td height=5 width=28% border=0 align=right>
<span class=tytul><b>
ul. Bytnara Rudego 13, 45-265 Opole<br>
tel./fax. (077) 458-00-94, 0602-531-334<br>
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
<table width=100% cellpadding=0 cellspacing=0 frame border=0 valign=center>
<tr><td><img src=http://www.azg.pl/form/black.gif width=100% height=1 border=0></td></tr>
<tr valign=center>
<td height=7 bgcolor=#5865E5 colspan=3>
<center>
<span class=nag1wbe>
OFERTA WYNAJMU LOKALU
</span>
</center>
</td>
</tr>
<tr><td><img src=http://www.azg.pl/form/black.gif width=100% height=1 border=0></td></tr>
</table>
<table cellpadding=0 cellspacing=0 frame border=0 valign=center>
<tr>
<td width=261 align = left>
$wyl1l
<br>
$numofer1l
$rofdo1l
$lokpo1l
$lokwoj1l
$lokpow1l
$powpo1l
$powdzial1l
$wyscz1l
$czas1l
$stan1l
$cename1l
$cenpo1l
$wiec1l
</td>
$zdjecie1l
$zdjecie2l

</tr>

</table>
</BODY>
</HTML>
";

mail($toemaill,$subjectl,$trescl,$headers);

	}
			
}


$sql4 = "select id_d, no_d, lok_d, lok_w, lok_p, rof_d, powdzi_d, powuzyt_d, wysop_d, cz_prze_d, std_d, cm2_d, cd, zd1, zd2, wyl_d from tab_obi_w where datawp_d = '$nowdate' and id_b = '$identbiura';";

$result_set4 = pg_Exec($conn, $sql4);
$rows4 = pg_NumRows($result_set4);		// liczba zwroconych wierszy

	for ($c=0; $c < $rows4; $c++) {
		$id1o = pg_result($result_set4, $c, "id_d");
		$numofe1o = pg_result($result_set4, $c, "no_d");
		$lok1o = pg_result($result_set4, $c, "lok_d");
		$lokw1o = pg_result($result_set4, $c, "lok_w");
		$lokp1o = pg_result($result_set4, $c, "lok_p");
		$rofd1o = pg_result($result_set4, $c, "rof_d");
		$powdzia1o = pg_result($result_set4, $c, "powdzi_d");
		$powuzyt1o = pg_result($result_set4, $c, "powuzyt_d");
		$wys1o = pg_result($result_set4, $c, "wysop_d");
		$cza1o = pg_result($result_set4, $c, "cz_prze_d");
		$std1o = pg_result($result_set4, $c, "std_d");
		$cenm1o = pg_result($result_set4, $c, "cm2_d");
		$cena1o = pg_result($result_set4, $c, "cd");
		$zdj1o = pg_result($result_set4, $c, "zd1");
		$zdj2o = pg_result($result_set4, $c, "zd2");
		$wylacznosc1o = pg_result($result_set4, $c, "wyl_d");

							
	$sqlko = "SELECT id_zg, rodz_zg, rodzn_zg, cena_zg_od, cena_zg_do, email_zg, data_zg FROM sub WHERE rodz_zg  = 'N' and rodzn_zg = 'O' and cena_zg_od  <= '$cena1o' and cena_zg_do >= '$cena1o' and id_b = '$identbiura';";

			$resultko = @pg_Exec($conn, $sqlko);
			$rowsko = pg_NumRows($resultko);

$cena1o = number_format($cena1o,'', '.', '.');			
						
			for ($d=0; $d < $rowsko; $d++) {
					
					$idkozg = pg_result($resultko, $d, "id_zg");
					$emailkozg = pg_result($resultko, $d, "email_zg");

$toemailo = $emailkozg;

$sqlofe = "SELECT nazwa_b, adres_b, tel_b, fax_b, tel_kom_b, email_b, www_b FROM tab_biur where id_b = '$identbiura';";

	$resultofe = @pg_Exec($conn, $sqlofe);
		
		$nazbiu = pg_result($resultofe, 0, "nazwa_b");
		$adrbiu = pg_result($resultofe, 0, "adres_b");
		$telbiu = pg_result($resultofe, 0, "tel_b");
		$faxbiu = pg_result($resultofe, 0, "fax_b");
		$telkombiu = pg_result($resultofe, 0, "tel_kom_b");
		$emailbiu = pg_result($resultofe, 0, "email_b");
		$wwwbiu = pg_result($resultofe, 0, "www_b");

		$yournamel = $nazbiu;
		$subjecto = "SUBSKRYPCJA BIURA NIERUCHOMOŒCI";
		$youremaill = $emailbiu;

	$headers  = "MIME-Version: 1.0\n";
	$headers .= "X-Mailer: SYSTEM AZG\n"; 	// mailer
	$headers .= "From: $youremail\n";
	$headers .= "X-Sender: <$youremail>\n"; 
	$headers .= "X-Priority: 3\n"; 				// 1-Urgent message! 2-very 3-normal
	$headers .= "Return-Path: $youremail\n";  		// Return path for errors
	$headers .= "Content-Type: text/html\n";
	$headers .= "Content-Transfer-Encoding: 8bit\n";


$wiec1o = "&nbsp;<b>Link do strony:</b> <a href = http://$wwwbiu/index.php?action=wynajemozd&nu=$id1o>wiêcej ...</a>";

if ($wylacznosc1o == "2") {
$wyl1o = "<center><span class=wyl>WY£¡CZNO¦Æ</span></center>";
}
else {
$wyl1o = "";
}

if ($numofe1o != '0') {
$numofer1o = "&nbsp;<b>Numer oferty:</b> $numofe1o<br>";
}
else {
$numofer1o = "";
}

if ($lok1o != '0') {
$lokpo1o = "&nbsp;<b>Lokalizacja:</b> $lok1o<br>";
}
else {
$lokpo1o = "";
}

$sqlwojso = "SELECT nazwa_w FROM wojewodztwa where id_w = '$lokw1o';";
			
			$resultwojso = @pg_Exec($conn, $sqlwojso);
			$wojnso = pg_result($resultwojso, 0, "nazwa_w");

if ($lokw1o != '0') {
$lokwoj1o = "<b>&nbsp;Województwo:</b> $wojnso<br>";
}
else {
$lokwoj1o = "";
}

$sqlpowiatso = "SELECT nazwa_p FROM powiaty where id_pow = '$lokp1o';";
			
			$resultpowiatso = @pg_Exec($conn, $sqlpowiatso);
			$powiatnso = pg_result($resultpowiatso, 0, "nazwa_p");

if ($lokp1o != '0') {
$lokpow1o = "&nbsp;<b>Powiat:</b> $powiatnso<br>";
}
else {
$lokpow1o = "";
}

$sqlprofso = "SELECT rodzaj_of FROM rodzaj_of_obi where id = '$rofd1o';";
			
			$resultprofso = @pg_Exec($conn, $sqlprofso);
			$profnso = pg_result($resultprofso, 0, "rodzaj_of");

if ($rofd1o != '0') {
$rofdo1o = "&nbsp;<b>Rodzaj Obiektu:</b> $profnso<br>";
}
else {
$rofdo1o = "";
}


if ($powuzyt1o != '0') {
$powpo1o = "&nbsp;<b>Pow. u¿ytkowa:</b> $powuzyt1o m2<br>";
}
else {
$powpo1o = "";
}

if ($powdzia1o != '0') {
$powdzial1o = "&nbsp;<b>Pow. dzia³ki:</b> $powdzia1o ar<br>";
}
else {
$powdzial1o = "";
}

if ($wys1o != '0') {
$wyscz1o = "&nbsp;<b>Op³aty:</b> $wys1o z³.<br>";
}
else {
$wyscz1o = "";
}

$sqlczaspso = "SELECT nazwa_prz FROM czas_prz where id = '$cza1o';";
			
			$resultczaspso = @pg_Exec($conn, $sqlczaspso);
			$czaspso = pg_result($resultczaspso, 0, "nazwa_prz");

if ($cza1o != '0') {
$czas1o = "&nbsp;<b>Czas przekazania:</b> $czaspso<br>";
}
else {
$czas1o = "";
}

$sqlstandso = "SELECT nazwa_stan FROM standard where id = '$std1o';";
			
			$resultstandso = @pg_Exec($conn, $sqlstandso);
			$standpso = pg_result($resultstandso, 0, "nazwa_stan");

if ($std1o != '0') {
$stan1o = "&nbsp;<b>Standard:</b> $standpso<br>";
}
else {
$stan1o = "";
}

if ($cenm1o != '0') {
$cename1o = "&nbsp;<b>Dodatkowe op³aty:</b> $cenm1o<br>";
}
else {
$cename1o = "";
}

if ($cena1o != '0') {
$cenpo1o = "&nbsp;<b>Cena:</b> $cena1o z³.<br>";
}
else {
$cenpo1o = "";
}

if ($zdj1o == 0) {

$zdjecie1o = "
<td>
	
</td>";

}
else {

$zdjecie1o = "

<td width=128 height=70>
	<center>
	<a href = http://$wwwbiu/index.php?action=wynajemozd&nu=$id1o>
	<img src=http://$wwwbiu/img/zd$zdj1o.jpg width=125 height=100 border=0 alt=Zdjêcie nr$zdj1o></img></a><br>
	</center>
</td>";

}


if ($zdj2o == 0) {

$zdjecie2o = "
<td>
	
</td>";
	
}
else {
$zdjecie2o = "
<td width=128 height=70>
	<center>
	<a href = http://$wwwbiu/index.php?action=wynajemozd&nu=$id1o>
	<img src=http://$wwwbiu/img/zd$zdj2o.jpg width=125 height=100 border=0 alt=Zdjêcie nr$zdj2o></img></a><br>
	</center>
</td>";

}


$tresco = "
<HTML LANG=pl>
<HEAD>
<META http-equiv=content-type content=text/html; charset=ISO-8859-2>
<META HTTP-EQUIV=PRAGMA CONTENT=NO-CACHE>
<META HTTP-EQUIV=Creation-date CONTENT=2004-11-26T09:47:05Z>
<META HTTP-EQUIV=Author CONTENT=gambl@azg.pl>
<META NAME=keywords LANG=pl>
<META NAME=copright CONTENT=&copy;2004>
<LINK REL=stylesheet HREF=http://www.azg.pl/form/azgf.css>
</HEAD>
<BODY marginheight=0 marginwidth=0 topmargin=0 leftmargin=0>


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
BIURO NIERUCHOMO¦CI A.Z.GWARANCJA<br>
</span>
</td>
</tr>

<tr>
<td height=5 width=30% border=0 align=right>
<span class=tytul><b>
ul. Sosnkowskiego 40-42, 45-284 Opole<br>
tel./fax. (077) 457-96-99<br>
</b>
</span>
</td>

<td width=2% height=100% align=right><img src=http://www.azg.pl/form/black.gif width=1 height=100% border=0></td>

<td height=5 width=28% border=0 align=right>
<span class=tytul><b>
ul. Bytnara Rudego 13, 45-265 Opole<br>
tel./fax. (077) 458-00-94, 0602-531-334<br>
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
<table width=100% cellpadding=0 cellspacing=0 frame border=0 valign=center>
<tr><td><img src=http://www.azg.pl/form/black.gif width=100% height=1 border=0></td></tr>
<tr valign=center>
<td height=7 bgcolor=#5865E5 colspan=3>
<center>
<span class=nag1wbe>
OFERTA WYNAJMU OBIEKTU
</span>
</center>
</td>
</tr>
<tr><td><img src=http://www.azg.pl/form/black.gif width=100% height=1 border=0></td></tr>
</table>
<table cellpadding=0 cellspacing=0 frame border=0 valign=center>
<tr>
<td width=261 align = left>
$wyl1o
<br>
$numofer1o
$rofdo1o
$lokpo1o
$lokwoj1o
$lokpow1o
$powpo1o
$powdzial1o
$wyscz1o
$czas1o
$stan1o
$cename1o
$cenpo1o
$wiec1o
</td>
$zdjecie1o
$zdjecie2o

</tr>

</table>
</BODY>
</HTML>
";

mail($toemailo,$subjecto,$tresco,$headers);

	}
			
}



$sql5 = "select id_d, no_d, lok_d, lok_w, lok_p, rof_d, powdzi_d, wysop_d, cz_prze_d, cm2_d, cd, zd1, zd2, wyl_d from tab_dzi_w  where datawp_d = '$nowdate' and id_b = '$identbiura';;";

$result_set5 = pg_Exec($conn, $sql5);

$rows5 = pg_NumRows($result_set5);		// liczba zwroconych wierszy

	for ($e=0; $e < $rows5; $e++) {

		$id1dz = pg_result($result_set5, $e, "id_d");
		$numofe1dz = pg_result($result_set5, $e, "no_d");
		$lok1dz = pg_result($result_set5, $e, "lok_d");
		$lokw1dz = pg_result($result_set5, $e, "lok_w");
		$lokp1dz = pg_result($result_set5, $e, "lok_p");
		$rofd1dz = pg_result($result_set5, $e, "rof_d");
		$powdzia1dz = pg_result($result_set5, $e, "powdzi_d");
		$wys1dz = pg_result($result_set5, $e, "wysop_d");
		$cza1dz = pg_result($result_set5, $e, "cz_prze_d");
		$cenm1dz = pg_result($result_set5, $e, "cm2_d");
		$cena1dz = pg_result($result_set5, $e, "cd");
		$zdj1dz = pg_result($result_set5, $e, "zd1");
		$zdj2dz = pg_result($result_set5, $e, "zd2");
		$wylacznosc1dz = pg_result($result_set5, $e, "wyl_d");
					
	$sqlkdz = "SELECT id_zg, rodz_zg, rodzn_zg, cena_zg_od, cena_zg_do, email_zg, data_zg FROM sub WHERE rodz_zg  = 'N' and rodzn_zg = 'Dz' and cena_zg_od  <= '$cena1dz' and cena_zg_do >= '$cena1dz' and id_b = '$identbiura';";

			$resultkdz = @pg_Exec($conn, $sqlkdz);
			$rowskdz = pg_NumRows($resultkdz);

$cena1dz = number_format($cena1dz,'', '.', '.');			
						
			for ($f=0; $f < $rowskdz; $f++) {
					
					$idkdzzg = pg_result($resultkdz, $f, "id_zg");
					$emailkdzzg = pg_result($resultkdz, $f, "email_zg");

$toemaildz = $emailkdzzg;

$sqlofe = "SELECT nazwa_b, adres_b, tel_b, fax_b, tel_kom_b, email_b, www_b FROM tab_biur where id_b = '$identbiura';";

	$resultofe = @pg_Exec($conn, $sqlofe);
		
		$nazbiu = pg_result($resultofe, 0, "nazwa_b");
		$adrbiu = pg_result($resultofe, 0, "adres_b");
		$telbiu = pg_result($resultofe, 0, "tel_b");
		$faxbiu = pg_result($resultofe, 0, "fax_b");
		$telkombiu = pg_result($resultofe, 0, "tel_kom_b");
		$emailbiu = pg_result($resultofe, 0, "email_b");
		$wwwbiu = pg_result($resultofe, 0, "www_b");

		$yourname = $nazbiu;
		$subjectdz = "SUBSKRYPCJA BIURA NIERUCHOMOŒCI";
		$youremail = $emailbiu;

	$headers  = "MIME-Version: 1.0\n";
	$headers .= "X-Mailer: SYSTEM AZG\n"; 	// mailer
	$headers .= "From: $youremail\n";
	$headers .= "X-Sender: <$youremail>\n"; 
	$headers .= "X-Priority: 3\n"; 				// 1-Urgent message! 2-very 3-normal
	$headers .= "Return-Path: $youremail\n";  		// Return path for errors
	$headers .= "Content-Type: text/html\n";
	$headers .= "Content-Transfer-Encoding: 8bit\n";


$wiec1dz = "&nbsp;<b>Link do strony:</b> <a href = http://$wwwbiu/index.php?action=wynajemdzzd&nu=$id1dz>wiêcej ...</a>";

if ($wylacznosc1dz == "2") {
$wyl1dz = "<center><span class=wyl>WY£¡CZNO¦Æ</span></center>";
}
else {
$wyl1dz = "";
}

if ($numofe1dz != '0') {
$numofer1dz = "&nbsp;<b>Numer oferty:</b> $numofe1dz<br>";
}
else {
$numofer1dz = "";
}

if ($lok1dz != '0') {
$lokpo1dz = "&nbsp;<b>Lokalizacja:</b> $lok1dz<br>";
}
else {
$lokpo1dz = "";
}

$sqlwojsdz = "SELECT nazwa_w FROM wojewodztwa where id_w = '$lokw1dz';";
			
			$resultwojsdz = @pg_Exec($conn, $sqlwojsdz);
			$wojnsdz = pg_result($resultwojsdz, 0, "nazwa_w");

if ($lokw1dz != '0') {
$lokwoj1dz = "<b>&nbsp;Województwo:</b> $wojnsdz<br>";
}
else {
$lokwoj1dz = "";
}

$sqlpowiatsdz = "SELECT nazwa_p FROM powiaty where id_pow = '$lokp1dz';";
			
			$resultpowiatsdz = @pg_Exec($conn, $sqlpowiatsdz);
			$powiatnsdz = pg_result($resultpowiatsdz, 0, "nazwa_p");

if ($lokp1dz != '0') {
$lokpow1dz = "&nbsp;<b>Powiat:</b> $powiatnsdz<br>";
}
else {
$lokpow1dz = "";
}

$sqlprofsdz = "SELECT rodzaj_of FROM rodzaj_of_dzi where id = '$rofd1dz';";
			
			$resultprofsdz = @pg_Exec($conn, $sqlprofsdz);
			$profnsdz = pg_result($resultprofsdz, 0, "rodzaj_of");

if ($rofd1dz != '0') {
$rofdo1dz = "&nbsp;<b>Rodzaj Dzia³ki:</b> $profnsdz<br>";
}
else {
$rofdo1dz = "";
}

if ($powdzia1dz != '0') {
$powdzial1dz = "&nbsp;<b>Pow. dzia³ki:</b> $powdzia1dz ar<br>";
}
else {
$powdzial1dz = "";
}

if ($wys1dz != '0') {
$wyscz1dz = "&nbsp;<b>Op³aty:</b> $wys1dz z³.<br>";
}
else {
$wyscz1dz = "";
}

$sqlczaspsdz = "SELECT nazwa_prz FROM czas_prz where id = '$cza1dz';";
			
			$resultczaspsdz = @pg_Exec($conn, $sqlczaspsdz);
			$czaspsdz = pg_result($resultczaspsdz, 0, "nazwa_prz");

if ($cza1dz != '0') {
$czas1dz = "&nbsp;<b>Czas przekazania:</b> $czaspsdz<br>";
}
else {
$czas1dz = "";
}

if ($cenm1dz != '0') {
$cename1dz = "&nbsp;<b>Dodatkowe op³aty:</b> $cenm1dz<br>";
}
else {
$cename1dz = "";
}

if ($cena1dz != '0') {
$cenpo1dz = "&nbsp;<b>Cena:</b> $cena1dz z³.<br>";
}
else {
$cenpo1dz = "";
}

if ($zdj1dz == 0) {

$zdjecie1dz = "
<td>
	
</td>";

}
else {

$zdjecie1dz = "

<td width=128 height=70>
	<center>
	<a href = http://$wwwbiu/index.php?action=wynajemdzzd&nu=$id1dz>
	<img src=http://$wwwbiu/img/zd$zdj1dz.jpg width=125 height=100 border=0 alt=Zdjêcie nr$zdj1dz></img></a><br>
	</center>
</td>";

}


if ($zdj2dz == 0) {

$zdjecie2dz = "
<td>
	
</td>";
	
}
else {
$zdjecie2dz = "
<td width=128 height=70>
	<center>
	<a href = http://$wwwbiu/index.php?action=wynajemdzzd&nu=$id1dz>
	<img src=http://$wwwbiu/img/zd$zdj2dz.jpg width=125 height=100 border=0 alt=Zdjêcie nr$zdj2dz></img></a><br>
	</center>
</td>";

}


$trescdz = "
<HTML LANG=pl>
<HEAD>
<META http-equiv=content-type content=text/html; charset=ISO-8859-2>
<META HTTP-EQUIV=PRAGMA CONTENT=NO-CACHE>
<META HTTP-EQUIV=Creation-date CONTENT=2004-11-26T09:47:05Z>
<META HTTP-EQUIV=Author CONTENT=gambl@azg.pl>
<META NAME=keywords LANG=pl>
<META NAME=copright CONTENT=&copy;2004>
<LINK REL=stylesheet HREF=http://www.azg.pl/form/azgf.css>
</HEAD>
<BODY marginheight=0 marginwidth=0 topmargin=0 leftmargin=0>


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
BIURO NIERUCHOMO¦CI A.Z.GWARANCJA<br>
</span>
</td>
</tr>

<tr>
<td height=5 width=30% border=0 align=right>
<span class=tytul><b>
ul. Sosnkowskiego 40-42, 45-284 Opole<br>
tel./fax. (077) 457-96-99<br>
</b>
</span>
</td>

<td width=2% height=100% align=right><img src=http://www.azg.pl/form/black.gif width=1 height=100% border=0></td>

<td height=5 width=28% border=0 align=right>
<span class=tytul><b>
ul. Bytnara Rudego 13, 45-265 Opole<br>
tel./fax. (077) 458-00-94, 0602-531-334<br>
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
<table width=100% cellpadding=0 cellspacing=0 frame border=0 valign=center>
<tr><td><img src=http://www.azg.pl/form/black.gif width=100% height=1 border=0></td></tr>
<tr valign=center>
<td height=7 bgcolor=#5865E5 colspan=3>
<center>
<span class=nag1wbe>
OFERTA WYNAJMU DZIA£KI
</span>
</center>
</td>
</tr>
<tr><td><img src=http://www.azg.pl/form/black.gif width=100% height=1 border=0></td></tr>
</table>
<table cellpadding=0 cellspacing=0 frame border=0 valign=center>
<tr>
<td width=261 align = left>
$wyl1dz
<br>
$numofer1dz
$rofdo1dz
$lokpo1dz
$lokwoj1dz
$lokpow1dz
$powdzial1dz
$wyscz1dz
$czas1dz
$cename1dz
$cenpo1dz
$wiec1dz
</td>
$zdjecie1dz
$zdjecie2dz

</tr>

</table>
</BODY>
</HTML>
";

mail($toemaildz,$subjectdz,$trescdz,$headers);

	}
			
}


$sql6 = "select id_d, no_d, lok_d, lok_w, lok_p, rof_d, powdzi_d, wysop_d, cz_prze_d, cm2_d, cd, zd1, zd2, wyl_d from tab_te_w  where datawp_d = '$nowdate' and id_b = '$identbiura';;";

$result_set6 = pg_Exec($conn, $sql6);

$rows6 = pg_NumRows($result_set6);		// liczba zwroconych wierszy

	for ($g=0; $g < $rows6; $g++) {

		$id1te = pg_result($result_set6, $g, "id_d");
		$numofe1te = pg_result($result_set6, $g, "no_d");
		$lok1te = pg_result($result_set6, $g, "lok_d");
		$lokw1te = pg_result($result_set6, $g, "lok_w");
		$lokp1te = pg_result($result_set6, $g, "lok_p");
		$rofd1te = pg_result($result_set6, $g, "rof_d");
		$powdzia1te = pg_result($result_set6, $g, "powdzi_d");
		$wys1te = pg_result($result_set6, $g, "wysop_d");
		$cza1te = pg_result($result_set6, $g, "cz_prze_d");
		$cenm1te = pg_result($result_set6, $g, "cm2_d");
		$cena1te = pg_result($result_set6, $g, "cd");
		$zdj1te = pg_result($result_set6, $g, "zd1");
		$zdj2te = pg_result($result_set6, $g, "zd2");
		$wylacznosc1te = pg_result($result_set6, $g, "wyl_d");
					
	$sqlkte = "SELECT id_zg, rodz_zg, rodzn_zg, cena_zg_od, cena_zg_do, email_zg, data_zg FROM sub WHERE rodz_zg  = 'N' and rodzn_zg = 'T' and cena_zg_od  <= '$cena1te' and cena_zg_do >= '$cena1te' and id_b = '$identbiura';";

			$resultkte = @pg_Exec($conn, $sqlkte);
			$rowskte = pg_NumRows($resultkte);

$cena1te = number_format($cena1te,'', '.', '.');			
						
			for ($h=0; $h < $rowskte; $h++) {
					
					$idktezg = pg_result($resultkte, $h, "id_zg");
					$emailktezg = pg_result($resultkte, $h, "email_zg");

$toemailte = $emailktezg;

$sqlofe = "SELECT nazwa_b, adres_b, tel_b, fax_b, tel_kom_b, email_b, www_b FROM tab_biur where id_b = '$identbiura';";

	$resultofe = @pg_Exec($conn, $sqlofe);
		
		$nazbiu = pg_result($resultofe, 0, "nazwa_b");
		$adrbiu = pg_result($resultofe, 0, "adres_b");
		$telbiu = pg_result($resultofe, 0, "tel_b");
		$faxbiu = pg_result($resultofe, 0, "fax_b");
		$telkombiu = pg_result($resultofe, 0, "tel_kom_b");
		$emailbiu = pg_result($resultofe, 0, "email_b");
		$wwwbiu = pg_result($resultofe, 0, "www_b");

		$yourname = $nazbiu;
		$subjectte = "SUBSKRYPCJA BIURA NIERUCHOMOŒCI";
		$youremail = $emailbiu;

	$headers  = "MIME-Version: 1.0\n";
	$headers .= "X-Mailer: SYSTEM AZG\n"; 	// mailer
	$headers .= "From: $youremail\n";
	$headers .= "X-Sender: <$youremail>\n"; 
	$headers .= "X-Priority: 3\n"; 				// 1-Urgent message! 2-very 3-normal
	$headers .= "Return-Path: $youremail\n";  		// Return path for errors
	$headers .= "Content-Type: text/html\n";
	$headers .= "Content-Transfer-Encoding: 8bit\n";


$wiec1te = "&nbsp;<b>Link do strony:</b> <a href = http://$wwwbiu/index.php?action=wynajemtezd&nu=$id1te>wiêcej ...</a>";

if ($wylacznosc1te == "2") {
$wyl1te = "<center><span class=wyl>WY£¡CZNO¦Æ</span></center>";
}
else {
$wyl1te = "";
}

if ($numofe1te != '0') {
$numofer1te = "&nbsp;<b>Numer oferty:</b> $numofe1te<br>";
}
else {
$numofer1te = "";
}

if ($lok1te != '0') {
$lokpo1te = "&nbsp;<b>Lokalizacja:</b> $lok1te<br>";
}
else {
$lokpo1te = "";
}

$sqlwojste = "SELECT nazwa_w FROM wojewodztwa where id_w = '$lokw1te';";
			
			$resultwojste = @pg_Exec($conn, $sqlwojste);
			$wojnste = pg_result($resultwojste, 0, "nazwa_w");

if ($lokw1te != '0') {
$lokwoj1te = "<b>&nbsp;Województwo:</b> $wojnste<br>";
}
else {
$lokwoj1te = "";
}

$sqlpowiatste = "SELECT nazwa_p FROM powiaty where id_pow = '$lokp1te';";
			
			$resultpowiatste = @pg_Exec($conn, $sqlpowiatste);
			$powiatnste = pg_result($resultpowiatste, 0, "nazwa_p");

if ($lokp1te != '0') {
$lokpow1te = "&nbsp;<b>Powiat:</b> $powiatnste<br>";
}
else {
$lokpow1te = "";
}

$sqlprofste = "SELECT rodzaj_of FROM rodzaj_of_dzi where id = '$rofd1te';";
			
			$resultprofste = @pg_Exec($conn, $sqlprofste);
			$profnste = pg_result($resultprofste, 0, "rodzaj_of");

if ($rofd1te != '0') {
$rofdo1te = "&nbsp;<b>Rodzaj Dzia³ki:</b> $profnste<br>";
}
else {
$rofdo1te = "";
}

if ($powdzia1te != '0') {
$powdzial1te = "&nbsp;<b>Pow. dzia³ki:</b> $powdzia1te ar<br>";
}
else {
$powdzial1te = "";
}

if ($wys1te != '0') {
$wyscz1te = "&nbsp;<b>Op³aty:</b> $wys1te z³.<br>";
}
else {
$wyscz1te = "";
}

$sqlczaspste = "SELECT nazwa_prz FROM czas_prz where id = '$cza1te';";
			
			$resultczaspste = @pg_Exec($conn, $sqlczaspste);
			$czaspste = pg_result($resultczaspste, 0, "nazwa_prz");

if ($cza1te != '0') {
$czas1te = "&nbsp;<b>Czas przekazania:</b> $czaspste<br>";
}
else {
$czas1te = "";
}

if ($cenm1te != '0') {
$cename1te = "&nbsp;<b>Dodatkowe op³aty:</b> $cenm1te<br>";
}
else {
$cename1te = "";
}

if ($cena1te != '0') {
$cenpo1te = "&nbsp;<b>Cena:</b> $cena1te z³.<br>";
}
else {
$cenpo1te = "";
}

if ($zdj1te == 0) {

$zdjecie1te = "
<td>
	
</td>";

}
else {

$zdjecie1te = "

<td width=128 height=70>
	<center>
	<a href = http://$wwwbiu/index.php?action=wynajemtezd&nu=$id1te>
	<img src=http://$wwwbiu/img/zd$zdj1te.jpg width=125 height=100 border=0 alt=Zdjêcie nr$zdj1te></img></a><br>
	</center>
</td>";

}


if ($zdj2te == 0) {

$zdjecie2te = "
<td>
	
</td>";
	
}
else {
$zdjecie2te = "
<td width=128 height=70>
	<center>
	<a href = http://$wwwbiu/index.php?action=wynajemtezd&nu=$id1te>
	<img src=http://$wwwbiu/img/zd$zdj2te.jpg width=125 height=100 border=0 alt=Zdjêcie nr$zdj2te></img></a><br>
	</center>
</td>";

}


$trescte = "
<HTML LANG=pl>
<HEAD>
<META http-equiv=content-type content=text/html; charset=ISO-8859-2>
<META HTTP-EQUIV=PRAGMA CONTENT=NO-CACHE>
<META HTTP-EQUIV=Creation-date CONTENT=2004-11-26T09:47:05Z>
<META HTTP-EQUIV=Author CONTENT=gambl@azg.pl>
<META NAME=keywords LANG=pl>
<META NAME=copright CONTENT=&copy;2004>
<LINK REL=stylesheet HREF=http://www.azg.pl/form/azgf.css>
</HEAD>
<BODY marginheight=0 marginwidth=0 topmargin=0 leftmargin=0>


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
BIURO NIERUCHOMO¦CI A.Z.GWARANCJA<br>
</span>
</td>
</tr>

<tr>
<td height=5 width=30% border=0 align=right>
<span class=tytul><b>
ul. Sosnkowskiego 40-42, 45-284 Opole<br>
tel./fax. (077) 457-96-99<br>
</b>
</span>
</td>

<td width=2% height=100% align=right><img src=http://www.azg.pl/form/black.gif width=1 height=100% border=0></td>

<td height=5 width=28% border=0 align=right>
<span class=tytul><b>
ul. Bytnara Rudego 13, 45-265 Opole<br>
tel./fax. (077) 458-00-94, 0602-531-334<br>
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
<table width=100% cellpadding=0 cellspacing=0 frame border=0 valign=center>
<tr><td><img src=http://www.azg.pl/form/black.gif width=100% height=1 border=0></td></tr>
<tr valign=center>
<td height=7 bgcolor=#5865E5 colspan=3>
<center>
<span class=nag1wbe>
OFERTA WYNAJMU TERENU
</span>
</center>
</td>
</tr>
<tr><td><img src=http://www.azg.pl/form/black.gif width=100% height=1 border=0></td></tr>
</table>
<table cellpadding=0 cellspacing=0 frame border=0 valign=center>
<tr>
<td width=261 align = left>
$wyl1te
<br>
$numofer1te
$rofdo1te
$lokpo1te
$lokwoj1te
$lokpow1te
$powdzial1te
$wyscz1te
$czas1te
$cename1te
$cenpo1te
$wiec1te
</td>
$zdjecie1te
$zdjecie2te

</tr>

</table>
</BODY>
</HTML>
";

mail($toemailte,$subjectte,$trescte,$headers);

	}
			
}

?>
