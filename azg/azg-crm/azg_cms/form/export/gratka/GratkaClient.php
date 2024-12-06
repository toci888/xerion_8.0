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
    class Gratka
    {
        protected $serwerAdres = 'nieruchomosci-online.pl'; //
        protected $user = 'n_informatyk_azg.pl';
        protected $password = 'gubuheW';  ////ftp://n_informatyk_azg.pl:gubuheW@nieruchomosci-online.pl
        protected $ftpUrl = 'ftp://';
        protected $plik = '';
        protected $katalog = '';
        protected $enc_zr = 'UTF-8';
        protected $enc_doc = 'ISO-8859-2';
        protected $nazwa_wys_plik = '';
        protected $zip_arch;
        protected $polski_jezyk = 1;
        //protected $czas;
        protected $naglowek = '<?xml version=\'1.0\' encoding=\'ISO-8859-2\' standalone=\'yes\'?>
        <dane>
        <actions>
        <export>inc</export>
        </actions>
        <firma>
        <kod_offline>3a70fa172540a4e41609a9f39d570472</kod_offline>
        <katalog>azg</katalog>
        <nazwa>A. Z. Gwarancja</nazwa>
        <miasto>Opole</miasto>
        <ulica>Szarych Szeregów 34d</ulica>
        <kod_pocztowy>45-285</kod_pocztowy>
        <id_region>3</id_region>
        <tydzien_od>10</tydzien_od>
        <tydzien_do>18</tydzien_do>
        <oferta>Nieruchomo¶ci - kupno, sprzeda¿, wynajem</oferta>
        <opis>Nieruchomo¶ci Opole A.Z.GWARANCJA - Biuro po¶rednictwa w obrocie Nieruchomo¶ci w Opolu. Mieszkania, domy, lokale oraz dzia³ki w Opolu i w województwie opolskim.  Dysponujemy obszern± baz± klientów poszukuj±cych nieruchomo¶ci do kupienia lub wynajmu. Oferujemy profesjonalne i kompleksowe us³ugi w zakresie doboru nieruchomo¶ci, kredytu oraz przeprowadzenia ca³ej transakcji.</opis>
        <nip>754-000-96-00</nip>
        <telefon>
        <z1>774031230</z1>
        </telefon>
        <fax>
        <z1>774031238</z1>
        </fax>
        <email>
        <z1>azgwarancja@azg.pl</z1>
        </email>
        <www>
        <z1>www.azg.pl</z1>
        </www>
        <meta_description>Nieruchomo¶ci Opole A.Z.GWARANCJA - Biuro po¶rednictwa w obrocie Nieruchomo¶ci w Opolu. Mieszkania, domy, lokale oraz dzia³ki w Opolu i w województwie opolskim.</meta_description>
        <meta_keywords>nieruchomo¶ci opole, nieruchomo¶ci, nieruchomo¶æ, nieruchomosci, opole, mieszkania opole, domy opole, mieszkania, mieszkanie, domy, dom, posrednictwo, lokale, obiekty, ogloszenia, kredyty</meta_keywords>
        </firma>
        '; 
        protected $oferta;
        protected $tlumaczenia;
        protected $zdjecia_tablica;
        protected $oferty; ///tablica ofert do publikacji
        protected $oferty_usun; ///tablica ofert do zdjecia
        //tablica slownikow gratki: dla kolejnej kolumny danych sprawdzenie, czy inf jest slownikowana; jesli tak proba pobrania wartosci - jesli nie ma wartosci zaniechanie
        //jesli informacja nie jest slownikowana walic na sztywno wartosc zaciagnieta z bazy
        
        //sa 2 problemy : po 1 oni maja rozne slowniki, sa rozne nazwy tagow, rozne wartosci; w zwiazku z tym nalezalobedzie mapowac nazwy tagow oraz wartosci
        //dodatkowo przyporzadkowanie do danego typu nieruchomosci mogloby sie odbywac wg ich podzialu .. wtedy tablica bedzie miala 4 duze elementy: dom, dzialka, lokal, mieszkanie; szkoda ze u nas tez sa rozbieznosci
        //na linii lokal obiekt, u nich to to samo ...
        //niespodzianka - nieruchomosci online to tak lapia
        protected $slowniki_gratka = array(
        'id_rubryka' => array(1 => 1, 2 => 5),
        'id_podrubryka' => array(1 => 2, 2 => 1, 3 => 4, 4 => 4, 5 => 3, 6 => 3),
        'id_region' => array(2 => 1, 3 => 2, 4 => 6, 5 => 4, 6 => 5, 7 => 7, 8 => 8, 9 => 3, 10 => 9, 11 => 10, 12 => 11, 13 => 12, 14 => 13, 15 => 14, 16 => 15, 17 => 16), 
        'id_pietro' => array(0 => 1, 1 => 2, 2 => 3, 3 => 4, 4 => 5, 5 => 6, 6 => 7, 7 => 8, 8 => 9, 9 => 10, 10 => 11, 11 => 12, 12 => 13, 13 => 14, 14 => 15, 15 => 16, 16 => 17, 17 => 18, 18 => 19, 19 => 20, 20 => 21), 
        'id_forma_wlasnosci' => array(106 => 2, 109 => 1, 107 => 4), 
        'id_liczba_pokoi' => array(1 => 2, 2 => 3, 3 => 4, 4 => 5, 5 => 6, 6 => 7, 7 => 8, 8 => 8, 9 => 8, 10 => 8), 
        'id_material' => array(55 => 1, 60 => 2, 52 => 3, 50 => 4, 61 => 6, 56 => 7, 53 => 8), 
        'id_stan_mieszkania' => array(100 => 7, 101 => 8, 103 => 5, 104 => 2), 
        'id_okna' => array(79 => 3, 80 => 2), 
        'id_ogrzewanie' => array(71 => 1, 73 => 2, 72 => 3, 76 => 4, 77 => 5, 75 => 10), 
        'id_telefon' => array(0 => 2, 1 => 1), 
        'id_internet' => array(0 => 4, 1 => 1), 
        'na_wylacznosc' => array(0 => 'N', 1 => 'T'));
        //zmapowac mieszkania, domy itd
        protected $nier_rodzaj = array(1 => 2, 2 => 1, 3 => 4, 4 => 4, 5 => 3, 6 => 3);
        protected $trans_rodzaj = array(1 => 1, 2 => 5);
                                         //rodz nier - jaki tag
        protected $tag_typ_nieruchomosci = array(1 => 'id_typ_budynku', 2 => 'id_typ_zabudowy', 3 => 'id_typ_lokalu', 4 => 'id_typ_lokalu', 5 => 'id_rodzaj_dzialki', 6 => 'id_rodzaj_dzialki');
        //juz wg slownika gratki - mniejsza tablica, trzymajaca sie kupy
        protected $slownik_map_typ_nier = array(
        1 => array(1 => 2, 2 => 1, 3 => 1), 
        2 => array(4 => 1, 5 => 4, 6 => 10, 7 => 12), 
        3 => array(27 => 21, 15 => 20, 23 => 20, 17 => 9, 14 => 4, 20 => 4, 25 => 10, 16 => 8, 22 => 8, 21 => 9, 26 => 13), 
        4 => array(9 => 1, 11 => 7, 29 => 4, 32 => 5, 31 => 5, 10 => 6, 12 => 9, 30 => 4));
        //wysy³ka do gratki nie pojzdie zipem, bo nie umieja go otwierac; w zwiazku z tym przy archiwizacji plikow nalezy zrobic tablice plik => nowa nazwa na serwerze gratki i tak wysylac po 1 pliku na ftp
        protected $pliki_wysylka_gratka = array();
        
        protected $dal;

        
        protected function CreateFtpUrl()
        {
            $this->ftpUrl .= $this->user.':'.$this->password.'@'.$this->serwerAdres.'/';
        }
        
        public function Gratka()
        {
            $this->tlumaczenia = cachejezyki::Czytaj();
            $this->plik = 'AZG_'.date('Ymd').'.xml';
            $this->nazwa_wys_plik = 'AZG_'.date('Ymd').'.zip';
            $this->katalog = 'AZG_'.date('Ymd').'_'.date('His').'/';
            $this->dal = new ExportDAL();
            $this->CreateFtpUrl();
            $this->zip_arch = new Ziplib($this->nazwa_wys_plik);
            //$this->czas = date('Y-m-d H:i:s');
        }
        
        
        protected function PodajOferty()
        {
            $this->oferty = $this->dal->PodajOfertyGratka($ilosc_wierszy);
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
            $wczytano_typ = false;
            $this->oferta = '';
            $id_nier = null;
            $id_trans = null;

            foreach ($this->oferty as $klucz => $oferta)
            {                
                $rodzaj_nier = $this->nier_rodzaj[$oferta[NieruchomoscDAL::$id_nier_rodzaj]];
                $typ_nier = $this->tag_typ_nieruchomosci[$oferta[NieruchomoscDAL::$id_nier_rodzaj]];
                
                $this->oferta .= '<record>
                <id_inspert>'.$oferta['numer_oferty'].'</id_inspert>
                <id_rubryka>'.$this->trans_rodzaj[$oferta[NieruchomoscDAL::$id_trans_rodzaj]].'</id_rubryka>
                <id_podrubryka>'.$rodzaj_nier.'</id_podrubryka>'."\n";
                
                if (isset($this->slownik_map_typ_nier[$rodzaj_nier][$oferta[NieruchomoscDAL::$id_rodz_nier_szcz]]))
                {
                    $this->oferta .= '<'.$typ_nier.'>'.$this->slownik_map_typ_nier[$rodzaj_nier][$oferta[NieruchomoscDAL::$id_rodz_nier_szcz]].'</'.$typ_nier.'>'."\n";
                }
                
                unset($oferta[NieruchomoscDAL::$id_rodz_nier_szcz], $oferta[NieruchomoscDAL::$id_nier_rodzaj], $oferta[NieruchomoscDAL::$id_trans_rodzaj]);

                $nr_zdj = 1;
                //if nie zaszkodzi jesli nie ma zdj
                if (is_array($oferta[ExportDAL::$zdjecie]))
                {
                    $this->oferta .= '<zdjecia>'."\n";
                    foreach ($oferta[ExportDAL::$zdjecie] as $zdjecie)
                    {
                        $tab_elem_zdj = explode('.', $zdjecie);
                        $this->zip_arch->zl_add_file($zdjecie, $oferta[NieruchomoscDAL::$id_oferta].'_'.$nr_zdj.'.'.$tab_elem_zdj[count($tab_elem_zdj) - 1] , 1);
                        //nazwa pliku na dysku => nazwa pliku na ftp
                        $this->pliki_wysylka_gratka[$zdjecie] = $oferta[NieruchomoscDAL::$id_oferta].'_'.$nr_zdj.'.'.$tab_elem_zdj[count($tab_elem_zdj) - 1];
                        //dopisanie true do xml :P ze jest jakies zdjecie
                        $this->oferta .= '<z'.$nr_zdj.'>true</z'.$nr_zdj.'>'."\n";
                        
                        $nr_zdj++;
                    }
                    $this->oferta .= '</zdjecia>'."\n";
                }                   
                unset($oferta[ExportDAL::$zdjecie], $oferta[NieruchomoscDAL::$id_oferta]);

                foreach ($oferta as $index_t => $wartosc)
                {
                    $wartosc = iconv($this->enc_zr, $this->enc_doc, $this->tlumaczenia->Tlumacz($this->polski_jezyk, $wartosc));
                    $test = strpos($wartosc, '<');
                    if (!($test > -1))
                    {
                        if (isset($this->slowniki_gratka[$index_t]))
                        {
                            //informacja jest slownikowana w gratce
                            $slownik = $this->slowniki_gratka[$index_t];
                            if (isset($slownik[$wartosc]))
                            {
                                //istnieje dla naszej wartosci odpowiednik w gratce, mozna podac informacje
                                $this->oferta .= '<'.$index_t.'>'.$slownik[$wartosc].'</'.$index_t.'>'."\n";
                            }
                        }
                        else
                        {
                            if (strlen($wartosc) > 0)
                            {
                                $this->oferta .= '<'.$index_t.'>'.$wartosc.'</'.$index_t.'>'."\n";
                            }
                        }
                    }
                    //$this->oferta .= '<param nazwa="'.$index_t.'" typ="'.$this->typ_danych[$index_t].'">'.$wartosc.'</param>';
                }
                $this->oferta .= '</record>'."\n";
            }
            foreach ($this->oferty_usun as $klucz => $oferta_usun)
            {
                $this->oferta .= '<record>
                <action>delete</action>
                <id_inspert>'.$oferta_usun[NieruchomoscDAL::$id_oferta].'</id_inspert>
                </record>'."\n";
            }
            //sprawdzic count tablicy ofert usun: jesli wiekszy od 0 poagregowac i dodac do xml
        }
        public function WyslijOferty()
        {
            $this->DaneDoXML();
            $this->oferta = $this->naglowek.$this->oferta.'</dane>'."\n";
            $handle = fopen($this->plik, 'w');
            fwrite($handle, $this->oferta);
            fclose($handle);
            //dodanie xml do archiwum, kompresja i zamkniecie archiwum
            $this->zip_arch->zl_add_file($this->plik, $this->plik, 1);
            $this->pliki_wysylka_gratka[$this->plik] = $this->plik;
            $this->zip_arch->zl_pack();                      
            mkdir($this->ftpUrl.$this->katalog);
            copy($this->nazwa_wys_plik, $this->ftpUrl.$this->katalog.$this->nazwa_wys_plik);
            
            $this->WyslijOfertyHomer();
            $this->WyslijOfertyGratka();
            $this->WyslijOfertyBizzone();
            //copy($this->nazwa_wys_plik, '/home/bartek/ozyrys_dysk2/azg/azg_cms/'.$this->nazwa_wys_plik); //to tylko po zeby zobaczyc ze skonyczl i doszedl - to sie konczy bledem
        }
        protected function WyslijOfertyGratka()
        {
            //podmiana danych logowania
            $this->user = 'test_azg';
            $this->password = 'azg!20081030';
            $this->serwerAdres = 'ftp.gratka.pl';
            ///ftp://test_azg:azg!20081030@ftp.gratka.pl
            //po³¹czenie ftp
            $uchwyt = ftp_connect($this->serwerAdres);
            ftp_login($uchwyt, $this->user, $this->password);
            ftp_mkdir($uchwyt, $this->katalog);
            ftp_chdir($uchwyt, $this->katalog);
            foreach ($this->pliki_wysylka_gratka as $klucz => $wartosc)
            {
                //       plik na dysku ; plik na serwerze - inna nazwa :)
                ftp_put($uchwyt, $wartosc, $klucz, FTP_BINARY);
            }
            ////ftp_put($uchwyt, $this->nazwa_wys_plik, $this->nazwa_wys_plik, FTP_BINARY);
            ftp_close($uchwyt);
        }
        protected function WyslijOfertyBizzone()
        {
            //podmiana danych logowania
            $this->user = 'azgwarancja@azg.pl';
            $this->password = 'azgss34d';
            $this->serwerAdres = 'ftp.bizzone.pl';
            //po³¹czenie ftp
            $uchwyt = ftp_connect($this->serwerAdres);
            ftp_login($uchwyt, $this->user, $this->password);
            ftp_mkdir($uchwyt, $this->katalog);
            ftp_chdir($uchwyt, $this->katalog);
            ftp_put($uchwyt, $this->nazwa_wys_plik, $this->nazwa_wys_plik, FTP_BINARY);
            ftp_close($uchwyt);
            //copy($this->nazwa_wys_plik, '/home/bartek/ozyrys_dysk2/azg/azg_cms/'.$this->nazwa_wys_plik); //to tylko po zeby zobaczyc ze skonyczl i doszedl - to sie konczy bledem
        }
        protected function WyslijOfertyHomer()
        {
            $this->user = 'azgwarancja';
            $this->password = 'a4nWrk9';
            $this->serwerAdres = 'homer.pl';
            //ftp://azgwarancja:a4nWrk9@homer.pl
            //po³¹czenie ftp
            $uchwyt = ftp_connect($this->serwerAdres);
            ftp_login($uchwyt, $this->user, $this->password);
            //ftp_mkdir($uchwyt, $this->katalog);
            //ftp_chdir($uchwyt, $this->katalog);
            ftp_put($uchwyt, $this->nazwa_wys_plik, $this->nazwa_wys_plik, FTP_BINARY);
            ftp_close($uchwyt);
        }
    }
?>