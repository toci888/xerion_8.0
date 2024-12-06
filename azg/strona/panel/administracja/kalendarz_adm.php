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
    include_once ('../../dal/admDAL.php');
    include_once ('../../ui/kontrolki_html.php');
    include_once ('../../ui/utilsui.php');
    include_once ('../../bll/parametrynierbll.php'); 
    include_once ('../../bll/tags.php'); 
    include_once ('../../bll/agentbll.php');
    include_once ('../../bll/jezykibll.php');
    include_once ('../../bll/cache.php');
    include_once ('../../bll/transnierbll.php');
    require('../../naglowek.php');
    require('../../conf.php');
    
    if (!isset($_SESSION[$zalogowany]))
    {
        echo 'Nie jesteÅ› zalogowany.';
    }
    else
    {
        $uprawnienia = unserialize($_SESSION[$zalogowany]);
        
        if ($uprawnienia->adm_dane)
        {
            $tlumaczenia = cachejezyki::Czytaj();
            $agent_zal = unserialize($_SESSION[$dane_agent]);
            
            $agent_id = $agent_zal->id;
            $obiektTrans = new TransNierDAL();
            $agenci = $obiektTrans->PodajAgentow($ilosc_wierszy);
            
            $data_od = $data_dzienna;
            $data_do = $data_dzienna;
            
            if (isset($_POST['agent_id']))
            {
                $agent_id = $_POST['agent_id'];
                $data_od = $_POST['data_od'];
                $data_do = $_POST['data_do'];
            }
            
            
            echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'" name="filtracja_kalendarz"><table><tr><td>';
            echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$data_od).' :</td><td>';
            KontrolkiHtml::DodajTextboxData('data_od', 'id_data_od', $data_od, 10, 10, $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podana_inf_nie_jest_data), '', '', 'filtracja_kalendarz', '../');
            echo '</td><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$data_do).' :</td><td>';
            KontrolkiHtml::DodajTextboxData('data_do', 'id_data_do', $data_do, 10, 10, $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podana_inf_nie_jest_data), '', '', 'filtracja_kalendarz', '../');
            echo '</td><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$agent);
            echo ' : </td><td>';
            KontrolkiHtml::DodajSelectDomWartId('agent', 'id_agent', $agenci, 'agent_id', $agent_id, '', ''); 
            echo '</td><td>';
            KontrolkiHtml::DodajSubmit('zatwierdz_kalendarz', 'id_zatwierdz_kalendarz', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$pokaz).'.', '');
            echo '</td></tr></table></form><hr />';
            
            if (isset($_POST['zatwierdz_kalendarz']))
            {
                $dal = new AgenciDAL();
                
                $tabParametr[NieruchomoscDAL::$id_agent] = $_POST['agent_id'];
                $tabParametr[MediaDAL::$data] = $_POST['data_od'];
                $tabParametr[MediaDAL::$data_do] = $_POST['data_do'];
                
                $wynik = $dal->KalendarzAdm($tabParametr, $ilosc_wierszy);
                
                if ($ilosc_wierszy > 0)
                {
                    UtilsUI::$rekordy = $ilosc_wierszy;
                    UtilsUI::WyswietlTab1Poz($wynik, array(NieruchomoscDAL::$data, NieruchomoscDAL::$godzina, KalendarzDAL::$komentarz, NieruchomoscDAL::$agent), 
                    array(tags::$data, tags::$godzina, tags::$komentarz, tags::$agent), KalendarzDAL::$id_kalendarz, 'kalendarz_id', null);
                }
                else
                {
                    
                }
            }
        }
    }
    require('../../stopka.php');
?>
</body>
</html>
