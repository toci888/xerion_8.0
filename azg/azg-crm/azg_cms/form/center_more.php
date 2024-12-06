<?php
    // ¶ ±
    //session_start();
    /*
    <HTML>                                                
<HEAD>
<title>test</title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <script language="javascript" src="js/script.js"></script>
<link href="azg.css" rel="stylesheet" type="text/css">
</head>
<body>
    */
    include_once ('dal/stronaDAL.php');
    include_once ('ui/kontrolki_html.php'); 
    include_once ('ui/utilsui.php'); 
    include_once ('bll/tags.php'); 
    include_once ('bll/jezykibll.php');
    include_once ('bll/cache.php');
    include_once ('bll/ofertystronabll.php');
    require('naglowek.php');
    require('conf.php');
    
    if (isset($_GET[tags::$oferta]))
    {
        $tlumaczenia = cachejezyki::Czytaj();
        //próba przeniesienia wczytania danych o ofercie etc do sekcji tytu³u strony - tytu³owanie ofert do pozycjonowania
        $obiekt = new StronaOfertaBLL();
        $oferta = $obiekt->PodajOferta($_GET[tags::$oferta], $_GET[StronaPodsInfoDAL::$id_trans_rodzaj], $_GET[StronaPodsInfoDAL::$id_nier_rodzaj], $_SESSION[$jezyk], $sekcje, $pomieszczenia);
        $oferta = $oferta[0];
        
        if (!isset($_SERVER['HTTP_REFERER']))
        {
            $_SERVER['HTTP_REFERER'] = 'http://'.$_SERVER['SERVER_NAME'];
        }
        
        $dal = new StronaOfertaDAL();
        //dodanie info o odwiedzinach na stronie REMOTE_ADDR
        $dal->OfertaOdwiedziny(array(NieruchomoscDAL::$adres => $_SERVER['REMOTE_ADDR'], NieruchomoscDAL::$id_oferta => $_GET[tags::$oferta], StronaPodsInfoDAL::$referer => $_SERVER['HTTP_REFERER']));
        $agent_dane = $dal->AgentWersjaOficjalna($oferta[NieruchomoscDAL::$id_agent], $_SESSION[$jezyk]);
        $agent_dane = $agent_dane[0][NieruchomoscDAL::$nazwa];
        
        //wytrzepac text sprzedaz mieszkanie itd
        echo '<center><span class="nag2b"><b>'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], $oferta[StronaOfertaDAL::$nieruchomosc_rodzaj]), $_SESSION[$jezyk]).' - '.
        UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], $oferta[StronaOfertaDAL::$transakcja_rodzaj]), $_SESSION[$jezyk]).'</b><br /></span></center>';

        
        //'.$_SERVER['HTTP_REFERER'].'
        echo '<table width="500" cellpadding="0" cellspacing="0" border="0"><tr><td width="50%"  align = "left">&nbsp;&nbsp;<a href="javascript:history.back();">
        '.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$powrot), $_SESSION[$jezyk]).'</a></td><td width="50%" align="right"><a href="druksm.php?'.
        tags::$oferta.'='.$_GET[tags::$oferta].'&'.StronaPodsInfoDAL::$id_trans_rodzaj.'='.$_GET[StronaPodsInfoDAL::$id_trans_rodzaj].'&'.
        StronaPodsInfoDAL::$id_nier_rodzaj.'='.$_GET[StronaPodsInfoDAL::$id_nier_rodzaj].'" target="_blank"><img src="img/printer.gif" width="15" height="17" border="0"></img>&nbsp;&nbsp;'.
        UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wydrukuj_ze_zdjeciami), $_SESSION[$jezyk]).'</a><br><a href="druksmb.php?'.tags::$oferta.'='.$_GET[tags::$oferta].'&'.StronaPodsInfoDAL::$id_trans_rodzaj.'='.$_GET[StronaPodsInfoDAL::$id_trans_rodzaj].'&'.
        StronaPodsInfoDAL::$id_nier_rodzaj.'='.$_GET[StronaPodsInfoDAL::$id_nier_rodzaj].'" target="_blank"><img src="img/printer.gif" width="15" height="17" border="0"></img>&nbsp;&nbsp;'.
        UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wydrukuj_bez_zdjec), $_SESSION[$jezyk]).'</a></td></tr></table>';
        
        $oferta_html = UtilsUI::OfertaSzczegolowa($oferta, $_SESSION[$jezyk], $agent_dane, $sekcje, $pomieszczenia);
        echo $oferta_html;
        
        $wynik = $dal->OfertyPodobne($_GET[tags::$oferta], $ilosc_wierszy);
        if ($ilosc_wierszy > 0)
        {
            echo '<br /><span class="nag3b"><b>';
            echo UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nieruchomosci_podobne_znajdujace_sie_w_ofercie_biura), $_SESSION[$jezyk]).' '.$AZG;
            echo ':</b></span><table>';
            foreach ($wynik as $link)
            {
                $cena = number_format($link[StronaOfertaDAL::$cena], 0, ',', '.'); 
                echo '<tr><td><a href="'.$_SERVER['PHP_SELF'].'?'.tags::$oferta.'='.$link[StronaOfertaDAL::$id_oferta].'&'.StronaPodsInfoDAL::$id_trans_rodzaj.'='.$link[StronaPodsInfoDAL::$id_trans_rodzaj].'&'.
                StronaPodsInfoDAL::$id_nier_rodzaj.'='.$link[StronaPodsInfoDAL::$id_nier_rodzaj].'" target="_blank">'.
                UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], $oferta[StronaOfertaDAL::$transakcja_rodzaj]), $_SESSION[$jezyk]).' - '.
                UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], $oferta[StronaOfertaDAL::$nieruchomosc_rodzaj]), $_SESSION[$jezyk]).', '.UtilsUI::KonwersjaEncoding($link[StronaOfertaDAL::$lokalizacja], $_SESSION[$jezyk]).', '.
                $cena.' PLN</a>';
                echo '</td></tr>';
            }
            echo '</table>';
        }
        
    }
    
    require('stopka.php');
//</body>
//</html>
?>