
<HTML>
<HEAD>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <script language="javascript" src="js/script.js"></script>
<link href="azg.css" rel="stylesheet" type="text/css">
</head>
<body>
<?php
    // œ - ¶ ¹ - ±  Ÿ - ¼  - ¬ Œ - ¦
    session_start();
    include_once ('ui/kontrolki_html.php'); 
    include_once ('bll/tags.php'); 
    include_once ('bll/jezykibll.php');
    include_once ('bll/cache.php');
    include_once ('dal/dal.php');
    require('naglowek.php');
    require('conf.php');
    
    echo '<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,0,0" width="660" height="660" id="galeria" align="middle">
    <param name="allowScriptAccess" value="sameDomain" />
    <param name="allowFullScreen" value="true" />
    <param name="movie" value="galeria.swf" /><param name="quality" value="high" /><param name="bgcolor" value="#000000" />    <embed src="galeria.swf" quality="high" bgcolor="#000000" width="660" height="660" name="galeria" align="middle" allowScriptAccess="sameDomain" allowFullScreen="true" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />
    </object>';
    
    require('stopka.php'); 
    
    
?>
</body>
</html>
