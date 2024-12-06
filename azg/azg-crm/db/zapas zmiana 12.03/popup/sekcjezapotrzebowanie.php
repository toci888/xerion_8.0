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
    include_once ('../bll/jezykibll.php');
    include_once ('../bll/cache.php');
    include_once ('../bll/agentbll.php');
    include_once ('../bll/parametrynierbll.php');
    include_once ('../dal/queriesDAL.php');
    include_once ('../ui/kontrolki_html.php');
    include_once ('../ui/utilsui.php');
    include_once ('../bll/cache.php');
    include_once ('../bll/agentbll.php');
    require('../naglowek.php');
    require('../conf.php');
    
    if (!isset($_SESSION[$zalogowany]))
    {
        echo 'Nie jesteÅ› zalogowany.';
    }
    else
    {
        //przy 1 otwarciu
        if (isset($_GET['sekcja']))
        {
            $_SESSION[$sekcja] = $_GET['sekcja'];
        }
        $tlumaczenia = cachejezyki::Czytaj();
        $paramNier = unserialize($_SESSION[$param_zap.$_SESSION[$zapotrzebowanie_trans_rodzaj_id]]);
        $kolWyp = $paramNier->KolekcjaWyposazen();
        $kolWyp = $kolWyp[$_SESSION[$sekcja]];
        
        if (isset($_POST['wyposazenie_dod_id']))
        {
            if (strlen($_POST['wyposazenie_dod_id']) > 0)
            {
                $kolWyp->DodajWyposazenieZapotrzebowanie($_POST['wyposazenie_dod_id']);
                $paramNier->ZamienElKolWyp($kolWyp, $_SESSION[$sekcja]);
                $_SESSION[$param_zap.$_SESSION[$zapotrzebowanie_trans_rodzaj_id]] = serialize($paramNier);
            }
        }
        if (isset($_POST['wyposazenie_odej_id']))
        {
            if (strlen($_POST['wyposazenie_odej_id']) > 0)
            {
                $kolWyp->UsunWyposazenieZapotrzebowanie($_POST['wyposazenie_odej_id']);
                $paramNier->ZamienElKolWyp($kolWyp, $_SESSION[$sekcja]);
                $_SESSION[$param_zap.$_SESSION[$zapotrzebowanie_trans_rodzaj_id]] = serialize($paramNier);
            }
        }
        
        echo '<form method="POST" name="wyposazenie_form" id="wyposazenie_form" action="'.$_SERVER['PHP_SELF'].'"><table><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$dostepne).'</td><td></td><td>'.
        $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wybrane).'</td></tr><tr><td>';
        KontrolkiHtml::DodajSelectWyposazenie($kolWyp->tag, $kolWyp->id_sekcja, $kolWyp->PodajDostepneWyposazenie(), 'wyposazenie_dod_id', 'wyposazenie_form', '');
        echo '</td><td>';
        KontrolkiHtml::DodajSubmit('dodaj', 'id_dodaj', '>>', '');
        echo '<br /><br />';
        KontrolkiHtml::DodajSubmit('ujmij', 'id_ujmij', '<<', '');
        echo '</td><td>';
        KontrolkiHtml::DodajSelectWyposazenie($kolWyp->tag.'wyb', $kolWyp->id_sekcja.'wyb', $kolWyp->PodajWybraneWyposazenie(), 'wyposazenie_odej_id', 'wyposazenie_form', '');
        echo '</td></tr><tr><td></td><td>';
        KontrolkiHtml::DodajSubmit('ok', 'id_ok', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zatwierdz), 'onclick="window.close(); return false;"');
        echo '</td><td></td></tr></table></form>';
        
    }
    require('../stopka.php');

?>
</body>
</html>
