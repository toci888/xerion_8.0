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
                ///dodac sprawdzenie aktualnosci
                $czy_jest_of_lw = $dal->SprawdzOfZapListaWsk(array(NieruchomoscDAL::$id_oferta => $oferta_id, NieruchomoscDAL::$id_zapotrzebowanie => $zapotrzebowanie_id));
                if ($czy_jest_of_lw[NieruchomoscDAL::$id] == null)
                {
                    $oferta_id = null;
                    UtilsUI::InfoBlad($tlumaczenia->Tlumacz($_SESSION[$jezyk], $czy_jest_of_lw[NieruchomoscDAL::$nazwa]));
                }
            }
        }
        
        if ($zapotrzebowanie_id != null && $oferta_id != null)
        {
            $lista_wsk = new ListaWskBLL($zapotrzebowanie_id, $agent_zal->id, true);

            ////region obsluga formularzy
            if (isset($_POST['zatwierdz']))
            {
                ///dodawanie spotkania - umowienie na ogladanie
                //$dal = new ListaWskazanDAL();
                $tabParametr[ListaWskazanDAL::$id_osoba] = $lista_wsk->PodajOsobyZapis($zapotrzebowanie_id, $agent_zal->id);
                
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
                    UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$uzgodniono_ogladanie_oferty));
                    KontrolkiHtml::DodajSubmit('ok', 'id_ok', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zakoncz), 'onclick="window.close();"');
                    echo '<br /><br />';
                }
                else
                {
                    UtilsUI::InfoBlad($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_nie_powiodla_sie).'. '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], $wynik[ListaWskazanDAL::$nazwa]));
                }            
            }
            
            $ofertyKol = $lista_wsk->PodajOferty(); 
            
            if (is_array($ofertyKol))
            {
                echo '<hr /><table><tr><td>';//<form method="POST" action="../lista_wskazan.php" target="_blank">';
                //KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_zapotrzebowanie, NieruchomoscDAL::$id_zapotrzebowanie, $_SESSION[NieruchomoscDAL::$id_zapotrzebowanie]);
                KontrolkiHtml::DodajPopUpButton($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$generuj_liste_wskazan), 'generuj_lista_wskazan', 'lista_wskazan.php?'.
                NieruchomoscDAL::$id_zapotrzebowanie.'='.$zapotrzebowanie_id, $dl_lista_wsk, $szer_lista_wsk);
                echo '</td><td>';
                KontrolkiHtml::DodajPopUpButton($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$lista_oferentow), 'generuj_lista_oferentow', 'oferenci.php?'.
                NieruchomoscDAL::$id_zapotrzebowanie.'='.$zapotrzebowanie_id, $dl_lista_wsk, $szer_lista_wsk);
                echo '</td></tr></table><hr />';
                //echo '</form>';
            }
            
            if(isset($_POST['dodaj']))
            {
                $dal = new NieruchomoscDAL();
                
                $tabParametr[WyposazenieZapDAL::$id_zapotrzebowanie] = $zapotrzebowanie_id;
                $tabParametr[NieruchomoscDAL::$id_oferta] = $oferta_id;
                $tabParametr[NieruchomoscDAL::$cena] = $_POST[NieruchomoscDAL::$cena];
                
                if (isset($_POST['niezainteresowany']))
                {
                    $tabParametr[NieruchomoscDAL::$niezainteresowany] = 'false';
                }
                else
                {
                    $tabParametr[NieruchomoscDAL::$niezainteresowany] = 'true';
                }
                $tabParametr[NieruchomoscDAL::$id_agent] = $agent_zal->id;
                $tabParametr[WyposazenieZapDAL::$tresc] = $_POST['tresc_not'];
                
                $wynik = $dal->DodajOpisZapotrzebowanie($tabParametr);
                if ($wynik == null)
                {
                    UtilsUI::InfoBlad($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_nie_powiodla_sie));
                }
                else
                {
                    if (isset($_POST['niezainteresowany']))
                    {
                        echo '<script>window.close();</script>';
                    }
                }
            }
            
            //koniec obslug formularzy
        
            //budowa wyswiewtlania        
            
            
            $data_ogl = $data_dzienna;
            $godzina_ogl = null;
            $minuta_ogl = null;
            $spotkanie_klient = null;
            

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

            
            $dal = new OsobaDAL(null);
            $tabParametr[OsobaDAL::$id_zapotrzebowanie] = $zapotrzebowanie_id;
            
            $wynik = $dal->PodajOsobaKlientZapId($tabParametr, $ilosc_wierszy);
            if ($ilosc_wierszy > 0)
            {
                UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$klienci));
                echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'">';
                KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_zapotrzebowanie, NieruchomoscDAL::$id_zapotrzebowanie, $zapotrzebowanie_id);

                
                if ($zapotrzebowanie_id != null)
                {
                    $tabParametr[OsobaDAL::$id_zapotrzebowanie] = $zapotrzebowanie_id;
                    $osoba_otw = $dal->PodajOsobaZapotrzebowanie($tabParametr, $ilosc_wierszy);
                    $osoba_otw = UtilsDAL::TabIdNazwa2TabIndexId($osoba_otw, OsobaDAL::$id_osoba, OsobaDAL::$id_osoba);
                                                /////oooooo - to jest array id => id, taki podawac z bazy i wyjazd :P
                    UtilsUI::DodajTabWyroznien($osoba_otw, $zielony);
                }
                //tags::$nr_osoby,  OsobaDAL::$id_osoba, 
                UtilsUI::$rekordy = $ilosc_wierszy;
                UtilsUI::WyswietlTab1Poz($wynik, array(OsobaDAL::$nazwisko, OsobaDAL::$imie, OsobaDAL::$pesel, OsobaDAL::$telefon), 
                array(tags::$nazwisko, tags::$imie, tags::$pesel, tags::$telefon),
                OsobaDAL::$id_osoba, 'osoba_id', null);
                echo '</form><hr />';
            }
            
            $tabParametr[NieruchomoscDAL::$id_zapotrzebowanie] = $zapotrzebowanie_id;
            $tabParametr[NieruchomoscDAL::$id_oferta] = $oferta_id;
            $wynik = $dal->PodajDaneZapotrzebowanie($tabParametr, $ilosc_wierszy);
            $wynik = $wynik[0];
            
            $klient_id = $wynik[NieruchomoscDAL::$id_klient];
            
            UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$preferencje_klienta));
            echo '<table><tr>';
            echo '<td><b>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$numer_zapotrzebowania).':</b></td><td>'.$wynik[NieruchomoscDAL::$id_zapotrzebowanie].'</td>';
            //echo '<td><b>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$numer_klienta).':</b></td><td>'.$wynik[NieruchomoscDAL::$id_klient].'</td>';
            echo '<td><b>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$data_otw_zlec).':</b></td><td>'.$wynik[NieruchomoscDAL::$data_otw_zlecenie].'</td>';
            echo '<td><b>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$do_ceny).':</b></td><td>'.$wynik[NieruchomoscDAL::$cena].'</td></tr><tr>';
            echo '<td><b>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$powierzchnia).':</b></td><td>'.$wynik[MediaDAL::$powierzchnia].'</td>';
            echo '<td><b>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$powierzchnia_max).':</b></td><td>'.$wynik[MediaDAL::$powierzchnia_max].'</td>';
            echo '<td><b>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$liczba_pokoi).':</b></td><td>'.$wynik[ExportDAL::$liczba_pokoi].'</td>';
            echo '<td><b>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$liczba_pokoi_max).':</b></td><td>'.$wynik[ExportDAL::$liczba_pokoi_max].'</td>';
            echo '</tr></table><hr />';
            
            $dal = new ListaWskazanDAL(); 
            
            $wynik = $dal->PodajListaWskZapotrzebowanie(array(ListaWskazanDAL::$id_zapotrzebowanie => $zapotrzebowanie_id), $ilosc_wierszy); 
            UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$oferty_ogladniete_przez_klienta)); 
            
            if($ilosc_wierszy > 0)
            {
                UtilsUI::WyswietlTab1Poz($wynik, array(ListaWskazanDAL::$id_oferta, NieruchomoscDAL::$nieruchomosc_rodzaj, NieruchomoscDAL::$transakcja_rodzaj, NieruchomoscDAL::$agent, ListaWskazanDAL::$cena, 
                ListaWskazanDAL::$ulica, ListaWskazanDAL::$ogladanie_data, MediaDAL::$powierzchnia, ExportDAL::$liczba_pokoi),
                array(tags::$nr_oferty, tags::$rodzaj_nieruchomosci, tags::$rodzaj_transakcja, tags::$agent, tags::$cena, tags::$ulica, tags::$data, tags::$powierzchnia, tags::$liczba_pokoi), 
                ListaWskazanDAL::$id_oferta, 'oferta_id', null);
            }
            else
            {
                UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$brak_informacji_do_wyswietlenia));
            }
            
            $dal = new NieruchomoscDAL();
            
            $wynik = $dal->PodajOpisZapotrzebowanie(array(NieruchomoscDAL::$id_zapotrzebowanie => $zapotrzebowanie_id), $ilosc_wierszy);
            echo '<hr />';
            UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$notatki));
            if($ilosc_wierszy > 0)
            {
                UtilsUI::DodajTabWyroznien(array($oferta_id => $oferta_id), $zielony);
                UtilsUI::$rekordy = $ilosc_wierszy;
                UtilsUI::$strona = 5;
                UtilsUI::WyswietlTab1Poz($wynik, array(NieruchomoscDAL::$id_oferta, NieruchomoscDAL::$zainteresowany, WyposazenieZapDAL::$tresc, NieruchomoscDAL::$data, NieruchomoscDAL::$agent),
                array(tags::$nr_oferty, tags::$zainteresowany, tags::$notatka, tags::$data, tags::$agent), NieruchomoscDAL::$id_oferta, 'oferta_id', null);
            }
            else
            {
                echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$brak_informacji_do_wyswietlenia).'.<br />';
            }
            
            $dal = new NieruchomoscDAL();
            $tabParametr[OsobaDAL::$id_oferta] = $oferta_id;
            $tabParametr[NieruchomoscDAL::$nazwisko] = 'null';
            $wynik_oferta = $dal->SzybkieSzukanie($tabParametr, $iloscWierszy);
            
            echo '<hr /><form method="POST" action="'.$_SERVER['PHP_SELF'].'"><table>';
            KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_zapotrzebowanie, NieruchomoscDAL::$id_zapotrzebowanie, $zapotrzebowanie_id);
            KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_oferta, NieruchomoscDAL::$id_oferta, $oferta_id);
            KontrolkiHtml::DodajHidden(NieruchomoscDAL::$cena, NieruchomoscDAL::$cena, $wynik_oferta[0][NieruchomoscDAL::$cena]);
            echo '<tr><td><b>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$notatka_do_zapotrzebowania).' : </b></td></tr><tr><td>';
            KontrolkiHtml::DodajTextArea('tresc_not','id_tresc_not','', 100, 5, '');
            echo '</td></tr><tr><td>';
            KontrolkiHtml::DodajSubmit('dodaj', 'id_dodaj', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$dodaj), '');
            KontrolkiHtml::DodajCheckbox('niezainteresowany', 'id_niezainteresowany', false, $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$niezainteresowany), '');
            echo '</tr></td></table></form>';
            
            $dal = new OsobaDAL(null);
            
            $tabParametr[OsobaDAL::$id_oferta] = $oferta_id;
            $tabParametr[OsobaDAL::$oferent] = 'false'; //podanie ogladajacych od razu
            $wynik = $dal->PodajSpotkanieOferta($tabParametr, $ilosc_wierszy); //ze wzgledu na dodanie info o kluczu w biurze pokazywanie nieruchomosci nie jest bezposrednio powiazane ze spotkaniem oferta
            //najlepiej bedzie zalozyc, ze jesli klucze sa w biurze dla oferty inne dane sa pobierane i pokazywane - ustalane w oparciu o ogladajacych

            echo '<hr />';
            UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$ogladania_uzgodnione_dla_oferty).' '.$oferta_id);
            
            if ($ilosc_wierszy > 0)
            {
                //ogladania przez klientow nie uzgodnione z oferentem jeszcze, ewentualne akcje na id oferty, gdyz o tego klienta przy akcjach sie troszczymy
                UtilsUI::$rekordy = $ilosc_wierszy;
                UtilsUI::WyswietlTab1Poz($wynik, array(NieruchomoscDAL::$id_oferta, NieruchomoscDAL::$id_klient, NieruchomoscDAL::$id_zapotrzebowanie, NieruchomoscDAL::$agent, NieruchomoscDAL::$data, 
                NieruchomoscDAL::$godzina, OsobaDAL::$nazwisko, OsobaDAL::$imie), 
                array(tags::$nr_oferty, tags::$nr_klienta, tags::$nr_zapotrzebowania, tags::$agent, tags::$data, tags::$godzina, tags::$nazwisko, tags::$imie), NieruchomoscDAL::$id_spotkanie, 'spotkanie_id', 
                null);
            }
            else
            {
                echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$brak_informacji_do_wyswietlenia).'.<br />';
            }
            
            $tabParametr[OsobaDAL::$id_zapotrzebowanie] = $zapotrzebowanie_id;
            
            $wynik = $dal->PodajSpotkanieZapotrzebowanie($tabParametr, $ilosc_wierszy); //ze wzgledu na dodanie info o kluczu w biurze pokazywanie nieruchomosci nie jest bezposrednio powiazane ze spotkaniem oferta
            //najlepiej bedzie zalozyc, ze jesli klucze sa w biurze dla oferty inne dane sa pobierane i pokazywane - ustalane w oparciu o ogladajacych

            echo '<hr />';
            UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zaplanowane_klientowi_ogladania));
            
            if ($ilosc_wierszy > 0)
            {
                //ogladania przez klientow nie uzgodnione z oferentem jeszcze, ewentualne akcje na id oferty, gdyz o tego klienta przy akcjach sie troszczymy
                UtilsUI::$rekordy = $ilosc_wierszy;
                UtilsUI::WyswietlTab1Poz($wynik, array(NieruchomoscDAL::$id_oferta, NieruchomoscDAL::$id_zapotrzebowanie, NieruchomoscDAL::$agent, NieruchomoscDAL::$data, 
                NieruchomoscDAL::$godzina, OsobaDAL::$nazwisko, OsobaDAL::$imie), 
                array(tags::$nr_oferty, tags::$nr_zapotrzebowania, tags::$agent, tags::$data, tags::$godzina, tags::$nazwisko, tags::$imie), NieruchomoscDAL::$id_spotkanie, 'spotkanie_id', 
                null);
                //tags::$nr_klienta NieruchomoscDAL::$id_klient
            }
            else
            {
                echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$brak_informacji_do_wyswietlenia).'.<br />';
            }
            
            //$dal = new NieruchomoscDAL();
            //$tabParametr[OsobaDAL::$id_oferta] = $oferta_id;
            //$tabParametr[NieruchomoscDAL::$nazwisko] = 'null';
            //$wynik = $dal->SzybkieSzukanie($tabParametr, $iloscWierszy);
            
            echo '<hr />';
            UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$oferta));
            
            if ($wynik_oferta[0][NieruchomoscDAL::$klucz] == tags::$nie)
            {
                $czy_klucz_biuro = false;
            }
            else
            {
                $czy_klucz_biuro = true;
            }
            if ($iloscWierszy > 0)
            {
                $links = new Links();
                $links->nag = tags::$pokaz;
                $links->text = tags::$pokaz;
                $links->url = $strona_www;
                $links->vars = array(tags::$oferta, NieruchomoscDAL::$id_trans_rodzaj, NieruchomoscDAL::$id_nier_rodzaj);
                $links->varvalues = array(NieruchomoscDAL::$id_oferta, NieruchomoscDAL::$id_rodz_trans, NieruchomoscDAL::$id_nier_rodzaj);
                $link[0] = $links;
            
                UtilsUI::$rekordy = $iloscWierszy;
                UtilsUI::WyswietlTab1Poz($wynik_oferta, 
                array(NieruchomoscDAL::$id_oferta, NieruchomoscDAL::$nazwisko, NieruchomoscDAL::$status, KlientDAL::$telefon, NieruchomoscDAL::$miejscowosc, NieruchomoscDAL::$ulica,
                NieruchomoscDAL::$cena, NieruchomoscDAL::$transakcja_rodzaj, NieruchomoscDAL::$nieruchomosc_rodzaj, NieruchomoscDAL::$klucz), 
                array(tags::$nr_oferty, tags::$nazwisko, tags::$status, tags::$telefon, tags::$miejscowosc, tags::$ulica, tags::$cena, tags::$rodzaj_transakcja, tags::$rodzaj_nieruchomosci, 
                tags::$klucze_w_biurze), 
                OsobaDAL::$id_osoba, 'oferta_id', null, null. null, null, null, $link);
                echo '<br />';
            }
                        
            echo '<hr />';
            UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$planowanie_ogladania_oferty).' : '.$oferta_id);
            
            $dal = new KlientDAL();
            
            $notatki = $dal->PodajNotatkaKlient(array(KlientDAL::$id_klient => $klient_id), $ilosc_wierszy);
            if($ilosc_wierszy > 0)
            {
                UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$notatka_o_kliencie));
                UtilsUI::$strona = 5;
                UtilsUI::WyswietlTab1Poz($notatki, array(KlientDAL::$tresc, KlientDAL::$data, KlientDAL::$agent),
                array(tags::$notatka, tags::$data, tags::$agent), KlientDAL::$id_notatka, 'notatka_id', null);
            }
            
            $dal = new OsobaDAL(null); 
            echo '<form method="POST" name="umawianie_ogladanie" action="'.$_SERVER['PHP_SELF'].'"><table>';
            KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_oferta, NieruchomoscDAL::$id_oferta, $oferta_id);
            KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_zapotrzebowanie, NieruchomoscDAL::$id_zapotrzebowanie, $zapotrzebowanie_id);
            KontrolkiHtml::DodajHidden(NieruchomoscDAL::$klucz, NieruchomoscDAL::$klucz, $czy_klucz_biuro);
            
            echo '<tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$data).' : </td><td>';
            KontrolkiHtml::DodajTextboxDataPrzyszlosc('data', 'id_data', $data_ogl, 10, 10, 
            $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podana_inf_nie_jest_data), $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podano_data_przeszlosc), '', '', 'umawianie_ogladanie', '../');
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

                if ($spotkanie_klient != null)
                {
                    $tabParametr[NieruchomoscDAL::$id_spotkanie] = $spotkanie_klient;
                    $osoba_pok = $dal->PodajOsPokOfSpotkanie($tabParametr, $ilosc_wierszy);
                    
                    if ($ilosc_wierszy == 1)
                    {
                        $of_zazn = $osoba_pok[0][OsobaDAL::$id_osoba];
                    }
                }
                ///pobrac umowiona osobe z oferentow jesli jest i zaznaczyc radio
                
                $wynik = $dal->PodajOsobaKlientOfId($tabParametr, $iloscWierszy);
                KontrolkiHtml::DodajRadioDb('oferent', $wynik, OsobaDAL::$id_osoba, array(OsobaDAL::$nazwisko, OsobaDAL::$imie, OsobaDAL::$telefon), 'radio_of', '', false, $of_zazn, '<tr><td colspan="5">', '</td></tr>');
            }
            else
            {
                ///jakies skromne info ze oferent nie bedzie umawiany bo sa klucze
            }
            echo '<tr><td>';
            KontrolkiHtml::DodajSubmit('zatwierdz', 'id_zatwierdz', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zatwierdz), '');
            echo '</td></tr></table></form>';
        }        
    }
    require('../../stopka.php');
?>
</body>
</html>
