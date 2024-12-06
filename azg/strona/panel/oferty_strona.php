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
        
        $oferty_specjalne = new OfertySpecjalne($polecane);
        $dal = new ListaWskazanDAL();
        
        if (isset($_POST['oferta_polecana']))
        {
            $czy_jest_of = $dal->SprawdzIstOferta($_POST['oferta']);
            if (!$czy_jest_of)
            {
                UtilsUI::InfoBlad($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nie_znaleziono_oferty_o_podanym_numerze));
            }
            else
            {
                $oferty_specjalne->DodajOferta($_POST['oferta'], $_POST['trans_rodzaj_id'], $_POST['nier_rodzaj_id']);
            }
        }
        
        if (isset($_POST['oferta_id_p']) && isset($_POST['kasowanie']))
        {
            $oferty_specjalne->UsunOferta($_POST['oferta_id_p']);
        }
        
        //oferty polecane
        echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$polecamy).' : <br />';
        $oferty = $oferty_specjalne->PodajOferty();
        echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'">';
        UtilsUI::WyswietlTab1Poz($oferty, array(StronaOfertaDAL::$id_oferta), array(tags::$nr_oferty), StronaOfertaDAL::$id_oferta, 'oferta_id_p', array(Akcja::$kasowanie => 1)); //Akcja::$edycja => 1, edycja pobawic sie pozniej
        echo '</form>';
        //var_dump($oferty);
        

        $obiektTrans = new TransNierDAL();
        $tabNier = $obiektTrans->PodajListeNieruchomosci($ilosc_wierszy);
        $tabTrans = $obiektTrans->PodajListeTransakcji(array(TransNierDAL::$of_zap => tags::$oferta), $ilosc_wierszy);
        echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'"><table><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$rodzaj_nieruchomosci);
        echo ' : </td><td>';
        KontrolkiHtml::DodajSelectDomWartId('nieruchomosci', 'id_nieruchomosci', $tabNier, 'nier_rodzaj_id', null, '', '', TransNierDAL::$id, TransNierDAL::$nazwa_nieruchomosc);
        echo '</td><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$rodzaj_transakcja);
        echo ' : </td><td>';
        KontrolkiHtml::DodajSelectDomWartId('transakcje', 'id_transakcje', $tabTrans, 'trans_rodzaj_id', null, '', '');
        echo '</td><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$numer_oferty).' : </td><td>';
        KontrolkiHtml::DodajLiczbaCalkowitaTextbox('oferta', 'id_oferta', '', 5, 5, '');
        echo '</td><td>';
        KontrolkiHtml::DodajSubmit('oferta_polecana', 'id_oferta_polecana', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$dodaj), '');
        echo '</td></tr></table></form><hr />';
        
        //////////////////////
        
        $oferty_specjalne = new OfertySpecjalne($inwestycje);
        
        if (isset($_POST['oferta_inwestycja']))
        {
            $czy_jest_of = $dal->SprawdzIstOferta($_POST['oferta']);
            if (!$czy_jest_of)
            {
                UtilsUI::InfoBlad($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nie_znaleziono_oferty_o_podanym_numerze));
            }
            else
            {
                $oferty_specjalne->DodajOferta($_POST['oferta'], $_POST['trans_rodzaj_id'], $_POST['nier_rodzaj_id']);
            }
        }
        
        if (isset($_POST['oferta_id_i']) && isset($_POST['kasowanie']))
        {
            $oferty_specjalne->UsunOferta($_POST['oferta_id_i']);
        }
        
        //oferty polecane
        echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nowe_inwestycje).' : <br />';
        $oferty = $oferty_specjalne->PodajOferty();
        echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'">';
        UtilsUI::WyswietlTab1Poz($oferty, array(StronaOfertaDAL::$id_oferta), array(tags::$nr_oferty), StronaOfertaDAL::$id_oferta, 'oferta_id_i', array(Akcja::$kasowanie => 1)); //Akcja::$edycja => 1, edycja pobawic sie pozniej
        echo '</form>';
        //var_dump($oferty);
        

        $obiektTrans = new TransNierDAL();
        $tabNier = $obiektTrans->PodajListeNieruchomosci($ilosc_wierszy);
        $tabTrans = $obiektTrans->PodajListeTransakcji(array(TransNierDAL::$of_zap => tags::$oferta), $ilosc_wierszy);
        echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'"><table><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$rodzaj_nieruchomosci);
        echo ' : </td><td>';
        KontrolkiHtml::DodajSelectDomWartId('nieruchomosci', 'id_nieruchomosci', $tabNier, 'nier_rodzaj_id', null, '', '', TransNierDAL::$id, TransNierDAL::$nazwa_nieruchomosc);
        echo '</td><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$rodzaj_transakcja);
        echo ' : </td><td>';
        KontrolkiHtml::DodajSelectDomWartId('transakcje', 'id_transakcje', $tabTrans, 'trans_rodzaj_id', null, '', '');
        echo '</td><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$numer_oferty).' : </td><td>';
        KontrolkiHtml::DodajLiczbaCalkowitaTextbox('oferta', 'id_oferta', '', 5, 5, '');
        echo '</td><td>';
        KontrolkiHtml::DodajSubmit('oferta_inwestycja', 'id_oferta_inwestycja', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$dodaj), '');
        echo '</td></tr></table></form><hr />';
    }
    require('../stopka.php');
?>
</body>
</html>
