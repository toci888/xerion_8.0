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
            
            if (isset($_POST[tags::$pokaz]))
            {
                $dal = new AdministracjaDAL();
                $tabParametr[WyposazenieNierDAL::$id_parametr_nier] = $_POST['parametr_nier_id'];
                $wynik = $dal->PodajParametrNierTrans($tabParametr, $ilosc_wierszy);
                
                UtilsUI::WyswietlTab1Poz($wynik, array(NieruchomoscDAL::$nieruchomosc_rodzaj, NieruchomoscDAL::$transakcja_rodzaj, AdministracjaDAL::$waga, NieruchomoscDAL::$pokaz), 
                array(tags::$rodzaj_nieruchomosci, tags::$rodzaj_transakcja, tags::$waga, tags::$pokaz), AdministracjaDAL::$id_lista_param_nier, 'lista_param_id', null);
                //var_dump($wynik);
            }
        }
    }
    require('../../stopka.php');
?>
</body>
</html>
