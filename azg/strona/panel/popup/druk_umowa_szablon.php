<HTML>
<HEAD>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <script language="javascript" src="../../js/script.js"></script>
<!--<link href="../../css/style.css" rel="stylesheet" type="text/css"> -->
</head>
<body onload="window.print();">
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
    include_once ('../../bll/transnierbll.php');
    include_once ('../../bll/klientbll.php');
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
        
        if (isset($_GET[NieruchomoscDAL::$id_osobowosc]))
        {
            //$_SESSION[NieruchomoscDAL::$id_zapotrzebowanie] = $_GET[NieruchomoscDAL::$id_zapotrzebowanie];
            $dal = new KlientDAL();
            $wynik = $dal->PodajAgentSzablonUm($agent_zal->id);
            
            UtilsUI::GenerujUmowaKlientSzablon($_GET[NieruchomoscDAL::$id_osobowosc], $wynik);
        }
               
    }
    require('../../stopka.php');
?>
</body>
</html>
