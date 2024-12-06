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
    
    
    $obiekt = new StronaOfertaBLL();
    if (isset($_GET[StronaPodsInfoDAL::$id_trans_rodzaj]) && $_GET[StronaPodsInfoDAL::$id_nier_rodzaj])
    {
        $tlumaczenia = cachejezyki::Czytaj();
        $obs_ofert = new StronaPodsInfoBLL(); //obsluga ofert, obiekt za to odpowiada :)
        $tabParametr[StronaPodsInfoDAL::$id_nier_rodzaj] = $_GET[StronaPodsInfoDAL::$id_nier_rodzaj];
        $tabParametr[StronaPodsInfoDAL::$id_trans_rodzaj] = $_GET[StronaPodsInfoDAL::$id_trans_rodzaj];
        
        $wynik = $obs_ofert->PodajOferty($_GET[StronaPodsInfoDAL::$id_trans_rodzaj], $_GET[StronaPodsInfoDAL::$id_nier_rodzaj], $ilosc_wierszy);
        
        $rodzaj_oferty = $obs_ofert->RodzajOferta($_GET[StronaPodsInfoDAL::$id_trans_rodzaj], $_GET[StronaPodsInfoDAL::$id_nier_rodzaj]);
        
        if (count($wynik) > 0)
        {
            $regiony = $obs_ofert->PodajRegiony();

            $rodz_bud = $obs_ofert->PodajRodzajeBudynek();
            $rodz_bud_exist = true;
            
            if ($_GET[StronaPodsInfoDAL::$id_nier_rodzaj] == 2) //jesli to mieszkanie
            {
                //konieczna jakas extra flaga dla informacji: jesli istnieja rodzaje budynkow wywalamy rodzaj nier - rodzaj bud; jesli nie 
                //index tablicy ponizej - wartosc
                $rodz_bud = array(1 => tags::$pokojowe, 2 => tags::$pokojowe, 3 => tags::$pokojowe, 4 => tags::$pokojowe, 5 => tags::$pokojowe);
                $rodz_bud_exist = false;
            }
            
            $html = UtilsUI::OfertyLista($wynik, $regiony, $rodz_bud, $rodz_bud_exist, $rodzaj_oferty, $_SESSION[$jezyk]);
            echo $html;
        }
    }
    
    require('stopka.php');    
?>
</body>
</html>
