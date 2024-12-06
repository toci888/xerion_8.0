<HTML>
<HEAD>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <script language="javascript" src="js/script.js"></script>
<link href="azg.css" rel="stylesheet" type="text/css">
</head>
<body>
<?php
    // œ - ¶ ¹ - ±  Ÿ - ¼  - ¬ Œ - ¦
    include_once ('ui/kontrolki_html.php'); 
    include_once ('bll/tags.php'); 
    include_once ('bll/jezykibll.php');
    include_once ('bll/cache.php');
    include_once ('dal/dal.php');
    require('naglowek.php');
    require('conf.php');
    
    $obiekt = new StronaOfertaBLL();
    $oferta = $obiekt->PodajOferta($_GET[tags::$oferta], $_GET[StronaPodsInfoDAL::$id_trans_rodzaj], $_GET[StronaPodsInfoDAL::$id_nier_rodzaj], $_SESSION[$jezyk], $sekcje, $pomieszczenia);
    $oferta = $oferta[0];
    $dal = new StronaOfertaDAL();
    $agent_dane = $dal->AgentWersjaOficjalna($oferta[NieruchomoscDAL::$id_agent], $_SESSION[$jezyk]);
    $agent_dane = $agent_dane[0][NieruchomoscDAL::$nazwa];

    $oferta_html = UtilsUI::OfertaWersjaPelna($oferta, $_SESSION[$jezyk], $agent_dane, $sekcje, $pomieszczenia);
    echo $oferta_html;
    
    require('stopka.php');    
?>
</body>
</html>