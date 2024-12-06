/**********************************************************************************   
PageSlideFade 
*   Copyright (C) 2001 <a href="/dhtmlcentral/michael_van_ouwerkerk.asp">Michael van Ouwerkerk</a>
*   This script was released at DHTMLCentral.com
*   Visit for more great scripts!
*   This may be used and changed freely as long as this msg is intact!
*   We will also appreciate any links you could give us.
*
*   Made by <a href="/dhtmlcentral/michael_van_ouwerkerk.asp">Michael van Ouwerkerk</a> 
*********************************************************************************/

function lib_bwcheck(){ //Browsercheck (needed)
	this.ver=navigator.appVersion
	this.agent=navigator.userAgent
	this.dom=document.getElementById?1:0
	this.opera5=this.agent.indexOf("Opera 5")>-1
	this.ie5=(this.ver.indexOf("MSIE 5")>-1 && this.dom && !this.opera5)?1:0; 
	this.ie6=(this.ver.indexOf("MSIE 6")>-1 && this.dom && !this.opera5)?1:0;
	this.ie4=(document.all && !this.dom && !this.opera5)?1:0;
	this.ie=this.ie4||this.ie5||this.ie6
	this.mac=this.agent.indexOf("Mac")>-1
	this.ns6=(this.dom && parseInt(this.ver) >= 5) ?1:0; 
	this.ns4=(document.layers && !this.dom)?1:0;
	this.bw=(this.ie6 || this.ie5 || this.ie4 || this.ns4 || this.ns6 || this.opera5)
	return this
}
var bw=new lib_bwcheck()


/*** variables to configure... ***/

var numScrollPages = 19;         //Set the number of pages (layers) here. Add and remove the pages in the body too. The first layer is called dynPage0, the second is dynPage1, and so on.
var transitionOut = 1;         //The 'out' effect... 0= no effect, 1= fade
var transitionIn = 2;          //The 'in' effect... 0= no effect, 1= fade, 2= slide
var slideAcceleration = 0.5;   //If you use the slide animation, set this somewhere between 0 and 1.
var transitionOnload = 1;       //Use the 'in' transition when the page first loads? If you want the transition fx only when the links are clicked, you can set it to 0.

// NOTE: if you change the position of divScroller1 from absolute to relative, you can put the scroller in a table.
// HOWEVER it will no longer work in netscape 4. If you wish to support netscape 4, you have to use absolute positioning.

// Please note that there are no effects available in ns4 and ie4, or explorers on the Mac!

/*** There should be no need to change anything beyond this. ***/ 

// A unit of measure that will be added when setting the position of a layer.
var px = bw.ns4||window.opera?"":"px";

if(document.layers){ //NS4 resize fix...
	scrX= innerWidth; scrY= innerHeight;
	onresize= function(){if(scrX!= innerWidth || scrY!= innerHeight){history.go(0)} }
}

//object constructor...
function scrollerobj(obj,nest){
	nest = (!nest)?"":'document.'+nest+'.'
	this.elm = bw.ie4?document.all[obj]:bw.ns4?eval(nest+'document.'+obj):document.getElementById(obj)
	this.css = bw.ns4?this.elm:this.elm.style
	this.doc = bw.ns4?this.elm.document:document
	this.obj = obj+'scrollerobj'; eval(this.obj+'=this')
	this.x = (bw.ns4||bw.opera5)?this.css.left:this.elm.offsetLeft
	this.y = (bw.ns4||bw.opera5)?this.css.top:this.elm.offsetTop
	this.w = (bw.ie4||bw.ie5||bw.ie6||bw.ns6)?this.elm.offsetWidth:bw.ns4?this.elm.clip.width:bw.opera5?this.css.pixelWidth:0
	this.h = (bw.ie4||bw.ie5||bw.ie6||bw.ns6)?this.elm.offsetHeight:bw.ns4?this.elm.clip.height:bw.opera5?this.css.pixelHeight:0
}

//object methods...
scrollerobj.prototype.moveTo = function(x,y){
	if(x!=null){this.x=x; this.css.left=x+px}
	if(y!=null){this.y=y; this.css.top=y+px}
}
scrollerobj.prototype.moveBy = function(x,y){this.moveTo(this.x+x,this.y+y)}
scrollerobj.prototype.hideIt = function(){this.css.visibility='hidden'}
scrollerobj.prototype.showIt = function(){this.css.visibility='visible'}

/****************************************************************
scroll functions...
****************************************************************/
var scrollTimer = null;
function scroll(step){
	clearTimeout(scrollTimer);
	if ( !busy && (step<0&&activePage.y+activePage.h>scroller1.h || step>0&&activePage.y<0) ){
		activePage.moveBy(0,step);
		scrollTimer = setTimeout('scroll('+step+')',40);
	}
}
function stopScroll(){
	clearTimeout(scrollTimer);
}

/****************************************************************
activating the correct layers...
****************************************************************/
var activePage = null;
var busy = 0;
function activate(num){
	if (activePage!=pages[num] && !busy){
		busy = 1;
		if (transitionOut==0 || !bw.opacity){ activePage.hideIt(); activateContinue(num); }
		else if (transitionOut==1) activePage.blend('hidden', 'activateContinue('+num+')');
	}
}
function activateContinue(num){
	busy = 1;
	activePage = pages[num];
	activePage.moveTo(0,0);
	if (transitionIn==0 || !bw.opacity){ activePage.showIt(); busy=0; }
	else if (transitionIn==1) activePage.blend('visible', 'busy=0');
	else if (transitionIn==2) activePage.slide(0, slideAcceleration, 40, 'busy=0');
}


/****************************************************************
Slide methods...
****************************************************************/
scrollerobj.prototype.slide = function(target, acceleration, time, fn){
	this.slideFn= fn?fn:null;
	this.moveTo(0,scroller1.h);
	if (bw.ie4&&!bw.mac) this.css.filter = 'alpha(opacity=100)';
	if (bw.ns6) this.css.MozOpacity = 1;
	this.showIt();
	this.doSlide(target, acceleration, time);
}
scrollerobj.prototype.doSlide = function(target, acceleration, time){
	this.step = Math.round(this.y*acceleration);
	if (this.step<1) this.step = 1;
	if (this.step>this.y) this.step = this.y;
	this.moveBy(0, -this.step);
	if (this.y>0) this.slideTim = setTimeout(this.obj+'.doSlide('+target+','+acceleration+','+time+')', time);
	else {	
		eval(this.slideFn);
		this.slideFn = null;
	}
}


/****************************************************************
Opacity methods...
****************************************************************/
scrollerobj.prototype.blend= function(vis, fn){
	if (bw.ie5||bw.ie6 && !bw.mac) {
		if (vis=='visible') this.css.filter= 'blendTrans(duration=0.9)';
		else this.css.filter= 'blendTrans(duration=0.6)';
		this.elm.onfilterchange = function(){ eval(fn); };
		this.elm.filters.blendTrans.apply();
		this.css.visibility= vis;
		this.elm.filters.blendTrans.play();
	}
	else if (bw.ns6 || bw.ie&&!bw.mac){
		this.css.visibility= 'visible';
		vis=='visible' ? this.fadeTo(100, 7, 40, fn) : this.fadeTo(0, 9, 40, fn);
	}
	else {
		this.css.visibility= vis;
		eval(fn);
	}
};

scrollerobj.prototype.op= 100;
scrollerobj.prototype.opacityTim= null;
scrollerobj.prototype.setOpacity= function(num){
	this.css.filter= 'alpha(opacity='+num+')';
	this.css.MozOpacity= num/100;
	this.op= num;
}
scrollerobj.prototype.fadeTo= function(target, step, time, fn){
	clearTimeout(this.opacityTim);
	this.opacityFn= fn?fn:null;
	this.op = target==100 ? 0 : 100;
	this.fade(target, step, time);
}
scrollerobj.prototype.fade= function(target, step, time){
	if (Math.abs(target-this.op)>step){
		target>this.op? this.setOpacity(this.op+step):this.setOpacity(this.op-step);
		this.opacityTim= setTimeout(this.obj+'.fade('+target+','+step+','+time+')', time);
	}
	else {
		this.setOpacity(target);
		eval(this.opacityFn);
		this.opacityFn= null;
	}
}


/**************************************************************
Init function...
**************************************************************/
var pageslidefadeLoaded = 0;
function initPageSlideFade(){
	scroller1 = new scrollerobj('divScroller1');
	
	pages = new Array();
	for (var i=0; i<numScrollPages; i++){
		pages[i] = new scrollerobj('dynPage'+i, 'divScroller1');
		pages[i].moveTo(0,0);
	}
	bw.opacity = ( bw.ie && !bw.ie4 && navigator.userAgent.indexOf('Windows')>-1 ) || bw.ns6
	if (bw.ie5||bw.ie6 && !bw.mac) pages[0].css.filter= 'blendTrans(duration=0.6)'; // Preloads the windows filters.
	
	if (transitionOnload) activateContinue(0);
	else{
		activePage = pages[0];
		activePage.showIt();
	}

	if (bw.ie) for(var i=0;i<document.links.length;i++) document.links[i].onfocus=document.links[i].blur;
	pageslidefadeLoaded = 1;
}
//if the browser is ok, the script is started onload..
if(bw.bw && !pageslidefadeLoaded) onload = initPageSlideFade;