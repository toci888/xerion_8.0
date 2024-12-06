<?php
require_once('nusoap.php');
$server = new soap_server();

$server->register('daj_status');

$HTTP_RAW_POST_DATA = isset($HTTP_RAW_POST_DATA) ? $HTTP_RAW_POST_DATA : '';
$server->service($HTTP_RAW_POST_DATA);

function daj_status($uid){
 return 
 array(
  'orbis_uid' => $uid,
   'status' => 'P'
 );
}
?>