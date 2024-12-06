<?php
    $path = str_replace($_SERVER['PHP_SELF'], '', $_SERVER['SCRIPT_FILENAME']).'/';
    
    //include_once ($path.'export/otodom/OtoDomTypes.php');
    include_once ($path.'bll/jezykibll.php');
    include_once ($path.'bll/cache.php');
    include_once ($path.'ui/utilsui.php');
    include_once ($path.'lib/ziplib.php');
    //include_once ($path.'lib/Zip.php');
    
    class Domiporta
    {
        protected $serwerAdres = 'importy.trader.pl'; ///orginalne domiportowe ??
        ///ftp://nieruchazg:9ir2rjfmv@importy.trader.pl/pictures/
        protected $user = 'nieruchazg';//azg //nieruchazg
        protected $password = '9ir2rjfmv';  //9ir2rjFmV //p93cpssq
        protected $ftpUrl = 'ftp://';
        protected $plik = 'zbior.xml';
        protected $enc_zr = 'UTF-8';
        protected $enc_doc = 'WINDOWS-1250';
        protected $naglowek = '<?xml version=\'1.0\' encoding=\'Windows-1250\' standalone=\'yes\'?><Trader><Informacje><RodzajPaczki>przyrost</RodzajPaczki></Informacje>';
        protected $nazwa_wys_plik;
        protected $zip_arch;
        protected $oferta;
        protected $tlumaczenia;
        protected $zdjecia_tablica;
        
        protected $tab_maping = array('oferty' => 'oferta');
        
        protected $dal;

        
        protected function CreateFtpUrl()
        {
            $this->ftpUrl .= $this->user.':'.$this->password.'@'.$this->serwerAdres.'/';
        }
        
        public function Domiporta()
        {
            $this->tlumaczenia = cachejezyki::Czytaj();
            $this->dal = new ExportDAL();
            $this->CreateFtpUrl();
            $this->nazwa_wys_plik = 'trader-'.date('Ymd').'-'.date('His').'-przyrost.zip';
            $this->zip_arch = new Ziplib($this->nazwa_wys_plik); 
        }
        public function PublikujDomiporta($id_oferta, $automat = false, $wymus = false)
        {
            ///sprawdzenie, czy oferta nie jest juz czasem tam opublikowana
            $obecnosc = $this->dal->SprawdzAktOfwPortalu($id_oferta, 'Domiporta');
            $obecnosc = $obecnosc[0];
            if ($wymus)
            {
                if ($obecnosc[ExportDAL::$ilosc] == 0)
                {
                    $obecnosc[ExportDAL::$ilosc] = 1;
                }
            }
            //w ilosc jest null jesli oferty nie ma, -1 jesli bylaby deaktywowana lub > 0 jesli wymaga ona przesuwania do przodu o iles jedn czasu
            //w domiporcie oferty sa chyba automatycznie prolongowane jesli nie zostaly usuniete wiec wyliczanie dat jest bez sensupozostaje interpretacja -1
            //jesli ilosc wierszy > 0 nie publikujemy
            if ($obecnosc[ExportDAL::$ilosc] == null || $obecnosc[ExportDAL::$ilosc] == -1 || $obecnosc[ExportDAL::$ilosc] > 0)
            {
                ///zwracac jakos rezultat proby publikacji - moze te komunikacje ftp jakos otrykac ??:>
                $this->WyslijOferta($id_oferta, $automat);
                //ewentualna aktywacja zrobi sie samoczynnie przy otodom, wiec ten update nie jest potrzebny
                //opublikowano w domiporcie
                return true;
            }
            else
            {
                //nie publikowano w domiporcie
                return false;
            }
        }
        public function UsunOferta($id_oferta)
        {
            $this->oferta = $this->naglowek.'<Usun><id>'.$id_oferta.'</id></Usun></Trader>';
            $handle = fopen($this->plik, 'w');
            fwrite($handle, $this->oferta);
            fclose($handle);
            $this->zip_arch->zl_add_file($this->plik, $this->plik, 1);
            $arch = $this->zip_arch->zl_pack();
            
            copy($this->nazwa_wys_plik, $this->ftpUrl.$this->nazwa_wys_plik);
            //copy($this->plik, $this->ftpUrl.$this->nazwa_wys_plik);
            rename($this->ftpUrl.$this->nazwa_wys_plik, $this->ftpUrl.'ok-'.$this->nazwa_wys_plik);
        }
        ///na moj nos dla podajoferty wystarczy wywolac wiele razy podajoferte
        public function WyslijOferty($oferty_tablica, $oferty_usun_tablica)
        {
            $this->oferta .= '<oferty>';
            if (is_array($oferty_tablica))
            foreach ($oferty_tablica as $oferta_id)
            {
                //to zalatwia xml oraz wydzielenie zdjec
                $this->PodajOferte($oferta_id['id_oferta'], true, null);
                //dodanie zdjec do archiwum
                $this->DodajZdjDoArch($this->zdjecia_tablica);
                //kasowanie tablicy zdjec - sa juz w archiwum
                $this->zdjecia_tablica = null;
            }
            $this->oferta .= '</oferty>'; 
            //xml z ofertami do publikacji gotowy, dodac do usuniecia
            if (is_array($oferty_usun_tablica))
            foreach ($oferty_usun_tablica as $oferta_id)
            {
                $this->oferta .= '<Usun><id>'.$oferta_id.'</id></Usun>';
            }
            //zapis xml
            $this->oferta = $this->naglowek.$this->oferta.'</Trader>';
            $handle = fopen($this->plik, 'w');
            fwrite($handle, $this->oferta);
            fclose($handle);
            
            $this->zip_arch->zl_add_file($this->plik, $this->plik, 1);
            $arch = $this->zip_arch->zl_pack();
            copy($this->nazwa_wys_plik, $this->ftpUrl.$this->nazwa_wys_plik);            
            rename($this->ftpUrl.$this->nazwa_wys_plik, $this->ftpUrl.'ok-'.$this->nazwa_wys_plik);
        }
        //customowo oferta pod domiporte - jak cala ta klasa (?!)
        protected function TablicaDoXML ($tablica, &$xml, $tag_glowny, $src_enc, $dest_enc)
        {
            $polski = 1;
            if ($tag_glowny != '')
            {
                $xml .= '<'.$tag_glowny.'>';
            }
            foreach ($tablica as $klucz => $wartosc)
            {
                if (is_array($wartosc))
                {
                    $tag_zagn = $tag_glowny;
                    if ($tag_glowny == null)
                        $tag_zagn = 'oferta';
                    //ten mapping to nie ma sensu :P - jeden element tablicy i przez to zamiast jednego 2 warunki logiczne
                    if (isset($this->tab_maping[$tag_glowny]))
                    {
                        $tag_zagn = $this->tab_maping[$tag_glowny];
                    }
                    ////php jak porownuje string do liczby to tworzy niezbadane banialuki, jesli przy porownaniu wiadomo, ze cos moze miec rozbierzne typy rzutowac
                    if (ExportDAL::$zdjecia != $klucz || is_int($klucz))
                    {
                        $this->TablicaDoXML($wartosc, $xml, $tag_zagn, $src_enc, $dest_enc);
                    }
                    else
                    {
                        $this->ZdjeciaXML($wartosc, $xml, $src_enc, $dest_enc);
                    }
                }
                else
                {
                    if ($wartosc != null)
                    {
                        $wartosc = $this->tlumaczenia->Tlumacz($polski, $wartosc);
                        $wartosc = iconv($src_enc, $dest_enc, $wartosc);
                        //zamiana <>
                        //$wartosc = str_replace('>', '&gt;', $wartosc);
                        //$wartosc = str_replace('<', '&lt;', $wartosc);
                        $test = strpos($wartosc, '<');
                        $test_amp = strpos($wartosc, '&');
                        if (!($test > -1) && !($test_amp > -1))
                        {
                            if (is_int($klucz))
                            {
                                $xml .= '<'.$tag_glowny.'>';
                                $xml .= $wartosc;
                                $xml .= '</'.$tag_glowny.'>';
                            }
                            else
                            {
                                $xml .= '<'.$klucz.'>';
                                $xml .= $wartosc;
                                $xml .= '</'.$klucz.'>';
                            }
                        }
                    }
                }
            }
            if ($tag_glowny != '')
            {
                $xml .= '</'.$tag_glowny.'>';
            }
            //$xml = .$xml;
        }
        protected function ZdjeciaXML($tab_zdj, &$xml, $src_enc, $dest_enc)
        {
            $this->zdjecia_tablica = $tab_zdj;
            
            $xml .= '<'.ExportDAL::$zdjecia.'>';
            foreach ($tab_zdj as $klucz => $wartosc)
            {
                $tab_adr = explode('/', $wartosc);
                $xml .= '<'.ExportDAL::$zdjecie.'>';
                $xml .= '<'.ExportDAL::$nazwazdjecia.'>';
                $xml .= $tab_adr[count($tab_adr) - 1];
                $xml .= '</'.ExportDAL::$nazwazdjecia.'>';
                $xml .= '</'.ExportDAL::$zdjecie.'>';
            }
            $xml .= '</'.ExportDAL::$zdjecia.'>';
        }
        
        protected function PodajOferte($id_oferta, $automat = false, $tag_gl = 'oferty')
        {
            $wynik = $this->dal->PodajOfertaDomiporta($id_oferta, $automat);
            $this->TablicaDoXML($wynik, $this->oferta, $tag_gl, 'UTF-8', 'WINDOWS-1250');
            //odnotowanie w bazie wysylki
            $wynik = $this->dal->OgloszenieDomiporta($id_oferta);
        }
        ///automat przy nocnych historiach bedzie mial to samo znaczenie co w otodom - sciezki do zdjec
        protected function WyslijOferta($id_oferta, $automat = false)
        {
            $this->PodajOferte($id_oferta, $automat);
            $this->oferta = $this->naglowek.$this->oferta.'<Usun></Usun></Trader>';
            $handle = fopen($this->plik, 'w');
            fwrite($handle, $this->oferta);
            fclose($handle);
            $this->zdjecia_tablica[] = $this->plik;
            $this->DodajZdjDoArch($this->zdjecia_tablica);
            $arch = $this->zip_arch->zl_pack();
            
            copy($this->nazwa_wys_plik, $this->ftpUrl.$this->nazwa_wys_plik);            
            rename($this->ftpUrl.$this->nazwa_wys_plik, $this->ftpUrl.'ok-'.$this->nazwa_wys_plik);
        }
        protected function DodajZdjDoArch($zdjecia_tablica)
        {
            if (is_array($zdjecia_tablica))
            foreach ($zdjecia_tablica as $zdjecie)
            {
                $tab_adr = explode('/', $zdjecie);
                $this->zip_arch->zl_add_file($zdjecie, $tab_adr[count($tab_adr) - 1], 1);
            }
        }
    }
?>