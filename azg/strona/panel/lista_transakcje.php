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
    include_once ('../dal/admDAL.php');
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
        
        $obiektTrans = new TransNierDAL();
        $agenci = $obiektTrans->PodajAgentow($ilosc_wierszy);
        $agenci[count($agenci)] = array('id' => 'null', 'nazwa' => tags::$wszyscy);
        
        $agent_id = $agent_zal->id;
        if (isset($_POST['agent_id']))
        {
            $agent_id = $_POST['agent_id'];
        }
        
        UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$transakcje));
        echo '<form action="'.$_SERVER['PHP_SELF'].'" method="POST" name="filtracja_transakcji"><table><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$agent);
        KontrolkiHtml::DodajHidden('sort_kol', 'sort_kol', '');
        KontrolkiHtml::DodajHidden('sort_kier', 'sort_kier', '');
        echo ' : </td><td>';
        KontrolkiHtml::DodajSelectDomWartId('agent', 'id_agent', $agenci, 'agent_id', $agent_id, '', ''); 
        echo '</td><td>';
        KontrolkiHtml::DodajSubmit('wyswietl_transakcje', 'wyswietl_transakcje', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$pokaz).'.','');
        echo '</td></tr></table></form>';
        
        if (isset($_POST['wyswietl_transakcje']))// || isset($_POST['sort_kol']))
        {
            $tabParametr[NieruchomoscDAL::$id_agent] = $_POST['agent_id'];
            
            if (strlen($_POST['sort_kol']) > 0)
            {
                $tabParametr[NieruchomoscDAL::$sortuj] = $_POST['sort_kol'];
            }
            if (strlen($_POST['sort_kier']) > 0)
            {
                $tabParametr[NieruchomoscDAL::$sortuj_kierunek] = $_POST['sort_kier'];
            }
            
            $wyszukiwanie = new TransakcjaDAL();
            $wynik = $wyszukiwanie->FitracjaTransakcje($tabParametr, $ilosc_wierszy);
            
            if ($ilosc_wierszy > 0)
            {
                //atrybut mowi o tym, ile na danej stronie ma sie pojawic rekordow - domyslnie 30, dla kazdego indywidualnego zastosowania mozna podac inna cyfre
                UtilsUI::$strona = 15;
                UtilsUI::$rekordy = $ilosc_wierszy;
                UtilsUI::DodajSortowanie('filtracja_transakcji', 'wyswietl_transakcje', 'sort_kol', 'sort_kier');
                
                UtilsUI::IstotneInfo($_POST['agent']);
                
                echo '<form action="popup/transakcja.php" method="POST" target="_blank">';
            
                UtilsUI::WyswietlTab1Poz($wynik, 
                array(NieruchomoscDAL::$id_oferta, NieruchomoscDAL::$id_zapotrzebowanie, NieruchomoscDAL::$agent, AdministracjaDAL::$termin_notar, AdministracjaDAL::$zdanie_nier, 
                NieruchomoscDAL::$cena, AdministracjaDAL::$sprzedajacy, AdministracjaDAL::$kupujacy), 
                array(tags::$nr_oferty, tags::$nr_zapotrzebowania, tags::$agent, tags::$termin_umowy_notarialnej, tags::$data_zdania, tags::$cena, tags::$sprzedaz, tags::$kupno), 
                NieruchomoscDAL::$id_oferta, NieruchomoscDAL::$id_oferta, array(Akcja::$edycja => 1), null, null, null, null, null, array(AdministracjaDAL::$id_lista_wsk_adr => AdministracjaDAL::$id_lista_wsk_adr));
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
