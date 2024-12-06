<?php
    $path = str_replace($_SERVER['PHP_SELF'], '', $_SERVER['SCRIPT_FILENAME']).'/';
    
    include_once ($path.'dal/dal.php');
    include_once ($path.'dal/utilsdal.php');
    include_once ($path.'bll/tags.php');
    
    class StronaPodsInfoDAL
    {
        public static $oferta = 'oferta';
        public static $id_oferta = 'id_oferta';
        public static $id = 'id';
        public static $nazwa = 'nazwa';
        public static $email = 'email';
        public static $pow_min = 'pow_min';
        public static $l_pok_min = 'l_pok_min';
        public static $pow_max = 'pow_max';
        public static $l_pok_max = 'l_pok_max';
        public static $cena_max = 'cena_max';
        public static $id_trans_rodzaj = 'id_trans_rodzaj';
        public static $id_nier_rodzaj = 'id_nier_rodzaj';
        public static $id_jezyk = 'id_jezyk';
        public static $parametr_nazwa = 'parametr_nazwa';
        public static $parametr_wartosc = 'parametr_wartosc';
        public static $wyposazenie = 'wyposazenie';
        public static $wylacznosc = 'wylacznosc';
        public static $klucz = 'klucz';
        public static $referer = 'referer';
        public static $przegladarka = 'przegladarka';
        public static $url_azg = 'url_azg';
        public static $request_time = 'request_time';
        public static $request_method = 'request_method';
        public static $ilosc_pokoi = 'ilosc_pokoi';
        public static $id_rodz_nier_szcz = 'id_rodz_nier_szcz';
        public static $id_region_geog = 'id_region_geog';
        
        protected $dal;
        
        
        public function StronaPodsInfoDAL()
        {
            $this->dal = new dal();
        }
        
        public function OfertyNajczestsze(&$ilosc_wierszy)
        {
            $zapytanie = 'select * from OfertyNajczestsze();';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            
            return $wynik;
        }
        
        public function RodzajOferta($id_trans_rodzaj, $id_nier_rodzaj)
        {
            $zapytanie = 'select * from PodajRodzajOferta('.$id_nier_rodzaj.', '.$id_trans_rodzaj.');';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            
            return $wynik;
        }
        
        public function Transakcje(&$ilosc_wierszy)
        {
            $zapytanie = 'select * from WszystkieRodzajeTrans();';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            UtilsDAL::KorektaKolBool($wynik, array(StronaPodsInfoDAL::$oferta));
            
            return $wynik;
        }
        public function RodzajNieruchomosc ($id_trans_rodzaj, &$ilosc_wierszy)
        {
            $zapytanie = 'select * from PodajNierDlaTrans('.$id_trans_rodzaj.');';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);

            return $wynik;
        }
        
        public function RegionNazwa ($id_region, &$ilosc_wierszy)
        {
            $zapytanie = 'select * from NazwaRegion('.$id_region.');';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            
            return $wynik;
        }
        
        public function RodzajBudynek ($tabParametr, &$ilosc_wierszy)
        {
            $zapytanie = 'select * from RodzajBudynek('.$tabParametr[StronaPodsInfoDAL::$id_rodz_nier_szcz].');';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            
            return $wynik;
        }
        
        public function OfertaSkrocona($tabParametr, &$ilosc_wierszy)
        {
            $zapytanie = 'select * from PodstawoweWersjeOfert('.$tabParametr[StronaPodsInfoDAL::$id_nier_rodzaj].', '.$tabParametr[StronaPodsInfoDAL::$id_trans_rodzaj].');';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            UtilsDAL::KorektaKolBool($wynik, array(StronaPodsInfoDAL::$wylacznosc, StronaPodsInfoDAL::$klucz));
            UtilsDAL::TabPg2TabPhp($wynik, array(StronaPodsInfoDAL::$parametr_nazwa, StronaPodsInfoDAL::$parametr_wartosc, StronaPodsInfoDAL::$wyposazenie));
            
            return $wynik;
        }
        public function OfertaSkroconaPojGablota($tabParametr, &$ilosc_wierszy)
        {
            ///zrobic nowa procedure dla tego
            $zapytanie = 'select * from PodajOfertaGablota('.$tabParametr[NieruchomoscDAL::$id_oferta].');';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            UtilsDAL::KorektaKolBool($wynik, array(StronaPodsInfoDAL::$wylacznosc, ExportDAL::$rynek));
            //UtilsDAL::TabPg2TabPhp($wynik, array(StronaPodsInfoDAL::$parametr_nazwa, StronaPodsInfoDAL::$parametr_wartosc, StronaPodsInfoDAL::$wyposazenie));
            
            return $wynik;
        }
        
        public function FiltracjaOfertaSkrocona ($tabParametr, &$ilosc_wierszy)
        {
            $pow_min = 'null';
            $l_pok_min = 'null';
            $pow_max = 'null';
            $l_pok_max = 'null';
            $reg_geog = 1;
            if (strlen($tabParametr[StronaPodsInfoDAL::$pow_min]) > 0)
            {
                $pow_min = $tabParametr[StronaPodsInfoDAL::$pow_min];
            }
            if (strlen($tabParametr[StronaPodsInfoDAL::$pow_max]) > 0)
            {
                $pow_max = $tabParametr[StronaPodsInfoDAL::$pow_max];
            }
            if (strlen($tabParametr[StronaPodsInfoDAL::$l_pok_min]) > 0)
            {
                $l_pok_min = $tabParametr[StronaPodsInfoDAL::$l_pok_min];
            }
            if (strlen($tabParametr[StronaPodsInfoDAL::$l_pok_max]) > 0)
            {
                $l_pok_max = $tabParametr[StronaPodsInfoDAL::$l_pok_max];
            }
            if ($tabParametr[StronaPodsInfoDAL::$id_region_geog] != 1)
            {
                $reg_geog = $tabParametr[StronaPodsInfoDAL::$id_region_geog];
            }
            $zapytanie = 'select * from FiltracjaPodstawoweWersjeOfert('.$tabParametr[StronaPodsInfoDAL::$id_nier_rodzaj].', '.$tabParametr[StronaPodsInfoDAL::$id_trans_rodzaj].', 
            '.$pow_min.', '.$pow_max.', \''.$tabParametr[StronaPodsInfoDAL::$cena_max].'\', '.$l_pok_min.', '.$l_pok_max.', '.$reg_geog.', '.$tabParametr[NieruchomoscDAL::$id_jezyk].', \''.
            $tabParametr[NieruchomoscDAL::$adres].'\');';
            //echo $zapytanie;
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            UtilsDAL::KorektaKolBool($wynik, array(StronaPodsInfoDAL::$wylacznosc, StronaPodsInfoDAL::$klucz));
            UtilsDAL::TabPg2TabPhp($wynik, array(StronaPodsInfoDAL::$parametr_nazwa, StronaPodsInfoDAL::$parametr_wartosc, StronaPodsInfoDAL::$wyposazenie));
            
            return $wynik;
        }
        
        public function OfertaSkroconaPoId($tabParametr)
        {
            $zapytanie = 'select * from PodstawowaWersjaOferta('.$tabParametr[StronaPodsInfoDAL::$id_oferta].', '.$tabParametr[StronaPodsInfoDAL::$id_nier_rodzaj].', '.$tabParametr[StronaPodsInfoDAL::$id_trans_rodzaj].');';
            //echo $zapytanie;
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            UtilsDAL::KorektaKolBool($wynik, array(StronaPodsInfoDAL::$wylacznosc, StronaPodsInfoDAL::$klucz));
            UtilsDAL::TabPg2TabPhp($wynik, array(StronaPodsInfoDAL::$parametr_nazwa, StronaPodsInfoDAL::$parametr_wartosc, StronaPodsInfoDAL::$wyposazenie));
            
            return $wynik;
        }
        
        public function PodajNowosci()
        {
            $zapytanie = 'select * from OfertyNowosci();';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            UtilsDAL::KorektaKolBool($wynik, array(StronaPodsInfoDAL::$wylacznosc));
            
            return $wynik;
        }
        public function PodajTransIdNierIdOferta($id_oferta)
        {
            $zapytanie = 'select * from PodajTransIdNierIdOferta('.$id_oferta.');';
            $wynik = $this->dal->PobierzDane($zapytanie, $iloscWierszy);
            
            return $wynik;
        }
        public function PodajTransIdNierIdOfertaAkt($id_oferta)
        {
            $zapytanie = 'select * from PodajTransIdNierIdOfertaAkt('.$id_oferta.');';
            $wynik = $this->dal->PobierzDane($zapytanie, $iloscWierszy);
            
            return $wynik;
        }
        public function OfertaWyswietl($id_oferta)
        {
            $zapytanie = "select OfertaWyswietl(".$id_oferta.");";
            $wynik = $this->dal->OperacjaLogiczna($zapytanie);
            
            return $wynik;
        }
        public function DodajOdwiedziny($tabParametr)
        {
            $zapytanie = 'select DodajOdwiedziny(\''.$tabParametr[NieruchomoscDAL::$adres].'\', '.$tabParametr[NieruchomoscDAL::$id_jezyk].', \''.$tabParametr[StronaPodsInfoDAL::$referer].'\', \''.
            $tabParametr[StronaPodsInfoDAL::$przegladarka].'\', \''.$tabParametr[StronaPodsInfoDAL::$url_azg].'\', \''.$tabParametr[StronaPodsInfoDAL::$request_time].'\', \''.
            $tabParametr[StronaPodsInfoDAL::$request_method].'\');';
            //echo $zapytanie;
            $wynik = $this->dal->OperacjaLogiczna($zapytanie);
            
            return $wynik;    
        }
    }
    class StronaOfertaDAL
    {
        public static $oferta = 'oferta';
        public static $id_oferta = 'id_oferta';
        public static $id_nieruchomosc = 'id_nieruchomosc';
        public static $id = 'id';
        public static $agent = 'agent';
        public static $cena = 'cena';
        public static $cena_pop = 'cena_pop';
        public static $nazwa = 'nazwa';
        public static $opis = 'opis';
        public static $wartosc = 'wartosc';
        public static $id_jezyk = 'id_jezyk';
        public static $email = 'email';
        public static $nr_pomieszczenie = 'nr_pomieszczenie';
        public static $zdjecie = 'zdjecie';
        public static $film = 'film';
        public static $id_trans_rodzaj = 'id_trans_rodzaj';
        public static $id_nier_rodzaj = 'id_nier_rodzaj';
        public static $nieruchomosc_rodzaj = 'nieruchomosc_rodzaj';
        public static $transakcja_rodzaj = 'transakcja_rodzaj';
        public static $id_status = 'id_status';
        public static $status = 'status';
        public static $posrednik = 'posrednik';
        public static $telefon = 'telefon';
        public static $parametry = 'parametry';
        public static $parametr_nazwa = 'parametr_nazwa';
        public static $parametr_wartosc = 'parametr_wartosc';
        public static $wyposazenie = 'wyposazenie';
        public static $wyposazenia = 'wyposazenia';
        public static $lokalizacja = 'lokalizacja';
        public static $wylacznosc = 'wylacznosc';
        public static $klucz = 'klucz';
        public static $ilosc_pokoi = 'ilosc_pokoi';
        public static $id_rodz_nier_szcz = 'id_rodz_nier_szcz';
        public static $id_region_geog = 'id_region_geog';
        public static $wojewodztwo = 'wojewodztwo';
        public static $powiat = 'powiat';
        public static $czas_przekazania = 'czas_przekazania';
        public static $powierzchnia_uzytkowa = '_powierzchnia_uzytkowa';//?? - ok
        public static $rodzaj_budynek = 'rodzaj_budynek';//?? - ok
        public static $rynek_pierw = 'rynek_pierw';//?? - ok
        
        protected $dal;
        
        
        public function StronaOfertaDAL()
        {
            $this->dal = new dal();
        }
        
        public function OfertaPelnaWersja($id_oferta, $id_jezyk)
        {
            $zapytanie = 'select * from OfertaPelnaWersja('.$id_oferta.', '.$id_jezyk.');';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            UtilsDAL::KorektaKolBool($wynik, array(StronaOfertaDAL::$wylacznosc, StronaOfertaDAL::$rynek_pierw, StronaOfertaDAL::$klucz));
            UtilsDAL::TabPg2TabPhp($wynik, array(StronaOfertaDAL::$zdjecie, StronaOfertaDAL::$film));
            
            return $wynik;
        }
        
        public function OfertaInfoSekcje($tabParametr, $wyb_sekcja = null)
        {
            if ($wyb_sekcja == null)
            {
                $zapytanie = 'select * from OfertaInfoSekcje('.$tabParametr[StronaOfertaDAL::$id_nieruchomosc].', '.$tabParametr[StronaOfertaDAL::$id_nier_rodzaj].', '.$tabParametr[StronaOfertaDAL::$id_trans_rodzaj].');';
            }
            else
            {
                $zapytanie = 'select * from OfertaInfoSekcje('.$tabParametr[StronaOfertaDAL::$id_nieruchomosc].', '.$tabParametr[StronaOfertaDAL::$id_nier_rodzaj].', '.$tabParametr[StronaOfertaDAL::$id_trans_rodzaj].') where id_sekcja = '.$wyb_sekcja.';';
            }
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            UtilsDAL::TabPg2TabPhp($wynik, array(StronaOfertaDAL::$parametry, StronaOfertaDAL::$wyposazenia));
            
            return $wynik;
        }
        public function PodajIdNierOfId($id_oferta)
        {
            $zapytanie = 'select podajidnierofid as '.NieruchomoscDAL::$id_nieruchomosc.' from PodajIdNierOfId('.$id_oferta.');';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            
            return $wynik;
        }
        public function OfertyPodobne($id_oferta, &$ilosc_wierszy)
        {
            $zapytanie = 'select * from OfertyPodobne ('.$id_oferta.');';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            
            return $wynik;
        }
        public function PodajZdjeciaNieruchomosc($id_nieruchomosc)
        {
            $zapytanie = 'select * from PodajZdjeciaNieruchomosc('.$id_nieruchomosc.');';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            
            return $wynik;
        }
        public function OfertaPomieszczenia($tabParametr)
        {
            $zapytanie = 'select * from OfertaPomieszczenia('.$tabParametr[StronaOfertaDAL::$id_nieruchomosc].', '.$tabParametr[StronaOfertaDAL::$id_nier_rodzaj].');';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            UtilsDAL::TabPg2TabPhp($wynik, array(StronaOfertaDAL::$parametry, StronaOfertaDAL::$wyposazenia));
            
            return $wynik;
        }
        
        public function OfertaOpisy($id_oferta)
        {
            $zapytanie = 'select * from OfertaOpisy('.$id_oferta.');';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
                        
            return $wynik;
        }
        public function AgentWersjaOficjalna($id_agent, $jezyk)
        {
            $zapytanie = 'select * from AgentWersjaOficjalna('.$jezyk.') where id = '.$id_agent.';';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
                        
            return $wynik;
        }
        public function OfertySubskrypcja()
        {
            $zapytanie = 'select * from OfertySubskrypcja();';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            UtilsDAL::TabPg2TabPhp($wynik, array(StronaPodsInfoDAL::$email, StronaPodsInfoDAL::$id_jezyk));
            
            return $wynik;
        }
        public function OfertyZlecenieSubskrypcja()
        {
            $zapytanie = 'select * from OfertyZlecenieSubskrypcja();';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            //UtilsDAL::TabPg2TabPhp($wynik, array(StronaPodsInfoDAL::$email, StronaPodsInfoDAL::$id_jezyk));
            
            return $wynik;
        }
        public function OfertyListaWskazanSubskrypcja()
        {
            $zapytanie = 'select * from OfertyListaWskazanSubskrypcja();';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            //UtilsDAL::TabPg2TabPhp($wynik, array(StronaPodsInfoDAL::$email, StronaPodsInfoDAL::$id_jezyk));
            
            return $wynik;
        }
        public function PodajIdJezyki()
        {
            $zapytanie = 'select PodajJezykiId as id_jezyk from PodajJezykiId();';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            
            return $wynik;
        }
        //OfertaOdwiedziny
        public function OfertaOdwiedziny($tabParametr)
        {
            $zapytanie = 'select OfertaOdwiedziny(\''.$tabParametr[NieruchomoscDAL::$adres].'\', '.$tabParametr[NieruchomoscDAL::$id_oferta].', \''.$tabParametr[StronaPodsInfoDAL::$referer].'\');';
            //echo $zapytanie;
            $wynik = $this->dal->OperacjaLogiczna($zapytanie);
            
            return $wynik;    
        }
    }
    
    class StronaSubskrypcjaDAL
    {
        public static $id_trans_rodzaj = 'id_trans_rodzaj';
        public static $id_nier_rodzaj = 'id_nier_rodzaj';
        public static $cena_min = 'cena_min';
        public static $cena_max = 'cena_max';
        public static $email = 'email';
        public static $id_jezyk = 'id_jezyk';
        
        protected $dal;
        
        public function StronaSubskrypcjaDAL()
        {
            $this->dal = new dal();
        }
        
        public function DodajSubskrypcja($tabParametr)
        {
            $zapytanie = 'select * from DodajSubskrypcja ('.$tabParametr[StronaSubskrypcjaDAL::$id_nier_rodzaj].', '.$tabParametr[StronaSubskrypcjaDAL::$id_trans_rodzaj].', '.
            $tabParametr[StronaSubskrypcjaDAL::$cena_min].', '.$tabParametr[StronaSubskrypcjaDAL::$cena_max].', \''.$tabParametr[StronaSubskrypcjaDAL::$email].'\', '.$tabParametr[StronaSubskrypcjaDAL::$id_jezyk].');';
            $wynik = $this->dal->WprowadzanieDanych($zapytanie, false);
            
            return $wynik;
        }
        
        public function UsunSubskrypcja($tabParametr)
        {
            $zapytanie = 'select * from UsunSubskrypcja ('.$tabParametr[StronaSubskrypcjaDAL::$id_nier_rodzaj].', '.$tabParametr[StronaSubskrypcjaDAL::$id_trans_rodzaj].', \''.
            $tabParametr[StronaSubskrypcjaDAL::$email].'\');';
            $wynik = $this->dal->WprowadzanieDanych($zapytanie, false);
            
            return $wynik;
        }
    }
?>