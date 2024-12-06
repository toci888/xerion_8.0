<?php
    $path = str_replace($_SERVER['PHP_SELF'], '', $_SERVER['SCRIPT_FILENAME']).'/';  
    
    include_once ($path.'lib/soap.php');
    include_once ($path.'bll/utilsbll.php');
    include_once ($path.'bll/cache.php');
    
    class KodWaluty
    {
        //zgodnie ze specyfikacja metod z parametrem w postaci kodu waluty metoda oczekuje obiektu z polem scurrency typu string
        public $sCurrency;
        
        public function KodWaluty($kod)
        {
            $this->sCurrency = $kod;
        }
    }
    class KursyWalut 
    {
        public static $data = 'data_publikacji';
        public static $nazwa_waluty = 'nazwa_waluty';
        public static $kod_waluty = 'kod_waluty';
        public static $kurs_sredni = 'kurs_sredni';
        
        protected $client;
        protected $kody;
        protected $kursy_walut;
        protected $data_publikacji;
        
        
        public function KursyWalut()
        {
            //web service jakichs wesolkow :)
            $client = new Soap('http://waluty.k2.pl/ws/NBPRates.asmx?WSDL');
            $this->client = $client->PodajKlient();
        }
        /**
        * @desc Pobranie kodów walut (warto zacache'owac :P), zwracany przez web service jest obiekt z polem GetAllCodesResult typu string, kody sa rozdzielone spacjami
        */
        protected function PobierzKody()
        {
            $kody = $this->client->GetAllCodes();
            $this->kody = explode(' ', $kody->GetAllCodesResult);
            if (strlen($this->kody[count($this->kody) - 1]) < 1)
            {
                unset($this->kody[count($this->kody) - 1]);
            }
        }
        protected function PodajDateKursow()
        {
            $data_obj = $this->client->GetRateDate();
            $data_arr = explode('/', $data_obj->GetRateDateResult);
            $data = Utils::WyznaczDate($data_arr[2], $data_arr[0], $data_arr[1]);
            
            return $data;
        }
        protected function InterepretujWalute($xml, $kod)
        {
            $poz_data = strpos($xml, '<'.KursyWalut::$data.'>');
            $this->data_publikacji = strip_tags(substr($xml, $poz_data, strpos($xml, '</'.KursyWalut::$data.'>') - $poz_data));
            $poz_nazwa = strpos($xml, '<'.KursyWalut::$nazwa_waluty.'>');
            $nazwa_wal = strip_tags(substr($xml, $poz_nazwa, strpos($xml, '</'.KursyWalut::$nazwa_waluty.'>') - $poz_nazwa));
            $poz_kurs = strpos($xml, '<'.KursyWalut::$kurs_sredni.'>');
            $kurs = strip_tags(substr($xml, $poz_kurs, strpos($xml, '</'.KursyWalut::$kurs_sredni.'>') - $poz_kurs));
            
            $this->kursy_walut['dane'][] = array(KursyWalut::$nazwa_waluty => $nazwa_wal, KursyWalut::$kurs_sredni => $kurs, KursyWalut::$kod_waluty => $kod);
        }
        protected function PoborWalut()
        {
            $this->PobierzKody();
            
            foreach ($this->kody as $kod)
            {
                $kod_param = new KodWaluty($kod);
                $wartosc = $this->client->GetRateDetails($kod_param);
                $this->InterepretujWalute($wartosc->GetRateDetailsResult->any, $kod);
            }
            //posortowac tablice
            sort($this->kursy_walut['dane']);
            
            //$wartosc = $this->client->GetAllDetails(); //dziala
        }
        
        public function PodajKursy()
        {
            $data_serwer = $this->PodajDateKursow();
            $this->kursy_walut = cacheKursyWalut::CzytajKursy();
            if ($this->kursy_walut == null)
            {
                $this->kursy_walut['czas'] = $data_serwer;
                $this->PoborWalut();
                
                cacheKursyWalut::ZapiszKursy($this->kursy_walut);
                
                return $this->kursy_walut;
            }
            else if ($data_serwer != $this->kursy_walut['czas'])
            {
                $this->kursy_walut['czas'] = $data_serwer;
                //poniewaz sa pobrane poprzednie elementy, na chwile bierzaca nieaktualne, trzeba je wyrzucic
                unset($this->kursy_walut['dane']);
                $this->PoborWalut();
                
                cacheKursyWalut::ZapiszKursy($this->kursy_walut);
                
                return $this->kursy_walut;
            }
            else
            {
                return $this->kursy_walut;
            }            
        } 
    }
?>