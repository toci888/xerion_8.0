<?php
    $path = str_replace($_SERVER['PHP_SELF'], '', $_SERVER['SCRIPT_FILENAME']).'/';
    
    include_once ($path.'dal/queriesDAL.php');

    //klasa elementow do raportowania
    class OfertyGablotaACD
    {
        public $wsp_x;
        public $wsp_y;
        public $gablota_id;
        public $oferta_out;
        public $oferta_in;
        public $nier_id;
        public $trans_id;
        public $nazwa; //txt przyczyna - stat lub cena
    }
    
    class GablotaBLL
    {
        protected $kolekcja;
        
        public function GablotaBLL($obj_cache = null)
        {
            if ($obj_cache != null)
            {
                $this->kolekcja = $obj_cache;
            }
            else
            {
                $this->kolekcja = array();
            }
        }
        
        public function DodajElement($tabDane, $oferta_out)
        {
            $element = new OfertyGablotaACD;
            $element->wsp_x = $tabDane[GablotaDAL::$wspolrzedna_x];
            $element->wsp_y = $tabDane[GablotaDAL::$wspolrzedna_y];
            $element->gablota_id = $tabDane[GablotaDAL::$id_gablota];
            $element->nazwa = $tabDane[NieruchomoscDAL::$nazwa];
            $element->oferta_in = $tabDane[NieruchomoscDAL::$id_oferta];
            $element->oferta_out = $oferta_out;
            $element->nier_id = $tabDane[NieruchomoscDAL::$id_nier_rodzaj];
            $element->trans_id = $tabDane[NieruchomoscDAL::$id_trans_rodzaj];
            $this->kolekcja[$element->gablota_id.$element->wsp_x.$element->wsp_y] = $element;
            //$this->kolekcja[] = new OfertyGablotaACD;
            return $this->kolekcja;
        }
        
        public function PodajKolekcje ()
        {
            return $this->kolekcja;
        }
    }
?>