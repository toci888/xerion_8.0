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
     
    if (!isset($_SESSION[$zalogowany]))
    {
        echo 'Nie jesteÅ› zalogowany.';
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
        $tabTrans = $obiektTrans->PodajListeTransakcji(array(TransNierDAL::$of_zap => tags::$zapotrzbowanie), $ilosc_wierszy);
        $agenci = $obiektTrans->PodajAgentow($ilosc_wierszy);
        $agenci[count($agenci)] = array('id' => 'null', 'nazwa' => tags::$wszyscy); 
        
        UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zapotrzebowania));
        echo '<form action="'.$_SERVER['PHP_SELF'].'" method="POST" name="filtracja_zapotrzebowan"><table><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$rodzaj_nieruchomosci);
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
        KontrolkiHtml::DodajSubmit('wyswietl_zapotrzebowania', 'wyswietl_zapotrzebowania',$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$szukaj).'.','');
        echo '</td></tr></table></form>';
        
        if (isset($_POST['wyswietl_zapotrzebowania']))// || isset($_POST['sort_kol']))
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
            $wynik = $wyszukiwanie->FiltrowanieZapotrzebowan($tabParametr, $iloscWierszy);
            //var_dump($wynik);
            
            if ($iloscWierszy > 0)
            {
                echo $_POST['nieruchomosci'].' : '.$_POST['transakcje'];
                /*$dane_zagn = new ZagnWysw();
                
                $dane_zagn->nag = tags::$poszukuje;
                $dane_zagn->obj_nazwa = 'nieruchomoscDAL';
                $dane_zagn->obj_metoda = 'PodajTransNierZapotrzebowanie';
                $dane_zagn->ind_dane = array(NieruchomoscDAL::$id_zapotrzebowanie);
                $dane_zagn->ind_param = array(NieruchomoscDAL::$id_zapotrzebowanie);
                $dane_zagn->wysw_info = array(NieruchomoscDAL::$nieruchomosc_rodzaj, NieruchomoscDAL::$transakcja_rodzaj, NieruchomoscDAL::$cena, NieruchomoscDAL::$status);*/
                
                $popupObj = new PopUpWysw();
                $popupObj->nag = array(tags::$pokaz, tags::$pokaz_skojarzenia, tags::$oferty_ogladniete);
                $popupObj->przyc_nazwa = array(tags::$pokaz, tags::$pokaz_skojarzenia, tags::$oferty_ogladniete);
                $popupObj->url = array('popup/info_klient_zlecenie.php?'.NieruchomoscDAL::$id_zapotrzebowanie, 
                'popup/skoj_of_standard.php?'.NieruchomoscDAL::$id_zapotrzebowanie, 
                'popup/lista_wskazan_adresowych_z.php?'.NieruchomoscDAL::$id_zapotrzebowanie); //podac tu id trans id nier ??
                $popupObj->szerokosc = array(1000, 1000, 1000);
                $popupObj->dlugosc = array(750, 750, 700);
                $popupObj->dod_index = array(array(NieruchomoscDAL::$id_klient => NieruchomoscDAL::$id_klient, NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj => NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj), 
                array(NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj => NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj), 
                array());
                
                //atrybut mowi o tym, ile na danej stronie ma sie pojawic rekordow - domyslnie 30, dla kazdego indywidualnego zastosowania mozna podac inna cyfre
                UtilsUI::$strona = 15;
                UtilsUI::$rekordy = $iloscWierszy;
                //UtilsUI::$wiersz_zazn = true;
                UtilsUI::DodajSortowanie('filtracja_zapotrzebowan', 'wyswietl_zapotrzebowania', 'sort_kol', 'sort_kier');
                //echo '<form action="edycja_zapotrzebowania.php" method="POST" target="_blank">';
                echo '<form action="dodanie_trans_zap.php" method="POST" target="_blank">';
            
                UtilsUI::WyswietlTab1Poz($wynik, 
                array(NieruchomoscDAL::$id_zapotrzebowanie, NieruchomoscDAL::$nazwisko, NieruchomoscDAL::$imie, NieruchomoscDAL::$status, NieruchomoscDAL::$cena, NieruchomoscDAL::$data_otw_zlecenie, NieruchomoscDAL::$agent), 
                array(tags::$nr_zapotrzebowania, tags::$nazwisko, tags::$imie, tags::$status, tags::$cena, tags::$data_otw_zlec, tags::$agent), 
                NieruchomoscDAL::$id_zapotrzebowanie, 
                'zapotrzebowanie_id',
                array(Akcja::$edycja => 1), null, null, $popupObj, null, null, array(NieruchomoscDAL::$id_klient => NieruchomoscDAL::$id_klient));//, null, null, null, null, $dane_zagn);
                echo '</form>';
            }
        }
    }
    require('../stopka.php');

?>
</body>
</html>
