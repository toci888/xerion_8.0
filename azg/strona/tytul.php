<?php
    $rodzaj_nier_link = array(1 => tags::$domy, 2 => tags::$mieszkania, 3 => tags::$obiekty, 4 => tags::$lokale, 5 => tags::$tereny, 6 => tags::$dzialki);
    $rodzaj_nier_url = array(1 => 'domy-opole.php', 2 => 'mieszkania-opole.php', 3 => 'lokale-opole.php', 4 => 'lokale-opole.php', 5 => 'dzialki-opole.php', 6 => 'dzialki-opole.php');
    $nier_tyt = tags::$mieszkania;
    $r_nier_tab = array('sprzedazm' => tags::$mieszkania, 'sprzedazd' => tags::$domy, 'sprzedazl' => tags::$lokale, 'sprzedazo' => tags::$obiekty, 'sprzedazdz' => tags::$dzialki, 'sprzedazte' => tags::$tereny, 
    'wynajemm' => tags::$mieszkania, 'wynajemd' => tags::$domy, 'wynajeml' => tags::$lokale, 'wynajemo' => tags::$obiekty, 'wynajemdz' => tags::$dzialki, 'wynajemte' => tags::$tereny,
    2 => tags::$mieszkania, 1 => tags::$domy, 4 => tags::$lokale, 3 => tags::$obiekty, 6 => tags::$dzialki, 5 => tags::$tereny);
    if (isset($_GET['action']))
    {
        if (isset($r_nier_tab[$_GET['action']]))
        {
            $nier_tyt = $r_nier_tab[$_GET['action']];
        }
    }
    //wziac pod uwage id_nier_rodzaj
    if (isset($_GET[NieruchomoscDAL::$id_nier_rodzaj]))
    {
        if (isset($r_nier_tab[$_GET[NieruchomoscDAL::$id_nier_rodzaj]]))
        {
            $nier_tyt = $r_nier_tab[$_GET[NieruchomoscDAL::$id_nier_rodzaj]];
        }
    }
    $poczatek = '';
    if (isset($pre))
    {
        if ($pre)
        {
            $poczatek = $tlumaczenia->Tlumacz($_SESSION[$jezyk], $nier_tyt);
        }
        else
        {
            $poczatek = $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$biuro_nieruchomosci);
        }
    }
    else
    {
        $poczatek = $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$biuro_nieruchomosci);
    }
    //tu if
    if (!isset($_GET[tags::$oferta]))
    {
        echo '<title>'.$poczatek.' Opole '.$AZG.' - '.
        $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nieruchomosci).' '.
        $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$w_opolu_i_w_wojewodztwie_opolskim).'</title>';
    }
    else
    {
        $obiekt = new StronaOfertaBLL();
        if (isset($_GET['baner']))
        {
            $dal = new StronaPodsInfoDAL();
            $of_wysw = $dal->OfertaWyswietl($_GET[tags::$oferta]);
            if ($of_wysw)
            {
                $wynik = $dal->PodajTransIdNierIdOferta($_GET[tags::$oferta]);
                if (isset($wynik[0][StronaPodsInfoDAL::$id_trans_rodzaj]))
                {
                    $_GET[StronaOfertaDAL::$id_nier_rodzaj] = $wynik[0][StronaPodsInfoDAL::$id_nier_rodzaj];
                    $_GET[StronaOfertaDAL::$id_trans_rodzaj] = $wynik[0][StronaPodsInfoDAL::$id_trans_rodzaj];
                }
            }
        }
        $oferta = $obiekt->PodajOferta($_GET[tags::$oferta], $_GET[StronaPodsInfoDAL::$id_trans_rodzaj], $_GET[StronaPodsInfoDAL::$id_nier_rodzaj], $_SESSION[$jezyk], $sekcje, $pomieszczenia);
        $oferta = $oferta[0];
        
        $tytul_strona = $tlumaczenia->Tlumacz($_SESSION[$jezyk], $oferta[StronaOfertaDAL::$nieruchomosc_rodzaj]).' '.
        $oferta[StronaOfertaDAL::$lokalizacja];
        
        if ($_GET[StronaPodsInfoDAL::$id_nier_rodzaj] == 2)
        if (isset($sekcje[0]['parametry']))
        {
            $sekcja_pods = $sekcje[0]['parametry'];
            if (isset($sekcja_pods[0]))
            {
                $dane_param = explode(' : ', $sekcja_pods[0]);
                if ($dane_param[0] == tags::$liczba_pokoi)
                {
                    $tytul_strona .= ', '.$dane_param[1].' '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$pokojowe);
                }
            }
        }
        $keywords_array = array(1 => 'nieruchomo¶ci opole, nieruchomo¶ci, nieruchomo¶æ, nieruchomosci, opole, mieszkania opole, domy opole, mieszkania, mieszkanie, domy, dom, posrednictwo, lokale, obiekty, ogloszenia, kredyty', 
        2 => 'estates opole, flats opole, estates, estate, immobility, opole, flat, flats, house, houses, premise, object', 
        3 => 'immobilien opole, immobilien, immobilie, opole, wohnung, Wohnungs, haus, häusern, raum, lokal, objekt');
        echo '<META NAME="keywords" LANG="pl" CONTENT="'.$keywords_array[$_SESSION[$jezyk]].'" />';
        echo '<title>'.$tytul_strona.', '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], $oferta[StronaOfertaDAL::$rodzaj_budynek]).' - '.
        $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$biuro_nieruchomosci).' '.$AZG.'</title>';
    }
?>