<HTML>
<HEAD>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <script language="javascript" src="js/script.js"></script>
  <script>
        function DodajPowiaty(ctrl, id_parent)   //
        {
            //alert(id_parent);
            xajax_PodajDzieciRegGeog(ctrl, 'innerHTML', id_parent);//
        }
  </script>

<link rel="StyleSheet" href="css/dtree.css" type="text/css" /> 
</head> 
<body>
<?php
//<script language="javascript" src="js/dtree.js"></script>
//<link href="azg.css" rel="stylesheet" type="text/css"> 
    // œ - ¶ ¹ - ±  Ÿ - ¼  - ¬ Œ - ¦
    include_once ('ui/kontrolki_html.php'); 
    include_once ('ui/utilsui.php'); 
    include_once ('bll/tags.php'); 
    include_once ('bll/jezykibll.php');
    include_once ('bll/cache.php');
    include_once ('dal/dal.php');
    require('naglowek.php');
    require('conf.php');
    
    //ifn¹æ usun
    
    $powierzchnia = null;
    $cena = null;
    $email = null;
    $id_wybrana_msc = null;
    $id_nier_rodzaj = null;
    $id_trans_rodzaj = null;
    
    if (isset($_GET['dodaj_subs']))
    {
        $powierzchnia = $_GET[StronaSubskrypcjaDAL::$powierzchnia];
        $cena = $_GET[StronaSubskrypcjaDAL::$cena_max];
        $email = $_GET[StronaSubskrypcjaDAL::$email];
        $id_wybrana_msc = $_GET['id_wybrana_msc'];
        $id_nier_rodzaj = $_GET[StronaPodsInfoDAL::$id_nier_rodzaj];
        $id_trans_rodzaj = $_GET[StronaPodsInfoDAL::$id_trans_rodzaj];
    }

    if (!isset($_SESSION['wojewodztwo']))
    {
        $_SESSION['wojewodztwo'] = $wojewodztwo = $opolskie;
    }
    else
    {
        $wojewodztwo = $_SESSION['wojewodztwo'];
    }
    $obiektTrans = new TransNierDAL();      
    $tabNier = $obiektTrans->PodajListeNieruchomosci($ilosc_wierszy);
    $tabTrans = $obiektTrans->PodajListeTransakcji(array(TransNierDAL::$of_zap => tags::$oferta), $ilosc_wierszy);
    
    $wojewodztwa = SlownikDAL::PodajWojewodztwa();
    
    echo '<table '.$atr_tab_srodek.'>'.UtilsUI::DodajTrListwaGlowna($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$subskrypcja_zlecen_biura_nieruchomosci).' '.$AZG);
    echo '<tr><td><table align="center" cellpading="1" cellspacing="1" width="98%" style="border: 1px solid black; background-color: #d5deec;"><tr><td>'.
    $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wpisujac_informacje_o_nieruchomosci);
    echo '. '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$po_zatwierdzeniu_danych_zostanie_wyswietlona).'. '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$dla_poprawnego_dzialania_subskrypcji).
    '.</td></tr><tr><td>
    <form action="'.$_SERVER['PHP_SELF'].'" method="GET"><table border="0" width="100%"><tr><td colspan="4" align="center"><span class="poleca"><b>'.
    $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$posiadam_nieruchomosc).'</b><br /></td></tr>
    <tr><td><span class="poleca">'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$rodzaj_nieruchomosci).':<br />';
    KontrolkiHtml::DodajHidden('id_target', 'target', $_GET['target']);
    KontrolkiHtml::DodajSelectDomWartId('nieruchomosci', 'id_nieruchomosci', $tabNier, StronaPodsInfoDAL::$id_nier_rodzaj, $id_nier_rodzaj, '', '', TransNierDAL::$id, TransNierDAL::$nazwa_nieruchomosc);
    echo '</td><td><span class="poleca">'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$rodzaj_transakcja).':<br />';
    unset($tabTrans[2]);
    KontrolkiHtml::DodajSelectDomWartId('transakcje', 'id_transakcje', $tabTrans, StronaPodsInfoDAL::$id_trans_rodzaj, $id_trans_rodzaj, '', '', null, null);
    echo '</td><td><span class="poleca">'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$powierzchnia).':<br />';
    KontrolkiHtml::DodajLiczbaWymiernaTextbox(StronaSubskrypcjaDAL::$powierzchnia, 'id_powierzchnia', $powierzchnia, 8, 5, '');
    echo '</td><td><span class="poleca">'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$cena).':<br />';
    KontrolkiHtml::DodajLiczbaWymiernaTextbox(StronaSubskrypcjaDAL::$cena_max, 'id_cena_max', $cena, 8, 5, '');
    echo '</td><td><span class="poleca">'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podaj_swoj_email).':<br />'; //Podaj swój E-mail
    KontrolkiHtml::DodajEmailTextbox(StronaSubskrypcjaDAL::$email, 'id_email', $email, 20, 13, '', '');
    echo '</td></tr>';
    //<tr align="center"><td colspan="4"><span class="poleca">';
    
    //</td></tr>
    echo '</table><b>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$lokalizacja_nieruchomosci).'
    </b><table><tr><td valign="top">'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wojewodztwo).':<br />';
    KontrolkiHtml::DodajHidden('id_wybrana_msc', 'id_wybrana_msc', $id_wybrana_msc);
    echo KontrolkiHtml::DodajSelectRegGeog('wojewodztwo', 'id_wojewodztwo', 1, 'wojewodztwo_id', $wojewodztwo, 'DodajPowiaty(\'msc_powiat\', wojewodztwo_id.value); msc_gmina.innerHTML = \'\';', '');
    echo '</td><td valign="top" id="msc_powiat" name="msc_powiat">'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$powiat).':<br />';
    echo KontrolkiHtml::DodajSelectRegGeog('powiaty', 'id_powiaty', $wojewodztwo, 'powiat_id', '', 
    'msc_gmina.innerHTML = \'<iframe width=250 height=\' + WyznaczWysokoscDrzewa(this.size) + \' frameborder=0 src=region_drzewo.php?id=\' + this.options[this.selectedIndex].id + \'&nazwa=\' + this.options[this.selectedIndex].value + \'></iframe>\';');
    echo '</td><td valign="top" id="msc_gmina" name="msc_gmina">';
    echo '</td></tr></table><center>';
    
    $tabPodpowiedzi = 'Array(\''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$powierzchnia).'\', \''.
    $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$cena).'\', \''.
    $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$lokalizacja_nieruchomosci).'\', \''.
    $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$adres_email).'\')'; 
    KontrolkiHtml::DodajSubmit('dodaj_subs', 'id_dodaj_subs', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$dodaj), 
    'onclick="return WalidacjaFormularz(Array('.StronaSubskrypcjaDAL::$powierzchnia.', '.StronaSubskrypcjaDAL::$cena_max.', id_wybrana_msc,'.StronaSubskrypcjaDAL::$email.'), '.$tabPodpowiedzi.', \''.
    $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$brak).' : \');"');
    echo '&nbsp;&nbsp;&nbsp;';
    KontrolkiHtml::DodajSubmit('usun_subs', 'id_usun_subs', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$usun), '');
    
    echo '</center></form></td></tr></table></td></tr></table>';
    
    if (isset($_GET['dodaj_subs']))
    {
        $dal = new StronaSubskrypcjaDAL();
        
        $tabParametr[StronaSubskrypcjaDAL::$id_nier_rodzaj] = $_GET[StronaSubskrypcjaDAL::$id_nier_rodzaj];
        $tabParametr[StronaSubskrypcjaDAL::$id_trans_rodzaj] = $_GET[StronaSubskrypcjaDAL::$id_trans_rodzaj];
        $tabParametr[StronaSubskrypcjaDAL::$cena_max] = $_GET[StronaSubskrypcjaDAL::$cena_max];
        $tabParametr[StronaSubskrypcjaDAL::$powierzchnia] = $_GET[StronaSubskrypcjaDAL::$powierzchnia];
        $tabParametr[StronaSubskrypcjaDAL::$email] = $_GET[StronaSubskrypcjaDAL::$email];
        $tabParametr[StronaSubskrypcjaDAL::$id_jezyk] = $_SESSION[$jezyk];
        $tabParametr[NieruchomoscDAL::$id_region_geog] = $_GET['id_wybrana_msc'];
        
        $wynik = $dal->DodajSubskrypcjaZlecen($tabParametr, $ilosc_wierszy);
        
        if ($ilosc_wierszy > 1)
        {
            //echo '<p align="center"><span class="poleca">'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$twoje_zgloszenie_zostalo_przyjete).'.</span></p>'; //Twoje zg³oszenie zosta³o przyjête
            //skojarzyc :)
            $obiekt = new StronaPodsInfoDAL();
        
            $rodzaj_oferty = $obiekt->RodzajOferta($_GET[StronaPodsInfoDAL::$id_trans_rodzaj], $_GET[StronaPodsInfoDAL::$id_nier_rodzaj], true);
            echo '<center><b>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$ponizej_zlecenia_biura_odpowiadajace_podanej_ofercie).'. '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$ilosc_zlecen).': '.$ilosc_wierszy.'.</b></center>';
            $html = UtilsUI::ZleceniaLista($wynik, $rodzaj_oferty, $_SESSION[$jezyk]);
            echo $html;
        }
        else
        {
            if ($ilosc_wierszy == 1 && $wynik[0][NieruchomoscDAL::$id_zapotrzebowanie] == null)
            echo '<p align="center"><span class="poleca">'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], $wynik[0]['agent']).'</span></p>';
        }
    }

    require('stopka.php');    
?>
</body>
</html>
