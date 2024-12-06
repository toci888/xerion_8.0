<?php
    include_once ('dal/stronaDAL.php');
    include_once ('ui/kontrolki_html.php'); 
    include_once ('ui/utilsui.php'); 
    include_once ('bll/tags.php'); 
    include_once ('bll/jezykibll.php');
    include_once ('bll/cache.php');
    include_once ('bll/ofertystronabll.php');
    require('naglowek.php');
    require('conf.php');
    $tlumaczenia = cachejezyki::Czytaj();
    session_start();
        
    //okreslenie jezyka na stronie
    if (count($_GET) == 0 && $_SERVER['REQUEST_METHOD'] == 'GET')
    {
        $_SESSION[$jezyk] = 1;
    }
    if (isset($_GET[$jezyk]))
    {
        $_SESSION[$jezyk] = $_GET[$jezyk];
    }
    if (!isset($_SESSION[$jezyk]))
    {
        $_SESSION[$jezyk] = 1;
    }
    //zanotowanie skad sa odwiedziny na stronie
    $dal = new StronaPodsInfoDAL();
    $tabParametr[NieruchomoscDAL::$adres] = $_SERVER['REMOTE_ADDR'];
    $tabParametr[NieruchomoscDAL::$id_jezyk] = $_SESSION[$jezyk];
    $tabParametr[StronaPodsInfoDAL::$przegladarka] = $_SERVER['HTTP_USER_AGENT'];
    $tabParametr[StronaPodsInfoDAL::$url_azg] = $_SERVER['REQUEST_URI'];
    $tabParametr[StronaPodsInfoDAL::$request_time] = '';//$_SERVER['REQUEST_TIME']; - nie istnieje w php 5.0.4
    $tabParametr[StronaPodsInfoDAL::$request_method] = $_SERVER['REQUEST_METHOD'];
    if (isset($_SERVER['HTTP_REFERER']))
    {
        $tabParametr[StronaPodsInfoDAL::$referer] = $_SERVER['HTTP_REFERER'];
    }
    else
    {
        $tabParametr[StronaPodsInfoDAL::$referer] = 'bezposrednie';
    }
    $wynik = $dal->DodajOdwiedziny($tabParametr);
    
?>
<HTML LANG="pl">
<HEAD>
<?php
    $rodzaj_nier_link = array(1 => tags::$domy, 2 => tags::$mieszkania, 3 => tags::$obiekty, 4 => tags::$lokale, 5 => tags::$tereny, 6 => tags::$dzialki);
    $rodzaj_nier_url = array(1 => 'domy-opole.php', 2 => 'mieszkania-opole.php', 3 => 'lokale-opole.php', 4 => 'lokale-opole.php', 5 => 'dzialki-opole.php', 6 => 'dzialki-opole.php');
    $nier_tyt = tags::$mieszkania;
    $r_nier_tab = array('sprzedazm' => tags::$mieszkania, 'sprzedazd' => tags::$domy, 'sprzedazl' => tags::$lokale, 'sprzedazo' => tags::$obiekty, 'sprzedazdz' => tags::$dzialki, 'sprzedazte' => tags::$tereny, 
    'wynajemm' => tags::$mieszkania, 'wynajemd' => tags::$domy, 'wynajeml' => tags::$lokale, 'wynajemo' => tags::$obiekty, 'wynajemdz' => tags::$dzialki, 'wynajemte' => tags::$tereny,
    2 => tags::$mieszkania, 1 => tags::$domy, 4 => tags::$lokale, 3 => tags::$obiekty, 6 => tags::$dzialki, 5 => tags::$tereny);
    if (isset($_GET['action']))
    {
        if (isset($r_nier_tab[$_GET['action']]))
        {
            $nier_tyt = $r_nier_tab[$_GET['action']];
        }
    }
    //wziac pod uwage id_nier_rodzaj
    if (isset($_GET[NieruchomoscDAL::$id_nier_rodzaj]))
    {
        if (isset($r_nier_tab[$_GET[NieruchomoscDAL::$id_nier_rodzaj]]))
        {
            $nier_tyt = $r_nier_tab[$_GET[NieruchomoscDAL::$id_nier_rodzaj]];
        }
    }
    $poczatek = '';
    if (isset($pre))
    {
        if ($pre)
        {
            $poczatek = UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], $nier_tyt), $_SESSION[$jezyk]);
        }
        else
        {
            $poczatek = UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$biuro_nieruchomosci), $_SESSION[$jezyk]);
        }
    }
    else
    {
        $poczatek = UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$biuro_nieruchomosci), $_SESSION[$jezyk]);
    }
    require ('tytul.php');
    ///zrobic description i keywords jezykowo :P
    
    /*
    Nieruchomo¶ci Opole A.Z.GWARANCJA - Opolskie biuro Nieruchomo¶ci. 
Posiadamy bardzo szerok± ofertê mieszkañ, domów, lokali oraz dzia³ek do sprzeda¿y i wynajmu w Opolu oraz w wojwództwie opolskim. 
Dysponujemy obszern± baz± klientów poszukuj±cych nieruchomo¶ci do kupienia lub wynajmu. Oferujemy profesjonalne i kompleksowe us³ugi w zakresie doboru nieruchomo¶ci, kredytu oraz przeprowadzenia ca³ej transakcji.

nieruchomo¶ci, opole, nieruchomo¶ci opole, mieszkanie, mieszkania, mieszkania opole, domy, domy opole, lokale, dzia³ki, tereny, obiekty, wynajem mieszkañ, a. z. gwarancja, azg, 
gwarancja, biuro nieruchomo¶ci, opolskie, Opole, zapart, opolski, nieruchomo¶æ, oferty, sprzeda¿, kupno, po¶rednik, luboszyce, dzia³ki opole, lokale opole, nieruchomo¶ci opole az gwarancja, estates, poland, 
real estate agency

Nieruchomo¶ci Opole A.Z.GWARANCJA - Biuro po¶rednictwa w obrocie Nieruchomo¶ci. Mieszkania, domy, lokale oraz dzia³ki w Opolu i w województwie opolskim.
    */
?>
<META http-equiv="content-type" content="text/html; charset=iso-8859-2">
<META HTTP-EQUIV="Creation-date" CONTENT="2004-12-24T09:47:05Z">
<META HTTP-EQUIV="Author" CONTENT="gambl@azg.pl">
<META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE">
<meta name="robots" content="index, follow" />
<meta name="revisit-after" content="2 days" />
<META NAME="description" LANG="pl" CONTENT="Nieruchomo¶ci Opole A.Z.GWARANCJA - Biuro po¶rednictwa w obrocie Nieruchomo¶ci w Opolu. Mieszkania, domy, lokale oraz dzia³ki w Opolu i w województwie opolskim."/>
<?php
    $keywords_array = array(1 => 'nieruchomo¶ci opole, nieruchomo¶ci, nieruchomo¶æ, nieruchomosci, opole, mieszkania opole, domy opole, mieszkania, mieszkanie, domy, dom, posrednictwo, lokale, obiekty, ogloszenia, kredyty', 
    2 => 'estates opole, flats opole, estates, estate, immobility, opole, flat, flats, house, houses, premise, object', 
    3 => 'immobilien opole, immobilien, immobilie, opole, wohnung, Wohnungs, haus, häusern, raum, lokal, objekt');
    echo '<META NAME="keywords" LANG="pl" CONTENT="'.$keywords_array[$_SESSION[$jezyk]].'" />';
?>
<META NAME="copright" CONTENT="&copy;2002">
<LINK REL="stylesheet" HREF="azg.css">
<script language='JavaScript' type="text/javascript" src="script/funkcjejs.js"></script>
<script language='JavaScript1.1' type="text/javascript" src="script/blend.js"></script>
<script language="javascript" src="js/script.js"></script>          

</HEAD>
<?php
//Opolskie biuro Nieruchomoœci posiadaj¹ce szerok¹ ofertê mieszkañ, domów, lokali oraz dzia³ek do sprzeda¿y i wynajmu oraz obszern¹ bazê klientów poszukuj¹cych. Oferujemy profesjonalne kompleksowe us³ugi w zakresie doboru nieruchomoœci, kredytu oraz przeprowadzenia ca³ej transakcji.
if ($_SERVER['SERVER_NAME'] == 'www.azg.pl' || $_SERVER['SERVER_NAME'] == 'azg.pl')
{
    echo '<script type="text/javascript">
    var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
    document.write(unescape("%3Cscript src=\'" + gaJsHost + "google-analytics.com/ga.js\' type=\'text/javascript\'%3E%3C/script%3E"));
    </script>
    <script type="text/javascript">
    var pageTracker = _gat._getTracker("UA-5029884-4");
    pageTracker._trackPageview();
    </script>';
} 
if ($_SERVER['SERVER_NAME'] == 'www.azgwarancja.eu')
{
    echo '<script type="text/javascript">
    var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
    document.write(unescape("%3Cscript src=\'" + gaJsHost + "google-analytics.com/ga.js\' type=\'text/javascript\'%3E%3C/script%3E"));
    </script>
    <script type="text/javascript">
    var pageTracker = _gat._getTracker("UA-5029884-2");
    pageTracker._initData();
    pageTracker._trackPageview();
    </script>';
}
if ($_SERVER['SERVER_NAME'] == 'www.nieruchomosciopole.pl')
{
    echo '<script type="text/javascript">
    var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
    document.write(unescape("%3Cscript src=\'" + gaJsHost + "google-analytics.com/ga.js\' type=\'text/javascript\'%3E%3C/script%3E"));
    </script>
    <script type="text/javascript">
    var pageTracker = _gat._getTracker("UA-5029884-3");
    pageTracker._initData();
    pageTracker._trackPageview();
    </script>';
}
?>

<BODY bgcolor='#D9D9D9' marginheight="0" marginwidth="0" topmargin="0" leftmargin="0" onscroll="SaveScroll(document.location.href, document.body.scrollTop);" onload="AutoScrollDown(document.location.href);" >

<center>
<!--url's used in the movie 
<a href="en/index.php"></a>
<a href="index.php?action=kontakt"></a>
<a href="index.php?action=certy"></a>
<a href="index.php?action=firma"></a>-->

<!--text used in the movie-->
<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,0,0" width="776" height="175" id="<?echo $swfs[$_SESSION[$jezyk]];?>" align="middle">
<param name="allowScriptAccess" value="sameDomain" />
<param name="movie" value="<?php 
    $swfs = array(1 => 'azgb', 2 => 'azgben', 3 => 'azgbge');
    echo $swfs[$_SESSION[$jezyk]];
    ?>.swf" />
<param name="quality" value="autohigh" />
<param name="bgcolor" value="#003366" />
<embed src="<?php
echo $swfs[$_SESSION[$jezyk]];
?>.swf" quality="autohigh" bgcolor="#003366" width="776" height="175" name="azgb" align="middle" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />
</object>

<?php
    require ('dzien.php');
    require ('polecamy.php');
?>

<table width="776" cellpadding="0" cellspacing="0" frame border="0">
<tr><td colspan="7"><img src="../img/red.gif" width="776" height="1" border="0"></td></tr>
</table>

<table width="776" cellpadding="0" cellspacing="0" frame border="0">

<tr width="776" height="400">
<td><img src="../img/red.gif" width="1" height="100 %" border="0"></td>
<td width="128" bgcolor = "white" valign="top">
<?php
    require ('nowosci.php');
?>
</td>
<td><img src="../img/red.gif" width="1" height="100 %" border="0"></td>
<td style="width: 520em;" bgcolor="white" valign="top">
<?php
    if (isset($_POST['dodaj_subs']))
    {
        $dal = new StronaSubskrypcjaDAL();
        
        $tabParametr[StronaSubskrypcjaDAL::$id_nier_rodzaj] = $_POST[StronaSubskrypcjaDAL::$id_nier_rodzaj.'sub'];
        $tabParametr[StronaSubskrypcjaDAL::$id_trans_rodzaj] = $_POST[StronaSubskrypcjaDAL::$id_trans_rodzaj.'sub'];
        $tabParametr[StronaSubskrypcjaDAL::$cena_min] = $_POST[StronaSubskrypcjaDAL::$cena_min];
        $tabParametr[StronaSubskrypcjaDAL::$cena_max] = $_POST[StronaSubskrypcjaDAL::$cena_max];
        $tabParametr[StronaSubskrypcjaDAL::$email] = $_POST[StronaSubskrypcjaDAL::$email];
        $tabParametr[StronaSubskrypcjaDAL::$id_jezyk] = $_SESSION[$jezyk];
        
        $wynik = $dal->DodajSubskrypcja($tabParametr);
        
        if ($wynik['id'] == 1)
        {
            echo '<br /><p align="center"><span class="poleca">'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$twoje_zgloszenie_zostalo_przyjete), $_SESSION[$jezyk]).'.</span></p>'; //Twoje zg³oszenie zosta³o przyjête
        }
        else
        {
            echo '<br /><p align="center"><span class="poleca">'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], $wynik['nazwa']), $_SESSION[$jezyk]).'</span></p>';
        }
    }
    else if (isset($_POST['usun_subs']))
    {
        $dal = new StronaSubskrypcjaDAL();
        
        $tabParametr[StronaSubskrypcjaDAL::$id_nier_rodzaj] = $_POST[StronaSubskrypcjaDAL::$id_nier_rodzaj.'sub'];
        $tabParametr[StronaSubskrypcjaDAL::$id_trans_rodzaj] = $_POST[StronaSubskrypcjaDAL::$id_trans_rodzaj.'sub'];
        $tabParametr[StronaSubskrypcjaDAL::$email] = $_POST[StronaSubskrypcjaDAL::$email];
        $wynik = $dal->UsunSubskrypcja($tabParametr);
        
        //var_dump($wynik);
        if ($wynik['id'] == 1)
        {
            echo '<br /><p align="center"><span class="poleca">'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$twoje_zgloszenie_zostalo_przyjete), $_SESSION[$jezyk]).'.</span></p>'; //Twoje zg³oszenie zosta³o przyjête
        }
        else
        {
            echo '<br /><p align="center"><span class="poleca">'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], $wynik['nazwa']), $_SESSION[$jezyk]).'</span></p>';
        }
    }
    else
    {
        include 'all.inc';
    }
?>
</td>
<td><img src="../img/red.gif" width="1" height="100 %" border="0"></td>
<td width="128" bgcolor = "white" valign="top">
<?php
    require 'prawa.inc';
    require 'stopka.php';
?>
</td>
<td><img src="../img/red.gif" width="1" height="100 %" border="0"></td>
</tr>
</table>

<table width="776" cellpadding="0" cellspacing="0" frame border="0">
<tr><td colspan="7"><img src="../img/red.gif" width="776" height="1" border="0"></td></tr>
</table>

<table width="776" cellpadding="0" cellspacing="0" frame border="0">

<tr>
<td><img src="../img/red.gif" width="1" height="100 %" border="0"></td>
<td width="776" height="14" colspan="7">
<center>
<?php
    echo '<a href="http://www.azg.pl/mieszkania-opole.php" target="_blank">'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$mieszkania), $_SESSION[$jezyk]).' - '.
    UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$sprzedaz), $_SESSION[$jezyk]).'</a>&nbsp;&nbsp;&nbsp;';
    echo '<a href="http://www.azg.pl/domy-opole.php" target="_blank">'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$domy), $_SESSION[$jezyk]).' - '.
    UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$sprzedaz), $_SESSION[$jezyk]).'</a>&nbsp;&nbsp;&nbsp;';
    echo '<a href="http://www.azg.pl/lokale-opole.php" target="_blank">'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$lokale), $_SESSION[$jezyk]).' - '.
    UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$sprzedaz), $_SESSION[$jezyk]).'</a>&nbsp;&nbsp;&nbsp;';
    echo '<a href="http://www.azg.pl/index.php?action=sprzedazo" target="_blank">'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$obiekty), $_SESSION[$jezyk]).' - '.
    UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$sprzedaz), $_SESSION[$jezyk]).'</a>&nbsp;&nbsp;&nbsp;';
    echo '<a href="http://www.azg.pl/dzialki-opole.php" target="_blank">'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$dzialki), $_SESSION[$jezyk]).' - '.
    UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$sprzedaz), $_SESSION[$jezyk]).'</a>&nbsp;&nbsp;&nbsp;';
    echo '<a href="http://www.azg.pl/index.php?action=sprzedazte" target="_blank">'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$tereny), $_SESSION[$jezyk]).' - '.
    UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$sprzedaz), $_SESSION[$jezyk]).'</a>&nbsp;&nbsp;&nbsp;<br />';
    echo '<a href="http://www.azg.pl/en/" target="_blank">English version</a>&nbsp;&nbsp;&nbsp;';
    echo '<a href="http://www.azg.pl/ge/" target="_blank">Deutsch Version</a>&nbsp;&nbsp;&nbsp;';
    echo '<a href="http://www.azg.pl/nieruchomosci-opole.php" target="_blank">Polska wersja</a>&nbsp;&nbsp;&nbsp;';
?>
<br />
Coded and designed by gambl.
</center>
</td>
<td><img src="../img/red.gif" width="1" height="100 %" border="0"></td>
</tr>

</table>
<table width="776" cellpadding="0" cellspacing="0" frame border="0">
<tr><td colspan="7"><img src="../img/red.gif" width="776" height="1" border="0"></td></tr>
</table>

</BODY>
</HTML>