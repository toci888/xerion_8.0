<HTML>
<HEAD>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <script language="javascript" src="js/script.js"></script>
<link href="azg.css" rel="stylesheet" type="text/css">
</head>
<body>
<?php
    // œ - ¶ ¹ - ±  Ÿ - ¼  - ¬ Œ - ¦
    include_once ('ui/kontrolki_html.php'); 
    include_once ('ui/utilsui.php'); 
    include_once ('bll/tags.php'); 
    include_once ('bll/jezykibll.php');
    include_once ('bll/cache.php');
    include_once ('dal/dal.php');
    require('naglowek.php');
    require('conf.php');

    
    $obiektTrans = new TransNierDAL();      
    $tabNier = $obiektTrans->PodajListeNieruchomosci($ilosc_wierszy);
    $tabTrans = $obiektTrans->PodajListeTransakcji(array(TransNierDAL::$of_zap => tags::$zapotrzebowanie), $ilosc_wierszy);

    echo '<table '.$atr_tab_srodek.'>'.UtilsUI::DodajTrListwaGlowna($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$subskrypcja_biura_nieruchomosci).' '.$AZG);
    echo '<tr><td><table align="center" cellpading="1" cellspacing="1" width="98%" style="border: 1px solid black; background-color: #d5deec;"><tr><td>'.
    $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wpisujac_swoj_email_na_biezaco);
    echo '. '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$dla_poprawnego_dzialania_subskrypcji).'.</td></tr>
    <tr><td>
    <form action="'.$_SERVER['PHP_SELF'].'" method="GET">';
    echo '<table border="0" width="100%"><tr><td colspan="4" align="center"><span class="poleca"><b>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$szukam_nieruchomosci).'</b><br /></td></tr>
    <tr><td><span class="poleca">'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$rodzaj_nieruchomosci).':<br />';
    KontrolkiHtml::DodajHidden('id_target', 'target', $_GET['target']);
    KontrolkiHtml::DodajSelectDomWartId('nieruchomosci', 'id_nieruchomosci', $tabNier, StronaPodsInfoDAL::$id_nier_rodzaj.'sub', null, '', '', TransNierDAL::$id, TransNierDAL::$nazwa_nieruchomosc);
    echo '</td><td><span class="poleca">'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$rodzaj_transakcja).':<br />';
    unset($tabTrans[2]);
    KontrolkiHtml::DodajSelectDomWartId('transakcje', 'id_transakcje', $tabTrans, StronaPodsInfoDAL::$id_trans_rodzaj.'sub', null, '', '', null, null);
    echo '</td><td><span class="poleca">'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wedlug_ceny).':<br />'.
    $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$od).'&nbsp;&nbsp;</span>'; //Wed³ug ceny
    KontrolkiHtml::DodajLiczbaWymiernaTextbox(StronaSubskrypcjaDAL::$cena_min, 'id_cena_min', '', 8, 5, '');
    echo '<span class="poleca">&nbsp;&nbsp;'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$do).'&nbsp;</span>';
    KontrolkiHtml::DodajLiczbaWymiernaTextbox(StronaSubskrypcjaDAL::$cena_max, 'id_cena_max', '', 8, 5, '');
    echo '</td><td><span class="poleca">'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podaj_swoj_email).':<br />'; //Podaj swój E-mail
    KontrolkiHtml::DodajEmailTextbox(StronaSubskrypcjaDAL::$email, 'id_email', '', 20, 13, '', '');
    echo '</td></tr><tr align="center"><td colspan="4"><span class="poleca">';
    $tabPodpowiedzi = 'Array(\''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$cena_minimalna).'\', \''.
    $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$cena_maxymalna).'\', \''.
    $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$adres_email).'\')'; 
    KontrolkiHtml::DodajSubmit('dodaj_subs', 'id_dodaj_subs', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$dodaj), 
    'onclick="return WalidacjaFormularz(Array('.StronaSubskrypcjaDAL::$cena_min.', '.StronaSubskrypcjaDAL::$cena_max.', '.StronaSubskrypcjaDAL::$email.'), '.$tabPodpowiedzi.', \''.
    $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$brak).' : \');"');
    echo '&nbsp;&nbsp;&nbsp;';
    KontrolkiHtml::DodajSubmit('usun_subs', 'id_usun_subs', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$usun), '');
    echo '</td></tr><tr><td colspan="4"><img src="img/black.gif" width="100%" height="1" border="0"></td></tr></table></form>
    </td></tr><tr><td>';
    
    if (isset($_GET['dodaj_subs']))  //&& remote addr == local addr
    {
        $dal = new StronaSubskrypcjaDAL();
        
        $tabParametr[StronaSubskrypcjaDAL::$id_nier_rodzaj] = $_GET[StronaSubskrypcjaDAL::$id_nier_rodzaj.'sub'];
        $tabParametr[StronaSubskrypcjaDAL::$id_trans_rodzaj] = $_GET[StronaSubskrypcjaDAL::$id_trans_rodzaj.'sub'];
        $tabParametr[StronaSubskrypcjaDAL::$cena_min] = $_GET[StronaSubskrypcjaDAL::$cena_min];
        $tabParametr[StronaSubskrypcjaDAL::$cena_max] = $_GET[StronaSubskrypcjaDAL::$cena_max];
        $tabParametr[StronaSubskrypcjaDAL::$email] = $_GET[StronaSubskrypcjaDAL::$email];
        $tabParametr[StronaSubskrypcjaDAL::$id_jezyk] = $_SESSION[$jezyk];
        
        $wynik = $dal->DodajSubskrypcja($tabParametr);
        
        if ($wynik['id'] == 1)
        {
            echo '<p align="center"><span class="poleca">'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$twoje_zgloszenie_zostalo_przyjete).'.</span></p>'; //Twoje zg³oszenie zosta³o przyjête
        }
        else
        {
            echo '<p align="center"><span class="poleca">'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], $wynik['nazwa']).'</span></p>';
        }
    }
    else if (isset($_GET['usun_subs']))
    {
        $dal = new StronaSubskrypcjaDAL();
        
        $tabParametr[StronaSubskrypcjaDAL::$id_nier_rodzaj] = $_GET[StronaSubskrypcjaDAL::$id_nier_rodzaj.'sub'];
        $tabParametr[StronaSubskrypcjaDAL::$id_trans_rodzaj] = $_GET[StronaSubskrypcjaDAL::$id_trans_rodzaj.'sub'];
        $tabParametr[StronaSubskrypcjaDAL::$email] = $_GET[StronaSubskrypcjaDAL::$email];
        $wynik = $dal->UsunSubskrypcja($tabParametr);
        
        //var_dump($wynik);
        if ($wynik['id'] == 1)
        {
            echo '<p align="center"><span class="poleca">'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$twoje_zgloszenie_zostalo_przyjete).'.</span></p>'; //Twoje zg³oszenie zosta³o przyjête
        }
        else
        {
            echo '<p align="center"><span class="poleca">'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], $wynik['nazwa']).'</span></p>';
        }
    }
    
    echo '</td></tr></table></td></tr></table>';
    
    require('stopka.php');    
?>
</body>
</html>
