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
        
        $data_filtr = $data_dzienna;
        
        if (isset($_POST['data_filtr']))
        {
            $data_filtr = $_POST['data_filtr'];
        }
        
        UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$statystyki));
        echo '<form action="'.$_SERVER['PHP_SELF'].'" method="POST" name="statystyka"><table><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$numer_oferty);
        KontrolkiHtml::DodajHidden('sort_kol', 'sort_kol', '');
        KontrolkiHtml::DodajHidden('sort_kier', 'sort_kier', '');
        echo ' : </td><td>';
        KontrolkiHtml::DodajLiczbaCalkowitaTextbox('oferta_id', 'id_oferta_id', '', 6, 4, '');
        echo '</td><td>';
        KontrolkiHtml::DodajSubmit('wyswietl_statystyka', 'wyswietl_statystyka', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$pokaz).'.','');
        echo '</td></tr></table></form>';
        
        if (isset($_POST['wyswietl_statystyka']))// || isset($_POST['sort_kol']))
        {
            
            $tabParametr[NieruchomoscDAL::$id_oferta] = $_POST['oferta_id'];
            
            $tabParametr[NieruchomoscDAL::$sortuj] = $_POST['sort_kol'];
            $tabParametr[NieruchomoscDAL::$sortuj_kierunek] = $_POST['sort_kier'];

            $wyszukiwanie = new AdministracjaDAL();
            $wynik = $wyszukiwanie->StatOdwiedzOfert($tabParametr, $ilosc_wierszy);
            //var_dump($wynik);
            
            if ($ilosc_wierszy > 0)
            {              
                //atrybut mowi o tym, ile na danej stronie ma sie pojawic rekordow - domyslnie 30, dla kazdego indywidualnego zastosowania mozna podac inna cyfre
                UtilsUI::$strona = 15;
                UtilsUI::$rekordy = $ilosc_wierszy;
                //UtilsUI::$wiersz_zazn = true;
                UtilsUI::DodajSortowanie('statystyka', 'wyswietl_statystyka', 'sort_kol', 'sort_kier');
                //echo '<form action="edycja_zapotrzebowania.php" method="POST" target="_blank">';            
                UtilsUI::WyswietlTab1Poz($wynik, 
                array(NieruchomoscDAL::$id_oferta, AdministracjaDAL::$ilosc_wyswietlen, AdministracjaDAL::$zrodla_wejsc, AdministracjaDAL::$wspolczynnik), 
                array(tags::$nr_oferty, tags::$ilosc_wyswietlen_oferty_na_stronie, tags::$unikatowych_adresow, tags::$wspolczynnik), 
                NieruchomoscDAL::$id_oferta, 
                'oferta_id', null);//, null, null, null, null, $dane_zagn);
                echo '</form>';
            }
        }
        
        echo '<hr /><form action="'.$_SERVER['PHP_SELF'].'" method="POST" name="podaj_szukania_strona">';
        KontrolkiHtml::DodajTextboxData('data_filtr', 'id_data_filtr', $data_filtr, 10, 10, $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podana_inf_nie_jest_data), '', '', 'podaj_szukania_strona');
        echo '<br />';
        KontrolkiHtml::DodajSubmit('wyswietl_statystyka_szukan', 'id_wyswietl_statystyka_szukan', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$statystyki).'.','');
        echo '</form>';
        
        if (isset($_POST['wyswietl_statystyka_szukan']))// || isset($_POST['sort_kol']))
        {
            $wyszukiwanie = new AdministracjaDAL();
            $tabParametr[NieruchomoscDAL::$data] = $data_filtr;
            $wynik = $wyszukiwanie->StatWyszukiwanie($tabParametr, $ilosc_wierszy);
            if ($ilosc_wierszy > 0)
            {              
                //atrybut mowi o tym, ile na danej stronie ma sie pojawic rekordow - domyslnie 30, dla kazdego indywidualnego zastosowania mozna podac inna cyfre
                UtilsUI::$strona = 15;
                UtilsUI::$rekordy = $ilosc_wierszy;
                UtilsUI::UsunSortowanie();
                //UtilsUI::DodajSortowanie('statystyka', 'wyswietl_statystyka', 'sort_kol', 'sort_kier');
                //echo '<form action="edycja_zapotrzebowania.php" method="POST" target="_blank">';            
                UtilsUI::WyswietlTab1Poz($wynik, 
                array(AdministracjaDAL::$ilosc_wyszukiwan, AdministracjaDAL::$ilosc_ofert, AdministracjaDAL::$adres, NieruchomoscDAL::$data, NieruchomoscDAL::$nieruchomosc_rodzaj, NieruchomoscDAL::$transakcja_rodzaj, 
                StronaPodsInfoDAL::$l_pok_min, StronaPodsInfoDAL::$l_pok_max), 
                array(tags::$ilosc_wyszukiwan, tags::$ilosc_ofert, tags::$adres, tags::$data, tags::$rodzaj_nieruchomosci, tags::$rodzaj_transakcja, tags::$liczba_pokoi, tags::$liczba_pokoi_max), 
                NieruchomoscDAL::$adres, 
                'adres_ip', null);//, null, null, null, null, $dane_zagn);
            }
            echo '<hr />';
            $wynik = $wyszukiwanie->StatWyszukiwanieZewn($tabParametr, $ilosc_wierszy);
            if ($ilosc_wierszy > 0)
            {              
                $links = array();
                //tablica linkow :) na grid; 1 element - odwolanie do oferty na naszej str, 2 - skad wleziono
                $links['link_str_azg'] = new Links();
                $links['link_wysz'] = new Links();
                
                $links['link_str_azg']->nag = tags::$pokaz;
                $links['link_str_azg']->text = tags::$pokaz;
                $links['link_str_azg']->url = $strona_www;
                $links['link_str_azg']->vars = array(tags::$oferta, NieruchomoscDAL::$id_trans_rodzaj, NieruchomoscDAL::$id_nier_rodzaj);
                $links['link_str_azg']->varvalues = array(NieruchomoscDAL::$id_oferta, NieruchomoscDAL::$id_trans_rodzaj, NieruchomoscDAL::$id_nier_rodzaj);
                
                $links['link_wysz']->nag = tags::$od;
                $links['link_wysz']->text = tags::$od;
                $links['link_wysz']->url = SzablonDAL::$referer;
                $links['link_wysz']->url_var = true;
                $links['link_wysz']->vars = null;
                $links['link_wysz']->varvalues = null;
                
                //atrybut mowi o tym, ile na danej stronie ma sie pojawic rekordow - domyslnie 30, dla kazdego indywidualnego zastosowania mozna podac inna cyfre
                UtilsUI::$strona = 15;
                UtilsUI::$rekordy = $ilosc_wierszy;
                UtilsUI::UsunSortowanie();
                //UtilsUI::DodajSortowanie('statystyka', 'wyswietl_statystyka', 'sort_kol', 'sort_kier');
                //echo '<form action="edycja_zapotrzebowania.php" method="POST" target="_blank">';            
                UtilsUI::WyswietlTab1Poz($wynik, 
                array(NieruchomoscDAL::$id_oferta, AdministracjaDAL::$adres, NieruchomoscDAL::$data, AdministracjaDAL::$referer), 
                array(tags::$nr_oferty, tags::$adres, tags::$data, tags::$od), 
                NieruchomoscDAL::$id_oferta, 
                'oferta_id', null, null, null, null, $links);//, null, null, null, null, $dane_zagn);
            }
        }
    }
    require('../stopka.php');
?>
</body>
</html>
