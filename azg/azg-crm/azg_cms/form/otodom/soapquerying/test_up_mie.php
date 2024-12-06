<?
    //$dsqa = new SoapClient("http://beta.otodom.pl/webapi/web.php");
    //var_dump($dsqa);
    
    include 'OtoDomClient.php';
    include 'oblicz_date.php';  

    $otoDom =& new OtoDomSupport();
    $offerType = 'sell_Flat';
    $localization = 'in building';
    $zdj_for_otodom_prefix = 'img/';  


    $tabela = 'tab_mie';
    $klucz_pod = 'id_m';
    $rodzaj_nier = 'Mieszkanie';

    $techn_bud = 'teb';
    $ciepla_woda_n = 'cwod';
    $sila_n = 'si';
    $gaz_n = 'gaz';
    $kan_n = 'kan';
    $tel_n = 'tel';
    $kabl_n = 'sk';
    $ant_n = 'ant';
    $inter_n = 'siec';
    $ogrz_n = 'ogrz';
    $parking_n = 'mip';
    
    $las_n = 'las';
    $park_n = 'park';
    $rzeka_n = 'rzeka';
    $jezioro_n = 'jezioro';
    $staw_n = 'staw';
    $gory_n = 'gory';
    $fitnes_n = 'fc';
    $plac_zabaw_n = 'pz';
    $sauna_n = 'sau';
    $basen_n = 'bas';
    $kort_n = 'kt';
    
    $typ_ul_n = 'tdr';
    $naw_ul_n = 'ndr';
    $komunikacja_n = 'komi';
    
    $nowdates = date("Y-m-d");
    
    $otoDom =& new OtoDomSupport();
    //$ins_kinds = $otoDom->GetInsertionKinds();
    //var_dump($ins_kinds);
    $conn = pg_connect ("host=localhost user=azg password=beatka dbname=azg");
    //te co poszly i zadzialaly: 1267, 1018, 1254, 1277
    $idut = 1277;

$sqllok = "SELECT id_m, no_m, lok_m, lok_p, lok_w, powuzyt_m, lp_m, cm_m, np_m, lpi_m, cz_prze_m, spr_m, std, rk, rb, ogrz, cwod, dodopis, id_a, zd1, zd2, zd3, zd4, zd5, zd6  FROM tab_mie where id_m = '$idut';";    
    $result = @pg_Exec($conn, $sqllok);
    $iden = pg_result($result, 0, "id_m");
    $numof = pg_result($result, 0, "no_m");
    $lokali = pg_result($result, 0, "lok_m");
    
    require('woj_pow_kat.php');    

/*$sqlpowiat = "SELECT lok_p FROM tab_mie where id_m = '$idut';";
            
            $resultpowiat = @pg_Exec($conn, $sqlpowiat);
            $powiatn = pg_result($resultpowiat, 0, "lok_p");
                
    $sqlpowiats = "SELECT nazwa_p FROM powiaty where id_pow = '$powiatn';";
            
            $resultpowiats = @pg_Exec($conn, $sqlpowiats);
    
    $powiatns = pg_result($resultpowiats, 0, "nazwa_p");

$sqlwoj = "SELECT lok_w FROM tab_mie where id_m = '$idut';";
            
            $resultwoj = @pg_Exec($conn, $sqlwoj);
            $wojn = pg_result($resultwoj, 0, "lok_w");
            
    $sqlwojs = "SELECT nazwa_w FROM wojewodztwa where id_w = '$wojn';";
            
            $resultwojs = @pg_Exec($conn, $sqlwojs);
    $wojns = pg_result($resultwojs, 0, "nazwa_w");  */
    
    $powuzy = pg_result($result, 0, "powuzyt_m");
    $lipok = pg_result($result, 0, "lp_m");
    $cenami = pg_result($result, 0, "cm_m");
    $numerpie = pg_result($result, 0, "np_m");
    $liczbapie = pg_result($result, 0, "lpi_m");


$sqlczasp = "SELECT cz_prze_m FROM tab_mie where id_m = '$idut';";
            
            $resultczasp = @pg_Exec($conn, $sqlczasp);
            $czasp = pg_result($resultczasp, 0, "cz_prze_m");
                
    $sqlczasps = "SELECT nazwa_prz FROM czas_prz where id = '$czasp';";
            
            $resultczasps = @pg_Exec($conn, $sqlczasps);
    $czasps = pg_result($resultczasps, 0, "nazwa_prz");

$sqlprawny = "SELECT spr_m FROM tab_mie where id_m = '$idut';";
            
            $resultprawny = @pg_Exec($conn, $sqlprawny);
            $prawny = pg_result($resultprawny, 0, "spr_m");
                
    $sqlprawnys = "SELECT nazwa_pr FROM stan_pr where id = '$prawny';";
            
            $resultprawnys = @pg_Exec($conn, $sqlprawnys);
    $prawnyss = pg_result($resultprawnys, 0, "nazwa_pr");    
    
$sqlstand = "SELECT std FROM tab_mie where id_m = '$idut';";
            
            $resultstand = @pg_Exec($conn, $sqlstand);
            $stand = pg_result($resultstand, 0, "std");
            
    $sqlstands = "SELECT nazwa_stan FROM standard where id = '$stand';";
            
            $resultstands = @pg_Exec($conn, $sqlstands);
    $standps = pg_result($resultstands, 0, "nazwa_stan");

$sqlrokuch = "SELECT rk FROM tab_mie where id_m = '$idut';";
            
            $resultrokuch = @pg_Exec($conn, $sqlrokuch);
            $rokuchs = pg_result($resultrokuch, 0, "rk");
            
                
    $sqlrokuchs = "SELECT nazwa_kuch FROM rodzaj_kuchni where id = '$rokuchs';";
            
            $resultrokuchs = @pg_Exec($conn, $sqlrokuchs);
    $rokuchps = pg_result($resultrokuchs, 0, "nazwa_kuch");

$sqlrobu = "SELECT rb FROM tab_mie where id_m = '$idut';";
            
            $resultrobu = @pg_Exec($conn, $sqlrobu);
            $robus = pg_result($resultrobu, 0, "rb");
                            
    $sqlrobus = "SELECT nazwa_b FROM rodzaj_b where id = '$robus';";
            
            $resultrobus = @pg_Exec($conn, $sqlrobus);
    $robups = pg_result($resultrobus, 0, "nazwa_b");
    
$sqlogrze = "SELECT ogrz FROM tab_mie where id_m = '$idut';";
            
            $resultogrze = @pg_Exec($conn, $sqlogrze);
            $ogrzes = pg_result($resultogrze, 0, "ogrz");
                            
    $sqlogrzes = "SELECT nazwa_grz FROM ogrzewanie where id = '$ogrzes';";
            
            $resultogrzes = @pg_Exec($conn, $sqlogrzes);
    $ogrzeps = pg_result($resultogrzes, 0, "nazwa_grz");

$sqlciepwo = "SELECT cwod FROM tab_mie where id_m = '$idut';";
            
            $resultciepwo = @pg_Exec($conn, $sqlciepwo);
            $ciepwos = pg_result($resultciepwo, 0, "cwod");
                            
    $sqlciepwos = "SELECT nazwa_wo FROM ciepla_woda where id = '$ciepwos';";
            
            $resultciepwos = @pg_Exec($conn, $sqlciepwos);
    $ciepwops = pg_result($resultciepwos, 0, "nazwa_wo");

$sqldodop = "SELECT dodopis, dodopis_bo FROM tab_mie where id_m = '$idut';";
            
            $resultdodop = @pg_Exec($conn, $sqldodop);
    $dodop = pg_result($resultdodop, 0, "dodopis");

$sqlagent = "SELECT id_a FROM tab_mie where id_m = '$idut';";
            
            $resultagent = @pg_Exec($conn, $sqlagent);
            $agent = pg_result($resultagent, 0, "id_a");

    $sqlagents = "SELECT nazwa_a, tel_a, tel_kom_a, email_a FROM tab_agent where id_a = '$agent';";
            
            $resultagents = @pg_Exec($conn, $sqlagents);
    $nazwaagenta = pg_result($resultagents, 0, "nazwa_a");
    $nazwatel = pg_result($resultagents, 0, "tel_a");
    $nazwatelkom = pg_result($resultagents, 0, "tel_kom_a");
    $nazwaemail = pg_result($resultagents, 0, "email_a");

$zdsa1 = pg_result($result, 0, "zd1");
$zdsa2 = pg_result($result, 0, "zd2");
$zdsa3 = pg_result($result, 0, "zd3");
$zdsa4 = pg_result($result, 0, "zd4");
$zdsa5 = pg_result($result, 0, "zd5");
$zdsa6 = pg_result($result, 0, "zd6");

$did = "_b";

$zds1 = "zd$zdsa1$did.jpg";
$zds2 = "zd$zdsa2$did.jpg";
$zds3 = "zd$zdsa3$did.jpg";
$zds4 = "zd$zdsa4$did.jpg";
$zds5 = "zd$zdsa5$did.jpg";
$zds6 = "zd$zdsa6$did.jpg";
                                                                                                                                 
$znak = "-";

  $liczbb = strrpos($lokali,$znak);
  $miast = substr($lokali,0,$liczbb);
  $dzieln = str_replace('- ','',strstr( $lokali, $znak));

$sqlwyl = "SELECT wyl_m FROM tab_mie where id_m = '$idut';";
            
            $resultwyls = @pg_Exec($conn, $sqlwyl);
            $rowswyls = pg_NumRows($resultwyls);        // liczba zwroconych wierszy

$wyls = pg_result($resultwyls, 0, "wyl_m");
if ($wyls == "2") {
$wylacz = "1";
}
else {
$wylacz = "0";
}

$sqlzacja = "SELECT loka FROM tab_mie where id_m = '$idut';";
            
            $resultzacja = @pg_Exec($conn, $sqlzacja);
            $zacja = pg_result($resultzacja, 0, "loka");
                
    $sqlzacjas = "SELECT loka_m FROM lokalizacja where id = '$zacja';";
            
            $resultzacjas = @pg_Exec($conn, $sqlzacjas);
$zacjaps = pg_result($resultzacjas, 0, "loka_m");

if ($zacjaps == "O") {
$zacj = "Opole";
}

if ($zacjaps == "P") {
$zacj = "Poza Opolem";
}
$liczbapoz = $liczbapie +1;

$sqlpop1 = "SELECT pop1 FROM tab_mie where id_m = '$idut';";
            $resultpop1 = @pg_Exec($conn, $sqlpop1);
            $pop1s = pg_result($resultpop1, 0, "pop1");
$sqlpop1s = "SELECT nazwa_pod FROM podlogi where id = '$pop1s';";
            $resultpop1s = @pg_Exec($conn, $sqlpop1s);
$pop1ps = pg_result($resultpop1s, 0, "nazwa_pod");

$sqlsc1 = "SELECT ps1 FROM tab_mie where id_m = '$idut';";
            $resultsc1 = @pg_Exec($conn, $sqlsc1);
            $psc1s = pg_result($resultsc1, 0, "ps1");
$sqlsc1s = "SELECT nazwa_sc FROM sciany where id = '$psc1s';";
            $resultsc1s = @pg_Exec($conn, $sqlsc1s);
$psc1ps = pg_result($resultsc1s, 0, "nazwa_sc");


$sqlpop2 = "SELECT pop2 FROM tab_mie where id_m = '$idut';";
            $resultpop2 = @pg_Exec($conn, $sqlpop2);
            $pop2s = pg_result($resultpop2, 0, "pop2");
$sqlpop2s = "SELECT nazwa_pod FROM podlogi where id = '$pop2s';";
            $resultpop2s = @pg_Exec($conn, $sqlpop2s);
$pop2ps = pg_result($resultpop2s, 0, "nazwa_pod");

$sqlsc2 = "SELECT ps2 FROM tab_mie where id_m = '$idut';";
            $resultsc2 = @pg_Exec($conn, $sqlsc2);
            $psc2s = pg_result($resultsc2, 0, "ps2");
$sqlsc2s = "SELECT nazwa_sc FROM sciany where id = '$psc2s';";
            $resultsc2s = @pg_Exec($conn, $sqlsc2s);
$psc2ps = pg_result($resultsc2s, 0, "nazwa_sc");


$sqlpop3 = "SELECT pop3 FROM tab_mie where id_m = '$idut';";
            $resultpop3 = @pg_Exec($conn, $sqlpop3);
            $pop3s = pg_result($resultpop3, 0, "pop3");
$sqlpop3s = "SELECT nazwa_pod FROM podlogi where id = '$pop3s';";
            $resultpop3s = @pg_Exec($conn, $sqlpop3s);
$pop3ps = pg_result($resultpop3s, 0, "nazwa_pod");

$sqlsc3 = "SELECT ps3 FROM tab_mie where id_m = '$idut';";
            $resultsc3 = @pg_Exec($conn, $sqlsc3);
            $psc3s = pg_result($resultsc3, 0, "ps3");
$sqlsc3s = "SELECT nazwa_sc FROM sciany where id = '$psc3s';";
            $resultsc3s = @pg_Exec($conn, $sqlsc3s);
$psc3ps = pg_result($resultsc3s, 0, "nazwa_sc");


$sqlpop4 = "SELECT pop4 FROM tab_mie where id_m = '$idut';";
            $resultpop4 = @pg_Exec($conn, $sqlpop4);
            $pop4s = pg_result($resultpop4, 0, "pop4");
$sqlpop4s = "SELECT nazwa_pod FROM podlogi where id = '$pop4s';";
            $resultpop4s = @pg_Exec($conn, $sqlpop4s);
$pop4ps = pg_result($resultpop4s, 0, "nazwa_pod");

$sqlsc4 = "SELECT ps4 FROM tab_mie where id_m = '$idut';";
            $resultsc4 = @pg_Exec($conn, $sqlsc4);
            $psc4s = pg_result($resultsc4, 0, "ps4");
$sqlsc4s = "SELECT nazwa_sc FROM sciany where id = '$psc4s';";
            $resultsc4s = @pg_Exec($conn, $sqlsc4s);
$psc4ps = pg_result($resultsc4s, 0, "nazwa_sc");


$sqlpop5 = "SELECT pop5 FROM tab_mie where id_m = '$idut';";
            $resultpop5 = @pg_Exec($conn, $sqlpop5);
            $pop5s = pg_result($resultpop5, 0, "pop5");
$sqlpop5s = "SELECT nazwa_pod FROM podlogi where id = '$pop5s';";
            $resultpop5s = @pg_Exec($conn, $sqlpop5s);
$pop5ps = pg_result($resultpop5s, 0, "nazwa_pod");

$sqlsc5 = "SELECT ps5 FROM tab_mie where id_m = '$idut';";
            $resultsc5 = @pg_Exec($conn, $sqlsc5);
            $psc5s = pg_result($resultsc5, 0, "ps5");
$sqlsc5s = "SELECT nazwa_sc FROM sciany where id = '$psc5s';";
            $resultsc5s = @pg_Exec($conn, $sqlsc5s);
$psc5ps = pg_result($resultsc5s, 0, "nazwa_sc");


$sqlpop6 = "SELECT pop6 FROM tab_mie where id_m = '$idut';";
            $resultpop6 = @pg_Exec($conn, $sqlpop6);
            $pop6s = pg_result($resultpop6, 0, "pop6");
$sqlpop6s = "SELECT nazwa_pod FROM podlogi where id = '$pop6s';";
            $resultpop6s = @pg_Exec($conn, $sqlpop6s);
$pop6ps = pg_result($resultpop6s, 0, "nazwa_pod");

$sqlsc6 = "SELECT ps6 FROM tab_mie where id_m = '$idut';";
            $resultsc6 = @pg_Exec($conn, $sqlsc6);
            $psc6s = pg_result($resultsc6, 0, "ps6");
    $sqlsc6s = "SELECT nazwa_sc FROM sciany where id = '$psc6s';";
            $resultsc6s = @pg_Exec($conn, $sqlsc6s);
$psc6ps = pg_result($resultsc6s, 0, "nazwa_sc");


if ($pop1s == "0") {
$pod1 = "";
}
else {
$pod1 = "pod³. $pop1ps";
}

if ($psc1s == "0") {
$sci1 = "";
}
else {
$sci1 = "¶c. $psc1ps";
}

if (($pop1s == "0") and ($psc1s == "0")) {
$poko1 = "";
}
else {
$poko1 = "Pokój1: $pod1 $sci1";
}


if ($pop2s == "0") {
$pod2 = "";
}
else {
$pod2 = "pod³. $pop2ps";
}

if ($psc2s == "0") {
$sci2 = "";
}
else {
$sci2 = "¶c. $psc2ps";
}

if (($pop2s == "0") and ($psc2s == "0")) {
$poko2 = "";
}
else {
$poko2 = "Pokój2: $pod2 $sci2";
}


if ($pop3s == "0") {
$pod3 = "";
}
else {
$pod3 = "pod³. $pop3ps";
}

if ($psc3s == "0") {
$sci3 = "";
}
else {
$sci3 = "¶c. $psc3ps";
}

if (($pop3s == "0") and ($psc3s == "0")) {
$poko3 = "";
}
else {
$poko3 = "Pokój3: $pod3 $sci3";
}


if ($pop4s == "0") {
$pod4 = "";
}
else {
$pod4 = "pod³. $pop4ps";
}

if ($psc4s == "0") {
$sci4 = "";
}
else {
$sci4 = "¶c. $psc4ps";
}

if (($pop4s == "0") and ($psc4s == "0")) {
$poko4 = "";
}
else {
$poko4 = "Pokój4: $pod4 $sci4";
}


if ($pop5s == "0") {
$pod5 = "";
}
else {
$pod5 = "pod³. $pop5ps";
}

if ($psc5s == "0") {
$sci5 = "";
}
else {
$sci5 = "¶c. $psc5ps";
}

if (($pop5s == "0") and ($psc5s == "0")) {
$poko5 = "";
}
else {
$poko5 = "Pokój5: $pod5 $sci5";
}


if ($pop6s == "0") {
$pod6 = "";
}
else {
$pod6 = "pod³. $pop6ps";
}

if ($psc6s == "0") {
$sci6 = "";
}
else {
$sci6 = "¶c. $psc6ps";
}

if (($pop6s == "0") and ($psc6s == "0")) {
$poko6 = "";
}
else {
$poko6 = "Pokój6: $pod6 $sci6";
}

$pokojeopis = "$poko1 $poko2 $poko3 $poko4 $poko5 $poko6";


    $sqlwyspo = "SELECT ws FROM tab_mie where id_m = '$idut';";    
    $resultwyspo = @pg_Exec($conn, $sqlwyspo);
$wyspos = pg_result($resultwyspo, 0, "ws");


$sqlkuch = "SELECT tk FROM tab_mie where id_m = '$idut';";
            $resultkuch = @pg_Exec($conn, $sqlkuch);
            $kuchs = pg_result($resultkuch, 0, "tk");
$sqlkuchs = "SELECT nazwa_ku FROM typ_kuchni where id = '$kuchs';";
            $resultkuchs = @pg_Exec($conn, $sqlkuchs);
$kuchps = pg_result($resultkuchs, 0, "nazwa_ku");

if ($kuchs == "0") {
$tykuch = "";
}
else {
$tykuch = "Typ kuchni: $kuchps";
}

$sqlrokuch = "SELECT rk FROM tab_mie where id_m = '$idut';";
            $resultrokuch = @pg_Exec($conn, $sqlrokuch);
            $rokuchs = pg_result($resultrokuch, 0, "rk");
$sqlrokuchs = "SELECT nazwa_kuch FROM rodzaj_kuchni where id = '$rokuchs';";
            $resultrokuchs = @pg_Exec($conn, $sqlrokuchs);
$rokuchps = pg_result($resultrokuchs, 0, "nazwa_kuch");

if ($rokuchs == "0") {
$rokuch = "";
}
else {
$rokuch = "Rodzaj kuchni: $rokuchps";
}

$sqlpodkuch = "SELECT kpo FROM tab_mie where id_m = '$idut';";
            $resultpodkuch = @pg_Exec($conn, $sqlpodkuch);
            $podkuch = pg_result($resultpodkuch, 0, "kpo");
$sqlpodkuchs = "SELECT nazwa_pod FROM podlogi where id = '$podkuch';";
            $resultpodkuchs = @pg_Exec($conn, $sqlpodkuchs);
$podkuchps = pg_result($resultpodkuchs, 0, "nazwa_pod");

if ($podkuch == "0") {
$podlkuch = "";
}
else {
$podlkuch = "Pod³oga kuchni: $podkuchps";
}

$sqlkuchsc = "SELECT kps FROM tab_mie where id_m = '$idut';";
            $resultkuchsc = @pg_Exec($conn, $sqlkuchsc);
            $kuchsc = pg_result($resultkuchsc, 0, "kps");
$sqlkuchscs = "SELECT nazwa_sc FROM sciany where id = '$kuchsc';";
            $resultkuchscs = @pg_Exec($conn, $sqlkuchscs);
$kuchscps = pg_result($resultkuchscs, 0, "nazwa_sc");

if ($kuchsc == "0") {
$scakuch = "";
}
else {
$scakuch = "¦ciana kuchni: $kuchscps";
}

$sqlkuchwyp = "SELECT kwyp FROM tab_mie where id_m = '$idut';";
            $resultkuchwyp = @pg_Exec($conn, $sqlkuchwyp);
            $kuchwyp = pg_result($resultkuchwyp, 0, "kwyp");
$sqlkuchwyps = "SELECT nazwa_wp FROM wyposazenie where id = '$kuchwyp';";
            $resultkuchwyps = @pg_Exec($conn, $sqlkuchwyps);
$kuchwypps = pg_result($resultkuchwyps, 0, "nazwa_wp");

if ($kuchwyp == "0") {
$wyposkuch = "";
}
else {
$wyposkuch = "Wyposa¿enie: $kuchwypps";
}

$opiskuchni = "$tykuch $rokuch $podlkuch $scakuch $wyposkuch";


$sqlpodla = "SELECT lpo FROM tab_mie where id_m = '$idut';";
            $resultpodla = @pg_Exec($conn, $sqlpodla);
            $podla = pg_result($resultpodla, 0, "lpo");
$sqlpodlas = "SELECT nazwa_pod FROM podlogi where id = '$podla';";
            $resultpodlas = @pg_Exec($conn, $sqlpodlas);
$podlaps = pg_result($resultpodlas, 0, "nazwa_pod");

if ($podla == "0") {
$podllaz = "";
}
else {
$podllaz = "Pod³oga ³azienki: $podlaps";
}

$sqlscla = "SELECT ls FROM tab_mie where id_m = '$idut';";
            $resultscla = @pg_Exec($conn, $sqlscla);
            $sclas = pg_result($resultscla, 0, "ls");
$sqlsclas = "SELECT nazwa_sc FROM sciany where id = '$sclas';";
            $resultsclas = @pg_Exec($conn, $sqlsclas);
$sclaps = pg_result($resultsclas, 0, "nazwa_sc");
    

if ($sclas == "0") {
$scanlaz = "";
}
else {
$scanlaz = "¦ciany ³azienki: $sclaps";
}

$sqllawyp = "SELECT lawyp FROM tab_mie where id_m = '$idut';";
            $resultlawyp = @pg_Exec($conn, $sqllawyp);
            $lawyp = pg_result($resultlawyp, 0, "lawyp");
$sqllawyps = "SELECT nazwa_wp FROM wyposazenie where id = '$lawyp';";
            $resultlawyps = @pg_Exec($conn, $sqllawyps);
$lawypps = pg_result($resultlawyps, 0, "nazwa_wp");

if ($lawyp == "0") {
$wyposlaz = "";
}
else {
$wyposlaz = "Wyposa¿enie ³azienki: $lawypps";
}

$opislazienki = "$podllaz $scanlaz $wyposlaz";


$sqlrokbu = "SELECT rokb FROM tab_mie where id_m = '$idut';";    
    $resultrokbu = @pg_Exec($conn, $sqlrokbu);
$rokbus = pg_result($resultrokbu, 0, "rokb");


$sqlmatb = "SELECT mat FROM tab_mie where id_m = '$idut';";
            $resultmatb = @pg_Exec($conn, $sqlmatb);
            $matbs = pg_result($resultmatb, 0, "mat");
$sqlmatbs = "SELECT nazwa_m FROM material_b where id = '$matbs';";
            $resultmatbs = @pg_Exec($conn, $sqlmatbs);
$matbps = pg_result($resultmatbs, 0, "nazwa_m");


$sqlstan = "SELECT sta FROM tab_mie where id_m = '$idut';";
            $resultstan = @pg_Exec($conn, $sqlstan);
            $stan = pg_result($resultstan, 0, "sta");
$sqlstans = "SELECT nazwa_sst FROM stan where id = '$stan';";
            $resultstans = @pg_Exec($conn, $sqlstans);
$stanps = pg_result($resultstans, 0, "nazwa_sst");


$sqlstand = "SELECT std FROM tab_mie where id_m = '$idut';";
            $resultstand = @pg_Exec($conn, $sqlstand);
            $stand = pg_result($resultstand, 0, "std");
$sqlstands = "SELECT nazwa_stan FROM standard where id = '$stand';";
            $resultstands = @pg_Exec($conn, $sqlstands);
$standps = pg_result($resultstands, 0, "nazwa_stan");


$sqltel = "SELECT tel FROM tab_mie where id_m = '$idut';";
            
            $resulttel = @pg_Exec($conn, $sqltel);
            $tels = pg_result($resulttel, 0, "tel");

if ($tels == "2") {
$telefs = "1";
}
else {
$telefs = "";
}


$sqlgaz = "SELECT gaz FROM tab_mie where id_m = '$idut';";
            $resultgaz = @pg_Exec($conn, $sqlgaz);
            $gazs = pg_result($resultgaz, 0, "gaz");

if (($gazs == "1") || ($gazs == "0")) {
$gazas = "0";
}
else {
$gazas = "1";
}


$sqlwin = "SELECT wi FROM tab_mie where id_m = '$idut';";
            $resultwin = @pg_Exec($conn, $sqlwin);
            $wind = pg_result($resultwin, 0, "wi");

if (($wind == "1") || ($wind == "0")) {
$windas = "0";
}
else {
$windas = "1";
}

$sqldfon = "SELECT dom FROM tab_mie where id_m = '$idut';";
        $resultdfon = @pg_Exec($conn, $sqldfon);
$dfon = pg_result($resultdfon, 0, "dom");

if (($dfon == "1") || ($dfon == "0")) {
$dfons = "0";
}
else {
$dfons = "1";
}


$sqlzsyp = "SELECT zs FROM tab_mie where id_m = '$idut';";
            $resultzsyp = @pg_Exec($conn, $sqlzsyp);
            $zsyp = pg_result($resultzsyp, 0, "zs");

if (($zsyp == "1") || ($zsyp == "0")) {
$zsyps = "";
}
else {
$zsyps = "jest";
}


$sqlogr = "SELECT ogr FROM tab_mie where id_m = '$idut';";
            $resultogr = @pg_Exec($conn, $sqlogr);
            $ogr = pg_result($resultogr, 0, "ogr");

if (($ogr == "1") || ($ogr == "0")) {
$ogrs = "0";
}
else {
$ogrs = "1";
}


$sqlmiej = "SELECT mip FROM tab_mie where id_m = '$idut';";
            $resultmiej = @pg_Exec($conn, $sqlmiej);
$miej = pg_result($resultmiej, 0, "mip");

if (($miej == "1") || ($miej == "0")) {
$miejs = "Nie ma miejsc parkingowych";
}
else {
$miejs = "Miejsca parkingowe";
}


$sqlkabl = "SELECT sk FROM tab_mie where id_m = '$idut';";
            $resultkabl = @pg_Exec($conn, $sqlkabl);
$kabls = pg_result($resultkabl, 0, "sk");

if (($kabls == "1") || ($kabls == "0")) {
$kablss = "0";
}
else {
$kablss = "1";
}


$sqlsiec = "SELECT siec FROM tab_mie where id_m = '$idut';";
            $resultsiec = @pg_Exec($conn, $sqlsiec);
$siecs = pg_result($resultsiec, 0, "siec");

if (($siecs == "1") || ($siecs == "0")) {
$siecss = "0";
}
else {
$siecss = "1";
}


$sqlklim = "SELECT klim FROM tab_mie where id_m = '$idut';";
            
            $resultklim = @pg_Exec($conn, $sqlklim);
$klima = pg_result($resultklim, 0, "klim");

if (($klima == "1") || ($klima == "0")) {
$klimas = "0";
}
else {
$klimas = "1";
}

$sqlosiedle = "SELECT oss FROM tab_mie where id_m = '$idut';";
            $resultosiedle = @pg_Exec($conn, $sqlosiedle);
$osiedle = pg_result($resultosiedle, 0, "oss");

if (($osiedle == "1") || ($osiedle == "0")) {
$osiedles = "";
}
else {
$osiedles = "Osiedle strze¿one";
}

$sqldanty = "SELECT drz FROM tab_mie where id_m = '$idut';";
            $resultdanty = @pg_Exec($conn, $sqldanty);
$danty = pg_result($resultdanty, 0, "drz");

if (($danty == "1") || ($danty == "0")) {
$dantyss = "";
}
else {
$dantyss = "Drzwi antyw³amaniowe";
}


$sqlrolety = "SELECT rol FROM tab_mie where id_m = '$idut';";
            
            $resultrolety = @pg_Exec($conn, $sqlrolety);
$rolety = pg_result($resultrolety, 0, "rol");

if (($rolety == "1") || ($rolety == "0")) {
$roletys = "";
}
else {
$roletys = "Rolety";
}


$sqlkamery = "SELECT kv FROM tab_mie where id_m = '$idut';";
            $resultkamery = @pg_Exec($conn, $sqlkamery);
$kamery = pg_result($resultkamery, 0, "kv");

if (($kamery == "1") || ($kamery == "0")) {
$kamerys = "";
}
else {
$kamerys = "Kamery Video";
}


$sqlalarm = "SELECT al FROM tab_mie where id_m = '$idut';";
        $resultalarm = @pg_Exec($conn, $sqlalarm);
$alarm = pg_result($resultalarm, 0, "al");

if (($alarm == "1") || ($alarm == "0")) {
$alarms = "";
}
else {
$alarms = "Alarm";
}

$sqlokanty = "SELECT okan FROM tab_mie where id_m = '$idut';";
            $resultokanty = @pg_Exec($conn, $sqlokanty);
$okanty = pg_result($resultokanty, 0, "okan");

if (($okanty == "1") || ($okanty == "0")) {
$okantys = "";
}
else {
$okantys = "Okna antyw³amaniowe";
}

$zabezpiec = "$osiedles $dantyss $roletys $kamerys $alarms $okantys";

$sqlczynsz = "SELECT wys_cz_m FROM tab_mie where id_m = '$idut';";    
    $resultczynsz = @pg_Exec($conn, $sqlczynsz);
$czynszs = pg_result($resultczynsz, 0, "wys_cz_m");

if ($czynszs == "0") {
$czynszss = "";
}
else {
$czynszss = "$czynszs z³.";
}


$sqlcm2 = "SELECT cm_m2 FROM tab_mie where id_m = '$idut';";    
    $resultcm2 = @pg_Exec($conn, $sqlcm2);
$cenam2 = pg_result($resultcm2, 0, "cm_m2");
    

if ($cenam2 == "0") {
$cenam2s = "";
}
else {
$cenam2s = "$cenam2 z³.";
}

    //modify to make it update
       
    require('otodom_extras.php');
    
    $query = "select otodom_ins_id from otodom_wysylka 
    join rodzaj_nieruchomosci on otodom_wysylka.id_rodzaj_nier = rodzaj_nieruchomosci.id 
    where id_nieruchomosc = $idut and rodzaj_nieruchomosci.nazwa = '$rodzaj_nier';";
    $resOtoDomId = pg_query($conn, $query);
    $id_otodom = pg_result($resOtoDomId, 0, 'otodom_ins_id');
    
    //1 parametr jest nullem, bo podajemy nowe ogloszenie
    $offerId = $otoDom->InsertOffer($id_otodom, $future, $wojn_otodom, $powiatn_otodom, $miast, $dzieln, $numof, $cenami, $powuzy, $prawnyss, $dodop, 
    $wyspos, $structure, $mediaTab, $heating, $parking, $surrTab, array($poko1, $poko2, $poko3, $poko4, $poko5, $poko6), $numerpie, $robups, 
    $liczbapie, $lipok, $stanps, $rokbus, array($ogrzeps), $offerType, $localization, $kat_allegro, $zdOtodom, $accTab);
    
    UpdateOtoDom($conn, $rodzaj_nier, $id_otodom, $idut, $future);
     
    var_dump($offerId);

?>