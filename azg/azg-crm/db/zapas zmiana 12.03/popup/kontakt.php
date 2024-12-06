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
    require('../naglowek.php');
    require('../conf.php');
    
    if (!isset($_SESSION[$zalogowany]))
    {
        echo 'Nie jesteÅ› zalogowany.';
    }
    else
    {
        $tlumaczenia = cachejezyki::Czytaj();
        $dal = null;
        
        if (isset($_GET[OsobaDAL::$id_osoba]))
        {
            $dal = new OsobaDAL($_GET[OsobaDAL::$id_osoba]);
            $osoba_id = $_GET[OsobaDAL::$id_osoba];
        }
        if (isset($_POST[OsobaDAL::$id_osoba]))
        {
            $dal = new OsobaDAL($_POST[OsobaDAL::$id_osoba]);
            $osoba_id = $_POST[OsobaDAL::$id_osoba];
        }
        
        if (isset($_POST['aktualizuj_tel']))
        {
            $tabParametr[OsobaDAL::$id] = $_POST['telefon_id'];
            $tabParametr[OsobaDAL::$nazwa] = $_POST['telefon'.$_POST['telefon_id']];
            $tabParametr[OsobaDAL::$opis] = $_POST['opis_tel'.$_POST['telefon_id']];
            if (strlen($_POST['telefon'.$_POST['telefon_id']]) > 0)
            {
                $wynik = $dal->DodajTelefon($tabParametr);     
            }
            else
            {
                $wynik = false;
            }
            
            if ($wynik)
            {
                echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_powiodla_sie).'<br />';
            }
            else
            {
                echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_nie_powiodla_sie).'<br />';
            }   
        }
        
        if (isset($_POST['dodaj_tel']))
        {
            //$tabParametr[OsobaDAL::$id] = $_POST['telefon_id'];
            $tabParametr[OsobaDAL::$nazwa] = $_POST['telefon'];
            $tabParametr[OsobaDAL::$opis] = $_POST['opis_tel']; 
            if (strlen($_POST['telefon']) > 0)
            {
                $wynik = $dal->DodajTelefon($tabParametr);    
            }
            else
            {
                $wynik = false;
            }
            
            if ($wynik)
            {
                echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_powiodla_sie).'<br />';
            }
            else
            {
                echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_nie_powiodla_sie).'<br />';
            }
        }
         if (isset($_POST['kasuj_telefon']))
        {
            $tabParametr[OsobaDAL::$id] = $_POST['telefon_id'];
            $tabParametr[OsobaDAL::$nazwa] = $_POST['telefon'.$_POST['telefon_id']];
            $tabParametr[OsobaDAL::$opis] = $_POST['opis_tel'.$_POST['telefon_id']];
            $wynik = $dal->UsunTelefon($tabParametr);
            if ($wynik)
            {
                echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_powiodla_sie).'<br />';
            }
            else
            {
                echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_nie_powiodla_sie).'<br />';
            }
        }
        if (isset($_POST['dodaj_kom']))
        {
            $tabParametr[OsobaDAL::$nazwa] = $_POST['komorka'];
            $tabParametr[OsobaDAL::$opis] = $_POST['opis_kom'];
            if (strlen($_POST['komorka']) > 0)
            {
                $wynik = $dal->DodajKomorka($tabParametr);    
            }
            else
            {
                $wynik = false;
            }
            
            if ($wynik)
            {
                echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_powiodla_sie).'<br />';
            }
            else
            {
                echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_nie_powiodla_sie).'<br />';
            }
        }
        if (isset($_POST['kasuj_kom']))
        {
            $wynik = $dal->UsunKomorka();
            if ($wynik)
            {
                echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_powiodla_sie).'<br />';
            }
            else
            {
                echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_nie_powiodla_sie).'<br />';
            }
        }
        if (isset($_POST['dodaj_mail']))
        {
            $tabParametr[OsobaDAL::$nazwa] = $_POST['mail'];
            $tabParametr[OsobaDAL::$opis] = $_POST['opis_mail'];
            if (strlen($_POST['mail']) > 0)
            {
                $wynik = $dal->DodajEmail($tabParametr);    
            }
            else
            {
                $wynik = false;
            }
            if ($wynik)
            {
                echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_powiodla_sie).'<br />';
            }
            else
            {
                echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_nie_powiodla_sie).'<br />';
            }
        }
        if (isset($_POST['aktualizuj_mail']))
        {
            $tabParametr[OsobaDAL::$id] = $_POST['mail_id'];
            $tabParametr[OsobaDAL::$nazwa] = $_POST['mail'.$_POST['mail_id']];
            $tabParametr[OsobaDAL::$opis] = $_POST['opis_mail'.$_POST['mail_id']];
            
            if (strlen($_POST['mail'.$_POST['mail_id']]) > 0)
            {
                $wynik = $dal->DodajEmail($tabParametr);
            }
            else
            {
                $wynik = false;
            }
            if ($wynik)
            {
                echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_powiodla_sie).'<br />';
            }
            else
            {
                echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_nie_powiodla_sie).'<br />';
            }
        }
        if (isset($_POST['kasuj_mail']))
        {
            $tabParametr[OsobaDAL::$id] = $_POST['mail_id'];
            $tabParametr[OsobaDAL::$nazwa] = $_POST['mail'.$_POST['mail_id']];
            $tabParametr[OsobaDAL::$opis] = $_POST['opis_mail'.$_POST['mail_id']];
            $wynik = $dal->UsunEmail($tabParametr);
            if ($wynik)
            {
                echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_powiodla_sie).'<br />';
            }
            else
            {
                echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_nie_powiodla_sie).'<br />';
            }
        }
        if ($dal != null)
        {
            $wynik = $dal->PodajTelefony($ilosc_wierszy);
            
            echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'"><table>';
            KontrolkiHtml::DodajHidden(OsobaDAL::$id_osoba, OsobaDAL::$id_osoba, $osoba_id);
            KontrolkiHtml::DodajHidden('telefon_id', 'telefon_id', '');
                
            if ($ilosc_wierszy > 0)
            {                
                foreach ($wynik as $wiersz)
                {
                    echo '<tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$telefon).' : </td><td>';
                    KontrolkiHtml::DodajTelefonTextbox('telefon'.$wiersz[OsobaDAL::$id], 'id_telefon'.$wiersz[OsobaDAL::$id], $wiersz[OsobaDAL::$nazwa], 13, 13, '', '');
                    echo '</td><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$opis).' : </td><td>';
                    KontrolkiHtml::DodajTextbox('opis_tel'.$wiersz[OsobaDAL::$id], 'id_opis_tel'.$wiersz[OsobaDAL::$id], $wiersz[OsobaDAL::$opis], 20, 15, '');
                    echo '</td><td>';
                    KontrolkiHtml::DodajSubmit('aktualizuj_tel', $wiersz[OsobaDAL::$id], $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$aktualizuj), 'onclick="telefon_id.value=this.id;"');
                    echo '</td><td>';
                    KontrolkiHtml::DodajSubmit('kasuj_telefon', $wiersz[OsobaDAL::$id], $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$kasuj), 'onclick="telefon_id.value=this.id;"');
                    echo '</td></tr>';
                }
                
             ///////////////   
            }
            echo '<tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$telefon).' : </td><td>';
            KontrolkiHtml::DodajTelefonTextbox('telefon', 'id_telefon', '', 13, 13, '', '');
            echo '</td><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$opis).' : </td><td>';
            KontrolkiHtml::DodajTextbox('opis_tel', 'id_opis_tel', '', 20, 15, '');
            echo '</td><td>';
            KontrolkiHtml::DodajSubmit('dodaj_tel', 'id_dodaj_tel', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$dodaj), '');
            echo '</td></tr></table></form><hr />';
             //////////////////////
            $wynik = $dal->PodajKomorka($ilosc_wierszy);

            echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'"><table>';
            KontrolkiHtml::DodajHidden(OsobaDAL::$id_osoba, OsobaDAL::$id_osoba, $osoba_id);
            
            $kom = '';
            $opis_kom = '';
            $przycisk = $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$dodaj);
            $kasuj = false;
            
            if ($ilosc_wierszy == 1)
            {
                $kom = $wynik[0][OsobaDAL::$nazwa];
                $opis_kom = $wynik[0][OsobaDAL::$opis];
                $przycisk = $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$aktualizuj);
                $kasuj = true;
            }
            echo '<tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$telefon_komorkowy).' : </td><td>';
            KontrolkiHtml::DodajKomorkaTextbox('komorka', 'id_komorka', $kom, 9, 9, '', '');
            echo '</td><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$opis).' : </td><td>';
            KontrolkiHtml::DodajTextbox('opis_kom', 'id_opis_kom', $opis_kom, 20, 15, '');
            echo '</td><td>';
            KontrolkiHtml::DodajSubmit('dodaj_kom', 'id_dodaj_kom', $przycisk, '');
            if ($kasuj)
            {
                echo '</td><td>';  
                KontrolkiHtml::DodajSubmit('kasuj_kom', 'id_kasuj_kom', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$kasuj), '');
            }
            echo '</td></tr></table></form><hr />';
            
            $wynik = $dal->PodajEmaile($ilosc_wierszy);
            
            echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'"><table>';
            KontrolkiHtml::DodajHidden(OsobaDAL::$id_osoba, OsobaDAL::$id_osoba, $osoba_id);
            KontrolkiHtml::DodajHidden('mail_id', 'mail_id', '');
                
            if ($ilosc_wierszy > 0)
            {                
                foreach ($wynik as $wiersz)
                {
                    echo '<tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$adres_email).' : </td><td>';
                    KontrolkiHtml::DodajEmailTextbox('mail'.$wiersz[OsobaDAL::$id], 'id_mail'.$wiersz[OsobaDAL::$id], $wiersz[OsobaDAL::$nazwa], 20, 15, '', '');
                    echo '</td><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$opis).' : </td><td>';
                    KontrolkiHtml::DodajTextbox('opis_mail'.$wiersz[OsobaDAL::$id], 'id_opis_mail'.$wiersz[OsobaDAL::$id], $wiersz[OsobaDAL::$opis], 20, 15, '');
                    echo '</td><td>';
                    KontrolkiHtml::DodajSubmit('aktualizuj_mail', $wiersz[OsobaDAL::$id], $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$aktualizuj), 'onclick="mail_id.value=this.id;"');
                    echo '</td><td>';
                    KontrolkiHtml::DodajSubmit('kasuj_mail', $wiersz[OsobaDAL::$id], $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$kasuj), 'onclick="mail_id.value=this.id;"');
                    echo '</td></tr>';
                }
            }
            echo '<tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$adres_email).' : </td><td>';
            KontrolkiHtml::DodajEmailTextbox('mail', 'id_mail', '', 20, 15, '', '');
            echo '</td><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$opis).' : </td><td>';
            KontrolkiHtml::DodajTextbox('opis_mail', 'id_opis_mail', '', 20, 15, '');
            echo '</td><td>';
            KontrolkiHtml::DodajSubmit('dodaj_mail', 'id_dodaj_mail', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$dodaj), '');
            echo '</td></tr></table></form><hr />';
        }
    }
    require('../stopka.php');

?>
</body>
</html>