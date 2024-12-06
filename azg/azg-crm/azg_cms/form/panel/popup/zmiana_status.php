<HTML>
<HEAD>
  
  <script language="javascript" src="../../js/script.js"></script>
<link href="../../css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<?php
//<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    // ¶ ±
    session_start();
    include_once ('../../dal/queriesDAL.php');
    include_once ('../../ui/kontrolki_html.php');
    include_once ('../../ui/utilsui.php'); 
    include_once ('../../lib/dns.php');
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
        //$dns = new Dns();
        //$wynik = $dns->Resolve('66.249.71.111');
        
        $tlumaczenia = cachejezyki::Czytaj();
        $agent_zal = unserialize($_SESSION[$dane_agent]);
        
        $oferta_id = null;
        
        if (isset($_GET[NieruchomoscDAL::$id_oferta]))
        {
            $oferta_id = $_GET[NieruchomoscDAL::$id_oferta];
        }
        if (isset($_POST[NieruchomoscDAL::$id_oferta]))
        {
            $oferta_id = $_POST[NieruchomoscDAL::$id_oferta];
        }
        $data = $data_dzienna;
        
        if (isset($_POST['data']))
        {
            $data = $_POST['data'];
        }
        
        $dal = new OsobaDAL(null);
        $wynik = $dal->PokazZmianaStatus(array(NieruchomoscDAL::$id_oferta => $oferta_id), $ilosc_wierszy);
        UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$historia_zmian_statusu));
        UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$numer_oferty).': '.$oferta_id);
        UtilsUI::WyswietlTab1Poz($wynik, array(NieruchomoscDAL::$data, NieruchomoscDAL::$agent, NieruchomoscDAL::$status), 
        array(tags::$data, tags::$agent, tags::$status), NieruchomoscDAL::$id_oferta, 'zmianastatus', null);
        echo '<hr />';
        //PokazOdwiedziny
        UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$ilosc_wyswietlen_oferty_na_stronie));
        echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'" name="zm_status">';
        KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_oferta, NieruchomoscDAL::$id_oferta, $oferta_id);
        echo '<table><tr><td>';
        KontrolkiHtml::DodajTextboxData('data', 'id_data', $data, 10, 10, $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podana_inf_nie_jest_data), '', '', 'zm_status', '../');
        echo '</td><td>';
        KontrolkiHtml::DodajSubmit('pokaz', 'id_pokaz', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$pokaz), '');
        echo '</td></tr></table></form>';
        if (isset($_POST['pokaz']))
        {
            $wynik = $dal->PokazOdwiedziny(array(NieruchomoscDAL::$id_oferta => $oferta_id, NieruchomoscDAL::$data => $_POST['data']), $ilosc_wierszy);
            if ($ilosc_wierszy > 0)
            {
                UtilsUI::$rekordy = $ilosc_wierszy;
                UtilsUI::WyswietlTab1Poz($wynik, array(NieruchomoscDAL::$data, NieruchomoscDAL::$adres), array(tags::$data, tags::$adres), NieruchomoscDAL::$data, 'unn_index', null);
            }
        }
        echo '<br />';
        KontrolkiHtml::DodajSubmit('ok', 'id_ok', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zakoncz), 'onclick="window.close();"');
    }
    require('../../stopka.php');
?>
</body>
</html>
