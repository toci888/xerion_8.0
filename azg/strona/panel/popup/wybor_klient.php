<HTML>
<HEAD>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <script language="javascript" src="../../js/script.js"></script>
<link href="../../css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<?php
    session_start();
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
        echo 'Nie jesteś zalogowany.';
    }
    else
    {
        $tlumaczenia = cachejezyki::Czytaj();
        if (isset($_POST['szukaj']))
        {
            $dal = new NieruchomoscDAL();

            $wynik = $dal->SzukajKlient(array(NieruchomoscDAL::$id_osobowosc => $_POST['osobowosc_id'], 
            NieruchomoscDAL::$nazwa_firma => $_POST['nazwa_firma'], NieruchomoscDAL::$pesel => $_POST['pesel'], 
            NieruchomoscDAL::$nazwisko => $_POST['nazwisko']));
            //wybor_klient
            //NieruchomoscDAL::$id_klient
            echo '<table>';
            if (is_array($wynik))
            if ($_POST['osobowosc_id'] == $osoba_prawna)
            {
                foreach ($wynik as $wiersz)
                {
                    echo '<tr><td>';
                    KontrolkiHtml::DodajWyborPrzeszukiwania(NieruchomoscDAL::$id_klient, 'wybor_klient', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wybierz), $wiersz[NieruchomoscDAL::$id_klient], $wiersz[NieruchomoscDAL::$nazwa_firma].', '.$wiersz[NieruchomoscDAL::$pesel]);
                    echo '</td><td>';
                    echo $wiersz[NieruchomoscDAL::$nazwa_firma].', '.$wiersz[NieruchomoscDAL::$pesel].', '.$wiersz[NieruchomoscDAL::$nazwisko].' '.$wiersz[NieruchomoscDAL::$imie];
                    echo '</td></tr>';
                }
            }
            else
            {
                foreach ($wynik as $wiersz)
                {
                    echo '<tr><td>';
                    KontrolkiHtml::DodajWyborPrzeszukiwania(NieruchomoscDAL::$id_klient, 'wybor_klient', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wybierz), $wiersz[NieruchomoscDAL::$id_klient], $wiersz[NieruchomoscDAL::$nazwisko].' '.$wiersz[NieruchomoscDAL::$imie].', '.$wiersz[NieruchomoscDAL::$pesel]);
                    echo '</td><td>';
                    echo $wiersz[NieruchomoscDAL::$nazwisko].' '.$wiersz[NieruchomoscDAL::$imie].', '.$wiersz[NieruchomoscDAL::$pesel].', '.$wiersz[NieruchomoscDAL::$miejscowosc];
                    echo '</td></tr>';
                }
            }
            echo '</table>';
        }
        else
        {
            echo '<form action= "'.$_SERVER['PHP_SELF'].'" method= "POST"><table><tr><td>'.
            $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$osobowosc).' :</td><td name="firma_text" id="firma_text">'.
            $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nazwa_firma).' :</td><td name="pesel_text" id="pesel_text">'.
            $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$pesel).' :</td><td>'.
            $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nazwisko).' :</td></tr><tr><td>';
            //zakaldamy ze z bazy moze przyjsc slownik osobowosci (az 2 elementowy) pokrecony, parametr 5 - null pozwoli 1 wpisywana wartosc
            //do pola rozwijalnego umiescic w hiddenie
            KontrolkiHtml::DodajSelectZrodSlownik('osobowosc', 'id_but_osobowosc', SlownikDAL::$osobowosc, 'osobowosc_id', null, '', 'onchange="FormularzOsPrOsFiz(this.options[this.selectedIndex].id, '.$osoba_prawna.', \''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$pesel).'\', \''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nip).'\');"');
            echo '</td><td name="firma_input" id="firma_input">';
            KontrolkiHtml::DodajTextbox('nazwa_firma', 'id_nazwa_firma', '', 20, 20, '');
            echo '</td><td>';
            KontrolkiHtml::DodajTextbox('pesel', 'id_pesel', '', 15, 15, '');
            echo '</td><td>';
            KontrolkiHtml::DodajTextbox('nazwisko', 'id_nazwisko', '', 20, 20, '');
            echo '</td></tr><tr><td>';
            KontrolkiHtml::DodajSubmit('szukaj','id_szukaj',$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$szukaj).'.','');
            echo '</td></tr></table></form>';
            echo '<script>FormularzOsPrOsFiz(\'osobowosc_id\', '.$osoba_prawna.', \''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$pesel).'\', \''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nip).'\');</script>';
        }
    }
    require('../../stopka.php');
?>
</body>
</html>