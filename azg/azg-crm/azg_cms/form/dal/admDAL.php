<?php
    $path = str_replace($_SERVER['PHP_SELF'], '', $_SERVER['SCRIPT_FILENAME']).'/';
    
    include_once ($path.'dal/dal.php');
    include_once ($path.'dal/utilsdal.php');
    include_once ($path.'bll/tags.php');
    
    class SzablonDAL
    {
        public static $ma_dzieci = 'ma_dzieci';
        public static $wielokrotne = 'wielokrotne';
        public static $id = 'id';
        public static $id_parent = 'id_parent';
        public static $id_parametr_nier = 'id_parametr_nier';
        public static $id_wyposazenie_nier = 'id_wyposazenie_nier';
        public static $id_lista_param_nier = 'id_lista_param_nier';
        public static $id_lista_param_slow_nier = 'id_lista_param_slow_nier';
        public static $id_otodom = 'id_otodom';
        public static $nazwa = 'nazwa';
        public static $zaglebienie = 'zaglebienie';
        public static $login = 'login';
        public static $licencja = 'licencja';
        public static $haslo = 'haslo'; 
        public static $waznosc_haslo = 'waznosc_haslo'; 
        public static $id_bank = 'id_bank';
        public static $id_agent = 'id_agent';
        public static $id_agent_otodom = 'id_otodom';
        public static $nowe_haslo = 'nowe_haslo';
        public static $rezultat = 'rezultat';
        public static $aktywnosc = 'aktywnosc_konto';
        public static $nazwa_pot = 'nazwa_pot';
        public static $nazwa_firma = 'nazwa_firma';
        public static $il_dni_wyg = 'il_dni_wyg';
        public static $dodawanie = 'dodawanie';
        public static $edycja = 'edycja';
        public static $kasowanie = 'kasowanie';
        public static $druk = 'druk';
        public static $admin_klient = 'adm_klient';
        public static $admin_dane = 'adm_dane';
        public static $zmiana_uprawnien = 'zmiana_upr';
        public static $uprawnienia = 'uprawnienia';
        public static $telefon = 'telefon';
        public static $komorka = 'komorka';
        public static $fax = 'fax';
        public static $email = 'email';
        public static $wewnetrzny = 'wewnetrzny';
        public static $nip = 'nip';
        public static $adres = 'adres';
        public static $nr_konto = 'nr_konto';
        public static $firma = 'firma';
        public static $nr_telefon = 'nr_telefon';
        public static $osoba = 'osoba';
        public static $id_status_dzwonienie = 'id_status_dzwonienie';
        public static $status_dzwonienie = 'status_dzwonienie';
        public static $czas_poczatek = 'czas_poczatek';
        public static $czas_koniec = 'czas_koniec';
        public static $nazwa_lang_tag = 'nazwa_lang_tag';
        public static $ilosc_wyswietlen = 'ilosc_wyswietlen';
        public static $ilosc_wyszukiwan = 'ilosc_wyszukiwan';
        public static $ilosc_ofert = 'ilosc_ofert';
        public static $zrodla_wejsc = 'zrodla_wejsc';
        public static $wspolczynnik = 'wspolczynnik';
        public static $waga = 'waga';
        public static $referer = 'referer';
    }
    
    class RegionyDAL extends SzablonDAL
    {        
        protected $dal;
        
        public function RegionyDAL()
        {
            $this->dal = new dal();
        }
        
        public function PodajRegiony($id_parent, &$ilosc_wierszy)
        {
            $zapytanie = 'select * from PodajRegionyGeog('.$id_parent.');';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            UtilsDAL::KonwersjaDbBoolText($wynik, array(RegionyDAL::$ma_dzieci, NieruchomoscDAL::$pokaz));
            
            return $wynik;
        }
        public function PodajRegionEdycja($id_parent, $region_id)
        {
            $zapytanie = 'select * from PodajRegionyGeog('.$id_parent.') where id = '.$region_id.';';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            UtilsDAL::KorektaKolBool($wynik, array(RegionyDAL::$ma_dzieci, NieruchomoscDAL::$pokaz));
            
            return $wynik;
        }
        public function PodajRodzic($id_region)
        {
            $zapytanie = 'select PodajRodzic as id from PodajRodzic('.$id_region.');';
            $wynik = $this->dal->WprowadzanieDanych($zapytanie, false);
            
            return $wynik;
        }
        public function DodajRegionGeog($tabParametr)
        {
            $id = 'null';
            
            if (isset($tabParametr[NieruchomoscDAL::$id]))
            {
                $id = $tabParametr[NieruchomoscDAL::$id];
            }
            
            $zapytanie = 'select DodajRegionGeog ('.$id.', \''.$tabParametr[NieruchomoscDAL::$nazwa].'\', '.$tabParametr[NieruchomoscDAL::$pokaz].', '.$tabParametr[RegionyDAL::$id_parent].', '.
            $tabParametr[RegionyDAL::$id_otodom].');';
            
            $wynik = $this->dal->OperacjaLogiczna($zapytanie);
            
            return $wynik;
        }
        public function KasujRegionGeog($id_region)
        {
            $zapytanie = 'select KasujRegionGeog('.$id_region.');';
            $wynik = $this->dal->OperacjaLogiczna($zapytanie);
            
            return $wynik;
        }
        public function MailListaWysylka($tabRegion, &$ilosc_wierszy)
        {
            $tab = UtilsDAL::TabPhp2TabPg($tabRegion, false, $tab);
            $zapytanie = 'select * from MailListaWysylka('.$tab.');';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            
            return $wynik;
        }
        public function NieZgodaMail($hash)
        {
            $zapytanie = 'select NieZgodaMail(\''.$hash.'\');';
            $wynik = $this->dal->OperacjaLogiczna($zapytanie);
            
            return $wynik;
        }
    }
    class AgenciDAL extends SzablonDAL
    {       
        protected $dal;
       
        public function AgenciDAL()
        {
            $this->dal = new dal();
        }
        
        public function ListaAgentow(&$ilosc_wierszy)
        {
            $zapytanie = 'select * from ListaAgentow();';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            UtilsDAL::KonwersjaDbBoolText($wynik, array(AgenciDAL::$admin_dane, AgenciDAL::$admin_klient, AgenciDAL::$aktywnosc, AgenciDAL::$dodawanie, AgenciDAL::$druk, AgenciDAL::$edycja, AgenciDAL::$kasowanie, 
            AgenciDAL::$zmiana_uprawnien));
            
            return $wynik;
        }
        
        public function KalendarzAdm($tabParametr, &$ilosc_wierszy)
        {
            $zapytanie = 'select * from KalendarzAdm('.$tabParametr[NieruchomoscDAL::$id_agent].', \''.$tabParametr[MediaDAL::$data].'\', \''.$tabParametr[MediaDAL::$data_do].'\');';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            
            return $wynik;
        }
        public function DodajAgent ($tabParametr)
        {
            if (isset($tabParametr[AgenciDAL::$id_agent]))
            {
                if (strlen($tabParametr[AgenciDAL::$id_agent_otodom]) < 1)
                {
                    $tabParametr[AgenciDAL::$id_agent_otodom] = 'null';
                }
                $uprawnienia = UtilsDAL::TabPhp2TabPg($tabParametr[AgenciDAL::$uprawnienia], false, $uprawnienia);
                $zapytanie = 'select * from WprowadzAgent('.$tabParametr[AgenciDAL::$id_agent].', \''.$tabParametr[AgenciDAL::$nazwa].'\', \''.$tabParametr[AgenciDAL::$nazwa_pot].'\', \''.$tabParametr[AgenciDAL::$nazwa_firma].'\', null, 
                null, \''.$tabParametr[AgenciDAL::$telefon].'\', \''.$tabParametr[AgenciDAL::$komorka].'\', \''.$tabParametr[AgenciDAL::$fax].'\', \''.$tabParametr[AgenciDAL::$email].'\', 
                '.$tabParametr[AgenciDAL::$licencja].', '.$tabParametr[AgenciDAL::$id_agent_otodom].', \''.$tabParametr[AgenciDAL::$wewnetrzny].'\', \''.$tabParametr[AgenciDAL::$nip].'\', \''.$tabParametr[AgenciDAL::$adres].'\', 
                '.$uprawnienia.', null, null, '.$tabParametr[AgenciDAL::$aktywnosc].');';
            }
            else
            {
                if (strlen($tabParametr[AgenciDAL::$id_agent_otodom]) < 1)
                {
                    $tabParametr[AgenciDAL::$id_agent_otodom] = 'null';
                }
                $uprawnienia = UtilsDAL::TabPhp2TabPg($tabParametr[AgenciDAL::$uprawnienia], false, $uprawnienia);
                $zapytanie = 'select * from WprowadzAgent(null, \''.$tabParametr[AgenciDAL::$nazwa].'\', \''.$tabParametr[AgenciDAL::$nazwa_pot].'\', \''.$tabParametr[AgenciDAL::$nazwa_firma].'\', \''.$tabParametr[AgenciDAL::$login].'\', 
                \''.$tabParametr[AgenciDAL::$haslo].'\', \''.$tabParametr[AgenciDAL::$telefon].'\', \''.$tabParametr[AgenciDAL::$komorka].'\', \''.$tabParametr[AgenciDAL::$fax].'\', \''.$tabParametr[AgenciDAL::$email].'\', 
                '.$tabParametr[AgenciDAL::$licencja].', '.$tabParametr[AgenciDAL::$id_agent_otodom].', \''.$tabParametr[AgenciDAL::$wewnetrzny].'\', \''.$tabParametr[AgenciDAL::$nip].'\', \''.$tabParametr[AgenciDAL::$adres].'\', 
                '.$uprawnienia.', '.$tabParametr[AgenciDAL::$id_bank].', \''.$tabParametr[AgenciDAL::$nr_konto].'\', null);';
            }
            //echo $zapytanie;
            
            $wynik = $this->dal->WprowadzanieDanych($zapytanie, false);

            return $wynik;
        }
        public function EdytujAgent($agent_id)
        {
            $zapytanie = 'select * from PodajAgentEdycja('.$agent_id.');';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            UtilsDAL::KorektaKolBool($wynik, array(AgenciDAL::$aktywnosc, AgenciDAL::$dodawanie, AgenciDAL::$edycja, AgenciDAL::$kasowanie, AgenciDAL::$druk, AgenciDAL::$admin_klient, AgenciDAL::$admin_dane, AgenciDAL::$zmiana_uprawnien));
            return $wynik;
        }
        public function ZmianaHasloAgent ($tabParametr)
        {
            $zapytanie = 'select * from ZmianaHasla(\''.$tabParametr[AgenciDAL::$login].'\', \''.$tabParametr[AgenciDAL::$haslo].'\', \''.$tabParametr[AgenciDAL::$nowe_haslo].'\');';
            $wynik = $this->dal->WprowadzanieDanych($zapytanie, false);
            
            return $wynik;
        }
    }
    class CentralkaDAL extends SzablonDAL
    {        
        protected $dal;
       
        public function CentralkaDAL()
        {
            $this->dal = new dal();
        }
        
        public function RozmowaPrzychodzaca($tabParametr)
        {
            $zapytanie = 'select RozmowaPrzychodzaca (\''.$tabParametr[CentralkaDAL::$nr_telefon].'\', '.$tabParametr[CentralkaDAL::$id_status_dzwonienie].', \''.$tabParametr[CentralkaDAL::$wewnetrzny].'\');';
            $wynik = $this->dal->OperacjaLogiczna($zapytanie);
            
            return $wynik;
        }
        public function PokazRozmowy($tabParametr, &$ilosc_wierszy)
        {
            $zapytanie = 'select * from PokazRozmowy ('.$tabParametr[CentralkaDAL::$id_status_dzwonienie].', \''.$tabParametr[CentralkaDAL::$czas_poczatek].'\');';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            
            return $wynik;
            
        }
    }
    class AdministracjaDAL extends SzablonDAL
    {
        protected $dal;
       
        public function AdministracjaDAL()
        {
            $this->dal = new dal();
        }
        
        public function UsunMailBiura ($tabParametr)
        {
            $zapytanie = 'select UsunMailBiura(\''.$tabParametr[AdministracjaDAL::$email].'\');';
            $wynik = $this->dal->OperacjaLogiczna($zapytanie);
            
            return $wynik;
        }
        public function PodajNieWytlumaczoneSlowa($tabParametr, &$ilosc_wierszy)
        {
            $zapytanie = 'select * from PodajNieWytlumaczoneSlowa('.$tabParametr[NieruchomoscDAL::$id_jezyk].');';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            
            return $wynik; 
        }
        public function DodajTlumaczenie ($tabParametr)
        {
            $zapytanie = 'select DodajTlumaczenie(\''.$tabParametr[AdministracjaDAL::$nazwa_lang_tag].'\', '.$tabParametr[NieruchomoscDAL::$id_jezyk].', \''.$tabParametr[AdministracjaDAL::$nazwa].'\');';
            $wynik = $this->dal->OperacjaLogiczna($zapytanie);
            
            return $wynik;
        }
        public function DodajTagJezyk ($tabParametr)
        {
            $zapytanie = 'select DodajTagJezyk(\''.$tabParametr[AdministracjaDAL::$nazwa_lang_tag].'\');';
            $wynik = $this->dal->OperacjaLogiczna($zapytanie);
            
            return $wynik;
        }
        public function StatOdwiedzOfert ($tabParametr, &$ilosc_wierszy)
        {
            $oferta = 'null';
            $tabela = '';
            $kierunek = '0';
            
            if (strlen($tabParametr[NieruchomoscDAL::$id_oferta]) > 0)
            {
                $oferta = $tabParametr[NieruchomoscDAL::$id_oferta];
            }
            if (strlen($tabParametr[NieruchomoscDAL::$sortuj]) > 0)
            {
                $tabela = $tabParametr[NieruchomoscDAL::$sortuj];
            }
            if (strlen($tabParametr[NieruchomoscDAL::$sortuj_kierunek]) > 0)
            {
                $kierunek = $tabParametr[NieruchomoscDAL::$sortuj_kierunek];
            }
            
            $zapytanie = 'select * from StatOdwiedzOfert('.$oferta.', \''.$tabela.'\', '.$kierunek.');';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            
            return $wynik;
        }
        public function StatWyszukiwanie($tabParametr, &$ilosc_wierszy)
        {
            $zapytanie = 'select * from StatWyszukiwanie(\''.$tabParametr[NieruchomoscDAL::$data].'\') order by data asc;';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            
            return $wynik;
        }
        //wyszukiwanie z zewnetrznych zrodel lub po prostu wejscia z zewnetrznych zrodel - prosto w oferte
        public function StatWyszukiwanieZewn($tabParametr, &$ilosc_wierszy)
        {
            $zapytanie = 'select * from StatWyszukiwanieZewn(\''.$tabParametr[NieruchomoscDAL::$data].'\') order by data asc;';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            
            return $wynik;
        }
        public function ListaParametrNier($tabParametr, &$ilosc_wierszy)
        {
            $zapytanie = 'select * from PodajParametrNier('.$tabParametr[WyposazenieNierDAL::$id_sekcja].');';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            
            return $wynik;
        }
        public function ListaWyposazenieNier($tabParametr, &$ilosc_wierszy)
        {
            $zapytanie = 'select * from PodajWyposazenieNier('.$tabParametr[WyposazenieNierDAL::$id_sekcja].');';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            UtilsDAL::KonwersjaDbBoolText($wynik, array(AdministracjaDAL::$ma_dzieci, AdministracjaDAL::$wielokrotne));
            
            return $wynik;
        }
        public function PodajParametrNierTrans($tabParametr, &$ilosc_wierszy)
        {
            $zapytanie = 'select * from PodajParametrNierTrans('.$tabParametr[WyposazenieNierDAL::$id_parametr_nier].');';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            UtilsDAL::KonwersjaDbBoolText($wynik, array(NieruchomoscDAL::$pokaz));
            
            return $wynik;
        }
        public function PodajWyposazenieNierTrans($tabParametr, &$ilosc_wierszy)
        {
            $zapytanie = 'select * from PodajWyposazenieNierTrans('.$tabParametr[WyposazenieNierDAL::$id_wyposazenie_nier].');';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            UtilsDAL::KonwersjaDbBoolText($wynik, array(NieruchomoscDAL::$pokaz));
            
            return $wynik;
        }
    }
?>