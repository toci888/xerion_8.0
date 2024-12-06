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
        $dal = new KlientDAL();
        
        //$_SESSION[NieruchomoscDAL::$id_klient]
        if (isset($_GET[NieruchomoscDAL::$id_klient]))
        {
            $klient_id = $_GET[NieruchomoscDAL::$id_klient];
        }
        if (isset($_POST[NieruchomoscDAL::$id_klient]))
        {
            $klient_id = $_POST[NieruchomoscDAL::$id_klient];
        }
        
        if(isset($_POST['dodaj']))
        {
            $tabParametr[KlientDAL::$id_klient] = $klient_id;
            $tabParametr[KlientDAL::$id_agent] = $agent_zal->id;
            $tabParametr[KlientDAL::$tresc] = $_POST['tresc_not'];
            
            $wynik = $dal->DodajNotatkaKlient($tabParametr);
            if ($wynik == null)
            {
                UtilsUI::InfoBlad($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_nie_powiodla_sie));
            }
        }
        if(isset($_POST['kasowanie']))
        {
            $tabParametr[KlientDAL::$id_notatka] = $_POST['notatka_id'];
            $wynik = $dal->UsunNotatka($tabParametr);
            if ($wynik == null)
            {
                UtilsUI::InfoBlad($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_nie_powiodla_sie));
            }    
        }
        
        echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'"><table>';
        KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_klient, NieruchomoscDAL::$id_klient, $klient_id);
        echo '<tr><td><b>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$notatka).' : </b></td></tr><tr><td>'; 
        KontrolkiHtml::DodajTextArea('tresc_not','id_tresc_not','','40','5','');
        echo '</td></tr><tr><td>';
        KontrolkiHtml::DodajSubmit('dodaj', 'id_dodaj', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$dodaj), '');
        echo '</tr></td></table></form>';
        
        $wynik = $dal->PodajNotatkaKlient(array(KlientDAL::$id_klient => $klient_id), $ilosc_wierszy);
        if($ilosc_wierszy > 0)
        {
            
            echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'">';
            UtilsUI::WyswietlTab1Poz($wynik, array(KlientDAL::$tresc, KlientDAL::$data, KlientDAL::$agent),
            array(tags::$notatka, tags::$data, tags::$agent), KlientDAL::$id_notatka, 'notatka_id', array(Akcja::$kasowanie => 1));
            echo '</form>';
        }    
        
        echo '<hr />';
        KontrolkiHtml::DodajSubmit('ok', 'id_ok', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zakoncz), 'onclick="window.close();"');
    }
    require('../../stopka.php');

?>
</body>
</html>
