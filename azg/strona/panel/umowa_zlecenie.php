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
    include_once ('../bll/transnierbll.php');
    require('../naglowek.php');
    require('../conf.php');
    
    if (!isset($_SESSION[$zalogowany]))
    {
        echo 'Nie jesteÅ› zalogowany.';
    }
    else
    {
        $tlumaczenia = cachejezyki::Czytaj();
        $agent_zal = unserialize($_SESSION[$dane_agent]);
        
        if (isset($_POST['zatwierdz_zlecenie']))
        {
            echo '<script>window.open(\'popup/druk_umowa_szablon.php?'.NieruchomoscDAL::$id_osobowosc.'='.$_POST['osobowosc_id'].'\', \'gablota_laczone\',\'toolbar=no, scrollbars=yes, width=730,height=700\');</script>';
        }
        
        echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'">';
        echo '<table><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$osobowosc);
        echo ' : </td><td>'; 
        KontrolkiHtml::DodajSelectZrodSlownik('osobowosc', 'id_but_osobowosc', SlownikDAL::$osobowosc, 'osobowosc_id', null, '', 'onchange="FormularzOsPrOsFiz(this.options[this.selectedIndex].id, '.$osoba_prawna.');"');
        echo '</td><td>';
        KontrolkiHtml::DodajSubmit('zatwierdz_zlecenie','id_zatwierdz_zlecenie', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zatwierdz).'.','');
        echo '</td></tr></table></form>';
            
    }
    require('../stopka.php');
?>
</body>
</html>
