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
    include_once ('../../bll/parametrynierbll.php'); 
    include_once ('../../ui/kontrolki_html.php');
    include_once ('../../ui/utilsui.php');
    include_once ('../../bll/tags.php'); 
    include_once ('../../bll/agentbll.php');
    include_once ('../../bll/jezykibll.php');
    include_once ('../../bll/cache.php');
    require('../../naglowek.php');
    require('../../conf.php');
    
    if (!isset($_SESSION[$zalogowany]))
    {
        echo 'Nie jesteÅ› zalogowany.';
    }
    else
    {
        $tlumaczenia = cachejezyki::Czytaj();        
        
        //$_SESSION[NieruchomoscDAL::$id_oferta]
        //$_SESSION[NieruchomoscDAL::$id_nieruchomosc]
        //$_SESSION[WyposazenieNierDAL::$id_pomieszczenie]
        //$_SESSION[WyposazenieNierDAL::$id_pom_nier]
        if (isset($_GET[NieruchomoscDAL::$id_oferta]))
        {
            $oferta_id = $_GET[NieruchomoscDAL::$id_oferta];
            $nieruchomosc_id = $_GET[NieruchomoscDAL::$id_nieruchomosc];
        }
        if (isset($_POST['oferta_id']))
        {
            $oferta_id = $_POST['oferta_id'];
            $nieruchomosc_id = $_POST[NieruchomoscDAL::$id_nieruchomosc];
        }
        
        if (isset($_GET[WyposazenieNierDAL::$id_pomieszczenie]))
        {
            $pomieszczenie_id = $_GET[WyposazenieNierDAL::$id_pomieszczenie];
        }
        if (isset($_POST[WyposazenieNierDAL::$id_pomieszczenie]))
        {
            $pomieszczenie_id = $_POST[WyposazenieNierDAL::$id_pomieszczenie];
        }
        
        if (isset($_POST['pomieszczenie_id']))
        {
            $pomieszczenie_nier_id = $_POST['pomieszczenie_id'];
        }
        
        $dal = new WyposazenieNierDAL(null, $nieruchomosc_id);
        
        $paramNier = unserialize($_SESSION[$param_nier.$oferta_id]);
        $pomieszczenia = $paramNier->PodajPom();
        UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$numer_oferty).' :'.$oferta_id);
        
        if (isset($_POST['dodaj']))
        {
            unset($_SESSION[$pomieszczenie_wyp]);
            unset($_SESSION[$pomieszczenie_param]);
            $wyposObj = new PomWypACD($pomieszczenie_id);
            $paramObj = new PomParACD($pomieszczenie_id);
            $_SESSION[$pomieszczenie_wyp] = serialize($wyposObj);
            $_SESSION[$pomieszczenie_param] = serialize($paramObj);
            
            $pomieszczenie_nier_id = $paramNier->DodajPomieszczenie($pomieszczenie_id);
            UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$dodawanie_nowego_pomieszczenia));
            //echo 'dodawanie nowego pomieszczenia';
        }
        if ($_SERVER['REQUEST_METHOD'] == 'POST')
        {
            if (isset($_POST['wyposazenie_dod_id']))
            {
                $wyposObj = unserialize($_SESSION[$pomieszczenie_wyp]);
                if (strlen($_POST['wyposazenie_dod_id']) > 0)
                {
                    $wyposObj->DodajWyposazenie($pomieszczenie_nier_id, $_POST['wyposazenie_dod_id']);
                    $_SESSION[$pomieszczenie_wyp] = serialize($wyposObj);
                }
            }
            if (isset($_POST['wyposazenie_odej_id']))
            {
                $wyposObj = unserialize($_SESSION[$pomieszczenie_wyp]);
                if (strlen($_POST['wyposazenie_odej_id']) > 0)
                {
                    $wyposObj->UsunWyposazenie($pomieszczenie_nier_id, $_POST['wyposazenie_odej_id']);
                    $_SESSION[$pomieszczenie_wyp] = serialize($wyposObj);
                }
            }
        }
        if (isset($_POST['zatwierdz']))
        {
            $paramObj = unserialize($_SESSION[$pomieszczenie_param]);
            $kolParam = $paramObj->PodajKolekcje();
            
            foreach($kolParam as $kluczLok => $wartLok)
            {
                    if (isset($_POST[$wartLok->tag]))
                    {
                        if (strlen($_POST[$wartLok->tag]) > 0)
                        {
                            $wynik = $dal->DodajParametrPom(true, array(WyposazenieNierDAL::$id_pom_nier => $pomieszczenie_nier_id, 
                            WyposazenieNierDAL::$id_parametr_pom => $wartLok->id, WyposazenieNierDAL::$wartosc => $_POST[$wartLok->tag]));
                        }
                        else
                        {
                            $wynik = $dal->DodajParametrPom(false, array(WyposazenieNierDAL::$id_pom_nier => $pomieszczenie_nier_id, 
                            WyposazenieNierDAL::$id_parametr_pom => $wartLok->id, WyposazenieNierDAL::$wartosc => $_POST[$wartLok->tag]));
                        }
                    }
            }
        }
        if (isset($_POST['kasowanie']))
        {
            $wynik = $paramNier->DodajPomieszczenie($_POST['pomieszczenie_id'], false);
            if (!$wynik)
            {
                UtilsUI::InfoBlad($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_nie_powiodla_sie));
            }
        }
        
        UtilsUI::IstotneInfo($pomieszczenia[$pomieszczenie_id]);
        
        if (isset($_POST['edycja']))
        {
            $pomieszczenie_nier_id = $_POST['pomieszczenie_id'];
            
            unset($_SESSION[$pomieszczenie_wyp]);
            unset($_SESSION[$pomieszczenie_param]);
            $wyposObj = new PomWypACD($pomieszczenie_id, $pomieszczenie_nier_id);
            $paramObj = new PomParACD($pomieszczenie_id, $pomieszczenie_nier_id);
            $_SESSION[$pomieszczenie_wyp] = serialize($wyposObj);
            $_SESSION[$pomieszczenie_param] = serialize($paramObj);
            
            UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$edycja_pomieszczenia));
            ///pobrac ten numer pomieszczenia???
        }
        if (isset($_POST['dodaj']) || isset($_POST['edycja']) || isset($_POST['dodaj_wyp']) || isset($_POST['ujmij_wyp']))
        {
            $wyposObj = unserialize($_SESSION[$pomieszczenie_wyp]);
            $paramObj = unserialize($_SESSION[$pomieszczenie_param]);
            $kolParam = $paramObj->PodajKolekcje();
            //$kolParam = $paramNier->PodajParamPom($_SESSION[WyposazenieNierDAL::$id_pomieszczenie], $pomieszczenie_nier_id);
            echo '<form method="POST" name="wyposazenie_form" id="wyposazenie_form" action="'.$_SERVER['PHP_SELF'].'">';
            KontrolkiHtml::DodajHidden('oferta_id', 'oferta_id', $oferta_id);
            KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_nieruchomosc, NieruchomoscDAL::$id_nieruchomosc, $nieruchomosc_id);
            KontrolkiHtml::DodajHidden(WyposazenieNierDAL::$id_pomieszczenie, WyposazenieNierDAL::$id_pomieszczenie, $pomieszczenie_id);
            KontrolkiHtml::DodajHidden('pomieszczenie_id', 'pomieszczenie_id', $pomieszczenie_nier_id);
            echo '<table>';
            //echo '<tr><td>';
            //KontrolkiHtml::DodajPopUpButton($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wybierz), 'pomieszczenie', 'pomieszczeniewyp.php', 500, 500); 
            //echo '</td></tr>';
            $i = 1;
            //podanie textboxow parametrow nieruchomosci
            foreach($kolParam as $kluczLok => $wartLok)
            {
                    if($i % 2 == 1)
                    {
                        echo '<tr>';
                    }
                    $value = $wartLok->wartosc;
                    if (isset($_POST[$wartLok->tag]))
                    {
                        $value = $_POST[$wartLok->tag];
                    }
                    echo '<td>'.$wartLok->nazwa.'</td><td>';
                    //dodanie textboxa z walidacja podawana z bazy danych
                    KontrolkiHtml::DodajTextboxWalBaza($wartLok->tag, $wartLok->id, $value, $wartLok->dl_inf, $wartLok->dl_inf, $wartLok->walidacja);
                    echo '</td>';
                    if($i % 2 == 0)
                    {
                        echo '</tr>';
                    }
                    $i++;
            }
            
            echo '</table>';
            //$kolWyp = new PomWypACD($_SESSION[WyposazenieNierDAL::$id_pomieszczenie]);
            
            echo '<table><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$dostepne).'</td><td></td><td>'.
            $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wybrane).'</td></tr><tr><td>';
            KontrolkiHtml::DodajSelectWyposazenie('dodaj_wyp', $wyposObj->id_pomieszczenie, $wyposObj->PodajDostepneWyposazenie(), 'wyposazenie_dod_id', 'wyposazenie_form', '');
            echo '</td><td>';
            KontrolkiHtml::DodajSubmit('dodaj_wyp', 'id_dodaj', '>>', '');
            echo '<br /><br />';
            KontrolkiHtml::DodajSubmit('ujmij_wyp', 'id_ujmij', '<<', '');
            echo '</td><td>';
            KontrolkiHtml::DodajSelectWyposazenie('ujmij_wyp', $wyposObj->id_pomieszczenie.'wyb', $wyposObj->PodajWybraneWyposazenie(), 'wyposazenie_odej_id', 'wyposazenie_form', '');
            echo '</td></tr><tr><td></td><td>';
            KontrolkiHtml::DodajSubmit('zatwierdz', 'id_zatwierdz', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zatwierdz), '');
            echo '</td><td></td></tr></table></form><hr />';
            
            //$_SESSION[$param_nier] = serialize($paramNier);
        }
        else
        {
            echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'">';
            KontrolkiHtml::DodajHidden('oferta_id', 'oferta_id', $oferta_id);
            KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_nieruchomosc, NieruchomoscDAL::$id_nieruchomosc, $nieruchomosc_id);
            KontrolkiHtml::DodajHidden(WyposazenieNierDAL::$id_pomieszczenie, WyposazenieNierDAL::$id_pomieszczenie, $pomieszczenie_id);
            KontrolkiHtml::DodajSubmit('dodaj', 'id_dodaj', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$dodaj), '');
            echo '</form>';
        }
        
        //pobranie i wyswietlenie istniejacych 
        
        $wynik = $dal->PodajPomieszczeniaNier($pomieszczenie_id);
        echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'">';
        KontrolkiHtml::DodajHidden('oferta_id', 'oferta_id', $oferta_id);
        KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_nieruchomosc, NieruchomoscDAL::$id_nieruchomosc, $nieruchomosc_id);
        KontrolkiHtml::DodajHidden(WyposazenieNierDAL::$id_pomieszczenie, WyposazenieNierDAL::$id_pomieszczenie, $pomieszczenie_id);
        UtilsUI::WyswietlTab1Poz($wynik, array(WyposazenieNierDAL::$id, WyposazenieNierDAL::$nazwa, WyposazenieNierDAL::$nr_pomieszczenie), 
        array(tags::$id ,tags::$pomieszczenie, tags::$nr_pomieszczenia), WyposazenieNierDAL::$id, 'pomieszczenie_id', 
        array(Akcja::$edycja => 1, Akcja::$kasowanie => 1));
        echo '</form><hr />';
        KontrolkiHtml::DodajSubmit('ok', 'id_ok', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zakoncz), 'onclick="window.close();"'); 
        //var_dump($wynik);
    }
    require('../../stopka.php');

?>
</body>
</html>
