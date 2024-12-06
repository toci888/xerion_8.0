package {
	import flash.display.MovieClip;
	import flash.text.TextField;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.display.StageDisplayState;
	import flash.display.StageScaleMode;
	import flash.display.SimpleButton;
	
	public class DocObject extends MovieClip {
		private var stanAuto:Boolean = false;
		private var stanFull:Boolean = false;
		public var odstep:Number = 160;
		private var licznik:Number = 0;
		private var currentIndex:Number = 0;
		private var f1:Boolean = true;
		
		public var propShadow:Number = 0;
		public var propFontName:String = "Arial";
		public var propFontSize:String = "15";
		public var propFontColor:String = "#ffffff";
		public var propNBorderColor:String = "0xcdefdf";
		public var propABorderColor:String = "0xffffff";
        public var propBg:String = "black";
		
		public function DocObject():void 
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.addEventListener(Event.RESIZE,onResizeDoc);
			resizeMyDoc();
			navi.b31.visible = false;
			navi.b11.visible = false;
			
			var i:Number;
			for (i=1;i<=3;i++) 
			{
			 navi["but"+i].addEventListener(MouseEvent.MOUSE_OVER,onOverBut);
			 navi["but"+i].addEventListener(MouseEvent.MOUSE_OUT,onOutBut);
			 navi["but"+i].addEventListener(MouseEvent.CLICK,onClickBut);
			}
			
			addEventListener(Event.ENTER_FRAME,onEnterFrame);		
			
			bPrev.addEventListener(MouseEvent.CLICK,onClickPrevNext);
			bNext.addEventListener(MouseEvent.CLICK,onClickPrevNext);
			
			if (propBg=="black") 
			{
				 tlom.gotoAndStop(2);
				 linia.gotoAndStop(2);
				 ogr1.gotoAndStop(2);
				 ogr2.gotoAndStop(2);
			} 
			else 
			{
				 tlom.gotoAndStop(1);
				 linia.gotoAndStop(1);
				 ogr1.gotoAndStop(1);
				 ogr2.gotoAndStop(1);
			}
		}
		
		private function onClickPrevNext(event:Event):void 
		{
			if (event.target.name == "bNext") 
			{
				if (currentIndex < (miniaturki.count-1)) 
				{
					currentIndex++;
					miniaturki.aktywuj(currentIndex);
				}
			} 
			else 
			{
				if (currentIndex>0) 
				{
					currentIndex--;
					miniaturki.aktywuj(currentIndex);
				}
			}
		}
				
		private function onEnterFrame(event:Event):void 
		{
			//obsluga fs
			       if (stage.displayState == StageDisplayState.FULL_SCREEN) {
					   navi.b3.visible = false;
					   navi.b31.visible = true;
					   stanFull = true;
				   } else {
                       navi.b3.visible = true;
					   navi.b31.visible = false;
					   stanFull = false;
				   }
			//obsluga automatu
			if (stanAuto) {
				if (!bigFoto.bLoad) {
					if (licznik==odstep) {
                        currentIndex++;
						if (currentIndex==miniaturki.count) currentIndex = 0;
						var id:String = miniaturki.getImgId(currentIndex);
						var nazwa_kat:String = id.substr(0, id.search('_'));
						bigFoto.loadImage(id, nazwa_kat);
						miniaturki.aktywuj(currentIndex);
						miniaturki.setIlosc(currentIndex);
						licznik=0;
					} else licznik++;
				}
			}
			//f1
			
			if (f1 && miniaturki.bLoad()) 
			{
  		      miniaturki.aktywuj(0);
			  f1 = false;
			}

		}
		
		private function onOverBut(event:MouseEvent):void 
		{
			switch (event.target.name) 
			{
				case "but1": 
				   navi.b1.gotoAndPlay("over");
				   navi.b11.gotoAndPlay("over");
				   break;
				case "but2": 
				   navi.b2.gotoAndPlay("over");
				   break;
				case "but3": 
				   navi.b3.gotoAndPlay("over");
				   navi.b31.gotoAndPlay("over");
				   break;
			}
		}
		private function onOutBut(event:MouseEvent):void 
		{
			switch (event.target.name) {
				case "but1": 
				   navi.b1.gotoAndPlay("out");
				   navi.b11.gotoAndPlay("out");
				   break;
				case "but2": 
				   navi.b2.gotoAndPlay("out");
				   break;
				case "but3": 
				   navi.b3.gotoAndPlay("out");
				   navi.b31.gotoAndPlay("out");
				   break;
			}
		}
		private function onClickBut(event:MouseEvent):void 
		{
			switch (event.target.name) 
			{
				case "but1": 
				   if (stanAuto) 
				   {
				   stanAuto = false;
				   navi.b1.visible = true;
				   navi.b11.visible = false;
				   } else {
				   stanAuto = true;
				   navi.b1.visible = false;
				   navi.b11.visible = true;
				   }
				   break;
				case "but2": 
				   stanAuto = false;
				   navi.b1.visible = true;
				   navi.b11.visible = false;
				   currentIndex = 0;
				   miniaturki.aktywuj(0);
				   break;
				case "but3": 
				   if (!bigFoto.bLoad) {
				   if (stanFull) {
					   navi.b3.visible = true;
					   navi.b31.visible = false;
					   stanFull = false;
					   stage.displayState = StageDisplayState.NORMAL;
				   } else {
					   navi.b3.visible = false;
					   navi.b31.visible = true;
					   stanFull = true;
					   stage.displayState = StageDisplayState.FULL_SCREEN;
				   }
				   }
				   break;
			}
		}

		
		
		private function onResizeDoc(event:Event):void {
			resizeMyDoc();
		}
		
		private function resizeMyDoc():void {
			var px:Number = (stage.stageWidth-660)/-2;
			var py:Number = (stage.stageHeight-660)/-2;
			
			linia.x = px+10;
			linia.width = stage.stageWidth-19;
			linia.y = py+stage.stageHeight-130;
			
			nazwa.x = linia.x;
			nazwa.y = linia.y-31;
			
			ilosc.x = px+stage.stageWidth-9-ilosc.width;
			ilosc.y = linia.y-31;
			
			miniaturki.x = px+54;
			miniaturki.y = py+stage.stageHeight-120;
			maska1.x = px;
			maska1.y = py+stage.stageHeight-maska1.height;
			maska1.width = stage.stageWidth;
			
			ogr1.x = px;
			ogr1.y = linia.y+10;
			
			ogr2.x = px+stage.stageWidth-ogr2.width;
			ogr2.y = linia.y+10;
			
			bigFoto.update();
			
			navi.x = bigFoto.tlo.x+bigFoto.tlo.width-navi.width+3;
			navi.y = bigFoto.tlo.y+10;
			
			bPrev.x = bigFoto.tlo.x+6;
			bNext.x = bigFoto.tlo.x+bigFoto.tlo.width+7;
			
			bPrev.y = bigFoto.tlo.y+bigFoto.tlo.height/2;
			bNext.y = bigFoto.tlo.y+bigFoto.tlo.height/2;
			
			tlom.width=stage.stageWidth;
			tlom.height=stage.stageHeight;
			tlom.x = px;
			tlom.y = py;
		}
		
		public function loadBig(id:String, nazwa_kat:String, index:Number):void 
		{
			currentIndex = index;
			setIlosc(index);
			setTitle(miniaturki.getTitle(index));
			bigFoto.loadImage(id, nazwa_kat);
		}	
		
		public function setIlosc(index:Number):void {
			ilosc.htmlText = "<font face='"+propFontName+"' size='"+propFontSize+"' color='"+propFontColor+"'>"+(index+1)+"/"+miniaturki.count+"</font>";
		}
		public function setTitle(nazwa2:String):void {
			nazwa.htmlText = "<font face='"+propFontName+"' size='"+propFontSize+"' color='"+propFontColor+"'>"+nazwa2+"</font>";
		}
	}
}