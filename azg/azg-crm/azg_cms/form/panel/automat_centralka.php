<?php
    $_SERVER['SCRIPT_FILENAME'] = '/var/www/html/form/';
    
    include_once ('/var/www/html/form/lib/telnet.php');
    
    $telnet = new PHPTelnet();
    $res = $telnet->Connect('10.0.0.101', null, 5524);
    $telnet->Listen($response);
    //echo $res;
    
?>