<?php
    $_SERVER['SCRIPT_FILENAME'] = '/home/bartek/public_html/';
    
    include_once ('/home/bartek/public_html/lib/telnet.php');
    
    $telnet = new PHPTelnet();
    $res = $telnet->Connect('10.0.0.101', null, 5524);
    $telnet->Listen($response);
    //echo $res;
    
?>