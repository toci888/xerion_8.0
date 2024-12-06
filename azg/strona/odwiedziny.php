<?php
    // œ - ¶ ¹ - ±  Ÿ - ¼  - ¬ Œ - ¦
    if (!isset($_SESSION[$jezyk]))
    {
        $_SESSION[$jezyk] = 1;
    }
    if (isset($_GET[$jezyk]))
    {
        $_SESSION[$jezyk] = $_GET[$jezyk];
    }
    //zanotowanie skad sa odwiedziny na stronie
    $dal = new StronaPodsInfoDAL();
    $tabParametr[NieruchomoscDAL::$adres] = $_SERVER['REMOTE_ADDR'];
    $tabParametr[NieruchomoscDAL::$id_jezyk] = $_SESSION[$jezyk];
    $tabParametr[StronaPodsInfoDAL::$przegladarka] = $_SERVER['HTTP_USER_AGENT'];
    $tabParametr[StronaPodsInfoDAL::$url_azg] = $_SERVER['REQUEST_URI'];
    $tabParametr[StronaPodsInfoDAL::$request_time] = $_SERVER['REQUEST_TIME'];// - nie istnieje w php 5.0.4
    $tabParametr[StronaPodsInfoDAL::$request_method] = $_SERVER['REQUEST_METHOD'];
    if (isset($_SERVER['HTTP_REFERER']))
    {
        $tabParametr[StronaPodsInfoDAL::$referer] = $_SERVER['HTTP_REFERER'];
    }
    else
    {
        $tabParametr[StronaPodsInfoDAL::$referer] = 'bezposrednie';
    }
    $wynik = $dal->DodajOdwiedziny($tabParametr);
?>
