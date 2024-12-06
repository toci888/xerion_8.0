<?php
    
    $path = str_replace($_SERVER['PHP_SELF'], '', $_SERVER['SCRIPT_FILENAME']).'/';
    
    include_once ($path.'dal/admDAL.php');
    include_once ($path.'lib/telnet.php');//zweryfikowac ......... rekurencyjne z telnet

//wstepne zalozenie przewiduje wykorzystanie tej klasy zarowno do zapisu do bazy jak i odczytu z centralki
    class Slican
    {
        protected $NA = array(1 => '_brak_zalogowania_do_centrali', 
        2 => '_odlozona_sluchawka', 
        3 => '_brak_wywolania',
        4 => '_przekazywany_numer_jest_zajety_lub_niedostepny',
        5 => '_abonent_wywolywany_jest_przez_grupe',
        6 => '_nie_mozna_przekazac_na_numer_miejski',
        7 => '_nie_ma_takiego_numeru',
        8 => '_brak_uprawnien_do_przekazania',
        9 => '_parametry_uslugi_niedostepne_w_centrali',
        10 => '_brak_mozliwosci_zarejestrowania_polaczenia_zlosliwego',
        11 => '_bledny_klucz_dostepu',
        12 => '_brak_klucza_dostepu',
        13 => '_brak_takiego_konta',
        14 => '_numer_nie_posiada_telefonu_systemowego',
        15 => '_numer_nie_jest_abonentem',
        16 => '_wybieranie_cyfr_niemozliwe',
        17 => '_abonent_wylaczony_lub_uszkodzony',
        18 => '_abonent_ma_zablokowany_telefon',
        19 => '_brak_pozwolenia_na_aplikacje_cti_telefon',
        20 => '_zbyt_duza_liczba_prob_z_blednym_kluczem');
        
        protected $zakonczenie_polaczenia = 1;
        
        //wstepna idea jest taka, ze zczytany komunikat od reki wywoluje metode obslugujaca :) z tego obiektu; zeby to mialo rece i nogi metody raczej bez parametrow, jedynym moze byc caly string otrzymany - do interpretacji
        //poniewaz string juz bedzie wstepnie zinterpretowany moznaby jedynie czesc po komunikacie podac
        //ponizsza tablica bedzie zawierac komunikaty centralki OBSLUGIWANE w kodzie - innych nie ma sensu obslugiwac
        protected $kom_centrala = array('aRING' => 'Ring', 'aCONN' => 'Conn', 'aREL' => 'Rel');
        //'ECHO' => 'Echo', 'STAT' => null,
        
        protected $rozm_nieod = 1;
        protected $rozm_od = 2;
        protected $rozm_zak = 3;
        
        
        protected $telnet_cct;
        protected $dal;
        
        public function Slican()
        {
            $this->telnet_cct = new PHPTelnet();
            $this->dal = new CentralkaDAL();
        }
        
        public function OdebranoKomunikat($komunikat)
        {
            $tab_komunikat = explode(' ', $komunikat);
            if (isset($this->kom_centrala[$tab_komunikat[0]]))
            {
                //odebrano jeden z komunikatow ring conn lub rel
                $metoda = $this->kom_centrala[$tab_komunikat[0]];
                $tab_kom[CentralkaDAL::$wewnetrzny] = $tab_komunikat[1];
                $tab_kom[CentralkaDAL::$nr_telefon] = $tab_komunikat[2];
                if ($tab_komunikat[2] != '_') //zasadniczo nie ewidencjonujemy info o polaczeniachz zastrzezonych
                {
                    $this->$metoda($tab_kom);
                }
            }
        }
        
        //zadzwonienie do abonenta z biura
        public function Dial($wewnetrzny, $telefon)
        {
            //to dzwonienie moze sie nie powiesc, jesli osoba nie zajmie linii, wiec te get response musza miec jakis timeout, zeby skrypt nie mlocil
            //nie wiadomo czy tu bedzie potrzebna, na razie nie implementowana
            $this->telnet_cct->Connect('10.0.0.101', $wewnetrzny, 5524, 4); //polaczenie wazne 4 sekundy (ma taki timeout), po 4 sekundach, jesli linia nie zostanie zajeta polaczenie jest konczone
            ///socket przedawnia sie po 5 sekundach przy tym polaczeniu, bo inaczej serwer zostanie zatkany, jesli ktos nie podniesie sluchawki
            $this->telnet_cct->GetResponse($r); //przyjmowanie odpowiedzi centrali po connectcie, oczekiwanie na stat - podniesienie sluchawki
            
            echo $r.'<br />';
            //w wyniku powinno przyjsc aSTAT wewnetrzny, wtedy odsluchac aDRDY wewnetrznyi mozna dzwonic
            $tab_komun = explode(' ', $r);
            if ($tab_komun[0] == 'aSTAT' && $tab_komun[1] == $wewnetrzny)
            {
                $this->telnet_cct->GetResponse($r);
                ///sprawdzic czy teraz przyszlo drdy
                $this->telnet_cct->Polecenie('aDIAL '.$wewnetrzny.' 0'.$telefon); 
            }
            //drugi raz czekac nie trzeba, jak dostanie stat to drdy tez dostanie :P
            /*if (strlen($r) > 0)
            {
                var_dump($r);
                //$this->telnet_cct->GetResponse($r);
                //echo $r.'<br />';
                $this->telnet_cct->Polecenie('aDIAL '.$wewnetrzny.' 0'.$telefon);
            } */
        }
        
        //rozmowa przychodzaca
        protected function Ring($tabKom)
        {
            $tabKom[CentralkaDAL::$id_status_dzwonienie] = $this->rozm_nieod;
            echo 'ring '.$tabKom[CentralkaDAL::$nr_telefon].'; ';
            $wynik = $this->dal->RozmowaPrzychodzaca($tabKom);
            //wynik moze byc true lub false
        }
        
        //polaczenie (niezaleznie od tego kto zadzwonil - ma miejsce rozmowa)
        protected function Conn($tabKom)
        {
            $tabKom[CentralkaDAL::$id_status_dzwonienie] = $this->rozm_od;
            echo 'conn '.$tabKom[CentralkaDAL::$nr_telefon].'; ';
            $wynik = $this->dal->RozmowaPrzychodzaca($tabKom);
        }
        //zakonczenie polaczenia
        protected function Rel($tabKom)
        {
            ///release odczytywac jesli dostajemy 1, jesli nie centralka przekazuje polaczenie
            if ($tabKom[CentralkaDAL::$nr_telefon] == $this->zakonczenie_polaczenia)
            {
                $tabKom[CentralkaDAL::$id_status_dzwonienie] = $this->rozm_zak;
                echo 'rel '.$tabKom[CentralkaDAL::$nr_telefon].';';
                $wynik = $this->dal->RozmowaPrzychodzaca($tabKom);
            }
        }
    }
    
    
?>