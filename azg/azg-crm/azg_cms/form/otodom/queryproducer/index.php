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
    set_time_limit(360);
    ini_set("memory_limit","64M");
    error_reporting(E_ALL);

    include_once("../soapquerying/OtoDomClient.php");
    
    $client =& new OtoDom();
    
    $support =& new OtoDomSupport();
    //$id = $support->GetCountryByName("PL");
    
    //$res = $support->GetProvincesByCountryId(1);
    $i = 1;
    $res = $support->GetDistrictsByProvinceId($i++); //dolnoslaskie
    //echo 'dolnoslaskie';
    analyse_districts($res['item']);
    //echo '<br /><br />';
    
    $res = $support->GetDistrictsByProvinceId($i++); //kujawsko-pomorskie
    //echo 'kujawsko-pomorskie';
    analyse_districts($res['item']);
    //echo '<br /><br />';
    
    $res = $support->GetDistrictsByProvinceId($i++); //lubelskie
    //echo 'lubelskie';
    analyse_districts($res['item']);
    //echo '<br /><br />';
    
    $res = $support->GetDistrictsByProvinceId($i++); //lubuskie
    //echo 'lubuskie';
    analyse_districts($res['item']);
    //echo '<br /><br />';
    
    $res = $support->GetDistrictsByProvinceId($i++); //³ódzkie
    //echo '³ódzkie';
    analyse_districts($res['item']);
    //echo '<br /><br />';
    
    $res = $support->GetDistrictsByProvinceId($i++); //ma³opolskie
    //echo 'ma³opolskie';
    analyse_districts($res['item']);
    //echo '<br /><br />';
    
    $res = $support->GetDistrictsByProvinceId($i++); //mazowieckie
    //echo 'mazowieckie';
    analyse_districts($res['item']);
    //echo '<br /><br />';
    
    $res = $support->GetDistrictsByProvinceId($i++); //opolskie
    //echo 'opolskie';
    analyse_districts($res['item']);
    //echo '<br /><br />';
    
    $res = $support->GetDistrictsByProvinceId($i++); //podkarpackie
    //echo 'podkarpackie';
    analyse_districts($res['item']);
    //echo '<br /><br />';
    
    $res = $support->GetDistrictsByProvinceId($i++); //podlaskie
    //echo 'podlaskie';
    analyse_districts($res['item']);
    //echo '<br /><br />';
    
    $res = $support->GetDistrictsByProvinceId($i++); //pomorskie
    //echo 'pomorskie';
    analyse_districts($res['item']);
    //echo '<br /><br />';
    
    $res = $support->GetDistrictsByProvinceId($i++); //œl¹skie
    //echo 'œl¹skie';
    analyse_districts($res['item']);
    //echo '<br /><br />';
    
    $res = $support->GetDistrictsByProvinceId($i++); //œwiêtokrzyskie
    //echo 'œwiêtokrzyskie';
    analyse_districts($res['item']);
    //echo '<br /><br />';
    
    $res = $support->GetDistrictsByProvinceId($i++); //warmiñsko-mazurskie
    //echo 'warmiñsko-mazurskie';
    analyse_districts($res['item']);
    //echo '<br /><br />';
    
    $res = $support->GetDistrictsByProvinceId($i++); //wielkopolskie
    //echo 'wielkopolskie';
    analyse_districts($res['item']);
    //echo '<br /><br />';
    
    $res = $support->GetDistrictsByProvinceId($i++); //zachodniopomorskie
    //echo 'zachodniopomorskie';
    analyse_districts($res['item']);
    //echo '<br /><br />';
    
    //$result = $client->Login();
    //var_dump($result);
?>