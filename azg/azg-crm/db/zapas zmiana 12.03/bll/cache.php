<?php
    $path = str_replace($_SERVER['PHP_SELF'], '', $_SERVER['SCRIPT_FILENAME']).'/';
    include_once ($path.'bll/jezykibll.php');
    include_once ($path.'bll/agentbll.php');
    include_once ($path.'bll/listawskazanbll.php');
    
    class cachejezyki 
    {
        //$path = str_replace($_SERVER['PHP_SELF'], '', $_SERVER['SCRIPT_FILENAME']).'/';
        protected static $filename;
        
        static function Zapisz($data)
        {
            cachejezyki::$filename = str_replace($_SERVER['PHP_SELF'], '', $_SERVER['SCRIPT_FILENAME']).'/tmp/languages';
            $handle = fopen(cachejezyki::$filename, 'w');
            $obj = serialize($data);
            if (fwrite($handle, $obj) == false) 
            {
                throw new Exception('Z niewiadomych przyczyn nie zapisano do cache.');
            }
            fclose($handle); 
        }
        public static function Czytaj()
        {
            cachejezyki::$filename = str_replace($_SERVER['PHP_SELF'], '', $_SERVER['SCRIPT_FILENAME']).'/tmp/languages';
            if(!file_exists(cachejezyki::$filename))
            {
                $obiekt = new JezykBLL();
                cachejezyki::Zapisz($obiekt);
                return $obiekt;
            }
            if (!($data = unserialize(file_get_contents(cachejezyki::$filename))))
            {
                unlink(cachejezyki::$filename);
                return false;
            }
            else
            {
                return $data;
            }
        }
    }
    class CacheListaWskazan
    {
        protected static $katalog;
        
        public static function Zapisz($zapotrzebowanie_id, $agent_id, $obiekt)
        {
            CacheListaWskazan::$katalog = str_replace($_SERVER['PHP_SELF'], '', $_SERVER['SCRIPT_FILENAME']).'/tmp/listy_wsk/';
            if (!is_dir(CacheListaWskazan::$katalog.$agent_id.'/'))
            {
                mkdir(CacheListaWskazan::$katalog.$agent_id.'/', 0755, true);
            }
            $uchwyt = fopen(CacheListaWskazan::$katalog.$agent_id.'/'.$zapotrzebowanie_id, 'w');
            $obj = serialize($obiekt);
            if (fwrite($uchwyt, $obj) == false) 
            {
                throw new Exception('Z niewiadomych przyczyn nie zapisano do cache.');
            }
            fclose($uchwyt);
        }
        //trudno powiedziec, czy bedzie opcja zapytania prosto o dany obiekt, ale zdaniem autora to mozliwe
        public static function Czytaj($agent_id, $zapotrzebowanie_id = null)
        {
            CacheListaWskazan::$katalog = str_replace($_SERVER['PHP_SELF'], '', $_SERVER['SCRIPT_FILENAME']).'/tmp/listy_wsk/';
            if ($zapotrzebowanie_id == null)
            {
                //rzadanie wszystkich,  pomyslec o rozegraniu problemu
                //$obiekt = null;
            }
            else
            {
                if (file_exists(CacheListaWskazan::$katalog.$agent_id.'/'.$zapotrzebowanie_id))
                {
                    $dane = unserialize(file_get_contents(CacheListaWskazan::$katalog.$agent_id.'/'.$zapotrzebowanie_id));
                    return $dane;
                }
                else
                {
                    return null;
                }
                
                /*if ($uchwyt = opendir(CacheListaWskazan::$katalog.$agent_id))
                {
                    $i = 0;
                    while ($plik = readdir($uchwyt))
                    {
                        //echo $plik;
                        $element_kol = unserialize(file_get_contents($plik));
                        
                    }
                }
                else
                {
                    return null;
                } */
            }
        }
    }    
?>