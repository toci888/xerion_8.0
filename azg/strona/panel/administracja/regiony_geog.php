<HTML>
<HEAD>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <script language="javascript" src="../../js/script.js"></script>
<link href="../../css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<?php
    // ¶ ±
    session_start();
    include_once ('../../dal/admDAL.php');
    include_once ('../../ui/kontrolki_html.php');
    include_once ('../../ui/utilsui.php');
    include_once ('../../bll/parametrynierbll.php'); 
    include_once ('../../bll/tags.php'); 
    include_once ('../../bll/agentbll.php');
    include_once ('../../bll/jezykibll.php');
    include_once ('../../bll/cache.php');
    include_once ('../../bll/transnierbll.php');
    require('../../naglowek.php');
    require('../../conf.php');
    
    if (!isset($_SESSION[$zalogowany]))
    {
        echo 'Nie jesteÅ› zalogowany.';
    }
    else
    {
        $uprawnienia = unserialize($_SESSION[$zalogowany]);
        
        if ($uprawnienia->adm_dane)
        {
            $tlumaczenia = cachejezyki::Czytaj();
            $agent_zal = unserialize($_SESSION[$dane_agent]);
            
            $polska = 1;
            
            $id_wyb = null;
            $id_parent = null;
            
            if (isset($_POST['region_id']) && isset($_POST[tags::$wybierz]))
            {
                $id_wyb = $_POST['region_id'];
            }
            else if (isset($_POST['id_wyb']))
            {
                $id_wyb = $_POST['id_wyb'];
            }
            if (isset($_POST[RegionyDAL::$id_parent]) && isset($_POST[tags::$wybierz]))
            {
                $id_parent = $_POST[RegionyDAL::$id_parent];
            }
            else if (isset($_POST['id_parent_hid']))
            {
                $id_parent = $_POST['id_parent_hid'];
            }
            
            $dal = new RegionyDAL();
            
            if ($id_wyb == null)
            {
                $id_wyb = $polska;
            }
            
            if (isset($_POST['kasowanie']))
            {
                $wynik = $dal->KasujRegionGeog($_POST['region_id']);
            }
            
            if (isset($_POST['dodaj_nowy']))
            {
                $tabParametr[NieruchomoscDAL::$nazwa] = $_POST['region_geog'];
                $tabParametr[RegionyDAL::$id_parent] = $id_wyb;
                if (strlen($_POST['id_otodom']) > 0)
                {
                    $tabParametr[RegionyDAL::$id_otodom] = $_POST['id_otodom'];
                }
                else
                {
                    $tabParametr[RegionyDAL::$id_otodom] = 'null';
                }
                if (isset($_POST['pokaz']))
                {
                    $tabParametr[NieruchomoscDAL::$pokaz] = 'true';
                }
                else
                {
                    $tabParametr[NieruchomoscDAL::$pokaz] = 'false';
                }
                
                $wynik = $dal->DodajRegionGeog($tabParametr);
                
            }
            if (isset($_POST['aktualizuj']))
            {
                $tabParametr[NieruchomoscDAL::$id] = $_POST['region_id'];
                $tabParametr[NieruchomoscDAL::$nazwa] = $_POST['region_geog'];
                $tabParametr[RegionyDAL::$id_parent] = $id_wyb;
                if (strlen($_POST['id_otodom']) > 0)
                {
                    $tabParametr[RegionyDAL::$id_otodom] = $_POST['id_otodom'];
                }
                else
                {
                    $tabParametr[RegionyDAL::$id_otodom] = 'null';
                }
                if (isset($_POST['pokaz']))
                {
                    $tabParametr[NieruchomoscDAL::$pokaz] = 'true';
                }
                else
                {
                    $tabParametr[NieruchomoscDAL::$pokaz] = 'false';
                }
                
                $wynik = $dal->DodajRegionGeog($tabParametr);
                
            }
            
            $wynik = $dal->PodajRegiony($id_wyb, $ilosc_wierszy);
            ///pobrac na id parent ... id parent pod pocisk wyzej - z wyniku wziac id parenta
            
            if ($id_wyb != null)
            {
                //echo $id_parent;
                $parent = $dal->PodajRodzic($id_wyb);
                
                if ($parent[NieruchomoscDAL::$id] != null)
                {
                    echo '<form action="'.$_SERVER['PHP_SELF'].'" method="POST">';
                    KontrolkiHtml::DodajHidden('id_wyb', 'id_wyb', $parent[NieruchomoscDAL::$id]);
                    KontrolkiHtml::DodajSubmit('wyzej', 'id_wyzej', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wyzej), '');
                    echo '</form>';
                }
                
                ///formularz dodawania nowego wpisu do regionow
                if (!isset($_POST['edycja']))
                {
                    echo '<form action="'.$_SERVER['PHP_SELF'].'" method="POST">';
                    KontrolkiHtml::DodajHidden('id_wyb', 'id_wyb', $id_wyb);
                    //KontrolkiHtml::DodajHidden('id_parent_hid', 'id_parent_hid', $parent[NieruchomoscDAL::$id]);
                    echo '<table><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$lokalizacja).':</td><td>';
                    KontrolkiHtml::DodajTextbox('region_geog', 'id_region_geog', '', 35, 30, '');
                    echo '</td><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$id_otodom).':</td><td>';
                    KontrolkiHtml::DodajLiczbaCalkowitaTextbox('id_otodom', 'id_id_otodom', '', 4, 6, '');
                    echo '</td><td>';
                    KontrolkiHtml::DodajCheckbox('pokaz', 'id_pokaz', true, $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$pokaz), '');
                    echo '</td><td>';
                    ///dodac walidacje - wymagane pole nazwy zeby nie wchodzily puste
                    KontrolkiHtml::DodajSubmit('dodaj_nowy', 'id_dodaj_nowy', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$dodaj), '');
                    echo '</td></tr></table>';
                    echo '</form>';
                }
                else
                {
                    $edycja = $dal->PodajRegionEdycja($_POST[RegionyDAL::$id_parent], $_POST['region_id']);
                    $wiersz = $edycja[0];
                    //var_dump($wynik);
                    echo '<form action="'.$_SERVER['PHP_SELF'].'" method="POST">';
                    KontrolkiHtml::DodajHidden('id_wyb', 'id_wyb', $id_wyb);
                    KontrolkiHtml::DodajHidden('region_id', 'region_id', $_POST['region_id']);
                    //KontrolkiHtml::DodajHidden('id_parent_hid', 'id_parent_hid', $parent[NieruchomoscDAL::$id]);
                    echo '<table><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$lokalizacja).':</td><td>';
                    KontrolkiHtml::DodajTextbox('region_geog', 'id_region_geog', $wiersz[NieruchomoscDAL::$nazwa], 35, 30, '');
                    echo '</td><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$id_otodom).':</td><td>';
                    KontrolkiHtml::DodajLiczbaCalkowitaTextbox('id_otodom', 'id_id_otodom', $wiersz[RegionyDAL::$id_otodom], 4, 6, '');
                    echo '</td><td>';
                    KontrolkiHtml::DodajCheckbox('pokaz', 'id_pokaz', $wiersz[NieruchomoscDAL::$pokaz], $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$pokaz), '');
                    echo '</td><td>';
                    ///dodac walidacje - wymagane pole nazwy zeby nie wchodzily puste
                    KontrolkiHtml::DodajSubmit('aktualizuj', 'id_aktualizuj', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$aktualizuj), '');
                    echo '</td></tr></table>';
                    echo '</form>';
                }
            } 
            
            echo '<form action="'.$_SERVER['PHP_SELF'].'" method="POST">';
            KontrolkiHtml::DodajHidden('id_wyb', 'id_wyb', $id_wyb);
            KontrolkiHtml::DodajHidden('id_parent_hid', 'id_parent_hid', $id_parent);
            UtilsUI::WyswietlTab1Poz($wynik, 
            array(RegionyDAL::$id, RegionyDAL::$nazwa, RegionyDAL::$ma_dzieci, RegionyDAL::$zaglebienie, NieruchomoscDAL::$pokaz, RegionyDAL::$id_otodom), 
            array(tags::$id, tags::$lokalizacja, tags::$ma_dzieci, tags::$zaglebienie, tags::$pokaz, tags::$id_otodom), 
            RegionyDAL::$id, 
            'region_id',
            array(Akcja::$edycja => 1, Akcja::$kasowanie => 1), 
            array(tags::$wybierz), 
            array(tags::$wybierz => tags::$wybierz), null, null, null, 
            array(RegionyDAL::$id_parent => RegionyDAL::$id_parent));
            echo '</form>';
        }
    }
    require('../../stopka.php');
?>
</body>
</html>
