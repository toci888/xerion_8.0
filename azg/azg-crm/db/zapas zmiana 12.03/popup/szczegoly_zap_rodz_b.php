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
        $obiekt = null;
        if(isset($_POST['rodz_bud_id']))
        {
            if(strlen($_POST['rodz_bud_id']) > 0)
            {
                $obiekt = new WyposazenieZapDAL($_SESSION[NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj]);
                $wynik = $obiekt->DodajZapotrzebowanieRodzajBudynku('true', $_POST['rodz_bud_id']);
                if ($wynik)
                {
                    echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_powiodla_sie);
                }   
                else
                {
                    echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_nie_powiodla_sie);
                }
            }
        }
        if(isset($_POST['rodz_bud_wyb_id']))
        {
            if(strlen($_POST['rodz_bud_wyb_id']) > 0)
            {
                $obiekt = new WyposazenieZapDAL($_SESSION[NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj]);
                $wynik = $obiekt->DodajZapotrzebowanieRodzajBudynku('false', $_POST['rodz_bud_wyb_id']);
                if ($wynik)
                {
                    echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_powiodla_sie);
                }   
                else
                {
                    echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_nie_powiodla_sie);
                }
            }
        }
        if (isset($_SESSION[NieruchomoscDAL::$id_zapotrzebowanie]) && (isset($_GET[NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj]) || isset($_SESSION[NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj])))
        {
            if(isset($_GET[NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj]))
            {
                $_SESSION[NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj] = $_GET[NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj];
            }
            if($obiekt == null)
            {
                $obiekt = new WyposazenieZapDAL($_SESSION[NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj]);
            }
            $wynik = $obiekt->PodajDostepneRodzajeBudynku();
            
            echo '<form name="rodzaj_budynku" method="POST" action="'.$_SERVER['PHP_SELF'].'"><table align="center"><tr><td>';
            KontrolkiHtml::DodajSelectMulti('rodz_bud', 'id_rodz_bud', $wynik, 'rodz_bud_id', 'rodzaj_budynku', '');
            echo '</td><td>';
            KontrolkiHtml::DodajSubmit('zatwierdz', 'id_zatwierdz', '>>', '');
            $wynik = $obiekt->PodajDodaneRodzajeBudynku();
            echo '<br /><br />';  
            KontrolkiHtml::DodajSubmit('zatwierdz_usun', 'id_zatwierdz_usun', '<<', ''); 
            echo '</td><td>';
            KontrolkiHtml::DodajSelectMulti('rodz_bud_wyb', 'id_rodz_bud_wyb', $wynik, 'rodz_bud_wyb_id','rodzaj_budynku', ''); 
            echo '</td><td>';
            
            echo '</td></tr></table></form>'; 
        }
        echo '<br/><br/><br/><br/><center>';
        
        KontrolkiHtml::DodajSubmit('oki', 'id_oki', $tlumaczenia->Tlumacz ($_SESSION[$jezyk], tags::$zamknij), 'onclick="window.close();"'); 
        echo '<center>';      
    }
    require('../stopka.php');

?>
</body>
</html>
