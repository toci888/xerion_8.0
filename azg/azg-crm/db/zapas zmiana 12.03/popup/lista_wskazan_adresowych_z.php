<HTML>
<HEAD>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <script language="javascript" src="../js/script.js"></script>
<link href="../css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<?php
    // ¶ ±
    session_start();
    include_once ('../dal/queriesDAL.php');
    include_once ('../ui/kontrolki_html.php');
    include_once ('../ui/utilsui.php'); 
    include_once ('../bll/parametrynierbll.php');
    include_once ('../bll/tags.php'); 
    include_once ('../bll/agentbll.php');
    include_once ('../bll/jezykibll.php');
    include_once ('../bll/cache.php');
    require('../naglowek.php');
    require('../conf.php');
    
    if (!isset($_SESSION[$zalogowany]))
    {
        echo 'Nie jesteÅ› zalogowany.';
    }
    else
    {
        $tlumaczenia = cachejezyki::Czytaj();
        //$agent_zal = unserialize($_SESSION[$dane_agent]); 
        $dal = new ListaWskazanDAL();
        
        if (isset($_GET[NieruchomoscDAL::$id_zapotrzebowanie]))
        {
            $_SESSION[NieruchomoscDAL::$id_zapotrzebowanie] = $_GET[NieruchomoscDAL::$id_zapotrzebowanie];
        }
        if (isset($_POST[NieruchomoscDAL::$id_zapotrzebowanie]))
        {
            $_SESSION[NieruchomoscDAL::$id_zapotrzebowanie] = $_POST[NieruchomoscDAL::$id_zapotrzebowanie];
        }
        
        
        echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'"><table>';

        KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_zapotrzebowanie, NieruchomoscDAL::$id_zapotrzebowanie, $_SESSION[NieruchomoscDAL::$id_zapotrzebowanie]); 
        echo '</tr></td></table></form>';
        $wynik = $dal->PodajListaWskZapotrzebowanie(array(ListaWskazanDAL::$id_zapotrzebowanie => $_SESSION[NieruchomoscDAL::$id_zapotrzebowanie]), $ilosc_wierszy); 
        if($ilosc_wierszy > 0)
        { 
            echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'"><table>';
            UtilsUI::WyswietlTab1Poz($wynik, array(ListaWskazanDAL::$id_oferta, ListaWskazanDAL::$cena, ListaWskazanDAL::$ulica, ListaWskazanDAL::$ogladanie_data, ListaWskazanDAL::$godzina, ListaWskazanDAL::$minuta),
            array(tags::$id, tags::$cena, tags::$ulica, tags::$data, tags::$godzina, tags::$minuta), ListaWskazanDAL::$id_oferta, 'oferta_id', null);
            //array(Akcja::$kasowanie => 1)
            echo '</form>';
        }
           
    }
    require('../stopka.php');

?>
</body>
</html>
