<HTML>
<HEAD>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <script language="javascript" src="js/script.js"></script>
<link href="azg.css" rel="stylesheet" type="text/css">
</head>
<body>
<?php
    include_once ('ui/kontrolki_html.php'); 
    include_once ('bll/tags.php'); 
    include_once ('bll/jezykibll.php');
    include_once ('bll/cache.php');
    include_once ('dal/dal.php');
    require('naglowek.php');
    require('conf.php');


    if (isset($_GET[NieruchomoscDAL::$id_nieruchomosc]) && isset($_GET[StronaOfertaDAL::$zdjecie]))
    //echo '<table><tr><td style="background-image: url(media/'.$_GET[NieruchomoscDAL::$id_nieruchomosc].'/zdjecia/'.$_GET[StronaOfertaDAL::$zdjecie].');">&nbsp;</td></tr></table>';
	echo '<img class="ira" border="1" width="309" src="media/'.$_GET[NieruchomoscDAL::$id_nieruchomosc].'/zdjecia/'.$_GET[StronaOfertaDAL::$zdjecie].'"></img>';
    
    require('stopka.php');
?>
</body>
</html>