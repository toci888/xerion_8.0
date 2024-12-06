<html><head><title>A.Z.Gwarancja - Baza Danych</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/style.css" rel="stylesheet" type="text/css"></head>
  <script language="javascript1.3" src="../js/script.js"></script>
<body class="logo_top" >
<?
//onload="RadioOfertaZapotrzebowanie();"
    include_once ('../bll/transnierbll.php');
    include_once ('../bll/jezykibll.php');
    include_once ('../dal/queriesDAL.php'); 
    include_once ('../ui/kontrolki_html.php');
    include_once ('../ui/utilsui.php');
    include_once ('../bll/tags.php');
    include_once ('../bll/agentbll.php');
    require('../naglowek.php');
    require('../conf.php');
    session_start();
    //echo 'Ĺ‚ĂłĹ„Ä‡ĹşĹĽÄ…Ĺ›Ä™';
    //$uprawnienia = unserialize($_SESSION['uprawnienia']);
    
    $tlumaczenia = cachejezyki::Czytaj();
    if (!isset($_SESSION[$zalogowany]))
    {
        echo 'Nie jesteś zalogowany. <br />';
        $_SESSION[$jezyk] = 1;
        echo '<a href="http://'.$_SERVER['SERVER_NAME'].'/panel" target="_parent">'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zaloguj_sie).'</a>';
    }
    else
    {
        $agent_zal = unserialize($_SESSION[$dane_agent]);

        //przy formularzu szukania oferty - zapotrzebowania wykorzystac to radio tu: tam dac hiddena (to sa niezalezne formularze)
        //a tu js przekazac co jest wybrane; na onload strony ten hidden musi miec zaladowana wartosc z tego radia niezaleznie, dlatego ze radio 
        //jest lepkie i moze przy f5 od razu uzyskiwac zaznaczewnie na zapotrzebowanie nie na ofercie
        
        echo '<table><tr><td>';
        
            //tworzenie nowej table, 1 wiersz nazwa agenta, 2 wiersz ilosc dni do ydasniecia hasla ...
            echo '<table>';
            echo '<tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zalogowany).':</td><td><b>'.$agent_zal->nazwa.'</b></td></tr>';
            echo '<tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$pozostalo).': <b>'.$agent_zal->data_wyg_haslo.'</b></td><td>'.
            $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$dni_do_wygasniecia_hasla).'.</td></tr>';
            echo '<tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$id_agenta).':</td><td><b>'.$agent_zal->id.'</b>.</td></tr>';
            echo '</table>';  
        echo '</td><td valign="top">';    
            echo '<table><tr><td>';
            echo '<form method="POST" target="left" action="left.php">';
            KontrolkiHtml::DodajSubmit('oferty', 'id_oferty', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$oferty), '');
            echo '</form>';
            echo '</td><td>';
            echo '<form method="POST" target="left" action="left.php">';
            KontrolkiHtml::DodajSubmit('zapotrzebowania', 'id_zapotrzebowania', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zapotrzebowania), '');
            echo '</form>';
            echo '</td><td>';
            echo '<form method="POST" target="left" action="left.php">';
            KontrolkiHtml::DodajSubmit('klienci', 'id_klienci', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$klienci), '');
            echo '</form>';
            echo '</td><td>';
            echo '<form method="POST" target="left" action="left.php">';
            KontrolkiHtml::DodajSubmit('media', 'id_media', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$media), '');
            echo '</form>';
            echo '</td><td>';
            echo '<form method="POST" target="left" action="left.php">';
            KontrolkiHtml::DodajSubmit('lista_wskazan', 'id_lista_wskazan', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$lista_wskazan), '');
            echo '</form>';
            echo '</td><td>';
            echo '<form method="POST" target="left" action="left.php">';
            KontrolkiHtml::DodajSubmit('aplikacje', 'id_aplikacje', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$aplikacje), '');
            echo '</form>';
            echo '</td><td>';
            echo '<form method="POST" target="center" action="zmiana_jezyka.php">';
            KontrolkiHtml::DodajSubmit('zmien_jezyk', 'id_zmien_jezyk', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zmianajezyka).'.', '');
            echo '</form>';
            echo '</td><td>';
            echo '<form method="POST" action="log_in.php">';
            KontrolkiHtml::DodajSubmit('wyloguj', 'wyloguj', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wyloguj).'.', '');
            echo '</form>';
            echo '</td></tr></table>';
        echo '</td></tr></table>';
    }
	require('../stopka.php');
?>
</body>
</html>
