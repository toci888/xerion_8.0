<?php
    //biblioteka klienta soap 
    //require_once('../nusoap5/nusoap.php');
    $path = str_replace($_SERVER['PHP_SELF'], '', $_SERVER['SCRIPT_FILENAME']).'/';
    
    include_once ($path.'export/otodom/OtoDomTypes.php');
    include_once ($path.'bll/jezykibll.php');
    include_once ($path.'bll/cache.php');
    
    class OtoDom
    {
        //soap testowy otodom 
        protected $serverUrl = "http://otodom.pl/webapi/web.php?wsdl";//"http://beta.otodom.pl/webapi/web.php?wsdl";  //http://otodom.pl/webapi/web.php?wsdl
        protected $accessKey = 'A3C0DCAC29165F4B18FCEE1E8D7C8C70';//off: A3C0DCAC29165F4B18FCEE1E8D7C8C70   //ABSDFB34FI651N4MJAXY564F
        protected $userName = 'biuro2@azg.pl';//'test@otodom.pl';//off: biuro2@azg.pl
        protected $password = 'E5NDTFDN';//'testotodom';//off: E5NDTFDN
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
        //statics
        //public static $offerInsId = 'offerInsId'; 
        //public static $expiryDate, $provinceId, $districtId, $cityName, $quaterName, $offerId, $price, $area, $ownership, $description, $height, $structure, 
        //$media, $heating, $parking, $surrounding, $extras, $floorNo, $buildingType, $floors, $rooms, $constrStatus, $buildYear, $heatingTypes, $offerType, $localization, 
        //$allegro_category, $picturesUrlArray, $accessTypes, $TerrainArea, $AgentOtodom
        //end of statics
        
        protected $country = 1;
        protected $priceType = 'brutto';
        protected $currency = 1;
        protected $localization = 'in building';
        protected $offer;
        protected $Picture;
        
        protected $dal;
        protected $tlumaczenia;
        protected $tabMediaOtodom;
        protected $tabRodzBudOtodom;
        protected $tabWlasOtodom;
        protected $tabOkolicaOtodom;
        protected $tabDojazdOtodom;
        protected $tabExtraOtodom;
        
        
        public function OtoDomSupport()
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
            $this->dal = new ExportDAL();
            $this->tlumaczenia = cachejezyki::Czytaj();
            $this->InitTabSlow();
        }      
            //getAdditionalAddresses
            
        //$offerInsId, $expiryDate, $provinceId, $districtId, $cityName, $quaterName, $offerId, $price, $area, $ownership, $description, $height, $structure, 
        //$media, $heating, $parking, $surrounding, $extras, $floorNo, $buildingType, $floors, $rooms, $constrStatus, $buildYear, $heatingTypes, $offerType, $localization, 
        //$allegro_category, $picturesUrlArray, $accessTypes, $TerrainArea, $AgentOtodom
        public function InsertOffer($id_oferta, &$powodzenie_op, $automat = false, $wymus = false)
        {
            ///sprawdzenie czy ta oferta juz jest na serwisie otodom
            $test_obecnosc = $this->dal->SprawdzAktOfwPortalu($id_oferta, 'Otodom');
            $test_obecnosc = $test_obecnosc[0];
            if ($wymus)
            {
                if ($test_obecnosc[ExportDAL::$ilosc] == 0)
                {
                    $jednostki_przes = $test_obecnosc[ExportDAL::$ilosc] = 1;
                }
            }
            
            if ($test_obecnosc[ExportDAL::$ilosc] > 0)
            {
                $jednostki_przes = $test_obecnosc[ExportDAL::$ilosc];
            }
            else
            {
                $jednostki_przes = 0;
            }
            //jesli nie ma ilosci oferta jest nowa (?) jesli ilosc jest -1 oferta jest nieaktywna, ale przed czasem wygasniecia, ilosc wieksza od 0 podaje o ile trzeba przesunac date zeby oferta byla przed czasem
            if ($test_obecnosc[ExportDAL::$ilosc] == null || $test_obecnosc[ExportDAL::$ilosc] == -1 || $test_obecnosc[ExportDAL::$ilosc] > 0)
            {
                //oferte trzeba publikowac, stad pobieranie
                $wynik = $this->dal->PobierzOfertaOtodom($id_oferta, $automat, $ilosc_wierszy);
                if ($ilosc_wierszy == 1)
                {
                    $wiersz = $wynik[0];
                    //iconv('ISO-8859-2', 'UTF-8', )
                    
                    $this->offer->InsertionId = $wiersz[ExportDAL::$insertion_id];
                    $this->offer->AllegroCategory = $wiersz[ExportDAL::$id_kategoria];
                    $this->offer->Area = $wiersz[ExportDAL::$powierzchnia];
                    $this->offer->BuildingOwnership = $this->tlumaczenia->Tlumacz($this->country, $wiersz[ExportDAL::$stan_prawny]); ///trzebaby tu sprawdzic jakie oni maja rodzaje stanow prawnych
                    $this->offer->BuildYear = $wiersz[ExportDAL::$rok];//rok budowy
                    $this->offer->BulidingFloorsNum = $wiersz[ExportDAL::$liczba_pieter];//ilosc pieter budynku
                    $this->offer->CityName = $wiersz[ExportDAL::$miejscowosc];//nazwa miasta
                    $this->offer->Country = $this->country;//polska
                    $this->offer->Description = $wiersz[ExportDAL::$opis].iconv('ISO-8859-2', 'UTF-8', ' Wiêcej informacji na stronie www.azg.pl'); //opis
                    $this->offer->District = $wiersz[ExportDAL::$id_powiat];//powiat
                    $this->offer->InsertionExpirationDate = $wiersz[ExportDAL::$data_wyg]; //data wygasania - przychodzi z bazy
                    $this->offer->FloorNo = $wiersz[ExportDAL::$numer_pietra]; //numer pietra
                    $this->offer->Localization = $wiersz[ExportDAL::$ulica]; //dac ulice            
                    $this->offer->OfferType = $wiersz[ExportDAL::$rodzaj_oferta];//typ oferty - rodzaj trans rodzaj nier : sell_flat
                    //echo 'offer type : '.$this->offer->OfferType;
                    $this->offer->Price = $wiersz[ExportDAL::$cena];//cena
                    $this->offer->PriceCurrency = $this->currency;//waluta
                    $this->offer->PriceType = $this->priceType; //brutto
                    $this->offer->Province = $wiersz[ExportDAL::$id_wojewodztwo];//wojewodztwo ?
                    $this->offer->QuarterName = $wiersz[ExportDAL::$ulica];//dzielnica - dac ulice
                    $this->offer->RemoteId = $wiersz[ExportDAL::$id_oferta]; //id oferta
                    $this->offer->RoomsNum = $wiersz[ExportDAL::$liczba_pokoi];//ilosc pokoi
                    $this->offer->Street = $wiersz[ExportDAL::$ulica]; //ulica
                    $this->offer->TerrainArea = $wiersz[ExportDAL::$powierzchnia_dzialki]; //powierzchnia dzialki
                    $this->offer->AdditionalUserContact = $wiersz[ExportDAL::$id_agent]; ///id agenta w otodom
                    
                    //ogrodzenie jest brane tylko dla dzialek terenow, pomyslec i poprawic bo nie moze tak byc na sztywno
                    $this->offer->Fence = 'n';
                    //stan prawny - tylko dla mieszkan
                    if (isset($this->tabWlasOtodom[$wiersz[ExportDAL::$stan_prawny]]))
                    {
                        $this->offer->BuildingOwnership = $this->tabWlasOtodom[$wiersz[ExportDAL::$stan_prawny]];
                    }
                    if (isset($this->tabRodzBudOtodom[$wiersz[ExportDAL::$rodzaj_nieruchomosc]]))
                    {
                        $this->offer->BuildingType = $this->tabRodzBudOtodom[$wiersz[ExportDAL::$rodzaj_nieruchomosc]];
                    }
                    
                    if ($wiersz[ExportDAL::$rynek])
                    {
                        $this->offer->MarketType = 'primary';  //primary, secondary, ny tu mamy bool pierwotny
                    }
                    else
                    {
                        $this->offer->MarketType = 'secondary';
                    }
                    ///media
                    $i = 0;
                    //if by sie nadal
                    if (is_array($wiersz[ExportDAL::$dodatki]))
                    foreach ($wiersz[ExportDAL::$dodatki] as $dodatek)
                    {
                        if (isset($this->tabMediaOtodom[$dodatek]))
                        {
                            $this->offer->MediaTypes[$i] = $this->tabMediaOtodom[$dodatek];
                            $i++;
                        }
                    }
                    ///okolica
                    $i = 0;
                    if (is_array($wiersz[ExportDAL::$dodatki]))
                    foreach ($wiersz[ExportDAL::$dodatki] as $dodatek)
                    {
                        if (isset($this->tabOkolicaOtodom[$dodatek]))
                        {
                            $this->offer->VicinityTypes[$i] = $this->tabOkolicaOtodom[$dodatek];
                            $i++;
                        }
                    }
                    ///dojazd
                    $i = 0;
                    if (is_array($wiersz[ExportDAL::$dodatki]))
                    foreach ($wiersz[ExportDAL::$dodatki] as $dodatek)
                    {
                        if (isset($this->tabDojazdOtodom[$dodatek]))
                        {
                            $this->offer->AccessTypes[$i] = $this->tabDojazdOtodom[$dodatek];
                            $i++;
                        }
                    }
                    
                    ///extras
                    $i = 0;
                    if (is_array($wiersz[ExportDAL::$dodatki]))
                    foreach ($wiersz[ExportDAL::$dodatki] as $dodatek)
                    {
                        if (isset($this->tabExtraOtodom[$dodatek]))
                        {
                            $this->offer->ExtrasTypes[$i] = $this->tabExtraOtodom[$dodatek];
                            $i++;
                        }
                    }
                                                   
                    $i = 0;
                    $pictures = array();
                    if (is_array($wiersz[ExportDAL::$zdjecie]))
                    foreach($wiersz[ExportDAL::$zdjecie] as $zdj)
                    {
                        $this->Picture = new PictureWsdl();
                        $this->Picture->Data = base64_encode(file_get_contents($zdj));
                        $pictures[$i] = $this->Picture;
                        $i++;
                    }
                    $this->offer->Pictures = $pictures;
                    
                    //var_dump($this->offer);
                    //$this->offer->Heating = iconv('ISO-8859-2', 'UTF-8', $heating);
                    //$this->offer->HeatingTypes = ConvertArrayToUTF($heatingTypes); //iterate and convert
                    //$this->offer->Height = $height;
                    //$this->offer->ParkingType = iconv('ISO-8859-2', 'UTF-8', $parking);
                    //$this->offer->WindowsType = $windowsType;
                
                    try
                    {
                        $insertionId = $this->client->doInsertion($this->SessionId, $this->offer);
                        $powodzenie_op = true;
                        
                        ///jesli jednostki przesuniecia > 0 to data wygasniecia juz minela, trzeba ja odsunac
                        if ($jednostki_przes > 0)
                        {
                            $wynik = $this->dal->OgloszenieOtodom($id_oferta, $insertionId, $jednostki_przes);
                            $okres = $this->client->doInsertionActivate($this->SessionId, $this->offer->InsertionId, $jednostki_przes);
                            return $okres;
                        }
                        ///aktywowanie oferty bo jest nieaktywna, 0 jednostek przesuniecia, bo oferta jest przed czasem wygasniecia; przesuwanie czasu wygasniecia samo z siebie nie aktywuje oferty
                        if ($test_obecnosc[ExportDAL::$ilosc] == -1)
                        {
                            $this->dal->AktDeaktOferta($id_oferta, 'true');
                            $okres = $this->client->doInsertionActivate($this->SessionId, $this->offer->InsertionId, 0);
                            
                            return $okres;
                            //return null;
                        }
                        
                        
                        $wynik = $this->dal->OgloszenieOtodom($id_oferta, $insertionId, 1);
                        return $wynik[ExportDAL::$data_wyg];  
                    }
                    catch (SoapFault $fault)
                    {
                        $powodzenie_op = false;
                        return $fault->faultcode.' : '.$fault->faultstring;
                    }
                } 
            }

            return null;
        }
        ///dorobic deaktywacje oferty
        public function DeactivateOffer($id_oferta)
        {
            $wiersz = $this->dal->PodajInsOtodomIdPoOfId($id_oferta);
            if ($wiersz[ExportDAL::$insertion_id] != null)
            {
                $result = $this->client->doInsertionInactivate($this->SessionId, $wiersz[ExportDAL::$insertion_id]);
                //operacja powinna robic tez korekte w bazie polegajaca dzniu boola czy jest aktualnie aktywne na false
                $this->dal->AktDeaktOferta($id_oferta, 'false');
                //metoda zwraca true jesli operacja sie powiedzie lub false jesli nie
                return $result;
            }
            else
            {
                //zwrocenie nulla oznacza, ze taka oferta nie byla publikowana, nie da sie jej deaktywowac
                return null;
            }
        }
        protected function InitTabSlow()
        {
            $this->tabMediaOtodom[tags::$prad] = 'prad';
            $this->tabMediaOtodom[tags::$woda] = 'woda';
            $this->tabMediaOtodom[tags::$gaz] = 'gaz';
            $this->tabMediaOtodom[tags::$telefon] = 'telefon';
            $this->tabMediaOtodom[tags::$kanalizacja] = 'kanalizacja';
            
            $this->tabRodzBudOtodom[tags::$wolnostojacy] = 'detached';
            $this->tabRodzBudOtodom[tags::$blizniak] = 'semi-detached';
            $this->tabRodzBudOtodom[tags::$szeregowy] = 'ribbon';
            
            $this->tabWlasOtodom[tags::$spoldz_wlasnosciowe] = 'spoldzielcze_wlasnosciowe';
            $this->tabWlasOtodom[tags::$wlasnosc] = 'pelna_wlasnosc';
            
            $this->tabOkolicaOtodom[tags::$las] = 'las';
            $this->tabOkolicaOtodom[tags::$jezioro] = 'jezioro';
            
            $this->tabDojazdOtodom[tags::$asfaltowa] = 'asfaltowy';
            $this->tabDojazdOtodom[tags::$polna] = 'polny';
            $this->tabDojazdOtodom[tags::$utwardzonaszutrowa] = 'utwardzony';
            
            $this->tabExtraOtodom[tags::$parking] = 'parking';
            $this->tabExtraOtodom[tags::$siec_internet] = 'Internet';
            $this->tabExtraOtodom[tags::$kablowa] = 'telewizja kablowa';
        }
        
        ////utilsy tymczasowe dla otodom
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
        public function GetMarketTypes()
        {
            $params = array($this->accessKey);
            $marketTypes = $this->client->getMarketTypes($this->accessKey); 
            //$insertionKinds = $this->client->call($this->Methods['insertionKinds'], $params); 
            return $marketTypes;
        }
        public function GetAddressess()
        {
            $addressess = $this->client->getAdditionalAddresses($this->SessionId);
            return $addressess;
        }
        //getMediaTypes(string accessKey,string insertionKind)
        public function GetMediaTypes($rodz)
        {
            //$params = array($this->accessKey, 'sell_House');
            $insertionKinds = $this->client->getMediaTypes($this->accessKey, $rodz); 
            //$insertionKinds = $this->client->call($this->Methods['insertionKinds'], $params); 
            return $insertionKinds;
        }
        //getBuildingOwnerships(string accessKey,string insertionKind)
        public function GetBuildingOwnerships($rodz)
        {
            //$params = array($this->accessKey, 'sell_House');
            $insertionKinds = $this->client->getBuildingOwnerships($this->accessKey, $rodz); 
            //$insertionKinds = $this->client->call($this->Methods['insertionKinds'], $params); 
            return $insertionKinds;
        }
        //getBuildingTypes
        public function GetBuildingTypes($rodz)
        {
            //$params = array($this->accessKey, 'sell_House');
            $insertionKinds = $this->client->getBuildingTypes($this->accessKey, $rodz); 
            //$insertionKinds = $this->client->call($this->Methods['insertionKinds'], $params); 
            return $insertionKinds;
        }
        //getVicinityTypes
        public function GetVicinityTypes($rodz)
        {
            //$params = array($this->accessKey, 'sell_House');
            $insertionKinds = $this->client->getVicinityTypes($this->accessKey, $rodz); 
            //$insertionKinds = $this->client->call($this->Methods['insertionKinds'], $params); 
            return $insertionKinds;
        }
        //getAccessTypes
        public function GetAccessTypes($rodz)
        {
            //$params = array($this->accessKey, 'sell_House');
            $insertionKinds = $this->client->getAccessTypes($this->accessKey, $rodz); 
            //$insertionKinds = $this->client->call($this->Methods['insertionKinds'], $params); 
            return $insertionKinds;
        }
        //getStructureTypes
        public function GetStructureTypes($rodz)
        {
            //$params = array($this->accessKey, 'sell_House');
            $insertionKinds = $this->client->getStructureTypes($this->accessKey, $rodz); 
            //$insertionKinds = $this->client->call($this->Methods['insertionKinds'], $params); 
            return $insertionKinds;
        }
        //getExtrasTypes
        public function GetExtrasTypes($rodz)
        {
            //$params = array($this->accessKey, 'sell_House');
            $insertionKinds = $this->client->getExtrasTypes($this->accessKey, $rodz); 
            //$insertionKinds = $this->client->call($this->Methods['insertionKinds'], $params); 
            return $insertionKinds;
        }
        //getBuildingKindTypes
        public function GetBuildingKindTypes()
        {
            //$params = array($this->accessKey, 'sell_House');
            $insertionKinds = $this->client->getBuildingKindTypes($this->accessKey, 'sell_House'); 
            //$insertionKinds = $this->client->call($this->Methods['insertionKinds'], $params); 
            return $insertionKinds;
        }
        public function GetAdditionalUserContacts()
        {
            $insertionKinds = $this->client->getAdditionalUserContacts($this->SessionId); 
            //$insertionKinds = $this->client->call($this->Methods['insertionKinds'], $params); 
            return $insertionKinds;
        }
        //koniec utilsow stricte web serviceowych
    }
    //util
    function AreaToSquareMeter($area)
    {
        $result = $area * 100;
        return $result;
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
    /*function InsertionOtoDom($database, $nier, $data, $id_otodom, $id, $expdata)
    {
        $query = "insert into otodom_wysylka (id_nieruchomosc, id_rodzaj_nier, otodom_ins_id, data_wys, data_wyg) values 
                ($id, (select id from rodzaj_nieruchomosci where nazwa = '$nier'), $id_otodom, '$data', '$expdata');";
        $res = pg_query($database, $query);
    }
    function UpdateOtoDom($database, $nier, $id_otodom, $id, $expdata)
    {
        $data = date('Y-m-d');
        
        $query = "update otodom_wysylka set data_wyg = '$expdata' where otodom_ins_id = $id_otodom;";

        $res = pg_query($database, $query);
    } */
?>