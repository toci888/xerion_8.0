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
    
    
    $obiekt = new StronaPodsInfoDAL();
    if (isset($_GET[StronaPodsInfoDAL::$id_trans_rodzaj]) && $_GET[StronaPodsInfoDAL::$id_nier_rodzaj])
    {
        $tlumaczenia = cachejezyki::Czytaj();
        
        $tabParametr[StronaPodsInfoDAL::$id_nier_rodzaj] = $_GET[StronaPodsInfoDAL::$id_nier_rodzaj];
        $tabParametr[StronaPodsInfoDAL::$id_trans_rodzaj] = $_GET[StronaPodsInfoDAL::$id_trans_rodzaj];
        $tabParametr[NieruchomoscDAL::$id_jezyk] = $_SESSION[$jezyk];
        
        $wynik = $obiekt->PodajZlecenia($tabParametr, $ilosc_wierszy);
        
        $rodzaj_oferty = $obiekt->RodzajOferta($_GET[StronaPodsInfoDAL::$id_trans_rodzaj], $_GET[StronaPodsInfoDAL::$id_nier_rodzaj], true);
        
        if (count($wynik) > 0)
        {            
            $html = UtilsUI::ZleceniaLista($wynik, $rodzaj_oferty, $_SESSION[$jezyk]);
            echo $html;
        }
    }
    
    require('stopka.php');    
?>
</body>
</html>
