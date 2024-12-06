<HTML>
<HEAD>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script language="javascript" src="js/dtree.js"></script>

<link rel="StyleSheet" href="css/dtree.css" type="text/css" />
<link href="azg.css" rel="stylesheet" type="text/css" /> 
</head> 
<body>
<?php
    include_once ('ui/kontrolki_html.php'); 
    include_once ('ui/utilsui.php'); 
    include_once ('bll/tags.php'); 
    include_once ('bll/jezykibll.php');
    include_once ('bll/cache.php');
    include_once ('dal/dal.php');
    require('naglowek.php');
    require('conf.php');
    session_start();
    $tlumaczenia = cachejezyki::Czytaj();
    
    if (isset($_GET['id_miejscowosc']))
    {
        echo '<script>parent.document.getElementById("id_wybrana_msc").value = '.$_GET['id_miejscowosc'].';</script>';
        echo '<table><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$lokalizacja_nieruchomosci).'. <br />'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wybrano).': '.$_GET['nazwa'].'.</td></tr></table>';
    }
    if (isset($_GET['id']))
    {        
        $regiony = cacheregiony::Czytaj($_GET['id'], $_GET['nazwa']);
        echo '<div class="dtree">'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$lokalizacja_nieruchomosci).': <p><a href="javascript: d.openAll();">'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$rozwin_wszystko).'</a> | <a href="javascript: d.closeAll();">'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zwin_wszystko).'</a></p>
        <script type="text/javascript">d = new dTree(\'d\');';
    
        require('kod_drzewo/'.$_GET['id']);
    
        echo 'document.write(d);</script></div>';
    }
?>
</body>
</html>