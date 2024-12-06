<?
echo '<center><span class="nag2b"><b>'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$informacje_dla_klienta), $_SESSION[$jezyk]).'</b></span></center><br /><br /><center>';
echo '<table width="500" cellpadding="0" cellspacing="0" frame border="0">';

echo '<tr align="left"><td><span class="polecam">'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$przy_wyborze_biura_nieruchomosci), $_SESSION[$jezyk]).':';
//Przy wyborze biura nieruchomo¶ci, z którym chc± Pañstwo podj±æ wspó³pracê, nale¿y zwróciæ uwagê na nastêpuj±ce rzeczy:
echo '<ul type="1">
<li>'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$czy_biuro_ma_licencjonowanego), $_SESSION[$jezyk]).' ?
<li>'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$czy_biuro_ubezpieczone_jest), $_SESSION[$jezyk]).' ?
<li>'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$jak_dlugo_biuro_dziala), $_SESSION[$jezyk]).' ?
<li>'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$czy_biuro_stowarzyszone_jest), $_SESSION[$jezyk]).' ?
<li>'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$czy_biuro_obecne_jest_w_lokalnej), $_SESSION[$jezyk]).' ?
</ul>'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wybor_odpowiedniego_biura_posrednictwa), $_SESSION[$jezyk]).' .<br /></span></td></tr></table></center>';
?>
