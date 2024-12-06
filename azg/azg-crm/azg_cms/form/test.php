<?php
    include_once ('bll/ofertystronabll.php');
    require('naglowek.php');
    require('conf.php');
    
    $test = new StronaPodsInfoBLL();
    $wynik = $test->PodajOferty(1, 2);
    var_dump($wynik);   
    
    require('stopka.php');
?>