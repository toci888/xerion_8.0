<?
echo '<center><span class="nag2b"><b>'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$formy_sprzedazy), $_SESSION[$jezyk]).'</b></span></center><br /><br />';
echo '<center><table width="500" cellpadding="0" cellspacing="0" frame border="0">';

echo '<tr align="left"><td><span class="polecam">';

echo UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podejmujemy_wspolprace_na_zasadach), $_SESSION[$jezyk]);
echo ' <b>'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$umowy_otwartej), $_SESSION[$jezyk]).'</b> ';
echo UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$i), $_SESSION[$jezyk]);
echo ' <b>'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$umowy_z_klauzula_wylacznosci), $_SESSION[$jezyk]).'</b>.<br /><br />';

//Podejmujemy wsp�prac� na zasadach <b>Umowy Otwartej</b> i <b>Umowy z Klauzul� Wy��czno�ci</b>.<br><br>
echo UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$z_przyjemnoscia_przy_tym), $_SESSION[$jezyk]).'. ';
//Z przyjemno�ci� przy tym obserwujemy na rynku tworz�c� si� grup� nabywc�w zainteresowanych us�ugami agencji nieruchomo�ci, chc�cych mie� zapewnione bezpiecze�stwo transakcji, gdzie nierzadko w gr� wchodzi dorobek ca�ego �ycia, b�d� perspektywa wieloletniej sp�aty kredytu. 
echo UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nasze_biuro_dysponuje_rowniez), $_SESSION[$jezyk]).'. <br /><br />';
//Nasze biuro dysponuje r�wnie� baz� danych potencjalnych klient�w spoza Opola, kt�rzy nie maj�c dost�pu do lokalnej prasy, nie b�d� w stanie zainteresowa� si� ofertami sprzedaj�cych indywidualnie, a zatem powierzaj� nam poszukiwanie dla siebie nieruchomo�ci na terenie miasta i okolic.<br><br>

echo '<b>'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$co_daje_wylacznosc), $_SESSION[$jezyk]).'?</b><br /><br />';
echo UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$umowy_z_klauzula_wylacznosci_sa), $_SESSION[$jezyk]).'. ';
//Umowy z klauzul� wy��czno�ci s� najlepsz� form� sprzeda�y nieruchomo�ci i to nie tylko z punktu widzenia po�rednika ale tak�e sprzedaj�cego. 
echo UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$jest_to_podstawowy_sposob), $_SESSION[$jezyk]).'. <br /><br />';
//Jest to podstawowy spos�b dzia�alno�ci po�rednik�w na rynku zachodnim, kt�ry znakomicie sprawdza si� r�wnie� w polskich realiach.<br><br>

echo '<b>1. '.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$oszczednosc_czasu_i_pieniedzy), $_SESSION[$jezyk]).'. </b><br /><br />';
echo UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$umowa_zobowiazuje_posrednika_do_calego), $_SESSION[$jezyk]).'. ';
//Umowa zobowi�zuje po�rednika do ca�ego szeregu dzia�a� w sferze promocji i reklamy, w tym powierzenia oferty innym biurom (co odpowiada zg�oszeniu oferty do kilkudziesi�ciu biur w ca�ym wojew�dztwie). 
echo UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podejmujac_sie_samemu_tej), $_SESSION[$jezyk]).'. ';
//Podejmuj�c si� samemu tej czynno�ci pierwszy miesi�c zajmie sprzedaj�cemu na umawianie si� z po�rednikami, odpowiadanie na te same pytania, analizowanie um�w, okazywanie obiektu. 
echo UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$dzialania_te_na_pewno_czasochlonne), $_SESSION[$jezyk]).'. <br /><br />';
//Dzia�ania te, na pewno czasoch�onne, mog� okaza� si� r�wnie� do�� kosztowne w przypadku gdy oferowana nieruchomo�� le�y poza faktycznym miejscem zamieszkania sprzedaj�cego.<br><br>

echo '<b>2. '.UtilsUI::ZamianaLitery(UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wzrost_skutecznosci), $_SESSION[$jezyk])).'. </b><br /><br />';
echo UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$majac_podpisana_umowe_na_wylacznosc), $_SESSION[$jezyk]).'. ';
//Maj�c podpisan� umow� na wy��czno�� Biuro jest w stanie prowadzi� szersz� polityk� sprzeda�y. 
echo UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podajac_wieksza_ilosc_informacji), $_SESSION[$jezyk]).'. ';
//Podaj�c wi�ksz� ilo�� informacji, lokalizacj�, zdj�cia budynku z zewn�trz, w spos�b bardziej trafny jest w stanie wyselekcjonowa� grup� potencjalnych nabywc�w. Przyku� ich zainteresowanie og�oszeniami w prasie czy w ofercie internetowej. 
echo UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$taki_sposob_prezentacji), $_SESSION[$jezyk]).' <b>40 % !!!</b> ';
//Taki spos�b prezentacji w praktyce przynosi nawet <b>40 % !!!</b> 
echo UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wzrost_skutecznosci), $_SESSION[$jezyk]).'. ';
//wzrost skuteczno�ci. 
echo UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$biuro_pewnie_wydatkuje), $_SESSION[$jezyk]).'. <br /><br />';
//Biuro pewnie wydatkuje swoje pieni�dze maj�c zagwarantowane wynagrodzenie w przypadku sprzeda�y.<br><br>

echo '<b>3. '.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zyski), $_SESSION[$jezyk]).'</b><br /><br />';
echo UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$mozliwosc_szerokiej_reklamy), $_SESSION[$jezyk]).'. ';
//Mo�liwo�� szerokiej reklamy, w po��czeniu ze wsp�prac� i korzystaniem z baz danych innych biur po�rednictwa pozwala na uzyskanie maksymalnie dobrej ceny rynkowej. 
echo UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$cene_te_zaplaci_bowiem), $_SESSION[$jezyk]).'. <br /><br />';
//Cen� t� zap�aci bowiem klient wyselekcjonowany z du�ej grupy potencjalnych nabywc�w.<br><br>

echo '<br></span></td></tr></table></center>';
?>
