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
    include_once ('../bll/listawskazanbll.php'); 
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
        $uprawnienia = unserialize($_SESSION[$zalogowany]);
        
        if (isset($_POST['zapotrzebowanie_id']))
        {
            if (isset($_POST[AgentDAL::$id_agent]))
            {
                $lista_wsk = new ListaWskBLL($_POST['zapotrzebowanie_id'], $_POST[AgentDAL::$id_agent], true);
            }
            else
            {
                $lista_wsk = new ListaWskBLL($_POST['zapotrzebowanie_id'], $agent_zal->id, true);
            }
        }
        if (isset($_POST['kasowanie']))
        {                                                       //referencyjny - wyjsciowy
            $wynik = $lista_wsk->UsunOferta($_POST['oferta_id'], $spotkanie_id);
            if (!$wynik) //nie usunieto calego cache
            {
                $lista_wsk->ZapiszListaWskazan();
            }
            if ($spotkanie_id != null)
            {
                //kasowanie spotkania
                $dal = new ListaWskazanDAL();
                $wynik = $dal->UsunSpotkanie(array(ListaWskazanDAL::$id_spotkanie => $spotkanie_id));
            }
        }
        if (isset($_POST['dodaj']))  //isset oferta_id
        {
            //zapis do bazy
            $kolOsobOgl = $lista_wsk->PodajOsoby();
            $tab_os = null;
            
            foreach ($kolOsobOgl as $klucz => $wartosc)
            {
                $tab_os[$klucz] = $klucz;
            }
            $kolOfert = $lista_wsk->PodajOferty();
            $oferta = $kolOfert[$_POST['oferta_id']];
            $dal = new ListaWskazanDAL();
            
            $tabParametr = $oferta->PodajOferta();
            $tabParametr[ListaWskazanDAL::$id_agent] = $_POST[AgentDAL::$id_agent];//$agent_zal->id;
            $tabParametr[ListaWskazanDAL::$id_osoba] = $tab_os;
            $tabParametr[ListaWskazanDAL::$id_oferta] = $_POST['oferta_id'];
            $tabParametr[ListaWskazanDAL::$id_zapotrzebowanie] = $_POST['zapotrzebowanie_id'];
            
            $wynik = $dal->DodajOgladanie($tabParametr);
            
            if ($wynik)
            {
                $wynik = $lista_wsk->UsunOferta($_POST['oferta_id']);
                if (!$wynik) //nie usunieto calego cache
                {
                    $lista_wsk->ZapiszListaWskazan();
                }
            }
            else
            {
                //nie udalo sie, takie ogladanie musi juz byc
                UtilsUI::InfoBlad($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_nie_powiodla_sie));
            }
        }
        if (isset($_POST['zapotrzebowanie_id']))
        {
            $kolOfert = $lista_wsk->PodajOferty();
            
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
                    $popupObj = new PopUpWysw();
                    ///wysmerfowac pokazywanie
                    $popupObj->nag = array(tags::$zmiana_terminu);
                    $popupObj->przyc_nazwa = array(tags::$zmiana_terminu);
                    //$popupObj->url = array('popup/dodaj_of_lista_wsk.php?'.NieruchomoscDAL::$id_zapotrzebowanie.'='.$_POST['zapotrzebowanie_id'].'&'.NieruchomoscDAL::$id_oferta);
                    $popupObj->url = array('popup/skojarz_of_zap.php?'.NieruchomoscDAL::$id_zapotrzebowanie.'='.$_POST['zapotrzebowanie_id'].'&'.NieruchomoscDAL::$id_oferta);
                    $popupObj->szerokosc = array(1000);
                    $popupObj->dlugosc = array(700);
                    UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$lista_wskazan).' : '.$_POST['zapotrzebowanie_id']);
                    if (isset($_POST['agent_nazwa']))
                    {
                        UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$agent).' : '.$_POST['agent_nazwa']);
                    }
                    echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wybrane_oferty).' :<br />';
                    UtilsUI::$rekordy = $i;
                    echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'">';
                    KontrolkiHtml::DodajHidden('zapotrzebowanie_id', 'zapotrzebowanie_id', $_POST['zapotrzebowanie_id']);
                    if (isset($_POST[AgentDAL::$id_agent]))
                    {
                        KontrolkiHtml::DodajHidden(AgentDAL::$id_agent, AgentDAL::$id_agent, $_POST[AgentDAL::$id_agent]);
                    }
                    else
                    {
                        KontrolkiHtml::DodajHidden(AgentDAL::$id_agent, AgentDAL::$id_agent, $agent_zal->id);
                    }
                    //KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_oferta, NieruchomoscDAL::$id_oferta, $_SESSION[NieruchomoscDAL::$id_oferta]);
                    UtilsUI::WyswietlTab1Poz($tab, array(NieruchomoscDAL::$id_oferta, NieruchomoscDAL::$ulica, NieruchomoscDAL::$wlasciciel, NieruchomoscDAL::$data, NieruchomoscDAL::$godzina), 
                    array(tags::$nr_oferty, tags::$ulica, tags::$wlasciciele, tags::$data, tags::$godzina), NieruchomoscDAL::$id_oferta, 'oferta_id', array(Akcja::$dodawanie => 1), 
                    array(tags::$kasuj), array(Akcja::$kasowanie => tags::$kasuj), $popupObj);
                    echo '</form><hr />';
                    //
                    if (isset($_POST[AgentDAL::$id_agent]))
                    {
                        $agent_id = $_POST[AgentDAL::$id_agent];
                    }
                    else
                    {
                        $agent_id = $agent_zal->id;
                    }
                    KontrolkiHtml::DodajPopUpButton($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$generuj_liste_wskazan), 'generuj_lista_wskazan', 'popup/lista_wskazan.php?'.
                    NieruchomoscDAL::$id_zapotrzebowanie.'='.$_POST['zapotrzebowanie_id'].'&'.AgentDAL::$id_agent.'='.$agent_id, $dl_lista_wsk, $szer_lista_wsk);
                    echo '<hr />';
                }
                else
                {
                    //echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nie_znaleziono_elementow).'.<br />';
                    UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_powiodla_sie));
                }
            }
            else
            {
                UtilsUI::InfoBlad($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$brak_ofert).'. '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$powiadom_administratora));
            }
        }
        if ($uprawnienia->adm_dane)
        {
            $tab_ag = CacheListaWskazan::PodajAgenci();
            if ($tab_ag != null)
            {
                //utworzenie dala agenta z metoda pobierania nazwy agenta na id :)
                $dal_ag = new AgentDAL();
                
                foreach ($tab_ag as $agent_id)
                {
                    $wyn_ag = $dal_ag->PodajNazwaAgentId($agent_id);
                    UtilsUI::IstotneInfo($wyn_ag[0]['nazwa']);
                    $tab = CacheListaWskazan::PodajListyAgent($agent_id);
                    if ($tab != null)
                    {
                        $dal = new ListaWskazanDAL();
                        $wynik = $dal->ZapotrzebowaniaTabListWskazan(array(ListaWskazanDAL::$id_zapotrzebowanie => $tab), $ilosc_wierszy);
                        if ($ilosc_wierszy > 0)
                        {
                            UtilsUI::$rekordy = $ilosc_wierszy;
                            UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$listy_wskazan_nie_wprowadzone));
                            echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'">';
                            KontrolkiHtml::DodajHidden(AgentDAL::$id_agent, AgentDAL::$id_agent, $agent_id);
                            KontrolkiHtml::DodajHidden('agent_nazwa', 'agent_nazwa', $wyn_ag[0]['nazwa']);
                            UtilsUI::WyswietlTab1Poz($wynik, array(ListaWskazanDAL::$id_zapotrzebowanie, ListaWskazanDAL::$nazwisko, ListaWskazanDAL::$imie, ListaWskazanDAL::$pesel, ListaWskazanDAL::$telefon), 
                            array(tags::$numer_zapotrzebowania, tags::$nazwisko, tags::$imie, tags::$pesel, tags::$telefon), ListaWskazanDAL::$id_zapotrzebowanie, 'zapotrzebowanie_id', 
                            array(Akcja::$edycja => 1));
                            echo '</form>';
                        }
                    }
                }
            }
        }
        else
        {
            //wczytanie wszystkich id zapotrzebowan z katalogu
            $tab = CacheListaWskazan::PodajListyAgent($agent_zal->id);
            if ($tab != null)
            {
                $dal = new ListaWskazanDAL();
                $wynik = $dal->ZapotrzebowaniaTabListWskazan(array(ListaWskazanDAL::$id_zapotrzebowanie => $tab), $ilosc_wierszy);
                if ($ilosc_wierszy > 0)
                {
                    UtilsUI::$rekordy = $ilosc_wierszy;
                    UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$listy_wskazan_nie_wprowadzone));
                    echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'">';
                    UtilsUI::WyswietlTab1Poz($wynik, array(ListaWskazanDAL::$id_zapotrzebowanie, ListaWskazanDAL::$nazwisko, ListaWskazanDAL::$imie, ListaWskazanDAL::$pesel, ListaWskazanDAL::$telefon), 
                    array(tags::$numer_zapotrzebowania, tags::$nazwisko, tags::$imie, tags::$pesel, tags::$telefon), ListaWskazanDAL::$id_zapotrzebowanie, 'zapotrzebowanie_id', 
                    array(Akcja::$edycja => 1));
                    echo '</form>';
                }
            }
            else
            {
                UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nie_znaleziono_elementow));
            }
        }
    }
    require('../stopka.php');

?>
</body>
</html>
