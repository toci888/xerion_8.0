<?php
    $path = str_replace($_SERVER['PHP_SELF'], '', $_SERVER['SCRIPT_FILENAME']).'/';
    include_once ($path.'bll/jezykibll.php');
    include_once ($path.'bll/regionybll.php');
    include_once ($path.'bll/agentbll.php');
    include_once ($path.'bll/listawskazanbll.php');
    include_once ($path.'bll/ofertystronabll.php');
    
    class cachejezyki 
    {
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
        public static function ResetRead()
        {
            cachejezyki::$filename = str_replace($_SERVER['PHP_SELF'], '', $_SERVER['SCRIPT_FILENAME']).'/tmp/languages';
            unlink(cachejezyki::$filename);
            $obiekt = new JezykBLL();
            cachejezyki::Zapisz($obiekt);
            return $obiekt;
        }
    }
    class cacheregiony 
    {
        protected static $filename;
        
        static function Zapisz($data, $id_region)
        {
            cacheregiony::$filename = str_replace($_SERVER['PHP_SELF'], '', $_SERVER['SCRIPT_FILENAME']).'/tmp/regiony/'.$id_region;
            $handle = fopen(cacheregiony::$filename, 'w');
            $obj = serialize($data);
            if (fwrite($handle, $obj) == false) 
            {
                throw new Exception('Z niewiadomych przyczyn nie zapisano do cache.');
            }
            fclose($handle); 
        }
        public static function Czytaj($id_region, $nazwa)
        {
            cacheregiony::$filename = str_replace($_SERVER['PHP_SELF'], '', $_SERVER['SCRIPT_FILENAME']).'/tmp/regiony/'.$id_region;
            if(!file_exists(cacheregiony::$filename))
            {
                $obiekt = new RegionyBLL($id_region, $nazwa);
                cacheregiony::Zapisz($obiekt, $id_region);
                return $obiekt;
            }
            if (!($data = unserialize(file_get_contents(cacheregiony::$filename))))
            {
                unlink(cacheregiony::$filename);
                return false;
            }
            else
            {
                return $data;
            }
        }
        public static function ResetRead($id_region, $nazwa)
        {
            cacheregiony::$filename = str_replace($_SERVER['PHP_SELF'], '', $_SERVER['SCRIPT_FILENAME']).'/tmp/regiony/'.$id_region;
            unlink(cacheregiony::$filename);
            $obiekt = new RegionyBLL($id_region, $nazwa);
            cacheregiony::Zapisz($obiekt, $id_region);
            return $obiekt;
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
                //echo CacheListaWskazan::$katalog.$agent_id.'/'.$zapotrzebowanie_id;
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
        public static function Usun($agent_id, $zapotrzebowanie_id)
        {
            CacheListaWskazan::$katalog = str_replace($_SERVER['PHP_SELF'], '', $_SERVER['SCRIPT_FILENAME']).'/tmp/listy_wsk/';

            if (file_exists(CacheListaWskazan::$katalog.$agent_id.'/'.$zapotrzebowanie_id))
            {
                unlink(CacheListaWskazan::$katalog.$agent_id.'/'.$zapotrzebowanie_id);
                return true;
            }
            else
            {
                return false;
            }
        }
        public static function PodajListyAgent($agent_id)
        {
            CacheListaWskazan::$katalog = str_replace($_SERVER['PHP_SELF'], '', $_SERVER['SCRIPT_FILENAME']).'/tmp/listy_wsk/';
            $tab_res = array();
            $zwroc_tab = false;
            //otwarcie katalogu danego agenta, gdzie sa listy wskazan zserializowane
            if (is_dir(CacheListaWskazan::$katalog.$agent_id))
            {
                if ($uchwyt = opendir(CacheListaWskazan::$katalog.$agent_id))
                {
                    //przegladanie katalogu
                    while ($plik = readdir($uchwyt))
                    {
                        if (is_numeric($plik))
                        {
                            $tab_res[$plik] = $plik;
                            $zwroc_tab = true;
                        }
                    }
                    if ($zwroc_tab)
                    {
                        return $tab_res;
                    }
                    else
                    {
                        return null;
                    }
                }
            }
            else
            {
                return null;
            } 
        }
        public static function PodajAgenci()
        {
            CacheListaWskazan::$katalog = str_replace($_SERVER['PHP_SELF'], '', $_SERVER['SCRIPT_FILENAME']).'/tmp/listy_wsk/';
            $tab_res = array();
            $zwroc_tab = false;
            if ($uchwyt = opendir(CacheListaWskazan::$katalog))
            {
                //przegladanie katalogu
                while ($plik = readdir($uchwyt))
                {
                    if (is_numeric($plik))
                    {
                        $tab_res[$plik] = $plik;
                        $zwroc_tab = true;
                    }
                }
                if ($zwroc_tab)
                {
                    return $tab_res;
                }
                else
                {
                    return null;
                }
            }
        }
    }
    class cacheStrona
    {
        protected static $nier_id = 'nier_id';
        protected static $trans_id = 'trans_id';
        
        //str_replace($_SERVER['PHP_SELF'], '', $_SERVER['SCRIPT_FILENAME']).'/tmp/strona/'
        public static function Czytaj($id_trans_rodzaj, $id_nier_rodzaj)
        {
            $sciezka = str_replace($_SERVER['PHP_SELF'], '', $_SERVER['SCRIPT_FILENAME']).'/tmp/strona/';
            if (file_exists($sciezka.cacheStrona::$nier_id.$id_nier_rodzaj.cacheStrona::$trans_id.$id_trans_rodzaj))
            {
                $handle = fopen($sciezka.cacheStrona::$nier_id.$id_nier_rodzaj.cacheStrona::$trans_id.$id_trans_rodzaj, 'r');
                flock($handle, LOCK_EX);
                $dane = unserialize(file_get_contents($sciezka.cacheStrona::$nier_id.$id_nier_rodzaj.cacheStrona::$trans_id.$id_trans_rodzaj));
                flock($handle, LOCK_UN);
                fclose($handle);
                return $dane;
            }
            else
            {
                return null;
            }
        }
        public static function Zapisz($obiekt, $id_trans_rodzaj, $id_nier_rodzaj)
        {
            $sciezka = str_replace($_SERVER['PHP_SELF'], '', $_SERVER['SCRIPT_FILENAME']).'/tmp/strona/'.cacheStrona::$nier_id.$id_nier_rodzaj.cacheStrona::$trans_id.$id_trans_rodzaj;
            $uchwyt = fopen($sciezka, 'w');
            flock($uchwyt, LOCK_EX);
            $obj = serialize($obiekt);
            if (fwrite($uchwyt, $obj) == false) 
            {
                throw new Exception('Z niewiadomych przyczyn nie zapisano do cache.');
            }
            flock($uchwyt, LOCK_UN);
            fclose($uchwyt);
        }
        
        public static function CzytajOferta($id_oferta)
        {
            $sciezka = str_replace($_SERVER['PHP_SELF'], '', $_SERVER['SCRIPT_FILENAME']).'/tmp/strona/oferty/';
            if (file_exists($sciezka.$id_oferta))
            {
                $handle = fopen($sciezka.$id_oferta, 'r');
                flock($handle, LOCK_EX);
                $dane = unserialize(file_get_contents($sciezka.$id_oferta));
                flock($handle, LOCK_UN);
                fclose($handle);
                return $dane;
            }
            else
            {
                return null;
            }
        }
        public static function ZapiszOferta($obiekt, $id_oferta)
        {
            $sciezka = str_replace($_SERVER['PHP_SELF'], '', $_SERVER['SCRIPT_FILENAME']).'/tmp/strona/oferty/'.$id_oferta;
            $uchwyt = fopen($sciezka, 'w');
            flock($uchwyt, LOCK_EX);
            $obj = serialize($obiekt);
            if (fwrite($uchwyt, $obj) == false) 
            {
                throw new Exception('Z niewiadomych przyczyn nie zapisano do cache.');
            }
            flock($uchwyt, LOCK_UN);
            fclose($uchwyt);
        }
        ///zapisy i odczyty do nowosci i polecamy
        public static function CzytajOfertaSpecjalna($plik)
        {
            $sciezka = str_replace($_SERVER['PHP_SELF'], '', $_SERVER['SCRIPT_FILENAME']).'/tmp/strona/'.$plik;
            if (file_exists($sciezka))
            {
                $dane = unserialize(file_get_contents($sciezka));
                return $dane;
            }
            else
            {
                return null;
            }
        }
        public static function ZapiszOfertaSpecjalna($obiekt, $plik)
        {
            $sciezka = str_replace($_SERVER['PHP_SELF'], '', $_SERVER['SCRIPT_FILENAME']).'/tmp/strona/'.$plik;
            $uchwyt = fopen($sciezka, 'w');
            $obj = serialize($obiekt);
            if (fwrite($uchwyt, $obj) == false) 
            {
                throw new Exception('Z niewiadomych przyczyn nie zapisano do cache.');
            }
            fclose($uchwyt);
        }
    }
    class cacheGablota
    {
        protected static $filename;
        
        public static function Zapisz($data)
        {
            cacheGablota::$filename = str_replace($_SERVER['PHP_SELF'], '', $_SERVER['SCRIPT_FILENAME']).'/tmp/gablota';
            $handle = fopen(cacheGablota::$filename, 'w');
            $obj = serialize($data);
            if (fwrite($handle, $obj) == false) 
            {
                throw new Exception('Z niewiadomych przyczyn nie zapisano do cache.');
            }
            fclose($handle); 
        }
        public static function Czytaj()
        {
            cacheGablota::$filename = str_replace($_SERVER['PHP_SELF'], '', $_SERVER['SCRIPT_FILENAME']).'/tmp/gablota';
            if (file_exists(cacheGablota::$filename))
            {
                if (!($data = unserialize(file_get_contents(cacheGablota::$filename))))
                {
                    unlink(cacheGablota::$filename);
                    return null;
                }
                else
                {
                    return $data;
                }
            }
            else
            {
                return null;
            }
        }
        public static function Usun()
        {
            cacheGablota::$filename = str_replace($_SERVER['PHP_SELF'], '', $_SERVER['SCRIPT_FILENAME']).'/tmp/gablota';
            unlink(cacheGablota::$filename);
        }
    }
    class cacheOfertyDzielnica
    {
        public static function ZapiszDzielnica($id_dzielnica, $id_trans_rodzaj, $id_nier_rodzaj, $tablica)
        {
            $sciezka = str_replace($_SERVER['PHP_SELF'], '', $_SERVER['SCRIPT_FILENAME']).'/tmp/strona/dzielnice/'.$id_dzielnica.'_'.$id_trans_rodzaj.'_'.$id_nier_rodzaj;
            $uchwyt = fopen($sciezka, 'w');
            flock($uchwyt, LOCK_EX);
            $obj = serialize($tablica);
            if (fwrite($uchwyt, $obj) == false) 
            {
                throw new Exception('Z niewiadomych przyczyn nie zapisano do cache.');
            }
            flock($uchwyt, LOCK_UN);
            fclose($uchwyt);
        }
        public static function CzytajDzielnica($id_dzielnica, $id_trans_rodzaj, $id_nier_rodzaj)
        {
            $sciezka = str_replace($_SERVER['PHP_SELF'], '', $_SERVER['SCRIPT_FILENAME']).'/tmp/strona/dzielnice/';
            if (file_exists($sciezka.$id_dzielnica.'_'.$id_trans_rodzaj.'_'.$id_nier_rodzaj))
            {
                $handle = fopen($sciezka.$id_dzielnica.'_'.$id_trans_rodzaj.'_'.$id_nier_rodzaj, 'r');
                flock($handle, LOCK_EX);
                $dane = unserialize(file_get_contents($sciezka.$id_dzielnica.'_'.$id_trans_rodzaj.'_'.$id_nier_rodzaj));
                flock($handle, LOCK_UN);
                fclose($handle);
                return $dane;
            }
            else
            {
                return null;
            }
        }
    }
    class cacheKursyWalut
    {
        public static function ZapiszKursy($tablica)
        {
            $sciezka = str_replace($_SERVER['PHP_SELF'], '', $_SERVER['SCRIPT_FILENAME']).'/tmp/strona/kursy';
            $uchwyt = fopen($sciezka, 'w');
            flock($uchwyt, LOCK_EX);
            $obj = serialize($tablica);
            if (fwrite($uchwyt, $obj) == false) 
            {
                throw new Exception('Z niewiadomych przyczyn nie zapisano do cache.');
            }
            flock($uchwyt, LOCK_UN);
            fclose($uchwyt);
        }
        public static function CzytajKursy()
        {
            $sciezka = str_replace($_SERVER['PHP_SELF'], '', $_SERVER['SCRIPT_FILENAME']).'/tmp/strona/kursy';
            if (file_exists($sciezka))
            {
                $handle = fopen($sciezka, 'r');
                flock($handle, LOCK_EX);
                $dane = unserialize(file_get_contents($sciezka));
                flock($handle, LOCK_UN);
                fclose($handle);
                return $dane;
            }
            else
            {
                return null;
            }
        }
    }
?>