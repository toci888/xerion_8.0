<HTML>
<HEAD>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <script language="javascript" src="../js/script.js"></script>
<link href="../css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<?php
    // ¶ ±
    session_start();
    include_once ('../dal/queriesDAL.php');
    include_once ('../ui/kontrolki_html.php');
    include_once ('../ui/utilsui.php');
    include_once ('../bll/parametrynierbll.php'); 
    include_once ('../bll/tags.php'); 
    include_once ('../bll/agentbll.php');
    include_once ('../bll/jezykibll.php');
    include_once ('../bll/cache.php');
    include_once ('../bll/transnierbll.php');
    require('../naglowek.php');
    require('../conf.php'); 
    $tlumaczenia = cachejezyki::Czytaj(); 
    if (!isset($_SESSION[$zalogowany]))
    {
        echo 'Nie jesteÅ› zalogowany.';
    }
    else
    {
        $nazwisko_szukanie = null;
        $nr_oferty_szukanie = null;
        
        if (isset($_POST['numer']))
        {
            $nazwisko_szukanie = $_POST['nazwisko'];
            $nr_oferty_szukanie = $_POST['numer'];
        }
        
        if (isset($_POST['szukaj_zapotrzebowanie']))
        {
            if(strlen($_POST['numer']) < 1)
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
            $tabParametr[NieruchomoscDAL::$id_zapotrzebowanie] = $_POST['numer'];        
            $tabParametr[NieruchomoscDAL::$nazwisko] = $_POST['nazwisko'];
            $wyszukiwanie = new NieruchomoscDAL();
            
            $wynik = $wyszukiwanie->SzybkieSzukanieZapotrzebowanie($tabParametr, $iloscWierszy);
            
            $popupObj = new PopUpWysw();
            $popupObj->nag = array(tags::$oferty_ogladniete);
            $popupObj->przyc_nazwa = array(tags::$oferty_ogladniete);
            $popupObj->url = array('popup/lista_wskazan_adresowych_z.php?'.NieruchomoscDAL::$id_zapotrzebowanie); //podac tu id trans id nier ??
            $popupObj->szerokosc = array(1000);
            $popupObj->dlugosc = array(700);
            
            
            $dane_zagn = new ZagnWysw();
                
            $dane_zagn->nag = tags::$poszukuje;
            $dane_zagn->obj_nazwa = 'nieruchomoscDAL';
            $dane_zagn->obj_metoda = 'PodajTransNierZapotrzebowanie';
            $dane_zagn->ind_dane = array(NieruchomoscDAL::$id_zapotrzebowanie);
            $dane_zagn->ind_param = array(NieruchomoscDAL::$id_zapotrzebowanie);
            $dane_zagn->wysw_info = array(NieruchomoscDAL::$nieruchomosc_rodzaj, NieruchomoscDAL::$transakcja_rodzaj, NieruchomoscDAL::$cena, NieruchomoscDAL::$status);
            $dane_zagn->index = NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj;
            $dane_zagn->nad_index = tags::$numer_zapotrzebowania;
            $dane_zagn->popupobj = new PopUpWysw();
            
            $dane_zagn->popupobj->przyc_nazwa = array(tags::$pokaz, tags::$pokaz_skojarzenia);//, tags::$opis_zapotrzebowania);
            $dane_zagn->popupobj->url = array('popup/info_klient_zlecenie.php?'.NieruchomoscDAL::$id_zapotrzebowanie.'='.tags::$numer_zapotrzebowania.'&'.NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj, 
            'popup/skoj_of_standard.php?'.NieruchomoscDAL::$id_zapotrzebowanie.'='.tags::$numer_zapotrzebowania.'&'.NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj);//,
            $dane_zagn->popupobj->szerokosc = array(1000, 1000);
            $dane_zagn->popupobj->dlugosc = array(750, 750);
            $dane_zagn->popupobj->dod_index = array(array(NieruchomoscDAL::$id_klient => NieruchomoscDAL::$id_klient), array());

            if ($iloscWierszy > 0)
            {
                UtilsUI::$rekordy = $iloscWierszy;
                //echo '<form action="edycja_zapotrzebowania.php" method="POST">';
                echo '<form action="dodanie_trans_zap.php" method="POST">';
                UtilsUI::WyswietlTab1Poz($wynik, 
                array(NieruchomoscDAL::$id_zapotrzebowanie, NieruchomoscDAL::$imie, NieruchomoscDAL::$nazwisko, NieruchomoscDAL::$pesel, OsobaDAL::$telefon), 
                array(tags::$nr_zapotrzebowania, tags::$imie, tags::$nazwisko, tags::$pesel, tags::$telefon), NieruchomoscDAL::$id_zapotrzebowanie, 'zapotrzebowanie_id', 
                array(Akcja::$edycja => 1), null, null, $popupObj, null, $dane_zagn, array(NieruchomoscDAL::$id_klient => NieruchomoscDAL::$id_klient));
                echo '</form>';
            }
        }
        
        //if (isset($_POST['szukaj_left']))
        if ($_SERVER['REQUEST_METHOD'] == 'POST')     //jesli ma zniknac ewentualnie to dorzucac != isset jakis post, lub obslugiwac w innym pliku wywolanie
        {
            UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$szukanie_istniejacych_zapotrzebowan)); 
            echo '<form action="'.$_SERVER['PHP_SELF'].'" method= "POST" >';    
            echo '<table><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nazwisko).' :</td><td>';
            KontrolkiHtml::DodajTextbox('nazwisko', 'id_nazwisko', $nazwisko_szukanie, 20, 20, '');
            echo '</td><td >'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$numer_zapotrzebowania).' : </td><td >';
            KontrolkiHtml::DodajLiczbaCalkowitaTextbox('numer', 'id_numer', $nr_oferty_szukanie, 6, 6, '');
            echo '</td><td >';
            KontrolkiHtml::DodajSubmit('szukaj_zapotrzebowanie','id_szukaj',$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$szukaj).'.','');
            echo '</td></tr></table></form><hr />'; 
        }
    }
    require('../stopka.php');

?>
</body>
</html>
