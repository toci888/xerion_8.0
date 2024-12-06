<?php
    class Utils
    {
        public static function WyswietlTablice($tablica)
        {
            echo '<table border="1">';
            
            $wiersz = $tablica[0];
            echo '<tr>';    
            //naglowek tabeli    
            foreach ($wiersz as $key => $value)
            {
                if (!is_int($key))
                {
                    echo '<td>';
                    echo $key;
                    echo '</td>';
                }
            }
            
            echo '</tr>';
            $i = 0;
            
            while(isset($tablica[$i]))
            {
                //echo $tablica[$i]['nazwa'].'<br />';
                echo '<tr>';
                $wiersz = $tablica[$i];
                
                foreach ($wiersz as $key => $value)
                {
                    //if (is_int($key))
                    //{
                        echo '<td>';
                        if (!is_array($value))
                        {
                            echo $value;
                        }
                        else
                        {     
                            Utils::WyswietlTablice($value);
                        }
                        echo '</td>';
                    //}
                }
                
                echo '</tr>';
                $i++;
            }
            
            echo '</table>';
        }
        public static function KonwertujNaBool ($element)
        {
            if ($element == 't')
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
?>