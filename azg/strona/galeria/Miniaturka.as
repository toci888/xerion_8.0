package {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.display.Loader;
	import flash.net.URLRequest;
	import flash.display.LoaderInfo;
	import fl.transitions.Tween;
	import fl.transitions.easing.*;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.display.DisplayObject;
	import flash.geom.ColorTransform;

	import flash.display.BitmapData;
	import flash.display.Bitmap;
	import flash.display.GradientType;

	public class Miniaturka extends MovieClip {
		private var id:String;
		private var nazwa_kat:String;
		private var tween:Tween;
		private var tryb:Boolean;
		private var button:Sprite;
		private var index:Number;
		private var aktywna:Boolean = false;
		public var bLoad:Boolean = false;
		private var isShadow:Number;
		private var bg:String;
		var wsp_el_url:String = 'http://ozyrys';
		
		public function Miniaturka(id:String, nazwa_kat:String, index:Number,isShadow:Number,bg:String):void 
		{
			this.isShadow = isShadow;
			this.nazwa_kat = nazwa_kat;
			this.id = id;
			this.bg = bg;
			this.index = index;
			tryb = false;

			var loader:Loader = new Loader();
			
			loader.load(new URLRequest(wsp_el_url + "/media/"+nazwa_kat+"/zdjecia/m_"+id));
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE,onLoadComplete);

			this.alpha = 1;

			button = new Sprite();
			button.graphics.beginFill(0x000000,0);
			button.graphics.drawRect(0,0,120,90);
			button.graphics.endFill();
			button.buttonMode = true;
			addChild(button);

			button.addEventListener(MouseEvent.MOUSE_OVER,onOver);
			button.addEventListener(MouseEvent.MOUSE_OUT,onOut);
			button.addEventListener(MouseEvent.CLICK,onClick);
			
			ramka.gotoAndStop(1);
		}
		private function onOver(event:MouseEvent):void {
			if (!aktywna) {
				setStan(true);
			}
		}
		private function onOut(event:MouseEvent):void {
			if (!aktywna) {
				setStan(false);
			}
		}
		private function onClick(event:MouseEvent):void {
			aktywuj();
		}
		public function deaktywuj():void {
			setStan(false);
			aktywna = false;
		}
		public function aktywuj():void 
		{
			MovieClip(parent).deaktywuj();
			aktywna = true;
			setStan(true);
			MovieClip(parent.parent).loadBig(id, nazwa_kat, index);
		}
		private function onLoadComplete(event:Event):void {
			var loader:Loader = new Loader();
			loader = LoaderInfo(event.target).loader;
			pusty.addChild(loader);
			ladowanie.visible = false;
			tween = new Tween(pusty,"alpha",Regular.easeOut,0,0.6,2,true);
			bLoad = true;
			setStan(false);

			//odbicie lustrzane

			var bd:BitmapData = new BitmapData(120,90,true,0xffffff);
			bd.draw(pusty);

			var bmp:Bitmap = new Bitmap(bd);
			bmp.scaleY = -1;
			bmp.y = 90;

			var cien:Sprite = new Sprite();
			cien.addChild(bmp);
			cien.graphics.beginFill(0xffffff,0);
			cien.graphics.lineStyle(3,0xffffff,1);
			cien.graphics.moveTo(0,0);
			cien.graphics.lineTo(0,90);
			cien.graphics.moveTo(120,0);
			cien.graphics.lineTo(120,90);

			cien.graphics.endFill();
			cien.y = 93;
			if (isShadow) addChild(cien);

			var grad:Sprite = new Sprite();
			if (bg=="black")
			grad.graphics.beginGradientFill(GradientType.LINEAR, [0x000000, 0x000000], [0,1], [0, 195]); else
			grad.graphics.beginGradientFill(GradientType.LINEAR, [0xffffff, 0xffffff], [0,1], [0, 195]);
			grad.graphics.drawRect(0,0,90,126);
			grad.graphics.endFill();
			grad.y = 92;
			grad.x = 123;
			grad.rotation = 90;
			if (isShadow)
			addChild(grad);



			pusty.alpha = 0;
		}
		private function setStan(tryb:Boolean):void {
			this.tryb = tryb;
			var color:ColorTransform = new ColorTransform();
			if (tryb) {
				//aktywna ramka
				color.color = Number(MovieClip(root).propABorderColor);
				ramka.transform.colorTransform = color;
				pusty.alpha = 1;
			} else {
				//nieaktywna ramka
				color.color = Number(MovieClip(root).propNBorderColor);
				ramka.transform.colorTransform = color;
				pusty.alpha = 0.6;
			}
		}
	}
}