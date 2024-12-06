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
        $zapotrzebowanie_id = null;        
        $nieruchomoscDal = new NieruchomoscDAL();
        
        if (isset($_GET[KlientDAL::$id_klient]))
        {
            $klient_id = $_GET[KlientDAL::$id_klient];
        }
        if (isset($_POST[KlientDAL::$id_klient]))
        {
            $klient_id = $_POST[KlientDAL::$id_klient];
        }
        if (isset($_GET[NieruchomoscDAL::$id_zapotrzebowanie]))
        {
            $zapotrzebowanie_id = $_GET[NieruchomoscDAL::$id_zapotrzebowanie];
        }
        if (isset($_POST['zapotrzebowanie_id']))
        {
            $zapotrzebowanie_id = $_POST['zapotrzebowanie_id'];
        }
        if ($zapotrzebowanie_id != null)
        {
            //zmodyfikowano 04.03.2008
            if (isset($_POST['kasuj_prow']))
            {
                $tabParametr[NieruchomoscDAL::$id_prow_zap] = $_POST['prowizja_zapotrzebowanie_id'];
                $wynik = $nieruchomoscDal->UsunProwDlaTrans($tabParametr);
                if (!$wynik)
                {
                    UtilsUI::InfoBlad($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_nie_powiodla_sie));
                }
            }
            if (isset($_POST['aktualizuj_prow']))
            {
                if (strlen($_POST['prowizja'.$_POST['prowizja_zapotrzebowanie_id']]) < 1)
                {
                    $_POST['prowizja'.$_POST['prowizja_zapotrzebowanie_id']] = 0;
                }
                $tabParametr[NieruchomoscDAL::$id_prow_zap] = $_POST['prowizja_zapotrzebowanie_id'];
                $tabParametr[NieruchomoscDAL::$prowizja] = $_POST['prowizja'.$_POST['prowizja_zapotrzebowanie_id']];
                $tabParametr[NieruchomoscDAL::$id_sposob_finansowania] = $_POST['sposob_finansowania_id'.$_POST['prowizja_zapotrzebowanie_id']];
                $tabParametr[NieruchomoscDAL::$poszukiwane_dla] = $_POST['szuka_dla'.$_POST['prowizja_zapotrzebowanie_id']];
                if(isset($_POST['prowizja_proc'.$_POST['prowizja_zapotrzebowanie_id']]))
                {
                    $tabParametr[NieruchomoscDAL::$prow_proc] =  $_POST['prowizja_proc'.$_POST['prowizja_zapotrzebowanie_id']];   
                }
                
                $wynik = $nieruchomoscDal->DodajProwDlaTrans($tabParametr);
                if (!$wynik)
                {
                    UtilsUI::InfoBlad($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_nie_powiodla_sie));
                }
            }
            if (isset($_POST['dodaj_prow']))
            {
                if (strlen($_POST['prowizja'.$_POST['trans_id']]) < 1)
                {
                    $_POST['prowizja'.$_POST['trans_id']] = 0;
                }
                $tabParametr[NieruchomoscDAL::$id_zapotrzebowanie] = $zapotrzebowanie_id;
                $tabParametr[NieruchomoscDAL::$id_rodz_trans] = $_POST['trans_id'];
                $tabParametr[NieruchomoscDAL::$prowizja] = $_POST['prowizja'.$_POST['trans_id']];
                $tabParametr[NieruchomoscDAL::$id_sposob_finansowania] = $_POST['sposob_finansowania_id'.$_POST['trans_id']];
                $tabParametr[NieruchomoscDAL::$poszukiwane_dla] = $_POST['szuka_dla'.$_POST['trans_id']];
                
                if(isset($_POST['prowizja_proc'.$_POST['trans_id']]))
                {
                    $tabParametr[NieruchomoscDAL::$prow_proc] =  $_POST['prowizja_proc'.$_POST['trans_id']];   
                }
                
                $wynik = $nieruchomoscDal->DodajProwDlaTrans($tabParametr);
                if (!$wynik)
                {
                    UtilsUI::InfoBlad($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_nie_powiodla_sie));
                }
            }
            //koniec mod 4.03
            
            if (isset($_POST['zatwierdz_ed']))
            {
                $tabParametr[NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj] = $_POST['trans_nier_ed_id'];
                $tabParametr[NieruchomoscDAL::$id_status] = $_POST['status_ed_id'];
                $tabParametr[NieruchomoscDAL::$cena] = $_POST['cena_ed'];
                $tabParametr[NieruchomoscDAL::$pokaz] = 'false';
                $tabParametr[NieruchomoscDAL::$id_agent] = $agent_zal->id;
                if (isset($_POST['pokaz_ed']))
                {
                    $tabParametr[NieruchomoscDAL::$pokaz] = 'true';
                }
                if (strlen($_POST['cena_ed']) > 0)
                {
                    $wynik = $nieruchomoscDal->DodajTransNierZapotrzebowanie($tabParametr);
                }
                else
                {
                    $wynik = false;
                }
                
                if (!$wynik)
                {
                    UtilsUI::InfoBlad($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_nie_powiodla_sie));
                }
            }   
            
            if (isset($_POST['kasowanie']))
            {
                $wynik = $nieruchomoscDal->UsunTransNierZapotrzebowanie(array(NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj => $_POST['trans_rodzaj_id']));
                if (!$wynik)
                {
                    UtilsUI::InfoBlad($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_nie_powiodla_sie));
                }
            }
            if (isset($_POST['zatwierdz']))
            {
                //formularz jest spory i zawiera takie same kontrolki w kazdym wierszu; zeby je rozroznic do jednego niezaleznego hiddena
                //zapisane jest id kliknietego przycisku, kontrolki maja nazwy zakonczone tym id, w zwiazku z czym mozemy trafic w
                //kontrolki, ktore zostaly zatwierdzone
                $tabParametr[NieruchomoscDAL::$id_zapotrzebowanie_nier_rodzaj] = $_POST['zapotrzebowanie_nier_rodzaj_id'];
                $tabParametr[NieruchomoscDAL::$id_rodz_trans] = $_POST['trans_id'.$_POST['zapotrzebowanie_nier_rodzaj_id']];
                $tabParametr[NieruchomoscDAL::$id_status] = $_POST['status_id'.$_POST['zapotrzebowanie_nier_rodzaj_id']];
                $tabParametr[NieruchomoscDAL::$cena] = $_POST['cena'.$_POST['zapotrzebowanie_nier_rodzaj_id']];
                $tabParametr[NieruchomoscDAL::$id_agent] = $agent_zal->id;
                $tabParametr[NieruchomoscDAL::$pokaz] = 'false';
                if (isset($_POST['pokaz'.$_POST['zapotrzebowanie_nier_rodzaj_id']]))
                {
                    $tabParametr[NieruchomoscDAL::$pokaz] = 'true';
                }
                if (strlen($_POST['cena'.$_POST['zapotrzebowanie_nier_rodzaj_id']])> 0)
                {
                    $wynik = $nieruchomoscDal->DodajTransNierZapotrzebowanie($tabParametr);        
                }
                else
                {
                    $wynik = false;
                }
                
                if (!$wynik)
                {
                    UtilsUI::InfoBlad($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_nie_powiodla_sie));
                }
            } 
            if ($zapotrzebowanie_id != null)
            {                
                UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$numer_zapotrzebowania).' : '.$zapotrzebowanie_id); 
                echo '<table><tr><td>';
                    echo '<form action="edycja_zapotrzebowania.php" method="POST">';
                    KontrolkiHtml::DodajHidden('zapotrzebowanie_id', 'zapotrzebowanie_id', $zapotrzebowanie_id);
                    KontrolkiHtml::DodajSubmit('edycja', 'id_edycja', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$rodzaj_nieruchomosci), '');
                    echo '</form>';
                echo '</td><td valign="top">';
                //echo '<tr><td>';
                KontrolkiHtml::DodajPopUpButton($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$klient),'klient', 'edycja_osoba_klient.php?'.KlientDAL::$id_klient.'='.$klient_id.'&'.
                NieruchomoscDAL::$id_zapotrzebowanie.'='.$zapotrzebowanie_id, 1000, 700);
                echo '</td><td valign="top">';
                KontrolkiHtml::DodajPopUpButton($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$notatka_do_zapotrzebowania), 'opis_zapotrzebowania', 'popup/opis_zapotrzebowanie.php?'.
                NieruchomoscDAL::$id_zapotrzebowanie.'='.$zapotrzebowanie_id, 800, 700);
                echo '</td><td valign="top">';
                KontrolkiHtml::DodajPopUpButton($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$lista_wskazan_adresowych), 'lista_wskazan', 'popup/lista_wskazan_adresowych_z.php?'.
                NieruchomoscDAL::$id_zapotrzebowanie.'='.$zapotrzebowanie_id, 1000, 700);
                echo '</td><td valign="top">';
                KontrolkiHtml::DodajPopUpButton($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$przygotuj_liste), 'przygotuj_liste', 'popup/sporzadz_liste.php?'.
                NieruchomoscDAL::$id_zapotrzebowanie.'='.$zapotrzebowanie_id, 1000, 700);
                echo '</td><td valign="top">';
                KontrolkiHtml::DodajPopUpButton($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$oferty_wyslane_mailem), 'oferty_wyslane_mailem', 'popup/oferty_wyslane_mailem.php?'.
                NieruchomoscDAL::$id_zapotrzebowanie.'='.$zapotrzebowanie_id, 500, 500);
                /*echo '</td><td>';
                KontrolkiHtml::DodajPopUpButton($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wskaz_oferte_zlecenie_w_mediach), 'zl_of_media', 'popup/wskaz_of_zl_media.php?'.
                NieruchomoscDAL::$id_oferta.'='.$zapotrzebowanie_id.'&'.NieruchomoscDAL::$oferent.'=false&'.NieruchomoscDAL::$id_nier_rodzaj.'='.
                $tabParametr[WyposazenieNierDAL::$id_transakcja].'&'.NieruchomoscDAL::$id_trans_rodzaj.'='.$tabParametr[WyposazenieNierDAL::$id_nieruchomosc], 700, 600);*/
                echo '</td></tr></table>';
                
                ///formularz edytowania istniejacego zapotrzebowania do aktualizacji
                if (isset($_POST['edycja']) && isset($_POST['trans_rodzaj_id']))
                {
                    $wynik = $nieruchomoscDal->EdycjaTransNierZapotrzebowanie(array(NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj => $_POST['trans_rodzaj_id']));
                    UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zmiana_danych_o_transakcji_dla_poszukiwanej_nieruchomosci));
                    $wiersz = $wynik[0];
                    echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'"><table>';
                    KontrolkiHtml::DodajHidden('zapotrzebowanie_id', 'zapotrzebowanie_id', $_POST['zapotrzebowanie_id']);
                    KontrolkiHtml::DodajHidden(KlientDAL::$id_klient, KlientDAL::$id_klient, $klient_id);
                    KontrolkiHtml::DodajHidden('trans_nier_ed_id', 'trans_nier_ed_id', $_POST['trans_rodzaj_id']);
                    echo '<tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$rodzaj_nieruchomosci).'&nbsp;&nbsp;&nbsp;</td><td>';
                    echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$rodzaj_transakcja).'&nbsp;&nbsp;&nbsp;</td><td>';
                    echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$cena_transakcji).'&nbsp;&nbsp;&nbsp;</td><td>';
                    echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$status).'&nbsp;&nbsp;&nbsp;</td></tr><tr><td>';
                    
                    echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], $wiersz[NieruchomoscDAL::$nieruchomosc_rodzaj]);
                    echo '</td><td>';
                    echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], $wiersz[NieruchomoscDAL::$transakcja_rodzaj]);
                    echo '</td><td>';
                    KontrolkiHtml::DodajLiczbaCalkowitaTextbox('cena_ed','id_cena', $wiersz[NieruchomoscDAL::$cena], 10, 10, '');
                    echo '</td><td>';
                    KontrolkiHtml::DodajSelectZrodSlownik('status', 'id_status', SlownikDAL::$status, 'status_ed_id', $wiersz[NieruchomoscDAL::$id_status], '', '');
                    echo '</td><td>';
                    KontrolkiHtml::DodajCheckbox('pokaz_ed', 'id_pokaz', $wiersz[NieruchomoscDAL::$pokaz], $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$pokaz_na_stronie), '');
                    echo '</td><td>';
                    //w onclicku przepisanie ponownie tej wartosci jest bez sensu bo ona sie nie zmieni - tylko 1 element mozna edytowac, ale co tam : moze byc :P
                    KontrolkiHtml::DodajSubmit('zatwierdz_ed', $wiersz[NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj], $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$aktualizuj), 'onclick="trans_nier_ed_id.value = this.id;"');
                    echo '</td></tr><tr><td colspan="6"><hr /></td></tr>';
                    echo '</table></form>';
                }
                else
                {
                    $wynik = $nieruchomoscDal->PodajNierZapotrzebowanie(array(NieruchomoscDAL::$id_zapotrzebowanie => $zapotrzebowanie_id));
                    //echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$dodawanie_zapotrzebowania).' :<br />';
                    UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$dodawanie_rodzaju_transakcji_dla_poszukiwanej_nieruchomosci));
                    echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'"><table>';
                    KontrolkiHtml::DodajHidden('zapotrzebowanie_id', 'zapotrzebowanie_id', $zapotrzebowanie_id);
                    KontrolkiHtml::DodajHidden(KlientDAL::$id_klient, KlientDAL::$id_klient, $klient_id);
                    KontrolkiHtml::DodajHidden('zapotrzebowanie_nier_rodzaj_id', 'zapotrzebowanie_nier_rodzaj_id', '');
                    //id w wierszu tutaj to id z zapotrzebowanie_nier_rodzaj
                    foreach ($wynik as $wiersz)
                    {
                        $trans_dost = $nieruchomoscDal->PodajTransDlaNierZapotrzebowanie(array(NieruchomoscDAL::$id_zapotrzebowanie_nier_rodzaj => $wiersz['id']), $iloscWierszy);
                        if ($iloscWierszy > 0)
                        {
                            echo '<tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$rodzaj_nieruchomosci).'&nbsp;&nbsp;&nbsp;</td><td>';
                            echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$rodzaj_transakcja).'&nbsp;&nbsp;&nbsp;</td><td>'; 
                            echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$cena_transakcji).'&nbsp;&nbsp;&nbsp;</td><td>';
                            echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$status).'&nbsp;&nbsp;&nbsp;</td></tr><tr><td>';
                            echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], $wiersz[NieruchomoscDAL::$nazwa]);
                            echo '</td><td>';
                            KontrolkiHtml::DodajSelectDomWartId('dostepne_trans', $wiersz['id'], $trans_dost, 'trans_id'.$wiersz['id'], null, '', '');
                            echo '</td><td>';
                            KontrolkiHtml::DodajLiczbaCalkowitaTextbox('cena'.$wiersz['id'],'id_cena', '', 10, 10, '');
                            echo '</td><td>';
                            KontrolkiHtml::DodajSelectZrodSlownik('status', 'id_status', SlownikDAL::$status, 'status_id'.$wiersz['id'], null, '', '');
                            echo '</td><td>';
                            KontrolkiHtml::DodajCheckbox('pokaz'.$wiersz['id'], 'id_pokaz', true, $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$pokaz_na_stronie), '');
                            echo '</td><td>';
                            KontrolkiHtml::DodajSubmit('zatwierdz', $wiersz['id'], $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$dodaj), 'onclick="zapotrzebowanie_nier_rodzaj_id.value = this.id;"');
                            echo '</td></tr><tr><td colspan="6"><hr /></td></tr>';
                        }
                    }
                    echo '</table></form>';
                    echo '<br />';
                }
                $wynik = $nieruchomoscDal->PodajTransNierZapotrzebowanie(array(NieruchomoscDAL::$id_zapotrzebowanie => $zapotrzebowanie_id), $iloscWierszy);
                ///modyfikacja 6.03
                //dodanie popupow w gridzie zamiast dopiero po zatwierdzeniu
                $popupObj = new PopUpWysw();
                //tags::$rodzaj_budynek,  tags::$rodzaj_budynek, 600, 600, 
                $popupObj->nag = array(tags::$lokalizacja, tags::$szczegoly, tags::$pokaz_skojarzenia, tags::$opis_zapotrzebowania);
                $popupObj->przyc_nazwa = array(tags::$lokalizacja, tags::$szczegoly, tags::$pokaz_skojarzenia, tags::$opis_zapotrzebowania);
                $popupObj->url = array('popup/szczegoly_lokalizacja.php?'.NieruchomoscDAL::$id_zapotrzebowanie.'='.$zapotrzebowanie_id.'&'.NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj, 
                //'popup/szczegoly_zap_rodz_b.php?'.WyposazenieZapDAL::$id_zapotrzebowanie_trans_rodzaj, 
                'popup/dodanie_zap_szcz.php?'.NieruchomoscDAL::$id_zapotrzebowanie.'='.$zapotrzebowanie_id.'&'.NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj,
                'popup/skoj_of_standard.php?'.NieruchomoscDAL::$id_zapotrzebowanie.'='.$zapotrzebowanie_id.'&'.NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj,
                'popup/opis_posz_zapotrzebowanie.php?'.NieruchomoscDAL::$id_zapotrzebowanie.'='.$zapotrzebowanie_id.'&'.NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj);
                $popupObj->szerokosc = array(700, 800, 1000, 800);
                $popupObj->dlugosc = array(500, 800, 750, 600);
                
                if ($iloscWierszy > 0)
                {
                    UtilsUI::$rekordy = $iloscWierszy;
                       
                    UtilsUI::DodajTabWyroznien($status_nieaktualny, $czerwony);
                    UtilsUI::DodajTabWyroznien($status_zawieszony, $niebieski);
                    UtilsUI::DodajTabWyroznien($status_umowiony, $zielony);
                    UtilsUI::DodajTabWyroznien($status_wstrzymany, $zolty);
                    UtilsUI::PodajIndWyroznien(NieruchomoscDAL::$id_status);
                    UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$poszukiwane_nieruchomosci));
                    echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'">';
                    KontrolkiHtml::DodajHidden('zapotrzebowanie_id', 'zapotrzebowanie_id', $zapotrzebowanie_id);
                    KontrolkiHtml::DodajHidden(KlientDAL::$id_klient, KlientDAL::$id_klient, $klient_id);
                    UtilsUI::WyswietlTab1Poz($wynik, array(NieruchomoscDAL::$nieruchomosc_rodzaj, NieruchomoscDAL::$transakcja_rodzaj, NieruchomoscDAL::$cena, NieruchomoscDAL::$status, NieruchomoscDAL::$agent), 
                    array(tags::$rodzaj_nieruchomosci, $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$rodzaj_transakcja), 
                    tags::$cena, tags::$status, tags::$agent), NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj, 
                    'trans_rodzaj_id', array(Akcja::$edycja => 1, Akcja::$kasowanie => 1), null, null, $popupObj);
                    echo '</form>';
                }
                
                ///koniec modyfikacja 6.03
                
                ///dopisane 3.03.2008 
                //pobranie prowizji zdefiniowanych dla transakcji
                $tabParametr[NieruchomoscDAL::$id_zapotrzebowanie] = $zapotrzebowanie_id;
                $wynik = $nieruchomoscDal->ListaProwDlaTrans($tabParametr, $ilosc_wierszy);

                if ($ilosc_wierszy > 0)
                {
                    //wyswietlenie prowizji juz okreslonych dla poszczegolnych transakcji
                    UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$prowizja_biura));
                    echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'"><table>';
                    KontrolkiHtml::DodajHidden('zapotrzebowanie_id','zapotrzebowanie_id', $zapotrzebowanie_id);
                    KontrolkiHtml::DodajHidden(KlientDAL::$id_klient, KlientDAL::$id_klient, $klient_id);
                    KontrolkiHtml::DodajHidden('prowizja_zapotrzebowanie_id', 'prowizja_zapotrzebowanie_id', '');
                    foreach($wynik as $wiersz)
                    {
                        echo '<tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], $wiersz[NieruchomoscDAL::$transakcja_rodzaj]).' :</td><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$prowizja).'</td><td>';
                        KontrolkiHtml::DodajLiczbaWymiernaTextbox('prowizja'.$wiersz[NieruchomoscDAL::$id_prow_zap], 'id_prowizja'.$wiersz[NieruchomoscDAL::$id_prow_zap], $wiersz[NieruchomoscDAL::$prowizja], 6, 6, 'onblur="SprawdzZaznaczenieDlaProwizji(this, \'id_prowizja_proc'.$wiersz[NieruchomoscDAL::$id_prow_zap].'\');"');
                        echo '</td><td>';
                        KontrolkiHtml::DodajCheckbox('prowizja_proc'.$wiersz[NieruchomoscDAL::$id_prow_zap], 'id_prowizja_proc'.$wiersz[NieruchomoscDAL::$id_prow_zap], $wiersz[NieruchomoscDAL::$prow_proc], $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$prowizja_proc), 
                        'onclick="return SprawdzWysokoscProwizji(this, \'id_prowizja'.$wiersz[NieruchomoscDAL::$id_prow_zap].'\', \''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podana_prow_wyd_sie_liczba)
                        .'\', \''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podana_prow_wyd_sie_proc).'\');"');
                        echo '</td><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$sposob_finansowania).':</td><td>';
                        KontrolkiHtml::DodajSelectZrodSlownik('sposob_finansowania'.$wiersz[NieruchomoscDAL::$id_prow_zap], 'id_sposob_finansowania'.$wiersz[NieruchomoscDAL::$id_prow_zap], SlownikDAL::$sposob_finansowania, 'sposob_finansowania_id'.$wiersz[NieruchomoscDAL::$id_prow_zap], $wiersz[NieruchomoscDAL::$id_sposob_finansowania], '', ''); 
                        echo '</td><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$poszukuje_dla).':</td><td>';
                        KontrolkiHtml::DodajTextbox('szuka_dla'.$wiersz[NieruchomoscDAL::$id_prow_zap], 'id_szuka_dla'.$wiersz[NieruchomoscDAL::$id_prow_zap], $wiersz[NieruchomoscDAL::$poszukiwane_dla], 20, 10, '');
                        echo '</td><td>';
                        KontrolkiHtml::DodajSubmit('aktualizuj_prow', $wiersz[NieruchomoscDAL::$id_prow_zap], $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$aktualizuj), 'onclick="prowizja_zapotrzebowanie_id.value=this.id;"');
                        echo '</td><td>';
                        KontrolkiHtml::DodajSubmit('kasuj_prow', $wiersz[NieruchomoscDAL::$id_prow_zap], $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$kasuj),'onclick="prowizja_zapotrzebowanie_id.value=this.id;"');
                        echo '</td><td>';
                        KontrolkiHtml::DodajPopUpButton($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$drukuj_umowe).' : '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], $wiersz[NieruchomoscDAL::$transakcja_rodzaj]), 'druk_umowa_kl', 
                        'popup/druk_umowa.php?'.NieruchomoscDAL::$id_zapotrzebowanie.'='.$zapotrzebowanie_id.'&'.NieruchomoscDAL::$transakcja_rodzaj.'='.
                        $wiersz[NieruchomoscDAL::$transakcja_rodzaj].'&'.NieruchomoscDAL::$prowizja.'='.$wiersz[NieruchomoscDAL::$prowizja], 1000, 700);
                        echo '</td></tr>';
                    }
                    
                    echo '</table></form>';
                }
                //koniec dopiski
                
                ///dopisane 4.03.2008
                //$ilosc_wierszy wieksza od zera to sa prawizje do wype³nienia; nie wolno wyrazic zgody na zatwierdzenie form 
                $wynik = $nieruchomoscDal->BrakujaceProwizje($tabParametr, $ilosc_wierszy);
                //var_dump($wynik);
                if ($ilosc_wierszy > 0)
                {
                    UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wprowadzanie_prowizji_biura));
                    echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'"><table>';
                    KontrolkiHtml::DodajHidden('zapotrzebowanie_id','zapotrzebowanie_id', $zapotrzebowanie_id);
                    KontrolkiHtml::DodajHidden(KlientDAL::$id_klient, KlientDAL::$id_klient, $klient_id);
                    KontrolkiHtml::DodajHidden('trans_id', 'trans_id', '');
                    foreach($wynik as $wiersz)
                    {
                        echo '<tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], $wiersz[NieruchomoscDAL::$transakcja_rodzaj]).' :</td><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$prowizja).'</td><td>';
                        KontrolkiHtml::DodajLiczbaWymiernaTextbox('prowizja'.$wiersz[NieruchomoscDAL::$id_rodz_trans], 'id_prowizja'.$wiersz[NieruchomoscDAL::$id_rodz_trans], '', 6, 6, 'onblur="SprawdzZaznaczenieDlaProwizji(this, \'id_prowizja_proc'.$wiersz[NieruchomoscDAL::$id_rodz_trans].'\');"');
                        echo '</td><td>';
                        KontrolkiHtml::DodajCheckbox('prowizja_proc'.$wiersz[NieruchomoscDAL::$id_rodz_trans], 'id_prowizja_proc'.$wiersz[NieruchomoscDAL::$id_rodz_trans], true, $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$prowizja_proc), 
                        'onclick="return SprawdzWysokoscProwizji(this, \'id_prowizja'.$wiersz[NieruchomoscDAL::$id_rodz_trans].'\', \''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podana_prow_wyd_sie_liczba)
                        .'\', \''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podana_prow_wyd_sie_proc).'\');"');
                        echo '</td><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$sposob_finansowania).':</td><td>';
                        KontrolkiHtml::DodajSelectZrodSlownik('sposob_finansowania'.$wiersz[NieruchomoscDAL::$id_rodz_trans], 'id_sposob_finansowania'.$wiersz[NieruchomoscDAL::$id_rodz_trans], SlownikDAL::$sposob_finansowania, 'sposob_finansowania_id'.$wiersz[NieruchomoscDAL::$id_rodz_trans], null, '', ''); 
                        echo '</td><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$poszukuje_dla).':</td><td>';
                        KontrolkiHtml::DodajTextbox('szuka_dla'.$wiersz[NieruchomoscDAL::$id_rodz_trans], 'id_szuka_dla'.$wiersz[NieruchomoscDAL::$id_rodz_trans], '', 20, 10, '');
                        echo '</td><td>';
                        KontrolkiHtml::DodajSubmit('dodaj_prow', $wiersz[NieruchomoscDAL::$id_rodz_trans], $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zatwierdz), 'onclick="trans_id.value=this.id;"');
                        echo '</td></tr>';
                    }
                    
                    echo '</table></form>';
                }
                ///koniec dopiski
                
                //pytanie czy od razu formularzem skierowac czy osobno robic header i chyba to 1
                if ($iloscWierszy > 0 && $ilosc_wierszy < 1) //ten zatwierdz chyba wyleci :P lub cel sie zmieni
                {
                    echo '<form method="POST" action="dodanie_trans_zap_szcz.php">';
                    KontrolkiHtml::DodajHidden('zapotrzebowanie_id', 'zapotrzebowanie_id', $zapotrzebowanie_id);
                    KontrolkiHtml::DodajHidden(KlientDAL::$id_klient, KlientDAL::$id_klient, $klient_id);
                    KontrolkiHtml::DodajSubmit('koniec', 'zatw_trans_zap_id', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zatwierdz), '');
                    //KontrolkiHtml::DodajSubmit('zatw_trans_zap', 'zatw_trans_zap_id', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zatwierdz), '');
                    echo '</form>';
                }
            }
        }
    }
    require('../stopka.php');

?>
</body>
</html>