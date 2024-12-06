<?php
    //chdir('../');
    //var_dump($_SERVER);
    //$_SERVER["REQUEST_URI"]='/';
    //require ('index.php');
    //echo '<script>document.location.href="http://'.$_SERVER['SERVER_NAME'].'/index.php?action=sprzedazm";</script>';
    header('Location: http://'.$_SERVER['SERVER_NAME'].'/index.php?action=sprzedazm');
?>