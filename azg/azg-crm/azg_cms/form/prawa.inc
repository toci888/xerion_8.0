<!--<link href="css/style.css" rel="stylesheet" type="text/css">-->
<?php
    include_once ('ui/kontrolki_html.php');
    include_once ('dal/queriesDAL.php');
    include_once ('ui/utilsui.php');
    include_once ('bll/parametrynierbll.php'); 
    include_once ('bll/tags.php'); 
    include_once ('bll/agentbll.php');
    include_once ('bll/jezykibll.php');
    include_once ('bll/cache.php');
    include_once ('bll/transnierbll.php');
    require('naglowek.php');
    require('conf.php');
    
    $identbiura = "1";
    $ok = "_b";

    $obiektTrans = new TransNierDAL();      
    $tabNier = $obiektTrans->PodajListeNieruchomosci($ilosc_wierszy);
    $tabTrans = $obiektTrans->PodajListeTransakcji(array(TransNierDAL::$of_zap => tags::$oferta), $ilosc_wierszy);
    $tabReg = SlownikDAL::PobierzDzielniceOpole();
        
    echo '<table width="128" cellpadding="0" cellspacing="0" border="0"><tr><td colspan=2" ><img src="img/red.gif" width="128" height="1" border="0"></td></tr>
    <tr><td colspan="2" height="5" class="tdnag"><center><span class="nag1wb">'.
    UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$znajdz_nieruchomosci), $_SESSION[$jezyk]).'</span></center></td></tr>
    <tr><td colspan=2" ><img src="img/red.gif" width="128" height="1" border="0" /></td></tr><tr><td colspan="2">
    <form action="'.$_SERVER['PHP_SELF'].'" name="szukanie_filtr" method="GET"><table><tr><td align="center">'; //<form action="'.$_SERVER['PHP_SELF'].'" method="GET">
    //method="POST" 
    
    $nier_id = 2;
    $trans_id = null;
    $pow_min = null;
    $l_pok_min = null;
    $pow_max = null;
    $l_pok_max = null;
    $cena_max = null;
    $reg_id = 1;
    
    //if (isset($_POST['filtruj']))
    if (isset($_GET['filtruj']))
    {
        //$nier_id = $_POST[StronaPodsInfoDAL::$id_nier_rodzaj];
        $nier_id = $_GET[StronaPodsInfoDAL::$id_nier_rodzaj];
        //$trans_id = $_POST[StronaPodsInfoDAL::$id_trans_rodzaj];
        $trans_id = $_GET[StronaPodsInfoDAL::$id_trans_rodzaj];
        $reg_id = $_GET[StronaPodsInfoDAL::$id_region_geog];
        //$pow_min = $_POST[StronaPodsInfoDAL::$pow_min];
        $pow_min = $_GET[StronaPodsInfoDAL::$pow_min];
        $l_pok_min = $_GET[StronaPodsInfoDAL::$l_pok_min];
        //$pow_max = $_POST[StronaPodsInfoDAL::$pow_max];
        $pow_max = $_GET[StronaPodsInfoDAL::$pow_max];
        $l_pok_max = $_GET[StronaPodsInfoDAL::$l_pok_max];
        //$cena_max = $_POST[StronaPodsInfoDAL::$cena_max];
        $cena_max = $_GET[StronaPodsInfoDAL::$cena_max];
    }
    
    
    echo '<span class="poleca"><b>'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nieruchomosc), $_SESSION[$jezyk]).':</b></td></tr><tr><td align="center">';
    KontrolkiHtml::DodajSelectDomWartId('nieruchomosci', 'id_nieruchomosci', $tabNier, StronaPodsInfoDAL::$id_nier_rodzaj, $nier_id, '', '', TransNierDAL::$id, TransNierDAL::$nazwa_nieruchomosc, true);

    echo '</td></tr>
    <tr><td align="center"><b>'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$oferta), $_SESSION[$jezyk]).':</b></td></tr><tr><td align="center">';
    unset($tabTrans[2]);
    KontrolkiHtml::DodajSelectDomWartId('transakcje', 'id_transakcje', $tabTrans, StronaPodsInfoDAL::$id_trans_rodzaj, $trans_id, '', '', null, null, true);
    
    echo '</td></tr><tr><td align="center"><b>'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$dzielnica), $_SESSION[$jezyk]).':</b></td></tr><tr><td align="center">';
    KontrolkiHtml::DodajSelectDomWartId('region_geog_filtr', 'id_region_geog_filtr', $tabReg, StronaPodsInfoDAL::$id_region_geog, $reg_id, '', 'style="width: 120px;"', null, null, true); 
    
    echo '</td></tr><tr><td align="center"><span class="poleca"><b>'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$powierzchnia), $_SESSION[$jezyk]).':</b></span></td></tr><tr><td align="center"><span class="poleca"><b>'.
    UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$od), $_SESSION[$jezyk]).'</b></span>&nbsp;';
    KontrolkiHtml::DodajLiczbaWymiernaTextbox(StronaPodsInfoDAL::$pow_min, 'id_pow_min', $pow_min, 5, 3, '');
//&nbsp;&nbsp;
    echo '<br /><span class="poleca"><b>'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$do), $_SESSION[$jezyk]).'</b></span>&nbsp;';
    KontrolkiHtml::DodajLiczbaWymiernaTextbox(StronaPodsInfoDAL::$pow_max, 'id_pow_max', $pow_max, 5, 3, '');
    //////liczba pokoi
    echo '</td></tr><tr><td align="center"><span class="poleca"><b>'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$liczba_pokoi), $_SESSION[$jezyk]).':</b></span></td></tr><tr><td align="center"><span class="poleca"><b>'.
    UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$od), $_SESSION[$jezyk]).'</b></span>';
    KontrolkiHtml::DodajLiczbaWymiernaTextbox(StronaPodsInfoDAL::$l_pok_min, 'id_pok_min', $l_pok_min, 3, 1, '');
//&nbsp;&nbsp;
    echo '<span class="poleca"><b>'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$do), $_SESSION[$jezyk]).'</b></span>';
    KontrolkiHtml::DodajLiczbaWymiernaTextbox(StronaPodsInfoDAL::$l_pok_max, 'id_pok_max', $l_pok_max, 3, 1, '');

    echo '</td></tr><tr><td align="center"><span class="poleca"><b>'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$do_ceny), $_SESSION[$jezyk]).':</b></span></td></tr><tr><td align="center">';
    KontrolkiHtml::DodajLiczbaCalkowitaTextbox(StronaPodsInfoDAL::$cena_max, 'id_cena', $cena_max, 9, 9, '');

    echo '</td></tr><tr><td align="center">';
    KontrolkiHtml::DodajSubmit('filtruj', 'id_filtruj', UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$szukaj), $_SESSION[$jezyk]), '');

    echo '</td></tr></table></form>';
    echo '</td></tr>';
    //
    echo '<tr><td colspan=2" ><img src="img/red.gif" width="128" height="1" border="0"></td></tr>
    <tr><td colspan="2" align="center">
        <form action="'.$_SERVER['PHP_SELF'].'" name="szukanie_wg_nr" method="GET"><table><tr><td><span class="poleca"><b>'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$numer_oferty), $_SESSION[$jezyk]).': </b></span>';
        KontrolkiHtml::DodajLiczbaCalkowitaTextbox(StronaPodsInfoDAL::$id_oferta, 'id_'.StronaPodsInfoDAL::$id_oferta, '', 5, 2, '');
        echo '</td></tr><tr><td colspan="2" align="center">';
        KontrolkiHtml::DodajSubmit('filtruj_nr_oferta', 'id_filtruj_nr_oferta', UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$szukaj), $_SESSION[$jezyk]), '');
        echo '</td></tr></table></form>';
    echo '</td></tr>';
    //
    echo '<tr><td colspan=2" ><img src="img/red.gif" width="128" height="1" border="0"></td></tr>
    <tr><td colspan="2" height="5" class="tdnag"><center><span class="nag1wb">'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$kontakt), $_SESSION[$jezyk]).'</span></center></td></tr>
    <tr><td colspan="2"><img src="img/red.gif" width="128" height="1" border="0"></td></tr><tr><td colspan="2"><center>';

        echo '<span class="poleca"><u><b>'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$siedziba_glowna), $_SESSION[$jezyk]).'</b></u><br />'.
        UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$ul), $_SESSION[$jezyk]).'Szarych Szeregów 34d<br />45-285 OPOLE<br />
        '.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$tel_fax), $_SESSION[$jezyk]).':(077)402-75-20<br />'.
        UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$tel_kom), $_SESSION[$jezyk]).'.0602-531-334<br /><a href="mailto:azgwarancja@azg.pl">azgwarancja@azg.pl</a>';
        echo '<br />'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$pon), $_SESSION[$jezyk]).'. - '.
        UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$pt), $_SESSION[$jezyk]).'. 10.00 - 18.00<br />
        <span class="poleca"><a href="image.php?p=info/mapab.jpg&w=600&h=400&i=Mapa" 
        onclick="NewWindow(this.href,\'name\',620,420,\'no\');return false;"><b>'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$mapa_lokalizacyjna), $_SESSION[$jezyk]).
        '</b></a></span></center></td></tr>'; //&#187;
        echo '<tr><td colspan="2"><img src="img/red.gif" width="128" height="1" border="0"></td></tr><tr><td colspan="2"><center><span class="poleca"><u><b>'.
        UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$filia), $_SESSION[$jezyk]).' '.
        UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nr), $_SESSION[$jezyk]).' I</b></u><br />
        '.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$ul), $_SESSION[$jezyk]).' Bytnara Rudego 13<br />45-284 OPOLE<br />'.
        UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$tel_fax), $_SESSION[$jezyk]).':(077)458-00-94<br />'.
        UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$pon), $_SESSION[$jezyk]).'. - '.
        UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$pt), $_SESSION[$jezyk]).'. 10.00 - 18.00<br /></span></center></td></tr>';

echo '<tr><td colspan="2"><img src="img/red.gif" width="128" height="1" border="0"></td></tr>';
echo '<tr><td colspan="2" height="5" class="tdnag"><center><span class="nag1wb">'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zglos_oferte), $_SESSION[$jezyk]).'</span></center></td></tr>
<tr><td colspan="2"><img src="img/red.gif" width="128" height="1" border="0"></td></tr><tr><td colspan="2"><center>';

echo '<span class="poleca">'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zglos_nieruchomosc), $_SESSION[$jezyk]).'<br>'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$kliknij_ponizszy_link), $_SESSION[$jezyk]).
':<br><a href="index.php?action=dodajform">&#171; '.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$formularz), $_SESSION[$jezyk]).' &#187;</a><br /></span></center></td></tr>';

echo '<tr><td colspan="2"><img src="img/red.gif" width="128" height="1" border="0"></td></tr>';
echo '<tr><td colspan="2" height="5" class="tdnag"><center><span class="nag1wb">'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$subskrypcja), $_SESSION[$jezyk]).'</span></center></td></tr>
<tr><td colspan="2"><img src="img/red.gif" width="128" height="1" border="0"></td></tr><tr><td colspan="2"><center>';

    echo '<span class="poleca">'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$aby_otrzymywac_informacje), $_SESSION[$jezyk]).' '.
    strtolower(UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$kliknij_ponizszy_link), $_SESSION[$jezyk])).':<br />';
    
echo "<a href=\"index.php?action=dodajsub\">&#171; ".UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$formularz), $_SESSION[$jezyk])." &#187;";
echo "</a>";
echo "<br>";
echo "</span>";
echo "</center>
</td>
</tr>";
echo "<tr><td colspan=\"2\"><img src=\"img/red.gif\" width=\"128\" height=\"1\" border=\"0\" alt=\"\"></td></tr>";
/*
echo "<tr><td colspan=\"2\" height=\"5\" bgcolor=\"#5865E5\">
	<center>
	<span class=\"nag1wb\">KURSY WALUT</span>
	</center>
	</td></tr>
<tr><td colspan=\"2\"><img src=\"img/red.gif\" width=\"128\" height=\"1\" border=\"0\" alt=\"\"></td></tr>
<tr>
<td colspan=\"2\">
<center>";


// Pocz±tek pobierania linku do kursu walut w formacie XML...
$a = "0";
$connect = fopen("http://www.nbp.pl/kursy/kursya.html", "r");
if ($connect) {
while (!feof ($connect)) {
   $a++;
   $buffer = fgets($connect, 4096);
   if($a=="226") {
   $link = $buffer;
   }
}
};
fclose($connect);

// Koniec pobierania linku do kursu walut w formacie XML

// Wycinanie linku
$link1 = strstr($link, 'xml');
$link2 = substr($link1, '0', '19');
$link = "http://www.nbp.pl/kursy/".$link2;

// Koniec. Link w zmiennej $link.

// Pobieranie arkusza XML
$a = "0";
$connect = fopen($link, "r");
if ($connect) {
while (!feof ($connect)) {
   $a++;
   $buffer = fgets($connect, 4096);
   if($a=="4") {
   $datak = $buffer;
   }
   elseif($a=="3") {
   $numerk = $buffer;
   }
   elseif($a=="6") {
   $waluta1 = $buffer;
   }
   elseif($a=="14") {
   $symbol1 = $buffer;
   }
   elseif($a=="15") {
   $kurs1 = $buffer;
   }
   elseif($a=="30") {
   $waluta2 = $buffer;
   }
   elseif($a=="50") {
   $symbol2 = $buffer;
   }
   elseif($a=="51") {
   $kurs2 = $buffer;
   }
   elseif($a=="24") {
   $waluta3 = $buffer;
   }
   elseif($a=="68") {
   $symbol3 = $buffer;
   }
   elseif($a=="69") {
   $kurs3 = $buffer;
   }
   elseif($a=="54") {
   $waluta4 = $buffer;
   }
   elseif($a=="62") {
   $symbol4 = $buffer;
   }
   elseif($a=="63") {
   $kurs4 = $buffer;
   }
   elseif($a=="42") {
   $waluta5 = $buffer;
   }
   elseif($a=="32") {
   $symbol5 = $buffer;
   }
   elseif($a=="33") {
   $kurs5 = $buffer;
   }
}
};
fclose($connect);
echo "<span class = \"poleca\"><b>".$datak.", wg NBP:</b><br>1 ".$symbol1." - ".$kurs1."z³.<br>1 ".$symbol2." - ".$kurs2." z³.<br>1 ".$symbol3." - ".$kurs3." z³.<br>1 ".$symbol4." - ".$kurs4."z³.<br>1 ".$symbol5." - ".$kurs5."z³.</span>";
echo "</center>
</td>
</tr>";

echo "<tr><td colspan=\"2\"><img src=\"img/red.gif\" width=\"128\" height=\"1\" border=\"0\" alt=\"\"></td></tr>";
*/
echo '<tr><td colspan="2" height="5" class="tdnag"><center><span class="nag1wb">'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nalezymy_do), $_SESSION[$jezyk]).'</span></center></td></tr>
<tr><td colspan="2"><img src="img/red.gif" width="128" height="1" border="0"></td></tr><tr><td colspan="2"><center>';

echo "<tr><td width = \"62\"><img src=\"img/ospprn.jpg\" width=\"62\" height=\"80\" border=\"0\"></td>";
echo "<td width = \"62\"><img src=\"img/pfrns.jpg\" width=\"62\" height=\"80\" border=\"0\" alt=\"\"></td></tr>";
echo "<tr><td colspan =\"2\" width = \"62\"><center><img src=\"img/pte.jpg\" width=\"62\" height=\"80\" border=\"0\" alt=\"\"></center></td>";
echo "</table>";		

    require('stopka.php');
?>