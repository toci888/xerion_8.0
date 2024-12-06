<?php
    //echo $_SERVER['PHP_SELF'];
    $_SERVER['SCRIPT_FILENAME'] = '/var/www/html/form/';
    //echo $_SERVER['SCRIPT_FILENAME'];
    include_once ('/var/www/html/form/dal/queriesDAL.php');
    include_once ('/var/www/html/form/export/otodom/OtoDomClient.php');
    include_once ('/var/www/html/form/export/domiporta/DomiportaClient.php');
    include_once ('/var/www/html/form/export/ofertynet/OfertyNetClient.php'); 
    include_once ('/var/www/html/form/export/gazetadom/GazetaDomClient.php'); 
    include_once ('/var/www/html/form/export/krn/KrnClient.php'); 
    include_once ('/var/www/html/form/export/gratka/GratkaClient.php'); 
    include_once ('/var/www/html/form/lib/mail.php');  
    include_once ('/var/www/html/form/lib/sms.php');  

    include_once ($_SERVER['SCRIPT_FILENAME'].'dal/stronaDAL.php');
    include_once ($_SERVER['SCRIPT_FILENAME'].'bll/ofertystronabll.php');
    include_once ($_SERVER['SCRIPT_FILENAME'].'bll/cache.php');
    include_once ($_SERVER['SCRIPT_FILENAME'].'ui/utilsui.php');
    include_once ($_SERVER['SCRIPT_FILENAME'].'bll/tags.php');
    include_once ($_SERVER['SCRIPT_FILENAME'].'bll/jezykibll.php');
    require($_SERVER['SCRIPT_FILENAME'].'conf.php');
    $_SESSION[$jezyk] = 1;
    
    //w $argv bedzie kolejno co trzeba zeby opublikowac oferte, na razie tylko numer oferty i ewentualne wymuszenie jako 2 element
    // 1 nr oferty, 2 czy wymuszenie - to dla otodom
    $otodom = new OtoDomSupport();
    $domiporta = new Domiporta();
    $gratka = new Gratka();
    if (isset($argv[2]))
    {
        $rezultat = $otodom->InsertOffer($argv[1], $powodzenie, true, true);
        $rezultat = $domiporta->PublikujDomiporta($argv[1], true, true);
    }
    else
    {
        $rezultat = $otodom->InsertOffer($argv[1], $powodzenie, true);
        $rezultat = $domiporta->PublikujDomiporta($argv[1]);
    }
    
    $gratka->WyslijOferta($argv[1]);
    
    $dal = new StronaOfertaDAL();
    $oferty_obj = new StronaOfertaBLL();
    $tlumaczenia = cachejezyki::Czytaj();
    $_SERVER['SERVER_NAME'] = 'www.azg.pl'; //zmienic na azg pl
    $strona_www = 'http://'.$_SERVER['SERVER_NAME'].'/index.php?';
    
    $sztywny_naglowek = '<html><head>
    <META http-equiv="content-type" content="text/html; charset=iso-8859-2">
    <LINK REL="stylesheet" HREF="http://'.$_SERVER['SERVER_NAME'].'/azg.css"></head><body>';
    $sztywna_stopka = '</body></html>';
    
    $zl_of = $dal->OfertaZlecenieSubskrypcja($argv[1]);
    if (count($zl_of) > 0)
    {
        $oferta = $zl_of[0];
        
        $oferta_dane = $oferty_obj->PodajOferta($oferta[StronaPodsInfoDAL::$id_oferta], $oferta[StronaPodsInfoDAL::$id_trans_rodzaj], $oferta[StronaPodsInfoDAL::$id_nier_rodzaj], $polski_jezyk, $sekcje, $pomieszczenia);
        $oferta_dane = $oferta_dane[0];
        
        $adres_url = $strona_www.tags::$oferta.'='.$oferta[StronaPodsInfoDAL::$id_oferta].'&'.NieruchomoscDAL::$id_trans_rodzaj.'='.$oferta[StronaPodsInfoDAL::$id_trans_rodzaj].'&'.
        NieruchomoscDAL::$id_nier_rodzaj.'='.$oferta[StronaPodsInfoDAL::$id_nier_rodzaj];
        
        //kolekcja obiektow o liczebnosci zgodnej z iloscia jezykow
        
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
        foreach ($zl_of as $zlecenie)
        {
            $mail_obj = new MailSend();
            $mail_obj->DodajUkrytyOdbiorca($zlecenie[StronaPodsInfoDAL::$email]);
            $mail_obj->DodajUkrytyOdbiorca('informatyk@azg.pl');
            $temat = UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($polski_jezyk, tags::$nowa_oferta_w_biurze_nieruchomosci), $polski_jezyk).' '.$AZG.'. '.
            'Oferta jest zbli¿ona do kryteriów zlecenia nr '.$zlecenie[NieruchomoscDAL::$id_zapotrzebowanie].' otwartego w biurze '.$AZG.'.';
            //temat - subskrypcja, nowe oferty nieruchomosci, wiecej na www itd, link do oferty
            $mail_obj->WyslijMail($temat, $sztywny_naglowek.$tresc.$sztywna_stopka, 'text/html');
        }
    }
    //cos sie tu sypie :P
    //$sms_klienci = $dal->OfertaZlecenieSms($argv[1], $ilosc_wierszy);
    //if ($ilosc_wierszy > 0)
    //{
        //$sms = new Sms();
        /*$wynik = $sms->MasowySms($sms_klienci, $sms_klienci[0][KlientDAL::$komorka_agent], $sms_klienci[0][KlientDAL::$tresc], OsobaDAL::$telefon);
        
        $tabParametr[NieruchomoscDAL::$id_oferta] = $argv[1];
        $tabParametr[OsobaDAL::$telefon] = $wynik['telefon'];
        $tabParametr[OsobaDAL::$id] = $wynik['remote_id'];
        $tabParametr[OsobaDAL::$punkty] = $wynik['punkty'];
        $dal->StatusSms($tabParametr);*/
    //}
    
?>