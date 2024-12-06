<?
    include_once ('t_utilsdal.php');
    
    class dal
    {
        ///rozwazyc budowe konstruktora laczacego sie z baza i przygotowania pola do ktporego polaczenie jest zapisywane, 
        //w kolejnosci uzywac tego polaczenia. UZASADNIENIE:
        //podczas prowadzenia wielu operacji obiekt bedzie uzywany w petli i bombardowany zapytaniami, to spowoduje bombardowanie polaczeniami
        //zamiast tego na czas zycia calego skryptu trzeba wykonac jedno polaczenie, przy kazdym nowym utworzeniu obiektu nastepne
        //ale polaczenie powinno byc jedno na utworzenie obiektu a nei jedno na operacjê
        
        //protected $conStr = 'host=localhost user=postgres dbname=testazg password=beatka';
        //protected $conStr = 'host=localhost user=postgres dbname=newazg password=beatka';
        protected $conStr = 'host=10.0.0.200 user=postgres dbname=azg_db password=beatka';
        
        public function dal ($conn = null)
        {
            if ($conn != null)
            {
                $this->conStr = 'host=localhost user=postgres dbname=geogazg password=beatka';
            }
        }
                
        public function PobierzDane($zapytanie, &$IloscWierszy)
        {
            $result = pg_query($this->Polacz(), $zapytanie);
            //$this->
            $i = 0;
            while ($wiersz = pg_fetch_array($result))
            {
                //pacnac util do wywalania indexowanych numerkami
                $newArray[$i] = UtilsDAL::WytnijIndexNumer($wiersz);
                //echo $newArray[$i]['nazwa'];
                $i++;
            }
            $IloscWierszy = $i;
            if(isset($newArray[0]))
            {
                return $newArray;
            }            
            else
            {
                return null;
            }
        }
        //parametr rzutuj domyslnie na true dla wszystkich dodan, gdzie wynikiem jest liczba; false nalezy ustawic dla wynikow textowych
        public function WprowadzanieDanych($zapytanie, $rzutuj = true)
        {
            $result = pg_query($this->Polacz(), $zapytanie);
            $wiersz = pg_fetch_array($result);
            
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
            
            return $wiersz;
        }
        public function OperacjaLogiczna($zapytanie)
        {
            $result = pg_query($this->Polacz(), $zapytanie);
            $wiersz = pg_fetch_array($result);
            
            if ($wiersz[0] == 't')
            {
                return true;
            }
            else
            {
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
        
        protected function Polacz()
        {
            $db = pg_connect($this->conStr);
            pg_set_client_encoding ($db, 'UTF8');

            //$encoding = pg_client_encoding($db);
            //echo $encoding;
            return $db;
        }
    }
?>