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
    include_once ('../bll/listawskazanbll.php');
    include_once ('../ui/pdf.php');
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
        
        
        if (isset($_GET[NieruchomoscDAL::$id_oferta]))
        {
            $_SESSION[NieruchomoscDAL::$id_oferta] = $_GET[NieruchomoscDAL::$id_oferta];
        }
        if (isset($_POST[NieruchomoscDAL::$id_oferta]))
        {
            $_SESSION[NieruchomoscDAL::$id_oferta] = $_POST[NieruchomoscDAL::$id_oferta];
        }
        if (isset($_GET[NieruchomoscDAL::$id_zapotrzebowanie]))
        {
            $_SESSION[NieruchomoscDAL::$id_zapotrzebowanie] = $_GET[NieruchomoscDAL::$id_zapotrzebowanie];
        }
        if (isset($_POST[NieruchomoscDAL::$id_zapotrzebowanie]))
        {
            $_SESSION[NieruchomoscDAL::$id_zapotrzebowanie] = $_POST[NieruchomoscDAL::$id_zapotrzebowanie];
        }
        
        if (isset($_POST['generuj_lista_wskazan']))
        {
            $pdf = new PdfLista($agent_zal->id, $_SESSION[NieruchomoscDAL::$id_zapotrzebowanie], $_SESSION[$jezyk]);
            $plik = $pdf->Zapisz();
            
            echo '<a href="'.$plik.'" target="_blank">'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$lista_wskazan).'</a><br />';
        }
        
        $lista_wsk = new ListaWskBLL($_SESSION[NieruchomoscDAL::$id_zapotrzebowanie], $agent_zal->id, true);
        if (isset($_POST['kasowanie']))
        {
            $lista_wsk->UsunOferta($_POST['oferta_id']);
            $lista_wsk->ZapiszListaWskazan();
        }
        if (isset($_POST['zatwierdz']))
        {
            $lista_wsk->DodajOferta($_POST[NieruchomoscDAL::$id_oferta], $_SESSION[$jezyk], array(NieruchomoscDAL::$data => $_POST['data'], NieruchomoscDAL::$id_godzina => $_POST['godzina_id'], 
            NieruchomoscDAL::$id_minuta => $_POST['minuta_id'], NieruchomoscDAL::$godzina => $_POST['godzina'].' : '.$_POST['minuta']));
            $lista_wsk->ZapiszListaWskazan();
        }
        
        echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$numer_oferty).' :'.$_SESSION[NieruchomoscDAL::$id_oferta].'.<br/>'; 
        echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'"><table>';
        KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_oferta, NieruchomoscDAL::$id_oferta, $_SESSION[NieruchomoscDAL::$id_oferta]);
        echo '<tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$data).' : </td><td>';
        KontrolkiHtml::DodajTextboxDataPrzyszlosc('data', 'id_data', $data_dzienna, 10, 10, 
        $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podana_inf_nie_jest_data), $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podano_data_przeszlosc), '', '');
        echo '</td><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$godzina).' : </td><td>';
        KontrolkiHtml::DodajSelectZrodSlownik('godzina', 'id_godzina', SlownikDAL::$godzina, 'godzina_id', null, '', '');
        echo ' : </td><td>';
        KontrolkiHtml::DodajSelectZrodSlownik('minuta', 'id_minuta', SlownikDAL::$minuta, 'minuta_id', null, '', '');
        echo '</td><td>';
        KontrolkiHtml::DodajSubmit('zatwierdz', 'id_zatwierdz', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zatwierdz), '');
        echo '</td></tr></table></form>';
        
        $kolOfert = $lista_wsk->PodajOferty();
        $kolOsobOgl = $lista_wsk->PodajOsoby();
        
        $i = 0;
        
        if (is_array($kolOfert))
        {
            foreach ($kolOfert as $oferta)
            {
                $tab[$i] = $oferta->PodajOferta();
                $i++;
            }
            if ($i > 0)
            {
                echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wybrane_oferty).' :<br />';
                echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'">';
                //KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_oferta, NieruchomoscDAL::$id_oferta, $_SESSION[NieruchomoscDAL::$id_oferta]);
                UtilsUI::WyswietlTab1Poz($tab, array(NieruchomoscDAL::$id_oferta, NieruchomoscDAL::$ulica, NieruchomoscDAL::$wlasciciel, NieruchomoscDAL::$data, NieruchomoscDAL::$godzina), 
                array(tags::$id, tags::$ulica, tags::$wlasciciele, tags::$data, tags::$godzina), NieruchomoscDAL::$id_oferta, 'oferta_id', array(Akcja::$kasowanie => 1));
                echo '</form>';
            }
        }
        $i = 0;
        $tab = null;
        if (is_array($kolOsobOgl))
        {
            foreach ($kolOsobOgl as $osoba)
            {
                $tab[$i] = $osoba->PodajOsoba();
                $i++;
            }
            echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$osoby_ogladajace).' :<br />';
            
            UtilsUI::WyswietlTab1Poz($tab, array(ListaWskazanDAL::$id_osoba, ListaWskazanDAL::$imie, ListaWskazanDAL::$nazwisko), array(tags::$id, tags::$imie, tags::$nazwisko), 
            ListaWskazanDAL::$id_osoba, 'osoba_id', array(Akcja::$kasowanie => 1));
        }
        
        $osoby = $lista_wsk->PodajOsobyZapotrzebowanie();
        echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$osoby_dostepne).' :<br />';
        
        UtilsUI::WyswietlTab1Poz($osoby, array(ListaWskazanDAL::$id_osoba, ListaWskazanDAL::$imie, ListaWskazanDAL::$nazwisko), array(tags::$id, tags::$imie, tags::$nazwisko), 
        ListaWskazanDAL::$id_osoba, 'osoba_id', array(Akcja::$dodawanie => 1));
        
        if (is_array($kolOfert))
        {
            echo '<hr /><form method="POST" action="'.$_SERVER['PHP_SELF'].'">';
            KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_zapotrzebowanie, NieruchomoscDAL::$id_zapotrzebowanie, $_SESSION[NieruchomoscDAL::$id_zapotrzebowanie]);
            KontrolkiHtml::DodajSubmit('generuj_lista_wskazan', 'id_generuj_lista_wskazan', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$generuj_liste_wskazan), '');
            echo '</form>';
        }
    }
    require('../stopka.php');

?>
</body>
</html>
