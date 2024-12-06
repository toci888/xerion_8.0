<?
echo '<center><span class="nag2b"><b>'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$formy_sprzedazy), $_SESSION[$jezyk]).'</b></span></center><br /><br />';
echo '<center><table width="500" cellpadding="0" cellspacing="0" frame border="0">';

echo '<tr align="left"><td><span class="polecam">';

echo UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podejmujemy_wspolprace_na_zasadach), $_SESSION[$jezyk]);
echo ' <b>'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$umowy_otwartej), $_SESSION[$jezyk]).'</b> ';
echo UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$i), $_SESSION[$jezyk]);
echo ' <b>'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$umowy_z_klauzula_wylacznosci), $_SESSION[$jezyk]).'</b>.<br /><br />';

//Podejmujemy wspó³pracê na zasadach <b>Umowy Otwartej</b> i <b>Umowy z Klauzul± Wy³±czno¶ci</b>.<br><br>
echo UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$z_przyjemnoscia_przy_tym), $_SESSION[$jezyk]).'. ';
//Z przyjemno¶ci± przy tym obserwujemy na rynku tworz±c± siê grupê nabywców zainteresowanych us³ugami agencji nieruchomo¶ci, chc±cych mieæ zapewnione bezpieczeñstwo transakcji, gdzie nierzadko w grê wchodzi dorobek ca³ego ¿ycia, b±d¼ perspektywa wieloletniej sp³aty kredytu. 
echo UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nasze_biuro_dysponuje_rowniez), $_SESSION[$jezyk]).'. <br /><br />';
//Nasze biuro dysponuje równie¿ baz± danych potencjalnych klientów spoza Opola, którzy nie maj±c dostêpu do lokalnej prasy, nie bêd± w stanie zainteresowaæ siê ofertami sprzedaj±cych indywidualnie, a zatem powierzaj± nam poszukiwanie dla siebie nieruchomo¶ci na terenie miasta i okolic.<br><br>

echo '<b>'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$co_daje_wylacznosc), $_SESSION[$jezyk]).'?</b><br /><br />';
echo UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$umowy_z_klauzula_wylacznosci_sa), $_SESSION[$jezyk]).'. ';
//Umowy z klauzul± wy³±czno¶ci s± najlepsz± form± sprzeda¿y nieruchomo¶ci i to nie tylko z punktu widzenia po¶rednika ale tak¿e sprzedaj±cego. 
echo UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$jest_to_podstawowy_sposob), $_SESSION[$jezyk]).'. <br /><br />';
//Jest to podstawowy sposób dzia³alno¶ci po¶redników na rynku zachodnim, który znakomicie sprawdza siê równie¿ w polskich realiach.<br><br>

echo '<b>1. '.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$oszczednosc_czasu_i_pieniedzy), $_SESSION[$jezyk]).'. </b><br /><br />';
echo UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$umowa_zobowiazuje_posrednika_do_calego), $_SESSION[$jezyk]).'. ';
//Umowa zobowi±zuje po¶rednika do ca³ego szeregu dzia³añ w sferze promocji i reklamy, w tym powierzenia oferty innym biurom (co odpowiada zg³oszeniu oferty do kilkudziesiêciu biur w ca³ym województwie). 
echo UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podejmujac_sie_samemu_tej), $_SESSION[$jezyk]).'. ';
//Podejmuj±c siê samemu tej czynno¶ci pierwszy miesi±c zajmie sprzedaj±cemu na umawianie siê z po¶rednikami, odpowiadanie na te same pytania, analizowanie umów, okazywanie obiektu. 
echo UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$dzialania_te_na_pewno_czasochlonne), $_SESSION[$jezyk]).'. <br /><br />';
//Dzia³ania te, na pewno czasoch³onne, mog± okazaæ siê równie¿ do¶æ kosztowne w przypadku gdy oferowana nieruchomo¶æ le¿y poza faktycznym miejscem zamieszkania sprzedaj±cego.<br><br>

echo '<b>2. '.UtilsUI::ZamianaLitery(UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wzrost_skutecznosci), $_SESSION[$jezyk])).'. </b><br /><br />';
echo UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$majac_podpisana_umowe_na_wylacznosc), $_SESSION[$jezyk]).'. ';
//Maj±c podpisan± umowê na wy³±czno¶æ Biuro jest w stanie prowadziæ szersz± politykê sprzeda¿y. 
echo UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podajac_wieksza_ilosc_informacji), $_SESSION[$jezyk]).'. ';
//Podaj±c wiêksz± ilo¶æ informacji, lokalizacjê, zdjêcia budynku z zewn±trz, w sposób bardziej trafny jest w stanie wyselekcjonowaæ grupê potencjalnych nabywców. Przykuæ ich zainteresowanie og³oszeniami w prasie czy w ofercie internetowej. 
echo UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$taki_sposob_prezentacji), $_SESSION[$jezyk]).' <b>40 % !!!</b> ';
//Taki sposób prezentacji w praktyce przynosi nawet <b>40 % !!!</b> 
echo UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wzrost_skutecznosci), $_SESSION[$jezyk]).'. ';
//wzrost skuteczno¶ci. 
echo UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$biuro_pewnie_wydatkuje), $_SESSION[$jezyk]).'. <br /><br />';
//Biuro pewnie wydatkuje swoje pieni±dze maj±c zagwarantowane wynagrodzenie w przypadku sprzeda¿y.<br><br>

echo '<b>3. '.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zyski), $_SESSION[$jezyk]).'</b><br /><br />';
echo UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$mozliwosc_szerokiej_reklamy), $_SESSION[$jezyk]).'. ';
//Mo¿liwo¶æ szerokiej reklamy, w po³±czeniu ze wspó³prac± i korzystaniem z baz danych innych biur po¶rednictwa pozwala na uzyskanie maksymalnie dobrej ceny rynkowej. 
echo UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$cene_te_zaplaci_bowiem), $_SESSION[$jezyk]).'. <br /><br />';
//Cenê t± zap³aci bowiem klient wyselekcjonowany z du¿ej grupy potencjalnych nabywców.<br><br>

echo '<br></span></td></tr></table></center>';
?>
