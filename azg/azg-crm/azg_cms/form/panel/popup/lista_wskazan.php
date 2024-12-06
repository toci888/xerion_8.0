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
    if (!isset($_SESSION[$zalogowany]))
    {
        echo 'Nie jesteś zalogowany.';
    }
    else
    {
        $agent_zal = unserialize($_SESSION[$dane_agent]);
        $agent_id = $agent_zal->id;
        if (isset($_GET[NieruchomoscDAL::$id_agent]))
        {
            $agent_id = $_GET[NieruchomoscDAL::$id_agent];
        }
        //echo '<script>history.clear();</script>';
        if(isset($_GET[NieruchomoscDAL::$id_zapotrzebowanie]))// && isset($_GET[AgentDAL::$id_agent]))
        {
            $lista_wsk = new ListaWskBLL($_GET[NieruchomoscDAL::$id_zapotrzebowanie], $agent_id, true); //$_GET[AgentDAL::$id_agent]
            $kolOfert = $lista_wsk->PodajOferty();
            $kolOsobOgl = $lista_wsk->PodajOsoby();

            //dodac osoby ogl, opisy sa null ;)
                
            $i = 0;
            if (is_array($kolOfert))
            {
                foreach ($kolOfert as $oferta)
                {
                    $tab[$i] = $oferta->PodajOferta();
                    foreach ($kolOsobOgl as $OsobOgl)
                    {
                        $tab[$i][NieruchomoscDAL::$klient][$OsobOgl->id_osoba] = $OsobOgl->PodajOsoba();
                    }
                    $i++;
                }
                if ($i > 0)
                {
                    $tab_nag = array(tags::$nr_oferty, tags::$podpis_klienta, tags::$oferent, tags::$adres, tags::$cena, tags::$opis_oferty, tags::$data_godz, tags::$podpis_agenta);
                    $wyb_kolumny = array(NieruchomoscDAL::$id_oferta, NieruchomoscDAL::$wlasciciel, NieruchomoscDAL::$ulica, NieruchomoscDAL::$cena, NieruchomoscDAL::$opis, NieruchomoscDAL::$data);
                    $zlaczenia = array(NieruchomoscDAL::$data => NieruchomoscDAL::$godzina);
                    UtilsUI::GenerujListaWskazan($tab, $wyb_kolumny, $zlaczenia, $_SESSION[$jezyk], $_GET[NieruchomoscDAL::$id_zapotrzebowanie], $tab_nag, $kolOsobOgl);
                }
            }
        }
    }
?>
</body>