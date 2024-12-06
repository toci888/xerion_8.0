/*
 DHTML Menu version 3.3.19
 Written by Andy Woolley
 Copyright 2002 (c) Milonic Solutions. All Rights Reserved.
 Plase vist http://www.milonic.co.uk/menu or e-mail menu3@milonic.com
 You may use this menu on your web site free of charge as long as you place prominent links to http://www.milonic.co.uk/menu and
 your inform us of your intentions with your URL AND ALL copyright notices remain in place in all files including your home page
 Comercial support contracts are available on request if you cannot comply with the above rules.
 This script featured on Dynamic Drive (http://www.dynamicdrive.com)
 */

//The following line is critical for menu operation, and MUST APPEAR ONLY ONCE. If you have more than one menu_array.js file rem out this line in subsequent files
menunum=0;menus=new Array();_d=document;function addmenu(){menunum++;menus[menunum]=menu;}function dumpmenus(){mt="<script language=javascript>";for(a=1;a<menus.length;a++){mt+=" menu"+a+"=menus["+a+"];"}mt+="<\/script>";_d.write(mt)}
//Please leave the above line intact. The above also needs to be enabled if it not already enabled unless this file is part of a multi pack.



////////////////////////////////////
// Editable properties START here //
////////////////////////////////////

// Special effect string for IE5.5 or above please visit http://www.milonic.co.uk/menu/filters_sample.php for more filters
if(navigator.appVersion.indexOf("MSIE 6.0")>0)
{
	effect = "Fade(duration=0.2);Alpha(style=0,opacity=88);Shadow(color='#777777', Direction=135, Strength=5)"
}
else
{
	effect = "Shadow(color='#777777', Direction=135, Strength=5)" // Stop IE5.5 bug when using more than one filter
}


timegap=200				// The time delay for menus to remain visible
followspeed=2			// Follow Scrolling speed
followrate=10			// Follow Scrolling Rate
suboffset_top=0;		// Sub menu offset Top position 
suboffset_left=0;		// Sub menu offset Left position


style1=[				// style1 is an array of properties. You can have as many property arrays as you need. This means that menus can have their own style.
"FFFFFF",				// Mouse Off Font Color
"46618F",				// Mouse Off Background Color
"FFFFFF",				// Mouse On Font Color
"647BA3",				// Mouse On Background Color
"1F3C6D",				// Menu Border Color 
11,					// Font Size in pixels
"normal",				// Font Style (italic or normal)
"bold",					// Font Weight (bold or normal)
"Arial",				// Font Name
3,					// Menu Item Padding
"arrow.gif",				// Sub Menu Image (Leave this blank if not needed)
1,					// 3D Border & Separator bar
"66ffff",				// 3D High Color
"000099",				// 3D Low Color
"red",				// Current Page Item Font Color (leave this blank to disable)
"000099",					// Current Page Item Background Color (leave this blank to disable)
"arrowdn.gif",				// Top Bar image (Leave this blank to disable)
"ffffff",				// Menu Header Font Color (Leave blank if headers are not needed)
"000099",				// Menu Header Background Color (Leave blank if headers are not needed)
]

addmenu(menu=[		// This is the array that contains your menu properties and details
"mainmenu",			// Menu Name - This is needed in order for the menu to be called
187,					// Menu Top - The Top position of the menu in pixels
,				// Menu Left - The Left position of the menu in pixels
110,					// Menu Width - Menus width in pixels
0,					// Menu Border Width 
"center",					// Screen Position - here you can use "center;left;right;middle;top;bottom" or a combination of "center:middle"
style1,				// Properties Array - this is set higher up, as above
1,					// Always Visible - allows the menu item to be visible at all time (1=on/0=off)
"center",				// Alignment - sets the menu elements text alignment, values valid here are: left, right or center
"effect",				// Filter - Text variable for setting transitional effects on menu activation - see above for more info
,					// Follow Scrolling - Tells the menu item to follow the user down the screen (visible at all times) (1=on/0=off)
1, 					// Horizontal Menu - Tells the menu to become horizontal instead of top to bottom style (1=on/0=off)
1,					// Keep Alive - Keeps the menu visible until the user moves over another menu or clicks elsewhere on the page (1=on/0=off)
"right",					// Position of TOP sub image left:center:right
,					// Set the Overall Width of Horizontal Menu to 100% and height to the specified amount (Leave blank to disable)
0,					// Right To Left - Used in Hebrew for example. (1=on/0=off)
,					// Open the Menus OnClick - leave blank for OnMouseover (1=on/0=off)
,					// ID of the div you want to hide on MouseOver (useful for hiding form elements)
,					// Reserved for future use
,					// Reserved for future use
,					// Reserved for future use

,"Sprzeda¿","show-menu=sprzedaz",,"",1
,"Wynajem","show-menu=wynajem",,"",1
,"Kupno","show-menu=kupno",,"",1
,"Zamiana","show-menu=zamiany",,"",1
,"Kalkulator op³at","http://www.web.azg.pl/index.php?action=kalkulator",,"",1
,"Kredyty","http://www.web.azg.pl/index.php?action=kredyty",,"",1
,"Poradnik","show-menu=porada",,"",1
])

addmenu(menu=["porada",
	,,120,1,"",style1,,"left",effect,,,,,,,,,,,,
	,"Formy Sprzeda¿y","http://www.web.azg.pl/index.php?action=formy",,,1
	,"Info dla klienta","http://www.web.azg.pl/index.php?action=info",,,1
	])

	addmenu(menu=["sprzedaz",
	,,120,1,"",style1,,"left",effect,,,,,,,,,,,,
	,"Mieszkania","http://www.web.azg.pl/index.php?action=sprzedazm",,,1
	,"Domy","http://www.web.azg.pl/index.php?action=sprzedazd",,,1
	,"Lokale","http://www.web.azg.pl/index.php?action=sprzedazl",,,1
	,"Obiekty","http://www.web.azg.pl/index.php?action=sprzedazo",,,1
	,"Dzia³ki","http://www.web.azg.pl/index.php?action=sprzedazdz",,,1
	,"Tereny","http://www.web.azg.pl/index.php?action=sprzedazte",,,1
	])
	
	addmenu(menu=["wynajem",
	,,120,1,"",style1,,"left",effect,,,,,,,,,,,,
	,"Mieszkania","http://www.web.azg.pl/index.php?action=wynajemm",,,1
	,"Domy","http://www.web.azg.pl/index.php?action=wynajemd",,,1
	,"Lokale","http://www.web.azg.pl/index.php?action=wynajeml",,,1
	,"Obiekty","http://www.web.azg.pl/index.php?action=wynajemo",,,1
	,"Dzia³ki","http://www.web.azg.pl/index.php?action=wynajemdz",,,1
	,"Tereny","http://www.web.azg.pl/index.php?action=wynajemte",,,1
	])
	
	addmenu(menu=["zamiany",
	,,120,1,"",style1,,"left",effect,,,,,,,,,,,,
	,"Mieszkania","http://www.web.azg.pl/index.php?action=zamianam",,,1
	,"Domy","http://www.web.azg.pl/index.php?action=zamianad",,,1
	])
	
		
	addmenu(menu=["kupno",
	,,120,1,"",style1,,"left",effect,,,,,,,,,,,,
	,"Mieszkania","http://www.web.azg.pl/index.php?action=kupnom",,,1
	,"Domy","http://www.web.azg.pl/index.php?action=kupnod",,,1
	,"Lokale","http://www.web.azg.pl/index.php?action=kupnol",,,1
	,"Obiekty","http://www.web.azg.pl/index.php?action=kupnoo",,,1
	,"Dzia³ki","http://www.web.azg.pl/index.php?action=kupnodz",,,1
	,"Tereny","http://www.web.azg.pl/index.php?action=kupnote",,,1
	])

		
	
dumpmenus()