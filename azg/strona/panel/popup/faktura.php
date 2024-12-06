<body>
<HEAD>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8 ">
  <script language="javascript" src="../../js/script.js"></script>
</head>
<body style="margin-left: 0px; margin-right: 0px; margin-top: 0px; margin-bottom: 0px;" onload="window.print();">
<?php
// onload="window.print();"
    require('../../conf.php');
    include_once ('../../ui/utilsui.php');
    include_once ('../../bll/cache.php');
    include_once ('../../bll/agentbll.php'); 
    include_once ('../../bll/utilsbll.php'); 
    include_once ('../../bll/listawskazanbll.php');
    session_start();
    if (!isset($_SESSION[$zalogowany]))
    {
        echo 'Nie jesteĹ› zalogowany.';
    }
    else
    {
        $agent_zal = unserialize($_SESSION[$dane_agent]);
        //echo '<script>history.clear();</script>';
        if(isset($_GET['numer_faktury']))
        {
            //grzana po pachy, jak nie konwertuje albo explorer albo mozilla ma wąty - przy czym jak zwykle uwazam, ze blad jest w explorerze
            if (substr($_GET['forma_platnosci'], 0, 3) == 'Got')
            {
                $_GET['forma_platnosci'] = 'Gotówka';
            }
            if ($_GET['rodzaj'] == 'org')
            {
                $org = 'ORYGINAŁ';
            }
            else
            {
                $org = 'KOPIA';
            }
            echo '<table width="100%" border = "1">';
            echo '<tr><td align="right" colspan="3"><b>'.$org.'</b></td></tr>';
            echo '<tr><td align="center" colspan="3"><b>FAKTURA VAT NR '.$_GET['numer_faktury'].'/'.$_GET['miesiac_faktury'].'/'.$_GET['rok_faktury'].'</b></td></tr>';
            echo '<tr><td rowspan="3"  width="70%"><b>SPRZEDAWCA:<br />'.$agent_zal->firma.' '.$agent_zal->nazwa.'</b><br />'.$agent_zal->adres.'<br />NIP: '.$agent_zal->nip.'<br />BANK: '.
            $agent_zal->bank[$_GET['rachunek_id']].'<br />NR RACHUNKU: '.$agent_zal->konto[$_GET['rachunek_id']].'<td><b>Data Wystawienia:</b>'.$_GET['data_wystawienia'].'</td></tr>';
            echo '<tr><td><b>Data Sprzedaży:</b>'.$_GET['data_sprzedazy'].'</td></tr>';
            echo '<tr><td><b>Forma i Termin Płatności:</b>'.$_GET['forma_platnosci'].', '.$_GET['termin_platnosci'].'</td></tr>'; //iconv('ISO-8859-2', 'UTF-8',
            echo '<tr><td align="left" colspan="2"><b>NABYWCA:<br />Imię i Nazwisko:</b><br />'.$_GET['osoba_nazwa'].'<br />';
            
            if (strlen($_GET['adres']) > 0)
            {
                echo '<b>Adres Zamieszkania:</b><br />'.$_GET['adres'].'<br />';
            }
            echo '<b>NIP:</b><br />'.$_GET['nip'].'<br />';
            echo '</td></tr>';
            echo '</table>';
            
            $vat = $_GET['kwota_netto'] * 0.22;
            $pelna_kwota = $vat + $_GET['kwota_netto'];
            
            $_GET['kwota_netto'] = number_format($_GET['kwota_netto'], 2, ',', '.');
            $kwota_pod_slownie = number_format($pelna_kwota, 2, ',', '');
            $pelna_kwota = number_format($pelna_kwota, 2, ',', '.');
            $vat = number_format($vat, 2, ',', '.');
            
            echo '<br /><br /><br /><br />';
            echo '<table width="100%" border="1">';
            echo '<tr><td><b>Lp.</b></td><td><b>Nazwa</b></td><td><b>Ilość</b></td><td><b>Cena jedn. (zł.)</b></td><td><b>VAT (%)</b></td><td><b>Kwota VAT (zł.)</b></td><td><b>Wartość Netto (zł.)</b></td>
            <td><b>Wartość Brutto (zł.)</b></td></tr>';
            echo '<tr><td>1</td><td>'.$_GET['nazwa_uslugi'].'</td><td>1</td><td align="right">'.$_GET['kwota_netto'].'</td><td align="center">22</td><td align="right">'.$vat.'</td><td align="right">'.$_GET['kwota_netto'].
            '</td><td align="right">'.$pelna_kwota.'</td></tr>';
            echo '<tr><td colspan="5" align="right"><b>RAZEM</b></td><td align="right">'.$vat.'</td><td align="right">'.$_GET['kwota_netto'].'</td><td align="right">'.$pelna_kwota.'</td></tr>';
            echo '</table>';
            
            echo '<br /><br /><br />';
            echo '<b>Do Zapłaty: </b>'.$pelna_kwota.' zł. (słownie: '.iconv('ISO-8859-2', 'UTF-8', Utils::slownie($kwota_pod_slownie)).').';
            echo '<br /><br /><br /><br /><br /><br />';
            
            echo '<table width="100%"><tr><td valign="top" width="50%" border="0" align="left">....................................................................<br /><b>'.$_GET['osoba_nazwa'].'.</b></td>';

            echo '<td width="50%" border="0" align="right">....................................................................<br /><b>'.$agent_zal->nazwa.',<br />
            uprawniony do wystawienia<br />Faktury VAT.</b></td></tr></table>';
        }
    }
?>
</body>