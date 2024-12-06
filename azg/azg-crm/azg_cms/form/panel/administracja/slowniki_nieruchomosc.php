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
    include_once ('../../dal/queriesDAL.php');
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
            $sekcja_id = null;
            
            if (isset($_POST['sekcja_id']))
            {
                $sekcja_id = $_POST['sekcja_id'];
            }
            
            echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'"><table><tr><td>';
            KontrolkiHtml::DodajSelectZrodSlownik('sekcja', 'id_sekcja', SlownikDAL::$sekcja, 'sekcja_id', $sekcja_id, '', '');
            echo '</td><td>';
            KontrolkiHtml::DodajSubmit('pokaz_parametry', 'id_pokaz_parametry', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$pokaz), '');
            echo '</td></tr></table></form>';
            
            if (isset($_POST['pokaz_parametry']))
            {
                $dal = new AdministracjaDAL();
                $tabParametr[WyposazenieNierDAL::$id_sekcja] = $_POST['sekcja_id'];
                $wynik = $dal->ListaWyposazenieNier($tabParametr, $ilosc_wierszy);
                
                if ($ilosc_wierszy > 0)
                {
                    UtilsUI::$strona = 10;
                    UtilsUI::$rekordy = $ilosc_wierszy;
                    echo '<form>';
                    UtilsUI::WyswietlTab1Poz($wynik, array(NieruchomoscDAL::$nazwa, SlownikDAL::$sekcja, AdministracjaDAL::$waga, AdministracjaDAL::$ma_dzieci, AdministracjaDAL::$wielokrotne), 
                    array(tags::$parametr, tags::$sekcja, tags::$waga, tags::$ma_dzieci, tags::$wielokrotne), AdministracjaDAL::$id_wyposazenie_nier, 'wyposazenie_nier_id', null);
                    echo '</form>';
                }
                
                $wynik = $dal->ListaParametrNier($tabParametr, $ilosc_wierszy);
                
                if ($ilosc_wierszy > 0)
                {
                    echo '<br />';
                    
                    UtilsUI::$strona = 10;
                    UtilsUI::$rekordy = $ilosc_wierszy;
                    echo '<form method="POST" action="parametr_nier.php">';
                    UtilsUI::WyswietlTab1Poz($wynik, array(NieruchomoscDAL::$nazwa, SlownikDAL::$sekcja, WyposazenieNierDAL::$walidacja, WyposazenieNierDAL::$dl_inf, AdministracjaDAL::$waga), 
                    array(tags::$parametr, tags::$sekcja, tags::$walidacja, tags::$dlugosc, tags::$waga), AdministracjaDAL::$id_parametr_nier, 'parametr_nier_id', null, 
                    array(tags::$pokaz), array(tags::$pokaz => tags::$pokaz));
                    echo '</form>';
                }
            }
        }
    }
    require('../../stopka.php');
?>
</body>
</html>
