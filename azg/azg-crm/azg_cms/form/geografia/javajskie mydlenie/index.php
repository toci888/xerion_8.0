<?
    include ('soap.php');
    
    $obj = new GusSoap();
    //var_dump($obj->client);
    
    $res = $obj->client->getSubscriptionDicList();
    //$res = $obj->client->getCatalogInfo(2);
    echo $res;
?>