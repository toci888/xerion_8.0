<?
    include_once ('ui/kontrolki_html.php');
    include_once ('dal/queriesDAL.php');
    include_once ('ui/utilsui.php');
    include_once ('bll/parametrynierbll.php'); 
    include_once ('bll/tags.php'); 
    include_once ('bll/agentbll.php');
    include_once ('bll/jezykibll.php');
    include_once ('bll/cache.php');
    include_once ('bll/transnierbll.php');
    require('naglowek.php');
    require('conf.php');
    
    $identbiura = "1";
    $nowdate = date("Y-m-d");
    $tlumaczenia = cachejezyki::Czytaj();

    echo '<br /><center><span class="menu"><b>'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$subskrypcja_biura_nieruchomosci), $_SESSION[$jezyk]).'</span></center><br />';

    if ($_GET['action'] == 'dodajsub') 
    {
        $obiektTrans = new TransNierDAL();      
        $tabNier = $obiektTrans->PodajListeNieruchomosci($ilosc_wierszy);
        $tabTrans = $obiektTrans->PodajListeTransakcji(array(TransNierDAL::$of_zap => tags::$zapotrzebowanie), $ilosc_wierszy);
        //Wpisuj±c swój E-mail na bie¿±co bêdziesz informowany o pojawiaj±cych siê w naszym biurze ofertach, spe³niaj±cych podane przez ciebie kryteria
        //Dla poprawnego dzia³ania subskrypcji wymagane jest wype³nienie wszystkich pól w obszarze wybranej opcji - kupna lub najmu
        echo '<span class="poleca">'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wpisujac_swoj_email_na_biezaco), $_SESSION[$jezyk]).'.</span><br />
        <span class="poleca">'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$dla_poprawnego_dzialania_subskrypcji), $_SESSION[$jezyk]).'.</span>
        <form action="'.$_SERVER['PHP_SELF'].'" method="POST">';
        echo '<table border="0" width="100%"><tr><td colspan="4" align="center"><span class="poleca"><b>'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$szukam_nieruchomosci), $_SESSION[$jezyk]).
        '</b><br /></td></tr><tr><td><span class="poleca">'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$rodzaj_nieruchomosci), $_SESSION[$jezyk]).':<br />';
        KontrolkiHtml::DodajSelectDomWartId('nieruchomosci', 'id_nieruchomosci', $tabNier, StronaPodsInfoDAL::$id_nier_rodzaj.'sub', null, '', '', TransNierDAL::$id, TransNierDAL::$nazwa_nieruchomosc, true);
        echo '</td><td><span class="poleca">'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$rodzaj_transakcja), $_SESSION[$jezyk]).':<br />';
        unset($tabTrans[2]);
        KontrolkiHtml::DodajSelectDomWartId('transakcje', 'id_transakcje', $tabTrans, StronaPodsInfoDAL::$id_trans_rodzaj.'sub', null, '', '', null, null, true);
        echo '</td><td><span class="poleca">'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wedlug_ceny), $_SESSION[$jezyk]).':<br />'.
        UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$od), $_SESSION[$jezyk]).'&nbsp;&nbsp;</span>'; //Wed³ug ceny
        KontrolkiHtml::DodajLiczbaWymiernaTextbox(StronaSubskrypcjaDAL::$cena_min, 'id_cena_min', '', 8, 5, '');
        echo '<span class="poleca">&nbsp;&nbsp;'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$do), $_SESSION[$jezyk]).'&nbsp;</span>';
        KontrolkiHtml::DodajLiczbaWymiernaTextbox(StronaSubskrypcjaDAL::$cena_max, 'id_cena_max', '', 8, 5, '');
        echo '</td><td><span class="poleca">'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podaj_swoj_email), $_SESSION[$jezyk]).':<br />'; //Podaj swój E-mail
        KontrolkiHtml::DodajEmailTextbox(StronaSubskrypcjaDAL::$email, 'id_email', '', 20, 13, '', '');
        echo '</td></tr><tr align="center"><td colspan="4"><span class="poleca">';
        $tabPodpowiedzi = 'Array(\''.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$cena_minimalna), $_SESSION[$jezyk]).'\', \''.
        UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$cena_maxymalna), $_SESSION[$jezyk]).'\', \''.
        UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$adres_email), $_SESSION[$jezyk]).'\')'; 
        KontrolkiHtml::DodajSubmit('dodaj_subs', 'id_dodaj_subs', UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$dodaj), $_SESSION[$jezyk]), 
        'onclick="return WalidacjaFormularz(Array('.StronaSubskrypcjaDAL::$cena_min.', '.StronaSubskrypcjaDAL::$cena_max.', '.StronaSubskrypcjaDAL::$email.'), '.$tabPodpowiedzi.', \''.
        UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$brak), $_SESSION[$jezyk]).' : \');"');
        echo '&nbsp;&nbsp;&nbsp;';
        KontrolkiHtml::DodajSubmit('usun_subs', 'id_usun_subs', UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$usun), $_SESSION[$jezyk]), '');
        echo '</td></tr><tr><td colspan="4"><img src="img/black.gif" width="100%" height="1" border="0"></td></tr></table></form>';
            
        ///desubskrypcja
    }

    require('stopka.php');
?>