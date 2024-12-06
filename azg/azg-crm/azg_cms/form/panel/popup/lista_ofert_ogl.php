<body>
<HEAD>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <script language="javascript" src="../../js/script.js"></script>
</head>
<body style="margin-left: 0px; margin-right: 0px; margin-top: 0px; margin-bottom: 0px;" onload="print();">
<?php
// onload="window.print();"
    require('../../conf.php');
    include_once ('../../ui/utilsui.php');
    include_once ('../../bll/cache.php');
    include_once ('../../bll/agentbll.php'); 
    include_once ('../../bll/listawskazanbll.php');
    session_start();
    $agent_zal = unserialize($_SESSION[$dane_agent]);

    if(isset($_GET[NieruchomoscDAL::$id_zapotrzebowanie]))
    {
        $dal = new ListaWskazanDAL();

        //pobranie wszystkich osob ujetych w kliencie
        $osoby_zapotrzebowanie = $dal->PodajOsobaKlientZap(array(ListaWskazanDAL::$id_zapotrzebowanie => $_GET[NieruchomoscDAL::$id_zapotrzebowanie]));
        
        foreach ($osoby_zapotrzebowanie as $wiersz)
        {
            $osoba = new OsobaListaWskACD; 
            $osoba->WprowadzOsoba($wiersz);
            $osoby[$wiersz[ListaWskazanDAL::$id_osoba]] = $osoba;
        }
        
        $tabParametr[ListaWskazanDAL::$id_zapotrzebowanie] = $_GET[NieruchomoscDAL::$id_zapotrzebowanie];
        $tabParametr[ListaWskazanDAL::$id_jezyk] = $_SESSION[$jezyk];
        
        $wynik = $dal->OfertyOgladniete($tabParametr, $ilosc_wierszy);

        if ($ilosc_wierszy > 0)
        {
            $tab_nag = array(tags::$nr_oferty, tags::$oferent, tags::$adres, tags::$cena, tags::$opis_oferty, tags::$data_godz, tags::$agent);
            $wyb_kolumny = array(NieruchomoscDAL::$id_oferta, NieruchomoscDAL::$wlasciciel, NieruchomoscDAL::$adres, NieruchomoscDAL::$cena, NieruchomoscDAL::$opis, NieruchomoscDAL::$data, NieruchomoscDAL::$agent);

            UtilsUI::GenerujListaWskazan($wynik, $wyb_kolumny, null, $_SESSION[$jezyk], $_GET[NieruchomoscDAL::$id_zapotrzebowanie], $tab_nag, $osoby, true);//$kolOsobOgl
        }

    }
?>
</body>