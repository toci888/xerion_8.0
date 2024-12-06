<?php
    $path = str_replace($_SERVER['PHP_SELF'], '', $_SERVER['SCRIPT_FILENAME']).'/';
    
    //include_once ($path.'export/otodom/OtoDomTypes.php');
    include_once ($path.'bll/jezykibll.php');
    include_once ($path.'bll/cache.php');
    include_once ($path.'ui/utilsui.php');
    include_once ($path.'lib/ziplib.php');
    
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
    class OfertyNet
    {
        protected $serwerAdres = 'ftp.oferty.net'; ///orginalne ofert.net trzeba skolowac
        protected $user = 'op44';
        protected $password = 'azgss34d';  ////ftp://op44:azgss34d@ftp.oferty.net
        protected $ftpUrl = 'ftp://';
        protected $plik = 'oferty.xml';
        protected $enc_zr = 'UTF-8';
        protected $enc_doc = 'ISO-8859-2';
        protected $nazwa_wys_plik = 'oferty.zip';
        protected $zip_arch;
        protected $polski_jezyk = 1;
        //protected $czas;
        protected $naglowek = '<?xml version=\'1.0\' encoding=\'ISO-8859-2\' standalone=\'yes\'?><plik><informacje>Plik wygenerowany przez program autorski firmy AZG</informacje> 
        <agencja>A. Z. Gwarancja</agencja><wersja>0.2</wersja><cel>oferty.net</cel><zawartosc_pliku>roznica</zawartosc_pliku>'; //dokleic date
        protected $oferta;
        protected $tablica_ofert_poagregowanych;
        protected $tlumaczenia;
        protected $zdjecia_tablica;
        protected $oferty; ///tablica ofert do publikacji
        protected $oferty_usun; ///tablica ofert do zdjecia
        protected $tab_nier_rodzaj = array(1 => 'domy', 2 => 'mieszkania', 3 => 'lokale', 4 => 'lokale', 5 => 'dzialki', 6 => 'dzialki');
        protected $tab_nier_rodzaj_zdj = array(1 => 'd', 2 => 'm', 3 => 'l', 4 => 'l', 5 => 'z', 6 => 'z');
        protected $tab_trans_rodzaj = array(1 => 'sprzedaz', 2 => 'wynajem');
        protected $tab_trans_rodzaj_zdj = array(1 => 's', 2 => 'w');
        protected $typ_danych = array(
        'id_oferta' => 'int',
        'id_nier_rodzaj' => 'int',
        'id_trans_rodzaj' => 'int',
        'wojewodztwo' => 'text',
        'miasto' => 'text',
        'dzielnica' => 'text',
        'okolica' => 'text',
        'ulica' => 'text',
        'dataaktualizacji' => 'text',
        'cena' => 'real',
        'powierzchnia' => 'real',
        'powierzchniadzialki' => 'real',
        'typzabudowy' => 'text',
        'typlokalu' => 'text',
        'liczbapokoi' => 'int',
        'liczbatelefonow' => 'int',
        'ogrzewanie' => 'text',
        'pietro' => 'int',
        'liczbapieter' => 'int',
        'rokbudowy' => 'int',
        'winda' => 'bool',
        'materialbudowy' => 'text',
        'stanbudynku' => 'text',
        'typkuchni' => 'text',
        'miejscaparkingowe' => 'text',
        'opis' => 'text',
        'biuro' => 'bool',
        'meble' => 'bool',
        'typpodlaczeniawody' => 'text',
        'gaz' => 'text',
        'uzbrojenie' => 'text',
        'klimatyzacja' => 'int',
        'rodzajlacz' => 'text',
        'zwalnianeod' => 'text',
        'zabezpieczenia' => 'text',
        'agent_nazwisko' => 'text',
        'agent_email' => 'text',
        'agent_tel_biuro' => 'text',
        'agent_tel_kom' => 'text');
        
        protected $dal;

        
        protected function CreateFtpUrl()
        {
            $this->ftpUrl .= $this->user.':'.$this->password.'@'.$this->serwerAdres.'/';
        }
        
        public function OfertyNet()
        {
            $this->tlumaczenia = cachejezyki::Czytaj();
            $this->dal = new ExportDAL();
            $this->CreateFtpUrl();
            $this->zip_arch = new Ziplib($this->nazwa_wys_plik);
            //$this->czas = date('Y-m-d H:i:s');
        }
        
        protected function PodajOferty()
        {
            $this->oferty = $this->dal->PodajOfertyOfNet($ilosc_wierszy);
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
            $wczytano_typ = false;
            $this->oferta = '';
            $id_nier = null;
            $id_trans = null;

            //dac ifa czy is array
            foreach ($this->oferty as $klucz => $oferta)
            {
                //przegladanie ofert oraz wstawianie ich do tablicy ofert poagregowanych
                $this->tablica_ofert_poagregowanych[$oferta[NieruchomoscDAL::$id_nier_rodzaj].'_'.$oferta[NieruchomoscDAL::$id_trans_rodzaj]][$oferta[NieruchomoscDAL::$id_oferta]] = $oferta;
            }
            //tablica poagregowana pod foreach, w kazdym foreach petla na dodanie i petla na ujecie
            foreach ($this->tablica_ofert_poagregowanych as $klucz => $tablica_ofert)
            {
                ///petla idzie tyle razy, ile jest ofert do dodania
                $typ_ofert = explode('_', $klucz); //nier id jest 1 wiec od 0
                $id_nier = $typ_ofert[0];
                $id_trans = $typ_ofert[1];
                
                $this->oferta .= '<dzial tab="'.$this->tab_nier_rodzaj[$id_nier].'" typ="'.$this->tab_trans_rodzaj[$id_trans].'">';
                foreach ($tablica_ofert as $oferta_id => $oferta)
                {
                    $this->oferta .= '<oferta><id>'.$oferta[NieruchomoscDAL::$id_oferta].'</id><cena waluta="PLN">'.$oferta[NieruchomoscDAL::$cena].'</cena>';
                    unset($oferta[NieruchomoscDAL::$cena], $oferta[NieruchomoscDAL::$id_nier_rodzaj], $oferta[NieruchomoscDAL::$id_trans_rodzaj]);
                    ////przerzucenie zdjec i usuniecie - zrobic ponizej
                    ///na tym etapie jest juz utworzone archiwum. w zwiazku z tym dodajemy pod oczekiwana przez oferty net nazwa od reki do archiwum pakuje te zdjecia
                    $nr_zdj = 1;
                    //if nie zaszkodzi jesli nie ma zdj
                    if (is_array($oferta[ExportDAL::$zdjecie]))
                    foreach ($oferta[ExportDAL::$zdjecie] as $zdjecie)
                    {
                        //zeby rozszerzenie bylo elastyczne (pomimo, iz zawsze powinien to byc jpg) wyciaganie rozszerzenia zdjecia; rozszerzenie w ostatnim elemencie ponizszej tablicy
                        $tab_elem_zdj = explode('.', $zdjecie);
                                                               //login           //typ nier                                 //rodzaj transakcji                                                                 ///w ostatnim elemencie (tablicy) jest rozszerzenie
                        $this->zip_arch->zl_add_file($zdjecie, $this->user.'_'.$this->tab_nier_rodzaj_zdj[$id_nier].$this->tab_trans_rodzaj_zdj[$id_trans].'_'.$oferta[NieruchomoscDAL::$id_oferta].'_'.$nr_zdj.'.'.$tab_elem_zdj[count($tab_elem_zdj) - 1] , 1);
                        $nr_zdj++;
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
                        $this->oferta .= '<param nazwa="'.$index_t.'" typ="'.$this->typ_danych[$index_t].'">'.$wartosc.'</param>';
                    }
                    $this->oferta .= '</oferta>';
                }
                $tag_us_otw = false;
                foreach ($this->oferty_usun as $klucz => $oferta_usun)
                {
                    if ($oferta_usun[NieruchomoscDAL::$id_nier_rodzaj] == $id_nier && $oferta_usun[NieruchomoscDAL::$id_trans_rodzaj] == $id_trans)
                    {
                        //dodanie tagu z id oferty do usuniecia
                        $this->oferta .= '<oferta_usun><id>'.$oferta_usun[NieruchomoscDAL::$id_oferta].'</id></oferta_usun>';
                        //usuniecie oferty z tablicy - przy kolejnym przegladaniu tablica bedzie mniejsza
                        unset($this->oferty_usun[$klucz]);
                    }
                }
                $this->oferta .= '</dzial>';
            }
            //sprawdzic count tablicy ofert usun: jesli wiekszy od 0 poagregowac i dodac do xml
            if (count($this->oferty_usun) > 0)
            {
                $this->tablica_ofert_poagregowanych = array();
                foreach ($this->oferty_usun as $klucz => $oferta)
                {
                    //przegladanie ofert oraz wstawianie ich do tablicy ofert poagregowanych
                    $this->tablica_ofert_poagregowanych[$oferta[NieruchomoscDAL::$id_nier_rodzaj].'_'.$oferta[NieruchomoscDAL::$id_trans_rodzaj]][$oferta[NieruchomoscDAL::$id_oferta]] = $oferta;
                }
                foreach ($this->tablica_ofert_poagregowanych as $klucz => $tablica_ofert)
                {
                    ///petla idzie tyle razy, ile jest ofert do dodania
                    $typ_ofert = explode('_', $klucz); //nier id jest 1 wiec od 0
                    $id_nier = $typ_ofert[0];
                    $id_trans = $typ_ofert[1];
                    
                    if (is_array($tablica_ofert))
                    {
                        $this->oferta .= '<dzial tab="'.$this->tab_nier_rodzaj[$id_nier].'" typ="'.$this->tab_trans_rodzaj[$id_trans].'">';
                        foreach ($tablica_ofert as $oferta_id => $oferta)
                        {
                            $this->oferta .= '<oferta_usun><id>'.$oferta[NieruchomoscDAL::$id_oferta].'</id></oferta_usun>';
                        }
                        $this->oferta .= '</dzial>';
                    }
                }
            }
        }
        public function WyslijOferty()
        {
            $this->DaneDoXML();
            $this->oferta = $this->naglowek.'<lista_ofert>'.$this->oferta.'</lista_ofert></plik>';
            $handle = fopen($this->plik, 'w');
            fwrite($handle, $this->oferta);
            fclose($handle);
            //dodanie xml do archiwum, kompresja i zamkniecie archiwum
            $this->zip_arch->zl_add_file($this->plik, $this->plik, 1);
            $this->zip_arch->zl_pack();                      
            
            copy($this->nazwa_wys_plik, $this->ftpUrl.$this->nazwa_wys_plik); //kopiowalem xml a nie zip, ale jako zip .......

            ///copy($this->nazwa_wys_plik, '/home/bartek/ozyrys_dysk2/azg/azg_cms/'.$this->nazwa_wys_plik);
        }
    }
?>