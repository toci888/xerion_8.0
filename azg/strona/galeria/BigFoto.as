package {
	import flash.display.MovieClip;
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.events.Event;
	import flash.net.URLRequest;
	import flash.display.DisplayObject;
	import flash.events.ProgressEvent;
	import flash.text.TextField;
	import fl.transitions.Tween;
	import fl.transitions.easing.*;
	
	public class BigFoto extends MovieClip {
		private var img:DisplayObject;
		private var oldImg:DisplayObject;
		private var tween:Tween;
		private var type:String = "m";
		private var id:String;
		private var nazwa_kat:String;
		public var bLoad:Boolean = false;
		var wsp_el_url:String = 'http://ozyrys';
		var przes_wym:int = 4;
		
		public function BigFoto() {
		}
		
		public function loadImage(id:String, nazwa_kat:String):void 
		{
			this.id = id;
			this.nazwa_kat = nazwa_kat;
			var loader:Loader = new Loader();
			loader.load(new URLRequest(wsp_el_url + "/media/"+nazwa_kat+"/zdjecia/"+id));
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE,onLoadComplete);
			loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS,onLoadProgress);
			pasek.visible = true;
			procent.visible = true;
			bLoad = true;
		}
		
		public function update():void 
		{
			var px:Number = (stage.stageWidth-660)/-2;
			var py:Number = (stage.stageHeight-660)/-2;
			
			if (stage.stageWidth>=1100 && stage.stageHeight>=950) 
			{
				tlo.width = 1024+8;
				tlo.height = 768+8;
				tlo.x = px+(stage.stageWidth-1032)/2;
				tlo.y = py+(stage.stageHeight-776-160)/2;
				if (img!=null) {
					img.x = tlo.x+przes_wym;
					img.y = tlo.y+przes_wym;
				}
				if (oldImg!=null) {
					oldImg.x = tlo.x+przes_wym;
					oldImg.y = tlo.y+przes_wym;
				}

				if (type=="m") {
  				    type = "b";
					if (oldImg!=null) {pusty.removeChild(oldImg);oldImg=null;}
					if (img!=null) {pusty.removeChild(img);img=null;loadImage(id, nazwa_kat);}
				}
				type = "b";
			} 
			else 
			{
				tlo.width = 648;
				tlo.height = 488;
				tlo.x = 0;
				tlo.y = 0;
				if (img!=null) {
					img.x = tlo.x+przes_wym;
					img.y = tlo.y+przes_wym;
				}
				if (oldImg!=null) {
					oldImg.x = tlo.x+przes_wym;
					oldImg.y = tlo.y+przes_wym;
				}
				
				if (type=="b") {
                    type = "m";
					if (oldImg!=null) {pusty.removeChild(oldImg);oldImg=null;}
					if (img!=null) {pusty.removeChild(img);img=null;loadImage(id, nazwa_kat);}
				}
			}
			if (img!=null) {
			img.width = tlo.width - 8;
			img.height = tlo.height - 8;
			}
			
			pasek.x = tlo.x+przes_wym;
			pasek.y = tlo.y+tlo.height-10;
			pasek.width = tlo.width - 8;
			
			procent.x = tlo.x+3.6;
			procent.y = tlo.y+tlo.height-16;
		}
		
		private function onLoadComplete(event:Event):void {
            var px:Number = (stage.stageWidth-660)/-2;
			var py:Number = (stage.stageHeight-660)/-2;
			if (img!=null) {
				if (oldImg!=null) pusty.removeChild(oldImg);
				oldImg = img;
			}
			img = pusty.addChild(LoaderInfo(event.target).loader);
			if (type=="b")
			img.alpha = 0;
			pasek.visible = false;
			procent.visible = false;
			tween = new Tween(img,"alpha",Regular.easeOut,0,1,2,true);
			update();
			bLoad = false;
		}
		
		private function onLoadProgress(event:ProgressEvent):void 
		{
			if (type=="m")
			pasek.width = 619*(event.bytesLoaded/event.bytesTotal); else
			pasek.width = 1003*(event.bytesLoaded/event.bytesTotal);
			
			
			procent.text = String(Math.floor(100*(event.bytesLoaded/event.bytesTotal)))+"%";
			if (type=="m")
			procent.x = 3.6+619*(event.bytesLoaded/event.bytesTotal); else
			procent.x = tlo.x+3.6+1003*(event.bytesLoaded/event.bytesTotal);
		}
	}
}