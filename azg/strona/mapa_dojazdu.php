<HTML>
<HEAD>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <script language="javascript" src="js/script.js"></script>
<link href="azg.css" rel="stylesheet" type="text/css">
</head>
<body>
<?php
    // � - � � - �  � - � � - � � - �
    include_once ('ui/kontrolki_html.php');
    include_once ('lib/mail.php'); 
    include_once ('ui/utilsui.php'); 
    include_once ('bll/waluty.php'); 
    include_once ('bll/tags.php'); 
    include_once ('bll/jezykibll.php');
    include_once ('bll/cache.php');
    include_once ('dal/dal.php');
    require('naglowek.php');
    require('conf.php');
    
    echo '<table '.$atr_tab_srodek.'>'.UtilsUI::DodajTrListwaGlowna($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$mapa_lokalizacyjna));
    
    echo '<tr><td><table align="center" cellpading="1" cellspacing="1" width="98%" style="border: 1px solid black; background-color: #d5deec;"><tr><td align="center"><img src="gfx/mapab.jpg"></img></td></tr></table></td></tr>
    </table>';
    
    require('stopka.php');    
?>
</body>
</html>