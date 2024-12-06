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

            $wynik = $dal->SzukajOsoba(array(NieruchomoscDAL::$nazwisko => $_POST['nazwisko']));
            //wybor_klient
            //NieruchomoscDAL::$id_klient
            echo '<table>';
            if (is_array($wynik))
            {
                foreach ($wynik as $wiersz)
                {
                    echo '<tr><td>';
                    KontrolkiHtml::DodajWyborPrzeszukiwania($_POST['osoba_hid'], $_POST['osoba_txt'], $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wybierz), $wiersz[NieruchomoscDAL::$id_osoba], $wiersz[NieruchomoscDAL::$nazwisko].' '.$wiersz[NieruchomoscDAL::$imie].', '.$wiersz[NieruchomoscDAL::$pesel]);
                    echo '</td><td>';
                    echo $wiersz[NieruchomoscDAL::$nazwisko].' '.$wiersz[NieruchomoscDAL::$imie].', '.$wiersz[NieruchomoscDAL::$pesel];
                    echo '</td></tr>';
                }
            }
            echo '</table>';
        }
        //else
        //{
            if (!isset($_GET['txt']))
            {
                $_GET['txt'] = $_POST['osoba_txt'];
                $_GET['hid'] = $_POST['osoba_hid'];
            }
            echo '<form action= "'.$_SERVER['PHP_SELF'].'" method= "POST">';
            KontrolkiHtml::DodajHidden('osoba_txt', 'osoba_txt', $_GET['txt']);
            KontrolkiHtml::DodajHidden('osoba_hid', 'osoba_hid', $_GET['hid']);
            echo '<table><tr><td>'.
            $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nazwisko).' :</td><td>'.
            $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$telefon).'</td></tr><tr><td>';
            KontrolkiHtml::DodajTextbox('nazwisko', 'id_nazwisko', '', 20, 20, '');
            echo '</td><td>';
            KontrolkiHtml::DodajTelefonTextbox('telefon', 'id_telefon', '', 13, 13, '', '');
            echo '</td></tr><tr><td>';
            KontrolkiHtml::DodajSubmit('szukaj','id_szukaj',$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$szukaj).'.','');
            echo '</td></tr></table></form>';
        //}
    }
    require('../../stopka.php');
?>
</body>
</html>