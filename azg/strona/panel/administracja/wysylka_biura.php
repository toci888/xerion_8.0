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
    include_once ('../../dal/admDAL.php');
    include_once ('../../dal/queriesDAL.php');
    include_once ('../../ui/kontrolki_html.php');
    include_once ('../../ui/utilsui.php');
    include_once ('../../bll/parametrynierbll.php'); 
    include_once ('../../bll/tags.php'); 
    include_once ('../../bll/agentbll.php');
    include_once ('../../bll/jezykibll.php');
    include_once ('../../bll/cache.php');
    include_once ('../../bll/transnierbll.php');
    include_once ('../../lib/mail.php');
    require('../../naglowek.php');
    require('../../conf.php');
    
    if (!isset($_SESSION[$zalogowany]))
    {
        echo 'Nie jesteÅ› zalogowany.';
    }
    else
    {
        $_SERVER['SERVER_NAME'] = 'ozyrys'; //zmienic na azg pl
    
        $sztywny_naglowek = '<html><head>
        <META http-equiv="content-type" content="text/html; charset=iso-8859-2">
        <LINK REL="stylesheet" HREF="http://'.$_SERVER['SERVER_NAME'].'/azg.css"></head><body>';
        $sztywna_stopka = '</body></html>';
    
        $uprawnienia = unserialize($_SESSION[$zalogowany]);
        
        //if ($uprawnienia->adm_dane)
        //{
            $tlumaczenia = cachejezyki::Czytaj();
            $agent_zal = unserialize($_SESSION[$dane_agent]);
            $oferta_id = null;
            $nier_id = null;
            $trans_id = null;
            
            if (isset($_GET[NieruchomoscDAL::$id_oferta]))
            {
                $oferta_id = $_GET[NieruchomoscDAL::$id_oferta];
                $nier_id = $_GET[NieruchomoscDAL::$id_nier_rodzaj];
                $trans_id = $_GET[NieruchomoscDAL::$id_trans_rodzaj];
            }
            if (isset($_POST[NieruchomoscDAL::$id_oferta]))
            {
                $oferta_id = $_POST[NieruchomoscDAL::$id_oferta];
                $nier_id = $_POST[NieruchomoscDAL::$id_nier_rodzaj];
                $trans_id = $_POST[NieruchomoscDAL::$id_trans_rodzaj];
            }
            
            if (isset($_POST['wprowadz']) && (isset($_POST['wybierz']) || strlen($_POST['cust_mail']) > 0))
            {
                $dal = new StronaOfertaDAL();
                
                $oferty_obj = new StronaOfertaBLL();
                $oferta_dane = $oferty_obj->PodajOferta($oferta_id, $trans_id, $nier_id, $_SESSION[$jezyk], $sekcje, $pomieszczenia);
                $oferta_dane = $oferta_dane[0];
                
                
                $agent_txt = $dal->AgentWersjaOficjalna($oferta_dane[NieruchomoscDAL::$id_agent], $_SESSION[$jezyk]);
                $agent_dane = $agent_txt[0][NieruchomoscDAL::$nazwa];
                
                $nier_trans = '<center><span class="nag2b"><b>'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], $oferta_dane[StronaOfertaDAL::$nieruchomosc_rodzaj]), 
                $_SESSION[$jezyk]).' - '.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], $oferta_dane[StronaOfertaDAL::$transakcja_rodzaj]), 
                $_SESSION[$jezyk]).'</b><br /></span></center>';
                
                $tresc = UtilsUI::OfertaSzczegolowa($oferta_dane, $_SESSION[$jezyk], $agent_dane, $sekcje, $pomieszczenia);
                $tresc = $nier_trans.$tresc;
                $tresc = UtilsUI::PodajNaglowekFirmowy($_SESSION[$jezyk]).$tresc;
                
                $dal = new RegionyDAL();
                $i = 0;
                if (isset($_POST['wybierz']))
                {
                    foreach ($_POST['wybierz'] as $wiersz)
                    {
                        $tabReg[$wiersz] = $wiersz;
                    }
                    $wynik = $dal->MailListaWysylka($tabReg, $ilosc_wierszy);
                    //$wynik = $dal->MailListaWysylka($_POST['wybierz'], $ilosc_wierszy);
                    
                    //petla z odbiorcami
                    $i = 0;
                    foreach ($wynik as $wiersz)
                    {
                        //var_dump($wiersz);
                        //$wiersz[NieruchomoscDAL::$nazwa];
                        $mail_obj = new MailSend();
                        $link_do_oferty = '<b>'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$link_do_oferty), $_SESSION[$jezyk]).': </b>'.
                        '<a href="http://'.$_SERVER['SERVER_NAME'].'/index.php?'.tags::$oferta.'='.$oferta_dane[NieruchomoscDAL::$id_oferta].'&'.NieruchomoscDAL::$id_trans_rodzaj.'='.$trans_id.'&'.
                        NieruchomoscDAL::$id_nier_rodzaj.'='.$nier_id.'">'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$oferta), $_SESSION[$jezyk]).'</a>';
                        
                        $wiadomosc_nie_spam = '<br /><b>'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$dostarczona_wiadomosc_nie_jest_spamem), $_SESSION[$jezyk]).' </b>'.
                        '<a href="http://'.$_SERVER['SERVER_NAME'].'/index.php?action=usunbiurolista&id='.md5($wiersz[NieruchomoscDAL::$id].$wiersz[NieruchomoscDAL::$nazwa]).'">'.
                        UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$tutaj), $_SESSION[$jezyk]).'</a>';
                        //$mail_obj->DodajUkrytyOdbiorca('informatyk@azg.pl');
                        
                        //$mail_obj->DodajOdbiorca('informatyk@azg.pl');
                        $mail_obj->DodajOdbiorca($wiersz[OsobaDAL::$nazwa]);
                        
                        $rezultat = $mail_obj->WyslijMail('A.Z. Gwarancja - '.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], $oferta_dane[StronaOfertaDAL::$nieruchomosc_rodzaj]), 
                        $_SESSION[$jezyk]).' - '.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], $oferta_dane[StronaOfertaDAL::$transakcja_rodzaj]), $_SESSION[$jezyk]).' - '.
                        $oferta_dane[StronaOfertaDAL::$lokalizacja], 
                        $sztywny_naglowek.$tresc.$link_do_oferty.$wiadomosc_nie_spam.$sztywna_stopka, 'text/html');
                        //_oferta=3058&id_trans_rodzaj=1&id_nier_rodzaj=1
                        
                        $i++;
                    }
                }
                $mail_obj = new MailSend();
                $link_do_oferty = '<b>'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$link_do_oferty), $_SESSION[$jezyk]).': </b>'.
                '<a href="http://'.$_SERVER['SERVER_NAME'].'/index.php?'.tags::$oferta.'='.$oferta_dane[NieruchomoscDAL::$id_oferta].'&'.NieruchomoscDAL::$id_trans_rodzaj.'='.$trans_id.'&'.
                NieruchomoscDAL::$id_nier_rodzaj.'='.$nier_id.'">'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$oferta), $_SESSION[$jezyk]).'</a>';
                
                //$mail_obj->DodajUkrytyOdbiorca('informatyk@azg.pl');
                
                //$mail_obj->DodajOdbiorca('informatyk@azg.pl');
                $mail_obj->DodajOdbiorca('azgwarancja@azg.pl');
                if (strlen($_POST['cust_mail']) > 0)
                {
                    $mail_obj->DodajOdbiorca($_POST['cust_mail']);
                    $i++;
                }
                
                $rezultat = $mail_obj->WyslijMail('A.Z. Gwarancja - '.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], $oferta_dane[StronaOfertaDAL::$nieruchomosc_rodzaj]), 
                $_SESSION[$jezyk]).' - '.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], $oferta_dane[StronaOfertaDAL::$transakcja_rodzaj]), $_SESSION[$jezyk]).' - '.$oferta_dane[StronaOfertaDAL::$lokalizacja], 
                $sztywny_naglowek.$tresc.$link_do_oferty.$sztywna_stopka, 'text/html');
                
                //$mail_obj->DodajUkrytyOdbiorca('informatyk@azg.pl');
                //$rezultat = $mail_obj->WyslijMail('A.Z. Gwarancja - oferty', $sztywny_naglowek.$tresc.$sztywna_stopka, 'text/html');
                if ($rezultat)
                {
                    UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wyslano_maili).' : '.$i);
                }
                else
                {
                    //echo $rezultat;
                }
                
            }

            if ($oferta_id != null)
            {
                //pobranie wojewodztw, pokazanie w formularzu do wyboru
                $wojewodztwa = SlownikDAL::PodajWojewodztwa();
                UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nr_oferty).': '.$oferta_id.'. '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wysylanie_oferty_mailem_do_innych_biur));
                echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'"><table border="1" rules="all" class="tableBorder" bgcolor="#66CCFF">';
                KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_oferta, NieruchomoscDAL::$id_oferta, $oferta_id);
                KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_nier_rodzaj, NieruchomoscDAL::$id_nier_rodzaj, $nier_id);
                KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_trans_rodzaj, NieruchomoscDAL::$id_trans_rodzaj, $trans_id);
                foreach ($wojewodztwa as $klucz => $wiersz)
                {
                    echo '<tr><td>';
                    KontrolkiHtml::DodajCheckbox('wybierz[]', 'id_wybierz'.$klucz, false, $wiersz[NieruchomoscDAL::$nazwa], '', $wiersz[NieruchomoscDAL::$id]); 
                    echo '</td></tr>';
                }
                echo '</table><table><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$dowolny_adres_email).': </td><td>';
                KontrolkiHtml::DodajEmailTextbox('cust_mail', 'id_cust_mail', '', 40, 35, '', '');
                echo '</td></tr></table>';
                KontrolkiHtml::DodajSubmit('wprowadz', 'id_wprowadz', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zatwierdz), '');
                echo '</form>';
            }
        //}
        echo '<hr />';
        KontrolkiHtml::DodajSubmit('ok', 'id_ok', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zakoncz), 'onclick="window.close();"');
    }
    require('../../stopka.php');
?>
</body>
</html>
