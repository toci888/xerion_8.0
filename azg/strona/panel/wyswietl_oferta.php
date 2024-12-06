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

    if (!isset($_SESSION[$zalogowany]))
    {
        echo 'Nie jesteś zalogowany.';
    }
    else
    {
        $tlumaczenia = cachejezyki::Czytaj();
        $agent_zal = unserialize($_SESSION[$dane_agent]);
        
        $nier_rodzaj_id = null;
        $trans_rodzaj_id = null;
        $status_id = null;
        $agent_id = $agent_zal->id;
        
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
        if (isset($_POST['agent_id']))
        {
            $agent_id = $_POST['agent_id'];
        }
        
        $obiektTrans = new TransNierDAL();
        $tabNier = $obiektTrans->PodajListeNieruchomosci($ilosc_wierszy);
        $tabTrans = $obiektTrans->PodajListeTransakcji(array(TransNierDAL::$of_zap => tags::$oferta), $ilosc_wierszy);
        $agenci = $obiektTrans->PodajAgentow($ilosc_wierszy);
        $agenci[count($agenci)] = array('id' => 'null', 'nazwa' => tags::$wszyscy);
        
        UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$oferty));
        echo '<form action="'.$_SERVER['PHP_SELF'].'" method="POST" name="filtracja_ofert"><table><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$rodzaj_nieruchomosci);
        KontrolkiHtml::DodajHidden('sort_kol', 'sort_kol', '');
        KontrolkiHtml::DodajHidden('sort_kier', 'sort_kier', '');
        echo ' : </td><td>';
        KontrolkiHtml::DodajSelectDomWartId('nieruchomosci', 'id_nieruchomosci', $tabNier, 'nier_rodzaj_id', $nier_rodzaj_id, '', '', TransNierDAL::$id, TransNierDAL::$nazwa_nieruchomosc);
        echo '</td><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$rodzaj_transakcja);
        echo ' : </td><td>';
        KontrolkiHtml::DodajSelectDomWartId('transakcje', 'id_transakcje', $tabTrans, 'trans_rodzaj_id', $trans_rodzaj_id, '', '');
        echo '</td><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$status);
        echo ' : </td><td>';
        KontrolkiHtml::DodajSelectZrodSlownik('status', 'id_status', SlownikDAL::$status, 'status_id', $status_id, '', '');
        echo '</td><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$agent);
        echo ' : </td><td>';
        KontrolkiHtml::DodajSelectDomWartId('agent', 'id_agent', $agenci, 'agent_id', $agent_id, '', ''); 
        echo '</td><td>';
        KontrolkiHtml::DodajSubmit('wyswietl_oferty','wyswietl_oferty',$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$pokaz).'.','');
        echo '</td></tr></table></form>';
        //}
        if (isset($_POST['wyswietl_oferty']))// || isset($_POST['sort_kol']))
        {
            
            $tabParametr[NieruchomoscDAL::$id_rodz_trans] = $_POST['trans_rodzaj_id'];
            $tabParametr[NieruchomoscDAL::$id_nier_rodzaj] = $_POST['nier_rodzaj_id'];
            $tabParametr[NieruchomoscDAL::$id_status] = $_POST['status_id'];
            $tabParametr[NieruchomoscDAL::$id_agent] = $_POST['agent_id'];
            
            if (strlen($_POST['sort_kol']) > 0)
            {
                $tabParametr[NieruchomoscDAL::$sortuj] = $_POST['sort_kol'];
            }
            if (strlen($_POST['sort_kier']) > 0)
            {
                $tabParametr[NieruchomoscDAL::$sortuj_kierunek] = $_POST['sort_kier'];
            }
            
            $wyszukiwanie = new NieruchomoscDAL();
            $wynik = $wyszukiwanie->FiltrowanieOfert($tabParametr, $iloscWierszy);
            
            if ($iloscWierszy > 0)
            {
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
                //atrybut mowi o tym, ile na danej stronie ma sie pojawic rekordow - domyslnie 30, dla kazdego indywidualnego zastosowania mozna podac inna cyfre
                UtilsUI::$strona = 15;
                UtilsUI::$rekordy = $iloscWierszy;
                UtilsUI::DodajSortowanie('filtracja_ofert', 'wyswietl_oferty', 'sort_kol', 'sort_kier');
                
                UtilsUI::IstotneInfo($_POST['nieruchomosci'].' : '.$_POST['transakcje'].' - '.$_POST['agent']);
                
                echo '<form action="edycja_oferta_szcz.php" method="POST" target="_blank">';
            
                UtilsUI::WyswietlTab1Poz($wynik, 
                array(NieruchomoscDAL::$id_oferta, NieruchomoscDAL::$status, NieruchomoscDAL::$ulica_net, NieruchomoscDAL::$cena, 
                NieruchomoscDAL::$data_otw_zlecenie, NieruchomoscDAL::$agent, NieruchomoscDAL::$pokaz, NieruchomoscDAL::$klucz), 
                array(tags::$nr_oferty, tags::$status, tags::$lokalizacja, tags::$cena, tags::$data_otw_zlec, tags::$agent, tags::$pokaz_na_stronie, 
                tags::$klucze_w_biurze), NieruchomoscDAL::$id_oferta, 'oferta_id', array(Akcja::$edycja => 1), null, null, $popupObj, $link);
                echo '</form>';
            }
            else
            {
                UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nie_znaleziono_elementow));
            }
        }
    }
    require('../stopka.php');
?>
</body>
</html>