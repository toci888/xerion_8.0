<?php
    $path = str_replace($_SERVER['PHP_SELF'], '', $_SERVER['SCRIPT_FILENAME']).'/';
    
    include_once ($path.'dal/queriesDAL.php');
    include_once ($path.'bll/cache.php');
    include_once ($path.'bll/jezykibll.php');
    //ACD dla transakcji i nieruchomoœci to nadk³adanie niepotrzebnej roboty, dlatego zostanie pominiete, BLL powstaje na potrzebe t³umaczenia
    class TransNierBLL
    {
        protected $tabNier;
        //tablica nieruchomosci przetlumaczona
        protected $tabNierPrzet;
        protected $tabTransNier;
        //tablica transakcji dla nieruchomosci przetlumaczona
        protected $tabTransNierPrzet;
        protected $dal;
        
        public function TransNierBLL()
        {
            $this->dal = new TransNierDAL();
            $this->tabNier = $this->dal->PodajListeNieruchomosci($iloscWierszy);
            $this->Tlumacz($this->tabNier, $this->tabNierPrzet);
        }
        
        public function PodajTabNier()
        {
            return $this->tabNierPrzet;
        }
        public function PodajTransDlaNier($tabParam, &$iloscWierszy)
        {
            $this->tabTransNier = $this->dal->TransakcjeDlaNieruchomosci($tabParam, $iloscWierszy);
            $this->Tlumacz($this->tabTransNier, $this->tabTransNierPrzet);
            
            return $this->tabTransNierPrzet;
        }
        protected function Tlumacz($zrodlo, &$cel)
        {
            $tlumaczenie = cachejezyki::Czytaj();
            $cel = $tlumaczenie->TlumaczProstaTab($_SESSION['wyb_jezyk'], $zrodlo);
        }
    }
?>