<?php
    $path = str_replace($_SERVER['PHP_SELF'], '', $_SERVER['SCRIPT_FILENAME']).'/';
    
    include_once ($path.'dal/queriesDAL.php');
    //klasa stanowi jeden z elementów tablicy t³umaczeñ. Powinna mieæ pola: id jezyka, nazwa jezyka, tablica asocjacyjna t³umaczeñ w postaci:
    //$tablica ['tag'] = 't³umaczenie';
    class JezykACD
    {
        public $id; //id_jezyk
        public $nazwa; //nazwa_jezyk
        public $tab_tlumaczenia = array(); //tablica tlumaczen 'nazwa_tag' => 'tlumaczenie'
    }
    
    class JezykBLL
    {
        //pole pojedynczego zestawu tlumaczen (typu jezykACD)
        protected $PojTlumaczenie;
        protected $TlumaczenieCol; //kolekcja(tablica) obiektow typu jezyk ACD
        protected $IloscJezykow; //pole nieuzywane, przechowuje ilosc jezykow dla ktorych wystepuja tlumaczenia
        protected $znakZast = '^'; //problem polega na tym, iz zwracane z bazy informacje bedace tlumaczeniami sa w tablicy (poprzecinkowane dane), tymczasem niektore tlumaczenia maja przecinki
        //w zwiazku z tym na bazie przecinki w tlumaczeniach zastapilem tym daszkiem, ktory nastepnie trzeba znow zamienic na przcinek  :/ :P
        //konstruktor klasy
        public function JezykBLL ()
        {
            $dal = new JezykDAL(); //utworzenie obiektu odpowiedzialnego za dostarczenie tlumaczen z bazy
            $wynik = $dal->Tlumaczenia($this->IloscJezykow); //pobranie tlumaczen z bazy
            $this->RozdzielTlumaczenia($wynik); //wywolanie metody rozdzielajacej tlumaczenia otrzymane z bazy
        }
        
        public function Tlumacz($id_jezyk, $tag) //metoda zwraca tlumaczenie danego tagu w danym jezyku
        {
            //echo $id_jezyk;
            //echo $tag;
            if (isset($this->TlumaczenieCol[$id_jezyk]))   //sprawdzenie czy w kolekcji jest zestaw tlumaczen dla zadanego jezyka
            {
                if (isset($this->TlumaczenieCol[$id_jezyk]->tab_tlumaczenia[$tag])) //sprawdzenie czy w tablicy tlumaczen wystepuje tlumaczenie takiego tagu
                {
                    return $this->TlumaczenieCol[$id_jezyk]->tab_tlumaczenia[$tag]; //podanie tlumaczenia
                }
                else
                {
                    return $tag;
                }
            }
            else
            {
                return null;
            }
        }
        public function TlumaczProstaTab($id_jezyk, $tab)
        {
            $i = 0;
            while(isset($tab[$i]))
            {
                $wiersz = $tab[$i];
                foreach ($wiersz as $klucz => $wartosc)
                {
                    if (!intval($wartosc))
                    {
                        $tab[$i][$klucz] = $this->Tlumacz($id_jezyk, $tab[$i][$klucz]);
                    }
                }
                $i++;
            }
            return $tab;
        }
        public function TlumaczZlozenieTag($id_jezyk, $zlozenie_tag, $rozdzielnik)
        {
            $tab_tag = explode($rozdzielnik, $zlozenie_tag);
            //print_r ($tab_tag);
            $rezultat = '';
            //licznik pozwalajacy doklejac rozdzielnik jesli $i > 0
            $i = 0;
            while(isset($tab_tag[$i]))
            {
                $wartosc = $tab_tag[$i];
                $tlum = $this->Tlumacz($id_jezyk, $wartosc);
                if ($i > 0)
                {
                    $tlum = $rozdzielnik.$tlum;
                }
                $rezultat .= $tlum;
                $i++;
            }
            
            return $rezultat;
        }
        public function PodajJezyki()
        {
            $i = 0;
            foreach ($this->TlumaczenieCol as $klucz => $wartosc)
            {
                $wiersz[JezykDAL::$id_jezyk] = $wartosc->id;
                $wiersz[JezykDAL::$nazwa] = $wartosc->nazwa;
                $jezyki[$i] = $wiersz;
                $i++;
            }
            
            return $jezyki;
        }
        //rozdzielenie tablicy podanej w parametrze
        protected function RozdzielTlumaczenia ($tab)
        {
            $i = 0;
            while(isset($tab[$i]))
            {
                //utworzenie nowego obiektu typu jezykacd dl akolejnego zestawu tlumaczen dla kolejnego jezyka
                $this->PojTlumaczenie = new JezykACD();
                
                $wiersz = $tab[$i];
                //wprowadzenie do obiektu id jezyka
                $this->PojTlumaczenie->id = $wiersz[JezykDAL::$id_jezyk];
                //wprowadzenie do obiektu nazwy jezyka
                $this->PojTlumaczenie->nazwa = $wiersz[JezykDAL::$nazwa];
                
                $j = 0;
                //przegladanie kolejnych elementow tablic z tagami, tlumaczeniami
                
                while(isset($wiersz[JezykDAL::$nazwa_tag][$j]))
                {
                    ////!!!!!!!!! komentarz ponizej boda zupelnie nieaktualny - wywalilem ten poziom zagniezdzenia
                    //tablice tlumaczen sa zagniezdzone poziom nizej przez metode utilsowa tabpg2tabphp ze wzgledu na metode utilsowa rekurencyjnego wyswietlania tablicy tablic
                    //zagniezdzenie jest logicznie 1 poziom za gleboko :P, ale sam to tak w utilsie zrobilem
                    //wiecej szczegolow w utilsdal przy metodzie konwersji
                        //wprowadzanie tlumaczenia dla kolejnych tagow
                    $this->PojTlumaczenie->tab_tlumaczenia[$wiersz[JezykDAL::$nazwa_tag][$j]] = str_replace($this->znakZast, ',', $wiersz[JezykDAL::$tlumaczenie][$j]);
                    $j++;
                }
                //zapamietanie tlumaczenia w kolekcji od indexu : id_jezyka calego obiektu tlumaczenia
                $this->TlumaczenieCol[$wiersz[JezykDAL::$id_jezyk]] = $this->PojTlumaczenie;
                $i++;
            }
            
        }
    }
?>