<table width="776" cellpadding="0" cellspacing="0" frame border="0">
<tr><td colspan="7"><img src="../img/red.gif" width="776" height="1" border="0"></td></tr>
<?php
    //okreslenie dnia do zapisania na stronie
    echo '<tr><td class="tdnag" align="center" colspan="2"><a href="http://www.azg.pl/nieruchomosci-opole.php"><h1>'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nieruchomosci_w_opolu_i_w_wojewodztwie_opolskim), $_SESSION[$jezyk]).' - '.$AZG.'</h1></a></td></tr>';
    echo '<tr><td colspan="2"><img src="../img/red.gif" width="776" height="1" border="0"></td></tr>';
    echo '<tr valign="left"><td height="7" class="tdnag"><span class="polecab"><b>&nbsp;&nbsp;';

    $mese[0]='-';
    $mese[1] = tags::$styczen;
    $mese[2] = tags::$luty;
    $mese[3] = tags::$marzec;
    $mese[4] = tags::$kwiecien;
    $mese[5] = tags::$maj;
    $mese[6] = tags::$czerwiec;
    $mese[7] = tags::$lipiec;
    $mese[8] = tags::$sierpien;
    $mese[9] = tags::$wrzesien;
    $mese[10] = tags::$pazdziernik;
    $mese[11] = tags::$listopad;
    $mese[12] = tags::$grudzien;

    $giorno[0] = tags::$niedziela;
    $giorno[1] = tags::$poniedzialek;
    $giorno[2] = tags::$wtorek;
    $giorno[3] = tags::$sroda;
    $giorno[4] = tags::$czwartek;
    $giorno[5] = tags::$piatek;
    $giorno[6] = tags::$sobota;

    $gisett=(int)date('w');
    $mesnum=(int)date('m');

    echo UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], $giorno[$gisett]), $_SESSION[$jezyk])." ".date("d")." ".
    UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], $mese[$mesnum]), $_SESSION[$jezyk])." ".date("Y");

    $czas = time();

    $miesiac = date('m',$czas);
    $dzien = date('j',$czas);

$imieniny = file($miesiac.'.txt');
echo '.&nbsp;&nbsp;'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$imieniny), $_SESSION[$jezyk]).':&nbsp;';
echo $imieniny[$dzien-1];


echo '</b></span></td><td height="7" class="tdnag" align="right"><right><span class="polecab"><b>';
//include "online/online.php";
echo '&nbsp;&nbsp;</b></span></right></td></tr>';
?>
</table>