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
    include_once ('bll/tags.php'); 
    include_once ('bll/jezykibll.php');
    include_once ('bll/cache.php');
    include_once ('dal/dal.php');
    require('naglowek.php');
    require('conf.php');
    
    $dal = new StronaPodsInfoDAL();
    $wynik = $dal->PodajDaneAgenci($ilosc_wierszy);
    
    if ($ilosc_wierszy > 0)
    {
        echo UtilsUI::AgenciLista($wynik, $_SESSION[$jezyk]);
    }
        
    require('stopka.php');    
?>
</body>
</html>
