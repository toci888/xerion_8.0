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
        
        $oferta_id1 = null;
        $oferta_id2 = null;
        $nier_rodzaj_id1 = null;
        $nier_rodzaj_id2 = null;
        $trans_rodzaj_id1 = null;
        $trans_rodzaj_id2 = null;
        
        if (isset($_GET[NieruchomoscDAL::$id_oferta.'1']))
        {
            $oferta_id1 = $_GET[NieruchomoscDAL::$id_oferta.'1'];
            $nier_rodzaj_id1 = $_GET[NieruchomoscDAL::$id_nier_rodzaj.'1'];
            $trans_rodzaj_id1 = $_GET[NieruchomoscDAL::$id_trans_rodzaj.'1'];
            $oferta_id2 = $_GET[NieruchomoscDAL::$id_oferta.'2'];
            $nier_rodzaj_id2 = $_GET[NieruchomoscDAL::$id_nier_rodzaj.'2'];
            $trans_rodzaj_id2 = $_GET[NieruchomoscDAL::$id_trans_rodzaj.'2'];
        }
        
        if ($oferta_id1 != null && $oferta_id2 != null)
        {
            ///OfertaInfoSekcje (nieruchomosc_id integer, nier_rodzaj_id integer, trans_rodzaj_id integer) - ta procedura dla sekcji podstawowej (id_sekcja = 1) poda nam dane do wyboru, dodatkowopobrac podstawowe dane
            ///dac checkboxy do wyptaszkowania co idzie na wydruk (max 5 elementow) i wygenerowac wydruk
            
            //pobrac id nieruchomosc
            $dal = new StronaOfertaDAL();
            
            
            echo '<form method="POST" action="gablota_gotowe_2.php">';
            $nier_id_tab1 = $dal->PodajIdNierOfId($oferta_id1);
            $nier_id1 = $nier_id_tab1[0];
            
            $tabParametr[StronaOfertaDAL::$id_nieruchomosc] = $nier_id1[NieruchomoscDAL::$id_nieruchomosc];
            $tabParametr[StronaOfertaDAL::$id_nier_rodzaj] = $nier_rodzaj_id1;
            $tabParametr[StronaOfertaDAL::$id_trans_rodzaj] = $trans_rodzaj_id1;
            
            $wynik = $dal->OfertaInfoSekcje($tabParametr, $sekcja_podstawowa_id);
            //lokalizacja i cena z widoku podstawowego, podobnie jak wylacznosc, zmiana ceny - tu bylby troche problem, pomyslec
            
            $parametry = $wynik[0]['parametry'];
            $wyposazenia = $wynik[0]['wyposazenia'];

            $nier_id_tab2 = $dal->PodajIdNierOfId($oferta_id2);
            $nier_id2 = $nier_id_tab2[0];

            $tabParametr[StronaOfertaDAL::$id_nieruchomosc] = $nier_id2[NieruchomoscDAL::$id_nieruchomosc];
            $tabParametr[StronaOfertaDAL::$id_nier_rodzaj] = $nier_rodzaj_id2;
            $tabParametr[StronaOfertaDAL::$id_trans_rodzaj] = $trans_rodzaj_id2;
            
            $wynik2 = $dal->OfertaInfoSekcje($tabParametr, $sekcja_podstawowa_id);
 
            //lokalizacja i cena z widoku podstawowego, podobnie jak wylacznosc, zmiana ceny - tu bylby troche problem, pomyslec
            
            $parametry2 = $wynik2[0]['parametry'];
            $wyposazenia2 = $wynik2[0]['wyposazenia'];
            
            KontrolkiHtml::DodajHidden('ilosc_elementow', 'ilosc_elementow', 0);
            KontrolkiHtml::DodajHidden('ilosc_elementow2', 'ilosc_elementow2', 0);
            KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_oferta.'1', NieruchomoscDAL::$id_oferta.'1', $oferta_id1);
            KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_nieruchomosc.'1', NieruchomoscDAL::$id_nieruchomosc.'1', $nier_id1[NieruchomoscDAL::$id_nieruchomosc]);
            KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_nier_rodzaj.'1', NieruchomoscDAL::$id_nier_rodzaj.'1', $nier_rodzaj_id1);
            KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_trans_rodzaj.'1', NieruchomoscDAL::$id_trans_rodzaj.'1', $trans_rodzaj_id1);
            
            KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_oferta.'2', NieruchomoscDAL::$id_oferta.'2', $oferta_id2);
            KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_nieruchomosc.'2', NieruchomoscDAL::$id_nieruchomosc.'2', $nier_id2[NieruchomoscDAL::$id_nieruchomosc]);
            KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_nier_rodzaj.'2', NieruchomoscDAL::$id_nier_rodzaj.'2', $nier_rodzaj_id2);
            KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_trans_rodzaj.'2', NieruchomoscDAL::$id_trans_rodzaj.'2', $trans_rodzaj_id2);
            
            echo '<table>';
            $i = 0;
            foreach ($parametry as $parametr)
            {
                if ($i % 5 == 0)
                {
                    echo '<tr>';
                }
                echo '<td><input type="checkbox" onclick="return SprawdzIloscElementow(ilosc_elementow, this, \''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$maksymalna_liczba_elementow).': 6.\');" id="'.$parametr.$i.'" name="parametry[]" value="'.$parametr.'" /><label for="'.$parametr.$i.'">'.$tlumaczenia->TlumaczZlozenieTag($_SESSION[$jezyk], $parametr, ' : ').'</label></td>';
                $i++;
                if ($i % 5 == 0)
                {
                    echo '</tr>';
                }
            }
            foreach ($wyposazenia as $wyposazenie)
            {
                if ($i % 5 == 0)
                {
                    echo '<tr>';
                }
                echo '<td><input type="checkbox" onclick="return SprawdzIloscElementow(ilosc_elementow, this, \''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$maksymalna_liczba_elementow).': 6.\');" id="'.$wyposazenie.$i.'" name="wyposazenia[]" value="'.$wyposazenie.'" /><label for="'.$wyposazenie.$i.'">'.$tlumaczenia->TlumaczZlozenieTag($polski_jezyk, $wyposazenie, ' : ').'</label></td>';
                $i++;
                if ($i % 5 == 0)
                {
                    echo '</tr>';
                }
            }
            echo '</table>';
            //pobrac 1 zdjecie lub liste zdjec do wyptaszkowania - lista pod radio
            $zdjecia = $dal->PodajZdjeciaNieruchomosc($nier_id1[NieruchomoscDAL::$id_nieruchomosc]);
            echo '<br /><table>';
            //var_dump($zdjecia);
            $i = 0;
            if (is_array($zdjecia))
            foreach ($zdjecia as $zdjecie)
            {
                if ($i % 5 == 0)
                {
                    echo '<tr>';
                }
                echo '<td><input type="radio" name="zdjecia" value="'.$zdjecie[NieruchomoscDAL::$nazwa].'" id="'.$zdjecie[NieruchomoscDAL::$nazwa].'" /><label for="'.$zdjecie[NieruchomoscDAL::$nazwa].'"><img width="150" src="../../media/'.
                $nier_id1[NieruchomoscDAL::$id_nieruchomosc].'/zdjecia/'.$zdjecie[NieruchomoscDAL::$nazwa].'"></label></td>';
                $i++;
                if ($i % 5 == 0)
                {
                    echo '</tr>';
                }
            }
            echo '</table>';
            echo '<table>';
            $i = 0;
            foreach ($parametry2 as $parametr)
            {
                if ($i % 5 == 0)
                {
                    echo '<tr>';
                }
                echo '<td><input type="checkbox" onclick="return SprawdzIloscElementow(ilosc_elementow2, this, \''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$maksymalna_liczba_elementow).': 6.\');" id="'.$parametr.'" name="parametry2[]" value="'.$parametr.'" /><label for="'.$parametr.'">'.$tlumaczenia->TlumaczZlozenieTag($_SESSION[$jezyk], $parametr, ' : ').'</label></td>';
                $i++;
                if ($i % 5 == 0)
                {
                    echo '</tr>';
                }
            }
            if (is_array($wyposazenia2))
            foreach ($wyposazenia2 as $wyposazenie)
            {
                if ($i % 5 == 0)
                {
                    echo '<tr>';
                }
                echo '<td><input type="checkbox" onclick="return SprawdzIloscElementow(ilosc_elementow2, this, \''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$maksymalna_liczba_elementow).': 6.\');" id="'.$wyposazenie.'" name="wyposazenia2[]" value="'.$wyposazenie.'" /><label for="'.$wyposazenie.'">'.$tlumaczenia->TlumaczZlozenieTag($polski_jezyk, $wyposazenie, ' : ').'</label></td>';
                $i++;
                if ($i % 5 == 0)
                {
                    echo '</tr>';
                }
            }
            echo '</table>';
            //pobrac 1 zdjecie lub liste zdjec do wyptaszkowania - lista pod radio
            $zdjecia = $dal->PodajZdjeciaNieruchomosc($nier_id2[NieruchomoscDAL::$id_nieruchomosc]);
            echo '<br /><table>';
            //var_dump($zdjecia);
            $i = 0;
            if (is_array($zdjecia))
            foreach ($zdjecia as $zdjecie)
            {
                if ($i % 5 == 0)
                {
                    echo '<tr>';
                }
                echo '<td><input type="radio" name="zdjecia2" value="'.$zdjecie[NieruchomoscDAL::$nazwa].'" id="'.$zdjecie[NieruchomoscDAL::$nazwa].'" /><label for="'.$zdjecie[NieruchomoscDAL::$nazwa].'"><img width="150" src="../../media/'.
                $nier_id2[NieruchomoscDAL::$id_nieruchomosc].'/zdjecia/'.$zdjecie[NieruchomoscDAL::$nazwa].'"></label></td>';
                $i++;
                if ($i % 5 == 0)
                {
                    echo '</tr>';
                }
            }
            echo '</table>';
        }
        
        echo '<br />';
        //jesli nie ma zdjec wywali mi ze zdjecia is not defined, troche niedobrze, cos z tym zrobic
        KontrolkiHtml::DodajSubmit('drukuj', 'id_drukuj', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$druk), 'onclick="return SprawdzElGablota(ilosc_elementow, zdjecia, \''.
        $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nie_zaznaczono_zdjecia).'\', \''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$minimalna_liczba_elementow).': 2.\');"');
        echo '</form><hr />';
        KontrolkiHtml::DodajSubmit('ok', 'id_ok', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zakoncz), 'onclick="window.close();"');        
    }
    require('../../stopka.php');
?>
</body>
</html>
