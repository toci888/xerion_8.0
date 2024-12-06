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
    include_once ('../dal/admDAL.php');
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
        
        $status_dzwonienie_id = null;
        $data_f = $data_dzienna;
        
        if (isset($_POST['status_dzwonienie_id']))
        {
            $status_dzwonienie_id = $_POST['status_dzwonienie_id'];
            $data_f = $_POST['data_dzw'];
        }
        
        echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'" name="telefony_przychodzace"><table><tr><td>';
        KontrolkiHtml::DodajSelectZrodSlownik('status_dzwonienie', 'id_status_dzwonienie', SlownikDAL::$status_dzwonienie, 'status_dzwonienie_id', $status_dzwonienie_id, '', '');
        echo '</td><td>';
        KontrolkiHtml::DodajTextboxData('data_dzw', 'id_data_dzw', $data_f, 10, 10, $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podana_inf_nie_jest_data), '', '', 'telefony_przychodzace');
        echo '</td><td>';
        KontrolkiHtml::DodajSubmit('pokaz', 'id_pokaz', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$pokaz), '');
        echo '</td></tr></table></form><hr />';
        
        if (isset($_POST['pokaz']))
        {
            $dal = new CentralkaDAL();
            $wynik = $dal->PokazRozmowy(array(CentralkaDAL::$id_status_dzwonienie => $_POST['status_dzwonienie_id'], CentralkaDAL::$czas_poczatek => $_POST['data_dzw']), $ilosc_wierszy);
            
            if ($ilosc_wierszy > 0)
            {
                UtilsUI::$rekordy = $ilosc_wierszy;
                
                UtilsUI::WyswietlTab1Poz($wynik, array(OsobaDAL::$telefon, CentralkaDAL::$osoba, CentralkaDAL::$status_dzwonienie, NieruchomoscDAL::$agent, CentralkaDAL::$czas_poczatek, CentralkaDAL::$czas_koniec), 
                array(tags::$telefon, tags::$osoba, tags::$status, tags::$agent, tags::$data_od, tags::$data_do), NieruchomoscDAL::$id, 'rozmowa_przychodzaca_id', null);
            }
        }
    }
    require('../stopka.php');
?>
</body>
</html>
