<HTML>
<HEAD>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <script language="javascript" src="js/script.js"></script>
<link href="css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<?php
    // ¶ ±
    session_start();
    include_once ('dal/queriesDAL.php');
    include_once ('ui/kontrolki_html.php');
    include_once ('ui/utilsui.php');
    include_once ('bll/parametrynierbll.php'); 
    include_once ('bll/tags.php'); 
    include_once ('bll/agentbll.php');
    include_once ('bll/jezykibll.php');
    include_once ('bll/cache.php');
    include_once ('bll/transnierbll.php');
    require('naglowek.php');
    require('conf.php');
    
    if (!isset($_SESSION[$zalogowany]))
    {
        echo 'Nie jesteÅ› zalogowany.';
    }
    else
    {
        $tlumaczenia = cachejezyki::Czytaj();
        if (isset($_POST['koniec']))
        {
            echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_powiodla_sie).'.';
            if (isset($_SESSION[$zapotrzebowanie_trans_rodzaj_id]))
            unset($_SESSION[$param_zap.$_SESSION[$zapotrzebowanie_trans_rodzaj_id]]);
            
            unset($_SESSION[$zapotrzebowanie_trans_rodzaj_id]);
            unset($_SESSION[$wynik_ed_zap]);
            unset($_SESSION[$param_zap]);
            unset($_SESSION[NieruchomoscDAL::$id_nieruchomosc]);
            unset($_SESSION[NieruchomoscDAL::$id_zapotrzebowanie]);
            unset($_SESSION[$wyb_param_nowa_oferta]);
            unset($_SESSION[NieruchomoscDAL::$id_nieruchomosc]);
            unset($_SESSION[NieruchomoscDAL::$id_oferta]);
        }
        if (isset($_POST['zatw_trans_zap']) && isset($_POST['zapotrzebowanie_id']))
        {
            $_SESSION[NieruchomoscDAL::$id_zapotrzebowanie] = $_POST['zapotrzebowanie_id'];
            $nieruchomoscDal = new NieruchomoscDAL();
            echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$numer_zapotrzebowania).' :'.$_SESSION[NieruchomoscDAL::$id_zapotrzebowanie].'.<br/>';
            $wynik = $nieruchomoscDal->PodajTransNierZapotrzebowanie(array(NieruchomoscDAL::$id_zapotrzebowanie => $_SESSION[NieruchomoscDAL::$id_zapotrzebowanie]), $iloscWierszy);
            
            if ($iloscWierszy > 0)            
            {
                echo '<table>';
                foreach($wynik as $wiersz)
                {
                    echo '<tr><td>'; //NieruchomoscDAL::$nieruchomosc_rodzaj, NieruchomoscDAL::$transakcja_rodzaj
                    KontrolkiHtml::DodajPopUpButton($tlumaczenia->Tlumacz($_SESSION[$jezyk], $wiersz[NieruchomoscDAL::$nieruchomosc_rodzaj]).' : '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], $wiersz[NieruchomoscDAL::$transakcja_rodzaj]), 
                    'popup', 'popup/dodanie_zap_szcz.php?'.NieruchomoscDAL::$id_zapotrzebowanie.'='.$_SESSION[NieruchomoscDAL::$id_zapotrzebowanie].'&'.
                    NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj.'='.$wiersz[NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj], 800, 800);
                    echo '</td><td>';
                    KontrolkiHtml::DodajPopUpButton($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$pokaz_skojarzenia), 'pokaz_skojarzenia', 
                    'popup/skoj_of_standard.php?'.NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj.'='.$wiersz[NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj], 900, 750);
                    echo '</td></tr>';
                }
                echo '<tr><td><form method="POST" action="'.$_SERVER['PHP_SELF'].'">';
                KontrolkiHtml::DodajSubmit('koniec', 'id_koniec', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zatwierdz), '');
                echo '</form></td></tr></table>';
            }
        }
    }
    require('stopka.php');

?>
</body>
</html>
