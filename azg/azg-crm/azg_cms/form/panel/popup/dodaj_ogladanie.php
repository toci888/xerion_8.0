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
        $zapotrzebowanie_id = null;
        $oferta_id = null;
        
        $dodano_do_listy = false;
        
        if (isset($_GET[NieruchomoscDAL::$id_oferta]))
        {
            $oferta_id = $_GET[NieruchomoscDAL::$id_oferta];
        }
        if (isset($_POST[NieruchomoscDAL::$id_oferta]))
        {
            $oferta_id = $_POST[NieruchomoscDAL::$id_oferta];
        }
        if (isset($_GET[NieruchomoscDAL::$id_zapotrzebowanie]))
        {
            $zapotrzebowanie_id = $_GET[NieruchomoscDAL::$id_zapotrzebowanie];
        }
        if (isset($_POST[NieruchomoscDAL::$id_zapotrzebowanie]))
        {
            $zapotrzebowanie_id = $_POST[NieruchomoscDAL::$id_zapotrzebowanie];
        }
        
        $dal = new ListaWskazanDAL();
        
        ///sprawdzenie, czy oferta istnieje w bazie
        if ($oferta_id != null)
        {
            $czy_jest_of = $dal->SprawdzIstOferta($oferta_id);
            if (!$czy_jest_of)
            {
                $oferta_id = null;
                UtilsUI::InfoBlad($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nie_znaleziono_oferty_o_podanym_numerze));
            }
            else
            {
                $czy_jest_of_lw = $dal->SprawdzOfZapListaWsk(array(NieruchomoscDAL::$id_oferta => $oferta_id, NieruchomoscDAL::$id_zapotrzebowanie => $zapotrzebowanie_id));
                if (!$czy_jest_of_lw)
                {
                    $oferta_id = null;
                    UtilsUI::InfoBlad($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$oferta_jest_juz_na_liscie_wskazan));
                }
            }
        }
        
        if (isset($_POST['wprowadz']) && isset($_POST['wybierz']) && $zapotrzebowanie_id != null && $oferta_id != null)
        {
            //var_dump($_POST['wybierz']);
            
            foreach ($_POST['wybierz'] as $osoba)
            {
                $tab_os[$osoba] = $osoba;
            }
            
            $tabParametr[ListaWskazanDAL::$data] = $_POST['data'];
            $tabParametr[ListaWskazanDAL::$id_godzina] = $_POST['godzina_id'];
            $tabParametr[ListaWskazanDAL::$id_minuta] = $_POST['minuta_id'];
            $tabParametr[ListaWskazanDAL::$id_agent] = $agent_zal->id;
            $tabParametr[ListaWskazanDAL::$id_osoba] = $tab_os;
            $tabParametr[ListaWskazanDAL::$id_oferta] = $oferta_id;
            $tabParametr[ListaWskazanDAL::$id_zapotrzebowanie] = $zapotrzebowanie_id;
            
            $wynik = $dal->DodajOgladanie($tabParametr);
            
            if ($wynik)
            {
                $dodano_do_listy = true;
                KontrolkiHtml::DodajSubmit('ok', 'id_ok', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zakoncz), 'onclick="window.close();"');
            }
        }
        
        if ($zapotrzebowanie_id != null && $oferta_id != null && !$dodano_do_listy) //&& isset($_POST['dodaj_zap'])
        {
            $dal = new ListaWskazanDAL();
            $wynik = $dal->PodajOsobaKlientZap(array(ListaWskazanDAL::$id_zapotrzebowanie => $zapotrzebowanie_id));
            //var_dump($wynik);
            UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wybierz_osoby_ogladajace));
            echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'" name="dodanie_ogladania"><table border="1" rules="all" class="tableBorder" bgcolor="#66CCFF">';
            KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_zapotrzebowanie, NieruchomoscDAL::$id_zapotrzebowanie, $zapotrzebowanie_id);
            KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_oferta, NieruchomoscDAL::$id_oferta, $oferta_id);
            foreach ($wynik as $wiersz)
            {
                echo '<tr><td>';
                KontrolkiHtml::DodajCheckbox('wybierz[]', 'id_wybierz'.$wiersz[NieruchomoscDAL::$id_osoba], false, $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wybierz), '', $wiersz[NieruchomoscDAL::$id_osoba]); 
                echo '</td><td>'.$wiersz[NieruchomoscDAL::$nazwisko];
                echo '</td><td>'.$wiersz[NieruchomoscDAL::$imie];
                echo '</td><td>'.$wiersz[OsobaDAL::$telefon];
                echo '</td></tr>';
            }
            echo '</table><table>';
            echo '<tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$data).' : </td><td>';
            KontrolkiHtml::DodajTextboxData('data', 'id_data', null, 10, 10, 
            $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podana_inf_nie_jest_data), '', '', 'dodanie_ogladania', '../');
            echo '</td><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$godzina).' : </td><td>';
            KontrolkiHtml::DodajSelectZrodSlownik('godzina', 'id_godzina', SlownikDAL::$godzina, 'godzina_id', null, '', '');
            echo ' : </td><td>';
            KontrolkiHtml::DodajSelectZrodSlownik('minuta', 'id_minuta', SlownikDAL::$minuta, 'minuta_id', null, '', '');
            echo '<tr><td colspan="2">';
            $tabPodpowiedzi = 'Array(\''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$data).'\')';
            KontrolkiHtml::DodajSubmit('wprowadz', 'id_wprowadz', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zatwierdz), 'onclick="return WalidacjaFormularz(Array(data), '.$tabPodpowiedzi.', \''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$brak).' : \');"');
            echo '</td></tr>';
            echo '</table></form>';
        }
    }
    require('../../stopka.php');
?>
</body>
</html>
