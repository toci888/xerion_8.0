<?
$identbiura = "1";
$ok = "_b";
// polaczenie z baza
include "../concfg.inc";


if ($action == 'zamianad') {

$sql0 = "select id_d from tab_dom_za where pokaz = 't' and usund = 'f' and id_b = '$identbiura' order by cd;";

$result_set0 = pg_Exec($conn, $sql0);

$rows0 = pg_NumRows($result_set0);		// liczba zwroconych wierszy

if ((!$result_set0) || ($rows0 > 0)) { 

echo "<center>";
echo "<span class=\"nag2b\">";
echo "<b>EXCHANGE OF HOUSES</b>";
echo "<br>";
echo "<br>";
echo "</span>";
echo "</center>";
}

$sql1 = "select id_d, no_d, lok_d, powuzyt_d, powdzi_d, lp_d, cd, zd1, wyl_d, sm_d, zamiana_en from tab_dom_za where pokaz = 't' and usund = 'f' and id_b = '$identbiura' order by cd;";

$result_set1 = pg_Exec($conn, $sql1);

$rows1 = pg_NumRows($result_set1);		// liczba zwroconych wierszy

if ((!$result_set1) || ($rows1 > 0)) { 

echo "<table width=\"516\" cellpadding=\"0\" cellspacing=\"0\" frame border=\"0\">";
	for ($i=0; $i < $rows1; $i++) {


echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

echo "<tr bgcolor=\"#5865E5\">";
echo "<td width=\"516\" align = \"left\" colspan =\"40\">";
echo "<span class=\"nag1wb\">";
echo "&nbsp;House:";
echo "</span>";
echo "</td>";
echo "</tr>";

		$id1 = pg_result($result_set1, $i, "id_d");
		$nod1 = pg_result($result_set1, $i, "no_d");
		$lok1 = pg_result($result_set1, $i, "lok_d");
		$powuzyt1 = pg_result($result_set1, $i, "powuzyt_d");
		$powdz1 = pg_result($result_set1, $i, "powdzi_d");
		$lp1 = pg_result($result_set1, $i, "lp_d");
		$cena1 = pg_result($result_set1, $i, "cd");
		$zdj1 = pg_result($result_set1, $i, "zd1");
		$wylacznosc1 = pg_result($result_set1, $i, "wyl_d");
		$status1 = pg_result($result_set1, $i, "sm_d");
		$zamie = pg_result($result_set1, $i, "zamiana_en");
		

if ($status1 == "2") {
$stat1 = "<span class=\"zawna\">SUSPENDED OFFER</span>";
$wpstatp1 = "<span class=\"zawo\">";
$wpstatk1 = "</span>";
}
else {
$stat1 ="";
$wpstatp1 = "";
$wpstatk1 = "";
}

if ($wylacznosc1 == "2") {
$wyl1 = "<span class=\"wyl\">EXCLUSIVE RIGHTS</span>";
}
else {
$wyl1 = "";
}

$tekst1 = "<a href = \"$PHP_SELF?action=zamianadzd&nu=$id1\">more ...</a>";

echo "<tr>";
if ($zdj1 != 0) {
	echo "<td width=\"126\" height=\"63\" rowspan = \"4\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=zamianadzd&nu=$id1\">";
	echo "<img src=\"../img/zd$zdj1.jpg\" width=\"90\" height=\"60\" border=\"0\" alt=\"Picture nr$zdj1\" class=\"ira\"></img></a><br>";
	echo "</center>";
	echo "</td>";
}
else {
	echo "<td width=\"126\" height=\"63\" rowspan = \"4\">";
	echo "<center>";
	echo "<a href = \"$PHP_SELF?action=zamianadzd&nu=$id1\">";
	echo "<img src=\"../img/zd0.jpg\" width=\"90\" height=\"60\" alt=\"No picture\" class=\"ira\"></img></a><br>";
	echo "</center>";
	echo "</td>";
}
echo "<td align = \"left\">";

echo "<tr>";

echo "<td width=\"130\" align = \"left\">$wpstatp1";
echo "<b>Number of Offer:</b> $nod1";
echo "$wpstatk1</td>";

echo "<td width=\"260\" align = \"left\" colspan = \"2\">$wpstatp1";
echo "<b>Location:</b> $lok1";
echo "$wpstatk1</td>";

echo "</tr>";

echo "<tr>";

echo "<td width=\"130\" align = \"left\">$wpstatp1";
echo "<b>Floor area:</b> $powuzyt1 m2";
echo "$wpstatk1</td>";

echo "<td width=\"130\" align = \"left\">$wpstatp1";
echo "<b>Plot area:</b> $powdz1 ar.";
echo "$wpstatk1</td>";

$cena1 = number_format($cena1,'', '.', '.');

echo "<td width=\"130\" align = \"left\">$wpstatp1";
echo "<b>Price:</b> $cena1 z³.";
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

echo "<tr bgcolor=\"#5865E5\">";
echo "<td width=\"516\" align = \"left\" colspan =\"40\">";
echo "<span class=\"nag1wb\">";
echo "&nbsp;Exchange on:";
echo "</span>";
echo "</td>";
echo "</tr>";

echo "<tr>";
echo "<td width=\"516\" align = \"left\" colspan =\"40\">";
echo "&nbsp;$zamie";
echo "</td>";
echo "</tr>";


echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

echo "<tr>";
echo "<td width=\"516\" align = \"left\" colspan =\"40\">";
echo "<br>";
echo "</td>";
echo "</tr>";

}
echo "</table>";
}

}


if ($action == 'zamianadzd') {

echo "<center>";
echo "<span class=\"nag2b\">";
echo "<b>EXCHANGE OF HOUSES</b>";
echo "<br>";
echo "</span>";
echo "</center>";

echo "<table width=\"512\" cellpadding=\"0\" cellspacing=\"0\" border = \"0\">";
echo "<tr>";
echo "<td width=\"50%\"  align = \"left\">";

?>
<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,0,0" width="40" height="20" id="backzd" align="middle">
<param name="allowScriptAccess" value="sameDomain" />
<param name="movie" value="backzd.swf" />
<param name="quality" value="high" />
<param name="wmode" value="transparent" />
<param name="bgcolor" value="#ffffff" />
<embed src="backzd.swf" quality="high" wmode="transparent" bgcolor="#ffffff" width="40" height="20" name="backzd" align="middle" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />
</object>
<?

echo "</td>";
echo "<td width=\"50%\" align = \"right\">";
echo "<a href=\"drukzd.php?nu=$nu\" target = \"_blank\"><img src=\"../img/printer.gif\" width=\"15\" height=\"17\" border=\"0\"></img>&nbsp;&nbsp;Print with pictures</a><br>";
echo "<a href=\"drukzdb.php?nu=$nu\" target = \"_blank\"><img src=\"../img/printer.gif\" width=\"15\" height=\"17\" border=\"0\"></img>&nbsp;&nbsp;Print without pictures</a>";
echo "</td>";
echo "</tr>";
echo "</table>";

echo "<br>";

echo "<center>";
echo "<table width=\"512\" cellpadding=\"0\" cellspacing=\"0\" border = \"1\" frame = \"above,below,rhs\" rules = \"groups\">";

$sqlno = "SELECT no_d, no_d_bo FROM tab_dom_za where id_d = '$nu';";
	$resultno = @pg_Exec($conn, $sqlno);
	$rowsno = pg_NumRows($resultno);		// liczba zwroconych wierszy
	$noms = pg_result($resultno, 0, "no_d");
	$nomsp = pg_result($resultno, 0, "no_d_bo");

$sqlstatus = "SELECT sm_d, sm_d_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultstatus = @pg_Exec($conn, $sqlstatus);
			$status = pg_result($resultstatus, 0, "sm_d");
			$statusbo = pg_result($resultstatus, 0, "sm_d_bo");
	
	$sqlstatuss = "SELECT nazwa_st_en FROM status where id = '$status';";
			
			$resultstatuss = @pg_Exec($conn, $sqlstatuss);
			$statuss = pg_result($resultstatuss, 0, "nazwa_st_en");

$sqlagent = "SELECT id_a FROM tab_dom_za where id_d = '$nu';";
			
			$resultagent = @pg_Exec($conn, $sqlagent);
			$agent = pg_result($resultagent, 0, "id_a");

	$sqlagents = "SELECT nazwa_a, tel_a, tel_kom_a, email_a FROM tab_agent where id_a = '$agent';";
			
			$resultagents = @pg_Exec($conn, $sqlagents);
			$nazwaagenta = pg_result($resultagents, 0, "nazwa_a");
			$nazwatel = pg_result($resultagents, 0, "tel_a");
			$nazwatelkom = pg_result($resultagents, 0, "tel_kom_a");
			$nazwaemail = pg_result($resultagents, 0, "email_a");

$sqllok = "SELECT lok_d, lok_d_bo FROM tab_dom_za where id_d = '$nu';";	
	$resultlok = @pg_Exec($conn, $sqllok);
	$lokas = pg_result($resultlok, 0, "lok_d");
	$lokasp = pg_result($resultlok, 0, "lok_d_bo");

$sqlwoj = "SELECT lok_w, lok_w_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultwoj = @pg_Exec($conn, $sqlwoj);
			$wojn = pg_result($resultwoj, 0, "lok_w");
			$wojnbo = pg_result($resultwoj, 0, "lok_w_bo");
	
	$sqlwojs = "SELECT nazwa_w FROM wojewodztwa where id_w = '$wojn';";
			
			$resultwojs = @pg_Exec($conn, $sqlwojs);
			$wojns = pg_result($resultwojs, 0, "nazwa_w");

$sqlpowiat = "SELECT lok_p, lok_p_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultpowiat = @pg_Exec($conn, $sqlpowiat);
			$powiatn = pg_result($resultpowiat, 0, "lok_p");
			$powiatbo = pg_result($resultpowiat, 0, "lok_p_bo");
	
	$sqlpowiats = "SELECT nazwa_p FROM powiaty where id_pow = '$powiatn';";
			
			$resultpowiats = @pg_Exec($conn, $sqlpowiats);
			$powiatns = pg_result($resultpowiats, 0, "nazwa_p");

$sqlcena = "SELECT cd, cd_bo FROM tab_dom_za where id_d = '$nu';";	
	$resultcena = @pg_Exec($conn, $sqlcena);
	$cenas = pg_result($resultcena, 0, "cd");
	$cenasp = pg_result($resultcena, 0, "cd_bo");
	
$sqlpowuzyt = "SELECT powuzyt_d, powuzyt_d_bo FROM tab_dom_za where id_d = '$nu';";	
	$resultpowuzyt = @pg_Exec($conn, $sqlpowuzyt);
	$powuzyts = pg_result($resultpowuzyt, 0, "powuzyt_d");
	$powuzytsp = pg_result($resultpowuzyt, 0, "powuzyt_d_bo");
	
$sqlpowcal = "SELECT powcal_d, powcal_d_bo FROM tab_dom_za where id_d = '$nu';";	
	$resultpowcal = @pg_Exec($conn, $sqlpowcal);
	$powcals = pg_result($resultpowcal, 0, "powcal_d");
	$powcalsp = pg_result($resultpowcal, 0, "powcal_d_bo");

$sqlpowzab = "SELECT powzab_d, powzab_d_bo FROM tab_dom_za where id_d = '$nu';";	
	$resultpowzab = @pg_Exec($conn, $sqlpowzab);
	$powzabs = pg_result($resultpowzab, 0, "powzab_d");
	$powzabsp = pg_result($resultpowzab, 0, "powzab_d_bo");

$sqlpowdzi = "SELECT powdzi_d, powdzi_d_bo FROM tab_dom_za where id_d = '$nu';";	
	$resultpowdzi = @pg_Exec($conn, $sqlpowdzi);
	$powdzis = pg_result($resultpowdzi, 0, "powdzi_d");
	$powdzisp = pg_result($resultpowdzi, 0, "powdzi_d_bo");

$sqlpowpom = "SELECT powpom_d, powpom_d_bo FROM tab_dom_za where id_d = '$nu';";	
	$resultpowpom = @pg_Exec($conn, $sqlpowpom);
	$powpoms = pg_result($resultpowpom, 0, "powpom_d");
	$powpomsp = pg_result($resultpowpom, 0, "powpom_d_bo");

$sqlpowogr = "SELECT powogr_d, powogr_d_bo FROM tab_dom_za where id_d = '$nu';";	
	$resultpowogr = @pg_Exec($conn, $sqlpowogr);
	$powogrs = pg_result($resultpowogr, 0, "powogr_d");
	$powogrsp = pg_result($resultpowogr, 0, "powogr_d_bo");

$sqllpok = "SELECT lp_d, lp_d_bo FROM tab_dom_za where id_d = '$nu';";	
	$resultlpok = @pg_Exec($conn, $sqllpok);
	$lpoks = pg_result($resultlpok, 0, "lp_d");
	$lpoksp = pg_result($resultlpok, 0, "lp_d_bo");

$sqllkuc = "SELECT lkuch_d, lkuch_d_bo FROM tab_dom_za where id_d = '$nu';";	
	$resultlkuc = @pg_Exec($conn, $sqllkuc);
	$lkucs = pg_result($resultlkuc, 0, "lkuch_d");
	$lkucsp = pg_result($resultlkuc, 0, "lkuch_d_bo");

$sqllprzed = "SELECT lprzed_d, lprzed_d_bo FROM tab_dom_za where id_d = '$nu';";	
	$resultlprzed = @pg_Exec($conn, $sqllprzed);
	$lprzeds = pg_result($resultlprzed, 0, "lprzed_d");
	$lprzedsp = pg_result($resultlprzed, 0, "lprzed_d_bo");

$sqllla = "SELECT lla_d, lla_d_bo FROM tab_dom_za where id_d = '$nu';";	
	$resultlla = @pg_Exec($conn, $sqllla);
	$llas = pg_result($resultlla, 0, "lla_d");
	$llasp = pg_result($resultlla, 0, "lla_d_bo");

$sqllub = "SELECT lub_d, lub_d_bo FROM tab_dom_za where id_d = '$nu';";	
	$resultlub = @pg_Exec($conn, $sqllub);
	$lubs = pg_result($resultlub, 0, "lub_d");
	$lubsp = pg_result($resultlub, 0, "lub_d_bo");

$sqldpom = "SELECT lpom_d, lpom_d_bo FROM tab_dom_za where id_d = '$nu';";	
	$resultdpom = @pg_Exec($conn, $sqldpom);
	$dpoms = pg_result($resultdpom, 0, "lpom_d");
	$dpomsp = pg_result($resultdpom, 0, "lpom_d_bo");

$sqlltar = "SELECT ltar_d, ltar_d_bo FROM tab_dom_za where id_d = '$nu';";	
	$resultltar = @pg_Exec($conn, $sqlltar);
	$ltars = pg_result($resultltar, 0, "ltar_d");
	$ltarsp = pg_result($resultltar, 0, "ltar_d_bo");

$sqllbal = "SELECT lbal_d, lbal_d_bo FROM tab_dom_za where id_d = '$nu';";	
	$resultlbal = @pg_Exec($conn, $sqllbal);
	$lbals = pg_result($resultlbal, 0, "lbal_d");
	$lbalsp = pg_result($resultlbal, 0, "lbal_d_bo");

$sqllkond = "SELECT lkon_d, lkon_d_bo FROM tab_dom_za where id_d = '$nu';";	
	$resultlkond = @pg_Exec($conn, $sqllkond);
	$lkonds = pg_result($resultlkond, 0, "lkon_d");
	$lkondsp = pg_result($resultlkond, 0, "lkon_d_bo");

$sqlrynek = "SELECT rr_d, rr_d_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultrynek = @pg_Exec($conn, $sqlrynek);
			$rrynek = pg_result($resultrynek, 0, "rr_d");
			$rrynekbo = pg_result($resultrynek, 0, "rr_d_bo");
	
	$sqlryneks = "SELECT nazwa_r_en FROM rodzaj_ryn where id = '$rrynek';";
			
			$resultryneks = @pg_Exec($conn, $sqlryneks);
			$rryneks = pg_result($resultryneks, 0, "nazwa_r_en");


$sqlcm2 = "SELECT cm2_d, cm2_d_bo FROM tab_dom_za where id_d = '$nu';";	
	$resultcm2 = @pg_Exec($conn, $sqlcm2);
	$cenad2 = pg_result($resultcm2, 0, "cm2_d");
	$cenad2bo = pg_result($resultcm2, 0, "cm2_d_bo");
	
$sqlczynsz = "SELECT wysop_d, wysop_d_bo FROM tab_dom_za where id_d = '$nu';";
	$resultczynsz = @pg_Exec($conn, $sqlczynsz);
	$czynszs = pg_result($resultczynsz, 0, "wysop_d");
	$czynszsp = pg_result($resultczynsz, 0, "wysop_d_bo");

$sqlczasp = "SELECT cz_prze_d, cz_prze_d_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultczasp = @pg_Exec($conn, $sqlczasp);
			$czasp = pg_result($resultczasp, 0, "cz_prze_d");
			$czaspbo = pg_result($resultczasp, 0, "cz_prze_d_bo");
	
	$sqlczasps = "SELECT nazwa_prz_en FROM czas_prz where id = '$czasp';";
			
			$resultczasps = @pg_Exec($conn, $sqlczasps);
			$czasps = pg_result($resultczasps, 0, "nazwa_prz_en");

$sqlksiega = "SELECT kw_d, kw_d_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultksiega = @pg_Exec($conn, $sqlksiega);
			$ksiega = pg_result($resultksiega, 0, "kw_d");
			$ksiegabo = pg_result($resultksiega, 0, "kw_d_bo");
	
	$sqlksiegas = "SELECT nazwa_k_en FROM ksiega where id = '$ksiega';";
			
			$resultksiegas = @pg_Exec($conn, $sqlksiegas);
			$ksiegass = pg_result($resultksiegas, 0, "nazwa_k_en");

$sqlprawny = "SELECT spr_d, spr_d_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultprawny = @pg_Exec($conn, $sqlprawny);
			$prawny = pg_result($resultprawny, 0, "spr_d");
			$prawnybo = pg_result($resultprawny, 0, "spr_d_bo");
	
	$sqlprawnys = "SELECT nazwa_pr_en FROM stan_pr where id = '$prawny';";
			
			$resultprawnys = @pg_Exec($conn, $sqlprawnys);
			$prawnyss = pg_result($resultprawnys, 0, "nazwa_pr_en");

$sqlprawnydz = "SELECT spr_dz, spr_dz_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultprawnydz = @pg_Exec($conn, $sqlprawnydz);
			$prawnydz = pg_result($resultprawnydz, 0, "spr_dz");
			$prawnydzbo = pg_result($resultprawnydz, 0, "spr_dz_bo");
	
	$sqlprawnydzs = "SELECT nazwa_pr_en FROM stan_pr where id = '$prawnydz';";
			
			$resultprawnydzs = @pg_Exec($conn, $sqlprawnydzs);
			$prawnydzss = pg_result($resultprawnydzs, 0, "nazwa_pr_en");


$sqldw = "SELECT datawp_d, datawp_d_bo FROM tab_dom_za where id_d = '$nu';";
	$resultdw = @pg_Exec($conn, $sqldw);
	$datw = pg_result($resultdw, 0, "datawp_d");
	$datwp = pg_result($resultdw, 0, "datawp_d_bo");

$sqlprof = "SELECT rof_d, rof_d_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultprof = @pg_Exec($conn, $sqlprof);
			$profn = pg_result($resultprof, 0, "rof_d");
			$profnbo = pg_result($resultprof, 0, "rof_d_bo");
	
	$sqlprofs = "SELECT rodzaj_of_en FROM rodzaj_of where id = '$profn';";
			
			$resultprofs = @pg_Exec($conn, $sqlprofs);
			$profns = pg_result($resultprofs, 0, "rodzaj_of_en");

if (($lokasp == 't')  || ($wojnbo == 't') || ($powiatbo == 't')  || ($cenasp == 't') || ($powuzytsp == 't') || ($powcalsp == 't') || ($powzabsp == 't') || ($powdzisp == 't') || ($powpomsp == 't') || ($powogrsp == 't')  || ($lpoksp == 't') || ($lkucsp == 't') || ($lprzedsp == 't') || ($llasp == 't') || ($lubsp == 't') || ($dpomsp == 't') || ($ltarsp == 't') || ($lbalsp == 't') || ($lkondsp == 't')  || ($cenad2bo == 't') || ($czynszsp == 't')  || ($czaspbo == 't') || ($ksiegabo == 't')  || ($prawnybo == 't')  || ($prawnydzbo == 't') || ($rrynekbo == 't')  || ($datwp == 't') || ($profnbo == 't')) {

echo "<tr><td colspan=\"40\" height=\"7\" bgcolor=\"#5865E5\">";
echo "<span class=\"nag1wb\">";
echo "&nbsp;Basic information";
echo "</span>";
echo "</td></tr>";

}
	
echo "<tr>";

if ($nomsp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Number:</b><br>&nbsp;$noms";
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
echo "&nbsp;<b>Agent:</b><br>&nbsp;<a href=\"mailto:$nazwaemail\">$nazwaagenta</a>&nbsp;<b>Tel.kom.:</b>&nbsp;$nazwatelkom";
echo "</td>";

echo "</tr>";

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"512\" height=\"1\" border=\"0\"></img></td></tr>";

if ( ($lokasp == 't')  || ($wojnbo == 't') || ($powiatbo == 't')  || ($cenasp == 't')) {
echo "<tr>";
}
if ($lokasp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Location:</b><br>&nbsp;$lokas";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}


if ($wojnbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Province:</b><br>&nbsp;$wojns";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($powiatbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>District:</b><br>&nbsp;$powiatns";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($cenasp == 't') {

$cenas = number_format($cenas,'', '.', '.');

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Price:</b><br>&nbsp;$cenas z³.";
echo "</td>";

}

if ( ($lokasp == 't')  || ($wojnbo == 't') || ($powiatbo == 't')  || ($cenasp == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}
if ( ($powuzytsp == 't')  || ($powcalsp == 't') || ($powzabsp == 't')  || ($powdzisp == 't')) {
echo "<tr>";
}
if ($powuzytsp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Floor area:</b><br>&nbsp;$powuzyts m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($powzabsp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Building area:</b><br>&nbsp;$powzabs m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($powcalsp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>All-out area:</b><br>&nbsp;$powcals m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($powdzisp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Plot area:</b><br>&nbsp;$powdzis ar";
echo "</td>";

}


if ( ($powuzytsp == 't')  || ($powcalsp == 't') || ($powzabsp == 't')  || ($powdzisp == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}
if ( ($powpomsp == 't')  || ($powogrsp == 't') || ($lpoksp == 't')  || ($lkucsp == 't')) {
echo "<tr>";
}

if ($powpomsp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Accommodation area:</b><br>&nbsp;$powpoms m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}


if ($powogrsp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Garden area:</b><br>&nbsp;$powogrs ar";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($lpoksp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Number of rooms:</b><br>&nbsp;$lpoks";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($lkucsp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Number of kitchen:</b><br>&nbsp;$lkucs";
echo "</td>";

}

if ( ($powpomsp == 't')  || ($powogrsp == 't') || ($lpoksp == 't')  || ($lkucsp == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}
if (($lprzedsp == 't') || ($llasp == 't') || ($lubsp == 't') || ($dpomsp == 't')) {
echo "<tr>";
}
if ($lprzedsp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Number of hallways:</b><br>&nbsp;$lprzeds";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($llasp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Number of bathrooms:</b><br>&nbsp;$llas";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($lubsp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Number of wcs:</b><br>&nbsp;$lubs";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($dpomsp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Number of accommodation:</b><br>&nbsp;$dpoms";
echo "</td>";

}

if (($lprzedsp == 't') || ($llasp == 't') || ($lubsp == 't') || ($dpomsp == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}
if (($ltarsp == 't') || ($lbalsp == 't') || ($lkondsp == 't') || ($rrynekbo == 't')) {
echo "<tr>";
}
if ($ltarsp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Number of terraces:</b><br>&nbsp;$ltars";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($lbalsp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Number of balconys:</b><br>&nbsp;$lbals";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($lkondsp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Number of levels:</b><br>&nbsp;$lkonds";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($rrynekbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Kind of the market:</b><br>&nbsp;$rryneks";
echo "</td>";


}

if (($ltarsp == 't') || ($lbalsp == 't') || ($lkondsp == 't') || ($rrynekbo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}

if (($cenad2bo == 't') || ($czynszsp == 't') || ($czaspbo == 't') || ($ksiegabo == 't')) {
echo "<tr>";
}
if ($cenad2bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Price for 1 m2:</b><br>&nbsp;$cenad2 z³.";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($czynszsp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Rent:</b><br>&nbsp;$czynszs z³.";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($czaspbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Available:</b><br>&nbsp;$czasps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($ksiegabo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Real estate register:</b><br>&nbsp;$ksiegass";
echo "</td>";

}

if (($cenad2bo == 't') || ($czynszsp == 't') || ($czaspbo == 't') || ($ksiegabo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}
if (($prawnybo == 't') || ($prawnydzbo == 't') || ($datwp == 't') || ($profnbo == 't')) {
echo "<tr>";
}
if ($prawnybo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Legal standing of house:</b><br>&nbsp;$prawnyss";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}


if ($prawnydzbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Legal standing of plot:</b><br>&nbsp;$prawnydzss";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}


if ($datwp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Date of the offer:</b><br>&nbsp;$datw";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}


if ($profnbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Kind of the offer:</b><br>&nbsp;$profns";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}


if (($prawnybo == 't') || ($prawnydzbo == 't') || ($datwp == 't') || ($profnbo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}



$sqlfil1 = "SELECT film1 FROM tab_dom_za where id_d = '$nu';";
			
	$resultfil1 = @pg_Exec($conn, $sqlfil1);
	$fil1ms = pg_result($resultfil1, 0, "film1");

$sqlfil2 = "SELECT film2 FROM tab_dom_za where id_d = '$nu';";
			
	$resultfil2 = @pg_Exec($conn, $sqlfil2);
	$fil2ms = pg_result($resultfil2, 0, "film2");

$sqlfil3 = "SELECT film3 FROM tab_dom_za where id_d = '$nu';";
			
	$resultfil3 = @pg_Exec($conn, $sqlfil3);
	$fil3ms = pg_result($resultfil3, 0, "film3");


if (($fil1ms != '0') || ($fil2ms != '0') || ($fil3ms != '0')) {

echo "<tr><td colspan=\"40\" height=\"7\" bgcolor=\"#5865E5\">";
echo "<span class=\"nag1wb\">";
echo "&nbsp;Clips of the video";
echo "</span>";
echo "</td></tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
echo "<tr>"; 
}

 if ($fil1ms != '0') {

	echo "<td width=\"127\">";
	echo "<center>";
	echo "<a href=\"../filmy/$fil1ms.wmv\"><img src=\"../img/camera2.jpg\" width=\"50\" height=\"42\" align =\"left\" border=\"0\"></img></a>";
	echo "<a href=\"../filmy/$fil1ms.wmv\">Film nr $fil1ms</a>";
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
	echo "<a href=\"../filmy/$fil2ms.wmv\"><img src=\"../img/camera2.jpg\" width=\"50\" height=\"42\" align =\"left\" border=\"0\"></img></a>";
	echo "<a href=\"../filmy/$fil2ms.wmv\">Film nr $fil2ms</a>";
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
	echo "<a href=\"../filmy/$fil3ms.wmv\"><img src=\"../img/camera2.jpg\" width=\"50\" height=\"42\" align =\"left\" border=\"0\"></img></a>";
	echo "<a href=\"../filmy/$fil3ms.wmv\">Film nr $fil3ms</a>";
	echo "</span>";
	echo "</center>";
	echo "</td>";

}

if (($fil1ms != '0')  || ($fil2ms != '0') || ($fil3ms != '0')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}



$sqlzd1 = "SELECT zd1 FROM tab_dom_za where id_d = '$nu';";
			
	$resultzd1s = @pg_Exec($conn, $sqlzd1);
	$zd1ms = pg_result($resultzd1s, 0, "zd1");

$sqlzd2 = "SELECT zd2 FROM tab_dom_za where id_d = '$nu';";
			
	$resultzd2s = @pg_Exec($conn, $sqlzd2);
	$zd2ms = pg_result($resultzd2s, 0, "zd2");

$sqlzd3 = "SELECT zd3 FROM tab_dom_za where id_d = '$nu';";
			
	$resultzd3s = @pg_Exec($conn, $sqlzd3);
	$zd3ms = pg_result($resultzd3s, 0, "zd3");

$sqlzd4 = "SELECT zd4 FROM tab_dom_za where id_d = '$nu';";
			
	$resultzd4s = @pg_Exec($conn, $sqlzd4);
	$zd4ms = pg_result($resultzd4s, 0, "zd4");


if (($zd1ms != '0')  || ($zd2ms != '0') || ($zd3ms != '0')  || ($zd4ms != '0')) {

echo "<tr><td colspan=\"40\" height=\"7\" bgcolor=\"#5865E5\">";
echo "<span class=\"nag1wb\">";
echo "&nbsp;Pictures";
echo "</span>";
echo "</td></tr>";

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
echo "<tr>"; 
}

if ($zd1ms != '0') {

	echo "<td width=\"127\">";
	echo "<center>";
	echo "<a href=\"image.php?p=../img/zd$zd1ms$ok&w=550&h=350&i=Picture%20nr\"$zd1ms\"\" onclick=\"NewWindow(this.href,'name','570','370','no');return false;\">";
	echo "<img src=\"../img/zd$zd1ms.jpg\" width=\"125\" height=\"100\" border=\"0\" alt=\"Picture nr$zd1ms\"></img></a><br><span class=\"\">";
	echo "Picture nr $zd1ms";
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
	echo "<a href=\"image.php?p=../img/zd$zd2ms$ok&w=550&h=350&i=Picture%20nr\"$zd2ms\"\" onclick=\"NewWindow(this.href,'name','570','370','no');return false;\">";
	echo "<img src=\"../img/zd$zd2ms.jpg\" width=\"125\" height=\"100\" border=\"0\" alt=\"Picture nr$zd2ms\"></img></a><br><span class=\"\">";
	echo "Picture nr $zd2ms";
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
	echo "<a href=\"image.php?p=../img/zd$zd3ms$ok&w=550&h=350&i=Picture%20nr\"$zd3ms\"\" onclick=\"NewWindow(this.href,'name','570','370','no');return false;\">";
	echo "<img src=\"../img/zd$zd3ms.jpg\" width=\"125\" height=\"100\" border=\"0\" alt=\"Picture nr$zd3ms\"></img></a><br><span class=\"\">";
	echo "Picture nr $zd3ms";
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
	echo "<a href=\"image.php?p=../img/zd$zd4ms$ok&w=550&h=350&i=Picture%20nr\"$zd4ms\"\" onclick=\"NewWindow(this.href,'name','570','370','no');return false;\">";
	echo "<img src=\"../img/zd$zd4ms.jpg\" width=\"125\" height=\"100\" border=\"0\" alt=\"Picture nr$zd4ms\"></img></a><br><span class=\"\">";
	echo "Picture nr $zd4ms";
	echo "</span>";
	echo "</center>";
	echo "</td>";

}

if (($zd1ms != '0')  || ($zd2ms != '0') || ($zd3ms != '0')  || ($zd4ms != '0')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}

$sqlpow1 = "SELECT pp1, pp1_bo FROM tab_dom_za where id_d = '$nu';";	
	$resultpow1 = @pg_Exec($conn, $sqlpow1);
	$pow1s = pg_result($resultpow1, 0, "pp1");
	$pow1sp = pg_result($resultpow1, 0, "pp1_bo");

$sqlpop1 = "SELECT pop1, pop1_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultpop1 = @pg_Exec($conn, $sqlpop1);
			$pop1s = pg_result($resultpop1, 0, "pop1");
			$pop1bo = pg_result($resultpop1, 0, "pop1_bo");
				
	$sqlpop1s = "SELECT nazwa_pod_en FROM podlogi where id = '$pop1s';";
			
			$resultpop1s = @pg_Exec($conn, $sqlpop1s);
			$pop1ps = pg_result($resultpop1s, 0, "nazwa_pod_en");

$sqlsc1 = "SELECT ps1, ps1_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultsc1 = @pg_Exec($conn, $sqlsc1);
			$psc1s = pg_result($resultsc1, 0, "ps1");
			$psc1bo = pg_result($resultsc1, 0, "ps1_bo");
				
	$sqlsc1s = "SELECT nazwa_sc_en FROM sciany where id = '$psc1s';";
			
			$resultsc1s = @pg_Exec($conn, $sqlsc1s);
			$psc1ps = pg_result($resultsc1s, 0, "nazwa_sc_en");

$sqlsuf1 = "SELECT psu1, psu1_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultsuf1 = @pg_Exec($conn, $sqlsuf1);
			$suf1s = pg_result($resultsuf1, 0, "psu1");
			$suf1bo = pg_result($resultsuf1, 0, "psu1_bo");
				
	$sqlsuf1s = "SELECT nazwa_su_en FROM sufit where id = '$suf1s';";
			
			$resultsuf1s = @pg_Exec($conn, $sqlsuf1s);
			$suf1ps = pg_result($resultsuf1s, 0, "nazwa_su_en");

$sqlwyp1 = "SELECT wyp1, wyp1_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultwyp1 = @pg_Exec($conn, $sqlwyp1);
			$wyp1s = pg_result($resultwyp1, 0, "wyp1");
			$wyp1bo = pg_result($resultwyp1, 0, "wyp1_bo");
				
	$sqlwyp1s = "SELECT nazwa_wp_en FROM wyposazenie where id = '$wyp1s';";
			
			$resultwyp1s = @pg_Exec($conn, $sqlwyp1s);
			$wyp1ps = pg_result($resultwyp1s, 0, "nazwa_wp_en");
			
$sqlpow2 = "SELECT pp2, pp2_bo FROM tab_dom_za where id_d = '$nu';";	
	$resultpow2 = @pg_Exec($conn, $sqlpow2);
	$pow2s = pg_result($resultpow2, 0, "pp2");
	$pow2sp = pg_result($resultpow2, 0, "pp2_bo");

$sqlpop2 = "SELECT pop2, pop2_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultpop2 = @pg_Exec($conn, $sqlpop2);
			$pop2s = pg_result($resultpop2, 0, "pop2");
			$pop2bo = pg_result($resultpop2, 0, "pop2_bo");
				
	$sqlpop2s = "SELECT nazwa_pod_en FROM podlogi where id = '$pop2s';";
			
			$resultpop2s = @pg_Exec($conn, $sqlpop2s);
			$pop2ps = pg_result($resultpop2s, 0, "nazwa_pod_en");

$sqlsc2 = "SELECT ps2, ps2_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultsc2 = @pg_Exec($conn, $sqlsc2);
			$psc2s = pg_result($resultsc2, 0, "ps2");
			$psc2bo = pg_result($resultsc2, 0, "ps2_bo");
				
	$sqlsc2s = "SELECT nazwa_sc_en FROM sciany where id = '$psc2s';";
			
			$resultsc2s = @pg_Exec($conn, $sqlsc2s);
			$psc2ps = pg_result($resultsc2s, 0, "nazwa_sc_en");

$sqlsuf2 = "SELECT psu2, psu2_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultsuf2 = @pg_Exec($conn, $sqlsuf2);
			$suf2s = pg_result($resultsuf2, 0, "psu2");
			$suf2bo = pg_result($resultsuf2, 0, "psu2_bo");
				
	$sqlsuf2s = "SELECT nazwa_su_en FROM sufit where id = '$suf2s';";
			
			$resultsuf2s = @pg_Exec($conn, $sqlsuf2s);
			$suf2ps = pg_result($resultsuf2s, 0, "nazwa_su_en");

$sqlwyp2 = "SELECT wyp2, wyp2_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultwyp2 = @pg_Exec($conn, $sqlwyp2);
			$wyp2s = pg_result($resultwyp2, 0, "wyp2");
			$wyp2bo = pg_result($resultwyp2, 0, "wyp2_bo");
				
	$sqlwyp2s = "SELECT nazwa_wp_en FROM wyposazenie where id = '$wyp2s';";
			
			$resultwyp2s = @pg_Exec($conn, $sqlwyp2s);
			$wyp2ps = pg_result($resultwyp2s, 0, "nazwa_wp_en");

$sqlpow3 = "SELECT pp3, pp3_bo FROM tab_dom_za where id_d = '$nu';";	
	$resultpow3 = @pg_Exec($conn, $sqlpow3);
	$pow3s = pg_result($resultpow3, 0, "pp3");
	$pow3sp = pg_result($resultpow3, 0, "pp3_bo");

$sqlpop3 = "SELECT pop3, pop3_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultpop3 = @pg_Exec($conn, $sqlpop3);
			$pop3s = pg_result($resultpop3, 0, "pop3");
			$pop3bo = pg_result($resultpop3, 0, "pop3_bo");
				
	$sqlpop3s = "SELECT nazwa_pod_en FROM podlogi where id = '$pop3s';";
			
			$resultpop3s = @pg_Exec($conn, $sqlpop3s);
			$pop3ps = pg_result($resultpop3s, 0, "nazwa_pod_en");

$sqlsc3 = "SELECT ps3, ps3_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultsc3 = @pg_Exec($conn, $sqlsc3);
			$psc3s = pg_result($resultsc3, 0, "ps3");
			$psc3bo = pg_result($resultsc3, 0, "ps3_bo");
				
	$sqlsc3s = "SELECT nazwa_sc_en FROM sciany where id = '$psc3s';";
			
			$resultsc3s = @pg_Exec($conn, $sqlsc3s);
			$psc3ps = pg_result($resultsc3s, 0, "nazwa_sc_en");

$sqlsuf3 = "SELECT psu3, psu3_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultsuf3 = @pg_Exec($conn, $sqlsuf3);
			$suf3s = pg_result($resultsuf3, 0, "psu3");
			$suf3bo = pg_result($resultsuf3, 0, "psu3_bo");
				
	$sqlsuf3s = "SELECT nazwa_su_en FROM sufit where id = '$suf3s';";
			
			$resultsuf3s = @pg_Exec($conn, $sqlsuf3s);
			$suf3ps = pg_result($resultsuf3s, 0, "nazwa_su_en");

$sqlwyp3 = "SELECT wyp3, wyp3_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultwyp3 = @pg_Exec($conn, $sqlwyp3);
			$wyp3s = pg_result($resultwyp3, 0, "wyp3");
			$wyp3bo = pg_result($resultwyp3, 0, "wyp3_bo");
				
	$sqlwyp3s = "SELECT nazwa_wp_en FROM wyposazenie where id = '$wyp3s';";
			
			$resultwyp3s = @pg_Exec($conn, $sqlwyp3s);
			$wyp3ps = pg_result($resultwyp3s, 0, "nazwa_wp_en");

$sqlpow4 = "SELECT pp4, pp4_bo FROM tab_dom_za where id_d = '$nu';";	
	$resultpow4 = @pg_Exec($conn, $sqlpow4);
	$pow4s = pg_result($resultpow4, 0, "pp4");
	$pow4sp = pg_result($resultpow4, 0, "pp4_bo");

$sqlpop4 = "SELECT pop4, pop4_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultpop4 = @pg_Exec($conn, $sqlpop4);
			$pop4s = pg_result($resultpop4, 0, "pop4");
			$pop4bo = pg_result($resultpop4, 0, "pop4_bo");
				
	$sqlpop4s = "SELECT nazwa_pod_en FROM podlogi where id = '$pop4s';";
			
			$resultpop4s = @pg_Exec($conn, $sqlpop4s);
			$pop4ps = pg_result($resultpop4s, 0, "nazwa_pod_en");

$sqlsc4 = "SELECT ps4, ps4_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultsc4 = @pg_Exec($conn, $sqlsc4);
			$psc4s = pg_result($resultsc4, 0, "ps4");
			$psc4bo = pg_result($resultsc4, 0, "ps4_bo");
				
	$sqlsc4s = "SELECT nazwa_sc_en FROM sciany where id = '$psc4s';";
			
			$resultsc4s = @pg_Exec($conn, $sqlsc4s);
			$psc4ps = pg_result($resultsc4s, 0, "nazwa_sc_en");

$sqlsuf4 = "SELECT psu4, psu4_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultsuf4 = @pg_Exec($conn, $sqlsuf4);
			$suf4s = pg_result($resultsuf4, 0, "psu4");
			$suf4bo = pg_result($resultsuf4, 0, "psu4_bo");
				
	$sqlsuf4s = "SELECT nazwa_su_en FROM sufit where id = '$suf4s';";
			
			$resultsuf4s = @pg_Exec($conn, $sqlsuf4s);
			$suf4ps = pg_result($resultsuf4s, 0, "nazwa_su_en");

$sqlwyp4 = "SELECT wyp4, wyp4_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultwyp4 = @pg_Exec($conn, $sqlwyp4);
			$wyp4s = pg_result($resultwyp4, 0, "wyp4");
			$wyp4bo = pg_result($resultwyp4, 0, "wyp4_bo");
				
	$sqlwyp4s = "SELECT nazwa_wp_en FROM wyposazenie where id = '$wyp4s';";
			
			$resultwyp4s = @pg_Exec($conn, $sqlwyp4s);
			$wyp4ps = pg_result($resultwyp4s, 0, "nazwa_wp_en");
			
$sqlpow5 = "SELECT pp5, pp5_bo FROM tab_dom_za where id_d = '$nu';";	
	$resultpow5 = @pg_Exec($conn, $sqlpow5);
	$pow5s = pg_result($resultpow5, 0, "pp5");
	$pow5sp = pg_result($resultpow5, 0, "pp5_bo");

$sqlpop5 = "SELECT pop5, pop5_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultpop5 = @pg_Exec($conn, $sqlpop5);
			$pop5s = pg_result($resultpop5, 0, "pop5");
			$pop5bo = pg_result($resultpop5, 0, "pop5_bo");
				
	$sqlpop5s = "SELECT nazwa_pod_en FROM podlogi where id = '$pop5s';";
			
			$resultpop5s = @pg_Exec($conn, $sqlpop5s);
			$pop5ps = pg_result($resultpop5s, 0, "nazwa_pod_en");

$sqlsc5 = "SELECT ps5, ps5_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultsc5 = @pg_Exec($conn, $sqlsc5);
			$psc5s = pg_result($resultsc5, 0, "ps5");
			$psc5bo = pg_result($resultsc5, 0, "ps5_bo");
				
	$sqlsc5s = "SELECT nazwa_sc_en FROM sciany where id = '$psc5s';";
			
			$resultsc5s = @pg_Exec($conn, $sqlsc5s);
			$psc5ps = pg_result($resultsc5s, 0, "nazwa_sc_en");

$sqlsuf5 = "SELECT psu5, psu5_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultsuf5 = @pg_Exec($conn, $sqlsuf5);
			$suf5s = pg_result($resultsuf5, 0, "psu5");
			$suf5bo = pg_result($resultsuf5, 0, "psu5_bo");
				
	$sqlsuf5s = "SELECT nazwa_su_en FROM sufit where id = '$suf5s';";
			
			$resultsuf5s = @pg_Exec($conn, $sqlsuf5s);
			$suf5ps = pg_result($resultsuf5s, 0, "nazwa_su_en");

$sqlwyp5 = "SELECT wyp5, wyp5_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultwyp5 = @pg_Exec($conn, $sqlwyp5);
			$wyp5s = pg_result($resultwyp5, 0, "wyp5");
			$wyp5bo = pg_result($resultwyp5, 0, "wyp5_bo");
				
	$sqlwyp5s = "SELECT nazwa_wp_en FROM wyposazenie where id = '$wyp5s';";
			
			$resultwyp5s = @pg_Exec($conn, $sqlwyp5s);
			$wyp5ps = pg_result($resultwyp5s, 0, "nazwa_wp_en");

$sqlpow6 = "SELECT pp6, pp6_bo FROM tab_dom_za where id_d = '$nu';";	
	$resultpow6 = @pg_Exec($conn, $sqlpow6);
	$pow6s = pg_result($resultpow6, 0, "pp6");
	$pow6sp = pg_result($resultpow6, 0, "pp6_bo");

$sqlpop6 = "SELECT pop6, pop6_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultpop6 = @pg_Exec($conn, $sqlpop6);
			$pop6s = pg_result($resultpop6, 0, "pop6");
			$pop6bo = pg_result($resultpop6, 0, "pop6_bo");
				
	$sqlpop6s = "SELECT nazwa_pod_en FROM podlogi where id = '$pop6s';";
			
			$resultpop6s = @pg_Exec($conn, $sqlpop6s);
			$pop6ps = pg_result($resultpop6s, 0, "nazwa_pod_en");

$sqlsc6 = "SELECT ps6, ps6_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultsc6 = @pg_Exec($conn, $sqlsc6);
			$psc6s = pg_result($resultsc6, 0, "ps6");
			$psc6bo = pg_result($resultsc6, 0, "ps6_bo");
				
	$sqlsc6s = "SELECT nazwa_sc_en FROM sciany where id = '$psc6s';";
			
			$resultsc6s = @pg_Exec($conn, $sqlsc6s);
			$psc6ps = pg_result($resultsc6s, 0, "nazwa_sc_en");

$sqlsuf6 = "SELECT psu6, psu6_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultsuf6 = @pg_Exec($conn, $sqlsuf6);
			$suf6s = pg_result($resultsuf6, 0, "psu6");
			$suf6bo = pg_result($resultsuf6, 0, "psu6_bo");
				
	$sqlsuf6s = "SELECT nazwa_su_en FROM sufit where id = '$suf6s';";
			
			$resultsuf6s = @pg_Exec($conn, $sqlsuf6s);
			$suf6ps = pg_result($resultsuf6s, 0, "nazwa_su_en");

$sqlwyp6 = "SELECT wyp6, wyp6_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultwyp6 = @pg_Exec($conn, $sqlwyp6);
			$wyp6s = pg_result($resultwyp6, 0, "wyp6");
			$wyp6bo = pg_result($resultwyp6, 0, "wyp6_bo");
				
	$sqlwyp6s = "SELECT nazwa_wp_en FROM wyposazenie where id = '$wyp6s';";
			
			$resultwyp6s = @pg_Exec($conn, $sqlwyp6s);
			$wyp6ps = pg_result($resultwyp6s, 0, "nazwa_wp_en");

$sqlpow7 = "SELECT pp7, pp7_bo FROM tab_dom_za where id_d = '$nu';";	
	$resultpow7 = @pg_Exec($conn, $sqlpow7);
	$pow7s = pg_result($resultpow7, 0, "pp7");
	$pow7sp = pg_result($resultpow7, 0, "pp7_bo");

$sqlpop7 = "SELECT pop7, pop7_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultpop7 = @pg_Exec($conn, $sqlpop7);
			$pop7s = pg_result($resultpop7, 0, "pop7");
			$pop7bo = pg_result($resultpop7, 0, "pop7_bo");
				
	$sqlpop7s = "SELECT nazwa_pod_en FROM podlogi where id = '$pop7s';";
			
			$resultpop7s = @pg_Exec($conn, $sqlpop7s);
			$pop7ps = pg_result($resultpop7s, 0, "nazwa_pod_en");

$sqlsc7 = "SELECT ps7, ps7_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultsc7 = @pg_Exec($conn, $sqlsc7);
			$psc7s = pg_result($resultsc7, 0, "ps7");
			$psc7bo = pg_result($resultsc7, 0, "ps7_bo");
				
	$sqlsc7s = "SELECT nazwa_sc_en FROM sciany where id = '$psc7s';";
			
			$resultsc7s = @pg_Exec($conn, $sqlsc7s);
			$psc7ps = pg_result($resultsc7s, 0, "nazwa_sc_en");

$sqlsuf7 = "SELECT psu7, psu7_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultsuf7 = @pg_Exec($conn, $sqlsuf7);
			$suf7s = pg_result($resultsuf7, 0, "psu7");
			$suf7bo = pg_result($resultsuf7, 0, "psu7_bo");
				
	$sqlsuf7s = "SELECT nazwa_su_en FROM sufit where id = '$suf7s';";
			
			$resultsuf7s = @pg_Exec($conn, $sqlsuf7s);
			$suf7ps = pg_result($resultsuf7s, 0, "nazwa_su_en");

$sqlwyp7 = "SELECT wyp7, wyp7_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultwyp7 = @pg_Exec($conn, $sqlwyp7);
			$wyp7s = pg_result($resultwyp7, 0, "wyp7");
			$wyp7bo = pg_result($resultwyp7, 0, "wyp7_bo");
				
	$sqlwyp7s = "SELECT nazwa_wp_en FROM wyposazenie where id = '$wyp7s';";
			
			$resultwyp7s = @pg_Exec($conn, $sqlwyp7s);
			$wyp7ps = pg_result($resultwyp7s, 0, "nazwa_wp_en");


$sqlpow8 = "SELECT pp8, pp8_bo FROM tab_dom_za where id_d = '$nu';";	
	$resultpow8 = @pg_Exec($conn, $sqlpow8);
	$pow8s = pg_result($resultpow8, 0, "pp8");
	$pow8sp = pg_result($resultpow8, 0, "pp8_bo");

$sqlpop8 = "SELECT pop8, pop8_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultpop8 = @pg_Exec($conn, $sqlpop8);
			$pop8s = pg_result($resultpop8, 0, "pop8");
			$pop8bo = pg_result($resultpop8, 0, "pop8_bo");
				
	$sqlpop8s = "SELECT nazwa_pod_en FROM podlogi where id = '$pop8s';";
			
			$resultpop8s = @pg_Exec($conn, $sqlpop8s);
			$pop8ps = pg_result($resultpop8s, 0, "nazwa_pod_en");

$sqlsc8 = "SELECT ps8, ps8_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultsc8 = @pg_Exec($conn, $sqlsc8);
			$psc8s = pg_result($resultsc8, 0, "ps8");
			$psc8bo = pg_result($resultsc8, 0, "ps8_bo");
				
	$sqlsc8s = "SELECT nazwa_sc_en FROM sciany where id = '$psc8s';";
			
			$resultsc8s = @pg_Exec($conn, $sqlsc8s);
			$psc8ps = pg_result($resultsc8s, 0, "nazwa_sc_en");

$sqlsuf8 = "SELECT psu8, psu8_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultsuf8 = @pg_Exec($conn, $sqlsuf8);
			$suf8s = pg_result($resultsuf8, 0, "psu8");
			$suf8bo = pg_result($resultsuf8, 0, "psu8_bo");
				
	$sqlsuf8s = "SELECT nazwa_su_en FROM sufit where id = '$suf8s';";
			
			$resultsuf8s = @pg_Exec($conn, $sqlsuf8s);
			$suf8ps = pg_result($resultsuf8s, 0, "nazwa_su_en");

$sqlwyp8 = "SELECT wyp8, wyp8_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultwyp8 = @pg_Exec($conn, $sqlwyp8);
			$wyp8s = pg_result($resultwyp8, 0, "wyp8");
			$wyp8bo = pg_result($resultwyp8, 0, "wyp8_bo");
				
	$sqlwyp8s = "SELECT nazwa_wp_en FROM wyposazenie where id = '$wyp8s';";
			
			$resultwyp8s = @pg_Exec($conn, $sqlwyp8s);
			$wyp8ps = pg_result($resultwyp8s, 0, "nazwa_wp_en");

$sqlpow9 = "SELECT pp9, pp9_bo FROM tab_dom_za where id_d = '$nu';";	
	$resultpow9 = @pg_Exec($conn, $sqlpow9);
	$pow9s = pg_result($resultpow9, 0, "pp9");
	$pow9sp = pg_result($resultpow9, 0, "pp9_bo");

$sqlpop9 = "SELECT pop9, pop9_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultpop9 = @pg_Exec($conn, $sqlpop9);
			$pop9s = pg_result($resultpop9, 0, "pop9");
			$pop9bo = pg_result($resultpop9, 0, "pop9_bo");
				
	$sqlpop9s = "SELECT nazwa_pod_en FROM podlogi where id = '$pop9s';";
			
			$resultpop9s = @pg_Exec($conn, $sqlpop9s);
			$pop9ps = pg_result($resultpop9s, 0, "nazwa_pod_en");

$sqlsc9 = "SELECT ps9, ps9_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultsc9 = @pg_Exec($conn, $sqlsc9);
			$psc9s = pg_result($resultsc9, 0, "ps9");
			$psc9bo = pg_result($resultsc9, 0, "ps9_bo");
				
	$sqlsc9s = "SELECT nazwa_sc_en FROM sciany where id = '$psc9s';";
			
			$resultsc9s = @pg_Exec($conn, $sqlsc9s);
			$psc9ps = pg_result($resultsc9s, 0, "nazwa_sc_en");

$sqlsuf9 = "SELECT psu9, psu9_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultsuf9 = @pg_Exec($conn, $sqlsuf9);
			$suf9s = pg_result($resultsuf9, 0, "psu9");
			$suf9bo = pg_result($resultsuf9, 0, "psu9_bo");
				
	$sqlsuf9s = "SELECT nazwa_su_en FROM sufit where id = '$suf9s';";
			
			$resultsuf9s = @pg_Exec($conn, $sqlsuf9s);
			$suf9ps = pg_result($resultsuf9s, 0, "nazwa_su_en");

$sqlwyp9 = "SELECT wyp9, wyp9_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultwyp9 = @pg_Exec($conn, $sqlwyp9);
			$wyp9s = pg_result($resultwyp9, 0, "wyp9");
			$wyp9bo = pg_result($resultwyp9, 0, "wyp9_bo");
				
	$sqlwyp9s = "SELECT nazwa_wp_en FROM wyposazenie where id = '$wyp9s';";
			
			$resultwyp9s = @pg_Exec($conn, $sqlwyp9s);
			$wyp9ps = pg_result($resultwyp9s, 0, "nazwa_wp_en");

$sqlpow10 = "SELECT pp10, pp10_bo FROM tab_dom_za where id_d = '$nu';";	
	$resultpow10 = @pg_Exec($conn, $sqlpow10);
	$pow10s = pg_result($resultpow10, 0, "pp10");
	$pow10sp = pg_result($resultpow10, 0, "pp10_bo");

$sqlpop10 = "SELECT pop10, pop10_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultpop10 = @pg_Exec($conn, $sqlpop10);
			$pop10s = pg_result($resultpop10, 0, "pop10");
			$pop10bo = pg_result($resultpop10, 0, "pop10_bo");
				
	$sqlpop10s = "SELECT nazwa_pod_en FROM podlogi where id = '$pop10s';";
			
			$resultpop10s = @pg_Exec($conn, $sqlpop10s);
			$pop10ps = pg_result($resultpop10s, 0, "nazwa_pod_en");

$sqlsc10 = "SELECT ps10, ps10_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultsc10 = @pg_Exec($conn, $sqlsc10);
			$psc10s = pg_result($resultsc10, 0, "ps10");
			$psc10bo = pg_result($resultsc10, 0, "ps10_bo");
				
	$sqlsc10s = "SELECT nazwa_sc_en FROM sciany where id = '$psc10s';";
			
			$resultsc10s = @pg_Exec($conn, $sqlsc10s);
			$psc10ps = pg_result($resultsc10s, 0, "nazwa_sc_en");

$sqlsuf10 = "SELECT psu10, psu10_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultsuf10 = @pg_Exec($conn, $sqlsuf10);
			$suf10s = pg_result($resultsuf10, 0, "psu10");
			$suf10bo = pg_result($resultsuf10, 0, "psu10_bo");
				
	$sqlsuf10s = "SELECT nazwa_su_en FROM sufit where id = '$suf10s';";
			
			$resultsuf10s = @pg_Exec($conn, $sqlsuf10s);
			$suf10ps = pg_result($resultsuf10s, 0, "nazwa_su_en");

$sqlwyp10 = "SELECT wyp10, wyp10_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultwyp10 = @pg_Exec($conn, $sqlwyp10);
			$wyp10s = pg_result($resultwyp10, 0, "wyp10");
			$wyp10bo = pg_result($resultwyp10, 0, "wyp10_bo");
				
	$sqlwyp10s = "SELECT nazwa_wp_en FROM wyposazenie where id = '$wyp10s';";
			
			$resultwyp10s = @pg_Exec($conn, $sqlwyp10s);
			$wyp10ps = pg_result($resultwyp10s, 0, "nazwa_wp_en");

$sqlpow11 = "SELECT pp11, pp11_bo FROM tab_dom_za where id_d = '$nu';";	
	$resultpow11 = @pg_Exec($conn, $sqlpow11);
	$pow11s = pg_result($resultpow11, 0, "pp11");
	$pow11sp = pg_result($resultpow11, 0, "pp11_bo");

$sqlpop11 = "SELECT pop11, pop11_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultpop11 = @pg_Exec($conn, $sqlpop11);
			$pop11s = pg_result($resultpop11, 0, "pop11");
			$pop11bo = pg_result($resultpop11, 0, "pop11_bo");
				
	$sqlpop11s = "SELECT nazwa_pod_en FROM podlogi where id = '$pop11s';";
			
			$resultpop11s = @pg_Exec($conn, $sqlpop11s);
			$pop11ps = pg_result($resultpop11s, 0, "nazwa_pod_en");

$sqlsc11 = "SELECT ps11, ps11_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultsc11 = @pg_Exec($conn, $sqlsc11);
			$psc11s = pg_result($resultsc11, 0, "ps11");
			$psc11bo = pg_result($resultsc11, 0, "ps11_bo");
				
	$sqlsc11s = "SELECT nazwa_sc_en FROM sciany where id = '$psc11s';";
			
			$resultsc11s = @pg_Exec($conn, $sqlsc11s);
			$psc11ps = pg_result($resultsc11s, 0, "nazwa_sc_en");

$sqlsuf11 = "SELECT psu11, psu11_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultsuf11 = @pg_Exec($conn, $sqlsuf11);
			$suf11s = pg_result($resultsuf11, 0, "psu11");
			$suf11bo = pg_result($resultsuf11, 0, "psu11_bo");
				
	$sqlsuf11s = "SELECT nazwa_su_en FROM sufit where id = '$suf11s';";
			
			$resultsuf11s = @pg_Exec($conn, $sqlsuf11s);
			$suf11ps = pg_result($resultsuf11s, 0, "nazwa_su_en");

$sqlwyp11 = "SELECT wyp11, wyp11_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultwyp11 = @pg_Exec($conn, $sqlwyp11);
			$wyp11s = pg_result($resultwyp11, 0, "wyp11");
			$wyp11bo = pg_result($resultwyp11, 0, "wyp11_bo");
				
	$sqlwyp11s = "SELECT nazwa_wp_en FROM wyposazenie where id = '$wyp11s';";
			
			$resultwyp11s = @pg_Exec($conn, $sqlwyp11s);
			$wyp11ps = pg_result($resultwyp11s, 0, "nazwa_wp_en");

$sqlpow12 = "SELECT pp12, pp12_bo FROM tab_dom_za where id_d = '$nu';";	
	$resultpow12 = @pg_Exec($conn, $sqlpow12);
	$pow12s = pg_result($resultpow12, 0, "pp12");
	$pow12sp = pg_result($resultpow12, 0, "pp12_bo");

$sqlpop12 = "SELECT pop12, pop12_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultpop12 = @pg_Exec($conn, $sqlpop12);
			$pop12s = pg_result($resultpop12, 0, "pop12");
			$pop12bo = pg_result($resultpop12, 0, "pop12_bo");
				
	$sqlpop12s = "SELECT nazwa_pod_en FROM podlogi where id = '$pop12s';";
			
			$resultpop12s = @pg_Exec($conn, $sqlpop12s);
			$pop12ps = pg_result($resultpop12s, 0, "nazwa_pod_en");

$sqlsc12 = "SELECT ps12, ps12_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultsc12 = @pg_Exec($conn, $sqlsc12);
			$psc12s = pg_result($resultsc12, 0, "ps12");
			$psc12bo = pg_result($resultsc12, 0, "ps12_bo");
				
	$sqlsc12s = "SELECT nazwa_sc_en FROM sciany where id = '$psc12s';";
			
			$resultsc12s = @pg_Exec($conn, $sqlsc12s);
			$psc12ps = pg_result($resultsc12s, 0, "nazwa_sc_en");

$sqlsuf12 = "SELECT psu12, psu12_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultsuf12 = @pg_Exec($conn, $sqlsuf12);
			$suf12s = pg_result($resultsuf12, 0, "psu12");
			$suf12bo = pg_result($resultsuf12, 0, "psu12_bo");
				
	$sqlsuf12s = "SELECT nazwa_su_en FROM sufit where id = '$suf12s';";
			
			$resultsuf12s = @pg_Exec($conn, $sqlsuf12s);
			$suf12ps = pg_result($resultsuf12s, 0, "nazwa_su_en");

$sqlwyp12 = "SELECT wyp12, wyp12_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultwyp12 = @pg_Exec($conn, $sqlwyp12);
			$wyp12s = pg_result($resultwyp12, 0, "wyp12");
			$wyp12bo = pg_result($resultwyp12, 0, "wyp12_bo");
				
	$sqlwyp12s = "SELECT nazwa_wp_en FROM wyposazenie where id = '$wyp12s';";
			
			$resultwyp12s = @pg_Exec($conn, $sqlwyp12s);
			$wyp12ps = pg_result($resultwyp12s, 0, "nazwa_wp_en");

if (($pow1sp == 't')  || ($pop1bo == 't') || ($psc1bo == 't')  || ($suf1bo == 't') || ($wyp1bo == 't') || ($pow2sp == 't')  || ($pop2bo == 't') || ($psc2bo == 't')  || ($suf2bo == 't') || ($wyp2bo == 't') || ($pow3sp == 't')  || ($pop3bo == 't') || ($psc3bo == 't')  || ($suf3bo == 't') || ($wyp3bo == 't') || ($pow4sp == 't')  || ($pop4bo == 't') || ($psc4bo == 't')  || ($suf4bo == 't') || ($wyp4bo == 't') || ($pow5sp == 't')  || ($pop5bo == 't') || ($psc5bo == 't')  || ($suf5bo == 't') || ($wyp5bo == 't') || ($pow6sp == 't')  || ($pop6bo == 't') || ($psc6bo == 't')  || ($suf6bo == 't') || ($wyp6bo == 't') || ($pow7sp == 't')  || ($pop7bo == 't') || ($psc7bo == 't')  || ($suf7bo == 't') || ($wyp7bo == 't') || ($pow8sp == 't')  || ($pop8bo == 't') || ($psc8bo == 't')  || ($suf8bo == 't') || ($wyp8bo == 't') || ($pow9sp == 't')  || ($pop9bo == 't') || ($psc9bo == 't')  || ($suf9bo == 't') || ($wyp9bo == 't') || ($pow10sp == 't')  || ($pop10bo == 't') || ($psc10bo == 't')  || ($suf10bo == 't') || ($wyp10bo == 't') || ($pow11sp == 't')  || ($pop11bo == 't') || ($psc11bo == 't')  || ($suf11bo == 't') || ($wyp11bo == 't') || ($pow12sp == 't')  || ($pop12bo == 't') || ($psc12bo == 't')  || ($suf12bo == 't') || ($wyp12bo == 't')) {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

echo "<tr><td colspan=\"40\" height=\"7\" bgcolor=\"#5865E5\">";
echo "<span class=\"nag1wb\">";
echo "&nbsp;Rooms";
echo "</span>";
echo "</td></tr>";

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}
if (($pow1sp == 't')  || ($pop1bo == 't') || ($psc1bo == 't')  || ($suf1bo == 't')) {
echo "<tr>"; 
}
if ($pow1sp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Meas. room 1:</b><br>&nbsp;$pow1s m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($pop1bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Floor room 1:</b><br>&nbsp;$pop1ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($psc1bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Walls room 1:</b><br>&nbsp;$psc1ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($suf1bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Ceiling room 1:</b><br>&nbsp;$suf1ps";
echo "</td>";

}

if (($pow1sp == 't')  || ($pop1bo == 't') || ($psc1bo == 't')  || ($suf1bo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}


if ($wyp1bo == 't') {

echo "<tr>";

echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Equipment room 1:</b><br>&nbsp;$wyp1ps";
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
echo "&nbsp;<b>Meas. room 2:</b><br>&nbsp;$pow2s m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($pop2bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Floor room 2:</b><br>&nbsp;$pop2ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($psc2bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Walls room 2:</b><br>&nbsp;$psc2ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($suf2bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Ceiling room 2:</b><br>&nbsp;$suf2ps";
echo "</td>";

}


if ( ($pow2sp == 't')  || ($pop2bo == 't') || ($psc2bo == 't')  || ($suf2bo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}

if ($wyp2bo == 't') {

echo "<tr>";

echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Equipment room 2:</b><br>&nbsp;$wyp2ps";
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
echo "&nbsp;<b>Meas. room 3:</b><br>&nbsp;$pow3s m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($pop3bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Floor room 3:</b><br>&nbsp;$pop3ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($psc3bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Walls room 3:</b><br>&nbsp;$psc3ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($suf3bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Ceiling room 3:</b><br>&nbsp;$suf3ps";
echo "</td>";

}

if ( ($pow3sp == 't')  || ($pop3bo == 't') || ($psc3bo == 't')  || ($suf3bo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}

if ($wyp3bo == 't') {

echo "<tr>";

echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Equipment room 3:</b><br>&nbsp;$wyp3ps";
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
echo "&nbsp;<b>Meas. room 4:</b><br>&nbsp;$pow4s m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($pop4bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Floor room 4:</b><br>&nbsp;$pop4ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($psc4bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Walls room 4:</b><br>&nbsp;$psc4ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($suf4bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Ceiling room 4:</b><br>&nbsp;$suf4ps";
echo "</td>";

}

if ( ($pow4sp == 't')  || ($pop4bo == 't') || ($psc4bo == 't')  || ($suf4bo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}

if ($wyp4bo == 't') {

echo "<tr>";

echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Equipment room 4:</b><br>&nbsp;$wyp4ps";
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
echo "&nbsp;<b>Meas. room 5:</b><br>&nbsp;$pow5s m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($pop5bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Floor room 5:</b><br>&nbsp;$pop5ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($psc5bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Walls room 5:</b><br>&nbsp;$psc5ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($suf5bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Ceiling room 5:</b><br>&nbsp;$suf5ps";
echo "</td>";

}

if ( ($pow5sp == 't')  || ($pop5bo == 't') || ($psc5bo == 't')  || ($suf5bo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}

if ($wyp5bo == 't') {

echo "<tr>";

echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Equipment room 5:</b><br>&nbsp;$wyp5ps";
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
echo "&nbsp;<b>Meas. room 6:</b><br>&nbsp;$pow6s m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($pop6bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Floor room 6:</b><br>&nbsp;$pop6ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($psc6bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Walls room 6:</b><br>&nbsp;$psc6ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($suf6bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Ceiling room 6:</b><br>&nbsp;$suf6ps";
echo "</td>";

}

if ( ($pow6sp == 't')  || ($pop6bo == 't') || ($psc6bo == 't')  || ($suf6bo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}

if ($wyp6bo == 't') {

echo "<tr>";

echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Equipment room 6:</b><br>&nbsp;$wyp6ps";
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
echo "&nbsp;<b>Meas. room 7:</b><br>&nbsp;$pow7s m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($pop7bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Floor room 7:</b><br>&nbsp;$pop7ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($psc7bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Walls room 7:</b><br>&nbsp;$psc7ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($suf7bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Ceiling room 7:</b><br>&nbsp;$suf7ps";
echo "</td>";

}

if ( ($pow7sp == 't')  || ($pop7bo == 't') || ($psc7bo == 't')  || ($suf7bo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}

if ($wyp7bo == 't') {

echo "<tr>";

echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Equipment room 7:</b><br>&nbsp;$wyp7ps";
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
echo "&nbsp;<b>Meas. room 8:</b><br>&nbsp;$pow8s m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($pop8bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Floor room 8:</b><br>&nbsp;$pop8ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($psc8bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Walls room 8:</b><br>&nbsp;$psc8ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($suf8bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Ceiling room 8:</b><br>&nbsp;$suf8ps";
echo "</td>";

}

if ( ($pow8sp == 't')  || ($pop8bo == 't') || ($psc8bo == 't')  || ($suf8bo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}

if ($wyp8bo == 't') {

echo "<tr>";

echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Equipment room 8:</b><br>&nbsp;$wyp8ps";
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
echo "&nbsp;<b>Meas. room 9:</b><br>&nbsp;$pow9s m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($pop9bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Floor room 9:</b><br>&nbsp;$pop9ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($psc9bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Walls room 9:</b><br>&nbsp;$psc9ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($suf9bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Ceiling room 9:</b><br>&nbsp;$suf9ps";
echo "</td>";

}


if ( ($pow9sp == 't')  || ($pop9bo == 't') || ($psc9bo == 't')  || ($suf9bo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}

if ($wyp9bo == 't') {

echo "<tr>";

echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Equipment room 9:</b><br>&nbsp;$wyp9ps";
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
echo "&nbsp;<b>Meas. room 10:</b><br>&nbsp;$pow10s m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($pop10bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Floor room 10:</b><br>&nbsp;$pop10ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($psc10bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Walls room 10:</b><br>&nbsp;$psc10ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($suf10bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Ceiling room 10:</b><br>&nbsp;$suf10ps";
echo "</td>";

}

if ( ($pow10sp == 't')  || ($pop10bo == 't') || ($psc10bo == 't')  || ($suf10bo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}

if ($wyp10bo == 't') {

echo "<tr>";

echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Equipment room 10:</b><br>&nbsp;$wyp10ps";
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
echo "&nbsp;<b>Meas. room 11:</b><br>&nbsp;$pow11s m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($pop11bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Floor room 11:</b><br>&nbsp;$pop11ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($psc11bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Walls room 11:</b><br>&nbsp;$psc11ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($suf11bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Ceiling room 11:</b><br>&nbsp;$suf11ps";
echo "</td>";

}

if ( ($pow11sp == 't')  || ($pop11bo == 't') || ($psc11bo == 't')  || ($suf11bo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}

if ($wyp11bo == 't') {

echo "<tr>";

echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Equipment room 11:</b><br>&nbsp;$wyp11ps";
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
echo "&nbsp;<b>Meas. room 12:</b><br>&nbsp;$pow12s m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($pop12bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Floor room 12:</b><br>&nbsp;$pop12ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($psc12bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Walls room 12:</b><br>&nbsp;$psc12ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($suf12bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Ceiling room 12:</b><br>&nbsp;$suf12ps";
echo "</td>";

}

if ( ($pow12sp == 't')  || ($pop12bo == 't') || ($psc12bo == 't')  || ($suf12bo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}

if ($wyp12bo == 't') {

echo "<tr>";

echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Equipment room 12:</b><br>&nbsp;$wyp12ps";
echo "</td>";

echo "</tr>";

}	

if ($wyp12bo == 't') {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}


$sqlzd5 = "SELECT zd5 FROM tab_dom_za where id_d = '$nu';";
			
	$resultzd5s = @pg_Exec($conn, $sqlzd5);
	$zd5ms = pg_result($resultzd5s, 0, "zd5");

$sqlzd6 = "SELECT zd6 FROM tab_dom_za where id_d = '$nu';";
			
	$resultzd6s = @pg_Exec($conn, $sqlzd6);
	$zd6ms = pg_result($resultzd6s, 0, "zd6");

$sqlzd7 = "SELECT zd7 FROM tab_dom_za where id_d = '$nu';";
			
	$resultzd7s = @pg_Exec($conn, $sqlzd7);
	$zd7ms = pg_result($resultzd7s, 0, "zd7");

$sqlzd8 = "SELECT zd8 FROM tab_dom_za where id_d = '$nu';";
			
	$resultzd8s = @pg_Exec($conn, $sqlzd8);
	$zd8ms = pg_result($resultzd8s, 0, "zd8");

if (($zd5ms != '0')  || ($zd6ms != '0') || ($zd7ms != '0')  || ($zd8ms != '0')) {

echo "<tr><td colspan=\"40\" height=\"7\" bgcolor=\"#5865E5\">";
echo "<span class=\"nag1wb\">";
echo "&nbsp;Pictures";
echo "</span>";
echo "</td></tr>";

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
echo "<tr>"; 
}


if ($zd5ms != '0') {	

	echo "<td width=\"127\">";
	echo "<center>";
	echo "<a href=\"image.php?p=../img/zd$zd5ms$ok&w=550&h=350&i=Picture%20nr\"$zd5ms\"\" onclick=\"NewWindow(this.href,'name','570','370','no');return false;\">";
	echo "<img src=\"../img/zd$zd5ms.jpg\" width=\"125\" height=\"100\" border=\"0\" alt=\"Picture nr$zd5ms\"></img></a><br><span class=\"\">";
	echo "Picture nr $zd5ms";
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
	echo "<a href=\"image.php?p=../img/zd$zd6ms$ok&w=550&h=350&i=Picture%20nr\"$zd6ms\"\" onclick=\"NewWindow(this.href,'name','570','370','no');return false;\">";
	echo "<img src=\"../img/zd$zd6ms.jpg\" width=\"125\" height=\"100\" border=\"0\" alt=\"Picture nr$zd6ms\"></img></a><br><span class=\"\">";
	echo "Picture nr $zd6ms";
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
	echo "<a href=\"image.php?p=../img/zd$zd7ms$ok&w=550&h=350&i=Picture%20nr\"$zd7ms\"\" onclick=\"NewWindow(this.href,'name','570','370','no');return false;\">";
	echo "<img src=\"../img/zd$zd7ms.jpg\" width=\"125\" height=\"100\" border=\"0\" alt=\"Picture nr$zd7ms\"></img></a><br><span class=\"\">";
	echo "Picture nr $zd7ms";
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
	echo "<a href=\"image.php?p=../img/zd$zd8ms$ok&w=550&h=350&i=Picture%20nr\"$zd8ms\"\" onclick=\"NewWindow(this.href,'name','570','370','no');return false;\">";
	echo "<img src=\"../img/zd$zd8ms.jpg\" width=\"125\" height=\"100\" border=\"0\" alt=\"Picture nr$zd8ms\"></img></a><br><span class=\"\">";
	echo "Picture nr $zd8ms";
	echo "</span>";
	echo "</center>";
	echo "</td>";

}


if (($zd5ms != '0')  || ($zd6ms != '0') || ($zd7ms != '0')  || ($zd8ms != '0')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}


$sqlkuch1 = "SELECT tk1, tk1_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultkuch1 = @pg_Exec($conn, $sqlkuch1);
			$kuchs1 = pg_result($resultkuch1, 0, "tk1");
			$kuchbo1 = pg_result($resultkuch1, 0, "tk1_bo");
				
	$sqlkuchs1 = "SELECT nazwa_ku_en FROM typ_kuchni where id = '$kuchs1';";
			
			$resultkuchs1 = @pg_Exec($conn, $sqlkuchs1);
			$kuchps1 = pg_result($resultkuchs1, 0, "nazwa_ku_en");

$sqlrokuch1 = "SELECT rk1, rk1_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultrokuch1 = @pg_Exec($conn, $sqlrokuch1);
			$rokuchs1 = pg_result($resultrokuch1, 0, "rk1");
			$rokuchbo1 = pg_result($resultrokuch1, 0, "rk1_bo");
				
	$sqlrokuchs1 = "SELECT nazwa_kuch_en FROM rodzaj_kuchni where id = '$rokuchs1';";
			
			$resultrokuchs1 = @pg_Exec($conn, $sqlrokuchs1);
			$rokuchps1 = pg_result($resultrokuchs1, 0, "nazwa_kuch_en");

$sqlpowkuch1 = "SELECT kp1, kp1_bo FROM tab_dom_za where id_d = '$nu';";	
	$resultpowkuch1 = @pg_Exec($conn, $sqlpowkuch1);
	$powkuch1 = pg_result($resultpowkuch1, 0, "kp1");
	$powkuchp1 = pg_result($resultpowkuch1, 0, "kp1_bo");


$sqlpodkuch1 = "SELECT kpo1, kpo1_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultpodkuch1 = @pg_Exec($conn, $sqlpodkuch1);
			$podkuch1 = pg_result($resultpodkuch1, 0, "kpo1");
			$podkuchbo1 = pg_result($resultpodkuch1, 0, "kpo1_bo");
				
	$sqlpodkuchs1 = "SELECT nazwa_pod_en FROM podlogi where id = '$podkuch1';";
			
			$resultpodkuchs1 = @pg_Exec($conn, $sqlpodkuchs1);
			$podkuchps1 = pg_result($resultpodkuchs1, 0, "nazwa_pod_en");

$sqlkuchsc1 = "SELECT kps1, kps1_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultkuchsc1 = @pg_Exec($conn, $sqlkuchsc1);
			$kuchsc1 = pg_result($resultkuchsc1, 0, "kps1");
			$kuchscbo1 = pg_result($resultkuchsc1, 0, "kps1_bo");
				
$sqlkuchscs1 = "SELECT nazwa_sc_en FROM sciany where id = '$kuchsc1';";
			
			$resultkuchscs1 = @pg_Exec($conn, $sqlkuchscs1);
			$kuchscps1 = pg_result($resultkuchscs1, 0, "nazwa_sc_en");

$sqlkuchsuf1 = "SELECT kpsu1, kpsu1_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultkuchsuf1 = @pg_Exec($conn, $sqlkuchsuf1);
			$kuchsuf1 = pg_result($resultkuchsuf1, 0, "kpsu1");
			$kuchsufbo1 = pg_result($resultkuchsuf1, 0, "kpsu1_bo");
				
	$sqlkuchsufs1 = "SELECT nazwa_su_en FROM sufit where id = '$kuchsuf1';";
			
			$resultkuchsufs1 = @pg_Exec($conn, $sqlkuchsufs1);
			$kuchsufps1 = pg_result($resultkuchsufs1, 0, "nazwa_su_en");

$sqlkuchwyp1 = "SELECT kwyp1, kwyp1_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultkuchwyp1 = @pg_Exec($conn, $sqlkuchwyp1);
			$kuchwyp1 = pg_result($resultkuchwyp1, 0, "kwyp1");
			$kuchwypbo1 = pg_result($resultkuchwyp1, 0, "kwyp1_bo");
				
	$sqlkuchwyps1 = "SELECT nazwa_wp_en FROM wyposazenie where id = '$kuchwyp1';";
			
			$resultkuchwyps1 = @pg_Exec($conn, $sqlkuchwyps1);
			$kuchwypps1 = pg_result($resultkuchwyps1, 0, "nazwa_wp_en");


$sqlkuch2 = "SELECT tk2, tk2_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultkuch2 = @pg_Exec($conn, $sqlkuch2);
			$kuchs2 = pg_result($resultkuch2, 0, "tk2");
			$kuchbo2 = pg_result($resultkuch2, 0, "tk2_bo");
				
	$sqlkuchs2 = "SELECT nazwa_ku_en FROM typ_kuchni where id = '$kuchs2';";
			
			$resultkuchs2 = @pg_Exec($conn, $sqlkuchs2);
			$kuchps2 = pg_result($resultkuchs2, 0, "nazwa_ku_en");

$sqlrokuch2 = "SELECT rk2, rk2_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultrokuch2 = @pg_Exec($conn, $sqlrokuch2);
			$rokuchs2 = pg_result($resultrokuch2, 0, "rk2");
			$rokuchbo2 = pg_result($resultrokuch2, 0, "rk2_bo");
				
	$sqlrokuchs2 = "SELECT nazwa_kuch_en FROM rodzaj_kuchni where id = '$rokuchs2';";
			
			$resultrokuchs2 = @pg_Exec($conn, $sqlrokuchs2);
			$rokuchps2 = pg_result($resultrokuchs2, 0, "nazwa_kuch_en");

$sqlpowkuch2 = "SELECT kp2, kp2_bo FROM tab_dom_za where id_d = '$nu';";	
	$resultpowkuch2 = @pg_Exec($conn, $sqlpowkuch2);
	$powkuch2 = pg_result($resultpowkuch2, 0, "kp2");
	$powkuchp2 = pg_result($resultpowkuch2, 0, "kp2_bo");


$sqlpodkuch2 = "SELECT kpo2, kpo2_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultpodkuch2 = @pg_Exec($conn, $sqlpodkuch2);
			$podkuch2 = pg_result($resultpodkuch2, 0, "kpo2");
			$podkuchbo2 = pg_result($resultpodkuch2, 0, "kpo2_bo");
				
	$sqlpodkuchs2 = "SELECT nazwa_pod_en FROM podlogi where id = '$podkuch2';";
			
			$resultpodkuchs2 = @pg_Exec($conn, $sqlpodkuchs2);
			$podkuchps2 = pg_result($resultpodkuchs2, 0, "nazwa_pod_en");

$sqlkuchsc2 = "SELECT kps2, kps2_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultkuchsc2 = @pg_Exec($conn, $sqlkuchsc2);
			$kuchsc2 = pg_result($resultkuchsc2, 0, "kps2");
			$kuchscbo2 = pg_result($resultkuchsc2, 0, "kps2_bo");
				
$sqlkuchscs2 = "SELECT nazwa_sc_en FROM sciany where id = '$kuchsc2';";
			
			$resultkuchscs2 = @pg_Exec($conn, $sqlkuchscs2);
			$kuchscps2 = pg_result($resultkuchscs2, 0, "nazwa_sc_en");

$sqlkuchsuf2 = "SELECT kpsu2, kpsu2_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultkuchsuf2 = @pg_Exec($conn, $sqlkuchsuf2);
			$kuchsuf2 = pg_result($resultkuchsuf2, 0, "kpsu2");
			$kuchsufbo2 = pg_result($resultkuchsuf2, 0, "kpsu2_bo");
				
	$sqlkuchsufs2 = "SELECT nazwa_su_en FROM sufit where id = '$kuchsuf2';";
			
			$resultkuchsufs2 = @pg_Exec($conn, $sqlkuchsufs2);
			$kuchsufps2 = pg_result($resultkuchsufs2, 0, "nazwa_su_en");

$sqlkuchwyp2 = "SELECT kwyp2, kwyp2_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultkuchwyp2 = @pg_Exec($conn, $sqlkuchwyp2);
			$kuchwyp2 = pg_result($resultkuchwyp2, 0, "kwyp2");
			$kuchwypbo2 = pg_result($resultkuchwyp2, 0, "kwyp2_bo");
				
	$sqlkuchwyps2 = "SELECT nazwa_wp_en FROM wyposazenie where id = '$kuchwyp2';";
			
			$resultkuchwyps2 = @pg_Exec($conn, $sqlkuchwyps2);
			$kuchwypps2 = pg_result($resultkuchwyps2, 0, "nazwa_wp_en");

$sqlkuch3 = "SELECT tk3, tk3_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultkuch3 = @pg_Exec($conn, $sqlkuch3);
			$kuchs3 = pg_result($resultkuch3, 0, "tk3");
			$kuchbo3 = pg_result($resultkuch3, 0, "tk3_bo");
				
	$sqlkuchs3 = "SELECT nazwa_ku_en FROM typ_kuchni where id = '$kuchs3';";
			
			$resultkuchs3 = @pg_Exec($conn, $sqlkuchs3);
			$kuchps3 = pg_result($resultkuchs3, 0, "nazwa_ku_en");

$sqlrokuch3 = "SELECT rk3, rk3_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultrokuch3 = @pg_Exec($conn, $sqlrokuch3);
			$rokuchs3 = pg_result($resultrokuch3, 0, "rk3");
			$rokuchbo3 = pg_result($resultrokuch3, 0, "rk3_bo");
				
	$sqlrokuchs3 = "SELECT nazwa_kuch_en FROM rodzaj_kuchni where id = '$rokuchs3';";
			
			$resultrokuchs3 = @pg_Exec($conn, $sqlrokuchs3);
			$rokuchps3 = pg_result($resultrokuchs3, 0, "nazwa_kuch_en");

$sqlpowkuch3 = "SELECT kp3, kp3_bo FROM tab_dom_za where id_d = '$nu';";	
	$resultpowkuch3 = @pg_Exec($conn, $sqlpowkuch3);
	$powkuch3 = pg_result($resultpowkuch3, 0, "kp3");
	$powkuchp3 = pg_result($resultpowkuch3, 0, "kp3_bo");


$sqlpodkuch3 = "SELECT kpo3, kpo3_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultpodkuch3 = @pg_Exec($conn, $sqlpodkuch3);
			$podkuch3 = pg_result($resultpodkuch3, 0, "kpo3");
			$podkuchbo3 = pg_result($resultpodkuch3, 0, "kpo3_bo");
				
	$sqlpodkuchs3 = "SELECT nazwa_pod_en FROM podlogi where id = '$podkuch3';";
			
			$resultpodkuchs3 = @pg_Exec($conn, $sqlpodkuchs3);
			$podkuchps3 = pg_result($resultpodkuchs3, 0, "nazwa_pod_en");

$sqlkuchsc3 = "SELECT kps3, kps3_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultkuchsc3 = @pg_Exec($conn, $sqlkuchsc3);
			$kuchsc3 = pg_result($resultkuchsc3, 0, "kps3");
			$kuchscbo3 = pg_result($resultkuchsc3, 0, "kps3_bo");
				
$sqlkuchscs3 = "SELECT nazwa_sc_en FROM sciany where id = '$kuchsc3';";
			
			$resultkuchscs3 = @pg_Exec($conn, $sqlkuchscs3);
			$kuchscps3 = pg_result($resultkuchscs3, 0, "nazwa_sc_en");

$sqlkuchsuf3 = "SELECT kpsu3, kpsu3_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultkuchsuf3 = @pg_Exec($conn, $sqlkuchsuf3);
			$kuchsuf3 = pg_result($resultkuchsuf3, 0, "kpsu3");
			$kuchsufbo3 = pg_result($resultkuchsuf3, 0, "kpsu3_bo");
				
	$sqlkuchsufs3 = "SELECT nazwa_su_en FROM sufit where id = '$kuchsuf3';";
			
			$resultkuchsufs3 = @pg_Exec($conn, $sqlkuchsufs3);
			$kuchsufps3 = pg_result($resultkuchsufs3, 0, "nazwa_su_en");

$sqlkuchwyp3 = "SELECT kwyp3, kwyp3_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultkuchwyp3 = @pg_Exec($conn, $sqlkuchwyp3);
			$kuchwyp3 = pg_result($resultkuchwyp3, 0, "kwyp3");
			$kuchwypbo3 = pg_result($resultkuchwyp3, 0, "kwyp3_bo");
				
	$sqlkuchwyps3 = "SELECT nazwa_wp_en FROM wyposazenie where id = '$kuchwyp3';";
			
			$resultkuchwyps3 = @pg_Exec($conn, $sqlkuchwyps3);
			$kuchwypps3 = pg_result($resultkuchwyps3, 0, "nazwa_wp_en");

if (($kuchbo1 == 't')  || ($rokuchbo1 == 't') || ($powkuchp1 == 't')  || ($podkuchbo1 == 't') || ($kuchscbo1 == 't') || ($kuchsufbo1 == 't')  || ($kuchwypbo1 == 't') || ($kuchbo2 == 't')  || ($rokuchbo2 == 't') || ($powkuchp2 == 't')  || ($podkuchbo2 == 't') || ($kuchscbo2 == 't') || ($kuchsufbo2 == 't')  || ($kuchwypbo2 == 't') || ($kuchbo3 == 't')  || ($rokuchbo3 == 't') || ($powkuchp3 == 't')  || ($podkuchbo3 == 't') || ($kuchscbo3 == 't') || ($kuchsufbo3 == 't')  || ($kuchwypbo3 == 't')) {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
echo "<tr><td colspan=\"40\" height=\"7\" bgcolor=\"#5865E5\">";
echo "<span class=\"nag1wb\">";
echo "&nbsp;Kitchens";
echo "</span>";
echo "</td></tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}
if ( ($kuchbo1 == 't')  || ($rokuchbo1 == 't') || ($powkuchp1 == 't')  || ($podkuchbo1 == 't')) {
echo "<tr>"; 
}
if ($kuchbo1 == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Type of the kitchen 1:</b><br>&nbsp;$kuchps1";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}


if ($rokuchbo1 == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Kind of the kitchen 1:</b><br>&nbsp;$rokuchps1";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($powkuchp1 == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Meas. kitchen 1:</b><br>&nbsp;$powkuch1 m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($podkuchbo1 == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Floor kitchen 1:</b><br>&nbsp;$podkuchps1";
echo "</td>";

}


if ( ($kuchbo1 == 't')  || ($rokuchbo1 == 't') || ($powkuchp1 == 't')  || ($podkuchbo1 == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}
if ( ($kuchscbo1 == 't') || ($kuchsufbo1 == 't')  || ($kuchwypbo1 == 't')) {
echo "<tr>";
}
if ($kuchscbo1 == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Walls kitchen 1:</b><br>&nbsp;$kuchscps1";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($kuchsufbo1 == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Ceiling kitchen 1:</b><br>&nbsp;$kuchsufps1";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($kuchwypbo1 == 't') {

echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Equipment kitchen 1:</b><br>&nbsp;$kuchwypps1";
echo "</td>";

}

if ( ($kuchscbo1 == 't') || ($kuchsufbo1 == 't')  || ($kuchwypbo1 == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}

if ( ($kuchbo2 == 't')  || ($rokuchbo2 == 't') || ($powkuchp2 == 't')  || ($podkuchbo2 == 't')) {
echo "<tr>"; 
}
if ($kuchbo2 == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Type of the kitchen 2:</b><br>&nbsp;$kuchps2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}


if ($rokuchbo2 == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Kind of the kitchen 2:</b><br>&nbsp;$rokuchps2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($powkuchp2 == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Meas. kitchen 2:</b><br>&nbsp;$powkuch2 m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($podkuchbo2 == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Floor kitchen 2:</b><br>&nbsp;$podkuchps2";
echo "</td>";

}

if ( ($kuchbo2 == 't')  || ($rokuchbo2 == 't') || ($powkuchp2 == 't')  || ($podkuchbo2 == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}
if ( ($kuchscbo2 == 't') || ($kuchsufbo2 == 't')  || ($kuchwypbo2 == 't')) {
echo "<tr>";
}
if ($kuchscbo2 == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Walls kitchen 2:</b><br>&nbsp;$kuchscps2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($kuchsufbo2 == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Ceiling kitchen 2:</b><br>&nbsp;$kuchsufps2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($kuchwypbo2 == 't') {

echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Equipment kitchen 2:</b><br>&nbsp;$kuchwypps2";
echo "</td>";

}

if ( ($kuchscbo2 == 't') || ($kuchsufbo2 == 't')  || ($kuchwypbo2 == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}
if ( ($kuchbo3 == 't')  || ($rokuchbo3 == 't') || ($powkuchp3 == 't')  || ($podkuchbo3 == 't')) {
echo "<tr>"; 
}
if ($kuchbo3 == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Type of the kitchen 3:</b><br>&nbsp;$kuchps3";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}


if ($rokuchbo3 == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Kind of the kitchen 3:</b><br>&nbsp;$rokuchps3";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($powkuchp3 == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Meas. kitchen 3:</b><br>&nbsp;$powkuch3 m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($podkuchbo3 == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Floor kitchen 3:</b><br>&nbsp;$podkuchps3";
echo "</td>";

}

if ( ($kuchbo3 == 't')  || ($rokuchbo3 == 't') || ($powkuchp3 == 't')  || ($podkuchbo3 == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}
if ( ($kuchscbo3 == 't') || ($kuchsufbo3 == 't')  || ($kuchwypbo3 == 't')) {
echo "<tr>";
}
if ($kuchscbo3 == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Walls kitchen 3:</b><br>&nbsp;$kuchscps3";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($kuchsufbo3 == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Ceiling kitchen 3:</b><br>&nbsp;$kuchsufps3";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($kuchwypbo3 == 't') {

echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Equipment kitchen 3:</b><br>&nbsp;$kuchwypps3";
echo "</td>";

}

if ( ($kuchscbo3 == 't') || ($kuchsufbo3 == 't')  || ($kuchwypbo3 == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}


$sqlpowla1 = "SELECT pl1, pl1_bo FROM tab_dom_za where id_d = '$nu';";	
	$resultpowla1 = @pg_Exec($conn, $sqlpowla1);
	$powla1 = pg_result($resultpowla1, 0, "pl1");
	$powlasp1 = pg_result($resultpowla1, 0, "pl1_bo");

$sqlpodla1 = "SELECT lpo1, lpo1_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultpodla1 = @pg_Exec($conn, $sqlpodla1);
			$podla1 = pg_result($resultpodla1, 0, "lpo1");
			$podlabo1 = pg_result($resultpodla1, 0, "lpo1_bo");
				
	$sqlpodlas1 = "SELECT nazwa_pod_en FROM podlogi where id = '$podla1';";
			
			$resultpodlas1 = @pg_Exec($conn, $sqlpodlas1);
			$podlaps1 = pg_result($resultpodlas1, 0, "nazwa_pod_en");

$sqlscla1 = "SELECT ls1, ls1_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultscla1 = @pg_Exec($conn, $sqlscla1);
			$sclas1 = pg_result($resultscla1, 0, "ls1");
			$sclabo1 = pg_result($resultscla1, 0, "ls1_bo");
				
	$sqlsclas1 = "SELECT nazwa_sc_en FROM sciany where id = '$sclas1';";
			
			$resultsclas1 = @pg_Exec($conn, $sqlsclas1);
			$sclaps1 = pg_result($resultsclas1, 0, "nazwa_sc_en");

$sqllasuf1 = "SELECT lsu1, lsu1_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultlasuf1 = @pg_Exec($conn, $sqllasuf1);
			$lasuf1 = pg_result($resultlasuf1, 0, "lsu1");
			$lasufbo1 = pg_result($resultlasuf1, 0, "lsu1_bo");
				
	$sqllasufs1 = "SELECT nazwa_su_en FROM sufit where id = '$lasuf1';";
			
			$resultlasufs1 = @pg_Exec($conn, $sqllasufs1);
			$lasufps1 = pg_result($resultlasufs1, 0, "nazwa_su_en");

	$sqllawyp1 = "SELECT lawyp1, lawyp1_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultlawyp1 = @pg_Exec($conn, $sqllawyp1);
			$lawyp1 = pg_result($resultlawyp1, 0, "lawyp1");
			$lawypbo1 = pg_result($resultlawyp1, 0, "lawyp1_bo");
				
	$sqllawyps1 = "SELECT nazwa_wp_en FROM wyposazenie where id = '$lawyp1';";
			
			$resultlawyps1 = @pg_Exec($conn, $sqllawyps1);
			$lawypps1 = pg_result($resultlawyps1, 0, "nazwa_wp_en");

$sqlpowla2 = "SELECT pl2, pl2_bo FROM tab_dom_za where id_d = '$nu';";	
	$resultpowla2 = @pg_Exec($conn, $sqlpowla2);
	$powla2 = pg_result($resultpowla2, 0, "pl2");
	$powlasp2 = pg_result($resultpowla2, 0, "pl2_bo");

$sqlpodla2 = "SELECT lpo2, lpo2_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultpodla2 = @pg_Exec($conn, $sqlpodla2);
			$podla2 = pg_result($resultpodla2, 0, "lpo2");
			$podlabo2 = pg_result($resultpodla2, 0, "lpo2_bo");
				
	$sqlpodlas2 = "SELECT nazwa_pod_en FROM podlogi where id = '$podla2';";
			
			$resultpodlas2 = @pg_Exec($conn, $sqlpodlas2);
			$podlaps2 = pg_result($resultpodlas2, 0, "nazwa_pod_en");

$sqlscla2 = "SELECT ls2, ls2_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultscla2 = @pg_Exec($conn, $sqlscla2);
			$sclas2 = pg_result($resultscla2, 0, "ls2");
			$sclabo2 = pg_result($resultscla2, 0, "ls2_bo");
				
	$sqlsclas2 = "SELECT nazwa_sc_en FROM sciany where id = '$sclas2';";
			
			$resultsclas2 = @pg_Exec($conn, $sqlsclas2);
			$sclaps2 = pg_result($resultsclas2, 0, "nazwa_sc_en");

$sqllasuf2 = "SELECT lsu2, lsu2_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultlasuf2 = @pg_Exec($conn, $sqllasuf2);
			$lasuf2 = pg_result($resultlasuf2, 0, "lsu2");
			$lasufbo2 = pg_result($resultlasuf2, 0, "lsu2_bo");
				
	$sqllasufs2 = "SELECT nazwa_su_en FROM sufit where id = '$lasuf2';";
			
			$resultlasufs2 = @pg_Exec($conn, $sqllasufs2);
			$lasufps2 = pg_result($resultlasufs2, 0, "nazwa_su_en");

	$sqllawyp2 = "SELECT lawyp2, lawyp2_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultlawyp2 = @pg_Exec($conn, $sqllawyp2);
			$lawyp2 = pg_result($resultlawyp2, 0, "lawyp2");
			$lawypbo2 = pg_result($resultlawyp2, 0, "lawyp2_bo");
				
	$sqllawyps2 = "SELECT nazwa_wp_en FROM wyposazenie where id = '$lawyp2';";
			
			$resultlawyps2 = @pg_Exec($conn, $sqllawyps2);
			$lawypps2 = pg_result($resultlawyps2, 0, "nazwa_wp_en");

$sqlpowla3 = "SELECT pl3, pl3_bo FROM tab_dom_za where id_d = '$nu';";	
	$resultpowla3 = @pg_Exec($conn, $sqlpowla3);
	$powla3 = pg_result($resultpowla3, 0, "pl3");
	$powlasp3 = pg_result($resultpowla3, 0, "pl3_bo");

$sqlpodla3 = "SELECT lpo3, lpo3_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultpodla3 = @pg_Exec($conn, $sqlpodla3);
			$podla3 = pg_result($resultpodla3, 0, "lpo3");
			$podlabo3 = pg_result($resultpodla3, 0, "lpo3_bo");
				
	$sqlpodlas3 = "SELECT nazwa_pod_en FROM podlogi where id = '$podla3';";
			
			$resultpodlas3 = @pg_Exec($conn, $sqlpodlas3);
			$podlaps3 = pg_result($resultpodlas3, 0, "nazwa_pod_en");

$sqlscla3 = "SELECT ls3, ls3_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultscla3 = @pg_Exec($conn, $sqlscla3);
			$sclas3 = pg_result($resultscla3, 0, "ls3");
			$sclabo3 = pg_result($resultscla3, 0, "ls3_bo");
				
	$sqlsclas3 = "SELECT nazwa_sc_en FROM sciany where id = '$sclas3';";
			
			$resultsclas3 = @pg_Exec($conn, $sqlsclas3);
			$sclaps3 = pg_result($resultsclas3, 0, "nazwa_sc_en");

$sqllasuf3 = "SELECT lsu3, lsu3_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultlasuf3 = @pg_Exec($conn, $sqllasuf3);
			$lasuf3 = pg_result($resultlasuf3, 0, "lsu3");
			$lasufbo3 = pg_result($resultlasuf3, 0, "lsu3_bo");
				
	$sqllasufs3 = "SELECT nazwa_su_en FROM sufit where id = '$lasuf3';";
			
			$resultlasufs3 = @pg_Exec($conn, $sqllasufs3);
			$lasufps3 = pg_result($resultlasufs3, 0, "nazwa_su_en");

	$sqllawyp3 = "SELECT lawyp3, lawyp3_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultlawyp3 = @pg_Exec($conn, $sqllawyp3);
			$lawyp3 = pg_result($resultlawyp3, 0, "lawyp3");
			$lawypbo3 = pg_result($resultlawyp3, 0, "lawyp3_bo");
				
	$sqllawyps3 = "SELECT nazwa_wp_en FROM wyposazenie where id = '$lawyp3';";
			
			$resultlawyps3 = @pg_Exec($conn, $sqllawyps3);
			$lawypps3 = pg_result($resultlawyps3, 0, "nazwa_wp_en");

if (($powlasp1 == 't')  || ($podlabo1 == 't') || ($sclabo1 == 't')  || ($lasufbo1 == 't') || ($lawypbo1 == 't') || ($powlasp2 == 't')  || ($podlabo2 == 't') || ($sclabo2 == 't')  || ($lasufbo2 == 't') || ($lawypbo2 == 't') || ($powlasp3 == 't')  || ($podlabo3 == 't') || ($sclabo3 == 't')  || ($lasufbo3 == 't') || ($lawypbo3 == 't')) {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
echo "<tr><td colspan=\"40\" height=\"7\" bgcolor=\"#5865E5\">";
echo "<span class=\"nag1wb\">";
echo "&nbsp;Bathrooms";
echo "</span>";
echo "</td></tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}
if ( ($powlasp1 == 't')  || ($podlabo1 == 't') || ($sclabo1 == 't')  || ($lasufbo1 == 't')) {
echo "<tr>"; 
}
if ($powlasp1 == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Meas. bathroom 1:</b><br>&nbsp;$powla1 m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($podlabo1 == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Floor bathroom 1:</b><br>&nbsp;$podlaps1";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($sclabo1 == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Walls bathroom 1:</b><br>&nbsp;$sclaps1";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($lasufbo1 == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Ceiling bathroom 1:</b><br>&nbsp;$lasufps1";
echo "</td>";

}

if ( ($powlasp1 == 't')  || ($podlabo1 == 't') || ($sclabo1 == 't')  || ($lasufbo1 == 't')) {
echo "</tr>"; 
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}

if ($lawypbo1 == 't') {
echo "<tr>";
echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Equipment bathroom 1:</b><br>&nbsp;$lawypps1";
echo "</td>";
echo "</tr>";
}


if ($lawypbo1 == 't') {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}

if ( ($powlasp2 == 't')  || ($podlabo2 == 't') || ($sclabo2 == 't')  || ($lasufbo2 == 't')) {
echo "<tr>"; 
}
if ($powlasp2 == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Meas. bathroom 2:</b><br>&nbsp;$powla2 m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($podlabo2 == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Floor bathroom 2:</b><br>&nbsp;$podlaps2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($sclabo2 == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Walls bathroom 2:</b><br>&nbsp;$sclaps2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($lasufbo2 == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Ceiling bathroom 2:</b><br>&nbsp;$lasufps2";
echo "</td>";

}


if ( ($powlasp2 == 't')  || ($podlabo2 == 't') || ($sclabo2 == 't')  || ($lasufbo2 == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}

if ($lawypbo2 == 't') {
echo "<tr>";
echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Equipment bathroom 2:</b><br>&nbsp;$lawypps2";
echo "</td>";
echo "</tr>";
}

if ($lawypbo2 == 't') {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}
if ( ($powlasp3 == 't')  || ($podlabo3 == 't') || ($sclabo3 == 't')  || ($lasufbo3 == 't')) {
echo "<tr>"; 
}
if ($powlasp3 == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Meas. bathroom 3:</b><br>&nbsp;$powla3 m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($podlabo3 == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Floor bathroom 3:</b><br>&nbsp;$podlaps3";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($sclabo3 == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Walls bathroom 3:</b><br>&nbsp;$sclaps3";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($lasufbo3 == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Ceiling bathroom 3:</b><br>&nbsp;$lasufps3";
echo "</td>";

}

if ( ($powlasp3 == 't')  || ($podlabo3 == 't') || ($sclabo3 == 't')  || ($lasufbo3 == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}

if ($lawypbo3 == 't') {
echo "<tr>";
echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Equipment bathroom 3:</b><br>&nbsp;$lawypps3";
echo "</td>";
echo "</tr>";
}

if ($lawypbo3 == 't') {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}

$sqlwc1 = "SELECT twc1, twc1_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultwc1 = @pg_Exec($conn, $sqlwc1);
			$wcs1 = pg_result($resultwc1, 0, "twc1");
			$wcbo1 = pg_result($resultwc1, 0, "twc1_bo");
				
	$sqlwcs1 = "SELECT nazwa_wc_en FROM typ_wc where id = '$wcs1';";
			
			$resultwcs1 = @pg_Exec($conn, $sqlwcs1);
			$wcps1 = pg_result($resultwcs1, 0, "nazwa_wc_en");

$sqlpowwc1 = "SELECT pwc1, pwc1_bo FROM tab_dom_za where id_d = '$nu';";	
	$resultpowwc1 = @pg_Exec($conn, $sqlpowwc1);
	$powwc1 = pg_result($resultpowwc1, 0, "pwc1");
	$powwcsp1 = pg_result($resultpowwc1, 0, "pwc1_bo");

$sqlpodwc1 = "SELECT wcpo1, wcpo1_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultpodwc1 = @pg_Exec($conn, $sqlpodwc1);
			$podwc1 = pg_result($resultpodwc1, 0, "wcpo1");
			$podwcbo1 = pg_result($resultpodwc1, 0, "wcpo1_bo");
				
	$sqlpodwcs1 = "SELECT nazwa_pod_en FROM podlogi where id = '$podwc1';";
			
			$resultpodwcs1 = @pg_Exec($conn, $sqlpodwcs1);
			$podwcps1 = pg_result($resultpodwcs1, 0, "nazwa_pod_en");

$sqlscwc1 = "SELECT wcs1, wcs1_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultscwc1 = @pg_Exec($conn, $sqlscwc1);
			$scwc1 = pg_result($resultscwc1, 0, "wcs1");
			$scwcbo1 = pg_result($resultscwc1, 0, "wcs1_bo");
				
	$sqlscwcs1 = "SELECT nazwa_sc_en FROM sciany where id = '$scwc1';";
			
			$resultscwcs1 = @pg_Exec($conn, $sqlscwcs1);
			$scwcps1 = pg_result($resultscwcs1, 0, "nazwa_sc_en");

	$sqlwcsuf1 = "SELECT wcsu1, wcsu1_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultwcsuf1 = @pg_Exec($conn, $sqlwcsuf1);
			$wcsuf1 = pg_result($resultwcsuf1, 0, "wcsu1");
			$wcsufbo1 = pg_result($resultwcsuf1, 0, "wcsu1_bo");
				
	$sqlwcsufs1 = "SELECT nazwa_su_en FROM sufit where id = '$wcsuf1';";
			
			$resultwcsufs1 = @pg_Exec($conn, $sqlwcsufs1);
			$wcsufps1 = pg_result($resultwcsufs1, 0, "nazwa_su_en");

$sqlwcwyp1 = "SELECT wcwyp1, wcwyp1_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultwcwyp1 = @pg_Exec($conn, $sqlwcwyp1);
			$wcwyp1 = pg_result($resultwcwyp1, 0, "wcwyp1");
			$wcwypbo1 = pg_result($resultwcwyp1, 0, "wcwyp1_bo");
				
	$sqlwcwyps1 = "SELECT nazwa_wp_en FROM wyposazenie where id = '$wcwyp1';";
			
			$resultwcwyps1 = @pg_Exec($conn, $sqlwcwyps1);
			$wcwypps1 = pg_result($resultwcwyps1, 0, "nazwa_wp_en");

$sqlwc2 = "SELECT twc2, twc2_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultwc2 = @pg_Exec($conn, $sqlwc2);
			$wcs2 = pg_result($resultwc2, 0, "twc2");
			$wcbo2 = pg_result($resultwc2, 0, "twc2_bo");
				
	$sqlwcs2 = "SELECT nazwa_wc_en FROM typ_wc where id = '$wcs2';";
			
			$resultwcs2 = @pg_Exec($conn, $sqlwcs2);
			$wcps2 = pg_result($resultwcs2, 0, "nazwa_wc_en");

$sqlpowwc2 = "SELECT pwc2, pwc2_bo FROM tab_dom_za where id_d = '$nu';";	
	$resultpowwc2 = @pg_Exec($conn, $sqlpowwc2);
	$powwc2 = pg_result($resultpowwc2, 0, "pwc2");
	$powwcsp2 = pg_result($resultpowwc2, 0, "pwc2_bo");

$sqlpodwc2 = "SELECT wcpo2, wcpo2_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultpodwc2 = @pg_Exec($conn, $sqlpodwc2);
			$podwc2 = pg_result($resultpodwc2, 0, "wcpo2");
			$podwcbo2 = pg_result($resultpodwc2, 0, "wcpo2_bo");
				
	$sqlpodwcs2 = "SELECT nazwa_pod_en FROM podlogi where id = '$podwc2';";
			
			$resultpodwcs2 = @pg_Exec($conn, $sqlpodwcs2);
			$podwcps2 = pg_result($resultpodwcs2, 0, "nazwa_pod_en");

$sqlscwc2 = "SELECT wcs2, wcs2_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultscwc2 = @pg_Exec($conn, $sqlscwc2);
			$scwc2 = pg_result($resultscwc2, 0, "wcs2");
			$scwcbo2 = pg_result($resultscwc2, 0, "wcs2_bo");
				
	$sqlscwcs2 = "SELECT nazwa_sc_en FROM sciany where id = '$scwc2';";
			
			$resultscwcs2 = @pg_Exec($conn, $sqlscwcs2);
			$scwcps2 = pg_result($resultscwcs2, 0, "nazwa_sc_en");

	$sqlwcsuf2 = "SELECT wcsu2, wcsu2_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultwcsuf2 = @pg_Exec($conn, $sqlwcsuf2);
			$wcsuf2 = pg_result($resultwcsuf2, 0, "wcsu2");
			$wcsufbo2 = pg_result($resultwcsuf2, 0, "wcsu2_bo");
				
	$sqlwcsufs2 = "SELECT nazwa_su_en FROM sufit where id = '$wcsuf2';";
			
			$resultwcsufs2 = @pg_Exec($conn, $sqlwcsufs2);
			$wcsufps2 = pg_result($resultwcsufs2, 0, "nazwa_su_en");

$sqlwcwyp2 = "SELECT wcwyp2, wcwyp2_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultwcwyp2 = @pg_Exec($conn, $sqlwcwyp2);
			$wcwyp2 = pg_result($resultwcwyp2, 0, "wcwyp2");
			$wcwypbo2 = pg_result($resultwcwyp2, 0, "wcwyp2_bo");
				
	$sqlwcwyps2 = "SELECT nazwa_wp_en FROM wyposazenie where id = '$wcwyp2';";
			
			$resultwcwyps2 = @pg_Exec($conn, $sqlwcwyps2);
			$wcwypps2 = pg_result($resultwcwyps2, 0, "nazwa_wp_en");

$sqlwc3 = "SELECT twc3, twc3_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultwc3 = @pg_Exec($conn, $sqlwc3);
			$wcs3 = pg_result($resultwc3, 0, "twc3");
			$wcbo3 = pg_result($resultwc3, 0, "twc3_bo");
				
	$sqlwcs3 = "SELECT nazwa_wc_en FROM typ_wc where id = '$wcs3';";
			
			$resultwcs3 = @pg_Exec($conn, $sqlwcs3);
			$wcps3 = pg_result($resultwcs3, 0, "nazwa_wc_en");

$sqlpowwc3 = "SELECT pwc3, pwc3_bo FROM tab_dom_za where id_d = '$nu';";	
	$resultpowwc3 = @pg_Exec($conn, $sqlpowwc3);
	$powwc3 = pg_result($resultpowwc3, 0, "pwc3");
	$powwcsp3 = pg_result($resultpowwc3, 0, "pwc3_bo");

$sqlpodwc3 = "SELECT wcpo3, wcpo3_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultpodwc3 = @pg_Exec($conn, $sqlpodwc3);
			$podwc3 = pg_result($resultpodwc3, 0, "wcpo3");
			$podwcbo3 = pg_result($resultpodwc3, 0, "wcpo3_bo");
				
	$sqlpodwcs3 = "SELECT nazwa_pod_en FROM podlogi where id = '$podwc3';";
			
			$resultpodwcs3 = @pg_Exec($conn, $sqlpodwcs3);
			$podwcps3 = pg_result($resultpodwcs3, 0, "nazwa_pod_en");

$sqlscwc3 = "SELECT wcs3, wcs3_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultscwc3 = @pg_Exec($conn, $sqlscwc3);
			$scwc3 = pg_result($resultscwc3, 0, "wcs3");
			$scwcbo3 = pg_result($resultscwc3, 0, "wcs3_bo");
				
	$sqlscwcs3 = "SELECT nazwa_sc_en FROM sciany where id = '$scwc3';";
			
			$resultscwcs3 = @pg_Exec($conn, $sqlscwcs3);
			$scwcps3 = pg_result($resultscwcs3, 0, "nazwa_sc_en");

	$sqlwcsuf3 = "SELECT wcsu3, wcsu3_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultwcsuf3 = @pg_Exec($conn, $sqlwcsuf3);
			$wcsuf3 = pg_result($resultwcsuf3, 0, "wcsu3");
			$wcsufbo3 = pg_result($resultwcsuf3, 0, "wcsu3_bo");
				
	$sqlwcsufs3 = "SELECT nazwa_su_en FROM sufit where id = '$wcsuf3';";
			
			$resultwcsufs3 = @pg_Exec($conn, $sqlwcsufs3);
			$wcsufps3 = pg_result($resultwcsufs3, 0, "nazwa_su_en");

$sqlwcwyp3 = "SELECT wcwyp3, wcwyp3_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultwcwyp3 = @pg_Exec($conn, $sqlwcwyp3);
			$wcwyp3 = pg_result($resultwcwyp3, 0, "wcwyp3");
			$wcwypbo3 = pg_result($resultwcwyp3, 0, "wcwyp3_bo");
				
	$sqlwcwyps3 = "SELECT nazwa_wp_en FROM wyposazenie where id = '$wcwyp3';";
			
			$resultwcwyps3 = @pg_Exec($conn, $sqlwcwyps3);
			$wcwypps3 = pg_result($resultwcwyps3, 0, "nazwa_wp_en");

if (($wcbo1 == 't')  || ($powwcsp1 == 't') || ($podwcbo1 == 't')  || ($scwcbo1 == 't') || ($wcsufbo1 == 't') || ($wcwypbo1 == 't') || ($wcbo2 == 't')  || ($powwcsp2 == 't') || ($podwcbo2 == 't')  || ($scwcbo2 == 't') || ($wcsufbo2 == 't') || ($wcwypbo2 == 't') || ($wcbo3 == 't')  || ($powwcsp3 == 't') || ($podwcbo3 == 't')  || ($scwcbo3 == 't') || ($wcsufbo3 == 't') || ($wcwypbo3 == 't')) {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
echo "<tr><td colspan=\"40\" height=\"7\" bgcolor=\"#5865E5\">";
echo "<span class=\"nag1wb\">";
echo "&nbsp;WC";
echo "</span>";
echo "</td></tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}
if (($wcbo1 == 't')  || ($powwcsp1 == 't') || ($podwcbo1 == 't')  || ($scwcbo1 == 't')) {
echo "<tr>"; 
}
if ($wcbo1 == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Type of the wc 1:</b><br>&nbsp;$wcps1";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($powwcsp1 == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Meas. wc 1:</b><br>&nbsp;$powwc1 m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($podwcbo1 == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Floor wc 1:</b><br>&nbsp;$podwcps1";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($scwcbo1 == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Walls wc 1:</b><br>&nbsp;$scwcps1";
echo "</td>";

}


if (($wcbo1 == 't')  || ($powwcsp1 == 't') || ($podwcbo1 == 't')  || ($scwcbo1 == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}
if (($wcsufbo1 == 't') || ($wcwypbo1 == 't')) {
echo "<tr>"; 
}
if ($wcsufbo1 == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Ceiling wc 1:</b><br>&nbsp;$wcsufps1";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($wcwypbo1 == 't') {

echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Equipment wc 1:</b><br>&nbsp;$wcwypps1";
echo "</td>";
}

if (($wcsufbo1 == 't') || ($wcwypbo1 == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}
if (($wcbo2 == 't')  || ($powwcsp2 == 't') || ($podwcbo2 == 't')  || ($scwcbo2 == 't')) {
echo "<tr>"; 
}
if ($wcbo2 == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Type of the wc 2:</b><br>&nbsp;$wcps2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($powwcsp2 == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Meas. wc 2:</b><br>&nbsp;$powwc2 m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($podwcbo2 == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Floor wc 2:</b><br>&nbsp;$podwcps2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($scwcbo2 == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Walls wc 2:</b><br>&nbsp;$scwcps2";
echo "</td>";

}

if (($wcbo2 == 't')  || ($powwcsp2 == 't') || ($podwcbo2 == 't')  || ($scwcbo2 == 't')) {
echo "</tr>"; 
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}
if (($wcsufbo2 == 't') || ($wcwypbo2 == 't')) {
echo "<tr>"; 
}
if ($wcsufbo2 == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Ceiling wc 2:</b><br>&nbsp;$wcsufps2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($wcwypbo2 == 't') {

echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Equipment wc 2:</b><br>&nbsp;$wcwypps2";
echo "</td>";
}

if (($wcsufbo2 == 't') || ($wcwypbo2 == 't')) {
echo "</tr>"; 
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}

if (($wcbo3 == 't')  || ($powwcsp3 == 't') || ($podwcbo3 == 't')  || ($scwcbo3 == 't')) {
echo "<tr>"; 
}
if ($wcbo3 == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Type of the wc 3:</b><br>&nbsp;$wcps3";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($powwcsp3 == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Meas. wc 3:</b><br>&nbsp;$powwc3 m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($podwcbo3 == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Floor wc 3:</b><br>&nbsp;$podwcps3";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($scwcbo3 == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Walls wc 3:</b><br>&nbsp;$scwcps3";
echo "</td>";

}

if (($wcbo3 == 't')  || ($powwcsp3 == 't') || ($podwcbo3 == 't')  || ($scwcbo3 == 't')) {
echo "</tr>"; 
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}
if (($wcsufbo3 == 't') || ($wcwypbo3 == 't')) {
echo "<tr>"; 
}
if ($wcsufbo3 == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Ceiling wc 3:</b><br>&nbsp;$wcsufps3";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($wcwypbo3 == 't') {

echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Equipment wc 3:</b><br>&nbsp;$wcwypps3";
echo "</td>";
}

if (($wcsufbo3 == 't') || ($wcwypbo3 == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}


$sqlpowprz1 = "SELECT pprz1, pprz1_bo FROM tab_dom_za where id_d = '$nu';";	
	$resultpowprz1 = @pg_Exec($conn, $sqlpowprz1);
	$powprz1 = pg_result($resultpowprz1, 0, "pprz1");
	$powprzsp1 = pg_result($resultpowprz1, 0, "pprz1_bo");

$sqlpodprz1 = "SELECT przpo1, przpo1_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultpodprz1 = @pg_Exec($conn, $sqlpodprz1);
			$podprz1 = pg_result($resultpodprz1, 0, "przpo1");
			$podprzbo1 = pg_result($resultpodprz1, 0, "przpo1_bo");
				
	$sqlpodprzs1 = "SELECT nazwa_pod_en FROM podlogi where id = '$podprz1';";
			
			$resultpodprzs1 = @pg_Exec($conn, $sqlpodprzs1);
			$podprzps1 = pg_result($resultpodprzs1, 0, "nazwa_pod_en");

$sqlscprz1 = "SELECT przs1, przs1_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultscprz1 = @pg_Exec($conn, $sqlscprz1);
			$scprzs1 = pg_result($resultscprz1, 0, "przs1");
			$scprzbo1 = pg_result($resultscprz1, 0, "przs1_bo");
				
	$sqlscprzs1 = "SELECT nazwa_sc_en FROM sciany where id = '$scprzs1';";
			
			$resultscprzs1 = @pg_Exec($conn, $sqlscprzs1);
			$scprzps1 = pg_result($resultscprzs1, 0, "nazwa_sc_en");

$sqlprzsuf1 = "SELECT przsu1, przsu1_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultprzsuf1 = @pg_Exec($conn, $sqlprzsuf1);
			$przsuf1 = pg_result($resultprzsuf1, 0, "przsu1");
			$przsufbo1 = pg_result($resultprzsuf1, 0, "przsu1_bo");
				
	$sqlprzsufs1 = "SELECT nazwa_su_en FROM sufit where id = '$przsuf1';";
			
			$resultprzsufs1 = @pg_Exec($conn, $sqlprzsufs1);
			$przsufps1 = pg_result($resultprzsufs1, 0, "nazwa_su_en");

	$sqlprzwyp1 = "SELECT przwyp1, przwyp1_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultprzwyp1 = @pg_Exec($conn, $sqlprzwyp1);
			$przwyp1 = pg_result($resultprzwyp1, 0, "przwyp1");
			$przwypbo1 = pg_result($resultprzwyp1, 0, "przwyp1_bo");
				
	$sqlprzwyps1 = "SELECT nazwa_wp_en FROM wyposazenie where id = '$przwyp1';";
			
			$resultprzwyps1 = @pg_Exec($conn, $sqlprzwyps1);
			$przwypps1 = pg_result($resultprzwyps1, 0, "nazwa_wp_en");


$sqlpowprz2 = "SELECT pprz2, pprz2_bo FROM tab_dom_za where id_d = '$nu';";	
	$resultpowprz2 = @pg_Exec($conn, $sqlpowprz2);
	$powprz2 = pg_result($resultpowprz2, 0, "pprz2");
	$powprzsp2 = pg_result($resultpowprz2, 0, "pprz2_bo");

$sqlpodprz2 = "SELECT przpo2, przpo2_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultpodprz2 = @pg_Exec($conn, $sqlpodprz2);
			$podprz2 = pg_result($resultpodprz2, 0, "przpo2");
			$podprzbo2 = pg_result($resultpodprz2, 0, "przpo2_bo");
				
	$sqlpodprzs2 = "SELECT nazwa_pod_en FROM podlogi where id = '$podprz2';";
			
			$resultpodprzs2 = @pg_Exec($conn, $sqlpodprzs2);
			$podprzps2 = pg_result($resultpodprzs2, 0, "nazwa_pod_en");

$sqlscprz2 = "SELECT przs2, przs2_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultscprz2 = @pg_Exec($conn, $sqlscprz2);
			$scprzs2 = pg_result($resultscprz2, 0, "przs2");
			$scprzbo2 = pg_result($resultscprz2, 0, "przs2_bo");
				
	$sqlscprzs2 = "SELECT nazwa_sc_en FROM sciany where id = '$scprzs2';";
			
			$resultscprzs2 = @pg_Exec($conn, $sqlscprzs2);
			$scprzps2 = pg_result($resultscprzs2, 0, "nazwa_sc_en");

$sqlprzsuf2 = "SELECT przsu2, przsu2_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultprzsuf2 = @pg_Exec($conn, $sqlprzsuf2);
			$przsuf2 = pg_result($resultprzsuf2, 0, "przsu2");
			$przsufbo2 = pg_result($resultprzsuf2, 0, "przsu2_bo");
				
	$sqlprzsufs2 = "SELECT nazwa_su_en FROM sufit where id = '$przsuf2';";
			
			$resultprzsufs2 = @pg_Exec($conn, $sqlprzsufs2);
			$przsufps2 = pg_result($resultprzsufs2, 0, "nazwa_su_en");

	$sqlprzwyp2 = "SELECT przwyp2, przwyp2_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultprzwyp2 = @pg_Exec($conn, $sqlprzwyp2);
			$przwyp2 = pg_result($resultprzwyp2, 0, "przwyp2");
			$przwypbo2 = pg_result($resultprzwyp2, 0, "przwyp2_bo");
				
	$sqlprzwyps2 = "SELECT nazwa_wp_en FROM wyposazenie where id = '$przwyp2';";
			
			$resultprzwyps2 = @pg_Exec($conn, $sqlprzwyps2);
			$przwypps2 = pg_result($resultprzwyps2, 0, "nazwa_wp_en");

$sqlpowprz3 = "SELECT pprz3, pprz3_bo FROM tab_dom_za where id_d = '$nu';";	
	$resultpowprz3 = @pg_Exec($conn, $sqlpowprz3);
	$powprz3 = pg_result($resultpowprz3, 0, "pprz3");
	$powprzsp3 = pg_result($resultpowprz3, 0, "pprz3_bo");

$sqlpodprz3 = "SELECT przpo3, przpo3_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultpodprz3 = @pg_Exec($conn, $sqlpodprz3);
			$podprz3 = pg_result($resultpodprz3, 0, "przpo3");
			$podprzbo3 = pg_result($resultpodprz3, 0, "przpo3_bo");
				
	$sqlpodprzs3 = "SELECT nazwa_pod_en FROM podlogi where id = '$podprz3';";
			
			$resultpodprzs3 = @pg_Exec($conn, $sqlpodprzs3);
			$podprzps3 = pg_result($resultpodprzs3, 0, "nazwa_pod_en");

$sqlscprz3 = "SELECT przs3, przs3_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultscprz3 = @pg_Exec($conn, $sqlscprz3);
			$scprzs3 = pg_result($resultscprz3, 0, "przs3");
			$scprzbo3 = pg_result($resultscprz3, 0, "przs3_bo");
				
	$sqlscprzs3 = "SELECT nazwa_sc_en FROM sciany where id = '$scprzs3';";
			
			$resultscprzs3 = @pg_Exec($conn, $sqlscprzs3);
			$scprzps3 = pg_result($resultscprzs3, 0, "nazwa_sc_en");

$sqlprzsuf3 = "SELECT przsu3, przsu3_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultprzsuf3 = @pg_Exec($conn, $sqlprzsuf3);
			$przsuf3 = pg_result($resultprzsuf3, 0, "przsu3");
			$przsufbo3 = pg_result($resultprzsuf3, 0, "przsu3_bo");
				
	$sqlprzsufs3 = "SELECT nazwa_su_en FROM sufit where id = '$przsuf3';";
			
			$resultprzsufs3 = @pg_Exec($conn, $sqlprzsufs3);
			$przsufps3 = pg_result($resultprzsufs3, 0, "nazwa_su_en");

	$sqlprzwyp3 = "SELECT przwyp3, przwyp3_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultprzwyp3 = @pg_Exec($conn, $sqlprzwyp3);
			$przwyp3 = pg_result($resultprzwyp3, 0, "przwyp3");
			$przwypbo3 = pg_result($resultprzwyp3, 0, "przwyp3_bo");
				
	$sqlprzwyps3 = "SELECT nazwa_wp_en FROM wyposazenie where id = '$przwyp3';";
			
			$resultprzwyps3 = @pg_Exec($conn, $sqlprzwyps3);
			$przwypps3 = pg_result($resultprzwyps3, 0, "nazwa_wp_en");

if (($powprzsp1 == 't')  || ($podprzbo1 == 't') || ($scprzbo1 == 't')  || ($przsufbo1 == 't') || ($przwypbo1 == 't') || ($powprzsp2 == 't')  || ($podprzbo2 == 't') || ($scprzbo2 == 't')  || ($przsufbo2 == 't') || ($przwypbo2 == 't') || ($powprzsp3 == 't')  || ($podprzbo3 == 't') || ($scprzbo3 == 't')  || ($przsufbo3 == 't') || ($przwypbo3 == 't')) {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
echo "<tr><td colspan=\"40\" height=\"7\" bgcolor=\"#5865E5\">";
echo "<span class=\"nag1wb\">";
echo "&nbsp;Hallway";
echo "</span>";
echo "</td></tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}
if ( ($powprzsp1 == 't')  || ($podprzbo1 == 't') || ($scprzbo1 == 't')  || ($przsufbo1 == 't')) {
echo "<tr>"; 
}
if ($powprzsp1 == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Meas. hallway 1:</b><br>&nbsp;$powprz1 m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($podprzbo1 == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Floor hallway 1:</b><br>&nbsp;$podprzps1";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($scprzbo1 == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Walls hallway 1:</b><br>&nbsp;$scprzps1";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($przsufbo1 == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Ceiling hallway 1:</b><br>&nbsp;$przsufps1";
echo "</td>";

}

if ( ($powprzsp1 == 't')  || ($podprzbo1 == 't') || ($scprzbo1 == 't')  || ($przsufbo1 == 't')) {
echo "</tr>"; 
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}

if ($przwypbo1 == 't') {
echo "<tr>";
echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Equipment hallway 1:</b><br>&nbsp;$przwypps1";
echo "</td>";
echo "</tr>";
}


if ($przwypbo1 == 't') {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}
if ( ($powprzsp2 == 't')  || ($podprzbo2 == 't') || ($scprzbo2 == 't')  || ($przsufbo2 == 't')) {
echo "<tr>"; 
}
if ($powprzsp2 == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Meas. hallway 2:</b><br>&nbsp;$powprz2 m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($podprzbo2 == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Floor hallway 2:</b><br>&nbsp;$podprzps2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($scprzbo2 == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Walls hallway 2:</b><br>&nbsp;$scprzps2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($przsufbo2 == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Ceiling hallway 2:</b><br>&nbsp;$przsufps2";
echo "</td>";

}

if ( ($powprzsp2 == 't')  || ($podprzbo2 == 't') || ($scprzbo2 == 't')  || ($przsufbo2 == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}

if ($przwypbo2 == 't') {
echo "<tr>";
echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Equipment hallway 2:</b><br>&nbsp;$przwypps2";
echo "</td>";
echo "</tr>";
}

if ($przwypbo2 == 't') {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}
if ( ($powprzsp3 == 't')  || ($podprzbo3 == 't') || ($scprzbo3 == 't')  || ($przsufbo3 == 't')) {
echo "<tr>"; 
}
if ($powprzsp3 == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Meas. hallway 3:</b><br>&nbsp;$powprz3 m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($podprzbo3 == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Floor hallway 3:</b><br>&nbsp;$podprzps3";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($scprzbo3 == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Walls hallway 3:</b><br>&nbsp;$scprzps3";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($przsufbo3 == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Ceiling hallway 3:</b><br>&nbsp;$przsufps3";
echo "</td>";

}

if ( ($powprzsp3 == 't')  || ($podprzbo3 == 't') || ($scprzbo3 == 't')  || ($przsufbo3 == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}

if ($przwypbo3 == 't') {
echo "<tr>";
echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Equipment hallway 3:</b><br>&nbsp;$przwypps3";
echo "</td>";
echo "</tr>";
}

if ($przwypbo3 == 't') {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}


	$sqlbal1 = "SELECT tb1, tb1_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultbal1 = @pg_Exec($conn, $sqlbal1);
			$bals1 = pg_result($resultbal1, 0, "tb1");
			$balbo1 = pg_result($resultbal1, 0, "tb1_bo");
				
	$sqlbals1 = "SELECT nazwa_ba_en FROM typ_balkonu where id = '$bals1';";
			
			$resultbals1 = @pg_Exec($conn, $sqlbals1);
			$balps1 = pg_result($resultbals1, 0, "nazwa_ba_en");

$sqlpowbal1 = "SELECT pb1, pb1_bo FROM tab_dom_za where id_d = '$nu';";	
	$resultpowbal1 = @pg_Exec($conn, $sqlpowbal1);
	$powbal1 = pg_result($resultpowbal1, 0, "pb1");
	$powbalsp1 = pg_result($resultpowbal1, 0, "pb1_bo");

$sqlpodbal1 = "SELECT pob1, pob1_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultpodbal1 = @pg_Exec($conn, $sqlpodbal1);
			$podbal1 = pg_result($resultpodbal1, 0, "pob1");
			$podbalbo1 = pg_result($resultpodbal1, 0, "pob1_bo");
				
	$sqlpodbals1 = "SELECT nazwa_pod_en FROM podlogi where id = '$podbal1';";
			
			$resultpodbals1 = @pg_Exec($conn, $sqlpodbals1);
			$podbalps1 = pg_result($resultpodbals1, 0, "nazwa_pod_en");

$sqlscbal1 = "SELECT sb1, sb1_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultscbal1 = @pg_Exec($conn, $sqlscbal1);
			$scbals1 = pg_result($resultscbal1, 0, "sb1");
			$scbalbo1 = pg_result($resultscbal1, 0, "sb1_bo");
				
	$sqlscbals1 = "SELECT nazwa_sc_en FROM sciany where id = '$scbals1';";
			
			$resultscbals1 = @pg_Exec($conn, $sqlscbals1);
			$scbalps1 = pg_result($resultscbals1, 0, "nazwa_sc_en");

	$sqlbal2 = "SELECT tb2, tb2_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultbal2 = @pg_Exec($conn, $sqlbal2);
			$bals2 = pg_result($resultbal2, 0, "tb2");
			$balbo2 = pg_result($resultbal2, 0, "tb2_bo");
				
	$sqlbals2 = "SELECT nazwa_ba_en FROM typ_balkonu where id = '$bals2';";
			
			$resultbals2 = @pg_Exec($conn, $sqlbals2);
			$balps2 = pg_result($resultbals2, 0, "nazwa_ba_en");

$sqlpowbal2 = "SELECT pb2, pb2_bo FROM tab_dom_za where id_d = '$nu';";	
	$resultpowbal2 = @pg_Exec($conn, $sqlpowbal2);
	$powbal2 = pg_result($resultpowbal2, 0, "pb2");
	$powbalsp2 = pg_result($resultpowbal2, 0, "pb2_bo");

$sqlpodbal2 = "SELECT pob2, pob2_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultpodbal2 = @pg_Exec($conn, $sqlpodbal2);
			$podbal2 = pg_result($resultpodbal2, 0, "pob2");
			$podbalbo2 = pg_result($resultpodbal2, 0, "pob2_bo");
				
	$sqlpodbals2 = "SELECT nazwa_pod_en FROM podlogi where id = '$podbal2';";
			
			$resultpodbals2 = @pg_Exec($conn, $sqlpodbals2);
			$podbalps2 = pg_result($resultpodbals2, 0, "nazwa_pod_en");

$sqlscbal2 = "SELECT sb2, sb2_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultscbal2 = @pg_Exec($conn, $sqlscbal2);
			$scbals2 = pg_result($resultscbal2, 0, "sb2");
			$scbalbo2 = pg_result($resultscbal2, 0, "sb2_bo");
				
	$sqlscbals2 = "SELECT nazwa_sc_en FROM sciany where id = '$scbals2';";
			
			$resultscbals2 = @pg_Exec($conn, $sqlscbals2);
			$scbalps2 = pg_result($resultscbals2, 0, "nazwa_sc_en");

	$sqlbal3 = "SELECT tb3, tb3_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultbal3 = @pg_Exec($conn, $sqlbal3);
			$bals3 = pg_result($resultbal3, 0, "tb3");
			$balbo3 = pg_result($resultbal3, 0, "tb3_bo");
				
	$sqlbals3 = "SELECT nazwa_ba_en FROM typ_balkonu where id = '$bals3';";
			
			$resultbals3 = @pg_Exec($conn, $sqlbals3);
			$balps3 = pg_result($resultbals3, 0, "nazwa_ba_en");

$sqlpowbal3 = "SELECT pb3, pb3_bo FROM tab_dom_za where id_d = '$nu';";	
	$resultpowbal3 = @pg_Exec($conn, $sqlpowbal3);
	$powbal3 = pg_result($resultpowbal3, 0, "pb3");
	$powbalsp3 = pg_result($resultpowbal3, 0, "pb3_bo");

$sqlpodbal3 = "SELECT pob3, pob3_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultpodbal3 = @pg_Exec($conn, $sqlpodbal3);
			$podbal3 = pg_result($resultpodbal3, 0, "pob3");
			$podbalbo3 = pg_result($resultpodbal3, 0, "pob3_bo");
				
	$sqlpodbals3 = "SELECT nazwa_pod_en FROM podlogi where id = '$podbal3';";
			
			$resultpodbals3 = @pg_Exec($conn, $sqlpodbals3);
			$podbalps3 = pg_result($resultpodbals3, 0, "nazwa_pod_en");

$sqlscbal3 = "SELECT sb3, sb3_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultscbal3 = @pg_Exec($conn, $sqlscbal3);
			$scbals3 = pg_result($resultscbal3, 0, "sb3");
			$scbalbo3 = pg_result($resultscbal3, 0, "sb3_bo");
				
	$sqlscbals3 = "SELECT nazwa_sc_en FROM sciany where id = '$scbals3';";
			
			$resultscbals3 = @pg_Exec($conn, $sqlscbals3);
			$scbalps3 = pg_result($resultscbals3, 0, "nazwa_sc_en");


if (($balbo1 == 't')  || ($powbalsp1 == 't') || ($podbalbo1 == 't')  || ($scbalbo1 == 't') || ($balbo2 == 't')  || ($powbalsp2 == 't') || ($podbalbo2 == 't')  || ($scbalbo2 == 't') || ($balbo3 == 't')  || ($powbalsp3 == 't') || ($podbalbo3 == 't')  || ($scbalbo3 == 't')) {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
echo "<tr><td colspan=\"40\" height=\"7\" bgcolor=\"#5865E5\">";
echo "<span class=\"nag1wb\">";
echo "&nbsp;Balcony";
echo "</span>";
echo "</td></tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}
if (($balbo1 == 't')  || ($powbalsp1 == 't') || ($podbalbo1 == 't')  || ($scbalbo1 == 't')) {
echo "<tr>"; 
}
if ($balbo1 == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Type of the balcony 1:</b><br>&nbsp;$balps1";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($powbalsp1 == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Meas. balcony 1:</b><br>&nbsp;$powbal1 m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($podbalbo1 == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Floor balcony 1:</b><br>&nbsp;$podbalps1";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}


if ($scbalbo1 == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Walls balcony 1:</b><br>&nbsp;$scbalps1";
echo "</td>";

}

if (($balbo1 == 't')  || ($powbalsp1 == 't') || ($podbalbo1 == 't')  || ($scbalbo1 == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}

if (($balbo2 == 't')  || ($powbalsp2 == 't') || ($podbalbo2 == 't')  || ($scbalbo2 == 't')) {
echo "<tr>"; 
}
if ($balbo2 == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Type of the balcony 2:</b><br>&nbsp;$balps2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($powbalsp2 == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Meas. balcony 2:</b><br>&nbsp;$powbal2 m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($podbalbo2 == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Floor balcony 2:</b><br>&nbsp;$podbalps2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}


if ($scbalbo2 == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Walls balcony 2:</b><br>&nbsp;$scbalps2";
echo "</td>";

}

if (($balbo2 == 't')  || ($powbalsp2 == 't') || ($podbalbo2 == 't')  || ($scbalbo2 == 't')) {
echo "</tr>"; 
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}
if (($balbo3 == 't')  || ($powbalsp3 == 't') || ($podbalbo3 == 't')  || ($scbalbo3 == 't')) {
echo "<tr>"; 
}
if ($balbo3 == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Type of the balcony 3:</b><br>&nbsp;$balps3";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($powbalsp3 == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Meas. balcony 3:</b><br>&nbsp;$powbal3 m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($podbalbo3 == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Floor balcony 3:</b><br>&nbsp;$podbalps3";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}


if ($scbalbo3 == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Walls balcony 3:</b><br>&nbsp;$scbalps3";
echo "</td>";

}

if (($balbo3 == 't')  || ($powbalsp3 == 't') || ($podbalbo3 == 't')  || ($scbalbo3 == 't')) {
echo "</tr>"; 
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}


$sqlzd9 = "SELECT zd9 FROM tab_dom_za where id_d = '$nu';";
			
	$resultzd9s = @pg_Exec($conn, $sqlzd9);
	$zd9ms = pg_result($resultzd9s, 0, "zd9");

$sqlzd10 = "SELECT zd10 FROM tab_dom_za where id_d = '$nu';";
			
	$resultzd10s = @pg_Exec($conn, $sqlzd10);
	$zd10ms = pg_result($resultzd10s, 0, "zd10");

$sqlzd11 = "SELECT zd11 FROM tab_dom_za where id_d = '$nu';";
			
	$resultzd11s = @pg_Exec($conn, $sqlzd11);
	$zd11ms = pg_result($resultzd11s, 0, "zd11");

$sqlzd12 = "SELECT zd12 FROM tab_dom_za where id_d = '$nu';";
			
	$resultzd12s = @pg_Exec($conn, $sqlzd12);
	$zd12ms = pg_result($resultzd12s, 0, "zd12");

if (($zd9ms != '0')  || ($zd10ms != '0') || ($zd11ms != '0')  || ($zd12ms != '0')) {

echo "<tr><td colspan=\"40\" height=\"7\" bgcolor=\"#5865E5\">";
echo "<span class=\"nag1wb\">";
echo "&nbsp;Pictures";
echo "</span>";
echo "</td></tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
echo "<tr>"; 
}


if ($zd9ms != '0') {
	
	echo "<td width=\"127\">";
	echo "<center>";
	echo "<a href=\"image.php?p=../img/zd$zd9ms$ok&w=550&h=350&i=Picture%20nr\"$zd9ms\"\" onclick=\"NewWindow(this.href,'name','570','370','no');return false;\">";
	echo "<img src=\"../img/zd$zd9ms.jpg\" width=\"125\" height=\"100\" border=\"0\" alt=\"Picture nr$zd9ms\"></img></a><br><span class=\"\">";
	echo "Picture nr $zd9ms";
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
	echo "<a href=\"image.php?p=../img/zd$zd10ms$ok&w=550&h=350&i=Picture%20nr\"$zd10ms\"\" onclick=\"NewWindow(this.href,'name','570','370','no');return false;\">";
	echo "<img src=\"../img/zd$zd10ms.jpg\" width=\"125\" height=\"100\" border=\"0\" alt=\"Picture nr$zd10ms\"></img></a><br><span class=\"\">";
	echo "Picture nr $zd10ms";
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
	echo "<a href=\"image.php?p=../img/zd$zd11ms$ok&w=550&h=350&i=Picture%20nr\"$zd11ms\"\" onclick=\"NewWindow(this.href,'name','570','370','no');return false;\">";
	echo "<img src=\"../img/zd$zd11ms.jpg\" width=\"125\" height=\"100\" border=\"0\" alt=\"Picture nr$zd11ms\"></img></a><br><span class=\"\">";
	echo "Picture nr $zd11ms";
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
	echo "<a href=\"image.php?p=../img/zd$zd12ms$ok&w=550&h=350&i=Picture%20nr\"$zd12ms\"\" onclick=\"NewWindow(this.href,'name','570','370','no');return false;\">";
	echo "<img src=\"../img/zd$zd12ms.jpg\" width=\"125\" height=\"100\" border=\"0\" alt=\"Picture nr$zd12ms\"></img></a><br><span class=\"\">";
	echo "Picture nr $zd12ms";
	echo "</span>";
	echo "</center>";
	echo "</td>";

}

if (($zd9ms != '0')  || ($zd10ms != '0') || ($zd11ms != '0')  || ($zd12ms != '0')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}

$sqltechb = "SELECT teb_d, teb_d_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resulttechb = @pg_Exec($conn, $sqltechb);
			$techbs = pg_result($resulttechb, 0, "teb_d");
			$techbbo = pg_result($resulttechb, 0, "teb_d_bo");
				
	$sqltechbs = "SELECT nazwat_b_en FROM techno_b where id = '$techbs';";
			
			$resulttechbs = @pg_Exec($conn, $sqltechbs);
			$techbps = pg_result($resulttechbs, 0, "nazwat_b_en");

$sqlmatb = "SELECT mat_d, mat_d_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultmatb = @pg_Exec($conn, $sqlmatb);
			$matbs = pg_result($resultmatb, 0, "mat_d");
			$matbbo = pg_result($resultmatb, 0, "mat_d_bo");
				
	$sqlmatbs = "SELECT nazwa_m_en FROM material_b where id = '$matbs';";
			
			$resultmatbs = @pg_Exec($conn, $sqlmatbs);
			$matbps = pg_result($resultmatbs, 0, "nazwa_m_en");

$sqldachd = "SELECT kdach_d, kdach_d_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultdachd = @pg_Exec($conn, $sqldachd);
			$dachds = pg_result($resultdachd, 0, "kdach_d");
			$dachdbo = pg_result($resultdachd, 0, "kdach_d_bo");
				
	$sqldachds = "SELECT nazwa_da_en FROM dach where id = '$dachds';";
			
			$resultkdachds = @pg_Exec($conn, $sqldachds);
			$dachdps = pg_result($resultkdachds, 0, "nazwa_da_en");

$sqlrokbu = "SELECT rok_d, rok_d_bo FROM tab_dom_za where id_d = '$nu';";	
	$resultrokbu = @pg_Exec($conn, $sqlrokbu);
	$rokbus = pg_result($resultrokbu, 0, "rok_d");
	$rokbusp = pg_result($resultrokbu, 0, "rok_d_bo");

$sqlwysok = "SELECT wo_d, wo_d_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultwysok = @pg_Exec($conn, $sqlwysok);
			$wysoks = pg_result($resultwysok, 0, "wo_d");
			$wysokbo = pg_result($resultwysok, 0, "wo_d_bo");
				
	$sqlwysoks = "SELECT nazwa_wy_en FROM wystawka_o where id = '$wysoks';";
			
			$resultwysoks = @pg_Exec($conn, $sqlwysoks);
			$wysokps = pg_result($resultwysoks, 0, "nazwa_wy_en");	

$sqlwyspo = "SELECT ws_d, ws_d_bo FROM tab_dom_za where id_d = '$nu';";	
	$resultwyspo = @pg_Exec($conn, $sqlwyspo);
	$wyspos = pg_result($resultwyspo, 0, "ws_d");
	$wysposp = pg_result($resultwyspo, 0, "ws_d_bo");	


	$sqlokna = "SELECT okn_d, okn_d_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultokna = @pg_Exec($conn, $sqlokna);
			$oknas = pg_result($resultokna, 0, "okn_d");
			$oknabo = pg_result($resultokna, 0, "okn_d_bo");
				
	$sqloknas = "SELECT nazwa_ok_en FROM okna where id = '$oknas';";
			
			$resultoknas = @pg_Exec($conn, $sqloknas);
			$oknaps = pg_result($resultoknas, 0, "nazwa_ok_en");


if (($techbbo == 't') || ($matbbo == 't') || ($dachdbo == 't')  || ($rokbusp == 't') || ($wysokbo == 't')  || ($wysposp == 't') || ($oknabo == 't')) {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
echo "<tr><td colspan=\"40\" height=\"7\" bgcolor=\"#5865E5\">";
echo "<span class=\"nag1wb\">";
echo "&nbsp;Technical information";
echo "</span>";
echo "</td></tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}
if (($techbbo == 't') || ($matbbo == 't') || ($dachdbo == 't') || ($rokbusp == 't')) {
echo "<tr>"; 
}
if ($techbbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Building technology:</b><br>&nbsp;$techbps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($matbbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Building materials:</b><br>&nbsp;$matbps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($dachdbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Cover of roof:</b><br>&nbsp;$dachdps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($rokbusp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Year of the construction:</b><br>&nbsp;$rokbus";
echo "</td>";

}

if (($techbbo == 't') || ($matbbo == 't') || ($dachdbo == 't') || ($rokbusp == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}
if (($wysokbo == 't')  || ($wysposp == 't') || ($oknabo == 't')) {
echo "<tr>";
}
if ($wysokbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Exhibition of windows:</b><br>&nbsp;$wysokps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($wysposp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Height of rooms:</b><br>&nbsp;$wyspos m";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($oknabo == 't') {

echo "<td height=\"25\" colspan = \"20\">";
echo "&nbsp;<b>Windows:</b><br>&nbsp;$oknaps";
echo "</td>";

}

if (($wysokbo == 't')  || ($wysposp == 't') || ($oknabo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}


$sqlkszdz = "SELECT ksdzi_d, ksdzi_d_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultkszdz = @pg_Exec($conn, $sqlkszdz);
			$kszdzs = pg_result($resultkszdz, 0, "ksdzi_d");
			$kszdzbo = pg_result($resultkszdz, 0, "ksdzi_d_bo");
				
	$sqlkszdzs = "SELECT nazwa_dz_en FROM dzialka where id = '$kszdzs';";
			
			$resultkszdzs = @pg_Exec($conn, $sqlkszdzs);
			$kszdzps = pg_result($resultkszdzs, 0, "nazwa_dz_en");


$sqlszdz = "SELECT szdzi_d, szdzi_d_bo FROM tab_dom_za where id_d = '$nu';";	
	$resultszdz = @pg_Exec($conn, $sqlszdz);
	$szdzis = pg_result($resultszdz, 0, "szdzi_d");
	$szdzisp = pg_result($resultszdz, 0, "szdzi_d_bo");

$sqldldz = "SELECT dldz_d, dldz_d_bo FROM tab_dom_za where id_d = '$nu';";	
	$resultdldz = @pg_Exec($conn, $sqldldz);
	$dldzs = pg_result($resultdldz, 0, "dldz_d");
	$dldzsp = pg_result($resultdldz, 0, "dldz_d_bo");

$sqlnardz = "SELECT dzinar_d, dzinar_d_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultnardz = @pg_Exec($conn, $sqlnardz);
			$nardzs = pg_result($resultnardz, 0, "dzinar_d");
			$nardzbo = pg_result($resultnardz, 0, "dzinar_d_bo");
				
	$sqlnardzs = "SELECT nazwa_nar_en FROM dzialka_nar where id = '$nardzs';";
			
			$resultnardzs = @pg_Exec($conn, $sqlnardzs);
			$nardzps = pg_result($resultnardzs, 0, "nazwa_nar_en");

$sqlogrdz = "SELECT dziogr_d, dziogr_d_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultogrdz = @pg_Exec($conn, $sqlogrdz);
			$ogrdzs = pg_result($resultogrdz, 0, "dziogr_d");
			$ogrdzbo = pg_result($resultogrdz, 0, "dziogr_d_bo");
				
	$sqlogrdzs = "SELECT nazwa_og_en FROM dzialka_og where id = '$ogrdzs';";
			
			$resultogrdzs = @pg_Exec($conn, $sqlogrdzs);
			$ogrdzps = pg_result($resultogrdzs, 0, "nazwa_og_en");


	$sqluksz = "SELECT uksz_d, uksz_d_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultuksz = @pg_Exec($conn, $sqluksz);
			$ukszs = pg_result($resultuksz, 0, "uksz_d");
			$ukszbo = pg_result($resultuksz, 0, "uksz_d_bo");
				
	$sqlukszs = "SELECT nazwa_uk_en FROM dzialka_uk where id = '$ukszs';";
			
			$resultukszs = @pg_Exec($conn, $sqlukszs);
			$ukszps = pg_result($resultukszs, 0, "nazwa_uk_en");

$sqlzad = "SELECT zaddzi_d, zaddzi_d_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultzad = @pg_Exec($conn, $sqlzad);
			$zads = pg_result($resultzad, 0, "zaddzi_d");
			$zadbo = pg_result($resultzad, 0, "zaddzi_d_bo");
				
	$sqlzads = "SELECT nazwa_za_en FROM dzialka_za where id = '$zads';";
			
			$resultzads = @pg_Exec($conn, $sqlzads);
			$zadps = pg_result($resultzads, 0, "nazwa_za_en");

if (($kszdzbo == 't') || ($szdzisp == 't') || ($dldzsp == 't')  || ($nardzbo == 't') || ($ogrdzbo == 't')  || ($ukszbo == 't') || ($zadbo == 't')) {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
echo "<tr><td colspan=\"40\" height=\"7\" bgcolor=\"#5865E5\">";
echo "<span class=\"nag1wb\">";
echo "&nbsp;Plot";
echo "</span>";
echo "</td></tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}
if (($kszdzbo == 't') || ($szdzisp == 't') || ($dldzsp == 't') || ($nardzbo == 't')) {
echo "<tr>"; 
}
if ($kszdzbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Form of area:</b><br>&nbsp;$kszdzps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($szdzisp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Width of area:</b><br>&nbsp;$szdzis m";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($dldzsp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Length of area:</b><br>&nbsp;$dldzs m";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($nardzbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Corner area:</b><br>&nbsp;$nardzps";
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
echo "&nbsp;<b>Area hedged:</b><br>&nbsp;$ogrdzps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($ukszbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Vertical forming:</b><br>&nbsp;$ukszps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($zadbo == 't') {

echo "<td height=\"25\" colspan = \"20\">";
echo "&nbsp;<b>Area afforested:</b><br>&nbsp;$zadps";
echo "</td>";

}

if (($ogrdzbo == 't')  || ($ukszbo == 't') || ($zadbo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}


	$sqlogrze = "SELECT ogrz_d, ogrz_d_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultogrze = @pg_Exec($conn, $sqlogrze);
			$ogrzes = pg_result($resultogrze, 0, "ogrz_d");
			$ogrzebo = pg_result($resultogrze, 0, "ogrz_d_bo");
				
	$sqlogrzes = "SELECT nazwa_grz_en FROM ogrzewanie where id = '$ogrzes';";
			
			$resultogrzes = @pg_Exec($conn, $sqlogrzes);
			$ogrzeps = pg_result($resultogrzes, 0, "nazwa_grz_en");
	
$sqlciepwo = "SELECT ciewod_d, ciewod_d_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultciepwo = @pg_Exec($conn, $sqlciepwo);
			$ciepwos = pg_result($resultciepwo, 0, "ciewod_d");
			$ciepwobo = pg_result($resultciepwo, 0, "ciewod_d_bo");
				
	$sqlciepwos = "SELECT nazwa_wo_en FROM ciepla_woda where id = '$ciepwos';";
			
			$resultciepwos = @pg_Exec($conn, $sqlciepwos);
			$ciepwops = pg_result($resultciepwos, 0, "nazwa_wo_en");

$sqlsila = "SELECT sila_d, sila_d_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultsila = @pg_Exec($conn, $sqlsila);
			$silas = pg_result($resultsila, 0, "sila_d");
			$silabo = pg_result($resultsila, 0, "sila_d_bo");
				
	$sqlsilas = "SELECT nazwa_si_en FROM sila where id = '$silas';";
			
			$resultsilas = @pg_Exec($conn, $sqlsilas);
			$silaps = pg_result($resultsilas, 0, "nazwa_si_en");

$sqlwoda = "SELECT wod_d, wod_d_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultwodat = @pg_Exec($conn, $sqlwoda);
			$wodas = pg_result($resultwodat, 0, "wod_d");
			$wodabo = pg_result($resultwodat, 0, "wod_d_bo");
				
	$sqlwodas = "SELECT nazwa_wo_en FROM woda where id = '$wodas';";
			
			$resultwodas = @pg_Exec($conn, $sqlwodas);
			$wodaps = pg_result($resultwodas, 0, "nazwa_wo_en");

$sqlgaz = "SELECT gaz_d, gaz_d_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultgaz = @pg_Exec($conn, $sqlgaz);
			$gazs = pg_result($resultgaz, 0, "gaz_d");
			$gazbo = pg_result($resultgaz, 0, "gaz_d_bo");
				
	$sqlgazs = "SELECT nazwa_g_en FROM gaz where id = '$gazs';";
			
			$resultgazs = @pg_Exec($conn, $sqlgazs);
			$gazps = pg_result($resultgazs, 0, "nazwa_g_en");

$sqlkanal = "SELECT kanal_d, kanal_d_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultkanal = @pg_Exec($conn, $sqlkanal);
			$kanals = pg_result($resultkanal, 0, "kanal_d");
			$kanalbo = pg_result($resultkanal, 0, "kanal_d_bo");
				
	$sqlkanals = "SELECT nazwa_ka_en FROM kanaliza where id = '$kanals';";
			
			$resultkanals = @pg_Exec($conn, $sqlkanals);
			$kanalps = pg_result($resultkanals, 0, "nazwa_ka_en");

$sqltel = "SELECT tel_d, tel_d_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resulttel = @pg_Exec($conn, $sqltel);
			$tels = pg_result($resulttel, 0, "tel_d");
			$telbo = pg_result($resulttel, 0, "tel_d_bo");
				
	$sqltels = "SELECT nazwa_te_en FROM telefon where id = '$tels';";
			
			$resulttels = @pg_Exec($conn, $sqltels);
			$telps = pg_result($resulttels, 0, "nazwa_te_en");

$sqlkabl = "SELECT siecka_d, siecka_d_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultkabl = @pg_Exec($conn, $sqlkabl);
			$kabls = pg_result($resultkabl, 0, "siecka_d");
			$kablbo = pg_result($resultkabl, 0, "siecka_d_bo");
				
	$sqlkabls = "SELECT nazwa_kab_en FROM kablowa where id = '$kabls';";
			
			$resultkabls = @pg_Exec($conn, $sqlkabls);
			$kablps = pg_result($resultkabls, 0, "nazwa_kab_en");

$sqlantena = "SELECT antena_d, antena_d_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultantena = @pg_Exec($conn, $sqlantena);
			$antenas = pg_result($resultantena, 0, "antena_d");
			$antenabo = pg_result($resultantena, 0, "antena_d_bo");
				
	$sqlantenas = "SELECT nazwa_an_en FROM antena where id = '$antenas';";
			
			$resultantenas = @pg_Exec($conn, $sqlantenas);
			$antenaps = pg_result($resultantenas, 0, "nazwa_an_en");

$sqlsiec = "SELECT siecint_d, siecint_d_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultsiec = @pg_Exec($conn, $sqlsiec);
			$siecs = pg_result($resultsiec, 0, "siecint_d");
			$siecbo = pg_result($resultsiec, 0, "siecint_d_bo");
				
	$sqlsiecs = "SELECT nazwa_siec_en FROM siec_inter where id = '$siecs';";
			
			$resultsiecs = @pg_Exec($conn, $sqlsiecs);
			$siecps = pg_result($resultsiecs, 0, "nazwa_siec_en");



if (($ogrzebo == 't')  || ($ciepwobo == 't') || ($silabo == 't') || ($wodabo == 't') || ($gazbo == 't') || ($kanalbo == 't')  || ($telbo == 't') || ($kablbo == 't') || ($antenabo == 't') || ($siecbo == 't')) {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
echo "<tr><td colspan=\"40\" height=\"7\" bgcolor=\"#5865E5\">";
echo "<span class=\"nag1wb\">";
echo "&nbsp;Media";
echo "</span>";
echo "</td></tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}
if (($ogrzebo == 't')  || ($ciepwobo == 't') || ($silabo == 't') || ($wodabo == 't')) {
echo "<tr>"; 
}
if ($ogrzebo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Heating:</b><br>&nbsp;$ogrzeps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($ciepwobo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Warm water:</b><br>&nbsp;$ciepwops";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($silabo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Electric force:</b><br>&nbsp;$silaps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($wodabo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Water:</b><br>&nbsp;$wodaps";
echo "</td>";

}
if (($ogrzebo == 't')  || ($ciepwobo == 't') || ($silabo == 't') || ($wodabo == 't')) {
echo "</tr>"; 
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}
if (($gazbo == 't') || ($kanalbo == 't')  || ($telbo == 't') || ($kablbo == 't')) {
echo "<tr>"; 
}
if ($gazbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Gas:</b><br>&nbsp;$gazps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($kanalbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Sewage system:</b><br>&nbsp;$kanalps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($telbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Telephone:</b><br>&nbsp;$telps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($kablbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Cable network:</b><br>&nbsp;$kablps";
echo "</td>";

}


if (($gazbo == 't') || ($kanalbo == 't')  || ($telbo == 't') || ($kablbo == 't')) {
echo "</tr>"; 
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}
if (($antenabo == 't') || ($siecbo == 't')) {
echo "<tr>"; 
}
if ($antenabo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Aerial:</b><br>&nbsp;$antenaps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($siecbo == 't') {
echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Internet network:</b><br>&nbsp;$siecps";
echo "</td>";

}

if (($antenabo == 't') || ($siecbo == 't')) {
echo "</tr>"; 
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}


	$sqlosiedle = "SELECT ostrz_d, ostrz_d_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultosiedle = @pg_Exec($conn, $sqlosiedle);
			$osiedle = pg_result($resultosiedle, 0, "ostrz_d");
			$osiedlebo = pg_result($resultosiedle, 0, "ostrz_d_bo");
				
	$sqlosiedles = "SELECT nazwa_os_en FROM osiedle_st where id = '$osiedle';";
			
			$resultosiedles = @pg_Exec($conn, $sqlosiedles);
			$osiedleps = pg_result($resultosiedles, 0, "nazwa_os_en");
	
$sqldfon = "SELECT domof_d, domof_d_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultdfon = @pg_Exec($conn, $sqldfon);
			$dfon = pg_result($resultdfon, 0, "domof_d");
			$dfonbo = pg_result($resultdfon, 0, "domof_d_bo");
				
	$sqldfons = "SELECT nazwa_do_en FROM domofon where id = '$dfon';";
			
			$resultdfons = @pg_Exec($conn, $sqldfons);
			$dfonps = pg_result($resultdfons, 0, "nazwa_do_en");

$sqldanty = "SELECT drzwant_d, drzwant_d_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultdanty = @pg_Exec($conn, $sqldanty);
			$danty = pg_result($resultdanty, 0, "drzwant_d");
			$dantybo = pg_result($resultdanty, 0, "drzwant_d_bo");
				
	$sqldantys = "SELECT nazwa_dz_en FROM drzwi_anty where id = '$danty';";
			
			$resultdantys = @pg_Exec($conn, $sqldantys);
			$dantyps = pg_result($resultdantys, 0, "nazwa_dz_en");

$sqlrolety = "SELECT rol_d, rol_d_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultrolety = @pg_Exec($conn, $sqlrolety);
			$rolety = pg_result($resultrolety, 0, "rol_d");
			$roletybo = pg_result($resultrolety, 0, "rol_d_bo");
				
	$sqlroletys = "SELECT nazwa_ro_en FROM rolety where id = '$rolety';";
			
			$resultroletys = @pg_Exec($conn, $sqlroletys);
			$roletyps = pg_result($resultroletys, 0, "nazwa_ro_en");

$sqlkamery = "SELECT kv_d, kv_d_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultkamery = @pg_Exec($conn, $sqlkamery);
			$kamery = pg_result($resultkamery, 0, "kv_d");
			$kamerybo = pg_result($resultkamery, 0, "kv_d_bo");
				
	$sqlkamerys = "SELECT nazwa_kam_en FROM kamery where id = '$kamery';";
			
			$resultkamerys = @pg_Exec($conn, $sqlkamerys);
			$kameryps = pg_result($resultkamerys, 0, "nazwa_kam_en");

$sqlkraty = "SELECT kra_d, kra_d_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultkraty = @pg_Exec($conn, $sqlkraty);
			$kratys = pg_result($resultkraty, 0, "kra_d");
			$kratybo = pg_result($resultkraty, 0, "kra_d_bo");
				
	$sqlkratys = "SELECT nazwa_kr_en FROM kraty where id = '$kratys';";
			
			$resultkratys = @pg_Exec($conn, $sqlkratys);
			$kratyps = pg_result($resultkratys, 0, "nazwa_kr_en");


$sqlalarm = "SELECT alar_d, alar_d_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultalarm = @pg_Exec($conn, $sqlalarm);
			$alarm = pg_result($resultalarm, 0, "alar_d");
			$alarmbo = pg_result($resultalarm, 0, "alar_d_bo");
				
	$sqlalarms = "SELECT nazwa_al_en FROM alarm where id = '$alarm';";
			
			$resultalarms = @pg_Exec($conn, $sqlalarms);
			$alarmps = pg_result($resultalarms, 0, "nazwa_al_en");

$sqlokanty = "SELECT okant_d, okant_d_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultokanty = @pg_Exec($conn, $sqlokanty);
			$okanty = pg_result($resultokanty, 0, "okant_d");
			$okantybo = pg_result($resultokanty, 0, "okant_d_bo");
				
	$sqlokantys = "SELECT nazwao_anty_en FROM okna_anty where id = '$okanty';";
			
			$resultokantys = @pg_Exec($conn, $sqlokantys);
			$okantyps = pg_result($resultokantys, 0, "nazwao_anty_en");


if (($osiedlebo == 't')  || ($dfonbo == 't') || ($dantybo == 't') || ($roletybo == 't') || ($kamerybo == 't') || ($kratybo == 't') || ($alarmbo == 't') || ($okantybo == 't')) {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
echo "<tr><td colspan=\"40\" height=\"7\" bgcolor=\"#5865E5\">";
echo "<span class=\"nag1wb\">";
echo "&nbsp;Securities";
echo "</span>";
echo "</td></tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}
if (($osiedlebo == 't')  || ($dfonbo == 't') || ($dantybo == 't') || ($roletybo == 't')) {
echo "<tr>"; 
}
if ($osiedlebo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Guarded housing estate:</b><br>&nbsp;$osiedleps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($dfonbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Interphone:</b><br>&nbsp;$dfonps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($dantybo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Security door:</b><br>&nbsp;$dantyps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($roletybo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Roll-ups:</b><br>&nbsp;$roletyps";
echo "</td>";

}

if (($osiedlebo == 't')  || ($dfonbo == 't') || ($dantybo == 't') || ($roletybo == 't')) {
echo "</tr>"; 
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}
if (($kamerybo == 't') || ($kratybo == 't') || ($alarmbo == 't') || ($okantybo == 't')) {
echo "<tr>"; 
}
if ($kamerybo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Cameras:</b><br>&nbsp;$kameryps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($kratybo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Grids:</b><br>&nbsp;$kratyps";
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
echo "&nbsp;<b>Security windows:</b><br>&nbsp;$okantyps";
echo "</td>";
}

if (($kamerybo == 't') || ($kratybo == 't') || ($alarmbo == 't') || ($okantybo == 't')) {
echo "</tr>"; 
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}


$sqlklim = "SELECT klim_d, klim_d_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultklim = @pg_Exec($conn, $sqlklim);
			$klima = pg_result($resultklim, 0, "klim_d");
			$klimabo = pg_result($resultklim, 0, "klim_d_bo");
				
	$sqlklims = "SELECT nazwa_kli_en FROM klima where id = '$klima';";
			
			$resultklims = @pg_Exec($conn, $sqlklims);
			$klimps = pg_result($resultklims, 0, "nazwa_kli_en");

$sqlkomi = "SELECT komin_d, komin_d_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultkomi = @pg_Exec($conn, $sqlkomi);
			$komin = pg_result($resultkomi, 0, "komin_d");
			$kominbo = pg_result($resultkomi, 0, "komin_d_bo");
				
	$sqlkomis = "SELECT nazwa_ko_en FROM kominek where id = '$komin';";
			
			$resultkomis = @pg_Exec($conn, $sqlkomis);
			$kominps = pg_result($resultkomis, 0, "nazwa_ko_en");

$sqljac = "SELECT jac_d, jac_d_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultjac = @pg_Exec($conn, $sqljac);
			$jacc = pg_result($resultjac, 0, "jac_d");
			$jacbo = pg_result($resultjac, 0, "jac_d_bo");
				
	$sqljacs = "SELECT nazwa_ja_en FROM jaccuzi where id = '$jacc';";
			
			$resultjacs = @pg_Exec($conn, $sqljacs);
			$jacps = pg_result($resultjacs, 0, "nazwa_ja_en");

$sqlfit = "SELECT fit_d, fit_d_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultfit = @pg_Exec($conn, $sqlfit);
			$fit = pg_result($resultfit, 0, "fit_d");
			$fitbo = pg_result($resultfit, 0, "fit_d_bo");
				
	$sqlfits = "SELECT nazwa_fi_en FROM fitness where id = '$fit';";
			
			$resultfits = @pg_Exec($conn, $sqlfits);
			$fitps = pg_result($resultfits, 0, "nazwa_fi_en");

$sqlplac = "SELECT plac_d, plac_d_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultplac = @pg_Exec($conn, $sqlplac);
			$plac = pg_result($resultplac, 0, "plac_d");
			$placbo = pg_result($resultplac, 0, "plac_d_bo");
				
	$sqlplacs = "SELECT nazwa_zab_en FROM plac_zabaw where id = '$plac';";
			
			$resultplacs = @pg_Exec($conn, $sqlplacs);
			$placps = pg_result($resultplacs, 0, "nazwa_zab_en");

$sqlogr = "SELECT ogrodek_d, ogrodek_d_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultogr = @pg_Exec($conn, $sqlogr);
			$ogr = pg_result($resultogr, 0, "ogrodek_d");
			$ogrbo = pg_result($resultogr, 0, "ogrodek_d_bo");
				
	$sqlogrs = "SELECT nazwa_ogr_en FROM ogrodek where id = '$ogr';";
			
			$resultogrs = @pg_Exec($conn, $sqlogrs);
			$ogrps = pg_result($resultogrs, 0, "nazwa_ogr_en");

$sqloczko = "SELECT oczk_d, oczk_d_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultoczko = @pg_Exec($conn, $sqloczko);
			$oczkos = pg_result($resultoczko, 0, "oczk_d");
			$oczkobo = pg_result($resultoczko, 0, "oczk_d_bo");
				
	$sqloczkos = "SELECT nazwa_ocz_en FROM oczko where id = '$oczkos';";
			
			$resultoczkos = @pg_Exec($conn, $sqloczkos);
			$oczkops = pg_result($resultoczkos, 0, "nazwa_ocz_en");

$sqlpiwn = "SELECT piwn_d, piwn_d_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultpiwn = @pg_Exec($conn, $sqlpiwn);
			$piwn = pg_result($resultpiwn, 0, "piwn_d");
			$piwnbo = pg_result($resultpiwn, 0, "piwn_d_bo");
				
	$sqlpiwns = "SELECT nazwa_pi_en FROM piwnica where id = '$piwn';";
			
			$resultpiwns = @pg_Exec($conn, $sqlpiwns);
			$piwnps = pg_result($resultpiwns, 0, "nazwa_pi_en");

$sqlsauna = "SELECT saun_d, saun_d_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultsauna = @pg_Exec($conn, $sqlsauna);
			$sauna = pg_result($resultsauna, 0, "saun_d");
			$saunabo = pg_result($resultsauna, 0, "saun_d_bo");
				
	$sqlsaunas = "SELECT nazwa_sa_en FROM sauna where id = '$sauna';";
			
			$resultsaunas = @pg_Exec($conn, $sqlsaunas);
			$saunaps = pg_result($resultsaunas, 0, "nazwa_sa_en");

$sqlbasen = "SELECT basen_d, basen_d_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultbasen = @pg_Exec($conn, $sqlbasen);
			$basen = pg_result($resultbasen, 0, "basen_d");
			$basenbo = pg_result($resultbasen, 0, "basen_d_bo");
				
	$sqlbasens = "SELECT nazwa_bas_en FROM basen where id = '$basen';";
			
			$resultbasens = @pg_Exec($conn, $sqlbasens);
			$basenps = pg_result($resultbasens, 0, "nazwa_bas_en");

$sqlkort = "SELECT kort_d, kort_d_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultkort = @pg_Exec($conn, $sqlkort);
			$kort = pg_result($resultkort, 0, "kort_d");
			$kortbo = pg_result($resultkort, 0, "kort_d_bo");
				
	$sqlkorts = "SELECT nazwa_kor_en FROM kort_te where id = '$kort';";
			
			$resultkorts = @pg_Exec($conn, $sqlkorts);
			$kortps = pg_result($resultkorts, 0, "nazwa_kor_en");

$sqlwarsz = "SELECT warsz_d, warsz_d_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultwarsz = @pg_Exec($conn, $sqlwarsz);
			$warszt = pg_result($resultwarsz, 0, "warsz_d");
			$warsztbo = pg_result($resultwarsz, 0, "warsz_d_bo");
				
	$sqlwarszs = "SELECT nazwa_wa_en FROM warsztat where id = '$warszt';";
			
			$resultwarszts = @pg_Exec($conn, $sqlwarszs);
			$warsztps = pg_result($resultwarszts, 0, "nazwa_wa_en");

	$sqlmiej = "SELECT mip_d, mip_d_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultmiej = @pg_Exec($conn, $sqlmiej);
			$miej = pg_result($resultmiej, 0, "mip_d");
			$miejbo = pg_result($resultmiej, 0, "mip_d_bo");
				
	$sqlmiejs = "SELECT nazwa_pa_en FROM parking where id = '$miej';";
			
			$resultmiejs = @pg_Exec($conn, $sqlmiejs);
			$miejps = pg_result($resultmiejs, 0, "nazwa_pa_en");

$sqludog = "SELECT udog_d, udog_d_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultudog = @pg_Exec($conn, $sqludog);
			$udog = pg_result($resultudog, 0, "udog_d");
			$udogbo = pg_result($resultudog, 0, "udog_d_bo");
				
	$sqludogs = "SELECT nazwa_nie_en FROM niepelno where id = '$udog';";
			
			$resultudogs = @pg_Exec($conn, $sqludogs);
			$udogps = pg_result($resultudogs, 0, "nazwa_nie_en");

$sqlligar = "SELECT ligar_d, ligar_d_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultligar = @pg_Exec($conn, $sqlligar);
			$lgar = pg_result($resultligar, 0, "ligar_d");
			$lgarbo = pg_result($resultligar, 0, "ligar_d_bo");


$sqlusgar = "SELECT usgar_d, usgar_d_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultusgar = @pg_Exec($conn, $sqlusgar);
			$usgars = pg_result($resultusgar, 0, "usgar_d");
			$usgarbo = pg_result($resultusgar, 0, "usgar_d_bo");
				
	$sqlusgars = "SELECT nazwa_usyt_en FROM garaz_usyt where id = '$usgars';";
			
			$resultusgars = @pg_Exec($conn, $sqlusgars);
			$usgarps = pg_result($resultusgars, 0, "nazwa_usyt_en");


if (($klimabo == 't') || ($kominbo == 't') || ($jacbo == 't') || ($fitbo == 't') || ($placbo == 't') || ($ogrbo == 't') || ($oczkobo == 't') || ($piwnbo == 't') || ($saunabo == 't') || ($basenbo == 't') || ($kortbo == 't') || ($warsztbo == 't') || ($miejbo == 't') || ($udogbo == 't') || ($lgarbo == 't') || ($usgarbo == 't')) {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
echo "<tr><td colspan=\"40\" height=\"7\" bgcolor=\"#5865E5\">";
echo "<span class=\"nag1wb\">";
echo "&nbsp;Facilities";
echo "</span>";
echo "</td></tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}
if (($klimabo == 't') || ($kominbo == 't') || ($jacbo == 't') || ($fitbo == 't')) {
echo "<tr>"; 
}
if ($klimabo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Air-conditioning:</b><br>&nbsp;$klimps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($kominbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Fireplace:</b><br>&nbsp;$kominps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($jacbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Jaccuzi:</b><br>&nbsp;$jacps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($fitbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Fitnessclub:</b><br>&nbsp;$fitps";
echo "</td>";

}
if (($klimabo == 't') || ($kominbo == 't') || ($jacbo == 't') || ($fitbo == 't')) {
echo "</tr>"; 
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}
if (($placbo == 't') || ($ogrbo == 't') || ($oczkobo == 't') || ($piwnbo == 't')) {
echo "<tr>"; 
}
if ($placbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Playground:</b><br>&nbsp;$placps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($ogrbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Garden:</b><br>&nbsp;$ogrps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($oczkobo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Water mesh:</b><br>&nbsp;$oczkops";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($piwnbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Cellar:</b><br>&nbsp;$piwnps";
echo "</td>";


}

if (($placbo == 't') || ($ogrbo == 't') || ($oczkobo == 't') || ($piwnbo == 't')) {
echo "</tr>"; 
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}
if (($basenbo == 't') || ($kortbo == 't') || ($warsztbo == 't') || ($miejbo == 't')) {
echo "<tr>"; 
}
if ($saunabo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Sauna:</b><br>&nbsp;$saunaps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($kortbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Tennis court:</b><br>&nbsp;$kortps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($warsztbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Auto service:</b><br>&nbsp;$warsztps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($miejbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Parking place:</b><br>&nbsp;$miejps";
echo "</td>";

}

if (($basenbo == 't') || ($kortbo == 't') || ($warsztbo == 't') || ($miejbo == 't')) {
echo "</tr>"; 
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}
if (($udogbo == 't') || ($lgarbo == 't') || ($usgarbo == 't')) {
echo "<tr>"; 
}
if ($udogbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Convenience for handicapped:</b><br>&nbsp;$udogps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($lgarbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Number of garages:</b><br>&nbsp;$lgar";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($usgarbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Situation of garages:</b><br>&nbsp;$usgarps";
echo "</td>";

}

if (($udogbo == 't') || ($lgarbo == 't') || ($usgarbo == 't')) {
echo "</tr>"; 
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}




$sqluli = "SELECT tdr_d, tdr_d_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultuli = @pg_Exec($conn, $sqluli);
			$uli = pg_result($resultuli, 0, "tdr_d");
			$ulibo = pg_result($resultuli, 0, "tdr_d_bo");
				
	$sqlulis = "SELECT nazwa_ul_en FROM typ_ulicy where id = '$uli';";
			
			$resultulis = @pg_Exec($conn, $sqlulis);
			$ulips = pg_result($resultulis, 0, "nazwa_ul_en");

$sqlnadr = "SELECT ndr_d, ndr_d_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultnadr = @pg_Exec($conn, $sqlnadr);
			$nadr = pg_result($resultnadr, 0, "ndr_d");
			$nadrbo = pg_result($resultnadr, 0, "ndr_d_bo");
				
	$sqlnadrs = "SELECT nazwa_na_en FROM nawierzchnia where id = '$nadr';";
			
			$resultnadrs = @pg_Exec($conn, $sqlnadrs);
			$nadrps = pg_result($resultnadrs, 0, "nazwa_na_en");

$sqlkomu = "SELECT kmod_d, kmod_d_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultkomu = @pg_Exec($conn, $sqlkomu);
			$komu = pg_result($resultkomu, 0, "kmod_d");
			$komubo = pg_result($resultkomu, 0, "kmod_d_bo");
				
	$sqlkomus = "SELECT nazwa_kom_en FROM komunikacja where id = '$komu';";
			
			$resultkomus = @pg_Exec($conn, $sqlkomus);
			$komups = pg_result($resultkomus, 0, "nazwa_kom_en");

$sqlodcm = "SELECT odlce_d, odlce_d_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultodcm = @pg_Exec($conn, $sqlodcm);
			$odcm = pg_result($resultodcm, 0, "odlce_d");
			$odcmbo = pg_result($resultodcm, 0, "odlce_d_bo");

$sqlodsp = "SELECT odlprz_d, odlprz_d_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultodsp = @pg_Exec($conn, $sqlodsp);
			$odsp = pg_result($resultodsp, 0, "odlprz_d");
			$odspbo = pg_result($resultodsp, 0, "odlprz_d_bo");

$sqlotocz = "SELECT otnie_d, otnie_d_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultotocz = @pg_Exec($conn, $sqlotocz);
			$otocz = pg_result($resultotocz, 0, "otnie_d");
			$otoczbo = pg_result($resultotocz, 0, "otnie_d_bo");
				
	$sqlotoczs = "SELECT nazwa_oto_en FROM otoczenie where id = '$otocz';";
			
			$resultotoczs = @pg_Exec($conn, $sqlotoczs);
			$otoczps = pg_result($resultotoczs, 0, "nazwa_oto_en");	
			
$sqlsas = "SELECT sas_d, sas_d_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultsas = @pg_Exec($conn, $sqlsas);
			$sass = pg_result($resultsas, 0, "sas_d");
			$sasbo = pg_result($resultsas, 0, "sas_d_bo");
				
	$sqlsass = "SELECT nazwa_sas_en FROM sasiedztwo where id = '$sass';";
			
			$resultsass = @pg_Exec($conn, $sqlsass);
			$sasps = pg_result($resultsass, 0, "nazwa_sas_en");

if (($ulibo == 't') || ($nadrbo == 't') || ($komubo == 't') || ($odcmbo == 't') || ($odspbo == 't') || ($otoczbo == 't') || ($sasbo == 't')) {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
echo "<tr><td colspan=\"40\" height=\"7\" bgcolor=\"#5865E5\">";
echo "<span class=\"nag1wb\">";
echo "&nbsp;Locating";
echo "</span>";
echo "</td></tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}

if (($ulibo == 't') || ($nadrbo == 't') || ($komubo == 't') || ($odcmbo == 't')) {
echo "<tr>"; 
}

if ($ulibo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Street/road type:</b><br>&nbsp;$ulips";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($nadrbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Surface of the way:</b><br>&nbsp;$nadrps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($komubo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Communication:</b><br>&nbsp;$komups";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($odcmbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Distance from the centre:</b><br>&nbsp;$odcm m";
echo "</td>";

}

if (($ulibo == 't') || ($nadrbo == 't') || ($komubo == 't') || ($odcmbo == 't')) {
echo "</tr>"; 
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}
if (($odspbo == 't') || ($otoczbo == 't') || ($sasbo == 't')) {
echo "<tr>"; 
}
if ($odspbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Distance from the school:</b><br>&nbsp;$odsp m";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($otoczbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Nonarduous environment:</b><br>&nbsp;$otoczps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($sasbo == 't') {

echo "<td height=\"25\" colspan = \"20\">";
echo "&nbsp;<b>Neighborhood:</b><br>&nbsp;$sasps";
echo "</td>";

}

if (($odspbo == 't') || ($otoczbo == 't') || ($sasbo == 't')) {
echo "</tr>"; 
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}



$sqllas = "SELECT las_d, las_d_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultlas = @pg_Exec($conn, $sqllas);
			$las = pg_result($resultlas, 0, "las_d");
			$lasbo = pg_result($resultlas, 0, "las_d_bo");
				
	$sqllass = "SELECT nazwa_la_en FROM las where id = '$las';";
			
			$resultlass = @pg_Exec($conn, $sqllass);
			$lasps = pg_result($resultlass, 0, "nazwa_la_en");

$sqlpark = "SELECT park_d, park_d_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultpark = @pg_Exec($conn, $sqlpark);
			$park = pg_result($resultpark, 0, "park_d");
			$parkbo = pg_result($resultpark, 0, "park_d_bo");
				
	$sqlparks = "SELECT nazwa_par_en FROM park where id = '$park';";
			
			$resultparks = @pg_Exec($conn, $sqlparks);
			$parkps = pg_result($resultparks, 0, "nazwa_par_en");

$sqlrzeka = "SELECT rzeka_d, rzeka_d_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultrzeka = @pg_Exec($conn, $sqlrzeka);
			$rzeka = pg_result($resultrzeka, 0, "rzeka_d");
			$rzekabo = pg_result($resultrzeka, 0, "rzeka_d_bo");
				
	$sqlrzekas = "SELECT nazwa_rz_en FROM rzeka where id = '$rzeka';";
			
			$resultrzekas = @pg_Exec($conn, $sqlrzekas);
			$rzekaps = pg_result($resultrzekas, 0, "nazwa_rz_en");

$sqljezioro = "SELECT jezioro_d, jezioro_d_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultjezioro = @pg_Exec($conn, $sqljezioro);
			$jezioro = pg_result($resultjezioro, 0, "jezioro_d");
			$jeziorobo = pg_result($resultjezioro, 0, "jezioro_d_bo");
				
	$sqljezioros = "SELECT nazwa_je_en FROM jezioro where id = '$jezioro';";
			
			$resultjezioros = @pg_Exec($conn, $sqljezioros);
			$jeziorops = pg_result($resultjezioros, 0, "nazwa_je_en");

$sqlstaw = "SELECT staw_d, staw_d_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultstaw = @pg_Exec($conn, $sqlstaw);
			$staw = pg_result($resultstaw, 0, "staw_d");
			$stawbo = pg_result($resultstaw, 0, "staw_d_bo");
				
	$sqlstaws = "SELECT nazwa_sta_en FROM staw where id = '$staw';";
			
			$resultstaws = @pg_Exec($conn, $sqlstaws);
			$stawps = pg_result($resultstaws, 0, "nazwa_sta_en");

$sqlgory = "SELECT gory_d, gory_d_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultgory = @pg_Exec($conn, $sqlgory);
			$gory = pg_result($resultgory, 0, "gory_d");
			$gorybo = pg_result($resultgory, 0, "gory_d_bo");
				
	$sqlgorys = "SELECT nazwa_go_en FROM gory where id = '$gory';";
			
			$resultgorys = @pg_Exec($conn, $sqlgorys);
			$goryps = pg_result($resultgorys, 0, "nazwa_go_en");




if (($lasbo == 't') || ($parkbo == 't') || ($rzekabo == 't') || ($jeziorobo == 't') || ($stawbo == 't') || ($gorybo == 't')) {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
echo "<tr><td colspan=\"40\" height=\"7\" bgcolor=\"#5865E5\">";
echo "<span class=\"nag1wb\">";
echo "&nbsp;Vicinity";
echo "</span>";
echo "</td></tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}
if (($lasbo == 't') || ($parkbo == 't') || ($rzekabo == 't') || ($jeziorobo == 't')) {
echo "<tr>"; 
}
if ($lasbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Forest nearby:</b><br>&nbsp;$lasps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($parkbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Park nearby:</b><br>&nbsp;$parkps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($rzekabo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>River nearby:</b><br>&nbsp;$rzekaps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($jeziorobo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Lake nearby:</b><br>&nbsp;$jeziorops";
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
echo "&nbsp;<b>Joint nearby:</b><br>&nbsp;$stawps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($gorybo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Mountains nearby:</b><br>&nbsp;$goryps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if (($stawbo == 't') || ($gorybo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}


$sqlstand = "SELECT std_d, std_d_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultstand = @pg_Exec($conn, $sqlstand);
			$stand = pg_result($resultstand, 0, "std_d");
			$standbo = pg_result($resultstand, 0, "std_d_bo");
				
	$sqlstands = "SELECT nazwa_stan_en FROM standard where id = '$stand';";
			
			$resultstands = @pg_Exec($conn, $sqlstands);
			$standps = pg_result($resultstands, 0, "nazwa_stan_en");

$sqlstan = "SELECT sta_d, sta_d_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultstan = @pg_Exec($conn, $sqlstan);
			$stan = pg_result($resultstan, 0, "sta_d");
			$stanbo = pg_result($resultstan, 0, "sta_d_bo");
				
	$sqlstans = "SELECT nazwa_sst_en FROM stan where id = '$stan';";
			
			$resultstans = @pg_Exec($conn, $sqlstans);
			$stanps = pg_result($resultstans, 0, "nazwa_sst_en");

$sqlprzek = "SELECT moprz_d, moprz_d_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultprzek = @pg_Exec($conn, $sqlprzek);
			$przek = pg_result($resultprzek, 0, "moprz_d");
			$przekbo = pg_result($resultprzek, 0, "moprz_d_bo");
				
	$sqlprzeks = "SELECT nazwa_przek_en FROM przeksztalcenie where id = '$przek';";
			
			$resultprzeks = @pg_Exec($conn, $sqlprzeks);
			$przekps = pg_result($resultprzeks, 0, "nazwa_przek_en");

$sqldodop = "SELECT dodopis_en, dodopis_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultdodop = @pg_Exec($conn, $sqldodop);
			$dodop = pg_result($resultdodop, 0, "dodopis_en");
			$dodopbo = pg_result($resultdodop, 0, "dodopis_bo");

$sqlzamiana = "SELECT zamiana_en, zamiana_bo FROM tab_dom_za where id_d = '$nu';";
			
			$resultzamiana = @pg_Exec($conn, $sqlzamiana);
			$zamianap = pg_result($resultzamiana, 0, "zamiana_en");
			$zamianabo = pg_result($resultzamiana, 0, "zamiana_bo");


if (($standbo == 't') || ($stanbo == 't') || ($przekbo == 't') || ($dodopbo == 't')) {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
echo "<tr><td colspan=\"40\" height=\"7\" bgcolor=\"#5865E5\">";
echo "<span class=\"nag1wb\">";
echo "&nbsp;Extra information";
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
echo "&nbsp;<b>Condition:</b><br>&nbsp;$stanps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($przekbo == 't') {

echo "<td height=\"25\" colspan = \"20\">";
echo "&nbsp;<b>Retrain possibility:</b><br>&nbsp;$przekps";
echo "</td>";

}

if (($standbo == 't') || ($stanbo == 't') || ($przekbo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}

if ($dodopbo == 't') {
echo "<tr>";
echo "<td height=\"25\" colspan = \"20\">";
echo "&nbsp;<b>Extra description:</b><br>&nbsp;$dodop";
echo "</td>";
echo "</tr>";
}

if ($dodopbo == 't') {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}

if ($zamianabo == 't') {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
echo "<tr><td colspan=\"40\" height=\"7\" bgcolor=\"#5865E5\">";
echo "<span class=\"nag1wb\">";
echo "&nbsp;Exchange on:";
echo "</span>";
echo "</td></tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

echo "<tr>";
echo "<td height=\"25\" colspan = \"20\">";
echo "&nbsp;$zamianap";
echo "</td>";
echo "</tr>";
}


if ($zamianabo == 't') {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}


echo "</table>";
echo "</center>";



}

?>