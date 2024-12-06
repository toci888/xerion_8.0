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
    include_once ('../bll/gablotabll.php');
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
        
        if (isset($_POST['kasuj_cache']))
        {
            //unset($_SESSION[$gablota_zmiany]);
            cacheGablota::Usun();
        }

        $dane_gablota = cacheGablota::Czytaj();
        
        if (isset($_POST['zatwierdz']))
        {
            ///if 2 oferty input i optymalnie exist; dodatkowo trans i nier rodzaj
            $dal = new TransNierDAL();
            $wynik_of_1 = $dal->PodajTransIdNierIdOferta($_POST['oferta_1']);
            $wynik_of_2 = $dal->PodajTransIdNierIdOferta($_POST['oferta_2']);
            
            echo '<script>window.open(\'popup/gablota_laczone.php?'.NieruchomoscDAL::$id_oferta.'1='.$_POST['oferta_1'].'&'.NieruchomoscDAL::$id_nier_rodzaj.'1='.$wynik_of_1[0][NieruchomoscDAL::$id_nier_rodzaj].'&'.
            NieruchomoscDAL::$id_trans_rodzaj.'1='.$wynik_of_1[0][NieruchomoscDAL::$id_trans_rodzaj].'&'.NieruchomoscDAL::$id_nier_rodzaj.'2='.$wynik_of_2[0][NieruchomoscDAL::$id_nier_rodzaj].'&'.
            NieruchomoscDAL::$id_trans_rodzaj.'2='.$wynik_of_2[0][NieruchomoscDAL::$id_trans_rodzaj].'&'.
            NieruchomoscDAL::$id_oferta.'2='.$_POST['oferta_2'].'\', \'gablota_laczone\',\'toolbar=no, scrollbars=yes, width=1050,height=720\');</script>';
        }
        
        echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'"><table><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nr_oferty).' 1 :</td><td>';
        KontrolkiHtml::DodajLiczbaCalkowitaTextbox('oferta_1', 'id_oferta_1', '', 6, 4, '');
        echo '</td><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nr_oferty).' 2 :</td><td>';
        KontrolkiHtml::DodajLiczbaCalkowitaTextbox('oferta_2', 'id_oferta_2', '', 6, 4, '');
        echo '</td><td>';
        KontrolkiHtml::DodajSubmit('zatwierdz', 'id_zatwierdz', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zatwierdz), '');
        echo '</td></tr></table></form><hr />';               //zm cena
        $kolory_bg = array(0 => '#999933', 1 => '#aaaaaa', 2 => '#3366dd', 3 => '#aa4455');
        $gablota_id = null;
        
        if (isset($_POST['gablota_id']))
        {
            $gablota_id = $_POST['gablota_id'];
        }
        if (isset($_POST['gablota_id_st']))
        {
            $gablota_id = $_POST['gablota_id_st'];
        }
        
        $cache_gab = new GablotaBLL($dane_gablota);
        
        if (isset($_POST['zamien_na_gabl']))
        {
            //utw dala pod zamiane na gabl
            //$gablota_id = $_POST['gablota_id_st'];
            $dal = new GablotaDAL();
            
            if (isset($_POST['oferty_zdj']))
            {
                $dane_of_gab = explode('_', $_POST['oferty_zdj']);
                //0 - wsp x, 1 - wsp y, 2 - nr oferty, 3 - status
                
                if (!isset($_POST['oferty_wl']))
                {
                    //jesli zaszla zmiana ceny - status (ind 3) jest równy 2 - stat zm ceny
                    if ($dane_of_gab[3] == 2)
                    {
                        //uznac podmiane
                        $tabParametr[NieruchomoscDAL::$id_oferta] = $dane_of_gab[2];
                        $tabParametr[NieruchomoscDAL::$id_nier_rodzaj] = $dane_of_gab[4];
                        $tabParametr[NieruchomoscDAL::$id_trans_rodzaj] = $dane_of_gab[5];
                        $tabParametr[GablotaDAL::$id_gablota] = $gablota_id;
                        $tabParametr[GablotaDAL::$wspolrzedna_x] = $dane_of_gab[0];
                        $tabParametr[GablotaDAL::$wspolrzedna_y] = $dane_of_gab[1];
                        $tabParametr[NieruchomoscDAL::$nazwa] = $_POST['gablota'];
                        $dal->DodajOfertaGablota($tabParametr);
                        //dodac do jakiegos cache etc zeby walnac raport
                        $cache_gab->DodajElement($tabParametr, $dane_of_gab[2]);
                        cacheGablota::Zapisz($cache_gab->PodajKolekcje());
                    }
                    //nic sie nie dzieje
                }
                else
                {
                    $dane_of_wl = explode('_', $_POST['oferty_wl']);
                    $tabParametr[NieruchomoscDAL::$id_oferta] = $dane_of_wl[0];
                    $tabParametr[NieruchomoscDAL::$id_nier_rodzaj] = $dane_of_wl[1];
                    $tabParametr[NieruchomoscDAL::$id_trans_rodzaj] = $dane_of_wl[2];
                    $tabParametr[GablotaDAL::$id_gablota] = $gablota_id;
                    $tabParametr[GablotaDAL::$wspolrzedna_x] = $dane_of_gab[0];
                    $tabParametr[GablotaDAL::$wspolrzedna_y] = $dane_of_gab[1];
                    $tabParametr[NieruchomoscDAL::$nazwa] = $_POST['gablota'];
                    $dal->DodajOfertaGablota($tabParametr);
                    //dodac do jakiegos cache etc zeby walnac raport
                    $cache_gab->DodajElement($tabParametr, $dane_of_gab[2]);
                    cacheGablota::Zapisz($cache_gab->PodajKolekcje());
                }
            }
        }

        if (isset($_POST['podaj_stan_gablota']))
        {
            $dal = new GablotaDAL();
            $wynik = $dal->StanGabloty(array(GablotaDAL::$id_gablota_zawartosc => $gablota_id), $ilosc_wierszy);

            echo '<table><tr><td>';
            
            echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'"><table>';
            KontrolkiHtml::DodajHidden('podaj_stan_gablota', 'podaj_stan_gablota', $_POST['podaj_stan_gablota']);
            KontrolkiHtml::DodajHidden('gablota_id_st', 'gablota_id_st', $gablota_id);
            KontrolkiHtml::DodajHidden('gablota', 'gablota', $_POST['gablota']);
            $tr = 0;
            foreach ($wynik as $wiersz)
            {
                if ($wiersz[GablotaDAL::$wspolrzedna_y] != $tr && $tr > 0)
                {
                    echo '</tr>';
                }
                if ($wiersz[GablotaDAL::$wspolrzedna_y] != $tr)
                {
                    $licz_kol = 0;
                    $tr = $wiersz[GablotaDAL::$wspolrzedna_y];
                    echo '<tr>';
                }
                $licz_kol++;
                echo '<td bgcolor="'.$kolory_bg[$wiersz[GablotaDAL::$stan]].'"><input type="radio" id="oferty_zdj'.$wiersz[NieruchomoscDAL::$id_oferta].'" name="oferty_zdj" value="'.$wiersz[GablotaDAL::$wspolrzedna_x].'_'.
                $wiersz[GablotaDAL::$wspolrzedna_y].'_'.$wiersz[NieruchomoscDAL::$id_oferta].'_'.$wiersz[GablotaDAL::$stan].'_'.$wiersz[NieruchomoscDAL::$id_nier_rodzaj].
                '_'.$wiersz[NieruchomoscDAL::$id_trans_rodzaj].'" /><label for="oferty_zdj'.$wiersz[NieruchomoscDAL::$id_oferta].'">'.$wiersz[NieruchomoscDAL::$id_oferta].'</label>';
                if (isset($wiersz[StronaOfertaDAL::$id_oferta]))
                {
                    echo '<a target="_blank" href="'.$strona_www.tags::$oferta.'='.$wiersz[StronaOfertaDAL::$id_oferta].'&'.StronaPodsInfoDAL::$id_trans_rodzaj.'='.$wiersz[StronaPodsInfoDAL::$id_trans_rodzaj].'&'.StronaPodsInfoDAL::$id_nier_rodzaj.'='.
                    $wiersz[StronaPodsInfoDAL::$id_nier_rodzaj].'">'.strtolower(UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$pokaz), $_SESSION[$jezyk])).'</a>';
                }
                echo '</td>';
            }
            echo '</table>';
            $wynik = $dal->PodajOfertyDostepneGablota(array(GablotaDAL::$id_gablota_zawartosc => $gablota_id), $ilosc_wierszy);
            echo '<table>';
            $i = 0;
            foreach ($wynik as $wiersz)
            {
                if ($i % $licz_kol == 0)
                {
                    echo '<tr>';
                }
                echo '<td><input type="radio" id="oferty_wl'.$wiersz[NieruchomoscDAL::$id_oferta].'" name="oferty_wl" value="'.$wiersz[NieruchomoscDAL::$id_oferta].'_'.$wiersz[NieruchomoscDAL::$id_nier_rodzaj].
                '_'.$wiersz[NieruchomoscDAL::$id_trans_rodzaj].'" /><label for="oferty_wl'.$wiersz[NieruchomoscDAL::$id_oferta].'">'.$wiersz[NieruchomoscDAL::$id_oferta].'</label>
                <a target="_blank" href="'.$strona_www.tags::$oferta.'='.$wiersz[StronaOfertaDAL::$id_oferta].'&'.StronaPodsInfoDAL::$id_trans_rodzaj.'='.$wiersz[StronaPodsInfoDAL::$id_trans_rodzaj].'&'.StronaPodsInfoDAL::$id_nier_rodzaj.'='.
                $wiersz[StronaPodsInfoDAL::$id_nier_rodzaj].'">'.strtolower(UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$pokaz), $_SESSION[$jezyk])).'</a></td>';
                $i++;
                if ($i % $licz_kol == 0)
                {
                    echo '</tr>';
                }
            }
            echo '</table>';
            KontrolkiHtml::DodajSubmit('zamien_na_gabl', 'id_zamien_na_gabl', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zamiana), '');
            echo '</form>';
            
            echo '</td><td>';
            $tablica_zmian = $cache_gab->PodajKolekcje();
            if (is_array($tablica_zmian))
            {
                $licznik_gab = 0;
                foreach ($tablica_zmian as $element)
                {
                    //var_dump($element);
                    echo $element->nazwa.' -- '.$element->oferta_out.'  ===>  '.$element->oferta_in.', '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wspolrzedne).': '.$element->wsp_x.' x '.$element->wsp_y.'.&nbsp;';
                    if ($licznik_gab % 2 == 0)
                    {
                        $poprzedni_element = $element;
                    }
                    if ($licznik_gab % 2 == 1)
                    {
                        KontrolkiHtml::DodajPopUpButton($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$druk), 'oferty_gablota'.$licznik_gab, 'popup/gablota_laczone.php?'.NieruchomoscDAL::$id_oferta.'1='.$poprzedni_element->oferta_in.'&'.NieruchomoscDAL::$id_nier_rodzaj.'1='.
                        $poprzedni_element->nier_id.'&'.NieruchomoscDAL::$id_trans_rodzaj.'1='.$poprzedni_element->trans_id.'&'.NieruchomoscDAL::$id_nier_rodzaj.'2='.$element->nier_id.'&'.
                        NieruchomoscDAL::$id_trans_rodzaj.'2='.$element->trans_id.'&'.NieruchomoscDAL::$id_oferta.'2='.$element->oferta_in, 1050, 720);
                    }
                    echo '<br />';
                    $licznik_gab++;
                }
                //button kasuj. drukuj
                echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'">';
                KontrolkiHtml::DodajSubmit('kasuj_cache', 'id_kasuj_cache', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$kasuj), '');
                echo '&nbsp;';
                KontrolkiHtml::DodajPopUpButton($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$druk), 'druk_podsumowanie', 'popup/podsumowanie_gabloty.php', $szer_lista_wsk, $dl_lista_wsk);
                echo '</form>';
            }
            echo '</td></tr></table>';
        }
        
        echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'"><table><tr><td>';
        KontrolkiHtml::DodajSelectZrodSlownik('gablota', 'id_gablota', SlownikDAL::$gablota, 'gablota_id', $gablota_id, '', '');
        echo '</td><td>';
        KontrolkiHtml::DodajSubmit('podaj_stan_gablota', '', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zatwierdz), '');
        echo '</td></tr></table></form>';
    }
    require('../stopka.php');
?>
</body>
</html>
