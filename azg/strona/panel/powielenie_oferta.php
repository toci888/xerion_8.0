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
        
        if (isset($_POST['powiel']))    
        {
            if (strlen($_POST['numer_oferta']) > 0)
            {
                $tabParametr[NieruchomoscDAL::$id_oferta] = $_POST['numer_oferta'];
                $tabParametr[NieruchomoscDAL::$id_klient] = $_POST[KlientDAL::$id_klient];
                $tabParametr[NieruchomoscDAL::$id_agent] = $agent_zal->id;
                $tabParametr[NieruchomoscDAL::$id_osoba] = $_POST[KlientDAL::$id_osoba];
                
                $dal = new NieruchomoscDAL();
                $wynik = $dal->OfertaPowielenie($tabParametr);
                //var_dump($wynik);
                if ($wynik[NieruchomoscDAL::$id] != null)
                {
                    UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$dodano_oferte).': '.$wynik[NieruchomoscDAL::$id]);
                }
            }
        }
    }
    require('../stopka.php');
?>
</body>
</html>
