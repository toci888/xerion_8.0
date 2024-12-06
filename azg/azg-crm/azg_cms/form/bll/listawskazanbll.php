<?php
    $path = str_replace($_SERVER['PHP_SELF'], '', $_SERVER['SCRIPT_FILENAME']).'/';
    include_once ($path.'dal/queriesDAL.php');
    
    /*
    idea jest nastepujaca: przygotowanie listy wskazan dla zapotrzebowania sklada sie z okreslenia ofert dla zapotrzebowania, 
    w obrebie zapotrzebowania automatycznie jest okreslany klient, do niego nalezy dokomponowac liste osob, ktore sie udaja na ogladanie ltd
    poniwaz osob moze byc sporo wparzamy to do kolekcji typu osobalistawskACD. oferta ma to do siebie, ze moze ich byc dowolnie duzo, stad kolekcja ofert
    poszczegolne oferty maja id, id klienta, adres, cene, opis, date jako pojedyncze informacje; wlascicieli moze byc wiele, wyminiamy szystkich, jesli 
    nieruchomosc oferuje ktos inny niz wlasciciel tez to pokazujemy
    */
    class OsobaListaWskACD
    {
        public $id_osoba;
        protected $nazwisko;
        protected $imie;
        protected $pesel;
        protected $telefon;
        protected $komorka;
        
        public function PodajOsoba()
        {
            $tablica = array();
            $tablica[ListaWskazanDAL::$id_osoba] = $this->id_osoba;
            //$tablica[ListaWskazanDAL::$imie] = $this->imie;
            $tablica[ListaWskazanDAL::$nazwisko] = $this->imie.' '.$this->nazwisko;
            $tablica[ListaWskazanDAL::$pesel] = $this->pesel;
            $tablica[ListaWskazanDAL::$telefon] = $this->telefon;
            $tablica[OsobaDAL::$komorka] = $this->komorka;
            
            return $tablica;
        }
        public function WprowadzOsoba($tabElement)
        {
            $this->id_osoba = $tabElement[ListaWskazanDAL::$id_osoba];
            $this->nazwisko = $tabElement[ListaWskazanDAL::$nazwisko];
            $this->imie = $tabElement[ListaWskazanDAL::$imie];
            $this->pesel = $tabElement[ListaWskazanDAL::$pesel];
            if (isset($tabElement[ListaWskazanDAL::$telefon]))
            {
                $this->telefon = $tabElement[ListaWskazanDAL::$telefon];
            }
            if (isset($tabElement[OsobaDAL::$komorka]))
            {
                $this->komorka = $tabElement[OsobaDAL::$komorka];
            }
        }
    }
    class OsobyPokazujace
    {
        public $id_oferta; //pytanie czy zostanie uzyte :P
        protected $osoby_kol;
        protected $osoby_db_res;
        protected $osoba_el;
        
        public function OsobyPokazujace($osoby_res)
        {
            $this->osoby_db_res = $osoby_res;
        }
        
        public function DodajOsoba($id_osoba)
        {
            foreach ($this->osoby_db_res as $wiersz)
            {
                if ($wiersz[OsobaDAL::$id_osoba] == $id_osoba)
                {
                    $this->osoba_el = new OsobaListaWskACD();
                    $this->osoba_el->WprowadzOsoba($wiersz);
                    $this->osoby_kol[$id_osoba] = $this->osoba_el;
                }
            }
        }
        public function UsunOsoba($id_osoba)
        {
            unset($this->osoby_kol[$id_osoba]);
        }
        public function PodajOsoby(&$ilosc_wierszy)
        {
            $i = 0;
            $tab = array();
            if (is_array($this->osoby_kol))
            foreach ($this->osoby_kol as $osoba_el)
            {
                //$osoba_el->id_osoba
                $tab[$i] = $osoba_el->PodajOsoba();
                $i++;
            }
            
            $ilosc_wierszy = $i;
            return $tab;
        }
    }
    class OfertaListaWskACD
    {
        public $id_oferta;
        protected $id_klient;
        public $id_spotkanie;
        protected $adres;
        protected $cena;
        protected $opis;
        protected $data;
        protected $godzina;
        protected $id_godzina;
        protected $id_minuta;
        protected $wlasciciel_kol; //typ OsobaListaWskACD[] 
        protected $oferent_kol; //typ OsobaListaWskACD[]
        
        public function PodajOferta()
        {
            $tablica = array();
            $tablica[NieruchomoscDAL::$id_oferta] = $this->id_oferta;
            $tablica[NieruchomoscDAL::$id_klient] = $this->id_klient;
            $tablica[NieruchomoscDAL::$id_spotkanie] = $this->id_spotkanie;
            $tablica[NieruchomoscDAL::$ulica] = $this->adres;
            $tablica[NieruchomoscDAL::$cena] = $this->cena;
            $tablica[NieruchomoscDAL::$opis] = $this->opis;
            $tablica[NieruchomoscDAL::$data] = $this->data;
            $tablica[NieruchomoscDAL::$id_godzina] = $this->id_godzina;
            $tablica[NieruchomoscDAL::$id_minuta] = $this->id_minuta;
            $tablica[NieruchomoscDAL::$godzina] = $this->godzina;
            
            if (is_array($this->wlasciciel_kol))
            foreach ($this->wlasciciel_kol as $wlasciciel)
            {
                $tablica[NieruchomoscDAL::$wlasciciel][$wlasciciel->id_osoba] = $wlasciciel->PodajOsoba();
            }
            if (is_array($this->oferent_kol))
            foreach ($this->oferent_kol as $oferent)
            {
                $tablica[NieruchomoscDAL::$oferent][$oferent->id_osoba] = $oferent->PodajOsoba();
            }
            
            return $tablica;
        }
        
        public function WprowadzOferta($tabElement)
        {
            $this->id_oferta = $tabElement[NieruchomoscDAL::$id_oferta];
            $this->id_klient = $tabElement[NieruchomoscDAL::$id_klient];
            $this->id_spotkanie = $tabElement[NieruchomoscDAL::$id_spotkanie];
            $this->adres = $tabElement[NieruchomoscDAL::$adres];
            $this->cena = $tabElement[NieruchomoscDAL::$cena];
            $this->opis = $tabElement[NieruchomoscDAL::$opis];
            $this->data = $tabElement[NieruchomoscDAL::$data];
            $this->id_godzina = $tabElement[NieruchomoscDAL::$id_godzina];
            $this->id_minuta = $tabElement[NieruchomoscDAL::$id_minuta];
            $this->godzina = $tabElement[NieruchomoscDAL::$godzina];
            
            if (is_array($tabElement[ListaWskazanDAL::$wlasciciel]))
            {
                $this->DodajWlasciciel($tabElement[ListaWskazanDAL::$wlasciciel]);
            }
            if (is_array($tabElement[ListaWskazanDAL::$oferent]))
            {
                $this->DodajOferent($tabElement[ListaWskazanDAL::$oferent]);
            }
        }
        //jesli juz to protected na uzytek wewnetrzny
        ///metody dodajace wlascicieli i oferentow
        protected function DodajWlasciciel($tabWlasciciel)
        {
            foreach ($tabWlasciciel as $tabwl)
            {
                //idea tych unsetow jest zeby telefonow nie pokazywac na liscie wskazan bo to moze nastreczyc bigosu, stad sa one tu zapominane
                unset($tabwl[0][OsobaDAL::$telefon]);
                unset($tabwl[0][OsobaDAL::$komorka]);
                //ewentualnie u wlascicela i oferenta usetowac pesela :P
                
                $wlasciciel = new OsobaListaWskACD();
                $wlasciciel->WprowadzOsoba($tabwl[0]);
                $this->wlasciciel_kol[$wlasciciel->id_osoba] = $wlasciciel;
            }
        }
        /*public function UsunWlasciciel($id_osoba)
        {
            unset($this->wlasciciel_kol[$id_osoba]);
        } */
        
        protected function DodajOferent($tabOferent)
        {
            foreach ($tabOferent as $tabof)
            {
                unset($tabof[0][OsobaDAL::$telefon]);
                unset($tabof[0][OsobaDAL::$komorka]);
                
                $oferent = new OsobaListaWskACD();
                $oferent->WprowadzOsoba($tabof[0]);
                $this->oferent_kol[$oferent->id_osoba] = $oferent;
            }
        }
        /*public function UsunOferent($id_osoba)
        {
            unset($this->oferent_kol[$id_osoba]);
        }  */
    }
    class ListaWskACD
    {
        //zapotrzebowanie, w ramach ktorego bedzie ogladane
        public $id_zapotrzebowanie;
        //numerek klienta tego zapotrzebowania
        //public $id_klient;
        //id agenta robiacego ta liste
        public $id_agent;
        
        //osoby sposrod pakietu klienta ogladajace lub po prostu wedrujace na liste
        public $osoba_kol; //OsobaListaWskACD[]
        //tablica wybranych osob w postaci id dla dodawania w dal
        protected $osoba_tab;
        //kolekcja ofert przewidzianych do ogladania
        public $oferta_kol; //OfertaListaWskACD[]
        
        //metody dodajace i ujmujace osob i ofert
        public function DodajOsobaOgl(OsobaListaWskACD $osoba)
        {
            $this->osoba_kol[$osoba->id_osoba] = $osoba;
            $this->osoba_tab[$osoba->id_osoba] = $osoba->id_osoba;
        }
        public function UsunOsobaOgl($id_osoba)
        {
            unset($this->osoba_kol[$id_osoba]);
            unset($this->osoba_tab[$id_osoba]);
        }
        public function SprawdzSpotkanieOfertaOgl($id_oferta)
        {
            if (isset($this->oferta_kol[$id_oferta]))
            {
                return $this->oferta_kol[$id_oferta]->id_spotkanie;
            }
            else
            {
                return null;
            }
        }
        public function DodajOfertaOgl(OfertaListaWskACD $oferta)
        {
            $this->oferta_kol[$oferta->id_oferta] = $oferta;
        }
        public function UsunOfertaOgl($id_oferta)
        {
            unset($this->oferta_kol[$id_oferta]);
            if (count($this->oferta_kol) > 0)
            {
                return false; //okreslenie, ze cache jeszcze nie moze zostac usuniety
            }
            else
            {
                return true; //mozna uzywac cache
            }
        }
        public function PodajOferty()
        {
            return $this->oferta_kol;
        }
        public function PodajOsoby()
        {
            return $this->osoba_kol;
        }
        public function PodajOsobyOglZapis()
        {
            return $this->osoba_tab;
        }
    }
    ///klasa zarzadajaca obiektami typu listawskacd - kazda instancja osobno dla jednej listy wskazan dla jednego zapotrzebowania; do serializacji na dysk
    ///klasa listawskACD, bll ma logike i zapewne dala, a chodzi o przechowanie danych; nawet do jednego obiketu bll mozna kazdorazowo zaczytywac listawskACD
    ///wiec do serializacji raczej lista wsk acd; samo wyjdzie w praniu jak bedzie :P
    class ListaWskBLL
    {
        protected $lista_wskazan; //typ ListaWskACD
        protected $oferta_obiekt; //typ OfertaListaWskACD
        protected $osoba; //typ OsobaListaWskACD
        
        protected $osoby_zapotrzebowanie;
        protected $dal;
        
        ///parametrem konstruktora moze w teorii byc id zapotrzebowania, moze tez klienta, wyjdzie  w praniu
        //$id_klient
        public function ListaWskBLL($id_zapotrzebowanie, $id_agent, $odczyt = false)
        {
            $this->dal = new ListaWskazanDAL();
            //pobranie wszystkich osob ujetych w kliencie
            $this->osoby_zapotrzebowanie = $this->dal->PodajOsobaKlientZap(array(ListaWskazanDAL::$id_zapotrzebowanie => $id_zapotrzebowanie));
            //jesli odczyt na true jedziemy z cache
            if ($odczyt)
            {
                $wynik = CacheListaWskazan::Czytaj($id_agent, $id_zapotrzebowanie);
                //if ($wynik != null)
                //{
                $this->lista_wskazan = $wynik;
                //}
                //else
                //{
                    
                //}
            }
            else
            {
                $this->lista_wskazan = new ListaWskACD();
                $this->lista_wskazan->id_zapotrzebowanie = $id_zapotrzebowanie;
                $this->lista_wskazan->id_agent = $id_agent;
            }
            //$this->lista_wskazan->id_klient = $id_klient;
        }
        public function ZapiszListaWskazan()
        {
            CacheListaWskazan::Zapisz($this->lista_wskazan->id_zapotrzebowanie, $this->lista_wskazan->id_agent, $this->lista_wskazan);
        }
        public function PodajOsobyZapotrzebowanie()
        {
            return $this->osoby_zapotrzebowanie;
        }
        
        public function DodajOsobaOgladajaca($id_osoba)
        {
            $this->osoba = new OsobaListaWskACD;
            //dodanie jednej osoby, poszukiwanie jej :P; te osoby moglyby byc poindexowane zeby ich nie szukac
            foreach ($this->osoby_zapotrzebowanie as $wiersz)
            {
                if ($wiersz[ListaWskazanDAL::$id_osoba] == $id_osoba)
                {
                    $this->osoba->WprowadzOsoba($wiersz);
                    $this->lista_wskazan->DodajOsobaOgl($this->osoba);
                }
            }
        }
        public function UsunOsobaOgladajaca($id_osoba)
        {
            $this->lista_wskazan->UsunOsobaOgl($id_osoba);
        }
        //zaciagniecie z bazy wszystkich koniecznych info o ofercie
        public function DodajOferta($id_oferta, $id_jezyk, $tabForm)
        {
            $this->oferta_obiekt = new OfertaListaWskACD();
            
            $wynik = $this->dal->PodajOfertaDoListaWsk(array(ListaWskazanDAL::$id_oferta => $id_oferta, ListaWskazanDAL::$id_jezyk => $id_jezyk));
            $wynik = $wynik[0];
            if (is_array($wynik[ListaWskazanDAL::$wlasciciel]))
            {
                $i = 0;
                while (isset($wynik[ListaWskazanDAL::$wlasciciel][$i]))
                {
                    $wynik[ListaWskazanDAL::$wlasciciel][$i] = $this->dal->PodajOsobaDane(array(ListaWskazanDAL::$id_osoba => $wynik[ListaWskazanDAL::$wlasciciel][$i]));
                    $i++;
                }
            }
            if (is_array($wynik[ListaWskazanDAL::$oferent]))
            {
                $i = 0;
                while (isset($wynik[ListaWskazanDAL::$oferent][$i]))
                {
                    $wynik[ListaWskazanDAL::$oferent][$i] = $this->dal->PodajOsobaDane(array(ListaWskazanDAL::$id_osoba => $wynik[ListaWskazanDAL::$oferent][$i]));
                    $i++;
                }
            }
            
            $wynik[NieruchomoscDAL::$data] = $tabForm[NieruchomoscDAL::$data];
            $wynik[NieruchomoscDAL::$id_godzina] = $tabForm[NieruchomoscDAL::$id_godzina];
            $wynik[NieruchomoscDAL::$id_minuta] = $tabForm[NieruchomoscDAL::$id_minuta];
            $wynik[NieruchomoscDAL::$godzina] = $tabForm[NieruchomoscDAL::$godzina];
            $wynik[NieruchomoscDAL::$id_spotkanie] = $tabForm[NieruchomoscDAL::$id_spotkanie];
            
            $this->oferta_obiekt->WprowadzOferta($wynik);
            $this->lista_wskazan->DodajOfertaOgl($this->oferta_obiekt);
        }
        public function UsunOferta($id_oferta, &$id_spotkanie = null)
        {
            $id_spotkanie = $this->lista_wskazan->SprawdzSpotkanieOfertaOgl($id_oferta);
            $wynik = $this->lista_wskazan->UsunOfertaOgl($id_oferta);
            if ($wynik) //mozna usunac caly cache, nie ma tam juz ofert
            {
                CacheListaWskazan::Usun($this->lista_wskazan->id_agent, $this->lista_wskazan->id_zapotrzebowanie);
                return true;
            }
            else
            {
                return false;
            }
        }
        public function PodajOferty()
        {
            if ($this->lista_wskazan != null)
            {
                return $this->lista_wskazan->PodajOferty();
            }
            else
            {
                return null;
            }
        }
        public function PodajOsoby()
        {
            return $this->lista_wskazan->PodajOsoby();
        }
        public function PodajOsobyZapis($id_zapotrzebowanie, $id_agent)
        {
            if ($this->lista_wskazan == null)
            {
                $this->lista_wskazan = new ListaWskACD();
                $this->lista_wskazan->id_zapotrzebowanie = $id_zapotrzebowanie;
                $this->lista_wskazan->id_agent = $id_agent;
                //wprowadzenie kolejnych osob jako potencjalnie ogladajacych
                if (is_array($this->osoby_zapotrzebowanie))
                {
                    foreach ($this->osoby_zapotrzebowanie as $wiersz)
                    {
                        $this->osoba = new OsobaListaWskACD();
                        $this->osoba->WprowadzOsoba($wiersz);
                        $this->lista_wskazan->DodajOsobaOgl($this->osoba);
                    }
                }
                CacheListaWskazan::Zapisz($id_zapotrzebowanie, $id_agent, $this->lista_wskazan);
            }
            return $this->lista_wskazan->PodajOsobyOglZapis();
        }
    }
?>