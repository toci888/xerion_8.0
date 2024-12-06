<?php
    include_once ('ui/xajax.php');
    include_once ('dal/stronaDAL.php');
    include_once ('ui/kontrolki_html.php'); 
    include_once ('ui/utilsui.php'); 
    include_once ('bll/tags.php'); 
    include_once ('bll/jezykibll.php');
    include_once ('bll/cache.php');
    include_once ('bll/ofertystronabll.php');
    require('naglowek.php');
    require('conf.php');
    $tlumaczenia = cachejezyki::Czytaj(); //id nier => array

    session_start();

    //decyzje o jezyku tez mozna wyniesc (do odwiedzin)
    //zapamietanie odwiedzin
    require('odwiedziny.php');
?>

<html lang="pl">
<head>  
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <meta HTTP-EQUIV="Creation-date" CONTENT="2009-01-30T09:47:05Z">
    <meta HTTP-EQUIV="Author" CONTENT="gambl@azg.pl">
    <meta HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE">
    <meta name="robots" content="index, follow" />
    <meta name="revisit-after" content="2 days" />
    <meta name="description" LANG="pl" CONTENT="Nieruchomo¶ci Opole A.Z.GWARANCJA - Biuro po¶rednictwa w obrocie Nieruchomo¶ci w Opolu. Mieszkania, domy, lokale oraz dzia³ki w Opolu i w województwie opolskim."/>
    <meta name="copright" CONTENT="&copy;2008">
    <link rel="stylesheet" HREF="azg.css">
    <script language="javascript" src="js/script.js"></script>
<?php
    require ('tytul.php');
    require ('google.php');
?>
</head>
<?php $xajax->printJavascript("lib/xajax/"); ?>
<body style="background-image: url(gfx/tlo.gif); background-repeat: repeat-x; background-color: #d5deec;" onload="AutoScrollDown(Array('polecamy', 'nowosci')); AutoScrollDownCentral(document.location.href);">
<table width="950" border="0" cellspacing="0" cellpadding="0" align="center">
    <tr>
        <td colspan="3" width="950" height="220">
        <object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,0,0" width="981" height="245" id="index" align="middle">
    <param name="allowScriptAccess" value="sameDomain" />
    <param name="allowFullScreen" value="false" />
    <param name="movie" value="index.swf" /><param name="quality" value="high" /><param name="bgcolor" value="#999999" />    <embed src="index.swf" quality="high" bgcolor="#999999" width="981" height="245" name="index" align="middle" allowScriptAccess="sameDomain" allowFullScreen="false" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />
    </object>
        </td>
    </tr>
    <tr>
        <?php echo '<td width="'.$szer_boki_strona_zewn.'">';
            require('nowosci.php');
        ?>
        </td>
        <?php echo '<td width="'.$szer_centr_strona.'">  <!-- ze wzgleduna rozpychajace sie scrolle trzeba to w 950 gdzies zmiescic -->
              <div id="center" style="height:'.$wysokosc_strony.'px; overflow:auto;" onscroll="SaveScroll(document.location.href, this.scrollTop);">'; 
                 require('centrum.php'); //onscroll="alert(this.scrollTop);"
            ?>
            </div>
        </td>
        <?php echo '<td width="'.$szer_boki_strona_zewn.'">';
            require('polecamy.php');
        ?>
        </td>
    </tr>
</table>
</body>
<?php
    
?>
</html>