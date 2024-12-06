<?php 
    include_once ('../../ui/xajax.php');
?>
<HTML>
<HEAD>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <script language="javascript" src="../../js/script.js"></script>
  <script>
        function DodajDzieciGeog(id_parent)   //
        {
            xajax_PodajDzieciRegGeog('reg_geog', 'innerHTML', id_parent, 1);
        }
  </script>
<link href="../../css/style.css" rel="stylesheet" type="text/css">
<?php $xajax->printJavascript("../../lib/xajax/"); ?>
</head>
<body>
<?php
    // ¶ ±
    session_start();
    //echo $_SERVER['PHP_SELF'].'   ';
    //echo $_SERVER['SCRIPT_FILENAME'];
    include_once ('../../dal/queriesDAL.php');
    include_once ('../../ui/kontrolki_html.php');
    include_once ('../../bll/tags.php'); 
    include_once ('../../bll/jezykibll.php');
    include_once ('../../bll/cache.php');
    include_once ('../../ui/utilsui.php');
    require('../../naglowek.php');
    require('../../conf.php');
    if (!isset($_SESSION[$zalogowany]))
    {
        echo 'Nie jesteÅ› zalogowany.';
    }
    else
    {
        $dal = new NieruchomoscDAL();
        $tlumaczenia = cachejezyki::Czytaj();
        if (isset($_POST['szukaj']))
        {
            $tabParametr[NieruchomoscDAL::$nazwisko] = $_POST['nazwisko'];
            $wynik = $dal->SzukajOsoba($tabParametr);
            
            echo '<form action= "'.$_SERVER['PHP_SELF'].'" method= "POST">';
            UtilsUI::WyswietlTab1Poz($wynik, 
                array(NieruchomoscDAL::$id_osoba, NieruchomoscDAL::$imie, NieruchomoscDAL::$nazwisko, NieruchomoscDAL::$pesel), 
                array(tags::$id, tags::$imie, tags::$nazwisko, tags::$pesel), 
                NieruchomoscDAL::$id_osoba, 
                'osoba_id_dod',
                array(Akcja::$dodawanie => 1));
            echo '</form>';
        }
        if (isset($_POST['osoba_id_dod']))
        {
            $tabParametr[NieruchomoscDAL::$id_osoba] = $_POST['osoba_id_dod'];
            $tabParametr[NieruchomoscDAL::$id_klient] = $_SESSION[NieruchomoscDAL::$id_klient];
            $wynik = $dal->DodajOsobaKlient($tabParametr, true);
            
            if ($wynik)
            {
                echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_powiodla_sie);
            }   
            else
            {
                echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_nie_powiodla_sie);
            }
        }
        if (isset($_POST['zatwierdz']))
        {
            
        }
        if (isset($_POST['edycja']))
        {
            //formularz edycji osoby
            $tabParametr[NieruchomoscDAL::$id_osoba] = $_POST['osoba_id_ed_kas'];
            $wynik = $dal->EdycjaOsoba($tabParametr);
            $wiersz = $wynik[0];
            echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'"><table><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$imie).'</td><td>';
            KontrolkiHtml::DodajSelectZrodSlownik('imie', 'id_sel_imie', SlownikDAL::$imie, 'imie_id', $wiersz[NieruchomoscDAL::$id_imie], '');
            echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nazwisko).'</td><td>';
            KontrolkiHtml::DodajTextbox('nazwisko', 'id_nazwisko', $wiersz[NieruchomoscDAL::$nazwisko], 30, 30, ''); 
            echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nazwisko_rodowe).'</td><td>';
            KontrolkiHtml::DodajTextbox('nazwisko_rodowe', 'id_nazwisko_rodowe', $wiersz[NieruchomoscDAL::$nazwisko_rodowe], 30, 30, '');  
            echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$pesel).'</td><td>';
            KontrolkiHtml::DodajTextbox('pesel', 'id_pesel', $wiersz[NieruchomoscDAL::$pesel], 15, 15, '');
            echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nr_dowod).'</td><td>';
            KontrolkiHtml::DodajTextbox('nr_dowod', 'id_nr_dowod', $wiersz[NieruchomoscDAL::$nr_dowod], 15, 15, '');
            echo '</td></tr><tr><td name="reg_geog" id="reg_geog"><div>';
            echo KontrolkiHtml::DodajSelectRegGeog('nadrzedny_region', 'id_nadrzedny_region', null, 'region_geog_id1', '', 'DodajDzieciGeog(document.getElementById(\'region_geog_id1\').value);');
            echo '</div></td></tr></table></form>';
        }
        if (isset($_POST['kasowanie']))
        {
            $tabParametr[NieruchomoscDAL::$id_osoba] = $_POST['osoba_id_ed_kas'];
            $tabParametr[NieruchomoscDAL::$id_klient] = $_SESSION[NieruchomoscDAL::$id_klient];
            $wynik = $dal->DodajOsobaKlient($tabParametr, false);
        }
        //jesli okno zostalo bezposrednio wywolane lub po raz kolejny
        if (isset($_GET[NieruchomoscDAL::$id_klient]) || isset($_SESSION[NieruchomoscDAL::$id_klient]))
        {
            if (isset($_GET[NieruchomoscDAL::$id_klient]))
            {
                $_SESSION[NieruchomoscDAL::$id_klient] = $_GET[NieruchomoscDAL::$id_klient];
            }
            //parametrem metody jest $tabParametr - tablica parametrow; tu zastosowano skrot tworzac tablice z parametrem juz wewnatrz wywolania metody
            // wlasciwie w celu zaoszczedzenia na linijce kodu i definicji jednej zmiennej wiecej
            $wynik = $dal->EdycjaKlient(array(NieruchomoscDAL::$id_klient => $_SESSION[NieruchomoscDAL::$id_klient]));
            ///sprawdzenie czy cos z bazy danych przywêdroewa³o (powinno to zawsze byc 1 wiersz jesli baza nie lezy lub zero jesli cos  na bazie sie dzieje, nigdy wiecej niz 1)
            if (isset($wynik[0]))
            {
                //poniewaz wynik jest talica ale 1 elementowa mozna go uproscic do zmiennej, ostatecznie wewnatrz wyniku jest troche kompliakcji
                $wiersz = $wynik[0];
                echo '<form action= "'.$_SERVER['PHP_SELF'].'" method= "POST">';
                
                echo '<table><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$osobowosc).' :</td><td>';
                KontrolkiHtml::DodajSelectZrodSlownik('osobowosc', 'id_but_osobowosc', SlownikDAL::$osobowosc, 'osobowosc_id', $wiersz[NieruchomoscDAL::$id_osobowosc], 'PokazUkryjFirmaDane(\'osobowosc_id\', '.$osoba_prawna.', \'firma_dane\');');
                echo '</td></tr>';
                if ($wiersz[NieruchomoscDAL::$id_osobowosc] == $osoba_prawna)
                {
                    echo '<tr name="firma_dane1" id="firma_dane1"><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nazwa_firma).' :</td><td>';
                    KontrolkiHtml::DodajTextbox('nazwa_firma', 'id_nazwa_firma', $wiersz[NieruchomoscDAL::$nazwa_firma], 30, 50, '');
                    echo '</td></tr><tr name="firma_dane2" id="firma_dane2"><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nip).' :</td><td>';
                    KontrolkiHtml::DodajTextbox('nip', 'id_nip', $wiersz[NieruchomoscDAL::$nip], 15, 15, '');
                    echo '</td></tr><tr name="firma_dane3" id="firma_dane3"><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$regon).' :</td><td>';
                    KontrolkiHtml::DodajTextbox('regon', 'id_regon', $wiersz[NieruchomoscDAL::$regon], 15, 15, '');
                    echo '</td></tr><tr name="firma_dane4" id="firma_dane4"><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$krs).' :</td><td>';
                    KontrolkiHtml::DodajTextbox('regon', 'id_regon', $wiersz[NieruchomoscDAL::$krs], 15, 15, '');
                    echo '</td></tr>';
                }
                else
                {
                    echo '<tr name="firma_dane1" id="firma_dane1"><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nazwa_firma).' :</td><td>';
                    KontrolkiHtml::DodajTextbox('nazwa_firma', 'id_nazwa_firma', '', 30, 50, '');
                    echo '</td></tr><tr name="firma_dane2" id="firma_dane2"><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nip).' :</td><td>';
                    KontrolkiHtml::DodajTextbox('nip', 'id_nip', '', 15, 15, '');
                    echo '</td></tr><tr name="firma_dane3" id="firma_dane3"><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$regon).' :</td><td>';
                    KontrolkiHtml::DodajTextbox('regon', 'id_regon', '', 15, 15, '');
                    echo '</td></tr><tr name="firma_dane4" id="firma_dane4"><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$krs).' :</td><td>';
                    KontrolkiHtml::DodajTextbox('regon', 'id_regon', $wiersz[NieruchomoscDAL::$krs], 15, 15, '');
                    echo '</td></tr>';
                }
                echo '<script>PokazUkryjFirmaDane(\'osobowosc_id\', '.$osoba_prawna.', \'firma_dane\');</script>';
                echo '<tr><td>';
                KontrolkiHtml::DodajSubmit('zatwierdz','id_zatwierdz',$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zatwierdz).'.','');
                echo '</td></tr>';
                echo '</table>';
                ///osoby skaldajace sie na klienta
                $osoby[NieruchomoscDAL::$id_osoba] = $wiersz[NieruchomoscDAL::$id_osoba];
                $osoby[NieruchomoscDAL::$imie] = $wiersz[NieruchomoscDAL::$imie];
                $osoby[NieruchomoscDAL::$nazwisko] = $wiersz[NieruchomoscDAL::$nazwisko];
                //wywolanie metody, ktora pokazuje informacje jedna lub wiele w tablicy html
                UtilsUI::WyswietlTablicaTablic($osoby, array(NieruchomoscDAL::$id_osoba, NieruchomoscDAL::$imie, NieruchomoscDAL::$nazwisko), array(tags::$id, tags::$imie, tags::$nazwisko), NieruchomoscDAL::$id_osoba, 'osoba_id_ed_kas', array(Akcja::$edycja => 1, Akcja::$kasowanie => 1));
                
                echo '<hr /><table><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nazwisko).' :</td><td>';
                KontrolkiHtml::DodajTextbox('nazwisko', 'id_txt_nazwisko', '', 20, 20, '');
                echo '</td><td>';
                KontrolkiHtml::DodajSubmit('szukaj','id_szukaj',$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$szukaj).'.','');
                echo '</td></tr></table></form>';
            }
        }
    }
    require('../../stopka.php');
?>
</body>
</html>
