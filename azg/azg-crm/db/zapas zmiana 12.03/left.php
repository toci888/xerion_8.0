<html><head><title>A.Z.Gwarancja - Baza Danych</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <script language="javascript1.3" src="js/script.js"></script>
<link href="css/style.css" rel="stylesheet" type="text/css"></head>
<body>
<?
    
    //include ("dal/dal.php");
    include_once ('bll/cache.php'); 
    include_once ('bll/jezykibll.php'); 
    include_once ('bll/tags.php'); 
    include_once ('ui/kontrolki_html.php');
    require('naglowek.php');
    require('conf.php');
    session_start();
    if (!isset($_SESSION[$zalogowany]))
    {
        echo 'Nie jesteś zalogowany.';
    }
    else
    {
        $tlumaczenia = cachejezyki::Czytaj(); 
        
        if (isset($_POST['oferty']))
        {
            echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$oferty).' : <br />';
            echo '<form method="POST" target="center" action="dodanie_klient.php">';
            KontrolkiHtml::DodajHidden($oferta_hidden, $oferta_hidden, tags::$oferta);
            KontrolkiHtml::DodajSubmit('dodaj', 'id_dodaj', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$dodaj), '');
            echo '</form>';
            echo '<form method="POST" target="center" action="szukanie_oferta.php">';
            KontrolkiHtml::DodajSubmit('szukaj_left', 'id_szukaj_left', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$szukaj), '');
            echo '</form>';
            
        }
        if (isset($_POST['klienci']))
        {
            echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$klienci).' : <br />';
            echo '<form method="POST" target="center" action="dodanie_klient.php">';
            KontrolkiHtml::DodajHidden($oferta_hidden, $oferta_hidden, tags::$zapotrzbowanie);
            KontrolkiHtml::DodajSubmit('dodaj', 'id_dodaj', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$dodaj), '');
            echo '</form>';
            echo '<form method="POST" target="center" action="szukanie_zapotrzebowanie.php">';
            KontrolkiHtml::DodajSubmit('szukaj_left', 'id_szukaj_left', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$szukaj), '');
            echo '</form>';
        }
        
        if (isset($_POST['administracja']))
        {            
            echo '<form method="POST" target="center" action="zmiana_hasla.php">';
            KontrolkiHtml::DodajSubmit('zmien_haslo', 'id_zmien_haslo', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zmiana_hasla).'.', '');
            echo '</form>';
        }
        echo '<form method="POST" target="center" action="zmiana_jezyka.php">';
        KontrolkiHtml::DodajSubmit('zmien_jezyk', 'id_zmien_jezyk', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zmianajezyka).'.', '');
        echo '</form>';
            
        echo '<form method="POST" action="log_in.php">';
        KontrolkiHtml::DodajSubmit('wyloguj', 'wyloguj', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wyloguj).'.', '');
        echo '</form>';
    }
	require("stopka.php");
?>
</body>
</html>
