<?php
    $path = str_replace($_SERVER['PHP_SELF'], '', $_SERVER['SCRIPT_FILENAME']).'/';
    
    include_once ($path.'dal/stronaDAL.php'); 
    include_once ($path.'bll/utilsbll.php'); 
    include_once ($path.'bll/cache.php');
    
    class OfertySpecjalne
    {
        //tablica obiektow typu wybraneoferty
        protected $oferty = array();
        //plikofert, idea jest zeby byly 2 wiec mogloby byc odgornie zabite
        protected $zasob;
        
        public function OfertySpecjalne($nazwa_plik)
        {
            $this->zasob = $nazwa_plik;
            //odczyt z cache
            $dane = cacheStrona::CzytajOfertaSpecjalna($this->zasob);
            if ($dane != null)
            {
                $this->oferty = $dane;
            }
        }
        
        public function DodajOferta($id_oferta, $id_transakcja, $id_nieruchomosc)
        {
            $oferta = array();
            
            $oferta[StronaOfertaDAL::$id_oferta] = $id_oferta;
            $oferta[StronaOfertaDAL::$id_nier_rodzaj] = $id_nieruchomosc;
            $oferta[StronaOfertaDAL::$id_trans_rodzaj] = $id_transakcja;
            
            $this->oferty[$id_oferta] = $oferta;
            //po dodaniu zapis do cache
            cacheStrona::ZapiszOfertaSpecjalna($this->oferty, $this->zasob);
        }
        
        public function PodajOferty()
        {
            return $this->oferty;
        }
        
        public function UsunOferta($id_oferta)
        {
            unset($this->oferty[$id_oferta]);
            //po usunieciu zapis do cache
            cacheStrona::ZapiszOfertaSpecjalna($this->oferty, $this->zasob);
        }
        
    }
    
    class OfertaPodsBLL
    {
        public $utworzono; ///sekundy od 1970 roku
        //jakas kolekcja lub tablica tablic ofert poagregowanych
        protected $tabOfert; //tablica opole - reszta lub  na 2 poziomie agregacji to co agreguje
        protected $regiony;
        protected $rodzajeBudynek;
        
        //idea jest nastepujaca: kazda kolejna oferta jest dodawana do tablicy tablic ze wzgledu na jej atrybut agregujacy - na nizszym poziomie ilosc pokoi lub rodzaj budynku, 
        //na wyzszym id miejscowosci. obiekt tego samego typu bedzie dodawany do obiektu nadrzednego w tablicy
        public function DodajOferta($inf_agr, $inf_agr_l, $oferta)
        {
            $this->tabOfert[$inf_agr][$inf_agr_l][$oferta[StronaPodsInfoDAL::$id_oferta]] = $oferta;
        }
        
        public function DodajRegiony($regiony)
        {
            $this->regiony = $regiony;
        }
        
        public function DodajRodzajeBudynek($rodzajeBudynek)
        {
            $this->rodzajeBudynek = $rodzajeBudynek;
        }
        
        public function PodajRegiony()
        {
            return $this->regiony;
        }
        
        public function PodajRodzajeBudynek()
        {
            return $this->rodzajeBudynek;
        }
        
        public function PodajOferty()
        {
            return $this->tabOfert;
        }
    }
    
    class OfertaPelnaBLL
    {
        public $utworzono; ///sekundy od 1970 roku
        //jakas kolekcja lub tablica tablic ofert poagregowanych
        
        protected $id_oferta;
        
        protected $oferta;
        protected $sekcje;
        protected $pomieszczenia;
        
        public function DodajOferta($oferta, $sekcje, $pomieszczenia)
        {
            $this->id_oferta = $oferta[0][StronaOfertaDAL::$id_oferta];
            $this->oferta = $oferta;
            $this->pomieszczenia = $pomieszczenia;
            $this->sekcje = $sekcje;
        }
        
        public function PodajOferta(&$sekcje = null, &$pomieszczenia = null)
        {
            $sekcje = $this->sekcje;
            $pomieszczenia = $this->pomieszczenia;
            
            return $this->oferta;
        }
    }
    
    class StronaPodsInfoBLL
    {  
        //protected $ofertaElNizszy; //niski poziom agregacji
        
        protected $ofertaPods; //typ OfertaPodsACD, obiekt z kolekcja poagregowana lokalizacjami, //wysoki poziom agregacji
        protected $dal;
        protected $krok_cache = 120;
        protected $czas_powolania; //ilosc sekund od 1970 roku
        protected $regiony_geog;
        protected $rodzaj_budynek;
        
        protected $opole = 574;
        
        protected $filtrowanie = null;
        
        public function StronaPodsInfoBLL($tabFiltr = null)
        {
            $this->dal = new StronaPodsInfoDAL();
            $this->czas_powolania = Utils::IloscSekund(date('Y'), date('m'), date('d'), date('G'), date('i'), date('s')); //czas, kiedy nastapil request osoby
            
            $this->filtrowanie = $tabFiltr;
        }
        
        public function RodzajOferta($id_trans_rodzaj, $id_nier_rodzaj)
        {
            $wynik = $this->dal->RodzajOferta($id_trans_rodzaj, $id_nier_rodzaj);
            return $wynik;
        }
        
        public function PodajOferty($id_trans_rodzaj, $id_nier_rodzaj)
        {
            if ($this->filtrowanie == null) //troszke nadrobione i przekombinowane ale dziala
            {
                //tu dorobic odczyt z cache tego co istnieje jesli istnieje
                $this->ofertaPods = cacheStrona::Czytaj($id_trans_rodzaj, $id_nier_rodzaj);
                if ($this->ofertaPods == null)
                {
                    //utworzyc obiekt i zapiszac
                    $this->PobierzOferty($id_trans_rodzaj, $id_nier_rodzaj);
                }
                else
                {       //jesli aktualny request jest wczesniej niz utworzono obiekt; czas utworzenia + n sekund jest mniejszy niz czas requesta - flaszujemy cache
                    if (($this->ofertaPods->utworzono > $this->czas_powolania) || ($this->ofertaPods->utworzono + $this->krok_cache < $this->czas_powolania))
                    {
                        //utworz obiekt i zapisz
                        $this->PobierzOferty($id_trans_rodzaj, $id_nier_rodzaj);
                    }
                    //else jest zbedny, obiekt zostaje jak po odczycie
                }
                //tu zwracamy oferta pods lub cos tedy :)
                if ($this->ofertaPods != null)
                {
                    return $this->ofertaPods->PodajOferty();
                }
                else
                {
                    return null;
                }
            }
            else
            {
                $this->PobierzOferty($id_trans_rodzaj, $id_nier_rodzaj);
                if ($this->ofertaPods != null)
                {
                    return $this->ofertaPods->PodajOferty();
                }
                else
                {
                    return null;
                }
            }
        }
        
        public function PodajRegiony()
        {
            return $this->ofertaPods->PodajRegiony();
        }
        
        public function PodajRodzajeBudynek()
        {
            return $this->ofertaPods->PodajRodzajeBudynek();
        }
        
        protected function PobierzOferty($id_trans_rodzaj, $id_nier_rodzaj)
        {
            $tabParametr[StronaPodsInfoDAL::$id_nier_rodzaj] = $id_nier_rodzaj;
            $tabParametr[StronaPodsInfoDAL::$id_trans_rodzaj] = $id_trans_rodzaj;
            
            if ($this->filtrowanie != null)
            {
                //czemu to jest przepisywane zamiast to od razu podac :> ??
                $tabParametr[StronaPodsInfoDAL::$pow_min] = $this->filtrowanie[StronaPodsInfoDAL::$pow_min];
                $tabParametr[StronaPodsInfoDAL::$l_pok_min] = $this->filtrowanie[StronaPodsInfoDAL::$l_pok_min];
                $tabParametr[StronaPodsInfoDAL::$pow_max] = $this->filtrowanie[StronaPodsInfoDAL::$pow_max];
                $tabParametr[StronaPodsInfoDAL::$l_pok_max] = $this->filtrowanie[StronaPodsInfoDAL::$l_pok_max];
                $tabParametr[StronaPodsInfoDAL::$cena_max] = $this->filtrowanie[StronaPodsInfoDAL::$cena_max];
                $tabParametr[StronaPodsInfoDAL::$id_region_geog] = $this->filtrowanie[StronaPodsInfoDAL::$id_region_geog];
                $tabParametr[NieruchomoscDAL::$id_jezyk] = $this->filtrowanie[NieruchomoscDAL::$id_jezyk];
                $tabParametr[NieruchomoscDAL::$adres] = $this->filtrowanie[NieruchomoscDAL::$adres];
                
                $wynik = $this->dal->FiltracjaOfertaSkrocona($tabParametr, $ilosc_wierszy);
            }
            else
            {
                $wynik = $this->dal->OfertaSkrocona($tabParametr, $ilosc_wierszy);
            }
            
            if ($ilosc_wierszy > 0)
            {
                $this->ofertaPods = new OfertaPodsBLL();
                $this->ofertaPods->utworzono = $this->czas_powolania;
                
                foreach ($wynik as $wiersz)
                {
                    $dodano = false;
                    //if ($wiersz[StronaPodsInfoDAL::$id_rodz_nier_szcz] != null)
                    if ($id_nier_rodzaj != 2) //mieszkania sa agregowane pokojami nie rodzajem budynku
                    {
                        $dodano = $wiersz[StronaPodsInfoDAL::$id_rodz_nier_szcz];
                        $this->rodzaj_budynek[$wiersz[StronaPodsInfoDAL::$id_rodz_nier_szcz]] = $wiersz[StronaPodsInfoDAL::$id_rodz_nier_szcz];
                    }
                    else
                    {
                        if ($wiersz[StronaPodsInfoDAL::$ilosc_pokoi] != null)
                        {
                            $dodano = $wiersz[StronaPodsInfoDAL::$ilosc_pokoi];
                        }
                    }
                    if ($dodano)
                    {
                        $this->ofertaPods->DodajOferta($wiersz[StronaPodsInfoDAL::$id_region_geog], $dodano, $wiersz);
                        $this->regiony_geog[$wiersz[StronaPodsInfoDAL::$id_region_geog]] = $wiersz[StronaPodsInfoDAL::$id_region_geog];
                    }
                }
                //pobrac rodzaje budynku i regiony przed zapisem do cache
                if (is_array($this->regiony_geog))
                {
                    foreach ($this->regiony_geog as $klucz => $wartosc)
                    {
                        $wynik = $this->dal->RegionNazwa($wartosc, $ilosc_wierszy);
                        //tu powinien byc if - sprawdzajacy czy element istnieje ??
                        $this->regiony_geog[$klucz] = $wynik[0][StronaPodsInfoDAL::$nazwa];
                    }
                    //tu pobabrac regiony - ustawic od opola
                    if (isset($this->regiony_geog[$this->opole]))
                    {
                        //tablica tymczasowa do przepisania regionow
                        $reg_tym[$this->opole] = $this->regiony_geog[$this->opole];
                        
                        unset($this->regiony_geog[$this->opole]);
                        
                        foreach ($this->regiony_geog as $klucz => $wartosc)
                        {
                            $reg_tym[$klucz] = $wartosc;
                        }
                        
                        $this->regiony_geog = $reg_tym;
                    }
                    $this->ofertaPods->DodajRegiony($this->regiony_geog);
                }
                if (is_array($this->rodzaj_budynek))
                {
                    foreach ($this->rodzaj_budynek as $klucz => $wartosc)
                    {
                        $wynik = $this->dal->RodzajBudynek(array(StronaPodsInfoDAL::$id_rodz_nier_szcz => $wartosc), $ilosc_wierszy);
                        //tu powinien byc if
                        $this->rodzaj_budynek[$klucz] = $wynik[0][StronaPodsInfoDAL::$nazwa];
                    }
                    $this->ofertaPods->DodajRodzajeBudynek($this->rodzaj_budynek);
                }
                if ($this->filtrowanie == null)
                {
                    //oferta gotowa, zserializowac do cache
                    cacheStrona::Zapisz($this->ofertaPods, $id_trans_rodzaj, $id_nier_rodzaj);
                }
            }
            //pomyslec czy jakis else :)
        }
    }
    class StronaOfertaBLL
    {
        protected $oferta; //OfertaPelnaBLL
        protected $dal;
        protected $czas_powolania;
        protected $krok_cache = 120;
        
        public function StronaOfertaBLL()
        {
            $this->dal = new StronaOfertaDAL();
            $this->czas_powolania = Utils::IloscSekund(date('Y'), date('m'), date('d'), date('G'), date('i'), date('s')); //czas, kiedy nastapil request osoby
        }
        
        public function PodajOferta($id_oferta, $id_trans_rodzaj, $id_nier_rodzaj, $id_jezyk, &$sekcje, &$pomieszczenia)
        {
            //tu dorobic odczyt z cache tego co istnieje jesli istnieje
            $this->oferta = cacheStrona::CzytajOferta($id_oferta);
            if ($this->oferta == null)
            {
                //utworzyc obiekt i zapiszac
                $this->PobierzOferta($id_oferta, $id_trans_rodzaj, $id_nier_rodzaj, $id_jezyk);
            }
            else
            {       //jesli aktualny request jest wczesniej niz utworzono obiekt; czas utworzenia + n sekund jest mniejszy niz czas requesta - flaszujemy cache
                if (($this->oferta->utworzono > $this->czas_powolania) || ($this->oferta->utworzono + $this->krok_cache < $this->czas_powolania))
                {
                    //utworz obiekt i zapisz
                    $this->PobierzOferta($id_oferta, $id_trans_rodzaj, $id_nier_rodzaj, $id_jezyk);
                }
                //else jest zbedny, obiekt zostaje jak po odczycie
            }
            //tu zwracamy oferta pods lub cos tedy :)
            if ($this->oferta != null)
            {
                return $this->oferta->PodajOferta($sekcje, $pomieszczenia);
            }
            else
            {
                return null;
            }
        }
        protected function PobierzOferta($id_oferta, $id_trans_rodzaj, $id_nier_rodzaj, $id_jezyk)
        {
            $tabParametr[StronaOfertaDAL::$id_nier_rodzaj] = $id_nier_rodzaj;
            $tabParametr[StronaOfertaDAL::$id_trans_rodzaj] = $id_trans_rodzaj;
            
            $wynik = $this->dal->OfertaPelnaWersja($id_oferta, $id_jezyk);
            
            //pobranie opisow i przetworzenie ich
            $opisy = $this->dal->OfertaOpisy($id_oferta);
            
            $tabOpis = array();
            
            if (is_array($opisy))
            foreach ($opisy as $opis)
            {
                $tabOpis[$opis[StronaOfertaDAL::$id_jezyk]] = $opis[StronaOfertaDAL::$wartosc];
            }
            
            //zapisanie przetworzonych opisow do oferty
            $wynik[0][StronaOfertaDAL::$opis] = $tabOpis;
            
            $tabParametr[StronaOfertaDAL::$id_nieruchomosc] = $wynik[0][StronaOfertaDAL::$id_nieruchomosc];
            
            $sekcje = $this->dal->OfertaInfoSekcje($tabParametr);
            $pomieszczenia = $this->dal->OfertaPomieszczenia($tabParametr);
            
            $this->oferta = new OfertaPelnaBLL();
            $this->oferta->utworzono = $this->czas_powolania;           
            
            $this->oferta->DodajOferta($wynik, $sekcje, $pomieszczenia);
                
                //oferta gotowa, zserializowac do cache
            cacheStrona::ZapiszOferta($this->oferta, $id_oferta);
            //pomyslec czy jakis else :)
        }
    }
?>