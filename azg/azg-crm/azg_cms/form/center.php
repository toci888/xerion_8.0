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
    
    include_once ('dal/stronaDAL.php');
    include_once ('ui/kontrolki_html.php'); 
    include_once ('ui/utilsui.php'); 
    include_once ('bll/tags.php'); 
    include_once ('bll/jezykibll.php');
    include_once ('bll/cache.php');
    include_once ('bll/ofertystronabll.php');
    require('naglowek.php');
    require('conf.php');
    
    //if (isset($_POST['filtruj']))
    if (isset($_GET['filtruj_nr_oferta']))
    {
        if (strlen($_GET[StronaPodsInfoDAL::$id_oferta]) > 0)
        {
            $dal = new StronaPodsInfoDAL();
            $of_wysw = $dal->OfertaWyswietl($_GET[StronaPodsInfoDAL::$id_oferta]);
            if ($of_wysw)
            {
                $wynik = $dal->PodajTransIdNierIdOferta($_GET[StronaPodsInfoDAL::$id_oferta]);
                if (isset($wynik[0][StronaPodsInfoDAL::$id_trans_rodzaj]))
                {
                    $adres_url = $strona_www.tags::$oferta.'='.$_GET[StronaPodsInfoDAL::$id_oferta].'&'.NieruchomoscDAL::$id_trans_rodzaj.'='.$wynik[0][StronaPodsInfoDAL::$id_trans_rodzaj].'&'.
                    NieruchomoscDAL::$id_nier_rodzaj.'='.$wynik[0][StronaPodsInfoDAL::$id_nier_rodzaj];
                    header('Location: '.$adres_url);
                }
            }
        }
    }
    if (isset($_GET['filtruj']))
    {
        //$filtrowanie[StronaPodsInfoDAL::$pow_min] = $_POST[StronaPodsInfoDAL::$pow_min];
        $filtrowanie[StronaPodsInfoDAL::$pow_min] = $_GET[StronaPodsInfoDAL::$pow_min];
        $filtrowanie[StronaPodsInfoDAL::$l_pok_min] = $_GET[StronaPodsInfoDAL::$l_pok_min];
        //$filtrowanie[StronaPodsInfoDAL::$pow_max] = $_POST[StronaPodsInfoDAL::$pow_max];
        $filtrowanie[StronaPodsInfoDAL::$pow_max] = $_GET[StronaPodsInfoDAL::$pow_max];
        $filtrowanie[StronaPodsInfoDAL::$l_pok_max] = $_GET[StronaPodsInfoDAL::$l_pok_max];
        //$filtrowanie[StronaPodsInfoDAL::$cena_max] = $_POST[StronaPodsInfoDAL::$cena_max];
        $filtrowanie[StronaPodsInfoDAL::$cena_max] = $_GET[StronaPodsInfoDAL::$cena_max];
        $filtrowanie[StronaPodsInfoDAL::$id_region_geog] = $_GET[StronaPodsInfoDAL::$id_region_geog];
        $filtrowanie[NieruchomoscDAL::$id_jezyk] = $_SESSION[$jezyk];
        $filtrowanie[NieruchomoscDAL::$adres] = $_SERVER['REMOTE_ADDR'];
        //$_GET[StronaPodsInfoDAL::$id_trans_rodzaj] = $_POST[StronaPodsInfoDAL::$id_trans_rodzaj];
        
        //$_GET[StronaPodsInfoDAL::$id_nier_rodzaj] = $_POST[StronaPodsInfoDAL::$id_nier_rodzaj];
        
        
        $_GET[$oferta_hidden] = tags::$oferta;
    }
    
    if (isset($_GET[StronaPodsInfoDAL::$id_trans_rodzaj]) && $_GET[StronaPodsInfoDAL::$id_nier_rodzaj])
    {
        $tlumaczenia = cachejezyki::Czytaj();
        
        if ($_GET[$oferta_hidden] == tags::$oferta)
        {
            $tabParametr[StronaPodsInfoDAL::$id_nier_rodzaj] = $_GET[StronaPodsInfoDAL::$id_nier_rodzaj];
            $tabParametr[StronaPodsInfoDAL::$id_trans_rodzaj] = $_GET[StronaPodsInfoDAL::$id_trans_rodzaj];
            
            //if (isset($_POST['filtruj']))
            if (isset($_GET['filtruj']))
            {
                if (strlen($_GET[StronaPodsInfoDAL::$pow_min]) > 0 || strlen($_GET[StronaPodsInfoDAL::$pow_max]) > 0 || strlen($_GET[StronaPodsInfoDAL::$cena_max]) > 0 || strlen($_GET[StronaPodsInfoDAL::$l_pok_min]) > 0 || strlen($_GET[StronaPodsInfoDAL::$l_pok_max]) > 0 || $_GET[StronaPodsInfoDAL::$id_region_geog] != 1)
                {
                    $test = new StronaPodsInfoBLL($filtrowanie);
                }
                else
                {
                    $test = new StronaPodsInfoBLL();
                }
            }
            else
            {
                $test = new StronaPodsInfoBLL();
            }
                    
            $wynik = $test->PodajOferty($_GET[StronaPodsInfoDAL::$id_trans_rodzaj], $_GET[StronaPodsInfoDAL::$id_nier_rodzaj]);
            
            $rodzaj_oferty = $test->RodzajOferta($_GET[StronaPodsInfoDAL::$id_trans_rodzaj], $_GET[StronaPodsInfoDAL::$id_nier_rodzaj]);
            echo '<center><span class="nag2b"><b>'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], $rodzaj_oferty[0][StronaOfertaDAL::$nieruchomosc_rodzaj]), $_SESSION[$jezyk]).' - '.
            UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], $rodzaj_oferty[0][StronaOfertaDAL::$transakcja_rodzaj]), $_SESSION[$jezyk]).'</b><br /></span></center>';
                
            //echo '<form name="wiecej" action="szczegoly.php" method="POST">';
            //KontrolkiHtml::DodajHidden(StronaPodsInfoDAL::$id_nier_rodzaj, StronaPodsInfoDAL::$id_nier_rodzaj, $_GET[StronaPodsInfoDAL::$id_nier_rodzaj]);
            //KontrolkiHtml::DodajHidden(StronaPodsInfoDAL::$id_trans_rodzaj, StronaPodsInfoDAL::$id_trans_rodzaj, $_GET[StronaPodsInfoDAL::$id_trans_rodzaj]);
            //KontrolkiHtml::DodajHidden(StronaPodsInfoDAL::$id_oferta, StronaPodsInfoDAL::$id_oferta, '');
            
            if (count($wynik) > 0)
            {
                $regiony = $test->PodajRegiony();

                $rodz_bud = $test->PodajRodzajeBudynek();
                $rodz_bud_exist = true;
                
                //dla mieszkan agregacja po pokojach
                //if ($rodz_bud == null)
                if ($_GET[StronaPodsInfoDAL::$id_nier_rodzaj] == 2) //jesli to mieszkanie
                {
                    //konieczna jakas extra flaga dla informacji: jesli istnieja rodzaje budynkow wywalamy rodzaj nier - rodzaj bud; jesli nie 
                    //index tablicy ponizej - wartosc
                    $rodz_bud = array(1 => tags::$pokojowe, 2 => tags::$pokojowe, 3 => tags::$pokojowe, 4 => tags::$pokojowe, 5 => tags::$pokojowe);
                    $rodz_bud_exist = false;
                }
            
                echo '<center>';
                $licznik = 0;
                $il_region = 0;
                foreach ($regiony as $region_id => $region)
                {
                    echo '<table width="100%" cellpadding="0" cellspacing="0" frameborder="0"><tr><td align="center" class="tdregnag"><span width="100%" class="nagglowny"><b>';
                    if ($il_region > 0)
                    {
                        echo UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$powiat), $_SESSION[$jezyk]).' ';
                    }
                    echo UtilsUI::KonwersjaEncoding($region, $_SESSION[$jezyk]).'</b></span></td></tr></table>';
                    
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
                            //<br />
                            echo '<table width="100%" cellpadding="0" cellspacing="0" frameborder="0"><tr><td>
                            <img src="img/black.gif" width="100%" height="1" border="0"></img></td></tr>';
                            echo '<tr align="left"><td height="7" class="tdnag"><center><span class="nag1wb">'.UtilsUI::KonwersjaEncoding($rodz_bud_wart, $_SESSION[$jezyk]).'</span>
                            </center></td></tr>';
                            echo '<tr><td><img src="img/black.gif" width="100%" height="1" border="0"></img></td></tr></table>';
                            echo '<table border="0" width="516" cellpadding="1" cellspacing="0" frameborder="0">';
               
                            foreach ($wynik[$region_id][$rodz_bud_id] as $wiersz)
                            {
                                if ($licznik % 2 == 0)
                                {
                                    $kolor_tlo = '#eff0ff';
                                    $klucz_url = 'kluczyk_j.gif';
                                }
                                else
                                {
                                    $kolor_tlo = '#dfefee';
                                    $klucz_url = 'kluczyk_c.gif';
                                }
                                $tresc = '';
                                $sciezka_zdjecie = 'img/zd0.jpg';
                                if ($wiersz[StronaOfertaDAL::$zdjecie] != null)
                                {
                                    $sciezka_zdjecie = 'media/'.$wiersz[StronaOfertaDAL::$id_nieruchomosc].'/zdjecia/m_'.$wiersz[StronaOfertaDAL::$zdjecie];
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
                                ///wstrzymana poczatek i koniec
                                $wst_p = '';
                                $wst_k = '';
                                if ($wiersz[StronaOfertaDAL::$id_status] == $status_wstrzymany)
                                {
                                    //$wiersz[StronaOfertaDAL::$id_oferta] = '<u>'.$wiersz[StronaOfertaDAL::$id_oferta].'</u>';
                                    $wst_p = '<u>';
                                    $wst_k = '</u>';
                                }
                                if ($wiersz[StronaOfertaDAL::$klucz])
                                {
                                    //filter:progid:DXImageTransform.Microsoft.AlphaImageLoader (src='images/image.png',sizingMethod='scale');
                                    $wst_k .= '&nbsp;<img width="15" src="img/'.$klucz_url.'"></img>';
                                }
                                
                                $wylacznosc = '';
                                if ($wiersz[StronaOfertaDAL::$wylacznosc])
                                {
                                    $wylacznosc = '<span class="wyl">'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wylacznosc), $_SESSION[$jezyk]).'</span>';
                                }
                                $tresc = '';
                                $tresc .= '<tr bgcolor="'.$kolor_tlo.'"><td width="126"  height="63" rowspan="4" align="center"><center><a href="http://'.$_SERVER['SERVER_NAME'].'/'.
                                $rodzaj_nier_url[$wiersz[StronaPodsInfoDAL::$id_nier_rodzaj]].'?'.tags::$oferta.'='.
                                $wiersz[StronaOfertaDAL::$id_oferta].'&'.StronaPodsInfoDAL::$id_trans_rodzaj.'='.$_GET[StronaPodsInfoDAL::$id_trans_rodzaj].'&'.StronaPodsInfoDAL::$id_nier_rodzaj.'='.
                                $_GET[StronaPodsInfoDAL::$id_nier_rodzaj].'&cat='.$_GET['action'].'">';
                                //dodac a href jak bedzie opcja szczegolowa
                                $tresc .= KontrolkiHtml::DodajZdjNierStrona($sciezka_zdjecie, $_GET[StronaPodsInfoDAL::$id_nier_rodzaj], $wiersz[StronaOfertaDAL::$id_oferta], 90, 60).'</a>';
                                $tresc .= '</center></td></tr>';
                                
                                $tresc .= '<tr bgcolor="'.$kolor_tlo.'"><td  nowrap="nowrap">'.$nag_stat_zaw.'<b>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$numer_oferty).': </b> '.
                                $wst_p.$wiersz[StronaOfertaDAL::$id_oferta].$wst_k.$stopka_stat_zaw.'</td><td  colspan="3">'.$nag_stat_zaw.'<b>'.
                                $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$lokalizacja).': </b>'.UtilsUI::KonwersjaEncoding($wiersz[StronaOfertaDAL::$lokalizacja], $_SESSION[$jezyk]).$stopka_stat_zaw.'</td></tr>';
                                
                                $tresc .= '<tr bgcolor="'.$kolor_tlo.'">';
                                //tu params i wypos
                                $parametry_nazwy = $wiersz[StronaOfertaDAL::$parametr_nazwa];
                                $parametry_wartosci = $wiersz[StronaOfertaDAL::$parametr_wartosc];
                                $i = 0;
                                if (isset($parametry_nazwy))
                                foreach ($parametry_nazwy as $parametr)
                                {
                                    $no_wrap = 'nowrap="nowrap"';
                                    if (strlen($parametr.$parametry_wartosci[$i]) > 26)
                                    {
                                        $no_wrap = '';
                                    }
                                    $tresc .= '<td '.$no_wrap.'>'.$nag_stat_zaw.'<b>'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], $parametr), $_SESSION[$jezyk]).': </b>'.
                                    UtilsUI::KonwersjaEncoding($parametry_wartosci[$i], $_SESSION[$jezyk]);
                                    $tresc .= $stopka_stat_zaw.'</td>';
                                    $i++;
                                }
                                
                                if (isset($wiersz[StronaOfertaDAL::$wyposazenie]))
                                foreach ($wiersz[StronaOfertaDAL::$wyposazenie] as $wyposazenie)
                                {
                                    $odlamki = explode(' : ', $wyposazenie);
                                    $tresc .= '<td  nowrap>'.$nag_stat_zaw.'<b>'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], $odlamki[0]), $_SESSION[$jezyk]).': </b>'.
                                    UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], $odlamki[1]), $_SESSION[$jezyk]);
                                    $tresc .= $stopka_stat_zaw.'</td>';
                                    $i++;
                                }
                                while ($i < 3)
                                {
                                    $tresc .= '<td>&nbsp;</td>';
                                    $i++;
                                }
                                
                                $tresc .= '</tr>';
                                
                                $cena = number_format($wiersz[StronaOfertaDAL::$cena], 0, ',', '.');
                                
                                //pomyslec co z waluta :P
                                $tresc .= '<tr bgcolor="'.$kolor_tlo.'"><td >'.$nag_stat_zaw.'<b>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$cena).': </b>'.$cena.' PLN.'.
                                $stopka_stat_zaw.'</td><td>'.$status.'&nbsp;'.$wylacznosc.'</td><td width="126"><a href="http://'.$_SERVER['SERVER_NAME'].'/'.$rodzaj_nier_url[$wiersz[StronaPodsInfoDAL::$id_nier_rodzaj]].'?'.
                                tags::$oferta.'='.$wiersz[StronaOfertaDAL::$id_oferta].'&'.
                                StronaPodsInfoDAL::$id_trans_rodzaj.'='.$_GET[StronaPodsInfoDAL::$id_trans_rodzaj].'&'.StronaPodsInfoDAL::$id_nier_rodzaj.'='.$_GET[StronaPodsInfoDAL::$id_nier_rodzaj].'&cat='.$_GET['action'].'">'.
                                strtolower(UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wiecej_o_nieruchomosci), $_SESSION[$jezyk])).'</a></td></tr>';
                                
                                                                
                                $tresc .= '</tr>';
                                //<tr><td  colspan="40"><img src="img/black.gif" width="100%" height="1" border="0"></img></td></tr>
                                $tresc .= '<tr bgcolor="white"><td colspan="40"></td></tr></center>';

                                //$tresc .= '</div>';
                                echo $tresc;
                                $licznik++;
                            }
                            
                            echo '</table>';
                        }
                    }
                    $il_region++;
                }

                echo '</center>';
            }
            else
            {
                echo '<center>';
                UtilsUI::IstotneInfo(UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nie_znaleziono_ofert), $_SESSION[$jezyk]));
                echo '</center>';
            }
            //echo '</form>';
        }
    }
    
    require('stopka.php');

?>
</body>
</html>
