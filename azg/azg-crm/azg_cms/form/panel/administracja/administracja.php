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
        
        if ($uprawnienia->zmiana_upr)
        {
            $tlumaczenia = cachejezyki::Czytaj();
            $agent_zal = unserialize($_SESSION[$dane_agent]);
            
            //test
            //$dal = new AdministracjaDAL();
            echo '<form method="POST" action="mailing.php">';
            KontrolkiHtml::DodajSubmit('mailing', 'mailing', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$adres_email), '');
            echo '</form><form method="POST" action="jezyki.php">';
            KontrolkiHtml::DodajSubmit('jezyki', 'id_jezyki', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$jezyki), '');
            echo '</form><form method="POST" action="slowniki_nieruchomosc.php">';
            KontrolkiHtml::DodajSubmit('slowniki_nieruchomosc', 'id_slowniki_nieruchomosc', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$slowniki), '');
            echo '</form>';
        }
    }
    require('../../stopka.php');
?>
</body>
</html>
