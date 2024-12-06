//*****************************************
// Blending Image Slide Show Script- 
// © Dynamic Drive (www.dynamicdrive.com)
// For full source code, visit http://www.dynamicdrive.com/
//*****************************************

//specify interval between slide (in mili seconds)
var slidespeed=3000

//specify images
var slideimages=new Array("zd350.jpg","zd351.jpg","zd352.jpg","zd353.jpg","zd354.jpg","zd355.jpg")

//specify corresponding links

var slidelinks=new Array("http://www.azg.pl/index.php?action=sprzedazzmzd&z=350","http://www.azg.pl/index.php?action=sprzedazzmzd&z=350","http://www.azg.pl/index.php?action=sprzedazzmzd&z=350","http://www.azg.pl/index.php?action=sprzedazzmzd&z=350","http://www.azg.pl/index.php?action=sprzedazzmzd&z=350","http://www.azg.pl/index.php?action=sprzedazzmzd&z=350")

var newwindow=0 //open links in new window? 1=yes, 0=no

var imageholder=new Array()
var ie=document.all
for (i=0;i<slideimages.length;i++){
imageholder[i]=new Image()
imageholder[i].src=slideimages[i]
}

function gotoshow(){
if (newwindow)
window.open(slidelinks[whichlink])
else
window.location=slidelinks[whichlink]
}
