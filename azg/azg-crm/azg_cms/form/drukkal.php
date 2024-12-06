<HTML LANG="pl">
<HEAD>
<META http-equiv="content-type" content="text/html; charset=ISO-8859-2">
<LINK REL="stylesheet" HREF="azg.css">
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
    echo '<TITLE>'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nieruchomosci), $_SESSION[$jezyk]).' OPOLE - A.Z.GWARANCJA</TITLE>';
?>

</HEAD>

<BODY bgcolor='white' marginheight="0" marginwidth="0" topmargin="0" leftmargin="0">

<center>
<?php
    $nag = UtilsUI::PodajNaglowekFirmowy($_SESSION[$jezyk]);
    echo $nag;
?>
</center>
<br>
<?
    if (isset($_GET['rodzaj'])) 
    {
        $cena = null;
        $rodzaj_id = null;
        $prowizja = null;

        if (isset($_GET['cena']))
        {
            $cena = $_GET['cena'];
            $rodzaj_id = $_GET['rodzaj_id'];
            $prowizja = $_GET['prowizja'];
        }
        $dzielnik = 1;
        if ($_GET['rodzaj_id'] != 'mhdd')
        {
            $dzielnik = 2;
        }
        //mieszkanie hipoteczne nie ma dzielnika /2
        ///kurwa ten krotki algorytm powinien byc z utila - osobna funkcja liczaca            
        if (($_GET['cena'] > 0) && ($_GET['cena'] <= 3000)) 
        {
            $taksanot = 100;
        }
        if (($_GET['cena'] > 3000) && ($_GET['cena'] <= 10000)) 
        {
            $taksanot = (100 + (($_GET['cena'] - 3000) * 0.03))/$dzielnik;
        }
        if (($_GET['cena'] > 10000) && ($_GET['cena'] <= 30000)) 
        {
            $taksanot = (310 + (($_GET['cena'] - 10000) * 0.02))/$dzielnik;
        }           
        if (($_GET['cena'] > 30000) && ($_GET['cena'] <= 60000)) 
        {
            $taksanot = (710 + (($_GET['cena'] - 30000) * 0.01))/$dzielnik;
        }
        if (($_GET['cena'] > 60000) && ($_GET['cena'] <= 1000000)) 
        {
            $taksanot = (1010 + (($_GET['cena'] - 60000) * 0.004))/$dzielnik;
        }
        if (($_GET['cena'] > 1000000) && ($_GET['cena'] <= 2000000)) 
        {
            $taksanot = (4770 + (($_GET['cena'] - 1000000) * 0.002))/$dzielnik;
        }
        if ($_GET['cena'] > 2000000) 
        {
            $taksanot = (6770 + (($_GET['cena'] - 1000000) * 0.0025))/$dzielnik;
        }
        
        if ($_GET['rodzaj_id'] != 'msp')
        {
            //$taksanot = $taksanot + 200;
            $oplatasa = '200 zł.';
        }
        else
        {
            $oplatasa = UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$brak), $_SESSION[$jezyk]);
        }
        
        echo '<center><span class="napis55"><b>'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wynik_oplat), $_SESSION[$jezyk]).'<br />'.$_GET['rodzaj'].'<br><br></b></span>';
        echo '<table width="70%" border frame="box"><tr><td width="50%" class="polecam" align="right" bgcolor="#e7e7e7"><span><b>'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$cena_nieruchomosci), $_SESSION[$jezyk]).' :</b>
        </td><td width="20%"><span class="polecam">'.$_GET['cena'].' zł.</span></td></tr>';
        
        echo '<tr><td width="50%" class="polecam" align="right" bgcolor="#e7e7e7"><span><b>'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podatek_od_czynnosci_cywilnoprawnych), $_SESSION[$jezyk]).':</b></span></td>';
        $podatekcywilny = $_GET['cena'] * 0.02;
        echo '<td width="20%"><span class="polecam">'.$podatekcywilny.' zł.</span></td></tr>';
        
        echo '<tr><td width="50%" class="polecam" align="right" bgcolor="#e7e7e7"><span><b>'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$taksa_notarialna), $_SESSION[$jezyk]).':</b></span></td>';
        echo '<td width="20%"><span class="polecam">'.$taksanot.' zł.</span></td></tr>';
        
        echo '<tr><td width="50%" class="polecam" align="right" bgcolor="#e7e7e7"><span><b>'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podatek_vat_od_taksy_notarialnej), $_SESSION[$jezyk]).':</b></span></td>';
        $podatekvat = $taksanot * 0.22;
        echo '<td width="20%"><span class="polecam">'.$podatekvat.' zł.</span></td></tr>';
        
        echo '<tr><td width="50%" class="polecam" align="right" bgcolor="#e7e7e7"><span><b>'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$prowizja_biura), $_SESSION[$jezyk]).' ('.$_GET['prowizja'].' %):</b></span></td>';

        $liczba = $prowizja;
        $zna = ',';
        $pos = strpos($liczba, $zna);
        if ($pos == false) 
        { 
            $wynik = $liczba; 
        } 
        else 
        { 
            $pattern = "/(\d+),(\d+)/i"; 
            $replacement = "\$1.\$2"; 
            $wynik =  preg_replace($pattern, $replacement, $liczba);  
        } 
        $prowizja = $wynik;

        $prow = $cena * $prowizja / 100;
        echo '<td width="20%"><span class="polecam">'.$prow.' zł.</span></td></tr>';
        
        echo '<tr><td width="50%" class="polecam" align="right" bgcolor="#e7e7e7"><span><b>'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podatek_vat_od_prowizji_biura), $_SESSION[$jezyk]).':</b></span></td>';
        $podatekvatp = $prow * 0.22;
        echo '<td width="20%"><span class="polecam">'.$podatekvatp.' zł.</span></td></tr>';
        
        echo '<tr><td width="50%" class="polecam" align="right" bgcolor="#e7e7e7"><span><b>'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$oplata_sadowa), $_SESSION[$jezyk]).':</b></span></td>
        <td width="20%"><span class="polecam">'.$oplatasa.'</span></td></tr>';
        
        echo '<tr><td width="50%" class="polecam" align="right" bgcolor="#e7e7e7"><span><b>'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wypisy_aktow), $_SESSION[$jezyk]).':</b></span></td>';
        $wakt = UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$okolo), $_SESSION[$jezyk]).' 200 zł.';
        echo '<td width="20%"><span class="polecam">'.$wakt.'</span></td></tr>';
        
        $wpl = 200; 
        $sumaod = $podatekcywilny + $taksanot + $podatekvat + $prow + $oplatasa + $podatekvatp + $wpl;
        
        echo '<tr><td width="50%" class="polecam" align="right" bgcolor="#e7e7e7"><span><b>'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$suma_oplat_dodatkowych), $_SESSION[$jezyk]).':</b></span></td>
        <td width="20%"><span class="polecam">'.$sumaod.' zł.</span></td></tr>';
        
        echo '<tr><td width="50%" class="polecam" align="right" bgcolor="#e7e7e7"><span><b>'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$suma), $_SESSION[$jezyk]).':</b></span></td>';
        $suma = $cena + $podatekcywilny + $taksanot + $podatekvat + $prow + $oplatasa + $podatekvatp + $wpl;
        echo '<td width="20%"><span class="polecam">'.$suma.' zł.</span></td></tr></table>';
        
    }


    require('stopka.php');
?>
<SCRIPT language=JavaScript type=text/javascript>self.print()</SCRIPT>
</BODY>
</HTML>