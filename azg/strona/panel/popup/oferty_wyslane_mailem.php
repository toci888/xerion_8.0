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
        $tlumaczenia = cachejezyki::Czytaj();
        $agent_zal = unserialize($_SESSION[$dane_agent]);
        //var_dump($agent_zal);
        $oferta_id = null;
        
        if (isset($_GET[NieruchomoscDAL::$id_zapotrzebowanie]))
        {
            $zapotrzebowanie_id = $_GET[NieruchomoscDAL::$id_zapotrzebowanie];
        }
        if (isset($_POST[NieruchomoscDAL::$id_zapotrzebowanie]))
        {
            $zapotrzebowanie_id = $_POST[NieruchomoscDAL::$id_zapotrzebowanie];
        }
        
        $dal = new OsobaDAL(null);
        
        if (isset($_POST['wyslij_mail']))
        {
            $wynik = $dal->OfertyZlecenieNaMail(array(NieruchomoscDAL::$id_zapotrzebowanie => $zapotrzebowanie_id), $ilosc_wierszy);
            if ($ilosc_wierszy > 0)
            {
                //uzyc email, ale to juz nie dzis
                $mail = new MailSend();
                $mail->DodajUkrytyOdbiorca($_POST['adres_email']);
                $mail->DodajUkrytyOdbiorca($agent_zal->email);
                $tresc = 'Witam !! <br />Poni¿ej lista adresów do ofert odpowiadaj±cych kryteriom zlecenia nr '.$wynik[0][NieruchomoscDAL::$id_zapotrzebowanie].'.<br />';
                echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$oferty_wyslane_mailem).':<br />';
                foreach ($wynik as $wiersz)
                {
                    $link = '<a href="http://www.azg.pl/index.php?'.tags::$oferta.'='.$wiersz[NieruchomoscDAL::$id_oferta].'&'.NieruchomoscDAL::$id_nier_rodzaj.'='.$wiersz[NieruchomoscDAL::$id_nier_rodzaj].'&'.
                    NieruchomoscDAL::$id_trans_rodzaj.'='.$wiersz[NieruchomoscDAL::$id_trans_rodzaj].'" target="_blank">Oferta nr '.$wiersz[NieruchomoscDAL::$id_oferta].'</a><br />';
                    echo $link;
                    $tresc .= $link;
                }
                $mail->WyslijMail('Adresy internetowe do ofert skojarzonych dla zlecenia nr '.$wynik[0][NieruchomoscDAL::$id_zapotrzebowanie].'.', $tresc.'z powa¿aniem<br />'.UtilsUI::KonwersjaEncoding($agent_zal->nazwa, $_SESSION[$jezyk]).'.', 'text/html', 
                $agent_zal->email, $agent_zal->email); 
            }
        }
        
        $wynik = $dal->PodajOfertaWyslanaZapotrzebowanie(array(NieruchomoscDAL::$id_zapotrzebowanie => $zapotrzebowanie_id), $ilosc_wierszy);
        UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$oferty_wyslane_mailem));
        UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$numer_zapotrzebowania).': '.$zapotrzebowanie_id);
        if ($ilosc_wierszy > 0)
        {
            UtilsUI::$rekordy = $ilosc_wierszy;
            UtilsUI::WyswietlTab1Poz($wynik, array(NieruchomoscDAL::$id_oferta, NieruchomoscDAL::$cena, NieruchomoscDAL::$data, NieruchomoscDAL::$is_lst_wsk), 
            array(tags::$numer_oferty, tags::$cena, tags::$data, tags::$lista_wskazan), NieruchomoscDAL::$id_oferta, 'oferty_wys', null);
        }
        
        echo '<br />';
        //wczytanie maila (i), spr czy sa, wyslanie skojarzen (najpierw ich pobor)
        $mail_zlec = $dal->PodajListaMailOsOtwZlec(array(NieruchomoscDAL::$id_zapotrzebowanie => $zapotrzebowanie_id), $ilosc_wierszy);
        if ($ilosc_wierszy > 0)
        {
            echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'">';
            KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_zapotrzebowanie, NieruchomoscDAL::$id_zapotrzebowanie, $zapotrzebowanie_id);
            KontrolkiHtml::DodajHidden('adres_email', 'adres_email', $mail_zlec[0][NieruchomoscDAL::$nazwa]);
            KontrolkiHtml::DodajSubmit('wyslij_mail', 'id_wyslij_mail', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wyslij_skojarzenia_mailem), '');
            echo '</form>';
        }
        echo '<br />';
        KontrolkiHtml::DodajSubmit('ok', 'id_ok', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zakoncz), 'onclick="window.close();"');
    }
    require('../../stopka.php');
?>
</body>
</html>
