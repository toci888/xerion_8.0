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
    include_once ('bll/waluty.php'); 
    include_once ('bll/tags.php'); 
    include_once ('bll/jezykibll.php');
    include_once ('bll/cache.php');
    include_once ('dal/dal.php');
    require('naglowek.php');
    require('conf.php');

    
    $obiektTrans = new TransNierDAL();      
    $tabNier = $obiektTrans->PodajListeNieruchomosci($ilosc_wierszy);
    $tabTrans = $obiektTrans->PodajListeTransakcji(array(TransNierDAL::$of_zap => tags::$zapotrzebowanie), $ilosc_wierszy);

    echo '<table '.$atr_tab_srodek.'>'.UtilsUI::DodajTrListwaGlowna($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$kursy_walut));
    echo '<tr><td><table align="center" cellpading="1" cellspacing="1" width="98%" style="border: 1px solid black; background-color: #d5deec;"><tr><td></td></tr><tr><td><table width="100%">';
    
    $obj = new KursyWalut();
    $kursy = $obj->PodajKursy();
    
    echo '<tr>'.UtilsUI::DodajTdOferta($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$tabela_kursow_walut_na_dzien).': '.$kursy['czas']).'</tr><tr><td><table align="center">';
    //naglowki
    echo '<tr><td><b>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$kod_waluty).':</b></td><td><b>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nazwa_waluty).':</b></td>
    <td><b>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$kurs_sredni).':</b></td></tr>';

    foreach ($kursy['dane'] as $kurs)
    {
        echo '<tr><td>'.$kurs[KursyWalut::$kod_waluty].'</td>';
        echo '<td>'.$kurs[KursyWalut::$nazwa_waluty].'</td>';
        echo '<td>'.$kurs[KursyWalut::$kurs_sredni].' PLN</td></tr>';
    }
    
    echo '</table></td></tr></table></td></tr></table></td></tr></table>';
    
    require('stopka.php');    
?>
</body>
</html>