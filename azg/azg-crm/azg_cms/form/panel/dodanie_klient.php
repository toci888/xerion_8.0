<html><head><title>A.Z.Gwarancja - Baza Danych</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/style.css" rel="stylesheet" type="text/css"></head>
  <script language="javascript" src="../js/script.js"></script>
<body class="logo">
<?php
    include_once ('../bll/cache.php');
    include_once ('../bll/jezykibll.php');
    include_once ('../bll/tags.php');
    include_once ('../bll/parametrynierbll.php');
    include_once ('../bll/agentbll.php');
    include_once ('../dal/queriesDAL.php');
    include_once ('../ui/kontrolki_html.php');
    include_once ('../ui/utilsui.php');
    require('../naglowek.php');
    require('../conf.php');
    session_start();
    $tlumaczenia = cachejezyki::Czytaj();
    if (!isset($_SESSION[$zalogowany]))
    {
        echo 'Nie jesteś zalogowany.';
    }
    else
    {
        if (isset($_POST['dodaj']))
        {
            //zrobic globalny mechaniz,m czyszczenia sesji lub nawet niekoniecznie since w innych oknach moga byc niezaleznie przetwarzane informacje ...
            
            //po rozpoczeciu nowej umowy id klienta z sesji powinno zostac zapomniane
            //podobnie caly szereg sesji majacych wplyw na zarzadzanie oferta
            unset($_SESSION[$wynik_ed_of]);
            unset($_SESSION[$param_nier]);
            unset($_SESSION[$wyb_param_nowa_oferta]);


            //formularz dodania lub szukania klienta
            UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$dodawanie_nowego_klienta));
            echo '<form action= "dodanie_osoba_klient.php" method= "POST">';
            //formular zprzekazuje z lefta w hiddenie czego dotyczy dodanie tego klienta: moze to byc dodanie w celu otworzenia zlecenia na poszukiwanie lub na dodanie oferty
            KontrolkiHtml::DodajHidden($oferta_hidden, $oferta_hidden, $_POST[$oferta_hidden]);
            echo '<table><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$osobowosc).' :</td><td>';
            KontrolkiHtml::DodajSelectZrodSlownik('osobowosc', 'id_but_osobowosc', SlownikDAL::$osobowosc, 'osobowosc_id', null, '', 'onchange="PokazUkryjFirmaDane(this.options[this.selectedIndex].id, '.$osoba_prawna.', \'firma_dane\');"');
            echo '</td></tr><tr name="firma_dane1" id="firma_dane1"><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nazwa_firma).' :</td><td>';
            KontrolkiHtml::DodajTextbox('nazwa_firma', 'id_nazwa_firma', '', 100, 60, '', true);
            echo '</td></tr><tr name="firma_dane2" id="firma_dane2"><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nip).' :</td><td>';
            KontrolkiHtml::DodajTextbox('nip', 'id_nip', '', 15, 15, '');
            echo '</td></tr><tr name="firma_dane3" id="firma_dane3"><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$regon).' :</td><td>';
            KontrolkiHtml::DodajTextbox('regon', 'id_regon', '', 15, 15, '');
            echo '</td></tr><tr name="firma_dane4" id="firma_dane4"><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$krs).' :</td><td>';
            KontrolkiHtml::DodajTextbox('krs', 'id_krs', '', 15, 15, '');
            echo '</td></tr><tr name="firma_dane5" id="firma_dane5"><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$kod_pocztowy).' :</td><td>';
            KontrolkiHtml::DodajKodPocztowyTextbox('kod_pocztowy_firma', 'id_kod_pocztowy_firma', '', 6, 6, '', '');
            echo '</td></tr><tr name="firma_dane6" id="firma_dane6"><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$miejscowosc).' :</td><td>';
            KontrolkiHtml::DodajPrzeszukiwanieKontrolka($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wybierz), 'wybierz', 'msc_firma', '', 'msc_id_firma', '', 'popup/wybor_miejscowosc.php?txt=msc_firma&hid=msc_id_firma', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$miejscowosc), true);
            echo '</td></tr><tr name="firma_dane7" id="firma_dane7"><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$ulica).' :</td><td>';
            KontrolkiHtml::DodajTextbox('ulica_firma', 'id_ulica_firma', '', 40, 15, '');
            echo '</td></tr><tr name="firma_dane8" id="firma_dane8"><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nr_dom).' :</td><td>';
            KontrolkiHtml::DodajTextbox('numer_dom_firma', 'id_numer_dom_firma', '', 10, 10, '');
            echo '</td></tr><tr name="firma_dane9" id="firma_dane9"><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nr_mieszkanie).' :</td><td>';
            KontrolkiHtml::DodajTextbox('numer_miesz_firma', 'id_numer_miesz_firma', '', 10, 10, '');
            echo '</td></tr><tr name="firma_dane10" id="firma_dane10"><td>';
            $tabPodpowiedzi = 'Array(\''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nazwa_firma).'\', \''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$miejscowosc).'\')';
            KontrolkiHtml::DodajSubmit('zatwierdz_dodaj_klient', 'id_zatwierdz', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$dalej).'.', 'onclick="return WalidacjaFormularz(Array(nazwa_firma, msc_firma), '.$tabPodpowiedzi.', \''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$brak).' : \');"');
            echo '</td></tr><tr name="dane_os_fiz" id="dane_os_fiz"><td>';
            KontrolkiHtml::DodajSubmit('zatwierdz_dodaj_klient', 'id_zatwierdz', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$dalej).'.', '');
            echo '</td></tr></table></form>';
            //schowanie lub pokazanie elementow formularza
            echo '<script>PokazUkryjFirmaDane(document.getElementById("osobowosc_id").value, '.$osoba_prawna.', \'firma_dane\');</script>';
        }
    }
    require('../stopka.php');
?>
</body>
</html>