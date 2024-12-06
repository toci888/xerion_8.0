<?php
    echo '<div id="polecamy" onscroll="SaveScroll(this.id, this.scrollTop);" style="height:'.$wysokosc_strony.'px; overflow:auto;"><table width="'.$szer_boki_strona.'" cellpadding="0" cellspacing="0" style="border: 1px solid black;">'.
    UtilsUI::DodajTrListwaGlowna($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$polecamy));
    
    $oferty_specjalne = new OfertySpecjalne($polecane);
    $oferty = $oferty_specjalne->PodajOferty();
    $dal = new StronaPodsInfoDAL();

    foreach ($oferty as $klucz => $wartosc)
    {
        $tabParametr[StronaPodsInfoDAL::$id_nier_rodzaj] = $wartosc[StronaPodsInfoDAL::$id_nier_rodzaj];
        $tabParametr[StronaPodsInfoDAL::$id_trans_rodzaj] = $wartosc[StronaPodsInfoDAL::$id_trans_rodzaj];
        $tabParametr[StronaPodsInfoDAL::$id_oferta] = $wartosc[StronaPodsInfoDAL::$id_oferta];
        
        $oferta = $dal->OfertaSkroconaPoId($tabParametr);
        $oferta = $oferta[0];
        $rodzaj_oferty = $dal->RodzajOferta($wartosc[StronaPodsInfoDAL::$id_trans_rodzaj], $wartosc[StronaPodsInfoDAL::$id_nier_rodzaj]);
        
        echo '<tr><td style="border-top: 1px solid; background-image: url(gfx/tlo_bok.gif); background-repeat: repeat-x;">'; //zewnetrzne obramówki
        $sciezka_zdjecie = 'img/zd0.jpg';
        if ($oferta[StronaOfertaDAL::$zdjecie] != null)
        {
            $sciezka_zdjecie = 'media/'.$oferta[StronaOfertaDAL::$id_nieruchomosc].'/zdjecia/m_'.$oferta[StronaOfertaDAL::$zdjecie];
        }
        //<img src="'.$sciezka_zdjecie.'" width="120" height="90" border="0" alt="Zdjêcie nr"></img>
        echo '<table align="center" width="130"><tr><td valign="top" style="border-top: 1px solid white; border-bottom: 1px solid white; border-left: 1px solid white; border-right: 1px solid white; 
        background-image: url('.$sciezka_zdjecie.'); background-repeat: no-repeat;" 
         height="100" align="left"><center><div class="wyl">';
        if ($oferta[NieruchomoscDAL::$wylacznosc])
        {
            echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wylacznosc).'<br />';
        }
        $przecinek_p_p = false; //przcinek powierzchnia - pokoje :P
        if (strlen($oferta[ExportDAL::$liczba_pokoi]) > 0)
        {
            $przecinek_p_p = true;
            echo $nowosc[ExportDAL::$liczba_pokoi].$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$pok).'.';
        }
        if (strlen($oferta[ExportDAL::$powierzchnia]) > 0)
        {
            if ($przecinek_p_p)
            {
                echo ', ';
            }
            echo $oferta[ExportDAL::$powierzchnia].'m<sup>2</sup>';
        }
        echo '</div></td></tr><tr><td align="center">
        <a class="link_now_polec" onclick="blur();" href="http://'.
        $_SERVER['SERVER_NAME'].'/index.php?target=oferta&'.tags::$oferta.'='.$oferta[StronaOfertaDAL::$id_oferta].'&'.StronaPodsInfoDAL::$id_trans_rodzaj.'='.
        $oferta[StronaPodsInfoDAL::$id_trans_rodzaj].'&'.StronaPodsInfoDAL::$id_nier_rodzaj.'='.$oferta[StronaPodsInfoDAL::$id_nier_rodzaj].'">'.
        $tlumaczenia->Tlumacz($_SESSION[$jezyk], $oferta[StronaOfertaDAL::$transakcja_rodzaj]).' - '.
        $tlumaczenia->Tlumacz($_SESSION[$jezyk], $rodzaj_nier_link[$oferta[StronaOfertaDAL::$id_nier_rodzaj]]).', '.
        $oferta[StronaOfertaDAL::$lokalizacja].'</a>
        </center></td></tr></table>';
        
        echo '</td></tr>';
    }
    
    echo '</table></div>';
?>