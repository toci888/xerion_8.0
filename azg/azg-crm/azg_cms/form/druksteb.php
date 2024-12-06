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
<td width=23% order=0 align=left rowspan = 3>

<img src=logom.jpg width=181 height=90 border=0></img>

</td>

<td width=77% border=0 align=right colspan = 5>
<span class=tytulna><b>
BIURO NIERUCHOMOŚCI A.Z.GWARANCJA<br>
</span>
</td>
</tr>

<tr>

<td height=5 width=25% border=0 align=right>
<span class=tytul><b>
<u>Siedziba Główna:</u><br>
ul. Szarych Szeregów 34 d,<br>
45-285 Opole<br>
tel./fax.(077)402-75-20, <br>
</b>
</span>
</td>

<td width=1% height=100% align=right><img src=black.gif width=1 height=100% border=0></td>

<td height=5 width=25% border=0 align=right>
<span class=tytul><b>
<u>Filia Nr 1:</u><br>
ul. Bytnara Rudego 13,<br>
45-265 Opole<br>
tel./fax.(077)458-00-94, <br>
</b>
</span>
</td>

<td width=1% height=100% align=right><img src=black.gif width=1 height=100% border=0></td>


<td height=5 width=25% border=0 align=right>
<span class=tytul><b>
<u>Fillia Nr 2:</u><br>
ul. Sosnkowskiego 40-42,<br>
45-284 Opole<br>
tel./fax.(077)457-96-99<br>
</b>
</span>
</td>

</tr>
<tr>
<td width=100% border=0 align=right colspan = 5>
<span class=tytulna><b>
tel.kom.0602-531-334, strona: www.azg.pl, e-mail: azgwarancja@azg.pl
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

include "concfg.inc";



echo "<center>";
echo "<span class=\"nag2b\">";
echo "<b>SPRZEDAŻ TERENÓW</b>";
echo "<br>";
echo "</span>";
echo "</center>";

echo "<center>";
echo "<table width=\"512\" cellpadding=\"0\" cellspacing=\"0\" border = \"1\" frame = \"above,below,rhs\" rules = \"groups\">";

$sqlno = "SELECT no_d, no_d_bo FROM tab_te where id_d = '$nu';";
	$resultno = @pg_Exec($conn, $sqlno);
	$rowsno = pg_NumRows($resultno);		// liczba zwroconych wierszy
	$noms = pg_result($resultno, 0, "no_d");
	$nomsp = pg_result($resultno, 0, "no_d_bo");

$sqlstatus = "SELECT sm_d, sm_d_bo FROM tab_te where id_d = '$nu';";
			
			$resultstatus = @pg_Exec($conn, $sqlstatus);
			$status = pg_result($resultstatus, 0, "sm_d");
			$statusbo = pg_result($resultstatus, 0, "sm_d_bo");
	
	$sqlstatuss = "SELECT nazwa_st FROM status where id = '$status';";
			
			$resultstatuss = @pg_Exec($conn, $sqlstatuss);
			$statuss = pg_result($resultstatuss, 0, "nazwa_st");

$sqlagent = "SELECT id_a FROM tab_te where id_d = '$nu';";
			
			$resultagent = @pg_Exec($conn, $sqlagent);
			$agent = pg_result($resultagent, 0, "id_a");

	$sqlagents = "SELECT nazwa_a, tel_a, tel_kom_a, email_a FROM tab_agent where id_a = '$agent';";
			
			$resultagents = @pg_Exec($conn, $sqlagents);
			$nazwaagenta = pg_result($resultagents, 0, "nazwa_a");
			$nazwatel = pg_result($resultagents, 0, "tel_a");
			$nazwatelkom = pg_result($resultagents, 0, "tel_kom_a");
			$nazwaemail = pg_result($resultagents, 0, "email_a");

$sqllok = "SELECT lok_d, lok_d_bo FROM tab_te where id_d = '$nu';";	
	$resultlok = @pg_Exec($conn, $sqllok);
	$lokas = pg_result($resultlok, 0, "lok_d");
	$lokasp = pg_result($resultlok, 0, "lok_d_bo");

$sqlwoj = "SELECT lok_w, lok_w_bo FROM tab_te where id_d = '$nu';";
			
			$resultwoj = @pg_Exec($conn, $sqlwoj);
			$wojn = pg_result($resultwoj, 0, "lok_w");
			$wojnbo = pg_result($resultwoj, 0, "lok_w_bo");
	
	$sqlwojs = "SELECT nazwa_w FROM wojewodztwa where id_w = '$wojn';";
			
			$resultwojs = @pg_Exec($conn, $sqlwojs);
			$wojns = pg_result($resultwojs, 0, "nazwa_w");

$sqlpowiat = "SELECT lok_p, lok_p_bo FROM tab_te where id_d = '$nu';";
			
			$resultpowiat = @pg_Exec($conn, $sqlpowiat);
			$powiatn = pg_result($resultpowiat, 0, "lok_p");
			$powiatbo = pg_result($resultpowiat, 0, "lok_p_bo");
	
	$sqlpowiats = "SELECT nazwa_p FROM powiaty where id_pow = '$powiatn';";
			
			$resultpowiats = @pg_Exec($conn, $sqlpowiats);
			$powiatns = pg_result($resultpowiats, 0, "nazwa_p");

$sqlcena = "SELECT cd, cd_bo FROM tab_te where id_d = '$nu';";	
	$resultcena = @pg_Exec($conn, $sqlcena);
	$cenas = pg_result($resultcena, 0, "cd");
	$cenasp = pg_result($resultcena, 0, "cd_bo");
	

$sqlpowdzi = "SELECT powdzi_d, powdzi_d_bo FROM tab_te where id_d = '$nu';";	
	$resultpowdzi = @pg_Exec($conn, $sqlpowdzi);
	$powdzis = pg_result($resultpowdzi, 0, "powdzi_d");
	$powdzisp = pg_result($resultpowdzi, 0, "powdzi_d_bo");

$sqlrynek = "SELECT rr_d, rr_d_bo FROM tab_te where id_d = '$nu';";
			
			$resultrynek = @pg_Exec($conn, $sqlrynek);
			$rrynek = pg_result($resultrynek, 0, "rr_d");
			$rrynekbo = pg_result($resultrynek, 0, "rr_d_bo");
	
$sqlryneks = "SELECT nazwa_r FROM rodzaj_ryn where id = '$rrynek';";
			
			$resultryneks = @pg_Exec($conn, $sqlryneks);
			$rryneks = pg_result($resultryneks, 0, "nazwa_r");


$sqlcm2 = "SELECT cm2_d, cm2_d_bo FROM tab_te where id_d = '$nu';";	
	$resultcm2 = @pg_Exec($conn, $sqlcm2);
	$cenad2 = pg_result($resultcm2, 0, "cm2_d");
	$cenad2bo = pg_result($resultcm2, 0, "cm2_d_bo");
	
$sqlczynsz = "SELECT wysop_d, wysop_d_bo FROM tab_te where id_d = '$nu';";
	$resultczynsz = @pg_Exec($conn, $sqlczynsz);
	$czynszs = pg_result($resultczynsz, 0, "wysop_d");
	$czynszsp = pg_result($resultczynsz, 0, "wysop_d_bo");

$sqlczasp = "SELECT cz_prze_d, cz_prze_d_bo FROM tab_te where id_d = '$nu';";
			
			$resultczasp = @pg_Exec($conn, $sqlczasp);
			$czasp = pg_result($resultczasp, 0, "cz_prze_d");
			$czaspbo = pg_result($resultczasp, 0, "cz_prze_d_bo");
	
	$sqlczasps = "SELECT nazwa_prz FROM czas_prz where id = '$czasp';";
			
			$resultczasps = @pg_Exec($conn, $sqlczasps);
			$czasps = pg_result($resultczasps, 0, "nazwa_prz");

$sqlksiega = "SELECT kw_d, kw_d_bo FROM tab_te where id_d = '$nu';";
			
			$resultksiega = @pg_Exec($conn, $sqlksiega);
			$ksiega = pg_result($resultksiega, 0, "kw_d");
			$ksiegabo = pg_result($resultksiega, 0, "kw_d_bo");
	
	$sqlksiegas = "SELECT nazwa_k FROM ksiega where id = '$ksiega';";
			
			$resultksiegas = @pg_Exec($conn, $sqlksiegas);
			$ksiegass = pg_result($resultksiegas, 0, "nazwa_k");


$sqlprawnydz = "SELECT spr_dz, spr_dz_bo FROM tab_te where id_d = '$nu';";
			
			$resultprawnydz = @pg_Exec($conn, $sqlprawnydz);
			$prawnydz = pg_result($resultprawnydz, 0, "spr_dz");
			$prawnydzbo = pg_result($resultprawnydz, 0, "spr_dz_bo");
	
	$sqlprawnydzs = "SELECT nazwa_pr FROM stan_pr where id = '$prawnydz';";
			
			$resultprawnydzs = @pg_Exec($conn, $sqlprawnydzs);
			$prawnydzss = pg_result($resultprawnydzs, 0, "nazwa_pr");


$sqldw = "SELECT datawp_d, datawp_d_bo FROM tab_te where id_d = '$nu';";
	$resultdw = @pg_Exec($conn, $sqldw);
	$datw = pg_result($resultdw, 0, "datawp_d");
	$datwp = pg_result($resultdw, 0, "datawp_d_bo");

$sqlprof = "SELECT rof_d, rof_d_bo FROM tab_te where id_d = '$nu';";
			
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
echo "&nbsp;<b>Pośrednik:</b><br>&nbsp;<a href=\"mailto:$nazwaemail\">$nazwaagenta</a>&nbsp;<b>Tel.kom.:</b>&nbsp;$nazwatelkom";
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
echo "&nbsp;<b>Cena:</b><br>&nbsp;$cenas zł.";
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
echo "&nbsp;<b>Cena za 1 ar:</b><br>&nbsp;$cenad2 zł.";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($czynszsp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Opłaty:</b><br>&nbsp;$czynszs zł.";
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
echo "&nbsp;<b>Księga Wieczysta:</b><br>&nbsp;$ksiegass";
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

$sqlkszdz = "SELECT ksdzi_d, ksdzi_d_bo FROM tab_te where id_d = '$nu';";
			
			$resultkszdz = @pg_Exec($conn, $sqlkszdz);
			$kszdzs = pg_result($resultkszdz, 0, "ksdzi_d");
			$kszdzbo = pg_result($resultkszdz, 0, "ksdzi_d_bo");
				
	$sqlkszdzs = "SELECT nazwa_dz FROM dzialka where id = '$kszdzs';";
			
			$resultkszdzs = @pg_Exec($conn, $sqlkszdzs);
			$kszdzps = pg_result($resultkszdzs, 0, "nazwa_dz");


$sqlszdz = "SELECT szdzi_d, szdzi_d_bo FROM tab_te where id_d = '$nu';";	
	$resultszdz = @pg_Exec($conn, $sqlszdz);
	$szdzis = pg_result($resultszdz, 0, "szdzi_d");
	$szdzisp = pg_result($resultszdz, 0, "szdzi_d_bo");

$sqldldz = "SELECT dldz_d, dldz_d_bo FROM tab_te where id_d = '$nu';";	
	$resultdldz = @pg_Exec($conn, $sqldldz);
	$dldzs = pg_result($resultdldz, 0, "dldz_d");
	$dldzsp = pg_result($resultdldz, 0, "dldz_d_bo");

$sqlnardz = "SELECT dzinar_d, dzinar_d_bo FROM tab_te where id_d = '$nu';";
			
			$resultnardz = @pg_Exec($conn, $sqlnardz);
			$nardzs = pg_result($resultnardz, 0, "dzinar_d");
			$nardzbo = pg_result($resultnardz, 0, "dzinar_d_bo");
				
	$sqlnardzs = "SELECT nazwa_nar FROM dzialka_nar where id = '$nardzs';";
			
			$resultnardzs = @pg_Exec($conn, $sqlnardzs);
			$nardzps = pg_result($resultnardzs, 0, "nazwa_nar");

$sqlogrdz = "SELECT dziogr_d, dziogr_d_bo FROM tab_te where id_d = '$nu';";
			
			$resultogrdz = @pg_Exec($conn, $sqlogrdz);
			$ogrdzs = pg_result($resultogrdz, 0, "dziogr_d");
			$ogrdzbo = pg_result($resultogrdz, 0, "dziogr_d_bo");
				
	$sqlogrdzs = "SELECT nazwa_og FROM dzialka_og where id = '$ogrdzs';";
			
			$resultogrdzs = @pg_Exec($conn, $sqlogrdzs);
			$ogrdzps = pg_result($resultogrdzs, 0, "nazwa_og");


	$sqluksz = "SELECT uksz_d, uksz_d_bo FROM tab_te where id_d = '$nu';";
			
			$resultuksz = @pg_Exec($conn, $sqluksz);
			$ukszs = pg_result($resultuksz, 0, "uksz_d");
			$ukszbo = pg_result($resultuksz, 0, "uksz_d_bo");
				
	$sqlukszs = "SELECT nazwa_uk FROM dzialka_uk where id = '$ukszs';";
			
			$resultukszs = @pg_Exec($conn, $sqlukszs);
			$ukszps = pg_result($resultukszs, 0, "nazwa_uk");

$sqlzad = "SELECT zaddzi_d, zaddzi_d_bo FROM tab_te where id_d = '$nu';";
			
			$resultzad = @pg_Exec($conn, $sqlzad);
			$zads = pg_result($resultzad, 0, "zaddzi_d");
			$zadbo = pg_result($resultzad, 0, "zaddzi_d_bo");
				
	$sqlzads = "SELECT nazwa_za FROM dzialka_za where id = '$zads';";
			
			$resultzads = @pg_Exec($conn, $sqlzads);
			$zadps = pg_result($resultzads, 0, "nazwa_za");

$sqlmozpod = "SELECT mozpod, mozpod_bo FROM tab_te where id_d = '$nu';";
			
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
echo "&nbsp;<b>Kształt terenu:</b><br>&nbsp;$kszdzps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($szdzisp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Szerekość terenu:</b><br>&nbsp;$szdzis m";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($dldzsp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Długość terenu:</b><br>&nbsp;$dldzs m";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($nardzbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Teren narożny:</b><br>&nbsp;$nardzps";
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
echo "&nbsp;<b>Ukształt. pionowe:</b><br>&nbsp;$ukszps";
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
echo "&nbsp;<b>Możliwość podziału:</b><br>&nbsp;$mozpodps";
echo "</td>";

}

if (($ogrdzbo == 't')  || ($ukszbo == 't') || ($zadbo == 't') || ($mozpodbo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}


$sqluslu = "SELECT usl_d, usl_d_bo FROM tab_te where id_d = '$nu';";
			
			$resultuslu = @pg_Exec($conn, $sqluslu);
			$uslus = pg_result($resultuslu, 0, "usl_d");
			$uslubo = pg_result($resultuslu, 0, "usl_d_bo");
				
	$sqluslus = "SELECT nazwa_us FROM uslugi where id = '$uslus';";
			
			$resultuslus = @pg_Exec($conn, $sqluslus);
			$uslups = pg_result($resultuslus, 0, "nazwa_us");

$sqlprze = "SELECT przem_d, przem_d_bo FROM tab_te where id_d = '$nu';";
			
			$resultprze = @pg_Exec($conn, $sqlprze);
			$przes = pg_result($resultprze, 0, "przem_d");
			$przebo = pg_result($resultprze, 0, "przem_d_bo");
				
	$sqlprzes = "SELECT nazwa_prze FROM przemysl where id = '$przes';";
			
			$resultprzes = @pg_Exec($conn, $sqlprzes);
			$przeps = pg_result($resultprzes, 0, "nazwa_prze");

$sqlbdj = "SELECT bdj_d, bdj_d_bo FROM tab_te where id_d = '$nu';";
			
			$resultbdj = @pg_Exec($conn, $sqlbdj);
			$bdjs = pg_result($resultbdj, 0, "bdj_d");
			$bdjbo = pg_result($resultbdj, 0, "bdj_d_bo");
				
	$sqlbdjs = "SELECT nazwa_bu FROM budjedind where id = '$bdjs';";
			
			$resultbdjs = @pg_Exec($conn, $sqlbdjs);
			$bdjps = pg_result($resultbdjs, 0, "nazwa_bu");

$sqlbdjsze = "SELECT bdjs_d, bdjs_d_bo FROM tab_te where id_d = '$nu';";
			
			$resultbdjsze = @pg_Exec($conn, $sqlbdjsze);
			$bdjszes = pg_result($resultbdjsze, 0, "bdjs_d");
			$bdjszebo = pg_result($resultbdjsze, 0, "bdjs_d_bo");
				
	$sqlbdjszes = "SELECT nazwa_bu FROM budjedsze where id = '$bdjszes';";
			
			$resultbdjszes = @pg_Exec($conn, $sqlbdjszes);
			$bdjszeps = pg_result($resultbdjszes, 0, "nazwa_bu");

$sqlbwd = "SELECT bw_d, bw_d_bo FROM tab_te where id_d = '$nu';";
			
			$resultbwd = @pg_Exec($conn, $sqlbwd);
			$bwds = pg_result($resultbwd, 0, "bw_d");
			$bwdbo = pg_result($resultbwd, 0, "bw_d_bo");
				
	$sqlbwds = "SELECT nazwa_bu FROM budwiel where id = '$bwds';";
			
			$resultbwds = @pg_Exec($conn, $sqlbwds);
			$bwdps = pg_result($resultbwds, 0, "nazwa_bu");

$sqlmkd = "SELECT lmk_d, lmk_d_bo FROM tab_te where id_d = '$nu';";	
	$resultmkd = @pg_Exec($conn, $sqlmkd);
	$mkds = pg_result($resultmkd, 0, "lmk_d");
	$mkdsp = pg_result($resultmkd, 0, "lmk_d_bo");


$sqlpmza = "SELECT pmza_d, pmza_d_bo FROM tab_te where id_d = '$nu';";	
	$resultpmza = @pg_Exec($conn, $sqlpmza);
	$pmzas = pg_result($resultpmza, 0, "pmza_d");
	$pmzasp = pg_result($resultpmza, 0, "pmza_d_bo");

$sqlpena = "SELECT pnab_d, pnab_d_bo FROM tab_te where id_d = '$nu';";
			
			$resultpena = @pg_Exec($conn, $sqlpena);
			$penas = pg_result($resultpena, 0, "pnab_d");
			$penabo = pg_result($resultpena, 0, "pnab_d_bo");
				
	$sqlpenas = "SELECT nazwa_po FROM pozbud where id = '$penas';";
			
			$resultpenas = @pg_Exec($conn, $sqlpenas);
			$penaps = pg_result($resultpenas, 0, "nazwa_po");

$sqlodrol = "SELECT odrol_d, odrol_d_bo FROM tab_te where id_d = '$nu';";
			
			$resultodrol = @pg_Exec($conn, $sqlodrol);
			$odrols = pg_result($resultodrol, 0, "odrol_d");
			$odrolbo = pg_result($resultodrol, 0, "odrol_d_bo");
				
	$sqlodrols = "SELECT nazwa_od FROM odrolniona where id = '$odrols';";
			
			$resultodrols = @pg_Exec($conn, $sqlodrols);
			$odrolps = pg_result($resultodrols, 0, "nazwa_od");

$sqlwarza = "SELECT warza_d, warza_d_bo FROM tab_te where id_d = '$nu';";
			
			$resultwarza = @pg_Exec($conn, $sqlwarza);
			$warzap = pg_result($resultwarza, 0, "warza_d");
			$warzabo = pg_result($resultwarza, 0, "warza_d_bo");

$sqlprzgr = "SELECT przgr_d, przgr_d_bo FROM tab_te where id_d = '$nu';";
			
			$resultprzgr = @pg_Exec($conn, $sqlprzgr);
			$przgrp = pg_result($resultprzgr, 0, "przgr_d");
			$przgrbo = pg_result($resultprzgr, 0, "przgr_d_bo");

$sqlpowmza = "SELECT powmza_d, powmza_d_bo FROM tab_te where id_d = '$nu';";
			
			$resultpowmza = @pg_Exec($conn, $sqlpowmza);
			$powmzas = pg_result($resultpowmza, 0, "powmza_d");
			$powmzabo = pg_result($resultpowmza, 0, "powmza_d_bo");

if (($uslubo == 't') || ($przebo == 't') || ($bdjbo == 't')  || ($bdjszebo == 't') || ($bwdbo == 't')  || ($mkdsp == 't') || ($pmzasp == 't') || ($penabo == 't') || ($odrolbo == 't') || ($warzabo == 't') || ($przgrbo == 't') || ($powmzabo == 't')) {

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
echo "<tr><td colspan=\"40\" height=\"7\" bgcolor=\"#5865E5\">";
echo "<span class=\"nag1wb\">";
echo "&nbsp;Możliwość zabudowy";
echo "</span>";
echo "</td></tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

}

if (($uslubo == 't') || ($przebo == 't') || ($bdjbo == 't')  || ($bdjszebo == 't')) {
echo "<tr>"; 
}

if ($uslubo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Usługi:</b><br>&nbsp;$uslups";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($przebo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Przemysł:</b><br>&nbsp;$przeps";
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
echo "&nbsp;<b>Możliwe kondyg.:</b><br>&nbsp;$mkds";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($pmzasp == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Możliwa zabudowa:</b><br>&nbsp;$pmzas  %";
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
echo "&nbsp;<b>Pow. możli. zabudowy:</b><br>&nbsp;$powmzas ar";
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


	$sqlogrze = "SELECT ogrz_d, ogrz_d_bo FROM tab_te where id_d = '$nu';";
			
			$resultogrze = @pg_Exec($conn, $sqlogrze);
			$ogrzes = pg_result($resultogrze, 0, "ogrz_d");
			$ogrzebo = pg_result($resultogrze, 0, "ogrz_d_bo");
				
	$sqlogrzes = "SELECT nazwa_grz FROM ogrzewanie where id = '$ogrzes';";
			
			$resultogrzes = @pg_Exec($conn, $sqlogrzes);
			$ogrzeps = pg_result($resultogrzes, 0, "nazwa_grz");
	
$sqlciepwo = "SELECT ciewod_d, ciewod_d_bo FROM tab_te where id_d = '$nu';";
			
			$resultciepwo = @pg_Exec($conn, $sqlciepwo);
			$ciepwos = pg_result($resultciepwo, 0, "ciewod_d");
			$ciepwobo = pg_result($resultciepwo, 0, "ciewod_d_bo");
				
	$sqlciepwos = "SELECT nazwa_wo FROM ciepla_woda where id = '$ciepwos';";
			
			$resultciepwos = @pg_Exec($conn, $sqlciepwos);
			$ciepwops = pg_result($resultciepwos, 0, "nazwa_wo");

$sqlpra = "SELECT pra_d, pra_d_bo FROM tab_te where id_d = '$nu';";
			
			$resultpra = @pg_Exec($conn, $sqlpra);
			$pras = pg_result($resultpra, 0, "pra_d");
			$prabo = pg_result($resultpra, 0, "pra_d_bo");
				
	$sqlpras = "SELECT nazwa_pa FROM prad where id = '$pras';";
			
			$resultpras = @pg_Exec($conn, $sqlpras);
			$praps = pg_result($resultpras, 0, "nazwa_pa");

$sqlsila = "SELECT sila_d, sila_d_bo FROM tab_te where id_d = '$nu';";
			
			$resultsila = @pg_Exec($conn, $sqlsila);
			$silas = pg_result($resultsila, 0, "sila_d");
			$silabo = pg_result($resultsila, 0, "sila_d_bo");
				
	$sqlsilas = "SELECT nazwa_si FROM sila where id = '$silas';";
			
			$resultsilas = @pg_Exec($conn, $sqlsilas);
			$silaps = pg_result($resultsilas, 0, "nazwa_si");

$sqlmoc = "SELECT moc_d, moc_d_bo FROM tab_te where id_d = '$nu';";	
	$resultmoc = @pg_Exec($conn, $sqlmoc);
	$mocs = pg_result($resultmoc, 0, "moc_d");
	$mocsp = pg_result($resultmoc, 0, "moc_d_bo");

$sqlwoda = "SELECT wod_d, wod_d_bo FROM tab_te where id_d = '$nu';";
			
			$resultwodat = @pg_Exec($conn, $sqlwoda);
			$wodas = pg_result($resultwodat, 0, "wod_d");
			$wodabo = pg_result($resultwodat, 0, "wod_d_bo");
				
	$sqlwodas = "SELECT nazwa_wo FROM woda where id = '$wodas';";
			
			$resultwodas = @pg_Exec($conn, $sqlwodas);
			$wodaps = pg_result($resultwodas, 0, "nazwa_wo");

$sqlgaz = "SELECT gaz_d, gaz_d_bo FROM tab_te where id_d = '$nu';";
			
			$resultgaz = @pg_Exec($conn, $sqlgaz);
			$gazs = pg_result($resultgaz, 0, "gaz_d");
			$gazbo = pg_result($resultgaz, 0, "gaz_d_bo");
				
	$sqlgazs = "SELECT nazwa_g FROM gaz where id = '$gazs';";
			
			$resultgazs = @pg_Exec($conn, $sqlgazs);
			$gazps = pg_result($resultgazs, 0, "nazwa_g");

$sqlkanal = "SELECT kanal_d, kanal_d_bo FROM tab_te where id_d = '$nu';";
			
			$resultkanal = @pg_Exec($conn, $sqlkanal);
			$kanals = pg_result($resultkanal, 0, "kanal_d");
			$kanalbo = pg_result($resultkanal, 0, "kanal_d_bo");
				
	$sqlkanals = "SELECT nazwa_ka FROM kanaliza where id = '$kanals';";
			
			$resultkanals = @pg_Exec($conn, $sqlkanals);
			$kanalps = pg_result($resultkanals, 0, "nazwa_ka");

$sqltel = "SELECT tel_d, tel_d_bo FROM tab_te where id_d = '$nu';";
			
			$resulttel = @pg_Exec($conn, $sqltel);
			$tels = pg_result($resulttel, 0, "tel_d");
			$telbo = pg_result($resulttel, 0, "tel_d_bo");
				
	$sqltels = "SELECT nazwa_te FROM telefon where id = '$tels';";
			
			$resulttels = @pg_Exec($conn, $sqltels);
			$telps = pg_result($resulttels, 0, "nazwa_te");

$sqlkabl = "SELECT siecka_d, siecka_d_bo FROM tab_te where id_d = '$nu';";
			
			$resultkabl = @pg_Exec($conn, $sqlkabl);
			$kabls = pg_result($resultkabl, 0, "siecka_d");
			$kablbo = pg_result($resultkabl, 0, "siecka_d_bo");
				
	$sqlkabls = "SELECT nazwa_kab FROM kablowa where id = '$kabls';";
			
			$resultkabls = @pg_Exec($conn, $sqlkabls);
			$kablps = pg_result($resultkabls, 0, "nazwa_kab");

$sqlantena = "SELECT antena_d, antena_d_bo FROM tab_te where id_d = '$nu';";
			
			$resultantena = @pg_Exec($conn, $sqlantena);
			$antenas = pg_result($resultantena, 0, "antena_d");
			$antenabo = pg_result($resultantena, 0, "antena_d_bo");
				
	$sqlantenas = "SELECT nazwa_an FROM antena where id = '$antenas';";
			
			$resultantenas = @pg_Exec($conn, $sqlantenas);
			$antenaps = pg_result($resultantenas, 0, "nazwa_an");

$sqlsiec = "SELECT siecint_d, siecint_d_bo FROM tab_te where id_d = '$nu';";
			
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
echo "&nbsp;<b>Ciepła woda:</b><br>&nbsp;$ciepwops";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($prabo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Prąd:</b><br>&nbsp;$praps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($silabo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Siła:</b><br>&nbsp;$silaps";
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
echo "&nbsp;<b>Sieć kablowa:</b><br>&nbsp;$kablps";
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
echo "&nbsp;<b>Sieć internetowa:</b><br>&nbsp;$siecps";
echo "</td>";

}

if (($telbo == 't') || ($kablbo == 't') || ($antenabo == 't') || ($siecbo == 't')) {
echo "</tr>"; 
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}


$sqluli = "SELECT tdr_d, tdr_d_bo FROM tab_te where id_d = '$nu';";
			
			$resultuli = @pg_Exec($conn, $sqluli);
			$uli = pg_result($resultuli, 0, "tdr_d");
			$ulibo = pg_result($resultuli, 0, "tdr_d_bo");
				
	$sqlulis = "SELECT nazwa_ul FROM typ_ulicy where id = '$uli';";
			
			$resultulis = @pg_Exec($conn, $sqlulis);
			$ulips = pg_result($resultulis, 0, "nazwa_ul");

$sqlnadr = "SELECT ndr_d, ndr_d_bo FROM tab_te where id_d = '$nu';";
			
			$resultnadr = @pg_Exec($conn, $sqlnadr);
			$nadr = pg_result($resultnadr, 0, "ndr_d");
			$nadrbo = pg_result($resultnadr, 0, "ndr_d_bo");
				
	$sqlnadrs = "SELECT nazwa_na FROM nawierzchnia where id = '$nadr';";
			
			$resultnadrs = @pg_Exec($conn, $sqlnadrs);
			$nadrps = pg_result($resultnadrs, 0, "nazwa_na");

$sqlkomu = "SELECT kmod_d, kmod_d_bo FROM tab_te where id_d = '$nu';";
			
			$resultkomu = @pg_Exec($conn, $sqlkomu);
			$komu = pg_result($resultkomu, 0, "kmod_d");
			$komubo = pg_result($resultkomu, 0, "kmod_d_bo");
				
	$sqlkomus = "SELECT nazwa_kom FROM komunikacja where id = '$komu';";
			
			$resultkomus = @pg_Exec($conn, $sqlkomus);
			$komups = pg_result($resultkomus, 0, "nazwa_kom");

$sqlodcm = "SELECT odlce_d, odlce_d_bo FROM tab_te where id_d = '$nu';";
			
			$resultodcm = @pg_Exec($conn, $sqlodcm);
			$odcm = pg_result($resultodcm, 0, "odlce_d");
			$odcmbo = pg_result($resultodcm, 0, "odlce_d_bo");

$sqlotocz = "SELECT otnie_d, otnie_d_bo FROM tab_te where id_d = '$nu';";
			
			$resultotocz = @pg_Exec($conn, $sqlotocz);
			$otocz = pg_result($resultotocz, 0, "otnie_d");
			$otoczbo = pg_result($resultotocz, 0, "otnie_d_bo");
				
	$sqlotoczs = "SELECT nazwa_oto FROM otoczenie where id = '$otocz';";
			
			$resultotoczs = @pg_Exec($conn, $sqlotoczs);
			$otoczps = pg_result($resultotoczs, 0, "nazwa_oto");	
			
$sqlpoloz = "SELECT polo_d, polo_d_bo FROM tab_te where id_d = '$nu';";
			
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
echo "&nbsp;<b>Otoczenie nieuciążl.:</b><br>&nbsp;$otoczps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

} 

if ($polobo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Położenie:</b><br>&nbsp;$polops";
echo "</td>";
} 


if (($otoczbo == 't') || ($polobo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}



$sqllas = "SELECT las_d, las_d_bo FROM tab_te where id_d = '$nu';";
			
			$resultlas = @pg_Exec($conn, $sqllas);
			$las = pg_result($resultlas, 0, "las_d");
			$lasbo = pg_result($resultlas, 0, "las_d_bo");
				
	$sqllass = "SELECT nazwa_la FROM las where id = '$las';";
			
			$resultlass = @pg_Exec($conn, $sqllass);
			$lasps = pg_result($resultlass, 0, "nazwa_la");

$sqlpark = "SELECT park_d, park_d_bo FROM tab_te where id_d = '$nu';";
			
			$resultpark = @pg_Exec($conn, $sqlpark);
			$park = pg_result($resultpark, 0, "park_d");
			$parkbo = pg_result($resultpark, 0, "park_d_bo");
				
	$sqlparks = "SELECT nazwa_par FROM park where id = '$park';";
			
			$resultparks = @pg_Exec($conn, $sqlparks);
			$parkps = pg_result($resultparks, 0, "nazwa_par");

$sqlrzeka = "SELECT rzeka_d, rzeka_d_bo FROM tab_te where id_d = '$nu';";
			
			$resultrzeka = @pg_Exec($conn, $sqlrzeka);
			$rzeka = pg_result($resultrzeka, 0, "rzeka_d");
			$rzekabo = pg_result($resultrzeka, 0, "rzeka_d_bo");
				
	$sqlrzekas = "SELECT nazwa_rz FROM rzeka where id = '$rzeka';";
			
			$resultrzekas = @pg_Exec($conn, $sqlrzekas);
			$rzekaps = pg_result($resultrzekas, 0, "nazwa_rz");

$sqljezioro = "SELECT jezioro_d, jezioro_d_bo FROM tab_te where id_d = '$nu';";
			
			$resultjezioro = @pg_Exec($conn, $sqljezioro);
			$jezioro = pg_result($resultjezioro, 0, "jezioro_d");
			$jeziorobo = pg_result($resultjezioro, 0, "jezioro_d_bo");
				
	$sqljezioros = "SELECT nazwa_je FROM jezioro where id = '$jezioro';";
			
			$resultjezioros = @pg_Exec($conn, $sqljezioros);
			$jeziorops = pg_result($resultjezioros, 0, "nazwa_je");

$sqlstaw = "SELECT staw_d, staw_d_bo FROM tab_te where id_d = '$nu';";
			
			$resultstaw = @pg_Exec($conn, $sqlstaw);
			$staw = pg_result($resultstaw, 0, "staw_d");
			$stawbo = pg_result($resultstaw, 0, "staw_d_bo");
				
	$sqlstaws = "SELECT nazwa_sta FROM staw where id = '$staw';";
			
			$resultstaws = @pg_Exec($conn, $sqlstaws);
			$stawps = pg_result($resultstaws, 0, "nazwa_sta");

$sqlgory = "SELECT gory_d, gory_d_bo FROM tab_te where id_d = '$nu';";
			
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
echo "&nbsp;<b>Las w pobliżu:</b><br>&nbsp;$lasps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";
}

if ($parkbo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Park w pobliżu:</b><br>&nbsp;$parkps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($rzekabo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Rzeka w pobliżu:</b><br>&nbsp;$rzekaps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($jeziorobo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Jezioro w pobliżu:</b><br>&nbsp;$jeziorops";
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
echo "&nbsp;<b>Staw w pobliżu:</b><br>&nbsp;$stawps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if ($gorybo == 't') {

echo "<td width=\"127\" height=\"25\">";
echo "&nbsp;<b>Góry w pobliżu:</b><br>&nbsp;$goryps";
echo "</td>";

echo "<td width=\"1\" height=\"25\">";
echo  "<img src=\"../img/black.gif\" width=\"1\" height=\"100%\" border=\"0\"></img>";
echo "</td>";

}

if (($stawbo == 't') || ($gorybo == 't')) {
echo "</tr>";
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}



$sqldodop = "SELECT dodopis, dodopis_bo FROM tab_te where id_d = '$nu';";
			
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


?>
<SCRIPT language=JavaScript type=text/javascript>self.print()</SCRIPT>
</BODY>
</HTML>
