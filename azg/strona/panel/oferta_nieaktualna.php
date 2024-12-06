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
        
        if (isset($_POST['zatwierdz_nieaktualna']))    
        {
            $dal = new NieruchomoscDAL();
            $tabParametr[NieruchomoscDAL::$id_oferta] = $_POST[NieruchomoscDAL::$id_oferta];
            $tabParametr[NieruchomoscDAL::$cena] = $_POST[NieruchomoscDAL::$cena];
            if (isset($_POST['sprzedane']))
            {
                $tabParametr[NieruchomoscDAL::$is_sprzedana] = 'true';
            }
            else
            {
                $tabParametr[NieruchomoscDAL::$is_sprzedana] = 'false';
            }
            if (isset($_POST['transakcja_azg']))
            {
                $tabParametr[NieruchomoscDAL::$is_azg] = 'true';
            }
            else
            {
                $tabParametr[NieruchomoscDAL::$is_azg] = 'false';
            }
            $wynik = $dal->DodajInfoOfSprz($tabParametr);
            if (!$wynik)
            {
                UtilsUI::InfoBlad($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_nie_powiodla_sie));
            }
            KontrolkiHtml::DodajSubmit('ok', 'id_ok', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zakoncz), 'onclick="window.close();"');
        }
    }
    require('../stopka.php');
?>
</body>
</html>
