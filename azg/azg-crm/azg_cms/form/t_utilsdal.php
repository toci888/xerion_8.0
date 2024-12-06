<?php   
    include_once ('t_dal.php');

    class UtilsDAL
    {
        ///metoda przeznaczona do wycinania z wiersza kolumn indexowanych numerami
        public static function WytnijIndexNumer(&$tablica)
        {
            //nowy wiersz, do ktorego przepisujemy tylko kolumny indexowane 'stringami'
            $resWiersz = array();
            
            foreach ($tablica as $key => $value)
            {
                
                //jesli index jest textowy
                if (!is_int($key))
                {
                    //przepisanie lementu do nowego wiersza
                    $resWiersz[$key] = $value;
                }
            }
            //podmiana wierszy
            $tablica = $resWiersz;
            return $resWiersz;
            //var_dump($tablica);
        }
    }
?>