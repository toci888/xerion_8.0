<?php
    include_once ('dal/stronaDAL.php');
    
    //session_start();
    //$_SESSION['baner_not'] = $_SERVER['PHP_SELF'];
    
    $_GET['target'] = 'oferty';
    $_GET[StronaOfertaDAL::$id_nier_rodzaj] = 2;
    $_GET[StronaOfertaDAL::$id_trans_rodzaj] = 1;
    require('index.php');
?>