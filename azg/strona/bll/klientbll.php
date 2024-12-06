<?php
    $path = str_replace($_SERVER['PHP_SELF'], '', $_SERVER['SCRIPT_FILENAME']).'/';
    
    include_once ($path.'dal/queriesDAL.php');

    class KlientBLL
    {
        protected $osobyUmowa; //osoba podpisujaca umowe
        protected $dal;
        protected $id_klient;
        
        public function KlientBLL($id_klient)
        {
            //na etapie utworzenia obiektu dalnie jest konieczny
            $this->id_klient = $id_klient;
        }
        
        public function DodajOsobaZlec ($id_osoba)
        {            
            $this->osobyUmowa[$id_osoba] = $id_osoba;
        }
        
        public function UsunOsobaZlec ($id_osoba)
        {
            unset($this->osobyUmowa[$id_osoba]);
        }
        
        public function PodajOsoby()
        {
            return $this->osobyUmowa;
        }
        
        public function SprawdzOsobaZlec ($id_osoba)
        {
            if (isset($this->osobyUmowa[$id_osoba]))
            {
                return true;
            }
            else
            {
                return false;
            }
        } 
    }
    class ZapotrzebowanieACD
    {
        public $id_zapotrzebowanie_trans_rodzaj;
        public $nier_rodzaj;
        public $trans_rodzaj;
        public $cena;
        public $opis_zapotrzebowanie;
        public $rodzaj_budynek = array();
        public $lokalizacja = array();
        public $parametry = array();
        //public $parametryMin = array();
        //public $parametryMax = array();
        public $wyposazenia = array();
    }
    class ZapotrzebowanieBLL
    {
        //protected $id_klient = null;
        protected $id_zapotrzebowanie = null;
        protected $zapotrzebowania = array(); //kolekcja typu ZapotrzebowanieACD indexowana numerami zapotrzebowania trans rodzaj :)
        
        protected $dal;
        
        //konstruktor z id klienta lub / i  id zapotrzebowania, na nie ustalane wszystkie zapotrzebowania i wciagane kolejne dane
        public function ZapotrzebowanieBLL ($id_zapotrzebowanie) //$id_klient
        {
            //$this->id_klient = $id_klient;
            $this->id_zapotrzebowanie = $id_zapotrzebowanie;
            
            //Podanie listy poszukiwanych nieruchomosci
            $this->PodajListeZapotrzebowan();
            $this->UzupelnijZapotrzebowania();
        }
        
        public function PodajKolekcjaZapotrzebowania()
        {
            return $this->zapotrzebowania;
        }
        
        protected function PodajListeZapotrzebowan()
        {
            $this->dal = new NieruchomoscDAL();
            $wynik = $this->dal->PodajTransNierZapotrzebowanie(array(NieruchomoscDAL::$id_zapotrzebowanie => $this->id_zapotrzebowanie), $ilosc_wierszy);
            foreach ($wynik as $wiersz)
            {
                $this->zapotrzebowania[$wiersz[NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj]] = new ZapotrzebowanieACD();
                $this->zapotrzebowania[$wiersz[NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj]]->id_zapotrzebowanie_trans_rodzaj = $wiersz[NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj];
                $this->zapotrzebowania[$wiersz[NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj]]->nier_rodzaj = $wiersz[NieruchomoscDAL::$nieruchomosc_rodzaj];
                $this->zapotrzebowania[$wiersz[NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj]]->trans_rodzaj = $wiersz[NieruchomoscDAL::$transakcja_rodzaj];
                $this->zapotrzebowania[$wiersz[NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj]]->cena = $wiersz[NieruchomoscDAL::$cena];
            }
        }
        protected function UzupelnijZapotrzebowania()
        {
            foreach ($this->zapotrzebowania as $zapotrzebowanie_trans_rodzaj_id => $obj)
            {
                $this->dal = new WyposazenieZapDAL($zapotrzebowanie_trans_rodzaj_id);
                $wynik = $this->dal->PodajTransRodzajWypPar();
                
                $paramNier = new WyposazenieZapBLL($zapotrzebowanie_trans_rodzaj_id, $wynik);
                
                $this->zapotrzebowania[$zapotrzebowanie_trans_rodzaj_id]->wyposazenia = $paramNier->KolekcjaWyposazen();
                $parametryMin = $paramNier->KolekcjaParametrowMin();
                $parametryMax = $paramNier->KolekcjaParametrowMax();
                
                foreach ($parametryMin as $id_sekcja => $obj_sekcja)
                {
                    $parametry = $obj_sekcja->PodajKolekcje();
                    foreach ($parametry as $kl_param => $objacd_param)
                    {
                        if ($objacd_param->wartosc != null)
                        {
                            $this->zapotrzebowania[$zapotrzebowanie_trans_rodzaj_id]->parametry[$kl_param][NieruchomoscDAL::$nazwa] = $objacd_param->nazwa;
                            $this->zapotrzebowania[$zapotrzebowanie_trans_rodzaj_id]->parametry[$kl_param][tags::$od] = $objacd_param->wartosc;
                        }
                    }
                }
                foreach ($parametryMax as $id_sekcja => $obj_sekcja)
                {
                    $parametry = $obj_sekcja->PodajKolekcje();
                    foreach ($parametry as $kl_param => $objacd_param)
                    {
                        if ($objacd_param->wartosc != null)
                        {
                            $this->zapotrzebowania[$zapotrzebowanie_trans_rodzaj_id]->parametry[$kl_param][NieruchomoscDAL::$nazwa] = $objacd_param->nazwa;
                            $this->zapotrzebowania[$zapotrzebowanie_trans_rodzaj_id]->parametry[$kl_param][tags::$do] = $objacd_param->wartosc;
                        }
                    }
                }
                
                ///dodanie opisow
                $wynik = $this->dal->PodajOpisPoszZapotrzebowanie(array(WyposazenieZapDAL::$id_zapotrzebowanie_trans_rodzaj => $zapotrzebowanie_trans_rodzaj_id), $ilosc_wierszy);
                $this->zapotrzebowania[$zapotrzebowanie_trans_rodzaj_id]->opis_zapotrzebowanie = $wynik;
                
                //rodzaj budynek i lokalizacja
                $this->dal = new WyposazenieZapDAL($zapotrzebowanie_trans_rodzaj_id);
            
                //regiony :)
                $wynik = $this->dal->PodajRegGeogZap($IloscWierszy);
                $this->zapotrzebowania[$zapotrzebowanie_trans_rodzaj_id]->lokalizacja = $wynik;
                
                ///rodzaje budynku
                $wynik = $this->dal->PodajDodaneRodzajeBudynku();
                $this->zapotrzebowania[$zapotrzebowanie_trans_rodzaj_id]->rodzaj_budynek = $wynik;
            }
        }
    }
?>