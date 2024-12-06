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
        
        if (isset($_GET[NieruchomoscDAL::$id_zapotrzebowanie]))
        {
            UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nr_zapotrzebowania).': '.$_GET[NieruchomoscDAL::$id_zapotrzebowanie]);
            UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$przygotowywanie_listy_wskazan_po_numerze_ofert));
            UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$szukanie_istniejacych_ofert));
            //echo '<form action="dodaj_of_lista_wsk.php" method= "POST" target="_blank">';
            echo '<form action="skojarz_of_zap.php" method= "POST" target="_blank">';
            KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_zapotrzebowanie, NieruchomoscDAL::$id_zapotrzebowanie, $_GET[NieruchomoscDAL::$id_zapotrzebowanie]);
            echo '<table><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$numer_oferty).' : </td><td >';
            KontrolkiHtml::DodajLiczbaCalkowitaTextbox(NieruchomoscDAL::$id_oferta, NieruchomoscDAL::$id_oferta, '', 6, 6, '');
            echo '</td><td >';
            KontrolkiHtml::DodajSubmit('szukaj','id_szukaj',$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$szukaj).'.','');
            echo '</td></tr></table></form><hr />';
            //
            UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$dodanie_ogladania_oferty));
            //echo '<form action="dodaj_of_lista_wsk.php" method= "POST" target="_blank">';
            echo '<form action="dodaj_ogladanie.php" method= "POST" target="_blank">';
            KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_zapotrzebowanie, NieruchomoscDAL::$id_zapotrzebowanie, $_GET[NieruchomoscDAL::$id_zapotrzebowanie]);
            echo '<table><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$numer_oferty).' : </td><td >';
            KontrolkiHtml::DodajLiczbaCalkowitaTextbox(NieruchomoscDAL::$id_oferta, NieruchomoscDAL::$id_oferta, '', 6, 6, '');
            echo '</td><td>';
            KontrolkiHtml::DodajSubmit('dodaj_zap','id_szukaj',$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$szukaj).'.','');
            echo '</td></tr></table></form><hr />';
            
            KontrolkiHtml::DodajSubmit('ok', 'id_ok', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zakoncz), 'onclick="window.close();"');
        }
    }
    require('../../stopka.php');
?>
</body>
</html>
