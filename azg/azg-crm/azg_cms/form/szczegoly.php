<HTML>
<HEAD>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <script language="javascript" src="js/script.js"></script>
<link href="css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<?php
    // ¶ ±
    session_start();
    include_once ('ui/kontrolki_html.php'); 
    include_once ('bll/tags.php'); 
    include_once ('bll/jezykibll.php');
    include_once ('bll/cache.php');
    require('naglowek.php');
    require('conf.php');
    
    $obiekt = new StronaOfertaBLL();
    
    $oferta = $obiekt->PodajOferta($_POST[StronaPodsInfoDAL::$id_oferta], $_POST[StronaPodsInfoDAL::$id_trans_rodzaj], $_POST[StronaPodsInfoDAL::$id_nier_rodzaj], $sekcje, $pomieszczenia);
    
    var_dump($oferta);
    
    var_dump($sekcje);
    
    var_dump($pomieszczenia);

    require('stopka.php'); 
?>
</body>
</html>
