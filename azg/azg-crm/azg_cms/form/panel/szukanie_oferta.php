<html><head><title>A.Z.Gwarancja - Baza Danych</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/style.css" rel="stylesheet" type="text/css"></head>
  <script language="javascript" src="../js/script.js"></script>
<body>
<?php
    include_once ('../bll/cache.php');
    include_once ('../bll/agentbll.php');
    include_once ('../bll/jezykibll.php');
    include_once ('../bll/parametrynierbll.php');
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
        $nazwisko_szukanie = null;
        $nr_oferty_szukanie = null;
        
        $ulica_szukanie = null;
        
        if (isset($_POST['nazwisko']))
        {
            $nazwisko_szukanie = $_POST['nazwisko'];
            $nr_oferty_szukanie = $_POST['numer'];
        }
        
        if (isset($_POST['ulica_s']))
        {
            $ulica_szukanie = $_POST['ulica_s'];
        }
        
        //szukaj_ulica
        if (isset($_POST['szukaj']))
        {
            if(strlen($_POST['numer']) < 1)      //:D:D:D:D:D:D:D:D:D:D uczynieine formularza szukania lepkim musi byc powyzej niniejszego kodu zeby nie bylo jaj
            {
                $_POST['numer'] = 0;
            }
            if (strlen($_POST['nazwisko']) < 1)
            {
                $_POST['nazwisko'] = 'null';
            }
            else
            {
                $_POST['nazwisko'] = '\''.$_POST['nazwisko'].'\'';
            }
            $tabParametr[NieruchomoscDAL::$id_oferta] = $_POST['numer'];
            $tabParametr[NieruchomoscDAL::$nazwisko] = $_POST['nazwisko'];
            $wyszukiwanie = new NieruchomoscDAL();
            $wynik = $wyszukiwanie->SzybkieSzukanie($tabParametr, $iloscWierszy);
            
            /*$popupObj = new PopUpWysw();
            $popupObj->nag = array(tags::$pokaz_skojarzenia);
            $popupObj->przyc_nazwa = array(tags::$pokaz_skojarzenia);
            $popupObj->url = array('popup/skoj_zap_standard.php?'.NieruchomoscDAL::$id_oferta);
            $popupObj->szerokosc = array(1000);
            $popupObj->dlugosc = array(750);*/
            $popupObj = new PopUpWysw();
            $popupObj->nag = array(tags::$pokaz_skojarzenia, tags::$wyslij, tags::$gablota);
            $popupObj->przyc_nazwa = array(tags::$pokaz_skojarzenia, tags::$wyslij, tags::$gablota);
            $popupObj->url = array('popup/skoj_zap_standard.php?'.NieruchomoscDAL::$id_oferta, 'administracja/wysylka_biura.php?'.NieruchomoscDAL::$id_oferta, 
            'popup/gablota.php?'.NieruchomoscDAL::$id_oferta); //podac tu id trans id nier ??
            $popupObj->szerokosc = array(1000, 700, 1050);
            $popupObj->dlugosc = array(750, 600, 710);
            $popupObj->dod_index = array(array(), array(NieruchomoscDAL::$id_trans_rodzaj => NieruchomoscDAL::$id_rodz_trans, NieruchomoscDAL::$id_nier_rodzaj => NieruchomoscDAL::$id_nier_rodzaj), 
            array(NieruchomoscDAL::$id_trans_rodzaj => NieruchomoscDAL::$id_rodz_trans, NieruchomoscDAL::$id_nier_rodzaj => NieruchomoscDAL::$id_nier_rodzaj));
            
            $links = new Links();
            $links->nag = tags::$pokaz;
            $links->text = tags::$pokaz;
            $links->url = $strona_www;
            $links->vars = array(tags::$oferta, NieruchomoscDAL::$id_trans_rodzaj, NieruchomoscDAL::$id_nier_rodzaj);
            $links->varvalues = array(NieruchomoscDAL::$id_oferta, NieruchomoscDAL::$id_rodz_trans, NieruchomoscDAL::$id_nier_rodzaj);
            $link[0] = $links;
            
            if ($iloscWierszy > 0)
            {
                echo '<form action="edycja_oferta_szcz.php" method="POST">';
                UtilsUI::DodajTabWyroznien($status_nieaktualny, $czerwony);
                UtilsUI::DodajTabWyroznien($status_zawieszony, $niebieski);
                UtilsUI::DodajTabWyroznien($status_umowiony, $zielony);
                UtilsUI::DodajTabWyroznien($status_wstrzymany, $zolty);
                UtilsUI::PodajIndWyroznien(NieruchomoscDAL::$id_status);
            
                UtilsUI::$rekordy = $iloscWierszy;
                UtilsUI::WyswietlTab1Poz($wynik, 
                array(NieruchomoscDAL::$id_oferta, NieruchomoscDAL::$nazwisko, NieruchomoscDAL::$status, KlientDAL::$telefon, NieruchomoscDAL::$miejscowosc, 
                NieruchomoscDAL::$cena, NieruchomoscDAL::$transakcja_rodzaj, NieruchomoscDAL::$nieruchomosc_rodzaj, NieruchomoscDAL::$pokaz, NieruchomoscDAL::$klucz), 
                array(tags::$nr_oferty, tags::$nazwisko, tags::$status, tags::$telefon, tags::$miejscowosc, tags::$cena, tags::$rodzaj_transakcja, tags::$rodzaj_nieruchomosci, 
                tags::$pokaz_na_stronie, tags::$klucze_w_biurze), 
                NieruchomoscDAL::$id_oferta, 'oferta_id', array(Akcja::$edycja => 1), null, null, $popupObj, $link);
                echo '</form>';
            }
        }
        
        //if (isset($_POST['szukaj_left']))
        //{
        
        UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$szukanie_istniejacych_ofert));
        echo '<form action="'.$_SERVER['PHP_SELF'].'" method="POST">';    
        echo '<table><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nazwisko).' :</td><td>';
        KontrolkiHtml::DodajTextbox('nazwisko', 'id_nazwisko', $nazwisko_szukanie, 20, 20, '');
        echo '</td><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$numer_oferty).' : </td><td>';
        KontrolkiHtml::DodajLiczbaCalkowitaTextbox('numer', 'id_numer', $nr_oferty_szukanie, 6, 6, '');
        echo '</td><td>';
        KontrolkiHtml::DodajSubmit('szukaj','id_szukaj',$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$szukaj).'.','');
        echo '</td></tr></table></form><hr />';
        
        if (isset($_POST['szukaj_ulica']))
        {
            if (strlen($_POST['ulica_s']) > 0)
            {
                $_POST['ulica_s'] = '\''.$_POST['ulica_s'].'\'';
            }
            
            $tabParametr[NieruchomoscDAL::$ulica] = $_POST['ulica_s'];
            $wyszukiwanie = new NieruchomoscDAL();
            $wynik = $wyszukiwanie->SzukanieOfertaAdres($tabParametr, $iloscWierszy);
            
            /*$popupObj = new PopUpWysw();
            $popupObj->nag = array(tags::$pokaz_skojarzenia);
            $popupObj->przyc_nazwa = array(tags::$pokaz_skojarzenia);
            $popupObj->url = array('popup/skoj_zap_standard.php?'.NieruchomoscDAL::$id_oferta);
            $popupObj->szerokosc = array(1000);
            $popupObj->dlugosc = array(750);*/
            $popupObj = new PopUpWysw();
            $popupObj->nag = array(tags::$pokaz_skojarzenia, tags::$wyslij, tags::$gablota);
            $popupObj->przyc_nazwa = array(tags::$pokaz_skojarzenia, tags::$wyslij, tags::$gablota);
            $popupObj->url = array('popup/skoj_zap_standard.php?'.NieruchomoscDAL::$id_oferta, 'administracja/wysylka_biura.php?'.NieruchomoscDAL::$id_oferta, 
            'popup/gablota.php?'.NieruchomoscDAL::$id_oferta); //podac tu id trans id nier ??
            $popupObj->szerokosc = array(1000, 700, 1050);
            $popupObj->dlugosc = array(750, 600, 710);
            $popupObj->dod_index = array(array(), array(NieruchomoscDAL::$id_trans_rodzaj => NieruchomoscDAL::$id_rodz_trans, NieruchomoscDAL::$id_nier_rodzaj => NieruchomoscDAL::$id_nier_rodzaj), 
            array(NieruchomoscDAL::$id_trans_rodzaj => NieruchomoscDAL::$id_rodz_trans, NieruchomoscDAL::$id_nier_rodzaj => NieruchomoscDAL::$id_nier_rodzaj));
            
            $links = new Links();
            $links->nag = tags::$pokaz;
            $links->text = tags::$pokaz;
            $links->url = $strona_www;
            $links->vars = array(tags::$oferta, NieruchomoscDAL::$id_trans_rodzaj, NieruchomoscDAL::$id_nier_rodzaj);
            $links->varvalues = array(NieruchomoscDAL::$id_oferta, NieruchomoscDAL::$id_rodz_trans, NieruchomoscDAL::$id_nier_rodzaj);
            $link[0] = $links;
            
            if ($iloscWierszy > 0)
            {
                echo '<form action="edycja_oferta_szcz.php" method="POST" target="_blank">';
                UtilsUI::DodajTabWyroznien($status_nieaktualny, $czerwony);
                UtilsUI::DodajTabWyroznien($status_zawieszony, $niebieski);
                UtilsUI::DodajTabWyroznien($status_umowiony, $zielony);
                UtilsUI::DodajTabWyroznien($status_wstrzymany, $zolty);
                UtilsUI::PodajIndWyroznien(NieruchomoscDAL::$id_status);
            
                UtilsUI::$rekordy = $iloscWierszy;
                UtilsUI::WyswietlTab1Poz($wynik, 
                array(NieruchomoscDAL::$id_oferta, NieruchomoscDAL::$nazwisko, NieruchomoscDAL::$status, KlientDAL::$telefon, NieruchomoscDAL::$miejscowosc, 
                NieruchomoscDAL::$cena, NieruchomoscDAL::$transakcja_rodzaj, NieruchomoscDAL::$nieruchomosc_rodzaj, NieruchomoscDAL::$pokaz, NieruchomoscDAL::$klucz), 
                array(tags::$nr_oferty, tags::$nazwisko, tags::$status, tags::$telefon, tags::$miejscowosc, tags::$cena, tags::$rodzaj_transakcja, tags::$rodzaj_nieruchomosci, 
                tags::$pokaz_na_stronie, tags::$klucze_w_biurze), 
                NieruchomoscDAL::$id_oferta, 'oferta_id', array(Akcja::$edycja => 1), null, null, $popupObj, $link);
                echo '</form>';
            }
        }
        
        echo '<form action="'.$_SERVER['PHP_SELF'].'" method="POST">';    
        echo '<table><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$ulica).' :</td><td>';
        KontrolkiHtml::DodajTextbox('ulica_s', 'id_ulica', $ulica_szukanie, 20, 20, '');
        echo '</td><td>';
        KontrolkiHtml::DodajSubmit('szukaj_ulica','id_szukaj_ulica',$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$szukaj).'.','');
        echo '</td></tr></table></form>';
    }
    require('../stopka.php');
?>
</body>
</html>