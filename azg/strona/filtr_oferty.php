
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
    if (strlen($_GET[StronaPodsInfoDAL::$pow_min]) > 0 || strlen($_GET[StronaPodsInfoDAL::$pow_max]) > 0 || strlen($_GET[StronaPodsInfoDAL::$cena_max]) > 0 || strlen($_GET[StronaPodsInfoDAL::$l_pok_min]) > 0 || strlen($_GET[StronaPodsInfoDAL::$l_pok_max]) > 0 || $_GET[StronaPodsInfoDAL::$id_region_geog] != 1)
    {
        $tlumaczenia = cachejezyki::Czytaj();

        $filtrowanie[StronaPodsInfoDAL::$id_trans_rodzaj] = $_GET[StronaPodsInfoDAL::$id_trans_rodzaj];
        $filtrowanie[StronaPodsInfoDAL::$id_nier_rodzaj] = $_GET[StronaPodsInfoDAL::$id_nier_rodzaj];
        $filtrowanie[StronaPodsInfoDAL::$pow_min] = $_GET[StronaPodsInfoDAL::$pow_min];
        $filtrowanie[StronaPodsInfoDAL::$l_pok_min] = $_GET[StronaPodsInfoDAL::$l_pok_min];
        $filtrowanie[StronaPodsInfoDAL::$pow_max] = $_GET[StronaPodsInfoDAL::$pow_max];
        $filtrowanie[StronaPodsInfoDAL::$l_pok_max] = $_GET[StronaPodsInfoDAL::$l_pok_max];
        $filtrowanie[StronaPodsInfoDAL::$cena_max] = $_GET[StronaPodsInfoDAL::$cena_max];
        $filtrowanie[StronaPodsInfoDAL::$id_region_geog] = $_GET[StronaPodsInfoDAL::$id_region_geog];
        if (isset($_GET[WyposazenieNierDAL::$id_parent]))
            $filtrowanie[WyposazenieNierDAL::$id_parent] = $_GET[WyposazenieNierDAL::$id_parent];
        
        $_SESSION['filtr_ofert'] = serialize($filtrowanie);
        
        $filtrowanie[NieruchomoscDAL::$id_jezyk] = $_SESSION[$jezyk];
        $filtrowanie[NieruchomoscDAL::$adres] = $_SERVER['REMOTE_ADDR'];
        
        //$tabParametr[StronaPodsInfoDAL::$id_nier_rodzaj] = $_GET[StronaPodsInfoDAL::$id_nier_rodzaj];
        //$tabParametr[StronaPodsInfoDAL::$id_trans_rodzaj] = $_GET[StronaPodsInfoDAL::$id_trans_rodzaj];

        $obs_ofert = new StronaPodsInfoBLL($filtrowanie); //obsluga ofert, obiekt za to odpowiada :)
        
        $wynik = $obs_ofert->PodajOferty($_GET[StronaPodsInfoDAL::$id_trans_rodzaj], $_GET[StronaPodsInfoDAL::$id_nier_rodzaj], $ilosc_wierszy);
        //echo $ilosc_wierszy;
        
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
