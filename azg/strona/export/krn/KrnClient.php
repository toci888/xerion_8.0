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
    class Krn extends ArchiwizacjaPortal
    {
        protected $serwerAdres = 'dane.krn.pl'; ///orginalne ofert.net trzeba skolowac
        protected $user = 'gwarancja';
        protected $password = 'azopole34';  ////ftp://gwarancja:azopole34@dane.krn.pl
        protected $ftpUrl = 'ftp://';
        protected $plik = 'azg_krn.xml';
        protected $enc_zr = 'UTF-8';
        protected $enc_doc = 'ISO-8859-2';
        protected $nazwa_wys_plik = 'azg_krn';
        protected $zip_arch;
        protected $polski_jezyk = 1;
        //protected $czas;
        protected $naglowek = '';
        protected $oferta;
        protected $tlumaczenia;
        protected $zdjecia_tablica;
        protected $oferty; ///tablica ofert do publikacji
        protected $oferty_usun; ///tablica ofert do zdjecia
        protected $dal;
        protected $typ_nier = array(2 => 1, 1 => 2, 3 => 3, 4 => 3, 5 => 5, 6 => 5);
        protected $typ_trans = array(1 => 1, 2 => 2);
        
        protected function CreateFtpUrl()
        {
            $this->ftpUrl .= $this->user.':'.$this->password.'@'.$this->serwerAdres.'/';
        }
        
        public function Krn()
        {
            $this->naglowek = '<?xml version=\'1.0\' encoding=\'ISO-8859-2\' standalone=\'yes\'?><krn><info>
            <data_eksportu>'.date('d-m-Y').'</data_eksportu><typ_eksportu>2</typ_eksportu>
            <caly_eksport>0</caly_eksport><wersja>1.2</wersja>
            <slownik_wersja>1</slownik_wersja></info>';
            $this->tlumaczenia = cachejezyki::Czytaj();
            $this->dal = new ExportDAL();
            $this->CreateFtpUrl();
            $this->zip_arch = new Ziplib($this->nazwa_wys_plik);
            $this->portal_nazwa = 'Krn';
            $this->sciezka_zapis .= $this->portal_nazwa;
            //$this->czas = date('Y-m-d H:i:s');
        }
        
        protected function PodajOferty()
        {
            $this->oferty = $this->dal->PodajOfertyKrn($ilosc_wierszy);
            $this->oferty_usun = $this->dal->PodajOfertyDeaktywacjaOfertyNet($ilosc_wierszy);
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
            $this->oferta = '';
            $id_nier = null;
            $id_trans = null;

            //tablica poagregowana pod foreach, w kazdym foreach petla na dodanie i petla na ujecie
            foreach ($this->oferty as $klucz => $oferta)
            {                
                $this->oferta .= '<oferta>';
                $this->oferta .= '<typ_obiektu>'.$this->typ_nier[$oferta[NieruchomoscDAL::$id_nier_rodzaj]].'</typ_obiektu><typ_transakcji>'.$this->typ_trans[$oferta[NieruchomoscDAL::$id_trans_rodzaj]].
                '</typ_transakcji><cena><za_calosc>'.$oferta[NieruchomoscDAL::$cena].'</za_calosc></cena><adres><wojewodztwo>'.$oferta[ExportDAL::$id_wojewodztwo].'</wojewodztwo><miejscowosc>'.
                iconv($this->enc_zr, $this->enc_doc, $oferta[NieruchomoscDAL::$miejscowosc]).'</miejscowosc><ulica>'.iconv($this->enc_zr, $this->enc_doc, $oferta[NieruchomoscDAL::$ulica]).'</ulica></adres>';
                unset($oferta[ExportDAL::$id_wojewodztwo], $oferta[NieruchomoscDAL::$id_nier_rodzaj], $oferta[NieruchomoscDAL::$id_trans_rodzaj], $oferta[NieruchomoscDAL::$cena], $oferta[NieruchomoscDAL::$miejscowosc], 
                $oferta[StronaOfertaDAL::$lokalizacja]);

                if (is_array($oferta[ExportDAL::$zdjecie]))
                foreach ($oferta[ExportDAL::$zdjecie] as $zdjecie)
                {
                    $zd = explode('/', $zdjecie);
                    $this->oferta .= '<zdjecie><plik>'.$zd[count($zd) - 1].'</plik></zdjecie>';
                    $this->zip_arch->zl_add_file($zdjecie, $zd[count($zd) - 1], 1);
                }
                unset($oferta[ExportDAL::$zdjecie], $oferta[NieruchomoscDAL::$id_oferta]);
                //dodanie id
                //dodanie ceny - sztywne, reszta z petli
                foreach ($oferta as $index_t => $wartosc)
                {
                    $wartosc = iconv($this->enc_zr, $this->enc_doc, $this->tlumaczenia->Tlumacz($this->polski_jezyk, $wartosc));
                    //$wartosc = str_replace('>', '&gt', $wartosc);
                    //$wartosc = str_replace('<', '&lt', $wartosc);
                    $test = strpos($wartosc, '<');
                    if (!($test > -1))
                    $this->oferta .= '<'.$index_t.'>'.$wartosc.'</'.$index_t.'>';
                }
                $this->oferta .= '</oferta>';
            }
        }
        public function WyslijOferty()
        {
            $this->DaneDoXML();
            $this->oferta = $this->naglowek.'<krn_oferty>'.$this->oferta.'</krn_oferty>';
            if (is_array($this->oferty_usun))
            {
                $this->oferta .= '<krn_usun>';
                foreach ($this->oferty_usun as $klucz => $oferta_usun)
                {
                    //dodanie tagu z id oferty do usuniecia
                    $this->oferta .= '<oferta_usun><klucz>'.$oferta_usun[NieruchomoscDAL::$id_oferta].'</klucz></oferta_usun>';
                }
                $this->oferta .= '</krn_usun>';
            }
            $this->oferta .= '</krn>';
            $handle = fopen($this->plik, 'w');
            fwrite($handle, $this->oferta);
            fclose($handle);
            //dodanie xml do archiwum, kompresja i zamkniecie archiwum
            $this->zip_arch->zl_add_file($this->plik, $this->plik, 1);
            $this->zip_arch->zl_pack();                      
            
            copy($this->nazwa_wys_plik, $this->ftpUrl.$this->nazwa_wys_plik.'_'.date('Ymd').'-'.date('His').'.zip'); //kopiowalem xml a nie zip, ale jako zip .......

            $this->Archiwizuj();
        }
        protected function Archiwizuj()
        {
            //pliki powsta³e przy exporcie domiporty: $this->plik, $this->nazwa_wys_plik
            //zapamietywanie calego archiwum jest strata miejsca, jednak w przypadku koniecznosci ponownej wysylki jest uproszczeniem, lub po prostu jest mozliwe
            if (!is_dir($this->sciezka_zapis))
            {
                mkdir($this->sciezka_zapis, 0750, true);
            }
            rename($this->nazwa_wys_plik, $this->sciezka_zapis.'/'.$this->nazwa_wys_plik.'_'.date('Ymd').'-'.date('His').'.zip');
            
            $this->UsunPliki();
        }
        protected function UsunPliki()
        {
            //unlink($this->nazwa_wys_plik); //-> nie powinno byc mozliwe i sie udac
            unlink($this->plik);
        }
    }
?>