<html><head><title>A.Z.Gwarancja - Baza Danych</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <script language="javascript1.3" src="../js/script.js"></script>
<link href="../css/style.css" rel="stylesheet" type="text/css"></head>
<body>
<?
    
    //include ("dal/dal.php");
    include_once ('../bll/cache.php'); 
    include_once ('../bll/jezykibll.php');
    include_once ('../bll/agentbll.php'); 
    include_once ('../bll/tags.php'); 
    include_once ('../ui/kontrolki_html.php');
    require('../naglowek.php');
    require('../conf.php');
    session_start();
    if (!isset($_SESSION[$zalogowany]))
    {
        echo 'Nie jesteś zalogowany.';
    }
    else
    {
        $tlumaczenia = cachejezyki::Czytaj();
        $uprawnienia = unserialize($_SESSION[$zalogowany]);
         
        
        if (isset($_POST['oferty']))
        {
            UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$przetwarzanie_ofert));
            echo '<form method="POST" target="center" action="dodanie_klient.php">';
            KontrolkiHtml::DodajHidden($oferta_hidden, $oferta_hidden, tags::$oferta);
            KontrolkiHtml::DodajSubmit('dodaj', 'id_dodaj', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$dodaj), '');
            echo '</form>';
            echo '<form method="POST" target="center" action="szukanie_oferta.php">';
            KontrolkiHtml::DodajSubmit('szukaj_left', 'id_szukaj_left', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$szukaj_oferty), '');
            echo '</form>';
            echo '<form method="POST" target="center" action="wyswietl_oferta.php">';
            KontrolkiHtml::DodajSubmit('szukaj_left', 'id_szukaj_left', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wyswietl_oferty), '');
            echo '</form>';
            echo '<form method="POST" target="center" action="umowa_oferta.php">';
            KontrolkiHtml::DodajSubmit('umowa_oferta', 'id_umowa_oferta', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$szablon_umowy), '');
            echo '</form>';
            
        }
        if (isset($_POST['zapotrzebowania']))
        {
            UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$przetwarzanie_zlecen));
            echo '<form method="POST" target="center" action="dodanie_klient.php">';
            KontrolkiHtml::DodajHidden($oferta_hidden, $oferta_hidden, tags::$zapotrzebowanie);
            KontrolkiHtml::DodajSubmit('dodaj', 'id_dodaj', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$dodaj), '');
            echo '</form>';
            echo '<form method="POST" target="center" action="szukanie_zapotrzebowanie.php">';
            KontrolkiHtml::DodajSubmit('szukaj_left', 'id_szukaj_left', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$szukaj_zapotrzebowania), '');
            echo '</form>';
            echo '<form method="POST" target="center" action="wyswietl_zapotrzebowanie.php">';
            KontrolkiHtml::DodajSubmit('szukaj_left', 'id_szukaj_left', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wyswietl_zapotrzebowania), '');
            echo '</form>';
            echo '<form method="POST" target="center" action="umowa_zlecenie.php">';
            KontrolkiHtml::DodajSubmit('umowa_zlecenie', 'id_umowa_zlecenie', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$szablon_umowy), '');
            echo '</form>';
        }
        if (isset($_POST['klienci']))
        {
            UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$klienci));
            echo '<form method="POST" target="center" action="szukanie_klient.php">';
            KontrolkiHtml::DodajSubmit('szukaj_left', 'id_szukaj_left', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$szukaj_klienta), '');
            echo '</form>';
            echo '<form method="POST" target="center" action="lista_transakcje.php">';
            KontrolkiHtml::DodajSubmit('lista_transakcje', 'id_lista_transakcje', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$transakcje), '');
            echo '</form>';
        }
        if (isset($_POST['media']))
        {
            UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$media)); 
            echo '<form method="POST" target="center" action="dodanie_media_nier.php">';
            //KontrolkiHtml::DodajHidden($oferta_hidden, $oferta_hidden, tags::$zapotrzbowanie);
            KontrolkiHtml::DodajSubmit('dodaj', 'id_dodaj', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$dodaj), '');
            echo '</form>';
            echo '<form method="POST" target="center" action="szukanie_media_nier.php">';
            KontrolkiHtml::DodajSubmit('szukaj_media', 'id_szukaj_media', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$szukaj_w_mediach), '');
            echo '</form>';
            echo '<form method="POST" target="center" action="biezace_media_nier.php">';
            KontrolkiHtml::DodajSubmit('biezace_media', 'id_biezace_media', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$biezace), '');
            echo '</form>';
        }
        if (isset($_POST['aplikacje']))
        {
            UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$aplikacje)); 
            echo '<form method="POST" target="center" action="kalendarz.php">';
            //KontrolkiHtml::DodajHidden($oferta_hidden, $oferta_hidden, tags::$zapotrzbowanie);
            KontrolkiHtml::DodajSubmit('kalendarz', 'id_kalendarz', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$kalendarz), '');
            echo '</form>';
            echo '<form method="POST" target="center" action="zmiana_hasla.php">';
            KontrolkiHtml::DodajSubmit('zmien_haslo', 'id_zmien_haslo', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zmiana_hasla).'.', '');
            echo '</form>';
            echo '<form method="POST" target="center" action="telefony_przychodzace.php">';
            KontrolkiHtml::DodajSubmit('telefony_przychodzace', 'id_telefony_przychodzace', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$telefony_przychodzace).'.', '');
            echo '</form>';
            echo '<form method="POST" target="center" action="gablota_oferty.php">';
            KontrolkiHtml::DodajSubmit('gablota_laczona', 'id_gablota_laczona', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$gablota).'.', '');
            echo '</form>';
            echo '<form method="POST" target="center" action="gazeta_oferty.php">';
            KontrolkiHtml::DodajSubmit('gazeta', 'id_gazeta', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$gazeta).'.', '');
            echo '</form>';
            echo '<form method="POST" target="center" action="stat_oferty.php">';
            KontrolkiHtml::DodajSubmit('statystyka', 'id_statystyka', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$statystyki).'.', '');
            echo '</form>';
            
            if ($uprawnienia->adm_dane)
            {
                echo '<form method="POST" target="center" action="oferty_strona.php">';
                KontrolkiHtml::DodajSubmit('oferty_strona', 'id_oferty_strona', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$oferty_specjalne).'.', '');
                echo '</form>';
                
                echo '<form method="POST" target="center" action="administracja/kalendarz_adm.php">';
                KontrolkiHtml::DodajSubmit('kalendarz', 'id_kalendarz', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$weryfikacja_kalendarza).'.', '');
                echo '</form>';
                echo '<form method="POST" target="center" action="administracja/strona_zakladki.php">';
                KontrolkiHtml::DodajSubmit('strona_zakladki', 'id_strona_zakladki', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$strona_www).'.', '');
                echo '</form>';
            }
            if ($uprawnienia->zmiana_upr)
            {
                echo '<form method="POST" target="center" action="administracja/regiony_geog.php">';
                KontrolkiHtml::DodajSubmit('region_geog', 'id_region_geog', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$geografia).'.', '');
                echo '</form>';
                
                echo '<form method="POST" target="center" action="administracja/agenci.php">';
                KontrolkiHtml::DodajSubmit('agenci', 'id_agenci', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$agenci).'.', '');
                echo '</form>';
                
                echo '<form method="POST" target="center" action="administracja/administracja.php">';
                KontrolkiHtml::DodajSubmit('zarzadzanie', 'id_zarzadzanie', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$administracja).'.', '');
                echo '</form>';
            }
            echo '<form method="POST" target="center" action="faktury.php">';
            KontrolkiHtml::DodajSubmit('faktury', 'id_faktury', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$faktury).'.', '');
            echo '</form>';
            
            //echo '<form method="POST" target="center" action="oper_kalendarz.php">';
            //KontrolkiHtml::DodajSubmit('dodaj_left', 'id_dodaj_left', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$dodaj), '');
            //echo '</form>';
        }
        if (isset($_POST['administracja']))//???
        {            
            
            
        }
        if (isset($_POST['lista_wskazan']))
        {
            echo '<form method="POST" target="center" action="listy_wskazan_cache.php">';
            KontrolkiHtml::DodajSubmit('listy_w_toku', 'id_listy_w_toku', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$lista_wskazan_adresowych).'.', '');
            echo '</form>';
            //echo '<form method="POST" target="center" action="sporzadz_liste.php">';
            //KontrolkiHtml::DodajSubmit('zrob_liste', 'id_zrob_liste', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$przygotuj_liste).'.', '');
            //echo '</form>';
        }
    }
	require("../stopka.php");
?>
</body>
</html>
