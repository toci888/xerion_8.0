<?php
    function analyse_districts ($obj)
    {
        $j = 0;
        while (isset($obj[$j]))
        {
            $zm = $obj[$j];
            //echo 'Id powiatu: '.$zm['ID'].'<br />';
            //echo 'nazwa powiatu: '.$zm['Name'].'<br />';
            echo $zm['ID'];
            echo ';';
            echo $zm['Name'];
            $zm = $zm['Province'];
            echo ';';
            echo $zm['ID'];
            //echo 'Id wojewodztwa: '.$zm['ID'].'<br />';
            //echo 'nazwa wojewodztwa: '.$zm['Name'].'<br />';
            echo '<br />';
            $j++;
        }
    }

    include_once("OtoDomClient.php");
    
    $client =& new OtoDom();
    
    $support =& new OtoDomSupport();
    //$id = $support->GetCountryByName("PL");

    //$res = $support->GetAllegroCategories();
    $res = $support->GetInsertionKinds();

    //echo '<br /><br />';
    
    //$result = $client->Login();
    var_dump($res);
?>