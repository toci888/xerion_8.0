<?php
    include_once ('dal/stronaDAL.php');

    $_GET['target'] = 'oferty';
    $_GET[StronaOfertaDAL::$id_nier_rodzaj] = 1;
    $_GET[StronaOfertaDAL::$id_trans_rodzaj] = 1;
    require('index.php');
?>