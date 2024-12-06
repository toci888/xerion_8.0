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
        if (isset($_POST['oferta_id']))
        {
            //osluga zatwierdzenia calego formularza
            if (isset($_POST['zatwierdz']) && isset($_SESSION[$param_nier.$_POST['oferta_id']]))
            {
                $_SESSION[NieruchomoscDAL::$id_oferta] = $_POST['oferta_id'];
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
                                else
                                {
                                    $wynik = $dal->DodajParametrNier(false, $wartElKol->id);
                                    if ($wynik)
                                    {
                                        echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$usunieto).' : '.$wartElKol->nazwa.'.<br />';
                                    }
                                }
                            }
                        }
                    }
                }
                //kasowanie sesji w celu zapobiegniecia ewentualnym bledom
                unset($_SESSION[$param_nier.$_SESSION[NieruchomoscDAL::$id_oferta]]);
                unset($_SESSION[NieruchomoscDAL::$id_nieruchomosc]);
                unset($_SESSION[NieruchomoscDAL::$id_oferta]);
            }
            if (isset($_POST['edycja']) && isset($_POST['oferta_id']))
            {
                $_SESSION[NieruchomoscDAL::$id_oferta] = $_POST['oferta_id'];
                $nieruchomoscDal = new NieruchomoscDAL(); 
                
                //przypisanie id oferty do tablicy bedacej parametrem metody podajacej dane nieruchomosci do edycji
                $tabParametr[NieruchomoscDAL::$id_oferta] = $_POST['oferta_id'];
                //wywolanie metody pobierajacej z bazy danych nieruchomosc przy pomocy id oferty
                $wynik = $nieruchomoscDal->EdycjaOferta($tabParametr, $iloscWierszy);
                
                ///edycje oferty w swietle bierzacych wymagan wypadaloby rozdzielic na 2 czesci, dane oferta - nier oraz dane szczegolowe, po ewentualnej akceptacji bierzacego interfejsu zrobic
                
                $_SESSION[NieruchomoscDAL::$id_nieruchomosc] = $wynik[0][NieruchomoscDAL::$id_nieruchomosc];
                $tabParametr[WyposazenieNierDAL::$id_transakcja] = $wynik[0][NieruchomoscDAL::$id_rodz_trans];
                $tabParametr[WyposazenieNierDAL::$id_nieruchomosc] = $wynik[0][NieruchomoscDAL::$id_nier_rodzaj];
                $_SESSION[KlientDAL::$id_klient] = $wynik[0][NieruchomoscDAL::$id_klient];
                
                $paramNier = new WyposazenieNierBLL($tabParametr, $_SESSION[NieruchomoscDAL::$id_nieruchomosc], $wynik);
                $_SESSION[$param_nier.$_SESSION[NieruchomoscDAL::$id_oferta]] = serialize($paramNier);
                
                echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$numer_oferty).' :'.$_SESSION[NieruchomoscDAL::$id_oferta].'.<hr /><table><tr><td>';
                KontrolkiHtml::DodajPopUpButton($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$oferta), 'oferta', 'edycja_oferty.php?'.NieruchomoscDAL::$id_oferta.'='.
                $_SESSION[NieruchomoscDAL::$id_oferta], 800, 450);
                echo '</td><td>';
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
                'popup/opisy_oferta.php?'.NieruchomoscDAL::$id_oferta.'='.$_SESSION[NieruchomoscDAL::$id_oferta], 900, 750);
                echo '</td></tr></table>';
                
                echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'">';
                KontrolkiHtml::DodajHidden('oferta_id', 'oferta_id', $_SESSION[NieruchomoscDAL::$id_oferta]);
                KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_nieruchomosc, NieruchomoscDAL::$id_nieruchomosc, $_SESSION[NieruchomoscDAL::$id_nieruchomosc]);
                
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
            }
        }
    }
    require('stopka.php');

?>
</body>
</html>
