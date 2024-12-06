<?php
    //echo $_SERVER['PHP_SELF'];
    $_SERVER['SCRIPT_FILENAME'] = '/var/www/html/form/';
    //echo $_SERVER['SCRIPT_FILENAME'];
    session_start();
    include_once ($_SERVER['SCRIPT_FILENAME'].'dal/queriesDAL.php');
    include_once ($_SERVER['SCRIPT_FILENAME'].'dal/stronaDAL.php');
    include_once ($_SERVER['SCRIPT_FILENAME'].'bll/ofertystronabll.php');
    include_once ($_SERVER['SCRIPT_FILENAME'].'bll/cache.php');
    include_once ($_SERVER['SCRIPT_FILENAME'].'ui/utilsui.php');
    include_once ($_SERVER['SCRIPT_FILENAME'].'bll/tags.php');
    include_once ($_SERVER['SCRIPT_FILENAME'].'bll/jezykibll.php');
    include_once ($_SERVER['SCRIPT_FILENAME'].'lib/mail.php');
    require($_SERVER['SCRIPT_FILENAME'].'conf.php');
    $_SESSION[$jezyk] = 1;
    
    $dal = new StronaOfertaDAL();
    $oferty_obj = new StronaOfertaBLL();
    $tlumaczenia = cachejezyki::Czytaj();
    
    $oferty = $dal->OfertySubskrypcja();
    $jezyki = $dal->PodajIdJezyki();
    
    $_SERVER['SERVER_NAME'] = 'www.azg.pl'; //zmienic na azg pl
    $strona_www = 'http://'.$_SERVER['SERVER_NAME'].'/index.php?';
    
    $sztywny_naglowek = '<html><head>
    <META http-equiv="content-type" content="text/html; charset=iso-8859-2">
    <LINK REL="stylesheet" HREF="http://'.$_SERVER['SERVER_NAME'].'/azg.css"></head><body>';
    $sztywna_stopka = '</body></html>';
    
    if (is_array($oferty))
    foreach ($oferty as $oferta)
    {
        $oferta_dane = $oferty_obj->PodajOferta($oferta[StronaPodsInfoDAL::$id_oferta], $oferta[StronaPodsInfoDAL::$id_trans_rodzaj], $oferta[StronaPodsInfoDAL::$id_nier_rodzaj], $_SESSION[$jezyk], $sekcje, $pomieszczenia);
        $oferta_dane = $oferta_dane[0];
        
        $adres_url = $strona_www.tags::$oferta.'='.$oferta[StronaPodsInfoDAL::$id_oferta].'&'.NieruchomoscDAL::$id_trans_rodzaj.'='.$oferta[StronaPodsInfoDAL::$id_trans_rodzaj].'&'.
        NieruchomoscDAL::$id_nier_rodzaj.'='.$oferta[StronaPodsInfoDAL::$id_nier_rodzaj];
        
        if (is_array($oferta[StronaPodsInfoDAL::$email]))
        {
            foreach ($jezyki as $jezyk_sys)
            {
                //kolekcja obiektow o liczebnosci zgodnej z iloscia jezykow
                $mail_obj[$jezyk_sys[StronaPodsInfoDAL::$id_jezyk]] = new MailSend();
                //sklepanie tresci, docelowo dodac link
                $agent_txt = $dal->AgentWersjaOficjalna($oferta_dane[NieruchomoscDAL::$id_agent], $jezyk_sys[StronaPodsInfoDAL::$id_jezyk]);
                $agent_dane[$jezyk_sys[StronaPodsInfoDAL::$id_jezyk]] = $agent_txt[0][NieruchomoscDAL::$nazwa];
                
                $nier_trans = '<center><span class="nag2b"><b>'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($jezyk_sys[StronaPodsInfoDAL::$id_jezyk], $oferta_dane[StronaOfertaDAL::$nieruchomosc_rodzaj]), 
                $jezyk_sys[StronaPodsInfoDAL::$id_jezyk]).' - '.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($jezyk_sys[StronaPodsInfoDAL::$id_jezyk], $oferta_dane[StronaOfertaDAL::$transakcja_rodzaj]), 
                $jezyk_sys[StronaPodsInfoDAL::$id_jezyk]).'</b><br /></span></center>';
                
                $tresc[$jezyk_sys[StronaPodsInfoDAL::$id_jezyk]] = UtilsUI::OfertaSzczegolowa($oferta_dane, $jezyk_sys[StronaPodsInfoDAL::$id_jezyk], $agent_dane[$jezyk_sys[StronaPodsInfoDAL::$id_jezyk]], $sekcje, $pomieszczenia);
                $tresc[$jezyk_sys[StronaPodsInfoDAL::$id_jezyk]] = $nier_trans.$tresc[$jezyk_sys[StronaPodsInfoDAL::$id_jezyk]];
                $tresc[$jezyk_sys[StronaPodsInfoDAL::$id_jezyk]] = UtilsUI::PodajNaglowekFirmowy($jezyk_sys[StronaPodsInfoDAL::$id_jezyk]).$tresc[$jezyk_sys[StronaPodsInfoDAL::$id_jezyk]];
                ///dodac link
                
                $adres_url = $strona_www.tags::$oferta.'='.$oferta[StronaPodsInfoDAL::$id_oferta].'&'.NieruchomoscDAL::$id_trans_rodzaj.'='.$oferta[StronaPodsInfoDAL::$id_trans_rodzaj].'&'.
                NieruchomoscDAL::$id_nier_rodzaj.'='.$oferta[StronaPodsInfoDAL::$id_nier_rodzaj].'&'.$jezyk.'='.$jezyk_sys[StronaPodsInfoDAL::$id_jezyk];
                
                $tresc[$jezyk_sys[StronaPodsInfoDAL::$id_jezyk]] .= '<br /><br /><a href="'.$adres_url.'">'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($jezyk_sys[StronaPodsInfoDAL::$id_jezyk], tags::$link_do_oferty), 
                $jezyk_sys[StronaPodsInfoDAL::$id_jezyk]).'</a>';
            }                 
            ///tablica emaili dla oferty zawiera wszystkie maile, z tym, ze trzeba je porozdzielac ze wzgledu na jezyki i pododawac do roznych obiektow mailsend
            foreach ($oferta[StronaPodsInfoDAL::$email] as $klucz => $adres)
            {
                $mail_obj[$oferta[StronaPodsInfoDAL::$id_jezyk][$klucz]]->DodajUkrytyOdbiorca($adres);
                //$mail_obj[$oferta[StronaPodsInfoDAL::$id_jezyk][$klucz]]->DodajUkrytyOdbiorca('informatyk@azg.pl');
            }
            foreach ($mail_obj as $klucz => $obj_mail)
            {
                //$klucz to chyba id jezyk, wiec tytul maila zrobic zgodnie z tym
                $temat = UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($klucz, tags::$subskrypcja), $klucz).': '.
                UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($klucz, tags::$nowa_oferta_w_biurze_nieruchomosci), $klucz).' '.$AZG;
                //temat - subskrypcja, nowe oferty nieruchomosci, wiecej na www itd, link do oferty
                
                $obj_mail->WyslijMail($temat, $sztywny_naglowek.$tresc[$klucz].$sztywna_stopka, 'text/html');
                ///w celu zachowania jakis informacji o wysylanych subskrybentom ofertach zapisanie informacji o wysy³ce
            }
        }
    }
    $mail_obj = null;
    $zl_of = $dal->OfertyZlecenieSubskrypcja();
    if (is_array($zl_of))
    foreach ($zl_of as $oferta)
    {
        $oferta_dane = $oferty_obj->PodajOferta($oferta[StronaPodsInfoDAL::$id_oferta], $oferta[StronaPodsInfoDAL::$id_trans_rodzaj], $oferta[StronaPodsInfoDAL::$id_nier_rodzaj], $polski_jezyk, $sekcje, $pomieszczenia);
        $oferta_dane = $oferta_dane[0];
        
        $adres_url = $strona_www.tags::$oferta.'='.$oferta[StronaPodsInfoDAL::$id_oferta].'&'.NieruchomoscDAL::$id_trans_rodzaj.'='.$oferta[StronaPodsInfoDAL::$id_trans_rodzaj].'&'.
        NieruchomoscDAL::$id_nier_rodzaj.'='.$oferta[StronaPodsInfoDAL::$id_nier_rodzaj];
        
        //kolekcja obiektow o liczebnosci zgodnej z iloscia jezykow
        $mail_obj = new MailSend();
        //sklepanie tresci, docelowo dodac link
        $agent_txt = $dal->AgentWersjaOficjalna($oferta_dane[NieruchomoscDAL::$id_agent], $polski_jezyk);
        $agent_dane = $agent_txt[0][NieruchomoscDAL::$nazwa];
        
        $nier_trans = '<center><span class="nag2b"><b>'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($polski_jezyk, $oferta_dane[StronaOfertaDAL::$nieruchomosc_rodzaj]), 
        $polski_jezyk).' - '.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($polski_jezyk, $oferta_dane[StronaOfertaDAL::$transakcja_rodzaj]), 
        $polski_jezyk).'</b><br /></span></center>';
        
        $tresc = UtilsUI::OfertaSzczegolowa($oferta_dane, $polski_jezyk, $agent_dane, $sekcje, $pomieszczenia);
        $tresc = $nier_trans.$tresc;
        $tresc = UtilsUI::PodajNaglowekFirmowy($polski_jezyk).$tresc;
        ///dodac link
        
        $adres_url = $strona_www.tags::$oferta.'='.$oferta[StronaPodsInfoDAL::$id_oferta].'&'.NieruchomoscDAL::$id_trans_rodzaj.'='.$oferta[StronaPodsInfoDAL::$id_trans_rodzaj].'&'.
        NieruchomoscDAL::$id_nier_rodzaj.'='.$oferta[StronaPodsInfoDAL::$id_nier_rodzaj].'&'.$jezyk.'='.$polski_jezyk;
        
        $tresc .= '<br /><br /><a href="'.$adres_url.'">'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($polski_jezyk, tags::$link_do_oferty), 
        $polski_jezyk).'</a>';
                             
        $mail_obj->DodajUkrytyOdbiorca($oferta[StronaPodsInfoDAL::$email]);
        $mail_obj->DodajUkrytyOdbiorca('informatyk@azg.pl');
        //$mail_obj->DodajUkrytyOdbiorca('biuro2@azg.pl');
//UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($polski_jezyk, tags::$subskrypcja), $polski_jezyk)
        $temat = UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($polski_jezyk, tags::$nowa_oferta_w_biurze_nieruchomosci), $polski_jezyk).' '.$AZG.'. '.
        'Oferta jest zbli¿ona do kryteriów zlecenia nr '.$oferta[NieruchomoscDAL::$id_zapotrzebowanie].' otwartego w biurze '.$AZG.'.';
        //temat - subskrypcja, nowe oferty nieruchomosci, wiecej na www itd, link do oferty
        $mail_obj->WyslijMail($temat, $sztywny_naglowek.$tresc.$sztywna_stopka, 'text/html');
    }
    $mail_obj = null;
    $lwzl_of = $dal->OfertyListaWskazanSubskrypcja();
    if (is_array($lwzl_of))
    foreach ($lwzl_of as $oferta)
    {
        $oferta_dane = $oferty_obj->PodajOferta($oferta[StronaPodsInfoDAL::$id_oferta], $oferta[StronaPodsInfoDAL::$id_trans_rodzaj], $oferta[StronaPodsInfoDAL::$id_nier_rodzaj], $polski_jezyk, $sekcje, $pomieszczenia);
        $oferta_dane = $oferta_dane[0];
        
        $adres_url = $strona_www.tags::$oferta.'='.$oferta[StronaPodsInfoDAL::$id_oferta].'&'.NieruchomoscDAL::$id_trans_rodzaj.'='.$oferta[StronaPodsInfoDAL::$id_trans_rodzaj].'&'.
        NieruchomoscDAL::$id_nier_rodzaj.'='.$oferta[StronaPodsInfoDAL::$id_nier_rodzaj];
        
        //kolekcja obiektow o liczebnosci zgodnej z iloscia jezykow
        $mail_obj = new MailSend();
        //sklepanie tresci, docelowo dodac link
        $agent_txt = $dal->AgentWersjaOficjalna($oferta_dane[NieruchomoscDAL::$id_agent], $polski_jezyk);
        $agent_dane = $agent_txt[0][NieruchomoscDAL::$nazwa];
        
        $nier_trans = '<center><span class="nag2b"><b>'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($polski_jezyk, $oferta_dane[StronaOfertaDAL::$nieruchomosc_rodzaj]), 
        $polski_jezyk).' - '.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($polski_jezyk, $oferta_dane[StronaOfertaDAL::$transakcja_rodzaj]), 
        $polski_jezyk).'</b><br /></span></center>';
        
        $tresc = UtilsUI::OfertaSzczegolowa($oferta_dane, $polski_jezyk, $agent_dane, $sekcje, $pomieszczenia);
        $tresc = $nier_trans.$tresc;
        $tresc = UtilsUI::PodajNaglowekFirmowy($polski_jezyk).$tresc;
        ///dodac link
        
        $adres_url = $strona_www.tags::$oferta.'='.$oferta[StronaPodsInfoDAL::$id_oferta].'&'.NieruchomoscDAL::$id_trans_rodzaj.'='.$oferta[StronaPodsInfoDAL::$id_trans_rodzaj].'&'.
        NieruchomoscDAL::$id_nier_rodzaj.'='.$oferta[StronaPodsInfoDAL::$id_nier_rodzaj].'&'.$jezyk.'='.$polski_jezyk;
        
        $tresc .= '<br /><br /><a href="'.$adres_url.'">'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($polski_jezyk, tags::$link_do_oferty), 
        $polski_jezyk).'</a>';
                             
        $mail_obj->DodajUkrytyOdbiorca($oferta[StronaPodsInfoDAL::$email]);
        $mail_obj->DodajUkrytyOdbiorca('informatyk@azg.pl');
        //$mail_obj->DodajUkrytyOdbiorca('biuro2@azg.pl');
//UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($polski_jezyk, tags::$subskrypcja), $polski_jezyk)
        $temat = 'Cena poni¿szej oferty, ogl±danej z biurem '.$AZG.' w ramach zlecenia nr '.$oferta[NieruchomoscDAL::$id_zapotrzebowanie].' uleg³a zmianie.';
        //temat - subskrypcja, nowe oferty nieruchomosci, wiecej na www itd, link do oferty
        $mail_obj->WyslijMail($temat, $sztywny_naglowek.$tresc.$sztywna_stopka, 'text/html');
    }
?>