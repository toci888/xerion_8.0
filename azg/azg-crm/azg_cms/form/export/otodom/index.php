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
    ini_set('error_reporting', E_ALL);

    include_once("OtoDomClient.php");
    
    $client = new OtoDom();
    
    $support = new OtoDomSupport();
    //$id = $support->GetCountryByName("PL");
    //GetMediaTypes
    
    $agenci = $support->GetAdditionalUserContacts();
    var_dump($agenci);
    echo '<br />';
    
    echo '<br />typy mediow : sell_House';
    $res = $support->GetMediaTypes('sell_House');
    var_dump($res);
    
    echo '<br />typy mediow : sell_Flat';
    $res = $support->GetMediaTypes('sell_Flat');
    var_dump($res);
    //sell_Terrain
    echo '<br />typy mediow : sell_Terrain';
    $res = $support->GetMediaTypes('sell_Terrain');
    var_dump($res);
    //sell_CommercialProperty
    echo '<br />typy mediow : sell_CommercialProperty';
    $res = $support->GetMediaTypes('sell_CommercialProperty');
    var_dump($res);
    
    //------------
       
    echo '<br />rodzaj nieruchomosci szczegoly: sell_House';
    $res = $support->GetBuildingTypes('sell_House');
    var_dump($res);
    
    echo '<br />rodzaj nieruchomosci szczegoly: sell_Flat';
    $res = $support->GetBuildingTypes('sell_Flat');
    var_dump($res);
    
    echo '<br />rodzaj nieruchomosci szczegoly: sell_Terrain';
    $res = $support->GetBuildingTypes('sell_Terrain');
    var_dump($res);
    
    echo '<br />rodzaj nieruchomosci szczegoly: sell_CommercialProperty';
    $res = $support->GetBuildingTypes('sell_CommercialProperty');
    var_dump($res);
    
    //------------
    
    echo '<br />rodzaj wlasnosci: sell_House';
    $res = $support->GetBuildingOwnerships('sell_House');
    var_dump($res);
    
    echo '<br />rodzaj wlasnosci: sell_Flat';
    $res = $support->GetBuildingOwnerships('sell_Flat');
    var_dump($res);
    
    echo '<br />rodzaj wlasnosci: sell_Terrain';
    $res = $support->GetBuildingOwnerships('sell_Terrain');
    var_dump($res);
    
    echo '<br />rodzaj wlasnosci: sell_CommercialProperty';
    $res = $support->GetBuildingOwnerships('sell_CommercialProperty');
    var_dump($res);
    
    //------------
    
    echo '<br />okolice: sell_House';
    $res = $support->GetVicinityTypes('sell_House');
    var_dump($res);
    
    echo '<br />okolice: sell_Flat';
    $res = $support->GetVicinityTypes('sell_Flat');
    var_dump($res);
    
    echo '<br />okolice: sell_Terrain';
    $res = $support->GetVicinityTypes('sell_Terrain');
    var_dump($res);
    
    echo '<br />okolice: sell_CommercialProperty';
    $res = $support->GetVicinityTypes('sell_CommercialProperty');
    var_dump($res);
    
    //------------
    
    echo '<br />dojazd: sell_House';
    $res = $support->GetAccessTypes('sell_House');
    var_dump($res);
    
    echo '<br />dojazd: sell_Flat';
    $res = $support->GetAccessTypes('sell_Flat');
    var_dump($res);
    
    echo '<br />dojazd: sell_Terrain';
    $res = $support->GetAccessTypes('sell_Terrain');
    var_dump($res);
    
    echo '<br />dojazd: sell_CommercialProperty';
    $res = $support->GetAccessTypes('sell_CommercialProperty');
    var_dump($res);
    
    //------------
    
    echo '<br />struktura: sell_House';
    $res = $support->GetStructureTypes('sell_House');
    var_dump($res);
    
    echo '<br />struktura: sell_Flat';
    $res = $support->GetStructureTypes('sell_Flat');
    var_dump($res);
    
    echo '<br />struktura: sell_Terrain';
    $res = $support->GetStructureTypes('sell_Terrain');
    var_dump($res);
    
    echo '<br />struktura: sell_CommercialProperty';
    $res = $support->GetStructureTypes('sell_CommercialProperty');
    var_dump($res);
    
    //------------
    
    echo '<br />extras: sell_House';
    $res = $support->GetExtrasTypes('sell_House');
    var_dump($res);
    
    echo '<br />extras: sell_Flat';
    $res = $support->GetExtrasTypes('sell_Flat');
    var_dump($res);
    
    echo '<br />extras: sell_Terrain';
    $res = $support->GetExtrasTypes('sell_Terrain');
    var_dump($res);
    
    echo '<br />extras: sell_CommercialProperty';
    $res = $support->GetExtrasTypes('sell_CommercialProperty');
    var_dump($res);
    
    //echo '<br /><br />';
    
    //$result = $client->Login();
    
?>