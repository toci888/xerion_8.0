<html><head><title>A.Z.Gwarancja - Baza Danych</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/style.css" rel="stylesheet" type="text/css"></head>
  <script language="javascript" src="js/script.js"></script>
<body>
<?php
    include_once ('bll/cache.php');
    include_once ('bll/agentbll.php');
    include_once ('bll/jezykibll.php');
    include_once ('bll/parametrynierbll.php');
    include_once ('dal/queriesDAL.php');
    include_once ('ui/kontrolki_html.php');
    include_once ('ui/utilsui.php');
    require('naglowek.php');
    require('conf.php');
    session_start();
    $tlumaczenia = cachejezyki::Czytaj();
    if (!isset($_SESSION[$zalogowany]))
    {
        echo 'Nie jesteś zalogowany.';
    }
    else
    {
        if (isset($_POST['szukaj']))
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
            $tabParametr[NieruchomoscDAL::$id_oferta] = $_POST['numer'];
            $tabParametr[NieruchomoscDAL::$nazwisko] = $_POST['nazwisko'];
            $wyszukiwanie = new NieruchomoscDAL();
            $wynik = $wyszukiwanie->SzybkieSzukanie($tabParametr, $iloscWierszy);

            echo '<form action="edycja_oferta_szcz.php" method= "POST">';
            
            UtilsUI::WyswietlTab1Poz($wynik, 
            array(NieruchomoscDAL::$miejscowosc, NieruchomoscDAL::$imie, NieruchomoscDAL::$nazwisko, NieruchomoscDAL::$cena, NieruchomoscDAL::$transakcja_rodzaj, NieruchomoscDAL::$nieruchomosc_rodzaj), 
            array(tags::$miejscowosc, tags::$imie, tags::$nazwisko, tags::$cena, tags::$rodzaj_transakcja, tags::$rodzaj_nieruchomosci), 
            NieruchomoscDAL::$id_oferta, 
            'oferta_id',
            array(Akcja::$edycja => 1, Akcja::$kasowanie => 1));
            echo '</form>';
        }
        
        //if (isset($_POST['szukaj_left']))
        //{
        echo '<form action="'.$_SERVER['PHP_SELF'].'" method= "POST" >';    
        echo '<table><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nazwisko).' :</td><td>';
        KontrolkiHtml::DodajTextbox('nazwisko', 'id_nazwisko', '', 20, 20, '');
        echo '</td><td >'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$numer_oferty).' : </td><td >';
        KontrolkiHtml::DodajLiczbaCalkowitaTextbox('numer', 'id_numer', '', 6, 6, '');
        echo '</td><td >';
        KontrolkiHtml::DodajSubmit('szukaj','id_szukaj',$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$szukaj).'.','');
        echo '</td></tr></table></form><hr />';
        
        $nier_rodzaj_id = null;
        $trans_rodzaj_id = null;
        $status_id = null;
        
        if (isset($_POST['nier_rodzaj_id']))
        {
            $nier_rodzaj_id = $_POST['nier_rodzaj_id'];
        }
        if (isset($_POST['trans_rodzaj_id']))
        {
            $trans_rodzaj_id = $_POST['trans_rodzaj_id'];
        }
        if (isset($_POST['status_id']))
        {
            $status_id = $_POST['status_id'];
        }
        
        $obiektTrans = new TransNierDAL();
        $tabNier = $obiektTrans->PodajListeNieruchomosci($ilosc_wierszy);
        $tabTrans = $obiektTrans->PodajListeTransakcji(array(TransNierDAL::$of_zap => tags::$oferta), $ilosc_wierszy);
        echo '<form action="'.$_SERVER['PHP_SELF'].'" method="POST"><table><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$rodzaj_nieruchomosci);
        echo ' : </td><td>';
        KontrolkiHtml::DodajSelectDomWartId('nieruchomosci', 'id_nieruchomosci', $tabNier, 'nier_rodzaj_id', $nier_rodzaj_id, '', '', TransNierDAL::$id, TransNierDAL::$nazwa_nieruchomosc);
        echo '</td><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$rodzaj_transakcja);
        echo ' : </td><td>';
        KontrolkiHtml::DodajSelectDomWartId('transakcje', 'id_transakcje', $tabTrans, 'trans_rodzaj_id', $trans_rodzaj_id, '', '');
        echo '</td><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$status);
        echo ' : </td><td>';
        KontrolkiHtml::DodajSelectZrodSlownik('status', 'id_status', SlownikDAL::$status, 'status_id', $status_id, '', ''); 
        echo '</td><td>';
        KontrolkiHtml::DodajSubmit('wyswietl_oferty','id_wyswietl_oferty',$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$szukaj).'.','');
        echo '</td></tr></table></form>';
        //}
        if (isset($_POST['wyswietl_oferty']))
        {
            $tabParametr[NieruchomoscDAL::$id_rodz_trans] = $_POST['trans_rodzaj_id'];
            $tabParametr[NieruchomoscDAL::$id_nier_rodzaj] = $_POST['nier_rodzaj_id'];
            $tabParametr[NieruchomoscDAL::$id_status] = $_POST['status_id'];
            
            $wyszukiwanie = new NieruchomoscDAL();
            $wynik = $wyszukiwanie->FiltrowanieOfert($tabParametr, $iloscWierszy);
            
            if ($iloscWierszy > 0)
            {
                //atrybut mowi o tym, ile na danej stronie ma sie pojawic rekordow - domyslnie 30, dla kazdego indywidualnego zastosowania mozna podac inna cyfre
                UtilsUI::$strona = 15;
                echo '<form action="edycja_oferta_szcz.php" method="POST" target="_blank">';
            
                UtilsUI::WyswietlTab1Poz($wynik, 
                array(NieruchomoscDAL::$id_oferta, NieruchomoscDAL::$transakcja_rodzaj, NieruchomoscDAL::$nieruchomosc_rodzaj, NieruchomoscDAL::$status, NieruchomoscDAL::$ulica_net, NieruchomoscDAL::$cena, NieruchomoscDAL::$data_otw_zlecenie), 
                array(tags::$id, tags::$rodzaj_transakcja, tags::$rodzaj_nieruchomosci, tags::$status, tags::$lokalizacja, tags::$cena, tags::$data_otw_zlec), 
                NieruchomoscDAL::$id_oferta, 
                'oferta_id',
                array(Akcja::$edycja => 1, Akcja::$kasowanie => 1));
                echo '</form>';
            }
        }
    }
    require('stopka.php');
?>
</body>
</html>