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
        if (isset($_SESSION[NieruchomoscDAL::$id_zapotrzebowanie]))
        {
            $wynik = unserialize($_SESSION[$wynik_ed_zap]); 
            //unset($_SESSION[$wynik_ed_of]);
            if (!isset($_SESSION[$param_zap]))
            {
                //var_dump($wynik);
                $paramNier = new WyposazenieZapBLL($_SESSION[$wyb_param_nowa_oferta], $_SESSION[NieruchomoscDAL::$id_zapotrzebowanie], $wynik);
                $_SESSION[$param_zap] = serialize($paramNier);
            }
            else
            {
                $paramNier = unserialize($_SESSION[$param_zap]);
            }
            //osluga zatwierdzenia calego formularza
            if (isset($_POST['zatwierdz']))
            {
                //wczytanie kolekcji parametrow nieruchomosci dla wszystkich sekcji
                $kolPar = $paramNier->KolekcjaParametrow();
                //wczytanie sekcji - sprawdzanie odbedzie sie z podzialem na sekcje :P
                $sekcje = $paramNier->PodajSekcje();
                //obiekt dala do podawaniaparametrow nieruchomosci
                $dal = new WyposazenieZapDAL(null, $_SESSION[NieruchomoscDAL::$id_zapotrzebowanie]);
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
                                    $wynik = $dal->DodajParametrZap(true, $wartElKol->id, $_POST[$wartElKol->tag]);
                                    if ($wynik)
                                    {
                                        echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$dodano).' : '.$wartElKol->nazwa.'.<br />';
                                    }
                                }
                                else
                                {
                                    $wynik = $dal->DodajParametrZap(false, $wartElKol->id);
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
                unset($_SESSION[$wynik_ed_zap]);
                unset($_SESSION[$param_zap]);
                unset($_SESSION[NieruchomoscDAL::$id_nieruchomosc]);
                unset($_SESSION[NieruchomoscDAL::$id_oferta]);
                unset($_SESSION[$wyb_param_nowa_oferta]);
                unset($_SESSION[NieruchomoscDAL::$id_nieruchomosc]);
                unset($_SESSION[NieruchomoscDAL::$id_oferta]);
            }
            if (isset($_SESSION[NieruchomoscDAL::$id_zapotrzebowanie]) && isset($_GET['zatw']))
            {
                echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$numer_zapotrzebowania).' :'.$_SESSION[NieruchomoscDAL::$id_zapotrzebowanie].'.<br/>';
                //$paramNier = new WyposazenieNierBLL($_SESSION[$wyb_param_nowa_oferta], $_SESSION[NieruchomoscDAL::$id_nieruchomosc]);
                //$_SESSION[$param_nier] = serialize($paramNier); 
                
                echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'">';       
                UtilsUI::DodajSekcja($paramNier, false); //tu teraz podzialac
                //tutaj przycisk
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
