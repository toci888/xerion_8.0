function NewWindow(mypage, myname, w, h, scroll) {
var winl = (screen.width - w) / 2;
var wint = (screen.height - h) / 2;
winprops = 'height='+h+',width='+w+',top='+wint+',left='+winl+',scrollbars='+scroll+',resizable=no'
win = window.open(mypage, myname, winprops)
if (parseInt(navigator.appVersion) >= 4) { win.window.focus(); }
}

function mapa(adr) 
{
	map = new Object;
	var winleft = (screen.width - 750) / 2;
	var wintop = (screen.height - 500) / 2;
	url = 'http://work.um.opole.pl/mapa/mapa.php4'+'?RUN='+adr;
	map = open(url, 'OKNO_MAPA2', 'Height=500,Width=750,top='+wintop+',left='+winleft+',toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=0,resizable=0');
	map.focus();
}
