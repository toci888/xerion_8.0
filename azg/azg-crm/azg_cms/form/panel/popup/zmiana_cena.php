<HTML>
<HEAD>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <script language="javascript" src="../../js/script.js"></script>
<link href="../../css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<?php
    // � �
    session_start();
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
        echo 'Nie jesteś zalogowany.';
    }
    else
    {
        $tlumaczenia = cachejezyki::Czytaj();
        $agent_zal = unserialize($_SESSION[$dane_agent]);
        
        $oferta_id = null;
        
        if (isset($_GET[NieruchomoscDAL::$id_oferta]))
        {
            $oferta_id = $_GET[NieruchomoscDAL::$id_oferta];
        }
        
        $dal = new OsobaDAL(null);
        $wynik = $dal->ZmianaCena(array(NieruchomoscDAL::$id_oferta => $oferta_id), $ilosc_wierszy);
        UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$historia_zmian_ceny));
        UtilsUI::WyswietlTab1Poz($wynik, array(OsobaDAL::$nazwisko, OsobaDAL::$imie, NieruchomoscDAL::$data, NieruchomoscDAL::$agent, NieruchomoscDAL::$cena), 
        array(tags::$nazwisko, tags::$imie, tags::$data, tags::$agent, tags::$cena), NieruchomoscDAL::$id_oferta, 'zmianacena', null);
        
        echo '<br />';
        KontrolkiHtml::DodajSubmit('ok', 'id_ok', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zakoncz), 'onclick="window.close();"');
    }
    require('../../stopka.php');
?>
</body>
</html>
