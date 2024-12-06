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
        
        $klient_id = null;
        $zapotrzebowanie_id = null;
        $zapotrzebowanie_trans_id = null;
        
        $oferta_id = null;
        
        if (isset($_GET[NieruchomoscDAL::$id_oferta]))
        {
            $oferta_id = $_GET[NieruchomoscDAL::$id_oferta];
        }
        if (isset($_POST[NieruchomoscDAL::$id_oferta]))
        {
            $oferta_id = $_POST[NieruchomoscDAL::$id_oferta];
        }
        
        if (isset($_GET[NieruchomoscDAL::$id_klient]))
        {
            $klient_id = $_GET[NieruchomoscDAL::$id_klient];
            $zapotrzebowanie_id = $_GET[NieruchomoscDAL::$id_zapotrzebowanie];
            $zapotrzebowanie_trans_id = $_GET[NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj];
        }
        if (isset($_POST[NieruchomoscDAL::$id_klient]))
        {
            $klient_id = $_POST[NieruchomoscDAL::$id_klient];
            $zapotrzebowanie_id = $_POST[NieruchomoscDAL::$id_zapotrzebowanie];
            $zapotrzebowanie_trans_id = $_POST[NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj];
        }
        
        if(isset($_POST['dodaj']))
        {
            $dal = new NieruchomoscDAL();
            
            $tabParametr[WyposazenieZapDAL::$id_zapotrzebowanie] = $zapotrzebowanie_id;
            if ($oferta_id != null)
            {
                $tabParametr[NieruchomoscDAL::$id_oferta] = $oferta_id;
                $tabParametr[NieruchomoscDAL::$cena] = $_POST[NieruchomoscDAL::$cena];
            }
            else
            {
                $tabParametr[NieruchomoscDAL::$id_oferta] = 'null';
                $tabParametr[NieruchomoscDAL::$cena] = '';
            }
            
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
                    //pytanie brzmi  :czy to okno ma byc zamykane zawsze po dodaniu notki, nigdy, czy jeszcze inaczej ??
                    //echo '<script>window.close();</script>';
                }
            }
        }
        
        if ($klient_id != null)
        {
            $nieruchomoscDal = new NieruchomoscDAL();
            
            $wynik = $nieruchomoscDal->EdycjaTransNierZapotrzebowanie(array(NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj => $zapotrzebowanie_trans_id));
            $wiersz = $wynik[0];
            //var_dump($wiersz);
            
            UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$numer_zapotrzebowania).': '.$zapotrzebowanie_id);
            
            echo '<table><tr>';
            echo '<td><b>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$data_otw_zlec).':</b></td><td>';
            echo $wiersz[NieruchomoscDAL::$data_otw_zlecenie].'</td>';
            echo '<td><b>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$status).':</b></td><td>';
            echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], $wiersz[NieruchomoscDAL::$status]).'</td>';
            echo '<td><b>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$rodzaj_nieruchomosci).':</b></td><td>';
            echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], $wiersz[NieruchomoscDAL::$nieruchomosc_rodzaj]).'</td>';
            echo '<td><b>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$rodzaj_transakcja).':</b></td><td>';
            echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], $wiersz[NieruchomoscDAL::$transakcja_rodzaj]).'</td>';
            echo '<td><b>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$cena).':</b></td><td>';
            echo $wiersz[NieruchomoscDAL::$cena].'</td>';
            echo '<td><b>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$agent).':</b></td><td>';
            echo $wiersz[NieruchomoscDAL::$agent].'</td>';
            echo '</tr></table>';
            
            $dal = new OsobaDAL(null);
            
            $wynik = $dal->PodajOsobaKlient($klient_id, $ilosc_wierszy);
            
            if ($zapotrzebowanie_id != null)
            {
                $tabParametr[OsobaDAL::$id_zapotrzebowanie] = $zapotrzebowanie_id;
                $osoba_otw = $dal->PodajOsobaZapotrzebowanie($tabParametr, $ilosc_wierszy);
                $osoba_otw = UtilsDAL::TabIdNazwa2TabIndexId($osoba_otw, OsobaDAL::$id_osoba, OsobaDAL::$id_osoba);
                                            /////oooooo - to jest array id => id, taki podawac z bazy i wyjazd :P
                UtilsUI::DodajTabWyroznien($osoba_otw, $zielony);
            }
            
            UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$osoby_powiazane_z_klientem));
            UtilsUI::$rekordy = $ilosc_wierszy;
            UtilsUI::WyswietlTab1Poz($wynik, array(OsobaDAL::$id_osoba, OsobaDAL::$nazwisko, OsobaDAL::$imie, OsobaDAL::$pesel, OsobaDAL::$telefon), 
            array(tags::$nr_osoby, tags::$nazwisko, tags::$imie, tags::$pesel, tags::$telefon),
            OsobaDAL::$id_osoba, 'osoba_id', null);
            echo '<hr />';
            
            //UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$opis_poszukiwanych_nieruchomosci));
            
            $tabParametr[NieruchomoscDAL::$id_zapotrzebowanie] = $zapotrzebowanie_id;
            $wynik = $nieruchomoscDal->ListaProwDlaTrans($tabParametr, $ilosc_wierszy);
            
            echo '<table>';
            KontrolkiHtml::DodajHidden('zapotrzebowanie_id','zapotrzebowanie_id', $zapotrzebowanie_id);
            KontrolkiHtml::DodajHidden(KlientDAL::$id_klient, KlientDAL::$id_klient, $klient_id);
            KontrolkiHtml::DodajHidden('prowizja_zapotrzebowanie_id', 'prowizja_zapotrzebowanie_id', '');
            foreach($wynik as $wiersz)
            {
                echo '<tr><td><b>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], $wiersz[NieruchomoscDAL::$transakcja_rodzaj]).' :</b></td><td><b>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$prowizja).'</b></td><td>'.
                $wiersz[NieruchomoscDAL::$prowizja].'</td><td>';
                echo '</td><td><b>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$sposob_finansowania).':</b></td><td>'.
                $tlumaczenia->Tlumacz($_SESSION[$jezyk], $wiersz[NieruchomoscDAL::$sposob_finansowania]).'</td><td><b>'.
                $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$poszukuje_dla).':</b></td><td>'.$wiersz[NieruchomoscDAL::$poszukiwane_dla].'</td><td>';
                KontrolkiHtml::DodajPopUpButton($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$drukuj_umowe).' : '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], $wiersz[NieruchomoscDAL::$transakcja_rodzaj]), 'druk_umowa_kl', 
                'druk_umowa.php?'.NieruchomoscDAL::$id_zapotrzebowanie.'='.$zapotrzebowanie_id.'&'.NieruchomoscDAL::$transakcja_rodzaj.'='.
                $wiersz[NieruchomoscDAL::$transakcja_rodzaj].'&'.NieruchomoscDAL::$prowizja.'='.$wiersz[NieruchomoscDAL::$prowizja], 1000, 700);
                echo '</td></tr>';
            }
            echo '</table><hr />';
            
            //wywalic opisy i szczegoly
            $dal = new WyposazenieZapDAL($zapotrzebowanie_trans_id);
            $wynik = $dal->PodajTransRodzajWypPar();
            $paramNier = new WyposazenieZapBLL($zapotrzebowanie_trans_id, $wynik);
            $sekcje = $paramNier->PodajSekcje();
            
            $kolWyp = $paramNier->KolekcjaWyposazen();
            $kolPar = $paramNier->KolekcjaParametrowMin();
            $kolParMax = $paramNier->KolekcjaParametrowMax();
            
            $dal = new ListaWskazanDAL(); 
            
            $wynik = $dal->PodajListaWskZapotrzebowanie(array(ListaWskazanDAL::$id_zapotrzebowanie => $zapotrzebowanie_id), $ilosc_wierszy); 
            UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$oferty_ogladniete_przez_klienta)); 
            
            if($ilosc_wierszy > 0)
            {
                UtilsUI::WyswietlTab1Poz($wynik, array(ListaWskazanDAL::$id_oferta, NieruchomoscDAL::$nieruchomosc_rodzaj, NieruchomoscDAL::$transakcja_rodzaj, ListaWskazanDAL::$cena, ListaWskazanDAL::$ulica, 
                ListaWskazanDAL::$ogladanie_data, MediaDAL::$powierzchnia, ExportDAL::$liczba_pokoi),
                array(tags::$nr_oferty, tags::$rodzaj_nieruchomosci, tags::$rodzaj_transakcja, tags::$cena, tags::$ulica, tags::$data, tags::$powierzchnia, tags::$liczba_pokoi), 
                ListaWskazanDAL::$id_oferta, 'oferta_id', null);
            }
            else
            {
                UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$brak_informacji_do_wyswietlenia));
            }
            echo '<hr />';
            
            $dal = new ListaWskazanDAL();
            $wynik = $dal->PodajOsobaZapotrzebowanie(array(ListaWskazanDAL::$id_zapotrzebowanie => $zapotrzebowanie_id));
            $dal = new OsobaDAL($wynik[0][OsobaDAL::$id_osoba]);
            $wynik = $dal->PodajSpotkanieOsoba(array(OsobaDAL::$oferent => 'false'), $ilosc_wierszy);
            if ($ilosc_wierszy > 0)
            {
                UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zaplanowane_klientowi_ogladania));
                UtilsUI::$rekordy = $ilosc_wierszy;
                UtilsUI::WyswietlTab1Poz($wynik, array(OsobaDAL::$id_oferta, OsobaDAL::$id_zapotrzebowanie, OsobaDAL::$data, OsobaDAL::$godzina, NieruchomoscDAL::$agent, OsobaDAL::$umowienie), 
                array(tags::$nr_oferty, tags::$nr_zapotrzebowania, tags::$data, tags::$godzina, tags::$agent, tags::$cel_spotkania), OsobaDAL::$id_osoba, 'osoba_id', null);
            }
            
            echo '<hr />';
            
            UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$szczegolowe_oczekiwania));
            $j = 1;
            echo '<table>';
            foreach ($sekcje as $klucz => $wartosc)
            {
                if($j % 2 == 1)
                {
                    echo '<tr>';
                }
                echo '<td valign="top"><br /><b><fff class="wlk_litery">'.$wartosc.'.</fff></b><br /><br />';
                //UtilsUI::IstotneInfo($wartosc);
                
                if(isset($kolWyp[$klucz]))
                {
                    $wyposazenie = $kolWyp[$klucz]->PodajWybraneWyposazenie();
                    $i = 1;
                    echo '<table>';
                    foreach ($wyposazenie as $element)
                    {
                        if($i % 3 == 1)
                        {
                            echo '<tr>';
                        }
                        //$odlamki = explode(':', $element->nazwa);
                        echo '<td>'.$element->nazwa.',</td>';
                        //echo '<td><b>'.$odlamki[0].'</b>'.$odlamki[1].'</td>';
                        if($i % 3 == 0)
                        {
                            echo '</tr>';
                        }
                        $i++;
                        
                    }
                    echo '</table>';
                    //var_dump($wyposazenie);
                    //echo '<hr />';
                }
                if(isset($kolPar[$klucz]))
                {
                    $kolMax = $kolParMax[$klucz]->PodajKolekcje();
                    $kol = $kolPar[$klucz]->PodajKolekcje();

                    echo '<table>'; 
                    $i = 1;
                    //podanie textboxow parametrow nieruchomosci
                    //wyglada na to, ze parametry tylko maxymalne sie nie pojawia, sprawdzic
                    foreach($kol as $kluczLok => $wartLok)
                    {
                        if (strlen($wartLok->wartosc) > 0 || strlen($kolMax[$kluczLok]->wartosc) > 0)
                        {
                            if($i % 3 == 1)
                            {
                                echo '<tr>';
                            }
                            echo '<td><b>'.$wartLok->nazwa.':</b><br />'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$od).' '.$wartLok->wartosc.' '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$do).' '.$kolMax[$kluczLok]->wartosc.'</td>';
                            if($i % 3 == 0)
                            {
                                echo '</tr>';
                            }
                            $i++;
                        }
                    }
                    
                    echo '</table>';
                }
                echo '</td>';
                
                if($j % 2 == 0)
                {
                    echo '</tr>';
                }
                $j++;
            }
            echo '</table>';
            
            $dal = new WyposazenieZapDAL($zapotrzebowanie_trans_id);
            
            //regiony :)
            $wynik = $dal->PodajRegGeogZap($IloscWierszy);
            if($IloscWierszy > 0)
            {     
                echo '<table>';
                echo '<tr><td><b>'.
                $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wybrane_lokalizacje_poszukiwanej_nieruchomosci).':</b></td></tr>';
                foreach ($wynik as $wiersz)
                {
                    echo '<tr>';
                    
                    $i = count($wiersz[NieruchomoscDAL::$rodzice]);
                    //echo '</td><td><b>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], $wiersz[NieruchomoscDAL::$region]).'</b>';
                    echo '<td><b>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$region_geog[$i]).' : '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], $wiersz[NieruchomoscDAL::$region]).'</b>';
                    foreach ($wiersz[NieruchomoscDAL::$rodzice] as $rodzic)
                    {
                        if (strlen($rodzic) > 0)
                        {
                            $i--;
                            echo ', '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$region_geog[$i]).' : '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], $rodzic);
                        }
                    }
                    echo '</td></tr>';
                }
                echo '</table><hr />';
            }
            
            $wynik = $dal->PodajOpisPoszZapotrzebowanie(array(WyposazenieZapDAL::$id_zapotrzebowanie_trans_rodzaj => $zapotrzebowanie_trans_id), $ilosc_wierszy);
            if($ilosc_wierszy > 0)
            {
                UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$opis_zapotrzebowania));
                UtilsUI::$rekordy = $ilosc_wierszy;
                //echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'">';
                UtilsUI::WyswietlTab1Poz($wynik, array(WyposazenieZapDAL::$wartosc, NieruchomoscDAL::$data, NieruchomoscDAL::$agent),
                array(tags::$notatka, tags::$data, tags::$agent), WyposazenieZapDAL::$id_opis_posz_zapotrzebowanie, 'opis_id', null);
                //echo '</form>';
            }
            
            $dal = new NieruchomoscDAL();
            $tabParametr[OsobaDAL::$id_oferta] = $oferta_id;
            $tabParametr[NieruchomoscDAL::$nazwisko] = 'null';
            if ($oferta_id != null)
            {
                $wynik_oferta = $dal->SzybkieSzukanie($tabParametr, $iloscWierszy);
            }
            
            echo '<hr /><form method="POST" action="'.$_SERVER['PHP_SELF'].'"><table>';
            KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_zapotrzebowanie, NieruchomoscDAL::$id_zapotrzebowanie, $zapotrzebowanie_id);
            if ($oferta_id != null)
            {
                KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_oferta, NieruchomoscDAL::$id_oferta, $oferta_id);
                KontrolkiHtml::DodajHidden(NieruchomoscDAL::$cena, NieruchomoscDAL::$cena, $wynik_oferta[0][NieruchomoscDAL::$cena]);
            }
            KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_klient, NieruchomoscDAL::$id_klient, $klient_id);
            KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj, NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj, $zapotrzebowanie_trans_id);

            echo '<tr><td><b>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$notatka_do_zapotrzebowania).' : </b></td></tr><tr><td>';
            KontrolkiHtml::DodajTextArea('tresc_not','id_tresc_not','', 100, 5, '');
            echo '</td></tr><tr><td>';
            KontrolkiHtml::DodajSubmit('dodaj', 'id_dodaj', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$dodaj), '');
            KontrolkiHtml::DodajCheckbox('niezainteresowany', 'id_niezainteresowany', false, $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$niezainteresowany), '');
            echo '</tr></td></table></form>';
            
            $wynik = $dal->PodajOpisZapotrzebowanie(array(NieruchomoscDAL::$id_zapotrzebowanie => $zapotrzebowanie_id), $ilosc_wierszy);
            echo '<hr />';
            UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$notatki_do_ofert));
            if($ilosc_wierszy > 0)
            {
                UtilsUI::$rekordy = $ilosc_wierszy;
                UtilsUI::$strona = 5;
                UtilsUI::WyswietlTab1Poz($wynik, array(NieruchomoscDAL::$id_oferta, NieruchomoscDAL::$zainteresowany, WyposazenieZapDAL::$tresc, NieruchomoscDAL::$data, NieruchomoscDAL::$agent),
                array(tags::$nr_oferty, tags::$zainteresowany, tags::$notatka, tags::$data, tags::$agent), WyposazenieZapDAL::$id_opis_zapotrzebowanie, 'opis_id', null);
                echo '<br />';
            }
            else
            {
                echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$brak_informacji_do_wyswietlenia).'.<br />';
            }
        }
        KontrolkiHtml::DodajSubmit('ok', 'id_ok', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zakoncz), 'onclick="window.close();"');
    }
    require('../../stopka.php');
?>
</body>
</html>
