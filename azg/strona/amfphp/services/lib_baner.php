<?php
    $path = str_replace($_SERVER['PHP_SELF'], '', $_SERVER['SCRIPT_FILENAME']).'/';
    include_once ($path.'dal/queriesDAL.php');
    include_once ($path.'bll/jezykibll.php');
    include_once ($path.'bll/tags.php');
    
    class lib_baner
    {
        //session start nie jest potrzebne
        protected $tlumaczenia;
        
        public function lib_baner()
        {
            $this->tlumaczenia = cachejezyki::Czytaj();
        }
        /**
        * @desc Metoda bezparametrowa podajaca tablice nieruchomosci indeksowana ich unikatowymi id z bazy
        */
        public function PodajListaNieruchomosci()
        {            
            $_SESSION['wyb_jezyk'] = 1;
            
            $obiektTrans = new TransNierDAL();      
            $tabNier = $obiektTrans->PodajListeNieruchomosci($ilosc_wierszy);
            $tabNier = $this->tlumaczenia->TlumaczProstaTab($_SESSION['wyb_jezyk'], $tabNier);
            if (isset($_SESSION['filtr_ofert']))
            {
                $tablica = unserialize ($_SESSION['filtr_ofert']);
                $tabNier[StronaPodsInfoDAL::$id_nier_rodzaj] = $tablica[StronaPodsInfoDAL::$id_nier_rodzaj];
            }
            
            return $tabNier;
        }
        /**
        * @desc Metoda bezparametrowa podajaca tablice transakcji indexowana ich unikatowymi id z bazy
        */
        public function PodajListaTransakcji()
        {            
            $_SESSION['wyb_jezyk'] = 1;
            
            $obiektTrans = new TransNierDAL(); 
            $tabTrans = $obiektTrans->PodajListeTransakcji(array(TransNierDAL::$of_zap => tags::$oferta), $ilosc_wierszy);
            $tabTrans = $this->tlumaczenia->TlumaczProstaTab($_SESSION['wyb_jezyk'], $tabTrans);
            if (isset($_SESSION['filtr_ofert']))
            {
                $tablica = unserialize ($_SESSION['filtr_ofert']);
                $tabTrans[StronaPodsInfoDAL::$id_trans_rodzaj] = $tablica[StronaPodsInfoDAL::$id_trans_rodzaj];
            }
            
            return $tabTrans;
        }
        /**
        * @desc Metoda bezparametrowa, zwraca liste wojewodztw indexowanych ich unikatoym id
        */
        public function PodajListaWojewodztw()
        {
            $tabWoj = SlownikDAL::PodajWojewodztwa();
            return $tabWoj;
        }
        /**
        * @desc Metoda zwraca liste podleglych danemu regionowi geograficznemu regionow: powiatow dla wojewodztwa, gmin dla powiatow, miejscowosci dla gmin itd
        * @param numer id nadrzednego regionu geograficznego
        */
        public function PodajListaPodlegRegion($id_parent)
        {            
            //if 206 id_parent, inaczej to 2 :P
            $tabWoj = SlownikDAL::PobierzRegionGeog($id_parent);
            if (isset($_SESSION['filtr_ofert']))
            {
                $tablica = unserialize ($_SESSION['filtr_ofert']);
                $tabWoj[WyposazenieNierDAL::$id_parent] = $tablica[WyposazenieNierDAL::$id_parent];
                $tabWoj[StronaPodsInfoDAL::$id_region_geog] = $tablica[StronaPodsInfoDAL::$id_region_geog];
            }
            return $tabWoj;
        }
        //$tabReg = SlownikDAL::PobierzDzielniceOpole();
        /**
        * @desc metoda podajaca ostatnie parametry filtrowania
        */
        public function PodajTabParametr()
        {
            if (isset($_SESSION['filtr_ofert']))
            {
                $tablica = unserialize($_SESSION['filtr_ofert']);
            }
            else
            {
                $tablica = array (StronaPodsInfoDAL::$pow_min, StronaPodsInfoDAL::$pow_max, StronaPodsInfoDAL::$l_pok_min, StronaPodsInfoDAL::$l_pok_max, StronaPodsInfoDAL::$cena_max);
            }
            return $tablica;
        }
        public function PodajIdJezyk()
        {
            return 1;
            //return $_SESSION['wyb_jezyk'];
        }
        public function IloscOfertDzielnice ($id_trans_rodzaj, $id_nier_rodzaj, $id_region_geog)
        {
            $filtrowanie[StronaPodsInfoDAL::$id_trans_rodzaj] = $id_trans_rodzaj;
            $filtrowanie[StronaPodsInfoDAL::$id_nier_rodzaj] = $id_nier_rodzaj;
            $filtrowanie[StronaPodsInfoDAL::$id_region_geog] = $id_region_geog;
                     

            $obs_ofert = new IloscOfertDzielnice(); //obsluga ofert, obiekt za to odpowiada :)
            
            $wynik = $obs_ofert->PodajIloscOfert($id_region_geog, $id_trans_rodzaj, $id_nier_rodzaj, $filtrowanie);
            
            return $wynik;
        } 
        public function PodajZdjecia ($id_nieruchomosc)
        {
            $dal = new StronaPodsInfoDAL();
            $wynik = $dal->PodajZdjecia($id_nieruchomosc);
            $wynik['id_nieruchomosc'] = $id_nieruchomosc;
            $wynik ['speed'] = 320; // nborderColor="0x909090" aborderColor="0xffff00"
            $wynik ['shadow'] = 1;
            $wynik ['fontName'] = 'Arial';
            $wynik ['fontSize'] = 12;
            $wynik ['fontColor'] = '#00ff00';
            $wynik ['nborderColor'] = '0x909090';
            $wynik ['aborderColor'] = '0xffff00';
            
            return $wynik;
        }
    }
?>