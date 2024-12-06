<?php
    $path = str_replace($_SERVER['PHP_SELF'], '', $_SERVER['SCRIPT_FILENAME']).'/';
    
    include_once ($path.'ui/kontrolki_html.php');
    include_once ($path.'bll/jezykibll.php');
    include_once ($path.'bll/cache.php');
    include_once ($path.'bll/agentbll.php');
    
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
    }
    
    class UtilsUI
    {
        public static $strona = 30;
        //metoda dodaje wszystkie sekcje formularza
        public static function DodajSekcja($paramNier, $CzyNier = true)
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
                $id_un = $_SESSION[NieruchomoscDAL::$id_oferta];
            }
            else
            {
                $pomieszczenia = null;
                $popuphref = "sekcjezapotrzebowanie";
                $id_un_zm = NieruchomoscDAL::$id_zapotrzebowanie;
                $id_un = $_SESSION[NieruchomoscDAL::$id_zapotrzebowanie];
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
            
            //przechodzenie po kolejnych sekcjach
            foreach ($sekcje as $klucz => $wartosc)
            {                
                echo '<br /><hr />'.$wartosc.'<br />';
                //jesli istnieje kolekcja wyposazen dla danej sekcji
                if(isset($kolWyp[$klucz]))
                {
                    //doklepac do url id of lub zap
                    KontrolkiHtml::DodajPopUpButton($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wybierz), 'sekcja'.$klucz, $popuphref.'.php?sekcja='.$klucz.'&'.$id_un_zm.'='.$id_un, 600, 600);
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
                    KontrolkiHtml::DodajPopUpButton($wartosc, 'pomieszczenie'.$klucz, 'popup/pomieszczenia.php?'.
                    WyposazenieNierDAL::$id_pomieszczenie.'='.$klucz.'&'.WyposazenieNierDAL::$nazwa_pomieszczenie.'='.$wartosc.'&'.$id_un_zm.'='.$id_un, 600, 600);
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
                                                                                                                                //tablica: atrybut name => wartosc na przycisku
        public static function WyswietlTab1Poz ($wynik, $WyswKolumny, $naglowki, $index, $HiddenNazwa, $akcje, $nagIndAk = null, $przycIndAk = null, PopUpWysw $popup = null)
        {
            $path = str_replace($_SERVER['PHP_SELF'], '', $_SERVER['SCRIPT_FILENAME']).'/';
            require ($path.'conf.php');
            $ilosc = count($wynik);
            $licz = 1;
            echo '<table align="center"><tr>';//<td onclick="PokazStrone(\'strona_grid\', \'strona_grid_wid\', 1);">1</td>';
            while ($ilosc > 0)
            {
                echo '<td id="str_element'.$licz.'" style="cursor: pointer;" onclick="PokazStrone(this, \'strona_grid\', \'strona_grid_wid\', \'str_element\', '.$licz.');"> '.$licz.' </td>';
                $licz++;
                $ilosc -= UtilsUI::$strona;
            }
            echo '</tr></table>';
            //session_start();
            $tlumaczenia = cachejezyki::Czytaj();
            $uprawnienia = unserialize($_SESSION[$zalogowany]);
            $i = 0;
            $licz = 1;
            KontrolkiHtml::DodajHidden($HiddenNazwa, $HiddenNazwa, '');
            KontrolkiHtml::DodajHidden('strona_grid_wid', 'strona_grid_wid', 1);
            $wyswietl = "";
            while(isset($wynik[$i]))
            {
                if ($i % UtilsUI::$strona == 0)
                {
                    //echo $wyswietl;
                    //".$wyswietl." position: absolute;
                    echo '<div id="strona_grid'.$licz.'" style="'.$wyswietl.'"><table border = "1"><tr>';
                    $wyswietl = "display: none;";
                    $licz++;
                    //sprawdzenie czy w parametrze akcja jest ustawione rz퉐anie wyswietlenia przycisku dodaj
                    if (isset($akcje[Akcja::$dodawanie]))
                    {
                        //sprawdzenie czy agent ma uprawnienie dodawanie 
                        if ($uprawnienia->dodawanie == true)
                        {
                            echo '<td>';
                            echo $tlumaczenia->Tlumacz ($_SESSION[$jezyk], tags::$dodaj);
                            echo '</td>';
                        }
                    }
                    //sprawdzenie czy w parametrze akcja jest ustawione rz퉐anie wyswietlenia przycisku edycja
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
                    //sprawdzenie czy w parametrze akcja jest ustawione rz퉐anie wyswietlenia przycisku kasuj
                    if (isset($akcje[Akcja::$kasowanie]))
                    {
                        //sprawdzenie czy agent ma uprawnienie kasowanie 
                        if ($uprawnienia->kasowanie == true)
                        {
                            echo '<td>';
                            echo $tlumaczenia->Tlumacz ($_SESSION[$jezyk], tags::$kasuj);
                            echo '</td>';
                        }
                    }
                    //dodane 6.03
                    if (is_array($nagIndAk))// != null)
                    {
                        foreach ($nagIndAk as $wartosc)
                        {
                            echo '<td>';
                            echo $tlumaczenia->Tlumacz ($_SESSION[$jezyk], $wartosc);
                            echo '</td>';
                        }
                    }
                    if ($popup != null)
                    {
                        foreach ($popup->nag as $wartosc)
                        {
                            echo '<td>';
                            echo $tlumaczenia->Tlumacz ($_SESSION[$jezyk], $wartosc);
                            echo '</td>';
                        }
                    }
                    ///koniec dodane 6.03
                    $k = 0;
                    while (isset($naglowki[$k]))
                    {
                        echo '<td>';
                        echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], $naglowki[$k]);
                        echo '</td>';
                        $k++;
                    }
                    echo '</tr>';
                }
                $wiersz = $wynik[$i];
                echo '<tr>';
                //sprawdzenie czy w parametrze akcja jest ustawione rz퉐anie wyswietlenia przycisku dodaj
                if (isset($akcje[Akcja::$dodawanie]))
                {
                    //sprowdzenie czy agent ma uprawnienie dodawanie
                    if ($uprawnienia->dodawanie == true)
                    {
                        echo '<td>';
                        KontrolkiHtml::DodajSubmit('dodaj', $wiersz[$index], $tlumaczenia->Tlumacz ($_SESSION[$jezyk], tags::$dodaj).'.', 'onclick="'.$HiddenNazwa.'.value = this.id;"');
                        echo '</td>';
                    }
                }
                //sprawdzenie czy w parametrze akcja jest ustawione rz퉐anie wyswietlenia przycisku edycja
                if (isset($akcje[Akcja::$edycja]))
                {
                    //sprawdzenie czy agent ma uprawnienie edycja
                    if ($uprawnienia->edycja == true)
                    {
                        echo '<td>';
                        KontrolkiHtml::DodajSubmit('edycja', $wiersz[$index], $tlumaczenia->Tlumacz ($_SESSION[$jezyk], tags::$edytuj).'.', 'onclick="'.$HiddenNazwa.'.value = this.id;"');
                        echo '</td>';
                    }
                }
                //sprawdzenie czy w parametrze akcja jest ustawione rz퉐anie wyswietlenia przycisku kasuj
                if (isset($akcje[Akcja::$kasowanie]))
                {
                    //sprawdzenie czy agent ma uprawnienie kasuj
                    if ($uprawnienia->kasowanie == true)
                    {
                        echo '<td>';
                        KontrolkiHtml::DodajSubmit('kasowanie', $wiersz[$index], $tlumaczenia->Tlumacz ($_SESSION[$jezyk], tags::$kasuj).'.', 'onclick="'.$HiddenNazwa.'.value = this.id;"');
                        echo '</td>';
                    }
                }
                ///dodane 6.03
                if (is_array($przycIndAk))
                {
                    foreach ($przycIndAk as $klucz => $wartosc)
                    {
                        echo '<td>';
                        KontrolkiHtml::DodajSubmit($klucz, $wiersz[$index], $tlumaczenia->Tlumacz ($_SESSION[$jezyk], $wartosc).'.', 'onclick="'.$HiddenNazwa.'.value = this.id;"');
                        echo '</td>';
                    }
                }
                if ($popup != null)
                {
                    foreach ($popup->przyc_nazwa as $klucz => $wartosc)
                    {
                        echo '<td>';
                        KontrolkiHtml::DodajPopUpButton($tlumaczenia->Tlumacz ($_SESSION[$jezyk], $wartosc).'.', $wartosc, $popup->url[$klucz].'='.$wiersz[$index], $popup->szerokosc[$klucz], $popup->dlugosc[$klucz]);
                        echo '</td>';
                    }
                }
                //koniec dodane 6.03
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
                                    foreach ($row as $kolEl)
                                    {
                                        $res .= $tlumaczenia->Tlumacz($_SESSION[$jezyk], $kolEl).$sep;
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
                if (($i % UtilsUI::$strona == 0) || (!isset($wynik[$i])))
                {
                    echo '</table></div>';
                }
            }
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
            //sprawdzenie czy w parametrze akcja jest ustawione rz퉐anie wyswietlenia przycisku dodaj
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
            //sprawdzenie czy w parametrze akcja jest ustawione rz퉐anie wyswietlenia przycisku edycja 
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
            //sprawdzenie czy w parametrze akcja jest ustawione rz퉐anie wyswietlenia przycisku kasuj 
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
                //sprawdzenie czy w parametrze akcja jest ustawione rz퉐anie wyswietlenia przycisku dodawanie 
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
                //sprawdzenie czy w parametrze akcja jest ustawione rz퉐anie wyswietlenia przycisku edycja
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
                //sprawdzenie czy w parametrze akcja jest ustawione rz퉐anie wyswietlenia przycisku kasowanie
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