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
        $tlumaczenia = cachejezyki::Czytaj();
        $agent_zal = unserialize($_SESSION[$dane_agent]);
        
        $oferta_id = null;
        
        if (isset($_GET[NieruchomoscDAL::$id_oferta]))
        {
            $oferta_id = $_GET[NieruchomoscDAL::$id_oferta];
        }
        
        $dal = new OsobaDAL(null);
        $wynik = $dal->PodajZapotrzebowanieAdresatOferta(array(NieruchomoscDAL::$id_oferta => $oferta_id), $ilosc_wierszy);
        if ($ilosc_wierszy > 0)
        {
            UtilsUI::$rekordy = $ilosc_wierszy;
            UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$oferty_wyslane_mailem));
            UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$numer_oferty).': '.$oferta_id);
            
            UtilsUI::WyswietlTab1Poz($wynik, array(NieruchomoscDAL::$id_zapotrzebowanie, NieruchomoscDAL::$cena, NieruchomoscDAL::$data, NieruchomoscDAL::$is_lst_wsk), 
            array(tags::$numer_zapotrzebowania, tags::$cena, tags::$data, tags::$lista_wskazan), NieruchomoscDAL::$id_oferta, 'oferty_wys', null);
        }
        
        echo '<br />';
        KontrolkiHtml::DodajSubmit('ok', 'id_ok', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zakoncz), 'onclick="window.close();"');
    }
    require('../../stopka.php');
?>
</body>
</html>
