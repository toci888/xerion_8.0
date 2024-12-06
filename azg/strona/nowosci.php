<?php
    //scroll to left side : direction:rtl;
    echo '<div id="nowosci" onscroll="SaveScroll(this.id, this.scrollTop);" style="height:'.$wysokosc_strony.'px; overflow:auto;"><table width="'.$szer_boki_strona.'" cellpadding="0" cellspacing="0" style="border: 1px solid black;">'.
    UtilsUI::DodajTrListwaGlowna($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nowosci));
    
    $nowosci = $dal->PodajNowosci();

    foreach ($nowosci as $nowosc)
    {
        echo '<tr><td style="border-top: 1px solid; background-image: url(gfx/tlo_bok.gif); background-repeat: repeat-x;">'; //zewnetrzne obramówki
        $sciezka_zdjecie = 'img/zd0.jpg';
        if ($nowosc[StronaOfertaDAL::$zdjecie] != null)
        {
            $sciezka_zdjecie = 'media/'.$nowosc[StronaOfertaDAL::$id_nieruchomosc].'/zdjecia/m_'.$nowosc[StronaOfertaDAL::$zdjecie];
        }
        //<img src="'.$sciezka_zdjecie.'" width="120" height="90" border="0" alt="Zdjêcie nr"></img>
        echo '<table align="center" width="130"><tr><td valign="top" style="border-top: 1px solid white; border-bottom: 1px solid white; border-left: 1px solid white; border-right: 1px solid white; 
        background-image: url('.$sciezka_zdjecie.'); background-repeat: no-repeat;" 
         height="100" align="left"><center><div class="wyl">';
        if ($nowosc[NieruchomoscDAL::$wylacznosc])
        {
            echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wylacznosc).'<br />';
        }
        $przecinek_p_p = false; //przcinek powierzchnia - pokoje :P
        if (strlen($nowosc[ExportDAL::$liczba_pokoi]) > 0)
        {
            $przecinek_p_p = true;
            echo $nowosc[ExportDAL::$liczba_pokoi].$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$pok).'.';
        }
        if (strlen($nowosc[StronaOfertaDAL::$powierzchnia_uzytkowa]) > 0)
        {
            if ($przecinek_p_p)
            {
                echo ', ';
            }
            echo $nowosc[StronaOfertaDAL::$powierzchnia_uzytkowa].'m<sup>2</sup>';
        }
        echo '</div></td></tr><tr><td align="center">
        <a class="link_now_polec" onclick="blur();" href="http://'.
        $_SERVER['SERVER_NAME'].'/index.php?target=oferta&'.tags::$oferta.'='.$nowosc[StronaOfertaDAL::$id_oferta].'&'.StronaPodsInfoDAL::$id_trans_rodzaj.'='.
        $nowosc[StronaPodsInfoDAL::$id_trans_rodzaj].'&'.StronaPodsInfoDAL::$id_nier_rodzaj.'='.$nowosc[StronaPodsInfoDAL::$id_nier_rodzaj].'">'.
        $tlumaczenia->Tlumacz($_SESSION[$jezyk], $nowosc[StronaOfertaDAL::$transakcja_rodzaj]).' - '.
        $tlumaczenia->Tlumacz($_SESSION[$jezyk], $rodzaj_nier_link[$nowosc[StronaOfertaDAL::$id_nier_rodzaj]]).', '.
        $nowosc[StronaOfertaDAL::$lokalizacja].'</a>
        </center></td></tr></table>';
        
        echo '</td></tr>';
    }
    
    echo '</table></div>';
?>