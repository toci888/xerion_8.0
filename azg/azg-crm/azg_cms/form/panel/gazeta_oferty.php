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
    include_once ('../dal/stronaDAL.php');
    include_once ('../ui/kontrolki_html.php');
    include_once ('../ui/utilsui.php');
    include_once ('../bll/parametrynierbll.php'); 
    include_once ('../bll/tags.php'); 
    include_once ('../bll/agentbll.php');
    include_once ('../bll/jezykibll.php');
    include_once ('../bll/cache.php');
    include_once ('../bll/utilsbll.php');
    include_once ('../bll/transnierbll.php');
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
        
        $lista_oferta = null;
        $sep = ',';
        $plik_nazwa = 'gazeta_ogl.txt';
        $map_array = array('_liczba_pokoi' => 'pokojowe', '_powierzchnia_uzytkowa' => 'm2', '_numer_pietra' => 'piêtro', '_liczba_pieter' => 'piêtrowy', '_powierzchnia_dzialki' => 'ar');
        
        if (isset($_POST['zatwierdz_oferty_gazety']))
        {
            $oferty = explode($sep, $_POST['oferty_id']);
            //otworzenie pliku do zapisu
            $handle = fopen($plik_nazwa, 'w');
            $i = 0;
            foreach ($oferty as $oferta)
            {
                $i++;
                if ($oferta > 0)
                {
                    //rozklepac parametry na dwukropek i zastosowac skrotowe zamienniki slow
                    //pobranie ceny i lokalizacji
                    if (isset($_POST['parametry'.$oferta]))
                    {
                        fwrite($handle, $i.'. ');
                        /*if (isset($_POST['pierwszy'.$oferta]))
                        {
                            $parametr = explode(' : ', $_POST['parametry'.$oferta][$_POST['pierwszy'.$oferta]]);
                            fwrite($handle, $parametr[1].' '.$map_array[$parametr[0]].' ');
                            unset($_POST['parametry'.$oferta][$_POST['pierwszy'.$oferta]]);
                        } */
                        foreach ($_POST['parametry'.$oferta] as $wyb_param)
                        {
                            //var_dump($wyb_param);
                            $parametr = explode(' : ', $wyb_param);
                            if ($parametr[0] == '_powierzchnia_dzialki')
                            {
                                $parametr[1] = $parametr[1] / 100;
                            }
                            fwrite($handle, $parametr[1].' '.$map_array[$parametr[0]].' ');
                        }
                        if (isset($_POST['rodzaj_budynek'.$oferta]))
                        {
                            fwrite($handle, UtilsUI::KonwersjaEncoding($_POST['rodzaj_budynek'.$oferta].' ', $_SESSION[$jezyk]));
                        }
                        if (isset($_POST['lokalizacja'.$oferta]))
                        {
                            fwrite($handle, UtilsUI::KonwersjaEncoding($_POST['lokalizacja'.$oferta].' ', $_SESSION[$jezyk]));
                        }
                        if (isset($_POST['cena'.$oferta]))
                        {
                            //$cena = number_format($oferta[StronaOfertaDAL::$cena], 0, ',', '.');
                            fwrite($handle, number_format($_POST['cena'.$oferta].' ', 0, ',', '.').' ');
                        }
                        fwrite($handle, $AZG.' ');
                        if (isset($_POST['komorka'.$oferta]))
                        {
                            fwrite($handle, $_POST['komorka'.$oferta].' ');
                        }
                        fwrite($handle, "wiêcej na www.azg.pl\n");
                    }
                }
            }
            fclose($handle);
            echo '<a href="'.$plik_nazwa.'" target="_blank">'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$pobierz_plik).'</a><br />';
        }
        
        if (isset($_POST['lista_oferta']))
        {
            $lista_oferta = $_POST['lista_oferta'];
            $tab_ofert_tym = explode($sep, $_POST['lista_oferta']);
            Utils::KonwertujTabIndWar($tab_ofert_tym, $tab_ofert);
            $dal = new StronaPodsInfoDAL();
            $dal_sz_of = new StronaOfertaDAL();
            echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'"><table>';
            
            $i = 0;
            $oferty_ok = '';
            foreach ($tab_ofert as $oferta_id)
            {
                //pobranie informacji o ofercie, budowa formularza
                $wynik = $dal->PodajTransIdNierIdOfertaAkt($oferta_id);
                if (is_array($wynik))
                {
                    $oferty_ok .= $oferta_id.$sep;
                    $tabParametr[StronaOfertaDAL::$id_nieruchomosc] = $wynik[0][NieruchomoscDAL::$id_nieruchomosc];
                    $tabParametr[StronaOfertaDAL::$id_nier_rodzaj] = $wynik[0][NieruchomoscDAL::$id_nier_rodzaj];
                    $tabParametr[StronaOfertaDAL::$id_trans_rodzaj] = $wynik[0][NieruchomoscDAL::$id_trans_rodzaj];

                    $dane = $dal_sz_of->OfertaInfoSekcje($tabParametr, $sekcja_podstawowa_id);
                    $cena_lok = $dal->OfertaSkroconaPojGablota(array(NieruchomoscDAL::$id_oferta => $oferta_id), $ilosc_wierszy);
                    $informacje = $dane[0];
                    $parametry = $informacje['parametry'];
                    $wyposazenia = $informacje['wyposazenia'];     
                    echo '<tr><td><b>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nr_oferty).': '.$oferta_id.'</b></td></tr>';
                    echo '<tr>';
                    $licznik = 0;
                    foreach ($parametry as $parametr)
                    {
                        echo '<td>';
                        //echo '<input type="radio" name="pierwszy'.$oferta_id.'" value="'.$licznik.'" /><br />';
                        echo '<input type="checkbox" name="parametry'.$oferta_id.'[]" id="'.$parametr.$i.'" value="'.$parametr.'" /><label for="'.$parametr.$i.'">'.$tlumaczenia->TlumaczZlozenieTag($_SESSION[$jezyk], $parametr, ' : ').'</label>';
                        echo '</td>';
                        $i++;
                        $licznik++;
                    }
                    echo '</tr><tr>';
                    echo '<td><input type="checkbox" name="cena'.$oferta_id.'" id="cena'.$oferta_id.'" value="'.$cena_lok[0][NieruchomoscDAL::$cena].'" /><label for="cena'.$oferta_id.'">'.
                    $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$cena).': '.$cena_lok[0][NieruchomoscDAL::$cena].'</label></td>';
                    echo '<td><input type="checkbox" name="lokalizacja'.$oferta_id.'" id="lokalizacja'.$oferta_id.'" value="'.$cena_lok[0][StronaOfertaDAL::$lokalizacja].'" /><label for="lokalizacja'.$oferta_id.'">'.
                    $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$lokalizacja).': '.$cena_lok[0][StronaOfertaDAL::$lokalizacja].'</label></td>';
                    echo '<td><input type="checkbox" name="rodzaj_budynek'.$oferta_id.'" id="rodzaj_budynek'.$oferta_id.'" value="'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], $cena_lok[0][StronaOfertaDAL::$rodzaj_budynek]).'" /><label for="rodzaj_budynek'.$oferta_id.'">'.
                    $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$rodzaj_budynek).': '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], $cena_lok[0][StronaOfertaDAL::$rodzaj_budynek]).'</label></td>';
                    echo '<td><input type="checkbox" name="komorka'.$oferta_id.'" id="komorka'.$oferta_id.'" value="'.$cena_lok[0][OsobaDAL::$komorka].'" /><label for="komorka'.$oferta_id.'">'.
                    $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$telefon_komorkowy).': '.$cena_lok[0][OsobaDAL::$komorka].'</label></td>';
                    echo '</tr>';
                }
            }
            KontrolkiHtml::DodajHidden('id_oferty_id', 'oferty_id', $oferty_ok);
            echo '<tr><td>';
            KontrolkiHtml::DodajSubmit('zatwierdz_oferty_gazety', 'id_zatwierdz_oferty_gazety', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zatwierdz), '');
            echo '</td></tr>';
            echo '</table></form><hr />';
        }
        
        UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podaj_oferty_oddzielone_przecinkiem));
        echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'"><table><tr><td>';
        //zwalidowac - przecinki, spacje, cyfry koniec
        KontrolkiHtml::DodajTextArea('lista_oferta', 'id_lista_oferta', $lista_oferta, 60, 10, '', '');
        echo '</td><td>';
        KontrolkiHtml::DodajSubmit('zatwierdz_lista', 'id_zatwierdz_lista', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zatwierdz), '');
        echo '</td></tr></table></form>';
    }
    require('../stopka.php');
?>
</body>
</html>
