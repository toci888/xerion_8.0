<HTML>
<HEAD>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <script language="javascript" src="../js/script.js"></script>
<link href="../css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<?php
    // ¶ ±
    include_once ('../bll/cache.php');
    include_once ('../bll/agentbll.php');
    include_once ('../bll/jezykibll.php');
    include_once ('../bll/parametrynierbll.php');
    include_once ('../dal/queriesDAL.php');
    include_once ('../ui/kontrolki_html.php');
    include_once ('../ui/utilsui.php');
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
        //osluga zatwierdzenia calego formularza
        
        if (isset($_POST['zatwierdz']))
        {
            $_SESSION[NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj] = $_POST[NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj];
            $paramNier = unserialize($_SESSION[$param_zap.$_SESSION[NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj]]);
            $dal = new WyposazenieZapDAL($_SESSION[NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj]); 
            //wczytanie kolekcji parametrow nieruchomosci dla wszystkich sekcji
            $kolPar = $paramNier->KolekcjaParametrowMin();
            $kolParMax = $paramNier->KolekcjaParametrowMax();
            //wczytanie sekcji - sprawdzanie odbedzie sie z podzialem na sekcje :P
            $sekcje = $paramNier->PodajSekcje();
            //obiekt dala do podawaniaparametrow nieruchomosci
            
            foreach ($sekcje as $klucz => $wartosc)
            {
                if(isset($kolPar[$klucz]))
                {
                    $kol = $kolPar[$klucz]->PodajKolekcje();
                    $kolMax = $kolParMax[$klucz]->PodajKolekcje();
                    foreach($kol as $kluczElKol => $wartElKol)
                    {
                        if (isset($_POST[$wartElKol->tag]))
                        {
                            //przy edycji tutaj else i ewentualne kasowanie :P
                            if (strlen($_POST[$wartElKol->tag]) > 0)
                            {
                                $wynik = $dal->DodajParametrZap(true, true, $wartElKol->id, $_POST[$wartElKol->tag]);
                                if ($wynik)
                                {
                                    echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$dodano).' : '.$wartElKol->nazwa.'.<br />';
                                }
                            }
                            else
                            {
                                $wynik = $dal->DodajParametrZap(false, true, $wartElKol->id);
                                if ($wynik)
                                {
                                    echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$usunieto).' : '.$wartElKol->nazwa.'.<br />';
                                }
                            }
                        }
                        if (isset($_POST[$kolMax[$kluczElKol]->tag.'max']))
                        {
                            //przy edycji tutaj else i ewentualne kasowanie :P
                            if (strlen($_POST[$kolMax[$kluczElKol]->tag.'max']) > 0)
                            {
                                $wynik = $dal->DodajParametrZap(true, false, $kolMax[$kluczElKol]->id, $_POST[$kolMax[$kluczElKol]->tag.'max']);
                                if ($wynik)
                                {
                                    echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$dodano).' : '.$kolMax[$kluczElKol]->nazwa.'.<br />';
                                }
                            }
                            else
                            {
                                $wynik = $dal->DodajParametrZap(false, false, $kolMax[$kluczElKol]->id);
                                if ($wynik)
                                {
                                    echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$usunieto).' : '.$kolMax[$kluczElKol]->nazwa.'.<br />';
                                }
                            }
                        }
                    }
                }
            }
            KontrolkiHtml::DodajSubmit('ok', 'id_ok', $tlumaczenia->Tlumacz ($_SESSION[$jezyk], tags::$zamknij), 'onclick="window.close();"');
            //kasowanie sesji w celu zapobiegniecia ewentualnym bledom
            unset($_SESSION[$param_zap.$_SESSION[NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj]]);
            //kasowanie tej 2 tez ?
           
        }
        if (isset($_GET[NieruchomoscDAL::$id_zapotrzebowanie]) && isset($_GET[NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj]))
        {
            $_SESSION[NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj] = $_GET[NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj];
            //pobranie z bazy lub zlamanie w url id_trans_rodzaj i id_nier_rodzaj - to 2, zrobic dala
            //unset($_SESSION[$wynik_ed_of]);
            if (!isset($_SESSION[$param_zap.$_GET[NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj]]))// || isset($_GET[NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj]))
            {
                //podanie id z zapotrzebowania trans rodzaj o drazu wskazuje rodzaj transakcji i nieruchomosci, pobrac to w bll z bazy
                $dal = new WyposazenieZapDAL($_GET[NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj]);
                $wynik = $dal->PodajTransRodzajWypPar();
                $paramNier = new WyposazenieZapBLL($_GET[NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj], $wynik);
                //porzadki w sesji - zmieniono transakcje na inna, do tamtej prawdopodobnie nie wroca, z kolei ktos inny moze w tym czasie edytowac i zrobi sie ala
                if (isset($_SESSION[NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj]))
                {
                    unset($_SESSION[$param_zap.$_SESSION[NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj]]);
                }
                $_SESSION[$param_zap.$_GET[NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj]] = serialize($paramNier);
                $_SESSION[NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj] = $_GET[NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj];
            }
            else
            {
                $paramNier = unserialize($_SESSION[$param_zap.$_GET[NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj]]);
                $_SESSION[NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj] = $_GET[NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj];
            }
            //if (isset($_GET[NieruchomoscDAL::$id_zapotrzebowanie]) && isset($_GET[NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj]))
            //{
            $_SESSION[NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj] = $_GET[NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj];
            
            echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$numer_zapotrzebowania).' :'.$_SESSION[NieruchomoscDAL::$id_zapotrzebowanie].'.<br/>'; 
            /*echo'<table><tr><td>';
            KontrolkiHtml::DodajPopUpButton($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$rodzaj_budynek), 'szczegoly', 'szczegoly_zap_rodz_b.php?'.
            WyposazenieZapDAL::$id_zapotrzebowanie_trans_rodzaj.'='.$_GET[NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj], 600, 600);
            echo '</td><td>';
            KontrolkiHtml::DodajPopUpButton($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$lokalizacja), 'lokalizacja', 'szczegoly_lokalizacja.php?'.
            NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj.'='.$_GET[NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj], 600, 500);
            echo '</td></tr></table>'; */
            echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'">'; 
            KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj, NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj, $_SESSION[NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj]);
            UtilsUI::DodajSekcja($paramNier, false); //tu teraz podzialac
            //tutaj przycisk
            echo '<hr />';
            KontrolkiHtml::DodajSubmit('zatwierdz', 'id_zatwierdz', $tlumaczenia->Tlumacz ($_SESSION[$jezyk], tags::$zatwierdz).'.', '');
            echo '</form>';
            //}
        }
    }
    require('../stopka.php');

?>
</body>
</html>
