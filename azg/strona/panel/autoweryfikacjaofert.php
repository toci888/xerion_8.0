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
    $dal = new ExportDAL();
    $otodom = new OtoDomSupport();
    $domiporta = new Domiporta();
    $gazetadom = new GazetaDom();
    
    $wynik = $dal->PodajOfertyProlongata('Otodom', $ilosc_wierszy);
    if ($ilosc_wierszy > 0)
    {
        foreach ($wynik as $wiersz)
        {
            $otodom->InsertOffer($wiersz[ExportDAL::$id_oferta], $powodzenie, true);
        }
    }
    
    $wynik_p_d = $dal->PodajOfertyProlongata('Domiporta', $ilosc_wierszy);
    $wynik_d_d = $dal->PodajOfertyDeaktywacja('Domiporta', $ilosc_wierszy);
    //var_dump($wynik_p_d);
    //usleep(3000000);
    $domiporta->WyslijOferty($wynik_p_d, $wynik_d_d[0]);

    ///deaktywacja ofert w otodom na koncu (po domiporcie etc), bo otodom zalicza tez dala, i robi to hurtem
    $wynik = $dal->PodajOfertyDeaktywacja('Otodom', $ilosc_wierszy);
    if ($ilosc_wierszy > 0)
    {
        foreach ($wynik as $wiersz)
        {
            $otodom->DeactivateOffer($wiersz[ExportDAL::$id_oferta]);
        }
    }
    
    $client = new OfertyNet();
    $client->WyslijOferty();
    
    $client_gd = new GazetaDom();
    $client_gd->WyslijOferty();
    
    $clientKrn = new Krn();
    $clientKrn->WyslijOferty();
    
    $clientGratka = new Gratka();
    $clientGratka->WyslijOferty();
    
    $wynik = $dal->OfertaWstrzymana($ilosc_wierszy);
    $tresc = 'Nastepujace oferty wstrzymane zostaly uznane za aktualne: <br />';
    $i = 0;
    foreach ($wynik as $wiersz)
    {
        $tresc .= $wiersz[NieruchomoscDAL::$id_oferta].'<br />';
        $i++;
    }
    $mail = new MailSend();
    $mail->DodajOdbiorca('azgwarancja@azg.pl');
    if ($i > 0)
    {
        $mail->WyslijMail('Oferty wstrzymane zmienione na aktualne', $tresc, 'text/html');
    }
?>