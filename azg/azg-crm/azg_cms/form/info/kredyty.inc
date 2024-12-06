<?
echo '<center><span class="nag2b">
<b>'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$kredyty_hipoteczne), $_SESSION[$jezyk]).'</b>
</span>
</center>
<br>
<br>';
echo "<center>";
echo "<table width=\"500\" cellpadding=\"0\" cellspacing=\"0\" frame border=\"0\">";

echo "<tr align = \"left\">";
echo "<td>"; //wspó³pracuj±c z poszczególnymi bankami pomaga klientom w uzyskaniu kredytów finansuj±cych zakup wybranej nieruchomo¶ci
//Kompletuj±c oraz sprawdzaj±c ca³± dokumentacjê nieruchomo¶ci przyspieszamy proces rozpatrzenia wniosków kredytowych przez Bank.
echo '<span class="polecam">'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$biuro_nieruchomosci), $_SESSION[$jezyk]).' '.$AZG.' '.
UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wspolpracujac_z_poszczegolnymi_bankami), $_SESSION[$jezyk]).'. '.
UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$kompletujac_oraz_sprawdzajac_cala), $_SESSION[$jezyk]).'.<br />'.
UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$banki_z_ktorymi), $_SESSION[$jezyk]).' '.
UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$biuro_nieruchomosci), $_SESSION[$jezyk]).' '.$AZG.' '.
UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podpisalo_umowy_o_wspolprace), $_SESSION[$jezyk]).':<br /><br /></span>';
echo "</td>";
echo "</tr>";
echo "</table>";
echo "</center>";

echo "<table width=\"516\" cellpadding=\"0\" cellspacing=\"0\" frame border=\"0\">";

echo "<tr align = \"center\">";
echo "<td>";
echo "<a href = \"http://www.pkobp.pl\"><img src=\"banki/bankpko.gif\" width=\"193\" height=\"43\" border=\"0\"></img></a>";
echo "<br>";
echo "<a href = \"http://www.pkobp.pl\">PKO BANK POLSKI</a>";
echo "<br>";
echo "<br>";
echo "</td>";

echo "</tr>";

echo "<tr align = \"center\">";
echo "<td>";
echo "<a href = \"http://www.pekao.com.pl\"><img src=\"banki/bankpkosa.gif\" width=\"215\" height=\"35\" border=\"0\"></img></a>";
echo "<br>";
echo "<a href = \"http://www.pekao.com.pl\">BANK PEKAO SA</a>";
echo "<br>";
echo "<br>";
echo "</td>";
echo "</tr>";

echo "<tr align = \"center\">";
echo "<td>";
echo "<a href = \"http://www.multibank.pl\"><img src=\"banki/bankmulti.gif\" width=\"175\" height=\"55\" border=\"0\"></img></a>";
echo "<br>";
echo "<a href = \"http://www.multibank.pl\">MultiBank</a>";
echo "<br>";
echo "<br>";
echo "</td>";
echo "</tr>";

echo "<tr align = \"center\">";
echo "<td>";
echo "<a href = \"http://www.bph.pl\"><img src=\"banki/bankbph.gif\" width=\"193\" height=\"43\" border=\"0\"></img></a>";
echo "<br>";
echo "<a href = \"http://www.bph.pl\">BANK BPH</a>";
echo "<br>";
echo "<br>";
echo "</td>";
echo "</tr>";

echo "<tr align = \"center\">";
echo "<td>";
echo "<a href = \"http://www.ing.pl\"><img src=\"banki/banking.gif\" width=\"193\" height=\"43\" border=\"0\"></img></a>";
echo "<br>";
echo "<a href = \"http://www.ing.pl\">BANK ¦L¡SKI</a>";
echo "<br>";
echo "<br>";
echo "</td>";
echo "</tr>";

echo "<tr align = \"center\">";
echo "<td>";
echo "<a href = \"http://www.kredytbank.pl\"><img src=\"banki/bankkb.gif\" width=\"193\" height=\"43\" border=\"0\"></img></a>";
echo "<br>";
echo "<a href = \"http://www.kredytbank.pl\">KREDYT BANK</a>";
echo "<br>";
echo "<br>";
echo "</td>";
echo "</tr>";

echo "<tr align = \"center\">";
echo "<td>";
echo "<a href = \"http://www.wbk.pl\"><img src=\"banki/bankwbk.gif\" width=\"193\" height=\"43\" border=\"0\"></img></a>";
echo "<br>";
echo "<a href = \"http://www.wbk.pl\">BANK WBK</a>";
echo "<br>";
echo "<br>";
echo "</td>";
echo "</tr>";

echo "<tr align = \"center\">";
echo "<td>";
echo "<a href = \"http://www.ptf.com.pl\"><img src=\"banki/bankptf.jpg\" width=\"197\" height=\"59\" border=\"0\"></img></a>";
echo "<br>";
echo "<a href = \"http://www.ptf.com.pl\">BANK PTF</a>";
echo "<br>";
echo "<br>";
echo "</td>";
echo "</tr>";

echo "</center>";
echo "</table>";
?>
