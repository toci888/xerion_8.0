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
        ///pokazanie zapotrzebowan skojarzonych dla ofert
        if (isset($_POST['zatw_poziomy']))
        {
            $tabParametr[NieruchomoscDAL::$poziom_parametry] = $_POST['poziom_par'];
            $tabParametr[NieruchomoscDAL::$poziom_wyposazenia] = $_POST['poziom_wyp'];
        }
         
        if (isset($_SESSION[NieruchomoscDAL::$id_oferta]) && (isset($_GET[NieruchomoscDAL::$id_oferta]) || ($_SERVER['REQUEST_METHOD'] == 'POST')))
        {
            if (isset($_GET[NieruchomoscDAL::$id_oferta]))
            {
                $_SESSION[NieruchomoscDAL::$id_oferta] = $_GET[NieruchomoscDAL::$id_oferta];
            }
            if (isset($_POST[NieruchomoscDAL::$id_oferta]))
            {
                $_SESSION[NieruchomoscDAL::$id_oferta] = $_POST[NieruchomoscDAL::$id_oferta];
            }
            echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$numer_oferty).' :'.$_SESSION[NieruchomoscDAL::$id_oferta].'.<br/>';
            
            $par_zazn = null;
            $wyp_zazn = null;
            $dal = new NieruchomoscDAL();
            
            if (isset($_POST['poziom_par']))
            {
                $par_zazn = $_POST['poziom_par'];
            }
            if (isset($_POST['poziom_wyp']))
            {
                $wyp_zazn = $_POST['poziom_wyp'];
            }
            
            echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'"><table><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$poziom_kojarzenia_parametrow).' :</td>';
            KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_oferta, NieruchomoscDAL::$id_oferta, $_SESSION[NieruchomoscDAL::$id_oferta]);
            KontrolkiHtml::DodajRadio('poziom_par', array('par0_id', 'par1_id', 'par2_id', 'par3_id', 'par4_id'), 
            array(tags::$brak, ' 1', ' 2', ' 3', ' 4'), array(0, 1, 2, 3, 4), '', false, $par_zazn, '<td>', '</td>');
            
            echo '</tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$poziom_kojarzenia_wyposazen).' :</td>';
            KontrolkiHtml::DodajRadio('poziom_wyp', array('wyp0_id', 'wyp1_id', 'wyp2_id', 'wyp3_id', 'wyp4_id'), 
            array(tags::$brak, ' 1', ' 2', ' 3', ' 4'), array(0, 1, 2, 3, 4), '', false, $wyp_zazn, '<td>', '</td>');
            
            echo '<td>';
            KontrolkiHtml::DodajSubmit('zatw_poziomy', 'id_zatw_poziomy', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zatwierdz), '');
            echo '</td></tr></table></form><hr />';
            
            $tabParametr[NieruchomoscDAL::$id_oferta] = $_SESSION[NieruchomoscDAL::$id_oferta];
            $wynik = $dal->KojarzenieBazoweDlaOferty($tabParametr);
            
            echo '<form action="../edycja_zapotrzebowania.php" method= "POST" target="_blank">';
            UtilsUI::WyswietlTab1Poz($wynik, 
            array(NieruchomoscDAL::$id_zapotrzebowanie, NieruchomoscDAL::$imie, NieruchomoscDAL::$nazwisko, NieruchomoscDAL::$pesel), 
            array(tags::$id, tags::$imie, tags::$nazwisko, tags::$pesel), 
            NieruchomoscDAL::$id_zapotrzebowanie, 
            'zapotrzebowanie_id',
            array(Akcja::$edycja => 1, Akcja::$kasowanie => 1));
            echo '</form>';
        }
    }
    require('../stopka.php');

?>
</body>
</html>
