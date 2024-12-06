
function WalidacjaLiczbaWymierna(obj, evt)
{
	var klKod = (evt.keyCode) ? evt.keyCode : evt.which;
	//alert(klKod);
	//, - 44, - - 45, . - 46
	var tab = Array(8, 9, 13, 35, 36, 37, 38, 39, 40, 46);
	
	if(klKod == 46)
	{
		//alert(obj.value);
		wzor = /^[0-9]{1,8}$/;
		if(!wzor.test(obj.value))
		{
			return false;
		}
		else
		{
			return true;			
		}
	}
	
	if (klKod < 48 || klKod > 57)
	{
		return ZgodnoscZnak(klKod, tab);		
	}
	else
	{
		return true;
	}
}
function WalidacjaLiczbaCalkowita(obj, evt)
{
	var klKod = (evt.keyCode) ? evt.keyCode : evt.which;
	//alert(klKod);
	var tab = Array(8, 9, 13, 35, 36, 37, 38, 39, 40);
	
	if(klKod < 48 || klKod > 57)
	{
		return ZgodnoscZnak(klKod, tab);	
	}
	else
	{
		return true;	
	}
}

function WalidacjaData(obj, evt)
{
	var klKod = (evt.keyCode) ? evt.keyCode : evt.which;
	//alert(klKod);
	//, - 44, - - 45
	var tab = Array(45, 13, 8, 9, 35, 36, 37, 38, 39, 40, 46);
	

	/*wzor = /^(1|2){1}(0|9){1}[0-9]{2}(-){1}(0|1){1}[0-9]{1}(-){1}[1-3]{1}[0-9]{1}$/;//format daty
	if(!wzor.test(obj.value))
	{
		return false;
	}
	else
	{
		return true;			
	}*/

	
	if (klKod < 48 || klKod > 57)
	{
		return ZgodnoscZnak(klKod, tab);		
	}
	else
	{
		return true;
	}
}
function WalidacjaKodPocztowy(obj, evt)
{
	var klKod = (evt.keyCode) ? evt.keyCode : evt.which;
	//alert(klKod);
	//, - 44, - - 45
	var tab = Array(8, 9, 35, 36, 37, 38, 39, 40);
	
	if(klKod == 45)
	{
		//alert(obj.value);
		wzor = /^[0-9]{1,8}$/;
		if(!wzor.test(obj.value))
		{
			return false;
		}
		else
		{
			return true;			
		}
	}
	
	if (klKod < 48 || klKod > 57)
	{
		return ZgodnoscZnak(klKod, tab);		
	}
	else
	{
		return true;
	}
}
function WalidacjaNrKonto(cntl, monit)
{
	if (cntl.value.length > 0 && cntl.value.length < 26)
	{
		alert(monit);
		cntl.focus();
	    cntl.value = "";
		return false;
	}
	else if (isNaN(cntl.value))
	{
		alert(monit);
		cntl.focus();
	    cntl.value = "";
		return false;
	}
}
function TelefonKomWalidacja (cntl, monit)
{
    var wzor = /^(50|51|60|66|69|78|79|88){1}[0-9]{7}$/;
    if (!wzor.test(cntl.value))
    {
		if(cntl.value != "")
		{
			alert(monit);
		   	cntl.focus();
	        cntl.value = "";
			return false;
		}
    }
    else
    {
        return cntl.value;
    }
}
function TelefonWalidacja(cntl, monit)
{
    var wzor = /^[1-9]{1}[0-9]{8,12}$/;
    if (!wzor.test(cntl.value))
    {
		if(cntl.value != "")
	    {
          	alert(monit);
	   	    cntl.focus();
           	cntl.value = "";
		    return false;
	    }
    }
    else
    {
        return cntl.value;
    }
}
function EmailWalidacja(cntl, monit)
{
    var wzor = /^[0-9,A-Z,a-z,.,\,,_,-]{1,20}(\@){1}[0-9,A-Z,a-z,.,-]{1,25}(.){1}[A-Z,a-z]{1,5}$/; //zle dziala
    if (!wzor.test(cntl.value))
    {
		if(cntl.value != "")
	    {
          	alert(monit);
	   	    cntl.focus();
           	cntl.value = "";
		    return false;
	    }
    }
    else
    {
        return cntl.value;
    }
}
function PoprKodPocztowy (cntl, monit)
{
    var wzor = /^[0-9]{2}(\-){1}[0-9]{3}$/;
    if (!wzor.test(cntl.value))
    {
		if(cntl.value != "")
		{
          	alert(monit);
	   		cntl.focus();
           	cntl.value = "";
			return false;
		}
    }
    else
    {
        return cntl.value;
    }
}
function WalidacjaPesel (cntl, monit)
{
	if(cntl.value.length > 0)
	{	
	    if (cntl.value.length != 11 || isNaN(cntl.value)) //sprawdzamy czy cig ma 11 znakw
	    {
			alert(monit);
		   	cntl.focus();
	        cntl.value = "";
	        return false;
	    }
	    
	    var tabWag = Array(1, 3, 7, 9, 1, 3, 7, 9, 1, 3); // tablica z odpowiednimi wagami
	    var intSum = 0;
	    for (var i = 0; i < 10; i++)
	    {
	        intSum += tabWag[i] * cntl.value.substr(i, 1); //mnoymy kady ze znakw przez wag i sumujemy wszystko
	    }
	    var sumaKon = 10 - intSum % 10; //obliczamy sum kontroln
	    var intControlNr = (sumaKon == 10) ? 0 : sumaKon;
	    if (intControlNr == cntl.value.substr(10, 1)) //sprawdzamy czy taka sama suma kontrolna jest w cigu
	    {
	        return true;
	    }
		alert(monit);
		cntl.focus();
	    cntl.value = "";
	    return false;
	}
}
function WalidacjaNip (cntl, monit)
{
	var cyfra_nip;
	
	if(cntl.value.length > 0)
	{	
		//powyzsza linijka czyni dowolnym stosowanie myslnikow w nip: osoba fizyczna ma nip w notacji xxx-xxx-xx-xx, osoba prawna xxx-xx-xx-xxx
		cyfra_nip = cntl.value.replace(/-/g, ''); //przeszukiwanie globalne - wszystkie wystapienia znaku sa zastepowane 
		//alert(cyfra_nip);	
	    if (cyfra_nip.length != 10 || isNaN(cyfra_nip)) //sprawdzamy czy ciag ma 10 znakow
	    {
			alert(monit);
		   	cntl.focus();
	        cntl.value = "";
	        return false;
	    }
	    
	    var tabWag = Array(6, 5, 7, 2, 3, 4, 5, 6, 7); // tablica z odpowiednimi wagami
	    var intSum = 0;
	    for (var i = 0; i < 9; i++)
	    {
	        intSum += tabWag[i] * cyfra_nip.substr(i, 1); //mnozymy kazdy ze znakow przez wage i sumujemy wszystko
	    }
	    var sumaKon = intSum % 11; //obliczamy sum kontroln
	    //var intControlNr = (sumaKon == 10) ? 0 : sumaKon; //-nip jest tak generowany, zeby 10 z dzielenia nigdy nie wyszlo
	    if (sumaKon == cyfra_nip.substr(9, 1)) //sprawdzamy czy taka sama suma kontrolna jest w ciagu //intControlNr
	    {
	        return true;
	    }
		alert(monit);
		cntl.focus();
	    cntl.value = "";
	    return false;
	}
}
function DataPrzyszlosc(obj, monit)
{
	var currentDate = new Date();
	var curDateString = currentDate.getFullYear() + '-' + sprawdzMiesiac(currentDate.getMonth()) + '-' + sprawdzDzien(currentDate.getDate());
	var date = obj.value;
	//alert(curDateString);
	if (date.length > 0)
	if (date < curDateString)
	{
		alert(monit);
		obj.value = '';
	}
}
function SprawdzWiekszoscDaty (cntl, id_txt_mn_data, wiad)
{
	var dataKon = cntl.value;
	var dataPocz = document.getElementById(id_txt_mn_data).value;
	if (dataKon.length > 0 && dataPocz.length > 0)
	if (dataKon < dataPocz)
	{
		info(cntl, wiad);
	}
	
	return 0;
}
function SprawdzMniejszoscDaty (cntl, id_txt_w_data, wiad)
{
	var dataPocz = cntl.value;
	var dataKon = document.getElementById(id_txt_w_data).value;
	if (dataKon.length > 0 && dataPocz.length > 0)
	if (dataKon < dataPocz)
	{
		info(cntl, wiad);
	}
	
	return 0;
}
function SprawdzDlugoscData(cntl, wiad_zla_data)
{
    var bool = 0;
    if (cntl.value.length !== 10 && cntl.value.length !== 0)
    {
        info(cntl, wiad_zla_data);
        bool = 1;
    }
    if (cntl.value.length !== 0 && bool == 0)
	{
		SprawdzData(cntl, cntl.value, wiad_zla_data);
	}
}
function SprawdzData (cntl, date, wiad_zla_data)
{
       //regular expresion pattern checking the date propriety allowing :
       /*
       year range: 1000 - 1199; 1900 - 2199; 2900 - 2999
       month range: 1 - 12
       day range: 1 - 31
       year range is quite unfortunate, that's why later an if will be required
       */
       var pattern;
       var year, month, day;
       var culYearB, culYearE, culMonthB, culMonthE, culDayB, culDayE;
       
       culYearB = 0;
       culYearE = 4;
       culMonthB = 5;
       culMonthE = 7;
       culDayB = 8;
       culDayE = 10;
       pattern = /^(1|2){1}(0|1|9){1}[0-9]{2}(\-){1}(01|02|03|04|05|06|07|08|09|10|11|12){1}(\-){1}(01|02|03|04|05|06|07|08|09|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24|25|26|27|28|29|30|31){1}$/;
       
       //test the date provided by a user with the regular expresion
       if (!pattern.test(date))
       {
           info(cntl, wiad_zla_data);
       }
       //the date went through the regular expresion test
       else
       {    
            //find a year of a date
            year = date.substring(culYearB, culYearE);
            //find a month
            month = date.substring(culMonthB, culMonthE);
            //find a day
            day = date.substring(culDayB, culDayE);
            //cut off nonsense years (to far in the future or in the past)
            if (year < 1900 || year > 2200)
            {
                info (cntl, wiad_zla_data);
            }
            //if the month is february, april or june (below 7 and even number)
            if (month < 7 && (month % 2) == 0)
            {
                //there is no 31 in those months
                if (day > 30)
                {
                    info (cntl, wiad_zla_data);
                    return 0;
                }
                //if we happen to have february as a month
                if (month == 2)
                {
                    //if the year is a leap year
                    if (year % 4 == 0)
                    {
                        //allow only 29 of february
                        if (day > 29)
                        {
                            info (cntl, wiad_zla_data);
                        }
                    }
                    //the year is not a leap year
                    else
                    {
                        //day is not higher than 28
                        if (day > 28)
                        {
                            info (cntl, wiad_zla_data);
                        }
                    }
                }
            }
            //months above august and odd so september and november
            if (month > 8 && (month % 2) == 1)
            {
                //september and november has no 31
                if (day > 30)
                {
                    info (cntl, wiad_zla_data);
                }
            }
       }
}
function WalidacjaText(obj, evt)
{
	return true;
}
///walidacja generyczna - pola wymagane
function WalidacjaFormularz (tabKontrolek, tabInfo, przedrostek)
{
	var i = 0;
	var ilosc = tabKontrolek.length;
	for (i = 0; i < ilosc; i++)
	{
		if (tabKontrolek[i].value.length < 1)
		{
			alert(przedrostek + tabInfo[i]);
			return false;
		}
	}
	return true;
}
//sprawdzenie zgodnosci przyciskanego znaku z tablica kodow ascii - jesli to ktorys z tablicy akceptacja
function ZgodnoscZnak(znak, tablicaZnakow)
{
	var i = 0;
	var zgodnosc = false;
	for (i; i < tablicaZnakow.length; i++)
	{
		if (znak == tablicaZnakow[i])
		{
			zgodnosc = true;
		}
	}
	
	return zgodnosc;
}
function setHiddenFromSelect(obj, hiddenId)
{
	var select = obj;
	var hidden = document.getElementById(hiddenId);

	if (select.selectedIndex >= 0)
		hidden.value = select.options[select.selectedIndex].id;
}
function setHiddenFromSelectMulti(obj, hiddenId)
{
	var select = obj;
	var hidden = document.getElementById(hiddenId);
	var j = 0;
	hidden.value = Array();
	for (var i = 0; i < select.options.length; i++)
	{
		if (select.options[i].selected == true)
		{
			if (j > 0)
			{
				hidden.value += ';';
			}
			hidden.value += select.options[i].id;
			j++;
		}
	}
	//alert(select.selectedIndex[1]);
	//if (select.selectedIndex >= 0)
	//	hidden.value = select.options[select.selectedIndex].id;
}
function trim(textToTrim)
{
	var newText = textToTrim;
	var textLength = textToTrim.length;
	var i = 0;
	newText = textToTrim;
	//allow iteration to a number of the sting length
	//while ((newText.length > 1) && (newText.substring(newText.length - 2, newText.length - 1) == " "))
	while (i <= textLength)
	{
		if ((newText.substring(newText.length - 1, newText.length) == " "))
		{
			newText = newText.substring(0, newText.length - 1);
		}
		else
		{
			break;
		}
		i++;
	}
	textLength = newText.length;
	i = 0;
	//while ((newText.length > 1) && (newText.substring(0, 1) == " "))
	while (i <= textLength)
	{
		if ((newText.substring(0, 1) == " "))
		{
			newText = newText.substring(1, newText.length);
		}
		else
		{
			break;
		}
		i++;
	}
	//region get rid of middle spaces in text
	var arrPieces = newText.split(" ");
	var and = 0;
	var result = "";
	for (var i = 0; i < arrPieces.length; i++)
	{
		if (arrPieces[i] != "")
		{
			if (and == 0)
			{
				and = 1;
			}
			else
			{
				result += " ";
			}
			result += arrPieces[i];
		}
	}
	return result;
}
///funkcje ponizej sa uzywane do zastosowan dla innych funkcji 
///w celu automatyzacji i centralizacji pewnych jednolitych obliczen
///zreszta nie ma chyba sensu tu tlumaczyc ze pewne przeliczenia powtarzane czesto 
///powinny byc wyprowadzane do osobnych funkcji
function sprawdzMiesiac(month)
{
	month = month + 1;
	if (month < 10)
	{
		return '0' + month;		
	}
	else
	{
		return month;
	}
}
function sprawdzDzien(day)
{
	//month = month + 1;
	if (day < 10)
	{
		return '0' + day;		
	}
	else
	{
		return day;
	}
}
function info (item, wiad_zla_data)
{
    alert(wiad_zla_data);
    //item.focus();
    item.value = "";
    return 0;
}
function WspomaganieSelect(parametr, evt, hidPamTym, hidPamTymP)
{
	setTimeout('AutoUzupelnianieSelect', 10, parametr, evt, hidPamTym, hidPamTymP);
}
function AutoUzupelnianieSelect(parametr, evt, hidPamTym, hidPamTymP)
{
    var tab = new Array("A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"); 
    var tab_p = new Array("Ä?", "Ĺ?", "Ĺ»", "Ĺ?"); //"Ë‡","Ă“", "Â¦", "Â¬" "Ä†"
    var tekst = document.getElementById(hidPamTym); //obiekt ktory zawiera wpisane litery
    //var pole = document.getElementById(hidPamTymP); //obiekt ktory zawiera info o aktualnie uzywanym combo - na razie nieuzywane
    //if (pole.value != parametr.name)
    //{
    //    tekst.value = "";
    //    pole.value = parametr.name;
    //}
    var i = 0;
    //alert (tekst.value);
	var k = (evt.keyCode) ? evt.keyCode : evt.which;
    //var k = event.keyCode;
	//alert(k); 
    if (k != 9 && k != 13 && (k < 16 || k > 18) && (k < 37 || k > 40))
    {
	    if (k == 46)
	    {
	        tekst.value = tekst.value.substring(0, tekst.value.length - 1); //kasowanie ost wpisanego znaku po nacisnieciu "."
	    }
	    else if (k == 61)
	    {
	        tekst.value = tekst.value.substring(0, tekst.value.length); //nic nie jest kasowane, explorer nie wynajduje nic co by sie zaczynalo na =, wiec zostaje to co zaznaczyl skrypt i tyle
	    }
	    else if ((k == 260) || (k == 261))
	    {
	        tekst.value += tab_p[0];
	    }
	    else if ((k == 262) || (k == 263))
	    {
	        tekst.value += tab_p[1];
	    }
	    else if ((k == 280) || (k == 281))
	    {
	        tekst.value += tab_p[2];
	    }
	    else if ((k == 321) || (k == 322))
	    {
	        tekst.value += tab_p[3];
	    }
	    else if ((k == 211) || (k == 243))
	    {
	        tekst.value += tab_p[4];
	    }
	    else if ((k == 346) || (k == 347))
	    {
	        tekst.value += tab_p[5];
	    }
	    else if ((k == 377) || (k == 378))
	    {
	        tekst.value += tab_p[6];
	    }
	    else if ((k == 379) || (k == 380))
	    {
	        tekst.value += tab_p[7];
	    }
	    else if ((k == 323) || (k == 324))
	    {
	        tekst.value += tab_p[8];
	    }
	    else if (k != 13)
	    {
	        if (k >= 97)
	        {
	            k -= 97;
	        }
	        else
	        {
	            k -= 65;
	          }
	        tekst.value += tab[k];
	    }
	    //var sel = document.getElementById(parametr.id); //combo dla ktorego zostal wywolany skrypt
		var sel = parametr;
	    //alert(parametr.name);
	    //alert(sel.name);
	    //alert(tekst.value);
	    //alert(sel.length);
	    var t = ""; //zmienna pomocnicza w ktorej trzymamy kolejne wartosci combobox'a
	    for (i = 0; i < sel.length; i++)
	    {
	        t = sel.options[i].value;
	        t = t.toLowerCase(); //scigamy do malych liter
	        //alert(sel.options[i].value);
	        tekst.value = tekst.value.toLowerCase();
	        //alert(tekst.value);
	        if (tekst.value == t.substring(0, tekst.value.length)) //spr czy poczatek aktualenj wartosci z combo jest taki sam jak wpisany tekst
	        {
	            //alert(t);
	            tekst.value = tekst.value.toUpperCase(); //zwiekszamy tekst wpisany
	            sel.options[i].innerHTML = t.substring(0, tekst.value.length).toUpperCase() + sel.options[i].value.substring(tekst.value.length, sel.options[i].value.length); //zamieniamy wartosc combo 
	            sel.selectedIndex = i; //ustawiamy wartosc na znaleziona
	            //alert (i);
	            i = sel.length; 
	        }
	    }
    }
}
function CzyscPamietanieSelect(hidPamTym) //poprzednio "t"
{
	var tekst = document.getElementById(hidPamTym);
	tekst.value = "";
}
function PodajDluzszySelect (nazwaSel1, nazwaSel2)
{
	var roz1 = document.getElementById(nazwaSel1).size;
	var roz2 = document.getElementById(nazwaSel2).size;
	
	if (roz1 > roz2)
	{
		return roz1;
	}
	else
	{
		return roz2;
	}
}
function DopuscCtrl(evt) //pozniej sie pomeczyc
{
	var k = (evt.keyCode) ? evt.keyCode : evt.which;
	
	alert(k);
}
///koniec regiony funkcji z zastosowaniem lokalnym - jakim lokalnym ?? chyba globalnym

///funkcje ponizej sa uzywane w celach inywidualnych i bardzo dedykowanych na panelu
///sa ta funkcje tzw jednorazowego uzytku
function PokazUkryjFirmaDane(osobowosc, osoba_prawna, kontrolka_html)
{
	var div;
	//var osobowosc = document.getElementById(wartosc).value;
	
	if (osoba_prawna == osobowosc)
	{
		//pokazywanie formu os prawnej
		document.getElementById('dane_os_fiz').style.display = 'none';
		var i = 1;
		for (i; i <= 10; i++)
		{
			div = document.getElementById(kontrolka_html + i);
			div.style.display = '';
		}
	}
	else
	{
		//chowanie formu osoby prawnej
		document.getElementById('dane_os_fiz').style.display = '';
		var i = 1;
		for (i; i <= 10; i++)
		{
			div = document.getElementById(kontrolka_html + i);
			div.style.display = 'none';
		}		
	}
}
function FormularzOsPrOsFiz(osobowosc, osoba_prawna)
{
	//var osobowosc = document.getElementById(wartosc).value;
	if (osoba_prawna == osobowosc)
	{
		//osoba prawna
		var td_firma = document.getElementById('firma_text');
		td_firma.style.display = '';
		var td_firma_input = document.getElementById('firma_input');
		td_firma_input.style.display = '';		
	}
	else
	{
		var td_firma = document.getElementById('firma_text');
		td_firma.style.display = 'none';
		var td_firma_input = document.getElementById('firma_input');
		td_firma_input.style.display = 'none';
	}
}
function SprawdzWysokoscProwizji(cntl, id_txt_prow, wiad_prow_got, wiad_prow_proc)
{
	var wartosc = document.getElementById(id_txt_prow).value;
	var prog_proc = 100; //do tego momentu mozliwa jest procentowa prowizja (100 %)
	//ok : powyzej 100 to siano ponizej prowizja
	//var proc_siano = 500; //ponizej tej kwoty chyba nie ma mowy o sensownej prowizji
	if (wartosc.length > 0)
	if (cntl.checked == false)
	{
		if (wartosc < prog_proc)
		{
			alert(wiad_prow_proc);
			return false;
		}
		else
		{
			return true;
		}
	}
	else
	{
		if (wartosc > prog_proc)
		{
			alert(wiad_prow_got);
			return false;
		}
		else
		{
			return true;
		}
	}
}
function SprawdzZaznaczenieDlaProwizji(cntl, id_check_prow)
{
	var wartosc = cntl.value;
	var prog_proc = 100; //do tego momentu mozliwa jest procentowa prowizja (100 %)
	var checkCtl = document.getElementById(id_check_prow);
	if (wartosc.length > 0)
	if (wartosc < prog_proc)
	{
		checkCtl.checked = true;
	}
	else
	{
		checkCtl.checked = false;			
	}
}
function PokazSchowajZmianaCena(klient_id)
{
	var cena_akt = document.getElementById("cena_akt").value;
	var cena_txt = document.getElementById("id_cena").value;
	var zm_cena_listwa = document.getElementById("zmiana_cena");
	if (cena_akt != cena_txt)
	{
		zm_cena_listwa.style.display = '';
		xajax_PodajOsobaKlient('osoby_combo', klient_id);
	}
	else
	{
		zm_cena_listwa.style.display = 'none';
	}
}
function WyznaczWysokoscDrzewa(wys_powiatow)
{
	if (wys_powiatow < 16)
	{
		return 16 * 13;
	}
	else
	{
		return wys_powiatow * 13;
	}
}
function RadioOfertaZapotrzebowanie ()
{
	var oferta = document.getElementById("id_oferta");
	var zapotrzebowanie = document.getElementById("id_zapotrzebowanie");
	var hiddenForm = document.getElementById("of_zap_hid");
	
	if (oferta.checked)
	{
		hiddenForm.value = oferta.value;
	}
	if (zapotrzebowanie.checked)
	{
		hiddenForm.value = zapotrzebowanie.value;
	}
}
function PokazUkryjImie()
{
	var listwa = document.getElementById("listwa_imie");
	var combo = document.getElementById("combo_imie");
	if (listwa.style.display == 'none')
	{
		listwa.style.display = '';
		combo.style.display = 'none';
	}
	else
	{
		listwa.style.display = 'none';
		combo.style.display = '';
	}
}
function PokazUkryjLokalizacja()
{
	var listwa = document.getElementById("listwa_ulica");
	if (listwa.style.display == 'none')
	{
		listwa.style.display = '';
	}
	else
	{
		listwa.style.display = 'none';
	}
}
function SprawdzZgodnoscHasel(nr_kontrolki, kontrolka_1, kontrolka_2, text_info)
{
	//nr_kontrolki de facto nie potrzebny
	if (kontrolka_1.value.length > 0 && kontrolka_2.value.length > 0)
	{
		if (kontrolka_1.value != kontrolka_2.value)
		{
			//if (kontrolka_1.hasFocus || kontrolka_2.hasFocus)
			//{
			//	return true;
			//}
			//else
			//{
				alert(text_info);
				kontrolka_1.value = '';
				kontrolka_2.value = '';
				return false;
			//}
		}
		else
		{
			return true;
		}
	}
	else
	{
		return true;
	}
}
function PokazStrone(ctrl, div_el, hid_el, td_el, nr)
{
	var div = document.getElementById(div_el + nr);
	var widoczny = document.getElementById(hid_el);
	var div_schowaj = document.getElementById(div_el + widoczny.value);
	
	ctrl.style.color = 'yellow';
	
	if (div.style.display == 'none')
	{
		div.style.display = '';
		div_schowaj.style.display = 'none'; 
		var pop_td = document.getElementById(td_el + widoczny.value);
		pop_td.style.color = 'black';
		widoczny.value = nr;
	}
}
function SprawdzIloscElementow (obj, cntl, monit)
{
	var ilosc = parseInt(obj.value);
	//alert(ilosc);
	if (cntl.checked == true)
	{
		if (ilosc > 5)
		{
			alert(monit);
			return false;
		}
		else
		{
			obj.value = ilosc + 1;
			return true;
		}
	}
	else
	{
		obj.value = ilosc - 1;
		return true;
	}
}
function SprawdzElGablota(iloscObj, zdjeciaObj, monit_zdj, monit_min_elem)
{
	var ilosc_elem = parseInt(iloscObj.value);
	//ilosc zdjec
	var ilosc = zdjeciaObj.length;
	var i = 0;
	//domyslnie zakladamy ze nie zaznaczono zdjecia
	var zazn_zdj = false;
	for (i; i < ilosc; i++)
	{
		//pobieramy z obiektu radia poszczegolne elementy
		var node = zdjeciaObj.item(i);
		//sprawdzam czy dany element jest zaznaczony
		if (node.checked)
		{
			//odnotowuje, ze zaznaczony
			zazn_zdj = true;
		}
	}
	if (!zazn_zdj)
	{
		alert(monit_zdj);
		return false;
	}
	if (ilosc_elem < 2)
	{
		alert(monit_min_elem);
		return false;
	}
	return true;
}

//kolorowe wiersze ...
function setPointer(theRow, theAction, theDefaultColor, thePointerColor, theMarkColor)
{
    var theCells = null;

    // 1. Pointer and mark feature are disabled or the browser can't get the
    //    row -> exits
    if ((thePointerColor == '' && theMarkColor == '') || typeof(theRow.style) == 'undefined') 
	{
        return false;
    }

    // 2. Gets the current row and exits if the browser can't get it
    if (typeof(document.getElementsByTagName) != 'undefined') 
	{
        theCells = theRow.getElementsByTagName('td');
    }
    else if (typeof(theRow.cells) != 'undefined') 
	{
        theCells = theRow.cells;
    }
    else 
	{
        return false;
    }

    // 3. Gets the current color...
    var rowCellsCnt  = theCells.length;
    var domDetect    = null;
    var currentColor = null;
    var newColor     = null;
    // 3.1 ... with DOM compatible browsers except Opera that does not return
    //         valid values with "getAttribute"
    if (typeof(window.opera) == 'undefined' && typeof(theCells[0].getAttribute) != 'undefined') 
	{
        currentColor = theCells[0].getAttribute('bgcolor');
        domDetect    = true;
    }
    // 3.2 ... with other browsers
    else
	{
        currentColor = theCells[0].style.backgroundColor;
        domDetect    = false;
    } // end 3

    // 4. Defines the new color
    // 4.1 Current color is the default one
    if (currentColor == '' || currentColor.toLowerCase() == theDefaultColor.toLowerCase()) 
	{
        if (theAction == 'over' && thePointerColor != '') 
		{
            newColor = thePointerColor;
        }
        else if (theAction == 'click' && theMarkColor != '') 
		{
            newColor = theMarkColor;
        }
    }
    // 4.1.2 Current color is the pointer one
    else if (currentColor.toLowerCase() == thePointerColor.toLowerCase()) 
	{
        if (theAction == 'out') 
		{
            newColor = theDefaultColor;
        }
        else if (theAction == 'click' && theMarkColor != '') 
		{
            newColor = theMarkColor;
        }
    }
    // 4.1.3 Current color is the marker one
    else if (currentColor.toLowerCase() == theMarkColor.toLowerCase()) 
	{
        if (theAction == 'click') 
		{
            newColor = (thePointerColor != '') ? thePointerColor : theDefaultColor;
        }
    } // end 4

    // 5. Sets the new color...
    if (newColor) 
	{
        var c = null;
        // 5.1 ... with DOM compatible browsers except Opera
        if (domDetect) 
		{
            for (c = 0; c < rowCellsCnt; c++) 
			{
					var cb_os = theCells[c].firstChild;
					if ((theAction == 'click') && (cb_os.name == 'id_osoby_checkbox[]'))
					{
						if (cb_os.checked)
						{
							cb_os.checked = false;
						}
						else
						{
							cb_os.checked = true;
						}
					}
                theCells[c].setAttribute('bgcolor', newColor, 0);
            } // end for
        }
        // 5.2 ... with other browsers
        else 
		{
            for (c = 0; c < rowCellsCnt; c++) 
			{
				alert(theCells[c].firstChild.nodeValue);
                theCells[c].style.backgroundColor = newColor;
            }
        }
    } // end 5

    return true;
} // end of the 'setPointer()' function

///porownac kod z kodem calendar1.js, znalezc roznice i napisac komentarz co zostalo zmienione i dlaczego !!!!
///kalendarz - region ;)

// Title: Tigra Calendar
// URL: http://www.softcomplex.com/products/tigra_calendar/
// Version: 3.2 (European date format)
// Date: 10/14/2002 (mm/dd/yyyy)
// Note: Permission given to use this script in ANY kind of applications if
//    header lines are left unchanged.
// Note: Script consists of two files: calendar?.js and calendar.html

// if two digit year input dates after this year considered 20 century.
var NUM_CENTYEAR = 30;
// is time input control required by default
var BUL_TIMECOMPONENT = false;
// are year scrolling buttons required by default
var BUL_YEARSCROLL = true;

var calendars = [];
var RE_NUM = /^\-?\d+$/;

function calendar1(obj_target) {

	// assigning methods
	this.gen_date = cal_gen_date1;
	this.gen_time = cal_gen_time1;
	this.gen_tsmp = cal_gen_tsmp1;
	this.prs_date = cal_prs_date1;
	this.prs_time = cal_prs_time1;
	this.prs_tsmp = cal_prs_tsmp1;
	this.popup    = cal_popup1;

	// validate input parameters
	if (!obj_target)
		return cal_error("Error calling the calendar: no target control specified");
	if (obj_target.value == null)
		return cal_error("Error calling the calendar: parameter specified is not valid target control");
	this.target = obj_target;
	this.time_comp = BUL_TIMECOMPONENT;
	this.year_scroll = BUL_YEARSCROLL;
	
	// register in global collections
	this.id = calendars.length;
	calendars[this.id] = this;
}

function cal_popup1 (str_datetime) {
	this.dt_current = this.prs_tsmp(str_datetime ? str_datetime : this.target.value);
	if (!this.dt_current) return;

	var obj_calwindow = window.open(
		'/panel/calendar.php?datetime=' + this.dt_current.valueOf()+ '&id=' + this.id,
		'Calendar', 'width=200,height='+(this.time_comp ? 215 : 190)+
		',status=no,resizable=no,top=200,left=200,dependent=yes,alwaysRaised=yes'
	);
	obj_calwindow.opener = window;
	obj_calwindow.focus();
}

// timestamp generating function
function cal_gen_tsmp1 (dt_datetime) {
	return(this.gen_date(dt_datetime) + ' ' + this.gen_time(dt_datetime));
}

// date generating function
function cal_gen_date1 (dt_datetime) {
	return (
		dt_datetime.getFullYear() + "-" 
		+ (dt_datetime.getMonth() < 9 ? '0' : '') + (dt_datetime.getMonth() + 1) + "-" 
		+ (dt_datetime.getDate() < 10 ? '0' : '') + dt_datetime.getDate()
	);
}
// time generating function
function cal_gen_time1 (dt_datetime) {
	return (
		(dt_datetime.getHours() < 10 ? '0' : '') + dt_datetime.getHours() + ":"
		+ (dt_datetime.getMinutes() < 10 ? '0' : '') + (dt_datetime.getMinutes()) + ":"
		+ (dt_datetime.getSeconds() < 10 ? '0' : '') + (dt_datetime.getSeconds())
	);
}

// timestamp parsing function
function cal_prs_tsmp1 (str_datetime) {
	// if no parameter specified return current timestamp
	if (!str_datetime)
		return (new Date());

	// if positive integer treat as milliseconds from epoch
	if (RE_NUM.exec(str_datetime))
		return new Date(str_datetime);
		
	// else treat as date in string format
	var arr_datetime = str_datetime.split(' ');
	return this.prs_time(arr_datetime[1], this.prs_date(arr_datetime[0]));
}

// date parsing function
function cal_prs_date1 (str_date) {

	var arr_date = str_date.split('-');
	
	if (arr_date[0].length == 4)
	{
		var temp = arr_date[0];
		arr_date[0] = arr_date[2];
		arr_date[2] = temp;
	}

	if (arr_date.length != 3) return cal_error ("Invalid date format: '" + str_date + "'.\nFormat accepted is dd-mm-yyyy.");
	if (!arr_date[0]) return cal_error ("Invalid date format: '" + str_date + "'.\nNo day of month value can be found.");
	if (!RE_NUM.exec(arr_date[0])) return cal_error ("Invalid day of month value: '" + arr_date[0] + "'.\nAllowed values are unsigned integers.");
	if (!arr_date[1]) return cal_error ("Invalid date format: '" + str_date + "'.\nNo month value can be found.");
	if (!RE_NUM.exec(arr_date[1])) return cal_error ("Invalid month value: '" + arr_date[1] + "'.\nAllowed values are unsigned integers.");
	if (!arr_date[2]) return cal_error ("Invalid date format: '" + str_date + "'.\nNo year value can be found.");
	if (!RE_NUM.exec(arr_date[2])) return cal_error ("Invalid year value: '" + arr_date[2] + "'.\nAllowed values are unsigned integers.");

	var dt_date = new Date();
	dt_date.setDate(1);

	if (arr_date[1] < 1 || arr_date[1] > 12) return cal_error ("Invalid month value: '" + arr_date[1] + "'.\nAllowed range is 01-12.");
	dt_date.setMonth(arr_date[1]-1);
	 
	if (arr_date[2] < 100) arr_date[2] = Number(arr_date[2]) + (arr_date[2] < NUM_CENTYEAR ? 2000 : 1900);
	dt_date.setFullYear(arr_date[2]);

	var dt_numdays = new Date(arr_date[2], arr_date[1], 0);
	dt_date.setDate(arr_date[0]);
	if (dt_date.getMonth() != (arr_date[1]-1)) return cal_error ("Invalid day of month value: '" + arr_date[0] + "'.\nAllowed range is 01-"+dt_numdays.getDate()+".");

	return (dt_date)
}

// time parsing function
function cal_prs_time1 (str_time, dt_date) {

	if (!dt_date) return null;
	var arr_time = String(str_time ? str_time : '').split(':');

	if (!arr_time[0]) dt_date.setHours(0);
	else if (RE_NUM.exec(arr_time[0]))
		if (arr_time[0] < 24) dt_date.setHours(arr_time[0]);
		else return cal_error ("Invalid hours value: '" + arr_time[0] + "'.\nAllowed range is 00-23.");
	else return cal_error ("Invalid hours value: '" + arr_time[0] + "'.\nAllowed values are unsigned integers.");
	
	if (!arr_time[1]) dt_date.setMinutes(0);
	else if (RE_NUM.exec(arr_time[1]))
		if (arr_time[1] < 60) dt_date.setMinutes(arr_time[1]);
		else return cal_error ("Invalid minutes value: '" + arr_time[1] + "'.\nAllowed range is 00-59.");
	else return cal_error ("Invalid minutes value: '" + arr_time[1] + "'.\nAllowed values are unsigned integers.");

	if (!arr_time[2]) dt_date.setSeconds(0);
	else if (RE_NUM.exec(arr_time[2]))
		if (arr_time[2] < 60) dt_date.setSeconds(arr_time[2]);
		else return cal_error ("Invalid seconds value: '" + arr_time[2] + "'.\nAllowed range is 00-59.");
	else return cal_error ("Invalid seconds value: '" + arr_time[2] + "'.\nAllowed values are unsigned integers.");

	dt_date.setMilliseconds(0);
	return dt_date;
}

function cal_error (str_message) {
	alert (str_message);
	return null;
}
//onscroll zapamietywac pod danym url wartosc
function SaveScroll (url_str, pos_str)
{
	//if (!(navigator.userAgent.indexOf('MSIE') > -1))
	//{
		Set_Cookie(hex_md5(url_str), pos_str, 1, '', '', '');
	//}
}
//onload odczytywac - jak jest uzyc
//function AutoScrollDown (url_str)
function AutoScrollDown (div_arr)
{
	//if (!(navigator.userAgent.indexOf('MSIE') > -1))
	for (var i = 0;i < div_arr.length; i++)
	{
		var position_top = Get_Cookie(hex_md5(div_arr[i]));
		if (position_top != null)
		{
			document.getElementById(div_arr[i]).scrollTop = position_top;
		}
	}
}
function AutoScrollDownCentral (url_str)
{
	var position_top = Get_Cookie(hex_md5(url_str));
	if (position_top != null)
	{
		document.getElementById('center').scrollTop = position_top;
	}
}

function Set_Cookie( name, value, expires, path, domain, secure ) 
{
	// set time, it's in milliseconds
	var today = new Date();
	today.setTime( today.getTime() );
	
	/*
	if the expires variable is set, make the correct 
	expires time, the current script below will set 
	it for x number of days, to make it for hours, 
	delete * 24, for minutes, delete * 60 * 24
	*/
	if ( expires )
	{
	expires = expires * 1000 * 60 * 60; // * 24
	}
	var expires_date = new Date( today.getTime() + (expires) );
	
	document.cookie = name + "=" +escape( value ) +
	( ( expires ) ? ";expires=" + expires_date.toGMTString() : "" ) + 
	( ( path ) ? ";path=" + path : "" ) + 
	( ( domain ) ? ";domain=" + domain : "" ) +
	( ( secure ) ? ";secure" : "" );
}

function Get_Cookie( check_name ) 
{
	// first we'll split this cookie up into name/value pairs
	// note: document.cookie only returns name=value, not the other components
	var a_all_cookies = document.cookie.split( ';' );
	var a_temp_cookie = '';
	var cookie_name = '';
	var cookie_value = '';
	var b_cookie_found = false; // set boolean t/f default f
	
	for ( i = 0; i < a_all_cookies.length; i++ )
	{
		// now we'll split apart each name=value pair
		a_temp_cookie = a_all_cookies[i].split( '=' );
		
		
		// and trim left/right whitespace while we're at it
		cookie_name = a_temp_cookie[0].replace(/^\s+|\s+$/g, '');
	
		// if the extracted name matches passed check_name
		if ( cookie_name == check_name )
		{
			b_cookie_found = true;
			// we need to handle case where cookie has no value but exists (no = sign, that is):
			if ( a_temp_cookie.length > 1 )
			{
				cookie_value = unescape( a_temp_cookie[1].replace(/^\s+|\s+$/g, '') );
			}
			// note that in cases where cookie is initialized but no value, null is returned
			return cookie_value;
			break;
		}
		a_temp_cookie = null;
		cookie_name = '';
	}
	if ( !b_cookie_found )
	{
		return null;
	}
}

var hexcase = 0;  /* hex output format. 0 - lowercase; 1 - uppercase        */
var b64pad  = ""; /* base-64 pad character. "=" for strict RFC compliance   */
var chrsz   = 8;  /* bits per input character. 8 - ASCII; 16 - Unicode      */

/*
 * These are the functions you'll usually want to call
 * They take string arguments and return either hex or base-64 encoded strings
 */
function hex_md5(s){ return binl2hex(core_md5(str2binl(s), s.length * chrsz));}
function b64_md5(s){ return binl2b64(core_md5(str2binl(s), s.length * chrsz));}
function str_md5(s){ return binl2str(core_md5(str2binl(s), s.length * chrsz));}
function hex_hmac_md5(key, data) { return binl2hex(core_hmac_md5(key, data)); }
function b64_hmac_md5(key, data) { return binl2b64(core_hmac_md5(key, data)); }
function str_hmac_md5(key, data) { return binl2str(core_hmac_md5(key, data)); }

/*
 * Perform a simple self-test to see if the VM is working
 */
function md5_vm_test()
{
  return hex_md5("abc") == "900150983cd24fb0d6963f7d28e17f72";
}

/*
 * Calculate the MD5 of an array of little-endian words, and a bit length
 */
function core_md5(x, len)
{
  /* append padding */
  x[len >> 5] |= 0x80 << ((len) % 32);
  x[(((len + 64) >>> 9) << 4) + 14] = len;

  var a =  1732584193;
  var b = -271733879;
  var c = -1732584194;
  var d =  271733878;

  for(var i = 0; i < x.length; i += 16)
  {
    var olda = a;
    var oldb = b;
    var oldc = c;
    var oldd = d;

    a = md5_ff(a, b, c, d, x[i+ 0], 7 , -680876936);
    d = md5_ff(d, a, b, c, x[i+ 1], 12, -389564586);
    c = md5_ff(c, d, a, b, x[i+ 2], 17,  606105819);
    b = md5_ff(b, c, d, a, x[i+ 3], 22, -1044525330);
    a = md5_ff(a, b, c, d, x[i+ 4], 7 , -176418897);
    d = md5_ff(d, a, b, c, x[i+ 5], 12,  1200080426);
    c = md5_ff(c, d, a, b, x[i+ 6], 17, -1473231341);
    b = md5_ff(b, c, d, a, x[i+ 7], 22, -45705983);
    a = md5_ff(a, b, c, d, x[i+ 8], 7 ,  1770035416);
    d = md5_ff(d, a, b, c, x[i+ 9], 12, -1958414417);
    c = md5_ff(c, d, a, b, x[i+10], 17, -42063);
    b = md5_ff(b, c, d, a, x[i+11], 22, -1990404162);
    a = md5_ff(a, b, c, d, x[i+12], 7 ,  1804603682);
    d = md5_ff(d, a, b, c, x[i+13], 12, -40341101);
    c = md5_ff(c, d, a, b, x[i+14], 17, -1502002290);
    b = md5_ff(b, c, d, a, x[i+15], 22,  1236535329);

    a = md5_gg(a, b, c, d, x[i+ 1], 5 , -165796510);
    d = md5_gg(d, a, b, c, x[i+ 6], 9 , -1069501632);
    c = md5_gg(c, d, a, b, x[i+11], 14,  643717713);
    b = md5_gg(b, c, d, a, x[i+ 0], 20, -373897302);
    a = md5_gg(a, b, c, d, x[i+ 5], 5 , -701558691);
    d = md5_gg(d, a, b, c, x[i+10], 9 ,  38016083);
    c = md5_gg(c, d, a, b, x[i+15], 14, -660478335);
    b = md5_gg(b, c, d, a, x[i+ 4], 20, -405537848);
    a = md5_gg(a, b, c, d, x[i+ 9], 5 ,  568446438);
    d = md5_gg(d, a, b, c, x[i+14], 9 , -1019803690);
    c = md5_gg(c, d, a, b, x[i+ 3], 14, -187363961);
    b = md5_gg(b, c, d, a, x[i+ 8], 20,  1163531501);
    a = md5_gg(a, b, c, d, x[i+13], 5 , -1444681467);
    d = md5_gg(d, a, b, c, x[i+ 2], 9 , -51403784);
    c = md5_gg(c, d, a, b, x[i+ 7], 14,  1735328473);
    b = md5_gg(b, c, d, a, x[i+12], 20, -1926607734);

    a = md5_hh(a, b, c, d, x[i+ 5], 4 , -378558);
    d = md5_hh(d, a, b, c, x[i+ 8], 11, -2022574463);
    c = md5_hh(c, d, a, b, x[i+11], 16,  1839030562);
    b = md5_hh(b, c, d, a, x[i+14], 23, -35309556);
    a = md5_hh(a, b, c, d, x[i+ 1], 4 , -1530992060);
    d = md5_hh(d, a, b, c, x[i+ 4], 11,  1272893353);
    c = md5_hh(c, d, a, b, x[i+ 7], 16, -155497632);
    b = md5_hh(b, c, d, a, x[i+10], 23, -1094730640);
    a = md5_hh(a, b, c, d, x[i+13], 4 ,  681279174);
    d = md5_hh(d, a, b, c, x[i+ 0], 11, -358537222);
    c = md5_hh(c, d, a, b, x[i+ 3], 16, -722521979);
    b = md5_hh(b, c, d, a, x[i+ 6], 23,  76029189);
    a = md5_hh(a, b, c, d, x[i+ 9], 4 , -640364487);
    d = md5_hh(d, a, b, c, x[i+12], 11, -421815835);
    c = md5_hh(c, d, a, b, x[i+15], 16,  530742520);
    b = md5_hh(b, c, d, a, x[i+ 2], 23, -995338651);

    a = md5_ii(a, b, c, d, x[i+ 0], 6 , -198630844);
    d = md5_ii(d, a, b, c, x[i+ 7], 10,  1126891415);
    c = md5_ii(c, d, a, b, x[i+14], 15, -1416354905);
    b = md5_ii(b, c, d, a, x[i+ 5], 21, -57434055);
    a = md5_ii(a, b, c, d, x[i+12], 6 ,  1700485571);
    d = md5_ii(d, a, b, c, x[i+ 3], 10, -1894986606);
    c = md5_ii(c, d, a, b, x[i+10], 15, -1051523);
    b = md5_ii(b, c, d, a, x[i+ 1], 21, -2054922799);
    a = md5_ii(a, b, c, d, x[i+ 8], 6 ,  1873313359);
    d = md5_ii(d, a, b, c, x[i+15], 10, -30611744);
    c = md5_ii(c, d, a, b, x[i+ 6], 15, -1560198380);
    b = md5_ii(b, c, d, a, x[i+13], 21,  1309151649);
    a = md5_ii(a, b, c, d, x[i+ 4], 6 , -145523070);
    d = md5_ii(d, a, b, c, x[i+11], 10, -1120210379);
    c = md5_ii(c, d, a, b, x[i+ 2], 15,  718787259);
    b = md5_ii(b, c, d, a, x[i+ 9], 21, -343485551);

    a = safe_add(a, olda);
    b = safe_add(b, oldb);
    c = safe_add(c, oldc);
    d = safe_add(d, oldd);
  }
  return Array(a, b, c, d);

}

/*
 * These functions implement the four basic operations the algorithm uses.
 */
function md5_cmn(q, a, b, x, s, t)
{
  return safe_add(bit_rol(safe_add(safe_add(a, q), safe_add(x, t)), s),b);
}
function md5_ff(a, b, c, d, x, s, t)
{
  return md5_cmn((b & c) | ((~b) & d), a, b, x, s, t);
}
function md5_gg(a, b, c, d, x, s, t)
{
  return md5_cmn((b & d) | (c & (~d)), a, b, x, s, t);
}
function md5_hh(a, b, c, d, x, s, t)
{
  return md5_cmn(b ^ c ^ d, a, b, x, s, t);
}
function md5_ii(a, b, c, d, x, s, t)
{
  return md5_cmn(c ^ (b | (~d)), a, b, x, s, t);
}

/*
 * Calculate the HMAC-MD5, of a key and some data
 */
function core_hmac_md5(key, data)
{
  var bkey = str2binl(key);
  if(bkey.length > 16) bkey = core_md5(bkey, key.length * chrsz);

  var ipad = Array(16), opad = Array(16);
  for(var i = 0; i < 16; i++)
  {
    ipad[i] = bkey[i] ^ 0x36363636;
    opad[i] = bkey[i] ^ 0x5C5C5C5C;
  }

  var hash = core_md5(ipad.concat(str2binl(data)), 512 + data.length * chrsz);
  return core_md5(opad.concat(hash), 512 + 128);
}

/*
 * Add integers, wrapping at 2^32. This uses 16-bit operations internally
 * to work around bugs in some JS interpreters.
 */
function safe_add(x, y)
{
  var lsw = (x & 0xFFFF) + (y & 0xFFFF);
  var msw = (x >> 16) + (y >> 16) + (lsw >> 16);
  return (msw << 16) | (lsw & 0xFFFF);
}

/*
 * Bitwise rotate a 32-bit number to the left.
 */
function bit_rol(num, cnt)
{
  return (num << cnt) | (num >>> (32 - cnt));
}

/*
 * Convert a string to an array of little-endian words
 * If chrsz is ASCII, characters >255 have their hi-byte silently ignored.
 */
function str2binl(str)
{
  var bin = Array();
  var mask = (1 << chrsz) - 1;
  for(var i = 0; i < str.length * chrsz; i += chrsz)
    bin[i>>5] |= (str.charCodeAt(i / chrsz) & mask) << (i%32);
  return bin;
}

/*
 * Convert an array of little-endian words to a string
 */
function binl2str(bin)
{
  var str = "";
  var mask = (1 << chrsz) - 1;
  for(var i = 0; i < bin.length * 32; i += chrsz)
    str += String.fromCharCode((bin[i>>5] >>> (i % 32)) & mask);
  return str;
}

/*
 * Convert an array of little-endian words to a hex string.
 */
function binl2hex(binarray)
{
  var hex_tab = hexcase ? "0123456789ABCDEF" : "0123456789abcdef";
  var str = "";
  for(var i = 0; i < binarray.length * 4; i++)
  {
    str += hex_tab.charAt((binarray[i>>2] >> ((i%4)*8+4)) & 0xF) +
           hex_tab.charAt((binarray[i>>2] >> ((i%4)*8  )) & 0xF);
  }
  return str;
}

/*
 * Convert an array of little-endian words to a base-64 string
 */
function binl2b64(binarray)
{
  var tab = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
  var str = "";
  for(var i = 0; i < binarray.length * 4; i += 3)
  {
    var triplet = (((binarray[i   >> 2] >> 8 * ( i   %4)) & 0xFF) << 16)
                | (((binarray[i+1 >> 2] >> 8 * ((i+1)%4)) & 0xFF) << 8 )
                |  ((binarray[i+2 >> 2] >> 8 * ((i+2)%4)) & 0xFF);
    for(var j = 0; j < 4; j++)
    {
      if(i * 8 + j * 6 > binarray.length * 32) str += b64pad;
      else str += tab.charAt((triplet >> 6*(3-j)) & 0x3F);
    }
  }
  return str;
}


