<?
    //biblioteka klienta soap 
    //require_once('../nusoap5/nusoap.php');
    
    include ("OtoDomTypes.php");
    class OtoDom
    {
        //soap testowy otodom 
        protected $serverUrl = "http://beta.otodom.pl/webapi/web.php?wsdl";//"http://beta.otodom.pl/webapi/web.php?wsdl";
        protected $accessKey = 'ABSDFB34FI651N4MJAXY564F';//A3C0DCAC29165F4B18FCEE1E8D7C8C70//ABSDFB34FI651N4MJAXY564F
        protected $userName = 'test@otodom.pl';//'test@otodom.pl';
        protected $password = 'testotodom';//'testotodom';
        protected $Methods = array();
        protected $client;
        protected $SessionId;
        
        function OtoDom()
        {
            //$this->client = new nusoapclient($this->serverUrl);
            $this->client = new SoapClient($this->serverUrl);
            //$this->client->soap_defencoding = 'ISO-8859-2';
            //$this->client->xml_encoding = 'ISO-8859-2';
        }
        public function Login()
        {
            //$params = array($this->accessKey, $this->userName, $this->password);
            //$this->SessionId = $this->client->call($this->Methods['login'], $params);
            $this->SessionId = $this->client->doLogin($this->accessKey, $this->userName, $this->password);
            return $this->SessionId;
        }
        
    }
    class OtoDomSupport extends OtoDom
    {
        protected $country = 1;
        protected $priceType = 'brutto';
        protected $currency = 1;
        protected $marketType = 'secondary';
        protected $localization = 'in building';
        protected $offer;
        protected $Picture;
        
        
        function OtoDomSupport()
        {
            $this->Methods['login'] = 'doLogin';
            $this->Methods['countries'] = 'getCountries';
            $this->Methods['provinces'] = 'getProvinces';
            $this->Methods['districts'] = 'getDistricts';
            $this->Methods['categories'] = 'getAllegroCategories';
            $this->Methods['insertionKinds'] = 'getInsertionKinds';
            $this->Methods['insertion'] = 'doInsertion';
            //$this->client = new nusoapclient($this->serverUrl);
            $this->client = new SoapClient($this->serverUrl); 
            $this->Login();
            $this->offer = new OfferWsdl();
        }
        public function GetCountryByName($CountryCode)
        {
            $params = array($this->accessKey);
            //$countries[] = new CountryWsdl();
            $country = new CountryWsdl();
            //$countries = $this->client->call($this->Methods['countries'], $params);
            $countries = $countries['item'];
            $i = 0;
            $number = count($countries);
            for ($i; $i < $number; $i++)
            {
                $country = $countries[$i];
                if ($CountryCode == $country['IsoCode'])
                {
                    return $country['ID'];
                }
            }
        }
        public function GetProvincesByCountryId($countryId)
        {
            $params = array($this->accessKey, $countryId);
            //$this->client->xml_encoding = 'ISO-8859-2';
            //$provinces = $this->client->call($this->Methods['provinces'], $params); 
        }
        public function GetDistrictsByProvinceId($provinceId)
        {
            $params = array($this->accessKey, $provinceId);
            //$districts = $this->client->call($this->Methods['districts'], $params); 
            return $districts;
        }
        public function GetAllegroCategories()
        {
            //$params = array($this->accessKey);
            //$categories = $this->client->call($this->Methods['categories'], $params); 
            $categories = $this->client->getAllegroCategories($this->accessKey);
            return $categories;
        }
        public function GetInsertionKinds()
        {
            $params = array($this->accessKey);
            $insertionKinds = $this->client->getInsertionKinds($this->accessKey); 
            //$insertionKinds = $this->client->call($this->Methods['insertionKinds'], $params); 
            return $insertionKinds;
        }
        public function InsertOffer($offerInsId, $expiryDate, $provinceId, $districtId, $cityName, $quaterName, $offerId, $price, $area, $ownership, $description, $height, $structure, 
        $media, $heating, $parking, $surrounding, $extras, $floorNo, $buildingType, $floors, $rooms, $constrStatus, $buildYear, $heatingTypes, $offerType, $localization, 
        $allegro_category, $picturesUrlArray, $accessTypes, $TerrainArea)
        {
            //iconv('ISO-8859-2', 'UTF-8', )
            $dzis = date('Y'.'-'.'m'.'-'.'d');
            
            $this->offer->InsertionId = $offerInsId;
            $this->offer->AllegroCategory = $allegro_category;
            $this->offer->Area = $area;
            $this->offer->BuildingOwnership = iconv('ISO-8859-2', 'UTF-8', $ownership);
            $this->offer->BuildingType = iconv('ISO-8859-2', 'UTF-8', $buildingType);
            $this->offer->BuildYear = $buildYear;
            $this->offer->BulidingFloorsNum = $floors;
            $this->offer->CityName = iconv('ISO-8859-2', 'UTF-8', $cityName);
            $this->offer->ConstructionStatus = iconv('ISO-8859-2', 'UTF-8', $constrStatus);
            $this->offer->Country = $this->country;
            $this->offer->Description = iconv('ISO-8859-2', 'UTF-8', $description);
            $this->offer->District = $districtId;
            $this->offer->InsertionExpirationDate = $expiryDate;
            $this->offer->ExtrasTypes = ConvertArrayToUTF($extras);//iterate and convert
            $this->offer->FloorNo = $floorNo;
            $this->offer->Heating = iconv('ISO-8859-2', 'UTF-8', $heating);
            $this->offer->HeatingTypes = ConvertArrayToUTF($heatingTypes); //iterate and convert
            $this->offer->Height = $height;
            $this->offer->Localization = $localization;
            $this->offer->MarketType = iconv('ISO-8859-2', 'UTF-8', $this->marketType);
            $this->offer->MediaTypes = $media;
            $this->offer->OfferType = $offerType;
            $this->offer->ParkingType = iconv('ISO-8859-2', 'UTF-8', $parking);
            $this->offer->Price = $price;
            $this->offer->PriceCurrency = $this->currency;
            $this->offer->PriceType = $this->priceType;
            $this->offer->Province = $provinceId;
            $this->offer->QuarterName = iconv('ISO-8859-2', 'UTF-8', $quaterName);
            $this->offer->RemoteId = $offerId;
            $this->offer->RoomsNum = $rooms;
            $this->offer->Street = iconv('ISO-8859-2', 'UTF-8', $quaterName);
            $this->offer->Structure = iconv('ISO-8859-2', 'UTF-8', $structure);
            $this->offer->TerrainArea = $surrounding;
            $this->offer->WindowsType = $windowsType;
            $this->offer->TerrainArea = $TerrainArea;
                                           
            $i = 0;
            $pictures = array();
            while (isset($picturesUrlArray[$i]))
            {
                $this->Picture = new PictureWsdl();
                $this->Picture->Data = base64_encode(file_get_contents($picturesUrlArray[$i]));
                $pictures[$i] = $this->Picture;
                $i++;
            }
            //$this->Picture = $pictures;
            $this->offer->Pictures = $pictures;
            $this->offer->AccessTypes = $accessTypes;
            
            //$insertionId = $this->client->call($this->Methods['insertion'], $params); 
            //echo 'before do insertion';
            //$params = array($this->SessionId, $this->offer);
            //$insertionId = $this->client->__call($this->Methods['insertion'], $params);
            try
            {
                $insertionId = $this->client->doInsertion($this->SessionId, $this->offer); 
            }
            catch (SoapFault $fault)
            {
                echo "Dodanie og³oszenia nie powiod³o siê. Kod b³êdu: [{$fault->faultcode}]
{$fault->faultstring}";
            }
            //echo 'after';

            //echo '<br />';
            //echo $this->client->error_str;
            //echo '<br />';
            //echo $this->client->debug_str;
            //echo '<br />';
            //echo $insertionId;
            return $insertionId;
        }
    }
    function ConvertArrayToUTF(&$arr)
    {
        $i = 0;
        while (isset($arr[$i]))
        {
            $arr[$i] = iconv('ISO-8859-2', 'UTF-8', $arr[$i]);
            $i++;
        }
    }
    function InsertionOtoDom($database, $nier, $data, $id_otodom, $id, $expdata)
    {
        $query = "insert into otodom_wysylka (id_nieruchomosc, id_rodzaj_nier, otodom_ins_id, data_wys, data_wyg) values 
                ($id, (select id from rodzaj_nieruchomosci where nazwa = '$nier'), $id_otodom, '$data', '$expdata');";
        $res = pg_query($database, $query);
    }
    function UpdateOtoDom($database, $nier, $id_otodom, $id, $expdata)
    {
        $query = "update otodom_wysylka set data_wyg = '$expdata' where otodom_ins_id = $id_otodom;";
        $res = pg_query($database, $query);
    }
?>