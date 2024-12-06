<?php
    include_once ('dal/stronaDAL.php');
        
    $_GET['target'] = 'zlecenia';
    $_GET[StronaOfertaDAL::$id_nier_rodzaj] = 6;
    $_GET[StronaOfertaDAL::$id_trans_rodzaj] = 2;
    require('index.php');
?>