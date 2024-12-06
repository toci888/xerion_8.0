<table width="776" cellpadding="0" cellspacing="0" frame border="0">
<tr><td colspan="7"><img src="../img/red.gif" width="776" height="1" border="0"></td></tr>
<?php
echo '<tr valign="left"><td colspan="7" height="7" class="tdnag"><center><span class="nag1wb"><b>'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$polecamy), $_SESSION[$jezyk]).'</b></span></center></td></tr>';
?>
<tr><td colspan="7"><img src="../img/red.gif" width="776" height="1" border="0"></td></tr>
</table>
<table width="776" height="65" cellpadding="0" cellspacing="0" border="0" bgcolor="white">
<tr>
<?php
    if (!isset($_GET['action']))
    {
        $_GET['action'] = null;
    }
    $oferty_specjalne = new OfertySpecjalne($polecane);
    $oferty = $oferty_specjalne->PodajOferty();
    $dal = new StronaPodsInfoDAL();
    $licznik = 0;
    foreach ($oferty as $klucz => $wartosc)
    {
        
        echo '<td><img src="../img/red.gif" width="1" height="100%" border="0"></td><td valign="top" width="194" height="65" bgcolor="white">';
        $tabParametr[StronaPodsInfoDAL::$id_nier_rodzaj] = $wartosc[StronaPodsInfoDAL::$id_nier_rodzaj];
        $tabParametr[StronaPodsInfoDAL::$id_trans_rodzaj] = $wartosc[StronaPodsInfoDAL::$id_trans_rodzaj];
        $tabParametr[StronaPodsInfoDAL::$id_oferta] = $wartosc[StronaPodsInfoDAL::$id_oferta];
        
        $oferta = $dal->OfertaSkroconaPoId($tabParametr);
        $oferta = $oferta[0];
        $rodzaj_oferty = $dal->RodzajOferta($wartosc[StronaPodsInfoDAL::$id_trans_rodzaj], $wartosc[StronaPodsInfoDAL::$id_nier_rodzaj]);
        $cena = number_format($oferta[StronaOfertaDAL::$cena], 0, ',', '.');
        
        echo '<table width="100%" cellpadding="0" cellspacing="0" border="0"><tr align="left"><td colspan="20" height="7"><center><span class="nag1bb"><b>'.
        UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], $rodzaj_oferty[0][StronaOfertaDAL::$nieruchomosc_rodzaj]), $_SESSION[$jezyk]).' '.
        UtilsUI::KonwersjaEncoding($oferta[StronaOfertaDAL::$lokalizacja], $_SESSION[$jezyk]).'</b></span></center></td></tr>';
        echo '<tr><td align="center" colspan="2">'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], $rodzaj_oferty[0][StronaOfertaDAL::$transakcja_rodzaj]), $_SESSION[$jezyk]).'</td></tr>';
        
        if ($oferta[NieruchomoscDAL::$wylacznosc])
        {
            echo '<tr><td colspan="2" align="center"><span class="wyl">'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wylacznosc), $_SESSION[$jezyk]).'</span></td></tr>';
        }
        
        $sciezka_zdjecie = 'img/zd0.jpg';
        if ($oferta[StronaOfertaDAL::$id_nieruchomosc] != null)
        {
            $sciezka_zdjecie = 'media/'.$oferta[StronaOfertaDAL::$id_nieruchomosc].'/zdjecia/m_'.$oferta[StronaOfertaDAL::$zdjecie];
        }

        echo '<tr><td width="115" height="70" align="left"><a href="http://'.$_SERVER['SERVER_NAME'].'/'.$rodzaj_nier_url[$wartosc[StronaPodsInfoDAL::$id_nier_rodzaj]].'?'.tags::$oferta.'='.
        $oferta[StronaOfertaDAL::$id_oferta].'&'.StronaPodsInfoDAL::$id_trans_rodzaj.'='.$oferta[StronaPodsInfoDAL::$id_trans_rodzaj].'&'.StronaPodsInfoDAL::$id_nier_rodzaj.'='.
        $oferta[StronaPodsInfoDAL::$id_nier_rodzaj].'&cat='.$_GET['action'].'">'.
        KontrolkiHtml::DodajZdjNierStrona($sciezka_zdjecie, $oferta[StronaPodsInfoDAL::$id_nier_rodzaj], $oferta[StronaOfertaDAL::$id_oferta], 110, 65, UtilsUI::KonwersjaEncoding($oferta[StronaOfertaDAL::$lokalizacja], $_SESSION[$jezyk])).'</a></td>';
        echo '<td><br />'.$cena.' PLN.<br /><a href="http://'.$_SERVER['SERVER_NAME'].'/'.$rodzaj_nier_url[$wartosc[StronaPodsInfoDAL::$id_nier_rodzaj]].'?'.tags::$oferta.'='.
        $oferta[StronaOfertaDAL::$id_oferta].'&'.StronaPodsInfoDAL::$id_trans_rodzaj.'='.$oferta[StronaPodsInfoDAL::$id_trans_rodzaj].'&'.StronaPodsInfoDAL::$id_nier_rodzaj.'='.
        $oferta[StronaPodsInfoDAL::$id_nier_rodzaj].'&cat='.$_GET['action'].'">'.strtolower(UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wiecej_o_nieruchomosci), $_SESSION[$jezyk])).'</a></td>';
        echo '</tr>';
        
        echo '</table></td>';
        $licznik++;
        if ($licznik % 4 == 0 && $licznik < 8)
        {
            echo '<td align = "right"><img src="../img/red.gif" width="1" height="100 %" border="0"></td></tr><tr><td colspan="9"><img src="../img/red.gif" width="776" height="1" border="0"></img></td></tr><tr>';
        }
    }
    
?>

<td align="right"><img src="../img/red.gif" width="1" height="100 %" border="0"></td></tr>
</table>

<table width="776" cellpadding="0" cellspacing="0" frame border="0">
<tr><td colspan="7"><img src="../img/red.gif" width="776" height="1" border="0"></td></tr>
<tr valign="left"><td colspan="7" height="7" class="tdnag">
<center>
<span class="nag1wb"><b>
<?php
    //tu juz sa nowe inwestycje
    echo UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nowe_inwestycje), $_SESSION[$jezyk]);
?>
</b>
</span>
</center>
</td></tr>
<tr><td colspan="7"><img src="../img/red.gif" width="776" height="1" border="0"></td></tr>
</table>

<table width="776" height="50" cellpadding="0" cellspacing="0" frameborder="0" align="center">

<tr><td colspan="7" align="left" class="tdnag"><img src="../img/red.gif" width="1" height="100%" border="0"></td>
<?php
    $oferty_specjalne = new OfertySpecjalne($inwestycje);
    $oferty = $oferty_specjalne->PodajOferty();
    foreach ($oferty as $klucz => $wartosc)
    {
        $tabParametr[StronaPodsInfoDAL::$id_nier_rodzaj] = $wartosc[StronaPodsInfoDAL::$id_nier_rodzaj];
        $tabParametr[StronaPodsInfoDAL::$id_trans_rodzaj] = $wartosc[StronaPodsInfoDAL::$id_trans_rodzaj];
        $tabParametr[StronaPodsInfoDAL::$id_oferta] = $wartosc[StronaPodsInfoDAL::$id_oferta];
        
        $oferta = $dal->OfertaSkroconaPoId($tabParametr);
        $oferta = $oferta[0];
        
        $sciezka_zdjecie = 'img/zd0.jpg';
        if ($oferta[StronaOfertaDAL::$id_nieruchomosc] != null)
        {
            $sciezka_zdjecie = 'media/'.$oferta[StronaOfertaDAL::$id_nieruchomosc].'/zdjecia/m_'.$oferta[StronaOfertaDAL::$zdjecie];
        }
        //<td colspan="7" class="tdnag"><img src="../img/red.gif" width="1" height="100%" border="0"></td>
        //<img src="'.$sciezka_zdjecie.'" width="100" height="70" border="0" class="ira" alt="Zdjêcie nr"'.$oferta[StronaOfertaDAL::$zdjecie].'"></img>
        echo '<td align="center" class="tdnag"><a href="http://'.$_SERVER['SERVER_NAME'].'/'.$rodzaj_nier_url[$wartosc[StronaPodsInfoDAL::$id_nier_rodzaj]].'?'.tags::$oferta.'='.
        $oferta[StronaOfertaDAL::$id_oferta].'&'.StronaPodsInfoDAL::$id_trans_rodzaj.'='.$oferta[StronaPodsInfoDAL::$id_trans_rodzaj].'&'.StronaPodsInfoDAL::$id_nier_rodzaj.'='.
        $oferta[StronaPodsInfoDAL::$id_nier_rodzaj].'&cat='.$_GET['action'].'">'.
        KontrolkiHtml::DodajZdjNierStrona($sciezka_zdjecie, $oferta[StronaPodsInfoDAL::$id_nier_rodzaj], $oferta[StronaOfertaDAL::$id_oferta], 
        100, 70).'</a></td>';
    }
?>
<td colspan="7" align="right" class="tdnag"><img src="../img/red.gif" width="1" height="100%" border="0"></td>
</tr></table>