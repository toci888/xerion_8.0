<?
    $path = str_replace($_SERVER['PHP_SELF'], '', $_SERVER['SCRIPT_FILENAME']).'/';
    include_once ($path.'dal/utilsdal.php');
    
    class dal
    {
        ///rozwazyc budowe konstruktora laczacego sie z baza i przygotowania pola do ktporego polaczenie jest zapisywane, 
        //w kolejnosci uzywac tego polaczenia. UZASADNIENIE:
        //podczas prowadzenia wielu operacji obiekt bedzie uzywany w petli i bombardowany zapytaniami, to spowoduje bombardowanie polaczeniami
        //zamiast tego na czas zycia calego skryptu trzeba wykonac jedno polaczenie, przy kazdym nowym utworzeniu obiektu nastepne
        //ale polaczenie powinno byc jedno na utworzenie obiektu a nei jedno na operacjê
        
        //pole chronione ze wzglêdu na brak zgody na modyfikacjê zawartoœci pola w obiekcie
        //po³¹czenie z baz¹ danych
        
        protected $db = null;
        //protected $conStr = 'host=localhost user=postgres dbname=testazg password=beatka';//test
        //protected $conStr = 'host=localhost user=postgres dbname=newazg password=beatka';//new
        protected $conStr = 'host=10.0.0.200 user=postgres dbname=azg_db password=beatka';//new
        
        public function dal ($conn = null)
        {
            if ($conn != null)
            {
                $this->conStr = 'host=localhost user=postgres dbname=geogazg password=beatka';
            }
        }
        
        //metoda s³u¿¹ca pobieraniu informacji z bazy danych
        //pierwszym parametrem jest tekst zapytania, drugi parametr jest traktowany jako wyjœciowy (zawiera referencjê)
        //gdy¿ w zmiennej jest podawana uzyskana iloœæ rekordów
        public function PobierzDane($zapytanie, &$IloscWierszy)
        {
            //przeprowadzenie operacji zapytania na bazie danych
            $result = pg_query($this->Polacz(), $zapytanie);
            $i = 0;
            //pêtla wczytuje kolejne rekordy wyniku
            while ($wiersz = pg_fetch_array($result))
            {
                //metoda statyczna usuwa kolumny indeksowane numerami, pozostawiaj¹c jedynie kolumny indeksowane nazwami kolmn tabeli w bazie
                $newArray[$i] = UtilsDAL::WytnijIndexNumer($wiersz);
                //inkrementacja licznika, przepisywanego docelowo jako iloœæ wierszy
                $i++;
            }
            //przekazanie iloœci otrzymanych z bazy danych rekordów
            $IloscWierszy = $i;
            //sprawdzenie, czy jakiekolwiek informacje s¹ do podania
            if(isset($newArray[0]))
            {
                //zwrócenie tablicy rezultatu zapytania
                return $newArray;
            }            
            else
            {
                //zwrócenie pustki, gdy¿ zapytanie nie odfiltrowa³o ¿adnego rekordu
                return null;
            }
        }
        //metoda wprowadzania danych do bazy, z uwglêdnieniem walidacji w procedurach
        //parametr rzutuj domyœlnie ustawiony na true dla wszystkich dodañ, gdzie wynikiem jest liczba; false nale¿y ustawiæ dla wynikow tekstowych
        //wyniki tekstowe maj¹ miejsce, kiedy baza danych zwraca przyczynê niepowodzenia
        public function WprowadzanieDanych($zapytanie, $rzutuj = true)
        {
            //uruchomienie zapytania na bazie danych
            $result = pg_query($this->Polacz(), $zapytanie);
            //wczytanie odpowiedzi otrzymanej z bazy danych
            $wiersz = pg_fetch_array($result);
            
            //rzutowanie wyników na typy PHP, jeœli rzutowanie jest oczekiwane
            if ($rzutuj)
            {
                foreach ($wiersz as $key => $value)
                {
                    if ($wiersz[$key] == 'null')
                    {
                        $wiersz[$key] = null;
                    }
                    else
                    {
                        $wiersz[$key] = (int)$wiersz[$key];
                    }
                }
            }
            //podanie wyniku; jeœli nie zarz¹dano rzutowania, tablica zawiera typy bazodanowe
            return $wiersz;
        }
        
        //metoda odpowiedzialna za uruchamianie procedur zwracaj¹cych w wyniku informacjê typu logicznego: prawda lub fa³œz
        public function OperacjaLogiczna($zapytanie)
        {
            //uruchomienie zapytania
            $result = pg_query($this->Polacz(), $zapytanie);
            //wczytanie odpowiedzi z bazy danych
            $wiersz = pg_fetch_array($result);
            
            //rzutowanie otrzymanej wartoœci logicznej
            if ($wiersz[0] == 't')
            {
                //operacja zakoñczy³a siê powodzeniem, zwracamy typ PHP
                return true;
            }
            else
            {
                //operacja zakoñczy³a siê niepowodzeniem, zwracamy równie¿ typ PHP
                return false;
            }
        }
        //to tylko na czas regionow :P
        public function InsUpNaZywca($query)  //update, del, ins
        {
            $result = pg_query($this->Polacz(), $query);
            $affRows = pg_affected_rows($result);
            return $affRows;
        }
        //metoda po³¹czenia do bazy danych
        protected function Polacz()
        {
            if ($this->db == null)
            {
                $this->db = pg_connect($this->conStr);
            }
            //po³¹czenie siê z baz¹ danych PostgreSQL przy pomocy posiadanego stringu
            //$db = pg_connect($this->conStr);
            //ustawienie kodowania znaków podawanego przez aplikacjê : zarówno baza danych jak i aplikacja pracuje na kodowaniu UTF 8
            //pg_set_client_encoding ($db, 'LATIN2');
            pg_set_client_encoding ($this->db, 'UTF8');
            
            //podanie zasobu utworzonego po³¹czenia
            return $this->db;
        }
    }
?>
