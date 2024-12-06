<?php
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
        
        /*public function SprawdzOsobaZlec ($id_osoba)
        {
            if (isset($this->osobyUmowa[$id_osoba]))
            {
                return true;
            }
            else
            {
                return false;
            }
        } */
    }
?>