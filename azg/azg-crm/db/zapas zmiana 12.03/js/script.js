function WalidacjaLiczbaWymierna(obj, evt)
{
	var klKod = (evt.keyCode) ? evt.keyCode : evt.which;
	//alert(klKod);
	//, - 44, - - 45, . - 46
	var tab = Array(8, 9, 35, 36, 37, 38, 39, 40, 46);
	
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
	var tab = Array(8, 9, 35, 36, 37, 38, 39, 40, 46);
	
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
	var tab = Array(45, 8, 9, 35, 36, 37, 38, 39, 40, 46);
	

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
	//alert(hiddenId);
	var hidden = document.getElementById(hiddenId);
	//alert(hidden.value);
	if (select.selectedIndex >= 0)
		hidden.value = select.options[select.selectedIndex].id;
	//alert(hidden.value);
	//alert(select.selectedIndex);
	//alert(hidden.value);
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
///koniec regiony funkcji z zastosowaniem lokalnym

///funkcje ponizej sa uzywane w celach inywidualnych i bardzo dedykowanych na panelu
///sa ta funkcje tzw jednorazowego uzytku
function PokazUkryjFirmaDane(osobowosc, osoba_prawna, kontrolka_html)
{
	var div;
	//var osobowosc = document.getElementById(wartosc).value;
	
	if (osoba_prawna == osobowosc)
	{
		var i = 1;
		for (i; i <= 9; i++)
		{
			div = document.getElementById(kontrolka_html + i);
			div.style.display = '';
		}
	}
	else
	{
		var i = 1;
		for (i; i <= 9; i++)
		{
			div = document.getElementById(kontrolka_html + i);
			div.style.display = 'none';
		}		
	}
}
function FormularzOsPrOsFiz(osobowosc, osoba_prawna, text_pesel, text_nip)
{
	//var osobowosc = document.getElementById(wartosc).value;
	if (osoba_prawna == osobowosc)
	{
		//osoba prawna
		var td_firma = document.getElementById('firma_text');
		td_firma.style.display = '';
		var td_firma_input = document.getElementById('firma_input');
		td_firma_input.style.display = '';
		var listwa_nip =document.getElementById('pesel_text');
		listwa_nip.innerHTML = text_nip; 		
	}
	else
	{
		var td_firma = document.getElementById('firma_text');
		td_firma.style.display = 'none';
		var td_firma_input = document.getElementById('firma_input');
		td_firma_input.style.display = 'none';
		var listwa_nip =document.getElementById('pesel_text');
		listwa_nip.innerHTML = text_pesel;
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