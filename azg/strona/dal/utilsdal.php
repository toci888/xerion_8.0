<?php
    $path = str_replace($_SERVER['PHP_SELF'], '', $_SERVER['SCRIPT_FILENAME']).'/';
    
    include_once ($path.'dal/dal.php');
    include_once ($path.'bll/jezykibll.php');
    include_once ($path.'bll/cache.php');
    include_once ($path.'bll/tags.php');
    
    class UtilsDAL
    {
        //metoda przeznaczona do wycinania z wiersza kolumn indeksowanych numerami
        //parametr jest podawany jest przez referencjê, w zwi¹zku z czym podawana tablica jest modyfikowana
        public static function WytnijIndexNumer(&$tablica)
        {
            //nowy wiersz, do którego przepisujemy tylko kolumny indeksowane 'stringami'
            $resWiersz = array();
            
            foreach ($tablica as $key => $value)
            {
                //indeks jest tekstowy
                if (!is_int($key))
                {
                    //przepisanie elementu do nowego wiersza
                    //przy okazji konwersja pustych elementów na null typu PHP
                    if (strlen($value) > 0)
                    {
                        $resWiersz[$key] = $value;
                    }
                    else
                    {
                        $resWiersz[$key] = null;
                    }
                }
            }
            //podmiana tablic
            $tablica = $resWiersz;
            //podanie rezultatu
            return $resWiersz;
        }
        //metoda konwertuje tablice postgresowa na tablice php
        //parametr indexujdanymi okresla, czy otrymywane dane maja posluzyc jako indexery powstajacej tablicy
        //jest to przytpadek, kiedy bedziemy potrzebowali, by otrzymane dane tworzyly tablice z indexami
        //bedaymi informacja otrzymana z bazy w celu uzywania tego do sprawdzenia, czy dana informacja istnieje
        public static function TabPg2TabPhp(&$tablica, $indexTab, $indexujDanymi = false)
        {
            $i = 0;
            $sepB = '{';
            while (isset($indexTab[$i]))
            {
                $j = 0;
                while (isset($tablica[$j]))
                {  
                    //to przejscie chyba bylo niepotrzebne :P
                    //mozna wrocic do indexowania 2 wymiarowego, pytanie czy trzeba
                    $wiersz = $tablica[$j];
                    //var_dump($wiersz);
                    if (strlen($wiersz[$indexTab[$i]]) > 0)
                    {
                        //linijki konwertuja tablice postgresa na array php
                        //                       //wycinamy zawartosc z tabeli pgsql, jest ona w postaci {dsa,dsa,dsa}
                                                                          //ustalamy pozycje otwierajacego { - z tego miejsca tniemy, tniemy do miejsca: dlugosc calego stringu minus dlugosc poczatku - 2 : -1 nie lapalo wiec jets -2 - komputer sie nie myli :P
                        $wiersz[$indexTab[$i]] = substr($wiersz[$indexTab[$i]], strpos($wiersz[$indexTab[$i]], $sepB) + 1, ((strlen($wiersz[$indexTab[$i]])) - (strpos($wiersz[$indexTab[$i]], $sepB)) - 2));
                        $wiersz[$indexTab[$i]] = str_replace('"', '', $wiersz[$indexTab[$i]]);
                        //var_dump($wiersz[$indexTab[$i]]);
                        if ($indexujDanymi)
                        {
                            $tabWynik = explode(',', $wiersz[$indexTab[$i]]);
                            $nowaTab = array();
                            foreach ($tabWynik as $klucz => $wartosc)
                            {
                                //idea jest nastepujaca: tablice[wartosc] stanowi dla nas sama w sobie informacje, ze dany parametr
                                //istnieje dla tej nieruchomosci. w zwiazku z tym to co siedzi juz fizycznie wewnatrz tablicy nie gra roli
                                //dlatego dajemy tam poprzedni zwykly index - ten stary.
                                //dlaczego ?? przydaje sie on do wskazania wartosci dla parametru nieruchomosci w tablicy wartosci parametrow nieruchomosci :)
                                $nowaTab[$wartosc] = $klucz;
                            }
                            $wiersz[$indexTab[$i]] = $nowaTab;
                        }
                        else
                        {
                            //indexowanie danymi jest niekonieczne, wiec zwyczajnie rozwalamy tablice :P
                            $wiersz[$indexTab[$i]] = explode(',', $wiersz[$indexTab[$i]]);
                            foreach ($wiersz[$indexTab[$i]] as $klucz => $wartosc)
                            {
                                if ($wartosc == 'NULL')
                                {
                                    $wiersz[$indexTab[$i]][$klucz] = null;
                                }
                            }
                        }
                        //$zm[$indexTab[$i]] = explode(',', $wiersz[$indexTab[$i]]);
                        //$zm[0] = explode(',', $wiersz[$indexTab[$i]]);
                        //$wiersz[$indexTab[$i]] = $zm;//explode(',', $tablica[$indexTab[$i]]);
                        
                        $tablica[$j] = $wiersz;
                    }
                    $j++;
                }
                $i++;
            }                                        //dodaj apostrof - cos dla textu
        }                                         //true, false
        public static function TabPhp2TabPg($tab, $dodApos, &$wynik)
        {
            $sep = ',';
            $apos = '\'';
            $przecinek = 0;
            $i = 0;
            $wynik = 'ARRAY[';
            if (is_array($tab))
            foreach ($tab as $wiersz)
            {
                if ($dodApos)
                {
                    $wiersz = $apos.$wiersz.$apos;
                }
                if ($przecinek == 0)
                {
                    $przecinek = 1;
                }
                else
                {
                    $wiersz = $sep.$wiersz;
                }
                $wynik .= $wiersz;
                $i++;
            }
            $wynik .= ']';
            //w przypadku, kiedy i bedzie rowne 0 mamy do czynienia z pusta tablica, w tej sytuacji procedurze powinien byc podany null
            if ($i > 0)
            {
                return $wynik;
            }
            else
            {
                return 'null';
            }
        }
        //metoda do tworzenia tablicy indexowanej unikatowym id z bazy
        public static function TabIdNazwa2TabIndexId(&$tablica, $nazwa, $inne_id = null)
        {
            $id = 'id';
            if ($inne_id != null)
            {
                $id = $inne_id;
            }
            //utworzenie nowej tablicy na potrzeby utworzenia tablicy indexowanej id
            $wynik = array();
            //przegladanie calej tablicy otrzymanej z bazy
            if ($tablica != null)
            foreach ($tablica as $wiersz)
            {
                //tworzenie elementu tablicy indexowanego id
                $wynik[$wiersz[$id]] = $wiersz[$nazwa];
            }
            $tablica = $wynik;
            //zwracanie tak na wszelki wypadek :P
            return $tablica;
        }    
        //Zamiana t na true ze wskazanych kolumnach z bazy danych a f na false
        public static function KorektaKolBool (&$tablica, $indexTab)
        {
            $j = 0;
            while (isset($tablica[$j]))
            {
                $i = 0;
                while (isset($indexTab[$i]))
                {
                    if ($tablica[$j][$indexTab[$i]] == 't')
                    {
                        $tablica[$j][$indexTab[$i]] = true;
                    }
                    else
                    {
                        $tablica[$j][$indexTab[$i]] = false;
                    }
                    $i++;
                }
                $j++;
            }
        }
        //przetwarzanie boola z bazy danych na haslo yes no :P
        public static function KonwersjaDbBoolText (&$tablica, $indexTab) 
        {
            $j = 0;
            while (isset($tablica[$j]))
            {
                $i = 0;
                while (isset($indexTab[$i]))
                {
                    if ($tablica[$j][$indexTab[$i]] == 't')
                    {
                        $tablica[$j][$indexTab[$i]] = tags::$tak;
                    }
                    else
                    {
                        $tablica[$j][$indexTab[$i]] = tags::$nie;
                    }
                    $i++;
                }
                $j++;
            }
        }
        public static function PodajSlownik ($nazwaTab)
        {
            $dal = new dal();
            $zapytanie = "select * from DaneSlownik ('".$nazwaTab."');";
            $wynik = $dal->PobierzDane($zapytanie, $iloscWierszy);
            $tlumaczenia = cachejezyki::Czytaj();
            $i = 0;
            while ($wynik[$i])
            {
                $wynik[$i]['nazwa'] = $tlumaczenia->Tlumacz($_SESSION['wyb_jezyk'], $wynik[$i]['nazwa']);
                $i++;
            }
            
            return $wynik;
        }
    }
?>