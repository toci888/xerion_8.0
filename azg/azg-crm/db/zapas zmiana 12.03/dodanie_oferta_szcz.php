<?php 
    include_once ('bll/xajax.php');
?>
<HTML>
<HEAD>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <script language="javascript" src="js/script.js"></script>
  <script>
        function DodajWyposazenie(ctrl, id_wyposazenie, id_sekcja)   //
        {
            xajax_DodajWyposazenie(ctrl, 'innerHTML', id_wyposazenie, id_sekcja);
        }
  </script>
<link href="css/style.css" rel="stylesheet" type="text/css">
</head>
<?php $xajax->printJavascript("lib/xajax/"); ?>
<body>
<?php
    // ¶ ±
    include_once ('bll/cache.php');
    include_once ('bll/agentbll.php');
    include_once ('bll/jezykibll.php');
    include_once ('bll/klientbll.php');
    include_once ('bll/parametrynierbll.php');
    include_once ('dal/queriesDAL.php');
    include_once ('ui/kontrolki_html.php');
    include_once ('ui/utilsui.php');
    session_start();
    require('naglowek.php');
    require('conf.php');
    
    if (!isset($_SESSION[$zalogowany]))
    {
        echo 'Nie jesteÅ› zalogowany.';
    }
    else
    {
        $tlumaczenia = cachejezyki::Czytaj();
        $agent_zal = unserialize($_SESSION[$dane_agent]);
        
        if (isset($_POST['zatwierdz']) && isset($_POST[NieruchomoscDAL::$id_oferta]) && isset($_SESSION[$param_nier.$_POST[NieruchomoscDAL::$id_oferta]]))
        {
            $_SESSION[NieruchomoscDAL::$id_oferta] = $_POST[NieruchomoscDAL::$id_oferta];
            $_SESSION[NieruchomoscDAL::$id_nieruchomosc] = $_POST[NieruchomoscDAL::$id_nieruchomosc];
            
            $paramNier = unserialize($_SESSION[$param_nier.$_SESSION[NieruchomoscDAL::$id_oferta]]); 
            //wczytanie kolekcji parametrow nieruchomosci dla wszystkich sekcji
            $kolPar = $paramNier->KolekcjaParametrow();
            //wczytanie sekcji - sprawdzanie odbedzie sie z podzialem na sekcje :P
            $sekcje = $paramNier->PodajSekcje();
            //obiekt dala do podawaniaparametrow nieruchomosci
            $dal = new WyposazenieNierDAL(null, $_SESSION[NieruchomoscDAL::$id_nieruchomosc]);
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
                                if ($wynik)
                                {
                                    echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$dodano).' : '.$wartElKol->nazwa.'.<br />';
                                }
                            }
                        }
                    }
                }
            }
            echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$dodano_oferte).' : '.$_SESSION[NieruchomoscDAL::$id_oferta].'.<br />';   
            //kasowanie sesji w celu zapobiegniecia ewentualnym bledom
            unset($_SESSION[$wynik_ed_of]);
            unset($_SESSION[$param_nier]);
            unset($_SESSION[$param_nier.$_SESSION[NieruchomoscDAL::$id_oferta]]);
            unset($_SESSION[NieruchomoscDAL::$id_nieruchomosc]);
            unset($_SESSION[NieruchomoscDAL::$id_oferta]);
            unset($_SESSION[KlientDAL::$id_klient]);
        }
        
        if (isset($_POST['zatwierdz_oferta']))
        {
            $_SESSION[KlientDAL::$id_klient] = $_POST[KlientDAL::$id_klient];
            $nieruchomoscDal = new NieruchomoscDAL();
            //podanie rodzaju nieruchomosci
            $tabParametr[NieruchomoscDAL::$id_nier_rodzaj] = $_POST[TransNierDAL::$id_nieruchomosc];
            //podanie rodzaju transakcji
            $tabParametr[NieruchomoscDAL::$id_rodz_trans] = $_POST[TransNierDAL::$id_transakcja];
            $tabParametr[NieruchomoscDAL::$id_klient] = $_POST[KlientDAL::$id_klient];
            
            if (isset($_POST['nier_szczeg_id']))
            {
                $tabParametr[NieruchomoscDAL::$id_rodz_nier_szcz] = $_POST['nier_szczeg_id'];
            }
            $tabParametr[NieruchomoscDAL::$cena] = $_POST['cena'];
            $tabParametr[NieruchomoscDAL::$id_status] = $_POST['status_id'];
            $tabParametr[NieruchomoscDAL::$data_otw_zlecenie] = $_POST['data_otw_zlec'];
            if (strlen($_POST['data_zam_zlec']) == 10)
            {
                $tabParametr[NieruchomoscDAL::$data_zam_zlecenie] = '\''.$_POST['data_zam_zlec'].'\'';
            }
            else
            {
                $tabParametr[NieruchomoscDAL::$data_zam_zlecenie] = 'null';
            }
            $tabParametr[NieruchomoscDAL::$prowizja] = $_POST['prowizja'];
            //region checkboxow
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
            if (isset($_POST['pokaz']))
            {
                $tabParametr[NieruchomoscDAL::$pokaz] = true;
            }
            else
            {
                $tabParametr[NieruchomoscDAL::$pokaz] = false;
            }
            if (isset($_POST['rynek']))
            {
                $tabParametr[NieruchomoscDAL::$rynek] = true;
            }
            else
            {
                $tabParametr[NieruchomoscDAL::$rynek] = false;
            }
            //koniec regionu checkboxow
            $tabParametr[NieruchomoscDAL::$id_region_geog] = $_POST[NieruchomoscDAL::$id_region_geog];
            $tabParametr[NieruchomoscDAL::$ulica] = $_POST['ulica'];
            $tabParametr[NieruchomoscDAL::$ulica_net] = $_POST['ulica_net'];
            $tabParametr[NieruchomoscDAL::$kod] = $_POST['kod'];
            $tabParametr[NieruchomoscDAL::$agent] = (int)$agent_zal->id;
            ///dorobic tu if sprawdzajacy czy sesja z id_oferta istnieje - jak tak nie dodawac
            $wynik = $nieruchomoscDal->DodajOferta($tabParametr);
            
            if (isset($wynik[NieruchomoscDAL::$id_oferta]))
            {
                if ($wynik[NieruchomoscDAL::$id_oferta] != null)
                {
                    $_SESSION[NieruchomoscDAL::$id_oferta] = $wynik[NieruchomoscDAL::$id_oferta];
                    $_SESSION[NieruchomoscDAL::$id_nieruchomosc] = $wynik[NieruchomoscDAL::$id_nieruchomosc];

                    //dodac te osoby teraz z sesji
                    if (isset($_SESSION[$osoby_nowe_zlecenie.$_SESSION[KlientDAL::$id_klient]]))
                    {
                        $osoby_zlecenie = unserialize($_SESSION[$osoby_nowe_zlecenie.$_SESSION[KlientDAL::$id_klient]]);

                        $osoby = $osoby_zlecenie->PodajOsoby();
                        foreach ($osoby as $osoba)
                        {
                            //wywolac dodanie
                            $dal = new OsobaDAL($osoba);
                            $dal->DodajOsobaOferta(array(OsobaDAL::$id_oferta => $_SESSION[NieruchomoscDAL::$id_oferta]), true);
                        }
                        unset($_SESSION[$osoby_nowe_zlecenie.$_SESSION[KlientDAL::$id_klient]]);
                    }
                    //po dodaniu pokazac formularz
                    $tabParametr = array();
                    $tabParametr[WyposazenieNierDAL::$id_transakcja] = $_POST[TransNierDAL::$id_transakcja];
                    $tabParametr[WyposazenieNierDAL::$id_nieruchomosc] = $_POST[TransNierDAL::$id_nieruchomosc];
                    
                    $paramNier = new WyposazenieNierBLL($tabParametr, $_SESSION[NieruchomoscDAL::$id_nieruchomosc]);
                    $_SESSION[$param_nier.$_SESSION[NieruchomoscDAL::$id_oferta]] = serialize($paramNier); 
                    
                    echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$numer_oferty).' :'.$_SESSION[NieruchomoscDAL::$id_oferta].'.<hr /><table><tr><td>';
                    KontrolkiHtml::DodajPopUpButton($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$klient),'klient', 'edycja_osoba_klient.php?'.KlientDAL::$id_klient.'='.$_SESSION[KlientDAL::$id_klient], 1000, 700);
                    echo '</td><td>';
                    KontrolkiHtml::DodajPopUpButton($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wlasciciele), 'wlasciciele', 'popup/wlasciciele.php?'.NieruchomoscDAL::$id_nieruchomosc.'='.
                    $_SESSION[NieruchomoscDAL::$id_nieruchomosc], 700, 350);
                    echo '</td><td>';
                    KontrolkiHtml::DodajPopUpButton($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$pokaz_skojarzenia), 'pokaz_skojarzenia', 
                    'popup/skoj_zap_standard.php?'.NieruchomoscDAL::$id_oferta.'='.$_SESSION[NieruchomoscDAL::$id_oferta], 900, 750);
                    echo '</td><td>';                
                    KontrolkiHtml::DodajPopUpButton($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$notatka), 'notatka', 
                    'popup/opis_nieruchomosc.php?'.NieruchomoscDAL::$id_nieruchomosc.'='.$_SESSION[NieruchomoscDAL::$id_nieruchomosc], 900, 750);
                    echo '</td><td>';                
                    KontrolkiHtml::DodajPopUpButton($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$opis_oferty), 'opis_oferta', 
                    'popup/opisy_oferta.php?'.NieruchomoscDAL::$id_nieruchomosc.'='.$_SESSION[NieruchomoscDAL::$id_nieruchomosc], 900, 750);
                    echo '</td></tr></table>';
                    
                    echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'">';
                    KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_oferta, NieruchomoscDAL::$id_oferta, $_SESSION[NieruchomoscDAL::$id_oferta]);
                    KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_nieruchomosc, NieruchomoscDAL::$id_nieruchomosc, $_SESSION[NieruchomoscDAL::$id_nieruchomosc]);
                    KontrolkiHtml::DodajHidden(KlientDAL::$id_klient, KlientDAL::$id_klient, $_SESSION[KlientDAL::$id_klient]);
                    
                    UtilsUI::DodajSekcja($paramNier);
                    //tutaj przycisk
                    echo '<hr />';
                    echo '<table><tr><td>';
                    KontrolkiHtml::DodajPopUpButton($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zdjecia), 'zdjecia', 'popup/zdjecia.php?', 500, 500);
                    echo '</td><td>';
                    KontrolkiHtml::DodajPopUpButton($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$filmy), 'filmy', 'popup/filmy.php?', 500, 500);
                    echo '</td></tr></table>';
                    echo '<hr />';
                    KontrolkiHtml::DodajSubmit('zatwierdz', 'id_zatwierdz', $tlumaczenia->Tlumacz ($_SESSION[$jezyk], tags::$zatwierdz).'.', '');
                    echo '</form>';
                    
                    
                    //header('Location: dodanie_oferta_szcz.php?'.NieruchomoscDAL::$id_oferta.'='.$wynik[NieruchomoscDAL::$id_oferta].'&'.NieruchomoscDAL::$id_nieruchomosc.'='.$wynik[NieruchomoscDAL::$id_nieruchomosc]);
                }
            }
        }
        /*if (isset($_GET[NieruchomoscDAL::$id_oferta]) || isset($_POST[NieruchomoscDAL::$id_oferta]))
        {
            if (isset($_GET[NieruchomoscDAL::$id_oferta]))
            {
                $_SESSION[NieruchomoscDAL::$id_oferta] = $_GET[NieruchomoscDAL::$id_oferta];
                $_SESSION[NieruchomoscDAL::$id_nieruchomosc] = $_GET[NieruchomoscDAL::$id_nieruchomosc];
            }
            if (isset($_POST[NieruchomoscDAL::$id_oferta]))
            {
                $_SESSION[NieruchomoscDAL::$id_oferta] = $_POST[NieruchomoscDAL::$id_oferta];
                $_SESSION[NieruchomoscDAL::$id_nieruchomosc] = $_POST[NieruchomoscDAL::$id_nieruchomosc];
            }
            if (!isset($_SESSION[$param_nier.$_SESSION[NieruchomoscDAL::$id_oferta]]))
            {                                                  ///sesja do klepania
                $paramNier = new WyposazenieNierBLL($_SESSION[$wyb_param_nowa_oferta], $_SESSION[NieruchomoscDAL::$id_nieruchomosc]);
                $_SESSION[$param_nier.$_SESSION[NieruchomoscDAL::$id_oferta]] = serialize($paramNier);
            }
            else
            {
                $paramNier = unserialize($_SESSION[$param_nier.$_SESSION[NieruchomoscDAL::$id_oferta]]);
            }
            //osluga zatwierdzenia calego formularza
            
            if (isset($_GET[NieruchomoscDAL::$id_oferta]) && isset($_GET[NieruchomoscDAL::$id_oferta]))
            {
                $_SESSION[NieruchomoscDAL::$id_oferta] = $_GET[NieruchomoscDAL::$id_oferta];
                $_SESSION[NieruchomoscDAL::$id_nieruchomosc] = $_GET[NieruchomoscDAL::$id_nieruchomosc];
                
                
            } 
        }     */
    }
    require('stopka.php');

?>
</body>
</html>
