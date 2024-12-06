<?
    $path = str_replace($_SERVER['PHP_SELF'], '', $_SERVER['SCRIPT_FILENAME']).'/';
    include_once ($path.'dal/utilsdal.php');
    
    class dal
    {
        ///rozwazyc budowe konstruktora laczacego sie z baza i przygotowania pola do ktporego polaczenie jest zapisywane, 
        //w kolejnosci uzywac tego polaczenia. UZASADNIENIE:
        //podczas prowadzenia wielu operacji obiekt bedzie uzywany w petli i bombardowany zapytaniami, to spowoduje bombardowanie polaczeniami
        //zamiast tego na czas zycia calego skryptu trzeba wykonac jedno polaczenie, przy kazdym nowym utworzeniu obiektu nastepne
        //ale polaczenie powinno byc jedno na utworzenie obiektu a nei jedno na operacj�
        
        //pole chronione ze wzgl�du na brak zgody na modyfikacj� zawarto�ci pola w obiekcie
        //po��czenie z baz� danych
        
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
        
        //metoda s�u��ca pobieraniu informacji z bazy danych
        //pierwszym parametrem jest tekst zapytania, drugi parametr jest traktowany jako wyj�ciowy (zawiera referencj�)
        //gdy� w zmiennej jest podawana uzyskana ilo�� rekord�w
        public function PobierzDane($zapytanie, &$IloscWierszy)
        {
            //przeprowadzenie operacji zapytania na bazie danych
            $result = pg_query($this->Polacz(), $zapytanie);
            $i = 0;
            //p�tla wczytuje kolejne rekordy wyniku
            while ($wiersz = pg_fetch_array($result))
            {
                //metoda statyczna usuwa kolumny indeksowane numerami, pozostawiaj�c jedynie kolumny indeksowane nazwami kolmn tabeli w bazie
                $newArray[$i] = UtilsDAL::WytnijIndexNumer($wiersz);
                //inkrementacja licznika, przepisywanego docelowo jako ilo�� wierszy
                $i++;
            }
            //przekazanie ilo�ci otrzymanych z bazy danych rekord�w
            $IloscWierszy = $i;
            //sprawdzenie, czy jakiekolwiek informacje s� do podania
            if(isset($newArray[0]))
            {
                //zwr�cenie tablicy rezultatu zapytania
                return $newArray;
            }            
            else
            {
                //zwr�cenie pustki, gdy� zapytanie nie odfiltrowa�o �adnego rekordu
                return null;
            }
        }
        //metoda wprowadzania danych do bazy, z uwgl�dnieniem walidacji w procedurach
        //parametr rzutuj domy�lnie ustawiony na true dla wszystkich doda�, gdzie wynikiem jest liczba; false nale�y ustawi� dla wynikow tekstowych
        //wyniki tekstowe maj� miejsce, kiedy baza danych zwraca przyczyn� niepowodzenia
        public function WprowadzanieDanych($zapytanie, $rzutuj = true)
        {
            //uruchomienie zapytania na bazie danych
            $result = pg_query($this->Polacz(), $zapytanie);
            //wczytanie odpowiedzi otrzymanej z bazy danych
            $wiersz = pg_fetch_array($result);
            
            //rzutowanie wynik�w na typy PHP, je�li rzutowanie jest oczekiwane
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
            //podanie wyniku; je�li nie zarz�dano rzutowania, tablica zawiera typy bazodanowe
            return $wiersz;
        }
        
        //metoda odpowiedzialna za uruchamianie procedur zwracaj�cych w wyniku informacj� typu logicznego: prawda lub fa��z
        public function OperacjaLogiczna($zapytanie)
        {
            //uruchomienie zapytania
            $result = pg_query($this->Polacz(), $zapytanie);
            //wczytanie odpowiedzi z bazy danych
            $wiersz = pg_fetch_array($result);
            
            //rzutowanie otrzymanej warto�ci logicznej
            if ($wiersz[0] == 't')
            {
                //operacja zako�czy�a si� powodzeniem, zwracamy typ PHP
                return true;
            }
            else
            {
                //operacja zako�czy�a si� niepowodzeniem, zwracamy r�wnie� typ PHP
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
        //metoda po��czenia do bazy danych
        protected function Polacz()
        {
            if ($this->db == null)
            {
                $this->db = pg_connect($this->conStr);
            }
            //po��czenie si� z baz� danych PostgreSQL przy pomocy posiadanego stringu
            //$db = pg_connect($this->conStr);
            //ustawienie kodowania znak�w podawanego przez aplikacj� : zar�wno baza danych jak i aplikacja pracuje na kodowaniu UTF 8
            //pg_set_client_encoding ($db, 'LATIN2');
            pg_set_client_encoding ($this->db, 'UTF8');
            
            //podanie zasobu utworzonego po��czenia
            return $this->db;
        }
    }
?>
