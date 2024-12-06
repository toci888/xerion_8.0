<body>
<HEAD>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <script language="javascript" src="../../js/script.js"></script>
</head>
<body style="margin-left: 0px; margin-right: 0px; margin-top: 0px; margin-bottom: 0px;" onload="window.print();">
<?php
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
    include_once ('../../bll/gablotabll.php');
    require('../../naglowek.php');
    require('../../conf.php');
    if (!isset($_SESSION[$zalogowany]))
    {
        echo 'Nie jesteś zalogowany.';
    }
    else
    {
        $dane_gablota = cacheGablota::Czytaj();
        
        if ($dane_gablota != null) ///if na null i tak daje false
        {
            $tlumaczenia = cachejezyki::Czytaj();
            $agent_zal = unserialize($_SESSION[$dane_agent]);
        
            if (is_array($dane_gablota))
            {
                foreach ($dane_gablota as $element)
                {
                    //var_dump($element);
                    echo $element->nazwa.' -- '.$element->oferta_out.'  ===>  '.$element->oferta_in.', '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wspolrzedne).': '.$element->wsp_x.' x '.$element->wsp_y.'.&nbsp;';
                    echo '<br />';
                }
            }
        }
    }
?>
</body>