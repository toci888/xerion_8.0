<?php 
    //include_once ('../bll/xajax.php');
    include_once ('../ui/xajax.php');
?>
<HTML>
<HEAD>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <script language="javascript" src="../js/script.js"></script>
  <script>
        function DodajWyposazenie(ctrl, id_wyposazenie, id_sekcja)   //
        {
            ///to jest tu kompletnie niepotrzebne i nieaktualne
            xajax_DodajWyposazenie(ctrl, 'innerHTML', id_wyposazenie, id_sekcja);
        }
  </script>
<link href="../css/style.css" rel="stylesheet" type="text/css">
</head>
<?php $xajax->printJavascript("../lib/xajax/"); ?>
<body>
<?php
    // ¶ ±
    include_once ('../bll/cache.php');
    include_once ('../bll/agentbll.php');
    include_once ('../bll/jezykibll.php');
    include_once ('../bll/parametrynierbll.php');
    include_once ('../lib/mail.php');
    include_once ('../dal/queriesDAL.php');
    include_once ('../ui/kontrolki_html.php');
    include_once ('../ui/utilsui.php');
    include_once ('../export/otodom/OtoDomClient.php');
    include_once ('../export/domiporta/DomiportaClient.php');
    session_start();
    require('../naglowek.php');
    require('../conf.php');
    
    if (!isset($_SESSION[$zalogowany]))
    {
        echo 'Nie jesteÅ› zalogowany.';
    }
    else
    {
        $tlumaczenia = cachejezyki::Czytaj();
        if (isset($_POST['oferta_id']))
        {
            //osluga zatwierdzenia calego formularza
            $nieruchomoscDal = new NieruchomoscDAL();
            $agent_zal = unserialize($_SESSION[$dane_agent]);
            if (isset($_POST['zatwierdz']) && isset($_SESSION[$param_nier.$_POST['oferta_id']]))
            {
                //$_SESSION[NieruchomoscDAL::$id_oferta] = $_POST['oferta_id'];
                //$_SESSION[NieruchomoscDAL::$id_nieruchomosc] = $_POST[NieruchomoscDAL::$id_nieruchomosc];
                $_POST[NieruchomoscDAL::$id_oferta] = $_POST['oferta_id']; //zabieg kosmetyczny, ulatwiajacy spojne uzywanie tych samych postow
                
                $tabParametr[NieruchomoscDAL::$id_oferta] = $_POST[NieruchomoscDAL::$id_oferta];
                $tabParametr[NieruchomoscDAL::$cena] = $_POST['cena'];
                $tabParametr[NieruchomoscDAL::$id_status] = $_POST['status_id'];
                $tabParametr[NieruchomoscDAL::$id_priorytet_reklama] = $_POST['priorytet_id'];
                
                if (strlen($_POST['data_zam_zlec']) == 10)
                {
                    $tabParametr[NieruchomoscDAL::$data_zam_zlecenie] = '\''.$_POST['data_zam_zlec'].'\'';
                }
                else
                {
                    $tabParametr[NieruchomoscDAL::$data_zam_zlecenie] = 'null';
                }
                $tabParametr[NieruchomoscDAL::$prowizja] = $_POST['prowizja'];
                $tabParametr[NieruchomoscDAL::$agent] = (int)$agent_zal->id;
                if (isset($_POST['nier_szczeg_id']))
                {
                    $tabParametr[NieruchomoscDAL::$id_rodz_nier_szcz] = $_POST['nier_szczeg_id'];
                }
               if (isset($_POST['prowizja_proc']))
                {
                    $tabParametr[NieruchomoscDAL::$prow_proc] = true;
                }
                else
                {
                    $tabParametr[NieruchomoscDAL::$prow_proc] = false;
                }
                if (isset($_POST['wylacznosc']))
                {
                    $tabParametr[NieruchomoscDAL::$wylacznosc] = true;
                }
                else
                {
                    $tabParametr[NieruchomoscDAL::$wylacznosc] = false;
                }
                //if (isset($_POST['pokaz']))
                //{
                //    $tabParametr[NieruchomoscDAL::$pokaz] = true;
                //}
                //else
                //{
                $tabParametr[NieruchomoscDAL::$pokaz] = false;
                //}
                if (isset($_POST['rynek']))
                {
                    $tabParametr[NieruchomoscDAL::$rynek] = true;
                }
                else
                {
                    $tabParametr[NieruchomoscDAL::$rynek] = false;
                }
                if (isset($_POST['klucze']))
                {
                    $tabParametr[NieruchomoscDAL::$klucz] = true;
                }
                else
                {
                    $tabParametr[NieruchomoscDAL::$klucz] = false;
                }
                if (isset($_POST['czas_od_otwarcia']))
                {
                    $tabParametr[NieruchomoscDAL::$przek_od_otwarcia] = true;
                }
                else
                {
                    $tabParametr[NieruchomoscDAL::$przek_od_otwarcia] = false;
                }
                $tabParametr[NieruchomoscDAL::$czas_przekazania] = $_POST['czas_przekazania_id'];
                $tabParametr[NieruchomoscDAL::$id_region_geog] = $_POST[NieruchomoscDAL::$id_region_geog];
                $tabParametr[NieruchomoscDAL::$ulica] = $_POST['ulica'];
                $tabParametr[NieruchomoscDAL::$ulica_net] = $_POST['ulica_net'];
                $tabParametr[NieruchomoscDAL::$kod] = $_POST['kod'];
                $tabParametr[NieruchomoscDAL::$id_rodz_trans] = $_POST['transakcja_nier_id'];
                if (isset($_POST['osoba_id']))
                {
                     $tabParametr[NieruchomoscDAL::$id_osoba] = $_POST['osoba_id'];
                                   
                }
                $tabParametr[NieruchomoscDAL::$podpis] = false;
                if (isset($_POST['podpis_cena']))
                {
                    $tabParametr[NieruchomoscDAL::$podpis] = true;    
                }
                $wynik = $nieruchomoscDal->DodajOferta($tabParametr);
                
                if (isset($wynik[NieruchomoscDAL::$id_oferta]))
                {
                    if ($wynik[NieruchomoscDAL::$id_oferta] != null)
                    {
                        //wysmerfowac ta operacje (?)
                        echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_powiodla_sie).'.<br/>';
                    }
                }
                
                $paramNier = unserialize($_SESSION[$param_nier.$_POST[NieruchomoscDAL::$id_oferta]]); 
                
                //wczytanie kolekcji parametrow nieruchomosci dla wszystkich sekcji
                $kolPar = $paramNier->KolekcjaParametrow();
                //wczytanie sekcji - sprawdzanie odbedzie sie z podzialem na sekcje :P
                $sekcje = $paramNier->PodajSekcje();
                //obiekt dala do podawaniaparametrow nieruchomosci
                $dal = new WyposazenieNierDAL(null, $_POST[NieruchomoscDAL::$id_nieruchomosc]);
                foreach ($sekcje as $klucz => $wartosc)
                {
                    if(isset($kolPar[$klucz]))
                    {
                        $kol = $kolPar[$klucz]->PodajKolekcje();
                        foreach($kol as $kluczElKol => $wartElKol)
                        {
                            if (isset($_POST[$wartElKol->tag]))
                            {
                                //przy edycji tutaj else i ewentualne kasowanie :P
                                if (strlen($_POST[$wartElKol->tag]) > 0)
                                {
                                    $wynik = $dal->DodajParametrNier(true, $wartElKol->id, $_POST[$wartElKol->tag]);
                                    /*if ($wynik)
                                    {
                                        echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$dodano).' : '.$wartElKol->nazwa.'.<br />';
                                    } */
                                }
                                else
                                {
                                    $wynik = $dal->DodajParametrNier(false, $wartElKol->id);
                                    /*if ($wynik)
                                    {
                                        echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$usunieto).' : '.$wartElKol->nazwa.'.<br />';
                                    } */
                                }
                            }
                        }
                    }
                }
                //sprawdzic statusy i ewentualnie inne warunki przed publikacja
                if (isset($_POST['pokaz']))
                {
                    //dodatkowo update oferty
                    $dal = new NieruchomoscDAL();
                    $res = $dal->OfertaPublikuj($_POST[NieruchomoscDAL::$id_oferta]);
                }
                else
                {
                    $dal = new NieruchomoscDAL();
                    $res = $dal->OfertaSchowaj($_POST[NieruchomoscDAL::$id_oferta]);
                }
                ///dac do hiddena status i robic zmiany, esli status sie zmienil
                
                if (($_POST['status_id'] == $status_aktualny || $_POST['status_id'] == $status_umowiony) && (isset($_POST['pokaz']) || isset($_POST['portal'])))
                {

                    if (isset($_POST['portal']))
                    {
                        exec("php asyn_publikuj_oferta.php ".$_POST[NieruchomoscDAL::$id_oferta]." true > /dev/null &");
                    }
                    else
                    {
                        if (isset($_POST['pokaz']) && $_POST['pokaz_pop_stan_hid'] == '')
                        {
                            exec("php asyn_publikuj_oferta.php ".$_POST[NieruchomoscDAL::$id_oferta]." > /dev/null &");
                        }
                    }
                }
                //status_bierzacy_id
                //jesli status jest zawieszony lub nieaktualny oraz status sie zmienil
                if (($_POST['status_id'] == $status_nieaktualny || $_POST['status_id'] == $status_zawieszony) && ($_POST['status_bierzacy_id'] != $_POST['status_id']))
                {
                    ///przed usuwaniem czegokolwiek trzeba sie upewnic ze jest cos do usuwania
                    $otodom = new OtoDomSupport(); //rezultat chwilowo wykomentowany bo na testowym sie sypie, docelowo odkomentowac
                    $rezultat = $otodom->DeactivateOffer($_POST[NieruchomoscDAL::$id_oferta]);
                    
                    //ewentualnie ziterpretowac rezultat
                    //dodac wywolania deaktywacyjne pozostalych portali
                    $domiporta = new Domiporta();
                    //tymczasowe komentowanie, docelowo to ma funkcjonowac
                    $domiporta->UsunOferta($_POST[NieruchomoscDAL::$id_oferta]);
                    
                    //mail z informacja do agentow ze oferta uzyskala status zawieszonej lub nieaktualnej
                    if (($_POST['status_id'] == $status_nieaktualny || $_POST['status_id'] == $status_zawieszony))
                    {
                        $mail = new MailSend();
                        $mail->DodajOdbiorca('azgwarancja@azg.pl'); //informatyk@azg.pl //azgwarancja@azg.pl
                        $mail->WyslijMail('Oferta '.$_POST['oferta_id'].' '.$_POST['status'].'.', 'Agent: '.$agent_zal->nazwa.', data: '.$data_dzienna.'.', 'text/html');
                    }
                    if ($_POST['status_id'] == $status_nieaktualny)
                    {
                        //formularz dodania info co stalo sie z oferta
                        echo '<form method="POST" action="oferta_nieaktualna.php">';
                        KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_oferta, NieruchomoscDAL::$id_oferta, $_POST[NieruchomoscDAL::$id_oferta]);
                        echo '<table><tr><td>';
                        echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$cena);
                        echo '</td><td>';
                        KontrolkiHtml::DodajLiczbaWymiernaTextbox('cena', 'id_cena', '', 15, 10, '');
                        echo '</td></tr><tr><td colspan="2">';
                        //checkbox
                        KontrolkiHtml::DodajCheckbox('sprzedane', 'id_sprzedane', true, $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$sprzedano), '', 'sprzedane');
                        echo '</td></tr><tr><td colspan="2">';
                        //2 checkbox
                        KontrolkiHtml::DodajCheckbox('transakcja_azg', 'id_transakcja_azg', true, $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$transakcja_zrealizowana_przez_azg), '', 'transakcja');
                        echo '</td></tr><tr><td colspan="2">';
                        KontrolkiHtml::DodajSubmit('zatwierdz_nieaktualna', 'id_zatwierdz', $tlumaczenia->Tlumacz ($_SESSION[$jezyk], tags::$zatwierdz).'.', '');
                        echo '</td></tr></table></form>';
                    }
                }
                if (($_POST['status_bierzacy_id'] == $_POST['status_id']) || (($_POST['status_bierzacy_id'] != $_POST['status_id']) && $_POST['status_id'] != $status_nieaktualny))
                {
                    KontrolkiHtml::DodajSubmit('ok', 'id_ok', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zakoncz), 'onclick="window.close();"'); 
                }
                //echo '<br />';
                //kasowanie sesji w celu zapobiegniecia ewentualnym bledom
                
                unset($_SESSION[$param_nier.$_POST[NieruchomoscDAL::$id_oferta]]);
            }
            if (isset($_POST['edycja']) && isset($_POST['oferta_id']))
            {
                $_POST[NieruchomoscDAL::$id_oferta] = $_POST['oferta_id'];
                $czas_przekazania = array(
                array('id' => 0, 'nazwa' => '0'), 
                array('id' => 1, 'nazwa' => '1'),
                array('id' => 2, 'nazwa' => '2'),
                array('id' => 3, 'nazwa' => '3'),
                array('id' => 4, 'nazwa' => '4'),
                array('id' => 5, 'nazwa' => '5'),
                array('id' => 6, 'nazwa' => '6'),
                array('id' => 7, 'nazwa' => '7'),
                array('id' => 8, 'nazwa' => '8'),
                array('id' => 9, 'nazwa' => '9'),
                array('id' => 10, 'nazwa' => '10'),
                array('id' => 11, 'nazwa' => '11'),
                array('id' => 12, 'nazwa' => '12'));
                //$nieruchomoscDal = new NieruchomoscDAL();
                //region edycji oferty bazowo - mod 18.03
                //przypisanie id oferty do tablicy bedacej parametrem metody podajacej dane nieruchomosci do edycji
                $tabParametr[NieruchomoscDAL::$id_oferta] = $_POST[NieruchomoscDAL::$id_oferta];
                //wywolanie metody pobierajacej z bazy danych nieruchomosc przy pomocy id oferty
                $wynik = $nieruchomoscDal->EdycjaOferta($tabParametr, $iloscWierszy);
                echo '<form action= "'.$_SERVER['PHP_SELF'].'" method= "POST" name="edycja_oferta">';
                //sprawdzenie czy cos zostalo pobrane (przy naglym padnieciu bazy moze nic nie przyjsc, ewentualnie procedura lezy z niewiadomych powodow)
                if($iloscWierszy == 1)
                {
                    //jesli zostal zwrocony 1 wiersz (zawsze bedzie 1 lub 0), przepisujemy wiersz 0 do nowej zmiennej
                    $wiersz = $wynik[0];
                    KontrolkiHtml::DodajHidden('status_bierzacy_id', 'status_bierzacy_id', $wiersz[NieruchomoscDAL::$id_status]);
                    $nieruchomosc_id = $wiersz[NieruchomoscDAL::$id_nieruchomosc];
                    
                    UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$edycja_oferty));
                    UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$numer_oferty).' :'.$_POST[NieruchomoscDAL::$id_oferta]);
                    
                    //KontrolkiHtml::DodajHidden('oferta_id', 'oferta_id', $_SESSION[NieruchomoscDAL::$id_oferta]);
                    //KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_nieruchomosc, NieruchomoscDAL::$id_nieruchomosc, $_SESSION[NieruchomoscDAL::$id_nieruchomosc]);
                    
                    echo '<table><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$agent).' :</td><td><b>'.$wiersz[NieruchomoscDAL::$agent].'</b></td></tr></table>';
                    //dodanie przycisku do utworzenia nowego okna w ktorym odbywac sie bedzie zarzadzanie klientem
                    //przez parametr get przy wywolaniu pliku edycja_klient.php podajemy id_klienta by moc pobrac go z bazy zaprezentowac i przetwarzac
                    //sama nazwa paratemtry get jest brana ze statycznych zmiennych zdefiniowaqnych w klasie dala ze wzgledu na lepsze panowanie na nazwa zmiennej 
                    //, latwiejszy dostep do niej, porzadek itd itd
                    //tego klienta bym stad wysmerfowal
                    //KontrolkiHtml::DodajPopUpButton($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$klient),'klient', 'popup/edycja_klient.php?'.NieruchomoscDAL::$id_klient.'='.$wiersz[NieruchomoscDAL::$id_klient], 1000, 700);
                    $tabParametr[NieruchomoscDAL::$id_nier_rodzaj] = $wiersz[NieruchomoscDAL::$id_nier_rodzaj];
                    //ta sama procedura podaje nazwy transakcji dla oferowania i poszukiwania, dl aoferty podajemy oferte
                    $tabParametr[NieruchomoscDAL::$of_zap] = tags::$oferta;
                    
                    $iloscWierszySzczegNieruch = 0;
                    $szczegolyNier = $nieruchomoscDal->SzczegolyNieruchomosc($tabParametr, $iloscWierszySzczegNieruch);
                    $transakcjaNier = $nieruchomoscDal->TransakcjaNieruchomosc($tabParametr);
                    echo '<table><tr>';
                    if ($iloscWierszySzczegNieruch > 0)
                    {
                        echo '<td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$rodzaj_budynek).' :</td><td>';
                        KontrolkiHtml::DodajSelectDomWartId('nier_szczeg','id_nier_szczeg',$szczegolyNier,'nier_szczeg_id', $wiersz[NieruchomoscDAL::$id_rodz_nier_szcz], '','');
                        echo '</td>';
                    }
                    echo '<td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$rodzaj_transakcja).' :</td><td>';
                    KontrolkiHtml::DodajSelectDomWartId('transakcja_nier','id_transakcja_nier',$transakcjaNier,'transakcja_nier_id', $wiersz[NieruchomoscDAL::$id_rodz_trans], '','');
                    echo '</td><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$cena_transakcji).' :</td><td>';
                    KontrolkiHtml::DodajHidden('cena_akt', 'cena_akt', $wiersz[NieruchomoscDAL::$cena]);
                    KontrolkiHtml::DodajLiczbaCalkowitaTextbox('cena','id_cena', $wiersz[NieruchomoscDAL::$cena], 10, 10, 'onblur="PokazSchowajZmianaCena('.$wiersz[NieruchomoscDAL::$id_klient].');"', true);
                    echo '</td><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$priorytet).' :</td><td>';
                    KontrolkiHtml::DodajSelectZrodSlownik('priorytet', 'id_priorytet', SlownikDAL::$priorytet_reklama, 'priorytet_id', $wiersz[NieruchomoscDAL::$id_priorytet_reklama], '', '');
                    echo '</td></tr><tr name="zmiana_cena" id="zmiana_cena" style="display:none;"><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zmiana_cena).' :</td><td name="osoby_combo" id="osoby_combo">';
                    echo '</td><td>';
                    KontrolkiHtml::DodajCheckbox('podpis_cena', 'id_podpis_cena', true, $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podpisano), '');
                    echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$status).' :</td><td>'; 
                    KontrolkiHtml::DodajSelectZrodSlownik('status', 'id_status', SlownikDAL::$status, 'status_id',$wiersz[NieruchomoscDAL::$id_status], '', 'onchange="blur();"');
                    echo '</td><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$data_otw_zlec).'</td><td>';
                    KontrolkiHtml::DodajTextboxData('data_otw_zlec', 'id_data_otw_zlec', $wiersz[NieruchomoscDAL::$data_otw_zlecenie], 10, 10, 
                    $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podana_inf_nie_jest_data), 'SprawdzMniejszoscDaty(this, \'id_data_zam_zlec\', \''.
                    $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$data_poczatkowa_wieksza_koncowa).'\');', '', 'edycja_oferta');
                    echo '</td><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$data_zam_zlec).'</td><td>';
                    KontrolkiHtml::DodajTextboxDataPrzyszlosc('data_zam_zlec', 'id_data_zam_zlec', $wiersz[NieruchomoscDAL::$data_zam_zlecenie], 10, 10, 
                    $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podana_inf_nie_jest_data), 
                    $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podano_data_przeszlosc), 'SprawdzWiekszoscDaty(this, \'id_data_otw_zlec\', \''.
                    $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$data_koncowa_mniejsza_poczatkowa).'\');', '', 'edycja_oferta');
                    echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$prowizja).'</td><td>';
                    KontrolkiHtml::DodajLiczbaWymiernaTextbox('prowizja', 'id_prowizja', $wiersz[NieruchomoscDAL::$prowizja], 6, 6, 'onblur="SprawdzZaznaczenieDlaProwizji(this, \'id_prowizja_proc\');"', true);
                    echo '</td><td>';
                    KontrolkiHtml::DodajCheckbox('prowizja_proc', 'id_prowizja_proc', $wiersz[NieruchomoscDAL::$prow_proc], $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$prowizja_proc), 
                    'onclick="return SprawdzWysokoscProwizji(this, \'id_prowizja\', \''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podana_prow_wyd_sie_liczba)
                    .'\', \''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podana_prow_wyd_sie_proc).'\');"');
                    echo '</td><td>';
                    KontrolkiHtml::DodajCheckbox('wylacznosc', 'id_wylacznosc', $wiersz[NieruchomoscDAL::$wylacznosc], $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wylacznosc), '');
                    echo '</td><td>';
                    KontrolkiHtml::DodajCheckbox('rynek', 'id_rynek', $wiersz[NieruchomoscDAL::$rynek], $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$rynek_pierwotny), '');
                    echo '</td><td>';
                    KontrolkiHtml::DodajCheckbox('klucze', 'id_klucze', $wiersz[NieruchomoscDAL::$klucz], $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$klucze_w_biurze), '');
                    echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$miejscowosc).' :</td><td>';
                    KontrolkiHtml::DodajPrzeszukiwanieKontrolka($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wybierz), 'wybierz', NieruchomoscDAL::$region, $wiersz[NieruchomoscDAL::$miejscowosc], NieruchomoscDAL::$id_region_geog, $wiersz[NieruchomoscDAL::$id_region_geog], 'popup/wybor_region_geog.php?txt='.NieruchomoscDAL::$region.'&hid='.NieruchomoscDAL::$id_region_geog, $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$miejscowosc));
                    echo '</td><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$lokalizacja_internet).' :</td><td>';
                    KontrolkiHtml::DodajTextbox('ulica_net', 'id_ulica_net', $wiersz[NieruchomoscDAL::$ulica_net], 50, 25, '');
                    echo '</td><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$kod_pocztowy).' :</td><td>';
                    KontrolkiHtml::DodajKodPocztowyTextbox('kod', 'id_kod', $wiersz[NieruchomoscDAL::$kod], 6, 6, '', '');
                    echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$czas_przekazania_m).':</td><td>';
                    KontrolkiHtml::DodajSelectDomWartId('czas_przekazania', 'id_czas_przekazania', $czas_przekazania, 'czas_przekazania_id', $wiersz[NieruchomoscDAL::$czas_przekazania], '', '');
                    echo '</td><td colspan="2">';
                    KontrolkiHtml::DodajCheckbox('czas_od_otwarcia', 'id_czas_od_otwarcia', $wiersz[NieruchomoscDAL::$przek_od_otwarcia], $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$czas_liczony_od_otwarcia), '');
                    echo '</td></tr><tr><td>';
                    KontrolkiHtml::DodajCheckbox('', '', false, '', 'onclick=PokazUkryjLokalizacja();');
                    echo '</td></tr><tr name="listwa_ulica" id="listwa_ulica" style="display: none;"><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$ulica).' :</td><td colspan="2">';
                    KontrolkiHtml::DodajTextbox('ulica', 'id_ulica', $wiersz[NieruchomoscDAL::$ulica], 200, 50, '', true);
                    echo '</td></tr></table>';
                    //echo '</td></tr><tr><td>';
                    //KontrolkiHtml::DodajSubmit('zatwierdz', 'id_zatwierdz', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zatwierdz), '');
                
                    ///koniec bazowej modyfikacji oferty                   
                    ///edycje oferty w swietle bierzacych wymagan wypadaloby rozdzielic na 2 czesci, dane oferta - nier oraz dane szczegolowe, po ewentualnej akceptacji bierzacego interfejsu zrobic
                    
                    //ponizsza operacja juz powyzej zostala wykonana stad ponizsza linijka zakomentowana
                    //$nieruchomosc_id = $wynik[0][NieruchomoscDAL::$id_nieruchomosc];
                    $tabParametr[WyposazenieNierDAL::$id_transakcja] = $wynik[0][NieruchomoscDAL::$id_rodz_trans];
                    $tabParametr[WyposazenieNierDAL::$id_nieruchomosc] = $wynik[0][NieruchomoscDAL::$id_nier_rodzaj];
                    $klient_id = $wynik[0][NieruchomoscDAL::$id_klient];
                    
                    $paramNier = new WyposazenieNierBLL($tabParametr, $nieruchomosc_id, $wynik);
                    $_SESSION[$param_nier.$_POST[NieruchomoscDAL::$id_oferta]] = serialize($paramNier);
                    
                    echo '<hr /><table><tr><td>';
                    //KontrolkiHtml::DodajPopUpButton($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$oferta), 'oferta', 'edycja_oferty.php?'.NieruchomoscDAL::$id_oferta.'='.
                    //$_SESSION[NieruchomoscDAL::$id_oferta], 900, 350);
                    //echo '</td><td>';
                    KontrolkiHtml::DodajPopUpButton($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$klient),'klient', 'edycja_osoba_klient.php?'.KlientDAL::$id_klient.'='.
                    $klient_id.'&'.NieruchomoscDAL::$id_oferta.'='.$_POST[NieruchomoscDAL::$id_oferta], 1000, 750);
                    echo '</td><td>';
                    KontrolkiHtml::DodajPopUpButton($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wlasciciele), 'wlasciciele', 'popup/wlasciciele.php?'.NieruchomoscDAL::$id_nieruchomosc.'='.
                    $nieruchomosc_id, 700, 350);
                    echo '</td><td>';                
                    KontrolkiHtml::DodajPopUpButton($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$pokaz_skojarzenia), 'pokaz_skojarzenia', 
                    'popup/skoj_zap_standard.php?'.NieruchomoscDAL::$id_oferta.'='.$_POST[NieruchomoscDAL::$id_oferta], 1000, 750);
                    echo '</td><td>';                
                    KontrolkiHtml::DodajPopUpButton($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$notatka_wewnetrzna_do_nieruchomosci), 'notatka', 
                    'popup/opis_nieruchomosc.php?'.NieruchomoscDAL::$id_nieruchomosc.'='.$nieruchomosc_id, 900, 750);
                     echo '</td><td>';                
                    KontrolkiHtml::DodajPopUpButton($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$opis_oferty), 'opis_oferta', 
                    'popup/opisy_oferta.php?'.NieruchomoscDAL::$id_oferta.'='.$_POST[NieruchomoscDAL::$id_oferta], 900, 750);
                    echo '</td><td>';
                    KontrolkiHtml::DodajPopUpButton($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$lista_wskazan_adresowych), 'lista_wskazan', 'popup/lista_wskazan_adresowych_o.php?'.
                    NieruchomoscDAL::$id_oferta.'='.$_POST[NieruchomoscDAL::$id_oferta], 1000, 700);
                    echo '</td><td>';
                    KontrolkiHtml::DodajPopUpButton($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zmiana_cena), 'zmiana_cena', 'popup/zmiana_cena.php?'.
                    NieruchomoscDAL::$id_oferta.'='.$_POST[NieruchomoscDAL::$id_oferta], 400, 400);
                    echo '</td><td>';
                    KontrolkiHtml::DodajPopUpButton($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zmiana_status), 'zmiana_status', 'popup/zmiana_status.php?'.
                    NieruchomoscDAL::$id_oferta.'='.$_POST[NieruchomoscDAL::$id_oferta], 400, 600);
                    echo '</td><td>';
                    KontrolkiHtml::DodajPopUpButton($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zlecenia_powiadomione_mailem), 'oferty_wyslane_mailem', 'popup/zlecenia_powiadomione_mailem.php?'.
                    NieruchomoscDAL::$id_oferta.'='.$_POST[NieruchomoscDAL::$id_oferta], 500, 500);
                    echo '</td><td>';
                    ///tab parametr niewiele wczesniej jest zdefiniowane wiec 2 wykorzystane ponizej elementy powinny posiadac ta informacjê :)
                    KontrolkiHtml::DodajPopUpButton($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wskaz_oferte_zlecenie_w_mediach), 'zl_of_media', 'popup/wskaz_of_zl_media.php?'.
                    NieruchomoscDAL::$id_oferta.'='.$_POST[NieruchomoscDAL::$id_oferta].'&'.NieruchomoscDAL::$oferent.'=true&'.NieruchomoscDAL::$id_nier_rodzaj.'='.
                    $tabParametr[WyposazenieNierDAL::$id_nieruchomosc].'&'.NieruchomoscDAL::$id_trans_rodzaj.'='.$tabParametr[WyposazenieNierDAL::$id_transakcja], 700, 600);
                    echo '</td></tr></table>';
                    
                    //echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'">';
                    KontrolkiHtml::DodajHidden('oferta_id', 'oferta_id', $_POST[NieruchomoscDAL::$id_oferta]);
                    KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_nieruchomosc, NieruchomoscDAL::$id_nieruchomosc, $nieruchomosc_id);
                    
                    UtilsUI::DodajSekcja($paramNier, $_POST[NieruchomoscDAL::$id_oferta], true, array(NieruchomoscDAL::$id_nieruchomosc => $nieruchomosc_id));
                    //tutaj przycisk
                    echo '<hr />';
                    echo '<table><tr><td>';
                    KontrolkiHtml::DodajPopUpButton($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zdjecia), 'zdjecia', 'popup/zdjecia.php?'.NieruchomoscDAL::$id_nieruchomosc.'='.
                    $nieruchomosc_id.'&'.NieruchomoscDAL::$id_oferta.'='.$_POST[NieruchomoscDAL::$id_oferta], 500, 500);
                    echo '</td><td>';
                    KontrolkiHtml::DodajPopUpButton($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$filmy), 'filmy', 'popup/filmy.php?'.NieruchomoscDAL::$id_nieruchomosc.'='.
                    $nieruchomosc_id.'&'.NieruchomoscDAL::$id_oferta.'='.$_POST[NieruchomoscDAL::$id_oferta], 500, 500);
                    echo '</td></tr></table>';
                    echo '<hr />';
                    //echo '</td><td>';
                    KontrolkiHtml::DodajCheckbox('pokaz', 'id_pokaz', $wiersz[NieruchomoscDAL::$pokaz], $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$pokaz_na_stronie), '');
                    $on = '';
                    if ($wiersz[NieruchomoscDAL::$pokaz])
                    {
                        $on = 'on';
                    }
                    KontrolkiHtml::DodajHidden('pokaz_pop_stan_hid', 'pokaz_pop_stan_hid', $on);
                    KontrolkiHtml::DodajCheckbox('portal', 'id_portal', false, $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$opublikuj_w_portalach), '');
                    echo '<br />';
                    $tabPodpowiedzi = 'Array(\''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$cena).'\', \''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$prowizja).'\', \''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$ulica).'\')';
                    echo '<div id="notatka_wymuszenie" name="notatka_wymuszenie" style="display: none;"><iframe width="400" height="300" frameborder="0" src="popup/opis_deaktualizacja.php?'.NieruchomoscDAL::$id_nieruchomosc.'='.$nieruchomosc_id.'"></iframe></div>';
                    echo '<div id="przycisk_zatwierdz" name="przycisk_zatwierdz">';
                    KontrolkiHtml::DodajSubmit('zatwierdz', 'id_zatwierdz', $tlumaczenia->Tlumacz ($_SESSION[$jezyk], tags::$zatwierdz).'.', 
                    'onmouseover="return PokazOknoOpis(status_id.value, status_bierzacy_id.value);" onclick="return WalidacjaFormularz(Array(cena, prowizja, ulica), '.$tabPodpowiedzi.', \''.
                    $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$brak).' : \');"');
                    echo '</div>';
                    //KontrolkiHtml::DodajSubmit('zatwierdz_oferta', 'id_zatwierdz', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zatwierdz), 'onclick="return WalidacjaFormularz(Array(cena, prowizja, ulica), '.$tabPodpowiedzi.', \''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$brak).' : \');"');
                    echo '</form>';
                }
            }
        }
    }
    require('../stopka.php');

?>
</body>
</html>
