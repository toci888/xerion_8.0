<?php
    $path = str_replace($_SERVER['PHP_SELF'], '', $_SERVER['SCRIPT_FILENAME']).'/';
    
    include_once ($path.'dal/dal.php');
    include_once ($path.'dal/utilsdal.php');
    include_once ($path.'bll/tags.php');
    
    ///cóz : czas zaangazowac dziedziczenie : musze przyznac ze troche pozno
    //problem poklega na tym, iz sa metody niezbedne wszedzie :P i trzeba je zcentralizowac, zeby ich nie dziedziczyc przez schowek :P
    class NadrzednyDAL
    {
        protected $dal;
        
        public function NadrzednyDAL()
        {
            $this->dal = new dal();
        }
        
        public function PodajAgentow(&$iloscWierszy)
        {
            $wynik = $this->dal->PobierzDane('select * from PodajAgentow();', $iloscWierszy);
            //$wynik[count($wynik)] = array('id' => 0, 'nazwa' => tags::$wszyscy); 
            return $wynik;
        }
    }
    
    class JezykDAL
    {
        public static $id_jezyk = 'id_jezyk';
        public static $nazwa = 'nazwa';
        public static $tlumaczenie = 'tlumaczenie';
        public static $nazwa_tag = 'nazwa_tag';
        
        protected $dal;
        //konstruktor
        public function JezykDAL()
        {
            $this->dal = new dal();
        }
        
        public function Tlumaczenia(&$ilosc_wierszy) 
        {
            $wynik = $this->dal->PobierzDane('select * from Tlumaczenia();', $ilosc_wierszy);
            UtilsDAL::TabPg2TabPhp($wynik, array(JezykDAL::$nazwa_tag, JezykDAL::$tlumaczenie));
            return $wynik;
        }
    }
    
    class AgentDAL
    {
       public static $login = 'login';
       public static $haslo = 'haslo'; 
       public static $id_agent = 'id_agent';
       public static $id_agent_otodom = 'id_agent_otodom';
       public static $nowe_haslo = 'nowe_haslo';
       public static $rezultat = 'rezultat';
       public static $aktywnosc = 'aktywnosc';
       public static $nazwa = 'nazwa';
       public static $firma = 'firma';
       public static $nip = 'nip';
       public static $bank = 'bank';
       public static $nr_konto = 'nr_konto';
       public static $wewnetrzny = 'wewnetrzny';
       public static $adres = 'adres';
       public static $il_dni_wyg = 'il_dni_wyg';
       public static $dodawanie = 'dodawanie';
       public static $edycja = 'edycja';
       public static $kasowanie = 'kasowanie';
       public static $druk = 'druk';
       public static $admin_klient = 'adm_klient';
       public static $admin_dane = 'adm_dane';
       public static $zmiana_uprawnien = 'zmiana_upr';
       
       protected $dal;
       
       public function AgentDAL()
       {
           $this->dal = new dal();
           
       } 
       
       public function Logowanie($tabParam)
       {
           $zapytanie = "select * from Logowanie('".$tabParam[AgentDAL::$login]."', '".$tabParam[AgentDAL::$haslo]."');";
           $wynik = $this->dal->PobierzDane($zapytanie, $ilWier);
           UtilsDAL::KorektaKolBool($wynik, array(AgentDAL::$rezultat, AgentDAL::$aktywnosc));
           UtilsDAL::TabPg2TabPhp($wynik, array(AgentDAL::$bank, AgentDAL::$nr_konto));
           if ($wynik[0][AgentDAL::$rezultat] == true)
           {
               UtilsDAL::KorektaKolBool($wynik, array(AgentDAL::$dodawanie, AgentDAL::$edycja, AgentDAL::$kasowanie, AgentDAL::$druk, AgentDAL::$admin_klient, AgentDAL::$admin_dane, AgentDAL::$zmiana_uprawnien));
           }

           return $wynik;
       }
       
       public function ZmianaHasla($tabParam)
       {
           $zapytanie = "select * from ZmianaHasla('".$tabParam[AgentDAL::$login]."','".$tabParam[AgentDAL::$haslo]."','".$tabParam[AgentDAL::$nowe_haslo]."');";
           $wynik = $this->dal->OperacjaLogiczna($zapytanie);
           
           return $wynik;
       }
       
       public function PodajNazwaAgentId($id_agent)                                           
       {
           $zapytanie = 'select * from PodajNazwaAgentId('.$id_agent.');';
           $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            
           return $wynik;
       }
       //metoda + procedura raczej juz zbedna :P
       public function PodajKontoAgent($id_agent, &$ilosc_wierszy)
       {
           $zapytanie = 'select * from PodajKontoAgenta('.$id_agent.');';
           $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            
           return $wynik;
       }
    }
    
    class TransNierDAL extends NadrzednyDAL
    {
        public static $id = 'id';
        public static $id_nieruchomosc = 'id_nier'; 
        public static $nazwa_nieruchomosc = 'nazwa';
        public static $id_transakcja = 'id_trans'; 
        public static $nazwa_transakcja = 'nazwa_trans';
        public static $of_zap = 'oferta_zapotrzebowanie';
        
        protected $dal;
        
        public function TransNierDAL()
        {
            $this->dal = new dal();
        }
        
        public function PodajListeNieruchomosci(&$iloscWierszy)
        {
            $wynik = $this->dal->PobierzDane('select * from podajnier();', $iloscWierszy);
            return $wynik;
        }
        public function PodajListeTransakcji($tabParametr, &$iloscWierszy)
        {
            $wynik = $this->dal->PobierzDane('select * from PodajTransRodzaj(\''.$tabParametr[TransNierDAL::$of_zap].'\');', $iloscWierszy);
            return $wynik;
        }
        public function TransakcjeDlaNieruchomosci($tabParam, &$iloscWierszy)
        {
            $zapytanie = "select * from podajtransdlanier(".$tabParam[TransNierDAL::$id_nieruchomosc].", '".$tabParam[TransNierDAL::$of_zap]."');";
            $wynik = $this->dal->PobierzDane($zapytanie, $iloscWierszy);
            
            return $wynik;
        }
        public function PodajTransIdNierIdOferta($id_oferta)
        {
            $zapytanie = "select * from PodajTransIdNierIdOferta(".$id_oferta.");";
            $wynik = $this->dal->PobierzDane($zapytanie, $iloscWierszy);
            
            return $wynik;
        }
    }
    class MediaNierDAL
    {
        public static $id_zdjecie = 'id_zdjecie';
        public static $id_film = 'id_film';
        public static $rozszerzenie = 'rozszerzenie';
        public static $sciezka = 'sciezka';
        public static $id = 'id';
        public static $nazwa = 'nazwa';
        
        protected $dal;
        protected $nieruchomosc_id;
        
        public function MediaNierDAL($nieruchomosc_id)
        {
            $this->dal = new dal();
            $this->nieruchomosc_id = $nieruchomosc_id;
        }
        
        public function DodajZdjecie($tabParametr)
        {
            $zapytanie = 'select DodajZdjecie('.$this->nieruchomosc_id.', \''.$tabParametr[MediaNierDAL::$rozszerzenie].'\');';
            $wynik = $this->dal->WprowadzanieDanych($zapytanie, false);

            return $wynik;
        }
        public function UsunZdjecie($tabParametr)
        {
            $zapytanie = 'select UsunZdjecie('.$tabParametr[MediaNierDAL::$id_zdjecie].');';
            $wynik = $this->dal->WprowadzanieDanych($zapytanie, false);
            
            return $wynik;
        }
        public function PodajZdjecia($tabParametr)
        {
            $zapytanie = 'select * from PodajZdjecia('.$this->nieruchomosc_id.', \''.$tabParametr[MediaNierDAL::$sciezka].'\');';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            
            return $wynik;
        }
        public function DodajFilm($tabParametr)
        {
            $zapytanie = 'select DodajFilm('.$this->nieruchomosc_id.', \''.$tabParametr[MediaNierDAL::$rozszerzenie].'\');';
            $wynik = $this->dal->WprowadzanieDanych($zapytanie, false);
            
            return $wynik;
        }
        public function UsunFilm($tabParametr)
        {
            $zapytanie = 'select UsunFilm('.$tabParametr[MediaNierDAL::$id_film].');';
            $wynik = $this->dal->WprowadzanieDanych($zapytanie, false);
            
            return $wynik;
        }
        public function PodajFilmy($tabParametr)
        {
            $zapytanie = 'select * from PodajFilmy('.$this->nieruchomosc_id.', \''.$tabParametr[MediaNierDAL::$sciezka].'\');';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            
            return $wynik;
        }
        public function PodniesZdjecie($tabParametr)
        {
            $zapytanie = 'select * from PodniesZdjecie('.$tabParametr[MediaNierDAL::$id_zdjecie].', '.$this->nieruchomosc_id.');';
            $wynik = $this->dal->OperacjaLogiczna($zapytanie);
            
            return $wynik;
        }
        public function ObnizZdjecie($tabParametr)
        {
            $zapytanie = 'select * from ObnizZdjecie('.$tabParametr[MediaNierDAL::$id_zdjecie].', '.$this->nieruchomosc_id.');';
            $wynik = $this->dal->OperacjaLogiczna($zapytanie);
            
            return $wynik;
        }
    }  
    class WyposazenieNierDAL //nazwa niefortunna, zostanie uzyte dla wszystkich 4 slownikow - wyposazenia i parametry nier, wypoazenia i parametry pom
    {
        public static $id_sekcja = 'id_sekcja';
        public static $nazwa_sekcja = 'nazwa_sekcja';
        public static $id_pomieszczenie = 'id_pomieszczenie';
        public static $nazwa_pomieszczenie = 'nazwa_pomieszczenie';
        public static $id_parent = 'id_parent';
        public static $id = 'id';
        public static $wielokrotne = 'wielokrotne';
        public static $nazwa = 'nazwa';
        public static $walidacja = 'walidacja';
        public static $dl_inf = 'dl_inf';
        //public static $id = 'id';
        public static $id_pom_nier = 'pom_przyn_nier';
        public static $nr_pomieszczenie = 'nr_pomieszczenie';
        public static $id_parametr_pom = 'id_parametr_pom';
        public static $id_parametr_nier = 'id_parametr_nier';
        public static $id_wyposazenie_nier = 'id_wyposazenie_nier';
        public static $wartosc = 'wartosc';  
        public static $id_transakcja = 'id_tranzakcja';
        public static $id_nieruchomosc = 'id_nieruchomosc';
        
        protected $dal;
        protected $parametry;
        //na etapie tworzenia nowego obiektu wymagane bedzie znanie id nieruchomosci w bazie bezwzglednie
        protected $nieruchomoscId;
        
        //konstruktor ma w parametrze id nieruchomosci, gdyz musi ono koniecznie byc znane na etapie tworzenia (powolywania ;) ) obiektu
        public function WyposazenieNierDAL($tabParametry, $nierId)
        {
            $this->parametry = $tabParametry;
            $this->dal = new dal();
            $this->nieruchomoscId = $nierId;
        }
        //procedura pobiera wszystkie wyposazenia dla danego typu nieruchomosci przy danym rodzaju transakcji
        public function WyposazenieNieruchomosci(&$ilosc_wierszy)
        {
            //stare i troche nie trzyma sie konwencji - id transakcja to jest id trans rodzaj, id nieruchomosc to jest id nier rodzaj
            $zapytanie = "select * from pobierzwyposazenienier(".$this->parametry[WyposazenieNierDAL::$id_transakcja].", ".$this->parametry[WyposazenieNierDAL::$id_nieruchomosc].") where id is not null;";
            $wynik = $this->dal->PobierzDane($zapytanie,$ilosc_wierszy);
            UtilsDAL::TabPg2TabPhp($wynik, array(WyposazenieNierDAL::$id_parent, WyposazenieNierDAL::$id, WyposazenieNierDAL::$wielokrotne, WyposazenieNierDAL::$nazwa));
            
            return $wynik;
        }
        //procedura pobiera wszystkie parametry dla danego typu nieruchomosci przy danym rodzaju transakcji
        public function ParametryNieruchomosci(&$ilosc_wierszy)
        {
            //stare i troche nie trzyma sie konwencji - id transakcja to jest id trans rodzaj, id nieruchomosc to jest id nier rodzaj
            $zapytanie = "select * from PobierzParametryNier(".$this->parametry[WyposazenieNierDAL::$id_transakcja].", ".$this->parametry[WyposazenieNierDAL::$id_nieruchomosc].") where id is not null;";
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            UtilsDAL::TabPg2TabPhp($wynik, array(WyposazenieNierDAL::$id, WyposazenieNierDAL::$nazwa, WyposazenieNierDAL::$walidacja, WyposazenieNierDAL::$dl_inf));
            
            return $wynik;
        }
        
        public function PomieszczeniaNieruchomosci(&$ilosc_wierszy)
        {
            $zapytanie = 'select * from PobierzPomieszczeniaNieruchomosc('.$this->parametry[WyposazenieNierDAL::$id_nieruchomosc].');';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            
            return $wynik;
        }
        //te 2 funkcje ponizej bez sensu
        //zamiast tego podaj wyposazenie pomieszczen dla danego pomieszczenia to samo parametry
        public function WyposazeniePomieszczen($id_pomieszczenie, &$ilosc_wierszy)
        {
            $zapytanie = "select * from PobierzWyposazeniePomNier(".$id_pomieszczenie.");";
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            //UtilsDAL::TabPg2TabPhp($wynik, array(WyposazenieNierDAL::$id_parent, WyposazenieNierDAL::$id, WyposazenieNierDAL::$wielokrotne, WyposazenieNierDAL::$nazwa));
            
            return $wynik;
        }
        
        public function ParametryPomieszczen($id_pomieszczenie, &$ilosc_wierszy)
        {
            $zapytanie = "select * from PobierzParametryPomNier(".$id_pomieszczenie.");";
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            //UtilsDAL::TabPg2TabPhp($wynik, array(WyposazenieNierDAL::$id, WyposazenieNierDAL::$nazwa, WyposazenieNierDAL::$walidacja, WyposazenieNierDAL::$dl_inf));
            
            return $wynik;
        }
        public function DodajWyposazenieNier ($operacja_dodaj, $wyposazenie_id)
        {
            $dodaj = 'false';
            if ($operacja_dodaj) //zmienan typu bool wiec if pojdzie jesli bedzie ona na true
            {
                $dodaj = 'true';
            }
            $zapytanie = 'select DodajWyposazenieNier('.$dodaj.', '.$this->nieruchomoscId.', '.$wyposazenie_id.');';
            $wynik = $this->dal->OperacjaLogiczna($zapytanie);
            
            return $wynik;
        }
        public function DodajParametrNier ($operacja_dodaj, $parametr_id, $wartosc = null)
        {
            $dodaj = 'false';
            if ($operacja_dodaj) //zmienan typu bool wiec if pojdzie jesli bedzie ona na true
            {
                $dodaj = 'true';
            }
            //ta wartosc jest zle optaszkowana ale to nie spowoduje problemow
            $zapytanie = 'select DodajParametrNier('.$dodaj.', '.$this->nieruchomoscId.', '.$parametr_id.', \''.$wartosc.'\');';
            $wynik = $this->dal->OperacjaLogiczna($zapytanie);
            
            return $wynik;
        }
        public function DodajPomieszczenie($operacja_dodaj, $id_pomieszczenie)
        {
            if ($operacja_dodaj)
            {
                $zapytanie = 'select dodajpomieszczenienier as id from DodajPomieszczenieNier('.$this->nieruchomoscId.', '.$id_pomieszczenie.');';
                $wynik = $this->dal->WprowadzanieDanych($zapytanie);
                return (int)$wynik['id'];
            }
            else
            {
                $zapytanie = 'select UsunPomieszczenieNier('.$id_pomieszczenie.');';
                $wynik = $this->dal->OperacjaLogiczna($zapytanie);
                return $wynik;
            }
        }
        public function PodajPomieszczeniaNier($pomieszczenie_id)
        {
            $zapytanie = 'select * from PobierzPomPrzynNier('.$this->nieruchomoscId.','.$pomieszczenie_id.');';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            
            return $wynik;
        }
        public function EdycjaWyposazeniePom($pomieszczenie_id)
        {
            $zapytanie = 'select edycjawyposazeniepom as id from EdycjaWyposazeniePom('.$pomieszczenie_id.');';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            
            return $wynik;
        }
        public function EdycjaParametrPom($pomieszczenie_id)
        {
            $zapytanie = 'select * from EdycjaParametrPom('.$pomieszczenie_id.');';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            UtilsDAL::TabIdNazwa2TabIndexId($wynik, WyposazenieNierDAL::$wartosc);
            
            return $wynik;
        }
        public function DodajWyposazeniePom($operacja_dodaj, $pomieszczenie_id, $wyposazenie_id)
        {
            $dodaj = 'false';
            if ($operacja_dodaj) //zmienan typu bool wiec if pojdzie jesli bedzie ona na true
            {
                $dodaj = 'true';
            }
            $zapytanie = 'select DodajWyposazeniePom('.$dodaj.', '.$pomieszczenie_id.', '.$wyposazenie_id.');';
            $wynik = $this->dal->OperacjaLogiczna($zapytanie);
            
            return $wynik;
        }
        public function DodajParametrPom($operacja_dodaj, $tabParam)
        {
            $dodaj = 'false';
            if ($operacja_dodaj)
            {
                $dodaj = 'true';
            }
            $zapytanie = 'select DodajParametrPom('.$dodaj.', '.$tabParam[WyposazenieNierDAL::$id_pom_nier].', '.
            $tabParam[WyposazenieNierDAL::$id_parametr_pom].', \''.$tabParam[WyposazenieNierDAL::$wartosc].'\');';
            $wynik = $this->dal->OperacjaLogiczna($zapytanie);
            
            return $wynik;
        }
    }
    class WyposazenieZapDAL
    {
        public static $id_sekcja = 'id_sekcja';
        public static $nazwa_sekcja = 'nazwa_sekcja';
        public static $id_parent = 'id_parent';
        public static $id = 'id';
        public static $wielokrotne = 'wielokrotne';
        public static $nazwa = 'nazwa';
        public static $walidacja = 'walidacja';
        public static $dl_inf = 'dl_inf';
        public static $wartosc = 'wartosc';  
        public static $id_transakcja = 'id_tranzakcja';
        public static $id_zapotrzebowanie = 'id_zapotrzebowanie';
        public static $id_nier_rodzaj = 'id_nier_rodzaj';
        public static $id_trans_rodzaj = 'id_trans_rodzaj';
        public static $id_zapotrzebowanie_nier_rodzaj = 'id_zapotrzebowanie_nier_rodzaj';
        public static $id_zapotrzebowanie_trans_rodzaj = 'id_zapotrzebowanie_trans_rodzaj';
        public static $dane_wyposazenie_zap = 'dane_wyposazenie_zap';
        public static $dane_parametr_zap_min = 'dane_parametr_zap_min';
        public static $dane_parametr_zap_min_wartosc = 'dane_parametr_zap_min_wartosc';
        public static $dane_parametr_zap_max = 'dane_parametr_zap_max';
        public static $dane_parametr_zap_max_wartosc = 'dane_parametr_zap_max_wartosc';
        public static $poziom_parametry = 'poziom_param';
        public static $poziom_wyposazenia = 'poziom_wypos';
        public static $id_opis = 'id_opis';
        public static $id_opis_zapotrzebowanie = 'id_opis_zapotrzebowanie';
        public static $id_jezyk = 'id_jezyk';
        public static $jezyk = 'jezyk';
        public static $tresc = 'tresc';
        public static $opis = 'opis';
        public static $id_opis_posz_zapotrzebowanie = 'id_opis_posz_zapotrzebowanie';
        
        protected $dal;
        protected $parametry;
        //na etapie tworzenia nowego obiektu wymagane bedzie znanie id zapotrzebowanie trans rodzaj w bazie bezwzglednie
        protected $zapotrzebowanieId;
        
        //konstruktor ma w parametrze id nieruchomosci, gdyz musi ono koniecznie byc znane na etapie tworzenia (powolywania ;) ) obiektu
        public function WyposazenieZapDAL($zapTransRodzajId)
        {
            $this->dal = new dal();
            $this->zapotrzebowanieId = $zapTransRodzajId;
            $this->WczytajIdTransIdNierZapotrzebowanie();
        }
        //metoda bedzie miec za zadanie zwracanie listy rodzajow budynku dostepnych dla danej transakcji
        //procedura od razu uwzglednia zarowno mozliwosci dla typu nieruchomosci, jak i juz wybrane elementy
        public function PodajDostepneRodzajeBudynku()
        {
            $zapytanie = 'select * from PodajDostZapotrzNierSzczeg('.$this->zapotrzebowanieId.', '.$this->parametry[WyposazenieZapDAL::$id_nier_rodzaj].');';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            
            return $wynik;
        }
        
        public function PodajDodaneRodzajeBudynku()
        {
            $zapytanie = 'select * from PodajZapotrzNierSzczeg('.$this->zapotrzebowanieId.');';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            
            return $wynik;
        }
        //metoda przyjmuje rodzaj budynku do dodania lub usuniecia dla danego zapotrzebowania - transakcji
        public function DodajZapotrzebowanieRodzajBudynku($operacja_dodaj, $rodzaj_budynek_id)
        {
            $zapytanie = 'select DodajZapotrzNierSzczeg('.$operacja_dodaj.', '.$this->zapotrzebowanieId.', '.$rodzaj_budynek_id.');';
            $wynik = $this->dal->OperacjaLogiczna($zapytanie);
            
            return $wynik;
        }
        public function DodajRegGeogZap($region_id)
        {
            $zapytanie = 'select * from DodajRegGeogZap('.$this->zapotrzebowanieId.', '.$region_id.');';
            $wynik = $this->dal->WprowadzanieDanych($zapytanie, false);
            
            return $wynik;
        }
        public function PodajRegGeogZap(&$IloscWierszy)
        {
            $zapytanie = 'select * from PodajRegGeogZap('.$this->zapotrzebowanieId.');';
            $wynik = $this->dal->PobierzDane($zapytanie, $IloscWierszy);
            UtilsDAL::TabPg2TabPhp($wynik, array(NieruchomoscDAL::$rodzice));
            
            return $wynik;
        }
        public function UsunRegGeogZap($region_id)
        {
            $zapytanie = 'select * from UsunRegGeogZap('.$this->zapotrzebowanieId.','.$region_id.');';
            $wynik = $this->dal->OperacjaLogiczna($zapytanie);
            
            return $wynik;    
        }
        
        ///kojarzenia ofert dla zapotrzebowan i dla ofert, 2 koncowe parametry to poziom kojarzenia dla 4 wag z tabel param i wypos
        public function KojarzenieBazoweDlaZapotrzebowania($tabParametr = null, &$ilosc_wierszy)
        {
            $zain = 'true';
            $poziom_par = 'null';
            $poziom_wyp = 'null';
            
            if (isset($tabParametr[NieruchomoscDAL::$zainteresowany]))
            {
                $zain = $tabParametr[NieruchomoscDAL::$zainteresowany];
            }
            if (isset($tabParametr[WyposazenieZapDAL::$poziom_parametry]))
            {
                $poziom_par = $tabParametr[WyposazenieZapDAL::$poziom_parametry];
            }
            if (isset($tabParametr[WyposazenieZapDAL::$poziom_wyposazenia]))
            {
                $poziom_wyp = $tabParametr[WyposazenieZapDAL::$poziom_wyposazenia];
            }
            
            $zapytanie = 'select * from KojarzenieBazoweDlaZapotrzebowania('.$this->zapotrzebowanieId.', '.$poziom_par.', '.$poziom_wyp.', '.$zain.') order by data_otw_zlecenie desc;';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            UtilsDAL::TabPg2TabPhp($wynik, array(OsobaDAL::$telefon));

            return $wynik;
        }
        public function PokazWybraneParamZlecenie($tabParametr, &$ilosc_wierszy)
        {
            $zapytanie = 'select * from PokazWybraneParamZlecenie('.$this->zapotrzebowanieId.', '.$tabParametr[WyposazenieZapDAL::$poziom_parametry].');';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);

            return $wynik;
        }
        
        //kojarzenie mediow dla zapotrzebowan
        public function KojarzenieZapotrzebowanieMedia(&$ilosc_wierszy)
        {
            $zapytanie = 'select * from KojarzenieZapotrzebowanieMedia('.$this->zapotrzebowanieId.');';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            
            return $wynik;
        }
        
        public function WyposazenieZapotrzebowania(&$ilosc_wierszy)
        {
            $zapytanie = "select * from pobierzwyposazenienier(".$this->parametry[WyposazenieZapDAL::$id_trans_rodzaj].", ".$this->parametry[WyposazenieZapDAL::$id_nier_rodzaj].") where id is not null;";
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            UtilsDAL::TabPg2TabPhp($wynik, array(WyposazenieZapDAL::$id_parent, WyposazenieZapDAL::$id, WyposazenieZapDAL::$wielokrotne, WyposazenieZapDAL::$nazwa)); //wg mnie wielokrotne tu bez sensu
            //jest to zapotrzebowanie, osoba moze miec wiele alternatyw na ktore sie godzi lub sa zgodne z jej oczekiwaniami
            
            return $wynik;
        }
        public function ParametryZapotrzebowania(&$ilosc_wierszy)
        {                       //to id zapotrzebowanie tu ni w pizde ni w oko ;/, to jest id rodzaju nier
            $zapytanie = "select * from PobierzParametryNier(".$this->parametry[WyposazenieZapDAL::$id_trans_rodzaj].", ".$this->parametry[WyposazenieZapDAL::$id_nier_rodzaj].") where id is not null;";
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            UtilsDAL::TabPg2TabPhp($wynik, array(WyposazenieNierDAL::$id, WyposazenieNierDAL::$nazwa, WyposazenieNierDAL::$walidacja, WyposazenieNierDAL::$dl_inf));
            
            return $wynik;
        }
        public function DodajWyposazenieZap ($operacja_dodaj, $wyposazenie_id)
        {
            $dodaj = 'false';
            if ($operacja_dodaj) //zmienna typu bool wiec if pojdzie jesli bedzie ona na true
            {
                $dodaj = 'true';
            }
            $zapytanie = 'select DodajWyposazenieZap('.$dodaj.', '.$this->zapotrzebowanieId.', '.$wyposazenie_id.');';
            $wynik = $this->dal->OperacjaLogiczna($zapytanie);
            
            return $wynik;
        }
        public function DodajParametrZap ($operacja_dodaj, $min_par, $parametr_id, $wartosc = null)
        {
            $dodaj = 'false';
            if ($operacja_dodaj) //zmienan typu bool wiec if pojdzie jesli bedzie ona na true
            {
                $dodaj = 'true';
            }
            $min = 'false';
            if ($min_par)
            {
                $min = 'true';
            }
            //ta wartosc jest zle optaszkowana ale to nie spowoduje problemow
            $zapytanie = 'select DodajParametrZap('.$dodaj.', '.$min.', '.$this->zapotrzebowanieId.', '.$parametr_id.', \''.$wartosc.'\');';
            $wynik = $this->dal->OperacjaLogiczna($zapytanie);
            
            return $wynik;
        }
        public function PodajTransRodzajWypPar()
        {
            $zapytanie = 'select * from EdycjaZapTransRodzajWypPar('.$this->zapotrzebowanieId.');';
            $wynik = $this->dal->PobierzDane($zapytanie, $iloscWierszy);
            
            UtilsDAL::TabPg2TabPhp($wynik, array(WyposazenieZapDAL::$dane_wyposazenie_zap, WyposazenieZapDAL::$dane_parametr_zap_min, WyposazenieZapDAL::$dane_parametr_zap_max), true);
            UtilsDAL::TabPg2TabPhp($wynik, array(WyposazenieZapDAL::$dane_parametr_zap_min_wartosc, WyposazenieZapDAL::$dane_parametr_zap_max_wartosc));
            
            return $wynik;
        }
        protected function WczytajIdTransIdNierZapotrzebowanie()
        {
            $zapytanie = 'select * from PodajIdTransIdNierZapotrzebowanie('.$this->zapotrzebowanieId.');';
            $wynik = $this->dal->PobierzDane($zapytanie, $il_wierszy);
            
            $this->parametry[WyposazenieZapDAL::$id_nier_rodzaj] = $wynik[0][WyposazenieZapDAL::$id_nier_rodzaj];
            $this->parametry[WyposazenieZapDAL::$id_trans_rodzaj] = $wynik[0][WyposazenieZapDAL::$id_trans_rodzaj];
        }
        public function DodajOpisZapotrzebowanieTrRodz($tabParametr)
        {
            $id_opis = 'null';
            if (isset($tabParametr[WyposazenieZapDAL::$id_opis]))
            {
                $id_opis = $tabParametr[WyposazenieZapDAL::$id_opis];
            }
            $zapytanie = 'select * from DodajOpisZapotrzebowanieTrRodz('.$id_opis.','.$tabParametr[WyposazenieZapDAL::$id_zapotrzebowanie_trans_rodzaj].', '.
            $tabParametr[WyposazenieZapDAL::$id_jezyk].', \''.$tabParametr[WyposazenieZapDAL::$tresc].'\');';
            $wynik = $this->dal->OperacjaLogiczna($zapytanie);
            
            return $wynik;    
        }
        public function PodajOpisZapotrzebowanieTrRodz($tabParametr, &$ilosc_wierszy)
        {
            $zapytanie = 'select * from PodajOpisZapotrzebowanieTrRodz('.$tabParametr[WyposazenieZapDAL::$id_zapotrzebowanie_trans_rodzaj].');';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            
            return $wynik;
        }       
        public function UsunOpisZapotrzebowanieTrRodz($tabParametr)
        {
            $zapytanie = 'select * from UsunOpisZapotrzebowanieTrRodz('.$tabParametr[WyposazenieZapDAL::$id_opis].');';
            $wynik = $this->dal->OperacjaLogiczna($zapytanie);
            
            return $wynik;    
        } 
        public function PodajDostOpisZapotrzebowanieTrRodz($tabParametr, &$ilosc_wierszy)
        {
            $zapytanie = 'select * from PodajDostOpisZapotrzebowanieTrRodz('.$tabParametr[WyposazenieZapDAL::$id_zapotrzebowanie_trans_rodzaj].');';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            
            return $wynik;
        }
        public function DodajOpisPoszZapotrzebowanie($tabParametr)
        {
            $zapytanie = 'select * from DodajOpisPoszZapotrzebowanie('.$tabParametr[WyposazenieZapDAL::$id_zapotrzebowanie_trans_rodzaj].', '.$tabParametr[NieruchomoscDAL::$id_agent].', \''.$tabParametr[WyposazenieZapDAL::$tresc].'\');';
            $wynik = $this->dal->OperacjaLogiczna($zapytanie);
            
            return $wynik;
        } 
        public function PodajOpisPoszZapotrzebowanie($tabParametr, &$ilosc_wierszy)
        {
            $zapytanie = 'select * from PodajOpisPoszZapotrzebowanie('.$tabParametr[WyposazenieZapDAL::$id_zapotrzebowanie_trans_rodzaj].');';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            
            return $wynik;
        }
        public function UsunOpisPoszZapotrzebowanie($tabParametr)
        {
            $zapytanie = 'select * from UsunOpisPoszZapotrzebowanie('.$tabParametr[WyposazenieZapDAL::$id_opis].');';
            $wynik = $this->dal->OperacjaLogiczna($zapytanie);
            
            return $wynik;    
        }
    }
    class NieruchomoscDAL
    {
        public static $id_oferta = 'id_oferta';
        public static $id = 'id';
        public static $id_zapotrzebowanie = 'id_zapotrzebowanie';
        public static $id_nieruchomosc = 'id_nieruchomosc';
        public static $id_klient = 'id_klient';
        public static $id_osoba_klient = 'id_osoba_klient';
        public static $id_osoba = 'id_osoba';
        public static $id_osobowosc = 'id_osobowosc';
        public static $id_nier_rodzaj = 'id_nier_rodzaj';
        public static $id_rodz_nier_szcz = 'id_rodz_nier_szcz';
        public static $id_rodz_trans = 'id_rodz_trans';
        public static $id_trans_rodzaj = 'id_trans_rodzaj';
        public static $id_status = 'id_status';
        public static $id_region_geog = 'id_region_geog';
        public static $id_prow_zap = 'id_prow_zap';
        public static $id_agent = 'id_agent';
        public static $id_opis = 'id_opis';
        public static $id_spotkanie = 'id_spotkanie';
        public static $miejscowosc = 'miejscowosc'; 
        public static $nazwa = 'nazwa';
        public static $notatka = 'notatka';
        public static $id_notatka = 'id_notatka';
        public static $imie = 'imie';        
        public static $transakcja_rodzaj = 'transakcja_rodzaj';
        public static $nieruchomosc_rodzaj = 'nieruchomosc_rodzaj';
        public static $rodzaj_budynek = 'rodzaj_budynek';
        public static $cena = 'cena';
        public static $status = 'status';
        public static $podpis = 'podpis';
        public static $region = 'region';
        public static $rodzice = 'rodzice';
        public static $agent = 'agent';
        public static $ulica_net = 'ulica_net';
        public static $ulica = 'ulica';
        public static $adres = 'adres';
        public static $kod = 'kod';
        public static $data = 'data';
        public static $rynek = 'rynek';
        public static $klucz = 'klucz';
        public static $data_otw_zlecenie = 'data_otw_zlecenie';
        public static $data_zam_zlecenie = 'data_zam_zlecenie';
        public static $prowizja = 'prowizja';
        public static $prow_proc = 'prow_proc';
        public static $wylacznosc = 'wylacznosc';
        public static $pokaz = 'pokaz';
        public static $czas_przekazania = 'czas_przekazania';
        public static $przek_od_otwarcia = 'przek_od_otwarcia';
        public static $dane_wyposazenie_nier = 'dane_wyposazenie_nier';
        public static $dane_parametr_nier = 'dane_parametr_nier';
        public static $dane_parametr_nier_wartosc = 'dane_parametr_nier_wartosc';
        public static $dane_wyposazenie_zap = 'dane_wyposazenie_zap';
        public static $dane_parametr_zap = 'dane_parametr_zap';
        public static $dane_parametr_zap_wartosc = 'dane_parametr_zap_wartosc';
        public static $of_zap = 'oferta_zapotrzebowanie';
        public static $id_zapotrzebowanie_nier_rodzaj = 'id_zapotrzebowanie_nier_rodzaj';
        public static $id_zapotrzebowanie_trans_rodzaj = 'id_zapotrzebowanie_trans_rodzaj';
        public static $dane_pomieszczenie_przyn_nier = 'dane_pomieszczenie_przyn_nier'; //pytanie czy to jeszcze ma sens, chyba nie :P
        public static $poziom_parametry = 'poziom_param';
        public static $poziom_wyposazenia = 'poziom_wypos';
        public static $id_rodzaj_dowod_tozsamosc = 'id_rodzaj_dowod_tozsamosc';
        public static $opis = 'opis';
        public static $wlasciciel = 'wlasciciel';
        public static $oferent = 'oferent';
        public static $klient = 'klient';
        public static $id_godzina = 'id_godzina';
        public static $id_minuta = 'id_minuta';
        public static $godzina = 'godzina';
        public static $id_opis_nieruchomosc = 'id_opis_nieruchomosc';
        public static $id_jezyk = 'id_jezyk';
        public static $tresc = 'tresc';
        public static $nazwisko = 'nazwisko';
        public static $pesel = 'pesel';
        public static $jezyk = 'jezyk';
        public static $id_sposob_finansowania = 'id_sposob_finansowania';
        public static $sposob_finansowania = 'sposob_finansowania';
        public static $poszukiwane_dla = 'poszukiwane_dla';
        public static $niezainteresowany = 'niezainteresowany';
        public static $zainteresowany = 'zainteresowany';
        public static $id_priorytet_reklama = 'id_priorytet_reklama';
        public static $is_lst_wsk = 'is_lst_wsk';
        public static $is_sprzedana = 'is_sprzedana';
        public static $is_azg = 'is_azg';
        
        ///sort to troche inna para kaloszy, ni ma w bazie takiej kom :P
        public static $sortuj = 'sortuj';
        public static $sortuj_kierunek = 'sortuj_kierunek';
    
        protected $dal;
        
        public function NieruchomoscDAL ()
        {
            $this->dal = new dal();
        }
        
        public function SzybkieSzukanie($tabParametr, &$ilosc_wierszy)
        {
            $zapytanie = "select * from SzybkieSzukanie (".$tabParametr[NieruchomoscDAL::$nazwisko].", ".$tabParametr[NieruchomoscDAL::$id_oferta].");";
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            //konwersja booli na tak/nie
            UtilsDAL::KonwersjaDbBoolText($wynik, array(NieruchomoscDAL::$pokaz, NieruchomoscDAL::$wylacznosc, NieruchomoscDAL::$klucz));
            UtilsDAL::TabPg2TabPhp($wynik, array(OsobaDAL::$telefon));
            
            return $wynik;
        }
        public function SzukanieOfertaAdres($tabParametr, &$ilosc_wierszy)
        {
            $zapytanie = "select * from SzukanieOfertaAdres (".$tabParametr[NieruchomoscDAL::$ulica].");";
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            //konwersja booli na tak/nie
            UtilsDAL::KonwersjaDbBoolText($wynik, array(NieruchomoscDAL::$pokaz, NieruchomoscDAL::$wylacznosc, NieruchomoscDAL::$klucz));
            UtilsDAL::TabPg2TabPhp($wynik, array(OsobaDAL::$telefon));
            
            return $wynik;
        }
        public function SzybkieSzukanieZapotrzebowanie ($tabParametr,&$ilosc_wierszy)
        {
            $zapytanie = 'select * from SzybkieSzukanieZapotrzebowanie ('.$tabParametr[NieruchomoscDAL::$nazwisko].', '.$tabParametr[NieruchomoscDAL::$id_zapotrzebowanie].');';
            //echo $zapytanie;
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            UtilsDAL::TabPg2TabPhp($wynik, array(OsobaDAL::$telefon));
            
            return $wynik;
        }
        
        public function PokazWybraneParamOferta($tabParametr, &$ilosc_wierszy)
        {
            $zapytanie = 'select * from PokazWybraneParamOferta('.$tabParametr[NieruchomoscDAL::$id_oferta].', '.$tabParametr[WyposazenieZapDAL::$poziom_parametry].');';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            
            return $wynik;
        }
        
        public function FiltrowanieOfert($tabParametr, &$ilosc_wierszy)
        {
            //tu dodac sort
            $sort_kol = '';
            if (isset($tabParametr[NieruchomoscDAL::$sortuj]))
            {
                $sort_kol = $tabParametr[NieruchomoscDAL::$sortuj];
            }
            $sort_kier = 0;
            if (isset($tabParametr[NieruchomoscDAL::$sortuj_kierunek]))
            {
                $sort_kier = $tabParametr[NieruchomoscDAL::$sortuj_kierunek];
            }
            $agent_id = 0;
            if (isset($tabParametr[NieruchomoscDAL::$id_agent]))
            {
                $agent_id = $tabParametr[NieruchomoscDAL::$id_agent];
            }
            $zapytanie = 'select * from FiltrujOferty('.$tabParametr[NieruchomoscDAL::$id_nier_rodzaj].', '.$tabParametr[NieruchomoscDAL::$id_rodz_trans].', '.
            $tabParametr[NieruchomoscDAL::$id_status].', '.$agent_id.', \''.$sort_kol.'\', '.$sort_kier.');';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            UtilsDAL::KonwersjaDbBoolText($wynik, array(NieruchomoscDAL::$pokaz, NieruchomoscDAL::$wylacznosc, NieruchomoscDAL::$klucz));
            
            return $wynik;
        }
        
        public function FiltrowanieZapotrzebowan($tabParametr, &$ilosc_wierszy)
        {
            //tu dodac sort
            $sort_kol = '';
            if (isset($tabParametr[NieruchomoscDAL::$sortuj]))
            {
                $sort_kol = $tabParametr[NieruchomoscDAL::$sortuj];
            }
            $sort_kier = 0;
            if (isset($tabParametr[NieruchomoscDAL::$sortuj_kierunek]))
            {
                $sort_kier = $tabParametr[NieruchomoscDAL::$sortuj_kierunek];
            }
            $zapytanie = 'select * from FiltrujZapotrzebowania('.$tabParametr[NieruchomoscDAL::$id_nier_rodzaj].', '.$tabParametr[NieruchomoscDAL::$id_rodz_trans].', '.
            $tabParametr[NieruchomoscDAL::$id_status].', '.$tabParametr[NieruchomoscDAL::$id_agent].', \''.$sort_kol.'\', '.$sort_kier.');';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            UtilsDAL::TabPg2TabPhp($wynik, array(OsobaDAL::$telefon));
            ///konwertuj z booli itd ..??
            
            return $wynik;
        }
        
        public function EdycjaOferta($tabParametr, &$iloscWierszy)
        {
            $zapytanie = "select * from EdycjaOferta (".$tabParametr[NieruchomoscDAL::$id_oferta].");";

            $wynik = $this->dal->PobierzDane($zapytanie, $iloscWierszy);
            UtilsDAL::KorektaKolBool($wynik, array(NieruchomoscDAL::$pokaz, NieruchomoscDAL::$prow_proc, NieruchomoscDAL::$wylacznosc, NieruchomoscDAL::$rynek, NieruchomoscDAL::$klucz, NieruchomoscDAL::$przek_od_otwarcia));
            
            UtilsDAL::TabPg2TabPhp($wynik, array(NieruchomoscDAL::$dane_wyposazenie_nier, NieruchomoscDAL::$dane_parametr_nier), true);
            UtilsDAL::TabPg2TabPhp($wynik, array(NieruchomoscDAL::$dane_parametr_nier_wartosc));
            
            return $wynik;
        }
        public function EdycjaZapotrzebowanie($tabParametr, &$iloscWierszy)
        {
            $zapytanie = "select * from EdycjaZapotrzebowanie (".$tabParametr[NieruchomoscDAL::$id_zapotrzebowanie].");";

            $wynik = $this->dal->PobierzDane($zapytanie, $iloscWierszy);
            //UtilsDAL::KorektaKolBool($wynik, array(NieruchomoscDAL::$prow_proc));
            
            UtilsDAL::TabPg2TabPhp($wynik, array(NieruchomoscDAL::$id_nier_rodzaj), true);
            //UtilsDAL::TabPg2TabPhp($wynik, array(NieruchomoscDAL::$dane_parametr_zap_wartosc));
            
            return $wynik;
        }
        public function ListaProwDlaTrans ($tabParametr, &$IloscWierszy)
        {
            $zapytanie = 'select * from ListaProwDlaTrans('.$tabParametr[NieruchomoscDAL::$id_zapotrzebowanie].');';
            $wynik = $this->dal->PobierzDane($zapytanie,$IloscWierszy);
            UtilsDAL::KorektaKolBool($wynik, array(NieruchomoscDAL::$prow_proc));
            
            return $wynik;
        }
        public function BrakujaceProwizje ($tabParametr, &$IloscWierszy)
        {
            $zapytanie = 'select * from BrakujaceProwizje('.$tabParametr[NieruchomoscDAL::$id_zapotrzebowanie].')';
            $wynik = $this->dal->PobierzDane($zapytanie,$IloscWierszy);
            
            return $wynik;
        }
        public function DodajProwDlaTrans ($tabParametr)
        {
            $id_prow_zap = 'null';
            if(isset($tabParametr[NieruchomoscDAL::$id_prow_zap]))
            {
                $id_prow_zap = $tabParametr[NieruchomoscDAL::$id_prow_zap];
            }
            $prow_proc = 'false';
            if(isset($tabParametr[NieruchomoscDAL::$prow_proc]))
            {
                $prow_proc = 'true';
            }
            $id_zap = 'null';
            if (isset($tabParametr[NieruchomoscDAL::$id_zapotrzebowanie]))
            {
                $id_zap = $tabParametr[NieruchomoscDAL::$id_zapotrzebowanie];   
            }
            $id_rodz_transakcji = 'null';
            if (isset($tabParametr[NieruchomoscDAL::$id_rodz_trans]))
            {
                $id_rodz_transakcji = $tabParametr[NieruchomoscDAL::$id_rodz_trans];   
            }
            $zapytanie = 'select * from DodajProwDlaTrans('.$id_prow_zap.', '.$id_zap.', '.
            $id_rodz_transakcji.', \''.$tabParametr[NieruchomoscDAL::$prowizja].'\', '.$prow_proc.', '.$tabParametr[NieruchomoscDAL::$id_sposob_finansowania].', \''.$tabParametr[NieruchomoscDAL::$poszukiwane_dla].'\');';
            $wynik = $this->dal->OperacjaLogiczna($zapytanie);
            
            return $wynik;
        }
        public function UsunProwDlaTrans ($tabParametr)
        {
            $zapytanie = 'select * from UsunProwDlaTrans('.$tabParametr[NieruchomoscDAL::$id_prow_zap].');';
            $wynik = $this->dal->OperacjaLogiczna($zapytanie);
            
            return $wynik;        
        }
        public function OfertaPublikuj ($id_oferta)
        {
            $zapytanie = 'select OfertaPublikuj('.$id_oferta.');';
            $wynik = $this->dal->OperacjaLogiczna($zapytanie);
            
            return $wynik;        
        }
        public function OfertaSchowaj ($id_oferta)
        {
            $zapytanie = 'select OfertaSchowaj('.$id_oferta.');';
            $wynik = $this->dal->OperacjaLogiczna($zapytanie);
            
            return $wynik;        
        }
        //metoda dodaje nowa ofertê wraz z now¹ nieruchomoœci¹ do systemu
        //alternatywnie prowadzi aktualizacjê oferty
        public function DodajOferta($tabParametr)
        {  
            //utworzenie parametrów z wartoœciami domyœlnymi, jeœli nie zostan¹ zdefiniowane
            $prow_proc = 'false';
            $wylacznosc = 'false';
            $pokaz = 'false';
            $rynek = 'false';
            $klucz = 'false';
            $przek_od_otw = 'false';
            $podpis_cena = 'false';
            
            //jeœli parametr jest zdefiniowany w bie¿¹cym przypadku wprowadzamy wartoœæ logicznej prawdy
            if ($tabParametr[NieruchomoscDAL::$prow_proc])
            {
                $prow_proc = 'true';
            }
            if ($tabParametr[NieruchomoscDAL::$wylacznosc])
            {
                $wylacznosc = 'true';
            }
            if ($tabParametr[NieruchomoscDAL::$pokaz])
            {
                $pokaz = 'true';
            }
            if ($tabParametr[NieruchomoscDAL::$rynek])
            {
                $rynek = 'true';
            }
            if ($tabParametr[NieruchomoscDAL::$klucz])
            {
                $klucz = 'true';
            }
            if ($tabParametr[NieruchomoscDAL::$przek_od_otwarcia])
            {
                $przek_od_otw = 'true';
            }
            if (isset($tabParametr[NieruchomoscDAL::$podpis]))
            {
                if ($tabParametr[NieruchomoscDAL::$podpis])
                $podpis_cena = 'true';
            }
            $nier_szczeg = 'null';
            if (isset($tabParametr[NieruchomoscDAL::$id_rodz_nier_szcz]))
            {
                $nier_szczeg = $tabParametr[NieruchomoscDAL::$id_rodz_nier_szcz];
            }
            $osoba = 'null';
            if (isset($tabParametr[NieruchomoscDAL::$id_osoba]))
            {
                $osoba = $tabParametr[NieruchomoscDAL::$id_osoba];
            }
            //jeœli parametr numeru oferty istnieje, oferta jest aktualizowana
            if (isset($tabParametr[NieruchomoscDAL::$id_oferta]))
            {
                //budowanie zapytania do procedury
                $zapytanie = "select * from DodajOferta(".$tabParametr[NieruchomoscDAL::$id_oferta].", ".$tabParametr[NieruchomoscDAL::$id_rodz_trans]." , ".
                $tabParametr[NieruchomoscDAL::$id_status].", null, ".$tabParametr[NieruchomoscDAL::$data_zam_zlecenie].", '".
                $tabParametr[NieruchomoscDAL::$cena]."', ".$tabParametr[NieruchomoscDAL::$id_priorytet_reklama].", ".$prow_proc.", '".$tabParametr[NieruchomoscDAL::$prowizja]."', ".
                $wylacznosc.", ".$pokaz.", ".$tabParametr[NieruchomoscDAL::$czas_przekazania].", ".$przek_od_otw.", null, ".$nier_szczeg.", null, ".
                $tabParametr[NieruchomoscDAL::$id_region_geog].", '".$tabParametr[NieruchomoscDAL::$ulica]."', '".$tabParametr[NieruchomoscDAL::$ulica_net]."', '".
                $tabParametr[NieruchomoscDAL::$kod]."', ".$tabParametr[NieruchomoscDAL::$agent].", ".$rynek.", ".$klucz.", ".$osoba.", ".$podpis_cena.");";
            }
            else
            {
                //budowanie zapytania do procedury
                $zapytanie = "select * from DodajOferta(null, ".$tabParametr[NieruchomoscDAL::$id_rodz_trans].", ".
                $tabParametr[NieruchomoscDAL::$id_status].", '".$tabParametr[NieruchomoscDAL::$data_otw_zlecenie]."', ".
                $tabParametr[NieruchomoscDAL::$data_zam_zlecenie].", '".$tabParametr[NieruchomoscDAL::$cena]."', ".$tabParametr[NieruchomoscDAL::$id_priorytet_reklama].", ".$prow_proc.", '".
                $tabParametr[NieruchomoscDAL::$prowizja]."', ".$wylacznosc.", ".$pokaz.", ".$tabParametr[NieruchomoscDAL::$czas_przekazania].", ".$przek_od_otw.", 
                ".$tabParametr[NieruchomoscDAL::$id_nier_rodzaj].", ".$nier_szczeg.", ".$tabParametr[NieruchomoscDAL::$id_klient].", ".
                $tabParametr[NieruchomoscDAL::$id_region_geog].", '".$tabParametr[NieruchomoscDAL::$ulica]."', '".$tabParametr[NieruchomoscDAL::$ulica_net]."', '".
                $tabParametr[NieruchomoscDAL::$kod]."', ".$tabParametr[NieruchomoscDAL::$agent].", ".$rynek.", ".$klucz.", ".$osoba.", null);"; //osoba musi byc, potrzebne do odnotowania deklaracji 1 ceny
            }
            //wywo³anie z obiektu klasy dal metody uruchamiaj¹cej wprowadzanie danych z weryfikacj¹ przyczyn niepowodzeñ
            $wynik = $this->dal->WprowadzanieDanych($zapytanie);
            //podanie wyniku
            return $wynik;                                                     
        }
        public function DaneNierOferta ($id_oferta)
        {
            $zapytanie = 'select * from NierDaneOferta('.$id_oferta.');';
            $wynik = $this->dal->PobierzDane($zapytanie, $iloscWierszy);
            
            return $wynik;
        }
        public function DodajZapotrzebowanie($tabParametr)
        {
            /*$prow_proc = 'false';
            
            if ($tabParametr[NieruchomoscDAL::$prow_proc])
            {
                $prow_proc = 'true';
            } */
            if (strlen($tabParametr[NieruchomoscDAL::$data_zam_zlecenie]) == 10)
            {
                $data_zam = '\''.$tabParametr[NieruchomoscDAL::$data_zam_zlecenie].'\'';
            }
            else
            {
                $data_zam = 'null';
            }
            if (isset($tabParametr[NieruchomoscDAL::$id_zapotrzebowanie]))
            {
                //update
                $nier_rodz = 'null';
                if (isset($tabParametr[NieruchomoscDAL::$nieruchomosc_rodzaj]))
                {
                    $nier_rodz = $tabParametr[NieruchomoscDAL::$nieruchomosc_rodzaj];
                }
                $zapytanie = "select * from DodajZapotrzebowanie(".$tabParametr[NieruchomoscDAL::$id_zapotrzebowanie].", ".$nier_rodz.", null, ".$data_zam.", null, null);"; //".$prow_proc.", '".$tabParametr[NieruchomoscDAL::$prowizja]."',
                //echo $zapytanie;
            }
            else
            {
                //insert
                $zapytanie = "select * from DodajZapotrzebowanie(null, ".$tabParametr[NieruchomoscDAL::$nieruchomosc_rodzaj].", '".
                $tabParametr[NieruchomoscDAL::$data_otw_zlecenie]."', ".$data_zam.", ".$tabParametr[NieruchomoscDAL::$id_klient].", ".
                $tabParametr[NieruchomoscDAL::$agent].");";       //".$prow_proc.", '".$tabParametr[NieruchomoscDAL::$prowizja]."', 
            }
            
            $wynik = $this->dal->WprowadzanieDanych($zapytanie);

            return $wynik;
        }
        public function PodajNierZapotrzebowanie ($tabParametr)
        {
            $zapytanie = 'select * from PodajNierZapotrzebowanie('.$tabParametr[NieruchomoscDAL::$id_zapotrzebowanie].');';
            $wynik = $this->dal->PobierzDane($zapytanie, $iloscWierszy);
            
            return $wynik;
        }
        public function PodajTransDlaNierZapotrzebowanie ($tabParametr, &$iloscWierszy)
        {
            $zapytanie = 'select * from PodajTransDlaNierZapotrzebowanie('.$tabParametr[NieruchomoscDAL::$id_zapotrzebowanie_nier_rodzaj].');';
            $wynik = $this->dal->PobierzDane($zapytanie, $iloscWierszy);
            
            return $wynik;
        }
        public function DodajTransNierZapotrzebowanie ($tabParametr)
        {
            if (isset($tabParametr[NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj]))
            {
                $zapytanie = 'select * from DodajTransNierZapotrzebowanie('.$tabParametr[NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj].', null, null, '.
                $tabParametr[NieruchomoscDAL::$id_status].', '.$tabParametr[NieruchomoscDAL::$id_agent].', \''.$tabParametr[NieruchomoscDAL::$cena].'\', '.$tabParametr[NieruchomoscDAL::$pokaz].');';
            }
            else
            {
                $zapytanie = 'select * from DodajTransNierZapotrzebowanie(null, '.$tabParametr[NieruchomoscDAL::$id_zapotrzebowanie_nier_rodzaj].', '.
                $tabParametr[NieruchomoscDAL::$id_rodz_trans].', '.$tabParametr[NieruchomoscDAL::$id_status].', '.$tabParametr[NieruchomoscDAL::$id_agent].', \''.
                $tabParametr[NieruchomoscDAL::$cena].'\', '.$tabParametr[NieruchomoscDAL::$pokaz].');';
            }
            $wynik = $this->dal->OperacjaLogiczna($zapytanie);
            
            return $wynik;
        }
        public function UsunTransNierZapotrzebowanie ($tabParametr)
        {
            $zapytanie = 'select UsunTransNierZapotrzebowanie('.$tabParametr[NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj].');';
            $wynik = $this->dal->OperacjaLogiczna($zapytanie);
            
            return $wynik;
        }
        public function PodajTransNierZapotrzebowanie ($tabParametr, &$iloscWierszy)
        {
            $zapytanie = 'select * from PodajTransNierZapotrzebowanie('.$tabParametr[NieruchomoscDAL::$id_zapotrzebowanie].');';
            $wynik = $this->dal->PobierzDane($zapytanie, $iloscWierszy);
            UtilsDAL::TabPg2TabPhp($wynik, array(OsobaDAL::$telefon));
            
            return $wynik;
        }
        public function EdycjaTransNierZapotrzebowanie ($tabParametr)
        {
            $zapytanie = 'select * from EdycjaTransNierZapotrzebowanie('.$tabParametr[NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj].');';
            $wynik = $this->dal->PobierzDane($zapytanie, $iloscWierszy);
            UtilsDAL::KorektaKolBool($wynik, array(NieruchomoscDAL::$pokaz));
            UtilsDAL::TabPg2TabPhp($wynik, array(OsobaDAL::$telefon));
            
            return $wynik;
        }
        
        public function SzczegolyNieruchomosc ($tabParametr, &$iloscWierszy)
        {
            $zapytanie = "select * from SzczegolyNieruchomosc(".$tabParametr[NieruchomoscDAL::$id_nier_rodzaj].");";
            $wynik = $this->dal->PobierzDane($zapytanie, $iloscWierszy);
            
            return $wynik;
        }
        public function TransakcjaNieruchomosc ($tabParametr)
        {
            $zapytanie = "select * from PodajTransDlaNier(".$tabParametr[NieruchomoscDAL::$id_nier_rodzaj].", '".$tabParametr[NieruchomoscDAL::$of_zap]."');";
            $wynik = $this->dal->PobierzDane($zapytanie, $iloscWierszy);
            
            return $wynik;  
        }
        public function KojarzenieBazoweDlaOferty($tabParametr, &$ilosc_wierszy)
        {
            $zain = 'true';
            $poziom_par = 'null';
            $poziom_wyp = 'null';
            
            if (isset($tabParametr[NieruchomoscDAL::$zainteresowany]))
            {
                $zain = $tabParametr[NieruchomoscDAL::$zainteresowany];
            }
            if (isset($tabParametr[NieruchomoscDAL::$poziom_parametry]))
            {
                $poziom_par = $tabParametr[NieruchomoscDAL::$poziom_parametry];
            }
            if (isset($tabParametr[NieruchomoscDAL::$poziom_wyposazenia]))
            {
                $poziom_wyp = $tabParametr[NieruchomoscDAL::$poziom_wyposazenia];
            }
            
            $zapytanie = 'select * from KojarzenieBazoweDlaOferty('.$tabParametr[NieruchomoscDAL::$id_oferta].', '.$poziom_par.', '.$poziom_wyp.', '.$zain.') order by data_otw_zlecenie desc;';
            //echo $zapytanie;
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            UtilsDAL::TabPg2TabPhp($wynik, array(OsobaDAL::$telefon));
            
            return $wynik;
        }
        
        public function KojarzenieOfertaMedia($tabParametr, &$ilosc_wierszy)
        {
            $zapytanie = 'select * from KojarzenieOfertaMedia('.$tabParametr[NieruchomoscDAL::$id_oferta].');';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            
            return $wynik;
        }
        public function DodajOpisNieruchomosc($tabParametr)
        {
            $zapytanie = 'select * from DodajOpisNieruchomosc('.$tabParametr[NieruchomoscDAL::$id_nieruchomosc].', '.$tabParametr[NieruchomoscDAL::$id_agent].', \''.
            $tabParametr[NieruchomoscDAL::$notatka].'\');'; 
            $wynik = $this->dal->OperacjaLogiczna($zapytanie);
            
            return $wynik;   
        }
        public function PodajNotatkaNieruchomosc($tabParametr, &$ilosc_wierszy)
        {
            $zapytanie = 'select * from PodajNotatkaNieruchomosc('.$tabParametr[NieruchomoscDAL::$id_nieruchomosc].');'; 
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            
            return $wynik;   
        }
        public function UsunNotatkaNieruchomosc($tabParametr)
        {
            $zapytanie = 'select * from UsunNotatkaNieruchomosc('.$tabParametr[NieruchomoscDAL::$id_notatka].');'; 
            $wynik = $this->dal->OperacjaLogiczna($zapytanie);
            
            return $wynik;        
        }
        public function PodajDostOpisOferta($tabParametr, &$ilosc_wierszy)
        {
            $zapytanie = 'select * from PodajDostOpisOferta('.$tabParametr[NieruchomoscDAL::$id_oferta].');'; 
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            
            return $wynik;    
        }
        public function DodajOpisOferta($tabParametr)
        {
            $opis = 'null';
            if (isset($tabParametr[NieruchomoscDAL::$id_opis]))
            {
                $opis = $tabParametr[NieruchomoscDAL::$id_opis];
            }
            $jezyk = 'null';
            if (isset($tabParametr[NieruchomoscDAL::$id_jezyk]))
            {
                $jezyk = $tabParametr[NieruchomoscDAL::$id_jezyk];
            }
            $zapytanie = 'select * from DodajOpisOferta('.$opis.', '.$tabParametr[NieruchomoscDAL::$id_oferta].', '.$jezyk.', \''.
            $tabParametr[NieruchomoscDAL::$tresc].'\');'; 
            $wynik = $this->dal->OperacjaLogiczna($zapytanie);
            
            return $wynik;        
        }
        public function PodajOpisOferta($tabParametr, &$ilosc_wierszy)
        {
            $zapytanie = 'select * from PodajOpisOferta('.$tabParametr[NieruchomoscDAL::$id_oferta].');'; 
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            
            return $wynik;    
        }
        public  function UsunOpisOferta($tabParametr)
        {
            $zapytanie = 'select * from UsunOpisOferta('.$tabParametr[NieruchomoscDAL::$id_opis].');'; 
            $wynik = $this->dal->OperacjaLogiczna($zapytanie);
            
            return $wynik;     
        }
        
        public function DodajOpisZapotrzebowanie($tabParametr)
        {
            $oferta_id = 'null';
            $zainteresowany = 'false';
            $cena = 'null';
            
            if (isset($tabParametr[NieruchomoscDAL::$id_oferta]))
            {
                $oferta_id = $tabParametr[NieruchomoscDAL::$id_oferta];
            }
            if (isset($tabParametr[NieruchomoscDAL::$niezainteresowany]))
            {
                $zainteresowany = $tabParametr[NieruchomoscDAL::$niezainteresowany];
            }
            if (isset($tabParametr[NieruchomoscDAL::$cena]))
            {
                $cena = '\''.$tabParametr[NieruchomoscDAL::$cena].'\'';
            }
            
            $zapytanie = 'select * from DodajOpisZapotrzebowanie('.$tabParametr[WyposazenieZapDAL::$id_zapotrzebowanie].', '.$tabParametr[NieruchomoscDAL::$id_agent].', \''.$tabParametr[WyposazenieZapDAL::$tresc].'\', '.
            $oferta_id.', '.$zainteresowany.', '.$cena.');';
            //echo $zapytanie;
            $wynik = $this->dal->OperacjaLogiczna($zapytanie);
            
            return $wynik;
        } 
        public function PodajOpisZapotrzebowanie($tabParametr, &$ilosc_wierszy)
        {
            $zapytanie = 'select * from PodajOpisZapotrzebowanie('.$tabParametr[WyposazenieZapDAL::$id_zapotrzebowanie].');';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            UtilsDAL::KonwersjaDbBoolText($wynik, array(NieruchomoscDAL::$zainteresowany));
            
            return $wynik;
        }
        public function UsunNotatkaZapotrzebowanie($tabParametr)
        {
            $zapytanie = 'select * from UsunNotatkaZapotrzebowanie('.$tabParametr[WyposazenieZapDAL::$id_opis].');';
            $wynik = $this->dal->OperacjaLogiczna($zapytanie);
            
            return $wynik;    
        }
        public function DodajInfoOfSprz($tabParametr)
        {
            $zapytanie = 'select * from DodajInfoOfSprz('.$tabParametr[NieruchomoscDAL::$id_oferta].', \''.$tabParametr[NieruchomoscDAL::$cena].'\', '.$tabParametr[NieruchomoscDAL::$is_sprzedana].', '.$tabParametr[NieruchomoscDAL::$is_azg].');';
            $wynik = $this->dal->OperacjaLogiczna($zapytanie);
            
            return $wynik;    
        }
        public function OfertaPowielenie($tabParametr)
        {
            $zapytanie = 'select OfertaPowielenie as id from OfertaPowielenie('.$tabParametr[NieruchomoscDAL::$id_oferta].', '.$tabParametr[NieruchomoscDAL::$id_klient].', '.$tabParametr[NieruchomoscDAL::$id_agent].', '.
            $tabParametr[NieruchomoscDAL::$id_osoba].');';
            $wynik = $this->dal->WprowadzanieDanych($zapytanie, false);

            return $wynik;
        }
    }
    //pytanie czy jest sens robic cala klase i sie powtarzac z operacjami - nie wiedzie zadnego :P
    /*class ZapotrzebowanieDAL
    {
        public static $id_zapotrzebowanie = 'id_zapotrzebowanie';
        public static $id_klient = 'id_klient';
        public static $id_osoba = 'id_osoba';
        public static $id_nier_rodzaj = 'id_nier_rodzaj';
        public static $id_rodz_trans = 'id_rodz_trans';
        public static $cena = 'cena';
        public static $nazwisko = 'nazwisko';
        public static $imie = 'imie';
    }*/
    class ListaWskazanDAL
    {
        public static $id_osoba = 'id_osoba';
        public static $id_zapotrzebowanie = 'id_zapotrzebowanie';
        public static $id_oferta = 'id_oferta';
        public static $id_jezyk = 'id_jezyk';
        public static $id_agent = 'id_agent';
        public static $id_umowienie = 'id_umowienie';
        public static $id_spotkanie = 'id_spotkanie';
        public static $id = 'id';
        public static $nazwisko = 'nazwisko';
        public static $nazwa = 'nazwa';
        public static $imie = 'imie';
        public static $pesel = 'pesel';
        public static $opis = 'opis';
        public static $wlasciciel = 'wlasciciel';
        public static $oferent = 'oferent';
        public static $cena = 'cena';
        public static $ulica = 'ulica';
        public static $ogladanie_data = 'ogladanie_data';
        public static $data = 'data';
        public static $godzina = 'godzina';
        public static $id_godzina = 'id_godzina';
        public static $minuta = 'minuta';
        public static $id_minuta = 'id_minuta';
        public static $id_klient = 'id_klient';
        public static $osoba = 'osoba';
        public static $nr_dowod = 'nr_dowod';
        public static $telefon = 'telefon';
        public static $komentarz = 'komentarz';
        
        protected $dal;
        
        public function ListaWskazanDAL()
        {
            $this->dal = new dal();
        }
        public function PodajOsobaZapotrzebowanie($tabParametr)
        {
            $zapytanie = 'select * from PodajOsobaZapotrzebowanie('.$tabParametr[ListaWskazanDAL::$id_zapotrzebowanie].');';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            
            return $wynik;
        }
        public function PodajOsobaKlientZap($tabParametr)
        {
            $zapytanie = 'select * from PodajOsobaKlientPoZap('.$tabParametr[ListaWskazanDAL::$id_zapotrzebowanie].');';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            UtilsDAL::TabPg2TabPhp($wynik, array(OsobaDAL::$telefon));
            
            return $wynik;
        }
        public function PodajOfertaDoListaWsk($tabParametr)
        {
            $zapytanie = 'select * from PodajOfertaDoListaWsk('.$tabParametr[ListaWskazanDAL::$id_oferta].', '.$tabParametr[ListaWskazanDAL::$id_jezyk].');';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            UtilsDAL::TabPg2TabPhp($wynik, array(ListaWskazanDAL::$oferent, ListaWskazanDAL::$wlasciciel)); 
            
            return $wynik;
        }
        public function PodajOsobaDane($tabParametr)
        {
            $zapytanie = 'select * from PodajOsobaDane('.$tabParametr[ListaWskazanDAL::$id_osoba].');';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            
            return $wynik;
        }
        public function PodajListaWskZapotrzebowanie($tabParametr, &$ilosc_wierszy)
        {
            $zapytanie = 'select * from PodajListaWskZapotrzebowanie('.$tabParametr[ListaWskazanDAL::$id_zapotrzebowanie].');';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            
            return $wynik;        
        }
        public function ZapotrzebowaniaTabListWskazan($tabParametr, &$ilosc_wierszy)
        {
            $parametr = UtilsDAL::TabPhp2TabPg($tabParametr[ListaWskazanDAL::$id_zapotrzebowanie], false, $parametr);
            $zapytanie = 'select * from ZapotrzebowaniaTabListWskazan('.$parametr.');';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            UtilsDAL::TabPg2TabPhp($wynik, array(OsobaDAL::$telefon));
            
            return $wynik;
        }
        public function PodajListaWskOferta($tabParametr, &$ilosc_wierszy)
        {
            $zapytanie = 'select * from PodajListaWskOferta('.$tabParametr[ListaWskazanDAL::$id_oferta].');';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            UtilsDAL::TabPg2TabPhp($wynik, array(ListaWskazanDAL::$osoba, ListaWskazanDAL::$pesel, ListaWskazanDAL::$telefon));
            
            return $wynik;
        }
        public function DodajOgladanie($tabParametr)
        {
            $tab_os = UtilsDAL::TabPhp2TabPg($tabParametr[ListaWskazanDAL::$id_osoba], false, $tab_os);
            $zapytanie = 'select DodajOgladanie('.$tabParametr[ListaWskazanDAL::$id_oferta].', '.$tabParametr[ListaWskazanDAL::$id_zapotrzebowanie].', '.$tabParametr[ListaWskazanDAL::$id_agent].', \''.
            $tabParametr[ListaWskazanDAL::$data].'\', '.$tabParametr[ListaWskazanDAL::$id_godzina].', '.$tabParametr[ListaWskazanDAL::$id_minuta].', '.$tab_os.');';
            $wynik = $this->dal->OperacjaLogiczna($zapytanie);
            
            return $wynik;
        }
        public function DodajSpotkanie($tabParametr)
        {
            $tab_os_og = UtilsDAL::TabPhp2TabPg($tabParametr[ListaWskazanDAL::$id_osoba], false, $tab_os_og);
            $tab_os_pok = UtilsDAL::TabPhp2TabPg($tabParametr[ListaWskazanDAL::$osoba], false, $tab_os_pok);
                                                  //pierwszy parametr na razie null, jak bedzi eupdate sie pomysli :P
            $zapytanie = 'select * from DodajSpotkanie(null, null, '.$tabParametr[ListaWskazanDAL::$id_oferta].', '.$tabParametr[ListaWskazanDAL::$id_zapotrzebowanie].', '.
            $tabParametr[ListaWskazanDAL::$id_umowienie].', '.$tabParametr[ListaWskazanDAL::$id_agent].', \''.$tabParametr[ListaWskazanDAL::$ogladanie_data].'\', '.$tabParametr[ListaWskazanDAL::$id_godzina].', '.
            $tabParametr[ListaWskazanDAL::$id_minuta].', \''.$tabParametr[ListaWskazanDAL::$komentarz].'\', '.$tab_os_og.', '.$tab_os_pok.');';
            //echo $zapytanie;
            $wynik = $this->dal->WprowadzanieDanych($zapytanie, false);
            
            return $wynik;
        }
        public function DodajSpotkaniePomKal($tabParametr)
        {
            $tab_os = UtilsDAL::TabPhp2TabPg($tabParametr[ListaWskazanDAL::$id_osoba], false, $tab_os);
                                                  //pierwszy parametr na razie null, jak bedzi eupdate sie pomysli :P
            $zapytanie = 'select * from DodajSpotkaniePomKal(null, '.$tabParametr[ListaWskazanDAL::$id_oferta].', '.$tabParametr[ListaWskazanDAL::$id_zapotrzebowanie].', '.
            $tabParametr[ListaWskazanDAL::$oferent].', '.$tabParametr[ListaWskazanDAL::$id_umowienie].', '.$tabParametr[ListaWskazanDAL::$id_agent].', \''.
            $tabParametr[ListaWskazanDAL::$ogladanie_data].'\', '.$tabParametr[ListaWskazanDAL::$id_godzina].', '.$tabParametr[ListaWskazanDAL::$id_minuta].', \''.
            $tabParametr[ListaWskazanDAL::$komentarz].'\', '.$tab_os.');';
            
            $wynik = $this->dal->WprowadzanieDanych($zapytanie, false);
            
            return $wynik;
        }
        public function PodajSpotkanieEdycja($tabParametr)
        {
            $zapytanie = 'select * from PodajSpotkanieEdycja('.$tabParametr[ListaWskazanDAL::$id_spotkanie].');';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            
            return $wynik;
        }
        ///metoda usun
        public function UsunSpotkanie($tabParametr)
        {
            $zapytanie = 'select UsunSpotkanie('.$tabParametr[ListaWskazanDAL::$id_spotkanie].');';
            $wynik = $this->dal->OperacjaLogiczna($zapytanie);
            
            return $wynik;
        }
        public function SprawdzIstOferta ($id_oferta)
        {
            $zapytanie = 'select SprawdzIstOferta('.$id_oferta.');';
            $wynik = $this->dal->OperacjaLogiczna($zapytanie);
            
            return $wynik;
        }
        public function SprawdzOfZapListaWsk ($tabParametr)
        {
            $zapytanie = 'select * from SprawdzOfZapListaWsk('.$tabParametr[NieruchomoscDAL::$id_oferta].', '.$tabParametr[NieruchomoscDAL::$id_zapotrzebowanie].');';
            $wynik = $this->dal->WprowadzanieDanych($zapytanie, false);
            
            return $wynik;
        }
        public function OfertyOgladniete ($tabParametr, &$ilosc_wierszy)
        {
            $zapytanie = 'select * from OfertyOgladniete('.$tabParametr[ListaWskazanDAL::$id_zapotrzebowanie].', '.$tabParametr[NieruchomoscDAL::$id_jezyk].');';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            UtilsDAL::TabPg2TabPhp($wynik, array(ListaWskazanDAL::$wlasciciel));
            
            return $wynik;
        }
        public function OfertaOgladnieta ($tabParametr)
        {
            $zapytanie = 'select * from OfertaOgladnieta('.$tabParametr[ListaWskazanDAL::$id_oferta].', '.$tabParametr[NieruchomoscDAL::$id_jezyk].');';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            UtilsDAL::TabPg2TabPhp($wynik, array(ListaWskazanDAL::$wlasciciel));
            
            return $wynik;
        }
    }
    
    class OsobaDAL
    {
        public static $id = 'id';
        public static $id_osoba = 'id_osoba';
        public static $id_agent = 'id_agent';
        public static $id_bank = 'id_bank';
        public static $id_osoba_bank_porada = 'id_osoba_bank_porada';
        public static $bank = 'bank';
        public static $id_klient = 'id_klient';
        public static $id_oferta = 'id_oferta';
        public static $id_zapotrzebowanie = 'id_zapotrzebowanie';
        public static $nazwa = 'nazwa';
        public static $opis = 'opis';
        public static $rodzaj_dowod = 'rodzaj_dowod';
        public static $id_osoba_dowod = 'id_osoba_dowod';
        public static $id_rodzaj_dowod = 'id_rodzaj_dowod_tozsamosc';
        public static $nr_dowod = 'nr_dowod';
        public static $id_nieruchomosc = 'id_nieruchomosc';
        public static $id_wlasciciel = 'id_wlasciciel';
        public static $udzial_proc = 'procent_udzial';
        public static $nazwisko = 'nazwisko';
        public static $imie = 'imie';
        public static $data = 'data';
        public static $godzina = 'godzina';
        public static $pesel = 'pesel';
        public static $id_region_geog = 'id_region_geog';
        public static $region = 'region';
        public static $telefon = 'telefon';
        public static $komorka = 'komorka';
        public static $email = 'email';
        public static $telefon_opis = 'telefon_opis';
        public static $komorka_opis = 'komorka_opis';
        public static $email_opis = 'email_opis';
        public static $ulica = 'ulica';
        public static $kod = 'kod';
        public static $id_imie = 'id_imie';
        public static $nazwisko_rodowe = 'nazwisko_rodowe';
        public static $nr_dom = 'numer_dom';
        public static $nr_mieszkanie = 'numer_miesz';
        public static $id_rodzaj_dowod_tozsamosc = 'id_rodzaj_dowod_tozsamosc';
        public static $oferent = 'oferent'; 
        public static $umowienie = 'umowienie'; 
        
        protected $osoba_id;
        protected $dal;
        
        public function OsobaDAL($id_osoba)
        {
            $this->dal = new dal();
            $this->osoba_id = $id_osoba;
        }
        ///metoda dodaje nowa osobe lub aktualizuje istniejaca
        ///(osoba_id integer, imie_id integer, nazw text, nazw_rod text, pesel_t text, dowod_nr text, region_geog_id integer, agent_id integer, dane_adres text[], klient_id integer)
        protected function DodajImie ($imie)
        {
            $zapytanie = 'select DodajImie as id from DodajImie(\''.$imie.'\');';
            $wynik = $this->dal->WprowadzanieDanych($zapytanie);

            return $wynik;
        }
        
        public function DodajOsoba($tabParametr)
        {
            if (isset($tabParametr[OsobaDAL::$imie]))
            {
                $wynik = $this->DodajImie($tabParametr[OsobaDAL::$imie]);
                if ($wynik[OsobaDAL::$id] != null)
                {
                    $tabParametr[OsobaDAL::$id_imie] = $wynik[OsobaDAL::$id];
                }
            }
            
            $reg_geog = 'null';
            if (isset($tabParametr[OsobaDAL::$id_region_geog]))
            {
                $reg_geog = $tabParametr[OsobaDAL::$id_region_geog];
            }
            $klient = 'null';
            if (isset($tabParametr[OsobaDAL::$id_klient]))
            {
                $klient = $tabParametr[OsobaDAL::$id_klient];
            }
            $telefon = 'null';
            if (isset($tabParametr[OsobaDAL::$telefon]))
            {
                $telefon = UtilsDAL::TabPhp2TabPg($tabParametr[OsobaDAL::$telefon], true, $telefon);//"ARRAY['".$tabParametr[OsobaDAL::$telefon]."', '".$tabParametr[OsobaDAL::$telefon_opis]."']";
            }
            $komorka = 'null';
            if (isset($tabParametr[OsobaDAL::$komorka]))
            {
                $komorka = "ARRAY['".$tabParametr[OsobaDAL::$komorka]."', '".$tabParametr[OsobaDAL::$komorka_opis]."']";
            }
            $email = 'null';
            if (isset($tabParametr[OsobaDAL::$email]))
            {
                $email = "ARRAY['".$tabParametr[OsobaDAL::$email]."', '".$tabParametr[OsobaDAL::$email_opis]."']";
            }
            $dane_adres = "ARRAY['".$tabParametr[OsobaDAL::$kod]."', '".$tabParametr[OsobaDAL::$ulica]."', '".
            $tabParametr[OsobaDAL::$nr_dom]."', '".$tabParametr[OsobaDAL::$nr_mieszkanie]."']";
            if (isset($tabParametr[OsobaDAL::$id_osoba]))
            {
                //update
                $zapytanie = "select * from DodajOsoba (".$tabParametr[OsobaDAL::$id_osoba].", ".$tabParametr[OsobaDAL::$id_imie].", '".
                $tabParametr[OsobaDAL::$nazwisko]."', '".$tabParametr[OsobaDAL::$nazwisko_rodowe]."', '".
                $tabParametr[OsobaDAL::$pesel]."', null, null, ".
                $reg_geog.", ".$tabParametr[OsobaDAL::$id_agent].", ".$dane_adres.", null, null, null, null);";
            }
            else
            {
                $zapytanie = "select * from DodajOsoba (null, ".$tabParametr[OsobaDAL::$id_imie].", '".$tabParametr[OsobaDAL::$nazwisko]."', '".
                $tabParametr[OsobaDAL::$nazwisko_rodowe]."', '".$tabParametr[OsobaDAL::$pesel]."', ".$tabParametr[OsobaDAL::$id_rodzaj_dowod_tozsamosc].", '".
                $tabParametr[OsobaDAL::$nr_dowod]."', ".$reg_geog.", ".$tabParametr[OsobaDAL::$id_agent].", ".$dane_adres.", ".$klient.", ".$telefon.", ".$komorka.", ".$email.");";
            }
            //echo $zapytanie;
            $wynik = $this->dal->WprowadzanieDanych($zapytanie, false);
            
            return $wynik;
        }
        
        public function PodajOsobaKlient($klient_id, &$iloscWierszy)
        {
            $zapytanie = 'select * from podajosobaklient('.$klient_id.');';
            $wynik = $this->dal->PobierzDane($zapytanie, $iloscWierszy);
            UtilsDAL::TabPg2TabPhp($wynik, array(OsobaDAL::$telefon));
            
            return $wynik;
        }
        
        public function PodajKlientOsoba(&$iloscWierszy)
        {
            $zapytanie = 'select * from PodajKlientOsoba('.$this->osoba_id.');';
            $wynik = $this->dal->PobierzDane($zapytanie, $iloscWierszy);
            //echo $zapytanie;
            
            return $wynik;
        }
        
        public function PodajOsobaZapotrzebowanie($tabParametr, &$ilosc_wierszy)     //moze to info mozna bedzie zawezyc do samego id
        {
            $zapytanie = 'select * from PodajOsobaZapotrzebowanie('.$tabParametr[OsobaDAL::$id_zapotrzebowanie].');';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            //TabIdNazwa2TabIndexId :)
            
            return $wynik;
        }
        
        public function PodajOsobaOferta($tabParametr, &$ilosc_wierszy)
        {
            $zapytanie = 'select * from PodajOsobaOferta('.$tabParametr[OsobaDAL::$id_oferta].');';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            UtilsDAL::TabPg2TabPhp($wynik, array(OsobaDAL::$telefon));
            
            return $wynik;
        }
                            //osoba pokazujaca ze spotkan
        public function PodajOsPokOfSpotkanie($tabParametr, &$ilosc_wierszy)
        {
            $zapytanie = 'select PodajOsPokOfSpotkanie as id_osoba from PodajOsPokOfSpotkanie('.$tabParametr[NieruchomoscDAL::$id_spotkanie].');';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            
            return $wynik;
        }
        
        public function PodajOsobaKlientOfId($tabParametr, &$ilosc_wierszy)
        {
            $zapytanie = 'select * from PodajOsobaKlientOfId('.$tabParametr[OsobaDAL::$id_oferta].');';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            UtilsDAL::TabPg2TabPhp($wynik, array(OsobaDAL::$telefon));
            
            return $wynik;
        }
        
        public function PodajOsobaKlientZapId($tabParametr, &$ilosc_wierszy)
        {
            $zapytanie = 'select * from PodajOsobaKlientZapId('.$tabParametr[OsobaDAL::$id_zapotrzebowanie].');';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            UtilsDAL::TabPg2TabPhp($wynik, array(OsobaDAL::$telefon));
            
            return $wynik;
        }
        
        public function PodajNotatkaNieruchomoscOfId($tabParametr, &$ilosc_wierszy)
        {
            $zapytanie = 'select * from PodajNotatkaNieruchomoscOfId('.$tabParametr[NieruchomoscDAL::$id_oferta].');'; 
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            
            return $wynik;   
        }
        
        public function SzukajOsoba($tabParametr, &$iloscWierszy)
        {
            $zapytanie = "select * from SzukajOsoba('".$tabParametr[OsobaDAL::$nazwisko]."');";
            $wynik = $this->dal->PobierzDane($zapytanie, $iloscWierszy);
            UtilsDAL::TabPg2TabPhp($wynik, array(OsobaDAL::$telefon));
            
            return $wynik;
        }
        //metoda obsuzy zarowno dodanie jak i usuniecie zeby nie robic 100 metod
        public function DodajOsobaKlient ($tabParametr, $czy_dodaj)
        {
            if ($czy_dodaj)
            {
                $zapytanie = 'select DodajOsobaKlient('.$tabParametr[OsobaDAL::$id_klient].', '.$this->osoba_id.');';
            }
            else
            {
                $zapytanie = 'select UsunOsobaKlient('.$tabParametr[OsobaDAL::$id_klient].', '.$this->osoba_id.');';
            }
            $wynik = $this->dal->OperacjaLogiczna($zapytanie);
            
            return $wynik;
        }
        public function DodajOsobaOferta ($tabParametr, $czy_dodaj)
        {
            if ($czy_dodaj)
            {
                $zapytanie = 'select DodajOsobaOferta('.$this->osoba_id.', '.$tabParametr[OsobaDAL::$id_oferta].');';
            }
            else
            {
                $zapytanie = 'select UsunOsobaOferta('.$this->osoba_id.', '.$tabParametr[OsobaDAL::$id_oferta].');';
            }
            $wynik = $this->dal->OperacjaLogiczna($zapytanie);
            
            return $wynik;
        }
        public function DodajOsobaZapotrzebowanie ($tabParametr, $czy_dodaj)
        {
            if ($czy_dodaj)
            {
                $zapytanie = 'select DodajOsobaZapotrzebowanie('.$tabParametr[OsobaDAL::$id_zapotrzebowanie].', '.$this->osoba_id.');';
            }
            else
            {
                $zapytanie = 'select UsunOsobaZapotrzebowanie('.$tabParametr[OsobaDAL::$id_zapotrzebowanie].', '.$this->osoba_id.');';
            }
            $wynik = $this->dal->OperacjaLogiczna($zapytanie);
            
            return $wynik;
        }
        //edycja osoba, szukaj osoba
        public function EdycjaOsoba()
        {
            $zapytanie = "select * from EdycjaOsoba(".$this->osoba_id.");";
            $wynik = $this->dal->PobierzDane($zapytanie, $iloscWierszy);
            
            return $wynik;
        }
        //dodanie lub aktualizacja telefonu
        public function DodajTelefon($tabParametr)
        {
            $id = 'null';
            if (isset($tabParametr[OsobaDAL::$id]))
            {
                $id = $tabParametr[OsobaDAL::$id];
            }
            $zapytanie = 'select DodajTelefon('.$id.', '.$this->osoba_id.', \''.
            $tabParametr[OsobaDAL::$nazwa].'\', \''.$tabParametr[OsobaDAL::$opis].'\', true);';
            
            $wynik = $this->dal->OperacjaLogiczna($zapytanie);
            
            return $wynik;
        }
        public function UsunTelefon($tabParametr)
        {
            $zapytanie = 'select UsunTelefon('.$tabParametr[OsobaDAL::$id].');';
            $wynik = $this->dal->OperacjaLogiczna($zapytanie);
            
            return $wynik;
        }
        //PodajWszystkieTelefony
        public function PodajTelefony(&$ilosc_wierszy)
        {
            $zapytanie = 'select * from PodajTelefony('.$this->osoba_id.');';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            
            return $wynik;
        }
        public function PodajWszystkieTelefony(&$ilosc_wierszy)
        {
            $zapytanie = 'select * from PodajWszystkieTelefony('.$this->osoba_id.');';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            
            return $wynik;
        }
        public function DodajKomorka($tabParametr)
        {
            $zapytanie = 'select DodajKomorka('.$this->osoba_id.', \''.
            $tabParametr[OsobaDAL::$nazwa].'\', \''.$tabParametr[OsobaDAL::$opis].'\');';
            
            $wynik = $this->dal->OperacjaLogiczna($zapytanie);
            
            return $wynik;
        }
        public function UsunKomorka()
        {
            $zapytanie = 'select UsunKomorka('.$this->osoba_id.');';
            $wynik = $this->dal->OperacjaLogiczna($zapytanie);
            
            return $wynik;
        }
        public function PodajKomorka(&$ilosc_wierszy)
        {
            $zapytanie = 'select * from PodajKomorka('.$this->osoba_id.');';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            
            return $wynik;
        }
        public function DodajEmail($tabParametr)
        {
            $id = 'null';
            if (isset($tabParametr[OsobaDAL::$id]))
            {
                $id = $tabParametr[OsobaDAL::$id];
            }
            $zapytanie = 'select DodajEmail('.$id.', '.$this->osoba_id.', \''.
            $tabParametr[OsobaDAL::$nazwa].'\', \''.$tabParametr[OsobaDAL::$opis].'\');';
            
            $wynik = $this->dal->OperacjaLogiczna($zapytanie);
            
            return $wynik;
        }
        public function UsunEmail($tabParametr)
        {
            $zapytanie = 'select UsunEmail('.$tabParametr[OsobaDAL::$id].');';
            $wynik = $this->dal->OperacjaLogiczna($zapytanie);
            
            return $wynik;
        }
        public function PodajEmaile(&$ilosc_wierszy)
        {
            $zapytanie = 'select * from PodajEmaile('.$this->osoba_id.');';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            
            return $wynik;
        }
        public function PodajDokOsoba(&$ilosc_wierszy)
        {
            $zapytanie = 'select * from PodajDokOsoba('.$this->osoba_id.');';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            
            return $wynik;
        }
        public function PodajDostDokOsoba (&$ilosc_wierszy)
        {
            $zapytanie = 'select * from PodajDostDokOsoba('.$this->osoba_id.');';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            
            return $wynik;
        }
        public function DodajDokOsoba($tabParametr)
        {
            ///dokonczyc
            $zapytanie = 'select DodajDokOsoba('.$tabParametr[OsobaDAL::$id_osoba].', '.$tabParametr[OsobaDAL::$id_rodzaj_dowod].', \''.$tabParametr[OsobaDAL::$nr_dowod].'\');';
            $wynik = $this->dal->OperacjaLogiczna($zapytanie);
            
            return $wynik;
        }
        public function UsunDokOsoba($tabParametr)
        {
            $zapytanie = 'select * from UsunDokOsoba('.$tabParametr[OsobaDAL::$id_osoba].', '.$tabParametr[OsobaDAL::$id_rodzaj_dowod].');';
            $wynik = $this->dal->OperacjaLogiczna($zapytanie);
            
            return $wynik;                                      
        }
        public function PodajWlascicieleNier($tabParametr, &$IloscWierszy)
        {
            $zapytanie = 'select * from PodajWlascicieleNier('.$tabParametr[OsobaDAL::$id_nieruchomosc].');';
            $wynik = $this->dal->PobierzDane($zapytanie, $IloscWierszy);
            
            return $wynik;
        }
        public function PodajDostOsWlas($tabParametr, &$IloscWierszy)
        {
            $zapytanie = 'select * from PodajDostOsWlas('.$tabParametr[OsobaDAL::$id_nieruchomosc].');';
            $wynik = $this->dal->PobierzDane($zapytanie, $IloscWierszy);
            
            return $wynik;   
        }
        public function DodajWlasciciel($tabParametr)
        {
            $zapytanie = 'select * from DodajWlasciciel('.$tabParametr[OsobaDAL::$id_wlasciciel].', '.$tabParametr[OsobaDAL::$id_nieruchomosc].', '
            .$tabParametr[OsobaDAL::$id_osoba].','.$tabParametr[OsobaDAL::$udzial_proc].' );';
            $wynik = $this->dal->OperacjaLogiczna($zapytanie);
            
            return $wynik;    
        }
        public function UsunWlasciciel($tabParametr)
        {
            $zapytanie = 'select * from UsunWlasciciel('.$tabParametr[OsobaDAL::$id_wlasciciel].');';
            $wynik = $this->dal->OperacjaLogiczna($zapytanie);
            
            return $wynik;    
        }
         public function PodajSpotkanieOsoba($tabParametr, &$IloscWierszy)
        {
            $zapytanie = 'select * from PodajSpotkanieOsoba('.$this->osoba_id.', '.$tabParametr[OsobaDAL::$oferent].');';
            $wynik = $this->dal->PobierzDane($zapytanie, $IloscWierszy);
            UtilsDAL::TabPg2TabPhp($wynik, array(OsobaDAL::$telefon));
            
            return $wynik;
        }
        public function PodajSpotkanieOferta($tabParametr, &$IloscWierszy)
        {
            $zapytanie = 'select * from PodajSpotkanieOferta('.$tabParametr[OsobaDAL::$id_oferta].', '.$tabParametr[OsobaDAL::$oferent].');';
            $wynik = $this->dal->PobierzDane($zapytanie, $IloscWierszy);
            UtilsDAL::TabPg2TabPhp($wynik, array(OsobaDAL::$telefon));
            
            return $wynik;
        }
        public function PodajSpotkanieZapotrzebowanie($tabParametr, &$IloscWierszy)
        {
            $zapytanie = 'select * from PodajSpotkanieZapotrzebowanie('.$tabParametr[OsobaDAL::$id_zapotrzebowanie].');';
            $wynik = $this->dal->PobierzDane($zapytanie, $IloscWierszy);
            UtilsDAL::TabPg2TabPhp($wynik, array(OsobaDAL::$telefon));
            
            return $wynik;
        }
        public function PodajOferenciSpotkanieZapotrzebowanie($tabParametr, &$IloscWierszy)
        {
            $zapytanie = 'select * from PodajOferenciSpotkanieZapotrzebowanie('.$tabParametr[OsobaDAL::$id_zapotrzebowanie].');';
            $wynik = $this->dal->PobierzDane($zapytanie, $IloscWierszy);
            UtilsDAL::TabPg2TabPhp($wynik, array(OsobaDAL::$telefon));
            
            return $wynik;
        }
        public function PodajDostepneSpotkania($tabParametr, &$IloscWierszy)
        {
            $zapytanie = 'select * from PodajDostepneSpotkania('.$tabParametr[OsobaDAL::$id_oferta].');';
            $wynik = $this->dal->PobierzDane($zapytanie, $IloscWierszy);
            UtilsDAL::TabPg2TabPhp($wynik, array(OsobaDAL::$telefon));
            
            return $wynik;
        }
        public function PodajDaneZapotrzebowanie ($tabParametr, &$ilosc_wierszy)
        {
            $zapytanie = 'select * from PodajDaneZapotrzebowanie('.$tabParametr[NieruchomoscDAL::$id_zapotrzebowanie].', '.$tabParametr[NieruchomoscDAL::$id_oferta].');';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            
            return $wynik;
        }
        public function ZmianaCena ($tabParametr, &$ilosc_wierszy)
        {
            $zapytanie = 'select * from ZmianaCena('.$tabParametr[NieruchomoscDAL::$id_oferta].');';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            UtilsDAL::KonwersjaDbBoolText($wynik, array(NieruchomoscDAL::$podpis));
            
            return $wynik;
        }
        public function PokazZmianaStatus ($tabParametr, &$ilosc_wierszy)
        {
            $zapytanie = 'select * from PokazZmianaStatus('.$tabParametr[NieruchomoscDAL::$id_oferta].');';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            //UtilsDAL::KonwersjaDbBoolText($wynik, array(NieruchomoscDAL::$podpis));
            
            return $wynik;
        }
        //zostanie dodana kolumna
        public function PodajOfertaWyslanaZapotrzebowanie ($tabParametr, &$ilosc_wierszy)
        {
            $zapytanie = 'select * from PodajOfertaWyslanaZapotrzebowanie('.$tabParametr[NieruchomoscDAL::$id_zapotrzebowanie].');';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            UtilsDAL::KonwersjaDbBoolText($wynik, array(NieruchomoscDAL::$is_lst_wsk));
            
            return $wynik;
        }
        public function PodajZapotrzebowanieAdresatOferta ($tabParametr, &$ilosc_wierszy)
        {
            $zapytanie = 'select * from PodajZapotrzebowanieAdresatOferta('.$tabParametr[NieruchomoscDAL::$id_oferta].');';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            UtilsDAL::KonwersjaDbBoolText($wynik, array(NieruchomoscDAL::$is_lst_wsk));
            
            return $wynik;
        }
        public function PodajDostBankInfo(&$ilosc_wierszy)
        {
            $zapytanie = 'select * from PodajDostBankInfo('.$this->osoba_id.');';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            
            return $wynik;
        }
        public function PodajWybBankInfo(&$ilosc_wierszy)
        {
            $zapytanie = 'select * from PodajWybBankInfo('.$this->osoba_id.');';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            
            return $wynik;
        }
        public function DodajInfOsobaBank($tabParametr)
        {
            $zapytanie = 'select * from DodajInfOsobaBank('.$tabParametr[OsobaDAL::$id_bank].', '.$this->osoba_id.');';
            $wynik = $this->dal->OperacjaLogiczna($zapytanie);
            
            return $wynik;    
        }
        //DaneBankiOsoba
        public function DaneBankiOsoba(&$ilosc_wierszy)
        {
            $zapytanie = 'select * from DaneBankiOsoba('.$this->osoba_id.');';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            
            return $wynik;    
        }
        //PokazOdwiedziny
        public function PokazOdwiedziny($tabParametr, &$ilosc_wierszy)
        {
            $zapytanie = 'select * from PokazOdwiedziny('.$tabParametr[NieruchomoscDAL::$id_oferta].', \''.$tabParametr[NieruchomoscDAL::$data].'\');';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            
            return $wynik;
        }
    }
    class KlientDAL
    {
        public static $id_osobowosc = 'id_osobowosc';
        public static $osobowosc = 'osobowosc';
        public static $id_klient = 'id_klient';
        public static $klient = 'klient';
        public static $id_osoba = 'id_osoba';
        public static $id = 'id';
        public static $nazwa = 'nazwa';
        public static $imie = 'imie';
        public static $nazwisko = 'nazwisko';
        public static $id_agent = 'id_agent';
        public static $id_region_geog = 'id_region_geog';
        public static $tresc = 'notatka';
        public static $id_notatka = 'id_notatka';
        public static $data = 'data';
        public static $dowod = 'dowod';
        public static $nr_dowod = 'nr_dowod';
        public static $agent = 'agent';
        public static $kod = 'kod';
        public static $kod_firma = 'kod_firma';
        public static $ulica = 'ulica'; 
        public static $ulica_firma = 'ulica_firma'; 
        public static $nr_dom = 'numer_dom';
        public static $nr_dom_firma = 'numer_dom_firma';
        public static $nr_mieszkanie = 'numer_miesz';
        public static $nr_mieszkanie_firma = 'numer_miesz_firma';
        public static $nip = 'nip';
        public static $pesel = 'pesel';
        public static $regon = 'regon';
        public static $krs = 'krs';
        public static $nazwa_firma = 'nazwa_firma';
        public static $id_region_geog_firma = 'id_region_geog_firma';
        public static $miejscowosc = 'miejscowosc'; 
        public static $miejscowosc_firma = 'miejscowosc_firma'; 
        public static $telefon = 'telefon'; 
        public static $komorka = 'komorka';
        public static $komorka_agent = 'komorka_agent';
        public static $id_oferta = 'id_oferta';
        public static $id_nieruchomosc = 'id_nieruchomosc';
        public static $cena = 'cena';
        public static $transakcja_rodzaj = 'transakcja_rodzaj';
        public static $nieruchomosc_rodzaj = 'nieruchomosc_rodzaj'; 
        
        protected $dal;
        
        public function KlientDAL()
        {
            $this->dal = new dal();
        }
        
        //metoda uaktualnia lub dodaje klienta
        public function DodajKlient($tabParametr)
        {
            $klient = 'null';
            if (isset($tabParametr[KlientDAL::$id_klient]))
            {
                $klient = $tabParametr[KlientDAL::$id_klient];
            }
            $firma_dane = "ARRAY['".$tabParametr[KlientDAL::$nazwa_firma]."', '".$tabParametr[KlientDAL::$nip]."', '".$tabParametr[KlientDAL::$regon]."', '".
            $tabParametr[KlientDAL::$krs]."', '".$tabParametr[KlientDAL::$kod_firma]."', '".$tabParametr[KlientDAL::$id_region_geog_firma]."', '".
            $tabParametr[KlientDAL::$ulica_firma]."', '".$tabParametr[KlientDAL::$nr_dom_firma]."', '".$tabParametr[KlientDAL::$nr_mieszkanie_firma]."']";

            //ARRAY['".$tabParametr[NieruchomoscDAL::$id_imie]."', '".$tabParametr[NieruchomoscDAL::$nazwisko]."', '".$tabParametr[NieruchomoscDAL::$nazwisko_rodowe]."', '".$tabParametr[NieruchomoscDAL::$pesel]."', '".$tabParametr[NieruchomoscDAL::$nr_dowod]."']
            //sprawdzic przy dodaniu lub aktualizacji czy to tak dziala jak ponizej
            $zapytanie = "select * from DodajKlient(".$klient.", ".$tabParametr[KlientDAL::$id_osobowosc].", ".$tabParametr[KlientDAL::$id_agent].", ".$firma_dane.");";//ostatni parametr dojdzie przy wyszukiwaniu istniejacej osobyprzy dodaniu nowego klienta, na razie null zeby dzialalo
            //echo $zapytanie;
            $wynik = $this->dal->WprowadzanieDanych($zapytanie, false);
            
            return $wynik;
        }
        
        public function EdycjaKlient($tabParametr)
        {
            $zapytanie = "select * from EdycjaKlient (".$tabParametr[NieruchomoscDAL::$id_klient].");";
            //echo $zapytanie;
            $wynik = $this->dal->PobierzDane($zapytanie, $iloscWierszy);
            //po pobraniu z bazy danych informacji o osobach czesc zwroconego typu zawiera 'kolekcjê' osob w tablicy typu postgresowego ARRAY
            //typ ten wymaga sensownej interpretacji w php zeby mozna bylo z tymi danymi pracowac
            //UtilsDAL::TabPg2TabPhp($wynik, array(NieruchomoscDAL::$id_osoba_klient, NieruchomoscDAL::$id_osoba, NieruchomoscDAL::$imie, NieruchomoscDAL::$nazwisko));
            
            return $wynik;
        }
        
        //metoda do szuaknia istniejacego klienta
        public function SzukajKlient($tabParametr, &$iloscWierszy)
        {
            //if (strlen($tabParametr[KlientDAL::$id_klient]) < 1)
            //{
                $tabParametr[KlientDAL::$id_klient] = 0;
            //}
            $zapytanie = "select * from SzukajKlient(".$tabParametr[KlientDAL::$id_osobowosc].", ".$tabParametr[KlientDAL::$id_klient].", '".$tabParametr[KlientDAL::$nazwa_firma]."', '".$tabParametr[KlientDAL::$pesel]."', '".
            $tabParametr[KlientDAL::$nazwisko]."', '".$tabParametr[KlientDAL::$telefon]."');";
            $wynik = $this->dal->PobierzDane($zapytanie, $iloscWierszy);
            
            return $wynik;
        }
        
        public function DodajNotatkaKlient($tabParametr)                                                                                 
        {
            $zapytanie = 'select * from DodajNotatkaKlient('.$tabParametr[KlientDAL::$id_klient].', '.$tabParametr[KlientDAL::$id_agent].', \''.$tabParametr[KlientDAL::$tresc].'\');';
            $wynik = $this->dal->OperacjaLogiczna($zapytanie);
            
            return $wynik;    
        }        
        
        public function PodajNotatkaKlient($tabParametr, &$IloscWierszy)
        {
            $zapytanie = 'select * from PodajNotatkaKlient('.$tabParametr[KlientDAL::$id_klient].');';
            //echo $zapytanie;
            $wynik = $this->dal->PobierzDane($zapytanie, $IloscWierszy);
            
            return $wynik;    
        }
        public function UsunNotatka ($tabParametr)
        {
            $zapytanie = 'select * from UsunNotatka('.$tabParametr[KlientDAL::$id_notatka].');';
            $wynik = $this->dal->OperacjaLogiczna($zapytanie);
            
            return $wynik;
        }
        public function OfertaKlient ($tabParametr, &$IloscWierszy)
        {
            $status = 'null';
            if (isset($tabParametr[NieruchomoscDAL::$id_status]))
            {
                $status = $tabParametr[NieruchomoscDAL::$id_status];
            }
            $zapytanie = 'select * from OfertaKlient('.$tabParametr[KlientDAL::$id_osoba].', '.$status.');';
            $wynik = $this->dal->PobierzDane($zapytanie, $IloscWierszy);
            UtilsDAL::TabPg2TabPhp($wynik, array(OsobaDAL::$telefon));
            
            return $wynik;
        }
        public function ZapotrzebowanieKlient ($tabParametr, &$IloscWierszy)
        {
            $zapytanie = 'select * from ZapotrzebowanieKlient('.$tabParametr[KlientDAL::$id_osoba].');';
            $wynik = $this->dal->PobierzDane($zapytanie, $IloscWierszy);
            UtilsDAL::TabPg2TabPhp($wynik, array(OsobaDAL::$telefon));
            
            return $wynik;
        }
        public function PodajDaneUmowaKupno($id_zapotrzebowanie)
        {
            $zapytanie = 'select * from PodajDaneUmowa('.$id_zapotrzebowanie.');';
            $wynik = $this->dal->PobierzDane($zapytanie, $IloscWierszy);
            
            return $wynik[0];
        }
    }
    class KalendarzDAL extends NadrzednyDAL
    {
        public static $data = 'data';
        public static $godzina = 'godzina';
        public static $id_agent = 'id_agent';
        public static $id_godzina = 'id_godzina';
        public static $id_minuta = 'id_minuta';
        public static $id_kalendarz = 'id_kalendarz';
        public static $id_spotkanie = 'id_spotkanie';
        public static $komentarz = 'komentarz';
        public static $agent = 'agent';
        
        protected $dal;
        
        public function KalendarzDAL()
        {
            $this->dal = new dal();
        }
        
        public function PokazKalendarz($tabParametr, &$ilosc_wierszy)
        {
            $data = 'null';
            if (isset($tabParametr[KalendarzDAL::$data]))
            {
                $data = '\''.$tabParametr[KalendarzDAL::$data].'\'';
            }
            
            $zapytanie = 'select * from PokazKalendarz('.$tabParametr[KalendarzDAL::$id_agent].', '.$data.');';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            
            return $wynik;
        }
        //PodajWpisKalendarz
        public function PodajWpisKalendarz($tabParametr)
        {            
            $zapytanie = 'select * from PodajWpisKalendarz('.$tabParametr[KalendarzDAL::$id_kalendarz].');';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            UtilsDAL::TabPg2TabPhp($wynik, array(NieruchomoscDAL::$id_agent), true);
            
            return $wynik;
        }
        //UsunWpisKalendarz
        public function UsunWpisKalendarz($tabParametr)
        {            
            $zapytanie = 'select * from UsunWpisKalendarz('.$tabParametr[KalendarzDAL::$id_kalendarz].');';
            $wynik = $this->dal->WprowadzanieDanych($zapytanie, false);
            
            return $wynik;
        }
        public function WpisKalendarz($tabParametr)
        {
            $kalendarz_id = 'null';
            $spotkanie_id = 'null';
            if (isset($tabParametr[KalendarzDAL::$id_kalendarz]))
            {
                $kalendarz_id = $tabParametr[KalendarzDAL::$id_kalendarz];
            }
            if (isset($tabParametr[KalendarzDAL::$id_spotkanie]))
            {
                if (strlen($tabParametr[KalendarzDAL::$id_spotkanie]) > 0)
                $spotkanie_id = $tabParametr[KalendarzDAL::$id_spotkanie];
            }
            
            UtilsDAL::TabPhp2TabPg($tabParametr[KalendarzDAL::$id_agent], false, $tabAgent);
            
            $zapytanie = 'select * from WpisKalendarz('.$kalendarz_id.', \''.$tabParametr[KalendarzDAL::$data].'\', '.$tabParametr[KalendarzDAL::$id_godzina].', '.
            $tabParametr[KalendarzDAL::$id_minuta].', '.$tabAgent.', \''.$tabParametr[KalendarzDAL::$komentarz].'\', '.$spotkanie_id.');';
            $wynik = $this->dal->WprowadzanieDanych($zapytanie, false);
            //echo $zapytanie;
            
            return $wynik;
        }
    }
    class MediaDAL
    {
        public static $powierzchnia = 'powierzchnia';
        public static $powierzchnia_max = 'powierzchnia_max';
        public static $komentarz = 'komentarz';
        public static $telefon = 'telefon';
        public static $email = 'email';
        public static $telefon_opis = 'telefon_opis';
        public static $email_opis = 'email_opis';
        public static $id_media_reklama = 'id_media_reklama';
        public static $id = 'id';
        public static $id_of_zap = 'id_of_zap';
        public static $id_trans_rodzaj = 'id_trans_rodzaj';
        public static $id_nier_rodzaj = 'id_nier_rodzaj';
        public static $id_media_nieruchomosc = 'id_media_nieruchomosc';
        public static $id_telefon_media_nieruchomosc = 'id_telefon_media_nieruchomosc';
        public static $przypomnienie = 'przypomnienie';
        public static $id_email_media_nieruchomosc = '$id_email_media_nieruchomosc';
        public static $nazwa = 'nazwa';
        public static $opis = 'opis';
        public static $data = 'data';
        public static $data_do = 'data_do';
        public static $id_agent = 'id_agent';
        public static $media_reklama = 'media_reklama';
        //public static $id_media_reklama = 'id_media_reklama';
        
        protected $dal;
        
        public function MediaDAL()
        {
            $this->dal = new dal();
        }
        
        public function DodajNieruchomoscMedia($tabParametr)
        {
            $przypomnienie = 'null';
            if (strlen($tabParametr[NieruchomoscDAL::$data]) > 0)
            {
                $przypomnienie = '\''.$tabParametr[NieruchomoscDAL::$data].'\'';
            }
            $zapytanie = 'select * from DodajMediaNieruchomosc('.$tabParametr[NieruchomoscDAL::$id_nier_rodzaj].', '.$tabParametr[NieruchomoscDAL::$id_rodz_trans].', '.
            $tabParametr[NieruchomoscDAL::$id_region_geog].', '.$tabParametr[NieruchomoscDAL::$id_status].', \''.$tabParametr[NieruchomoscDAL::$ulica].'\', '.$tabParametr[NieruchomoscDAL::$oferent].', \''.
            $tabParametr[MediaDAL::$powierzchnia].'\', \''.$tabParametr[NieruchomoscDAL::$cena].'\', \''.$tabParametr[NieruchomoscDAL::$opis].'\', '.$przypomnienie.', '.
            $tabParametr[MediaDAL::$id_media_reklama].', \''.$tabParametr[MediaDAL::$komentarz].'\', '.$tabParametr[NieruchomoscDAL::$id_agent].', \''.$tabParametr[NieruchomoscDAL::$nazwisko].'\', '.
            $tabParametr[NieruchomoscDAL::$imie].', \''.$tabParametr[MediaDAL::$telefon].'\', \''.$tabParametr[MediaDAL::$telefon_opis].'\', \''.$tabParametr[MediaDAL::$email].'\', \''.$tabParametr[MediaDAL::$email_opis].'\');';
            $wynik = $this->dal->WprowadzanieDanych($zapytanie, false);
            
            return $wynik;
        }
        public function DodajNieruchomoscMediaOs($tabParametr)
        {
            $przypomnienie = 'null';
            if (strlen($tabParametr[NieruchomoscDAL::$data]) > 0)
            {
                $przypomnienie = '\''.$tabParametr[NieruchomoscDAL::$data].'\'';
            }
            $zapytanie = 'select * from DodajMediaNieruchomoscOs('.$tabParametr[NieruchomoscDAL::$id_nier_rodzaj].', '.$tabParametr[NieruchomoscDAL::$id_rodz_trans].', '.
            $tabParametr[NieruchomoscDAL::$id_region_geog].', '.$tabParametr[NieruchomoscDAL::$id_status].', \''.$tabParametr[NieruchomoscDAL::$ulica].'\', '.$tabParametr[NieruchomoscDAL::$oferent].', \''.
            $tabParametr[MediaDAL::$powierzchnia].'\', \''.$tabParametr[NieruchomoscDAL::$cena].'\', \''.$tabParametr[NieruchomoscDAL::$opis].'\', '.$przypomnienie.', 
            \''.$tabParametr[MediaDAL::$komentarz].'\', '.$tabParametr[NieruchomoscDAL::$id_agent].', '.$tabParametr[OsobaDAL::$id_osoba].');';
            $wynik = $this->dal->WprowadzanieDanych($zapytanie, false);
            
            return $wynik;
        }
        public function UaktualnijMediaNieruchomosc($tabParametr)
        {
            $przypomnienie = 'null';
            if (strlen($tabParametr[NieruchomoscDAL::$data]) > 0)
            {
                $przypomnienie = '\''.$tabParametr[NieruchomoscDAL::$data].'\'';
            }
            $zapytanie = 'select * from UaktualnijMediaNieruchomosc( '.$tabParametr[MediaDAL::$id_media_reklama].', '.$tabParametr[NieruchomoscDAL::$id_nier_rodzaj].', '.
            $tabParametr[NieruchomoscDAL::$id_rodz_trans].', '.$tabParametr[NieruchomoscDAL::$id_region_geog].', '.$tabParametr[NieruchomoscDAL::$id_status].', \''.
            $tabParametr[NieruchomoscDAL::$ulica].'\', '.$tabParametr[NieruchomoscDAL::$oferent].', \''.$tabParametr[MediaDAL::$powierzchnia].'\', \''.$tabParametr[NieruchomoscDAL::$cena].'\', \''.
            $tabParametr[NieruchomoscDAL::$opis].'\', '.$przypomnienie.');';
            $wynik = $this->dal->OperacjaLogiczna($zapytanie);
            
            return $wynik;
        }
        public function EdycjaNieruchomoscMedia($tabParametr)
        {
            $zapytanie = 'select * from EdytujMediaNieruchomosc('.$tabParametr[MediaDAL::$id_media_nieruchomosc].');';
            //echo $zapytanie;
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            UtilsDAL::KorektaKolBool($wynik, array(NieruchomoscDAL::$oferent));
            
            return $wynik;
        }
        public function PodajPrzypomnieniaMedia($tabParametr, &$ilosc_wierszy)
        {
            $agent = 'null';
            if (isset($tabParametr[NieruchomoscDAL::$id_agent]))
            {
                $agent = $tabParametr[NieruchomoscDAL::$id_agent];
            }
            $zapytanie = 'select * from PodajPrzypomnieniaMedia('.$agent.');';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            UtilsDAL::KonwersjaDbBoolText($wynik, array(NieruchomoscDAL::$oferent));
            
            return $wynik;
        }
        public function PodajMediaNaCzasie($tabParametr, &$ilosc_wierszy)
        {
            $agent = 'null';
            if (isset($tabParametr[NieruchomoscDAL::$id_agent]))
            {
                $agent = $tabParametr[NieruchomoscDAL::$id_agent];
            }
            $zapytanie = 'select * from PodajMediaNaCzasie('.$agent.');';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            UtilsDAL::KonwersjaDbBoolText($wynik, array(NieruchomoscDAL::$oferent));
            
            return $wynik;
        }
        public function MediaOsoba($tabParametr, &$ilosc_wierszy)
        {
            $zapytanie = 'select * from MediaOsoba('.$tabParametr[OsobaDAL::$id_osoba].');';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            UtilsDAL::KonwersjaDbBoolText($wynik, array(NieruchomoscDAL::$oferent));
            
            return $wynik;
        }
        public function PodajOfertyTelefon($tabParametr, &$ilosc_wierszy)
        {
            $zapytanie = 'select * from PodajOfertyTelefon(\''.$tabParametr[MediaDAL::$telefon].'\');';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            
            return $wynik;
        }
        public function PodajZapotrzebowanieTelefon($tabParametr, &$ilosc_wierszy)
        {
            $zapytanie = 'select * from PodajZapotrzebowanieTelefon(\''.$tabParametr[MediaDAL::$telefon].'\');';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            
            return $wynik;
        }
        public function PodajOfertyMedia($tabParametr, &$ilosc_wierszy)
        {
            $sort_kol = '';
            if (isset($tabParametr[NieruchomoscDAL::$sortuj]))
            {
                $sort_kol = $tabParametr[NieruchomoscDAL::$sortuj];
            }
            $sort_kier = 0;
            if (isset($tabParametr[NieruchomoscDAL::$sortuj_kierunek]))
            {
                $sort_kier = $tabParametr[NieruchomoscDAL::$sortuj_kierunek];
            }
            if (strlen($tabParametr[MediaDAL::$data]) > 0)
            {
                $tabParametr[MediaDAL::$data] = '\''.$tabParametr[MediaDAL::$data].'\'';
            }
            else
            {
                $tabParametr[MediaDAL::$data] = 'null';
            }
            if (strlen($tabParametr[MediaDAL::$data_do]) > 0)
            {
                $tabParametr[MediaDAL::$data_do] = '\''.$tabParametr[MediaDAL::$data_do].'\'';
            }
            else
            {
                $tabParametr[MediaDAL::$data_do] = 'null';
            }
            if ($tabParametr[NieruchomoscDAL::$oferent] != 'null')
            {
                $tabParametr[NieruchomoscDAL::$oferent] = '\''.$tabParametr[NieruchomoscDAL::$oferent].'\'';
            }
            
            $zapytanie = 'select * from PodajOfertyMedia('.$tabParametr[NieruchomoscDAL::$oferent].', \''.$tabParametr[MediaDAL::$telefon].'\', '.$tabParametr[NieruchomoscDAL::$id_nier_rodzaj].', '.
            $tabParametr[NieruchomoscDAL::$id_trans_rodzaj].', '.$tabParametr[MediaDAL::$data].', '.$tabParametr[MediaDAL::$data_do].', \''.$sort_kol.'\', '.$sort_kier.');';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            UtilsDAL::KonwersjaDbBoolText($wynik, array(NieruchomoscDAL::$oferent));
            //echo $zapytanie;
            return $wynik;
        }
        public function PodajOfertyMediaPrzyjecie($tabParametr, &$ilosc_wierszy)
        {
            $zapytanie = 'select * from PodajOfertyMediaPrzyjecie('.$tabParametr[NieruchomoscDAL::$oferent].', \''.$tabParametr[MediaDAL::$telefon].'\', '.$tabParametr[MediaDAL::$id_nier_rodzaj].', '.
            $tabParametr[MediaDAL::$id_trans_rodzaj].');';
            //echo $zapytanie;
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            
            return $wynik;
        }
        public function PrzyjetoZMediow($tabParametr)
        {
            $zapytanie = 'select * from PrzyjetoZMediow('.$tabParametr[MediaDAL::$id_media_nieruchomosc].', '.$tabParametr[MediaDAL::$id_of_zap].');';
            $wynik = $this->dal->WprowadzanieDanych($zapytanie, false);
            
            return $wynik;
        }
        public function PodajMediumDlaOfZap($tabParametr, &$ilosc_wierszy)
        {
            $zapytanie = 'select * from PodajMediumDlaOfZap('.$tabParametr[MediaDAL::$id_of_zap].', '.$tabParametr[NieruchomoscDAL::$oferent].');';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            
            return $wynik;
        }
        public function PodajKontaktyMediaNier($tabParametr, &$ilosc_wierszy)
        {
            $zapytanie = 'select * from PodajKontaktyMediaNier('.$tabParametr[MediaDAL::$id_media_nieruchomosc].');';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            
            return $wynik;    
        }
        public function DodajKontaktMediaNier($tabParametr)
        {
            $zapytanie = 'select * from DodajKontaktMediaNier('.$tabParametr[MediaDAL::$id_media_nieruchomosc].', '.$tabParametr[NieruchomoscDAL::$id_agent].', \''.$tabParametr[MediaDAL::$komentarz].'\');';
            $wynik = $this->dal->OperacjaLogiczna($zapytanie);
            
            return $wynik;    
        }
        public function KojarzenieMediaOferta($tabParametr, &$ilosc_wierszy) 
        {
            $zapytanie = 'select * from KojarzenieMediaOferta('.$tabParametr[MediaDAL::$id_media_nieruchomosc].');';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            UtilsDAL::TabPg2TabPhp($wynik, array(OsobaDAL::$telefon));
            
            return $wynik;
        }
        public function KojarzenieMediaZapotrzebowanie($tabParametr, &$ilosc_wierszy) 
        {
            $zapytanie = 'select * from KojarzenieMediaZapotrzebowanie('.$tabParametr[MediaDAL::$id_media_nieruchomosc].');';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            UtilsDAL::TabPg2TabPhp($wynik, array(OsobaDAL::$telefon));
            
            return $wynik;
        }
        public function KojarzenieMedia($tabParametr, &$ilosc_wierszy) 
        {
            $zapytanie = 'select * from KojarzenieMedia('.$tabParametr[MediaDAL::$id_media_nieruchomosc].', '.$tabParametr[NieruchomoscDAL::$oferent].');';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            
            return $wynik;
        }
        public function PodajTelefonMedia($tabParametr, &$ilosc_wierszy)
        {
            $zapytanie = 'select * from PodajTelefonMedia('.$tabParametr[MediaDAL::$id_media_nieruchomosc].');';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            
            return $wynik;
        }
        public function UsunTelefonMedia($tabParametr)
        {
            $zapytanie = 'select * from UsunTelefonMedia('.$tabParametr[MediaDAL::$id_telefon_media_nieruchomosc].');';
            $wynik = $this->dal->OperacjaLogiczna($zapytanie);
            
            return $wynik;    
        }
        public function DodajTelefonMedia($tabParametr)
        {
            $telefon_id = 'null';
            if(isset($tabParametr[MediaDAL::$id_telefon_media_nieruchomosc]))
            {
                $telefon_id = $tabParametr[MediaDAL::$id_telefon_media_nieruchomosc];
            }
            $zapytanie = 'select * from DodajTelefonMedia('.$telefon_id.', '.$tabParametr[MediaDAL::$id_media_nieruchomosc].',\''.
            $tabParametr[MediaDAL::$telefon].'\', \''.$tabParametr[MediaDAL::$telefon_opis].'\', true);';
            $wynik = $this->dal->OperacjaLogiczna($zapytanie);
            
            return $wynik;    
        }
        
        public function PodajEmailMedia($tabParametr, &$ilosc_wierszy)
        {
            $zapytanie = 'select * from PodajEmailMedia('.$tabParametr[MediaDAL::$id_media_nieruchomosc].');';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            
            return $wynik;
        }
        public function UsunEmailMedia($tabParametr)
        {
            $zapytanie = 'select * from UsunEmailMedia('.$tabParametr[MediaDAL::$id_email_media_nieruchomosc].');';
            $wynik = $this->dal->OperacjaLogiczna($zapytanie);
            
            return $wynik;
        }
        
        public function DodajEmailMedia($tabParametr)
        {
            $mail_id = 'null';
            if(isset($tabParametr[MediaDAL::$id_email_media_nieruchomosc]))
            {
                $mail_id = $tabParametr[MediaDAL::$id_email_media_nieruchomosc];
            }
            $zapytanie = 'select * from DodajEmailMedia('.$mail_id.', '.$tabParametr[MediaDAL::$id_media_nieruchomosc].', \''
            .$tabParametr[MediaDAL::$email].'\', \''.$tabParametr[MediaDAL::$email_opis].'\' );';
            $wynik = $this->dal->OperacjaLogiczna($zapytanie);
            
            return $wynik;
        }
        public function PodajReklamaMedia($tabParametr, &$ilosc_wierszy)
        {
            $zapytanie = 'select * from PodajReklamaMedia('.$tabParametr[MediaDAL::$id_media_nieruchomosc].');';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            
            return $wynik;
        }
        public function DodajReklamaMedia($tabParametr, &$ilosc_wierszy)
        {
            $zapytanie = 'select * from DodajReklamaMedia('.$tabParametr[MediaDAL::$id_media_nieruchomosc].', '.$tabParametr[MediaDAL::$id_media_reklama].', \''.$tabParametr[MediaDAL::$data].'\' );';   
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            
            return $wynik;
        }
        
    }
    class GablotaDAL
    {
        public static $id_gablota = 'id_gablota';
        public static $id_gablota_zawartosc = 'id_gablota_zawartosc';
        public static $stan = 'stan';
        public static $wspolrzedna_x = 'wspolrzedna_x';
        public static $wspolrzedna_y = 'wspolrzedna_y';
        
        protected $dal;
        
        public function GablotaDAL()
        {
            $this->dal = new dal();
        }
        
        public function StanGabloty($tabParametr, &$ilosc_wierszy)
        {
            $zapytanie = 'select * from StanGabloty('.$tabParametr[GablotaDAL::$id_gablota_zawartosc].') order by wspolrzedna_y, wspolrzedna_x;';   
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            
            return $wynik;
        }
        public function PodajOfertyDostepneGablota($tabParametr, &$ilosc_wierszy)
        {
            $zapytanie = 'select * from PodajOfertyDostepneGablota('.$tabParametr[GablotaDAL::$id_gablota_zawartosc].') order by data desc;';   
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            
            return $wynik;
        }
        //DodajOfertaGablota
        public function DodajOfertaGablota($tabParametr)
        {
            $zapytanie = 'select DodajOfertaGablota('.$tabParametr[NieruchomoscDAL::$id_oferta].', '.$tabParametr[GablotaDAL::$id_gablota].', '.$tabParametr[GablotaDAL::$wspolrzedna_x].', '.
            $tabParametr[GablotaDAL::$wspolrzedna_y].');';
            $wynik = $this->dal->WprowadzanieDanych($zapytanie, false);

            return $wynik;
        }
    }
    class ExportDAL
    {
        public static $insertion_id = 'insertion_id';
        public static $id_oferta = 'id_oferta';
        public static $id_agent = 'id_agent';
        public static $ilosc = 'ilosc';
        public static $id_kategoria = 'id_kategoria';
        public static $id_wojewodztwo = 'id_wojewodztwo';
        public static $id_powiat = 'id_powiat';
        public static $powierzchnia = 'powierzchnia';
        public static $powierzchnia_dzialki = 'powierzchnia_dzialki';
        public static $stan_prawny = 'stan_prawny';
        public static $rok = 'rok';
        public static $dodatki = 'dodatki';
        public static $liczba_pokoi = 'liczba_pokoi';
        public static $liczba_pokoi_max = 'liczba_pokoi_max';
        public static $cena = 'cena';
        public static $ulica = 'ulica';
        public static $rodzaj_oferta = 'rodzaj_oferta';
        public static $rodzaj_nieruchomosc = 'rodzaj_nieruchomosc';
        public static $liczba_pieter = 'liczba_pieter';
        public static $numer_pietra = 'numer_pietra';
        public static $miejscowosc = 'miejscowosc';
        public static $opis = 'opis';
        public static $data_wyg = 'data_wyg';
        public static $zdjecie = 'zdjecie';
        public static $nazwazdjecia = 'nazwazdjecia';
        public static $zdjecia = 'zdjecia';
        public static $rynek = 'rynek_pierw';
        
        protected $dal;
        
        public function ExportDAL()
        {
            $this->dal = new dal();
        }
        
        public function PobierzOfertaOtodom($id_oferta, $automat = false, &$ilosc_wierszy = 0)
        {
            $auto = 'false';
            if ($automat)
            {
                $auto = 'true';
            }
            $zapytanie = 'select * from PodajOfertaOtodom('.$id_oferta.', '.$auto.');';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            UtilsDAL::TabPg2TabPhp($wynik, array(ExportDAL::$dodatki, ExportDAL::$zdjecie));
            UtilsDAL::KorektaKolBool($wynik, array(ExportDAL::$rynek));
            
            return $wynik;
        }
        //wprowadzenie notatki o ogloszeniu oferty w otodom
        public function OgloszenieOtodom($id_oferta, $id_insertion, $okresy)
        {
            $zapytanie = 'select OgloszenieOtodom as data_wyg from OgloszenieOtodom('.$id_oferta.', '.$id_insertion.', '.$okresy.');';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy); //a czemu nie wprowadzanie danych ????
            
            return $wynik[0];
        }
        ///do wykorzystania dla wszystkich portali
        public function SprawdzAktOfwPortalu($id_oferta, $nazwa_portal)
        {
            $zapytanie = 'select SprawdzAktOfwPortalu as ilosc from SprawdzAktOfwPortalu('.$id_oferta.', \''.$nazwa_portal.'\');';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            
            return $wynik;
        }
        public function PodajInsOtodomIdPoOfId($id_oferta)
        {
            $zapytanie = 'select PodajInsOtodomIdPoOfId as insertion_id from PodajInsOtodomIdPoOfId('.$id_oferta.');';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            
            return $wynik[0];
        }
        public function AktDeaktOferta($id_oferta, $bool)
        {
            $zapytanie = 'select * from AktDeaktOferta('.$id_oferta.', '.$bool.');';
            $wynik = $this->dal->OperacjaLogiczna($zapytanie);
            
            return $wynik;
        }
        public function PodajOfertyProlongata($nazwa_portal, &$ilosc_wierszy)
        {
            $zapytanie = 'select PodajOfertyProlongata as id_oferta from PodajOfertyProlongata(\''.$nazwa_portal.'\');';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            
            return $wynik;
        }
        public function PodajOfertyDeaktywacja($nazwa_portal, &$ilosc_wierszy)
        {
            $zapytanie = 'select PodajOfertyDeaktywacja as id_oferta from PodajOfertyDeaktywacja(\''.$nazwa_portal.'\');';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            
            return $wynik;
        }
        public function PodajOfertyDeaktywacjaOfertyNet(&$ilosc_wierszy)
        {
            $zapytanie = 'select * from PodajOfertyDeaktywacjaOfertyNet();';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            
            return $wynik;
        }
        public function PodajOfertaDomiporta($id_oferta, $automat = false)
        {
            $auto = 'false';
            if ($automat)
            {
                $auto = 'true';
            }
            $zapytanie = 'select * from PodajOfertaDomiporta('.$id_oferta.', '.$auto.');';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            UtilsDAL::TabPg2TabPhp($wynik, array(ExportDAL::$zdjecia));
            
            return $wynik;
        }
        ///wprowadzenie info o ogloszeniu w domiporcie, na sztwno brak id z domiporty i 2 okresy - 60 dni tam CHYBA jest
        public function OgloszenieDomiporta($id_oferta)//, $id_insertion, $okresy)
        {
            $zapytanie = 'select OgloszenieDomiporta as data_wyg from OgloszenieDomiporta('.$id_oferta.', null, 2);';
            $wynik = $this->dal->WprowadzanieDanych($zapytanie);
            
            return $wynik;
        }
        public function PodajOfertyOfNet(&$ilosc_wierszy)
        {
            $zapytanie = 'select * from PodajListaOfertPublikacjaOfertyNet() order by id_nier_rodzaj, id_trans_rodzaj;';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            UtilsDAL::TabPg2TabPhp($wynik, array(ExportDAL::$zdjecie));
            
            return $wynik;
        }
        public function PodajOfertyKrn(&$ilosc_wierszy)
        {
            $zapytanie = 'select * from PodajListaOfertPublikacjaKrn();';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            UtilsDAL::TabPg2TabPhp($wynik, array(ExportDAL::$zdjecie));
            
            return $wynik;
        }
        public function PodajOfertyGazetaDom(&$ilosc_wierszy)
        {
            $zapytanie = 'select * from PodajListaOfertPublikacjaGazetaDom() order by id_nier_rodzaj, id_trans_rodzaj;';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            UtilsDAL::TabPg2TabPhp($wynik, array(ExportDAL::$zdjecie));
            
            return $wynik;
        }
        public function PodajOfertyGratka(&$ilosc_wierszy)
        {
            $zapytanie = 'select * from PodajListaOfertPublikacjaGratka();';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            UtilsDAL::TabPg2TabPhp($wynik, array(ExportDAL::$zdjecie));
            
            return $wynik;
        }
        public function PodajListaOfertAkt(&$ilosc_wierszy)
        {
            $zapytanie = 'select PodajListaOfertAkt as id_oferta from PodajListaOfertAkt();';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            
            return $wynik;
        }
        public function OgloszenieOfertyNet($id_oferta)//, $id_insertion, $okresy)
        {
            $zapytanie = 'select OgloszenieOfertyNet as data_wyg from OgloszenieOfertyNet('.$id_oferta.');';
            $wynik = $this->dal->WprowadzanieDanych($zapytanie);
            
            return $wynik;
        }
        public function OfertaWstrzymana (&$ilosc_wierszy)
        {
            $zapytanie = 'select * from OfertaWstrzymana();';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            
            return $wynik;
        }
    }
    class SlownikDAL 
    {
        public static $rodzaj_nieruchom = 'nier_rodzaj';
        public static $imie = 'imie';
        public static $osobowosc = 'osobowosc';
        public static $bank = 'bank';
        public static $gablota = 'gablota';
        public static $pomieszczenie = 'pomieszczenie';
        public static $sekcja = 'sekcja';
        public static $status = 'status';
        public static $umowienie = 'umowienie';
        public static $walidacja = 'walidacja';
        public static $godzina = 'godzina';
        public static $minuta = 'minuta';
        public static $sposob_finansowania = 'sposob_finansowania';
        public static $media_reklama = 'media_reklama';
        public static $priorytet_reklama = 'priorytet_reklama';
        public static $rodzaj_dowod_tozsamosc = 'rodzaj_dowod_tozsamosc';
        public static $status_dzwonienie = 'status_dzwonienie';
        public static $slowniki = array('imie' => 'imie', 'bank' => 'bank', 'media_reklama' => 'media_reklama'); ///??????????
        
        //pole dla dala najnizeszej warstwy, odpowiedzialne za komunikacje z baza
        protected static $dal;
        
        public static function PobierzSlownik($slownik)
        {
            SlownikDAL::$dal = new dal();
            $zapytanie = "select * from DaneSlownik ('".$slownik."');";
            $wynik = SlownikDAL::$dal->PobierzDane($zapytanie, $iloscWierszy);
            
            return $wynik;
        }
        public static function PodajListaSlownikow()
        {
            
        }
        public static function PobierzRegionGeog($id_parent)
        {
            SlownikDAL::$dal = new dal();
            if ($id_parent == null)
            {
                $zapytanie = 'select * from RegionGeograficzny (null);';
            }
            else
            {
                $zapytanie = 'select * from RegionGeograficzny ('.$id_parent.');';
            }
            $wynik = SlownikDAL::$dal->PobierzDane($zapytanie, $iloscWierszy);
            
            return $wynik;
        }
        public static function PobierzDzielniceOpole()
        {
            SlownikDAL::$dal = new dal();
            $zapytanie = 'select * from PodajDzielniceOpole ();';
            $wynik = SlownikDAL::$dal->PobierzDane($zapytanie, $iloscWierszy);
            
            return $wynik;
        }
        //metoda pobiera z bazy regiony geograficzne po nazwie
        //potem przemianowac i dorobic metode do dowolnego regionu
        public static function PobierzDowRegionGeog($wojewodztwo_id, $nazwa)
        {
            SlownikDAL::$dal = new dal();
            
            $zapytanie = 'select * from DowRegionGeograficzny ('.$wojewodztwo_id.', \''.$nazwa.'\');';
            //pobranie wynikow
            $wynik = SlownikDAL::$dal->PobierzDane($zapytanie, $iloscWierszy);
            //rodzice przychodza w tablicy, rozlaczenie
            UtilsDAL::TabPg2TabPhp($wynik, array(NieruchomoscDAL::$rodzice));
            //jesli zwrocono jeden wynik istnieje prawdopodobienstow, ze kryterium bylo za szerokie
            if ($iloscWierszy == 1)
            {
                //jesli w tym 1 wiuerszu wyniku nic nie ma (dlugosc stringu jest 0) znaczy to ze nie zwrocono rezultatoew zapytania
                if (strlen($wynik[0][NieruchomoscDAL::$region]) < 1)
                {
                    return tags::$zbyt_wiele_wynikow;
                }
                else
                {
                    return $wynik;
                }
            }
            else
            {
                return $wynik;
            }
        }
        //metoda zwraca zasob w postaci klasycznie slownikowej z lista osob skladajacych sie na danego klienta
        public static function RegionGeograficznyNajnizej($nazwa)
        {
            SlownikDAL::$dal = new dal();
            
            $zapytanie = 'select * from RegionGeograficznyNajnizej (\''.$nazwa.'\');';
            //pobranie wynikow
            $wynik = SlownikDAL::$dal->PobierzDane($zapytanie, $iloscWierszy);
            //rodzice przychodza w tablicy, rozlaczenie
            UtilsDAL::TabPg2TabPhp($wynik, array(NieruchomoscDAL::$rodzice));
            //jesli zwrocono jeden wynik istnieje prawdopodobienstow, ze kryterium bylo za szerokie
            if ($iloscWierszy == 1)
            {
                //jesli w tym 1 wiuerszu wyniku nic nie ma (dlugosc stringu jest 0) znaczy to ze nie zwrocono rezultatoew zapytania
                if (strlen($wynik[0][NieruchomoscDAL::$region]) < 1)
                {
                    return tags::$zbyt_wiele_wynikow;
                }
                else
                {
                    return $wynik;
                }
            }
            else
            {
                return $wynik;
            }
        }
        public static function RegionGeograficznyNajnizejWoj($nazwa, $id_wojewodztwo)
        {
            SlownikDAL::$dal = new dal();
            
            $zapytanie = 'select * from RegionGeograficznyNajnizejWoj(\''.$nazwa.'\', '.$id_wojewodztwo.');';
            //pobranie wynikow
            $wynik = SlownikDAL::$dal->PobierzDane($zapytanie, $iloscWierszy);
            //rodzice przychodza w tablicy, rozlaczenie
            UtilsDAL::TabPg2TabPhp($wynik, array(NieruchomoscDAL::$rodzice));
            //jesli zwrocono jeden wynik istnieje prawdopodobienstow, ze kryterium bylo za szerokie
            if ($iloscWierszy == 1)
            {
                //jesli w tym 1 wiuerszu wyniku nic nie ma (dlugosc stringu jest 0) znaczy to ze nie zwrocono rezultatoew zapytania
                if (strlen($wynik[0][NieruchomoscDAL::$region]) < 1)
                {
                    return tags::$zbyt_wiele_wynikow;
                }
                else
                {
                    return $wynik;
                }
            }
            else
            {
                return $wynik;
            }
        }
        public static function RegionGeograficznyCzwPozWoj($nazwa, $id_wojewodztwo)
        {
            SlownikDAL::$dal = new dal();
            
            $zapytanie = 'select * from RegionGeograficznyCzwPozWoj(\''.$nazwa.'\', '.$id_wojewodztwo.');';
            //pobranie wynikow
            $wynik = SlownikDAL::$dal->PobierzDane($zapytanie, $iloscWierszy);
            //rodzice przychodza w tablicy, rozlaczenie
            UtilsDAL::TabPg2TabPhp($wynik, array(NieruchomoscDAL::$rodzice));
            //jesli zwrocono jeden wynik istnieje prawdopodobienstow, ze kryterium bylo za szerokie
            if ($iloscWierszy == 1)
            {
                //jesli w tym 1 wiuerszu wyniku nic nie ma (dlugosc stringu jest 0) znaczy to ze nie zwrocono rezultatoew zapytania
                if (strlen($wynik[0][NieruchomoscDAL::$region]) < 1)
                {
                    return tags::$zbyt_wiele_wynikow;
                }
                else
                {
                    return $wynik;
                }
            }
            else
            {
                return $wynik;
            }
        }
        public static function PodajWojewodztwa()
        {
            SlownikDAL::$dal = new dal();
            
            $zapytanie = 'select * from PodajWojewodztwa ();';
            //pobranie wynikow
            $wynik = SlownikDAL::$dal->PobierzDane($zapytanie, $iloscWierszy);
            
            return $wynik;
        }
        public static function PobierzOsobaKlient($klient_id)
        {
            SlownikDAL::$dal = new dal();
            $zapytanie = 'select * from podajosobaklientzmcena('.$klient_id.');';
            $wynik = SlownikDAL::$dal->PobierzDane($zapytanie, $iloscWierszy);
            
            return $wynik;
        }
    }
?>