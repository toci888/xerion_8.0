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
        
        if (isset($_GET[MediaDAL::$id_media_nieruchomosc]))
        {
            $id_media = $_GET[MediaDAL::$id_media_nieruchomosc];
        }
        if (isset($_POST[MediaDAL::$id_media_nieruchomosc]))
        {
            $id_media = $_POST[MediaDAL::$id_media_nieruchomosc];
        }
        
        $dal = new MediaDAL();
        
        if (isset($_POST['aktualizuj_tel']))
        {
            $tabParametr[MediaDAL::$id_telefon_media_nieruchomosc] = $_POST['telefon_id'];
            $tabParametr[MediaDAL::$id_media_nieruchomosc] = $id_media;
            $tabParametr[MediaDAL::$telefon] = $_POST['telefon'.$_POST['telefon_id']];
            $tabParametr[MediaDAL::$telefon_opis] = $_POST['opis_tel'.$_POST['telefon_id']];
            if (strlen($_POST['telefon'.$_POST['telefon_id']]) > 0)
            {
                $wynik = $dal->DodajTelefonMedia($tabParametr);     
            }
            else
            {
                $wynik = false;
            }
            
            if (!$wynik)
            {
                UtilsUI::InfoBlad($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_nie_powiodla_sie));
            }
        }
        if (isset($_POST['dodaj_tel']))
        {
            //$tabParametr[MediaDAL::$id_telefon_media_nieruchomosc] = $_POST['telefon_id'];
            $tabParametr[MediaDAL::$id_media_nieruchomosc] = $id_media;
            $tabParametr[MediaDAL::$telefon] = $_POST['telefon'.$_POST['telefon_id']];
            $tabParametr[MediaDAL::$telefon_opis] = $_POST['opis_tel'.$_POST['telefon_id']]; 
            if (strlen($_POST['telefon']) > 0)
            {
                $wynik = $dal->DodajTelefonMedia($tabParametr);    
            }
            else
            {
                $wynik = false;
            }
            
            if (!$wynik)
            {
                UtilsUI::InfoBlad($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_nie_powiodla_sie));
            }
        }
        if (isset($_POST['kasuj_telefon']))
        {
            $tabParametr[MediaDAL::$id_telefon_media_nieruchomosc] = $_POST['telefon_id'];
            $tabParametr[MediaDAL::$nazwa] = $_POST['telefon'.$_POST['telefon_id']];
            $tabParametr[MediaDAL::$opis] = $_POST['opis_tel'.$_POST['telefon_id']];
            $wynik = $dal->UsunTelefonMedia($tabParametr);
            if (!$wynik)
            {
                UtilsUI::InfoBlad($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_nie_powiodla_sie));
            }
        }
        if (isset($_POST['dodaj_mail']))
        {
            //$tabParametr[MediaDAL::$id_email_media_nieruchomosc] = $_POST['mail_id'];
            $tabParametr[MediaDAL::$id_media_nieruchomosc] = $id_media;
            $tabParametr[MediaDAL::$email] = $_POST['mail'.$_POST['mail_id']];
            $tabParametr[MediaDAL::$email_opis] = $_POST['opis_mail'.$_POST['mail_id']];
            if (strlen($_POST['mail']) > 0)
            {
                $wynik = $dal->DodajEmailMedia($tabParametr);    
            }
            else
            {
                $wynik = false;
            }
            if (!$wynik)
            {
                UtilsUI::InfoBlad($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_nie_powiodla_sie));
            }
        }
        if (isset($_POST['aktualizuj_mail']))
        {
            $tabParametr[MediaDAL::$id_email_media_nieruchomosc] = $_POST['mail_id'];
            $tabParametr[MediaDAL::$id_media_nieruchomosc] = $id_media;
            $tabParametr[MediaDAL::$email] = $_POST['mail'.$_POST['mail_id']];
            $tabParametr[MediaDAL::$email_opis] = $_POST['opis_mail'.$_POST['mail_id']];

            if (strlen($_POST['mail'.$_POST['mail_id']]) > 0)
            {
                $wynik = $dal->DodajEmailMedia($tabParametr);
            }
            else
            {
                $wynik = false;
            }
            if (!$wynik)
            {
                UtilsUI::InfoBlad($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_nie_powiodla_sie));
            }
        }
        if (isset($_POST['kasuj_mail']))
        {
            $tabParametr[MediaDAL::$id_email_media_nieruchomosc] = $_POST['mail_id'];
            $wynik = $dal->UsunEmailMedia($tabParametr);
            if (!$wynik)
            {
                UtilsUI::InfoBlad($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_nie_powiodla_sie));
            }
        }   
        
        $tabParametr[MediaDAL::$id_media_nieruchomosc] = $id_media;
        
        $wynik = $dal->PodajTelefonMedia($tabParametr, $ilosc_wierszy);
        
        echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'"><table>';
        KontrolkiHtml::DodajHidden(MediaDAL::$id_media_nieruchomosc, MediaDAL::$id_media_nieruchomosc, $id_media);
        KontrolkiHtml::DodajHidden('telefon_id', 'telefon_id', '');
        if (is_array($wynik))
        foreach ($wynik as $wiersz)
        {
            echo '<tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$telefon).' : </td><td>';
            KontrolkiHtml::DodajTelefonTextbox('telefon'.$wiersz[MediaDAL::$id], 'id_telefon', $wiersz[MediaDAL::$nazwa], 13, 13, '', '');
            echo '</td><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$opis).' : </td><td>';
            KontrolkiHtml::DodajTextbox('opis_tel'.$wiersz[MediaDAL::$id], 'id_opis_tel', $wiersz[MediaDAL::$opis], 20, 20, '');
            echo '</td><td>';
            KontrolkiHtml::DodajSubmit('aktualizuj_tel', $wiersz[MediaDAL::$id], $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$aktualizuj), 'onclick="telefon_id.value=this.id;"');
            echo '</td><td>';
            KontrolkiHtml::DodajSubmit('kasuj_telefon', $wiersz[MediaDAL::$id], $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$kasuj), 'onclick="telefon_id.value=this.id;"');
            //echo '</td></tr>';
            echo '</td></tr>';
        }
        echo '<tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$telefon).' : </td><td>';
        KontrolkiHtml::DodajTelefonTextbox('telefon', 'id_telefon', '', 13, 13, '', '');
        echo '</td><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$opis).' : </td><td>';
        KontrolkiHtml::DodajTextbox('opis_tel', 'id_opis_tel', '', 20, 20, '');
        echo '</td><td>';
        KontrolkiHtml::DodajSubmit('dodaj_tel', 'id_dodaj_tel', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$dodaj), '');
        echo '</td></tr></table></form><hr />';
        
        $wynik = $dal->PodajEmailMedia($tabParametr, $ilosc_wierszy);
            
            echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'"><table>';
            KontrolkiHtml::DodajHidden(MediaDAL::$id_media_nieruchomosc, MediaDAL::$id_media_nieruchomosc, $id_media);
            KontrolkiHtml::DodajHidden('mail_id', 'mail_id', '');
                
            if ($ilosc_wierszy > 0)
            {                
                foreach ($wynik as $wiersz)
                {
                    echo '<tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$adres_email).' : </td><td>';
                    KontrolkiHtml::DodajEmailTextbox('mail'.$wiersz[MediaDAL::$id], 'id_mail'.$wiersz[MediaDAL::$id], $wiersz[MediaDAL::$nazwa], 20, 20, '', '');
                    echo '</td><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$opis).' : </td><td>';
                    KontrolkiHtml::DodajTextbox('opis_mail'.$wiersz[MediaDAL::$id], 'id_opis_mail'.$wiersz[MediaDAL::$id], $wiersz[MediaDAL::$opis], 20, 20, '');
                    echo '</td><td>';
                    KontrolkiHtml::DodajSubmit('aktualizuj_mail', $wiersz[MediaDAL::$id], $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$aktualizuj), 'onclick="mail_id.value=this.id;"');
                    echo '</td><td>';
                    KontrolkiHtml::DodajSubmit('kasuj_mail', $wiersz[MediaDAL::$id], $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$kasuj), 'onclick="mail_id.value=this.id;"');
                    echo '</td></tr>';
                }
            }
            echo '<tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$adres_email).' : </td><td>';
            KontrolkiHtml::DodajEmailTextbox('mail', 'id_mail', '', 20, 20, '', '');
            echo '</td><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$opis).' : </td><td>';
            KontrolkiHtml::DodajTextbox('opis_mail', 'id_opis_mail', '', 20, 20, '');
            echo '</td><td>';
            KontrolkiHtml::DodajSubmit('dodaj_mail', 'id_dodaj_mail', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$dodaj), '');
            echo '</td></tr></table></form><hr />';                   
    }
    require('../../stopka.php');

?>
</body>
</html>
