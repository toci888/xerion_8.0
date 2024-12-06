<?php
    $path = str_replace($_SERVER['PHP_SELF'], '', $_SERVER['SCRIPT_FILENAME']).'/';
    
    include_once ($path.'ui/kontrolki_html.php');
    include_once ($path.'bll/jezykibll.php');
    include_once ($path.'bll/cache.php');
    include_once ($path.'bll/agentbll.php');
    include_once ($path.'bll/listawskazanbll.php');
    include_once ($path.'dal/queriesDAL.php');
    
    class Akcja
    {
        public static $dodawanie = 'dodawanie ';
        public static $edycja = 'edycja';
        public static $kasowanie = 'kasowanie';
        public static $druk = 'druk';
    }
    ///klasa tablic pop upow do metody statycznej wyswietlania tablicy jednopoziomowej
    class PopUpWysw
    {
        public $nag = array();
        public $przyc_nazwa = array();
        public $url = array();
        public $szerokosc = array();
        public $dlugosc = array();
        ///tablica tablic - dla kazdego elementu tablica z dodatkowymi indexami do getow url
        public $dod_index = null;
    }
    class Links
    {
        public $nag;//naglowek na gridzie
        public $text;//anchor linku
        public $url;//poczatek url, do ktorego beda dodawane kolejne zmienne lub caly url
        public $vars = array(); //zmienne getowskie do parsowania url - nazwy zmiennych
        public $varvalues = array(); //indexy w tablicy danych -> wartosci dla zmiennych z tablicy powyzej
        public $url_var = false; //url variable czyli zmienny - jesli true w polu url siedzi index do tablicy danych do poboru url
        //??? target ?? inne ??
    }
    class ZagnWysw
    {
        public $nag; //naglowek tablicy zagniezdzonych informacji
        public $obj_nazwa; //nazwa obiektu, ktory ma zostac utworzony do wywolania zapytania zagniezdzonego
        public $obj_metoda; //nazwa metrody do wywolania z obiektu
        public $ind_param = array();//indexy parametrow tablicy dla metody
        public $ind_dane = array();//indexy danych do dodania do tablicy parametrow
        public $wysw_info = array();//indexy informacji wyswietlanych, z pobranych
        public $popupobj;//obiekt popup, warunkujacy popupbuttony przy elementach
        public $akcje;//obiekt akcji, poki co nieuzywane
        public $index;//index danychz  pobieranych
        public $nad_index;//index danych nadrzednych
        ///inne wazne elementy :P na ten moment nie wiadomo czy potrzebne i nieznane :P
    }
    
    class UtilsUI
    {
        ///region pola konfiguracji dla wyswietl tablice 1 poz
        public static $strona = 20;
        public static $rekordy = 0;
        public static $grid_un = 'un';   ///co to jest ??
        public static $wiersz_zazn = false;
        ///sortowanie
        protected static $sortowanie = false;
        protected static $formularz = '';
        protected static $przycisk_formularz = '';
        protected static $formularz_hid_kol = '';
        protected static $formularz_hid_kier = '';
        protected static $zaz_w_js = 'onmouseover="setPointer(this, \'over\', \'#DDDDDD\', \'#CCFFCC\', \'#FFCC99\');" onmouseout="setPointer(this, \'out\', \'#DDDDDD\', \'#CCFFCC\', \'#FFCC99\');" onmousedown="setPointer(this, \'click\', \'#DDDDDD\', \'#CCFFCC\', \'#FFCC99\');"';
        //tablica tablic poindexowanych wartosciami dla indexu glownego budowanego grida, elementy do zabarwienia na inny kolor w celu wyszczegolnienia; tablic moze byc duzo, sa one zestawami id rekordow wg 
        //glownego indexu
        ///2 zastosowanie wraz z indexem wyroznien jest zastosowanie dla barwienia wg innego indexu niz glowny; wtedy index ten jest podany
        protected static $tabWyroznien;
        protected static $indWyroznien = null;
        //tablica kolorow dla poszczegolnych wyroznien
        protected static $tabKolorWyr;
        ///koniec pol konfiguracji dla wyswietl tablice 1 poz
        protected static $naglowekUmowy = '<table border="0" width="100%"><tr><td><img src="../../zdj/logo_l.jpg"  width=181 border=0></img>        
                    </td><td align="right"><table border="0"><tr>
                    <td align="right" colspan="3" style="font-size: 13px;"><b>BIURO NIERUCHOMOŚCI A.Z.GWARANCJA<br />Andrzej Zapart Lic.zaw.Nr.3125<br />e-mail: azgwarancja@azg.pl, www.azg.pl</b></td>
                    </tr><tr><td align="right" style="font-size: 12px;"><b><u>Filia Nr 1:</u><br />ul. Bytnara Rudego 13,<br />45-265 Opole<br />tel./fax.(077)458-00-94</b></td>
                    <td width="1%" height="100%"><IMG height="100%" src="../../zdj/black.gif" width="1" border="0"></img></td>
                    <td align="right" style="font-size: 12px;"><b><u>Siedziba Główna:</u><br />ul. Szarych Szeregów 34d,<br>45-285 Opole<br />tel./fax.(077)403-12-38</b></td>
                    </tr></table></td></tr></table>';          
                    ///pomyslec o tlumaczeniu naglowka
        public static function PodajNaglowekUmowy()
        {
            echo UtilsUI::$naglowekUmowy;
        }
        
        ///metody dla elementow dla wyswtab1poz
        public static function PodajIndWyroznien($index)
        {
            UtilsUI::$indWyroznien = $index;
        }
        //zabawka jest troche do bani: jesli uzywam innego niz glowny indexu wyroznien nie podaje tablicy tylko poszczegolne elementy - sa one pakowane w tablice
        //jesli jednak podaje elementy do wyroznienia wzgledem indexu glownego, to ten index jest unikatowy dla kazdego wiersza(powinien byc), w zwiazku z czym jest to tablica wielu indexow do wyroznienia
        //dlatego tez wtedy podaje tablice w postaci index => index lub index => cokolwiek do wyroznien. wlasciwie jest to logiczne, ale latwo zapomniec co podawac do tych parametrow
        public static function DodajTabWyroznien($tablica, $kolorWyr)
        {
            $index = count(UtilsUI::$tabWyroznien);
            UtilsUI::$tabWyroznien[$index] = $tablica;
            UtilsUI::$tabKolorWyr[$index] = $kolorWyr;
        }
        public static function DodajSortowanie ($formularz, $przycisk_formularz, $hid_kol, $hid_kier)
        {
            UtilsUI::$sortowanie = true;
            UtilsUI::$formularz = $formularz;
            UtilsUI::$przycisk_formularz = $przycisk_formularz;
            UtilsUI::$formularz_hid_kol = $hid_kol;
            UtilsUI::$formularz_hid_kier = $hid_kier;
        }
        public static function UsunSortowanie ()
        {
            UtilsUI::$sortowanie = false;
        }
        
        //metoda dodaje wszystkie sekcje formularza
        public static function DodajSekcja($paramNier, $id_of_zap, $CzyNier = true, $extra_id = null)
        {
            $path = str_replace($_SERVER['PHP_SELF'], '', $_SERVER['SCRIPT_FILENAME']).'/';
            require($path.'conf.php');
            
            $tlumaczenia = cachejezyki::Czytaj();
            //wczytanie wszystkich sekcji dla danej nieruchomosci
            $sekcje = $paramNier->PodajSekcje();
            if ($CzyNier)
            {
                $pomieszczenia = $paramNier->PodajPom();
                $popuphref = "popup/sekcjeoferta";
                $id_un_zm = NieruchomoscDAL::$id_oferta;
                $id_un = $id_of_zap;
                //$id_un = $_SESSION[NieruchomoscDAL::$id_oferta];
            }
            else
            {
                $pomieszczenia = null;
                $popuphref = "sekcjezapotrzebowanie";
                $id_un_zm = NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj; ////BYK !!!!!
                $id_un = $id_of_zap;
                //$id_un = $_SESSION[NieruchomoscDAL::$id_zapotrzebowanie];
            }
            KontrolkiHtml::DodajHidden('sekcja_id', 'sekcja_id', '');
            
            $kolWyp = $paramNier->KolekcjaWyposazen();
            if ($CzyNier)
            {
                $kolPar = $paramNier->KolekcjaParametrow();
            }
            else
            {
                $kolPar = $paramNier->KolekcjaParametrowMin();
                $kolParMax = $paramNier->KolekcjaParametrowMax();
            }
            $test = 0;
            $klucz_pierwszy = '';
            echo '<table ><tr>';
            foreach ($sekcje as $klucz => $wartosc)
            {
                if ($test == 0)
                {
                    $klucz_pierwszy = $klucz;
                }
                $test++;
                echo '<td id="str_element'.$klucz.'" class="wlk_litery" style="cursor: pointer;" onclick="PokazStrone(this, \'strona_grid\', \'strona_grid_wid\', \'str_element\', '.$klucz.');"> '.$wartosc.'&nbsp;&nbsp;&nbsp; </td>';  //ustalic co to licz lub napisac podobny js
            }
            echo '</tr></table>';
            
            //przechodzenie po kolejnych sekcjach

            KontrolkiHtml::DodajHidden('strona_grid_wid', 'strona_grid_wid', $klucz_pierwszy);
            $wyswietl = '';
            foreach ($sekcje as $klucz => $wartosc)
            {                
                ///echo '<br /><hr />'.$wartosc.'<br />';
                echo '<div id="strona_grid'.$klucz.'" style="'.$wyswietl.'">';
                $wyswietl = "display: none;";//display: none;
                echo $wartosc.'<br />';
                
                //jesli istnieje kolekcja wyposazen dla danej sekcji
                if(isset($kolWyp[$klucz]))
                {
                    //doklepac do url id of lub zap
                    ///proba wciecia elementow z popupu do frame w tym samym oknie
                    //// width="550" height="200" scrolling="no" 

                    //echo '<frameset><frame name="test'.$klucz.'" src="'.$popuphref.'.php?sekcja='.$klucz.'&'.$id_un_zm.'='.$id_un.'" /></frameset>'; // frameborder="0" marginheight="0" marginwidth="0" style="height: auto;" width="98%" 
                    
                    //to wlasciwie ok
                    echo '<iframe frameborder="0" marginheight="0" marginwidth="0" width="98%" id="ramkatest'.$klucz.'" name="ramkatest'.$klucz.'" src="'.$popuphref.'.php?sekcja='.$klucz.'&'.$id_un_zm.'='.$id_un.'" ></iframe>'; 
                    
                    
                    // frameborder="0" marginheight="0" marginwidth="0" style="height: auto;" width="98%" 
                    //echo '<object frameborder="0" marginheight="0" marginwidth="0" width="98%" name="test'.$klucz.'" src="'.$popuphref.'.php?sekcja='.$klucz.'&'.$id_un_zm.'='.$id_un.'" ></object>'; // frameborder="0" marginheight="0" marginwidth="0" style="height: auto;" width="98%" 

                    
                    //KontrolkiHtml::DodajPopUpButton($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wybierz), 'sekcja'.$klucz, $popuphref.'.php?sekcja='.$klucz.'&'.$id_un_zm.'='.$id_un, 600, 600);
                }
                //sprawdzenie czy istnieja parametry dla nieruchomosci
                if(isset($kolPar[$klucz]))
                {
                    //wczytanie kolekcji
                    $kol = $kolPar[$klucz]->PodajKolekcje();  //parametry nieruchomosci
                    if (!$CzyNier)
                    {
                        $kolMax = $kolParMax[$klucz]->PodajKolekcje();
                    }
                    
                    echo '<table>'; 
                    $i = 1;
                    //podanie textboxow parametrow nieruchomosci
                    foreach($kol as $kluczLok => $wartLok)
                    {
                            if($i % 2 == 1)
                            {
                                echo '<tr>';
                            }
                            echo '<td>'.$wartLok->nazwa.'</td><td>';
                            //dodanie textboxa z walidacja podawana z bazy danych
                            KontrolkiHtml::DodajTextboxWalBaza($wartLok->tag, $wartLok->id, $wartLok->wartosc, $wartLok->dl_inf, $wartLok->dl_inf, $wartLok->walidacja);
                            echo '</td>';
                            if (!$CzyNier)
                            {
                                echo '<td>';
                                KontrolkiHtml::DodajTextboxWalBaza($kolMax[$kluczLok]->tag.'max', $kolMax[$kluczLok]->id.'max', $kolMax[$kluczLok]->wartosc, $kolMax[$kluczLok]->dl_inf, $kolMax[$kluczLok]->dl_inf, $kolMax[$kluczLok]->walidacja);
                                echo '</td>';
                            }
                            
                            if($i % 2 == 0)
                            {
                                echo '</tr>';
                            }
                            $i++;
                    }
                    
                    echo '</table>';
                }
                echo '</div>';
            }
            if (is_array($pomieszczenia))
            {
                $i = 1;
                echo '<hr />'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$pomieszczenia).'<br /><table>';
                foreach ($pomieszczenia as $klucz => $wartosc)
                {
                    if($i % 6 == 1)
                    {
                        echo '<tr>';
                    }
                    echo '<td>';
                    
                    $openSite = 'popup/pomieszczenia.php?'.WyposazenieNierDAL::$id_pomieszczenie.'='.$klucz.'&'.WyposazenieNierDAL::$nazwa_pomieszczenie.'='.$wartosc.'&'.$id_un_zm.'='.$id_un;
                    if ($extra_id != null)
                    {
                        foreach ($extra_id as $ind_id => $wart_id)
                        {
                            $openSite .= '&'.$ind_id.'='.$wart_id;
                        }
                    }
                    
                    KontrolkiHtml::DodajPopUpButton($wartosc, 'pomieszczenie'.$klucz, $openSite, 600, 600);
                    echo '</td>';
                    if($i % 6 == 0)
                    {
                        echo '</tr>';
                    }
                    $i++;
                }
                echo '</table>';
            }
        }
        //kapitalizacja samego poczatku zdania - uzywac zadko lub wcale
        public static function ZamianaLitery ($text)
        {
            $text = ucfirst (strtolower($text));
            return $text;
        }
        ///konieczny parametr akcje, mowiacy ktore akcje w tabeli chcemy widziec
        //metoda moze byc uzywana w wielu roznych kontekstach, wiec w zaleznosci od tego, w jakim celu tablica jest wyswietlana, rozne akcje 
        //moga byc tam prezentowane (rozne przyciski sie pojawia)
        //oczywiscie obsluga zdarzenia bedzie indywidualna w poszczegolnym skrypcie                             //tablica indywidualnych naglowkow akcji
                                                                                                                                //tablica: atrybut name => wartosc na przycisku //typu Links[] te $links ponizej
        //PopUpWysw //ZagnWysw
        public static function WyswietlTab1Poz ($wynik, $WyswKolumny, $naglowki, $index, $HiddenNazwa, $akcje, $nagIndAk = null, $przycIndAk = null, $popup = null, $links = null, $zagn = null, $dod_hid_id = null) //zalozenie ze jest mozliwe jedno zagniezdzenie, jak nad tyym zapanujer moze byc tablica
        {
            $tlumaczenia = cachejezyki::Czytaj();
            $path = str_replace($_SERVER['PHP_SELF'], '', $_SERVER['SCRIPT_FILENAME']).'/';
            require ($path.'conf.php');
            $ilosc = count($wynik);
            $licz = 1;
            echo '<table><tr>';//<td onclick="PokazStrone(\'strona_grid\', \'strona_grid_wid\', 1);">1</td>'; // align="center"
            if ($ilosc > 0)
            {
                if (UtilsUI::$rekordy > 0)
                {
                    echo '<td>'.$tlumaczenia->Tlumacz ($_SESSION[$jezyk], tags::$znaleziono_rekordow).' : '.UtilsUI::$rekordy.'.</td>';
                    UtilsUI::$rekordy = 0;
                }
                
                echo '<td>'.$tlumaczenia->Tlumacz ($_SESSION[$jezyk], tags::$podstrony).' : </td>';
            
                while ($ilosc > 0)
                {
                    echo '<td id="str_element'.$HiddenNazwa.UtilsUI::$grid_un.$licz.'" style="cursor: pointer;" onclick="PokazStrone(this, \'strona_grid'.$HiddenNazwa.UtilsUI::$grid_un.'\', \'strona_grid_wid'.
                    $HiddenNazwa.UtilsUI::$grid_un.'\', \'str_element'.$HiddenNazwa.UtilsUI::$grid_un.'\', '.$licz.');"> '.$licz.' </td>';
                    $licz++;
                    $ilosc -= UtilsUI::$strona;
                }
            }
            echo '</tr></table>';
            //session_start();
            
            $uprawnienia = unserialize($_SESSION[$zalogowany]);
            $i = 0;
            $licz = 1;
            KontrolkiHtml::DodajHidden($HiddenNazwa, $HiddenNazwa, '');
            
            if ($dod_hid_id != null)
            {
                foreach ($dod_hid_id as $klucz => $wartosc)
                {
                    KontrolkiHtml::DodajHidden($klucz, $klucz, '');
                }
            }
            KontrolkiHtml::DodajHidden('strona_grid_wid'.$HiddenNazwa.UtilsUI::$grid_un, 'strona_grid_wid'.$HiddenNazwa.UtilsUI::$grid_un, 1);
            
            $wyswietl = "";
            //while(isset($wynik[$i]))
            if (is_array($wynik))
            foreach ($wynik as $wiersz)
            {
                $oncl_dod_hid = '';
                
                if ($dod_hid_id != null)
                {                     //klucz - nazwa hiddena, wartosc - index danej
                    foreach ($dod_hid_id as $klucz => $wartosc)
                    {
                        $oncl_dod_hid .= $klucz.'.value = '.$wiersz[$wartosc].';';
                    }
                }

                ///przyciskow nie sortujemy :D
                if ($i % UtilsUI::$strona == 0)
                {
                    //echo $wyswietl;
                    //".$wyswietl." position: absolute;
                    echo '<div id="strona_grid'.$HiddenNazwa.UtilsUI::$grid_un.$licz.'" style="'.$wyswietl.'"><table border="1" rules="all" class="tableBorder" bgcolor="#66CCFF"><tr bgcolor="#0099CC" valign="center">';
                    $wyswietl = "display: none;";
                    $licz++;
                    //sprawdzenie czy w parametrze akcja jest ustawione rządanie wyswietlenia przycisku dodaj
                    if (isset($akcje[Akcja::$dodawanie]))
                    {
                        //sprawdzenie czy agent ma uprawnienie dodawanie 
                        if ($uprawnienia->dodawanie == true)
                        {
                            echo '<td><b>';
                            echo $tlumaczenia->Tlumacz ($_SESSION[$jezyk], tags::$dodaj);
                            echo '</b></td>';
                        }
                    }
                    //sprawdzenie czy w parametrze akcja jest ustawione rządanie wyswietlenia przycisku edycja
                    if (isset($akcje[Akcja::$edycja]))
                    {
                        //sprawdzenie czy agent ma uprawnienie edycja 
                        if ($uprawnienia->edycja == true)
                        {
                            echo '<td><b>';
                            echo $tlumaczenia->Tlumacz ($_SESSION[$jezyk], tags::$edytuj);
                            echo '</b></td>';
                        }
                    }
                    //sprawdzenie czy w parametrze akcja jest ustawione rządanie wyswietlenia przycisku kasuj
                    if (isset($akcje[Akcja::$kasowanie]))
                    {
                        //sprawdzenie czy agent ma uprawnienie kasowanie 
                        if ($uprawnienia->kasowanie == true)
                        {
                            echo '<td><b>';
                            echo $tlumaczenia->Tlumacz ($_SESSION[$jezyk], tags::$kasuj);
                            echo '</b></td>';
                        }
                    }
                    //dodane 6.03
                    if (is_array($nagIndAk))// != null)
                    {
                        foreach ($nagIndAk as $wartosc)
                        {
                            echo '<td><b>';
                            echo $tlumaczenia->Tlumacz ($_SESSION[$jezyk], $wartosc);
                            echo '</b></td>';
                        }
                    }
                    if ($popup != null)
                    {
                        foreach ($popup->nag as $wartosc)
                        {
                            echo '<td><b>';
                            echo $tlumaczenia->Tlumacz ($_SESSION[$jezyk], $wartosc);
                            echo '</b></td>';
                        }
                    }
                    if ($links != null)
                    {
                        foreach ($links as $wartosc)
                        {
                            echo '<td><b>';
                            echo $tlumaczenia->Tlumacz ($_SESSION[$jezyk], $wartosc->nag);
                            echo '</b></td>';
                        }
                    }
                    if (UtilsUI::$wiersz_zazn == true)
                    {
                        echo '<td></td>';
                    }
                    if ($zagn != null)
                    {
                        echo '<td><b>';
                        echo $tlumaczenia->Tlumacz ($_SESSION[$jezyk], $zagn->nag);
                        echo '</b></td>';
                    }
                    $k = 0;
                    while (isset($naglowki[$k]))
                    {
                        echo '<td nowrap align="center"><b>';
                        //if od sortowania dla dodania w naglowkach submitow z sortem
                        //'sort_kier'.$HiddenNazwa
                        if (UtilsUI::$sortowanie)
                        {
                            //nazwe formularza mozna wykorzystac do dobrania sie do przyciskow bez getelementbyid: document.form.nazwa_el.value
                            //to sie moze przydac przy pominieciu konfliktu jesli id sie powiela; przy przycisku jest to wykorzystane
                            echo '<img width="15" height="15" style="cursor: pointer;" class="przezrocze" src="../zdj/strzalka_dol.gif" onclick="document.getElementById(\''.UtilsUI::$formularz_hid_kier.'\').value=1; document.getElementById(\''.UtilsUI::$formularz_hid_kol.'\').value=\''.
                            $WyswKolumny[$k].'\';document.'.UtilsUI::$formularz.'.'.UtilsUI::$przycisk_formularz.'.click();"></img>&nbsp;';
                        }
                        echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], $naglowki[$k]);
                        if (UtilsUI::$sortowanie)
                        {
                            echo '&nbsp;<img width="15" height="15" style="cursor: pointer;" class="przezrocze" src="../zdj/strzalka_gora.gif" onclick="document.getElementById(\''.UtilsUI::$formularz_hid_kier.'\').value=0; document.getElementById(\''.UtilsUI::$formularz_hid_kol.'\').value=\''.
                            $WyswKolumny[$k].'\';document.'.UtilsUI::$formularz.'.'.UtilsUI::$przycisk_formularz.'.click();"></img>';
                                                                                                                        //sort rosnacy - 1
                            //KontrolkiHtml::DodajSubmit('sortuj', 'id_sortuj', '!^', 'onclick="sort_kier'.$HiddenNazwa.'.value=1; sort_kol'.$HiddenNazwa.'.value=\''.$WyswKolumny[$k].'\';"');
                                                                                                                      //sort malejacy - 0
                            //KontrolkiHtml::DodajSubmit('sortuj', 'id_sortuj', '^', 'onclick="sort_kier'.$HiddenNazwa.'.value=0; sort_kol'.$HiddenNazwa.'.value=\''.$WyswKolumny[$k].'\';"');
                        }
                        echo '</b></td>';
                        $k++;
                    }
                    echo '</tr>';
                }
                //$wiersz = $wynik[$i];
                //tu sprawdzenie unikatowego indexu i kolorowanie :) lub nie
                $kolor = '#66CCFF';   //bgcolor="#66CCFF"
                if (is_array(UtilsUI::$tabWyroznien))
                {
                    if(UtilsUI::$indWyroznien == null)
                    {
                        foreach (UtilsUI::$tabWyroznien as $klucz => $wartosc)
                        {
                            if (isset($wartosc[$wiersz[$index]]))
                            {
                                $kolor = UtilsUI::$tabKolorWyr[$klucz];
                            }
                        }
                    }
                    else
                    {
                        //pod index obcy niz glowny
                        foreach (UtilsUI::$tabWyroznien as $klucz => $wartosc)
                        {
                            if ($wiersz[UtilsUI::$indWyroznien] == $wartosc)
                            {
                                $kolor = UtilsUI::$tabKolorWyr[$klucz];
                            }
                        }
                    }
                }
                $js_zaz = '';
                if (UtilsUI::$wiersz_zazn == true)
                {
                    $js_zaz = UtilsUI::$zaz_w_js;
                }
                echo '<tr bgcolor="'.$kolor.'" '.$js_zaz.'>';
                //sprawdzenie czy w parametrze akcja jest ustawione rządanie wyswietlenia przycisku dodaj
                if (isset($akcje[Akcja::$dodawanie]))
                {
                    //sprowdzenie czy agent ma uprawnienie dodawanie
                    if ($uprawnienia->dodawanie == true)
                    {
                        echo '<td bgcolor="'.$kolor.'">';
                        //do utila
                        KontrolkiHtml::DodajSubmit('dodaj', $wiersz[$index], $tlumaczenia->Tlumacz ($_SESSION[$jezyk], tags::$dodaj).'.', 'onclick="'.$HiddenNazwa.'.value = this.id;'.$oncl_dod_hid.'"');
                        echo '</td>';
                    }
                }
                //sprawdzenie czy w parametrze akcja jest ustawione rządanie wyswietlenia przycisku edycja
                if (isset($akcje[Akcja::$edycja]))
                {
                    //sprawdzenie czy agent ma uprawnienie edycja
                    if ($uprawnienia->edycja == true)
                    {
                        echo '<td bgcolor="'.$kolor.'">';
                        KontrolkiHtml::DodajSubmit('edycja', $wiersz[$index], $tlumaczenia->Tlumacz ($_SESSION[$jezyk], tags::$edytuj).'.', 'onclick="'.$HiddenNazwa.'.value = this.id;'.$oncl_dod_hid.'"');
                        echo '</td>';
                    }
                }
                //sprawdzenie czy w parametrze akcja jest ustawione rządanie wyswietlenia przycisku kasuj
                if (isset($akcje[Akcja::$kasowanie]))
                {
                    //sprawdzenie czy agent ma uprawnienie kasuj
                    if ($uprawnienia->kasowanie == true)
                    {
                        echo '<td bgcolor="'.$kolor.'">';
                        KontrolkiHtml::DodajSubmit('kasowanie', $wiersz[$index], $tlumaczenia->Tlumacz ($_SESSION[$jezyk], tags::$kasuj).'.', 'onclick="'.$HiddenNazwa.'.value = this.id;'.$oncl_dod_hid.' return confirm(\''.$tlumaczenia->Tlumacz ($_SESSION[$jezyk], tags::$czy_jestes_pewien).'?\');"');
                        echo '</td>';
                    }
                }
                ///dodane 6.03
                if (is_array($przycIndAk))
                {
                    foreach ($przycIndAk as $klucz => $wartosc)
                    {
                        $kasuj_potw_js = '';
                        if ($klucz == Akcja::$kasowanie)
                        {
                            $kasuj_potw_js = 'return confirm(\''.$tlumaczenia->Tlumacz ($_SESSION[$jezyk], tags::$czy_jestes_pewien).'?\');';
                        }
                        echo '<td bgcolor="'.$kolor.'">';
                        KontrolkiHtml::DodajSubmit($klucz, $wiersz[$index], $tlumaczenia->Tlumacz ($_SESSION[$jezyk], $wartosc).'.', 'onclick="'.$HiddenNazwa.'.value = this.id;'.$oncl_dod_hid.$kasuj_potw_js.'"');
                        echo '</td>';
                    }
                }
                if ($popup != null)
                {
                    foreach ($popup->przyc_nazwa as $klucz => $wartosc)
                    {
                        $url_button = $popup->url[$klucz].'='.$wiersz[$index];
                        if ($popup->dod_index != null)
                        {
                            foreach ($popup->dod_index[$klucz] as $ind_get => $ind_wiersz)
                            {
                                $url_button .= '&'.$ind_get.'='.$wiersz[$ind_wiersz];
                            }
                        }
                        echo '<td bgcolor="'.$kolor.'">';
                        KontrolkiHtml::DodajPopUpButton($tlumaczenia->Tlumacz ($_SESSION[$jezyk], $wartosc).'.', $wartosc, $url_button, $popup->szerokosc[$klucz], $popup->dlugosc[$klucz]);
                        echo '</td>';
                    }
                }
                if ($links != null)
                {
                    foreach ($links as $klucz => $wartosc)
                    {
                        echo '<td bgcolor="'.$kolor.'">';
                        //jesli true url pobierany z tablicy danych - z $wiersz
                        if ($wartosc->url_var)
                        {
                            $url = $wiersz[$wartosc->url];
                        }
                        else
                        {
                            $url = $wartosc->url;
                        }
                        $licz_var = 0;
                        if (is_array($wartosc->vars))
                        foreach ($wartosc->vars as $ind_var => $var)
                        {
                            if ($licz_var > 0)
                            {
                                $url .= '&';
                            }
                            $url .= $var.'='.$wiersz[$wartosc->varvalues[$ind_var]];
                            $licz_var++;
                        }
                        echo '<a href="'.$url.'" target="_blank">'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], $wartosc->text).'</a>';
                        echo '</td>';
                    }
                }
                ///ptaszki :)
                if (UtilsUI::$wiersz_zazn == true)
                {
                    echo '<td>';
                    KontrolkiHtml::DodajCheckbox('zaznaczone_wiersze[]', 'id_check_wiersze', false, '', '');
                    echo '</td>';
                }
                //koniec dodane 6.03
                //obsluga zagniezdzenia : obiekt, jesli zostanie podany, wymusza request do bazy na zasadzie wykorzystania metody okreslonego obiektu, co jest skonfigurowane w polach obiektu zagnwysw
                //obsluga przewiduje utworzenie obiektu, pobranie danych oraz ich prezentacje, poki co sa zaimplementowane jedynie akcje popup, zadnych innych, inne moga byc problemem do kwadratu
                if ($zagn != null)
                {
                    echo '<td bgcolor="'.$kolor.'">';
                    //utworzenie obiektu typu pochodzacego ze zmiennej :D
                    $obj = new $zagn->obj_nazwa();
                    
                    foreach ($zagn->ind_param as $klucz => $wartosc)
                    {
                        //konstruowanie tablicy parametrow dla dala :P
                        //ind_param to index informacji w metodzie dalowskiej, ind dane to index danej w danym zasobie z bazy
                        $tabParametr[$wartosc] = $wiersz[$zagn->ind_dane[$klucz]];
                    }
                    $metoda = $zagn->obj_metoda;
                    $dane_zagn = $obj->$metoda($tabParametr, $il_wiersz);
                    
                    echo '<table border="1" rules="all" class="tableBorder">';
                    
                    foreach ($dane_zagn as $dana_z)
                    {
                        echo '<tr>';
                        if ($zagn->popupobj != null)
                        {
                            foreach ($zagn->popupobj->przyc_nazwa as $klucz => $wartosc)
                            {
                                $url_popup = $zagn->popupobj->url[$klucz].'='.$dana_z[$zagn->index];
                                $url_popup = str_replace($zagn->nad_index, $wiersz[$index], $url_popup); //troche nie wiem po co ta linijka ....
                                if ($zagn->popupobj->dod_index != null)
                                {
                                    foreach ($zagn->popupobj->dod_index[$klucz] as $ind_get => $ind_wiersz)
                                    {
                                        $url_popup .= '&'.$ind_get.'='.$wiersz[$ind_wiersz];
                                    }
                                }
                                echo '<td>';
                                KontrolkiHtml::DodajPopUpButton($tlumaczenia->Tlumacz ($_SESSION[$jezyk], $wartosc).'.', $wartosc, $url_popup, $zagn->popupobj->szerokosc[$klucz], $zagn->popupobj->dlugosc[$klucz]);
                                echo '</td>';
                            }
                        }
                        foreach ($zagn->wysw_info as $kol)
                        {
                            echo '<td>';
                            echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], $dana_z[$kol]);
                            echo '</td>';
                        }
                        echo '</tr>';
                    }
                    
                    echo '</table>';
                    echo '</td>';
                }
                $j = 0;
                $break = '<br />';
                $sep = ', ';
                while (isset($WyswKolumny[$j]))
                {
                    echo '<td>';
                    if (!is_array($wiersz[$WyswKolumny[$j]]))
                    {
                        echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], $wiersz[$WyswKolumny[$j]]);
                    }
                    else
                    { 
                        
                            foreach ($wiersz[$WyswKolumny[$j]] as $row)
                            {
                                $res = '';
                                if (is_array($row))
                                {
                                    foreach ($row as $kolKl => $kolEl)
                                    {
                                        if (!strchr($kolKl, 'id'))
                                        {
                                            if (strlen($res) > 0)
                                            {
                                                $res .= $sep;
                                            }
                                            $res .= $tlumaczenia->Tlumacz($_SESSION[$jezyk], $kolEl);
                                        }
                                    }
                                    echo $res.$break;
                                }
                                else
                                {
                                    echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], $row).$break;
                                }
                            }
                    }
                    echo '</td>';
                    $j++;
                }
                echo '</tr>';
                $i++;
                //to dziala na gorze i na dole na 0, gdyz ten if jest po inkrementacji :D
                if ($i % UtilsUI::$strona == 0)// || (!isset($wynik[$i])))
                {
                    echo '</table></div>';
                }
            }
            //modyfikacja 8.05 - sprawdzic jeszcze czy na pewno dziala
            if ($i % UtilsUI::$strona != 0)// || (!isset($wynik[$i])))
            {
                echo '</table></div>';
            }
            UtilsUI::$indWyroznien = null;
            UtilsUI::$tabWyroznien = null;
            UtilsUI::$tabKolorWyr = null;
        }
        //metoda przeznaczona dla tablic, gdzie w poszczegolnych indexach textowych znajduje sie tablica
        //z bazy danych z reguly przychodzi duza tablica z wierszami i kolumnami - dla nich zaprojektowano metode powyzej
        //niniejsza metoda zajmuje sie przypadkami, kiedy z bazy w danych kolumnach wierszy znajduja sie nie pojedyncze informacje (jak standardowo)
        //, ale tablice, w ktorych tych informacji moze byc dowolnie duzo
        
        ///konieczny parametr akcje, mowiacy ktore akcje w tabeli chcemy widziec
        //metoda moze byc uzywana w wielu roznych kontekstach, wiec w zaleznosci o dtego, w jakim celu tablica jest wyswietlana, rozne akcje 
        //moga byc tam prezentowane (rozne przyciski sie pojawia)
        //oczywiscie obsluga zdarzenia bedzie indywidualna w poszczegolnym skrypcie
        public static function WyswietlTablicaTablic ($wynik,$WyswKolumny, $naglowki, $index, $HiddenNazwa, $akcje)
        {
            $path = str_replace($_SERVER['PHP_SELF'], '', $_SERVER['SCRIPT_FILENAME']).'/';
            require ($path.'conf.php');
            //session_start();
            $tlumaczenia = cachejezyki::Czytaj();
            $uprawnienia = unserialize($_SESSION[$zalogowany]);
            $i = 0;
            KontrolkiHtml::DodajHidden($HiddenNazwa, $HiddenNazwa, '');
            echo '<table border = "1">';
            echo '<tr>';
            //sprawdzenie czy w parametrze akcja jest ustawione rządanie wyswietlenia przycisku dodaj
            if (isset($akcje[Akcja::$dodawanie]))
            {
                //sprawdzenie czy agent ma uprawnienie dodaj 
                if ($uprawnienia->dodawanie == true)
                {
                    echo '<td>';
                    echo $tlumaczenia->Tlumacz ($_SESSION[$jezyk], tags::$dodaj);
                    echo '</td>';
                }
            }
            //sprawdzenie czy w parametrze akcja jest ustawione rządanie wyswietlenia przycisku edycja 
            if (isset($akcje[Akcja::$edycja]))
            {
                //sprawdzenie czy agent ma uprawnienie edycja 
                if ($uprawnienia->edycja == true)
                {
                    echo '<td>';
                    echo $tlumaczenia->Tlumacz ($_SESSION[$jezyk], tags::$edytuj);
                    echo '</td>';
                }
            }
            //sprawdzenie czy w parametrze akcja jest ustawione rządanie wyswietlenia przycisku kasuj 
            if (isset($akcje[Akcja::$kasowanie]))
            {
                //sprawdzenie czy agent ma uprawnienie kasuj
                if ($uprawnienia->kasowanie == true)
                {
                    echo '<td>';
                    echo $tlumaczenia->Tlumacz ($_SESSION[$jezyk], tags::$kasuj);
                    echo '</td>';
                }
            }
            $k = 0;
            while (isset($naglowki[$k]))
            {
                echo '<td>';
                echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], $naglowki[$k]);
                echo '</td>';
                $k++;
            }
            echo '</tr>';
            while(isset($wynik[$WyswKolumny[0]][$i]))
            {
                //$wiersz = $wynik[$i];
                echo '<tr>';
                //sprawdzenie czy w parametrze akcja jest ustawione rządanie wyswietlenia przycisku dodawanie 
                if (isset($akcje[Akcja::$dodawanie]))
                {
                    //sprawdzenie czy agent ma uprawnienie dodawanie
                    if ($uprawnienia->dodawanie == true)
                    {
                        echo '<td>';
                        KontrolkiHtml::DodajSubmit('dodaj', $wynik[$index][$i], $tlumaczenia->Tlumacz ($_SESSION[$jezyk], tags::$dodaj).'.', 'onclick="'.$HiddenNazwa.'.value = this.id;"');
                        echo '</td>';
                    } 
                }
                //sprawdzenie czy w parametrze akcja jest ustawione rządanie wyswietlenia przycisku edycja
                if (isset($akcje[Akcja::$edycja]))
                {
                    //sprawdzenie czy agent ma uprawnienie edycja
                    if ($uprawnienia->edycja == true)
                    {
                        echo '<td>';
                        KontrolkiHtml::DodajSubmit('edycja', $wynik[$index][$i], $tlumaczenia->Tlumacz ($_SESSION[$jezyk], tags::$edytuj).'.', 'onclick="'.$HiddenNazwa.'.value = this.id;"');
                        echo '</td>';
                    } 
                }
                //sprawdzenie czy w parametrze akcja jest ustawione rządanie wyswietlenia przycisku kasowanie
                if (isset($akcje[Akcja::$kasowanie]))
                {
                    //sprawdzenie czy agent ma uprawnienie kasuj
                    if ($uprawnienia->kasowanie == true)
                    {
                        echo '<td>';
                        KontrolkiHtml::DodajSubmit('kasowanie', $wynik[$index][$i], $tlumaczenia->Tlumacz ($_SESSION[$jezyk], tags::$kasuj).'.', 'onclick="'.$HiddenNazwa.'.value = this.id;"');
                        echo '</td>';
                    }
                }
                $j = 0;
                while (isset($WyswKolumny[$j]))
                {
                    echo '<td>';
                    echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], $wynik[$WyswKolumny[$j]][$i]);
                    echo '</td>';
                    $j++;
                }
                echo '</tr>';
                $i++;
            }
            echo '</table>';
        }
        protected static function TabelaListaWskazan ($wynik, $kolumny, $zlaczenia, $naglowki, $lista_ogl)
        {
            $tlumaczenia = cachejezyki::Czytaj();
            $path = str_replace($_SERVER['PHP_SELF'], '', $_SERVER['SCRIPT_FILENAME']).'/';
            require ($path.'conf.php');
        
            $k = 0;
            echo '<table border="1" width="99%"><tr>';
            while (isset($naglowki[$k]))
            {
                echo '<td align="center" style="font-size: 12px;"><b>';
                echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], $naglowki[$k]);
                echo '</b></td>';
                $k++;
            }
            echo '</tr>';
            $i = 0;    
            while(isset($wynik[$i]))
            {
                $wiersz = $wynik[$i];
                //koniec dodane 6.03
                $j = 0;
                $break = '<br />';
                $sep = ', ';
                //while (isset($WyswKolumny[$j]))
                echo '<tr>';
                foreach ($kolumny as $kolumna)
                {
                    $wartosc = $wiersz[$kolumna];
                    if (isset($zlaczenia[$kolumna]))
                    {
                        $wartosc .= '<br />'.$wiersz[$zlaczenia[$kolumna]];
                    }
                    ///hepsko mega na sztywno zasadzone ze tu jest ta szpara na podpis klienta
                    if (!$lista_ogl) ///ten if szpare uwala jak jest lista ogladajacych bo wtedy jest niepotrzebna
                    if ($j == 1)
                    {
                        echo '<td>&nbsp;</td>';
                        $j++;
                    }
                    echo '<td style="font-size: 12px;">';
                    if (!is_array($wartosc))
                    {
                        echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], $wartosc);
                    }
                    else
                    { 
                        
                            foreach ($wartosc as $row)
                            {
                                $res = '';
                                if (is_array($row))
                                {
                                    foreach ($row as $kolKl => $kolEl)
                                    {
                                        ///hamskie uwalenie peselu z listy wskazan
                                        if (!strchr($kolKl, 'id') && !strchr($kolKl, 'pesel'))
                                        {
                                            if (strlen($kolEl) > 0)
                                            {
                                                if (strlen($res) > 0)
                                                {
                                                    $res .= $sep;
                                                }
                                                $res .= $tlumaczenia->Tlumacz($_SESSION[$jezyk], $kolEl);
                                            }
                                        }
                                    }
                                    echo $res.$break;
                                }
                                else
                                {
                                    echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], $row).$break;
                                }
                            }
                    }
                    echo '</td>';
                    $j++;
                }

                while ($j < $k)
                {
                    echo '<td>&nbsp;</td>';
                    $j++;
                }
                echo '</tr>';
                $i++;
            }
            if (!$lista_ogl)
            for ($i; $i < 8; $i++)
            {
                echo '<tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>';
            }
            echo '</table>';
        }
        /**
        * @desc dodanie glownej listwy nad sekcja
        */
        public static function DodajTdOferta ($tekst, $specific = '')
        {
            $txt = '<td '.$specific.' style="background-image: url(gfx/nag_tlo.gif); background-repeat: repeat-x; border: 1px solid black;">
            <img height="20" style="padding-top: 1px; padding-left: 2px; padding-right: 2px; padding-bottom: 1px; vertical-align: top;" src="gfx/kw_nieb.gif"></img><span class="nag1wb">'.$tekst.'</span></td>';
            return $txt;
        }
        /**
        * @desc dodanie glownej listwy tabeli z czerwonym kwadratem
        */
        public static function DodajTrListwaGlowna ($tekst, $specific = '')
        {
            $txt = '<tr><td style="background-image: url(gfx/nag_tlo.gif); background-repeat: repeat-x;" '.$specific.'>
            <img height="20" style="padding-top: 1px; padding-left: 2px; padding-right: 2px; padding-bottom: 1px; vertical-align: top;" src="gfx/kw_czer.gif"></img><span class="nag1wb">'.$tekst.'</span></td></tr>';
            return $txt;
        }
        /**
        * @desc dodanie informacji z danymi oferty
        */
        protected static function DodajTrOferta ($head_1, $tresc_1, $head_2, $tresc_2)
        {
            if (strlen($tresc_1) > 0)
            {
                $head_1 .= ':';
            }
            if (strlen($tresc_2) > 0)
            {
                $head_2 .= ':'; 
            }
            $txt = '<tr><td><b>'.$head_1.'</b> '.$tresc_1.'</td><td><b>'.$head_2.'</b> '.$tresc_2.'</td></tr>';
            return $txt;
        }
        public static function GenerujListaKlientowOferta ($wynik, $jezyk_tl, $id_oferta, $oferta, $ilosc_kl, $rozwiazanie_um = false)
        {
            $tab_trans_rodzaj = array(1 => 'sprzedaży', 2 => 'wynajmu', 3 => 'zamiany');
            $tab_nier_rodzaj = array(1 => 'domu', 2 => 'mieszkania', 3 => 'lokalu', 4 => 'obiektu', 5 => 'terenu', 6 => 'działki');
            //var_dump($oferta);
            $tlumaczenia = cachejezyki::Czytaj();
            $str = UtilsUI::$naglowekUmowy.'<hr color="black"/><br /><center><b>';
            
            if ($rozwiazanie_um)
            {
                $str .= '<table width="100%" style="text-align: justify;"><tr><td>Oświadczam, że z dniem dzisiejszym rozwiązuję Umowę Pośrednictwa nr '.$id_oferta.' '.
                $tab_trans_rodzaj[$oferta[NieruchomoscDAL::$id_trans_rodzaj]].' '.$tab_nier_rodzaj[$oferta[NieruchomoscDAL::$id_nier_rodzaj]].' przy ulicy '.$oferta[NieruchomoscDAL::$adres].'
                . Jednocześnie zapoznałem(am) się z niżej wyszczególnioną listą klientów oglądających moją nieruchomość przez biuro A. Z. Gwarancja. W przypadku '.
                $tab_trans_rodzaj[$oferta[NieruchomoscDAL::$id_trans_rodzaj]].' '.$tab_nier_rodzaj[$oferta[NieruchomoscDAL::$id_nier_rodzaj]].' osobie znajdującej się na liście oglądających 
                zobowiązuję się do zapłaty prowizji należnej biuru zgodnie z umową pośrednictwa.</td></tr></table><br />';
            }
            
            $str .= 'LISTA WSKAZAŃ ADRESOWYCH OFERTY NR ';
            $str .= $id_oferta.'.</b></center><br />';
            echo $str;
            
            //$cena = number_format($oferta[ListaWskazanDAL::$cena], 0, ',', '.');
            
            echo '<table border="1"><tr><td><b>'.$tlumaczenia->Tlumacz($jezyk_tl, tags::$nr_oferty).': </b>'.$oferta[ListaWskazanDAL::$id_oferta].'</td><td><b>'.
            $tlumaczenia->Tlumacz($jezyk_tl, tags::$cena).': </b>'.$oferta[ListaWskazanDAL::$cena].'</td><td><b>'.$tlumaczenia->Tlumacz($jezyk_tl, tags::$adres).': </b>'.$oferta[NieruchomoscDAL::$adres].'</td><td><b>'.
            $tlumaczenia->Tlumacz($jezyk_tl, tags::$data_otw_zlec).': </b>'.$oferta[NieruchomoscDAL::$data].'</td><td><b>'.$tlumaczenia->Tlumacz($jezyk_tl, tags::$opis).': </b>'.$oferta[NieruchomoscDAL::$opis];
            echo '</td></tr><tr><td colspan="5">';
            
            echo '<table><tr><td><b>'.$tlumaczenia->Tlumacz($jezyk_tl, tags::$nazwisko).':</b></td><td><b>'.$tlumaczenia->Tlumacz($jezyk_tl, tags::$imie).':</b></td><td><b>'.
            $tlumaczenia->Tlumacz($jezyk_tl, tags::$miejscowosc).':</b></td><td><b>'.$tlumaczenia->Tlumacz($jezyk_tl, tags::$ulica).':</b></td><td><b>'.$tlumaczenia->Tlumacz($jezyk_tl, tags::$kod_pocztowy).':</b></td><td><b>'.
            $tlumaczenia->Tlumacz($jezyk_tl, tags::$telefon).':</b></td><td><b>'.$tlumaczenia->Tlumacz($jezyk_tl, tags::$pesel).':</b></td></tr>';
            foreach ($oferta[ListaWskazanDAL::$wlasciciel] as $osoba)
            {
                echo '<tr><td colspan="7"><hr /></td></tr><tr><td>'.$osoba[NieruchomoscDAL::$nazwisko].'</td><td>'.$osoba[NieruchomoscDAL::$imie].'</td><td>'.$osoba[NieruchomoscDAL::$miejscowosc].'</td><td>'.
                $osoba[NieruchomoscDAL::$ulica].'</td><td>'.$osoba[OsobaDAL::$kod].'</td><td>'.$osoba[OsobaDAL::$telefon].'</td><td>'.$osoba[OsobaDAL::$pesel].'</td></tr>';
            }
            echo '</table>';
            echo '</td></tr></table>';
            echo '<br /><center>ZNALEZIENI KLIENCI OGLĄDAJĄCY ('.$ilosc_kl.')</center>';
            echo '<table border="1" align="center">';
            echo '<tr><td><b>'.$tlumaczenia->Tlumacz($jezyk_tl, tags::$nr_zapotrzebowania).': </b></td>';
            echo '<td><b>'.$tlumaczenia->Tlumacz($jezyk_tl, tags::$data_otw_zlec).': </b></td>';
            echo '<td><b>'.$tlumaczenia->Tlumacz($jezyk_tl, tags::$data_godz).': </b></td>';
            echo '<td><b>'.$tlumaczenia->Tlumacz($jezyk_tl, tags::$nazwisko).': </b></td></tr>';
            //echo '<td><b>'.$tlumaczenia->Tlumacz($jezyk_tl, tags::$telefon).': </b></td>';
            //echo '<td><b>'.$tlumaczenia->Tlumacz($jezyk_tl, tags::$pesel).': </b></td>';
            
            foreach ($wynik as $wiersz)
            {
                echo '<tr><td>'.$wiersz[NieruchomoscDAL::$id_zapotrzebowanie].'</td><td>'.$wiersz[NieruchomoscDAL::$data_otw_zlecenie].'</td><td>'.$wiersz[NieruchomoscDAL::$data].'</td><td>';
                foreach ($wiersz[ListaWskazanDAL::$osoba] as $klucz => $wartosc)
                {
                    echo $wartosc.'<br />';
                }
                /*echo '</td><td>';
                foreach ($wiersz[ListaWskazanDAL::$telefon] as $klucz => $wartosc)
                {
                    echo $wartosc.'<br />';
                }
                echo '</td><td>';
                foreach ($wiersz[ListaWskazanDAL::$pesel] as $klucz => $wartosc)
                {
                    echo $wartosc.'<br />';
                } */
                echo '</td></tr>';
            }
            echo '</table><br /><br />';
            if ($rozwiazanie_um)
            {
                echo '<table width="100%"><tr><td style="text-align: left;">';
                echo '................................................................</td><td style="text-align: right;">.................................................................';
                echo '</td></tr><tr><td style="text-align: left;">czytelny podpis przyjmującego rezygnację</td><td style="text-align: right;">czytelny podpis rozwiązującego(ej) umowę';
                echo '</td></tr></table>';
            }
        }
        public static function GenerujListaWskazan ($wynik, $kolumny, $zlaczenia, $jezyk_tl, $id_zapotrzebowanie, $naglowki, $ogladajacy, $lista_ogl = false)
        {
            $tlumaczenia = cachejezyki::Czytaj();
            $str = UtilsUI::$naglowekUmowy.'<hr color="black"/><center><b>';
            if ($lista_ogl)
            {
                $str .= 'WYKAZ NIERUCHOMOŚCI OGLĄDANYCH NA ZLECENIE NR ';
            }
            else
            {
                $str .= 'LISTA WSKAZAŃ ADRESOWYCH NR ';
            }
            $str .= $id_zapotrzebowanie.'.</b></center><br />';
            echo $str;
            UtilsUI::TabelaListaWskazan($wynik, $kolumny, $zlaczenia, $naglowki, $lista_ogl);
            echo '<span style="font-size: 12px;"><br />';
            if (!$lista_ogl)
            echo 'Potwierdzam uzyskanie od w/w firmy wskazania adresowego nieruchomości oświadczając, iż wskazanie nie było mi wcześniej znane, a nawet jeśli w/w oferty wcześniej uzyskałem z innego źródła będą traktowane jako oferty po raz pierwszy przeze mnie uzyskane. Zawarcie transakcji z w/w kontrahentem, nabycie w/w nieruchomości - jest realizacją umowy. Przyjmuję do wiadomości, iż zawarte informacje o nieruchomości mają charakter informacyjny podany przez właścicieli nieruchomości i mogą podlegać aktualizacji.';
            echo '<br /></span>';
            
            echo '<br /><table width="100%" cellpadding="0" cellspacing="0" frame border="0"><tr><td width="50%" order="0" align="left" style="font-size: 12px;"><b>Nazwisko i imię klienta/ów:</b></td></tr></table>';
            if (is_array($ogladajacy))
            {
                echo '<table width="100%">';
                foreach ($ogladajacy as $osoba_ogl)
                {
                    echo '<tr>';
                    $tab = $osoba_ogl->PodajOsoba();
                    echo '<td style="font-size: 12px;"><b>'.$tab[OsobaDAL::$nazwisko].'</b>';
                    if (strlen($tab[OsobaDAL::$pesel]) > 0)
                    {
                        echo ', nr pesel: '.$tab[OsobaDAL::$pesel].', ';
                    }
                    echo '<br />';
                    if (count($tab[OsobaDAL::$telefon]) > 0)
                    {
                        echo 'telefon: ';
                        foreach ($tab[OsobaDAL::$telefon] as $tel_kl)
                        {
                            echo $tel_kl.', ';
                        }
                    }
                    /*if (strlen($tab[OsobaDAL::$komorka]) > 0)
                    {
                        echo 'telefon komórkowy: '.$tab[OsobaDAL::$komorka];
                    }*/
                    //ewentualnie dorbic tu adresy
                    echo '</td>';
                    if (!$lista_ogl)
                    echo '<td align="right" style="font-size: 10px;">.................................................<br /><b style="font-size: 10px;">Czytelny Podpis Klienta.</b><br /><br /></td>';
                    
                    echo '</tr>';
                    //echo '<tr><td></td><td align="right" style="font-size: 10px;">.................................................<br /><b style="font-size: 10px;">Czytelny Podpis Klienta.</b><br /><br /></td></tr>';
                }
                echo '</table>';
            }
            if (!$lista_ogl)
            echo '<br /><br /><table width="100%"><tr><td align="left" style="font-size: 10px;">.................................................</td><td align="right" style="font-size: 10px;">.................................................</td>
            </tr><tr><td align="left" style="font-size: 12px;"><b align="left">CZYTELNY PODPIS AGENTA/POŚREDNIKA</b></td><td align="right" style="font-size: 10px;"><b align="left">Czytelny podpis osób towarzyszących</b></td>
            </tr></table>
            <br /><br />
            <table width="100%"><tr><td align="left" style="font-size: 10px;">..........................................................</td><td align="right" style="font-size: 10px;">.................................................</td>
            </tr><tr><td align="left" style="font-size: 12px;"><b align="left">Imię i Nazwisko osoby towarzyszącej</b></td><td align="right" style="font-size: 10px;"><b align="left">Czytelny podpis osoby towarzyszącej</b></td>
            </tr></table>'; 
        }
        //metoda przeznaczona do generowania umow dla klientow otwierajacych zlecenie na poszukiwanie nieruchomosci
        public static function GenerujUmowaKlient($klient, $transakcja, $prowizja) //ustalic liste koniecznych parametrow metody
        {
            $path = str_replace($_SERVER['PHP_SELF'], '', $_SERVER['SCRIPT_FILENAME']).'/';
            require ($path.'conf.php');
            $jezyk_polski = 1;
            $tlumaczenia = cachejezyki::Czytaj();
            
            if ($transakcja == tags::$kupno)
            {
                $rodzaj_transakcji = $tlumaczenia->Tlumacz($jezyk_polski, tags::$kupna);
            }
            else
            {
                $rodzaj_transakcji = $tlumaczenia->Tlumacz($jezyk_polski, tags::$najmu);
            }
            //zmienna do sklejenia calych danych osoby
            $osoba_umowa = '';
            //jesli firma
            if ($klient[KlientDAL::$id_osobowosc] == $osoba_prawna)
            {
                $osoba_umowa = '"'.$klient[KlientDAL::$nazwa_firma].'"';
                
                if ($klient[KlientDAL::$miejscowosc_firma] != null)
                {
                    $osoba_umowa .= ' z siedzibą: '.$klient[KlientDAL::$miejscowosc_firma].' '.$klient[KlientDAL::$kod_firma].', przy ulicy '.$klient[KlientDAL::$ulica_firma].' '.$klient[KlientDAL::$nr_dom_firma];
                    if ($klient[KlientDAL::$nr_mieszkanie_firma] != null)
                    {
                        $osoba_umowa .= '/'.$klient[KlientDAL::$nr_mieszkanie_firma];
                    }
                }
                
                $osoba_umowa .= ' reprezentowaną przez Pana/ią: ';
            }
            
            //tu dane osoby
            if ($klient[KlientDAL::$id_osobowosc] == $osoba_fizyczna)
            {
                $osoba_umowa .= 'Panem/ią: ';
            }
            $osoba_umowa .= $klient[KlientDAL::$imie].' '.$klient[KlientDAL::$nazwisko];
            if ($klient[OsobaDAL::$nazwisko_rodowe] != null)
            {
                $osoba_umowa .= ' z domu '.$klient[OsobaDAL::$nazwisko_rodowe];
            }
            if ($klient[KlientDAL::$miejscowosc] != null)
            {
                $osoba_umowa .= ' zamieszkałym/łą: '.$klient[KlientDAL::$miejscowosc].' '.$klient[KlientDAL::$kod].', przy ulicy '.$klient[KlientDAL::$ulica].' '.$klient[KlientDAL::$nr_dom];
                if ($klient[KlientDAL::$nr_mieszkanie] != null)
                {
                    $osoba_umowa .= '/'.$klient[KlientDAL::$nr_mieszkanie];
                }
            }
            if ($klient[KlientDAL::$telefon] != null)
            {
                $osoba_umowa .= ', telefon: '.$klient[KlientDAL::$telefon];
            }
            if ($klient[KlientDAL::$komorka] != null)
            {
                $osoba_umowa .= ', telefon komórkowy: '.$klient[KlientDAL::$komorka];
            }
            //tu wkleic ewentualnie e mail jesli ma byc
            
            if ($klient[KlientDAL::$dowod] != null)
            {
                $osoba_umowa .= ' legitymującym/cą się dokumentem: '.strtolower($tlumaczenia->Tlumacz($jezyk_polski, $klient[KlientDAL::$dowod])).' o numerze '.$klient[KlientDAL::$nr_dowod];
            }
            if ($klient[KlientDAL::$pesel] != null)
            {
                $osoba_umowa .= ', nr pesel: '.$klient[KlientDAL::$pesel];
            }
            
            $str = UtilsUI::$naglowekUmowy;
            echo $str;
            echo '<table border="0" align="right" ><tr><td width="100%" valign="top" style="font-size: 12px;"><b>'.$klient[KlientDAL::$agent].', tel.kom.'.$klient[KlientDAL::$komorka_agent].'</b></td></tr></table>';
            echo '<br /><hr color="black" width="150%"/>';
            echo '<center><big>';
            echo '<b>UMOWA POŚREDNICTWA Nr '.$klient[NieruchomoscDAL::$id_zapotrzebowanie].'</b>';
            echo '<br>';
            echo '<b>'.$rodzaj_transakcji.' nieruchomości - '.$tlumaczenia->Tlumacz($jezyk_polski, $klient[KlientDAL::$osobowosc]).'</b>';
            echo '</big></center>';
            echo '<br><span style="font-size: 13px;">';
            echo 'Zawarta w dniu '.$klient[KlientDAL::$data].' w Opolu pomiędzy '.$osoba_umowa.', zwanym/ną dalej ZAMAWIAJĄCYM,';
            echo '<br />';
            echo 'a Firmą NIERUCHOMOŚCI A.Z.GWARANCJA zwaną dalej POŚREDNIKIEM z siedzibą w Opolu przy ul. Szarych Szeregów 34d, reprezentowaną przez: '.$klient[KlientDAL::$agent].'.';
            echo '<ul type = "1"><li>';
            echo 'Przedmiotem umowy jest wykonanie przez POŚREDNIKA na rzecz ZAMAWIAJĄCEGO usługi polegającej na wyszukaniu i prezentacji nieruchomości celem skojarzenia kontrahentów transakcji.';
            echo '<li>';
            echo 'ZAMAWIAJĄCY zobowiązuje się do każdorazowego potwierdzenia (własnoręcznym podpisem) na Liście Wskazań Adresowych nieruchomości oferowanych przez POŚREDNIKA lub nieruchomości znajdujących się w ofertach innych biur nieruchomości z którymi POŚREDNIK współpracuje.';
            echo '<li>';
            if ($transakcja == tags::$kupno)
            {
                echo 'Wynagrodzenie POŚREDNIKA za określoną wyżej usługę w drodze negocjacji wynosi '.$prowizja.' % netto + vat (22%) wartości przedmiotu kupna (nabycia) wg ceny zakupu, jednak nie mniej niż 1000 zł. (dotyczy nieruchomości o cenie ofertowej poniżej 34.000 zł.) płatne przez ZAMAWIAJĄCEGO w dniu podpisania protokołu uzgodnień lub umowy przedwstępnej - najpóźniej jednak w chwili podpisania Aktu Notarialnego. 
                W przypadku zawarcia przez ZAMAWIAJĄCEGO umowy najmu nieruchomości wynagrodzenie POŚREDNIKA ustala się w wysokości jednomiesięcznego czynszu najmu netto + vat (22%).';
            }
            else
            {
                echo 'Wynagrodzenie POŚREDNIKA za określoną wyżej usługę najmu w drodze negocjacji wynosi '.$prowizja.' % jednomiesięcznego czynszu najmu  netto + vat (22%) płatne przez ZAMAWIAJĄCEGO w dniu podpisania protokołu uzgodnień lub umowy najmu.';
            }
            echo '<li>';
            if ($transakcja == tags::$kupno)
            {
                echo 'W przypadku zawarcia przez ZAMAWIAJĄCEGO lub Jego bliskich lub osób pozostających w zależności służbowej umowy kupna (nabycia) nieruchomości podanej na wskazaniu adresowym z pominięciem POŚREDNIKA, ZAMAWIAJĄCY zapłaci POŚREDNIKOWI 
                wynagrodzenie określone jak w pkt. 3.';
            }
            else
            {
                echo 'W przypadku zawarcia przez ZAMAWIAJĄCEGO lub Jego bliskich lub osób pozostających w zależności służbowej umowy najmu nieruchomości podanej na Liście Wskazań Adresowych z pominięciem POŚREDNIKA, ZAMAWIAJĄCY zapłaci POŚREDNIKOWI 
                wynagrodzenie określone jak w pkt. 3.';
            }
            echo '<li>';
            echo 'Rozwiązanie tej umowy wymaga zachowania formy pisemnej.';
            echo '<li>';
            if ($transakcja == tags::$kupno)
            {
                echo 'Rozwiązanie niniejszej umowy przez ZAMAWIAJĄCEGO dokonane w celu zawarcia umowy kupna (nabycia) - także przez Jego bliskich lub osoby pozostające w zależności służbowej - 
                wskazanej nieruchomości z pominięciem POŚREDNIKA - rodzi obowiązek zapłaty wynagrodzenia określonego jak w pkt. 3.';
            }
            else
            {
                echo 'Rozwiązanie niniejszej umowy przez ZAMAWIAJĄCEGO dokonane w celu zawarcia umowy najmu - także przez Jego bliskich lub osoby pozostające w zależności służbowej - 
                wskazanej nieruchomości z pominięciem POŚREDNIKA - rodzi obowiązek zapłaty wynagrodzenia określonego jak w pkt. 3.';
            }
            echo '<li>';
            if ($transakcja == tags::$kupno)
            {
                echo 'POŚREDNIK nie ponosi odpowiedzialności za działania kupującego, sprzedającego, najmującego lub wynajmującego podjęte po zawarciu umowy kupna (nabycia), 
                najmu a naruszające postanowienia tej umowy lub prawa i obowiązki stron.';
            }
            else
            {
                echo 'POŚREDNIK nie ponosi odpowiedzialności za działania kupującego, sprzedającego, najmującego lub wynajmującego podjęte po zawarciu umowy najmu a naruszające postanowienia tej umowy lub prawa i 
                obowiązki stron.';
            }
            echo '<li>';
            echo 'POŚREDNIK może dochodzić od ZAMAWIAJĄCEGO odszkodowania za poniesioną szkodę, związaną z rozpowszechnianiem przez NIEGO otrzymanych ofert.';
            echo '<li>';
            echo 'W sprawach nieuregulowanych postanowieniami tej umowy mają zastosowanie odpowiednie przepisy Kodeksu Cywilnego.';
            echo '<li>';
            echo 'ZAMAWIAJĄCY oświadcza że zapoznał się z treścią umowy oraz wyraża zgodę na przetwarzanie swoich danych osobowych niezbędnych do realizacji umowy i zgodnie z Ustawą z dnia 29.08.1997 roku o ochronie danych osobowych.';
            echo '<li>';
            echo 'POŚREDNIK oświadcza iż zgodnie z art. 181 ust. 3 ustawy o gospodarce nieruchomościami jest ubezpieczony za szkody, które mogą wyniknąć w związku z wykonywaniem czynności pośrednictwa.';
            echo '</ul>';
            echo 'ZAMAWIAJĄCY zobowiązuje się do poinformowania POŚREDNIKA w terminie 7 dni od daty wydania wskazania adresowego o przyjęciu bądź odrzuceniu oferty, której wskazanie adresowe pokwitował.';
            echo '<br /><br />';
            echo 'Uwaga: przy zakupie nieruchomości oprócz prowizji dla POŚREDNIKA do ceny nieruchomości należy doliczyć koszty transakcji t.j. taksa notarialna, opłata od czynności cywilno-prawnych pobierane przez notariusza przy akcie notarialnym + opłata sądowa.';
            echo '<br />';

            echo '<table width="100%" cellpadding="0" cellspacing="0" frame border="0"><tr><td width="50%" order="0" align="left" style="font-size: 13px;">';
            echo '<br /><br /><br /><br />';
            echo '....................................................................';
            echo '<br />';
            echo 'ZAMAWIAJĄCY - czytelny podpis';
            echo '</td><td width="50%" order="0" align="right" style="font-size: 13px;">';
            echo '<br /><br /><br /><br />';
            echo '....................................................................';
            echo '<br />';
            echo $klient[KlientDAL::$agent];
            echo '<br />';
            echo '<b style="font-size: 13px;">CZYTELNY PODPIS</b>';
            echo '</td></tr></table>';                 
        }
        public static function GenerujUmowaKlientSzablon($osobowosc_id, $agent, $transakcja = '_kupno') //ustalic liste koniecznych parametrow metody
        {
            $osobowosc_ar = array(1 => 'Osoba fizyczna', 2 => 'Osoba prawna');
            $path = str_replace($_SERVER['PHP_SELF'], '', $_SERVER['SCRIPT_FILENAME']).'/';
            require ($path.'conf.php');
            $jezyk_polski = 1;
            $tlumaczenia = cachejezyki::Czytaj();
            

            //zmienna do sklejenia calych danych osoby
            $osoba_umowa = '';
            //jesli firma
            if ($osobowosc_id == $osoba_prawna)
            {
                $osoba_umowa = '"......................................" z siedzibą: .............................................., przy ulicy ...................................../......';
                $osoba_umowa .= ' reprezentowaną przez Pana/ią: ';
            }
            
            //tu dane osoby
            if ($osobowosc_id == $osoba_fizyczna)
            {
                $osoba_umowa .= 'Panem/ią: ';
            }
            $osoba_umowa .= '............................. ....................................';
            $osoba_umowa .= ' z domu ..................................';
            $osoba_umowa .= ' zamieszkałym/łą: ............................................., przy ulicy .............................................../......';
            

            $osoba_umowa .= ', telefon: ..............................';

            $osoba_umowa .= ', telefon komórkowy: ..............................';

            //tu wkleic ewentualnie e mail jesli ma byc
            

            $osoba_umowa .= ' legitymującym/cą się dokumentem: ..................................... o numerze ...........................................';

            $osoba_umowa .= ', nr pesel: .....................................';
            
            $str = UtilsUI::$naglowekUmowy;
            echo $str;
            echo '<table border="0" align="right" ><tr><td width="100%" valign="top" style="font-size: 12px;"><b>'.$agent[NieruchomoscDAL::$agent].', tel.kom. '.$agent[KlientDAL::$komorka_agent].'</b></td></tr></table>';
            echo '<br /><hr color="black" width="150%"/>';
            echo '<center><big>';
            echo '<b>UMOWA POŚREDNICTWA Nr .........</b>';
            echo '<br>';
            if ($transakcja == tags::$kupno)
            {
                $rodzaj_transakcji = $tlumaczenia->Tlumacz($jezyk_polski, tags::$kupna);
            }
            else
            {
                $rodzaj_transakcji = $tlumaczenia->Tlumacz($jezyk_polski, tags::$najmu);
            }
            echo '<b>'.$rodzaj_transakcji.' nieruchomości - '.$osobowosc_ar[$osobowosc_id].'</b>';
            echo '</big></center>';
            echo '<br><span style="font-size: 13px;">';
            echo 'Zawarta w dniu ...................... w Opolu pomiędzy '.$osoba_umowa.', zwanym/ną dalej ZAMAWIAJĄCYM,';
            echo '<br />';
            echo 'a Firmą NIERUCHOMOŚCI A.Z.GWARANCJA zwaną dalej POŚREDNIKIEM z siedzibą w Opolu przy ul. Szarych Szeregów 34d, reprezentowaną przez: '.$agent[NieruchomoscDAL::$agent].'.';
            echo '<ul type = "1"><li>';
            echo 'Przedmiotem umowy jest wykonanie przez POŚREDNIKA na rzecz ZAMAWIAJĄCEGO usługi polegającej na wyszukaniu i prezentacji nieruchomości celem skojarzenia kontrahentów transakcji.';
            echo '<li>';
            echo 'ZAMAWIAJĄCY zobowiązuje się do każdorazowego potwierdzenia (własnoręcznym podpisem) na Liście Wskazań Adresowych nieruchomości oferowanych przez POŚREDNIKA lub nieruchomości znajdujących się w ofertach innych biur nieruchomości z którymi POŚREDNIK współpracuje.';
            echo '<li>';

            if ($transakcja == tags::$kupno)
            {
                echo 'Wynagrodzenie POŚREDNIKA za określoną wyżej usługę w drodze negocjacji wynosi ....... % netto + vat (22%) wartości przedmiotu kupna (nabycia) wg ceny zakupu, 
                jednak nie mniej niż 1000 zł. (dotyczy nieruchomości o cenie ofertowej poniżej 34.000 zł.) płatne przez ZAMAWIAJĄCEGO w dniu podpisania protokołu uzgodnień lub umowy przedwstępnej - 
                najpóźniej jednak w chwili podpisania Aktu Notarialnego. 
                W przypadku zawarcia przez ZAMAWIAJĄCEGO umowy najmu nieruchomości wynagrodzenie POŚREDNIKA ustala się w wysokości jednomiesięcznego czynszu najmu netto + vat (22%).';
            }
            else
            {
                echo 'Wynagrodzenie POŚREDNIKA za określoną wyżej usługę najmu w drodze negocjacji wynosi ............ % jednomiesięcznego czynszu najmu  netto + vat (22%) płatne przez 
                ZAMAWIAJĄCEGO w dniu podpisania protokołu uzgodnień lub umowy najmu.';
            }
            
            echo '<li>';
            if ($transakcja == tags::$kupno)
            {
                echo 'W przypadku zawarcia przez ZAMAWIAJĄCEGO lub Jego bliskich lub osób pozostających w zależności służbowej umowy kupna (nabycia) nieruchomości podanej na wskazaniu adresowym z pominięciem 
                POŚREDNIKA, ZAMAWIAJĄCY zapłaci POŚREDNIKOWI wynagrodzenie określone jak w pkt. 3.';
            }
            else
            {
                echo 'W przypadku zawarcia przez ZAMAWIAJĄCEGO lub Jego bliskich lub osób pozostających w zależności służbowej umowy najmu nieruchomości podanej na Liście Wskazań Adresowych z pominięciem 
                POŚREDNIKA, ZAMAWIAJĄCY zapłaci POŚREDNIKOWI wynagrodzenie określone jak w pkt. 3.';
            }

            echo '<li>';
            echo 'Rozwiązanie tej umowy wymaga zachowania formy pisemnej.';
            echo '<li>';

            if ($transakcja == tags::$kupno)
            {
                echo 'Rozwiązanie niniejszej umowy przez ZAMAWIAJĄCEGO dokonane w celu zawarcia umowy kupna (nabycia) - także przez Jego bliskich lub osoby pozostające w zależności służbowej - 
                wskazanej nieruchomości z pominięciem POŚREDNIKA - rodzi obowiązek zapłaty wynagrodzenia określonego jak w pkt. 3.';
            }
            else
            {
                echo 'Rozwiązanie niniejszej umowy przez ZAMAWIAJĄCEGO dokonane w celu zawarcia umowy najmu - także przez Jego bliskich lub osoby pozostające w zależności służbowej - 
                wskazanej nieruchomości z pominięciem POŚREDNIKA - rodzi obowiązek zapłaty wynagrodzenia określonego jak w pkt. 3.';
            }

            echo '<li>';
            if ($transakcja == tags::$kupno)
            {
                echo 'POŚREDNIK nie ponosi odpowiedzialności za działania kupującego, sprzedającego, najmującego lub wynajmującego podjęte po zawarciu umowy kupna (nabycia), 
                najmu a naruszające postanowienia tej umowy lub prawa i obowiązki stron.';
            }
            else
            {
                echo 'POŚREDNIK nie ponosi odpowiedzialności za działania kupującego, sprzedającego, najmującego lub wynajmującego podjęte po zawarciu umowy najmu a naruszające postanowienia tej umowy lub prawa i 
                obowiązki stron.';
            }

            echo '<li>';
            echo 'POŚREDNIK może dochodzić od ZAMAWIAJĄCEGO odszkodowania za poniesioną szkodę, związaną z rozpowszechnianiem przez NIEGO otrzymanych ofert.';
            echo '<li>';
            echo 'W sprawach nieuregulowanych postanowieniami tej umowy mają zastosowanie odpowiednie przepisy Kodeksu Cywilnego.';
            echo '<li>';
            echo 'ZAMAWIAJĄCY oświadcza że zapoznał się z treścią umowy oraz wyraża zgodę na przetwarzanie swoich danych osobowych niezbędnych do realizacji umowy i zgodnie z Ustawą z dnia 29.08.1997 roku o ochronie danych osobowych.';
            echo '<li>';
            echo 'POŚREDNIK oświadcza iż zgodnie z art. 181 ust. 3 ustawy o gospodarce nieruchomościami jest ubezpieczony za szkody, które mogą wyniknąć w związku z wykonywaniem czynności pośrednictwa.';
            echo '</ul>';
            echo 'ZAMAWIAJĄCY zobowiązuje się do poinformowania POŚREDNIKA w terminie 7 dni od daty wydania wskazania adresowego o przyjęciu bądź odrzuceniu oferty, której wskazanie adresowe pokwitował.';
            echo '<br /><br />';
            echo 'Uwaga: przy zakupie nieruchomości oprócz prowizji dla POŚREDNIKA do ceny nieruchomości należy doliczyć koszty transakcji t.j. taksa notarialna, opłata od czynności cywilno-prawnych pobierane przez notariusza przy akcie notarialnym + opłata sądowa.';
            echo '<br />';

            echo '<table width="100%" cellpadding="0" cellspacing="0" frame border="0"><tr><td width="50%" order="0" align="left" style="font-size: 13px;">';
            echo '<br /><br /><br /><br />';
            echo '....................................................................';
            echo '<br />';
            echo 'ZAMAWIAJĄCY - czytelny podpis';
            echo '</td><td width="50%" order="0" align="right" style="font-size: 13px;">';
            echo '<br /><br /><br /><br />';
            echo '....................................................................';
            echo '<br />'.$agent[NieruchomoscDAL::$agent];
            echo '<br />';
            echo '<b style="font-size: 13px;">CZYTELNY PODPIS</b>';
            echo '</td></tr></table>';                 
        }
        public static function GenerujOczekiwaniaKlient($zapotrzebowanieKol, $zapotrzebowanie_id, $jezyk_id) //ZapotrzebowanieACD[]
        {
            $tlumaczenia = cachejezyki::Czytaj();
            echo '<center>';
            UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($jezyk_id, tags::$opis_poszukiwanych_nieruchomosci));
            UtilsUI::IstotneInfo('UMOWA POŚREDNICTWA Nr '.$zapotrzebowanie_id);
            echo '</center>';
            
            echo '<table border="1" width="100%" align="center" rules="all" class="tableBorder">';
            foreach ($zapotrzebowanieKol as $zapotrzebowanie_trans_rodzaj_id => $dane_obj)
            {
                echo '<tr><td align="center" colspan="2">';
                UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($jezyk_id, tags::$opis_poszukiwanej_nieruchomosci).' - '.$tlumaczenia->Tlumacz($jezyk_id, $dane_obj->nier_rodzaj).' : '.
                $tlumaczenia->Tlumacz($jezyk_id, $dane_obj->trans_rodzaj));
                echo '</td></tr><tr><td colspan="2">';
                echo '<b>'.$tlumaczenia->Tlumacz($jezyk_id, tags::$rodzaj_budynek).': </b>';
                
                if (is_array($dane_obj->rodzaj_budynek))
                foreach ($dane_obj->rodzaj_budynek as $typ_bud)
                {
                    echo $tlumaczenia->Tlumacz($jezyk_id, $typ_bud[NieruchomoscDAL::$nazwa]).', ';
                }
                echo '</td></tr><tr><td>';
                echo '<b>'.$tlumaczenia->Tlumacz($jezyk_id, tags::$lokalizacja).': </b>';
                
                if (is_array($dane_obj->lokalizacja))
                foreach ($dane_obj->lokalizacja as $region)
                {
                    echo $tlumaczenia->Tlumacz($jezyk_id, $region[NieruchomoscDAL::$region]).', ';
                }
                echo '</td><td>';
                echo '<b>'.$tlumaczenia->Tlumacz($jezyk_id, tags::$cena).': </b>'.$dane_obj->cena.'</td></tr><tr><td colspan="2">';
                echo '<b>'.$tlumaczenia->Tlumacz($jezyk_id, tags::$opis_zapotrzebowania).': </b>';
                
                if (is_array($dane_obj->opis_zapotrzebowanie))
                foreach ($dane_obj->opis_zapotrzebowanie as $opis)
                {
                    echo $opis[WyposazenieZapDAL::$wartosc].'.<br />';
                }
                echo '</td></tr><tr><td colspan="2"><table><tr>';
                                
                foreach ($dane_obj->parametry as $klucz => $wartosc)
                {
                    echo '<td><b>';
                    echo $tlumaczenia->Tlumacz($jezyk_id, $wartosc[NieruchomoscDAL::$nazwa]).': </b><br />';
                    if (isset($wartosc[tags::$od]))
                    {
                        echo '<b>'.$tlumaczenia->Tlumacz($jezyk_id, tags::$od).': </b>'.$wartosc[tags::$od].' ';
                    }
                    if (isset($wartosc[tags::$do]))
                    {
                        echo '<b>'.$tlumaczenia->Tlumacz($jezyk_id, tags::$do).': </b>'.$wartosc[tags::$do].'.';
                    }
                    echo '</td>';
                }
                echo '</tr></table></td></tr><tr><td colspan="2"><table>';
                $licznik = 0;
                foreach ($dane_obj->wyposazenia as $klucz_sekcja => $wyposazenie_sek)
                {
                    $wyposazenia = $wyposazenie_sek->PodajWybraneWyposazenie();
                    foreach ($wyposazenia as $wyposazenie_obj)
                    {
                        if ($licznik % 6 == 0)
                        {
                            echo '<tr>';
                        }
                        echo '<td>'.$wyposazenie_obj->nazwa.', </td>';
                        $licznik++;
                        if ($licznik % 6 == 0)
                        {
                            echo '</tr>';
                        }
                    }
                }
                echo '</table></td></tr>';
                
            }
            echo '</table><br /><br /><br /><br />';
            echo '<table width="100%"><tr><td align="right">............................';
            echo '</td></tr><tr><td align="right">Podpis Klienta</td></tr></table>';
        }
        /**
        * @desc Metoda dla nowej wersji oferty, dla nowej strony internetowej
        */
        public static function OfertaWersjaPelna ($oferta, $jezyk_id, $agent_dane, $sekcje, $pomieszczenia, $pokaz_zdj = true)
        {
            $path = str_replace($_SERVER['PHP_SELF'], '', $_SERVER['SCRIPT_FILENAME']).'/'; 
            
            require($path.'conf.php');
            
            $tlumaczenia = cachejezyki::Czytaj();
            
            $wst_p = '';
            $wst_k = '';
            $wst_klucz = '';
            if ($oferta[StronaOfertaDAL::$status] == tags::$wstrzymana)
            {
                $wst_p = '<u>';
                $wst_k = '</u>';
            }
            if ($oferta[StronaOfertaDAL::$klucz])
            {
                $wst_klucz = '&nbsp;<img width="20" src="gfx/kluczyki.gif"></img>'; //dorobic www . do graficzek, zeby szloz mailem ladnie :P
            }
            $pokoje = '';
            if (isset($sekcje[0]['parametry']))
            {
                $sekcja_pods = $sekcje[0]['parametry'];
                if (isset($sekcja_pods[0]))
                {
                    $dane_param = explode(' : ', $sekcja_pods[0]);
                    if ($dane_param[0] == tags::$liczba_pokoi)
                    {
                        $pokoje = $dane_param[1].$tlumaczenia->Tlumacz($jezyk_id, tags::$pok).'. - ';
                    }
                }
            }
            $styl_status = '';
            if ($oferta[StronaOfertaDAL::$status] == tags::$umowiona || $oferta[StronaOfertaDAL::$status] == tags::$wstrzymana)
            {
                $oferta[StronaOfertaDAL::$status] = tags::$aktualna;
            }
            else if ($oferta[StronaOfertaDAL::$status] == tags::$zawieszona)
            {
                $styl_status = 'style="color: red;"';
            }
            $tresc_html = '';
            $tresc_html .= '<table '.$atr_tab_srodek.'>'.
            UtilsUI::DodajTrListwaGlowna($tlumaczenia->Tlumacz($jezyk_id, $oferta[StronaOfertaDAL::$transakcja_rodzaj]).' - '.$tlumaczenia->Tlumacz($jezyk_id, $oferta[StronaOfertaDAL::$nieruchomosc_rodzaj]).' - '.
            $pokoje.$oferta[StronaOfertaDAL::$lokalizacja]);
            $tresc_html .= '<tr><td>';

            $tresc_html .= '<table><tr><td style="border: 1px solid black; background-color: #d5deec;"><table width="100%"><tr><td width="311" valign="top">';
            //zdjecia
            if (isset($oferta[StronaOfertaDAL::$zdjecie]) && $pokaz_zdj)
            {
                //KontrolkiHtml::DodajPopUp('', 'zdjecie.php?'.NieruchomoscDAL::$id_nieruchomosc.'='.$oferta[NieruchomoscDAL::$id_nieruchomosc], 700, 700, 380, 100);
                $tresc_html .= '<table><tr><td>';
                $tresc_html .= '<iframe src="image_oferta.php?'.NieruchomoscDAL::$id_nieruchomosc.'='.$oferta[NieruchomoscDAL::$id_nieruchomosc].'&'.StronaOfertaDAL::$zdjecie.'='.$oferta[StronaOfertaDAL::$zdjecie][0].
                '" frameborder="0" height="200" width="311" marginheight="0" marginwidth="0" scrolling="no" name="zdjecie_glowne"></iframe>';
                //$tresc_html .= '<iframe src="zdjecie.php?'.NieruchomoscDAL::$id_nieruchomosc.'='.$oferta[NieruchomoscDAL::$id_nieruchomosc].'" frameborder="0" height="300" width="311" marginheight="0" marginwidth="0" scrolling="no" name="zdjecie_glowne"></iframe>';
                
                $tresc_html .= '</td></tr></table><table>';
                $i = 0;
                foreach ($oferta[StronaOfertaDAL::$zdjecie] as $zdjecie)
                {
                    if ($i % 3 == 0)
                    {
                        $tresc_html .= '<tr>';
                    }
                    $tresc_html .= '<td><a href="image_oferta.php?'.NieruchomoscDAL::$id_nieruchomosc.'='.$oferta[NieruchomoscDAL::$id_nieruchomosc].'&'.StronaOfertaDAL::$zdjecie.'='.$zdjecie.'" target="zdjecie_glowne">
                    <img width="99" class="ira" border="1" src="media/'.$oferta[NieruchomoscDAL::$id_nieruchomosc].'/zdjecia/m_'.$zdjecie.'"></img></td>';
                    $i++;
                    if ($i % 3 == 0)
                    {
                        $tresc_html .= '</tr>';
                    }
                }
                //jesli za petla tr jest niedomkniety ...
                if ($i % 3 != 0)
                {
                    $tresc_html .= '</tr>';
                }
                $tresc_html .= '</table>';
            }
            //filmy
            if (isset($oferta[NieruchomoscDAL::$opis][$jezyk_id]))
            {
                $tresc_html .= '<table width="100%"><tr>'.UtilsUI::DodajTdOferta($tlumaczenia->Tlumacz($jezyk_id, tags::$opis_nieruchomosci)).'</tr><tr><td>'.$oferta[NieruchomoscDAL::$opis][$jezyk_id];
                $tresc_html .= '</td></tr></table>';
            }
            
            $tresc_html .=  '</td><td width="311" valign="top">';
            //tresc oferty
            $tresc_html .= '<img src="gfx/drukarka.gif"></img>'.$tlumaczenia->Tlumacz($jezyk_id, tags::$wydrukuj_ze_zdjeciami);
            $tresc_html .= '<img src="gfx/drukarka.gif"></img>'.$tlumaczenia->Tlumacz($jezyk_id, tags::$wydrukuj_bez_zdjec);
            
            $cena = number_format($oferta[StronaOfertaDAL::$cena], 0, ',', '.');
            //wywrozyc kod waluty, najlepiej sprzeg z kursami walut
            $tresc_html .= '<table width="100%"><tr>'.UtilsUI::DodajTdOferta($tlumaczenia->Tlumacz($jezyk_id, tags::$informacje_ogolne), 'colspan="2"').'</tr>'.
            UtilsUI::DodajTrOferta($tlumaczenia->Tlumacz($jezyk_id, tags::$numer_oferty), $wst_p.$oferta[StronaOfertaDAL::$id_oferta].$wst_k, $tlumaczenia->Tlumacz($jezyk_id, tags::$cena), $cena.' PLN'.$wst_klucz);
            $wylacznosc = '';
            if ($oferta[NieruchomoscDAL::$wylacznosc])
            {
                $wylacznosc = '<span class="wylacznosc">'.$tlumaczenia->Tlumacz($jezyk_id, tags::$wylacznosc).'</span>';
            }
            $tresc_html .= UtilsUI::DodajTrOferta($tlumaczenia->Tlumacz($jezyk_id, tags::$status), '<b '.$styl_status.'>'.$tlumaczenia->Tlumacz($jezyk_id, $oferta[StronaOfertaDAL::$status]).'</b>', $wylacznosc, '');
            //dodac agenta gg itd
            $gg = '';
            if ($oferta[StronaOfertaDAL::$gg])
            {
                //src="gfx/gadu.gif"  src="http://www.gadu-gadu.pl/users/status.asp?id='.$oferta[StronaOfertaDAL::$gg].'&styl=1"
                $gg = '<a href="gg:'.$oferta[StronaOfertaDAL::$gg].'"><img style="border: 0px;" src="gfx/gadu.gif"></img></a>&nbsp;&nbsp;&nbsp;';
            }
            $tresc_html .= UtilsUI::DodajTrOferta($tlumaczenia->Tlumacz($jezyk_id, tags::$agent_prowadzacy), '<a href="mailto:'.$oferta[StronaOfertaDAL::$email].'">'.
            $agent_dane.'</a> <b>'.$tlumaczenia->Tlumacz($jezyk_id, tags::$telefon).': </b>'.$oferta[OsobaDAL::$komorka].', '.$oferta[StronaOfertaDAL::$telefon], 
            $tlumaczenia->Tlumacz($jezyk_id, tags::$napisz_do_mnie), '<br />'.$gg.'<a href="mailto:'.$oferta[StronaOfertaDAL::$email].'"><img style="border: 0px;" src="gfx/mail.gif"></img></a>');
            
            $tresc_html .= UtilsUI::DodajTrOferta($tlumaczenia->Tlumacz($jezyk_id, tags::$lokalizacja), $tlumaczenia->Tlumacz($jezyk_id, $oferta[StronaOfertaDAL::$lokalizacja]), 
            $tlumaczenia->Tlumacz($jezyk_id, tags::$wojewodztwo), $oferta[StronaOfertaDAL::$wojewodztwo]);
            $tresc_html .= UtilsUI::DodajTrOferta($tlumaczenia->Tlumacz($jezyk_id, tags::$powiat), $tlumaczenia->Tlumacz($jezyk_id, $oferta[StronaOfertaDAL::$powiat]), 
            $tlumaczenia->Tlumacz($jezyk_id, tags::$typ_nieruchomosci), $tlumaczenia->Tlumacz($jezyk_id, $oferta[StronaOfertaDAL::$rodzaj_budynek]));
            if ($oferta[StronaOfertaDAL::$rynek_pierw])
            {
                $rodzaj_rynek = $tlumaczenia->Tlumacz($jezyk_id, tags::$rynek_pierwotny);
            }
            else
            {
                $rodzaj_rynek = $tlumaczenia->Tlumacz($jezyk_id, tags::$rynek_wtorny);
            }
            if ($oferta[StronaOfertaDAL::$czas_przekazania] == 0)
            {
                $oferta[StronaOfertaDAL::$czas_przekazania] = $tlumaczenia->Tlumacz($jezyk_id, tags::$od_zaraz);
            }
            $tresc_html .= UtilsUI::DodajTrOferta($tlumaczenia->Tlumacz($jezyk_id, tags::$rodzaj_rynek), $rodzaj_rynek, $tlumaczenia->Tlumacz($jezyk_id, tags::$czas_przekazania_m), 
            $tlumaczenia->Tlumacz($jezyk_id, $oferta[StronaOfertaDAL::$czas_przekazania]));
            //$sekcja[StronaOfertaDAL::$parametry][count($sekcja[StronaOfertaDAL::$parametry])] = tags::$cena_m2.' : '.round($oferta[StronaOfertaDAL::$cena] / $odlamki[1], 2);
            if ($sekcje[0][WyposazenieNierDAL::$id_sekcja] == 1)
            {
                if ($sekcje[0][StronaOfertaDAL::$parametry] != null)
                {
                   foreach ($sekcje[0][StronaOfertaDAL::$parametry] as $parametr)
                   {
                       if (strchr($parametr, StronaOfertaDAL::$powierzchnia_uzytkowa)) //zwraca inf o wystapieniu stringu
                       {
                           $odlamki = explode (' : ', $parametr);
                           $tresc_html .= UtilsUI::DodajTrOferta($tlumaczenia->Tlumacz($jezyk_id, tags::$cena_m2), round($oferta[StronaOfertaDAL::$cena] / $odlamki[1], 2), '', '');
                       }
                   }
                }
            }
            
            if (is_array($sekcje))
            {
                foreach ($sekcje as $sekcja)
                {
                    $tresc_html .= '<tr>'.UtilsUI::DodajTdOferta($tlumaczenia->Tlumacz($jezyk_id, $sekcja[StronaOfertaDAL::$nazwa]), 'colspan="2"').'</tr>';
                    if (isset($sekcja[StronaOfertaDAL::$parametry]))
                    {
                        $licz_par = 0;
                        $odlamki_1 = null;
                        while (isset($sekcja[StronaOfertaDAL::$parametry][$licz_par]))
                        {
                            $wartosc = $sekcja[StronaOfertaDAL::$parametry][$licz_par];
                            $licz_par++;
                            $odlamki = explode(' : ', $wartosc); 
                            if ($licz_par % 2 == 1)
                            {
                                $odlamki_1 = $odlamki;
                            }
                            else
                            {
                                $tresc_html .= UtilsUI::DodajTrOferta($tlumaczenia->Tlumacz($jezyk_id, $odlamki_1[0]), $odlamki_1[1], $tlumaczenia->Tlumacz($jezyk_id, $odlamki[0]), $odlamki[1]);
                                $odlamki_1 = null;
                            }
                        }
                    }
                    if (isset($sekcja[StronaOfertaDAL::$wyposazenia]))
                    {
                        foreach ($sekcja[StronaOfertaDAL::$wyposazenia] as $klucz => $wartosc)
                        {
                            $licz_par++;
                            $odlamki = explode(' : ', $wartosc); 
                            if ($licz_par % 2 == 1)
                            {
                                $odlamki_1 = $odlamki;
                            }
                            else
                            {
                                $tresc_html .= UtilsUI::DodajTrOferta($tlumaczenia->Tlumacz($jezyk_id, $odlamki_1[0]), $tlumaczenia->Tlumacz($jezyk_id, $odlamki_1[1]), $tlumaczenia->Tlumacz($jezyk_id, $odlamki[0]), 
                                $tlumaczenia->Tlumacz($jezyk_id, $odlamki[1]));
                                $odlamki_1 = null;
                            }
                        }
                    }
                    if ($odlamki_1) //jesli nieparzysta ilosc wszystkich elementow
                    {
                        $tresc_html .= UtilsUI::DodajTrOferta($tlumaczenia->Tlumacz($jezyk_id, $odlamki_1[0]), $tlumaczenia->Tlumacz($jezyk_id, $odlamki_1[1]), '', '');
                    }
                    $odlamki = $odlamki_1 = null;
                    $licz_par = 0;
                }
                
            }
            if (isset($pomieszczenia))
            {
                $tresc_html .= '<tr>'.UtilsUI::DodajTdOferta($tlumaczenia->Tlumacz($jezyk_id, tags::$pomieszczenia), 'colspan="2"').'</tr>';

                foreach ($pomieszczenia as $pomieszczenie)
                {
                    //trzeba sprawdzic dla numeru 1 czy w calej tablicy jest wiecej takich pomieszczen ;/
                    $nr = null;
                    if ($pomieszczenie[StronaOfertaDAL::$nr_pomieszczenie] > 1)
                    {
                        $nr = ' '.$pomieszczenie[StronaOfertaDAL::$nr_pomieszczenie];
                    }
                    $tresc_html .= '<tr>'.UtilsUI::DodajTdOferta($tlumaczenia->Tlumacz($jezyk_id, $pomieszczenie[StronaOfertaDAL::$nazwa]).$nr, 'colspan="2"').'</tr>';
                    
                    $i = 0;
                    
                    if (isset($pomieszczenie[StronaOfertaDAL::$parametry]))
                    {
                        $licz_par = 0;
                        $odlamki_1 = null;
                        while (isset($pomieszczenie[StronaOfertaDAL::$parametry][$licz_par]))
                        {
                            $wartosc = $pomieszczenie[StronaOfertaDAL::$parametry][$licz_par];
                            $licz_par++;
                            $odlamki = explode(' : ', $wartosc); 
                            if ($licz_par % 2 == 1)
                            {
                                $odlamki_1 = $odlamki;
                            }
                            else
                            {
                                $tresc_html .= UtilsUI::DodajTrOferta($tlumaczenia->Tlumacz($jezyk_id, $odlamki_1[0]), $odlamki_1[1], $tlumaczenia->Tlumacz($jezyk_id, $odlamki[0]), $odlamki[1]);
                                $odlamki_1 = null;
                            }
                        }  
                    }
                    if (isset($pomieszczenie[StronaOfertaDAL::$wyposazenia]))
                    {
                        foreach ($pomieszczenie[StronaOfertaDAL::$wyposazenia] as $klucz => $wartosc)
                        {
                            $licz_par++;
                            $odlamki = explode(' : ', $wartosc); 
                            if ($licz_par % 2 == 1)
                            {
                                $odlamki_1 = $odlamki;
                            }
                            else
                            {
                                $tresc_html .= UtilsUI::DodajTrOferta($tlumaczenia->Tlumacz($jezyk_id, $odlamki_1[0]), $tlumaczenia->Tlumacz($jezyk_id, $odlamki_1[1]), $tlumaczenia->Tlumacz($jezyk_id, $odlamki[0]), 
                                $tlumaczenia->Tlumacz($jezyk_id, $odlamki[1]));
                                $odlamki_1 = null;
                            }
                        }  
                    }
                }
            }
            
            $tresc_html .= '</table>';
            
            $tresc_html .= '</td></tr></table>';
            
            $tresc_html .= '</td></tr></table></td></tr></table>';
            return $tresc_html;
        }
        /**
        * @desc 
        */
        public static function OfertyLista ($wynik, $regiony, $rodz_bud, $rodz_bud_exist, $rodzaj_oferty, $jezyk_id)
        {
            $path = str_replace($_SERVER['PHP_SELF'], '', $_SERVER['SCRIPT_FILENAME']).'/'; 
            
            require($path.'conf.php');
            
            $tlumaczenia = cachejezyki::Czytaj();
            
            $tresc_html = '';
            $licznik = 0;
            $il_region = 0;
            foreach ($regiony as $region_id => $region)
            {
                if ($il_region > 0)
                {
                    $region = $tlumaczenia->Tlumacz($jezyk_id, tags::$gmina).' '.$region;
                }
                foreach ($rodz_bud as $rodz_bud_id => $rodz_bud_wart)
                {
                    if (!$rodz_bud_exist)
                    {
                        $rodz_bud_wart = $rodz_bud_id.' - '.$tlumaczenia->Tlumacz($jezyk_id, $rodz_bud_wart);
                    }
                    else
                    {
                        $rodz_bud_wart = $tlumaczenia->Tlumacz($jezyk_id, $rodz_bud_wart);
                    }
                    if (isset($wynik[$region_id][$rodz_bud_id]))
                    {
                        $tresc_html .= '<table '.$atr_tab_srodek.'>'.
                        UtilsUI::DodajTrListwaGlowna($tlumaczenia->Tlumacz($jezyk_id, $rodzaj_oferty[0][StronaOfertaDAL::$transakcja_rodzaj]).' - '.
                        $tlumaczenia->Tlumacz($jezyk_id, $rodzaj_oferty[0][StronaOfertaDAL::$nieruchomosc_rodzaj]).' - '.$rodz_bud_wart.' - '.$region);
                        //foreach na oferty, nowa tabela + publikacja
                        
                        $tresc_html .= '<tr><td><table width="100%" align="center" cellpadding="1" cellspacing="1">';
                        foreach ($wynik[$region_id][$rodz_bud_id] as $wiersz)
                        {
                            if ($licznik % 2 == 0)
                            {
                                $kolor_tlo = '#9fc0f3';
                            }
                            else
                            {
                                $kolor_tlo = '#7a9cdc';
                            }
                            $nag_stat_zaw = '';
                            $stopka_stat_zaw = '';
                            $status = '';
                            
                            if (($wiersz[StronaOfertaDAL::$id_status] == $status_nieaktualny) || ($wiersz[StronaOfertaDAL::$id_status] == $status_zawieszony))
                            {
                                $nag_stat_zaw = '<span class="zawo">';
                                $stopka_stat_zaw = '</span>';
                                $status = '<span class="zawna">'.$tlumaczenia->Tlumacz($jezyk_id, tags::$oferta_zawieszona).'</span>';
                                $kolor_tlo = '#eaeae8';
                            }
                            ///wstrzymana poczatek i koniec
                            $wst_p = '';
                            $wst_k = '';
                            if ($wiersz[StronaOfertaDAL::$id_status] == $status_wstrzymany)
                            {
                                //$wiersz[StronaOfertaDAL::$id_oferta] = '<u>'.$wiersz[StronaOfertaDAL::$id_oferta].'</u>';
                                $wst_p = '<u>';
                                $wst_k = '</u>';
                            }
                            if ($wiersz[StronaOfertaDAL::$klucz])
                            {
                                //filter:progid:DXImageTransform.Microsoft.AlphaImageLoader (src='images/image.png',sizingMethod='scale');
                                $wst_k .= '&nbsp;<img width="20" src="gfx/kluczyki.gif"></img>';
                            }
                            
                            $tresc_html .= '<tr style="background-color: '.$kolor_tlo.';"><td style="border: 1px solid black;"><table cellpadding="1" cellspacing="1"><tr><td>';
                            $sciezka_zdjecie = 'img/zd0.jpg';
                            if (is_array($wiersz[StronaOfertaDAL::$zdjecie]))
                            {
                                $tresc_html .= KontrolkiHtml::DodajZdjeciaNierStrona($wiersz[StronaOfertaDAL::$id_nieruchomosc], $wiersz[StronaOfertaDAL::$zdjecie], $tlumaczenia, $_SESSION[$jezyk], $tab_nier_rodz, 
                                $_GET[StronaPodsInfoDAL::$id_nier_rodzaj], $wiersz[StronaOfertaDAL::$id_oferta], 90, 67);                                
                            }
                            else
                            {
                                $tresc_html .= KontrolkiHtml::DodajZdjNierStrona($sciezka_zdjecie, $_GET[StronaPodsInfoDAL::$id_nier_rodzaj], $wiersz[StronaOfertaDAL::$id_oferta], 90, 60);
                            }
                            $tresc_html .= '</td><td><table>';
                            
                            $tresc_html .= '<tr><td>'.$nag_stat_zaw.'<b>'.$tlumaczenia->Tlumacz($jezyk_id, tags::$numer_oferty).': </b> '.
                            $wst_p.$wiersz[StronaOfertaDAL::$id_oferta].$wst_k.$stopka_stat_zaw.'</td><td>'.$nag_stat_zaw.'<b>'.
                            $tlumaczenia->Tlumacz($jezyk_id, tags::$lokalizacja).': </b>'.$wiersz[StronaOfertaDAL::$lokalizacja].$stopka_stat_zaw.'</td></tr>';
                            
                            $parametry_nazwy = $wiersz[StronaOfertaDAL::$parametr_nazwa];
                            $parametry_wartosci = $wiersz[StronaOfertaDAL::$parametr_wartosc];
                            $i = 0;
                            $odlamki_1 = null;
                            if (isset($parametry_nazwy))
                            foreach ($parametry_nazwy as $parametr)
                            {
                                if ($i % 2 == 0)
                                {
                                    $odlamki_1 = array($nag_stat_zaw.$tlumaczenia->Tlumacz($jezyk_id, $parametr).$stopka_stat_zaw, $nag_stat_zaw.$parametry_wartosci[$i].$stopka_stat_zaw);
                                }
                                else
                                {
                                    $tresc_html .= UtilsUI::DodajTrOferta($odlamki_1[0], $odlamki_1[1], $nag_stat_zaw.$tlumaczenia->Tlumacz($jezyk_id, $parametr).$stopka_stat_zaw, 
                                    $nag_stat_zaw.$parametry_wartosci[$i].$stopka_stat_zaw);
                                    $odlamki_1 = null;
                                }
                                $i++;
                            }
                            if (isset($wiersz[StronaOfertaDAL::$wyposazenie]))
                            foreach ($wiersz[StronaOfertaDAL::$wyposazenie] as $wyposazenie)
                            {
                                if ($i % 2 == 0)
                                {
                                    $odlamki_1 = explode(' : ', $wyposazenie);
                                    $odlamki_1[0] = $tlumaczenia->Tlumacz($jezyk_id, $odlamki_1[0]);
                                    $odlamki_1[1] = $tlumaczenia->Tlumacz($jezyk_id, $odlamki_1[1]);
                                }
                                else
                                {
                                    $odlamki = explode(' : ', $wyposazenie);
                                    $odlamki[0] = $tlumaczenia->Tlumacz($jezyk_id, $odlamki[0]);
                                    $odlamki[1] = $tlumaczenia->Tlumacz($jezyk_id, $odlamki[1]);
                                    
                                    $tresc_html .= UtilsUI::DodajTrOferta($nag_stat_zaw.$odlamki_1[0].$stopka_stat_zaw, $nag_stat_zaw.$odlamki_1[1].$stopka_stat_zaw, 
                                    $nag_stat_zaw.$odlamki[0].$stopka_stat_zaw, $nag_stat_zaw.$odlamki[1].$stopka_stat_zaw);
                                    $odlamki_1 = null;
                                }
                                $i++;
                            }
                            $cena = number_format($wiersz[StronaOfertaDAL::$cena], 0, ',', '.');
                            $wylacznosc = '';
                            if ($wiersz[StronaOfertaDAL::$wylacznosc])
                            {
                                $wylacznosc = '<span class="wylacznosc">'.$tlumaczenia->Tlumacz($jezyk_id, tags::$wylacznosc).'</span>';
                            }
                            else
                            {
                                $wylacznosc .= $status;
                                $status = '';
                            }
                            //link
                            $link = '<a href="http://'.$_SERVER['SERVER_NAME'].'/index.php?target=oferta&'.tags::$oferta.'='.$wiersz[StronaOfertaDAL::$id_oferta].'&'.StronaPodsInfoDAL::$id_trans_rodzaj.'='.
                            $wiersz[StronaPodsInfoDAL::$id_trans_rodzaj].'&'.StronaPodsInfoDAL::$id_nier_rodzaj.'='.$wiersz[StronaPodsInfoDAL::$id_nier_rodzaj].'">'.
                            $tlumaczenia->Tlumacz($jezyk_id, tags::$wiecej_o_nieruchomosci).'</a>';
                            if ($odlamki_1) //jesli nieparzysta ilosc wszystkich elementow
                            {
                                $tresc_html .= UtilsUI::DodajTrOferta($nag_stat_zaw.$odlamki_1[0].$stopka_stat_zaw, $nag_stat_zaw.$odlamki_1[1].$stopka_stat_zaw, 
                                $nag_stat_zaw.$tlumaczenia->Tlumacz($jezyk_id, tags::$cena).$stopka_stat_zaw, $nag_stat_zaw.$cena.' PLN.'.$stopka_stat_zaw);
                                //stat wyl link
                            }
                            else
                            {
                                if (strlen($wylacznosc) == 0 && strlen($status) == 0)
                                {
                                    $wylacznosc = $link;
                                    $link = '';
                                }
                                $tresc_html .= UtilsUI::DodajTrOferta($nag_stat_zaw.$tlumaczenia->Tlumacz($jezyk_id, tags::$cena).$stopka_stat_zaw, $nag_stat_zaw.$cena.' PLN.'.$stopka_stat_zaw, $wylacznosc, '');
                                $wylacznosc = '';
                                //link
                                
                                //'<tr><td>'.$nag_stat_zaw.'<b>'.$tlumaczenia->Tlumacz($jezyk_id, tags::$cena).': </b>'.$cena.' PLN.'.
                                //$stopka_stat_zaw.'&nbsp;'.$status.'&nbsp;'.$wylacznosc.'</td><td></td></tr>';
                            }
                            if (strlen($wylacznosc) > 0 && strlen($status) > 0)
                            {
                                $wylacznosc = $wylacznosc.'&nbsp;'.$status;
                                $status = '';
                            }
                            $tresc_html .= UtilsUI::DodajTrOferta($wylacznosc.$status, '', $link, '');
                            
                            $tresc_html .= '</table></td></tr></table></td></tr>';
                            $licznik++;
                        }
                        $tresc_html .=  '</table></td></tr>';
                
                        $tresc_html .= '</table>';
                    }
                }
                
                $il_region++;
            }
            
            return $tresc_html;
        }
        public static function AgenciLista($wynik, $jezyk_id, $szczegoly = false)
        {
            $path = str_replace($_SERVER['PHP_SELF'], '', $_SERVER['SCRIPT_FILENAME']).'/'; 
            
            require($path.'conf.php');
            
            $tlumaczenia = cachejezyki::Czytaj();
            
            $tresc_html = '';
            
            $tresc_html .= '<table '.$atr_tab_srodek.'>'.UtilsUI::DodajTrListwaGlowna($tlumaczenia->Tlumacz($jezyk_id, tags::$agenci));
            $tresc_html .= '<tr><td><table width="100%">'; 
            $licznik = 0;
            foreach ($wynik as $wiersz)
            {
                if ($licznik % 2 == 0)
                {
                    $kolor_tlo = '#9fc0f3';
                }
                else
                {
                    $kolor_tlo = '#7a9cdc';
                }
                
                
                $tresc_html .= '<tr style="background-color: '.$kolor_tlo.';"><td style="border: 1px solid black;"><table width="100%"><tr><td><table cellpadding="1" cellspacing="1"><tr><td width="20%"><b>'.
                $tlumaczenia->Tlumacz($jezyk_id, tags::$imie_i_nazwisko).':</b><br />'.$wiersz[OsobaDAL::$nazwa].'</td><td width="24%"><b>'.$tlumaczenia->Tlumacz($jezyk_id, tags::$telefon_stacjonarny).':</b><br />'.
                $wiersz[OsobaDAL::$telefon].'</td><td width="24%"><b>'.$tlumaczenia->Tlumacz($jezyk_id, tags::$telefon_komorkowy).':</b><br />'.$wiersz[OsobaDAL::$komorka].'</td><td width="20%"><b>'.
                $tlumaczenia->Tlumacz($jezyk_id, tags::$adres_email).':</b><br />'.$wiersz[OsobaDAL::$email];
                
                $tresc_html .= '</td></tr>';
                if ($szczegoly)
                {
                    $tresc_html .= '<tr><td><a href="'.$_SERVER['PHP_SELF'].'?target=agent&'.NieruchomoscDAL::$id_agent.'='.$wiersz[NieruchomoscDAL::$id_agent].'">'.
                    $tlumaczenia->Tlumacz($jezyk_id, tags::$wiecej).'</a></td></tr>';
                }
                $tresc_html .= '</table></td><td align="right">';
                
                if (is_file('gfx/'.$wiersz[ExportDAL::$zdjecie]))
                {
                    $tresc_html .= '<img src="gfx/'.$wiersz[ExportDAL::$zdjecie].'" height="80"></img>';
                }
                
                $tresc_html .= '</td></tr></table>';
                    
                $tresc_html .= '</td></tr>';
                $licznik++;
            }
            
            $tresc_html .= '</table></td></tr></table>';
            
            
            return $tresc_html;
        }
        public static function ZleceniaLista($wynik, $rodzaj_oferty, $jezyk_id)
        {
            $path = str_replace($_SERVER['PHP_SELF'], '', $_SERVER['SCRIPT_FILENAME']).'/'; 
            
            require($path.'conf.php');
            
            $tlumaczenia = cachejezyki::Czytaj();
            
            $tresc_html = '';
            
            $tresc_html .= '<table '.$atr_tab_srodek.'>'.
            UtilsUI::DodajTrListwaGlowna($tlumaczenia->Tlumacz($jezyk_id, $rodzaj_oferty[0][StronaOfertaDAL::$transakcja_rodzaj]).' - '.
            $tlumaczenia->Tlumacz($jezyk_id, $rodzaj_oferty[0][StronaOfertaDAL::$nieruchomosc_rodzaj]));
            $tresc_html .= '<tr><td><table width="100%">';
            $licznik = 0;

            foreach ($wynik as $wiersz)
            {
                if (is_array($wiersz[StronaOfertaDAL::$lokalizacja]))
                {
                    if ($licznik % 2 == 0)
                    {
                        $kolor_tlo = '#9fc0f3';
                    }
                    else
                    {
                        $kolor_tlo = '#7a9cdc';
                    }
                    
                    
                    $tresc_html .= '<tr style="background-color: '.$kolor_tlo.';"><td style="border: 1px solid black;">
                    <table cellpadding="1" cellspacing="1">';
                    $tresc_html .= '<tr><td width="20%"><b>'.$tlumaczenia->Tlumacz($jezyk_id, tags::$nr_zapotrzebowania).':</b><br />'.$wiersz[NieruchomoscDAL::$id_zapotrzebowanie].'</td><td width="40%"><b>'.
                    $tlumaczenia->Tlumacz($jezyk_id, tags::$lokalizacja).':</b><br />';
                    $przecinek = false;

                    foreach ($wiersz[StronaOfertaDAL::$lokalizacja] as $lokalizacja)
                    {
                        if ($przecinek)
                        {
                            $tresc_html .= ', '.$lokalizacja;
                        }
                        else
                        {
                            $przecinek = true;
                            $tresc_html .= $lokalizacja;
                        }
                    }
                    $tresc_html .= '</td>';
                    
                    $tresc_html .= '<td width="40%" style="color: red;">';
                    $gg = '';
                    if ($wiersz[StronaOfertaDAL::$gg])
                    {
                        $gg = '<a href="gg:'.$wiersz[StronaOfertaDAL::$gg].'"><img style="border: 0px;" src="gfx/gadu.gif"></img></a>&nbsp;&nbsp;&nbsp;';
                    }
                    $tresc_html .= $tlumaczenia->Tlumacz($jezyk_id, tags::$posiadasz_taka_oferte).', '.strtolower($tlumaczenia->Tlumacz($jezyk_id, tags::$napisz_do_mnie)).': '.$gg.
                    '<a href="mailto:'.$wiersz[StronaOfertaDAL::$email].'"><img style="border: 0px;" src="gfx/mail.gif"></img></a><br /><b>'.$tlumaczenia->Tlumacz($jezyk_id, tags::$telefon).': </b>'.$wiersz[OsobaDAL::$komorka].', '.$wiersz[StronaOfertaDAL::$telefon]; 
                    $tresc_html .= '</td></tr><tr>';

                    if ($wiersz[ExportDAL::$liczba_pokoi] != null || $wiersz[ExportDAL::$liczba_pokoi_max] != null)
                    {
                        $tresc_html .= '<td>'.$tlumaczenia->Tlumacz($jezyk_id, tags::$liczba_pokoi).':<br />';
                        if ($wiersz[ExportDAL::$liczba_pokoi] != null)
                        {
                            $tresc_html .= $tlumaczenia->Tlumacz($jezyk_id, tags::$od).' '.$wiersz[ExportDAL::$liczba_pokoi];
                        }
                        if ($wiersz[ExportDAL::$liczba_pokoi_max] != null)
                        {
                            $tresc_html .= ' '.$tlumaczenia->Tlumacz($jezyk_id, tags::$do).' '.$wiersz[ExportDAL::$liczba_pokoi_max];
                        }
                        $tresc_html .= '</td>';
                        
                    }
                    else
                    {
                        $tresc_html .= '<td></td>';
                    }
                    
                    if ($wiersz[MediaDAL::$powierzchnia] != null || $wiersz[MediaDAL::$powierzchnia_max] != null)
                    {
                        $tresc_html .= '<td>'.$tlumaczenia->Tlumacz($jezyk_id, tags::$powierzchnia).':<br />';
                        if ($wiersz[MediaDAL::$powierzchnia] != null)
                        {
                            $tresc_html .= $tlumaczenia->Tlumacz($jezyk_id, tags::$od).' '.$wiersz[MediaDAL::$powierzchnia];
                        }
                        if ($wiersz[MediaDAL::$powierzchnia_max] != null)
                        {
                            $tresc_html .= ' '.$tlumaczenia->Tlumacz($jezyk_id, tags::$do).' '.$wiersz[MediaDAL::$powierzchnia_max];
                        }
                        $tresc_html .= '</td>';
                        
                    }
                    else
                    {
                        $tresc_html .= '<td></td>';
                    }
                    
                    $tresc_html .= '<td>'.$tlumaczenia->Tlumacz($jezyk_id, tags::$agent_prowadzacy).': <a href="mailto:'.$wiersz[StronaOfertaDAL::$email].'">'.
                    $wiersz[NieruchomoscDAL::$agent].'</a></td>';
                    
                    $tresc_html .= '</tr></table>';
                    
                    $tresc_html .= '</td></tr>';
                    $licznik++;
                }
            }
            $tresc_html .= '</table></td></tr>';
            $tresc_html .= '</table>';
            
            
            return $tresc_html;
        }
        ///deprecating, new version in progress
        public static function OfertaSzczegolowa($oferta, $jezyk_id, $agent_dane, $sekcje, $pomieszczenia, $pokaz_zdj = true)
        {
            //var_dump($oferta);
            $tlumaczenia = cachejezyki::Czytaj();
            ///wstrzymana poczatek i koniec
            $wst_p = '';
            $wst_k = '';
            if ($oferta[StronaOfertaDAL::$status] == tags::$wstrzymana)
            {
                $wst_p = '<u>';
                $wst_k = '</u>';
            }
            if ($oferta[StronaOfertaDAL::$klucz])
            {
                //filter:progid:DXImageTransform.Microsoft.AlphaImageLoader (src='images/image.png',sizingMethod='scale');
                $wst_k .= '&nbsp;<img width="15" src="img/kluczyk.gif"></img>';
            }
            $styl_status = '';
            if ($oferta[StronaOfertaDAL::$status] == tags::$umowiona || $oferta[StronaOfertaDAL::$status] == tags::$wstrzymana)
            {
                $oferta[StronaOfertaDAL::$status] = tags::$aktualna;
            }
            else if ($oferta[StronaOfertaDAL::$status] == tags::$zawieszona)
            {
                $styl_status = 'style="color: red;"';
            }
            $tekst = '';
            $tekst .= '<br /><center><table width="512" border="1" class="tableBorder">'; //frame="above,below,rhs" rules="groups"
            $tekst .= '<tr><td colspan="40" height="7" class="tdnag"><span class="nag1wb">&nbsp;'.
            UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($jezyk_id, tags::$informacje_ogolne), $jezyk_id).'</span></td></tr>';
            $tekst .= '<tr><td class="strtd"><b>'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($jezyk_id, tags::$numer_oferty), $jezyk_id).':</b> '.$wst_p.$oferta[StronaOfertaDAL::$id_oferta].$wst_k.
            '</td><td class="strtd"><b>'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($jezyk_id, tags::$status), $jezyk_id).':</b> <span '.$styl_status.'>'.
            UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($jezyk_id, $oferta[StronaOfertaDAL::$status]), $jezyk_id).'</span></td>
            <td class="strtd" colspan="20"><b>'.
            UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($jezyk_id, tags::$posrednik), $jezyk_id).': </b><a href="mailto:'.$oferta[StronaOfertaDAL::$email].'">'.
            UtilsUI::KonwersjaEncoding($agent_dane, $jezyk_id).'</a> <b>'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($jezyk_id, tags::$telefon), $jezyk_id).': </b>'.
            $oferta[OsobaDAL::$komorka].', '.$oferta[StronaOfertaDAL::$telefon].'</td></tr>';
            
            if ($oferta[StronaOfertaDAL::$czas_przekazania] == 0)
            {
                $oferta[StronaOfertaDAL::$czas_przekazania] = UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($jezyk_id, tags::$od_zaraz), $jezyk_id);
            }
            //var_dump($sekcje[1][StronaOfertaDAL::$parametry]);
            //$cena_m2 = $oferta[StronaOfertaDAL::$cena] / $sekcje[1][StronaOfertaDAL::$parametry][StronaOfertaDAL::$powierzchnia_uzytkowa];
            $cena = number_format($oferta[StronaOfertaDAL::$cena], 0, ',', '.');
            $cena_pop = $oferta[StronaOfertaDAL::$cena_pop];
            
            if (strlen($oferta[StronaOfertaDAL::$cena_pop]) > 0)
            {
                $cena_pop = number_format($oferta[StronaOfertaDAL::$cena_pop], 0, ',', '.');
            }
            
            if ($oferta[StronaOfertaDAL::$rynek_pierw])
            {
                $rodzaj_rynek = UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($jezyk_id, tags::$rynek_pierwotny), $jezyk_id);
            }
            else
            {
                $rodzaj_rynek = UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($jezyk_id, tags::$rynek_wtorny), $jezyk_id);
            }
            //<span class="cenapop">'.$cena_pop.'</span>
            $tekst .= '<tr><td class="strtd" colspan="2"><b>'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($jezyk_id, tags::$lokalizacja), $jezyk_id).': </b>'.
            UtilsUI::KonwersjaEncoding($oferta[StronaOfertaDAL::$lokalizacja], $jezyk_id).
            '</td><td class="strtd"><b>'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($jezyk_id, tags::$wojewodztwo), $jezyk_id).': </b> '.
            UtilsUI::KonwersjaEncoding($oferta[StronaOfertaDAL::$wojewodztwo], $jezyk_id).'</td><td class="strtd"><b>'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($jezyk_id, tags::$powiat), $jezyk_id).
            ': </b> '.UtilsUI::KonwersjaEncoding($oferta[StronaOfertaDAL::$powiat], $jezyk_id).'</td></tr><tr><td class="strtd" colspan="2"><b>'.
            UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($jezyk_id, tags::$cena), $jezyk_id).': </b> '.$cena.' PLN</td>
            <td class="strtd"><b>'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($jezyk_id, tags::$typ_nieruchomosci), $jezyk_id).': </b>'.
            UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($jezyk_id, $oferta[StronaOfertaDAL::$rodzaj_budynek]), $jezyk_id).'</td>
            <td class="strtd" colspan="2"><b>'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($jezyk_id, tags::$rodzaj_rynek), $jezyk_id).': </b>'.$rodzaj_rynek.'</td></tr>
            <tr><td class="strtd" colspan="3"><b>'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($jezyk_id, tags::$czas_przekazania_m), $jezyk_id).': </b>'.$oferta[StronaOfertaDAL::$czas_przekazania].'</td>';
            if ($oferta[NieruchomoscDAL::$wylacznosc])
            {
                $tekst .= '<td><span class="wyl">'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($jezyk_id, tags::$wylacznosc), $jezyk_id).'</span></td>';
            }
            $tekst .= '</tr>';
            
            
            //<td class="strtd" colspan="2"><b>'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($jezyk_id, tags::$cena_m2), $jezyk_id).': </b>'.$oferta[StronaOfertaDAL::$cena].'</td>

            if (is_array($sekcje))
            foreach ($sekcje as $sekcja)
            {
                $tekst .= '<tr><td colspan="40" height="7" class="tdnag"><span class="nag1wb">&nbsp;'.
                UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($jezyk_id, $sekcja[StronaOfertaDAL::$nazwa]), $jezyk_id).'</span></td></tr>';
                
                $i = 0;
                $tekst .= '<tr><td colspan="40"><table width="100%" align="center" border="1" class="tableBorder">';
                
                if (isset($sekcja[StronaOfertaDAL::$parametry]))
                {
                    $licz_par = 0;
                    //foreach ($sekcja[StronaOfertaDAL::$parametry] as $klucz => $wartosc)
                    while (isset($sekcja[StronaOfertaDAL::$parametry][$licz_par]))
                    {
                        $wartosc = $sekcja[StronaOfertaDAL::$parametry][$licz_par];
                        $licz_par++;
                        if ($i % 4 == 0)
                        {
                            $tekst .= '<tr>';
                        }
                        $odlamki = explode(' : ', $wartosc);
                        //$odlamki = explode(' : ', UtilsUI::KonwersjaEncoding($tlumaczenia->TlumaczZlozenieTag($jezyk_id, $wartosc, ' : '), $jezyk_id));
                        $tekst .= '<td class="strtd"><b>'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($jezyk_id, $odlamki[0]), $jezyk_id).': </b>'.
                        UtilsUI::KonwersjaEncoding($odlamki[1], $jezyk_id).'</td>';
                        //echo $odlamki[0];
                        if ($odlamki[0] == StronaOfertaDAL::$powierzchnia_uzytkowa)
                        {
                            $sekcja[StronaOfertaDAL::$parametry][count($sekcja[StronaOfertaDAL::$parametry])] = tags::$cena_m2.' : '.round($oferta[StronaOfertaDAL::$cena] / $odlamki[1], 2);
                            //var_dump($sekcja[StronaOfertaDAL::$parametry]);
                        }
                        
                        $i++;
                        if ($i % 4 == 0)
                        {
                            $tekst .= '</tr>';
                        }
                    }   
                }
                if (isset($sekcja[StronaOfertaDAL::$wyposazenia]))
                {
                    foreach ($sekcja[StronaOfertaDAL::$wyposazenia] as $klucz => $wartosc)
                    {
                        if ($i % 4 == 0)
                        {
                            $tekst .= '<tr>';
                        }
                        $odlamki = explode(' : ', UtilsUI::KonwersjaEncoding($tlumaczenia->TlumaczZlozenieTag($jezyk_id, $wartosc, ' : '), $jezyk_id));
                        $tekst .= '<td class="strtd"><b>'.$odlamki[0].': </b>'.$odlamki[1].'</td>';
                        //$tekst .= '<td>'.UtilsUI::KonwersjaEncoding($tlumaczenia->TlumaczZlozenieTag($jezyk_id, $wartosc, ' : '), $jezyk_id).'</td>';
                        
                        $i++;
                        if ($i % 4 == 0)
                        {
                            $tekst .= '</tr>';
                        }
                    }   
                }
                
                $tekst .= '</table></td></tr>';
            }
            
            if (isset($oferta[StronaOfertaDAL::$zdjecie]) && $pokaz_zdj)
            {
                $_SERVER['SERVER_NAME'] = 'www.azg.pl'; //zmienic na www azg pl
                $i = 0;
                $tekst .= '<tr><td colspan="40" height="7" class="tdnag"><span class="nag1wb">&nbsp;'.
                UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($jezyk_id, tags::$zdjecia_oferty), $jezyk_id).'</span></td></tr>';
                $tekst .= '<tr><td colspan="40"><table width="100%" align="center" cellpadding="0" cellspacing="0">';
                foreach ($oferta[StronaOfertaDAL::$zdjecie] as $zdjecie)
                {
                    if ($i % 4 == 0)
                    {
                        $tekst .= '<tr>';
                    }

                    $tekst .= '<td><img src="http://'.$_SERVER['SERVER_NAME'].'/media/'.$oferta[StronaOfertaDAL::$id_nieruchomosc].'/zdjecia/m_'.$zdjecie.'" width="125" height="100" style="cursor: pointer;" border="0" class="ira" 
                    onclick="NewWindow(\'image.php?p=http://'.$_SERVER['SERVER_NAME'].'/media/'.$oferta[StronaOfertaDAL::$id_nieruchomosc].'/zdjecia/'.$zdjecie.'&w=550&h=350&i=Zdjecie\', \'name\', 570, 370, \'no\');return false;"></img></td>';
                    
                    $i++;

                    if ($i % 4 == 0)
                    {
                        $tekst .= '</tr>';
                    }
                }
                $tekst .= '</table></td></tr>';
            }
            
            if (isset($oferta[StronaOfertaDAL::$film]))
            {
                $i = 0;
                $tekst .= '<tr><td colspan="40" height="7" class="tdnag"><span class="nag1wb">&nbsp;'.
                UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($jezyk_id, tags::$filmy), $jezyk_id).'</span></td></tr>';
                $tekst .= '<tr><td colspan="40"><table width="100%" align="center" border="1" cellpadding="1" cellspacing="1" class="tableBorder">';
                foreach ($oferta[StronaOfertaDAL::$film] as $film)
                {
                    if ($i % 4 == 0)
                    {
                        $tekst .= '<tr>';
                    }
                    
                    $tekst .= '<td><a href="media/'.$oferta[StronaOfertaDAL::$id_nieruchomosc].'/filmy/'.$film.'" target="_blank"><img src="../img/camera2.jpg" width="50" height="42" align="left" border="0"></img></a></td>';
                    
                    $i++;

                    if ($i % 4 == 0)
                    {
                        $tekst .= '</tr>';
                    }
                }
                $tekst .= '</table></td></tr>';
            }
            
            if (isset($pomieszczenia))
            {
                $tekst .= '<tr><td colspan="40" height="7" class="tdnag" align="center"><span class="nag1wb">&nbsp;'.
                UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($jezyk_id, tags::$pomieszczenia), $jezyk_id).'</span></td></tr>';
                //var_dump($pomieszczenia);
                foreach ($pomieszczenia as $pomieszczenie)
                {
                    //trzeba sprawdzic dla numeru 1 czy w calej tablicy jest wiecej takich pomieszczen ;/
                    $nr = null;
                    if ($pomieszczenie[StronaOfertaDAL::$nr_pomieszczenie] > 1)
                    {
                        $nr = ' '.$pomieszczenie[StronaOfertaDAL::$nr_pomieszczenie];
                    }
                    $tekst .= '<tr><td colspan="40" height="7" class="tdnag"><span class="nag1wb">&nbsp;'.
                    UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($jezyk_id, $pomieszczenie[StronaOfertaDAL::$nazwa]), $jezyk_id).$nr.'</span></td></tr>';
                    
                    $i = 0;
                    $tekst .= '<tr><td colspan="40"><table width="100%" align="center" border="1" cellpadding="1" cellspacing="1" class="tableBorder">';
                    
                    if (isset($pomieszczenie[StronaOfertaDAL::$parametry]))
                    {
                        foreach ($pomieszczenie[StronaOfertaDAL::$parametry] as $klucz => $wartosc)
                        {
                            if ($i % 4 == 0)
                            {
                                $tekst .= '<tr>';
                            }
                            
                            $odlamki = explode(' : ', UtilsUI::KonwersjaEncoding($tlumaczenia->TlumaczZlozenieTag($jezyk_id, $wartosc, ' : '), $jezyk_id));
                            $tekst .= '<td class="strtd"><b>'.$odlamki[0].': </b>'.$odlamki[1].'</td>';
                            //$tekst .= '<td class="strtd">'.UtilsUI::KonwersjaEncoding($tlumaczenia->TlumaczZlozenieTag($_SESSION[$jezyk], $wartosc, ' : '), $_SESSION[$jezyk]).'</td>';
                            
                            $i++;
                            if ($i % 4 == 0)
                            {
                                $tekst .= '</tr>';
                            }
                        }   
                    }
                    if (isset($pomieszczenie[StronaOfertaDAL::$wyposazenia]))
                    {
                        foreach ($pomieszczenie[StronaOfertaDAL::$wyposazenia] as $klucz => $wartosc)
                        {
                            if ($i % 4 == 0)
                            {
                                $tekst .= '<tr>';
                            }
                            
                            $odlamki = explode(' : ', UtilsUI::KonwersjaEncoding($tlumaczenia->TlumaczZlozenieTag($jezyk_id, $wartosc, ' : '), $jezyk_id));
                            $tekst .= '<td class="strtd"><b>'.$odlamki[0].': </b>'.$odlamki[1].'</td>';
                            //$tekst .= '<td>'.UtilsUI::KonwersjaEncoding($tlumaczenia->TlumaczZlozenieTag($_SESSION[$jezyk], $wartosc, ' : '), $_SESSION[$jezyk]).'</td>';
                            
                            $i++;
                            if ($i % 4 == 0)
                            {
                                $tekst .= '</tr>';
                            }
                        }   
                    }
                    
                    $tekst .= '</table></td></tr>';
                }
            }
            
            $tekst .= '<tr><td colspan="40" height="7" class="tdnag" align="center"><span class="nag1wb">&nbsp;'.
            UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($jezyk_id, tags::$opis_nieruchomosci), $jezyk_id).'</span></td></tr>';
            
            if (isset($oferta[StronaOfertaDAL::$opis][$jezyk_id]))
            {
                $oferta[StronaOfertaDAL::$opis][$jezyk_id] = str_replace("\r", '<br />', $oferta[StronaOfertaDAL::$opis][$jezyk_id]);
                $tekst .= '<tr><td colspan="40">'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($jezyk_id, $oferta[StronaOfertaDAL::$opis][$jezyk_id]), $jezyk_id).'</td></tr>';
            }
            
            $tekst .= '</table>';
            return $tekst;
        }
        public static function TablicaDoXML ($tablica, &$xml, $tag_glowny)
        {
            $xml .= '<'.$tag_glowny.'>';
            foreach ($tablica as $klucz => $wartosc)
            {
                if (is_array($wartosc))
                {
                    if (is_int($klucz))
                    {
                        UtilsUI::TablicaDoXML($wartosc, $xml, $tag_glowny.'_zagn');
                    }
                    else
                    {
                        UtilsUI::TablicaDoXML($wartosc, $xml, $klucz.'_zagn');
                    }
                }
                else
                {
                    if (is_int($klucz))
                    {
                        $xml .= '<'.$tag_glowny.'_uzyc>';
                        $xml .= $wartosc;
                        $xml .= '</'.$tag_glowny.'_uzyc>';
                    }
                    else
                    {
                        $xml .= '<'.$klucz.'>';
                        $xml .= $wartosc;
                        $xml .= '</'.$klucz.'>';
                    }
                }
            }
            $xml .= '</'.$tag_glowny.'>';
            //$xml = .$xml;
        }
        
        public static function InfoBlad($text)
        {
            echo '<p class="text_blad">'.$text.'.</p><br />';
        }
        public static function IstotneInfo($text)
        {
            echo '<b>'.$text.'.</b><br />';
        }
        
        public static function KonwersjaEncoding($text, $jezyk)
        {
            $wynik = iconv('UTF-8', 'ISO-8859-2', $text);
            return $wynik;
        }
        /**
        * @desc wykropkowanie wolnego miejsca do odrecznego wprowadzenia danej - do szablonow umow itp
        * @param ilosc_kropek
        */
        public static function PusteMsc($dlugosc)
        {
            $txt = '';
            $i = 0;
            while ($dlugosc > $i)
            {
                $txt .= '..';
                $dlugosc--;
            }
            
            return $txt;
        }
        /**
        * @desc Wyliczenie dlugosci tekstu zwazywszy jego roznorodnosc - odroznienie . od w itd. Przyjeto jednostki pseudomiarowe 1 mm - dlugosci podawane sa w mm
        * @param text_do_zmiezenia
        */
        public static function DlugoscTxt ($text)
        {
            $dl_elem = array('a' => 2, 'A' => 3, 'b' => 2, 'B' => 3, 'c' => 2, 'C' => 3, 'd' => 2, 'D' => 3, 'e' => 2, 'E' => 3, 'f' => 2, 'F' => 3, 'g' => 2, 'G' => 3, 'h' => 2, 'H' => 3, 'i' => 2, 'I' => 3, 
            'j' => 2, 'J' => 3, 'k' => 2, 'K' => 3, 'l' => 2, 'L' => 3, 'ł' => 2, 'Ł' => 3, 'm' => 2, 'M' => 3, 'n' => 2, 'N' => 3, 'o' => 2, 'O' => 3, 'p' => 2, 'P' => 3, 'r' => 2, 'R' => 3, 's' => 2, 'S' => 3,
            't' => 2, 'T' => 3, 'u' => 2, 'U' => 3, 'w' => 2, 'W' => 3, 'y' => 2, 'Y' => 3, 'z' => 2, 'Z' => 3, '.' => 1);
            
            $dlugosc = 0;
            $i = 0;
            
            while (isset($text[$i]))
            {
                $znak = $text[$i];
                if (isset($dl_elem[$znak]))
                {
                    $dlugosc += $dl_elem[$znak];
                }
                else
                {
                    $dlugosc += 1;
                }
                $i++;
            }
            
            return $dlugosc;
        }
        public static function ObrazRozmiarNorm($resourceimage)
        {
            list($width, $height) = getimagesize($resourceimage);
            $newwidth = 550;
            $newheight = 350;
            if ($newwidth < $width || $newheight < $height)
            {
                $thumb = imagecreatetruecolor($newwidth, $newheight);
                $source = imagecreatefromjpeg($resourceimage);
                imagecopyresized($thumb, $source, 0, 0, 0, 0, $newwidth, $newheight, $width, $height);
                      //image data, image name, quality    
                ImageJPEG($thumb, $resourceimage, 90);
            }
            //return $obraz;
        }

        public static function ObrazRozmiarPom ($resourceimage, $destimage)
        {
            list($width, $height) = getimagesize($resourceimage);
            $newwidth = 125;
            $newheight = 100;
            $thumb = imagecreatetruecolor($newwidth, $newheight);
            $source = imagecreatefromjpeg($resourceimage);
            imagecopyresized($thumb, $source, 0, 0, 0, 0, $newwidth, $newheight, $width, $height);
                  //image data, image name, quality    
            ImageJPEG($thumb, $destimage, 85);
            //return $obraz;
        }
        public static function PodajNaglowekFirmowy($jezyk_id)
        {
            $_SERVER['SERVER_NAME'] = 'www.azg.pl';//zmienic na azg pl
            $tlumaczenia = cachejezyki::Czytaj();
            
            $tresc = '<table border="0" width="100%"><tr><td><img src="http://'.$_SERVER['SERVER_NAME'].'/zdj/logo_l.jpg"  width=181 border=0></img></td><td align="right"><table border="0"><tr>
                    <td align="right" colspan="3" style="font-size: 13px;"><b>'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($jezyk_id, tags::$biuro_nieruchomosci), $jezyk_id).' A.Z.GWARANCJA<br />
                    Andrzej Zapart '.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($jezyk_id, tags::$lic_zaw_nr), $jezyk_id).' 3125<br />e-mail: azgwarancja@azg.pl, www.azg.pl</b></td>
                    </tr><tr><td align="right" style="font-size: 12px;"><b><u>'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($jezyk_id, tags::$filia), $jezyk_id).' '.
                    UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($jezyk_id, tags::$nr), $jezyk_id).' 1:</u><br />'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($jezyk_id, tags::$ul), $jezyk_id)
                    .'. Bytnara Rudego 13,<br />45-265 Opole<br />'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($jezyk_id, tags::$tel_fax), $jezyk_id).'(077)458-00-94</b></td>
                    <td width="1%" height="100%"><IMG height="100%" src="http://'.$_SERVER['SERVER_NAME'].'/zdj/black.gif" width="1" border="0"></img></td>
                    <td align="right" style="font-size: 12px;"><b><u>'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($jezyk_id, tags::$siedziba_glowna), $jezyk_id).':</u><br />'.
                    UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($jezyk_id, tags::$ul), $jezyk_id).' '.UtilsUI::KonwersjaEncoding('Szarych Szeregów 34d', $jezyk_id).',<br>45-285 Opole<br />'.
                    UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($jezyk_id, tags::$tel_fax), $jezyk_id).'(077)402-75-20</b></td>
                    </tr></table></td></tr></table><hr color="black"/>';
            
            return $tresc;
        }
    }
    ///xajaxowe selecty wyposazen
    //wczytanie kolekcji oraz wyswietlenie jej na ekranie w polu rozwijalnym
    /*$kol = $kolWyp[$klucz]->PodajDostepneWyposazenie();
    $kolWyb = $kolWyp[$klucz]->PodajWybraneWyposazenie();
    
    echo '<table><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wybrane).'</td><td>';
    echo KontrolkiHtml::DodajSelectWyposazenie('wyb'.$kolWyp[$klucz]->tag, 'wyb'.$kolWyp[$klucz]->id_sekcja, $kolWyb, 'wyb'.$kolWyp[$klucz]->tag.$kolWyp[$klucz]->id_sekcja);
    echo '</td><td>';
    KontrolkiHtml::DodajSubmit('wybsekcja'.$klucz, $klucz, $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zatwierdz), 'onclick="sekcja_id.value = this.id; return false;"');
    
    echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$dostepne).'</td><td name="tdsekcja'.$klucz.'" id="tdsekcja'.$klucz.'">';
    echo KontrolkiHtml::DodajSelectWyposazenie($kolWyp[$klucz]->tag, $kolWyp[$klucz]->id_sekcja, $kol, $kolWyp[$klucz]->tag.$kolWyp[$klucz]->id_sekcja);
    echo '</td><td>';
    KontrolkiHtml::DodajSubmit('sekcja'.$klucz, $klucz, $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zatwierdz), 'onclick="sekcja_id.value = this.id; DodajWyposazenie(\'tdsekcja'.$klucz.'\', '.$kolWyp[$klucz]->tag.$kolWyp[$klucz]->id_sekcja.'.value, this.id); return false;"');
    echo '</td></tr></table>';*/
?>
