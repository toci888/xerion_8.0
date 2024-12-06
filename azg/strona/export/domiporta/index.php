<?php
    include_once('DomiportaClient.php');
    
    $client = new Domiporta();
    $client->WyslijOferty(array(array('id_oferta' => 2171)), null);
?>