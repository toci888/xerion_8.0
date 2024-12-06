<html><head><title>A.Z.Gwarancja - Baza Danych</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/style.css" rel="stylesheet" type="text/css"></head>

<body>
<?php
    include_once ('bll/transnierbll.php');    
    include_once ('bll/jezykibll.php');
    include_once ('dal/queriesDAL.php'); 
    include_once ('ui/kontrolki_html.php');
    include_once ('bll/tags.php');
    include_once ('bll/cache.php');
    require('naglowek.php');
    require('conf.php');
    session_start();
    if (isset($_POST['zmien']))
    {
        $_SESSION[$jezyk] = $_POST['hid_id_jez'];
        
        $obiektTrans = new TransNierBLL();
        $_SESSION['obj_transnier'] = serialize($obiektTrans);
        
        echo '<script>parent.gora.location.href = "top.php";</script>';
        echo '<script>parent.left.location.href = "left.php";</script>';
    }
    if (isset($_POST['zmien_jezyk']))
    {
        $tlumaczenia = cachejezyki::Czytaj();
        $jezyki = $tlumaczenia->PodajJezyki();
        
        echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'"><table>';
        KontrolkiHtml::DodajHidden('hid_id_jez', 'hid_id_jez', '');
        foreach ($jezyki as $klucz => $wartosc)
        {
            echo '<tr><td>';
            KontrolkiHtml::DodajSubmit('zmien', $wartosc[JezykDAL::$id_jezyk], $wartosc[JezykDAL::$nazwa], 'onclick="hid_id_jez.value=this.id";');
            echo '</td></tr>';
        }
        echo '</table></form>';
    }
    require('stopka.php');
?>
</body>
</html>