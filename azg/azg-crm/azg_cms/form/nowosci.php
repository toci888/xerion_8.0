<?php
    echo '<table width="128" cellpadding="0" cellspacing="0" border="0"><tr><td><img src="img/red.gif" width="128" height="1" border="0"></td></tr><tr><td height="5" class="tdnag"><center><span class="nag1wb">'.
    UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nowosci), $_SESSION[$jezyk]).'</span></center></td></tr><tr><td><img src="img/red.gif" width="128" height="1" border="0"></td></tr>';
    
    $nowosci = $dal->PodajNowosci();
    
    foreach ($nowosci as $nowosc)
    {
        $sciezka_zdjecie = 'img/zd0.jpg';
        if ($nowosc[StronaOfertaDAL::$zdjecie] != null)
        {
            $sciezka_zdjecie = 'media/'.$nowosc[StronaOfertaDAL::$id_nieruchomosc].'/zdjecia/m_'.$nowosc[StronaOfertaDAL::$zdjecie];
        }
        //<img src="'.$sciezka_zdjecie.'" width="120" height="90" border="0" alt="Zdjêcie nr"></img>
        echo '<tr><td width="125" height="125" align="left"><center>';
        if ($nowosc[NieruchomoscDAL::$wylacznosc])
        {
            echo '<span class="wyl">'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wylacznosc), $_SESSION[$jezyk]).'</span>';
        }
        echo '<a href = "http://'.$_SERVER['SERVER_NAME'].'/'.$rodzaj_nier_url[$nowosc[StronaPodsInfoDAL::$id_nier_rodzaj]].'?'.tags::$oferta.'='.
        $nowosc[StronaOfertaDAL::$id_oferta].'&'.StronaPodsInfoDAL::$id_trans_rodzaj.'='.$nowosc[StronaPodsInfoDAL::$id_trans_rodzaj].'&'.StronaPodsInfoDAL::$id_nier_rodzaj.'='.
        $nowosc[StronaPodsInfoDAL::$id_nier_rodzaj].'&cat='.$_GET['action'].'">'.KontrolkiHtml::DodajZdjNierStrona($sciezka_zdjecie, $nowosc[StronaPodsInfoDAL::$id_nier_rodzaj], 
        $nowosc[StronaOfertaDAL::$id_oferta], 120, 90, UtilsUI::KonwersjaEncoding($nowosc[StronaOfertaDAL::$lokalizacja], $_SESSION[$jezyk])).'</a><center><span class="poleca"><a href="http://'.
        $_SERVER['SERVER_NAME'].'/'.$rodzaj_nier_url[$nowosc[StronaPodsInfoDAL::$id_nier_rodzaj]].'?'.tags::$oferta.'='.$nowosc[StronaOfertaDAL::$id_oferta].'&'.StronaPodsInfoDAL::$id_trans_rodzaj.'='.
        $nowosc[StronaPodsInfoDAL::$id_trans_rodzaj].'&'.StronaPodsInfoDAL::$id_nier_rodzaj.'='.$nowosc[StronaPodsInfoDAL::$id_nier_rodzaj].'&cat='.$_GET['action'].'">'.
        UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], $nowosc[StronaOfertaDAL::$transakcja_rodzaj]), $_SESSION[$jezyk]).' - '.
        UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], $rodzaj_nier_link[$nowosc[StronaOfertaDAL::$id_nier_rodzaj]]), $_SESSION[$jezyk]).', '.
        UtilsUI::KonwersjaEncoding($nowosc[StronaOfertaDAL::$lokalizacja], $_SESSION[$jezyk])
        .'</a></span></center></td></tr><tr><td colspan="20"><img src="img/red.gif" width="128" height="1" border="0"></td></tr>';
    }
    
    echo '</table>';
?>