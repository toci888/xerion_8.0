//boxObj is a checkbox to click, htmlCtrl is a div or else where button to dissapear or appear is
function PassValsToOpener(controls, values)
{
	var ctrl = controls.split(",");
	var vals = values.split(",");
	for (var i = 0; i < vals.length; i++)
	{
		opener.window.document.getElementById(ctrl[i]).value = vals[i];
    }
} 
function showHideButton(boxName, htmlCtrlName)
{
	boxObj = document.getElementById(boxName);
	htmlCtrl = document.getElementById(htmlCtrlName);
	if (boxObj.checked == true)
	{
		htmlCtrl.style.display = '';
	}
	else
	{
		htmlCtrl.style.display = 'none';
	}
}
function ClientRequiredFields(obj1, obj2)
{
	if (obj1.value == "" || obj2.value == "")
	{
		alert('Nie wype³niono wszystkich pól.');
		event.returnValue = false;
		return false;
	}
}
function testMonth(month)
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
function testDay(day)
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
function DateYesterday(obj, date)
{
	var currentDate = new Date();
	var year = currentDate.getFullYear() - 14;
	var curDateString = year + '-' + testMonth(currentDate.getMonth()) + '-' + testDay(currentDate.getDate());
	//alert(curDateString);
	
	if (date > curDateString)
	{
		alert('Podano datê osoby zbyt m³odej.');
		obj.value = '';
	}
	
}
function DateTomorrow(obj, date)
{
	var currentDate = new Date();
	var curDateString = currentDate.getFullYear() + '-' + testMonth(currentDate.getMonth()) + '-' + testDay(currentDate.getDate());
	//alert(curDateString);
	
	if (date < curDateString)
	{
		alert('Podano datê w przesz³o¶ci.');
		obj.value = '';
	}
	
}
//create onload function preventing any hidden from being empty
function setHiddenOnLoad(hidArray, selArray)
{
	var hiddens = hidArray.split(",");
	var selects = selArray.split(",");
	for (var i = 0; i < hiddens.length; i++)
	{
		if (document.getElementById(hiddens[i]) != null)
			document.getElementById(hiddens[i]).value = document.getElementById(selects[i]).options[document.getElementById(selects[i]).selectedIndex].id;
	}
}
function setHiddenFromSelect(obj, hiddenId)
{
	var select = obj;
	//alert(hiddenId);
	var hidden = document.getElementById(hiddenId);
	//alert(hidden.value);
	hidden.value = select.options[select.selectedIndex].id;
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
	function wpis_rok (obj)
	{
		if (obj.value.length < 4 && obj.value.length > 0)
		{
			obj.value="";
			obj.focus();
			alert("B³êdnie wprowadzone dane!");
		}
		if (obj.value.length == 4)
		{
			if(obj.value < 1900 || obj.value > 2006)
			{
				alert("B³êdnie wprowadzone dane!");
			        obj.value="";
			        obj.focus();
			}
			if (isNaN (obj.value))
			{
				obj.value="";
				obj.focus();
				alert("B³êdnie wprowadzone dane!");
			}
		}
	}
	function wpis_miesiac (obj)
	{
		if (obj.value.length < 2 && obj.value.length > 0)
		{
			obj.value="";
			obj.focus();
			alert("B³êdnie wprowadzone dane!");
		}
		if (obj.value.length == 2)
		{
			if(obj.value < 1 || obj.value > 12)
			{
				alert("B³êdnie wprowadzone dane!");
			        obj.value="";
			        obj.focus();
			}
			if (isNaN (obj.value))
			{
				obj.value="";
				obj.focus();
				alert("B³êdnie wprowadzone dane!");
			}
		}
	}
	function wpis_dzien (obj)
	{
		if (obj.value.length < 2 && obj.value.length > 0)
		{
			obj.value="";
			obj.focus();
			alert("B³êdnie wprowadzone dane!");
		}
		if (obj.value.length == 2)
		{
			if(obj.value < 1 || obj.value > 31)
			{
				alert("B³êdnie wprowadzone dane!");
			        obj.value="";
			        obj.focus();
			}
			if (isNaN (obj.value))
			{
				obj.value="";
				obj.focus();
				alert("B³êdnie wprowadzone dane!");
			}
		}
	}
	function telefon_kom (ob)
    {
    	var wzor = /^(50|51|60|66|69|78|79|88){1}[0-9]{7}$/;
        if (!wzor.test(ob.value))
        {
			if(ob.value !== "")
			{
				alert("Podaj telefon komórkowy polskiego operatora w formacie 9 cyfr!");
		       	ob.focus();
	            ob.value = "";
				return 0;
			}
        }
        else
        {
            return ob.value;
        }
    }
	function telefon_stacj (ob)
    {
        var wzor = /^[1-9]{1}[0-9]{8}$/;
        if (!wzor.test(ob.value))
        {
			if(ob.value !== "")
			{
	            alert("Podaj telefon stacjonarny w formacie 9 cyfr!");
		       	ob.focus();
	            ob.value = "";
				return 0;
			}
        }
        else
        {
            return ob.value;
        }
	}
	function telefon_inny (ob)
    {
        var wzor = /^[1-9]{1}[0-9]{8,12}$/;
        if (!wzor.test(ob.value))
        {
			if(ob.value !== "")
		    {
            	alert("Podaj telefon bez zer z przodu (max 13 cyfr)!");
	       	    ob.focus();
              	ob.value = "";
			    return 0;
		    }
        }
        else
        {
            return ob.value;
        }
    }
    function EmailValidate (ob)
    {
        var wzor = /^[0-9,A-Z,a-z,.,\,,_,-]{1,20}(\@){1}[2,A-Z,a-z,.]{1,25}(.){1}[A-Z,a-z]{1,5}$/;
        if (!wzor.test(ob.value))
        {
            if(ob.value !== "")
            {
                alert("Podany E-mail wygl±da na nieprawid³owy.");
                ob.focus();
                ob.value = "";
                return 0;
            }
        }
        else
        {
            return ob.value;
        }
    }
	function sprawdz_nazwisko (ob)
    {
        var wzor = /^[A-Z,Ó,¦,£,¯,¬,Æ,Ñ]{1}[a-z,\-,\ ,ê,ó,±,¶,³,¿,¥,æ,ñ]{2,29}$/;
        if (!wzor.test(ob.value))
        {
			if(ob.value !== "")
			{
            	alert("Podany ci±g znaków nie przypomina nazwiska.");
	       		ob.focus();
            	ob.value = "";
				return 0;
			}
        }
        else
        {
            return ob.value;
        }
	}
	function sprawdz_ulica (ob)
    {
        var wzor = /^[A-Z,0-9,Ó,¦,£,¯,¬,Æ,Ñ,a-z,\-,\ ,ê,ó,±,¶,³,¿,¥,æ,ñ,\.,\/]{5,50}$/;
        if (!wzor.test(ob.value))
        {
			if(ob.value !== "")
			{
              	alert("Podany ci±g znaków nie przypomina ulicy.");
	       		ob.focus();
              	ob.value = "";
				return 0;
			}
        }
        else
        {
            return ob.value;
        }
	}
	function sprawdz_kod (ob)
    {
        var wzor = /^[0-9]{2}(\-){1}[0-9]{3}$/;
        if (!wzor.test(ob.value))
        {
			if(ob.value !== "")
			{
              	alert("B³êdnie podany kod pocztowy.");
	       		ob.focus();
              	ob.value = "";
				return 0;
			}
        }
        else
        {
            return ob.value;
        }
	}
	function sprawdz_tygodnie (ob)
    {
        var wzor = /^[1-9]{1}[0-9]{0,1}$/;
        if (!wzor.test(ob.value))
        {
			if(ob.value !== "")
			{
              	alert("Niew³a¶ciwa liczba tygodni.");
	       		ob.focus();
              	ob.value = "";
				return 0;
			}
        }
        else
        {
            return ob.value;
        }
	}
	function sprawdz_obuwie (ob)
    {
        var wzor = /^[2-5]{1}[0-9]{1}$/;
        if (!wzor.test(ob.value))
        {
			if(ob.value !== "")
			{
              	alert("Nie jest to numer obuwia.");
	       		ob.focus();
              	ob.value = "";
				return 0;
			}
        }
        else
        {
            return ob.value;
        }
	}
	function soffi (ob)
    {
        var wzor = /^(1|2){1}[0-9]{8}$/;
        if (!wzor.test(ob.value))
        {
			if(ob.value !== "")
			{
              	alert("B³êdnie podany numer soffi.");
	       		ob.focus();
              	ob.value = "";
				return 0;
			}
        }
        else
        {
            return ob.value;
        }
	}
	function sprawdz_klienta (ob)
    {
        var wzor = /^[A-Z,Ó,¦,£,¯,¬,Æ,Ñ]{1}[A-Z,a-z,\.,\ ,&,ê,ó,±,¶,³,¿,¥,æ,ñ]{2,44}$/;
        if (!wzor.test(ob.value))
        {
			if(ob.value !== "")
			{
              	alert("Podany ci±g znaków nie przypomina klienta.");
	       		ob.focus();
              	ob.value = "";
				return 0;
			}
        }
        else
        {
            return ob.value;
        }
	}
	function sprawdz_stawka (ob)
    {
        var wzor = /^[1-9]{1}[0-9,\,,]{2,4}$/;
        if (!wzor.test(ob.value))
        {
			if(ob.value !== "")
			{
              	alert("B³êdnie podana stawka.");
	       		ob.focus();
              	ob.value = "";
				return 0;
			}
        }
        else
        {
            return ob.value;
        }
	}
	function sprawdz_stanowisko (ob)
    {
        var wzor = /^[A-Z,Ó,¦,£,¯,¬,Æ,Ñ]{1}[a-z,\ ,ê,ó,±,¶,³,¿,¥,æ,ñ]{2,29}$/;
        if (!wzor.test(ob.value))
        {
			if(ob.value !== "")
			{
              	alert("Podany ci±g znaków nie przypomina stanowiska pracy.");
	       		ob.focus();
              	ob.value = "";
				return 0;
			}
        }
        else
        {
            return ob.value;
        }
	}
	function sprawdz_ilosc_osob (ob)
    {
        var wzor = /^[0-9]{1,2}$/;
        if (!wzor.test(ob.value))
        {
			if(ob.value !== "")
			{
            	alert("Niew³a¶ciwa ilo¶æ osób.");
	       		ob.focus();
            	ob.value = "";
				return 0;
			}
        }
        else
        {
            return ob.value;
        }
	}
function zamien(tekst)
{
	var wynik = "", znak;
	var zrodlo = tekst.value;
	for (var i = 0; i <= zrodlo.length; i++)
	{
        znak = zrodlo.substring(i,i + 1);
		if (znak == '*')
		{
			wynik += '%';
		}
		else
		{
			wynik += znak;
		}
	}
	tekst.value = wynik;
	return wynik;
}
function ustaw_hist_zatr()
{
    var f = document.getElementById("statusy");
    var e = opener.window.document.getElementById("1");
    e.selectedIndex = f.selectedIndex - 1;
    f = document.getElementById("tygodnie");
    e = opener.window.document.getElementById("3");
    e.value = f.value;
}
function umow_pasywnego()
{
    var f = document.getElementById("status");
    var e = opener.window.document.getElementById("1");
    e.selectedIndex = f.selectedIndex - 1;
    f = document.getElementById("ilosc_tyg");
    e = opener.window.document.getElementById("3");
    e.value = f.value;
}
function podm_hist_zatr()
{
    var f = document.getElementById("status");
    var e = opener.window.document.getElementById("1");
    e.selectedIndex = f.selectedIndex;
    f = document.getElementById("ilosc_tyg");
    e = opener.window.document.getElementById("3");
    e.value = f.value;
}
function podm_status()
{
    var f = document.getElementById("status");
    var e = opener.window.document.getElementById("1");
    e.selectedIndex = f.selectedIndex;
}
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
function policz (obj)
{
	var ile_widocznych = 0;
	tabela = new Array ("imie","nazwisko","plec","data_urodzenia","msc_urodzenia","msc","ulica","kod","wyksztalcenie","zawod","prawo_jazdy","umiejetnosci","konsultant","data_zgloszenia","status","charakter","paszport","termin_wyjazdu","ilosc_tyg","ostatni_kontakt","os_dzwoniaca","telefon","komorka","inny","email","jezyk","pref","antyp","znani_klienci","biuro","msc_odjazdu","data_powrotu","zadania_dnia","zad_problem","korespondencja","rodz_kor","data_rekl","pop_prac","branza","stanowisko","rok_jaar","klient_jaar","ankieta","zrodlo");
	for (var j=0; j<44; j++)
	{
		box = eval("document.formwidok." + tabela[j]);
		if (box.checked == true)
		{
			ile_widocznych++;
			if (ile_widocznych > 15)
			{
				obj.checked = false;
			}
		}
	}
}

	function wroc()
	{
		var n = parent.frames[0].document.getElementById("nazwisko");
		var d = parent.frames[0].document.getElementById("data");
		var s = parent.frames[0].document.getElementById("szukaj_button");
		var s1 = parent.frames[0].document.getElementById("szukaj_form");
		var k = parent.frames[0].document.getElementById("kwerenda");
		var k1 = parent.frames[0].document.getElementById("kwerendy");
		var wi = parent.frames[0].document.getElementById("widok");
		var wi1 = parent.frames[0].document.getElementById("widoki_select");
		var wa = parent.frames[0].document.getElementById("wakat");
		var wa1= parent.frames[0].document.getElementById("wakaty_select");
		if ((n.value != "") || (d.value != ""))
		{
			s.click();
		}
		if (k.selectedIndex > 0)
		{
			k1.submit();
		}
		if (wi.selectedIndex > 0)
		{
			wi1.submit();
		}
		if (wa.selectedIndex > 0)
		{
			wa1.submit();
		}
	}
// Create scrolling variable if it doesn't exist
if (!Scrolling) {var Scrolling = {};}

//Scroller constructor
Scrolling.Scroller = function (o, w, h, t) 
{
	//get the container
	var list = o.getElementsByTagName("div");
	for (var i = 0; i < list.length; i++) 
	{
		if (list[i].className.indexOf("Scroller-Container") > -1) 
		{
			o = list[i];
		}
	}
	
	//private variables
	var self  = this;
	var _vwidth   = w;
	var _vheight  = h;
	var _twidth   = o.offsetWidth
	var _theight  = o.offsetHeight;
	var _hasTween = t ? true : false;
	var _timer, _x, _y;
	
	//public variables
	this.onScrollStart = function (){};
	this.onScrollStop  = function (){};
	this.onScroll      = function (){};
	this.scrollSpeed   = 20;
	
	//private functions
	function setPosition (x, y) 
	{
		if (x < _vwidth - _twidth) 
			x = _vwidth - _twidth;
		if (x > 0) x = 0;
		if (y < _vheight - _theight) 
			y = _vheight - _theight;
		if (y > 0) y = 0;
		
		_x = x;
		_y = y;
		
		o.style.left = _x +"px";
		o.style.top  = _y +"px";
	};
	
	//public functions
	this.scrollBy = function (x, y) 
	{ 
		setPosition(_x - x, _y - y);
		//this.onScroll();
	};
	
	this.scrollTo = function (x, y) 
	{ 
		setPosition(-x, -y);
		this.onScroll();
	};
	
	this.startScroll = function (x, y) 
	{
		//this.stopScroll();
		//this.onScrollStart();
		_timer = window.setInterval(function ()	{ self.scrollBy(x, y);}, this.scrollSpeed);
	};
		
	this.ScrollOnce = function (x, y) 
	{
		//this.stopScroll();
		//this.onScrollStart();
		self.scrollBy(x, y);
	};
	this.stopScroll  = function () 
	{ 
		if (_timer) window.clearInterval(_timer);
		//this.onScrollStop();
	};
	
	this.reset = function () 
	{
		_twidth  = o.offsetWidth;
		_theight = o.offsetHeight;
		_x = 0;
		_y = 0;
		
		o.style.left = "0px";
		o.style.top  = "0px";
		
		if (_hasTween) t.apply(this);
	};
	
	this.swapContent = function (c, w, h) 
	{
		o = c;
		var list = o.getElementsByTagName("div");
		for (var i = 0; i < list.length; i++) 
		{
			if (list[i].className.indexOf("Scroller-Container") > -1) 
			{
				o = list[i];
			}
		}
		
		if (w) _vwidth  = w;
		if (h) _vheight = h;
		reset();
	};
	
	this.getDimensions = function () 
	{
		return {
			vwidth  : _vwidth,
			vheight : _vheight,
			twidth  : _twidth,
			theight : _theight,
			x : -_x, y : -_y
		};
	};
	
	this.getContent = function () 
	{
		return o;
	};
	
	this.reset();
};

function handle(ev)
{
	if (ev.wheelDelta > 0)
	{
		scroller.ScrollOnce(0, -25);
	}
	else
	{
		scroller.ScrollOnce(0, 25);
	}
}
function scrolldiagonal_b()
{
	//alert(event.wheelDelta);
	if (event.wheelDelta > 0)
	{
		scroller.ScrollOnce(-15, 0);
		//setTimeout( function () { scroller.stopScroll(); },40);
	}
	else
	{
		scroller.ScrollOnce(15, 0);
		//setTimeout( function () { scroller.stopScroll(); },40);
	}
}

// Create scrolling variable if it doesn't exist
if (!scrolling_center) var scrolling_center = {};

//Scroller constructor
scrolling_center.scroller_center = function (o, w, h, t) 
{
	//get the container
	var list = o.getElementsByTagName("div");
	for (var i = 0; i < list.length; i++) 
	{
		if (list[i].className.indexOf("main-container") > -1) 
		{
			o = list[i];
		}
	}
	
	//private variables
	var self  = this;
	var _vwidth   = w;
	var _vheight  = h;
	var _twidth   = o.offsetWidth;
	var _theight  = o.offsetHeight;
	var _hasTween = t ? true : false;
	var _timer, _x, _y;
	
	//public variables
	this.onScrollStart = function (){};
	this.onScrollStop  = function (){};
	this.onScroll      = function (){};
	this.scrollSpeed   = 20;
	
	//private functions
	function setPosition (x, y) {
		if (x < _vwidth - _twidth) 
			x = _vwidth - _twidth;
		if (x > 0) x = 0;
		if (y < _vheight - _theight) 
			y = _vheight - _theight;
		if (y > 0) y = 0;
		
		_x = x;
		_y = y;
		
		o.style.left = _x +"px";
		o.style.top  = _y +"px";
	};
	
	//public functions
	this.scrollBy = function (x, y) { 
		setPosition(_x - x, _y - y);
		//this.onScroll();
	};
	
	this.scrollTo = function (x, y) { 
		setPosition(-x, -y);
		this.onScroll();
	};
	
	this.startScroll = function (x, y) {
		//this.stopScroll();
		//this.onScrollStart();
		_timer = window.setInterval(
			function () { self.scrollBy(x, y); }, this.scrollSpeed
		);
	};
		
	this.ScrollOnce = function (x, y) {
		//this.stopScroll();
		//this.onScrollStart();
		self.scrollBy(x, y);
	};
	this.stopScroll  = function () { 
		if (_timer) window.clearInterval(_timer);
		//this.onScrollStop();
	};
	
	this.reset = function () {
		_twidth  = o.offsetWidth;
		_theight = o.offsetHeight;
		_x = 0;
		_y = 0;
		
		o.style.left = "0px";
		o.style.top  = "0px";
		
		if (_hasTween) t.apply(this);
	};
	
	this.swapContent = function (c, w, h) {
		o = c;
		var list = o.getElementsByTagName("div");
		for (var i = 0; i < list.length; i++) {
			if (list[i].className.indexOf("main-container") > -1) {
				o = list[i];
			}
		}
		
		if (w) _vwidth  = w;
		if (h) _vheight = h;
		reset();
	};
	
	this.getDimensions = function () {
		return {
			vwidth  : _vwidth,
			vheight : _vheight,
			twidth  : _twidth,
			theight : _theight,
			x : -_x, y : -_y
		};
	};
	
	this.getContent = function () {
		return o;
	};
	
	this.reset();
};

function handle_central()
{
	//alert(event.wheelDelta);
	if (event.wheelDelta > 0)
	{
		scroller_center.ScrollOnce(0, -200);
		//setTimeout( function () { scroller_center.stopScroll(); },40);
	}
	else
	{
		scroller_center.ScrollOnce(0, 200);
		//setTimeout( function () { scroller_center.stopScroll(); },40);
	}
}
	function klawisz(parametr)
	{
		var tab = new Array("A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"); 
	   	var tab_p = new Array("¡", "Æ", "Ê", "£", "Ó", "¦", "¬", "¯", "Ñ");
		var tekst = document.getElementById("t"); //obiekt ktory zawiera wpisane litery
		var pole = document.getElementById("pole"); //obiekt ktory zawiera wpisane litery
		if (pole.value != parametr.name)
		{
			tekst.value = "";
			pole.value = parametr.name;
		}
		var i = 0;
		//alert (tekst.value);
		var k = event.keyCode; //kod nacisnietego klawisza
        if (k != 9 && (k < 16 || k > 18) && (k < 37 || k > 40))
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
		var sel = document.getElementById(parametr.name); //combo dla ktorego zostal wywolany skrypt
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
	function wyczysc()
	{
		var tekst = document.getElementById("t");
		tekst.value = "";
	}

	function wiek_stawki (ob)
        {
            var wzor = /^(16|17|18|19|20|21|22){1}$/;
            if (!wzor.test(ob.value))
            {
		if(ob.value != "")
		{
              		alert("B³êdnie podano wiek: "+ob.value+".\nOczekiwano liczby z zakresu od 16 do 22 lat.");
              		ob.value = "";
		}
            }
            else
            {
              return ob.value;
            }
	}
	function stawki_wiek (ob)
        {
            var wzor = /^[1-9]{0,1}[0-9]{1}(,){1}[0-9]{2}$/;
            if (!wzor.test(ob.value))
            {
		if(ob.value != "")
		{
              		//alert("B³êdnie podano stawkê: "+ob.value+".\nOczekiwano stawki w formacie xx,xx lub x,xx.");
              		alert("B³êdnie podano stawkê: "+ob.value+".\nOczekiwano stawki w formacie xx,xx lub x,xx ,\ngdzie co najmniej jeden x > 0.");
              		ob.value = "";
		}
            }
            else
            {
		if (ob.value == "0,00")
		{
              		alert("B³êdnie podano stawkê: "+ob.value+".\nOczekiwano stawki w formacie xx,xx lub x,xx ,\ngdzie co najmniej jeden x > 0.");
              		ob.value = "";
		}
		else
		{
              		return ob.value;
		}
            }
	}
function TextValidate (cntl, ev)
{
    /*var text = cntl.value;
    var len = text.length;
    var sel, r2, rng, cPos, shift;
    sel=document.selection;
    r2=sel.createRange();
    rng=cntl.createTextRange();
    rng.setEndPoint("EndToStart", r2);
    cPos=rng.text.length;*/
    //(k < 33 || k > 40), (k < 16 || k > 18)
    //321, 322 ³ £; 260, 261 ± ±; 280, 281 Ê ê; 211, 243 Ó ó; 346, 347 ¦ ¶, 379, 380 ¯ ¿; 377, 378 ¬ ¼; 262, 263 Æ æ; 323, 324 Ñ ñ;
    var k = ev.keyCode;
    //alert(k);
    if ((k < 65 || k > 90) && (k < 97 || k > 122) && (k != 37) && (k != 44) && (k != 32) && (k != 45) && (k != 42) && (k != 13) && (k != 95) && (k != 211) && (k != 243) && (k < 346 || k > 347) && (k < 280 || k > 281) && (k < 321 || k > 324) && (k < 377 || k > 380) && (k < 260 || k > 263))
    {
        ev.returnValue = false;
        //rng.move("character", cPos-shift);
        //rng.select();
    }
    else
    {
        if (k == 42)
        ev.keyCode = 37;
        ev.returnValue = true;
    }
}
function DateValidate (cntl, ev)
{
    /*var sel, rng, r2, cPos, shift;
    var k = ev.keyCode;
    var ch = String.fromCharCode(k);
    var oneChar, result="", sel, r2, rng, cPos, shift=0;
    sel=document.selection;
    r2=sel.createRange();
    rng=cntl.createTextRange();
    rng.setEndPoint("EndToStart", r2);
    cPos=rng.text.length;
    // k == 8 > backspace; 46 > delete; 37 > left arrow; 38 > up arrow; 39 > down arrow; 40 > right arrow
    if (k != 8 && k != 46 && (k < 8 || k > 9) && (k < 33 || k > 40) && (k < 16 || k > 18))
    {
        var text = cntl.value;
        shift = 0;
        for (var i = 0; i <= text.length; i++)
        {
            oneChar = text.substring(i,i + 1);
            if ((oneChar < '0' || oneChar > '9') && (oneChar != " ") && (oneChar != "-"))
            {
                result += '';
                //shift = 1;
            }
            else
            {
                result += oneChar;
            }
        }
        cntl.value = result;
        rng.move("character", cPos-shift);
        rng.select();
    } */
    var k = ev.keyCode;
    //alert(k);
    if ((k < 48 || k > 57) && (k != 32) && (k != 45))
    {
        ev.returnValue = false;
    }
    else
    {
        ev.returnValue = true;
    }
}
function PostCodeValidate (cntl, ev)
{
    var k = ev.keyCode;
    //alert(k);
    if ((k < 48 || k > 57) && (k != 37) && (k != 44) && (k != 32) && (k != 42) && (k != 45) && (k != 95))
    {
        ev.returnValue = false;
    }
    else
    {
        if (k == 42)
        ev.keyCode = 37;
        ev.returnValue = true;
    }
}
function WeekValidate (cntl, ev)
{
    var k = ev.keyCode;
    //alert(k);
    if ((k < 48 || k > 57) && (k != 32))
    {
        ev.returnValue = false;
    }
    else
    {
        ev.returnValue = true;
    }
}
function DigitValidate (cntl, ev)
{
    var k = ev.keyCode;
    //alert(k);
    if ((k < 48 || k > 57) && (k != 37) && (k != 44) && (k != 32) && (k != 42) && (k != 95))
    {
        ev.returnValue = false;
    }
    else
    {
        if (k == 42)
        ev.keyCode = 37;
        ev.returnValue = true;
    }
}
function MailValidate (cntl, ev)
{
    /*var text = cntl.value;
    var len = text.length;
    var k = ev.keyCode;
    var oneChar, result="", sel, r2, rng, cPos, shift;
    sel=document.selection;
    r2=sel.createRange();
    rng=cntl.createTextRange();
    rng.setEndPoint("EndToStart", r2);
    cPos=rng.text.length;
    if ((k < 33 || k > 40) && (k < 65 || k > 90) && (k < 16 || k > 18) && (k < 48 || k > 57))
    {
    
    shift = 0;
    for (var i = 0; i < len; i++)
    {
        oneChar = text.substring(i,i + 1);
        if ((oneChar >= 'a' && oneChar <= 'z') || (oneChar >= '0' && oneChar =< '9') || (oneChar >= 'A' && oneChar <= 'Z') || (oneChar == ' ') || (oneChar == ',') || (oneChar == '%') || (oneChar == '*') || (oneChar == '@'))
        {
            if ((oneChar == '*'))
            {oneChar = '%';}
            result += oneChar;
        }
        else
        {
            result += '';
            shift = 1;
            //if (cPos < len)
            //{cPos--;}
        }
    }
    cntl.value = result;
    rng.move("character", cPos-shift);
    rng.select();
    } */
}
function CheckDate (cntl, date)
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
           info(cntl);
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
                info (cntl);
            }
            //if the month is february, april or june (below 7 and even number)
            if (month < 7 && (month % 2) == 0)
            {
                //there is no 31 in those months
                if (day > 30)
                {
                    info (cntl);
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
                            info (cntl);
                        }
                    }
                    //the year is not a leap year
                    else
                    {
                        //day is not higher than 28
                        if (day > 28)
                        {
                            info (cntl);
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
                    info (cntl);
                }
            }
       }
}
//function throwing an info the date is wrong, throwing it away and leaving focus in control to allow
//repeatition of an attempt to input proper date
function info (item)
{
    alert("Podano b³êdne dane.");
    item.focus();
    item.value = "";
    return 0;
}
function regpatterntest(cntl)
{
    pattern = /^[0-9]{1,2}(\ ){1}[0-9]{1,2}$/;
    if (cntl.value !== 0)
    if (!pattern.test(cntl.value))
    {
        info(cntl);
    }
}
function CheckDL(cntl)
{
    if (cntl.value.length !== 21 && cntl.value.length !== 0)
    {
        info(cntl);
    }
}
function CheckLength(cntl)
{
    var bool = 0;
    if (cntl.value.length !== 10 && cntl.value.length !== 0)
    {
        info(cntl);
        bool = 1;
    }
    if (cntl.value.length !== 0 && bool == 0)
	{
		CheckDate(cntl, cntl.value);
	}
}
function test (cntl, ev)
{
    var k = ev.keyCode;
    // k == 8 > backspace; 46 > delete; 37 > left arrow; 38 > up arrow; 39 > down arrow; 40 > right arrow
    //var k = ev.keyCode;
    if ((k < 48 || k > 57) && (k != 45))
    {
        //alert(k);
        ev.returnValue = false;
    }
}
function OnlyNumber(cntl, ev)
{
	var k;
	//alert(ev.which);
	if (ev.which !== undefined || ev.which > 0)
	{
		//alert();
		k = ev.which;
	}
	else
	{
		k = ev.keyCode;
	}
    // k == 8 > backspace; 46 > delete; 37 > left arrow; 38 > up arrow; 39 > down arrow; 40 > right arrow
    //var k = ev.keyCode;
    if ((k < 48 || k > 57))
    {
        //alert(k);
        ev.returnValue = false;
    }
}
function DateKeyUp (cntl)
{
    if (cntl.value.length == 10)
    {
        CheckDate(cntl, cntl.value);
    }
}
function DoubleDateKeyUp (cntl)
{
    if (cntl.value.length == 21)
    {
        CheckDate(cntl, cntl.value.substring(0, 10));
        CheckDate(cntl, cntl.value.substring(11, 21));
    }
}
function DoubleDateValidate (cntl, ev)
{
    var k = ev.keyCode;
    var ch = String.fromCharCode(k);
    var oneChar, result="", sel, r2, rng, cPos, shift=0;
    sel=document.selection;
    r2=sel.createRange();
    rng=cntl.createTextRange();
    rng.setEndPoint("EndToStart", r2);
    cPos=rng.text.length;
    // k == 8 > backspace; 46 > delete; 37 > left arrow; 38 > up arrow; 39 > down arrow; 40 > right arrow
    if (k != 8 && k != 46 && (k < 8 || k > 9) && (k < 33 || k > 40) && (k < 16 || k > 18))
    {
        var text = cntl.value;
        shift = 0;
        for (var i = 0; i <= text.length; i++)
        {
            oneChar = text.substring(i,i + 1);
            if ((oneChar < '0' || oneChar > '9') && (oneChar != " ") && (oneChar != "-"))
            {
                result += '';
                //shift = 1;
            }
            else
            {
                result += oneChar;
            }
        }
        cntl.value = result;
        rng.move("character", cPos-shift);
        rng.select();
    }
    if(result)
    {
        if (result.length < 10)
        {
            info(cntl);
        }
        if (result.length == 10)
        {
            CheckDate(cntl, result.substring(0, 10));
        }
        if ((result.length < 21) && (result.length != 10))
        {
            info(cntl);
        }
        if (result.length == 21)
        {
            CheckDate(cntl, result.substring(0, 10));
            CheckDate(cntl, result.substring(11, 21));
        } 
        if (result.length > 21)
        {
            info(cntl);
        } 
    }
}
function spr_os(nr)
{
	var tab_os = parent.frames[2].document.getElementsByName("id_osoby_checkbox[]");
	var hidden_os = parent.frames[nr].document.getElementById("h_os");
	var hidden_osb = parent.frames[nr].document.getElementById("h_osb");
	hidden_os.value = "";
	for (i = 0; i < tab_os.length; i++)
	{
		if (tab_os[i].checked)
		{
			hidden_os.value += tab_os[i].value + "|";
		}
	}
	hidden_osb.value = hidden_os.value;
}
function DlugoscSms (cntl, ev)
{
    if (cntl.value.length >= 160)
    {
        ev.returnValue = false;
    }
}
function CutTooLong (cntl)
{
    cntl.value = cntl.value.substring(0, 160);
}
function HideShowSections()
{
	var combo = document.getElementById("statelem");
	var section = new Array(5);
	var hidDdl = document.getElementById("statDdl");
	//var section1 = document.getElementById("opt1");
	//var section2 = document.getElementById("opt2");
	//var section3 = document.getElementById("opt3");
	//var section4 = document.getElementById("opt4");
	
	for (var i = 1; i < 5; i++)
	{
		section[i] = document.getElementById("opt" + i);
	}
	if (combo.options[combo.selectedIndex].value == "--------")
	{
		document.getElementById("potwierdz").disabled = true;
		hidDdl.value = "";
	}
	else
	{
		document.getElementById("potwierdz").disabled = false;
	}
	if (combo.options[combo.selectedIndex].value == "punkt 1")
	{
		hidDdl.value = combo.options[combo.selectedIndex].value;
		for (i = 1; i < 5; i++)
		{
			section[i].style.display = '';
		}
	}
	if (combo.options[combo.selectedIndex].value == "punkt 2")
	{
		hidDdl.value = combo.options[combo.selectedIndex].value;
		//section[1].style.display = 'none';
		for (i = 1; i < 5; i++)
		{
			section[i].style.display = 'none';
		}
	}
	if (combo.options[combo.selectedIndex].value == "punkt 3")
	{
		hidDdl.value = combo.options[combo.selectedIndex].value;
		section[1].style.display = 'none';
		for (i = 2; i < 5; i++)
		{
			section[i].style.display = '';
		}
	}
}
function checkdates(ev)
{
	var dateFrom = document.getElementById("dateFrom");
	var dateTo = document.getElementById("dateTo");
	if (dateFrom.value.length < 10 || dateTo.value.length < 10)
	{
		//we have some missing information, cancel postback
		ev.returnValue = false;
		alert("Bez podania zakresu dat nie mo¿na kontynuowaæ.");
	}
	else
	{
		if (dateFrom.value >= dateTo.value)
		{
			//we have some missing information, cancel postback
			ev.returnValue = false;
			alert("Zakres dat jest b³êdnie sformu³owany.");
		}
	}
}
