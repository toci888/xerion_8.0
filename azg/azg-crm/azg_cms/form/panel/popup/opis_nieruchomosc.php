<HTML>
<HEAD>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <script language="javascript" src="../../js/script.js"></script>
<link href="../../css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<?php
    // ¶ ±
    session_start();
    include_once ('../../dal/queriesDAL.php');
    include_once ('../../ui/kontrolki_html.php');
    include_once ('../../ui/utilsui.php'); 
    include_once ('../../bll/parametrynierbll.php');
    include_once ('../../bll/tags.php'); 
    include_once ('../../bll/agentbll.php');
    include_once ('../../bll/jezykibll.php');
    include_once ('../../bll/cache.php');
    require('../../naglowek.php');
    require('../../conf.php');
    
    if (!isset($_SESSION[$zalogowany]))
    {
        echo 'Nie jesteÅ› zalogowany.';
    }
    else
    {
        $tlumaczenia = cachejezyki::Czytaj();
        $agent_zal = unserialize($_SESSION[$dane_agent]); 
        $dal = new NieruchomoscDAL();
        
        if (isset($_GET[NieruchomoscDAL::$id_nieruchomosc]))
        {
            $_SESSION[NieruchomoscDAL::$id_nieruchomosc] = $_GET[NieruchomoscDAL::$id_nieruchomosc];
        }
        if (isset($_POST[NieruchomoscDAL::$id_nieruchomosc]))
        {
            $_SESSION[NieruchomoscDAL::$id_nieruchomosc] = $_POST[NieruchomoscDAL::$id_nieruchomosc];
        }
        
        if(isset($_POST['dodaj']))
        {
            $tabParametr[NieruchomoscDAL::$id_nieruchomosc] = $_POST[NieruchomoscDAL::$id_nieruchomosc];
            $tabParametr[NieruchomoscDAL::$id_agent] = $agent_zal->id;
            $tabParametr[NieruchomoscDAL::$notatka] = $_POST['tresc_not'];
            
            $wynik = $dal->DodajOpisNieruchomosc($tabParametr);
            if ($wynik == null)
            {
                UtilsUI::InfoBlad($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_nie_powiodla_sie));
            }
        }
        if(isset($_POST['kasowanie']))
        {
            $tabParametr[NieruchomoscDAL::$id_notatka] = $_POST['opis_id'];
            $wynik = $dal->UsunNotatkaNieruchomosc($tabParametr);
            if (!$wynik)
            {
                UtilsUI::InfoBlad($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_nie_powiodla_sie));
            }    
        }
        
        echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'"><table>';
        KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_nieruchomosc, NieruchomoscDAL::$id_nieruchomosc, $_SESSION[NieruchomoscDAL::$id_nieruchomosc]);
        echo '<tr><td><b>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$notatka_wewnetrzna_do_nieruchomosci).' : </b></td></tr><tr><td>'; 
        KontrolkiHtml::DodajTextArea('tresc_not','id_tresc_not','','40','5','');
        echo '</td></tr><tr><td>';
        KontrolkiHtml::DodajSubmit('dodaj', 'id_dodaj', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$dodaj), '');
        echo '</tr></td></table></form>';
        
        $wynik = $dal->PodajNotatkaNieruchomosc(array(NieruchomoscDAL::$id_nieruchomosc => $_SESSION[NieruchomoscDAL::$id_nieruchomosc]), $ilosc_wierszy);
        if($ilosc_wierszy > 0)
        {
            UtilsUI::$rekordy = $ilosc_wierszy;
            echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'"><table>';
            UtilsUI::WyswietlTab1Poz($wynik, array(NieruchomoscDAL::$id_opis_nieruchomosc, NieruchomoscDAL::$notatka, NieruchomoscDAL::$data, NieruchomoscDAL::$agent),
            array(tags::$id, tags::$notatka, tags::$data, tags::$agent), NieruchomoscDAL::$id_opis_nieruchomosc, 'opis_id', array(Akcja::$kasowanie => 1));
            echo '</form>';
        }
        echo '<hr />';
        KontrolkiHtml::DodajSubmit('ok', 'id_ok', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zakoncz), 'onclick="window.close();"');    
    }
    require('../../stopka.php');

?>
</body>
</html>
