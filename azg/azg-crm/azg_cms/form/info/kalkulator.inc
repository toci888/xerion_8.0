<table width="100%" cellpadding="0" cellspacing="0" frame border="0" border="0">
<tr border="0">
<td>
<?
    $cena = null;
    $rodzaj_id = null;
    $prowizja = null;

    if (isset($_GET['cena']))
    {
        $cena = $_GET['cena'];
        $rodzaj_id = $_GET['rodzaj_id'];
        $prowizja = $_GET['prowizja'];
    }
    
    $tabOpcja = array(array('id' => 'msp', 'nazwa' => UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$mieszkanie_spoldzielcze_wlasnosciowe), $_SESSION[$jezyk])), 
    array('id' => 'mspkw', 'nazwa' => UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$mieszkanie_spoldzielcze_wlasnosciowe_z_ksiega_wieczysta), $_SESSION[$jezyk])), 
    array('id' => 'mhdd', 'nazwa' => UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$mieszkanie_hipoteczne__dom__dzialka), $_SESSION[$jezyk])));

    echo '<center><span class="menub"><b>'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$kalkulator_oplat), $_SESSION[$jezyk]).'<br /></b></span><br ><form action="'.$_SERVER['PHP_SELF'].'" method="GET">';
    echo '<input type="hidden" name="action" value="oblicz"><table border="0" width="95%"><tr align="center"><td span class="polecam">';
    echo UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$cena_nieruchomosci), $_SESSION[$jezyk]).':<br />';
    KontrolkiHtml::DodajLiczbaWymiernaTextbox('cena', 'id_cena', $cena, 10, 9, ''); //echo '<input type="char" name="cena" value="'.$cena.'">
    echo '</td></tr><tr align="center"><td span class="polecam">'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$rodzaj_nieruchomosci), $_SESSION[$jezyk]).':<br>';
    KontrolkiHtml::DodajSelectDomWartId('rodzaj', 'id_rodzaj', $tabOpcja, 'rodzaj_id', $rodzaj_id, '', '');
	/*echo "<select name=rodzaj>";
	echo "<option value=\"msp\">Mieszkanie Spó³dzielcze W³asno¶ciowe";
	echo "<option value=\"mspkw\">Mieszkanie Spó³dzielcze W³asno¶ciowe z Ksiêg± Wieczyst±";
	echo "<option value=\"mhdd\">Mieszkanie Hipoteczne, Dom, Dzia³ka";
	echo "</option>";
	echo "</select>";*/
    echo '</td></tr><tr align="center"><td span class="polecam">'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$prowizja_biura), $_SESSION[$jezyk]).' ('.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$np)
    .' 2.5 %): <br />';
    KontrolkiHtml::DodajLiczbaWymiernaTextbox('prowizja', 'id_prowizja', $prowizja, 5, 6, '');//echo '<input type="char" name="prowizja" value="'.$prowizja.'"></td></tr>';

    echo '<tr align="center"><td colspan="2" span class="polecam">';
    KontrolkiHtml::DodajSubmit('oblicz', 'id_oblicz', UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$oblicz), $_SESSION[$jezyk]), '');//<input type=\"submit\" value=\"OBLICZ\" name=\"OBLICZ\"> 
    echo '&nbsp;';
    KontrolkiHtml::DodajSubmitWyczysc('skasuj', 'id_skasuj', UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$kasuj), $_SESSION[$jezyk]), '');//<input type=\"reset\" value=\"SKASUJ\" name=\"SKASUJ\">
    echo '</td></tr></center></table></form>';

    if ($_GET['action'] == 'oblicz') 
    {
        ///kurwa ten krotki algorytm powinien byc z utila - osobna funkcja liczaca
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
            //$taksanot = $taksanot + 200;
            $oplatasa = '200 z³.';
        }
        else
        {
            $oplatasa = UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$brak), $_SESSION[$jezyk]);
        }
        
        
        echo '<table width="512" cellpadding="0" cellspacing="0" border="0"><td width="100%" align="right"><a href="drukkal.php?cena='.$_GET['cena'].'&rodzaj='.$_GET['rodzaj'].'&rodzaj_id='.$_GET['rodzaj_id'].'&prowizja='.$_GET['prowizja'].'" 
        target="_blank"><img src="img/printer.gif" width="15" height="17" border="0"></img>&nbsp;&nbsp;'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wydrukuj_oplaty), $_SESSION[$jezyk]).
        '</a><br /></td></tr></table>';
        
        echo '<center><span class="napis55"><b>'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wynik_oplat), $_SESSION[$jezyk]).'<br />'.$_GET['rodzaj'].'<br><br></b></span>';
        echo '<table width="70%" border frame="box"><tr><td width="50%" class="polecam" align="right" bgcolor="#e7e7e7"><span><b>'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$cena_nieruchomosci), $_SESSION[$jezyk]).' :</b>
        </td><td width="20%"><span class="polecam">'.$_GET['cena'].' z³.</span></td></tr>';
        
        echo '<tr><td width="50%" class="polecam" align="right" bgcolor="#e7e7e7"><span><b>'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podatek_od_czynnosci_cywilnoprawnych), $_SESSION[$jezyk]).':</b></span></td>';
        $podatekcywilny = $_GET['cena'] * 0.02;
        echo '<td width="20%"><span class="polecam">'.$podatekcywilny.' z³.</span></td></tr>';
        
        echo '<tr><td width="50%" class="polecam" align="right" bgcolor="#e7e7e7"><span><b>'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$taksa_notarialna), $_SESSION[$jezyk]).':</b></span></td>';
        echo '<td width="20%"><span class="polecam">'.$taksanot.' z³.</span></td></tr>';
        
        echo '<tr><td width="50%" class="polecam" align="right" bgcolor="#e7e7e7"><span><b>'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podatek_vat_od_taksy_notarialnej), $_SESSION[$jezyk]).':</b></span></td>';
        $podatekvat = $taksanot * 0.22;
        echo '<td width="20%"><span class="polecam">'.$podatekvat.' z³.</span></td></tr>';
        
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
        echo '<td width="20%"><span class="polecam">'.$prow.' z³.</span></td></tr>';
        
        echo '<tr><td width="50%" class="polecam" align="right" bgcolor="#e7e7e7"><span><b>'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podatek_vat_od_prowizji_biura), $_SESSION[$jezyk]).':</b></span></td>';
        $podatekvatp = $prow * 0.22;
        echo '<td width="20%"><span class="polecam">'.$podatekvatp.' z³.</span></td></tr>';
        
        echo '<tr><td width="50%" class="polecam" align="right" bgcolor="#e7e7e7"><span><b>'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$oplata_sadowa), $_SESSION[$jezyk]).':</b></span></td>
        <td width="20%"><span class="polecam">'.$oplatasa.'</span></td></tr>';
        
        echo '<tr><td width="50%" class="polecam" align="right" bgcolor="#e7e7e7"><span><b>'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wypisy_aktow), $_SESSION[$jezyk]).':</b></span></td>';
        $wakt = UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$okolo), $_SESSION[$jezyk]).' 200 z³.';
        echo '<td width="20%"><span class="polecam">'.$wakt.'</span></td></tr>';
        
        $wpl = 200; 
        $sumaod = $podatekcywilny + $taksanot + $podatekvat + $prow + $oplatasa + $podatekvatp + $wpl;
        
        echo '<tr><td width="50%" class="polecam" align="right" bgcolor="#e7e7e7"><span><b>'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$suma_oplat_dodatkowych), $_SESSION[$jezyk]).':</b></span></td>
        <td width="20%"><span class="polecam">'.$sumaod.' z³.</span></td></tr>';
        
        echo '<tr><td width="50%" class="polecam" align="right" bgcolor="#e7e7e7"><span><b>'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$suma), $_SESSION[$jezyk]).':</b></span></td>';
        $suma = $cena + $podatekcywilny + $taksanot + $podatekvat + $prow + $oplatasa + $podatekvatp + $wpl;
        echo '<td width="20%"><span class="polecam">'.$suma.' z³.</span></td></tr></table>';
        
    }
?>
<td>
</tr>
</table>