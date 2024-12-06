<HTML>
<HEAD>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <script language="javascript" src="js/script.js"></script>
<link href="azg.css" rel="stylesheet" type="text/css">
</head>
<body>
<?php
    // ¶ ±
    //session_start();
    include_once ('../dal/stronaDAL.php');
    include_once ('../ui/kontrolki_html.php'); 
    include_once ('../ui/utilsui.php'); 
    include_once ('../bll/tags.php'); 
    include_once ('../bll/jezykibll.php');
    include_once ('../bll/cache.php');
    include_once ('../bll/ofertystronabll.php');
    require('../naglowek.php');
    require('../conf.php');
    
    if (isset($_GET[StronaPodsInfoDAL::$id_trans_rodzaj]) && $_GET[StronaPodsInfoDAL::$id_nier_rodzaj])
    {
        $tlumaczenia = cachejezyki::Czytaj();
        
        if ($_GET[$oferta_hidden] == tags::$oferta)
        {
            $tabParametr[StronaPodsInfoDAL::$id_nier_rodzaj] = $_GET[StronaPodsInfoDAL::$id_nier_rodzaj];
            $tabParametr[StronaPodsInfoDAL::$id_trans_rodzaj] = $_GET[StronaPodsInfoDAL::$id_trans_rodzaj];
            
            $test = new StronaPodsInfoBLL();
                    
            $wynik = $test->PodajOferty($_GET[StronaPodsInfoDAL::$id_trans_rodzaj], $_GET[StronaPodsInfoDAL::$id_nier_rodzaj]);
            
            $regiony = $test->PodajRegiony();
            
            //echo '<br /><br />';
            
            $rodz_bud = $test->PodajRodzajeBudynek();
            $rodz_bud_exist = true;
            
            if ($rodz_bud == null)
            {
                //konieczna jakas extra flaga dla informacji: jesli istnieja rodzaje budynkow wywalamy rodzaj nier - rodzaj bud; jesli nie 
                //index tablicy ponizej - wartosc
                $rodz_bud = array(1 => tags::$pokojowe, 2 => tags::$pokojowe, 3 => tags::$pokojowe, 4 => tags::$pokojowe, 5 => tags::$pokojowe);
                $rodz_bud_exist = false;
            }
            
            echo '<br /><br />';
            //echo '<form name="wiecej" action="szczegoly.php" method="POST">';
            KontrolkiHtml::DodajHidden(StronaPodsInfoDAL::$id_nier_rodzaj, StronaPodsInfoDAL::$id_nier_rodzaj, $_GET[StronaPodsInfoDAL::$id_nier_rodzaj]);
            KontrolkiHtml::DodajHidden(StronaPodsInfoDAL::$id_trans_rodzaj, StronaPodsInfoDAL::$id_trans_rodzaj, $_GET[StronaPodsInfoDAL::$id_trans_rodzaj]);
            KontrolkiHtml::DodajHidden(StronaPodsInfoDAL::$id_oferta, StronaPodsInfoDAL::$id_oferta, '');
            
            if (count($wynik) > 0)
            {
                echo '<center>';
                //wytrzepac jakos haslo mieszkania - sprzedaz
                foreach ($regiony as $region_id => $region)
                {
                    echo '<span width="100%" class="nag2b"><b>'.UtilsUI::KonwersjaEncoding($region, $_SESSION[$jezyk]).'</b></span>';
                    
                    foreach ($rodz_bud as $rodz_bud_id => $rodz_bud_wart)
                    {
                        if (!$rodz_bud_exist)
                        {
                            $rodz_bud_wart = $rodz_bud_id.' - '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], $rodz_bud_wart);
                        }
                        else
                        {
                            $rodz_bud_wart = $tlumaczenia->Tlumacz($_SESSION[$jezyk], $rodz_bud_wart);
                        } 
                        if (isset($wynik[$region_id][$rodz_bud_id]))
                        {
                            echo '<br /><table width="100%" cellpadding="0" cellspacing="0" frameborder="0"><tr><td>
                            <img src="../img/black.gif" width="100%" height="1" border="0"></img></td></tr>';
                            echo '<tr align="left"><td height="7" class="tdnag"><center><span class="nag1wb">'.UtilsUI::KonwersjaEncoding($rodz_bud_wart, $_SESSION[$jezyk]).'</span>
                            </center></td></tr>';
                            echo '<tr><td><img src="../img/black.gif" width="100%" height="1" border="0"></img></td></tr></table>';
                            echo '<table border="0" width="516" cellpadding="0" cellspacing="0" frameborder="0">';
                            
                            foreach ($wynik[$region_id][$rodz_bud_id] as $wiersz)
                            {
                                $sciezka_zdjecie = '../img/zd0.jpg';
                                if ($wiersz[StronaOfertaDAL::$id_nieruchomosc] != null)
                                {
                                    $sciezka_zdjecie = '../media/'.$wiersz[StronaOfertaDAL::$id_nieruchomosc].'/zdjecia/'.$wiersz[StronaOfertaDAL::$zdjecie];
                                }
                                
                                $nag_stat_zaw = '';
                                $stopka_stat_zaw = '';
                                $status = '';
                                
                                if (($wiersz[StronaOfertaDAL::$id_status] == $status_nieaktualny) || ($wiersz[StronaOfertaDAL::$id_status] == $status_zawieszony))
                                {
                                    $nag_stat_zaw = '<span class="zawo">';
                                    $stopka_stat_zaw = '</span>';
                                    $status = '<span class="zawna">'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$oferta_zawieszona).'';
                                }
                                
                                $wylacznosc = '';
                                if ($wiersz[StronaOfertaDAL::$wylacznosc])
                                {
                                    $wylacznosc = '<span class="wyl">'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wylacznosc), $_SESSION[$jezyk]).'</span>';
                                }
                                $tresc = '';
                                $tresc .= '<tr><td width="126" height="63" rowspan = "4" align="center"><center><a href="'.$_SERVER['PHP_SELF'].'?'.tags::$oferta.'='.$wiersz[StronaOfertaDAL::$id_oferta].'&'.
                                StronaPodsInfoDAL::$id_trans_rodzaj.'='.$_GET[StronaPodsInfoDAL::$id_trans_rodzaj].'&'.StronaPodsInfoDAL::$id_nier_rodzaj.'='.$_GET[StronaPodsInfoDAL::$id_nier_rodzaj].'&cat='.$_GET['action'].'">';
                                //dodac a href jak bedzie opcja szczegolowa
                                $tresc .= '<img src="'.$sciezka_zdjecie.'" width="90" height="60" border="0" class="ira" alt="Zdjêcie nr"'.$wiersz[StronaOfertaDAL::$zdjecie].'"></img></a><br>';
                                $tresc .= '</center></td>';
                                
                                $tresc .= '<td><tr><td width="110">'.$nag_stat_zaw.'<b>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$numer_oferty).': </b> '.
                                $wiersz[StronaOfertaDAL::$id_oferta].$stopka_stat_zaw.'</td><td width="150" colspan="3">'.$nag_stat_zaw.'<b>'.
                                $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$lokalizacja).': </b>'.UtilsUI::KonwersjaEncoding($wiersz[StronaOfertaDAL::$lokalizacja], $_SESSION[$jezyk]).$stopka_stat_zaw.'</td></tr>';
                                
                                $tresc .= '<tr>';
                                //tu params i wypos
                                $parametry_nazwy = $wiersz[StronaOfertaDAL::$parametr_nazwa];
                                $parametry_wartosci = $wiersz[StronaOfertaDAL::$parametr_wartosc];
                                $i = 0;
                                if (isset($parametry_nazwy))
                                foreach ($parametry_nazwy as $parametr)
                                {
                                    $tresc .= '<td nowrap>'.$nag_stat_zaw.'<b>'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], $parametr), $_SESSION[$jezyk]).': </b>'.
                                    UtilsUI::KonwersjaEncoding($parametry_wartosci[$i], $_SESSION[$jezyk]);
                                    $tresc .= $stopka_stat_zaw.'</td>';
                                    $i++;
                                }
                                
                                if (isset($wiersz[StronaOfertaDAL::$wyposazenie]))
                                foreach ($wiersz[StronaOfertaDAL::$wyposazenie] as $wyposazenie)
                                {
                                    $odlamki = explode(' : ', $wyposazenie);
                                    $tresc .= '<td nowrap>'.$nag_stat_zaw.'<b>'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], $odlamki[0]), $_SESSION[$jezyk]).': </b>'.
                                    UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], $odlamki[1]), $_SESSION[$jezyk]);
                                    $tresc .= $stopka_stat_zaw.'</td>';
                                }
                                
                                $tresc .= '</tr>';
                                
                                //pomyslec co z waluta :P
                                $tresc .= '<tr><td width="130">'.$nag_stat_zaw.'<b>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$cena).': </b>'.$wiersz[StronaOfertaDAL::$cena].'.'.
                                $stopka_stat_zaw.'</td><td>'.$status.'&nbsp;'.$wylacznosc.'</td><td width="126"><a href="'.$_SERVER['PHP_SELF'].'?'.tags::$oferta.'='.$wiersz[StronaOfertaDAL::$id_oferta].'&'.
                                StronaPodsInfoDAL::$id_trans_rodzaj.'='.$_GET[StronaPodsInfoDAL::$id_trans_rodzaj].'&'.StronaPodsInfoDAL::$id_nier_rodzaj.'='.$_GET[StronaPodsInfoDAL::$id_nier_rodzaj].'&cat='.$_GET['action'].'">'.
                                $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wiecej).'</a></td></tr>';
                                
                                                                
                                $tresc .= '</tr>';
                                $tresc .= '<tr><td colspan="40"><img src="../img/black.gif" width="100%" height="1" border="0"></img></td></tr></center>';

                                echo $tresc;
                            }
                            
                            echo '</table>';
                        }
                    }
                }

                echo '</center>';
            }
            //echo '</form>';
        }
    }
    
    require('../stopka.php');

?>
</body>
</html>
