<?php
    $path = str_replace($_SERVER['PHP_SELF'], '', $_SERVER['SCRIPT_FILENAME']).'/';
    
    include_once($path.'dal/queriesDAL.php');
    include_once($path.'bll/utilsbll.php');
    include_once($path.'bll/jezykibll.php');
    include_once($path.'bll/cache.php');
    include_once($path.'bll/jezykibll.php');
    
    class WyposazenieACD
    {
        public $id_parent;
        public $id;
        public $wielokrotne;//true mozna wybraæ kilka razy dziecko rodzica false mozna wybrac raz, jedno dziecko rodzica(ogrzewanie elektryczne, gazowe)
        public $nazwa;
    }
    class ParametrACD
    {
        public $id;
        public $nazwa;
        public $tag; // slozy do nazwania postrzegolnej kontrolki html
        public $walidacja;
        public $dl_inf;
        public $wartosc;
    }
    //dowalic pomieszczeniai prametry nieruchomosci
    class SekcjaWypACD   //powinien istniec interfejs ktory ta klasa implementuje, oraz metoda statyczna uzywana w tej metodzie, ktora interfejs wymusza, ale chyba se podarujemy :P
    {
        ///ta klasa ma sluzyc i nieruchomosciom i zapotrzebowaniom, chyba ze wyposazenia nas w ogole nie interesuja
        public $id_sekcja;
        public $nazwa_sekcja;
        public $tag;
        //kolekcja wyposazen indexowana oczywiscie id zapewne
        public $wyposazenie = array();// kolekcja typu wyposazenieACD - wyposazen dla danej sekcji 
        //wparzyc tu parametry acd - przemyslec, pozbyc sie jednego acd :P - ryzykowne, chyba to olac :P
        protected $dostepneWyposazenie = array();
        protected $wybraneWyposazenie = array();
        protected $dal;
                                                               //ten parametr moze sie okazac niepotrzebny
        public function SekcjaWypACD($nierId, $CzyNier = true, $tabParam = null) //przygotowac na ewentualnego dala do zapotrzebowan
        {
            if ($CzyNier)
            {
                $this->dal = new WyposazenieNierDAL(null, $nierId);
            }
            else
            {
                $this->dal = new WyposazenieZapDAL($nierId);
            }
        }
        //metoda przekazuje cale wyposazenie do dostepnego
        public function ZatwierdzWyposazenie()
        {
            $this->dostepneWyposazenie = $this->wyposazenie;
        }
        public function PodajDostepneWyposazenie()
        {
            return $this->dostepneWyposazenie;
        }
        public function PodajWybraneWyposazenie()
        {
            return $this->wybraneWyposazenie;
        }
        public function DodajWyposazenie($id_wyposazenie, $oper_baza = true)
        {
            //wprowadzenie informacji do bazy danych
            if ($oper_baza)
            {
                //operacja na bazie nie musi sie wykonac (a nawet to niewskazane) jesli mamy do czynienia z edycja i uzupelniamy jedynie obiekt 
                //informacja uzyskana z bazy
                $wynik = $this->dal->DodajWyposazenieNier(true, $id_wyposazenie);
            }
            else
            {
                //operacja na bazie nie jest wykonywana, wiec mozemy przejsc do przegladu danych, 
                //stad zeby zadzialal ponizszy if wynik musi byc true
                $wynik = true;
            }
            //jesli operacja sie powiodla
            if ($wynik)
            {
                //wstawiamy element wybrany do listy wybranych
                $this->wybraneWyposazenie[$id_wyposazenie] = $this->dostepneWyposazenie[$id_wyposazenie];
                //jesli if sie spelnia inne dzieci moga byc wybierane
                if ($this->dostepneWyposazenie[$id_wyposazenie]->wielokrotne == true)
                {
                    //w takim wypadku wywalamy tylko wybrane dziecko
                    unset($this->dostepneWyposazenie[$id_wyposazenie]);
                }
                else
                {
                    //wszystkie dzieci powinny zostac wyeliminowane, gdyz informacja jest typu jednokrotnego
                    foreach ($this->dostepneWyposazenie as $key => $value)
                    {
                        //sprawdzenie czy rozpatrywany element ma wspolnego rodzica z dopiero wybranym
                        if ($key != $id_wyposazenie)
                        if ($this->dostepneWyposazenie[$key]->id_parent == $this->dostepneWyposazenie[$id_wyposazenie]->id_parent)
                        {
                            //jesli ma wywalenie go z listy
                            unset($this->dostepneWyposazenie[$key]);
                        }
                    }
                    unset($this->dostepneWyposazenie[$id_wyposazenie]);
                }
            }
        }
        public function DodajWyposazenieZapotrzebowanie ($id_wyposazenie, $oper_baza = true) //
        {
            if ($oper_baza)
            {
                //operacja na bazie nie musi sie wykonac (a nawet to niewskazane) jesli mamy do czynienia z edycja i uzupelniamy jedynie obiekt 
                //informacja uzyskana z bazy
                $wynik = $this->dal->DodajWyposazenieZap(true, $id_wyposazenie);
            }
            else
            {
                //operacja na bazie nie jest wykonywana, wiec mozemy przejsc do przegladu danych, 
                //stad zeby zadzialal ponizszy if wynik musi byc true
                $wynik = true;
            }
            //jesli operacja sie powiodla
            if ($wynik)
            {
                //wstawiamy element wybrany do listy wybranych
                $this->wybraneWyposazenie[$id_wyposazenie] = $this->dostepneWyposazenie[$id_wyposazenie];
                unset($this->dostepneWyposazenie[$id_wyposazenie]);
            }
        }
        public function UsunWyposazenie($id_wyposazenie)
        {
            //usuniecie informacji z bazy danych
            $wynik = $this->dal->DodajWyposazenieNier(false, $id_wyposazenie);
            //jesli operacja sie powiodla
            if ($wynik)
            {
                //element nie jest juz wybrany
                unset($this->wybraneWyposazenie[$id_wyposazenie]);
                //jesli if sie spelnia inne dzieci moga byc wybierane, w zwiazku z tym w liscie nie bylo tylko tego dziecka
                if ($this->wyposazenie[$id_wyposazenie]->wielokrotne == true)
                {
                    //w takim wypadku dokladamy tylko wybrane dziecko
                    $this->dostepneWyposazenie[$id_wyposazenie] = $this->wyposazenie[$id_wyposazenie];
                }
                else
                {
                    //wszystkie dzieci powinny zostac dodane, gdyz informacja jest typu jednokrotnego
                    foreach ($this->wyposazenie as $key => $value)
                    {
                        //sprawdzenie czy rozpatrywany element ma wspolnego rodzica z dopiero usunietym
                        if ($this->wyposazenie[$key]->id_parent == $this->wyposazenie[$id_wyposazenie]->id_parent)
                        {
                            //jesli ma dodanie go z listy dostepnych
                            $this->dostepneWyposazenie[$key] = $this->wyposazenie[$key];
                        }
                    }
                }
            }
        }
        public function UsunWyposazenieZapotrzebowanie($id_wyposazenie)
        {
            //usuniecie informacji z bazy danych
            $wynik = $this->dal->DodajWyposazenieZap(false, $id_wyposazenie);
            //jesli operacja sie powiodla
            if ($wynik)
            {
                //element nie jest juz wybrany
                unset($this->wybraneWyposazenie[$id_wyposazenie]);
                $this->dostepneWyposazenie[$id_wyposazenie] = $this->wyposazenie[$id_wyposazenie];
            }
        }
    }  //komentarz do klasy powyzej, dziedziczenie zbedne - przerost formy nad trescia :P
    //idea jest nastepujaca: klasa dziedziczaca ma opcje przyjecia pelnej kolekcji dla siebie, nastepnie opcje przyjecia elementu do zapisu
    //do bazy oraz usuniecia z bazy; w kolejnosci musza istniec metody interpretujace caly temat zabrania danej informacji z jednej kolekcji i 
    //umieszczenia w innej; dodatkowo musi miec miejsce fizyczna interakcja z baza, musi istniec obiekt realizujacy zapisy i kasacje :P
    //klasa musi udostepniac metody podaj dostepne, podaj wybrane, dodajelement, ujmij element, wczytaj pelna kolekcje
    //metody chronione: zapisz do bazy, skasuj z bazy (moze to bedzie 1 metoda), uniedostepnij, udostepnij (to tez moze byc 1 metoda)
    //klasa bedzie uzywana jako kolekcja indexowana id sekcji, kazdy kolejny element kolekcji dostanie swoje dane dla sekcji i gitara
    
    
    //ta klasa jest ok - zamknieta
    class SekcjaParACD
    {
        public $id_sekcja;
        public $nazwa_sekcja;
        public $parametry = array();
        
        public function PodajKolekcje()
        {
            return $this->parametry;
        }
    }
    //klasa parametrow dla danego pomieszczenia; w momencie dodania pomieszczenia do bazy nalezy do kolekcji pomieszczen danego typu
    //(np do kolekcji pokoi) wprowadzic nowy element pustego wyposazenia pomieszczenia i parametrow pomieszczenia
    class PomWypACD
    {
        public $id_pomieszczenie;
        public $nazwa_pomieszczenie;
        public $tag;
        
        protected $wyposazenie = array(); //WyposazenieACD
        protected $dostepneWyposazenie = array();
        protected $wybraneWyposazenie = array();
        protected $dal;
        protected $rozdzielnik = ':'; 
        
        public function PomWypACD($pom_rodz_id, $pom_id = null)
        {
            $this->dal = new WyposazenieNierDAL(null, null);
            //wpakowac w parametr opcje pom id - edycja
            $this->ZatwierdzWyposazenie($pom_rodz_id);
            if ($pom_id != null)
            {
                $this->Edycja($pom_id);
            }
        }
        protected function ZatwierdzWyposazenie($pom_rodz_id)
        {
            $tlumaczenia = cachejezyki::Czytaj();
            $wynik = $this->dal->WyposazeniePomieszczen($pom_rodz_id, $ilosc_wierszy);
            
            foreach ($wynik as $wiersz)
            {
                $kontenInf = new WyposazenieACD();
                
                $kontenInf->id = $wiersz[WyposazenieNierDAL::$id];
                $kontenInf->id_parent = $wiersz[WyposazenieNierDAL::$id_parent];
                $kontenInf->nazwa = $tlumaczenia->TlumaczZlozenieTag($_SESSION['wyb_jezyk'], $wiersz[WyposazenieNierDAL::$nazwa], $this->rozdzielnik);
                $kontenInf->wielokrotne = Utils::KonwertujNaBool($wiersz[WyposazenieNierDAL::$wielokrotne]);
                
                $this->wyposazenie[$wiersz[WyposazenieNierDAL::$id]] = $kontenInf;
            }
            $this->dostepneWyposazenie = $this->wyposazenie;
        }
        protected function Edycja($pom_id)
        {
            $wynik = $this->dal->EdycjaWyposazeniePom($pom_id);
            
            if (is_array($wynik))
            {
                foreach($wynik as $wiersz)
                {
                    $this->DodajWyposazenie(null, $wiersz[WyposazenieNierDAL::$id], false);
                }
            }    
        }
        public function PodajDostepneWyposazenie()
        {
            return $this->dostepneWyposazenie;
        }
        public function PodajWybraneWyposazenie()
        {
            return $this->wybraneWyposazenie;
        }
        public function DodajWyposazenie($id_pomieszczenie, $id_wyposazenie, $oper_baza = true)
        {
            if ($oper_baza)
            {
                //wprowadzenie informacji do bazy danych
                $wynik = $this->dal->DodajWyposazeniePom(true, $id_pomieszczenie, $id_wyposazenie);
            }
            else
            {
                //operacja na bazie nie jest wykonywana, wiec mozemy przejsc do przegladu danych, 
                //stad zeby zadzialal ponizszy if wynik musi byc true
                $wynik = true;
            }
            if ($wynik)
            {
                //wstawiamy element wybrany do listy wybranych
                $this->wybraneWyposazenie[$id_wyposazenie] = $this->dostepneWyposazenie[$id_wyposazenie];
                //jesli if sie spelnia inne dzieci moga byc wybierane
                if ($this->dostepneWyposazenie[$id_wyposazenie]->wielokrotne == true)
                {
                    //w takim wypadku wywalamy tylko wybrane dziecko
                    unset($this->dostepneWyposazenie[$id_wyposazenie]);
                }
                else
                {
                    //wszystkie dzieci powinny zostac wyeliminowane, gdyz informacja jest typu jednokrotnego
                    foreach ($this->dostepneWyposazenie as $key => $value)
                    {
                        //sprawdzenie czy rozpatrywany element ma wspolnego rodzica z dopiero wybranym
                        if ($key != $id_wyposazenie)
                        if ($this->dostepneWyposazenie[$key]->id_parent == $this->dostepneWyposazenie[$id_wyposazenie]->id_parent)
                        {
                            //jesli ma wywalenie go z listy
                            unset($this->dostepneWyposazenie[$key]);
                        }
                    }
                    unset($this->dostepneWyposazenie[$id_wyposazenie]);
                }
            }
        }
        public function UsunWyposazenie($id_pomieszczenie, $id_wyposazenie)
        {
            //usuniecie informacji z bazy danych
            $wynik = $this->dal->DodajWyposazeniePom(false, $id_pomieszczenie, $id_wyposazenie);
            //jesli operacja sie powiodla
            if ($wynik)
            {
                //element nie jest juz wybrany
                unset($this->wybraneWyposazenie[$id_wyposazenie]);
                //jesli if sie spelnia inne dzieci moga byc wybierane, w zwiazku z tym w liscie nie bylo tylko tego dziecka
                if ($this->wyposazenie[$id_wyposazenie]->wielokrotne == true)
                {
                    //w takim wypadku dokladamy tylko wybrane dziecko
                    $this->dostepneWyposazenie[$id_wyposazenie] = $this->wyposazenie[$id_wyposazenie];
                }
                else
                {
                    //wszystkie dzieci powinny zostac dodane, gdyz informacja jest typu jednokrotnego
                    foreach ($this->wyposazenie as $key => $value)
                    {
                        //sprawdzenie czy rozpatrywany element ma wspolnego rodzica z dopiero usunietym
                        if ($this->wyposazenie[$key]->id_parent == $this->wyposazenie[$id_wyposazenie]->id_parent)
                        {
                            //jesli ma dodanie go z listy dostepnych
                            $this->dostepneWyposazenie[$key] = $this->wyposazenie[$key];
                        }
                    }
                }
            }
        }
    }
    //zmodyfikowac by kolekcja uzupelniala sie samoczynnie
    class PomParACD
    {
        protected $parametry = array(); 
        protected $dal;
        protected $id_pom;           //do edycji
        protected $id_pomieszczenie; //numer pomieszczrenia
        
        public function PomParACD($pomieszczenie_id, $pom_id = null)
        {
            $this->id_pomieszczenie = $pomieszczenie_id;
            $this->dal = new WyposazenieNierDAL(null, null);
            $wynik = $this->dal->ParametryPomieszczen($this->id_pomieszczenie, $ilosc_wierszy);
            $tlumaczenia = cachejezyki::Czytaj();
            
            $tab_ed = array();
            if ($pom_id != null)
            {
                $tab_ed = $this->dal->EdycjaParametrPom($pom_id);
            }
            
            foreach ($wynik as $wiersz)
            {
                $kontenInf = new ParametrACD();
                
                $kontenInf->dl_inf = $wiersz[WyposazenieNierDAL::$dl_inf];
                $kontenInf->id = $wiersz[WyposazenieNierDAL::$id];
                $kontenInf->nazwa = $tlumaczenia->Tlumacz ($_SESSION['wyb_jezyk'], $wiersz[WyposazenieNierDAL::$nazwa]);
                $kontenInf->tag = $wiersz[WyposazenieNierDAL::$nazwa];
                $kontenInf->walidacja = $wiersz[WyposazenieNierDAL::$walidacja];
                
                if (isset($tab_ed[$wiersz[WyposazenieNierDAL::$id]]))
                {
                    $kontenInf->wartosc = $tab_ed[$wiersz[WyposazenieNierDAL::$id]];
                }
                
                $this->parametry[$wiersz[WyposazenieNierDAL::$id]] = $kontenInf;
            }
        }
        
         public function PodajKolekcje()
        {
            return $this->parametry;
        }
    }
    /*class PomieszczenieNierACD
    {
        public $id;
        public $wyposazenie;    //typ PomWypACD
        public $parametry;
    }
    class PomieszczeniaACD  //kolekcja wielu pomieszczen roznych typow rozdzielona ze wzgledu na ich typ
    {
        public $id_pomieszczenie; //id typu pomieszczenia
        public $pomieszczenia = array(); //kolekcja np pokoi
    } */
    //dodac tablice indexowana jakos index nier || index transakcji
    ///potrzebna kolekcja kolekcji :P: kolekcja glowna indexowana id pomieszczenia, w kazdej kolekcja pomieszczen przyn nier :P
    class WyposazenieNierBLL
    {
        protected $DAL;
        protected $ElementACD;
        protected $ElementKolekcji;
        protected $sekcjaKolekcjaWyp;
        protected $sekcjaKolekcjaPar;
        //kolekcje wyposazen i parametrow dla wszystkich typow pomieszczen danej nieruchomosci
        protected $pomieszczenieKolekcjaWyp; //typu pomwypACD ??
        protected $pomieszczenieKolekcjaPar;
        
        protected $pomieszczeniaNier;
        
        protected $tabSekcja = array();
        protected $tabPom = null;
        //protected $nierTransKolekcja;
        protected $rozdzielnik = ':';
        
        protected $tabPar;
        protected $nieruchomoscId;
        protected $daneBaza; //tablica

        public function WyposazenieNierBLL($tabParametrow, $nierId, $wynik = null)
        {
            $this->DAL = new WyposazenieNierDAL($tabParametrow, $nierId);
            //$this->wyposazenieACDel = new WyposazenieACD();
            //$this->sekcjaElement = new SekcjaWypACD();
            $this->nieruchomoscId = $nierId;
            $this->tabPar = $tabParametrow;
            
            $this->pomieszczeniaNier = array();  //typu pomieszczeniaACD
            if ($wynik != null)
            {
                //NieruchomoscDAL::$dane_wyposazenie_nier,
                //NieruchomoscDAL::$dane_parametr_nier_wartosc,  
                //NieruchomoscDAL::$dane_parametr_nier)
                $this->daneBaza = $wynik[0];
            }
            else
            {
                $this->daneBaza = null;
            }
            //uzupelnij dane
            $this->UzupelnijDaneWyp($nierId);
            $this->UzupelnijDanePar();
            $this->UzupelnijPomieszczenia();
        }
        
        public function PodajSekcje()
        {
            return $this->tabSekcja;
        }
        
        public function PodajPom()
        {
            return $this->tabPom;
        }
        //podaje kolekcje wyposazen dla wszyskich sekcji; kolekcja ta jest indexowana id sekcji
        public function KolekcjaWyposazen()
        {
            return $this->sekcjaKolekcjaWyp;
        }
        //po wybraniu danego wyposazenia wewnatrz tego obiektu zachodza zmiany, trzeba je zapamietac
        public function ZamienElKolWyp($element, $sekcja)
        {
            $this->sekcjaKolekcjaWyp[$sekcja] = $element;
        }
        public function ZamienElKolWypPom($element, $id_pomieszczenie, $pom_id)
        {
            $this->pomieszczeniaNier[$id_pomieszczenie]->pomieszczenia[$pom_id]->wyposazenie = $element;
        }
        public function KolekcjaParametrow()
        {
            return $this->sekcjaKolekcjaPar;
        }
        
        public function DodajPomieszczenie($id_pomieszczenie, $oper_dodaj = true)
        {
            $dal = new WyposazenieNierDAL(null, $this->nieruchomoscId);
            $pom_id = $dal->DodajPomieszczenie($oper_dodaj, $id_pomieszczenie);
            return $pom_id;
        } 
        public function PodajParamPom($id_pomieszczenie, $pom_id)
        {
            if (isset($this->pomieszczeniaNier[$id_pomieszczenie]->pomieszczenia[$pom_id]))
            {
                return $this->pomieszczeniaNier[$id_pomieszczenie]->pomieszczenia[$pom_id]->parametry->PodajKolekcje();
            }
            else
            {
                return null;
            }
        }
        public function PodajWyposPom($id_pomieszczenie, $pom_id)
        {
            if (isset($this->pomieszczeniaNier[$id_pomieszczenie]->pomieszczenia[$pom_id]))
            {                                                        //PomieszczenieNierACD //PomWypACD
                return $this->pomieszczeniaNier[$id_pomieszczenie]->pomieszczenia[$pom_id]->wyposazenie;
            }
            else
            {
                return null;
            }
        }
        public function UsunPomieszczenie($id_pomieszczenie, $pom_id)
        {
            $dal = new NieruchomoscElemDAL($this->nieruchomoscId);
            $wynik = $dal->DodajPomieszczenie(false, $pom_id);
            if ($wynik)
            {
                unset($this->pomieszczeniaNier[$id_pomieszczenie]->pomieszczenia[$pom_id]);
            }
        }
        //metody chronione sa uruchamiane raz - uzupelniaja okreslony obiekt
        //metoda uzupelnijdanewyp  wprowadza do obiektu sekcjaKolekcjaWyp kolekcje wyposazen nieruchomosci dla kolejnych sekcji
        //publiczna metoda powyzej zwraca kolekcje wyposazen dla wszystkich sekcji
        protected function UzupelnijDaneWyp($nierId) 
        {                                        
            $this->sekcjaKolekcjaWyp = null;                                                         
            $wynik = $this->DAL->WyposazenieNieruchomosci($ilosc_wierszy);
            $tlumaczenia = cachejezyki::Czytaj();
            
            $i = 0;
            while(isset($wynik[$i]))
            {
                $this->ElementKolekcji = new SekcjaWypACD($nierId);
                
                $wiersz = $wynik[$i];
                $this->ElementKolekcji->id_sekcja = $wiersz[WyposazenieNierDAL::$id_sekcja];
                $this->ElementKolekcji->nazwa_sekcja = $tlumaczenia->Tlumacz($_SESSION['wyb_jezyk'], $wiersz[WyposazenieNierDAL::$nazwa_sekcja]);
                $this->ElementKolekcji->tag = $wiersz[WyposazenieNierDAL::$nazwa_sekcja];
                
                $j = 0;
                $wierszIdPar = $wiersz[WyposazenieNierDAL::$id_parent];
                $wierszId = $wiersz[WyposazenieNierDAL::$id]; 
                $wierszWielokrotne = $wiersz[WyposazenieNierDAL::$wielokrotne]; 
                $wierszNazwa = $wiersz[WyposazenieNierDAL::$nazwa]; 
                while(isset($wierszIdPar[$j]))
                {
                    $this->ElementACD = new WyposazenieACD();
                    $this->ElementACD->id = $wierszId[$j];
                    $this->ElementACD->id_parent = $wierszIdPar[$j];
                    //bool postgresa jest dla php zwyklym smiesznym nieakceptowalnym textem
                    $this->ElementACD->wielokrotne = Utils::KonwertujNaBool($wierszWielokrotne[$j]);
                    $this->ElementACD->nazwa = $tlumaczenia->TlumaczZlozenieTag($_SESSION['wyb_jezyk'], $wierszNazwa[$j], $this->rozdzielnik);
                    
                    $this->ElementKolekcji->wyposazenie[$wierszId[$j]] = $this->ElementACD;
                    //dod do kol
                    $j++;
                }
                if($j == 0)
                {
                    $this->ElementKolekcji = null;
                }
                else
                {
                    $this->ElementKolekcji->ZatwierdzWyposazenie();
                    //tu if czy sa dane edycyjne
                    if ($this->daneBaza != null)
                    {
                        //mod 11.03  (ten if)
                        if (is_array($this->daneBaza[NieruchomoscDAL::$dane_wyposazenie_nier]))
                        foreach ($this->daneBaza[NieruchomoscDAL::$dane_wyposazenie_nier] as $klucz => $wartosc)
                        {
                            //sprawdzenie, czy dla tej sekcji taki element wyposazenia wystepuje
                            if (isset($this->ElementKolekcji->wyposazenie[$klucz]))
                            {
                                //DodajWyposazenie
                                $this->ElementKolekcji->DodajWyposazenie($klucz, false);
                            }
                        }
                    }
                    $this->sekcjaKolekcjaWyp[$wiersz[WyposazenieNierDAL::$id_sekcja]] = $this->ElementKolekcji;
                    //dopisanie sekcji do tablicy wszystkich sekcji wystepujacych dla nieruchomosci
                    $this->tabSekcja[$wiersz[WyposazenieNierDAL::$id_sekcja]] = $this->ElementKolekcji->nazwa_sekcja;
                } 
                //dodanie do kolekcji 
                $i++;
            }
        }
        protected function UzupelnijDanePar()
        {                                        
            $this->sekcjaKolekcjaPar = null;                                                         
            $wynik = $this->DAL->ParametryNieruchomosci($ilosc_wierszy);
            $tlumaczenia = cachejezyki::Czytaj();
            
            $i = 0;
            while(isset($wynik[$i]))
            {
                $this->ElementKolekcji = new SekcjaParACD();
                
                $wiersz = $wynik[$i];
                $this->ElementKolekcji->id_sekcja = $wiersz[WyposazenieNierDAL::$id_sekcja];
                $this->ElementKolekcji->nazwa_sekcja = $tlumaczenia->Tlumacz($_SESSION['wyb_jezyk'], $wiersz[WyposazenieNierDAL::$nazwa_sekcja]);
                
                $j = 0;
                
                $wierszId = $wiersz[WyposazenieNierDAL::$id]; 
                $wierszWalidacja = $wiersz[WyposazenieNierDAL::$walidacja]; 
                $wierszNazwa = $wiersz[WyposazenieNierDAL::$nazwa]; 
                $wierszDl = $wiersz[WyposazenieNierDAL::$dl_inf];
                
                while(isset($wierszId[$j]))
                {
                    $this->ElementACD = new ParametrACD();
                    $this->ElementACD->id = $wierszId[$j];
                    $this->ElementACD->walidacja = $wierszWalidacja[$j];
                    $this->ElementACD->nazwa = $tlumaczenia->Tlumacz($_SESSION['wyb_jezyk'], $wierszNazwa[$j]);
                    $this->ElementACD->tag = $wierszNazwa[$j];
                    $this->ElementACD->dl_inf = $wierszDl[$j];
                    
                    if ($this->daneBaza != null)
                    {
                        //sprawdzenie, czy ten parametr istnieje w bazie dla tej edytowanej nieruchomosci :)
                        if (isset($this->daneBaza[NieruchomoscDAL::$dane_parametr_nier][$wierszId[$j]]))
                        {
                            //ponizsza linijka to podanie wartosci dla danego parametru :)
                            //indexem wartosci tego parametru w tablicy parametrow jest wartosc siedzaca w tablicy indexow parametrow nieruchomosci
                            //pod indexem bedacym id danego parametru
                            $this->ElementACD->wartosc = $this->daneBaza[NieruchomoscDAL::$dane_parametr_nier_wartosc][$this->daneBaza[NieruchomoscDAL::$dane_parametr_nier][$wierszId[$j]]];
                        }
                    }
                    
                    $this->ElementKolekcji->parametry[$wierszId[$j]] = $this->ElementACD;
                    //dod do kol
                    $j++;
                }
                if($j == 0)
                {
                    $this->ElementKolekcji = null;
                }
                else
                {
                $this->sekcjaKolekcjaPar[$wiersz[WyposazenieNierDAL::$id_sekcja]] = $this->ElementKolekcji;
                $this->tabSekcja[$wiersz[WyposazenieNierDAL::$id_sekcja]] = $this->ElementKolekcji->nazwa_sekcja;
                }
                //dodanie do kolekcji 
                $i++;
            }
        }
        protected function UzupelnijPomieszczenia()
        {
            $tlumaczenia = cachejezyki::Czytaj();
            $this->tabPom = null;
            $wynik = $this->DAL->PomieszczeniaNieruchomosci($ilosc_wierszy);
            
            if (isset($wynik[0]))
            {
                foreach($wynik as $wiersz)
                {
                    $this->tabPom[$wiersz[WyposazenieNierDAL::$id]] = $tlumaczenia->Tlumacz($_SESSION['wyb_jezyk'], $wiersz[WyposazenieNierDAL::$nazwa]);
                }
            }
        }
    }
    class WyposazenieZapBLL
    {
        protected $ElementACD;
        protected $ElementKolekcji;
        protected $sekcjaKolekcjaWyp;
        protected $sekcjaKolekcjaParMin;
        protected $sekcjaKolekcjaParMax;
        protected $rozdzielnik = ':';
        
        protected $dal;
        protected $zapotrzebowanieId;
        protected $tabSekcja = array();
        
        public function WyposazenieZapBLL($zapTransRodzajId, $wynik = null)
        {
            $this->dal = new WyposazenieZapDAL($zapTransRodzajId);
            //$this->wyposazenieACDel = new WyposazenieACD();
            //$this->sekcjaElement = new SekcjaWypACD();
            $this->zapotrzebowanieId = $zapTransRodzajId;            

            if ($wynik != null)
            {
                $this->daneBaza = $wynik[0];
            }
            else
            {
                $this->daneBaza = null;
            }
            //uzupelnij dane
            $this->UzupelnijDaneWyp();
            $this->UzupelnijDanePar();
        }
        public function SprawdzZapTransRodzajId($zewnId)
        {
            //sprawdzenie czy istniejacy obiekt odpowiada temu, co uzytkownik chce wprowadzac
            if ($zewnId == $this->zapotrzebowanieId)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        public function PodajSekcje()
        {
            return $this->tabSekcja;
        }
        public function KolekcjaWyposazen()
        {
            return $this->sekcjaKolekcjaWyp;
        }
        public function KolekcjaParametrowMin()
        {
            return $this->sekcjaKolekcjaParMin;
        }
        public function KolekcjaParametrowMax()
        {
            return $this->sekcjaKolekcjaParMax;
        }
        public function ZamienElKolWyp($element, $sekcja)
        {
            $this->sekcjaKolekcjaWyp[$sekcja] = $element;
        }
        protected function UzupelnijDaneWyp() 
        {                                        
            $this->sekcjaKolekcjaWyp = null;                                                         
            $wynik = $this->dal->WyposazenieZapotrzebowania($ilosc_wierszy);
            $tlumaczenia = cachejezyki::Czytaj();

            $i = 0;
            while(isset($wynik[$i]))
            {
                $this->ElementKolekcji = new SekcjaWypACD($this->zapotrzebowanieId, false);
                
                $wiersz = $wynik[$i];
                $this->ElementKolekcji->id_sekcja = $wiersz[WyposazenieZapDAL::$id_sekcja];
                $this->ElementKolekcji->nazwa_sekcja = $tlumaczenia->Tlumacz($_SESSION['wyb_jezyk'], $wiersz[WyposazenieZapDAL::$nazwa_sekcja]);
                $this->ElementKolekcji->tag = $wiersz[WyposazenieZapDAL::$nazwa_sekcja];
                
                $j = 0;
                $wierszIdPar = $wiersz[WyposazenieZapDAL::$id_parent];
                $wierszId = $wiersz[WyposazenieZapDAL::$id]; 
                $wierszWielokrotne = $wiersz[WyposazenieZapDAL::$wielokrotne]; //wielokrotnych bym w ogole nie przepisywal
                $wierszNazwa = $wiersz[WyposazenieZapDAL::$nazwa]; 
                while(isset($wierszIdPar[$j]))
                {
                    $this->ElementACD = new WyposazenieACD();
                    $this->ElementACD->id = $wierszId[$j];
                    $this->ElementACD->id_parent = $wierszIdPar[$j];
                    //bool postgresa jest dla php zwyklym smiesznym nieakceptowalnym textem
                    $this->ElementACD->wielokrotne = Utils::KonwertujNaBool($wierszWielokrotne[$j]); //to nie bedzie uzywane wiec nie bylo sensu tego pobierac, interpretowac tym bardziej
                    $this->ElementACD->nazwa = $tlumaczenia->TlumaczZlozenieTag($_SESSION['wyb_jezyk'], $wierszNazwa[$j], $this->rozdzielnik);
                    
                    $this->ElementKolekcji->wyposazenie[$wierszId[$j]] = $this->ElementACD;
                    //dod do kol
                    $j++;
                }
                if($j == 0)
                {
                    $this->ElementKolekcji = null;
                }
                else
                {
                    $this->ElementKolekcji->ZatwierdzWyposazenie();
                    //tu if czy sa dane edycyjne
                    if ($this->daneBaza != null)
                    {
                        foreach ($this->daneBaza[WyposazenieZapDAL::$dane_wyposazenie_zap] as $klucz => $wartosc)
                        {
                            //sprawdzenie, czy dla tej sekcji taki element wyposazenia wystepuje
                            if (isset($this->ElementKolekcji->wyposazenie[$klucz]))
                            {
                                //DodajWyposazenie
                                $this->ElementKolekcji->DodajWyposazenieZapotrzebowanie($klucz, false);
                            }
                        }
                    }
                    $this->sekcjaKolekcjaWyp[$wiersz[WyposazenieZapDAL::$id_sekcja]] = $this->ElementKolekcji;
                    //dopisanie sekcji do tablicy wszystkich sekcji wystepujacych dla nieruchomosci
                    $this->tabSekcja[$wiersz[WyposazenieZapDAL::$id_sekcja]] = $this->ElementKolekcji->nazwa_sekcja;
                } 
                //dodanie do kolekcji 
                $i++;
            }
        }
        protected function UzupelnijDanePar()
        {                                        
            $this->sekcjaKolekcjaPar = null;                                                         
            $wynik = $this->dal->ParametryZapotrzebowania($ilosc_wierszy);
            $tlumaczenia = cachejezyki::Czytaj();
            //min
            $i = 0;
            while(isset($wynik[$i]))
            {
                $this->ElementKolekcji = new SekcjaParACD();
                
                $wiersz = $wynik[$i];
                $this->ElementKolekcji->id_sekcja = $wiersz[WyposazenieZapDAL::$id_sekcja];
                $this->ElementKolekcji->nazwa_sekcja = $tlumaczenia->Tlumacz($_SESSION['wyb_jezyk'], $wiersz[WyposazenieZapDAL::$nazwa_sekcja]);
                
                $j = 0;
                
                $wierszId = $wiersz[WyposazenieZapDAL::$id]; 
                $wierszWalidacja = $wiersz[WyposazenieZapDAL::$walidacja]; 
                $wierszNazwa = $wiersz[WyposazenieZapDAL::$nazwa]; 
                $wierszDl = $wiersz[WyposazenieZapDAL::$dl_inf];
                
                while(isset($wierszId[$j]))
                {
                    $this->ElementACD = new ParametrACD();
                    $this->ElementACD->id = $wierszId[$j];
                    $this->ElementACD->walidacja = $wierszWalidacja[$j];
                    $this->ElementACD->nazwa = $tlumaczenia->Tlumacz($_SESSION['wyb_jezyk'], $wierszNazwa[$j]);
                    $this->ElementACD->tag = $wierszNazwa[$j];
                    $this->ElementACD->dl_inf = $wierszDl[$j];
                    
                    if ($this->daneBaza != null)
                    {
                        //sprawdzenie, czy ten parametr istnieje w bazie dla tej edytowanej nieruchomosci :)
                        if (isset($this->daneBaza[WyposazenieZapDAL::$dane_parametr_zap_min][$wierszId[$j]]))
                        {
                            //ponizsza linijka to podanie wartosci dla danego parametru :)
                            //indexem wartosci tego parametru w tablicy parametrow jest wartosc siedzaca w tablicy indexow parametrow nieruchomosci
                            //pod indexem bedacym id danego parametru
                            $this->ElementACD->wartosc = $this->daneBaza[WyposazenieZapDAL::$dane_parametr_zap_min_wartosc][$this->daneBaza[WyposazenieZapDAL::$dane_parametr_zap_min][$wierszId[$j]]];
                        }
                    }
                    
                    $this->ElementKolekcji->parametry[$wierszId[$j]] = $this->ElementACD;
                    //dod do kol
                    $j++;
                }
                if($j == 0)
                {
                    $this->ElementKolekcji = null;
                }
                else
                {
                $this->sekcjaKolekcjaParMin[$wiersz[WyposazenieZapDAL::$id_sekcja]] = $this->ElementKolekcji;
                $this->tabSekcja[$wiersz[WyposazenieZapDAL::$id_sekcja]] = $this->ElementKolekcji->nazwa_sekcja;
                }
                //dodanie do kolekcji 
                $i++;
            }
            //max
            $i = 0;
            while(isset($wynik[$i]))
            {
                $this->ElementKolekcji = new SekcjaParACD();
                
                $wiersz = $wynik[$i];
                $this->ElementKolekcji->id_sekcja = $wiersz[WyposazenieZapDAL::$id_sekcja];
                $this->ElementKolekcji->nazwa_sekcja = $tlumaczenia->Tlumacz($_SESSION['wyb_jezyk'], $wiersz[WyposazenieZapDAL::$nazwa_sekcja]);
                
                $j = 0;
                
                $wierszId = $wiersz[WyposazenieZapDAL::$id]; 
                $wierszWalidacja = $wiersz[WyposazenieZapDAL::$walidacja]; 
                $wierszNazwa = $wiersz[WyposazenieZapDAL::$nazwa]; 
                $wierszDl = $wiersz[WyposazenieZapDAL::$dl_inf];
                
                while(isset($wierszId[$j]))
                {
                    $this->ElementACD = new ParametrACD();
                    $this->ElementACD->id = $wierszId[$j];
                    $this->ElementACD->walidacja = $wierszWalidacja[$j];
                    $this->ElementACD->nazwa = $tlumaczenia->Tlumacz($_SESSION['wyb_jezyk'], $wierszNazwa[$j]);
                    $this->ElementACD->tag = $wierszNazwa[$j];
                    $this->ElementACD->dl_inf = $wierszDl[$j];
                    
                    if ($this->daneBaza != null)
                    {
                        //sprawdzenie, czy ten parametr istnieje w bazie dla tej edytowanej nieruchomosci :)
                        if (isset($this->daneBaza[WyposazenieZapDAL::$dane_parametr_zap_max][$wierszId[$j]]))
                        {
                            //ponizsza linijka to podanie wartosci dla danego parametru :)
                            //indexem wartosci tego parametru w tablicy parametrow jest wartosc siedzaca w tablicy indexow parametrow nieruchomosci
                            //pod indexem bedacym id danego parametru
                            $this->ElementACD->wartosc = $this->daneBaza[WyposazenieZapDAL::$dane_parametr_zap_max_wartosc][$this->daneBaza[WyposazenieZapDAL::$dane_parametr_zap_max][$wierszId[$j]]];
                        }
                    }
                    
                    $this->ElementKolekcji->parametry[$wierszId[$j]] = $this->ElementACD;
                    //dod do kol
                    $j++;
                }
                if($j == 0)
                {
                    $this->ElementKolekcji = null;
                }
                else
                {
                $this->sekcjaKolekcjaParMax[$wiersz[WyposazenieZapDAL::$id_sekcja]] = $this->ElementKolekcji;
                $this->tabSekcja[$wiersz[WyposazenieZapDAL::$id_sekcja]] = $this->ElementKolekcji->nazwa_sekcja;
                }
                //dodanie do kolekcji 
                $i++;
            }
        }
    }
?>