<body>
<HEAD>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <script language="javascript" src="../../js/script.js"></script>
</head>
<body style="margin-left: 0px; margin-right: 0px; margin-top: 0px; margin-bottom: 0px;" onload="window.print();">
<?php
    require('../../conf.php');
    include_once ('../../ui/utilsui.php');
    include_once ('../../bll/cache.php');
    include_once ('../../bll/agentbll.php'); 
    include_once ('../../bll/listawskazanbll.php');
    session_start();
    $agent_zal = unserialize($_SESSION[$dane_agent]);

    if(isset($_GET[NieruchomoscDAL::$id_oferta]))
    {
        $dal = new ListaWskazanDAL();


        $tabParametr[ListaWskazanDAL::$id_oferta] = $_GET[NieruchomoscDAL::$id_oferta];
        $tabParametr[ListaWskazanDAL::$id_jezyk] = $_SESSION[$jezyk];
        
        $oferta = $dal->OfertaOgladnieta($tabParametr);
        $rozw = false;
        if (isset($_GET['rozwiazanie']))
        {
            $rozw = true;
        }
        //pobranie danych oferenta/ow
        foreach ($oferta[0][ListaWskazanDAL::$wlasciciel] as $klucz => $osoba_id)
        {
            $osoba = $dal->PodajOsobaDane(array(ListaWskazanDAL::$id_osoba => $osoba_id));
            $oferta[0][ListaWskazanDAL::$wlasciciel][$klucz] = $osoba[0];
        }
        
        $wynik = $dal->PodajListaWskOferta(array(ListaWskazanDAL::$id_oferta => $_GET[NieruchomoscDAL::$id_oferta]), $ilosc_wierszy);

        if ($ilosc_wierszy > 0)
        {
            UtilsUI::GenerujListaKlientowOferta($wynik, $_SESSION[$jezyk], $_GET[NieruchomoscDAL::$id_oferta], $oferta[0], $ilosc_wierszy, $rozw);//$kolOsobOgl
        }
    }
?>
</body>