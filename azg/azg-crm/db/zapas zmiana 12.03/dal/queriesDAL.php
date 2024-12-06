<?php
    $path = str_replace($_SERVER['PHP_SELF'], '', $_SERVER['SCRIPT_FILENAME']).'/';
    
    include_once ($path.'dal/dal.php');
    include_once ($path.'dal/utilsdal.php');
    include_once ($path.'bll/tags.php');
    
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
            //$this->dal->
            //$this->
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
       public static $nowe_haslo = 'nowe_haslo';
       public static $rezultat = 'rezultat';
       public static $aktywnosc = 'aktywnosc';
       public static $nazwa = 'nazwa';
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
    }
    
    class TransNierDAL
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
        
        public function WyposazenieNieruchomosci(&$ilosc_wierszy)
        {
            $zapytanie = "select * from pobierzwyposazenienier(".$this->parametry[WyposazenieNierDAL::$id_transakcja].", ".$this->parametry[WyposazenieNierDAL::$id_nieruchomosc].") where id is not null;";
            $wynik = $this->dal->PobierzDane($zapytanie,$ilosc_wierszy);
            UtilsDAL::TabPg2TabPhp($wynik, array(WyposazenieNierDAL::$id_parent, WyposazenieNierDAL::$id, WyposazenieNierDAL::$wielokrotne, WyposazenieNierDAL::$nazwa));
            
            return $wynik;
        }
        
        public function ParametryNieruchomosci(&$ilosc_wierszy)
        {
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
        
        protected $dal;
        protected $parametry;
        //na etapie tworzenia nowego obiektu wymagane bedzie znanie id nieruchomosci w bazie bezwzglednie
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
            $zapytanie = 'select DodajRegGeogZap('.$this->zapotrzebowanieId.', '.$region_id.');';
            $wynik = $this->dal->OperacjaLogiczna($zapytanie);
            
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
        
        ///kojarzenia dla zapotrzebowan i dla ofert, 2 koncowe parametry to poziom kojarzenia dla 4 wag z tabel param i wypos
        public function KojarzenieBazoweDlaZapotrzebowania($tabParametr = null)
        {
            $poziom_par = 'null';
            $poziom_wyp = 'null';
            
            if (isset($tabParametr[WyposazenieZapDAL::$poziom_parametry]))
            {
                $poziom_par = $tabParametr[WyposazenieZapDAL::$poziom_parametry];
            }
            if (isset($tabParametr[WyposazenieZapDAL::$poziom_wyposazenia]))
            {
                $poziom_wyp = $tabParametr[WyposazenieZapDAL::$poziom_wyposazenia];
            }
            
            $zapytanie = 'select * from KojarzenieBazoweDlaZapotrzebowania('.$this->zapotrzebowanieId.', '.$poziom_par.', '.$poziom_wyp.');';
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
    }
    class NieruchomoscDAL
    {
        public static $id_oferta = 'id_oferta';
        public static $id_zapotrzebowanie = 'id_zapotrzebowanie';
        public static $id_nieruchomosc = 'id_nieruchomosc';
        public static $id_klient = 'id_klient';
        public static $id_osoba_klient = 'id_osoba_klient';
        public static $id_osoba = 'id_osoba';
        public static $id_osobowosc = 'id_osobowosc';
        public static $id_nier_rodzaj = 'id_nier_rodzaj';
        public static $id_rodz_nier_szcz = 'id_rodz_nier_szcz';
        public static $id_rodz_trans = 'id_rodz_trans';
        public static $id_status = 'id_status';
        public static $id_region_geog = 'id_region_geog';
        public static $id_prow_zap = 'id_prow_zap';
        public static $id_agent = 'id_agent';
        public static $id_opis = 'id_opis';
        public static $miejscowosc = 'miejscowosc'; 
        public static $nazwa = 'nazwa';
        public static $notatka = 'notatka';
        public static $id_notatka = 'id_notatka';
        public static $imie = 'imie';        
        public static $transakcja_rodzaj = 'transakcja_rodzaj';
        public static $nieruchomosc_rodzaj = 'nieruchomosc_rodzaj';
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
        public static $data_otw_zlecenie = 'data_otw_zlecenie';
        public static $data_zam_zlecenie = 'data_zam_zlecenie';
        public static $prowizja = 'prowizja';
        public static $prow_proc = 'prow_proc';
        public static $wylacznosc = 'wylacznosc';
        public static $pokaz = 'pokaz';
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
        public static $id_godzina = 'id_godzina';
        public static $id_minuta = 'id_minuta';
        public static $godzina = 'godzina';
        public static $id_opis_nieruchomosc = 'id_opis_nieruchomosc';
        public static $id_jezyk = 'id_jezyk';
        public static $tresc = 'tresc';
        public static $nazwisko = 'nazwisko';
        public static $pesel = 'pesel';
        public static $jezyk = 'jezyk';
    
        protected $dal;
        
        public function NieruchomoscDAL ()
        {
            $this->dal = new dal();
        }
        
        public function SzybkieSzukanie($tabParametr, &$ilosc_wierszy)
        {
            $zapytanie = "select * from SzybkieSzukanie (".$tabParametr[NieruchomoscDAL::$nazwisko].",".$tabParametr[NieruchomoscDAL::$id_oferta].");";
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            
            return $wynik;
        }
        public function SzybkieSzukanieZapotrzebowanie ($tabParametr,&$ilosc_wierszy)
        {
            $zapytanie = 'select * from SzybkieSzukanieZapotrzebowanie ('.$tabParametr[NieruchomoscDAL::$nazwisko].', '.$tabParametr[NieruchomoscDAL::$id_zapotrzebowanie].');';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            
            return $wynik;
        }
        
        public function FiltrowanieOfert($tabParametr, &$ilosc_wierszy)
        {
            $zapytanie = 'select * from FiltrujOferty('.$tabParametr[NieruchomoscDAL::$id_nier_rodzaj].', '.$tabParametr[NieruchomoscDAL::$id_rodz_trans].', '.$tabParametr[NieruchomoscDAL::$id_status].');';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            
            return $wynik;
        }
        
        public function EdycjaOferta($tabParametr, &$iloscWierszy)
        {
            $zapytanie = "select * from EdycjaOferta (".$tabParametr[NieruchomoscDAL::$id_oferta].");";
            $wynik = $this->dal->PobierzDane($zapytanie, $iloscWierszy);
            UtilsDAL::KorektaKolBool($wynik, array(NieruchomoscDAL::$pokaz, NieruchomoscDAL::$prow_proc, NieruchomoscDAL::$wylacznosc, NieruchomoscDAL::$rynek));
            
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
            $id_rodz_transakcji.', \''.$tabParametr[NieruchomoscDAL::$prowizja].'\', '.$prow_proc.');';
            $wynik = $this->dal->OperacjaLogiczna($zapytanie);
            
            return $wynik;
        }
        public function UsunProwDlaTrans ($tabParametr)
        {
            $zapytanie = 'select * from UsunProwDlaTrans('.$tabParametr[NieruchomoscDAL::$id_prow_zap].');';
            $wynik = $this->dal->OperacjaLogiczna($zapytanie);
            
            return $wynik;        
        }
        //metoda dodaje nowa oferte wraz z nowa nieruchomoscia do systemu
        public function DodajOferta($tabParametr)
        {  
            $prow_proc = 'false';
            $wylacznosc = 'false';
            $pokaz = 'false';
            $rynek = 'false';
            $podpis_cena = 'false';
            
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
            if (isset($tabParametr[NieruchomoscDAL::$id_oferta]))
            {
                //update
                $zapytanie = "select * from DodajOferta(".$tabParametr[NieruchomoscDAL::$id_oferta].", ".$tabParametr[NieruchomoscDAL::$id_rodz_trans]." , ".
                $tabParametr[NieruchomoscDAL::$id_status].", null, ".$tabParametr[NieruchomoscDAL::$data_zam_zlecenie].", '".
                $tabParametr[NieruchomoscDAL::$cena]."', ".$prow_proc.", '".$tabParametr[NieruchomoscDAL::$prowizja]."', ".
                $wylacznosc.", ".$pokaz.", null, ".$nier_szczeg.", null, ".
                $tabParametr[NieruchomoscDAL::$id_region_geog].", '".$tabParametr[NieruchomoscDAL::$ulica]."', '".$tabParametr[NieruchomoscDAL::$ulica_net]."', '".
                $tabParametr[NieruchomoscDAL::$kod]."', ".$tabParametr[NieruchomoscDAL::$agent].", ".$rynek.", ".$osoba.", ".$podpis_cena.");";
                //echo $zapytanie;
            }
            else
            {
                //insert
                $zapytanie = "select * from DodajOferta(null, ".$tabParametr[NieruchomoscDAL::$id_rodz_trans].", ".
                $tabParametr[NieruchomoscDAL::$id_status].", '".$tabParametr[NieruchomoscDAL::$data_otw_zlecenie]."', ".
                $tabParametr[NieruchomoscDAL::$data_zam_zlecenie].", '".$tabParametr[NieruchomoscDAL::$cena]."', ".$prow_proc.", '".
                $tabParametr[NieruchomoscDAL::$prowizja]."', ".$wylacznosc.", ".$pokaz.", ".$tabParametr[NieruchomoscDAL::$id_nier_rodzaj].", ".
                $nier_szczeg.", ".$tabParametr[NieruchomoscDAL::$id_klient].", ".
                $tabParametr[NieruchomoscDAL::$id_region_geog].", '".$tabParametr[NieruchomoscDAL::$ulica]."', '".$tabParametr[NieruchomoscDAL::$ulica_net]."', '".
                $tabParametr[NieruchomoscDAL::$kod]."', ".$tabParametr[NieruchomoscDAL::$agent].", ".$rynek.", null, null);";
            }
            
            $wynik = $this->dal->WprowadzanieDanych($zapytanie);

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
                $tabParametr[NieruchomoscDAL::$id_status].', \''.$tabParametr[NieruchomoscDAL::$cena].'\', '.$tabParametr[NieruchomoscDAL::$pokaz].');';
            }
            else
            {
                $zapytanie = 'select * from DodajTransNierZapotrzebowanie(null, '.$tabParametr[NieruchomoscDAL::$id_zapotrzebowanie_nier_rodzaj].', '.
                $tabParametr[NieruchomoscDAL::$id_rodz_trans].', '.$tabParametr[NieruchomoscDAL::$id_status].', \''.
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
            
            return $wynik;
        }
        public function EdycjaTransNierZapotrzebowanie ($tabParametr)
        {
            $zapytanie = 'select * from EdycjaTransNierZapotrzebowanie('.$tabParametr[NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj].');';
            $wynik = $this->dal->PobierzDane($zapytanie, $iloscWierszy);
            UtilsDAL::KorektaKolBool($wynik, array(NieruchomoscDAL::$pokaz));
            
            return $wynik;
        }
        
        //metoda do szuaknia istniejacego klienta
        public function SzukajKlient($tabParametr)
        {
            $nazwa_firma = 'null';
            $peselnip = 'null';
            if (isset($tabParametr[NieruchomoscDAL::$nazwa_firma]))
            {
                if (strlen($tabParametr[NieruchomoscDAL::$nazwa_firma]) > 0)
                {
                    $nazwa_firma = '\''.$tabParametr[NieruchomoscDAL::$nazwa_firma].'\'';
                }
            }
            if (isset($tabParametr[NieruchomoscDAL::$pesel]))
            {
                if (strlen($tabParametr[NieruchomoscDAL::$pesel]) > 0)
                {
                    $peselnip = '\''.$tabParametr[NieruchomoscDAL::$pesel].'\'';
                }
            }
            $zapytanie = "select * from SzukajKlient(".$tabParametr[NieruchomoscDAL::$id_osobowosc].", ".$nazwa_firma.", ".$peselnip.", '".
            $tabParametr[NieruchomoscDAL::$nazwisko]."');";
            $wynik = $this->dal->PobierzDane($zapytanie, $iloscWierszy);
            
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
        public function KojarzenieBazoweDlaOferty($tabParametr)
        {
            $poziom_par = 'null';
            $poziom_wyp = 'null';
            
            if (isset($tabParametr[NieruchomoscDAL::$poziom_parametry]))
            {
                $poziom_par = $tabParametr[NieruchomoscDAL::$poziom_parametry];
            }
            if (isset($tabParametr[NieruchomoscDAL::$poziom_wyposazenia]))
            {
                $poziom_wyp = $tabParametr[NieruchomoscDAL::$poziom_wyposazenia];
            }
            
            $zapytanie = 'select * from KojarzenieBazoweDlaOferty('.$tabParametr[NieruchomoscDAL::$id_oferta].', '.$poziom_par.', '.$poziom_wyp.');';
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
        public static $nazwisko = 'nazwisko';
        public static $imie = 'imie';
        public static $pesel = 'pesel';
        public static $opis = 'opis';
        public static $wlasciciel = 'wlasciciel';
        public static $oferent = 'oferent';
        public static $cena = 'cena';
        public static $ulica = 'ulica';
        public static $ogladanie_data = 'ogladanie_data';
        public static $godzina = 'godzina';
        public static $minuta = 'minuta';
        public static $id_klient = 'id_klient';
        public static $osoba = 'osoba';
        public static $nr_dowod = 'nr_dowod';
        public static $telefon = 'telefon';
        
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
        public function PodajListaWskOferta($tabParametr, &$ilosc_wierszy)
        {
            $zapytanie = 'select * from PodajListaWskOferta('.$tabParametr[ListaWskazanDAL::$id_oferta].');';
            $wynik = $this->dal->PobierzDane($zapytanie, $ilosc_wierszy);
            UtilsDAL::TabPg2TabPhp($wynik, array(ListaWskazanDAL::$osoba, ListaWskazanDAL::$pesel, ListaWskazanDAL::$telefon, ListaWskazanDAL::$nr_dowod));
            
            return $wynik;
        }
    }
    
    class OsobaDAL
    {
        public static $id = 'id';
        public static $id_osoba = 'id_osoba';
        public static $id_agent = 'id_agent';
        public static $id_klient = 'id_klient';
        public static $id_oferta = 'id_oferta';
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
        
        protected $osoba_id;
        protected $dal;
        
        public function OsobaDAL($id_osoba)
        {
            $this->dal = new dal();
            $this->osoba_id = $id_osoba;
        }
        ///metoda dodaje nowa osobe lub aktualizuje istniejaca
        ///(osoba_id integer, imie_id integer, nazw text, nazw_rod text, pesel_t text, dowod_nr text, region_geog_id integer, agent_id integer, dane_adres text[], klient_id integer)
        public function DodajOsoba($tabParametr)
        {
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
                $telefon = "ARRAY['".$tabParametr[OsobaDAL::$telefon]."', '".$tabParametr[OsobaDAL::$telefon_opis]."']";
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

            $wynik = $this->dal->WprowadzanieDanych($zapytanie, false);
            
            return $wynik;
        }
        
        public function PodajOsobaKlient($klient_id, &$iloscWierszy)
        {
            $zapytanie = 'select * from podajosobaklient('.$klient_id.');';
            $wynik = $this->dal->PobierzDane($zapytanie, $iloscWierszy);
            
            return $wynik;
        }
        
        public function SzukajOsoba($tabParametr)
        {
            $zapytanie = "select * from SzukajOsoba('".$tabParametr[OsobaDAL::$nazwisko]."');";
            $wynik = $this->dal->PobierzDane($zapytanie, $iloscWierszy);
            
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
                $zapytanie = 'select DodajOsobaOferta('.$this->osoba_id.', '.$tabParametr[OsobaDAL::$id_oferta].');';
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
            $tabParametr[OsobaDAL::$nazwa].'\', \''.$tabParametr[OsobaDAL::$opis].'\');';
            
            $wynik = $this->dal->OperacjaLogiczna($zapytanie);
            
            return $wynik;
        }
        public function UsunTelefon($tabParametr)
        {
            $zapytanie = 'select UsunTelefon('.$tabParametr[OsobaDAL::$id].');';
            $wynik = $this->dal->OperacjaLogiczna($zapytanie);
            
            return $wynik;
        }
        public function PodajTelefony(&$ilosc_wierszy)
        {
            $zapytanie = 'select * from PodajTelefony('.$this->osoba_id.');';
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
    }
    class KlientDAL
    {
        public static $id_osobowosc = 'id_osobowosc';
        public static $id_klient = 'id_klient';
        public static $id = 'id';
        public static $nazwa = 'nazwa';
        public static $id_agent = 'id_agent';
        public static $id_region_geog = 'id_region_geog';
        public static $tresc = 'notatka';
        public static $id_notatka = 'id_notatka';
        public static $data = 'data';
        public static $agent = 'agent';
        public static $kod_firma = 'kod';
        public static $ulica_firma = 'ulica'; 
        public static $nr_dom_firma = 'numer_dom';
        public static $nr_mieszkanie_firma = 'numer_miesz';
        public static $nip = 'nip_firma';
        public static $regon = 'regon_firma';
        public static $krs = 'krs_firma';
        public static $nazwa_firma = 'nazwa_firma';
        public static $id_region_geog_firma = 'id_region_geog_firma';
        public static $miejscowosc = 'miejscowosc'; 
        
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
    }
    class SlownikDAL 
    {
        public static $rodzaj_nieruchom = 'nier_rodzaj';
        public static $imie = 'imie';
        public static $osobowosc = 'osobowosc';
        public static $bank = 'bank';
        public static $pomieszczenie = 'pomieszczenie';
        public static $sekcja = 'sekcja';
        public static $status = 'status';
        public static $walidacja = 'walidacja';
        public static $godzina = 'godzina';
        public static $minuta = 'minuta';
        public static $media_reklama = 'media_reklama';
        public static $rodzaj_dowod_tozsamosc = 'rodzaj_dowod_tozsamosc';
        
        //pole dla dala najnizeszej warstwy, odpowiedzialne za komunikacje z baza
        protected static $dal;
        
        public static function PobierzSlownik($slownik)
        {
            SlownikDAL::$dal = new dal();
            $zapytanie = "select * from DaneSlownik ('".$slownik."');";
            $wynik = SlownikDAL::$dal->PobierzDane($zapytanie, $iloscWierszy);
            
            return $wynik;
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
        //metoda pobiera z bazy regiony geograficzne po nazwie
        //potem przemianowac i dorobic metode do dowolnego regionu
        public static function PobierzDowRegionGeog($nazwa)
        {
            SlownikDAL::$dal = new dal();
            
            $zapytanie = 'select * from DowRegionGeograficzny (\''.$nazwa.'\');';
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
        public static function PobierzOsobaKlient($klient_id)
        {
            SlownikDAL::$dal = new dal();
            $zapytanie = 'select * from podajosobaklientzmcena('.$klient_id.');';
            $wynik = SlownikDAL::$dal->PobierzDane($zapytanie, $iloscWierszy);
            
            return $wynik;
        }
    }
?>