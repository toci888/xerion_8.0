<HTML>
<HEAD>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <script language="javascript" src="js/script.js"></script>
<link href="azg.css" rel="stylesheet" type="text/css">
</head>
<body>
<?php
    // ś - ¶ ą - ±  ź - Ľ Ź - ¬ Ś - ¦
    include_once ('ui/kontrolki_html.php'); 
    include_once ('bll/tags.php'); 
    include_once ('bll/jezykibll.php');
    include_once ('bll/cache.php');
    include_once ('dal/dal.php');
    require('naglowek.php');
    require('conf.php');
    
    $cena = null;
    $rodzaj_id = null;
    $prowizja = null;

    if (isset($_GET['cena']))
    {
        $cena = $_GET['cena'];
        $rodzaj_id = $_GET['rodzaj_id'];
        $prowizja = $_GET['prowizja'];
    }
    
    $tabOpcja = array(array('id' => 'msp', 'nazwa' => $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$mieszkanie_spoldzielcze_wlasnosciowe)), 
    array('id' => 'mspkw', 'nazwa' => $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$mieszkanie_spoldzielcze_wlasnosciowe_z_ksiega_wieczysta)), 
    array('id' => 'mhdd', 'nazwa' => $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$mieszkanie_hipoteczne__dom__dzialka)));

    echo '<center><span class="menub"><b>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$kalkulator_oplat).'<br /></b></span><br ><form action="'.$_SERVER['PHP_SELF'].'" method="GET">';
    echo '<input type="hidden" name="target" value="kalk_finansowy"><table border="0" width="95%"><tr align="center"><td span class="polecam">';
    echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$cena_nieruchomosci).':<br />';
    KontrolkiHtml::DodajLiczbaWymiernaTextbox('cena', 'id_cena', $cena, 10, 9, ''); //echo '<input type="char" name="cena" value="'.$cena.'">
    echo '</td></tr><tr align="center"><td span class="polecam">'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$rodzaj_nieruchomosci).':<br>';
    KontrolkiHtml::DodajSelectDomWartId('rodzaj', 'id_rodzaj', $tabOpcja, 'rodzaj_id', $rodzaj_id, '', '');

    echo '</td></tr><tr align="center"><td span class="polecam">'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$prowizja_biura).' ('.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$np)
    .' 2.5 %): <br />';
    KontrolkiHtml::DodajLiczbaWymiernaTextbox('prowizja', 'id_prowizja', $prowizja, 5, 6, '');//echo '<input type="char" name="prowizja" value="'.$prowizja.'"></td></tr>';

    echo '<tr align="center"><td colspan="2" span class="polecam">';
    $tabPodpowiedzi = 'Array(\''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$cena_nieruchomosci).'\', \''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$prowizja_biura).'\')';
    KontrolkiHtml::DodajSubmit('oblicz', 'id_oblicz', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$oblicz), 'onclick="return WalidacjaFormularz(Array(cena, prowizja), '.$tabPodpowiedzi.', \''.
    $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$brak).' : \');"');
    //echo '&nbsp;';
    //KontrolkiHtml::DodajSubmitWyczysc('skasuj', 'id_skasuj', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$kasuj), '');
    echo '</td></tr></center></table></form>';

    if (isset($_GET['oblicz'])) 
    {
        ///*** ten krotki algorytm powinien byc z utila - osobna funkcja liczaca
        $dzielnik = 1;
        if ($_GET['rodzaj_id'] != 'mhdd')
        {
            $dzielnik = 2;
        }
        //mieszkanie hipoteczne nie ma dzielnika /2            
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
            $oplatasa = '200 zł.';
        }
        else
        {
            $oplatasa = $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$brak);
        }
        
        
        echo '<table width="512" cellpadding="0" cellspacing="0" border="0"><td width="100%" align="right"><a href="drukkal.php?cena='.$_GET['cena'].'&rodzaj='.$_GET['rodzaj'].'&rodzaj_id='.$_GET['rodzaj_id'].'&prowizja='.$_GET['prowizja'].'" 
        target="_blank"><img src="gfx/drukarka.gif" border="0"></img>&nbsp;&nbsp;'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wydrukuj_oplaty).
        '</a><br /></td></tr></table>';
        
        echo '<center><span class="napis55"><b>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wynik_oplat).'<br />'.$_GET['rodzaj'].'<br><br></b></span>';
        echo '<table width="70%" border frame="box"><tr><td width="50%" class="polecam" align="right" bgcolor="#e7e7e7"><span><b>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$cena_nieruchomosci).' :</b>
        </td><td width="20%"><span class="polecam">'.$_GET['cena'].' zł.</span></td></tr>';
        
        echo '<tr><td width="50%" class="polecam" align="right" bgcolor="#e7e7e7"><span><b>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podatek_od_czynnosci_cywilnoprawnych).':</b></span></td>';
        $podatekcywilny = $_GET['cena'] * 0.02;
        echo '<td width="20%"><span class="polecam">'.$podatekcywilny.' zł.</span></td></tr>';
        
        echo '<tr><td width="50%" class="polecam" align="right" bgcolor="#e7e7e7"><span><b>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$taksa_notarialna).':</b></span></td>';
        echo '<td width="20%"><span class="polecam">'.$taksanot.' zł.</span></td></tr>';
        
        echo '<tr><td width="50%" class="polecam" align="right" bgcolor="#e7e7e7"><span><b>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podatek_vat_od_taksy_notarialnej).':</b></span></td>';
        $podatekvat = $taksanot * 0.22;
        echo '<td width="20%"><span class="polecam">'.$podatekvat.' zł.</span></td></tr>';
        
        echo '<tr><td width="50%" class="polecam" align="right" bgcolor="#e7e7e7"><span><b>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$prowizja_biura).' ('.$_GET['prowizja'].' %):</b></span></td>';

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
        
        echo '<tr><td width="50%" class="polecam" align="right" bgcolor="#e7e7e7"><span><b>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podatek_vat_od_prowizji_biura).':</b></span></td>';
        $podatekvatp = $prow * 0.22;
        echo '<td width="20%"><span class="polecam">'.$podatekvatp.' zł.</span></td></tr>';
        
        echo '<tr><td width="50%" class="polecam" align="right" bgcolor="#e7e7e7"><span><b>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$oplata_sadowa).':</b></span></td>
        <td width="20%"><span class="polecam">'.$oplatasa.'</span></td></tr>';
        
        echo '<tr><td width="50%" class="polecam" align="right" bgcolor="#e7e7e7"><span><b>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wypisy_aktow).':</b></span></td>';
        $wakt = $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$okolo).' 200 zł.';
        echo '<td width="20%"><span class="polecam">'.$wakt.'</span></td></tr>';
        
        $wpl = 200; 
        $sumaod = $podatekcywilny + $taksanot + $podatekvat + $prow + $oplatasa + $podatekvatp + $wpl;
        
        echo '<tr><td width="50%" class="polecam" align="right" bgcolor="#e7e7e7"><span><b>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$suma_oplat_dodatkowych).':</b></span></td>
        <td width="20%"><span class="polecam">'.$sumaod.' zł.</span></td></tr>';
        
        echo '<tr><td width="50%" class="polecam" align="right" bgcolor="#e7e7e7"><span><b>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$suma).':</b></span></td>';
        $suma = $cena + $podatekcywilny + $taksanot + $podatekvat + $prow + $oplatasa + $podatekvatp + $wpl;
        echo '<td width="20%"><span class="polecam">'.$suma.' zł.</span></td></tr></table>';
        
    }
     
    require('stopka.php');    
?>
</body>
</html>
