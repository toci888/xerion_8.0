<?php
    //tu if
    if (!isset($_GET[tags::$oferta]))
    {
        echo '<title>'.$poczatek.' Opole '.$AZG.' - '.
        UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nieruchomosci), $_SESSION[$jezyk]).' '.
        UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$w_opolu_i_w_wojewodztwie_opolskim), $_SESSION[$jezyk]).'</title>';
    }
    else
    {
        $obiekt = new StronaOfertaBLL();
        $oferta = $obiekt->PodajOferta($_GET[tags::$oferta], $_GET[StronaPodsInfoDAL::$id_trans_rodzaj], $_GET[StronaPodsInfoDAL::$id_nier_rodzaj], $_SESSION[$jezyk], $sekcje, $pomieszczenia);
        $oferta = $oferta[0];
        
        $tytul_strona = UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], $oferta[StronaOfertaDAL::$nieruchomosc_rodzaj]), $_SESSION[$jezyk]).' '.
        UtilsUI::KonwersjaEncoding($oferta[StronaOfertaDAL::$lokalizacja], $_SESSION[$jezyk]);
        
        if ($_GET[StronaPodsInfoDAL::$id_nier_rodzaj] == 2)
        if (isset($sekcje[0]['parametry']))
        {
            $sekcja_pods = $sekcje[0]['parametry'];
            if (isset($sekcja_pods[0]))
            {
                $dane_param = explode(' : ', $sekcja_pods[0]);
                if ($dane_param[0] == tags::$liczba_pokoi)
                {
                    $tytul_strona .= ', '.$dane_param[1].' '.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$pokojowe), $_SESSION[$jezyk]);
                }
            }
        }
        
        echo '<title>'.$tytul_strona.', '.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], $oferta[StronaOfertaDAL::$rodzaj_budynek]), $_SESSION[$jezyk]).' - '.
        UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$biuro_nieruchomosci), $_SESSION[$jezyk]).' '.$AZG.'</title>';
    }
?>