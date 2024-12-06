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
    include_once ('ui/utilsui.php'); 
    include_once ('bll/tags.php'); 
    include_once ('bll/jezykibll.php');
    include_once ('bll/cache.php');
    include_once ('dal/dal.php');
    require('naglowek.php');
    require('conf.php');

    

    echo '<table '.$atr_tab_srodek.'>'.UtilsUI::DodajTrListwaGlowna($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$kontakt));
    echo '<tr><td><table align="center" cellpading="1" cellspacing="1" width="98%" style="border: 1px solid black; background-color: #d5deec;"><tr><td></td></tr><tr><td><table width="100%">';
    echo '<tr><td align="center"><b>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$opolskie).' '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$biuro_nieruchomosci).' '.$AZG.'</b></td></tr>';    
    echo '<tr><td><b>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$siedziba_glowna).'</b></td></tr>';    
    echo '<tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$ul).' Szarych Szeregów 34 d, 45-285 OPOLE<br />
    '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$czynne).': '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$pon).'. - '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$pt).'. 10.00 - 18.00<br />
    '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$tel_fax).' (0 77) 403-12-30, '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$tel_kom).' 0602-531-334</td></tr>';
    
    echo '<tr><td><br /><b>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$filia).'</b></td></tr>';
    echo '<tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$ul).' Bytnara Rudego 13, 45-284 OPOLE<br />
    '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$czynne).': '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$pon).'. - '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$pt).'. 10.00 - 18.00<br />
    '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$tel_fax).' (0 77) 458-00-94, '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$tel_kom).' 0602-531-334</td></tr>';    
    
    echo '<tr><td><br />'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$adres_email).': <a href="mailto:azgwarancja@azg.pl">azgwarancja@azg.pl</a><br />
    '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$strona_www).': <a href="http://www.azg.pl">www.azg.pl</a></td></tr>';
    
    echo '</table></td></tr></table></td></tr></table>';
    
    require('stopka.php');    
?>
</body>
</html>
