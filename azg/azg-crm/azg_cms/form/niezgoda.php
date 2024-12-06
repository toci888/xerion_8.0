<HTML>
<HEAD>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <script language="javascript" src="js/script.js"></script>
<link href="azg.css" rel="stylesheet" type="text/css">
</head>
<body>
<?php
    // ¶ ±
    //session_start();
    
    include_once ('dal/stronaDAL.php');
    include_once ('dal/admDAL.php');
    include_once ('ui/kontrolki_html.php'); 
    include_once ('ui/utilsui.php'); 
    include_once ('bll/tags.php'); 
    include_once ('bll/jezykibll.php');
    include_once ('bll/cache.php');
    include_once ('bll/ofertystronabll.php');
    require('naglowek.php');
    require('conf.php');

    if ($_GET['action'] == 'usunbiurolista' && isset($_GET['id']))
    {
        $tlumaczenia = cachejezyki::Czytaj();   
        $dal = new RegionyDAL();
        $wynik = $dal->NieZgodaMail($_GET['id']);

        //if ($wynik)
        //{
            //echo 'pomyslnie';
            echo '<center><b>'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_powiodla_sie), $_SESSION[$jezyk]).'</b></center>';
        //}
        //else
        //{
            //chyba chce zapisac ze bylo takie cos, ze sie zdarzylo (???)
            //echo 'zapis';
        //}
    }
    
    require('stopka.php');

?>
</body>
</html>
