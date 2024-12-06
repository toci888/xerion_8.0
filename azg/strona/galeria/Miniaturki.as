package {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.utils.setInterval;
	import flash.external.*;
	import flash.net.*;

	public class Miniaturki extends MovieClip 
	{
    	private var mini:Array;
		private var loader:URLLoader;
		//private var xml1:XML;
		private var dane:Array;
		public var count:Number= -1;
		var wsp_el_url:String = 'http://ozyrys';
		private var addr:String;
		
		public function Miniaturki():void 
		{		
			//this.PobierzDane('PodajZdjecia', PobranoZdjecia, '54');
			
			addr = ExternalInterface.call("function(){return window.location.href}").toString();
			//addr = "http://ozyrys/zdjecie.php?dsxas=123";
			if (addr.search('=') > 0)
			{
				var pos_start = addr.search('=');
				pos_start += 1;
				var pos_end = addr.length - pos_start;
				//trace (pos_start);
				//trace(pos_end);
				var id_nieruchomosc:int = parseInt(addr.substr(pos_start, pos_end));
				//trace(addr.substr(pos_start, pos_end));
				if (!isNaN(id_nieruchomosc))
				{
					//addr = id_nieruchomosc.toString();
					this.PobierzDane('PodajZdjecia', PobranoZdjecia, id_nieruchomosc.toString());
				}
			}
		}
		function PobierzDane(metoda:String, uruchom:Function, parametr:String):void 
		{
			var myService = new NetConnection();
			myService.connect(wsp_el_url + "/amfphp/gateway.php");//modify if neccesary to match your own
			var responder = new Responder(uruchom, onFault);
			myService.call("lib_baner." + metoda, responder, parametr);
		}
		function onFault(f:Object ) 
		{
			trace(f);
		}
		function PobranoZdjecia(responds:Object)
		{
			dane = new Array(responds.length);
			mini = new Array(responds.length);
			count = responds.length;
			
			MovieClip(parent).odstep = Number(responds.speed);                      //+
			MovieClip(parent).propShadow = Number(responds.shadow);                 //+
			MovieClip(parent).propFontName = responds.fontName;                     //+
			MovieClip(parent).propFontSize = responds.fontSize;                     //+
			MovieClip(parent).propFontColor = responds.fontColor;                   //+
			MovieClip(parent).propNBorderColor = responds.nborderColor;             //+
			MovieClip(parent).propABorderColor = Number(responds.aborderColor); 
			
			var i:int = 0;
			var id_nieruchomosc:String = responds.id_nieruchomosc;
			
			for (i; i < responds.length; i++)
			{
				dane[i] = responds[i].nazwa;
				mini[i] = new Miniaturka(responds[i].nazwa, id_nieruchomosc, i, MovieClip(parent).propShadow, MovieClip(parent).propBg);
				mini[i] = addChild(mini[i]);
				mini[i].x = i*(120+10);
			}
			
			MovieClip(parent).setIlosc(0);
			
			setInterval(intervalM, 10);
		}
		
		private function intervalM():void {
			var px:Number = (stage.stageWidth-660)/-2;
			var pol:Number = 660/2;
			var posM:Number = MovieClip(parent).mouseX;
			if (mouseY>=0 && mouseY<=90) {
				if (posM<pol) {
					if (this.x<=(px+54)) this.x++;
				} else {
					if ((this.x+mini.length*(120+10))>=(px+stage.stageWidth-46)) this.x--;
				}
			}
		}
		
		public function setIlosc(index:Number):void {
			MovieClip(parent).setIlosc(index);
		}
		
		public function getTitle(index:Number):String {
			return dane[index];
		}
		
		public function getImgId(index:Number):String {
			return dane[index];
		}
		
		public function deaktywuj():void {
			var i:Number;
			for (i=0;i<count;i++) {
				mini[i].deaktywuj();
			}
		}
		
		public function aktywuj(index:Number):void {
			var pX:Number = (stage.stageWidth-660)/-2;
			var min:Number = pX+54;
			var max:Number = pX+stage.stageWidth-54;
			var polozenie:Number = this.x+mini[index].x;
			
			if (polozenie<min || (polozenie+mini[index].width)>max) {
              this.x = pX-mini[index].x+54;
			}
			mini[index].aktywuj();
		}
		
		public function bLoad():Boolean {
			var i:Number;
			var il:Number = 0;
			
			for (i=0;i<count;i++) {
				if (mini[i].bLoad) il++;
			}
			
			if (il==count) return true; else return false;
		}
	}
}