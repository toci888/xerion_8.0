<?php 
    include_once ('../ui/xajax.php');
?>
<HTML>
<HEAD>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <script language="javascript" src="../js/script.js"></script>
<link href="../css/style.css" rel="stylesheet" type="text/css">
<?php $xajax->printJavascript("../lib/xajax/"); ?>
</head>
<body>
<?php
    // ¶ ±
    session_start();
    include_once ('../dal/queriesDAL.php');
    include_once ('../ui/kontrolki_html.php'); 
    include_once ('../bll/tags.php'); 
    include_once ('../bll/agentbll.php');
    include_once ('../bll/jezykibll.php');
    include_once ('../bll/cache.php');
    include_once ('../ui/utilsui.php');
    include_once ('../bll/transnierbll.php'); 
    require('../naglowek.php');
    require('../conf.php');
    if (!isset($_SESSION[$zalogowany]))
    {
        echo 'Nie jesteÅ› zalogowany.';
    }
    else
    {
        $zapotrzebowanie_id = null;
        if (isset($_POST['zapotrzebowanie_id']))
        {
            $zapotrzebowanie_id = $_POST['zapotrzebowanie_id'];
        }
        
        if ($_SERVER['REQUEST_METHOD'] == 'POST' && $zapotrzebowanie_id != null)
        {
            //pobranie tlumaczen z cache
            $tlumaczenia = cachejezyki::Czytaj();
            //utworzenie obiektu do komunikacji z baza danych w kontekscier nieruchomosci
            $nieruchomoscDal = new NieruchomoscDAL();
            $agent_zal = unserialize($_SESSION[$dane_agent]);
            
            //$obiektTrans = unserialize($_SESSION[$nier_trans]);
            $obiektTrans = new TransNierDAL();
            $tabNieruchomosc = $obiektTrans->PodajListeNieruchomosci($ilosc_wierszy);
            
            if (isset($_POST['zatwierdz']))
            {
                $tabParametr[NieruchomoscDAL::$id_zapotrzebowanie] = $zapotrzebowanie_id;
                $tabParametr[NieruchomoscDAL::$data_zam_zlecenie] = $_POST['data_zam_zlec'];
                //$tabParametr[NieruchomoscDAL::$prowizja] = $_POST['prowizja'];
                $tabParametr[NieruchomoscDAL::$agent] = (int)$agent_zal->id;
                
                /*if (isset($_POST['prowizja_proc']))
                {
                    $tabParametr[NieruchomoscDAL::$prow_proc] = true;
                }
                else
                {
                    $tabParametr[NieruchomoscDAL::$prow_proc] = false;
                } */

                $wybNier = null;
                foreach ($tabNieruchomosc as $wiersz)
                {
                    if (isset($_POST['nieruchomosc'.$wiersz['id']]))
                    {
                        $wybNier[$wiersz['id']] = $wiersz['id'];
                    }
                }
                if (is_array($wybNier))
                {
                    $tabParametr[NieruchomoscDAL::$nieruchomosc_rodzaj] = UtilsDAL::TabPhp2TabPg($wybNier, false, $tabParametr[NieruchomoscDAL::$nieruchomosc_rodzaj]);
                }
                //var_dump($tabParametr[NieruchomoscDAL::$nieruchomosc_rodzaj]);

                $wynik = $nieruchomoscDal->DodajZapotrzebowanie($tabParametr);

                if (isset($wynik[0]))
                {
                    if ($wynik[0] != null)
                    {
                        //pytanie czy pchac to do sesji to raz, czy malowac nowy plik z formularzem to 2
                        //lepiej dac to do nowego pliku zeby nie bylo sajgonu
                        //dodatkowo przez get zlamanie jednego parametru (oprocz ustawienia sesji) celem zabezpieczenia wlasciwego wywolania pliku
                        header('Location: dodanie_trans_zap.php?'.NieruchomoscDAL::$id_zapotrzebowanie.'='.$_POST['zapotrzebowanie_id'].'&'.KlientDAL::$id_klient.'='.$_POST[KlientDAL::$id_klient]); //ewentualnie wynik od 0
                    }
                }
            }
            if (isset($_POST['edycja']))
            {
                //przypisanie id oferty do tablicy bedacej parametrem metody podajacej dane nieruchomosci do edycji
                $tabParametr[NieruchomoscDAL::$id_zapotrzebowanie] = $_POST['zapotrzebowanie_id'];
                //wywolanie metody pobierajacej z bazy danych nieruchomosc przy pomocy id oferty
                $wynik = $nieruchomoscDal->EdycjaZapotrzebowanie($tabParametr, $iloscWierszy);
                
                //sprawdzenie czy cos zostalo pobrane (przy naglym padnieciu bazy moze nic nie przyjsc, ewentualnie procedura lezy z niewiadomych powodow)
                if($iloscWierszy == 1)
                {
                    //$_SESSION[$wynik_ed_zap] = serialize($wynik);
                    //jesli zostal zwrocony 1 wiersz (zawsze bedzie 1 lub 0), przepisujemy wiersz 0 do nowej zmiennej
                    $wiersz = $wynik[0];
                    //przeczyszczenie tablicy parametrow - niekonieczne, ale mozna zrobic
                    //$tabParametr = array();
                    //$tabParametr[WyposazenieZapDAL::$id_zapotrzebowanie] = $wiersz[NieruchomoscDAL::$id_nier_rodzaj];//$_SESSION[$wyb_param_nowa_oferta][WyposazenieNierDAL::$id_nieruchomosc];
                    //podanie rodzaju transakcji
                    //$tabParametr[WyposazenieZapDAL::$id_transakcja] = $wiersz[NieruchomoscDAL::$id_rodz_trans];//$_SESSION[$wyb_param_nowa_oferta][WyposazenieNierDAL::$id_transakcja];
                    //$_SESSION[$wyb_param_nowa_oferta] = $tabParametr;
                    
                    UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$numer_zapotrzebowania).' :'.$_POST['zapotrzebowanie_id']);
                    //$zapotrzebowanie_id = $_POST['zapotrzebowanie_id'];
                    echo '<form action= "'.$_SERVER['PHP_SELF'].'" method= "POST" name="edycja_zapotrzebowanie">';
                    KontrolkiHtml::DodajHidden('zapotrzebowanie_id', 'zapotrzebowanie_id', $_POST['zapotrzebowanie_id']);
                    KontrolkiHtml::DodajHidden(KlientDAL::$id_klient, KlientDAL::$id_klient, $wiersz[KlientDAL::$id_klient]);
                    echo '<table><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$agent).' :</td><td><b>'.$wiersz[NieruchomoscDAL::$agent].'</b></td></tr></table>';   
                    //$tabParametr[NieruchomoscDAL::$id_nier_rodzaj] = $wiersz[NieruchomoscDAL::$id_nier_rodzaj];
                    //$tabParametr[NieruchomoscDAL::$of_zap] = $_SESSION[$posiada_poszukuje];

                    //$transakcjaNier = $nieruchomoscDal->TransakcjaNieruchomosc($tabParametr);
                    echo '<table><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$data_otw_zlec).'</td><td>';
                    KontrolkiHtml::DodajTextboxData('data_otw_zlec', 'id_data_otw_zlec', $wiersz[NieruchomoscDAL::$data_otw_zlecenie], 10, 10, 
                    $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podana_inf_nie_jest_data), 'SprawdzMniejszoscDaty(this, \'id_data_zam_zlec\', \''.
                    $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$data_poczatkowa_wieksza_koncowa).'\');', 'disabled', 'edycja_zapotrzebowanie', '');
                    echo '</td><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$data_zam_zlec).'</td><td>';
                    KontrolkiHtml::DodajTextboxDataPrzyszlosc('data_zam_zlec', 'id_data_zam_zlec', $wiersz[NieruchomoscDAL::$data_zam_zlecenie], 10, 10, 
                    $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podana_inf_nie_jest_data), 
                    $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podano_data_przeszlosc), 'SprawdzWiekszoscDaty(this, \'id_data_otw_zlec\', \''.
                    $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$data_koncowa_mniejsza_poczatkowa).'\');', '', 'edycja_zapotrzebowanie', '');
                    //echo '</td><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$prowizja).'</td><td>';
                    //KontrolkiHtml::DodajLiczbaWymiernaTextbox('prowizja', 'id_prowizja', $wiersz[NieruchomoscDAL::$prowizja], 6, 6, 'onblur="SprawdzZaznaczenieDlaProwizji(this, \'id_prowizja_proc\');"');
                    //echo '</td><td>';
                    //KontrolkiHtml::DodajCheckbox('prowizja_proc', 'id_prowizja_proc', $wiersz[NieruchomoscDAL::$prow_proc], $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$prowizja_proc), 
                    //'onclick="return SprawdzWysokoscProwizji(this, \'id_prowizja\', \''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podana_prow_wyd_sie_liczba)
                    //.'\', \''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podana_prow_wyd_sie_proc).'\');"');
                    
                    echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$poszukiwane_nieruchomosci).' :</td></tr></table><table><tr>';
                    
                    foreach ($tabNieruchomosc as $wierszNier)
                    {
                        $readonly = '';
                        $checked = false;
                        if (isset($wiersz[NieruchomoscDAL::$id_nier_rodzaj][$wierszNier['id']]))
                        {
                            $readonly = 'disabled';
                            $checked = true;
                        }
                        echo '<td>';
                        KontrolkiHtml::DodajCheckbox('nieruchomosc'.$wierszNier['id'], $wierszNier['id'], $checked, $tlumaczenia->Tlumacz($_SESSION[$jezyk], $wierszNier['nazwa']), $readonly);
                        echo '</td>';
                    }
                    
                    echo '</td></tr><tr><td>';
                    KontrolkiHtml::DodajSubmit('zatwierdz', 'id_zatwierdz', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zatwierdz), '');
                    echo '</td></tr></table></form>';
                }
            }
        }
    }
    require('../stopka.php');

    
?>
</body>
</html>
