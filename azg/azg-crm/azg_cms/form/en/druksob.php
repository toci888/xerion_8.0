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

echo "<center>";
echo "<span class=\"nag2b\">";
echo "<b>SALE OF OBJECTS</b>";
echo "<br>";
echo "</span>";
echo "</center>";

echo "<br>";

echo "<center>";
echo "<table width=\"512\" cellpadding=\"0\" cellspacing=\"0\" border = \"1\" frame = \"above,below,rhs\" rules = \"groups\">";

$sqlno = "SELECT no_d, no_d_bo FROM tab_obi where id_d = '$nu';";
	$resultno = @pg_Exec($conn, $sqlno);
	$rowsno = pg_NumRows($resultno);		// liczba zwroconych wierszy
	$noms = pg_result($resultno, 0, "no_d");
	$nomsp = pg_result($resultno, 0, "no_d_bo");

$sqlstatus = "SELECT sm_d, sm_d_bo FROM tab_obi where id_d = '$nu';";
			
			$resultstatus = @pg_Exec($conn, $sqlstatus);
			$status = pg_result($resultstatus, 0, "sm_d");
			$statusbo = pg_result($resultstatus, 0, "sm_d_bo");
	
	$sqlstatuss = "SELECT nazwa_st_en FROM status where id = '$status';";
			
			$resultstatuss = @pg_Exec($conn, $sqlstatuss);
			$statuss = pg_result($resultstatuss, 0, "nazwa_st_en");

$sqlagent = "SELECT id_a FROM tab_obi where id_d = '$nu';";
			
			$resultagent = @pg_Exec($conn, $sqlagent);
			$agent = pg_result($resultagent, 0, "id_a");

	$sqlagents = "SELECT nazwa_a, tel_a, tel_kom_a, email_a FROM tab_agent where id_a = '$agent';";
			
			$resultagents = @pg_Exec($conn, $sqlagents);
			$nazwaagenta = pg_result($resultagents, 0, "nazwa_a");
			$nazwatel = pg_result($resultagents, 0, "tel_a");
			$nazwatelkom = pg_result($resultagents, 0, "tel_kom_a");
			$nazwaemail = pg_result($resultagents, 0, "email_a");

$sqllok = "SELECT lok_d, lok_d_bo FROM tab_obi where id_d = '$nu';";	
	$resultlok = @pg_Exec($conn, $sqllok);
	$lokas = pg_result($resultlok, 0, "lok_d");
	$lokasp = pg_result($resultlok, 0, "lok_d_bo");

$sqlwoj = "SELECT lok_w, lok_w_bo FROM tab_obi where id_d = '$nu';";
			
			$resultwoj = @pg_Exec($conn, $sqlwoj);
			$wojn = pg_result($resultwoj, 0, "lok_w");
			$wojnbo = pg_result($resultwoj, 0, "lok_w_bo");
	
	$sqlwojs = "SELECT nazwa_w FROM wojewodztwa where id_w = '$wojn';";
			
			$resultwojs = @pg_Exec($conn, $sqlwojs);
			$wojns = pg_result($resultwojs, 0, "nazwa_w");

$sqlpowiat = "SELECT lok_p, lok_p_bo FROM tab_obi where id_d = '$nu';";
			
			$resultpowiat = @pg_Exec($conn, $sqlpowiat);
			$powiatn = pg_result($resultpowiat, 0, "lok_p");
			$powiatbo = pg_result($resultpowiat, 0, "lok_p_bo");
	
	$sqlpowiats = "SELECT nazwa_p FROM powiaty where id_pow = '$powiatn';";
			
			$resultpowiats = @pg_Exec($conn, $sqlpowiats);
			$powiatns = pg_result($resultpowiats, 0, "nazwa_p");

$sqlcena = "SELECT cd, cd_bo FROM tab_obi where id_d = '$nu';";	
	$resultcena = @pg_Exec($conn, $sqlcena);
	$cenas = pg_result($resultcena, 0, "cd");
	$cenasp = pg_result($resultcena, 0, "cd_bo");
	
$sqlpowuzyt = "SELECT powuzyt_d, powuzyt_d_bo FROM tab_obi where id_d = '$nu';";	
	$resultpowuzyt = @pg_Exec($conn, $sqlpowuzyt);
	$powuzyts = pg_result($resultpowuzyt, 0, "powuzyt_d");
	$powuzytsp = pg_result($resultpowuzyt, 0, "powuzyt_d_bo");
	
$sqlpowcal = "SELECT powcal_d, powcal_d_bo FROM tab_obi where id_d = '$nu';";	
	$resultpowcal = @pg_Exec($conn, $sqlpowcal);
	$powcals = pg_result($resultpowcal, 0, "powcal_d");
	$powcalsp = pg_result($resultpowcal, 0, "powcal_d_bo");

$sqlpowdzi = "SELECT powdzi_d, powdzi_d_bo FROM tab_obi where id_d = '$nu';";	
	$resultpowdzi = @pg_Exec($conn, $sqlpowdzi);
	$powdzis = pg_result($resultpowdzi, 0, "powdzi_d");
	$powdzisp = pg_result($resultpowdzi, 0, "powdzi_d_bo");

$sqlpowpom = "SELECT powpom_d, powpom_d_bo FROM tab_obi where id_d = '$nu';";	
	$resultpowpom = @pg_Exec($conn, $sqlpowpom);
	$powpoms = pg_result($resultpowpom, 0, "powpom_d");
	$powpomsp = pg_result($resultpowpom, 0, "powpom_d_bo");

$sqlpowpomg = "SELECT powpomg_d, powpomg_d_bo FROM tab_obi where id_d = '$nu';";	
	$resultpomg = @pg_Exec($conn, $sqlpowpomg);
	$powpomgs = pg_result($resultpomg, 0, "powpomg_d");
	$powpomgsp = pg_result($resultpomg, 0, "powpomg_d_bo");
	
$sqlpowpoms = "SELECT powpoms_d, powpoms_d_bo FROM tab_obi where id_d = '$nu';";	
	$resultpoms = @pg_Exec($conn, $sqlpowpoms);
	$powpomss = pg_result($resultpoms, 0, "powpoms_d");
	$powpomssp = pg_result($resultpoms, 0, "powpoms_d_bo");


$sqllpom = "SELECT lpom_d, lpom_d_bo FROM tab_obi where id_d = '$nu';";	
	$resultlpom = @pg_Exec($conn, $sqllpom);
	$lpoms = pg_result($resultlpom, 0, "lpom_d");
	$lpomsp = pg_result($resultlpom, 0, "lpom_d_bo");

$sqllpomg = "SELECT lpomg_d, lpomg_d_bo FROM tab_obi where id_d = '$nu';";	
	$resultlpomg = @pg_Exec($conn, $sqllpomg);
	$lpomgs = pg_result($resultlpomg, 0, "lpomg_d");
	$lpomgsp = pg_result($resultlpomg, 0, "lpomg_d_bo");

$sqllpoms = "SELECT lpoms_d, lpoms_d_bo FROM tab_obi where id_d = '$nu';";	
	$resultllpoms = @pg_Exec($conn, $sqllpoms);
	$lpomss = pg_result($resultllpoms, 0, "lpoms_d");
	$lpomssp = pg_result($resultllpoms, 0, "lpoms_d_bo");

$sqllkond = "SELECT lkond, lkond_bo FROM tab_obi where id_d = '$nu';";	
	$resultlkond = @pg_Exec($conn, $sqllkond);
	$lkonds = pg_result($resultlkond, 0, "lkond");
	$lkondsp = pg_result($resultlkond, 0, "lkond_bo");

$sqlrynek = "SELECT rr_d, rr_d_bo FROM tab_obi where id_d = '$nu';";
			
			$resultrynek = @pg_Exec($conn, $sqlrynek);
			$rrynek = pg_result($resultrynek, 0, "rr_d");
			$rrynekbo = pg_result($resultrynek, 0, "rr_d_bo");
	
$sqlryneks = "SELECT nazwa_r_en FROM rodzaj_ryn where id = '$rrynek';";
			
			$resultryneks = @pg_Exec($conn, $sqlryneks);
			$rryneks = pg_result($resultryneks, 0, "nazwa_r_en");


$sqlcm2 = "SELECT cm2_d, cm2_d_bo FROM tab_obi where id_d = '$nu';";	
	$resultcm2 = @pg_Exec($conn, $sqlcm2);
	$cenad2 = pg_result($resultcm2, 0, "cm2_d");
	$cenad2bo = pg_result($resultcm2, 0, "cm2_d_bo");
	
$sqlczynsz = "SELECT wysop_d, wysop_d_bo FROM tab_obi where id_d = '$nu';";
	$resultczynsz = @pg_Exec($conn, $sqlczynsz);
	$czynszs = pg_result($resultczynsz, 0, "wysop_d");
	$czynszsp = pg_result($resultczynsz, 0, "wysop_d_bo");

$sqlczasp = "SELECT cz_prze_d, cz_prze_d_bo FROM tab_obi where id_d = '$nu';";
			
			$resultczasp = @pg_Exec($conn, $sqlczasp);
			$czasp = pg_result($resultczasp, 0, "cz_prze_d");
			$czaspbo = pg_result($resultczasp, 0, "cz_prze_d_bo");
	
	$sqlczasps = "SELECT nazwa_prz_en FROM czas_prz where id = '$czasp';";
			
			$resultczasps = @pg_Exec($conn, $sqlczasps);
			$czasps = pg_result($resultczasps, 0, "nazwa_prz_en");

$sqlksiega = "SELECT kw_d, kw_d_bo FROM tab_obi where id_d = '$nu';";
			
			$resultksiega = @pg_Exec($conn, $sqlksiega);
			$ksiega = pg_result($resultksiega, 0, "kw_d");
			$ksiegabo = pg_result($resultksiega, 0, "kw_d_bo");
	
	$sqlksiegas = "SELECT nazwa_k_en FROM ksiega where id = '$ksiega';";
			
			$resultksiegas = @pg_Exec($conn, $sqlksiegas);
			$ksiegass = pg_result($resultksiegas, 0, "nazwa_k_en");

$sqlprawny = "SELECT spr_d, spr_d_bo FROM tab_obi where id_d = '$nu';";
			
			$resultprawny = @pg_Exec($conn, $sqlprawny);
			$prawny = pg_result($resultprawny, 0, "spr_d");
			$prawnybo = pg_result($resultprawny, 0, "spr_d_bo");
	
	$sqlprawnys = "SELECT nazwa_pr_en FROM stan_pr where id = '$prawny';";
			
			$resultprawnys = @pg_Exec($conn, $sqlprawnys);
			$prawnyss = pg_result($resultprawnys, 0, "nazwa_pr_en");

$sqlprawnydz = "SELECT spr_dz, spr_dz_bo FROM tab_obi where id_d = '$nu';";
			
			$resultprawnydz = @pg_Exec($conn, $sqlprawnydz);
			$prawnydz = pg_result($resultprawnydz, 0, "spr_dz");
			$prawnydzbo = pg_result($resultprawnydz, 0, "spr_dz_bo");
	
	$sqlprawnydzs = "SELECT nazwa_pr_en FROM stan_pr where id = '$prawnydz';";
			
			$resultprawnydzs = @pg_Exec($conn, $sqlprawnydzs);
			$prawnydzss = pg_result($resultprawnydzs, 0, "nazwa_pr_en");


$sqldw = "SELECT datawp_d, datawp_d_bo FROM tab_obi where id_d = '$nu';";
	$resultdw = @pg_Exec($conn, $sqldw);
	$datw = pg_result($resultdw, 0, "datawp_d");
	$datwp = pg_result($resultdw, 0, "datawp_d_bo");

$sqlprof = "SELECT rof_d, rof_d_bo FROM tab_obi where id_d = '$nu';";
			
			$resultprof = @pg_Exec($conn, $sqlprof);
			$profn = pg_result($resultprof, 0, "rof_d");
			$profnbo = pg_result($resultprof, 0, "rof_d_bo");
	
	$sqlprofs = "SELECT rodzaj_of_en FROM rodzaj_of_obi where id = '$profn';";
			
			$resultprofs = @pg_Exec($conn, $sqlprofs);
			$profns = pg_result($resultprofs, 0, "rodzaj_of_en");

if (($lokasp == 't')  || ($wojnbo == 't') || ($powiatbo == 't')  || ($cenasp == 't') || ($powuzytsp == 't') || ($powcalsp == 't') || ($powdzisp == 't') || ($powpomsp == 't') || ($powpomgsp == 't')  || ($powpomssp == 't')  || ($lpomsp == 't') || ($lpomgsp == 't') || ($lpomssp == 't') || ($lkondsp == 't')  || ($cenad2bo == 't') || ($czynszsp == 't')  || ($czaspbo == 't') || ($ksiegabo == 't')  || ($prawnybo == 't')  || ($prawnydzbo == 't') || ($rrynekbo == 't')  || ($datwp == 't') || ($profnbo == 't')) {

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
echo "&nbsp;<b>Price:</b><br>&nbsp;$cenas zł.";
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
echo "&nbsp;<b>Floor area:</b><br>&nbsp;$powuzyts m2";
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

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($powpomsp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Premises area:</b><br>&nbsp;$powpoms m2";
echo "</td>";

}

if ( ($powuzytsp == 't')  || ($powcalsp == 't') || ($powpomsp == 't')  || ($powdzisp == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}
if (($powpomgsp == 't') || ($powpomssp == 't')  || ($lpomsp == 't') || ($lpomgsp == 't')) {
echo "<tr>";
}

if ($powpomgsp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Store-room area:</b><br>&nbsp;$powpomgs m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($powpomssp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Rooms area:</b><br>&nbsp;$powpomss m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($lpomsp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Number of premisess:</b><br>&nbsp;$lpoms";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($lpomgsp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Number of store-rooms:</b><br>&nbsp;$lpomgs";
echo "</td>";

}

if (($powpomgsp == 't') || ($powpomssp == 't')  || ($lpomsp == 't') || ($lpomgsp == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}

if (($lpomssp == 't') || ($lkondsp == 't') || ($rrynekbo == 't') || ($cenad2bo == 't')) {
echo "<tr>";
}

if ($lpomssp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Number of rooms:</b><br>&nbsp;$lpomss";
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

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($cenad2bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Price for 1 m2:</b><br>&nbsp;$cenad2 zł.";
echo "</td>";

}

if (($lpomssp == 't') || ($lkondsp == 't') || ($rrynekbo == 't') || ($cenad2bo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}
if (($czynszsp == 't') || ($czaspbo == 't') || ($ksiegabo == 't') || ($prawnybo == 't')) {
echo "<tr>";
}

if ($czynszsp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Rent:</b><br>&nbsp;$czynszs zł.";
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

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}


if ($prawnybo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Legal standing of premises:</b><br>&nbsp;$prawnyss";
echo "</td>";

}


if (($czynszsp == 't') || ($czaspbo == 't') || ($ksiegabo == 't') || ($prawnybo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}

if (($prawnydzbo == 't') || ($datwp == 't') || ($profnbo == 't')) {
echo "<tr>";
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

}

if (($prawnydzbo == 't') || ($datwp == 't') || ($profnbo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}



$sqlpow1 = "SELECT pp1, pp1_bo FROM tab_obi where id_d = '$nu';";	
	$resultpow1 = @pg_Exec($conn, $sqlpow1);
	$pow1s = pg_result($resultpow1, 0, "pp1");
	$pow1sp = pg_result($resultpow1, 0, "pp1_bo");

$sqlpop1 = "SELECT pop1, pop1_bo FROM tab_obi where id_d = '$nu';";
			
			$resultpop1 = @pg_Exec($conn, $sqlpop1);
			$pop1s = pg_result($resultpop1, 0, "pop1");
			$pop1bo = pg_result($resultpop1, 0, "pop1_bo");
				
	$sqlpop1s = "SELECT nazwa_pod_en FROM podlogi where id = '$pop1s';";
			
			$resultpop1s = @pg_Exec($conn, $sqlpop1s);
			$pop1ps = pg_result($resultpop1s, 0, "nazwa_pod_en");

$sqlsc1 = "SELECT ps1, ps1_bo FROM tab_obi where id_d = '$nu';";
			
			$resultsc1 = @pg_Exec($conn, $sqlsc1);
			$psc1s = pg_result($resultsc1, 0, "ps1");
			$psc1bo = pg_result($resultsc1, 0, "ps1_bo");
				
	$sqlsc1s = "SELECT nazwa_sc_en FROM sciany where id = '$psc1s';";
			
			$resultsc1s = @pg_Exec($conn, $sqlsc1s);
			$psc1ps = pg_result($resultsc1s, 0, "nazwa_sc_en");

$sqlsuf1 = "SELECT psu1, psu1_bo FROM tab_obi where id_d = '$nu';";
			
			$resultsuf1 = @pg_Exec($conn, $sqlsuf1);
			$suf1s = pg_result($resultsuf1, 0, "psu1");
			$suf1bo = pg_result($resultsuf1, 0, "psu1_bo");
				
	$sqlsuf1s = "SELECT nazwa_su_en FROM sufit where id = '$suf1s';";
			
			$resultsuf1s = @pg_Exec($conn, $sqlsuf1s);
			$suf1ps = pg_result($resultsuf1s, 0, "nazwa_su_en");

$sqlwyp1 = "SELECT wyp1, wyp1_bo FROM tab_obi where id_d = '$nu';";
			
			$resultwyp1 = @pg_Exec($conn, $sqlwyp1);
			$wyp1s = pg_result($resultwyp1, 0, "wyp1");
			$wyp1bo = pg_result($resultwyp1, 0, "wyp1_bo");
				
	$sqlwyp1s = "SELECT nazwa_wp_en FROM wyposazenie where id = '$wyp1s';";
			
			$resultwyp1s = @pg_Exec($conn, $sqlwyp1s);
			$wyp1ps = pg_result($resultwyp1s, 0, "nazwa_wp_en");
			
$sqlpow2 = "SELECT pp2, pp2_bo FROM tab_obi where id_d = '$nu';";	
	$resultpow2 = @pg_Exec($conn, $sqlpow2);
	$pow2s = pg_result($resultpow2, 0, "pp2");
	$pow2sp = pg_result($resultpow2, 0, "pp2_bo");

$sqlpop2 = "SELECT pop2, pop2_bo FROM tab_obi where id_d = '$nu';";
			
			$resultpop2 = @pg_Exec($conn, $sqlpop2);
			$pop2s = pg_result($resultpop2, 0, "pop2");
			$pop2bo = pg_result($resultpop2, 0, "pop2_bo");
				
	$sqlpop2s = "SELECT nazwa_pod_en FROM podlogi where id = '$pop2s';";
			
			$resultpop2s = @pg_Exec($conn, $sqlpop2s);
			$pop2ps = pg_result($resultpop2s, 0, "nazwa_pod_en");

$sqlsc2 = "SELECT ps2, ps2_bo FROM tab_obi where id_d = '$nu';";
			
			$resultsc2 = @pg_Exec($conn, $sqlsc2);
			$psc2s = pg_result($resultsc2, 0, "ps2");
			$psc2bo = pg_result($resultsc2, 0, "ps2_bo");
				
	$sqlsc2s = "SELECT nazwa_sc_en FROM sciany where id = '$psc2s';";
			
			$resultsc2s = @pg_Exec($conn, $sqlsc2s);
			$psc2ps = pg_result($resultsc2s, 0, "nazwa_sc_en");

$sqlsuf2 = "SELECT psu2, psu2_bo FROM tab_obi where id_d = '$nu';";
			
			$resultsuf2 = @pg_Exec($conn, $sqlsuf2);
			$suf2s = pg_result($resultsuf2, 0, "psu2");
			$suf2bo = pg_result($resultsuf2, 0, "psu2_bo");
				
	$sqlsuf2s = "SELECT nazwa_su_en FROM sufit where id = '$suf2s';";
			
			$resultsuf2s = @pg_Exec($conn, $sqlsuf2s);
			$suf2ps = pg_result($resultsuf2s, 0, "nazwa_su_en");

$sqlwyp2 = "SELECT wyp2, wyp2_bo FROM tab_obi where id_d = '$nu';";
			
			$resultwyp2 = @pg_Exec($conn, $sqlwyp2);
			$wyp2s = pg_result($resultwyp2, 0, "wyp2");
			$wyp2bo = pg_result($resultwyp2, 0, "wyp2_bo");
				
	$sqlwyp2s = "SELECT nazwa_wp_en FROM wyposazenie where id = '$wyp2s';";
			
			$resultwyp2s = @pg_Exec($conn, $sqlwyp2s);
			$wyp2ps = pg_result($resultwyp2s, 0, "nazwa_wp_en");

$sqlpow3 = "SELECT pp3, pp3_bo FROM tab_obi where id_d = '$nu';";	
	$resultpow3 = @pg_Exec($conn, $sqlpow3);
	$pow3s = pg_result($resultpow3, 0, "pp3");
	$pow3sp = pg_result($resultpow3, 0, "pp3_bo");

$sqlpop3 = "SELECT pop3, pop3_bo FROM tab_obi where id_d = '$nu';";
			
			$resultpop3 = @pg_Exec($conn, $sqlpop3);
			$pop3s = pg_result($resultpop3, 0, "pop3");
			$pop3bo = pg_result($resultpop3, 0, "pop3_bo");
				
	$sqlpop3s = "SELECT nazwa_pod_en FROM podlogi where id = '$pop3s';";
			
			$resultpop3s = @pg_Exec($conn, $sqlpop3s);
			$pop3ps = pg_result($resultpop3s, 0, "nazwa_pod_en");

$sqlsc3 = "SELECT ps3, ps3_bo FROM tab_obi where id_d = '$nu';";
			
			$resultsc3 = @pg_Exec($conn, $sqlsc3);
			$psc3s = pg_result($resultsc3, 0, "ps3");
			$psc3bo = pg_result($resultsc3, 0, "ps3_bo");
				
	$sqlsc3s = "SELECT nazwa_sc_en FROM sciany where id = '$psc3s';";
			
			$resultsc3s = @pg_Exec($conn, $sqlsc3s);
			$psc3ps = pg_result($resultsc3s, 0, "nazwa_sc_en");

$sqlsuf3 = "SELECT psu3, psu3_bo FROM tab_obi where id_d = '$nu';";
			
			$resultsuf3 = @pg_Exec($conn, $sqlsuf3);
			$suf3s = pg_result($resultsuf3, 0, "psu3");
			$suf3bo = pg_result($resultsuf3, 0, "psu3_bo");
				
	$sqlsuf3s = "SELECT nazwa_su_en FROM sufit where id = '$suf3s';";
			
			$resultsuf3s = @pg_Exec($conn, $sqlsuf3s);
			$suf3ps = pg_result($resultsuf3s, 0, "nazwa_su_en");

$sqlwyp3 = "SELECT wyp3, wyp3_bo FROM tab_obi where id_d = '$nu';";
			
			$resultwyp3 = @pg_Exec($conn, $sqlwyp3);
			$wyp3s = pg_result($resultwyp3, 0, "wyp3");
			$wyp3bo = pg_result($resultwyp3, 0, "wyp3_bo");
				
	$sqlwyp3s = "SELECT nazwa_wp_en FROM wyposazenie where id = '$wyp3s';";
			
			$resultwyp3s = @pg_Exec($conn, $sqlwyp3s);
			$wyp3ps = pg_result($resultwyp3s, 0, "nazwa_wp_en");

$sqlpow4 = "SELECT pp4, pp4_bo FROM tab_obi where id_d = '$nu';";	
	$resultpow4 = @pg_Exec($conn, $sqlpow4);
	$pow4s = pg_result($resultpow4, 0, "pp4");
	$pow4sp = pg_result($resultpow4, 0, "pp4_bo");

$sqlpop4 = "SELECT pop4, pop4_bo FROM tab_obi where id_d = '$nu';";
			
			$resultpop4 = @pg_Exec($conn, $sqlpop4);
			$pop4s = pg_result($resultpop4, 0, "pop4");
			$pop4bo = pg_result($resultpop4, 0, "pop4_bo");
				
	$sqlpop4s = "SELECT nazwa_pod_en FROM podlogi where id = '$pop4s';";
			
			$resultpop4s = @pg_Exec($conn, $sqlpop4s);
			$pop4ps = pg_result($resultpop4s, 0, "nazwa_pod_en");

$sqlsc4 = "SELECT ps4, ps4_bo FROM tab_obi where id_d = '$nu';";
			
			$resultsc4 = @pg_Exec($conn, $sqlsc4);
			$psc4s = pg_result($resultsc4, 0, "ps4");
			$psc4bo = pg_result($resultsc4, 0, "ps4_bo");
				
	$sqlsc4s = "SELECT nazwa_sc_en FROM sciany where id = '$psc4s';";
			
			$resultsc4s = @pg_Exec($conn, $sqlsc4s);
			$psc4ps = pg_result($resultsc4s, 0, "nazwa_sc_en");

$sqlsuf4 = "SELECT psu4, psu4_bo FROM tab_obi where id_d = '$nu';";
			
			$resultsuf4 = @pg_Exec($conn, $sqlsuf4);
			$suf4s = pg_result($resultsuf4, 0, "psu4");
			$suf4bo = pg_result($resultsuf4, 0, "psu4_bo");
				
	$sqlsuf4s = "SELECT nazwa_su_en FROM sufit where id = '$suf4s';";
			
			$resultsuf4s = @pg_Exec($conn, $sqlsuf4s);
			$suf4ps = pg_result($resultsuf4s, 0, "nazwa_su_en");

$sqlwyp4 = "SELECT wyp4, wyp4_bo FROM tab_obi where id_d = '$nu';";
			
			$resultwyp4 = @pg_Exec($conn, $sqlwyp4);
			$wyp4s = pg_result($resultwyp4, 0, "wyp4");
			$wyp4bo = pg_result($resultwyp4, 0, "wyp4_bo");
				
	$sqlwyp4s = "SELECT nazwa_wp_en FROM wyposazenie where id = '$wyp4s';";
			
			$resultwyp4s = @pg_Exec($conn, $sqlwyp4s);
			$wyp4ps = pg_result($resultwyp4s, 0, "nazwa_wp_en");
			
$sqlpow5 = "SELECT pp5, pp5_bo FROM tab_obi where id_d = '$nu';";	
	$resultpow5 = @pg_Exec($conn, $sqlpow5);
	$pow5s = pg_result($resultpow5, 0, "pp5");
	$pow5sp = pg_result($resultpow5, 0, "pp5_bo");

$sqlpop5 = "SELECT pop5, pop5_bo FROM tab_obi where id_d = '$nu';";
			
			$resultpop5 = @pg_Exec($conn, $sqlpop5);
			$pop5s = pg_result($resultpop5, 0, "pop5");
			$pop5bo = pg_result($resultpop5, 0, "pop5_bo");
				
	$sqlpop5s = "SELECT nazwa_pod_en FROM podlogi where id = '$pop5s';";
			
			$resultpop5s = @pg_Exec($conn, $sqlpop5s);
			$pop5ps = pg_result($resultpop5s, 0, "nazwa_pod_en");

$sqlsc5 = "SELECT ps5, ps5_bo FROM tab_obi where id_d = '$nu';";
			
			$resultsc5 = @pg_Exec($conn, $sqlsc5);
			$psc5s = pg_result($resultsc5, 0, "ps5");
			$psc5bo = pg_result($resultsc5, 0, "ps5_bo");
				
	$sqlsc5s = "SELECT nazwa_sc_en FROM sciany where id = '$psc5s';";
			
			$resultsc5s = @pg_Exec($conn, $sqlsc5s);
			$psc5ps = pg_result($resultsc5s, 0, "nazwa_sc_en");

$sqlsuf5 = "SELECT psu5, psu5_bo FROM tab_obi where id_d = '$nu';";
			
			$resultsuf5 = @pg_Exec($conn, $sqlsuf5);
			$suf5s = pg_result($resultsuf5, 0, "psu5");
			$suf5bo = pg_result($resultsuf5, 0, "psu5_bo");
				
	$sqlsuf5s = "SELECT nazwa_su_en FROM sufit where id = '$suf5s';";
			
			$resultsuf5s = @pg_Exec($conn, $sqlsuf5s);
			$suf5ps = pg_result($resultsuf5s, 0, "nazwa_su_en");

$sqlwyp5 = "SELECT wyp5, wyp5_bo FROM tab_obi where id_d = '$nu';";
			
			$resultwyp5 = @pg_Exec($conn, $sqlwyp5);
			$wyp5s = pg_result($resultwyp5, 0, "wyp5");
			$wyp5bo = pg_result($resultwyp5, 0, "wyp5_bo");
				
	$sqlwyp5s = "SELECT nazwa_wp_en FROM wyposazenie where id = '$wyp5s';";
			
			$resultwyp5s = @pg_Exec($conn, $sqlwyp5s);
			$wyp5ps = pg_result($resultwyp5s, 0, "nazwa_wp_en");

$sqlpow6 = "SELECT pp6, pp6_bo FROM tab_obi where id_d = '$nu';";	
	$resultpow6 = @pg_Exec($conn, $sqlpow6);
	$pow6s = pg_result($resultpow6, 0, "pp6");
	$pow6sp = pg_result($resultpow6, 0, "pp6_bo");

$sqlpop6 = "SELECT pop6, pop6_bo FROM tab_obi where id_d = '$nu';";
			
			$resultpop6 = @pg_Exec($conn, $sqlpop6);
			$pop6s = pg_result($resultpop6, 0, "pop6");
			$pop6bo = pg_result($resultpop6, 0, "pop6_bo");
				
	$sqlpop6s = "SELECT nazwa_pod_en FROM podlogi where id = '$pop6s';";
			
			$resultpop6s = @pg_Exec($conn, $sqlpop6s);
			$pop6ps = pg_result($resultpop6s, 0, "nazwa_pod_en");

$sqlsc6 = "SELECT ps6, ps6_bo FROM tab_obi where id_d = '$nu';";
			
			$resultsc6 = @pg_Exec($conn, $sqlsc6);
			$psc6s = pg_result($resultsc6, 0, "ps6");
			$psc6bo = pg_result($resultsc6, 0, "ps6_bo");
				
	$sqlsc6s = "SELECT nazwa_sc_en FROM sciany where id = '$psc6s';";
			
			$resultsc6s = @pg_Exec($conn, $sqlsc6s);
			$psc6ps = pg_result($resultsc6s, 0, "nazwa_sc_en");

$sqlsuf6 = "SELECT psu6, psu6_bo FROM tab_obi where id_d = '$nu';";
			
			$resultsuf6 = @pg_Exec($conn, $sqlsuf6);
			$suf6s = pg_result($resultsuf6, 0, "psu6");
			$suf6bo = pg_result($resultsuf6, 0, "psu6_bo");
				
	$sqlsuf6s = "SELECT nazwa_su_en FROM sufit where id = '$suf6s';";
			
			$resultsuf6s = @pg_Exec($conn, $sqlsuf6s);
			$suf6ps = pg_result($resultsuf6s, 0, "nazwa_su_en");

$sqlwyp6 = "SELECT wyp6, wyp6_bo FROM tab_obi where id_d = '$nu';";
			
			$resultwyp6 = @pg_Exec($conn, $sqlwyp6);
			$wyp6s = pg_result($resultwyp6, 0, "wyp6");
			$wyp6bo = pg_result($resultwyp6, 0, "wyp6_bo");
				
	$sqlwyp6s = "SELECT nazwa_wp_en FROM wyposazenie where id = '$wyp6s';";
			
			$resultwyp6s = @pg_Exec($conn, $sqlwyp6s);
			$wyp6ps = pg_result($resultwyp6s, 0, "nazwa_wp_en");

$sqlpow7 = "SELECT pp7, pp7_bo FROM tab_obi where id_d = '$nu';";	
	$resultpow7 = @pg_Exec($conn, $sqlpow7);
	$pow7s = pg_result($resultpow7, 0, "pp7");
	$pow7sp = pg_result($resultpow7, 0, "pp7_bo");

$sqlpop7 = "SELECT pop7, pop7_bo FROM tab_obi where id_d = '$nu';";
			
			$resultpop7 = @pg_Exec($conn, $sqlpop7);
			$pop7s = pg_result($resultpop7, 0, "pop7");
			$pop7bo = pg_result($resultpop7, 0, "pop7_bo");
				
	$sqlpop7s = "SELECT nazwa_pod_en FROM podlogi where id = '$pop7s';";
			
			$resultpop7s = @pg_Exec($conn, $sqlpop7s);
			$pop7ps = pg_result($resultpop7s, 0, "nazwa_pod_en");

$sqlsc7 = "SELECT ps7, ps7_bo FROM tab_obi where id_d = '$nu';";
			
			$resultsc7 = @pg_Exec($conn, $sqlsc7);
			$psc7s = pg_result($resultsc7, 0, "ps7");
			$psc7bo = pg_result($resultsc7, 0, "ps7_bo");
				
	$sqlsc7s = "SELECT nazwa_sc_en FROM sciany where id = '$psc7s';";
			
			$resultsc7s = @pg_Exec($conn, $sqlsc7s);
			$psc7ps = pg_result($resultsc7s, 0, "nazwa_sc_en");

$sqlsuf7 = "SELECT psu7, psu7_bo FROM tab_obi where id_d = '$nu';";
			
			$resultsuf7 = @pg_Exec($conn, $sqlsuf7);
			$suf7s = pg_result($resultsuf7, 0, "psu7");
			$suf7bo = pg_result($resultsuf7, 0, "psu7_bo");
				
	$sqlsuf7s = "SELECT nazwa_su_en FROM sufit where id = '$suf7s';";
			
			$resultsuf7s = @pg_Exec($conn, $sqlsuf7s);
			$suf7ps = pg_result($resultsuf7s, 0, "nazwa_su_en");

$sqlwyp7 = "SELECT wyp7, wyp7_bo FROM tab_obi where id_d = '$nu';";
			
			$resultwyp7 = @pg_Exec($conn, $sqlwyp7);
			$wyp7s = pg_result($resultwyp7, 0, "wyp7");
			$wyp7bo = pg_result($resultwyp7, 0, "wyp7_bo");
				
	$sqlwyp7s = "SELECT nazwa_wp_en FROM wyposazenie where id = '$wyp7s';";
			
			$resultwyp7s = @pg_Exec($conn, $sqlwyp7s);
			$wyp7ps = pg_result($resultwyp7s, 0, "nazwa_wp_en");


$sqlpow8 = "SELECT pp8, pp8_bo FROM tab_obi where id_d = '$nu';";	
	$resultpow8 = @pg_Exec($conn, $sqlpow8);
	$pow8s = pg_result($resultpow8, 0, "pp8");
	$pow8sp = pg_result($resultpow8, 0, "pp8_bo");

$sqlpop8 = "SELECT pop8, pop8_bo FROM tab_obi where id_d = '$nu';";
			
			$resultpop8 = @pg_Exec($conn, $sqlpop8);
			$pop8s = pg_result($resultpop8, 0, "pop8");
			$pop8bo = pg_result($resultpop8, 0, "pop8_bo");
				
	$sqlpop8s = "SELECT nazwa_pod_en FROM podlogi where id = '$pop8s';";
			
			$resultpop8s = @pg_Exec($conn, $sqlpop8s);
			$pop8ps = pg_result($resultpop8s, 0, "nazwa_pod_en");

$sqlsc8 = "SELECT ps8, ps8_bo FROM tab_obi where id_d = '$nu';";
			
			$resultsc8 = @pg_Exec($conn, $sqlsc8);
			$psc8s = pg_result($resultsc8, 0, "ps8");
			$psc8bo = pg_result($resultsc8, 0, "ps8_bo");
				
	$sqlsc8s = "SELECT nazwa_sc_en FROM sciany where id = '$psc8s';";
			
			$resultsc8s = @pg_Exec($conn, $sqlsc8s);
			$psc8ps = pg_result($resultsc8s, 0, "nazwa_sc_en");

$sqlsuf8 = "SELECT psu8, psu8_bo FROM tab_obi where id_d = '$nu';";
			
			$resultsuf8 = @pg_Exec($conn, $sqlsuf8);
			$suf8s = pg_result($resultsuf8, 0, "psu8");
			$suf8bo = pg_result($resultsuf8, 0, "psu8_bo");
				
	$sqlsuf8s = "SELECT nazwa_su_en FROM sufit where id = '$suf8s';";
			
			$resultsuf8s = @pg_Exec($conn, $sqlsuf8s);
			$suf8ps = pg_result($resultsuf8s, 0, "nazwa_su_en");

$sqlwyp8 = "SELECT wyp8, wyp8_bo FROM tab_obi where id_d = '$nu';";
			
			$resultwyp8 = @pg_Exec($conn, $sqlwyp8);
			$wyp8s = pg_result($resultwyp8, 0, "wyp8");
			$wyp8bo = pg_result($resultwyp8, 0, "wyp8_bo");
				
	$sqlwyp8s = "SELECT nazwa_wp_en FROM wyposazenie where id = '$wyp8s';";
			
			$resultwyp8s = @pg_Exec($conn, $sqlwyp8s);
			$wyp8ps = pg_result($resultwyp8s, 0, "nazwa_wp_en");

$sqlpow9 = "SELECT pp9, pp9_bo FROM tab_obi where id_d = '$nu';";	
	$resultpow9 = @pg_Exec($conn, $sqlpow9);
	$pow9s = pg_result($resultpow9, 0, "pp9");
	$pow9sp = pg_result($resultpow9, 0, "pp9_bo");

$sqlpop9 = "SELECT pop9, pop9_bo FROM tab_obi where id_d = '$nu';";
			
			$resultpop9 = @pg_Exec($conn, $sqlpop9);
			$pop9s = pg_result($resultpop9, 0, "pop9");
			$pop9bo = pg_result($resultpop9, 0, "pop9_bo");
				
	$sqlpop9s = "SELECT nazwa_pod_en FROM podlogi where id = '$pop9s';";
			
			$resultpop9s = @pg_Exec($conn, $sqlpop9s);
			$pop9ps = pg_result($resultpop9s, 0, "nazwa_pod_en");

$sqlsc9 = "SELECT ps9, ps9_bo FROM tab_obi where id_d = '$nu';";
			
			$resultsc9 = @pg_Exec($conn, $sqlsc9);
			$psc9s = pg_result($resultsc9, 0, "ps9");
			$psc9bo = pg_result($resultsc9, 0, "ps9_bo");
				
	$sqlsc9s = "SELECT nazwa_sc_en FROM sciany where id = '$psc9s';";
			
			$resultsc9s = @pg_Exec($conn, $sqlsc9s);
			$psc9ps = pg_result($resultsc9s, 0, "nazwa_sc_en");

$sqlsuf9 = "SELECT psu9, psu9_bo FROM tab_obi where id_d = '$nu';";
			
			$resultsuf9 = @pg_Exec($conn, $sqlsuf9);
			$suf9s = pg_result($resultsuf9, 0, "psu9");
			$suf9bo = pg_result($resultsuf9, 0, "psu9_bo");
				
	$sqlsuf9s = "SELECT nazwa_su_en FROM sufit where id = '$suf9s';";
			
			$resultsuf9s = @pg_Exec($conn, $sqlsuf9s);
			$suf9ps = pg_result($resultsuf9s, 0, "nazwa_su_en");

$sqlwyp9 = "SELECT wyp9, wyp9_bo FROM tab_obi where id_d = '$nu';";
			
			$resultwyp9 = @pg_Exec($conn, $sqlwyp9);
			$wyp9s = pg_result($resultwyp9, 0, "wyp9");
			$wyp9bo = pg_result($resultwyp9, 0, "wyp9_bo");
				
	$sqlwyp9s = "SELECT nazwa_wp_en FROM wyposazenie where id = '$wyp9s';";
			
			$resultwyp9s = @pg_Exec($conn, $sqlwyp9s);
			$wyp9ps = pg_result($resultwyp9s, 0, "nazwa_wp_en");

$sqlpow10 = "SELECT pp10, pp10_bo FROM tab_obi where id_d = '$nu';";	
	$resultpow10 = @pg_Exec($conn, $sqlpow10);
	$pow10s = pg_result($resultpow10, 0, "pp10");
	$pow10sp = pg_result($resultpow10, 0, "pp10_bo");

$sqlpop10 = "SELECT pop10, pop10_bo FROM tab_obi where id_d = '$nu';";
			
			$resultpop10 = @pg_Exec($conn, $sqlpop10);
			$pop10s = pg_result($resultpop10, 0, "pop10");
			$pop10bo = pg_result($resultpop10, 0, "pop10_bo");
				
	$sqlpop10s = "SELECT nazwa_pod_en FROM podlogi where id = '$pop10s';";
			
			$resultpop10s = @pg_Exec($conn, $sqlpop10s);
			$pop10ps = pg_result($resultpop10s, 0, "nazwa_pod_en");

$sqlsc10 = "SELECT ps10, ps10_bo FROM tab_obi where id_d = '$nu';";
			
			$resultsc10 = @pg_Exec($conn, $sqlsc10);
			$psc10s = pg_result($resultsc10, 0, "ps10");
			$psc10bo = pg_result($resultsc10, 0, "ps10_bo");
				
	$sqlsc10s = "SELECT nazwa_sc_en FROM sciany where id = '$psc10s';";
			
			$resultsc10s = @pg_Exec($conn, $sqlsc10s);
			$psc10ps = pg_result($resultsc10s, 0, "nazwa_sc_en");

$sqlsuf10 = "SELECT psu10, psu10_bo FROM tab_obi where id_d = '$nu';";
			
			$resultsuf10 = @pg_Exec($conn, $sqlsuf10);
			$suf10s = pg_result($resultsuf10, 0, "psu10");
			$suf10bo = pg_result($resultsuf10, 0, "psu10_bo");
				
	$sqlsuf10s = "SELECT nazwa_su_en FROM sufit where id = '$suf10s';";
			
			$resultsuf10s = @pg_Exec($conn, $sqlsuf10s);
			$suf10ps = pg_result($resultsuf10s, 0, "nazwa_su_en");

$sqlwyp10 = "SELECT wyp10, wyp10_bo FROM tab_obi where id_d = '$nu';";
			
			$resultwyp10 = @pg_Exec($conn, $sqlwyp10);
			$wyp10s = pg_result($resultwyp10, 0, "wyp10");
			$wyp10bo = pg_result($resultwyp10, 0, "wyp10_bo");
				
	$sqlwyp10s = "SELECT nazwa_wp_en FROM wyposazenie where id = '$wyp10s';";
			
			$resultwyp10s = @pg_Exec($conn, $sqlwyp10s);
			$wyp10ps = pg_result($resultwyp10s, 0, "nazwa_wp_en");

$sqlpow11 = "SELECT pp11, pp11_bo FROM tab_obi where id_d = '$nu';";	
	$resultpow11 = @pg_Exec($conn, $sqlpow11);
	$pow11s = pg_result($resultpow11, 0, "pp11");
	$pow11sp = pg_result($resultpow11, 0, "pp11_bo");

$sqlpop11 = "SELECT pop11, pop11_bo FROM tab_obi where id_d = '$nu';";
			
			$resultpop11 = @pg_Exec($conn, $sqlpop11);
			$pop11s = pg_result($resultpop11, 0, "pop11");
			$pop11bo = pg_result($resultpop11, 0, "pop11_bo");
				
	$sqlpop11s = "SELECT nazwa_pod_en FROM podlogi where id = '$pop11s';";
			
			$resultpop11s = @pg_Exec($conn, $sqlpop11s);
			$pop11ps = pg_result($resultpop11s, 0, "nazwa_pod_en");

$sqlsc11 = "SELECT ps11, ps11_bo FROM tab_obi where id_d = '$nu';";
			
			$resultsc11 = @pg_Exec($conn, $sqlsc11);
			$psc11s = pg_result($resultsc11, 0, "ps11");
			$psc11bo = pg_result($resultsc11, 0, "ps11_bo");
				
	$sqlsc11s = "SELECT nazwa_sc_en FROM sciany where id = '$psc11s';";
			
			$resultsc11s = @pg_Exec($conn, $sqlsc11s);
			$psc11ps = pg_result($resultsc11s, 0, "nazwa_sc_en");

$sqlsuf11 = "SELECT psu11, psu11_bo FROM tab_obi where id_d = '$nu';";
			
			$resultsuf11 = @pg_Exec($conn, $sqlsuf11);
			$suf11s = pg_result($resultsuf11, 0, "psu11");
			$suf11bo = pg_result($resultsuf11, 0, "psu11_bo");
				
	$sqlsuf11s = "SELECT nazwa_su_en FROM sufit where id = '$suf11s';";
			
			$resultsuf11s = @pg_Exec($conn, $sqlsuf11s);
			$suf11ps = pg_result($resultsuf11s, 0, "nazwa_su_en");

$sqlwyp11 = "SELECT wyp11, wyp11_bo FROM tab_obi where id_d = '$nu';";
			
			$resultwyp11 = @pg_Exec($conn, $sqlwyp11);
			$wyp11s = pg_result($resultwyp11, 0, "wyp11");
			$wyp11bo = pg_result($resultwyp11, 0, "wyp11_bo");
				
	$sqlwyp11s = "SELECT nazwa_wp_en FROM wyposazenie where id = '$wyp11s';";
			
			$resultwyp11s = @pg_Exec($conn, $sqlwyp11s);
			$wyp11ps = pg_result($resultwyp11s, 0, "nazwa_wp_en");

$sqlpow12 = "SELECT pp12, pp12_bo FROM tab_obi where id_d = '$nu';";	
	$resultpow12 = @pg_Exec($conn, $sqlpow12);
	$pow12s = pg_result($resultpow12, 0, "pp12");
	$pow12sp = pg_result($resultpow12, 0, "pp12_bo");

$sqlpop12 = "SELECT pop12, pop12_bo FROM tab_obi where id_d = '$nu';";
			
			$resultpop12 = @pg_Exec($conn, $sqlpop12);
			$pop12s = pg_result($resultpop12, 0, "pop12");
			$pop12bo = pg_result($resultpop12, 0, "pop12_bo");
				
	$sqlpop12s = "SELECT nazwa_pod_en FROM podlogi where id = '$pop12s';";
			
			$resultpop12s = @pg_Exec($conn, $sqlpop12s);
			$pop12ps = pg_result($resultpop12s, 0, "nazwa_pod_en");

$sqlsc12 = "SELECT ps12, ps12_bo FROM tab_obi where id_d = '$nu';";
			
			$resultsc12 = @pg_Exec($conn, $sqlsc12);
			$psc12s = pg_result($resultsc12, 0, "ps12");
			$psc12bo = pg_result($resultsc12, 0, "ps12_bo");
				
	$sqlsc12s = "SELECT nazwa_sc_en FROM sciany where id = '$psc12s';";
			
			$resultsc12s = @pg_Exec($conn, $sqlsc12s);
			$psc12ps = pg_result($resultsc12s, 0, "nazwa_sc_en");

$sqlsuf12 = "SELECT psu12, psu12_bo FROM tab_obi where id_d = '$nu';";
			
			$resultsuf12 = @pg_Exec($conn, $sqlsuf12);
			$suf12s = pg_result($resultsuf12, 0, "psu12");
			$suf12bo = pg_result($resultsuf12, 0, "psu12_bo");
				
	$sqlsuf12s = "SELECT nazwa_su_en FROM sufit where id = '$suf12s';";
			
			$resultsuf12s = @pg_Exec($conn, $sqlsuf12s);
			$suf12ps = pg_result($resultsuf12s, 0, "nazwa_su_en");

$sqlwyp12 = "SELECT wyp12, wyp12_bo FROM tab_obi where id_d = '$nu';";
			
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
echo "&nbsp;Store-rooms";
echo "</span>";
echo "</td></tr>";

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}
if (($pow1sp == 't')  || ($pop1bo == 't') || ($psc1bo == 't')  || ($suf1bo == 't')) {
echo "<tr>"; 
}
if ($pow1sp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Meas. store-room 1:</b><br>&nbsp;$pow1s m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($pop1bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Floor store-room 1:</b><br>&nbsp;$pop1ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($psc1bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Walls store-room 1:</b><br>&nbsp;$psc1ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($suf1bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Ceiling store-room 1:</b><br>&nbsp;$suf1ps";
echo "</td>";

}

if (($pow1sp == 't')  || ($pop1bo == 't') || ($psc1bo == 't')  || ($suf1bo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}


if ($wyp1bo == 't') {
echo "<tr>";
echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Equipment store-room 1:</b><br>&nbsp;$wyp1ps";
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
echo "&nbsp;<b>Meas. store-room 2:</b><br>&nbsp;$pow2s m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($pop2bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Floor store-room 2:</b><br>&nbsp;$pop2ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($psc2bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Walls store-room 2:</b><br>&nbsp;$psc2ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($suf2bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Ceiling store-room 2:</b><br>&nbsp;$suf2ps";
echo "</td>";

}

if ( ($pow2sp == 't')  || ($pop2bo == 't') || ($psc2bo == 't')  || ($suf2bo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}

if ($wyp2bo == 't') {
echo "<tr>";
echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Equipment store-room 2:</b><br>&nbsp;$wyp2ps";
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
echo "&nbsp;<b>Meas. store-room 3:</b><br>&nbsp;$pow3s m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($pop3bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Floor store-room 3:</b><br>&nbsp;$pop3ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($psc3bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Walls store-room 3:</b><br>&nbsp;$psc3ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($suf3bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Ceiling store-room 3:</b><br>&nbsp;$suf3ps";
echo "</td>";

}

if ( ($pow3sp == 't')  || ($pop3bo == 't') || ($psc3bo == 't')  || ($suf3bo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}

if ($wyp3bo == 't') {
echo "<tr>";
echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Equipment store-room 3:</b><br>&nbsp;$wyp3ps";
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
echo "&nbsp;<b>Meas. store-room 4:</b><br>&nbsp;$pow4s m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($pop4bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Floor store-room 4:</b><br>&nbsp;$pop4ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($psc4bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Walls store-room 4:</b><br>&nbsp;$psc4ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($suf4bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Ceiling store-room 4:</b><br>&nbsp;$suf4ps";
echo "</td>";

}

if ( ($pow4sp == 't')  || ($pop4bo == 't') || ($psc4bo == 't')  || ($suf4bo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}

if ($wyp4bo == 't') {
echo "<tr>";
echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Equipment store-room 4:</b><br>&nbsp;$wyp4ps";
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
echo "&nbsp;<b>Meas. store-room 5:</b><br>&nbsp;$pow5s m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($pop5bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Floor store-room 5:</b><br>&nbsp;$pop5ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($psc5bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Walls store-room 5:</b><br>&nbsp;$psc5ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($suf5bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Ceiling store-room 5:</b><br>&nbsp;$suf5ps";
echo "</td>";

}

if ( ($pow5sp == 't')  || ($pop5bo == 't') || ($psc5bo == 't')  || ($suf5bo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}

if ($wyp5bo == 't') {
echo "<tr>";
echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Equipment store-room 5:</b><br>&nbsp;$wyp5ps";
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
echo "&nbsp;<b>Meas. store-room 6:</b><br>&nbsp;$pow6s m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($pop6bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Floor store-room 6:</b><br>&nbsp;$pop6ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($psc6bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Walls store-room 6:</b><br>&nbsp;$psc6ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($suf6bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Ceiling store-room 6:</b><br>&nbsp;$suf6ps";
echo "</td>";

}

if ( ($pow6sp == 't')  || ($pop6bo == 't') || ($psc6bo == 't')  || ($suf6bo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}

if ($wyp6bo == 't') {
echo "<tr>";
echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Equipment store-room 6:</b><br>&nbsp;$wyp6ps";
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
echo "&nbsp;<b>Meas. store-room 7:</b><br>&nbsp;$pow7s m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($pop7bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Floor store-room 7:</b><br>&nbsp;$pop7ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($psc7bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Walls store-room 7:</b><br>&nbsp;$psc7ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($suf7bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Ceiling store-room 7:</b><br>&nbsp;$suf7ps";
echo "</td>";

}

if ( ($pow7sp == 't')  || ($pop7bo == 't') || ($psc7bo == 't')  || ($suf7bo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}

if ($wyp7bo == 't') {
echo "<tr>";
echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Equipment store-room 7:</b><br>&nbsp;$wyp7ps";
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
echo "&nbsp;<b>Meas. store-room 8:</b><br>&nbsp;$pow8s m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($pop8bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Floor store-room 8:</b><br>&nbsp;$pop8ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($psc8bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Walls store-room 8:</b><br>&nbsp;$psc8ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($suf8bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Ceiling store-room 8:</b><br>&nbsp;$suf8ps";
echo "</td>";

}

if ( ($pow8sp == 't')  || ($pop8bo == 't') || ($psc8bo == 't')  || ($suf8bo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}

if ($wyp8bo == 't') {
echo "<tr>";
echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Equipment store-room 8:</b><br>&nbsp;$wyp8ps";
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
echo "&nbsp;<b>Meas. store-room 9:</b><br>&nbsp;$pow9s m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($pop9bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Floor store-room 9:</b><br>&nbsp;$pop9ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($psc9bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Walls store-room 9:</b><br>&nbsp;$psc9ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($suf9bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Ceiling store-room 9:</b><br>&nbsp;$suf9ps";
echo "</td>";

}

if ( ($pow9sp == 't')  || ($pop9bo == 't') || ($psc9bo == 't')  || ($suf9bo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}

if ($wyp9bo == 't') {
echo "<tr>";
echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Equipment store-room 9:</b><br>&nbsp;$wyp9ps";
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
echo "&nbsp;<b>Meas. store-room 10:</b><br>&nbsp;$pow10s m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($pop10bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Floor store-room 10:</b><br>&nbsp;$pop10ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($psc10bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Walls store-room 10:</b><br>&nbsp;$psc10ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($suf10bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Ceiling store-room 10:</b><br>&nbsp;$suf10ps";
echo "</td>";

}

if ( ($pow10sp == 't')  || ($pop10bo == 't') || ($psc10bo == 't')  || ($suf10bo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}

if ($wyp10bo == 't') {
echo "<tr>";
echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Equipment store-room 10:</b><br>&nbsp;$wyp10ps";
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
echo "&nbsp;<b>Meas. store-room 11:</b><br>&nbsp;$pow11s m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($pop11bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Floor store-room 11:</b><br>&nbsp;$pop11ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($psc11bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Walls store-room 11:</b><br>&nbsp;$psc11ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($suf11bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Ceiling store-room 11:</b><br>&nbsp;$suf11ps";
echo "</td>";

}

if ( ($pow11sp == 't')  || ($pop11bo == 't') || ($psc11bo == 't')  || ($suf11bo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}

if ($wyp11bo == 't') {
echo "<tr>";
echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Equipment store-room 11:</b><br>&nbsp;$wyp11ps";
echo "</td>";
echo "</tr>";
}	

if ($wyp11bo == 't') {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}

if (($pow12sp == 't')  || ($pop12bo == 't') || ($psc12bo == 't')  || ($suf12bo == 't')) {
echo "<tr>"; 
}
if ($pow12sp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Meas. store-room 12:</b><br>&nbsp;$pow12s m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($pop12bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Floor store-room 12:</b><br>&nbsp;$pop12ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($psc12bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Walls store-room 12:</b><br>&nbsp;$psc12ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($suf12bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Ceiling store-room 12:</b><br>&nbsp;$suf12ps";
echo "</td>";

}

if (($pow12sp == 't')  || ($pop12bo == 't') || ($psc12bo == 't')  || ($suf12bo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}

if ($wyp12bo == 't') {
echo "<tr>";
echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Equipment store-room 12:</b><br>&nbsp;$wyp12ps";
echo "</td>";
echo "</tr>";
}	

if ($wyp12bo == 't') {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}


$sqlpowb1 = "SELECT ppb1, ppb1_bo FROM tab_obi where id_d = '$nu';";	
	$resultpowb1 = @pg_Exec($conn, $sqlpowb1);
	$powb1s = pg_result($resultpowb1, 0, "ppb1");
	$powb1sp = pg_result($resultpowb1, 0, "ppb1_bo");

$sqlpopb1 = "SELECT popb1, popb1_bo FROM tab_obi where id_d = '$nu';";
			
			$resultpopb1 = @pg_Exec($conn, $sqlpopb1);
			$popb1s = pg_result($resultpopb1, 0, "popb1");
			$popb1bo = pg_result($resultpopb1, 0, "popb1_bo");
				
	$sqlpopb1s = "SELECT nazwa_pod_en FROM podlogi where id = '$popb1s';";
			
			$resultpopb1s = @pg_Exec($conn, $sqlpopb1s);
			$popb1ps = pg_result($resultpopb1s, 0, "nazwa_pod_en");

$sqlsb1 = "SELECT psb1, psb1_bo FROM tab_obi where id_d = '$nu';";
			
			$resultsb1 = @pg_Exec($conn, $sqlsb1);
			$psb1s = pg_result($resultsb1, 0, "psb1");
			$psb1bo = pg_result($resultsb1, 0, "psb1_bo");
				
	$sqlsb1s = "SELECT nazwa_sc_en FROM sciany where id = '$psb1s';";
			
			$resultsb1s = @pg_Exec($conn, $sqlsb1s);
			$psb1ps = pg_result($resultsb1s, 0, "nazwa_sc_en");

$sqlsufb1 = "SELECT psub1, psub1_bo FROM tab_obi where id_d = '$nu';";
			
			$resultsufb1 = @pg_Exec($conn, $sqlsufb1);
			$sufb1s = pg_result($resultsufb1, 0, "psub1");
			$sufb1bo = pg_result($resultsufb1, 0, "psub1_bo");
				
	$sqlsufb1s = "SELECT nazwa_su_en FROM sufit where id = '$sufb1s';";
			
			$resultsufb1s = @pg_Exec($conn, $sqlsufb1s);
			$sufb1ps = pg_result($resultsufb1s, 0, "nazwa_su_en");

$sqlwypb1 = "SELECT wypb1, wypb1_bo FROM tab_obi where id_d = '$nu';";
			
			$resultwypb1 = @pg_Exec($conn, $sqlwypb1);
			$wypb1s = pg_result($resultwypb1, 0, "wypb1");
			$wypb1bo = pg_result($resultwypb1, 0, "wypb1_bo");
				
	$sqlwypb1s = "SELECT nazwa_wp_en FROM wyposazenie where id = '$wypb1s';";
			
			$resultwypb1s = @pg_Exec($conn, $sqlwypb1s);
			$wypb1ps = pg_result($resultwypb1s, 0, "nazwa_wp_en");


$sqlpowb2 = "SELECT ppb2, ppb2_bo FROM tab_obi where id_d = '$nu';";	
	$resultpowb2 = @pg_Exec($conn, $sqlpowb2);
	$powb2s = pg_result($resultpowb2, 0, "ppb2");
	$powb2sp = pg_result($resultpowb2, 0, "ppb2_bo");

$sqlpopb2 = "SELECT popb2, popb2_bo FROM tab_obi where id_d = '$nu';";
			
			$resultpopb2 = @pg_Exec($conn, $sqlpopb2);
			$popb2s = pg_result($resultpopb2, 0, "popb2");
			$popb2bo = pg_result($resultpopb2, 0, "popb2_bo");
				
	$sqlpopb2s = "SELECT nazwa_pod_en FROM podlogi where id = '$popb2s';";
			
			$resultpopb2s = @pg_Exec($conn, $sqlpopb2s);
			$popb2ps = pg_result($resultpopb2s, 0, "nazwa_pod_en");

$sqlsb2 = "SELECT psb2, psb2_bo FROM tab_obi where id_d = '$nu';";
			
			$resultsb2 = @pg_Exec($conn, $sqlsb2);
			$psb2s = pg_result($resultsb2, 0, "psb2");
			$psb2bo = pg_result($resultsb2, 0, "psb2_bo");
				
	$sqlsb2s = "SELECT nazwa_sc_en FROM sciany where id = '$psb2s';";
			
			$resultsb2s = @pg_Exec($conn, $sqlsb2s);
			$psb2ps = pg_result($resultsb2s, 0, "nazwa_sc_en");

$sqlsufb2 = "SELECT psub2, psub2_bo FROM tab_obi where id_d = '$nu';";
			
			$resultsufb2 = @pg_Exec($conn, $sqlsufb2);
			$sufb2s = pg_result($resultsufb2, 0, "psub2");
			$sufb2bo = pg_result($resultsufb2, 0, "psub2_bo");
				
	$sqlsufb2s = "SELECT nazwa_su_en FROM sufit where id = '$sufb2s';";
			
			$resultsufb2s = @pg_Exec($conn, $sqlsufb2s);
			$sufb2ps = pg_result($resultsufb2s, 0, "nazwa_su_en");

$sqlwypb2 = "SELECT wypb2, wypb2_bo FROM tab_obi where id_d = '$nu';";
			
			$resultwypb2 = @pg_Exec($conn, $sqlwypb2);
			$wypb2s = pg_result($resultwypb2, 0, "wypb2");
			$wypb2bo = pg_result($resultwypb2, 0, "wypb2_bo");
				
	$sqlwypb2s = "SELECT nazwa_wp_en FROM wyposazenie where id = '$wypb2s';";
			
			$resultwypb2s = @pg_Exec($conn, $sqlwypb2s);
			$wypb2ps = pg_result($resultwypb2s, 0, "nazwa_wp_en");


$sqlpowb3 = "SELECT ppb3, ppb3_bo FROM tab_obi where id_d = '$nu';";	
	$resultpowb3 = @pg_Exec($conn, $sqlpowb3);
	$powb3s = pg_result($resultpowb3, 0, "ppb3");
	$powb3sp = pg_result($resultpowb3, 0, "ppb3_bo");

$sqlpopb3 = "SELECT popb3, popb3_bo FROM tab_obi where id_d = '$nu';";
			
			$resultpopb3 = @pg_Exec($conn, $sqlpopb3);
			$popb3s = pg_result($resultpopb3, 0, "popb3");
			$popb3bo = pg_result($resultpopb3, 0, "popb3_bo");
				
	$sqlpopb3s = "SELECT nazwa_pod_en FROM podlogi where id = '$popb3s';";
			
			$resultpopb3s = @pg_Exec($conn, $sqlpopb3s);
			$popb3ps = pg_result($resultpopb3s, 0, "nazwa_pod_en");

$sqlsb3 = "SELECT psb3, psb3_bo FROM tab_obi where id_d = '$nu';";
			
			$resultsb3 = @pg_Exec($conn, $sqlsb3);
			$psb3s = pg_result($resultsb3, 0, "psb3");
			$psb3bo = pg_result($resultsb3, 0, "psb3_bo");
				
	$sqlsb3s = "SELECT nazwa_sc_en FROM sciany where id = '$psb3s';";
			
			$resultsb3s = @pg_Exec($conn, $sqlsb3s);
			$psb3ps = pg_result($resultsb3s, 0, "nazwa_sc_en");

$sqlsufb3 = "SELECT psub3, psub3_bo FROM tab_obi where id_d = '$nu';";
			
			$resultsufb3 = @pg_Exec($conn, $sqlsufb3);
			$sufb3s = pg_result($resultsufb3, 0, "psub3");
			$sufb3bo = pg_result($resultsufb3, 0, "psub3_bo");
				
	$sqlsufb3s = "SELECT nazwa_su_en FROM sufit where id = '$sufb3s';";
			
			$resultsufb3s = @pg_Exec($conn, $sqlsufb3s);
			$sufb3ps = pg_result($resultsufb3s, 0, "nazwa_su_en");

$sqlwypb3 = "SELECT wypb3, wypb3_bo FROM tab_obi where id_d = '$nu';";
			
			$resultwypb3 = @pg_Exec($conn, $sqlwypb3);
			$wypb3s = pg_result($resultwypb3, 0, "wypb3");
			$wypb3bo = pg_result($resultwypb3, 0, "wypb3_bo");
				
	$sqlwypb3s = "SELECT nazwa_wp_en FROM wyposazenie where id = '$wypb3s';";
			
			$resultwypb3s = @pg_Exec($conn, $sqlwypb3s);
			$wypb3ps = pg_result($resultwypb3s, 0, "nazwa_wp_en");

$sqlpowb4 = "SELECT ppb4, ppb4_bo FROM tab_obi where id_d = '$nu';";	
	$resultpowb4 = @pg_Exec($conn, $sqlpowb4);
	$powb4s = pg_result($resultpowb4, 0, "ppb4");
	$powb4sp = pg_result($resultpowb4, 0, "ppb4_bo");

$sqlpopb4 = "SELECT popb4, popb4_bo FROM tab_obi where id_d = '$nu';";
			
			$resultpopb4 = @pg_Exec($conn, $sqlpopb4);
			$popb4s = pg_result($resultpopb4, 0, "popb4");
			$popb4bo = pg_result($resultpopb4, 0, "popb4_bo");
				
	$sqlpopb4s = "SELECT nazwa_pod_en FROM podlogi where id = '$popb4s';";
			
			$resultpopb4s = @pg_Exec($conn, $sqlpopb4s);
			$popb4ps = pg_result($resultpopb4s, 0, "nazwa_pod_en");

$sqlsb4 = "SELECT psb4, psb4_bo FROM tab_obi where id_d = '$nu';";
			
			$resultsb4 = @pg_Exec($conn, $sqlsb4);
			$psb4s = pg_result($resultsb4, 0, "psb4");
			$psb4bo = pg_result($resultsb4, 0, "psb4_bo");
				
	$sqlsb4s = "SELECT nazwa_sc_en FROM sciany where id = '$psb4s';";
			
			$resultsb4s = @pg_Exec($conn, $sqlsb4s);
			$psb4ps = pg_result($resultsb4s, 0, "nazwa_sc_en");

$sqlsufb4 = "SELECT psub4, psub4_bo FROM tab_obi where id_d = '$nu';";
			
			$resultsufb4 = @pg_Exec($conn, $sqlsufb4);
			$sufb4s = pg_result($resultsufb4, 0, "psub4");
			$sufb4bo = pg_result($resultsufb4, 0, "psub4_bo");
				
	$sqlsufb4s = "SELECT nazwa_su_en FROM sufit where id = '$sufb4s';";
			
			$resultsufb4s = @pg_Exec($conn, $sqlsufb4s);
			$sufb4ps = pg_result($resultsufb4s, 0, "nazwa_su_en");

$sqlwypb4 = "SELECT wypb4, wypb4_bo FROM tab_obi where id_d = '$nu';";
			
			$resultwypb4 = @pg_Exec($conn, $sqlwypb4);
			$wypb4s = pg_result($resultwypb4, 0, "wypb4");
			$wypb4bo = pg_result($resultwypb4, 0, "wypb4_bo");
				
	$sqlwypb4s = "SELECT nazwa_wp_en FROM wyposazenie where id = '$wypb4s';";
			
			$resultwypb4s = @pg_Exec($conn, $sqlwypb4s);
			$wypb4ps = pg_result($resultwypb4s, 0, "nazwa_wp_en");

$sqlpowb5 = "SELECT ppb5, ppb5_bo FROM tab_obi where id_d = '$nu';";	
	$resultpowb5 = @pg_Exec($conn, $sqlpowb5);
	$powb5s = pg_result($resultpowb5, 0, "ppb5");
	$powb5sp = pg_result($resultpowb5, 0, "ppb5_bo");

$sqlpopb5 = "SELECT popb5, popb5_bo FROM tab_obi where id_d = '$nu';";
			
			$resultpopb5 = @pg_Exec($conn, $sqlpopb5);
			$popb5s = pg_result($resultpopb5, 0, "popb5");
			$popb5bo = pg_result($resultpopb5, 0, "popb5_bo");
				
	$sqlpopb5s = "SELECT nazwa_pod_en FROM podlogi where id = '$popb5s';";
			
			$resultpopb5s = @pg_Exec($conn, $sqlpopb5s);
			$popb5ps = pg_result($resultpopb5s, 0, "nazwa_pod_en");

$sqlsb5 = "SELECT psb5, psb5_bo FROM tab_obi where id_d = '$nu';";
			
			$resultsb5 = @pg_Exec($conn, $sqlsb5);
			$psb5s = pg_result($resultsb5, 0, "psb5");
			$psb5bo = pg_result($resultsb5, 0, "psb5_bo");
				
	$sqlsb5s = "SELECT nazwa_sc_en FROM sciany where id = '$psb5s';";
			
			$resultsb5s = @pg_Exec($conn, $sqlsb5s);
			$psb5ps = pg_result($resultsb5s, 0, "nazwa_sc_en");

$sqlsufb5 = "SELECT psub5, psub5_bo FROM tab_obi where id_d = '$nu';";
			
			$resultsufb5 = @pg_Exec($conn, $sqlsufb5);
			$sufb5s = pg_result($resultsufb5, 0, "psub5");
			$sufb5bo = pg_result($resultsufb5, 0, "psub5_bo");
				
	$sqlsufb5s = "SELECT nazwa_su_en FROM sufit where id = '$sufb5s';";
			
			$resultsufb5s = @pg_Exec($conn, $sqlsufb5s);
			$sufb5ps = pg_result($resultsufb5s, 0, "nazwa_su_en");

$sqlwypb5 = "SELECT wypb5, wypb5_bo FROM tab_obi where id_d = '$nu';";
			
			$resultwypb5 = @pg_Exec($conn, $sqlwypb5);
			$wypb5s = pg_result($resultwypb5, 0, "wypb5");
			$wypb5bo = pg_result($resultwypb5, 0, "wypb5_bo");
				
	$sqlwypb5s = "SELECT nazwa_wp_en FROM wyposazenie where id = '$wypb5s';";
			
			$resultwypb5s = @pg_Exec($conn, $sqlwypb5s);
			$wypb5ps = pg_result($resultwypb5s, 0, "nazwa_wp_en");

$sqlpowb6 = "SELECT ppb6, ppb6_bo FROM tab_obi where id_d = '$nu';";	
	$resultpowb6 = @pg_Exec($conn, $sqlpowb6);
	$powb6s = pg_result($resultpowb6, 0, "ppb6");
	$powb6sp = pg_result($resultpowb6, 0, "ppb6_bo");

$sqlpopb6 = "SELECT popb6, popb6_bo FROM tab_obi where id_d = '$nu';";
			
			$resultpopb6 = @pg_Exec($conn, $sqlpopb6);
			$popb6s = pg_result($resultpopb6, 0, "popb6");
			$popb6bo = pg_result($resultpopb6, 0, "popb6_bo");
				
	$sqlpopb6s = "SELECT nazwa_pod_en FROM podlogi where id = '$popb6s';";
			
			$resultpopb6s = @pg_Exec($conn, $sqlpopb6s);
			$popb6ps = pg_result($resultpopb6s, 0, "nazwa_pod_en");

$sqlsb6 = "SELECT psb6, psb6_bo FROM tab_obi where id_d = '$nu';";
			
			$resultsb6 = @pg_Exec($conn, $sqlsb6);
			$psb6s = pg_result($resultsb6, 0, "psb6");
			$psb6bo = pg_result($resultsb6, 0, "psb6_bo");
				
	$sqlsb6s = "SELECT nazwa_sc_en FROM sciany where id = '$psb6s';";
			
			$resultsb6s = @pg_Exec($conn, $sqlsb6s);
			$psb6ps = pg_result($resultsb6s, 0, "nazwa_sc_en");

$sqlsufb6 = "SELECT psub6, psub6_bo FROM tab_obi where id_d = '$nu';";
			
			$resultsufb6 = @pg_Exec($conn, $sqlsufb6);
			$sufb6s = pg_result($resultsufb6, 0, "psub6");
			$sufb6bo = pg_result($resultsufb6, 0, "psub6_bo");
				
	$sqlsufb6s = "SELECT nazwa_su_en FROM sufit where id = '$sufb6s';";
			
			$resultsufb6s = @pg_Exec($conn, $sqlsufb6s);
			$sufb6ps = pg_result($resultsufb6s, 0, "nazwa_su_en");

$sqlwypb6 = "SELECT wypb6, wypb6_bo FROM tab_obi where id_d = '$nu';";
			
			$resultwypb6 = @pg_Exec($conn, $sqlwypb6);
			$wypb6s = pg_result($resultwypb6, 0, "wypb6");
			$wypb6bo = pg_result($resultwypb6, 0, "wypb6_bo");
				
	$sqlwypb6s = "SELECT nazwa_wp_en FROM wyposazenie where id = '$wypb6s';";
			
			$resultwypb6s = @pg_Exec($conn, $sqlwypb6s);
			$wypb6ps = pg_result($resultwypb6s, 0, "nazwa_wp_en");

$sqlpowb7 = "SELECT ppb7, ppb7_bo FROM tab_obi where id_d = '$nu';";	
	$resultpowb7 = @pg_Exec($conn, $sqlpowb7);
	$powb7s = pg_result($resultpowb7, 0, "ppb7");
	$powb7sp = pg_result($resultpowb7, 0, "ppb7_bo");

$sqlpopb7 = "SELECT popb7, popb7_bo FROM tab_obi where id_d = '$nu';";
			
			$resultpopb7 = @pg_Exec($conn, $sqlpopb7);
			$popb7s = pg_result($resultpopb7, 0, "popb7");
			$popb7bo = pg_result($resultpopb7, 0, "popb7_bo");
				
	$sqlpopb7s = "SELECT nazwa_pod_en FROM podlogi where id = '$popb7s';";
			
			$resultpopb7s = @pg_Exec($conn, $sqlpopb7s);
			$popb7ps = pg_result($resultpopb7s, 0, "nazwa_pod_en");

$sqlsb7 = "SELECT psb7, psb7_bo FROM tab_obi where id_d = '$nu';";
			
			$resultsb7 = @pg_Exec($conn, $sqlsb7);
			$psb7s = pg_result($resultsb7, 0, "psb7");
			$psb7bo = pg_result($resultsb7, 0, "psb7_bo");
				
	$sqlsb7s = "SELECT nazwa_sc_en FROM sciany where id = '$psb7s';";
			
			$resultsb7s = @pg_Exec($conn, $sqlsb7s);
			$psb7ps = pg_result($resultsb7s, 0, "nazwa_sc_en");

$sqlsufb7 = "SELECT psub7, psub7_bo FROM tab_obi where id_d = '$nu';";
			
			$resultsufb7 = @pg_Exec($conn, $sqlsufb7);
			$sufb7s = pg_result($resultsufb7, 0, "psub7");
			$sufb7bo = pg_result($resultsufb7, 0, "psub7_bo");
				
	$sqlsufb7s = "SELECT nazwa_su_en FROM sufit where id = '$sufb7s';";
			
			$resultsufb7s = @pg_Exec($conn, $sqlsufb7s);
			$sufb7ps = pg_result($resultsufb7s, 0, "nazwa_su_en");

$sqlwypb7 = "SELECT wypb7, wypb7_bo FROM tab_obi where id_d = '$nu';";
			
			$resultwypb7 = @pg_Exec($conn, $sqlwypb7);
			$wypb7s = pg_result($resultwypb7, 0, "wypb7");
			$wypb7bo = pg_result($resultwypb7, 0, "wypb7_bo");
				
	$sqlwypb7s = "SELECT nazwa_wp_en FROM wyposazenie where id = '$wypb7s';";
			
			$resultwypb7s = @pg_Exec($conn, $sqlwypb7s);
			$wypb7ps = pg_result($resultwypb7s, 0, "nazwa_wp_en");

$sqlpowb8 = "SELECT ppb8, ppb8_bo FROM tab_obi where id_d = '$nu';";	
	$resultpowb8 = @pg_Exec($conn, $sqlpowb8);
	$powb8s = pg_result($resultpowb8, 0, "ppb8");
	$powb8sp = pg_result($resultpowb8, 0, "ppb8_bo");

$sqlpopb8 = "SELECT popb8, popb8_bo FROM tab_obi where id_d = '$nu';";
			
			$resultpopb8 = @pg_Exec($conn, $sqlpopb8);
			$popb8s = pg_result($resultpopb8, 0, "popb8");
			$popb8bo = pg_result($resultpopb8, 0, "popb8_bo");
				
	$sqlpopb8s = "SELECT nazwa_pod_en FROM podlogi where id = '$popb8s';";
			
			$resultpopb8s = @pg_Exec($conn, $sqlpopb8s);
			$popb8ps = pg_result($resultpopb8s, 0, "nazwa_pod_en");

$sqlsb8 = "SELECT psb8, psb8_bo FROM tab_obi where id_d = '$nu';";
			
			$resultsb8 = @pg_Exec($conn, $sqlsb8);
			$psb8s = pg_result($resultsb8, 0, "psb8");
			$psb8bo = pg_result($resultsb8, 0, "psb8_bo");
				
	$sqlsb8s = "SELECT nazwa_sc_en FROM sciany where id = '$psb8s';";
			
			$resultsb8s = @pg_Exec($conn, $sqlsb8s);
			$psb8ps = pg_result($resultsb8s, 0, "nazwa_sc_en");

$sqlsufb8 = "SELECT psub8, psub8_bo FROM tab_obi where id_d = '$nu';";
			
			$resultsufb8 = @pg_Exec($conn, $sqlsufb8);
			$sufb8s = pg_result($resultsufb8, 0, "psub8");
			$sufb8bo = pg_result($resultsufb8, 0, "psub8_bo");
				
	$sqlsufb8s = "SELECT nazwa_su_en FROM sufit where id = '$sufb8s';";
			
			$resultsufb8s = @pg_Exec($conn, $sqlsufb8s);
			$sufb8ps = pg_result($resultsufb8s, 0, "nazwa_su_en");

$sqlwypb8 = "SELECT wypb8, wypb8_bo FROM tab_obi where id_d = '$nu';";
			
			$resultwypb8 = @pg_Exec($conn, $sqlwypb8);
			$wypb8s = pg_result($resultwypb8, 0, "wypb8");
			$wypb8bo = pg_result($resultwypb8, 0, "wypb8_bo");
				
	$sqlwypb8s = "SELECT nazwa_wp_en FROM wyposazenie where id = '$wypb8s';";
			
			$resultwypb8s = @pg_Exec($conn, $sqlwypb8s);
			$wypb8ps = pg_result($resultwypb8s, 0, "nazwa_wp_en");

$sqlpowb9 = "SELECT ppb9, ppb9_bo FROM tab_obi where id_d = '$nu';";	
	$resultpowb9 = @pg_Exec($conn, $sqlpowb9);
	$powb9s = pg_result($resultpowb9, 0, "ppb9");
	$powb9sp = pg_result($resultpowb9, 0, "ppb9_bo");

$sqlpopb9 = "SELECT popb9, popb9_bo FROM tab_obi where id_d = '$nu';";
			
			$resultpopb9 = @pg_Exec($conn, $sqlpopb9);
			$popb9s = pg_result($resultpopb9, 0, "popb9");
			$popb9bo = pg_result($resultpopb9, 0, "popb9_bo");
				
	$sqlpopb9s = "SELECT nazwa_pod_en FROM podlogi where id = '$popb9s';";
			
			$resultpopb9s = @pg_Exec($conn, $sqlpopb9s);
			$popb9ps = pg_result($resultpopb9s, 0, "nazwa_pod_en");

$sqlsb9 = "SELECT psb9, psb9_bo FROM tab_obi where id_d = '$nu';";
			
			$resultsb9 = @pg_Exec($conn, $sqlsb9);
			$psb9s = pg_result($resultsb9, 0, "psb9");
			$psb9bo = pg_result($resultsb9, 0, "psb9_bo");
				
	$sqlsb9s = "SELECT nazwa_sc_en FROM sciany where id = '$psb9s';";
			
			$resultsb9s = @pg_Exec($conn, $sqlsb9s);
			$psb9ps = pg_result($resultsb9s, 0, "nazwa_sc_en");

$sqlsufb9 = "SELECT psub9, psub9_bo FROM tab_obi where id_d = '$nu';";
			
			$resultsufb9 = @pg_Exec($conn, $sqlsufb9);
			$sufb9s = pg_result($resultsufb9, 0, "psub9");
			$sufb9bo = pg_result($resultsufb9, 0, "psub9_bo");
				
	$sqlsufb9s = "SELECT nazwa_su_en FROM sufit where id = '$sufb9s';";
			
			$resultsufb9s = @pg_Exec($conn, $sqlsufb9s);
			$sufb9ps = pg_result($resultsufb9s, 0, "nazwa_su_en");

$sqlwypb9 = "SELECT wypb9, wypb9_bo FROM tab_obi where id_d = '$nu';";
			
			$resultwypb9 = @pg_Exec($conn, $sqlwypb9);
			$wypb9s = pg_result($resultwypb9, 0, "wypb9");
			$wypb9bo = pg_result($resultwypb9, 0, "wypb9_bo");
				
	$sqlwypb9s = "SELECT nazwa_wp_en FROM wyposazenie where id = '$wypb9s';";
			
			$resultwypb9s = @pg_Exec($conn, $sqlwypb9s);
			$wypb9ps = pg_result($resultwypb9s, 0, "nazwa_wp_en");

$sqlpowb10 = "SELECT ppb10, ppb10_bo FROM tab_obi where id_d = '$nu';";	
	$resultpowb10 = @pg_Exec($conn, $sqlpowb10);
	$powb10s = pg_result($resultpowb10, 0, "ppb10");
	$powb10sp = pg_result($resultpowb10, 0, "ppb10_bo");

$sqlpopb10 = "SELECT popb10, popb10_bo FROM tab_obi where id_d = '$nu';";
			
			$resultpopb10 = @pg_Exec($conn, $sqlpopb10);
			$popb10s = pg_result($resultpopb10, 0, "popb10");
			$popb10bo = pg_result($resultpopb10, 0, "popb10_bo");
				
	$sqlpopb10s = "SELECT nazwa_pod_en FROM podlogi where id = '$popb10s';";
			
			$resultpopb10s = @pg_Exec($conn, $sqlpopb10s);
			$popb10ps = pg_result($resultpopb10s, 0, "nazwa_pod_en");

$sqlsb10 = "SELECT psb10, psb10_bo FROM tab_obi where id_d = '$nu';";
			
			$resultsb10 = @pg_Exec($conn, $sqlsb10);
			$psb10s = pg_result($resultsb10, 0, "psb10");
			$psb10bo = pg_result($resultsb10, 0, "psb10_bo");
				
	$sqlsb10s = "SELECT nazwa_sc_en FROM sciany where id = '$psb10s';";
			
			$resultsb10s = @pg_Exec($conn, $sqlsb10s);
			$psb10ps = pg_result($resultsb10s, 0, "nazwa_sc_en");

$sqlsufb10 = "SELECT psub10, psub10_bo FROM tab_obi where id_d = '$nu';";
			
			$resultsufb10 = @pg_Exec($conn, $sqlsufb10);
			$sufb10s = pg_result($resultsufb10, 0, "psub10");
			$sufb10bo = pg_result($resultsufb10, 0, "psub10_bo");
				
	$sqlsufb10s = "SELECT nazwa_su_en FROM sufit where id = '$sufb10s';";
			
			$resultsufb10s = @pg_Exec($conn, $sqlsufb10s);
			$sufb10ps = pg_result($resultsufb10s, 0, "nazwa_su_en");

$sqlwypb10 = "SELECT wypb10, wypb10_bo FROM tab_obi where id_d = '$nu';";
			
			$resultwypb10 = @pg_Exec($conn, $sqlwypb10);
			$wypb10s = pg_result($resultwypb10, 0, "wypb10");
			$wypb10bo = pg_result($resultwypb10, 0, "wypb10_bo");
				
	$sqlwypb10s = "SELECT nazwa_wp_en FROM wyposazenie where id = '$wypb10s';";
			
			$resultwypb10s = @pg_Exec($conn, $sqlwypb10s);
			$wypb10ps = pg_result($resultwypb10s, 0, "nazwa_wp_en");

$sqlpowb11 = "SELECT ppb11, ppb11_bo FROM tab_obi where id_d = '$nu';";	
	$resultpowb11 = @pg_Exec($conn, $sqlpowb11);
	$powb11s = pg_result($resultpowb11, 0, "ppb11");
	$powb11sp = pg_result($resultpowb11, 0, "ppb11_bo");

$sqlpopb11 = "SELECT popb11, popb11_bo FROM tab_obi where id_d = '$nu';";
			
			$resultpopb11 = @pg_Exec($conn, $sqlpopb11);
			$popb11s = pg_result($resultpopb11, 0, "popb11");
			$popb11bo = pg_result($resultpopb11, 0, "popb11_bo");
				
	$sqlpopb11s = "SELECT nazwa_pod_en FROM podlogi where id = '$popb11s';";
			
			$resultpopb11s = @pg_Exec($conn, $sqlpopb11s);
			$popb11ps = pg_result($resultpopb11s, 0, "nazwa_pod_en");

$sqlsb11 = "SELECT psb11, psb11_bo FROM tab_obi where id_d = '$nu';";
			
			$resultsb11 = @pg_Exec($conn, $sqlsb11);
			$psb11s = pg_result($resultsb11, 0, "psb11");
			$psb11bo = pg_result($resultsb11, 0, "psb11_bo");
				
	$sqlsb11s = "SELECT nazwa_sc_en FROM sciany where id = '$psb11s';";
			
			$resultsb11s = @pg_Exec($conn, $sqlsb11s);
			$psb11ps = pg_result($resultsb11s, 0, "nazwa_sc_en");

$sqlsufb11 = "SELECT psub11, psub11_bo FROM tab_obi where id_d = '$nu';";
			
			$resultsufb11 = @pg_Exec($conn, $sqlsufb11);
			$sufb11s = pg_result($resultsufb11, 0, "psub11");
			$sufb11bo = pg_result($resultsufb11, 0, "psub11_bo");
				
	$sqlsufb11s = "SELECT nazwa_su_en FROM sufit where id = '$sufb11s';";
			
			$resultsufb11s = @pg_Exec($conn, $sqlsufb11s);
			$sufb11ps = pg_result($resultsufb11s, 0, "nazwa_su_en");

$sqlwypb11 = "SELECT wypb11, wypb11_bo FROM tab_obi where id_d = '$nu';";
			
			$resultwypb11 = @pg_Exec($conn, $sqlwypb11);
			$wypb11s = pg_result($resultwypb11, 0, "wypb11");
			$wypb11bo = pg_result($resultwypb11, 0, "wypb11_bo");
				
	$sqlwypb11s = "SELECT nazwa_wp_en FROM wyposazenie where id = '$wypb11s';";
			
			$resultwypb11s = @pg_Exec($conn, $sqlwypb11s);
			$wypb11ps = pg_result($resultwypb11s, 0, "nazwa_wp_en");

$sqlpowb12 = "SELECT ppb12, ppb12_bo FROM tab_obi where id_d = '$nu';";	
	$resultpowb12 = @pg_Exec($conn, $sqlpowb12);
	$powb12s = pg_result($resultpowb12, 0, "ppb12");
	$powb12sp = pg_result($resultpowb12, 0, "ppb12_bo");

$sqlpopb12 = "SELECT popb12, popb12_bo FROM tab_obi where id_d = '$nu';";
			
			$resultpopb12 = @pg_Exec($conn, $sqlpopb12);
			$popb12s = pg_result($resultpopb12, 0, "popb12");
			$popb12bo = pg_result($resultpopb12, 0, "popb12_bo");
				
	$sqlpopb12s = "SELECT nazwa_pod_en FROM podlogi where id = '$popb12s';";
			
			$resultpopb12s = @pg_Exec($conn, $sqlpopb12s);
			$popb12ps = pg_result($resultpopb12s, 0, "nazwa_pod_en");

$sqlsb12 = "SELECT psb12, psb12_bo FROM tab_obi where id_d = '$nu';";
			
			$resultsb12 = @pg_Exec($conn, $sqlsb12);
			$psb12s = pg_result($resultsb12, 0, "psb12");
			$psb12bo = pg_result($resultsb12, 0, "psb12_bo");
				
	$sqlsb12s = "SELECT nazwa_sc_en FROM sciany where id = '$psb12s';";
			
			$resultsb12s = @pg_Exec($conn, $sqlsb12s);
			$psb12ps = pg_result($resultsb12s, 0, "nazwa_sc_en");

$sqlsufb12 = "SELECT psub12, psub12_bo FROM tab_obi where id_d = '$nu';";
			
			$resultsufb12 = @pg_Exec($conn, $sqlsufb12);
			$sufb12s = pg_result($resultsufb12, 0, "psub12");
			$sufb12bo = pg_result($resultsufb12, 0, "psub12_bo");
				
	$sqlsufb12s = "SELECT nazwa_su_en FROM sufit where id = '$sufb12s';";
			
			$resultsufb12s = @pg_Exec($conn, $sqlsufb12s);
			$sufb12ps = pg_result($resultsufb12s, 0, "nazwa_su_en");

$sqlwypb12 = "SELECT wypb12, wypb12_bo FROM tab_obi where id_d = '$nu';";
			
			$resultwypb12 = @pg_Exec($conn, $sqlwypb12);
			$wypb12s = pg_result($resultwypb12, 0, "wypb12");
			$wypb12bo = pg_result($resultwypb12, 0, "wypb12_bo");
				
	$sqlwypb12s = "SELECT nazwa_wp_en FROM wyposazenie where id = '$wypb12s';";
			
			$resultwypb12s = @pg_Exec($conn, $sqlwypb12s);
			$wypb12ps = pg_result($resultwypb12s, 0, "nazwa_wp_en");


if (($powb1sp == 't')  || ($popb1bo == 't') || ($psb1bo == 't')  || ($sufb1bo == 't') || ($wypb1bo == 't') || ($powb2sp == 't')  || ($popb2bo == 't') || ($psb2bo == 't')  || ($sufb2bo == 't') || ($wypb2bo == 't') || ($powb3sp == 't')  || ($popb3bo == 't') || ($psb3bo == 't')  || ($sufb3bo == 't') || ($wypb3bo == 't') || ($powb4sp == 't')  || ($popb4bo == 't') || ($psb4bo == 't')  || ($sufb4bo == 't') || ($wypb4bo == 't') || ($powb5sp == 't')  || ($popb5bo == 't') || ($psb5bo == 't')  || ($sufb5bo == 't') || ($wypb5bo == 't') || ($powb6sp == 't')  || ($popb6bo == 't') || ($psb6bo == 't')  || ($sufb6bo == 't') || ($wypb6bo == 't') || ($powb7sp == 't')  || ($popb7bo == 't') || ($psb7bo == 't')  || ($sufb7bo == 't') || ($wypb7bo == 't') || ($powb8sp == 't')  || ($popb8bo == 't') || ($psb8bo == 't')  || ($sufb8bo == 't') || ($wypb8bo == 't') || ($powb9sp == 't')  || ($popb9bo == 't') || ($psb9bo == 't')  || ($sufb9bo == 't') || ($wypb9bo == 't') || ($powb10sp == 't')  || ($popb10bo == 't') || ($psb10bo == 't')  || ($sufb10bo == 't') || ($wypb10bo == 't') || ($powb11sp == 't') || ($popb11bo == 't') || ($psb11bo == 't')  || ($sufb11bo == 't') || ($wypb11bo == 't') || ($powb12sp == 't')  || ($popb12bo == 't') || ($psb12bo == 't')  || ($sufb12bo == 't') || ($wypb12bo == 't')) {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

echo "<tr><td colspan=\"40\" height=\"7\" bgcolor=\"#5865E5\">";
echo "<span class=\"nag1wb\">";
echo "&nbsp;Premisess";
echo "</span>";
echo "</td></tr>";

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}
if (($powb1sp == 't')  || ($popb1bo == 't') || ($psb1bo == 't')  || ($sufb1bo == 't')) {
echo "<tr>"; 
}
if ($powb1sp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Meas. premises 1:</b><br>&nbsp;$powb1s m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($popb1bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Floor premises 1:</b><br>&nbsp;$popb1ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($psb1bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Walls premises 1:</b><br>&nbsp;$psb1ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($sufb1bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Ceiling premises 1:</b><br>&nbsp;$sufb1ps";
echo "</td>";

}

if (($powb1sp == 't')  || ($popb1bo == 't') || ($psb1bo == 't')  || ($sufb1bo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}


if ($wypb1bo == 't') {
echo "<tr>";
echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Equipment premises 1:</b><br>&nbsp;$wypb1ps";
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
echo "&nbsp;<b>Meas. premises 2:</b><br>&nbsp;$powb2s m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($popb2bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Floor premises 2:</b><br>&nbsp;$popb2ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($psb2bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Walls premises 2:</b><br>&nbsp;$psb2ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($sufb2bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Ceiling premises 2:</b><br>&nbsp;$sufb2ps";
echo "</td>";

}

if (($powb2sp == 't')  || ($popb2bo == 't') || ($psb2bo == 't')  || ($sufb2bo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}


if ($wypb2bo == 't') {
echo "<tr>";
echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Equipment premises 2:</b><br>&nbsp;$wypb2ps";
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
echo "&nbsp;<b>Meas. premises 3:</b><br>&nbsp;$powb3s m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($popb3bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Floor premises 3:</b><br>&nbsp;$popb3ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($psb3bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Walls premises 3:</b><br>&nbsp;$psb3ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($sufb3bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Ceiling premises 3:</b><br>&nbsp;$sufb3ps";
echo "</td>";

}

if (($powb3sp == 't')  || ($popb3bo == 't') || ($psb3bo == 't')  || ($sufb3bo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}


if ($wypb3bo == 't') {
echo "<tr>";
echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Equipment premises 3:</b><br>&nbsp;$wypb3ps";
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
echo "&nbsp;<b>Meas. premises 4:</b><br>&nbsp;$powb4s m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($popb4bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Floor premises 4:</b><br>&nbsp;$popb4ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($psb4bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Walls premises 4:</b><br>&nbsp;$psb4ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($sufb4bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Ceiling premises 4:</b><br>&nbsp;$sufb4ps";
echo "</td>";

}

if (($powb4sp == 't')  || ($popb4bo == 't') || ($psb4bo == 't')  || ($sufb4bo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}


if ($wypb4bo == 't') {
echo "<tr>";
echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Equipment premises 4:</b><br>&nbsp;$wypb4ps";
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
echo "&nbsp;<b>Meas. premises 5:</b><br>&nbsp;$powb5s m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($popb5bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Floor premises 5:</b><br>&nbsp;$popb5ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($psb5bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Walls premises 5:</b><br>&nbsp;$psb5ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($sufb5bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Ceiling premises 5:</b><br>&nbsp;$sufb5ps";
echo "</td>";

}

if (($powb5sp == 't')  || ($popb5bo == 't') || ($psb5bo == 't')  || ($sufb5bo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}


if ($wypb5bo == 't') {
echo "<tr>";
echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Equipment premises 5:</b><br>&nbsp;$wypb5ps";
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
echo "&nbsp;<b>Meas. premises 6:</b><br>&nbsp;$powb6s m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($popb6bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Floor premises 6:</b><br>&nbsp;$popb6ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($psb6bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Walls premises 6:</b><br>&nbsp;$psb6ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($sufb6bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Ceiling premises 6:</b><br>&nbsp;$sufb6ps";
echo "</td>";

}

if (($powb6sp == 't')  || ($popb6bo == 't') || ($psb6bo == 't')  || ($sufb6bo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}


if ($wypb6bo == 't') {
echo "<tr>";
echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Equipment premises 6:</b><br>&nbsp;$wypb6ps";
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
echo "&nbsp;<b>Meas. premises 7:</b><br>&nbsp;$powb7s m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($popb7bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Floor premises 7:</b><br>&nbsp;$popb7ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($psb7bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Walls premises 7:</b><br>&nbsp;$psb7ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($sufb7bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Ceiling premises 7:</b><br>&nbsp;$sufb7ps";
echo "</td>";

}

if (($powb7sp == 't')  || ($popb7bo == 't') || ($psb7bo == 't')  || ($sufb7bo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}


if ($wypb7bo == 't') {
echo "<tr>";
echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Equipment premises 7:</b><br>&nbsp;$wypb7ps";
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
echo "&nbsp;<b>Meas. premises 8:</b><br>&nbsp;$powb8s m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($popb8bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Floor premises 8:</b><br>&nbsp;$popb8ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($psb8bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Walls premises 8:</b><br>&nbsp;$psb8ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($sufb8bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Ceiling premises 8:</b><br>&nbsp;$sufb8ps";
echo "</td>";

}

if (($powb8sp == 't')  || ($popb8bo == 't') || ($psb8bo == 't')  || ($sufb8bo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}


if ($wypb8bo == 't') {
echo "<tr>";
echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Equipment premises 8:</b><br>&nbsp;$wypb8ps";
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
echo "&nbsp;<b>Meas. premises 9:</b><br>&nbsp;$powb9s m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($popb9bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Floor premises 9:</b><br>&nbsp;$popb9ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($psb9bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Walls premises 9:</b><br>&nbsp;$psb9ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($sufb9bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Ceiling premises 9:</b><br>&nbsp;$sufb9ps";
echo "</td>";

}

if (($powb9sp == 't')  || ($popb9bo == 't') || ($psb9bo == 't')  || ($sufb9bo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}


if ($wypb9bo == 't') {
echo "<tr>";
echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Equipment premises 9:</b><br>&nbsp;$wypb9ps";
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
echo "&nbsp;<b>Meas. premises 10:</b><br>&nbsp;$powb10s m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($popb10bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Floor premises 10:</b><br>&nbsp;$popb10ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($psb10bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Walls premises 10:</b><br>&nbsp;$psb10ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($sufb10bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Ceiling premises 10:</b><br>&nbsp;$sufb10ps";
echo "</td>";

}

if (($powb10sp == 't')  || ($popb10bo == 't') || ($psb10bo == 't')  || ($sufb10bo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}


if ($wypb10bo == 't') {
echo "<tr>";
echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Equipment premises 10:</b><br>&nbsp;$wypb10ps";
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
echo "&nbsp;<b>Meas. premises 11:</b><br>&nbsp;$powb11s m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($popb11bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Floor premises 11:</b><br>&nbsp;$popb11ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($psb11bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Walls premises 11:</b><br>&nbsp;$psb11ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($sufb11bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Ceiling premises 11:</b><br>&nbsp;$sufb11ps";
echo "</td>";

}


if (($powb11sp == 't')  || ($popb11bo == 't') || ($psb11bo == 't')  || ($sufb11bo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}


if ($wypb11bo == 't') {
echo "<tr>";
echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Equipment premises 11:</b><br>&nbsp;$wypb11ps";
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
echo "&nbsp;<b>Meas. premises 12:</b><br>&nbsp;$powb12s m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($popb12bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Floor premises 12:</b><br>&nbsp;$popb12ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($psb12bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Walls premises 12:</b><br>&nbsp;$psb12ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($sufb12bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Ceiling premises 12:</b><br>&nbsp;$sufb12ps";
echo "</td>";

}

if (($powb12sp == 't')  || ($popb12bo == 't') || ($psb12bo == 't')  || ($sufb12bo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}


if ($wypb12bo == 't') {
echo "<tr>";
echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Equipment premises 12:</b><br>&nbsp;$wypb12ps";
echo "</td>";
echo "</tr>";
}	

if ($wypb12bo == 't') {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}


$sqlpowss1 = "SELECT pps1, pps1_bo FROM tab_obi where id_d = '$nu';";	
	$resultpowss1 = @pg_Exec($conn, $sqlpowss1);
	$powss1s = pg_result($resultpowss1, 0, "pps1");
	$powss1sp = pg_result($resultpowss1, 0, "pps1_bo");

$sqlpopss1 = "SELECT pops1, pops1_bo FROM tab_obi where id_d = '$nu';";
			
			$resultpopss1 = @pg_Exec($conn, $sqlpopss1);
			$popss1s = pg_result($resultpopss1, 0, "pops1");
			$popss1bo = pg_result($resultpopss1, 0, "pops1_bo");
				
	$sqlpopss1s = "SELECT nazwa_pod_en FROM podlogi where id = '$popss1s';";
			
			$resultpopss1s = @pg_Exec($conn, $sqlpopss1s);
			$popss1ps = pg_result($resultpopss1s, 0, "nazwa_pod_en");

$sqlss1 = "SELECT pss1, pss1_bo FROM tab_obi where id_d = '$nu';";
			
			$resultss1 = @pg_Exec($conn, $sqlss1);
			$pss1s = pg_result($resultss1, 0, "pss1");
			$pss1bo = pg_result($resultss1, 0, "pss1_bo");
				
	$sqlss1s = "SELECT nazwa_sc_en FROM sciany where id = '$pss1s';";
			
			$resultss1s = @pg_Exec($conn, $sqlss1s);
			$pss1ps = pg_result($resultss1s, 0, "nazwa_sc_en");

$sqlsufs1 = "SELECT psus1, psus1_bo FROM tab_obi where id_d = '$nu';";
			
			$resultsufs1 = @pg_Exec($conn, $sqlsufs1);
			$sufs1s = pg_result($resultsufs1, 0, "psus1");
			$sufs1bo = pg_result($resultsufs1, 0, "psus1_bo");
				
	$sqlsufs1s = "SELECT nazwa_su_en FROM sufit where id = '$sufs1s';";
			
			$resultsufs1s = @pg_Exec($conn, $sqlsufs1s);
			$sufs1ps = pg_result($resultsufs1s, 0, "nazwa_su_en");

$sqlwyps1 = "SELECT wyps1, wyps1_bo FROM tab_obi where id_d = '$nu';";
			
			$resultwyps1 = @pg_Exec($conn, $sqlwyps1);
			$wyps1s = pg_result($resultwyps1, 0, "wyps1");
			$wyps1bo = pg_result($resultwyps1, 0, "wyps1_bo");
				
	$sqlwyps1s = "SELECT nazwa_wp_en FROM wyposazenie where id = '$wyps1s';";
			
			$resultwyps1s = @pg_Exec($conn, $sqlwyps1s);
			$wyps1ps = pg_result($resultwyps1s, 0, "nazwa_wp_en");

$sqlpowss2 = "SELECT pps2, pps2_bo FROM tab_obi where id_d = '$nu';";	
	$resultpowss2 = @pg_Exec($conn, $sqlpowss2);
	$powss2s = pg_result($resultpowss2, 0, "pps2");
	$powss2sp = pg_result($resultpowss2, 0, "pps2_bo");

$sqlpopss2 = "SELECT pops2, pops2_bo FROM tab_obi where id_d = '$nu';";
			
			$resultpopss2 = @pg_Exec($conn, $sqlpopss2);
			$popss2s = pg_result($resultpopss2, 0, "pops2");
			$popss2bo = pg_result($resultpopss2, 0, "pops2_bo");
				
	$sqlpopss2s = "SELECT nazwa_pod_en FROM podlogi where id = '$popss2s';";
			
			$resultpopss2s = @pg_Exec($conn, $sqlpopss2s);
			$popss2ps = pg_result($resultpopss2s, 0, "nazwa_pod_en");

$sqlss2 = "SELECT pss2, pss2_bo FROM tab_obi where id_d = '$nu';";
			
			$resultss2 = @pg_Exec($conn, $sqlss2);
			$pss2s = pg_result($resultss2, 0, "pss2");
			$pss2bo = pg_result($resultss2, 0, "pss2_bo");
				
	$sqlss2s = "SELECT nazwa_sc_en FROM sciany where id = '$pss2s';";
			
			$resultss2s = @pg_Exec($conn, $sqlss2s);
			$pss2ps = pg_result($resultss2s, 0, "nazwa_sc_en");

$sqlsufs2 = "SELECT psus2, psus2_bo FROM tab_obi where id_d = '$nu';";
			
			$resultsufs2 = @pg_Exec($conn, $sqlsufs2);
			$sufs2s = pg_result($resultsufs2, 0, "psus2");
			$sufs2bo = pg_result($resultsufs2, 0, "psus2_bo");
				
	$sqlsufs2s = "SELECT nazwa_su_en FROM sufit where id = '$sufs2s';";
			
			$resultsufs2s = @pg_Exec($conn, $sqlsufs2s);
			$sufs2ps = pg_result($resultsufs2s, 0, "nazwa_su_en");

$sqlwyps2 = "SELECT wyps2, wyps2_bo FROM tab_obi where id_d = '$nu';";
			
			$resultwyps2 = @pg_Exec($conn, $sqlwyps2);
			$wyps2s = pg_result($resultwyps2, 0, "wyps2");
			$wyps2bo = pg_result($resultwyps2, 0, "wyps2_bo");
				
	$sqlwyps2s = "SELECT nazwa_wp_en FROM wyposazenie where id = '$wyps2s';";
			
			$resultwyps2s = @pg_Exec($conn, $sqlwyps2s);
			$wyps2ps = pg_result($resultwyps2s, 0, "nazwa_wp_en");

$sqlpowss3 = "SELECT pps3, pps3_bo FROM tab_obi where id_d = '$nu';";	
	$resultpowss3 = @pg_Exec($conn, $sqlpowss3);
	$powss3s = pg_result($resultpowss3, 0, "pps3");
	$powss3sp = pg_result($resultpowss3, 0, "pps3_bo");

$sqlpopss3 = "SELECT pops3, pops3_bo FROM tab_obi where id_d = '$nu';";
			
			$resultpopss3 = @pg_Exec($conn, $sqlpopss3);
			$popss3s = pg_result($resultpopss3, 0, "pops3");
			$popss3bo = pg_result($resultpopss3, 0, "pops3_bo");
				
	$sqlpopss3s = "SELECT nazwa_pod_en FROM podlogi where id = '$popss3s';";
			
			$resultpopss3s = @pg_Exec($conn, $sqlpopss3s);
			$popss3ps = pg_result($resultpopss3s, 0, "nazwa_pod_en");

$sqlss3 = "SELECT pss3, pss3_bo FROM tab_obi where id_d = '$nu';";
			
			$resultss3 = @pg_Exec($conn, $sqlss3);
			$pss3s = pg_result($resultss3, 0, "pss3");
			$pss3bo = pg_result($resultss3, 0, "pss3_bo");
				
	$sqlss3s = "SELECT nazwa_sc_en FROM sciany where id = '$pss3s';";
			
			$resultss3s = @pg_Exec($conn, $sqlss3s);
			$pss3ps = pg_result($resultss3s, 0, "nazwa_sc_en");

$sqlsufs3 = "SELECT psus3, psus3_bo FROM tab_obi where id_d = '$nu';";
			
			$resultsufs3 = @pg_Exec($conn, $sqlsufs3);
			$sufs3s = pg_result($resultsufs3, 0, "psus3");
			$sufs3bo = pg_result($resultsufs3, 0, "psus3_bo");
				
	$sqlsufs3s = "SELECT nazwa_su_en FROM sufit where id = '$sufs3s';";
			
			$resultsufs3s = @pg_Exec($conn, $sqlsufs3s);
			$sufs3ps = pg_result($resultsufs3s, 0, "nazwa_su_en");

$sqlwyps3 = "SELECT wyps3, wyps3_bo FROM tab_obi where id_d = '$nu';";
			
			$resultwyps3 = @pg_Exec($conn, $sqlwyps3);
			$wyps3s = pg_result($resultwyps3, 0, "wyps3");
			$wyps3bo = pg_result($resultwyps3, 0, "wyps3_bo");
				
	$sqlwyps3s = "SELECT nazwa_wp_en FROM wyposazenie where id = '$wyps3s';";
			
			$resultwyps3s = @pg_Exec($conn, $sqlwyps3s);
			$wyps3ps = pg_result($resultwyps3s, 0, "nazwa_wp_en");

$sqlpowss4 = "SELECT pps4, pps4_bo FROM tab_obi where id_d = '$nu';";	
	$resultpowss4 = @pg_Exec($conn, $sqlpowss4);
	$powss4s = pg_result($resultpowss4, 0, "pps4");
	$powss4sp = pg_result($resultpowss4, 0, "pps4_bo");

$sqlpopss4 = "SELECT pops4, pops4_bo FROM tab_obi where id_d = '$nu';";
			
			$resultpopss4 = @pg_Exec($conn, $sqlpopss4);
			$popss4s = pg_result($resultpopss4, 0, "pops4");
			$popss4bo = pg_result($resultpopss4, 0, "pops4_bo");
				
	$sqlpopss4s = "SELECT nazwa_pod_en FROM podlogi where id = '$popss4s';";
			
			$resultpopss4s = @pg_Exec($conn, $sqlpopss4s);
			$popss4ps = pg_result($resultpopss4s, 0, "nazwa_pod_en");

$sqlss4 = "SELECT pss4, pss4_bo FROM tab_obi where id_d = '$nu';";
			
			$resultss4 = @pg_Exec($conn, $sqlss4);
			$pss4s = pg_result($resultss4, 0, "pss4");
			$pss4bo = pg_result($resultss4, 0, "pss4_bo");
				
	$sqlss4s = "SELECT nazwa_sc_en FROM sciany where id = '$pss4s';";
			
			$resultss4s = @pg_Exec($conn, $sqlss4s);
			$pss4ps = pg_result($resultss4s, 0, "nazwa_sc_en");

$sqlsufs4 = "SELECT psus4, psus4_bo FROM tab_obi where id_d = '$nu';";
			
			$resultsufs4 = @pg_Exec($conn, $sqlsufs4);
			$sufs4s = pg_result($resultsufs4, 0, "psus4");
			$sufs4bo = pg_result($resultsufs4, 0, "psus4_bo");
				
	$sqlsufs4s = "SELECT nazwa_su_en FROM sufit where id = '$sufs4s';";
			
			$resultsufs4s = @pg_Exec($conn, $sqlsufs4s);
			$sufs4ps = pg_result($resultsufs4s, 0, "nazwa_su_en");

$sqlwyps4 = "SELECT wyps4, wyps4_bo FROM tab_obi where id_d = '$nu';";
			
			$resultwyps4 = @pg_Exec($conn, $sqlwyps4);
			$wyps4s = pg_result($resultwyps4, 0, "wyps4");
			$wyps4bo = pg_result($resultwyps4, 0, "wyps4_bo");
				
	$sqlwyps4s = "SELECT nazwa_wp_en FROM wyposazenie where id = '$wyps4s';";
			
			$resultwyps4s = @pg_Exec($conn, $sqlwyps4s);
			$wyps4ps = pg_result($resultwyps4s, 0, "nazwa_wp_en");

$sqlpowss5 = "SELECT pps5, pps5_bo FROM tab_obi where id_d = '$nu';";	
	$resultpowss5 = @pg_Exec($conn, $sqlpowss5);
	$powss5s = pg_result($resultpowss5, 0, "pps5");
	$powss5sp = pg_result($resultpowss5, 0, "pps5_bo");

$sqlpopss5 = "SELECT pops5, pops5_bo FROM tab_obi where id_d = '$nu';";
			
			$resultpopss5 = @pg_Exec($conn, $sqlpopss5);
			$popss5s = pg_result($resultpopss5, 0, "pops5");
			$popss5bo = pg_result($resultpopss5, 0, "pops5_bo");
				
	$sqlpopss5s = "SELECT nazwa_pod_en FROM podlogi where id = '$popss5s';";
			
			$resultpopss5s = @pg_Exec($conn, $sqlpopss5s);
			$popss5ps = pg_result($resultpopss5s, 0, "nazwa_pod_en");

$sqlss5 = "SELECT pss5, pss5_bo FROM tab_obi where id_d = '$nu';";
			
			$resultss5 = @pg_Exec($conn, $sqlss5);
			$pss5s = pg_result($resultss5, 0, "pss5");
			$pss5bo = pg_result($resultss5, 0, "pss5_bo");
				
	$sqlss5s = "SELECT nazwa_sc_en FROM sciany where id = '$pss5s';";
			
			$resultss5s = @pg_Exec($conn, $sqlss5s);
			$pss5ps = pg_result($resultss5s, 0, "nazwa_sc_en");

$sqlsufs5 = "SELECT psus5, psus5_bo FROM tab_obi where id_d = '$nu';";
			
			$resultsufs5 = @pg_Exec($conn, $sqlsufs5);
			$sufs5s = pg_result($resultsufs5, 0, "psus5");
			$sufs5bo = pg_result($resultsufs5, 0, "psus5_bo");
				
	$sqlsufs5s = "SELECT nazwa_su_en FROM sufit where id = '$sufs5s';";
			
			$resultsufs5s = @pg_Exec($conn, $sqlsufs5s);
			$sufs5ps = pg_result($resultsufs5s, 0, "nazwa_su_en");

$sqlwyps5 = "SELECT wyps5, wyps5_bo FROM tab_obi where id_d = '$nu';";
			
			$resultwyps5 = @pg_Exec($conn, $sqlwyps5);
			$wyps5s = pg_result($resultwyps5, 0, "wyps5");
			$wyps5bo = pg_result($resultwyps5, 0, "wyps5_bo");
				
	$sqlwyps5s = "SELECT nazwa_wp_en FROM wyposazenie where id = '$wyps5s';";
			
			$resultwyps5s = @pg_Exec($conn, $sqlwyps5s);
			$wyps5ps = pg_result($resultwyps5s, 0, "nazwa_wp_en");

$sqlpowss6 = "SELECT pps6, pps6_bo FROM tab_obi where id_d = '$nu';";	
	$resultpowss6 = @pg_Exec($conn, $sqlpowss6);
	$powss6s = pg_result($resultpowss6, 0, "pps6");
	$powss6sp = pg_result($resultpowss6, 0, "pps6_bo");

$sqlpopss6 = "SELECT pops6, pops6_bo FROM tab_obi where id_d = '$nu';";
			
			$resultpopss6 = @pg_Exec($conn, $sqlpopss6);
			$popss6s = pg_result($resultpopss6, 0, "pops6");
			$popss6bo = pg_result($resultpopss6, 0, "pops6_bo");
				
	$sqlpopss6s = "SELECT nazwa_pod_en FROM podlogi where id = '$popss6s';";
			
			$resultpopss6s = @pg_Exec($conn, $sqlpopss6s);
			$popss6ps = pg_result($resultpopss6s, 0, "nazwa_pod_en");

$sqlss6 = "SELECT pss6, pss6_bo FROM tab_obi where id_d = '$nu';";
			
			$resultss6 = @pg_Exec($conn, $sqlss6);
			$pss6s = pg_result($resultss6, 0, "pss6");
			$pss6bo = pg_result($resultss6, 0, "pss6_bo");
				
	$sqlss6s = "SELECT nazwa_sc_en FROM sciany where id = '$pss6s';";
			
			$resultss6s = @pg_Exec($conn, $sqlss6s);
			$pss6ps = pg_result($resultss6s, 0, "nazwa_sc_en");

$sqlsufs6 = "SELECT psus6, psus6_bo FROM tab_obi where id_d = '$nu';";
			
			$resultsufs6 = @pg_Exec($conn, $sqlsufs6);
			$sufs6s = pg_result($resultsufs6, 0, "psus6");
			$sufs6bo = pg_result($resultsufs6, 0, "psus6_bo");
				
	$sqlsufs6s = "SELECT nazwa_su_en FROM sufit where id = '$sufs6s';";
			
			$resultsufs6s = @pg_Exec($conn, $sqlsufs6s);
			$sufs6ps = pg_result($resultsufs6s, 0, "nazwa_su_en");

$sqlwyps6 = "SELECT wyps6, wyps6_bo FROM tab_obi where id_d = '$nu';";
			
			$resultwyps6 = @pg_Exec($conn, $sqlwyps6);
			$wyps6s = pg_result($resultwyps6, 0, "wyps6");
			$wyps6bo = pg_result($resultwyps6, 0, "wyps6_bo");
				
	$sqlwyps6s = "SELECT nazwa_wp_en FROM wyposazenie where id = '$wyps6s';";
			
			$resultwyps6s = @pg_Exec($conn, $sqlwyps6s);
			$wyps6ps = pg_result($resultwyps6s, 0, "nazwa_wp_en");

$sqlpowss7 = "SELECT pps7, pps7_bo FROM tab_obi where id_d = '$nu';";	
	$resultpowss7 = @pg_Exec($conn, $sqlpowss7);
	$powss7s = pg_result($resultpowss7, 0, "pps7");
	$powss7sp = pg_result($resultpowss7, 0, "pps7_bo");

$sqlpopss7 = "SELECT pops7, pops7_bo FROM tab_obi where id_d = '$nu';";
			
			$resultpopss7 = @pg_Exec($conn, $sqlpopss7);
			$popss7s = pg_result($resultpopss7, 0, "pops7");
			$popss7bo = pg_result($resultpopss7, 0, "pops7_bo");
				
	$sqlpopss7s = "SELECT nazwa_pod_en FROM podlogi where id = '$popss7s';";
			
			$resultpopss7s = @pg_Exec($conn, $sqlpopss7s);
			$popss7ps = pg_result($resultpopss7s, 0, "nazwa_pod_en");

$sqlss7 = "SELECT pss7, pss7_bo FROM tab_obi where id_d = '$nu';";
			
			$resultss7 = @pg_Exec($conn, $sqlss7);
			$pss7s = pg_result($resultss7, 0, "pss7");
			$pss7bo = pg_result($resultss7, 0, "pss7_bo");
				
	$sqlss7s = "SELECT nazwa_sc_en FROM sciany where id = '$pss7s';";
			
			$resultss7s = @pg_Exec($conn, $sqlss7s);
			$pss7ps = pg_result($resultss7s, 0, "nazwa_sc_en");

$sqlsufs7 = "SELECT psus7, psus7_bo FROM tab_obi where id_d = '$nu';";
			
			$resultsufs7 = @pg_Exec($conn, $sqlsufs7);
			$sufs7s = pg_result($resultsufs7, 0, "psus7");
			$sufs7bo = pg_result($resultsufs7, 0, "psus7_bo");
				
	$sqlsufs7s = "SELECT nazwa_su_en FROM sufit where id = '$sufs7s';";
			
			$resultsufs7s = @pg_Exec($conn, $sqlsufs7s);
			$sufs7ps = pg_result($resultsufs7s, 0, "nazwa_su_en");

$sqlwyps7 = "SELECT wyps7, wyps7_bo FROM tab_obi where id_d = '$nu';";
			
			$resultwyps7 = @pg_Exec($conn, $sqlwyps7);
			$wyps7s = pg_result($resultwyps7, 0, "wyps7");
			$wyps7bo = pg_result($resultwyps7, 0, "wyps7_bo");
				
	$sqlwyps7s = "SELECT nazwa_wp_en FROM wyposazenie where id = '$wyps7s';";
			
			$resultwyps7s = @pg_Exec($conn, $sqlwyps7s);
			$wyps7ps = pg_result($resultwyps7s, 0, "nazwa_wp_en");

$sqlpowss8 = "SELECT pps8, pps8_bo FROM tab_obi where id_d = '$nu';";	
	$resultpowss8 = @pg_Exec($conn, $sqlpowss8);
	$powss8s = pg_result($resultpowss8, 0, "pps8");
	$powss8sp = pg_result($resultpowss8, 0, "pps8_bo");

$sqlpopss8 = "SELECT pops8, pops8_bo FROM tab_obi where id_d = '$nu';";
			
			$resultpopss8 = @pg_Exec($conn, $sqlpopss8);
			$popss8s = pg_result($resultpopss8, 0, "pops8");
			$popss8bo = pg_result($resultpopss8, 0, "pops8_bo");
				
	$sqlpopss8s = "SELECT nazwa_pod_en FROM podlogi where id = '$popss8s';";
			
			$resultpopss8s = @pg_Exec($conn, $sqlpopss8s);
			$popss8ps = pg_result($resultpopss8s, 0, "nazwa_pod_en");

$sqlss8 = "SELECT pss8, pss8_bo FROM tab_obi where id_d = '$nu';";
			
			$resultss8 = @pg_Exec($conn, $sqlss8);
			$pss8s = pg_result($resultss8, 0, "pss8");
			$pss8bo = pg_result($resultss8, 0, "pss8_bo");
				
	$sqlss8s = "SELECT nazwa_sc_en FROM sciany where id = '$pss8s';";
			
			$resultss8s = @pg_Exec($conn, $sqlss8s);
			$pss8ps = pg_result($resultss8s, 0, "nazwa_sc_en");

$sqlsufs8 = "SELECT psus8, psus8_bo FROM tab_obi where id_d = '$nu';";
			
			$resultsufs8 = @pg_Exec($conn, $sqlsufs8);
			$sufs8s = pg_result($resultsufs8, 0, "psus8");
			$sufs8bo = pg_result($resultsufs8, 0, "psus8_bo");
				
	$sqlsufs8s = "SELECT nazwa_su_en FROM sufit where id = '$sufs8s';";
			
			$resultsufs8s = @pg_Exec($conn, $sqlsufs8s);
			$sufs8ps = pg_result($resultsufs8s, 0, "nazwa_su_en");

$sqlwyps8 = "SELECT wyps8, wyps8_bo FROM tab_obi where id_d = '$nu';";
			
			$resultwyps8 = @pg_Exec($conn, $sqlwyps8);
			$wyps8s = pg_result($resultwyps8, 0, "wyps8");
			$wyps8bo = pg_result($resultwyps8, 0, "wyps8_bo");
				
	$sqlwyps8s = "SELECT nazwa_wp_en FROM wyposazenie where id = '$wyps8s';";
			
			$resultwyps8s = @pg_Exec($conn, $sqlwyps8s);
			$wyps8ps = pg_result($resultwyps8s, 0, "nazwa_wp_en");

$sqlpowss9 = "SELECT pps9, pps9_bo FROM tab_obi where id_d = '$nu';";	
	$resultpowss9 = @pg_Exec($conn, $sqlpowss9);
	$powss9s = pg_result($resultpowss9, 0, "pps9");
	$powss9sp = pg_result($resultpowss9, 0, "pps9_bo");

$sqlpopss9 = "SELECT pops9, pops9_bo FROM tab_obi where id_d = '$nu';";
			
			$resultpopss9 = @pg_Exec($conn, $sqlpopss9);
			$popss9s = pg_result($resultpopss9, 0, "pops9");
			$popss9bo = pg_result($resultpopss9, 0, "pops9_bo");
				
	$sqlpopss9s = "SELECT nazwa_pod_en FROM podlogi where id = '$popss9s';";
			
			$resultpopss9s = @pg_Exec($conn, $sqlpopss9s);
			$popss9ps = pg_result($resultpopss9s, 0, "nazwa_pod_en");

$sqlss9 = "SELECT pss9, pss9_bo FROM tab_obi where id_d = '$nu';";
			
			$resultss9 = @pg_Exec($conn, $sqlss9);
			$pss9s = pg_result($resultss9, 0, "pss9");
			$pss9bo = pg_result($resultss9, 0, "pss9_bo");
				
	$sqlss9s = "SELECT nazwa_sc_en FROM sciany where id = '$pss9s';";
			
			$resultss9s = @pg_Exec($conn, $sqlss9s);
			$pss9ps = pg_result($resultss9s, 0, "nazwa_sc_en");

$sqlsufs9 = "SELECT psus9, psus9_bo FROM tab_obi where id_d = '$nu';";
			
			$resultsufs9 = @pg_Exec($conn, $sqlsufs9);
			$sufs9s = pg_result($resultsufs9, 0, "psus9");
			$sufs9bo = pg_result($resultsufs9, 0, "psus9_bo");
				
	$sqlsufs9s = "SELECT nazwa_su_en FROM sufit where id = '$sufs9s';";
			
			$resultsufs9s = @pg_Exec($conn, $sqlsufs9s);
			$sufs9ps = pg_result($resultsufs9s, 0, "nazwa_su_en");

$sqlwyps9 = "SELECT wyps9, wyps9_bo FROM tab_obi where id_d = '$nu';";
			
			$resultwyps9 = @pg_Exec($conn, $sqlwyps9);
			$wyps9s = pg_result($resultwyps9, 0, "wyps9");
			$wyps9bo = pg_result($resultwyps9, 0, "wyps9_bo");
				
	$sqlwyps9s = "SELECT nazwa_wp_en FROM wyposazenie where id = '$wyps9s';";
			
			$resultwyps9s = @pg_Exec($conn, $sqlwyps9s);
			$wyps9ps = pg_result($resultwyps9s, 0, "nazwa_wp_en");

$sqlpowss10 = "SELECT pps10, pps10_bo FROM tab_obi where id_d = '$nu';";	
	$resultpowss10 = @pg_Exec($conn, $sqlpowss10);
	$powss10s = pg_result($resultpowss10, 0, "pps10");
	$powss10sp = pg_result($resultpowss10, 0, "pps10_bo");

$sqlpopss10 = "SELECT pops10, pops10_bo FROM tab_obi where id_d = '$nu';";
			
			$resultpopss10 = @pg_Exec($conn, $sqlpopss10);
			$popss10s = pg_result($resultpopss10, 0, "pops10");
			$popss10bo = pg_result($resultpopss10, 0, "pops10_bo");
				
	$sqlpopss10s = "SELECT nazwa_pod_en FROM podlogi where id = '$popss10s';";
			
			$resultpopss10s = @pg_Exec($conn, $sqlpopss10s);
			$popss10ps = pg_result($resultpopss10s, 0, "nazwa_pod_en");

$sqlss10 = "SELECT pss10, pss10_bo FROM tab_obi where id_d = '$nu';";
			
			$resultss10 = @pg_Exec($conn, $sqlss10);
			$pss10s = pg_result($resultss10, 0, "pss10");
			$pss10bo = pg_result($resultss10, 0, "pss10_bo");
				
	$sqlss10s = "SELECT nazwa_sc_en FROM sciany where id = '$pss10s';";
			
			$resultss10s = @pg_Exec($conn, $sqlss10s);
			$pss10ps = pg_result($resultss10s, 0, "nazwa_sc_en");

$sqlsufs10 = "SELECT psus10, psus10_bo FROM tab_obi where id_d = '$nu';";
			
			$resultsufs10 = @pg_Exec($conn, $sqlsufs10);
			$sufs10s = pg_result($resultsufs10, 0, "psus10");
			$sufs10bo = pg_result($resultsufs10, 0, "psus10_bo");
				
	$sqlsufs10s = "SELECT nazwa_su_en FROM sufit where id = '$sufs10s';";
			
			$resultsufs10s = @pg_Exec($conn, $sqlsufs10s);
			$sufs10ps = pg_result($resultsufs10s, 0, "nazwa_su_en");

$sqlwyps10 = "SELECT wyps10, wyps10_bo FROM tab_obi where id_d = '$nu';";
			
			$resultwyps10 = @pg_Exec($conn, $sqlwyps10);
			$wyps10s = pg_result($resultwyps10, 0, "wyps10");
			$wyps10bo = pg_result($resultwyps10, 0, "wyps10_bo");
				
	$sqlwyps10s = "SELECT nazwa_wp_en FROM wyposazenie where id = '$wyps10s';";
			
			$resultwyps10s = @pg_Exec($conn, $sqlwyps10s);
			$wyps10ps = pg_result($resultwyps10s, 0, "nazwa_wp_en");

$sqlpowss11 = "SELECT pps11, pps11_bo FROM tab_obi where id_d = '$nu';";	
	$resultpowss11 = @pg_Exec($conn, $sqlpowss11);
	$powss11s = pg_result($resultpowss11, 0, "pps11");
	$powss11sp = pg_result($resultpowss11, 0, "pps11_bo");

$sqlpopss11 = "SELECT pops11, pops11_bo FROM tab_obi where id_d = '$nu';";
			
			$resultpopss11 = @pg_Exec($conn, $sqlpopss11);
			$popss11s = pg_result($resultpopss11, 0, "pops11");
			$popss11bo = pg_result($resultpopss11, 0, "pops11_bo");
				
	$sqlpopss11s = "SELECT nazwa_pod_en FROM podlogi where id = '$popss11s';";
			
			$resultpopss11s = @pg_Exec($conn, $sqlpopss11s);
			$popss11ps = pg_result($resultpopss11s, 0, "nazwa_pod_en");

$sqlss11 = "SELECT pss11, pss11_bo FROM tab_obi where id_d = '$nu';";
			
			$resultss11 = @pg_Exec($conn, $sqlss11);
			$pss11s = pg_result($resultss11, 0, "pss11");
			$pss11bo = pg_result($resultss11, 0, "pss11_bo");
				
	$sqlss11s = "SELECT nazwa_sc_en FROM sciany where id = '$pss11s';";
			
			$resultss11s = @pg_Exec($conn, $sqlss11s);
			$pss11ps = pg_result($resultss11s, 0, "nazwa_sc_en");

$sqlsufs11 = "SELECT psus11, psus11_bo FROM tab_obi where id_d = '$nu';";
			
			$resultsufs11 = @pg_Exec($conn, $sqlsufs11);
			$sufs11s = pg_result($resultsufs11, 0, "psus11");
			$sufs11bo = pg_result($resultsufs11, 0, "psus11_bo");
				
	$sqlsufs11s = "SELECT nazwa_su_en FROM sufit where id = '$sufs11s';";
			
			$resultsufs11s = @pg_Exec($conn, $sqlsufs11s);
			$sufs11ps = pg_result($resultsufs11s, 0, "nazwa_su_en");

$sqlwyps11 = "SELECT wyps11, wyps11_bo FROM tab_obi where id_d = '$nu';";
			
			$resultwyps11 = @pg_Exec($conn, $sqlwyps11);
			$wyps11s = pg_result($resultwyps11, 0, "wyps11");
			$wyps11bo = pg_result($resultwyps11, 0, "wyps11_bo");
				
	$sqlwyps11s = "SELECT nazwa_wp_en FROM wyposazenie where id = '$wyps11s';";
			
			$resultwyps11s = @pg_Exec($conn, $sqlwyps11s);
			$wyps11ps = pg_result($resultwyps11s, 0, "nazwa_wp_en");

$sqlpowss12 = "SELECT pps12, pps12_bo FROM tab_obi where id_d = '$nu';";	
	$resultpowss12 = @pg_Exec($conn, $sqlpowss12);
	$powss12s = pg_result($resultpowss12, 0, "pps12");
	$powss12sp = pg_result($resultpowss12, 0, "pps12_bo");

$sqlpopss12 = "SELECT pops12, pops12_bo FROM tab_obi where id_d = '$nu';";
			
			$resultpopss12 = @pg_Exec($conn, $sqlpopss12);
			$popss12s = pg_result($resultpopss12, 0, "pops12");
			$popss12bo = pg_result($resultpopss12, 0, "pops12_bo");
				
	$sqlpopss12s = "SELECT nazwa_pod_en FROM podlogi where id = '$popss12s';";
			
			$resultpopss12s = @pg_Exec($conn, $sqlpopss12s);
			$popss12ps = pg_result($resultpopss12s, 0, "nazwa_pod_en");

$sqlss12 = "SELECT pss12, pss12_bo FROM tab_obi where id_d = '$nu';";
			
			$resultss12 = @pg_Exec($conn, $sqlss12);
			$pss12s = pg_result($resultss12, 0, "pss12");
			$pss12bo = pg_result($resultss12, 0, "pss12_bo");
				
	$sqlss12s = "SELECT nazwa_sc_en FROM sciany where id = '$pss12s';";
			
			$resultss12s = @pg_Exec($conn, $sqlss12s);
			$pss12ps = pg_result($resultss12s, 0, "nazwa_sc_en");

$sqlsufs12 = "SELECT psus12, psus12_bo FROM tab_obi where id_d = '$nu';";
			
			$resultsufs12 = @pg_Exec($conn, $sqlsufs12);
			$sufs12s = pg_result($resultsufs12, 0, "psus12");
			$sufs12bo = pg_result($resultsufs12, 0, "psus12_bo");
				
	$sqlsufs12s = "SELECT nazwa_su_en FROM sufit where id = '$sufs12s';";
			
			$resultsufs12s = @pg_Exec($conn, $sqlsufs12s);
			$sufs12ps = pg_result($resultsufs12s, 0, "nazwa_su_en");

$sqlwyps12 = "SELECT wyps12, wyps12_bo FROM tab_obi where id_d = '$nu';";
			
			$resultwyps12 = @pg_Exec($conn, $sqlwyps12);
			$wyps12s = pg_result($resultwyps12, 0, "wyps12");
			$wyps12bo = pg_result($resultwyps12, 0, "wyps12_bo");
				
	$sqlwyps12s = "SELECT nazwa_wp_en FROM wyposazenie where id = '$wyps12s';";
			
			$resultwyps12s = @pg_Exec($conn, $sqlwyps12s);
			$wyps12ps = pg_result($resultwyps12s, 0, "nazwa_wp_en");

if (($powss1sp == 't')  || ($popss1bo == 't') || ($pss1bo == 't')  || ($sufs1bo == 't') || ($wyps1bo == 't') || ($powss2sp == 't')  || ($popss2bo == 't') || ($pss2bo == 't')  || ($sufs2bo == 't') || ($wyps2bo == 't') || ($powss3sp == 't')  || ($popss3bo == 't') || ($pss3bo == 't')  || ($sufs3bo == 't') || ($wyps3bo == 't') || ($powss4sp == 't')  || ($popss4bo == 't') || ($pss4bo == 't')  || ($sufs4bo == 't') || ($wyps4bo == 't') || ($powss5sp == 't')  || ($popss5bo == 't') || ($pss5bo == 't')  || ($sufs5bo == 't') || ($wyps5bo == 't') || ($powss6sp == 't')  || ($popss6bo == 't') || ($pss6bo == 't')  || ($sufs6bo == 't') || ($wyps6bo == 't') || ($powss7sp == 't')  || ($popss7bo == 't') || ($pss7bo == 't')  || ($sufs7bo == 't') || ($wyps7bo == 't') || ($powss8sp == 't')  || ($popss8bo == 't') || ($pss8bo == 't')  || ($sufs8bo == 't') || ($wyps8bo == 't') || ($powss9sp == 't')  || ($popss9bo == 't') || ($pss9bo == 't')  || ($sufs9bo == 't') || ($wyps9bo == 't') || ($powss10sp == 't')  || ($popss10bo == 't') || ($pss10bo == 't')  || ($sufs10bo == 't') || ($wyps10bo == 't') || ($powss11sp == 't')  || ($popss11bo == 't') || ($pss11bo == 't')  || ($sufs11bo == 't') || ($wyps11bo == 't') || ($powss12sp == 't')  || ($popss12bo == 't') || ($pss12bo == 't')  || ($sufs12bo == 't') || ($wyps12bo == 't')) {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

echo "<tr><td colspan=\"40\" height=\"7\" bgcolor=\"#5865E5\">";
echo "<span class=\"nag1wb\">";
echo "&nbsp;Rooms";
echo "</span>";
echo "</td></tr>";

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}
if (($powss1sp == 't')  || ($popss1bo == 't') || ($pss1bo == 't')  || ($sufs1bo == 't')) {
echo "<tr>"; 
}
if ($powss1sp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Meas. room 1:</b><br>&nbsp;$powss1s m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($popss1bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Floor room 1:</b><br>&nbsp;$popss1ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($pss1bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Walls room 1:</b><br>&nbsp;$pss1ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($sufs1bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Ceiling room 1:</b><br>&nbsp;$sufs1ps";
echo "</td>";

}

if (($powss1sp == 't')  || ($popss1bo == 't') || ($pss1bo == 't')  || ($sufs1bo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}


if ($wyps1bo == 't') {
echo "<tr>";
echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Equipment room 1:</b><br>&nbsp;$wyps1ps";
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
echo "&nbsp;<b>Meas. room 2:</b><br>&nbsp;$powss2s m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($popss2bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Floor room 2:</b><br>&nbsp;$popss2ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($pss2bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Walls room 2:</b><br>&nbsp;$pss2ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($sufs2bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Ceiling room 2:</b><br>&nbsp;$sufs2ps";
echo "</td>";

}

if (($powss2sp == 't')  || ($popss2bo == 't') || ($pss2bo == 't')  || ($sufs2bo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}


if ($wyps2bo == 't') {
echo "<tr>";
echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Equipment room 2:</b><br>&nbsp;$wyps2ps";
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
echo "&nbsp;<b>Meas. room 3:</b><br>&nbsp;$powss3s m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($popss3bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Floor room 3:</b><br>&nbsp;$popss3ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($pss3bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Walls room 3:</b><br>&nbsp;$pss3ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($sufs3bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Ceiling room 3:</b><br>&nbsp;$sufs3ps";
echo "</td>";

}

if (($powss3sp == 't')  || ($popss3bo == 't') || ($pss3bo == 't')  || ($sufs3bo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}


if ($wyps3bo == 't') {
echo "<tr>";
echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Equipment room 3:</b><br>&nbsp;$wyps3ps";
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
echo "&nbsp;<b>Meas. room 4:</b><br>&nbsp;$powss4s m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($popss4bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Floor room 4:</b><br>&nbsp;$popss4ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($pss4bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Walls room 4:</b><br>&nbsp;$pss4ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($sufs4bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Ceiling room 4:</b><br>&nbsp;$sufs4ps";
echo "</td>";

}

if (($powss4sp == 't')  || ($popss4bo == 't') || ($pss4bo == 't')  || ($sufs4bo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}


if ($wyps4bo == 't') {
echo "<tr>";
echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Equipment room 4:</b><br>&nbsp;$wyps4ps";
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
echo "&nbsp;<b>Meas. room 5:</b><br>&nbsp;$powss5s m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($popss5bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Floor room 5:</b><br>&nbsp;$popss5ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($pss5bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Walls room 5:</b><br>&nbsp;$pss5ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($sufs5bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Ceiling room 5:</b><br>&nbsp;$sufs5ps";
echo "</td>";

}

if (($powss5sp == 't')  || ($popss5bo == 't') || ($pss5bo == 't')  || ($sufs5bo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}


if ($wyps5bo == 't') {
echo "<tr>";
echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Equipment room 5:</b><br>&nbsp;$wyps5ps";
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
echo "&nbsp;<b>Meas. room 6:</b><br>&nbsp;$powss6s m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($popss6bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Floor room 6:</b><br>&nbsp;$popss6ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($pss6bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Walls room 6:</b><br>&nbsp;$pss6ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($sufs6bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Ceiling room 6:</b><br>&nbsp;$sufs6ps";
echo "</td>";

}

if (($powss6sp == 't')  || ($popss6bo == 't') || ($pss6bo == 't')  || ($sufs6bo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}


if ($wyps6bo == 't') {
echo "<tr>";
echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Equipment room 6:</b><br>&nbsp;$wyps6ps";
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
echo "&nbsp;<b>Meas. room 7:</b><br>&nbsp;$powss7s m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($popss7bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Floor room 7:</b><br>&nbsp;$popss7ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($pss7bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Walls room 7:</b><br>&nbsp;$pss7ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($sufs7bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Ceiling room 7:</b><br>&nbsp;$sufs7ps";
echo "</td>";

}

if (($powss7sp == 't')  || ($popss7bo == 't') || ($pss7bo == 't')  || ($sufs7bo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}


if ($wyps7bo == 't') {
echo "<tr>";
echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Equipment room 7:</b><br>&nbsp;$wyps7ps";
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
echo "&nbsp;<b>Meas. room 8:</b><br>&nbsp;$powss8s m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($popss8bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Floor room 8:</b><br>&nbsp;$popss8ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($pss8bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Walls room 8:</b><br>&nbsp;$pss8ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($sufs8bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Ceiling room 8:</b><br>&nbsp;$sufs8ps";
echo "</td>";

}

if (($powss8sp == 't')  || ($popss8bo == 't') || ($pss8bo == 't')  || ($sufs8bo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}


if ($wyps8bo == 't') {
echo "<tr>";
echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Equipment room 8:</b><br>&nbsp;$wyps8ps";
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
echo "&nbsp;<b>Meas. room 9:</b><br>&nbsp;$powss9s m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($popss9bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Floor room 9:</b><br>&nbsp;$popss9ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($pss9bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Walls room 9:</b><br>&nbsp;$pss9ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($sufs9bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Ceiling room 9:</b><br>&nbsp;$sufs9ps";
echo "</td>";

}

if (($powss9sp == 't')  || ($popss9bo == 't') || ($pss9bo == 't')  || ($sufs9bo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}


if ($wyps9bo == 't') {
echo "<tr>";
echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Equipment room 9:</b><br>&nbsp;$wyps9ps";
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
echo "&nbsp;<b>Meas. room 10:</b><br>&nbsp;$powss10s m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($popss10bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Floor room 10:</b><br>&nbsp;$popss10ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($pss10bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Walls room 10:</b><br>&nbsp;$pss10ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($sufs10bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Ceiling room 10:</b><br>&nbsp;$sufs10ps";
echo "</td>";

}

if (($powss10sp == 't')  || ($popss10bo == 't') || ($pss10bo == 't')  || ($sufs10bo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}


if ($wyps10bo == 't') {
echo "<tr>";
echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Equipment room 10:</b><br>&nbsp;$wyps10ps";
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
echo "&nbsp;<b>Meas. room 11:</b><br>&nbsp;$powss11s m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($popss11bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Floor room 11:</b><br>&nbsp;$popss11ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($pss11bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Walls room 11:</b><br>&nbsp;$pss11ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($sufs11bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Ceiling room 11:</b><br>&nbsp;$sufs11ps";
echo "</td>";

}

if (($powss11sp == 't')  || ($popss11bo == 't') || ($pss11bo == 't')  || ($sufs11bo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}


if ($wyps11bo == 't') {
echo "<tr>";
echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Equipment room 11:</b><br>&nbsp;$wyps11ps";
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
echo "&nbsp;<b>Meas. room 12:</b><br>&nbsp;$powss12s m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($popss12bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Floor room 12:</b><br>&nbsp;$popss12ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($pss12bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Walls room 12:</b><br>&nbsp;$pss12ps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($sufs12bo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Ceiling room 12:</b><br>&nbsp;$sufs12ps";
echo "</td>";

}

if (($powss12sp == 't')  || ($popss12bo == 't') || ($pss12bo == 't')  || ($sufs12bo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}


if ($wyps12bo == 't') {
echo "<tr>";
echo "<td height=\"25\" colspan =\"20\">";
echo "&nbsp;<b>Equipment room 12:</b><br>&nbsp;$wyps12ps";
echo "</td>";
echo "</tr>";
}	

if ($wyps12bo == 't') {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}




	$sqlstaj = "SELECT staj, staj_bo FROM tab_obi where id_d = '$nu';";
			
			$resultstaj = @pg_Exec($conn, $sqlstaj);
			$stajs = pg_result($resultstaj, 0, "staj");
			$stajbo = pg_result($resultstaj, 0, "staj_bo");
				
	$sqlstajs = "SELECT nazwa_staj_en FROM stajnia where id = '$stajs';";
			
			$resultstajs = @pg_Exec($conn, $sqlstajs);
			$stajps = pg_result($resultstajs, 0, "nazwa_staj_en");


	$sqlpowstaj = "SELECT powstaj, powstaj_bo FROM tab_obi where id_d = '$nu';";	
		$resultpowstaj = @pg_Exec($conn, $sqlpowstaj);
			$powstajs = pg_result($resultpowstaj, 0, "powstaj");
			$powstajsp = pg_result($resultpowstaj, 0, "powstaj_bo");

	$sqlstod = "SELECT stod, stod_bo FROM tab_obi where id_d = '$nu';";
			
			$resultstod = @pg_Exec($conn, $sqlstod);
			$stods = pg_result($resultstod, 0, "stod");
			$stodbo = pg_result($resultstod, 0, "stod_bo");
				
	$sqlstods = "SELECT nazwa_stod_en FROM stodola where id = '$stods';";
			
			$resultstods = @pg_Exec($conn, $sqlstods);
			$stodps = pg_result($resultstods, 0, "nazwa_stod_en");

	$sqlpowstod = "SELECT powstod, powstod_bo FROM tab_obi where id_d = '$nu';";	
		$resultpowstod = @pg_Exec($conn, $sqlpowstod);
			$powstods = pg_result($resultpowstod, 0, "powstod");
			$powstodsp = pg_result($resultpowstod, 0, "powstod_bo");

	$sqlobor = "SELECT obor, obor_bo FROM tab_obi where id_d = '$nu';";
			
			$resultobor = @pg_Exec($conn, $sqlobor);
			$obors = pg_result($resultobor, 0, "obor");
			$oborbo = pg_result($resultobor, 0, "obor_bo");
				
	$sqlobors = "SELECT nazwa_obor FROM obora where id = '$obors';";
			
			$resultobors = @pg_Exec($conn, $sqlobors);
			$oborps = pg_result($resultobors, 0, "nazwa_obor");

	$sqlpowobor = "SELECT powobor, powobor_bo FROM tab_obi where id_d = '$nu';";	
		$resultpowobor = @pg_Exec($conn, $sqlpowobor);
			$powobors = pg_result($resultpowobor, 0, "powobor");
			$powoborsp = pg_result($resultpowobor, 0, "powobor_bo");

	$sqlkurn = "SELECT kurn, kurn_bo FROM tab_obi where id_d = '$nu';";
			
			$resultkurn = @pg_Exec($conn, $sqlkurn);
			$kurns = pg_result($resultkurn, 0, "kurn");
			$kurnbo = pg_result($resultkurn, 0, "kurn_bo");
				
	$sqlkurns = "SELECT nazwa_kurn_en FROM kurnik where id = '$kurns';";
			
			$resultkurns = @pg_Exec($conn, $sqlkurns);
			$kurnps = pg_result($resultkurns, 0, "nazwa_kurn_en");

	$sqlpowkurn = "SELECT powkurn, powkurn_bo FROM tab_obi where id_d = '$nu';";	
		$resultpowkurn = @pg_Exec($conn, $sqlpowkurn);
			$powkurns = pg_result($resultpowkurn, 0, "powkurn");
			$powkurnsp = pg_result($resultpowkurn, 0, "powkurn_bo");

	$sqlowcza = "SELECT owcza, owcza_bo FROM tab_obi where id_d = '$nu';";
			
			$resultowcza = @pg_Exec($conn, $sqlowcza);
			$owczas = pg_result($resultowcza, 0, "owcza");
			$owczabo = pg_result($resultowcza, 0, "owcza_bo");
				
	$sqlowczas = "SELECT nazwa_owcza_en FROM owczarnia where id = '$owczas';";
			
			$resultowczas = @pg_Exec($conn, $sqlowczas);
			$owczaps = pg_result($resultowczas, 0, "nazwa_owcza_en");

	$sqlpowowcza = "SELECT powowcza, powowcza_bo FROM tab_obi where id_d = '$nu';";	
		$resultpowowcza = @pg_Exec($conn, $sqlpowowcza);
			$powowczas = pg_result($resultpowowcza, 0, "powowcza");
			$powowczasp = pg_result($resultpowowcza, 0, "powowcza_bo");

	$sqlchle = "SELECT chle, chle_bo FROM tab_obi where id_d = '$nu';";
			
			$resultchle = @pg_Exec($conn, $sqlchle);
			$chles = pg_result($resultchle, 0, "chle");
			$chlebo = pg_result($resultchle, 0, "chle_bo");
				
	$sqlchles = "SELECT nazwa_chle_en FROM chlewnia where id = '$chles';";
			
			$resultchles = @pg_Exec($conn, $sqlchles);
			$chleps = pg_result($resultchles, 0, "nazwa_chle_en");

	$sqlpowchle = "SELECT powchle, powchle_bo FROM tab_obi where id_d = '$nu';";	
		$resultpowchle = @pg_Exec($conn, $sqlpowchle);
			$powchles = pg_result($resultpowchle, 0, "powchle");
			$powchlesp = pg_result($resultpowchle, 0, "powchle_bo");

if (($stajbo == 't')  || ($powstajsp == 't') || ($stodbo == 't')  || ($powstodsp == 't') || ($oborbo == 't') || ($powoborsp == 't')  || ($kurnbo == 't') || ($powkurnsp == 't')  || ($owczabo == 't') || ($powowczasp == 't') || ($chlebo == 't')  || ($powchlesp == 't')) {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

echo "<tr><td colspan=\"40\" height=\"7\" bgcolor=\"#5865E5\">";
echo "<span class=\"nag1wb\">";
echo "&nbsp;Outhouses";
echo "</span>";
echo "</td></tr>";

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}
if (($stajbo == 't')  || ($powstajsp == 't') || ($stodbo == 't')  || ($powstodsp == 't')) {
echo "<tr>"; 
}
if ($stajbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Stable:</b><br>&nbsp;$stajps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($powstajsp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Meas. stable:</b><br>&nbsp;$powstajs m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($stodbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Barn:</b><br>&nbsp;$stodps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($powstodsp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Meas. barn:</b><br>&nbsp;$powstods m2";
echo "</td>";

}

if (($stajbo == 't')  || ($powstajsp == 't') || ($stodbo == 't')  || ($powstodsp == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}	

if (($oborbo == 't')  || ($powoborsp == 't') || ($kurnbo == 't')  || ($powkurnsp == 't')) {
echo "<tr>"; 
}
if ($oborbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Cow-shed:</b><br>&nbsp;$oborps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($powoborsp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Meas. cow-shed:</b><br>&nbsp;$powobors m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($kurnbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Henhouse:</b><br>&nbsp;$kurnps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($powkurnsp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Meas. henhouse:</b><br>&nbsp;$powkurns m2";
echo "</td>";

}

if (($oborbo == 't')  || ($powoborsp == 't') || ($kurnbo == 't')  || ($powkurnsp == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}	

if (($owczabo == 't')  || ($powowczasp == 't') || ($chlebo == 't')  || ($powchlesp == 't')) {
echo "<tr>"; 
}
if ($owczabo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Sheepfold:</b><br>&nbsp;$owczaps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($powowczasp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Meas. sheepfold:</b><br>&nbsp;$powowczas m2";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($chlebo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pig farm:</b><br>&nbsp;$chleps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($powchlesp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Meas. pig farm:</b><br>&nbsp;$powchles m2";
echo "</td>";

}

if (($owczabo == 't')  || ($powowczasp == 't') || ($chlebo == 't')  || ($powchlesp == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}	


	$sqlgror = "SELECT gror, gror_bo FROM tab_obi where id_d = '$nu';";
			
			$resultgror = @pg_Exec($conn, $sqlgror);
			$grors = pg_result($resultgror, 0, "gror");
			$grorbo = pg_result($resultgror, 0, "gror_bo");
				
	$sqlgrors = "SELECT nazwa_gror_en FROM orne where id = '$grors';";
			
			$resultgrors = @pg_Exec($conn, $sqlgrors);
			$grorps = pg_result($resultgrors, 0, "nazwa_gror_en");
	
	$sqlpowgror = "SELECT powgror, powgror_bo FROM tab_obi where id_d = '$nu';";	
		$resultpowgror = @pg_Exec($conn, $sqlpowgror);
			$powgrors = pg_result($resultpowgror, 0, "powgror");
			$powgrorsp = pg_result($resultpowgror, 0, "powgror_bo");

	$sqlpast = "SELECT past, past_bo FROM tab_obi where id_d = '$nu';";
			
			$resultpast = @pg_Exec($conn, $sqlpast);
			$pasts = pg_result($resultpast, 0, "past");
			$pastbo = pg_result($resultpast, 0, "past_bo");
				
	$sqlpasts = "SELECT nazwa_past_en FROM pastwiska where id = '$pasts';";
			
			$resultpasts = @pg_Exec($conn, $sqlpasts);
			$pastps = pg_result($resultpasts, 0, "nazwa_past_en");

	$sqlpowpast = "SELECT powpast, powpast_bo FROM tab_obi where id_d = '$nu';";	
		$resultpowpast = @pg_Exec($conn, $sqlpowpast);
			$powpasts = pg_result($resultpowpast, 0, "powpast");
			$powpastsp = pg_result($resultpowpast, 0, "powpast_bo");

	$sqllaka = "SELECT laka, laka_bo FROM tab_obi where id_d = '$nu';";
			
			$resultlaka = @pg_Exec($conn, $sqllaka);
			$lakas = pg_result($resultlaka, 0, "laka");
			$lakabo = pg_result($resultlaka, 0, "laka_bo");
				
	$sqllakas = "SELECT nazwa_laka_en FROM laka where id = '$lakas';";
			
			$resultlakas = @pg_Exec($conn, $sqllakas);
			$lakaps = pg_result($resultlakas, 0, "nazwa_laka_en");
	
	$sqlpowlaka = "SELECT powlaka, powlaka_bo FROM tab_obi where id_d = '$nu';";	
		$resultpowlaka = @pg_Exec($conn, $sqlpowlaka);
			$powlakas = pg_result($resultpowlaka, 0, "powlaka");
			$powlakasp = pg_result($resultpowlaka, 0, "powlaka_bo");

	$sqllasy = "SELECT lasy, lasy_bo FROM tab_obi where id_d = '$nu';";
			
			$resultlasy = @pg_Exec($conn, $sqllasy);
			$lasys = pg_result($resultlasy, 0, "lasy");
			$lasybo = pg_result($resultlasy, 0, "lasy_bo");
				
	$sqllasys = "SELECT nazwa_lasy_en FROM lasy where id = '$lasys';";
			
			$resultlasys = @pg_Exec($conn, $sqllasys);
			$lasyps = pg_result($resultlasys, 0, "nazwa_lasy_en");
			
	$sqlpowlasy = "SELECT powlasy, powlasy_bo FROM tab_obi where id_d = '$nu';";	
		$resultpowlasy = @pg_Exec($conn, $sqlpowlasy);
			$powlasys = pg_result($resultpowlasy, 0, "powlasy");
			$powlasysp = pg_result($resultpowlasy, 0, "powlasy_bo");

	$sqlnieuzy = "SELECT nieuzy, nieuzy_bo FROM tab_obi where id_d = '$nu';";
			
			$resultnieuzy = @pg_Exec($conn, $sqlnieuzy);
			$nieuzys = pg_result($resultnieuzy, 0, "nieuzy");
			$nieuzybo = pg_result($resultnieuzy, 0, "nieuzy_bo");
				
	$sqlnieuzys = "SELECT nazwa_nieuzy_en FROM nieuzytki where id = '$nieuzys';";
			
			$resultnieuzys = @pg_Exec($conn, $sqlnieuzys);
			$nieuzyps = pg_result($resultnieuzys, 0, "nazwa_nieuzy_en");
			
	$sqlpownieuzy = "SELECT pownieuzy, pownieuzy_bo FROM tab_obi where id_d = '$nu';";	
		$resultpownieuzy = @pg_Exec($conn, $sqlpownieuzy);
			$pownieuzys = pg_result($resultpownieuzy, 0, "pownieuzy");
			$pownieuzysp = pg_result($resultpownieuzy, 0, "pownieuzy_bo");

	$sqlgrin = "SELECT grin, grin_bo FROM tab_obi where id_d = '$nu';";
			
			$resultgrin = @pg_Exec($conn, $sqlgrin);
			$grins = pg_result($resultgrin, 0, "grin");
			$grinbo = pg_result($resultgrin, 0, "grin_bo");
				
	$sqlgrins = "SELECT nazwa_grin_en FROM ginne where id = '$grins';";
			
			$resultgrins = @pg_Exec($conn, $sqlgrins);
			$grinps = pg_result($resultgrins, 0, "nazwa_grin_en");
	
	$sqlpowgrin = "SELECT powgrin, powgrin_bo FROM tab_obi where id_d = '$nu';";	
		$resultpowgrin = @pg_Exec($conn, $sqlpowgrin);
			$powgrins = pg_result($resultpowgrin, 0, "powgrin");
			$powgrinsp = pg_result($resultpowgrin, 0, "powgrin_bo");




if (($grorbo == 't')  || ($powgrorsp == 't') || ($pastbo == 't')  || ($powpastsp == 't') || ($lakabo == 't') || ($powlakasp == 't')  || ($lasybo == 't') || ($powlasysp == 't')  || ($nieuzybo == 't') || ($pownieuzysp == 't') || ($grinbo == 't')  || ($powgrinsp == 't')) {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

echo "<tr><td colspan=\"40\" height=\"7\" bgcolor=\"#5865E5\">";
echo "<span class=\"nag1wb\">";
echo "&nbsp;Agricultural areas";
echo "</span>";
echo "</td></tr>";

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}
if (($grorbo == 't')  || ($powgrorsp == 't') || ($pastbo == 't')  || ($powpastsp == 't')) {
echo "<tr>"; 
}
if ($grorbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Arable area:</b><br>&nbsp;$grorps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($powgrorsp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Meas. arable area:</b><br>&nbsp;$powgrors ar";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($pastbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Pasturage:</b><br>&nbsp;$pastps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($powpastsp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Meas. pasturage:</b><br>&nbsp;$powpasts ar";
echo "</td>";

}

if (($grorbo == 't')  || ($powgrorsp == 't') || ($pastbo == 't')  || ($powpastsp == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}

if (($lakabo == 't')  || ($powlakasp == 't') || ($lasybo == 't')  || ($powlasysp == 't')) {
echo "<tr>"; 
}
if ($lakabo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Meadow:</b><br>&nbsp;$lakaps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($powlakasp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Meas. meadow:</b><br>&nbsp;$powlakas ar";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($lasybo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Forest:</b><br>&nbsp;$lasyps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($powlasysp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Meas. forest:</b><br>&nbsp;$powlasys ar";
echo "</td>";

}

if (($lakabo == 't')  || ($powlakasp == 't') || ($lasybo == 't')  || ($powlasysp == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}
if (($nieuzybo == 't')  || ($pownieuzysp == 't') || ($grinbo == 't')  || ($powgrinsp == 't')) {
echo "<tr>"; 
}
if ($nieuzybo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Fallows:</b><br>&nbsp;$nieuzyps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($pownieuzysp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Meas. fallows:</b><br>&nbsp;$pownieuzys ar";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($grinbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Other grounds:</b><br>&nbsp;$grinps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($powgrinsp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Meas. other grounds:</b><br>&nbsp;$powgrins ar";
echo "</td>";

}

if (($nieuzybo == 't')  || ($pownieuzysp == 't') || ($grinbo == 't')  || ($powgrinsp == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}




$sqlrobu = "SELECT rr_b, rr_b_bo FROM tab_obi where id_d = '$nu';";
			
			$resultrobu = @pg_Exec($conn, $sqlrobu);
			$robus = pg_result($resultrobu, 0, "rr_b");
			$robubo = pg_result($resultrobu, 0, "rr_b_bo");
				
	$sqlrobus = "SELECT nazwa_b_en FROM rodzaj_b where id = '$robus';";
			
			$resultrobus = @pg_Exec($conn, $sqlrobus);
			$robups = pg_result($resultrobus, 0, "nazwa_b_en");


$sqltechb = "SELECT teb_d, teb_d_bo FROM tab_obi where id_d = '$nu';";
			
			$resulttechb = @pg_Exec($conn, $sqltechb);
			$techbs = pg_result($resulttechb, 0, "teb_d");
			$techbbo = pg_result($resulttechb, 0, "teb_d_bo");
				
	$sqltechbs = "SELECT nazwat_b_en FROM techno_b where id = '$techbs';";
			
			$resulttechbs = @pg_Exec($conn, $sqltechbs);
			$techbps = pg_result($resulttechbs, 0, "nazwat_b_en");

$sqlmatb = "SELECT mat_d, mat_d_bo FROM tab_obi where id_d = '$nu';";
			
			$resultmatb = @pg_Exec($conn, $sqlmatb);
			$matbs = pg_result($resultmatb, 0, "mat_d");
			$matbbo = pg_result($resultmatb, 0, "mat_d_bo");
				
	$sqlmatbs = "SELECT nazwa_m_en FROM material_b where id = '$matbs';";
			
			$resultmatbs = @pg_Exec($conn, $sqlmatbs);
			$matbps = pg_result($resultmatbs, 0, "nazwa_m_en");

$sqldachd = "SELECT kdach_d, kdach_d_bo FROM tab_obi where id_d = '$nu';";
			
			$resultdachd = @pg_Exec($conn, $sqldachd);
			$dachds = pg_result($resultdachd, 0, "kdach_d");
			$dachdbo = pg_result($resultdachd, 0, "kdach_d_bo");
				
	$sqldachds = "SELECT nazwa_da_en FROM dach where id = '$dachds';";
			
			$resultkdachds = @pg_Exec($conn, $sqldachds);
			$dachdps = pg_result($resultkdachds, 0, "nazwa_da_en");

$sqlrokbu = "SELECT rok_d, rok_d_bo FROM tab_obi where id_d = '$nu';";	
	$resultrokbu = @pg_Exec($conn, $sqlrokbu);
	$rokbus = pg_result($resultrokbu, 0, "rok_d");
	$rokbusp = pg_result($resultrokbu, 0, "rok_d_bo");

$sqlwysok = "SELECT wo_d, wo_d_bo FROM tab_obi where id_d = '$nu';";
			
			$resultwysok = @pg_Exec($conn, $sqlwysok);
			$wysoks = pg_result($resultwysok, 0, "wo_d");
			$wysokbo = pg_result($resultwysok, 0, "wo_d_bo");
				
	$sqlwysoks = "SELECT nazwa_wy_en FROM wystawka_o where id = '$wysoks';";
			
			$resultwysoks = @pg_Exec($conn, $sqlwysoks);
			$wysokps = pg_result($resultwysoks, 0, "nazwa_wy_en");	

$sqlwyspo = "SELECT ws_d, ws_d_bo FROM tab_obi where id_d = '$nu';";	
	$resultwyspo = @pg_Exec($conn, $sqlwyspo);
	$wyspos = pg_result($resultwyspo, 0, "ws_d");
	$wysposp = pg_result($resultwyspo, 0, "ws_d_bo");	


	$sqlokna = "SELECT okn_d, okn_d_bo FROM tab_obi where id_d = '$nu';";
			
			$resultokna = @pg_Exec($conn, $sqlokna);
			$oknas = pg_result($resultokna, 0, "okn_d");
			$oknabo = pg_result($resultokna, 0, "okn_d_bo");
				
	$sqloknas = "SELECT nazwa_ok_en FROM okna where id = '$oknas';";
			
			$resultoknas = @pg_Exec($conn, $sqloknas);
			$oknaps = pg_result($resultoknas, 0, "nazwa_ok_en");


if (($robubo == 't') || ($techbbo == 't') || ($matbbo == 't') || ($dachdbo == 't')  || ($rokbusp == 't') || ($wysokbo == 't')  || ($wysposp == 't') || ($oknabo == 't')) {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
echo "<tr><td colspan=\"40\" height=\"7\" bgcolor=\"#5865E5\">";
echo "<span class=\"nag1wb\">";
echo "&nbsp;Technical information";
echo "</span>";
echo "</td></tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}
if (($robubo == 't') || ($techbbo == 't') || ($matbbo == 't') || ($dachdbo == 't')) {
echo "<tr>"; 
}
if ($robubo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Kind of the building:</b><br>&nbsp;$robups";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

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
echo "&nbsp;<b>Year of the construction:</b><br>&nbsp;$rokbus";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

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

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Windows:</b><br>&nbsp;$oknaps";
echo "</td>";

}

if (($rokbusp == 't') || ($wysokbo == 't')  || ($wysposp == 't') || ($oknabo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}


$sqlkszdz = "SELECT ksdzi_d, ksdzi_d_bo FROM tab_obi where id_d = '$nu';";
			
			$resultkszdz = @pg_Exec($conn, $sqlkszdz);
			$kszdzs = pg_result($resultkszdz, 0, "ksdzi_d");
			$kszdzbo = pg_result($resultkszdz, 0, "ksdzi_d_bo");
				
	$sqlkszdzs = "SELECT nazwa_dz_en FROM dzialka where id = '$kszdzs';";
			
			$resultkszdzs = @pg_Exec($conn, $sqlkszdzs);
			$kszdzps = pg_result($resultkszdzs, 0, "nazwa_dz_en");


$sqlszdz = "SELECT szdzi_d, szdzi_d_bo FROM tab_obi where id_d = '$nu';";	
	$resultszdz = @pg_Exec($conn, $sqlszdz);
	$szdzis = pg_result($resultszdz, 0, "szdzi_d");
	$szdzisp = pg_result($resultszdz, 0, "szdzi_d_bo");

$sqldldz = "SELECT dldz_d, dldz_d_bo FROM tab_obi where id_d = '$nu';";	
	$resultdldz = @pg_Exec($conn, $sqldldz);
	$dldzs = pg_result($resultdldz, 0, "dldz_d");
	$dldzsp = pg_result($resultdldz, 0, "dldz_d_bo");

$sqlnardz = "SELECT dzinar_d, dzinar_d_bo FROM tab_obi where id_d = '$nu';";
			
			$resultnardz = @pg_Exec($conn, $sqlnardz);
			$nardzs = pg_result($resultnardz, 0, "dzinar_d");
			$nardzbo = pg_result($resultnardz, 0, "dzinar_d_bo");
				
	$sqlnardzs = "SELECT nazwa_nar_en FROM dzialka_nar where id = '$nardzs';";
			
			$resultnardzs = @pg_Exec($conn, $sqlnardzs);
			$nardzps = pg_result($resultnardzs, 0, "nazwa_nar_en");

$sqlogrdz = "SELECT dziogr_d, dziogr_d_bo FROM tab_obi where id_d = '$nu';";
			
			$resultogrdz = @pg_Exec($conn, $sqlogrdz);
			$ogrdzs = pg_result($resultogrdz, 0, "dziogr_d");
			$ogrdzbo = pg_result($resultogrdz, 0, "dziogr_d_bo");
				
	$sqlogrdzs = "SELECT nazwa_og_en FROM dzialka_og where id = '$ogrdzs';";
			
			$resultogrdzs = @pg_Exec($conn, $sqlogrdzs);
			$ogrdzps = pg_result($resultogrdzs, 0, "nazwa_og_en");


	$sqluksz = "SELECT uksz_d, uksz_d_bo FROM tab_obi where id_d = '$nu';";
			
			$resultuksz = @pg_Exec($conn, $sqluksz);
			$ukszs = pg_result($resultuksz, 0, "uksz_d");
			$ukszbo = pg_result($resultuksz, 0, "uksz_d_bo");
				
	$sqlukszs = "SELECT nazwa_uk_en FROM dzialka_uk where id = '$ukszs';";
			
			$resultukszs = @pg_Exec($conn, $sqlukszs);
			$ukszps = pg_result($resultukszs, 0, "nazwa_uk_en");

$sqlzad = "SELECT zaddzi_d, zaddzi_d_bo FROM tab_obi where id_d = '$nu';";
			
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


	$sqlogrze = "SELECT ogrz_d, ogrz_d_bo FROM tab_obi where id_d = '$nu';";
			
			$resultogrze = @pg_Exec($conn, $sqlogrze);
			$ogrzes = pg_result($resultogrze, 0, "ogrz_d");
			$ogrzebo = pg_result($resultogrze, 0, "ogrz_d_bo");
				
	$sqlogrzes = "SELECT nazwa_grz_en FROM ogrzewanie where id = '$ogrzes';";
			
			$resultogrzes = @pg_Exec($conn, $sqlogrzes);
			$ogrzeps = pg_result($resultogrzes, 0, "nazwa_grz_en");
	
$sqlciepwo = "SELECT ciewod_d, ciewod_d_bo FROM tab_obi where id_d = '$nu';";
			
			$resultciepwo = @pg_Exec($conn, $sqlciepwo);
			$ciepwos = pg_result($resultciepwo, 0, "ciewod_d");
			$ciepwobo = pg_result($resultciepwo, 0, "ciewod_d_bo");
				
	$sqlciepwos = "SELECT nazwa_wo_en FROM ciepla_woda where id = '$ciepwos';";
			
			$resultciepwos = @pg_Exec($conn, $sqlciepwos);
			$ciepwops = pg_result($resultciepwos, 0, "nazwa_wo_en");

$sqlsila = "SELECT sila_d, sila_d_bo FROM tab_obi where id_d = '$nu';";
			
			$resultsila = @pg_Exec($conn, $sqlsila);
			$silas = pg_result($resultsila, 0, "sila_d");
			$silabo = pg_result($resultsila, 0, "sila_d_bo");
				
	$sqlsilas = "SELECT nazwa_si_en FROM sila where id = '$silas';";
			
			$resultsilas = @pg_Exec($conn, $sqlsilas);
			$silaps = pg_result($resultsilas, 0, "nazwa_si_en");

$sqlmoc = "SELECT moc_d, moc_d_bo FROM tab_obi where id_d = '$nu';";	
	$resultmoc = @pg_Exec($conn, $sqlmoc);
	$mocs = pg_result($resultmoc, 0, "moc_d");
	$mocsp = pg_result($resultmoc, 0, "moc_d_bo");

$sqlwoda = "SELECT wod_d, wod_d_bo FROM tab_obi where id_d = '$nu';";
			
			$resultwodat = @pg_Exec($conn, $sqlwoda);
			$wodas = pg_result($resultwodat, 0, "wod_d");
			$wodabo = pg_result($resultwodat, 0, "wod_d_bo");
				
	$sqlwodas = "SELECT nazwa_wo_en FROM woda where id = '$wodas';";
			
			$resultwodas = @pg_Exec($conn, $sqlwodas);
			$wodaps = pg_result($resultwodas, 0, "nazwa_wo_en");

$sqlgaz = "SELECT gaz_d, gaz_d_bo FROM tab_obi where id_d = '$nu';";
			
			$resultgaz = @pg_Exec($conn, $sqlgaz);
			$gazs = pg_result($resultgaz, 0, "gaz_d");
			$gazbo = pg_result($resultgaz, 0, "gaz_d_bo");
				
	$sqlgazs = "SELECT nazwa_g_en FROM gaz where id = '$gazs';";
			
			$resultgazs = @pg_Exec($conn, $sqlgazs);
			$gazps = pg_result($resultgazs, 0, "nazwa_g_en");

$sqlkanal = "SELECT kanal_d, kanal_d_bo FROM tab_obi where id_d = '$nu';";
			
			$resultkanal = @pg_Exec($conn, $sqlkanal);
			$kanals = pg_result($resultkanal, 0, "kanal_d");
			$kanalbo = pg_result($resultkanal, 0, "kanal_d_bo");
				
	$sqlkanals = "SELECT nazwa_ka_en FROM kanaliza where id = '$kanals';";
			
			$resultkanals = @pg_Exec($conn, $sqlkanals);
			$kanalps = pg_result($resultkanals, 0, "nazwa_ka_en");

$sqltel = "SELECT tel_d, tel_d_bo FROM tab_obi where id_d = '$nu';";
			
			$resulttel = @pg_Exec($conn, $sqltel);
			$tels = pg_result($resulttel, 0, "tel_d");
			$telbo = pg_result($resulttel, 0, "tel_d_bo");
				
	$sqltels = "SELECT nazwa_te_en FROM telefon where id = '$tels';";
			
			$resulttels = @pg_Exec($conn, $sqltels);
			$telps = pg_result($resulttels, 0, "nazwa_te_en");

$sqlkabl = "SELECT siecka_d, siecka_d_bo FROM tab_obi where id_d = '$nu';";
			
			$resultkabl = @pg_Exec($conn, $sqlkabl);
			$kabls = pg_result($resultkabl, 0, "siecka_d");
			$kablbo = pg_result($resultkabl, 0, "siecka_d_bo");
				
	$sqlkabls = "SELECT nazwa_kab_en FROM kablowa where id = '$kabls';";
			
			$resultkabls = @pg_Exec($conn, $sqlkabls);
			$kablps = pg_result($resultkabls, 0, "nazwa_kab_en");

$sqlantena = "SELECT antena_d, antena_d_bo FROM tab_obi where id_d = '$nu';";
			
			$resultantena = @pg_Exec($conn, $sqlantena);
			$antenas = pg_result($resultantena, 0, "antena_d");
			$antenabo = pg_result($resultantena, 0, "antena_d_bo");
				
	$sqlantenas = "SELECT nazwa_an_en FROM antena where id = '$antenas';";
			
			$resultantenas = @pg_Exec($conn, $sqlantenas);
			$antenaps = pg_result($resultantenas, 0, "nazwa_an_en");

$sqlsiec = "SELECT siecint_d, siecint_d_bo FROM tab_obi where id_d = '$nu';";
			
			$resultsiec = @pg_Exec($conn, $sqlsiec);
			$siecs = pg_result($resultsiec, 0, "siecint_d");
			$siecbo = pg_result($resultsiec, 0, "siecint_d_bo");
				
	$sqlsiecs = "SELECT nazwa_siec_en FROM siec_inter where id = '$siecs';";
			
			$resultsiecs = @pg_Exec($conn, $sqlsiecs);
			$siecps = pg_result($resultsiecs, 0, "nazwa_siec_en");



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

if ($mocsp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Power in KW:</b><br>&nbsp;$mocs";
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
echo "&nbsp;<b>Water:</b><br>&nbsp;$wodaps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

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
echo "&nbsp;<b>Cable network:</b><br>&nbsp;$kablps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

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
echo "<td height=\"25\" colspan = \"20\">";
echo "&nbsp;<b>Internet network:</b><br>&nbsp;$siecps";
echo "</td>";

}

if (($kablbo == 't') || ($antenabo == 't') || ($siecbo == 't')) {
echo "</tr>"; 
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}


	$sqlochrn = "SELECT ochr_d, ochr_d_bo FROM tab_obi where id_d = '$nu';";
			
			$resultochrn = @pg_Exec($conn, $sqlochrn);
			$ochron = pg_result($resultochrn, 0, "ochr_d");
			$ochronbo = pg_result($resultochrn, 0, "ochr_d_bo");
				
	$sqlochrns = "SELECT nazwa_och_en FROM ochrona where id = '$ochron';";
			
			$resultochrns = @pg_Exec($conn, $sqlochrns);
			$ochronps = pg_result($resultochrns, 0, "nazwa_och_en");

		
$sqldfon = "SELECT domof_d, domof_d_bo FROM tab_obi where id_d = '$nu';";
			
			$resultdfon = @pg_Exec($conn, $sqldfon);
			$dfon = pg_result($resultdfon, 0, "domof_d");
			$dfonbo = pg_result($resultdfon, 0, "domof_d_bo");
				
	$sqldfons = "SELECT nazwa_do_en FROM domofon where id = '$dfon';";
			
			$resultdfons = @pg_Exec($conn, $sqldfons);
			$dfonps = pg_result($resultdfons, 0, "nazwa_do_en");

$sqldanty = "SELECT drzwant_d, drzwant_d_bo FROM tab_obi where id_d = '$nu';";
			
			$resultdanty = @pg_Exec($conn, $sqldanty);
			$danty = pg_result($resultdanty, 0, "drzwant_d");
			$dantybo = pg_result($resultdanty, 0, "drzwant_d_bo");
				
	$sqldantys = "SELECT nazwa_dz_en FROM drzwi_anty where id = '$danty';";
			
			$resultdantys = @pg_Exec($conn, $sqldantys);
			$dantyps = pg_result($resultdantys, 0, "nazwa_dz_en");

$sqlrolety = "SELECT rol_d, rol_d_bo FROM tab_obi where id_d = '$nu';";
			
			$resultrolety = @pg_Exec($conn, $sqlrolety);
			$rolety = pg_result($resultrolety, 0, "rol_d");
			$roletybo = pg_result($resultrolety, 0, "rol_d_bo");
				
	$sqlroletys = "SELECT nazwa_ro_en FROM rolety where id = '$rolety';";
			
			$resultroletys = @pg_Exec($conn, $sqlroletys);
			$roletyps = pg_result($resultroletys, 0, "nazwa_ro_en");

$sqlkamery = "SELECT kv_d, kv_d_bo FROM tab_obi where id_d = '$nu';";
			
			$resultkamery = @pg_Exec($conn, $sqlkamery);
			$kamery = pg_result($resultkamery, 0, "kv_d");
			$kamerybo = pg_result($resultkamery, 0, "kv_d_bo");
				
	$sqlkamerys = "SELECT nazwa_kam_en FROM kamery where id = '$kamery';";
			
			$resultkamerys = @pg_Exec($conn, $sqlkamerys);
			$kameryps = pg_result($resultkamerys, 0, "nazwa_kam_en");

$sqlkraty = "SELECT kra_d, kra_d_bo FROM tab_obi where id_d = '$nu';";
			
			$resultkraty = @pg_Exec($conn, $sqlkraty);
			$kratys = pg_result($resultkraty, 0, "kra_d");
			$kratybo = pg_result($resultkraty, 0, "kra_d_bo");
				
	$sqlkratys = "SELECT nazwa_kr_en FROM kraty where id = '$kratys';";
			
			$resultkratys = @pg_Exec($conn, $sqlkratys);
			$kratyps = pg_result($resultkratys, 0, "nazwa_kr_en");


$sqlalarm = "SELECT alar_d, alar_d_bo FROM tab_obi where id_d = '$nu';";
			
			$resultalarm = @pg_Exec($conn, $sqlalarm);
			$alarm = pg_result($resultalarm, 0, "alar_d");
			$alarmbo = pg_result($resultalarm, 0, "alar_d_bo");
				
	$sqlalarms = "SELECT nazwa_al_en FROM alarm where id = '$alarm';";
			
			$resultalarms = @pg_Exec($conn, $sqlalarms);
			$alarmps = pg_result($resultalarms, 0, "nazwa_al_en");

$sqlokanty = "SELECT okant_d, okant_d_bo FROM tab_obi where id_d = '$nu';";
			
			$resultokanty = @pg_Exec($conn, $sqlokanty);
			$okanty = pg_result($resultokanty, 0, "okant_d");
			$okantybo = pg_result($resultokanty, 0, "okant_d_bo");
				
	$sqlokantys = "SELECT nazwao_anty_en FROM okna_anty where id = '$okanty';";
			
			$resultokantys = @pg_Exec($conn, $sqlokantys);
			$okantyps = pg_result($resultokantys, 0, "nazwao_anty_en");

	$sqlrecep = "SELECT rec_d, rec_d_bo FROM tab_obi where id_d = '$nu';";
			
			$resultrecep = @pg_Exec($conn, $sqlrecep);
			$receps = pg_result($resultrecep, 0, "rec_d");
			$recepbo = pg_result($resultrecep, 0, "rec_d_bo");
				
	$sqlreceps = "SELECT nazwa_rec_en FROM recepcja where id = '$receps';";
			
			$resultreceps = @pg_Exec($conn, $sqlreceps);
			$recepps = pg_result($resultreceps, 0, "nazwa_rec_en");


if (($ochronbo == 't')  || ($dfonbo == 't') || ($dantybo == 't') || ($roletybo == 't') || ($kamerybo == 't') || ($kratybo == 't') || ($alarmbo == 't') || ($okantybo == 't') || ($recepbo == 't')) {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
echo "<tr><td colspan=\"40\" height=\"7\" bgcolor=\"#5865E5\">";
echo "<span class=\"nag1wb\">";
echo "&nbsp;Securities";
echo "</span>";
echo "</td></tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}
if (($ochronbo == 't')  || ($dfonbo == 't') || ($dantybo == 't') || ($roletybo == 't')) {
echo "<tr>"; 
}
if ($ochronbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Guarded place:</b><br>&nbsp;$ochronps";
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

if (($ochronbo == 't')  || ($dfonbo == 't') || ($dantybo == 't') || ($roletybo == 't')) {
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

if ($recepbo == 't') {
echo "<tr>"; 
echo "<td height=\"25\" colspan = \"20\">";
echo "&nbsp;<b>Reception:</b><br>&nbsp;$recepps";
echo "</td>";
echo "</tr>";
}

if ($recepbo == 't') {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}

$sqlklim = "SELECT klim_d, klim_d_bo FROM tab_obi where id_d = '$nu';";
			
			$resultklim = @pg_Exec($conn, $sqlklim);
			$klima = pg_result($resultklim, 0, "klim_d");
			$klimabo = pg_result($resultklim, 0, "klim_d_bo");
				
	$sqlklims = "SELECT nazwa_kli_en FROM klima where id = '$klima';";
			
			$resultklims = @pg_Exec($conn, $sqlklims);
			$klimps = pg_result($resultklims, 0, "nazwa_kli_en");

$sqlpiwn = "SELECT piwn_d, piwn_d_bo FROM tab_obi where id_d = '$nu';";
			
			$resultpiwn = @pg_Exec($conn, $sqlpiwn);
			$piwn = pg_result($resultpiwn, 0, "piwn_d");
			$piwnbo = pg_result($resultpiwn, 0, "piwn_d_bo");
				
	$sqlpiwns = "SELECT nazwa_pi_en FROM piwnica where id = '$piwn';";
			
			$resultpiwns = @pg_Exec($conn, $sqlpiwns);
			$piwnps = pg_result($resultpiwns, 0, "nazwa_pi_en");

$sqlpoddy = "SELECT poddy_d, poddy_d_bo FROM tab_obi where id_d = '$nu';";
			
			$resultpoddy = @pg_Exec($conn, $sqlpoddy);
			$poddys = pg_result($resultpoddy, 0, "poddy_d");
			$poddybo = pg_result($resultpoddy, 0, "poddy_d_bo");
				
	$sqlpoddys = "SELECT nazwa_pod_en FROM poddyst where id = '$poddys';";
			
			$resultpoddys = @pg_Exec($conn, $sqlpoddys);
			$poddyps = pg_result($resultpoddys, 0, "nazwa_pod_en");

$sqlosra = "SELECT osw_d, osw_d_bo FROM tab_obi where id_d = '$nu';";
			
			$resultosra = @pg_Exec($conn, $sqlosra);
			$osra = pg_result($resultosra, 0, "osw_d");
			$osrabo = pg_result($resultosra, 0, "osw_d_bo");
				
	$sqlosras = "SELECT nazwa_osw_en FROM oswietlenie where id = '$osra';";
			
			$resultosras = @pg_Exec($conn, $sqlosras);
			$osraps = pg_result($resultosras, 0, "nazwa_osw_en");

$sqlwarsz = "SELECT warsz_d, warsz_d_bo FROM tab_obi where id_d = '$nu';";
			
			$resultwarsz = @pg_Exec($conn, $sqlwarsz);
			$warszt = pg_result($resultwarsz, 0, "warsz_d");
			$warsztbo = pg_result($resultwarsz, 0, "warsz_d_bo");
				
	$sqlwarszs = "SELECT nazwa_wa_en FROM warsztat where id = '$warszt';";
			
			$resultwarszts = @pg_Exec($conn, $sqlwarszs);
			$warsztps = pg_result($resultwarszts, 0, "nazwa_wa_en");

	$sqlmiej = "SELECT mip_d, mip_d_bo FROM tab_obi where id_d = '$nu';";
			
			$resultmiej = @pg_Exec($conn, $sqlmiej);
			$miej = pg_result($resultmiej, 0, "mip_d");
			$miejbo = pg_result($resultmiej, 0, "mip_d_bo");
				
	$sqlmiejs = "SELECT nazwa_pa_en FROM parking where id = '$miej';";
			
			$resultmiejs = @pg_Exec($conn, $sqlmiejs);
			$miejps = pg_result($resultmiejs, 0, "nazwa_pa_en");

$sqludog = "SELECT udog_d, udog_d_bo FROM tab_obi where id_d = '$nu';";
			
			$resultudog = @pg_Exec($conn, $sqludog);
			$udog = pg_result($resultudog, 0, "udog_d");
			$udogbo = pg_result($resultudog, 0, "udog_d_bo");
				
	$sqludogs = "SELECT nazwa_nie_en FROM niepelno where id = '$udog';";
			
			$resultudogs = @pg_Exec($conn, $sqludogs);
			$udogps = pg_result($resultudogs, 0, "nazwa_nie_en");

$sqlligar = "SELECT ligar_d, ligar_d_bo FROM tab_obi where id_d = '$nu';";
			
			$resultligar = @pg_Exec($conn, $sqlligar);
			$lgar = pg_result($resultligar, 0, "ligar_d");
			$lgarbo = pg_result($resultligar, 0, "ligar_d_bo");


$sqlusgar = "SELECT usgar_d, usgar_d_bo FROM tab_obi where id_d = '$nu';";
			
			$resultusgar = @pg_Exec($conn, $sqlusgar);
			$usgars = pg_result($resultusgar, 0, "usgar_d");
			$usgarbo = pg_result($resultusgar, 0, "usgar_d_bo");
				
	$sqlusgars = "SELECT nazwa_usyt_en FROM garaz_usyt where id = '$usgars';";
			
			$resultusgars = @pg_Exec($conn, $sqlusgars);
			$usgarps = pg_result($resultusgars, 0, "nazwa_usyt_en");

$sqlrest = "SELECT resta_d, resta_d_bo FROM tab_obi where id_d = '$nu';";
			
			$resultrest = @pg_Exec($conn, $sqlrest);
			$rests = pg_result($resultrest, 0, "resta_d");
			$restbo = pg_result($resultrest, 0, "resta_d_bo");
				
	$sqlrests = "SELECT nazwa_res_en FROM restauracja where id = '$rests';";
			
			$resultrests = @pg_Exec($conn, $sqlrests);
			$restps = pg_result($resultrests, 0, "nazwa_res_en");

$sqlban = "SELECT bank_d, bank_d_bo FROM tab_obi where id_d = '$nu';";
			
			$resultban = @pg_Exec($conn, $sqlban);
			$bans = pg_result($resultban, 0, "bank_d");
			$banbo = pg_result($resultban, 0, "bank_d_bo");
				
	$sqlbans = "SELECT nazwa_ba_en FROM bank where id = '$bans';";
			
			$resultbans = @pg_Exec($conn, $sqlbans);
			$banps = pg_result($resultbans, 0, "nazwa_ba_en");

$sqlcent = "SELECT cenha_d, cenha_d_bo FROM tab_obi where id_d = '$nu';";
			
			$resultcent = @pg_Exec($conn, $sqlcent);
			$cents = pg_result($resultcent, 0, "cenha_d");
			$centbo = pg_result($resultcent, 0, "cenha_d_bo");
				
	$sqlcents = "SELECT nazwa_ce_en FROM centrum where id = '$cents';";
			
			$resultcents = @pg_Exec($conn, $sqlcents);
			$centps = pg_result($resultcents, 0, "nazwa_ce_en");


if (($klimabo == 't') || ($piwnbo == 't') || ($poddybo == 't') || ($osrabo == 't') || ($warsztbo == 't') || ($miejbo == 't') || ($udogbo == 't') || ($lgarbo == 't') || ($usgarbo == 't') || ($restbo == 't') || ($banbo == 't') || ($centbo == 't')) {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
echo "<tr><td colspan=\"40\" height=\"7\" bgcolor=\"#5865E5\">";
echo "<span class=\"nag1wb\">";
echo "&nbsp;Facilities";
echo "</span>";
echo "</td></tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}
if (($klimabo == 't') || ($piwnbo == 't') || ($poddybo == 't') || ($osrabo == 't')) {
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

if ($piwnbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Cellar:</b><br>&nbsp;$piwnps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($poddybo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Remote floors:</b><br>&nbsp;$poddyps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($osrabo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Raster lighting:</b><br>&nbsp;$osraps";
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

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

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
echo "&nbsp;<b>Situation of garages:</b><br>&nbsp;$usgarps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($restbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Restaurant:</b><br>&nbsp;$restps";
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
echo "&nbsp;<b>Shopping center:</b><br>&nbsp;$centps";
echo "</td>";

}

if (($usgarbo == 't') || ($restbo == 't') || ($banbo == 't') || ($centbo == 't')) {
echo "</tr>"; 
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}




$sqluli = "SELECT tdr_d, tdr_d_bo FROM tab_obi where id_d = '$nu';";
			
			$resultuli = @pg_Exec($conn, $sqluli);
			$uli = pg_result($resultuli, 0, "tdr_d");
			$ulibo = pg_result($resultuli, 0, "tdr_d_bo");
				
	$sqlulis = "SELECT nazwa_ul_en FROM typ_ulicy where id = '$uli';";
			
			$resultulis = @pg_Exec($conn, $sqlulis);
			$ulips = pg_result($resultulis, 0, "nazwa_ul_en");

$sqlnadr = "SELECT ndr_d, ndr_d_bo FROM tab_obi where id_d = '$nu';";
			
			$resultnadr = @pg_Exec($conn, $sqlnadr);
			$nadr = pg_result($resultnadr, 0, "ndr_d");
			$nadrbo = pg_result($resultnadr, 0, "ndr_d_bo");
				
	$sqlnadrs = "SELECT nazwa_na_en FROM nawierzchnia where id = '$nadr';";
			
			$resultnadrs = @pg_Exec($conn, $sqlnadrs);
			$nadrps = pg_result($resultnadrs, 0, "nazwa_na_en");

$sqlkomu = "SELECT kmod_d, kmod_d_bo FROM tab_obi where id_d = '$nu';";
			
			$resultkomu = @pg_Exec($conn, $sqlkomu);
			$komu = pg_result($resultkomu, 0, "kmod_d");
			$komubo = pg_result($resultkomu, 0, "kmod_d_bo");
				
	$sqlkomus = "SELECT nazwa_kom_en FROM komunikacja where id = '$komu';";
			
			$resultkomus = @pg_Exec($conn, $sqlkomus);
			$komups = pg_result($resultkomus, 0, "nazwa_kom_en");

$sqlodcm = "SELECT odlce_d, odlce_d_bo FROM tab_obi where id_d = '$nu';";
			
			$resultodcm = @pg_Exec($conn, $sqlodcm);
			$odcm = pg_result($resultodcm, 0, "odlce_d");
			$odcmbo = pg_result($resultodcm, 0, "odlce_d_bo");

$sqlotocz = "SELECT otnie_d, otnie_d_bo FROM tab_obi where id_d = '$nu';";
			
			$resultotocz = @pg_Exec($conn, $sqlotocz);
			$otocz = pg_result($resultotocz, 0, "otnie_d");
			$otoczbo = pg_result($resultotocz, 0, "otnie_d_bo");
				
	$sqlotoczs = "SELECT nazwa_oto_en FROM otoczenie where id = '$otocz';";
			
			$resultotoczs = @pg_Exec($conn, $sqlotoczs);
			$otoczps = pg_result($resultotoczs, 0, "nazwa_oto_en");	
			

if (($ulibo == 't') || ($nadrbo == 't') || ($komubo == 't') || ($odcmbo == 't') || ($otoczbo == 't')) {

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

if ($otoczbo == 't') {
echo "<tr>"; 
echo "<td height=\"25\" colspan = \"20\">";
echo "&nbsp;<b>Nonarduous environment:</b><br>&nbsp;$otoczps";
echo "</td>";
echo "</tr>";
} 

if ($otoczbo == 't') {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}



$sqllas = "SELECT las_d, las_d_bo FROM tab_obi where id_d = '$nu';";
			
			$resultlas = @pg_Exec($conn, $sqllas);
			$las = pg_result($resultlas, 0, "las_d");
			$lasbo = pg_result($resultlas, 0, "las_d_bo");
				
	$sqllass = "SELECT nazwa_la_en FROM las where id = '$las';";
			
			$resultlass = @pg_Exec($conn, $sqllass);
			$lasps = pg_result($resultlass, 0, "nazwa_la_en");

$sqlpark = "SELECT park_d, park_d_bo FROM tab_obi where id_d = '$nu';";
			
			$resultpark = @pg_Exec($conn, $sqlpark);
			$park = pg_result($resultpark, 0, "park_d");
			$parkbo = pg_result($resultpark, 0, "park_d_bo");
				
	$sqlparks = "SELECT nazwa_par_en FROM park where id = '$park';";
			
			$resultparks = @pg_Exec($conn, $sqlparks);
			$parkps = pg_result($resultparks, 0, "nazwa_par_en");

$sqlrzeka = "SELECT rzeka_d, rzeka_d_bo FROM tab_obi where id_d = '$nu';";
			
			$resultrzeka = @pg_Exec($conn, $sqlrzeka);
			$rzeka = pg_result($resultrzeka, 0, "rzeka_d");
			$rzekabo = pg_result($resultrzeka, 0, "rzeka_d_bo");
				
	$sqlrzekas = "SELECT nazwa_rz_en FROM rzeka where id = '$rzeka';";
			
			$resultrzekas = @pg_Exec($conn, $sqlrzekas);
			$rzekaps = pg_result($resultrzekas, 0, "nazwa_rz_en");

$sqljezioro = "SELECT jezioro_d, jezioro_d_bo FROM tab_obi where id_d = '$nu';";
			
			$resultjezioro = @pg_Exec($conn, $sqljezioro);
			$jezioro = pg_result($resultjezioro, 0, "jezioro_d");
			$jeziorobo = pg_result($resultjezioro, 0, "jezioro_d_bo");
				
	$sqljezioros = "SELECT nazwa_je_en FROM jezioro where id = '$jezioro';";
			
			$resultjezioros = @pg_Exec($conn, $sqljezioros);
			$jeziorops = pg_result($resultjezioros, 0, "nazwa_je_en");

$sqlstaw = "SELECT staw_d, staw_d_bo FROM tab_obi where id_d = '$nu';";
			
			$resultstaw = @pg_Exec($conn, $sqlstaw);
			$staw = pg_result($resultstaw, 0, "staw_d");
			$stawbo = pg_result($resultstaw, 0, "staw_d_bo");
				
	$sqlstaws = "SELECT nazwa_sta_en FROM staw where id = '$staw';";
			
			$resultstaws = @pg_Exec($conn, $sqlstaws);
			$stawps = pg_result($resultstaws, 0, "nazwa_sta_en");

$sqlgory = "SELECT gory_d, gory_d_bo FROM tab_obi where id_d = '$nu';";
			
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


$sqlstand = "SELECT std_d, std_d_bo FROM tab_obi where id_d = '$nu';";
			
			$resultstand = @pg_Exec($conn, $sqlstand);
			$stand = pg_result($resultstand, 0, "std_d");
			$standbo = pg_result($resultstand, 0, "std_d_bo");
				
	$sqlstands = "SELECT nazwa_stan_en FROM standard where id = '$stand';";
			
			$resultstands = @pg_Exec($conn, $sqlstands);
			$standps = pg_result($resultstands, 0, "nazwa_stan_en");

$sqlstan = "SELECT sta_d, sta_d_bo FROM tab_obi where id_d = '$nu';";
			
			$resultstan = @pg_Exec($conn, $sqlstan);
			$stan = pg_result($resultstan, 0, "sta_d");
			$stanbo = pg_result($resultstan, 0, "sta_d_bo");
				
	$sqlstans = "SELECT nazwa_sst_en FROM stan where id = '$stan';";
			
			$resultstans = @pg_Exec($conn, $sqlstans);
			$stanps = pg_result($resultstans, 0, "nazwa_sst_en");

$sqlprzek = "SELECT moprz_d, moprz_d_bo FROM tab_obi where id_d = '$nu';";
			
			$resultprzek = @pg_Exec($conn, $sqlprzek);
			$przek = pg_result($resultprzek, 0, "moprz_d");
			$przekbo = pg_result($resultprzek, 0, "moprz_d_bo");
				
	$sqlprzeks = "SELECT nazwa_przek_en FROM przeksztalcenie where id = '$przek';";
			
			$resultprzeks = @pg_Exec($conn, $sqlprzeks);
			$przekps = pg_result($resultprzeks, 0, "nazwa_przek_en");

$sqldodop = "SELECT dodopis_en, dodopis_bo FROM tab_obi where id_d = '$nu';";
			
			$resultdodop = @pg_Exec($conn, $sqldodop);
			$dodop = pg_result($resultdodop, 0, "dodopis_en");
			$dodopbo = pg_result($resultdodop, 0, "dodopis_bo");



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

if (($dodop == '0') || ($dodop == '')) {
 }
else {
echo "<tr>";
echo "<td height=\"25\" colspan = \"20\">";
echo "&nbsp;<b>Extra description:</b><br>&nbsp;$dodop";
echo "</td>";
echo "</tr>";
}

if ($dodopbo == 't') {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}

echo "</table>";
echo "</center>";


?>
<SCRIPT language=JavaScript type=text/javascript>self.print()</SCRIPT>
</BODY>
</HTML>