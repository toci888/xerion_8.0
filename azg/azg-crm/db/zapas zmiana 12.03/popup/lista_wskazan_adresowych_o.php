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
        
        if (isset($_GET[NieruchomoscDAL::$id_oferta]))
        {
            $_SESSION[NieruchomoscDAL::$id_oferta] = $_GET[NieruchomoscDAL::$id_oferta];
        }
        if (isset($_POST[NieruchomoscDAL::$id_oferta]))
        {
            $_SESSION[NieruchomoscDAL::$id_oferta] = $_POST[NieruchomoscDAL::$id_oferta];
        }
        
        
        echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'"><table>';

        KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_oferta, NieruchomoscDAL::$id_oferta, $_SESSION[NieruchomoscDAL::$id_oferta]); 
        echo '</tr></td></table></form>';
        $wynik = $dal->PodajListaWskOferta(array(ListaWskazanDAL::$id_oferta => $_SESSION[NieruchomoscDAL::$id_oferta]), $ilosc_wierszy); 
        if($ilosc_wierszy > 0)
        { 
            echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'"><table>';
            UtilsUI::WyswietlTab1Poz($wynik, array(ListaWskazanDAL::$id_zapotrzebowanie,ListaWskazanDAL::$id_klient, ListaWskazanDAL::$osoba, ListaWskazanDAL::$pesel, ListaWskazanDAL::$nr_dowod, ListaWskazanDAL::$telefon),
            array(tags::$id, tags::$id, tags::$osoba, tags::$pesel, tags::$nr_dowod, tags::$telefon), ListaWskazanDAL::$id_oferta, 'oferta_id', null);
            //array(Akcja::$kasowanie => 1)
            echo '</form>';
        }   
    }
    require('../stopka.php');

?>
</body>
</html>
