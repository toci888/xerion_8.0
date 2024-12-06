<?php
    $path = str_replace($_SERVER['PHP_SELF'], '', $_SERVER['SCRIPT_FILENAME']).'/';
    
    //include_once ($path.'export/otodom/OtoDomTypes.php');
    include_once ($path.'bll/jezykibll.php');
    include_once ($path.'bll/cache.php');
    include_once ($path.'ui/utilsui.php');
    include_once ($path.'lib/ziplib.php');
    include_once ($path.'export/portal_arch.php');
    
    /*
    * zasadniczo ideologia jest taka:
    * - wczytanie wszystkich aktualnych ofert z bazy
    * - wczytaine ofert do usuniecia
    * - poagregowanie jednego i drugiego lub po prosty pêtleniei przegladanie elementow
    * - budowa xml przy petleniu agregacyjnym
    * - przerzucanie listy zdjec do osobnej tablicy
    * - wyslanie xml  - ewentualnie wszystko do zipa i jazda
    * - wyslanie zdjec
    */
    class GazetaDom extends ArchiwizacjaPortal
    {
        ///ftp://az_gwarancja:gazeta?435@ftp.gazetadom.pl
        protected $serwerAdres = 'ftp.gazetadom.pl'; ///orginalne ofert.net trzeba skolowac
        protected $user = 'az_gwarancja';
        protected $password = 'gazeta?435';  
        protected $ftpUrl = 'ftp://';
        protected $plik = 'gazetadom.xml';
        protected $enc_zr = 'UTF-8';
        protected $enc_doc = 'ISO-8859-2';
        protected $nazwa_wys_plik = 'gazetadomazg.zip';
        protected $zip_arch;
        protected $polski_jezyk = 1;
        //protected $czas;
        protected $naglowek = '<?xml version="1.0" encoding="ISO-8859-2" standalone="yes"?><dane><id_agencji>1</id_agencji>';
        protected $oferta;
        protected $tlumaczenia;
        protected $zdjecia_tablica;
        protected $oferty; ///tablica ofert do publikacji
        protected $oferty_akt; ///tablica ofert aktualnych
        protected $oferty_usun; ///tablica ofert do zdjecia
        protected $tab_nier_rodzaj = array(1 => 'dom', 2 => 'mieszkanie', 3 => 'dom', 4 => 'dom', 5 => 'grunt', 6 => 'grunt');
        //protected $tab_nier_rodzaj_zdj = array(1 => 'd', 2 => 'm', 3 => 'l', 4 => 'l', 5 => 'z', 6 => 'z');
        protected $tab_trans_rodzaj = array(1 => 'sprzeda¿', 2 => 'wynajem');
        //protected $tab_trans_rodzaj_zdj = array(1 => 's', 2 => 'w');
        
        protected $dal;

        
        protected function CreateFtpUrl()
        {
            $this->ftpUrl .= $this->user.':'.$this->password.'@'.$this->serwerAdres.'/';
        }
        
        public function GazetaDom()
        {
            $this->tlumaczenia = cachejezyki::Czytaj();
            $this->dal = new ExportDAL();
            $this->CreateFtpUrl();
            $this->zip_arch = new Ziplib($this->nazwa_wys_plik);
            $this->portal_nazwa = 'GazetaDom';
            $this->sciezka_zapis .= $this->portal_nazwa;
            //$this->czas = date('Y-m-d H:i:s');
        }
        
        protected function PodajOferty()
        {
            $this->oferty = $this->dal->PodajOfertyGazetaDom($ilosc_wierszy);
            $this->oferty_akt = $this->dal->PodajListaOfertAkt($ilosc_wierszy);
            $this->oferty_usun = $this->dal->PodajOfertyDeaktywacjaOfertyNet($ilosc_wierszy);
            //$this->TablicaDoXML($wynik, $this->oferta, 'oferty', 'UTF-8', 'WINDOWS-1250');
        }
        /**
        * Metoda przeznaczona do tworzenia struktury xml dla ofert wczytanych z bazy danych
        *
        * @param    brak, pola sa w obiekcie
        * @access chroniona, wywolywana lokalnie na zadanie uzyskania xml do wysylki
        */
        protected function DaneDoXML()
        {
            $this->PodajOferty();
            //przegladanie tabeli ofert, budowanie xml
            //zmiana idei: pobieranie 1 typu trans i nier z tabeli ofert i motanie az do momentu wyczerpania, po wyczerpaniu podmiana na nowe itd
            //oczywiscie nieststy oferty do usuniecia beda musialy byc siermieznie wyszukiwane petla - to juz nie ulega watpliwosci

            $this->oferta = '';
            $id_nier = null;
            $id_trans = null;
            //dac ifa czy is array
            if (is_array($this->oferty))
            {
                $this->oferta .= '<ogloszenia>';
                foreach ($this->oferty as $klucz => $oferta)
                {
                    //budowa tresci oferty w xml
                    $this->oferta .= '<ogloszenie><klucz>'.$oferta['klucz'].'</klucz><typ_oferty>'.$this->tab_trans_rodzaj[$oferta[NieruchomoscDAL::$id_trans_rodzaj]].'</typ_oferty>
                    <typ_nier>'.$this->tab_nier_rodzaj[$oferta[NieruchomoscDAL::$id_nier_rodzaj]].'</typ_nier><wojewodztwo>'.iconv($this->enc_zr, $this->enc_doc, $oferta['wojewodztwo']).'</wojewodztwo>
                    <miasto-powiat>'.iconv($this->enc_zr, $this->enc_doc, $oferta['miasto_powiat'])
                    .'</miasto-powiat><dzielnica-gmina>'.iconv($this->enc_zr, $this->enc_doc, $oferta['dzielnica_gmina']).'</dzielnica-gmina>';
                    unset($oferta['klucz'], $oferta[NieruchomoscDAL::$id_oferta], $oferta[NieruchomoscDAL::$id_nier_rodzaj], $oferta[NieruchomoscDAL::$id_trans_rodzaj], $oferta['miasto_powiat'], $oferta['dzielnica_gmina'], $oferta['wojewodztwo']);
                    $zdjecia = $oferta[ExportDAL::$zdjecie];
                    $komentarz = $oferta['komentarz'];
                    unset($oferta[ExportDAL::$zdjecie], $oferta[NieruchomoscDAL::$id_oferta], $oferta['komentarz']);
                    ////przerzucenie zdjec i usuniecie - zrobic ponizej
                    ///na tym etapie jest juz utworzone archiwum. w zwiazku z tym dodajemy pod oczekiwana przez oferty net nazwa od reki do archiwum pakuje te zdjecia
                    foreach ($oferta as $index_t => $wartosc)
                    {
                        if (strlen($wartosc) > 0)
                        {
                            $wartosc = iconv($this->enc_zr, $this->enc_doc, $this->tlumaczenia->Tlumacz($this->polski_jezyk, $wartosc));
                            //$wartosc = str_replace('>', '&gt', $wartosc);
                            //$wartosc = str_replace('<', '&lt', $wartosc);
                            $test = strpos($wartosc, '<');
                            if (!($test > -1))
                            $this->oferta .= '<'.$index_t.'>'.$wartosc.'</'.$index_t.'>';
                        }
                    }
                    $nr_zdj = 1;
                    foreach ($zdjecia as $zdjecie)
                    {
                        $zd = explode('/', $zdjecie);
                        $this->oferta .= '<zdjecie'.$nr_zdj.'>'.$zd[count($zd) - 1].'</zdjecie'.$nr_zdj.'>';
                        $this->zip_arch->zl_add_file($zdjecie, $zd[count($zd) - 1], 1);
                        $nr_zdj++;
                    }
                    $test = strpos($komentarz, '<');
                    if (!($test > -1))
                    $this->oferta .= '<komentarz>'.iconv($this->enc_zr, $this->enc_doc, $komentarz).'</komentarz>';                   
                    $this->oferta .= '</ogloszenie>';
                    //ten ponizszy unset wlasciwie nie ma sensu, bo to glowna petla
                    //unset($this->oferty[$klucz]);
                } 

                $this->oferta .= '</ogloszenia>';
            }
            if (is_array($this->oferty_usun))
            {
                $this->oferta .= '<ogloszenia-usun>';
                foreach ($this->oferty_usun as $oferta)
                {
                    //$oferta_usun[NieruchomoscDAL::$id_oferta]
                    $this->oferta .= '<klucz>'.$oferta[NieruchomoscDAL::$id_oferta].'</klucz>';
                }
                $this->oferta .= '</ogloszenia-usun>';
            }
            if (is_array($this->oferty_akt))
            {
                $this->oferta .= '<ogloszenia-lista>';
                foreach ($this->oferty_akt as $oferta)
                {
                    //$oferta_usun[NieruchomoscDAL::$id_oferta]
                    $this->oferta .= '<klucz>'.$oferta[NieruchomoscDAL::$id_oferta].'</klucz>';
                }
                $this->oferta .= '</ogloszenia-lista>';
            }
        }
        ///cale do zmiany
        public function WyslijOferty()
        {
            $this->DaneDoXML();
            $this->oferta = $this->naglowek.$this->oferta.'</dane>';
            $handle = fopen($this->plik, 'w');
            fwrite($handle, $this->oferta);
            fclose($handle);
            //dodanie xml do archiwum, kompresja i zamkniecie archiwum
            $this->zip_arch->zl_add_file($this->plik, $this->plik, 1);
            $this->zip_arch->zl_pack();                      
            
            $uchwyt = ftp_connect($this->serwerAdres);
            ftp_login($uchwyt, $this->user, $this->password);;
            ftp_put($uchwyt, $this->nazwa_wys_plik, $this->nazwa_wys_plik, FTP_BINARY);
            ftp_close($uchwyt);
            
            //////copy($this->nazwa_wys_plik, $this->ftpUrl.$this->nazwa_wys_plik); //kopiowalem xml a nie zip, ale jako zip .......

            $this->Archiwizuj();
        }
        protected function Archiwizuj()
        {
            if (!is_dir($this->sciezka_zapis))
            {
                mkdir($this->sciezka_zapis, 0750, true);
            }
            rename($this->nazwa_wys_plik, $this->sciezka_zapis.'/'.date('Ymd').'-'.date('His').'-'.$this->nazwa_wys_plik);
            
            $this->UsunPliki();
        }
        protected function UsunPliki()
        {
            unlink($this->plik);
        }
    }
?>