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

$identbiura = "1";
$ok = "_b";
// polaczenie z baza
include "concfg.inc";
if (!conn){
	echo "Przykro nam w tej chwili baza ofert jest chwilowo nieczynna.\n";
	exit;
}	

$sql1 = "select id, numer, lok, pow_uzytk1, pow_uzytk2, opis, cena1, cena2 from tab_obi_ku where usun = 'f' and id_b = '$identbiura' order by data;";

$result_set1 = pg_Exec($conn, $sql1);

$rows1 = pg_NumRows($result_set1);		// liczba zwroconych wierszy

if ((!$result_set1) || ($rows1 > 0)) { 

echo "<center>";
echo "<span class=\"nag2b\">";
echo "<b>KUPNO OBIEKTÓW</b>";
echo "<br>";
echo "</span>";
echo "</center>";

}


echo "<table width=\"516\" cellpadding=\"0\" cellspacing=\"0\" frame border=\"1\">";
if ((!$result_set1) || ($rows1 > 0)) { 
echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";
}

	for ($i=0; $i < $rows1; $i++) {

		$id1 = pg_result($result_set1, $i, "id");
		$numer1 = pg_result($result_set1, $i, "numer");
		$lok1 = pg_result($result_set1, $i, "lok");
		$powuzyt1 = pg_result($result_set1, $i, "pow_uzytk1");
		$powuzyt2 = pg_result($result_set1, $i, "pow_uzytk2");
		$pietro1m = pg_result($result_set1, $i, "pietro1");
		$pietro2m = pg_result($result_set1, $i, "pietro2");
		$opis1 = pg_result($result_set1, $i, "opis");
		$cena1m = pg_result($result_set1, $i, "cena1");
		$cena2m = pg_result($result_set1, $i, "cena2");



		

echo "<tr bgcolor=\"#5865E5\">";
echo "<td width=\"103\" align = \"left\">";
echo "<span class=\"nag1wb\">";
echo "&nbsp;Numer:";
echo "</span>";
echo "</td>";

echo "<td width=\"300\" align = \"left\">";
echo "<span class=\"nag1wb\">";
echo "&nbsp;Lokalizacja:";
echo "</span>";
echo "</td>";

echo "<td width=\"113\" align = \"left\">";
echo "<span class=\"nag1wb\">";
echo "&nbsp;Pow. użytkowa:";
echo "</span>";
echo "</td>";

echo "</tr>";

echo "<tr>";
echo "<td width=\"103\" align = \"left\">";
echo "$numer1";
echo "</td>";

echo "<td width=\"300\" align = \"left\">";
echo "$lok1";
echo "</td>";

echo "<td width=\"113\" align = \"left\">";
echo "od $powuzyt1 m2 do $powuzyt2 m2";
echo "</td>";

echo "</tr>";

echo "<tr bgcolor=\"#5865E5\">";

echo "<td align = \"left\" colspan = \"3\">";
echo "<span class=\"nag1wb\">";
echo "&nbsp;Cena:";
echo "</span>";
echo "</td>";

echo "</tr>";

echo "<tr>";

$cena1m = number_format($cena1m,'', '.', '.');
$cena2m = number_format($cena2m,'', '.', '.');

echo "<td align = \"left\" colspan = \"3\">";
echo "od $cena1m zł. do $cena2m zł.";
echo "</td>";

echo "</tr>";

echo "<tr bgcolor=\"#5865E5\">";

echo "<td align = \"left\" colspan = \"5\">";
echo "<span class=\"nag1wb\">";
echo "&nbsp;Opis:";
echo "</span>";
echo "</td>";

echo "</tr>";

echo "<tr>";
echo "<td align = \"left\" colspan = \"5\">";
echo "&nbsp;$opis1";
echo "</td>";
echo "</tr>";

echo "<tr><td colspan=\"40\"><img src=\"../img/black.gif\" width=\"100%\" height=\"1\" border=\"0\"></img></td></tr>";

echo "<tr><td colspan=\"40\">";
echo "<br>";
echo "</td>";
echo "</tr>";

}
echo "</table>";


?>
<SCRIPT language=JavaScript type=text/javascript>self.print()</SCRIPT>
</BODY>
</HTML>