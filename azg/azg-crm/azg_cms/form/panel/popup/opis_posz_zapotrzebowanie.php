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
        
        $zap_tr_id = null;
        
        if (isset($_GET[WyposazenieZapDAL::$id_zapotrzebowanie_trans_rodzaj]))
        {
            $zap_tr_id = $_GET[WyposazenieZapDAL::$id_zapotrzebowanie_trans_rodzaj];
        }
        if (isset($_POST[WyposazenieZapDAL::$id_zapotrzebowanie_trans_rodzaj]))
        {
            $zap_tr_id = $_POST[WyposazenieZapDAL::$id_zapotrzebowanie_trans_rodzaj];
        }
        if (isset($_GET[NieruchomoscDAL::$id_zapotrzebowanie]))
        {
            $zapotrzebowanie_id = $_GET[NieruchomoscDAL::$id_zapotrzebowanie];
        }
        if (isset($_POST[NieruchomoscDAL::$id_zapotrzebowanie]))
        {
            $zapotrzebowanie_id = $_POST[NieruchomoscDAL::$id_zapotrzebowanie];
        }
        
        if ($zap_tr_id != null)
        {
            $dal = new WyposazenieZapDAL($zap_tr_id);
            
            if(isset($_POST['dodaj']))
            {
                $tabParametr[WyposazenieZapDAL::$id_zapotrzebowanie_trans_rodzaj] = $zap_tr_id;
                $tabParametr[NieruchomoscDAL::$id_agent] = $agent_zal->id;
                $tabParametr[WyposazenieZapDAL::$tresc] = $_POST['tresc_not'];
                
                $wynik = $dal->DodajOpisPoszZapotrzebowanie($tabParametr);
                if ($wynik == null)
                {
                    UtilsUI::InfoBlad($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_nie_powiodla_sie));
                }
            }
            if(isset($_POST['kasowanie']))
            {
                $tabParametr[WyposazenieZapDAL::$id_opis] = $_POST['opis_id'];
                $wynik = $dal->UsunOpisPoszZapotrzebowanie($tabParametr);
                if (!$wynik)
                {
                    UtilsUI::InfoBlad($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_nie_powiodla_sie));
                }    
            }
            UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$numer_zapotrzebowania).' :'.$zapotrzebowanie_id);
            echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'"><table>';
            KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_zapotrzebowanie, NieruchomoscDAL::$id_zapotrzebowanie, $zapotrzebowanie_id);
            KontrolkiHtml::DodajHidden(WyposazenieZapDAL::$id_zapotrzebowanie_trans_rodzaj, WyposazenieZapDAL::$id_zapotrzebowanie_trans_rodzaj, $zap_tr_id);
            echo '<tr><td><b>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$szczegolowy_opis).' : </b></td></tr><tr><td>'; 
            KontrolkiHtml::DodajTextArea('tresc_not','id_tresc_not','',50,5,'');
            echo '</td></tr><tr><td>';
            KontrolkiHtml::DodajSubmit('dodaj', 'id_dodaj', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$dodaj), '');
            echo '</tr></td></table></form>';
            
            $wynik = $dal->PodajOpisPoszZapotrzebowanie(array(WyposazenieZapDAL::$id_zapotrzebowanie_trans_rodzaj => $zap_tr_id), $ilosc_wierszy);
            if($ilosc_wierszy > 0)
            {
                UtilsUI::$rekordy = $ilosc_wierszy;
                echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'">';
                KontrolkiHtml::DodajHidden(WyposazenieZapDAL::$id_zapotrzebowanie_trans_rodzaj, WyposazenieZapDAL::$id_zapotrzebowanie_trans_rodzaj, $zap_tr_id);
                UtilsUI::WyswietlTab1Poz($wynik, array(WyposazenieZapDAL::$wartosc, NieruchomoscDAL::$data, NieruchomoscDAL::$agent),
                array(tags::$notatka, tags::$data, tags::$agent), WyposazenieZapDAL::$id_opis_posz_zapotrzebowanie, 'opis_id', array(Akcja::$kasowanie => 1));
                echo '</form>';
            }
        }    
        echo '<hr />';
        KontrolkiHtml::DodajSubmit('ok', 'id_ok', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zakoncz), 'onclick="window.close();"');
    }
    require('../../stopka.php');

?>
</body>
</html>
