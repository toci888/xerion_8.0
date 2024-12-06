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
        
        if (isset($_POST['zatwierdz_rodz_oferta']))
        {
            echo '<script>window.open(\'popup/szablon_umowa.php?'.NieruchomoscDAL::$id_nier_rodzaj.'='.$_POST['nier_rodzaj_id'].'&'.
            NieruchomoscDAL::$id_trans_rodzaj.'='.$_POST['trans_rodzaj_id'].'\', \'gablota_laczone\',\'toolbar=no, scrollbars=yes, width=730,height=700\');</script>';
        }
        
        $obiektTrans = new TransNierDAL();
        $tabNier = $obiektTrans->PodajListeNieruchomosci($ilosc_wierszy);
        $tabTrans = $obiektTrans->PodajListeTransakcji(array(TransNierDAL::$of_zap => tags::$oferta), $ilosc_wierszy);
                
        echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'">';
        echo '<table><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$rodzaj_nieruchomosci);
        echo ' : </td><td>'; 
        KontrolkiHtml::DodajSelectDomWartId('nieruchomosci', 'id_nieruchomosci', $tabNier, 'nier_rodzaj_id', null, '', '', TransNierDAL::$id, TransNierDAL::$nazwa_nieruchomosc);
        echo '</td><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$rodzaj_transakcja);
        echo ' : </td><td>';
        KontrolkiHtml::DodajSelectDomWartId('transakcje', 'id_transakcje', $tabTrans, 'trans_rodzaj_id', null, '', ''); //, TransNierDAL::$id_nieruchomosc, TransNierDAL::$nazwa_nieruchomosc);
        echo '</td><td>';
        KontrolkiHtml::DodajSubmit('zatwierdz_rodz_oferta','id_zatwierdz', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zatwierdz).'.','');
        echo '</td></tr></table></form>';
            
    }
    require('../stopka.php');
?>
</body>
</html>
