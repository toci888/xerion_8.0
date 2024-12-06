<HTML>
<HEAD>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <script language="javascript" src="js/script.js"></script>
<link href="css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<?php
    // ¶ ±
    session_start();
    include_once ('dal/queriesDAL.php');
    include_once ('ui/kontrolki_html.php');
    include_once ('ui/utilsui.php');
    include_once ('bll/parametrynierbll.php'); 
    include_once ('bll/tags.php'); 
    include_once ('bll/agentbll.php');
    include_once ('bll/jezykibll.php');
    include_once ('bll/cache.php');
    include_once ('bll/transnierbll.php');
    require('naglowek.php');
    require('conf.php');
    
    if (!isset($_SESSION[$zalogowany]))
    {
        echo 'Nie jesteÅ› zalogowany.';
    }
    else
    {
        $tlumaczenia = cachejezyki::Czytaj();
        $nieruchomoscDal = new NieruchomoscDAL();
        if (isset($_GET[NieruchomoscDAL::$id_zapotrzebowanie]))
        {
            $_SESSION[NieruchomoscDAL::$id_zapotrzebowanie] = $_GET[NieruchomoscDAL::$id_zapotrzebowanie];
            $_SESSION[KlientDAL::$id_klient] = $_GET[KlientDAL::$id_klient];
        }
        if (isset($_POST['zapotrzebowanie_id']))
        {
            $_SESSION[NieruchomoscDAL::$id_zapotrzebowanie] = $_POST['zapotrzebowanie_id'];
        }
        if (isset($_GET[NieruchomoscDAL::$id_zapotrzebowanie]) || $_SERVER['REQUEST_METHOD'] == 'POST')
        {
            //zmodyfikowano 04.03.2008
            if (isset($_POST['kasuj_prow']))
            {
                $tabParametr[NieruchomoscDAL::$id_prow_zap] = $_POST['prowizja_zapotrzebowanie_id'];
                $wynik = $nieruchomoscDal->UsunProwDlaTrans($tabParametr);
                if ($wynik)
                {
                    echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_powiodla_sie).'<br />';
                }
                else
                {
                    echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_nie_powiodla_sie).'<br />';
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
                if(isset($_POST['prowizja_proc'.$_POST['prowizja_zapotrzebowanie_id']]))
                {
                    $tabParametr[NieruchomoscDAL::$prow_proc] =  $_POST['prowizja_proc'.$_POST['prowizja_zapotrzebowanie_id']];   
                }
                
                $wynik = $nieruchomoscDal->DodajProwDlaTrans($tabParametr);
                if ($wynik)
                {
                    echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_powiodla_sie).'<br />';
                }
                else
                {
                    echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_nie_powiodla_sie).'<br />';
                }
            }
            if (isset($_POST['dodaj_prow']))
            {
                //echo ($_POST['trans_id']);
                //echo $_POST['prowizja'.$_POST['trans_id']];
                
                /*foreach($_POST as $klucz => $wartosc)
                {
                    echo $klucz.' => '.$wartosc.'<br />';
                } */ 
                if (strlen($_POST['prowizja'.$_POST['trans_id']]) < 1)
                {
                    $_POST['prowizja'.$_POST['trans_id']] = 0;
                }
                $tabParametr[NieruchomoscDAL::$id_zapotrzebowanie] = $_SESSION[NieruchomoscDAL::$id_zapotrzebowanie];
                $tabParametr[NieruchomoscDAL::$id_rodz_trans] = $_POST['trans_id'];
                $tabParametr[NieruchomoscDAL::$prowizja] = $_POST['prowizja'.$_POST['trans_id']];
                if(isset($_POST['prowizja_proc'.$_POST['trans_id']]))
                {
                    $tabParametr[NieruchomoscDAL::$prow_proc] =  $_POST['prowizja_proc'.$_POST['trans_id']];   
                }
                
                $wynik = $nieruchomoscDal->DodajProwDlaTrans($tabParametr);
                if ($wynik)
                {
                    echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_powiodla_sie).'<br />';
                }
                else
                {
                    echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_nie_powiodla_sie).'<br />';
                }
            }
            //koniec mod 4.03
            
            if (isset($_POST['zatwierdz_ed']))
            {
                $tabParametr[NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj] = $_POST['trans_nier_ed_id'];
                $tabParametr[NieruchomoscDAL::$id_status] = $_POST['status_ed_id'];
                $tabParametr[NieruchomoscDAL::$cena] = $_POST['cena_ed'];
                $tabParametr[NieruchomoscDAL::$pokaz] = 'false';
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
                
                if ($wynik)
                {
                    echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_powiodla_sie).'<br />';
                }
                else
                {
                    echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_nie_powiodla_sie).'<br />';
                }
            }
            if (isset($_POST['edycja']))
            {
                $wynik = $nieruchomoscDal->EdycjaTransNierZapotrzebowanie(array(NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj => $_POST['trans_rodzaj_id']));
                $wiersz = $wynik[0];
                echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'"><table>';
                KontrolkiHtml::DodajHidden('zapotrzebowanie_id', 'zapotrzebowanie_id', $_POST['zapotrzebowanie_id']);
                KontrolkiHtml::DodajHidden('trans_nier_ed_id', 'trans_nier_ed_id', $_POST['trans_rodzaj_id']);
                echo '<tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$rodzaj_nieruchomosci).' :</td><td>';
                echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], $wiersz[NieruchomoscDAL::$nieruchomosc_rodzaj]);
                echo '</td><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$rodzaj_transakcja).' :</td><td>';
                echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], $wiersz[NieruchomoscDAL::$transakcja_rodzaj]);
                //KontrolkiHtml::DodajSelectDomWartId('dostepne_trans', $wiersz['id'], $trans_dost, 'trans_id'.$wiersz['id'], null, '', '');
                echo '</td><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$cena_transakcji).' :</td><td>';
                KontrolkiHtml::DodajLiczbaCalkowitaTextbox('cena_ed','id_cena', $wiersz[NieruchomoscDAL::$cena], 10, 10, '');
                echo '</td><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$status).' :</td><td>';
                KontrolkiHtml::DodajSelectZrodSlownik('status', 'id_status', SlownikDAL::$status, 'status_ed_id', $wiersz[NieruchomoscDAL::$id_status], '', '');
                echo '</td><td>';
                KontrolkiHtml::DodajCheckbox('pokaz_ed', 'id_pokaz', $wiersz[NieruchomoscDAL::$pokaz], $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$pokaz_na_stronie), '');
                echo '</td><td>';
                //w onclicku przepisanie ponownie tej wartosci jest bez sensu bo ona sie nie zmieni - tylko 1 element mozna edytowac, ale co tam : moze byc :P
                KontrolkiHtml::DodajSubmit('zatwierdz_ed', $wiersz[NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj], $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zatwierdz), 'onclick="trans_nier_ed_id.value = this.id;"');
                echo '</td></tr>';
                echo '</table></form>';
            }   
            
            if (isset($_POST['kasowanie']))
            {
                $wynik = $nieruchomoscDal->UsunTransNierZapotrzebowanie(array(NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj => $_POST['trans_rodzaj_id']));
                if ($wynik)
                {
                    echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_powiodla_sie).'<br />';
                }
                else
                {
                    echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_nie_powiodla_sie).'<br />';
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
                
                if ($wynik)
                {
                    echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_powiodla_sie).'<br />';
                }
                else
                {
                    echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_nie_powiodla_sie).'<br />';
                }
            } 
            if (isset($_GET[NieruchomoscDAL::$id_zapotrzebowanie]) || isset($_POST['zapotrzebowanie_id']))
            {
                if (isset($_POST['zapotrzebowanie_id']))
                {
                    $_SESSION[NieruchomoscDAL::$id_zapotrzebowanie] = $_POST['zapotrzebowanie_id'];
                }
                echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$numer_zapotrzebowania).' :'.$_SESSION[NieruchomoscDAL::$id_zapotrzebowanie].'.&nbsp;';
                //echo '<tr><td>';
                KontrolkiHtml::DodajPopUpButton($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$klient),'klient', 'edycja_osoba_klient.php?'.KlientDAL::$id_klient.'='.$_SESSION[KlientDAL::$id_klient], 1000, 700);
                echo '<br/>';
                $wynik = $nieruchomoscDal->PodajNierZapotrzebowanie(array(NieruchomoscDAL::$id_zapotrzebowanie => $_SESSION[NieruchomoscDAL::$id_zapotrzebowanie]));
                echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'"><table>';
                KontrolkiHtml::DodajHidden('zapotrzebowanie_id', 'zapotrzebowanie_id', $_SESSION[NieruchomoscDAL::$id_zapotrzebowanie]);
                KontrolkiHtml::DodajHidden('zapotrzebowanie_nier_rodzaj_id', 'zapotrzebowanie_nier_rodzaj_id', '');
                //id w wierszu tutaj to id z zapotrzebowanie_nier_rodzaj
                foreach ($wynik as $wiersz)
                {
                    $trans_dost = $nieruchomoscDal->PodajTransDlaNierZapotrzebowanie(array(NieruchomoscDAL::$id_zapotrzebowanie_nier_rodzaj => $wiersz['id']), $iloscWierszy);
                    if ($iloscWierszy > 0)
                    {
                        echo '<tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$rodzaj_nieruchomosci).' :</td><td>';
                        echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], $wiersz[NieruchomoscDAL::$nazwa]);
                        echo '</td><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$rodzaj_transakcja).' :</td><td>';
                        KontrolkiHtml::DodajSelectDomWartId('dostepne_trans', $wiersz['id'], $trans_dost, 'trans_id'.$wiersz['id'], null, '', '');
                        echo '</td><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$cena_transakcji).' :</td><td>';
                        KontrolkiHtml::DodajLiczbaCalkowitaTextbox('cena'.$wiersz['id'],'id_cena', '', 10, 10, '');
                        echo '</td><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$status).' :</td><td>';
                        KontrolkiHtml::DodajSelectZrodSlownik('status', 'id_status', SlownikDAL::$status, 'status_id'.$wiersz['id'], null, '', '');
                        echo '</td><td>';
                        KontrolkiHtml::DodajCheckbox('pokaz'.$wiersz['id'], 'id_pokaz', true, $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$pokaz_na_stronie), '');
                        echo '</td><td>';
                        KontrolkiHtml::DodajSubmit('zatwierdz', $wiersz['id'], $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zatwierdz), 'onclick="zapotrzebowanie_nier_rodzaj_id.value = this.id;"');
                        echo '</td></tr>';
                    }
                }
                echo '</table></form>';
                echo '<br />';
                $wynik = $nieruchomoscDal->PodajTransNierZapotrzebowanie(array(NieruchomoscDAL::$id_zapotrzebowanie => $_SESSION[NieruchomoscDAL::$id_zapotrzebowanie]), $iloscWierszy);
                ///modyfikacja 6.03
                //dodanie popupow w gridzie zamiast dopiero po zatwierdzeniu
                $popupObj = new PopUpWysw();
                
                $popupObj->nag = array(tags::$lokalizacja, tags::$rodzaj_budynek, tags::$szczegoly, tags::$pokaz_skojarzenia);
                $popupObj->przyc_nazwa = array(tags::$lokalizacja, tags::$rodzaj_budynek, tags::$szczegoly, tags::$pokaz_skojarzenia);
                $popupObj->url = array('popup/szczegoly_lokalizacja.php?'.NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj, 
                'popup/szczegoly_zap_rodz_b.php?'.WyposazenieZapDAL::$id_zapotrzebowanie_trans_rodzaj, 
                'popup/dodanie_zap_szcz.php?'.NieruchomoscDAL::$id_zapotrzebowanie.'='.$_SESSION[NieruchomoscDAL::$id_zapotrzebowanie].'&'.NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj, 
                'popup/skoj_of_standard.php?'.NieruchomoscDAL::$id_zapotrzebowanie.'='.$_SESSION[NieruchomoscDAL::$id_zapotrzebowanie].'&'.NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj);
                $popupObj->szerokosc = array(600, 600, 800, 900);
                $popupObj->dlugosc = array(500, 600, 800, 750);
                
                echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'">';
                KontrolkiHtml::DodajHidden('zapotrzebowanie_id', 'zapotrzebowanie_id', $_SESSION[NieruchomoscDAL::$id_zapotrzebowanie]);
                UtilsUI::WyswietlTab1Poz($wynik, array(NieruchomoscDAL::$nieruchomosc_rodzaj, NieruchomoscDAL::$transakcja_rodzaj, NieruchomoscDAL::$cena, NieruchomoscDAL::$status), 
                array($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$rodzaj_nieruchomosci), $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$rodzaj_transakcja), 
                $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$cena), $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$status)), NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj, 
                'trans_rodzaj_id', array(Akcja::$edycja => 1, Akcja::$kasowanie => 1), null, null, $popupObj);
                echo '</form>';
                
                ///koniec modyfikacja 6.03
                
                ///dopisane 3.03.2008 
                $tabParametr[NieruchomoscDAL::$id_zapotrzebowanie] = $_SESSION[NieruchomoscDAL::$id_zapotrzebowanie];
                $wynik = $nieruchomoscDal->ListaProwDlaTrans($tabParametr, $ilosc_wierszy);

                if ($ilosc_wierszy > 0)
                {
                    echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'"><table>';
                    KontrolkiHtml::DodajHidden('zapotrzebowanie_id','zapotrzebowanie_id', $_SESSION[NieruchomoscDAL::$id_zapotrzebowanie]);
                    KontrolkiHtml::DodajHidden('prowizja_zapotrzebowanie_id', 'prowizja_zapotrzebowanie_id', '');
                    foreach($wynik as $wiersz)
                    {
                        echo '<tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], $wiersz[NieruchomoscDAL::$transakcja_rodzaj]).' :</td><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$prowizja).'</td><td>';
                        KontrolkiHtml::DodajLiczbaWymiernaTextbox('prowizja'.$wiersz[NieruchomoscDAL::$id_prow_zap], 'id_prowizja'.$wiersz[NieruchomoscDAL::$id_prow_zap], $wiersz[NieruchomoscDAL::$prowizja], 6, 6, 'onblur="SprawdzZaznaczenieDlaProwizji(this, \'id_prowizja_proc'.$wiersz[NieruchomoscDAL::$id_prow_zap].'\');"');
                        echo '</td><td>';
                        KontrolkiHtml::DodajCheckbox('prowizja_proc'.$wiersz[NieruchomoscDAL::$id_prow_zap], 'id_prowizja_proc'.$wiersz[NieruchomoscDAL::$id_prow_zap], $wiersz[NieruchomoscDAL::$prow_proc], $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$prowizja_proc), 
                        'onclick="return SprawdzWysokoscProwizji(this, \'id_prowizja'.$wiersz[NieruchomoscDAL::$id_prow_zap].'\', \''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podana_prow_wyd_sie_liczba)
                        .'\', \''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podana_prow_wyd_sie_proc).'\');"');
                        echo '</td><td>';
                        KontrolkiHtml::DodajSubmit('aktualizuj_prow', $wiersz[NieruchomoscDAL::$id_prow_zap], $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$aktualizuj), 'onclick="prowizja_zapotrzebowanie_id.value=this.id;"');
                        echo '</td><td>';
                        KontrolkiHtml::DodajSubmit('kasuj_prow', $wiersz[NieruchomoscDAL::$id_prow_zap], $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$kasuj),'onclick="prowizja_zapotrzebowanie_id.value=this.id;"');
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
                    echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'"><table>';
                    KontrolkiHtml::DodajHidden('zapotrzebowanie_id','zapotrzebowanie_id', $_SESSION[NieruchomoscDAL::$id_zapotrzebowanie]);
                    KontrolkiHtml::DodajHidden('trans_id', 'trans_id', '');
                    foreach($wynik as $wiersz)
                    {
                        echo '<tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], $wiersz[NieruchomoscDAL::$transakcja_rodzaj]).' :</td><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$prowizja).'</td><td>';
                        KontrolkiHtml::DodajLiczbaWymiernaTextbox('prowizja'.$wiersz[NieruchomoscDAL::$id_rodz_trans], 'id_prowizja'.$wiersz[NieruchomoscDAL::$id_rodz_trans], '', 6, 6, 'onblur="SprawdzZaznaczenieDlaProwizji(this, \'id_prowizja_proc'.$wiersz[NieruchomoscDAL::$id_rodz_trans].'\');"');
                        echo '</td><td>';
                        KontrolkiHtml::DodajCheckbox('prowizja_proc'.$wiersz[NieruchomoscDAL::$id_rodz_trans], 'id_prowizja_proc'.$wiersz[NieruchomoscDAL::$id_rodz_trans], true, $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$prowizja_proc), 
                        'onclick="return SprawdzWysokoscProwizji(this, \'id_prowizja'.$wiersz[NieruchomoscDAL::$id_rodz_trans].'\', \''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podana_prow_wyd_sie_liczba)
                        .'\', \''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podana_prow_wyd_sie_proc).'\');"');
                        echo '</td><td>';
                        KontrolkiHtml::DodajSubmit('dodaj_prow', $wiersz[NieruchomoscDAL::$id_rodz_trans], $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zatwierdz), 'onclick="trans_id.value=this.id;"');
                        echo '</td></tr>';
                    }
                    
                    echo '</table></form>';
                }
                ///koniec dopiski
                
                //pytanie czy od razu formularzem skierowac czy osobno robi cheader i chyba to 1
                if ($iloscWierszy > 0 && $ilosc_wierszy < 1)
                {
                    echo '<form method="POST" action="dodanie_trans_zap_szcz.php">';
                    KontrolkiHtml::DodajHidden('zapotrzebowanie_id', 'zapotrzebowanie_id', $_SESSION[NieruchomoscDAL::$id_zapotrzebowanie]);
                    KontrolkiHtml::DodajSubmit('zatw_trans_zap', 'zatw_trans_zap_id', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zatwierdz), '');
                    echo '</form>';
                }
            }
        }
    }
    require('stopka.php');

?>
</body>
</html>
