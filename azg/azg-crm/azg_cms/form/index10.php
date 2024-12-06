<?php
    //foreach ($_SERVER as $key => $value)
    //{
    //    echo $key.' = '.$value.'<br />';
    //}
    require('concfg.inc');
    $data = date("Y-m-d h:i:s");
    $insert = 'insert into rejestracja_nto (adres_ip, data_odwiedzin, port_klient, sposob_odwiedzin, przegladarka) values (\''.
    $_SERVER['REMOTE_ADDR'].'\', \''.$data.'\', '.$_SERVER['REMOTE_PORT'].', \''.$_SERVER['REQUEST_METHOD'].'\', \''.$_SERVER['HTTP_USER_AGENT'].'\');';
    $res = pg_query($conn, $insert);
    header('location: index.php');
?>