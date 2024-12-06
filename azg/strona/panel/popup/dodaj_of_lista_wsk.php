<HTML>
<HEAD>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <script language="javascript" src="../../js/script.js"></script>
<link href="../../css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<?php
    // ¶ ±
    
    /*
    skrypt dziala w 2 strony jesli idzie o kojarzenie, jest nieuzywana chwilowo alternatywa :P
    */
    session_start();
    include_once ('../../dal/queriesDAL.php');
    include_once ('../../ui/kontrolki_html.php');
    include_once ('../../ui/utilsui.php'); 
    include_once ('../../bll/parametrynierbll.php');
    include_once ('../../bll/tags.php'); 
    include_once ('../../bll/agentbll.php');
    include_once ('../../bll/jezykibll.php');
    include_once ('../../bll/cache.php');
    include_once ('../../bll/listawskazanbll.php');
    include_once ('../../ui/pdf.php');
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
        //ze wzgledow bezpieczenstwa
        //unset($_SESSION[NieruchomoscDAL::$id_oferta]);
        
        $oferta_id = null;
        $zapotrzebowanie_id = null;
        
        if (isset($_GET[NieruchomoscDAL::$id_oferta]))
        {
            //$_SESSION[NieruchomoscDAL::$id_oferta] = $_GET[NieruchomoscDAL::$id_oferta];
            $oferta_id = $_GET[NieruchomoscDAL::$id_oferta];
        }
        if (isset($_POST[NieruchomoscDAL::$id_oferta]))
        {
            //$_SESSION[NieruchomoscDAL::$id_oferta] = $_POST[NieruchomoscDAL::$id_oferta];
            $oferta_id = $_POST[NieruchomoscDAL::$id_oferta];
        }
        if (isset($_GET[NieruchomoscDAL::$id_zapotrzebowanie]))
        {
            //$_SESSION[NieruchomoscDAL::$id_zapotrzebowanie] = $_GET[NieruchomoscDAL::$id_zapotrzebowanie];
            $zapotrzebowanie_id = $_GET[NieruchomoscDAL::$id_zapotrzebowanie];
        }
        if (isset($_POST[NieruchomoscDAL::$id_zapotrzebowanie]))
        {
            //$_SESSION[NieruchomoscDAL::$id_zapotrzebowanie] = $_POST[NieruchomoscDAL::$id_zapotrzebowanie];
            $zapotrzebowanie_id = $_POST[NieruchomoscDAL::$id_zapotrzebowanie];
        }
        
        ///na razie zadnych pdf
        /*if (isset($_POST['generuj_lista_wskazan']))
        {
            $pdf = new PdfLista($agent_zal->id, $_SESSION[NieruchomoscDAL::$id_zapotrzebowanie], $_SESSION[$jezyk]);
            $plik = $pdf->Zapisz();
            
            echo '<a href="'.$plik.'" target="_blank">'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$lista_wskazan).'</a><br />';
        } */
        
        $lista_wsk = new ListaWskBLL($zapotrzebowanie_id, $agent_zal->id, true);
        
        //obsluga kasowania oferty z zaplanowanych
        if (isset($_POST['kasowanie']) && isset($_POST['oferta_id']))
        {
            //pobranie id spotkania przez referencje i kasowanie z bazy jesli istnieje wraz z kasowaniem elementu
            $wynik = $lista_wsk->UsunOferta($_POST['oferta_id'], $spotkanie_id);
            if (!$wynik) //nie usunieto calego cache
            {
                $lista_wsk->ZapiszListaWskazan();
            }
            else
            {
                $lista_wsk = new ListaWskBLL($zapotrzebowanie_id, $agent_zal->id, true);
            }
            if ($spotkanie_id != null)
            {
                //kasowanie spotkania
                $dal = new ListaWskazanDAL();
                $wynik = $dal->UsunSpotkanie(array(ListaWskazanDAL::$id_spotkanie => $spotkanie_id));
            }
        }
        if (isset($_POST['osoba_id']) && isset($_POST['kasowanie']))
        {
            $lista_wsk->UsunOsobaOgladajaca($_POST['osoba_id']);
            //nie wiem czy ten zapisz nie powinien sie dziac wewnatrz obiektu $lista_wsk
            $lista_wsk->ZapiszListaWskazan();
        }
        if (isset($_POST['osoba_id']) && isset($_POST['dodaj']))
        {
            $lista_wsk->DodajOsobaOgladajaca($_POST['osoba_id']);
            $lista_wsk->ZapiszListaWskazan();
        }
        if (isset($_POST['zatwierdz']))
        {
            //mod 19.03 insert spotkania i jesli ok dopiero dodanie do listy
            
            $dal = new ListaWskazanDAL();
            $tabParametr[ListaWskazanDAL::$id_osoba] = $lista_wsk->PodajOsobyZapis();
            
            if (isset($_POST['oferent']))
            {
                $tab_os[0] = $_POST['oferent'];
            }
            else
            {
                $tab_os = null;
            }
            
            $tabParametr[ListaWskazanDAL::$osoba] = $tab_os;
            $tabParametr[ListaWskazanDAL::$id_oferta] = $_POST[NieruchomoscDAL::$id_oferta];
            $tabParametr[ListaWskazanDAL::$id_zapotrzebowanie] = $_POST[NieruchomoscDAL::$id_zapotrzebowanie];
            //$tabParametr[ListaWskazanDAL::$oferent] = 'false';
            $tabParametr[ListaWskazanDAL::$id_umowienie] = $ogladanie;
            $tabParametr[ListaWskazanDAL::$id_agent] = $agent_zal->id;
            $tabParametr[ListaWskazanDAL::$ogladanie_data] = $_POST['data'];
            $tabParametr[ListaWskazanDAL::$id_godzina] = $_POST['godzina_id'];
            $tabParametr[ListaWskazanDAL::$id_minuta] = $_POST['minuta_id'];
            $tabParametr[ListaWskazanDAL::$komentarz] = ''; //pomyslec, czy powstanie jakis komentarz ?:P - sparsowac ze ogladanie, id oferta, id zapotrzebowanie,imie nazwisko osoby tez ok
            $tabParametr[ListaWskazanDAL::$komentarz] .= $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$ogladanie).'. '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nr_oferty).': '.
            $_POST[NieruchomoscDAL::$id_oferta].', '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nr_zapotrzebowania).': '.$_POST[NieruchomoscDAL::$id_zapotrzebowanie].'. '; //.
            //$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$klient).': ';
            
            $wynik = $dal->DodajSpotkanie($tabParametr);
            
            if (strlen($wynik[ListaWskazanDAL::$id]) > 0)
            {                
                $lista_wsk->DodajOferta($_POST[NieruchomoscDAL::$id_oferta], $_SESSION[$jezyk], array(NieruchomoscDAL::$data => $_POST['data'], NieruchomoscDAL::$id_godzina => $_POST['godzina_id'], 
                NieruchomoscDAL::$id_minuta => $_POST['minuta_id'], NieruchomoscDAL::$id_spotkanie => $wynik[ListaWskazanDAL::$id], NieruchomoscDAL::$godzina => $_POST['godzina'].' : '.$_POST['minuta']));
                $lista_wsk->ZapiszListaWskazan();
            }
            else
            {
                UtilsUI::InfoBlad($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_nie_powiodla_sie).'. '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], $wynik[ListaWskazanDAL::$nazwa]));
            }            
        }
        
        ///pomyslec o uczynieniu tego formularza lepkim - warto
        
        $data_ogl = $data_dzienna;
        $godzina_ogl = null;
        $minuta_ogl = null;
        $spotkanie_klient = null;
        
        if ($oferta_id != null)
        {
            $ofertyKol = $lista_wsk->PodajOferty();
            if (isset($ofertyKol[$oferta_id]))
            {
                $oferta = $ofertyKol[$oferta_id];
                
                $wynik = $oferta->PodajOferta();
                $spotkanie_klient = $wynik[NieruchomoscDAL::$id_spotkanie];
                //echo $spotkanie_klient;
                
                $data_ogl = $wynik[NieruchomoscDAL::$data];
                $godzina_ogl = $wynik[NieruchomoscDAL::$id_godzina];
                $minuta_ogl = $wynik[NieruchomoscDAL::$id_minuta];
            }
        }
        
        if (isset($_POST['godzina_id']))
        {
            $data_ogl = $_POST['data'];
            $godzina_ogl = $_POST['godzina_id'];
            $minuta_ogl = $_POST['minuta_id'];
        }
        
        //$dal = new OsobaDAL(null);
        $dal = new NieruchomoscDAL();
        $tabParametr[OsobaDAL::$id_oferta] = $oferta_id;
        $tabParametr[NieruchomoscDAL::$nazwisko] = 'null';
        
        UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$numer_zapotrzebowania).' : '.$zapotrzebowanie_id); 
        UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$numer_oferty).' : '.$oferta_id); //podac jakies info o tej ofercie
        
        echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$oferta).' :<br/>';
        ///dane otwierajacego zlecenie + komentarz
        //$wynik = $dal->PodajOsobaOferta($tabParametr, $iloscWierszy);
        $wynik = $dal->SzybkieSzukanie($tabParametr, $iloscWierszy);
        if ($iloscWierszy > 0)
        {
            UtilsUI::$strona = 5;
            UtilsUI::$rekordy = $iloscWierszy;
            UtilsUI::WyswietlTab1Poz($wynik, 
            array(NieruchomoscDAL::$id_oferta, NieruchomoscDAL::$nazwisko, NieruchomoscDAL::$status, KlientDAL::$telefon, KlientDAL::$komorka, NieruchomoscDAL::$miejscowosc, 
            NieruchomoscDAL::$cena, NieruchomoscDAL::$transakcja_rodzaj, NieruchomoscDAL::$nieruchomosc_rodzaj, NieruchomoscDAL::$klucz), 
            array(tags::$nr_oferty, tags::$nazwisko, tags::$status, tags::$telefon, tags::$telefon_komorkowy, tags::$miejscowosc, tags::$cena, tags::$rodzaj_transakcja, tags::$rodzaj_nieruchomosci, 
            tags::$klucze_w_biurze), 
            OsobaDAL::$id_osoba, 'oferta_id', null);
            echo '<br />';
        }
        if ($wynik[0][NieruchomoscDAL::$klucz] == tags::$nie)
        {
            $czy_klucz_biuro = false;
        }
        else
        {
            $czy_klucz_biuro = true;
        }
        ///pokazano otwierajacego zlecenie, teraz komentarz wewnetrzny
        $dal = new OsobaDAL(null);
        $wynik = $dal->PodajNotatkaNieruchomoscOfId(array(NieruchomoscDAL::$id_oferta => $oferta_id), $ilosc_wierszy);
        if($ilosc_wierszy > 0)
        {
            UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$informacje_o_ofercie));
            UtilsUI::$strona = 5;
            UtilsUI::$rekordy = $ilosc_wierszy;
            //echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'"><table>';
            UtilsUI::WyswietlTab1Poz($wynik, array(NieruchomoscDAL::$notatka, NieruchomoscDAL::$data, NieruchomoscDAL::$agent),
            array(tags::$notatka, tags::$data, tags::$agent), NieruchomoscDAL::$id_opis_nieruchomosc, 'opis_id', null);
            echo '<br />';
            //echo '</form>';
        }
        
        $tabParametr[OsobaDAL::$id_oferta] = $oferta_id;
        $tabParametr[OsobaDAL::$oferent] = 'false'; //podanie ogladajacych od razu
        $wynik = $dal->PodajSpotkanieOferta($tabParametr, $ilosc_wierszy); //ze wzgledu na dodanie info o kluczu w biurze pokazywanie nieruchomosci nie jest bezposrednio powiazane ze spotkaniem oferta
        //najlepiej bedzie zalozyc, ze jesli klucze sa w biurze dla oferty inne dane sa pobierane i pokazywane - ustalane w oparciu o ogladajacych
        
        
        if ($ilosc_wierszy > 0)
        {
            //ogladania przez klientow nie uzgodnione z oferentem jeszcze, ewentualne akcje na id oferty, gdyz o tego klienta przy akcjach sie troszczymy
            UtilsUI::$rekordy = $ilosc_wierszy;
            UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$ogladania_uzgodnione_dla_oferty).' '.$oferta_id);
            UtilsUI::$rekordy = $ilosc_wierszy;
            UtilsUI::WyswietlTab1Poz($wynik, array(NieruchomoscDAL::$id_oferta, NieruchomoscDAL::$id_klient, NieruchomoscDAL::$id_zapotrzebowanie, NieruchomoscDAL::$agent, NieruchomoscDAL::$data, 
            NieruchomoscDAL::$godzina, OsobaDAL::$nazwisko, OsobaDAL::$imie), 
            array(tags::$nr_oferty, tags::$nr_klienta, tags::$nr_zapotrzebowania, tags::$agent, tags::$data, tags::$godzina, tags::$nazwisko, tags::$imie), NieruchomoscDAL::$id_spotkanie, 'spotkanie_id', 
            null); // Akcja::$kasowanie => 1 array(Akcja::$dodawanie => 1)
        }
        //ewentualnie jesli kluczy nie ma w biurze wywalic tez pokazywania, zeby bylo info kto pokazuje ... ??
        echo '<hr />';
        UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$planowanie_ogladania_oferty).' : '.$oferta_id); 
        echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'"><table>';
        KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_oferta, NieruchomoscDAL::$id_oferta, $oferta_id);
        KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_zapotrzebowanie, NieruchomoscDAL::$id_zapotrzebowanie, $zapotrzebowanie_id);
        KontrolkiHtml::DodajHidden(NieruchomoscDAL::$klucz, NieruchomoscDAL::$klucz, $czy_klucz_biuro);
        
        echo '<tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$data).' : </td><td>';
        KontrolkiHtml::DodajTextboxDataPrzyszlosc('data', 'id_data', $data_ogl, 10, 10, 
        $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podana_inf_nie_jest_data), $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podano_data_przeszlosc), '', '');
        echo '</td><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$godzina).' : </td><td>';
        KontrolkiHtml::DodajSelectZrodSlownik('godzina', 'id_godzina', SlownikDAL::$godzina, 'godzina_id', $godzina_ogl, '', '');
        echo ' : </td><td>';
        KontrolkiHtml::DodajSelectZrodSlownik('minuta', 'id_minuta', SlownikDAL::$minuta, 'minuta_id', $minuta_ogl, '', '');
        echo '</td></tr>';
        if (!$czy_klucz_biuro)
        {
            echo '<tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$osoby_powiazane_z_oferta).' : </td></tr>';
            ///pobranie osob skojarzonych z ta oferta
            $of_zazn = null;
            /*if (isset($_POST['oferent']))
            {
                $of_zazn = $_POST['oferent'];
            }
            else
            { */
                if ($spotkanie_klient != null)
                {
                    $tabParametr[NieruchomoscDAL::$id_spotkanie] = $spotkanie_klient;
                    $osoba_pok = $dal->PodajOsPokOfSpotkanie($tabParametr, $ilosc_wierszy);
                    
                    if ($ilosc_wierszy == 1)
                    {
                        $of_zazn = $osoba_pok[0][OsobaDAL::$id_osoba];
                    }
                }
            //}
            ///pobrac umowiona osobe z oferentow jesli jest i zaznaczyc radio
            
            $wynik = $dal->PodajOsobaKlientOfId($tabParametr, $iloscWierszy);
            KontrolkiHtml::DodajRadioDb('oferent', $wynik, OsobaDAL::$id_osoba, array(OsobaDAL::$nazwisko, OsobaDAL::$imie, OsobaDAL::$telefon, OsobaDAL::$komorka), 'radio_of', '', false, $of_zazn, '<tr><td colspan="5">', '</td></tr>');
        }
        else
        {
            ///jakies skromne info ze oferent nie bedzie umawiany bo sa klucze
        }
        echo '<tr><td>';
        KontrolkiHtml::DodajSubmit('zatwierdz', 'id_zatwierdz', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zatwierdz), '');
        echo '</td></tr></table></form>';
        
        $kolOfert = $lista_wsk->PodajOferty();
        $kolOsobOgl = $lista_wsk->PodajOsoby();
        
        $i = 0;
        echo '<hr />';
        if (is_array($kolOfert))
        {
            foreach ($kolOfert as $oferta)
            {
                $tab[$i] = $oferta->PodajOferta();
                $i++;
            }
            if ($i > 0)
            {
                UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zaplanowane_klientowi_ogladania));
                echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'">';
                KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_oferta, NieruchomoscDAL::$id_oferta, $oferta_id);
                KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_zapotrzebowanie, NieruchomoscDAL::$id_zapotrzebowanie, $zapotrzebowanie_id);
                //KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_oferta, NieruchomoscDAL::$id_oferta, $_SESSION[NieruchomoscDAL::$id_oferta]);
                
                UtilsUI::WyswietlTab1Poz($tab, array(NieruchomoscDAL::$id_oferta, NieruchomoscDAL::$ulica, NieruchomoscDAL::$wlasciciel, NieruchomoscDAL::$data, NieruchomoscDAL::$godzina), 
                array(tags::$nr_oferty, tags::$ulica, tags::$wlasciciele, tags::$data, tags::$godzina), NieruchomoscDAL::$id_oferta, 'oferta_id', array(Akcja::$kasowanie => 1));
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
            echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'">';
            KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_oferta, NieruchomoscDAL::$id_oferta, $oferta_id);
            KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_zapotrzebowanie, NieruchomoscDAL::$id_zapotrzebowanie, $zapotrzebowanie_id);
            UtilsUI::WyswietlTab1Poz($tab, array(ListaWskazanDAL::$id_osoba, ListaWskazanDAL::$nazwisko), array(tags::$nr_osoby, tags::$nazwisko), 
            ListaWskazanDAL::$id_osoba, 'osoba_id', array(Akcja::$kasowanie => 1));
            echo '</form>';
        }
        
        $osoby = $lista_wsk->PodajOsobyZapotrzebowanie();
        echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$osoby_powiazane).' :<br />';
        echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'">';
        KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_oferta, NieruchomoscDAL::$id_oferta, $oferta_id);
        KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_zapotrzebowanie, NieruchomoscDAL::$id_zapotrzebowanie, $zapotrzebowanie_id);
        UtilsUI::WyswietlTab1Poz($osoby, 
        array(ListaWskazanDAL::$id_osoba, ListaWskazanDAL::$imie, ListaWskazanDAL::$nazwisko, ListaWskazanDAL::$telefon, OsobaDAL::$komorka), 
        array(tags::$nr_osoby, tags::$imie, tags::$nazwisko, tags::$telefon, tags::$telefon_komorkowy), 
        ListaWskazanDAL::$id_osoba, 'osoba_id', array(Akcja::$dodawanie => 1));
        echo '</form>';
        
        if (is_array($kolOfert))
        {
            echo '<hr /><table><tr><td>';//<form method="POST" action="../lista_wskazan.php" target="_blank">';
            //KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_zapotrzebowanie, NieruchomoscDAL::$id_zapotrzebowanie, $_SESSION[NieruchomoscDAL::$id_zapotrzebowanie]);
            KontrolkiHtml::DodajPopUpButton($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$generuj_liste_wskazan), 'generuj_lista_wskazan', 'lista_wskazan.php?'.
            NieruchomoscDAL::$id_zapotrzebowanie.'='.$zapotrzebowanie_id, $dl_lista_wsk, $szer_lista_wsk);
            echo '</td><td>';
            KontrolkiHtml::DodajPopUpButton($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$lista_oferentow), 'generuj_lista_oferentow', 'oferenci.php?'.
            NieruchomoscDAL::$id_zapotrzebowanie.'='.$zapotrzebowanie_id, $dl_lista_wsk, $szer_lista_wsk);
            echo '</td></tr></table>';
            //echo '</form>';
        }
    }
    require('../../stopka.php');

?>
</body>
</html>
