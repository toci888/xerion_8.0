<HTML>
<HEAD>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <script language="javascript" src="../../js/script.js"></script>
<!--<link href="../../css/style.css" rel="stylesheet" type="text/css">-->
</head>
<body>
<?php
    // ¶ ±
    /*function WyswietlWyposazenie($kolekcja_wyposazenie)
    {
        $br = false;
        //wyswietlenie kwadracikow na wyposazenia - w 1 kolejnosci wylacznie jednokrotne - bezdzietne
        foreach ($kolekcja_wyposazenie as $klucz => $wyposazenie)
        {
            //sprawdzenie, czy jest to bezdzietny element - jest sam sobie rodzicem zgodnie z przyjęta konwencją
            if ($wyposazenie->id_parent == $wyposazenie->id)
            {
                $br = true;
                KontrolkiHtml::DodajCheckbox('wyposazenie_'.$wyposazenie->id, 'id_wyposazenie_'.$wyposazenie->id, false, $wyposazenie->nazwa, '', '');
                echo '&nbsp;&nbsp;';
                //oczyszczenie tablicy z elementu, dzieki temu do kolejnej petli wejda juz tylko wielokrotne, bedzie badany inny warunek
                unset($kolekcja_wyposazenie[$klucz]);
            }
        }
        //wyswietlenie kwadracikow lub radio ;( kwadraciki dla mozliwosci wielokrotnych, radia dla jednokrotnych
        //id parent bedzie sie zmieniac co jakis czas - przy zmianie wyposazen; dla jednego rodzica wyswietlamy liste dzieci; przy zmianie id parent pokazujemy rodzica i robimy wrap, potem pokazujemy juz tylko dzieci
        $id_parent = 0;
        foreach ($kolekcja_wyposazenie as $klucz => $wyposazenie)
        {
            //rozdzielenie nazwy rodzica od dziecka
            $wyposazenie_ar = explode(':', $wyposazenie->nazwa);
            //dochodzi do zmiany rodzica - zmiany wyposazenia
            if ($wyposazenie->id_parent != $id_parent)
            {
                if ($br)
                {
                    echo '<br />';
                }
                $br = true;
                //zapisujemy nowe id parent, podajemy nazwe rodzica
                $id_parent = $wyposazenie->id_parent;
                //zapamietujemy czy mozna wybierac wiele dzieci czy nie
                $wielokrotne = $wyposazenie->wielokrotne;
                echo '<b>'.$wyposazenie_ar[0].': </b><br />';
            }
            if ($wielokrotne)
            {
                //leca kwadraciki bo mozna zaznaczyc kilka
                KontrolkiHtml::DodajCheckbox('wyposazenie_'.$wyposazenie->id, 'id_wyposazenie_'.$wyposazenie->id, false, $wyposazenie_ar[1], '', '');
                echo '&nbsp;&nbsp;';
            }
            else
            {
                //leca radia bo mozna zaznaczyc jedno
                KontrolkiHtml::DodajRadio('wyposazenie_'.$wyposazenie->id, array('id_wyposazenie_'.$wyposazenie->id), array($wyposazenie_ar[1]), array($wyposazenie_ar[1]), '', false, array(false), '','');
                echo '&nbsp;&nbsp;';
            }
        }
    }
    function WyswietlParametry($kolekcja_parametr)
    {
        $i = 0;
        $br = 5;
        $max_length = 183;
        
        foreach ($kolekcja_parametr as $klucz => $parametr)
        {
            if ($i == 0)
            {
                //kazda nowa pozioma linijka jest w osobnej tabeli ze wzgledu na maxymalne upakowanie informacji
                echo '<table><tr>';
                //dlugosc linii jest kalkulowana zeby wiedziec, kiedy zakonczyc linie i rozpoczac nowa
                $dl_txt_linia = 0;
                $br = 5;
                $line_open = true;
            }
            //sklejenie nazwy parametru z linijka na wpis
            $element = $parametr->nazwa.' '.UtilsUI::PusteMsc($parametr->dl_inf);
            //policzenie dlugosci wpisu, metoda dlugosctxt wylicza dolkladna dlugosc textu w mm
            $dl_txt_linia += UtilsUI::DlugoscTxt($element);
            //jesli linia przekracza dlugosc po dodaniu kolejnego elementu automatycznie dajemy go do nowej linii
            if ($dl_txt_linia > $max_length)
            {
                echo '</tr></table><table><tr>';
                $line_open = true;
                //poniewaz wpis przeszedl juz do nowej linii liczymy juz od nowa dlugosc kolejnej linii
                $dl_txt_linia = UtilsUI::DlugoscTxt($element);
                //zaznaczamy, ze zaczelismy linie o dnowa
                $i = 0;
            }
            //dodanie fizycznie samego elementu
            echo '<td>'.$element.'&nbsp;&nbsp;</td>';
            
            $i++;
            //zakonczenie linii, jesli 4 elementy sie zmiescily (w zalozeniu nigdy nie miesci sie wiecej niz 4, moze to zle zalozenie :P, powinno wlasciwie byc uznane, ze wyczerpanie linii warunkuje nowa)
            if ($i >= $br)
            {
                echo '</tr></table>';
                $line_open = false;
                $i = 0;
            }
        }
        if ($line_open)
        {
            echo '</tr></table>';
        }
    }*/
    
    function WyswietlWyposazenie($kolekcja_wyposazenie)
    {
        //wyswietlenie kwadracikow na wyposazenia - w 1 kolejnosci wylacznie jednokrotne - bezdzietne
        if (is_array($kolekcja_wyposazenie))
        foreach ($kolekcja_wyposazenie as $klucz => $wyposazenie)
        {
            //sprawdzenie, czy jest to bezdzietny element - jest sam sobie rodzicem zgodnie z przyjęta konwencją
            if ($wyposazenie->id_parent == $wyposazenie->id)
            {
                KontrolkiHtml::DodajCheckbox('wyposazenie_'.$wyposazenie->id, 'id_wyposazenie_'.$wyposazenie->id, false, $wyposazenie->nazwa, '', '');
                echo '&nbsp;&nbsp;';
                //oczyszczenie tablicy z elementu, dzieki temu do kolejnej petli wejda juz tylko wielokrotne, bedzie badany inny warunek
                unset($kolekcja_wyposazenie[$klucz]);
            }
        }
        //wyswietlenie kwadracikow lub radio ;( kwadraciki dla mozliwosci wielokrotnych, radia dla jednokrotnych
        //id parent bedzie sie zmieniac co jakis czas - przy zmianie wyposazen; dla jednego rodzica wyswietlamy liste dzieci; przy zmianie id parent pokazujemy rodzica i robimy wrap, potem pokazujemy juz tylko dzieci
        $id_parent = 0;
        if (is_array($kolekcja_wyposazenie))
        foreach ($kolekcja_wyposazenie as $klucz => $wyposazenie)
        {
            //rozdzielenie nazwy rodzica od dziecka
            $wyposazenie_ar = explode(':', $wyposazenie->nazwa);
            //dochodzi do zmiany rodzica - zmiany wyposazenia
            if ($wyposazenie->id_parent != $id_parent)
            {
                //zapisujemy nowe id parent, podajemy nazwe rodzica
                $id_parent = $wyposazenie->id_parent;
                //zapamietujemy czy mozna wybierac wiele dzieci czy nie
                $wielokrotne = $wyposazenie->wielokrotne;
                echo $wyposazenie_ar[0].': .............&nbsp;&nbsp;';
            }
        }
    }
    function WyswietlParametry($kolekcja_parametr)
    {
        $i = 0;
        if (is_array($kolekcja_parametr))
        foreach ($kolekcja_parametr as $klucz => $parametr)
        {
            $element = $parametr->nazwa.' '.UtilsUI::PusteMsc($parametr->dl_inf);
            //dodanie fizycznie samego elementu
            echo $element.'&nbsp;&nbsp;';
            
            $i++;
        }
    }
    
    session_start();
    include_once ('../../dal/queriesDAL.php');
    include_once ('../../ui/kontrolki_html.php');
    include_once ('../../ui/utilsui.php'); 
    include_once ('../../bll/parametrynierbll.php');
    include_once ('../../bll/tags.php'); 
    include_once ('../../bll/agentbll.php');
    include_once ('../../bll/jezykibll.php');
    include_once ('../../bll/cache.php');
    include_once ('../../bll/transnierbll.php');
    include_once ('../../bll/parametrynierbll.php');
    require('../../naglowek.php');
    require('../../conf.php');
    
    if (!isset($_SESSION[$zalogowany]))
    {
        echo 'Nie jesteĹ› zalogowany.';
    }
    else
    {
        $tlumaczenia = cachejezyki::Czytaj();
        $agent_zal = unserialize($_SESSION[$dane_agent]);
        
        //NieruchomoscDAL::$id_nier_rodzaj
        //NieruchomoscDAL::$id_trans_rodzaj
        $kolekcja_dane = new WyposazenieNierBLL(array(WyposazenieNierDAL::$id_transakcja => $_GET[NieruchomoscDAL::$id_trans_rodzaj], WyposazenieNierDAL::$id_nieruchomosc => $_GET[NieruchomoscDAL::$id_nier_rodzaj]), null);
        
        $tablica_sekcji = $kolekcja_dane->PodajSekcje();
        $tablica_pomieszczen = $kolekcja_dane->PodajPom();
        $kolekcja_parametrow = $kolekcja_dane->KolekcjaParametrow();
        $kolekcja_wyposazen = $kolekcja_dane->KolekcjaWyposazen();
        
        //cala funkcjonalnosc generowania karty opisowej moze zostac przeniesiona do ui; powod? - w przypadku podania id nier byłaby generowana gotowa karta, juz pozaznaczana
        $rodzaj_nier = array(1 => 'domu', 2 => 'mieszkania', 3 => 'obiektu', 4 => 'lokalu', 5 => 'terenu', 6 => 'działki');
        echo '<center style="text-transform: uppercase;">karta '.$rodzaj_nier[$_GET[NieruchomoscDAL::$id_nier_rodzaj]].'</center><center>(Informacje wg. oferującego)</center>
        <center>załącznik do umowy nr ................. z dnia ...................</center>';
        //poki co koncentruje sie na wygenerowaniu pustego formularza
        
        echo '<table border="1" rules="all">'; //ostylowac
        
        //Sztywny element formularza
        echo '<tr><td><table>';
        echo '<tr><td style="text-transform: uppercase;"><b>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$informacje_ogolne).'</b></td></tr>';
        echo '</table>';
        echo '<table><tr>';
        echo '<td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$miejscowosc).' ....................&nbsp;</td><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$powiat).' ....................&nbsp;</td>';
        echo '<td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$cena).' ....................&nbsp;</td><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$czas_przekazania_m).' ......</td>';
        echo '</tr></table></td></tr>';
        //iteracyjne przegladanie sekcji
         
        foreach ($tablica_sekcji as $id_sekcja => $nazwa_sekcja)
        {
            echo '<tr><td><table>';
            echo '<tr><td style="text-transform: uppercase;"><b>'.$nazwa_sekcja.'</b></td></tr>';
            echo '</table>';
            //dorzucic recznie informacje ogolne
            
            if (isset($kolekcja_parametrow[$id_sekcja]))
            {
                WyswietlParametry($kolekcja_parametrow[$id_sekcja]->parametry);
            }
            //sprawdzenie, czy w sekcji sa wyposazenia
            if (isset($kolekcja_wyposazen[$id_sekcja]))
            {
                WyswietlWyposazenie($kolekcja_wyposazen[$id_sekcja]->wyposazenie);
            }
            echo '</td></tr>';
        }
        //pomieszczenia
        if (is_array($tablica_pomieszczen))
        foreach ($tablica_pomieszczen as $id_pomieszczenie => $nazwa_pomieszczenie)
        {
            if ($id_pomieszczenie == 1)
            {
                $licznik = 1;
                while ($licznik < 6)
                {
                    echo '<tr><td><table>';
                    echo '<tr><td style="text-transform: uppercase;"><b>'.$nazwa_pomieszczenie.' '.$licznik.':</b></td></tr>';
                    echo '</table>';
                    $wyp_pom = new PomWypACD($id_pomieszczenie);
                    $param_pom = new PomParACD($id_pomieszczenie);
                    $wyposazenie_pom = $wyp_pom->PodajDostepneWyposazenie();
                    $parametry_pom = $param_pom->PodajKolekcje();
                    
                    WyswietlParametry($parametry_pom);
                    WyswietlWyposazenie($wyposazenie_pom);
                    echo '</td></tr>';
                    $licznik++;
                }
            }
            else
            {
                echo '<tr><td><table>';
                echo '<tr><td style="text-transform: uppercase;"><b>'.$nazwa_pomieszczenie.' :</b></td></tr>';
                echo '</table>';
                $wyp_pom = new PomWypACD($id_pomieszczenie);
                $param_pom = new PomParACD($id_pomieszczenie);
                $wyposazenie_pom = $wyp_pom->PodajDostepneWyposazenie();
                $parametry_pom = $param_pom->PodajKolekcje();
                
                WyswietlParametry($parametry_pom);
                WyswietlWyposazenie($wyposazenie_pom);
                echo '</td></tr>';
            }
        }
        //dodatkowy opis
        echo '<tr><td>';
        
        echo '<table>';
        echo '<tr><td style="text-transform: uppercase;"><b>dodatkowy opis</b></td></tr>';
        echo '</table>';
        
        echo '<table>';
        echo '<tr><td>...........................................................................................................................................................................</td></tr>';
        echo '<tr><td>...........................................................................................................................................................................</td></tr>';
        echo '<tr><td>...........................................................................................................................................................................</td></tr>';
        echo '</table>';
        
        //dane formalne
        echo '</td></tr><tr><td>';
        
        echo '<table>';
        echo '<tr><td style="text-transform: uppercase;"><b>dane formalne</b></td></tr>';
        echo '</table>';
        
        echo '<table>';
        echo '<tr><td>Właściciele ................................................................&nbsp;&nbsp;&nbsp;&nbsp;Oferujący .....................................................................</td></tr>';
        echo '<tr><td>..................................................................................&nbsp;&nbsp;&nbsp;&nbsp;.....................................................................................</td></tr>';
        echo '<tr><td>Adres ........................................................................&nbsp;&nbsp;&nbsp;&nbsp;Adres ...........................................................................</td></tr>';
        echo '<tr><td>Tel. domowy .................. Tel. służbowy ....................&nbsp;&nbsp;&nbsp;&nbsp;Tel. domowy .................. Tel. służbowy ........................</td></tr>';
        echo '<tr><td>Administracja/Spółdzielnia ..........................................&nbsp;&nbsp;&nbsp;&nbsp;Ilość osób zameldowanych .....................................</td></tr>';
        echo '<tr><td>Stan cywilny przy nabywaniu ......................................&nbsp;&nbsp;&nbsp;&nbsp;Stan cywilny przy zbyciu .........................................</td></tr>';
        echo '<tr><td>Obciążenia .........................................................................................................................................................</td></tr>';
        echo '<tr><td>Sposób nabycia .........................................................&nbsp;&nbsp;&nbsp;&nbsp;Data nabycia ......................................</td></tr>';
        echo '<tr><td>Oglądanie ...........................................................................................................................................................</td></tr>';
        echo '</table>';
        echo '<table width="100%">';
        echo '<tr><td width="50%">...................., dnia ............. Pośrednik ....................... </td>
        <td>Oświadczam, że powyższe dane są zgodne ze stanem faktycznym i prawnym. <br /> Oferujący ..................................................... </td></tr>';
        echo '</table>';
        
        echo '</td></tr></table>';
    }
    require('../../stopka.php');
?>
</body>
</html>