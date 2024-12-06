<?
	
include "../concfg.inc";


echo "Wysłane juz do wszystkich:";

		$subjectte = "OFERTA ZAJAZDU";
		$youremail = "azgwarancja@azg.pl";
		

	$headers  = "MIME-Version: 1.0\n";
	$headers .= "X-Mailer: SYSTEM AZG\n"; 	
	$headers .= "From: $youremail\n";
	$headers .= "X-Sender: <$youremail>\n"; 
	$headers .= "X-Priority: 3\n"; 				
	$headers .= "Return-Path: $youremail\n";  	
	$headers .= "Content-Type: text/html\n";
	$headers .= "Content-Transfer-Encoding: 8bit\n";

$trescte = "

<HTML lang=\"pl\">
<HEAD>
<META http-equiv=\"content-type\" content=\"text/html; charset=ISO-8859-2\">
<LINK rel=\"stylesheet\" href=\"http://www.azg.pl/azg.css\">
<TITLE>OPOLSKIE BIURO NIERUCHOMOŚCI - A.Z.GWARANCJA</TITLE>
</HEAD>
<BODY bgColor=\"white\" leftMargin=\"0\" topMargin=\"0\" marginwidth=\"0\" marginheight=\"0\">
<CENTER>
<TABLE cellSpacing=\"0\" cellPadding=\"0\" width=\"100%\" border=\"0\">
  <TBODY>
  <TR>
    <TD colSpan=\"4\" height=\"5\"></TD></TR>
  <TR>
    <TD align=left width=\"23%\" rowSpan=\"3\" order=\"0\"><IMG height=\"90\" 
      src=\"http://www.azg.pl/logom.jpg\" 
      width=\"181\" border=\"0\"></IMG> </TD>
    <TD align=\"right\" width=\"77%\" colSpan=\"5\" border=\"0\"><SPAN 
      class=\"tytulna\"><B>BIURO NIERUCHOMOŚCI A.Z.GWARANCJA<BR></SPAN></B></TD></TR>
  <TR>
    <TD align=\"right\" width=\"25%\" height=\"5\" border=\"0\"><SPAN 
      class=\"tytul\"><B><U>Siedziba Główna:</U><BR>ul. Szarych Szeregów 34 
      d,<BR>45-285 Opole<BR>tel./fax.(077)402-75-20, <BR></B></SPAN></TD>
    <TD align=\"right\" width=\"1%\" height=\"100%\"><IMG height=\"100%\" 
      src=\"http://www.azg.pl/black.gif\" width=\"1\" 
      border=\"0\"></TD>
    <TD align=\"right\" width=\"25%\" height=\"5\" border=\"0\"><SPAN 
      class=\"tytul\"><B><U>Filia Nr 1:</U><BR>ul. Bytnara Rudego 13,<BR>45-265 
      Opole<BR>tel./fax.(077)458-00-94, <BR></B></SPAN></TD>
    <TD align=\"right\" width=\"1%\" height=\"100%\"><IMG height=\"100%\" 
      src=\"http://www.azg.pl/black.gif\" width=\"1\" 
      border=\"0\"></TD>
    <TD align=\"right\" width=\"25%\" height=\"5\" border=\"0\"><SPAN 
      class=\"tytul\"><B><U>Fillia Nr 2:</U><BR>ul. Sosnkowskiego 40-42,<BR>45-284 
      Opole<BR>tel./fax.(077)457-96-99<BR></B></SPAN></TD></TR>
  <TR>
    <TD align=\"right\" width=\"100%\" colSpan=\"5\" border=\"0\"><SPAN 
      class=tytulna><B>tel.kom.0602-531-334, strona: www.azg.pl, e-mail: 
      azgwarancja@azg.pl </B></SPAN></TD></TR>
  <TR>
    <TD colSpan=\"6\"><IMG height=\"3\" 
      src=\"http://www.azg.pl/black.gif\" 
      width=\"100%\" border=\"0\"></TD></TR></TBODY></TABLE></CENTER><BR>
<CENTER><SPAN class=\"nag2b\"><B>ZAJAZD RESTAURACYJNO - HOTELOWY ROYALBAR NA SPRZEDAŻ</B><BR></SPAN></CENTER>
<CENTER>
<TABLE cellSpacing=\"0\" cellPadding=\"0\" rules=\"groups\" width=\"512\" border=\"1\"
frame=\"above,below,rhs\">
  <TBODY>
  <TR>
    <TD bgColor=\"#5865e5\" colSpan=\"40\" height=\"7\"><SPAN 
      class=\"nag1wb\">&nbsp;Informacje podstawowe</SPAN></TD></TR>
  <TR>
    <TD width=\"127\" height=\"25\">&nbsp;<B>Numer:</B><BR>&nbsp;693</TD>
    <TD width=\"1\" height=\"25\"><IMG height=\"100%\" 
      src=\"http://www.azg.pl/black.gif\" 
      width=\"1\" border=\"0\"></IMG></TD>
    <TD width=\"127\" height=\"25\">&nbsp;<B>Status:</B><BR>&nbsp;aktualna</TD>
    <TD width=\"1\" height=\"25\"><IMG height=\"100%\" 
      src=\"http://www.azg.pl/black.gif\" 
      width=\"1\" border=\"0\"></IMG></TD>
    <TD colSpan=\"20\" height=\"25\">&nbsp;<B>Pośrednik:</B><BR>&nbsp;<A 
      href=\"mailto:azgwarancja@azg.pl\">Andrzej Zapart 
      Licencja:3125</A>&nbsp;<B>Tel.kom.:</B>&nbsp;602531334</TD></TR>
  <TR>
    <TD colSpan=40><IMG height=\"1\" 
      src=\"http://www.azg.pl/black.gif\" 
      width=\"512\" border=\"0\"></IMG></TD></TR>
  <TR>
    <TD width=\"127\" height=\"25\">&nbsp;<B>Lokalizacja:</B><BR>&nbsp;Borki Małe - 6 
      km od Olesna</TD>
    <TD width=\"1\" height=\"25\"><IMG height=\"100%\" 
      src=\"http://www.azg.pl/black.gif\" 
      width=\"1\" border=\"0\"></IMG></TD>
    <TD width=\"127\" height=\"25\">&nbsp;<B>Województwo:</B><BR>&nbsp;opolskie </TD>
    <TD width=\"1\" height=\"25\"><IMG height=\"100%\" 
      src=\"http://www.azg.pl/black.gif\" 
      width=\"1\" border=\"0\"></IMG></TD>
    <TD width=\"127\" height=\"25\">&nbsp;<B>Powiat:</B><BR>&nbsp;oleski </TD>
    <TD width=\"1\" height=\"25\"><IMG height=\"100%\" 
      src=\"http://www.azg.pl/black.gif\" 
      width=\"1\" border=\"0\"></IMG></TD>
    <TD width=\"127\" height=\"25\">&nbsp;<B>Cena:</B><BR>&nbsp;2.900.000 zł.</TD></TR>
  <TR>
    <TD colSpan=\"40\"><IMG height=\"1\"
      src=\"http://www.azg.pl/black.gif\" 
      width=\"100%\" border=\"0\"></IMG></TD></TR>
  <TR>
    <TD width=\"127\" height=\"25\">&nbsp;<B>Pow. użytkowa:</B><BR>&nbsp;2287 m2</TD>
    <TD width=\"1\" height=\"25\"><IMG height=\"100%\" 
      src=\"http://www.azg.pl/black.gif\" 
      width=\"1\" border=\"0\"></IMG></TD>
    <TD width=\"127\" height=\"25\">&nbsp;<B>Pow. działki:</B><BR>&nbsp;34 ar</TD>
    <TD width=\"1\" height=\"25\"><IMG height=\"100%\" 
      src=\"http://www.azg.pl/black.gif\" 
      width=\"1\" border=\"0\"></IMG></TD>
    <TD width=\"127\" height=\"25\">&nbsp;<B>Pow. pom. biurowych:</B><BR>&nbsp;0 
  m2</TD></TR>
  <TR>
    <TD colSpan=\"40\"><IMG height=\"1\" 
      src=\"http://www.azg.pl/black.gif\" 
      width=\"100%\" border=\"0\"></IMG></TD></TR>
  <TR>
    <TD width=\"127\" height=\"25\">&nbsp;<B>Liczba kondygnacji:</B><BR>&nbsp;4</TD>
    <TD width=\"1\" height=\"25\"><IMG height=\"100%\" 
      src=\"http://www.azg.pl/black.gif\" 
      width=\"1\" border=\"0\"></IMG></TD>
    <TD width=\"127\" height=\"25\">&nbsp;<B>Rodzaj rynku:</B><BR>&nbsp;wtórny</TD>
    <TD width=\"1\" height=\"25\"><IMG height=\"100%\" 
      src=\"http://www.azg.pl/black.gif\" 
      width=\"1\" border=\"0\"></IMG></TD></TR>
  <TR>
    <TD colSpan=\"40\"><IMG height=\"1\" 
      src=\"http://www.azg.pl/black.gif\" 
      width=\"100%\" border=\"0\"></IMG></TD></TR>
  <TR>
    <TD width=\"127\" height=\"25\">&nbsp;<B>Czas przekazania:</B><BR>&nbsp;od 
zaraz</TD>
    <TD width=\"1\" height=\"25\"><IMG height=\"100%\" 
      src=\"http://www.azg.pl/black.gif\" 
      width=\"1\" border=\"0\"></IMG></TD>
    <TD width=\"127\" height=\"25\">&nbsp;<B>Księga Wieczysta:</B><BR>&nbsp;jest</TD>
    <TD width=\"1\" height=\"25\"><IMG height=\"100%\" 
      src=\"http://www.azg.pl/black.gif\" 
      width=\"1\" border=\"0\"></IMG></TD>
    <TD width=\"127\" height=\"25\">&nbsp;<B>Stan prawny 
    lokalu:</B><BR>&nbsp;własność</TD></TR>
  <TR>
    <TD colSpan=\"40\"><IMG height=\"1\" 
      src=\"http://www.azg.pl/black.gif\" 
      width=\"100%\" border=\"0\"></IMG></TD></TR>
  <TR>
    <TD width=\"127\" height=\"25\">&nbsp;<B>Stan prawny 
    działki:</B><BR>&nbsp;własność</TD>
    <TD width=\"1\" height=\"25\"><IMG height=\"100%\" 
      src=\"http://www.azg.pl/black.gif\" 
      width=\"1\" border=\"0\"></IMG></TD>
    <TD width=\"127\" height=\"25\">&nbsp;<B>Rodzaj oferty:</B><BR>&nbsp;hotel</TD></TR>
  <TR>
    <TD colSpan=\"40\"><IMG height=\"1\" 
      src=\"http://www.azg.pl/black.gif\" 
      width=\"100%\" border=\"0\"></IMG></TD></TR>
  <TR>
    <TD bgColor=\"#5865e5\" colSpan=\"40\" height=\"7\"><SPAN class=\"nag1wb\">&nbsp;Klipy 
      video</SPAN></TD></TR>
  <TR>
    <TD colSpan=\"40\"><IMG height=\"1\" 
      src=\"http://www.azg.pl/black.gif\" 
      width=\"100%\" border=\"0\"></IMG></TD></TR>
  <TR>
    <TD width=\"127\">
      <CENTER><A href=\"http://www.azg.pl/filmy/27.wmv\"><IMG height=\"42\" 
      src=\"http://www.azg.pl/img/camera2.jpg\" 
      width=\"50\" align=\"left\" border=\"0\"></IMG></A><A 
      href=\"http://www.azg.pl/filmy/27.wmv\">Film nr 27</A></SPAN></CENTER></TD>
    <TD width=\"1\" height=\"100%\"><IMG height=\"100%\" 
      src=\"http://www.azg.pl/black.gif\" 
      width=\"1\" border=\"0\"></IMG></TD>
    <TD width=\"127\">
      <CENTER><A href=\"http://www.azg.pl/filmy/28.wmv\"><IMG height=\"42\" 
      src=\"http://www.azg.pl/img/camera2.jpg\" 
      width=\"50\" align=\"left\" border=\"0\"></IMG></A><A 
      href=\"http://www.azg.pl/filmy/28.wmv\">Film nr 28</A></SPAN></CENTER></TD>
    <TD width=\"1\" height=\"100%\"><IMG height=\"100%\" 
      src=\"http://www.azg.pl/black.gif\" 
      width=\"1\" border=\"0\"></IMG></TD>
    <TD width=\"127\">
      <CENTER><A href=\"http://www.azg.pl/filmy/29.wmv\"><IMG height=\"42\" 
      src=\"http://www.azg.pl/img/camera2.jpg\" 
      width=\"50\" align=\"left\" border=\"0\"></IMG></A><A 
      href=\"http://www.azg.pl/filmy/29.wmv\">Film nr 29</A></SPAN></CENTER></TD></TR>
  <TR>
    <TD colSpan=\"40\"><IMG height=\"1\" 
      src=\"http://www.azg.pl/black.gif\" 
      width=\"100%\" border=\"0\"></IMG></TD></TR>
  <TR>
    <TD bgColor=\"#5865e5\" colSpan=\"40\" height=\"7\"><SPAN class=\"nag1wb\">&nbsp;Zdjęcia 
      oferty</SPAN></TD></TR>
  <TR>
    <TD colSpan=\"40\"><IMG height=\"1\" 
      src=\"http://www.azg.pl/black.gif\" 
      width=\"100%\" border=\"0\"></IMG></TD></TR>
  <TR>
    <TD width=\"127\">
      <CENTER><IMG height=\"100\" alt=\"Zdjęcie nr9312\" 
      src=\"http://www.azg.pl/img/zd9312.jpg\" 
      width=\"125\" border=\"0\"></IMG><BR><SPAN class=\"\">Zdjęcie nr 
      9312</SPAN></CENTER></TD>
    <TD width=\"1\" height=\"100%\"><IMG height=\"100%\" 
      src=\"http://www.azg.pl/black.gif\"
      width=\"1\" border=\"0\"></IMG></TD>
    <TD width=\"127\">
      <CENTER><IMG height=\"100\" alt=\"Zdjęcie nr9313\"
      src=\"http://www.azg.pl/img/zd9313.jpg\" 
      width=\"125\" border=\"0\"></IMG><BR><SPAN class=\"\">Zdjęcie nr 
      9313</SPAN></CENTER></TD>
    <TD width=\"1\" height=\"100%\"><IMG height=\"100%\" 
      src=\"http://www.azg.pl/black.gif\" 
      width=\"1\" border=\"0\"></IMG></TD>
    <TD width=\"127\">
      <CENTER><IMG height=\"100\" alt=\"Zdjęcie nr9314\" 
      src=\"http://www.azg.pl/img/zd9314.jpg\"
      width=\"125\" border=\"0\"></IMG><BR><SPAN class=\"\">Zdjęcie nr 
      9314</SPAN></CENTER></TD>
    <TD width=\"1\" height=\"100%\"><IMG height=\"100%\" 
      src=\"http://www.azg.pl/black.gif\" 
      width=\"1\" border=\"0\"></IMG></TD>
    <TD width=\"127\">
      <CENTER><IMG height=\"100\" alt=\"Zdjęcie nr9315\" 
      src=\"http://www.azg.pl/img/zd9315.jpg\" 
      width=\"125\" border=\"0\"></IMG><BR><SPAN class=\"\">Zdjęcie nr 
      9315</SPAN></CENTER></TD></TR>
  <TR>
    <TD colSpan=40><IMG height=\"1\" 
      src=\"http://www.azg.pl/black.gif\" 
      width=\"100%\" border=\"0\"></IMG></TD></TR>
  <TR>
    <TD bgColor=\"#5865e5\" colSpan=\"40\" height=\"7\"><SPAN class=\"nag1wb\">&nbsp;Zdjęcia 
      oferty</SPAN></TD></TR>
  <TR>
    <TD colSpan=\"40\"><IMG height=\"1\"
      src=\"http://www.azg.pl/black.gif\" 
      width=\"100%\" border=\"0\"></IMG></TD></TR>
  <TR>
    <TD width=\"127\">
      <CENTER><IMG height=\"100\" alt=\"Zdjęcie nr9316\" 
      src=\"http://www.azg.pl/img/zd9316.jpg\" 
      width=\"125\" border=\"0\"></IMG><BR><SPAN class=\"\">Zdjęcie nr 
      9316</SPAN></CENTER></TD>
    <TD width=\"1\" height=\"100%\"><IMG height=\"100%\" 
      src=\"http://www.azg.pl/black.gif\" 
      width=\"1\" border=\"0\"></IMG></TD>
    <TD width=\"127\">
      <CENTER><IMG height=\"100\" alt=\"Zdjęcie nr9317\" 
      src=\"http://www.azg.pl/img/zd9317.jpg\"
      width=\"125\" border=\"0\"></IMG><BR><SPAN class=\"\">Zdjęcie nr 
      9317</SPAN></CENTER></TD>
    <TD width=\"1\" height=\"100%\"><IMG height=\"100%\" 
      src=\"http://www.azg.pl/black.gif\" 
      width=\"1\" border=\"0\"></IMG></TD>
    <TD width=\"127\">
      <CENTER><IMG height=\"100\" alt=\"Zdjęcie nr9318\"
      src=\"http://www.azg.pl/img/zd9318.jpg\" 
      width=\"125\" border=\"0\"></IMG><BR><SPAN class=\"\">Zdjęcie nr 
      9318</SPAN></CENTER></TD>
    <TD width=\"1\" height=\"100%\"><IMG height=\"100%\" 
      src=\"http://www.azg.pl/black.gif\" 
      width=\"1\" border=\"0\"></IMG></TD>
    <TD width=\"127\">
      <CENTER><IMG height=\"100\" alt=\"Zdjęcie nr9319\" 
      src=\"http://www.azg.pl/img/zd9319.jpg\" 
      width=\"125\" border=\"0\"></IMG><BR><SPAN class=\"\">Zdjęcie nr 
      9319</SPAN></CENTER></TD></TR>
  <TR>
    <TD colSpan=\"40\"><IMG height=\"1\" 
      src=\"http://www.azg.pl/black.gif\" 
      width=\"100%\" border=\"0\"></IMG></TD></TR>
  <TR>
    <TD bgColor=\"#5865e5\" colSpan=\"40\" height=\"7\"><SPAN class=\"nag1wb\">&nbsp;Zdjęcia 
      oferty</SPAN></TD></TR>
  <TR>
    <TD colSpan=\"40\"><IMG height=\"1\" 
      src=\"http://www.azg.pl/black.gif\" 
      width=\"100%\" border=\"0\"></IMG></TD></TR>
  <TR>
    <TD width=\"127\">
      <CENTER><IMG height=\"100\" alt=\"Zdjęcie nr9320\" 
      src=\"http://www.azg.pl/img/zd9320.jpg\" 
      width=\"125\" border=\"0\"></IMG><BR><SPAN class=\"\">Zdjęcie nr 
      9320</SPAN></CENTER></TD>
    <TD width=\"1\" height=\"100%\"><IMG height=\"100%\" 
      src=\"http://www.azg.pl/black.gif\" 
      width=\"1\" border=\"0\"></IMG></TD>
    <TD width=\"127\">
      <CENTER><IMG height=\"100\" alt=\"Zdjęcie nr9321\" 
      src=\"http://www.azg.pl/img/zd9321.jpg\" 
      width=\"125\" border=\"0\"></IMG><BR><SPAN class=\"\">Zdjęcie nr 
      9321</SPAN></CENTER></TD>
    <TD width=\"1\" height=\"100%\"><IMG height=\"100%\" 
      src=\"http://www.azg.pl/black.gif\" 
      width=\"1\" border=\"0\"></IMG></TD>
    <TD width=\"127\">
      <CENTER><IMG height=\"100\" alt=\"Zdjęcie nr9322\" 
      src=\"http://www.azg.pl/img/zd9322.jpg\" 
      width=\"125\" border=\"0\"></IMG><BR><SPAN class=\"\">Zdjęcie nr 
      9322</SPAN></CENTER></TD>
    <TD width=\"1\" height=\"100%\"><IMG height=\"100%\" 
      src=\"http://www.azg.pl/black.gif\" 
      width=\"1\" border=\"0\"></IMG></TD>
    <TD width=\"127\">
      <CENTER><IMG height=\"100\" alt=\"Zdjęcie nr9323\" 
      src=\"http://www.azg.pl/img/zd9323.jpg\" 
      width=\"125\" border=\"0\"></IMG><BR><SPAN class=\"\">Zdjęcie nr 
      9323</SPAN></CENTER></TD></TR>
  <TR>
    <TD colSpan=\"40\"><IMG height=\"1\" 
      src=\"http://www.azg.pl/black.gif\" 
      width=\"100%\" border=\"0\"></IMG></TD></TR>
  <TR>
    <TD colSpan=\"40\"><IMG height=\"1\" 
      src=\"http://www.azg.pl/black.gif\" 
      width=\"100%\" border=\"0\"></IMG></TD></TR>
  <TR>
  
    <TD bgColor=\"#5865e5\" colSpan=\"40\" height=\"7\"><SPAN 
      class=\"nag1wb\">&nbsp;Informacje techniczne</SPAN></TD></TR>
  <TR>
    <TD colSpan=\"40\"><IMG height=\"1\" 
      src=\"http://www.azg.pl/black.gif\" 
      width=\"100%\" border=\"0\"></IMG></TD></TR>
  <TR>
    <TD width=\"127\" height=\"25\">&nbsp;<B>Rodzaj budynku:</B><BR>&nbsp;niski 
    budynek</TD>
    <TD width=\"1\" height=\"25\"><IMG height=\"100%\" 
      src=\"http://www.azg.pl/black.gif\" 
      width=\"1\" border=\"0\"></IMG></TD>
    <TD width=\"127\" height=\"25\">&nbsp;<B>Tech. 
    budowlana:</B><BR>&nbsp;tradycyjna</TD>
    <TD width=\"1\" height=\"25\"><IMG height=\"100%\" 
      src=\"http://www.azg.pl/black.gif\" 
      width=\"1\" border=\"0\"></IMG></TD>
    <TD width=\"127\" height=\"25\">&nbsp;<B>Materiał 
    budowlany:</B><BR>&nbsp;ceramika</TD>
    <TD width=\"1\" height=\"25\"><IMG height=\"100%\" 
      src=\"http://www.azg.pl/black.gif\" 
      width=\"1\" border=\"0\"></IMG></TD>
    <TD width=\"127\" height=\"25\">&nbsp;<B>Krycie 
    dachu:</B><BR>&nbsp;blachodachówka</TD></TR>
  <TR>
    <TD colSpan=\"40\"><IMG height=\"1\" 
      src=\"http://www.azg.pl/black.gif\" 
      width=\"100%\" border=\"0\"></IMG></TD></TR>
  <TR>
    <TD width=\"127\" height=\"25\">&nbsp;<B>Rok budowy:</B><BR>&nbsp;2004</TD>
    <TD width=\"1\" height=\"25\"><IMG height=\"100%\" 
      src=\"http://www.azg.pl/black.gif\" 
      width=\"1\" border=\"0\"></IMG></TD>
    <TD width=\"127\" height=\"25\">&nbsp;<B>Wystawka okien:</B><BR>&nbsp;południowy - 
      wschód</TD>
    <TD width=\"1\" height=\"25\"><IMG height=\"100%\" 
      src=\"http://www.azg.pl/black.gif\" 
      width=\"1\" border=\"0\"></IMG></TD>
    <TD width=\"127\" height=\"25\">&nbsp;<B>Okna:</B><BR>&nbsp;nowe PCV</TD></TR>
  <TR>
    <TD colSpan=\"40\"><IMG height=\"1\"
      src=\"http://www.azg.pl/black.gif\" 
      width=\"100%\" border=\"0\"></IMG></TD></TR>
  <TR>
    <TD colSpan=\"40\"><IMG height=\"1\"
      src=\"http://www.azg.pl/black.gif\"
      width=\"100%\" border=\"0\"></IMG></TD></TR>
  <TR>
    <TD bgColor=\"#5865e5\" colSpan=\"40\" height=\"7\"><SPAN 
      class=\"nag1wb\">&nbsp;Działka</SPAN></TD></TR>
  <TR>
    <TD colSpan=\"40\"><IMG height=\"1\"
      src=\"http://www.azg.pl/black.gif\" 
      width=\"100%\" border=\"0\"></IMG></TD></TR>
  <TR>
    <TD width=\"127\" height=\"25\">&nbsp;<B>Kształt 
działki:</B><BR>&nbsp;prostokąt</TD>
    <TD width=\"1\" height=\"25\"><IMG height=\"100%\" 
      src=\"http://www.azg.pl/black.gif\" 
      width=\"1\" border=\"0\"></IMG></TD>
    <TD width=\"127\" height=\"25\">&nbsp;<B>Działka narożna:</B><BR>&nbsp;tak</TD></TR>
  <TR>
    <TD colSpan=\"40\"><IMG height=\"1\" 
      src=\"http://www.azg.pl/black.gif\" 
      width=\"100%\" border=\"0\"></IMG></TD></TR>
  <TR>
    <TD width=\"127\" height=\"25\">&nbsp;<B>Działka ogrodzona:</B><BR>&nbsp;tak</TD>
    <TD width=\"1\" height=\"25\"><IMG height=\"100%\" 
      src=\"http://www.azg.pl/black.gif\" 
      width=\"1\" border=\"0\"></IMG></TD>
    <TD width=\"127\" height=\"25\">&nbsp;<B>Ukształt. pionowe:</B><BR>&nbsp;płaska</TD>
    <TD width=\"1\" height=\"25\"><IMG height=\"100%\" 
      src=\"http://www.azg.pl/black.gif\" 
      width=\"1\" border=\"0\"></IMG></TD>
    <TD colSpan=\"20\" height=\"25\">&nbsp;<B>Zadrzewienie 
      działki:</B><BR>&nbsp;częściowo</TD></TR>
  <TR>
    <TD colSpan=\"40\"><IMG height=\"1\" 
      src=\"http://www.azg.pl/black.gif\" 
      width=\"100%\" border=\"0\"></IMG></TD></TR>
  <TR>
    <TD colSpan=\"40\"><IMG height=\"1\"
      src=\"http://www.azg.pl/black.gif\" 
      width=\"100%\" border=\"0\"></IMG></TD></TR>
  <TR>
    <TD bgColor=\"#5865e5\" colSpan=\"40\" height=\"7\"><SPAN 
      class=\"nag1wb\">&nbsp;Media</SPAN></TD></TR>
  <TR>
    <TD colSpan=\"40\"><IMG height=\"1\"
      src=\"http://www.azg.pl/black.gif\" 
      width=\"100%\" border=\"0\"></IMG></TD></TR>
  <TR>
    <TD width=\"127\" height=\"25\">&nbsp;<B>Ogrzewanie:</B><BR>&nbsp;olejowe</TD>
    <TD width=\"1\" height=\"25\"><IMG height=\"100%\" 
      src=\"http://www.azg.pl/black.gif\" 
      width=\"1\" border=\"0\"></IMG></TD>
    <TD width=\"127\" height=\"25\">&nbsp;<B>Ciepła woda:</B><BR>&nbsp;grzanie 
      słoneczne</TD>
    <TD width=\"1\" height=\"25\"><IMG height=\"100%\" 
      src=\"http://www.azg.pl/black.gif\" 
      width=\"1\" border=\"0\"></IMG></TD>
    <TD width=\"127\" height=\"25\">&nbsp;<B>Siła:</B><BR>&nbsp;tak</TD>
    <TD width=\"1\" height=\"25\"><IMG height=\"100%\" 
      src=\"http://www.azg.pl/black.gif\" 
      width=\"1\" border=\"0\"></IMG></TD></TR>
  <TR>
    <TD colSpan=\"40\"><IMG height=\"1\" 
      src=\"http://www.azg.pl/black.gif\" 
      width=\"100%\" border=\"0\"></IMG></TD></TR>
  <TR>
    <TD width=\"127\" height=\"25\">&nbsp;<B>Woda:</B><BR>&nbsp;tak</TD>
    <TD width=\"1\" height=\"25\"><IMG height=\"100%\" 
      src=\"http://www.azg.pl/black.gif\" 
      width=\"1\" border=\"0\"></IMG></TD>
    <TD width=\"127\" height=\"25\">&nbsp;<B>Kanalizacja:</B><BR>&nbsp;miejska</TD>
    <TD width=\"1\" height=\"25\"><IMG height=\"100%\" 
      src=\"http://www.azg.pl/black.gif\" 
      width=\"1\" border=\"0\"></IMG></TD>
    <TD width=\"127\" height=\"25\">&nbsp;<B>Telefon:</B><BR>&nbsp;tak</TD></TR>
  <TR>
    <TD colSpan=\"40\"><IMG height=\"1\" 
      src=\"http://www.azg.pl/black.gif\" 
      width=\"100%\" border=\"0\"></IMG></TD></TR>
  <TR>
    <TD width=\"127\" height=\"25\">&nbsp;<B>Antena:</B><BR>&nbsp;tak</TD>
    <TD width=\"1\" height=\"25\"><IMG height=\"100%\" 
      src=\"http://www.azg.pl/black.gif\" 
      width=\"1\" border=\"0\"></IMG></TD>
    <TD colSpan=\"20\" height=\"25\">&nbsp;<B>Sieć internetowa:</B><BR>&nbsp;tak</TD></TR>
  <TR>
    <TD colSpan=\"40\"><IMG height=\"1\" 
      src=\"http://www.azg.pl/black.gif\" 
      width=\"100%\" border=\"0\"></IMG></TD></TR>
  <TR>
    <TD colSpan=\"40\"><IMG height=\"1\" 
      src=\"http://www.azg.pl/black.gif\" 
      width=\"100%\" border=\"0\"></IMG></TD></TR>
  <TR>
    <TD bgColor=\"#5865e5\" colSpan=\"40\" height=\"7\"><SPAN 
      class=\"nag1wb\">&nbsp;Zabezpieczenia</SPAN></TD></TR>
  <TR>
    <TD colSpan=\"40\"><IMG height=\"1\" 
      src=\"http://www.azg.pl/black.gif\" 
      width=\"100%\" border=\"0\"></IMG></TD></TR>
  <TR>
    <TD width=\"127\" height=\"25\">&nbsp;<B>Domofon:</B><BR>&nbsp;tak</TD>
    <TD width=\"1\" height=\"25\"><IMG height=\"100%\" 
      src=\"http://www.azg.pl/black.gif\" 
      width=\"1\" border=\"0\"></IMG></TD></TR>
  <TR>
    <TD colSpan=\"40\"><IMG height=\"1\" 
      src=\"http://www.azg.pl/black.gif\" 
      width=\"100%\" border=\"0\"></IMG></TD></TR>
  <TR>
    <TD width=\"127\" height=\"25\">&nbsp;<B>Alarm:</B><BR>&nbsp;tak</TD>
    <TD width=\"1\" height=\"25\"><IMG height=\"100%\" 
      src=\"http://www.azg.pl/black.gif\" 
      width=\"1\" border=\"0\"></IMG></TD></TR>
  <TR>
    <TD colSpan=\"40\"><IMG height=\"1\" 
      src=\"http://www.azg.pl/black.gif\" 
      width=\"100%\" border=\"0\"></IMG></TD></TR>
  <TR>
    <TD colSpan=\"20\" height=\"25\">&nbsp;<B>Recepcja:</B><BR>&nbsp;tak</TD></TR>
  <TR>
    <TD colSpan=\"40\"><IMG height=\"1\" 
      src=\"http://www.azg.pl/black.gif\" 
      width=\"100%\" border=\"0\"></IMG></TD></TR>
  <TR>
    <TD colSpan=\"40\"><IMG height=\"1\" 
      src=\"http://www.azg.pl/black.gif\" 
      width=\"100%\" border=\"0\"></IMG></TD></TR>
  <TR>
    <TD bgColor=\"#5865e5\" colSpan=\"40\" height=\"7\"><SPAN 
      class=\"nag1wb\">&nbsp;Udogodnienia</SPAN></TD></TR>
  <TR>
    <TD colSpan=\"40\"><IMG height=\"1\" 
      src=\"http://www.azg.pl/black.gif\" 
      width=\"100%\" border=\"0\"></IMG></TD></TR>
  <TR>
    <TD width=\"127\" height=\"25\">&nbsp;<B>Klimatyzacja:</B><BR>&nbsp;tak</TD>
    <TD width=\"1\" height=\"25\"><IMG height=\"100%\" 
      src=\"http://www.azg.pl/black.gif\" 
      width=\"1\" border=\"0\"></IMG></TD>
    <TD width=\"127\" height=\"25\">&nbsp;<B>Piwnica:</B><BR>&nbsp;tak</TD>
    <TD width=\"1\" height=\"25\"><IMG height=\"100%\" 
      src=\"http://www.azg.pl/black.gif\" 
      width=\"1\" border=\"0\"></IMG></TD></TR>
  <TR>
    <TD colSpan=\"40\"><IMG height=\"1\" 
      src=\"http://www.azg.pl/black.gif\" 
      width=\"100%\"border=\"0\"></IMG></TD></TR>
  <TR>
    <TD width=\"127\" height=\"25\">&nbsp;<B>Miejsca parkingowe:</B><BR>&nbsp;tak</TD>
    <TD width=\"1\" height=\"25\"><IMG height=\"100%\" 
      src=\"http://www.azg.pl/black.gif\" 
      width=\"1\" border=\"0\"></IMG></TD>
    <TD width=\"127\" height=\"25\">&nbsp;<B>Udog. dla 
niepełnosp.:</B><BR>&nbsp;tak</TD>
    <TD width=\"1\" height=\"25\"><IMG height=\"100%\" 
      src=\"http://www.azg.pl/black.gif\" 
      width=\"1\" border=\"0\"></IMG></TD></TR>
  <TR>
    <TD colSpan=\"40\"><IMG height=\"1\" 
      src=\"http://www.azg.pl/black.gif\" 
      width=\"100%\" border=\"0\"></IMG></TD></TR>
  <TR>
    <TD width=\"127\" height=\"25\">&nbsp;<B>Restauracja:</B><BR>&nbsp;tak</TD>
    <TD width=\"1\" height=\"25\"><IMG height=\"100%\"
      src=\"http://www.azg.pl/black.gif\" 
      width=\"1\" border=\"0\"></IMG></TD></TR>
  <TR>
    <TD colSpan=\"40\"><IMG height=\"1\" 
      src=\"http://www.azg.pl/black.gif\" 
      width=\"100%\" border=\"0\"></IMG></TD></TR>
  <TR>
    <TD colSpan=\"40\"><IMG height=\"1\"
      src=\"http://www.azg.pl/black.gif\" 
      width=\"100%\" border=\"0\"></IMG></TD></TR>
  <TR>
    <TD bgColor=\"#5865e5\" colSpan=\"40\" height=\"7\"><SPAN 
      class=\"nag1wb\">&nbsp;Usytuowanie</SPAN></TD></TR>
  <TR>
    <TD colSpan=\"40\"><IMG height=\"1\" 
      src=\"http://www.azg.pl/black.gif\" 
      width=\"100%\" border=\"0\"></IMG></TD></TR>
  <TR>
    <TD width=\"127\" height=\"25\">&nbsp;<B>Typ ulicy/drogi:</B><BR>&nbsp;ruchliwa</TD>
    <TD width=\"1\" height=\"25\"><IMG height=\"100%\" 
      src=\"http://www.azg.pl/black.gif\" 
      width=\"1\" border=\"0\"></IMG></TD>
    <TD width=\"127\" height=\"25\">&nbsp;<B>Nawierzchnia 
    drogi:</B><BR>&nbsp;asfaltowa</TD>
    <TD width=\"1\" height=\"25\"><IMG height=\"100%\" 
      src=\"http://www.azg.pl/black.gif\" 
      width=\"1\" border=\"0\"></IMG></TD>
    <TD width=\"127\" height=\"25\">&nbsp;<B>Komunikacja:</B><BR>&nbsp;PKS</TD>
    <TD width=\"1\" height=\"25\"><IMG height=\"100%\" 
      src=\"http://www.azg.pl/black.gif\" 
      width=\"1\" border=\"0\"></IMG></TD></TR>
  <TR>
    <TD colSpan=\"40\"><IMG height=\"1\" 
      src=\"http://www.azg.pl/black.gif\" 
      width=\"100%\" border=\"0\"></IMG></TD></TR>
  <TR>
    <TD colSpan=\"40\"><IMG height=\"1\" 
      src=\"http://www.azg.pl/black.gif\" 
      width=\"100%\" border=\"0\"></IMG></TD></TR>
  <TR>
    <TD bgColor=\"#5865e5\" colSpan=\"40\" height=\"7\"><SPAN 
      class=\"nag1wb\">&nbsp;Okolice</SPAN></TD></TR>
  <TR>
    <TD colSpan=\"40\"><IMG height=\"1\" 
      src=\"http://www.azg.pl/black.gif\" 
      width=\"100%\" border=\"0\"></IMG></TD></TR>
  <TR>
    <TD width=\"127\" height=\"25\">&nbsp;<B>Las w pobliżu:</B><BR>&nbsp;tak</TD>
    <TD width=\"1\" height=\"25\"><IMG height=\"100%\" 
      src=\"http://www.azg.pl/black.gif\" 
      width=\"1\" border=\"0\"></IMG></TD>
    <TD width=\"127\" height=\"25\">&nbsp;<B>Jezioro w pobliżu:</B><BR>&nbsp;tak</TD></TR>
  <TR>
    <TD colSpan=\"40\"><IMG height=\"1\" 
      src=\"http://www.azg.pl/black.gif\" 
      width=\"100%\" border=\"0\"></IMG></TD></TR>
  <TR>
    <TD width=\"127\" height=\"25\">&nbsp;<B>Staw w pobliżu:</B><BR>&nbsp;tak</TD>
    <TD width=\"1\" height=\"25\"><IMG height=\"100%\" 
      src=\"http://www.azg.pl/black.gif\" 
      width=\"1\" border=\"0\"></IMG></TD></TR>
  <TR>
    <TD colSpan=\"40\"><IMG height=\"1\" 
      src=\"http://www.azg.pl/black.gif\" 
      width=\"100%\" border=\"0\"></IMG></TD></TR>
  <TR>
    <TD colSpan=\"40\"><IMG height=\"1\" 
      src=\"http://www.azg.pl/black.gif\" 
      width=\"100%\" border=\"0\"></IMG></TD></TR>
  <TR>
    <TD bgColor=\"#5865e5\" colSpan=\"40\" height=\"7\"><SPAN 
      class=\"nag1wb\">&nbsp;Informacje dodatkowe</SPAN></TD></TR>
  <TR>
    <TD colSpan=\"40\"><IMG height=\"1\" 
      src=\"http://www.azg.pl/black.gif\"
      width=\"100%\" border=\"0\"></IMG></TD></TR>
  <TR>
    <TD width=\"127\" height=\"25\">&nbsp;<B>Standard:</B><BR>&nbsp;wysoki</TD>
    <TD width=\"1\" height=\"25\"><IMG height=\"100%\" 
      src=\"http://www.azg.pl/black.gif\" 
      width=\"1\" border=\"0\"></IMG></TD>
    <TD width=\"127\" height=\"25\">&nbsp;<B>Stan:</B><BR>&nbsp;bardzo dobry</TD>
    <TD width=\"1\" height=\"25\"><IMG height=\"100%\" 
      src=\"http://www.azg.pl/black.gif\" 
      width=\"1\" border=\"0\"></IMG></TD></TR>
  <TR>
    <TD colSpan=\"40\"><IMG height=\"1\" 
      src=\"http://www.azg.pl/black.gif\" 
      width=\"100%\" border=\"0\"></IMG></TD></TR>
  <TR>
    <TD colSpan=\"20\" height=\"25\">&nbsp;<B>Dodatkowy opis:</B><BR>&nbsp;
      <TABLE cellSpacing=\"0\" cellPadding=\"0\" width=\"100%\" border=\"0\">
        <TBODY>
        <TR>
          <TD colSpan=\"40\"><IMG height=\"1\" 
            src=\"http://www.azg.pl/black.gif\" 
            width=\"100%\" border=\"0\"></IMG></TD></TR>
        <TR>
          <TD width=\"127\">
            <CENTER><A href=\"http://www.azg.pl/filmy/30.wmv\"><IMG height=\"42\" 
            src=\"http://www.azg.pl/img/camera2.jpg\"
            width=\"50\" align=\"left\" border=\"0\"></IMG></A><A 
            href=\"http://www.azg.pl/filmy/30.wmv\">Film nr 30</A></CENTER></TD>
          <TD width=\"1\" height=\"100%\"><IMG height=\"100%\" 
            src=\"http://www.azg.pl/black.gif\" 
            width=\"1\" border=\"0\"></IMG></TD>
          <TD width=\"127\">
            <CENTER><A href=\"http://www.azg.pl/filmy/31.wmv\"><IMG height=\"42\" 
            src=\"http://www.azg.pl/img/camera2.jpg\" 
            width=\"50\" align=\"left\" border=\"0\"></IMG></A><A 
            href=\"http://www.azg.pl/filmy/31.wmv\">Film nr 31</A></CENTER></TD>
          <TD width=\"1\" height=\"100%\"><IMG height=\"100%\" 
            src=\"http://www.azg.pl/black.gif\" 
            width=\"1\" border=\"0\"></IMG></TD></TR>
        <TR>
          <TD colSpan=\"40\"><IMG height=\"1\" 
            src=\"http://www.azg.pl/black.gif\" 
            width=\"100%\" border=\"0\"></IMG></TD></TR>
        <TR>
          <TD width=\"125\">
            <CENTER><IMG height=\"100\" alt=\"Zdjęcie\" 
            src=\"http://www.azg.pl/img/zd9324.jpg\" 
            width=\"125\" border=\"0\"></IMG><BR>Zdjęcie nr 
          zd9324</CENTER></TD>
          <TD width=\"1\" height=\"100%\"><IMG height=\"100%\" 
            src=\"http://www.azg.pl/black.gif\" 
            width=\"1\" border=\"0\"></IMG></TD>
          <TD width=\"125\">
            <CENTER><IMG height=\"100\" alt=\"Zdjęcie\" 
            src=\"http://www.azg.pl/img/zd9325.jpg\"
            width=\"125\" border=\"0\"></IMG><BR>Zdjęcie nr 
          zd9325</CENTER></TD>
          <TD width=\"1\" height=\"100%\"><IMG height=\"100%\" 
            src=\"http://www.azg.pl/black.gif\" 
            width=\"1\" border=\"0\"></IMG></TD>
          <TD width=\"125\">
            <CENTER><IMG height=\"100\" alt=\"Zdjęcie\" 
            src=\"http://www.azg.pl/img/zd9326.jpg\" 
            width=\"125\" border=\"0\"></IMG><BR>Zdjęcie nr 
          zd9326</CENTER></TD>
          <TD width=\"1\" height=\"100%\"><IMG height=\"100%\" 
            src=\"http://www.azg.pl/black.gif\" 
            width=\"1\" border=\"0\"></IMG></TD>
          <TD width=\"125\">
            <CENTER><IMG height=\"100\" alt=\"Zdjęcie\" 
            src=\"http://www.azg.pl/img/zd9327.jpg\" 
            width=\"125\" border=\"0\"></IMG><BR>Zdjęcie nr 
          zd9327</CENTER></TD></TR>
          tutaj
        <TR>
          <TD colSpan=\"40\"><IMG height=\"1\" 
            src=\"http://www.azg.pl/black.gif\" 
            width=\"100%\" border=\"0\"></IMG></TD></TR>
        <TR>
          <TD width=\"125\">
            <CENTER><IMG height=\"100\" alt=\"Zdjęcie\" 
            src=\"http://www.azg.pl/img/zd9328.jpg\" 
            width=\"125\" border=\"0\"></IMG><BR>Zdjęcie nr 
          zd9328</CENTER></TD>
          <TD width=\"1\" height=\"100%\"><IMG height=\"100%\" 
            src=\"http://www.azg.pl/black.gif\" 
            width=\"1\" border=\"0\"></IMG></TD>
          <TD width=\"125\">
            <CENTER><IMG height=\"100\" alt=\"Zdjęcie\" 
            src=\"http://www.azg.pl/img/zd9329.jpg\" 
            width=\"125\" border=\"0\"></IMG><BR>Zdjęcie nr 
          zd9329</CENTER></TD>
          <TD width=\"1\" height=\"100%\"><IMG height=\"100%\"
            src=\"http://www.azg.pl/black.gif\" 
            width=\"1\" border=\"0\"></IMG></TD>
          <TD width=\"125\">
            <CENTER><IMG height=\"100\" alt=\"Zdjęcie\" 
            src=\"http://www.azg.pl/img/zd9330.jpg\" 
            width=\"125\" border=\"0\"></IMG><BR>Zdjęcie nr 
          zd9330</CENTER></TD>
          <TD width=\"1\" height=\"100%\"><IMG height=\"100%\" 
            src=\"http://www.azg.pl/black.gif\" 
            width=\"1\" border=\"0\"></IMG></TD>
          <TD width=\"125\">
            <CENTER><IMG height=\"100\" alt=\"Zdjęcie\" 
            src=\"http://www.azg.pl/img/zd9331.jpg\" 
            width=\"125\" border=\"0\"></IMG><BR>Zdjęcie nr 
          zd9331</CENTER></TD></TR>
        <TR>
          <TD colSpan=\"40\"><IMG height=\"1\" 
            src=\"http://www.azg.pl/black.gif\" 
            width=\"100%\" border=\"0\"></IMG></TD></TR>
        <TR>
          <TD width=\"125\">
            <CENTER><IMG height=\"100\" alt=\"Zdjęcie\" 
            src=\"http://www.azg.pl/img/zd9332.jpg\" 
            width=\"125\" border=\"0\"></IMG><BR>Zdjęcie nr 
          zd9332</CENTER></TD>
          <TD width=\"1\" height=\"100%\"><IMG height=\"100%\" 
            src=\"http://www.azg.pl/black.gif\" 
            width=\"1\" border=\"0\"></IMG></TD>
          <TD width=\"125\">
            <CENTER><IMG height=\"100\" alt=\"Zdjęcie\" 
            src=\"http://www.azg.pl/img/zd9333.jpg\" 
            width=\"125\" border=\"0\"></IMG><BR>Zdjęcie nr 
          zd9333</CENTER></TD>
          <TD width=\"1\" height=\"100%\"><IMG height=\"100%\" 
            src=\"http://www.azg.pl/black.gif\" 
            width=\"1\" border=\"0\"></IMG></TD>
          <TD width=\"125\">
            <CENTER><IMG height=\"100\" alt=\"Zdjęcie\" 
            src=\"http://www.azg.pl/img/zd9334.jpg\" 
            width=\"125\" border=\"0\"></IMG><BR>Zdjęcie nr 
          zd9334</CENTER></TD>
          <TD width=\"1\" height=\"100%\"><IMG height=\"100%\" 
            src=\"http://www.azg.pl/black.gif\" 
            width=\"1\" border=\"0\"></IMG></TD>
          <TD width=\"125\">
            <CENTER><IMG height=\"100\" alt=\"Zdjęcie\" 
            src=\"http://www.azg.pl/img/zd9335.jpg\" 
            width=\"125\" border=\"0\"></IMG><BR>Zdjęcie nr 
          zd9335</CENTER></TD></TR>
        <TR>
          <TD colSpan=\"40\"><IMG height=\"1\" 
            src=\"http://www.azg.pl/black.gif\" 
            width=\"100%\" border=\"0\"></IMG></TD></TR></TBODY></TABLE><BR><center><b>OFERTA BEZPOŚREDNIA - KUPUJĄCY NIE PŁACI PROWIZJI</b></center><br>
Zajazd Restauracyjno - Hotelowy ROYALBAR - Obiekt przeznaczony dla potrzeb 
      przejeżdżających 50 osobowych wycieczek, idealnie nadający się na ośrodek 
      turystyczny, pensjonat, miejsce organizacji szkoleń i konferencji. Obiekt 
      składa się z dwóch skrzydeł. W skrzydle prawym mieści się cześć hotelowa 
      dla 50 gości oraz część mieszkalna dla dyrekcji (14 pokoi dwuosobowych + 2 
      duże apartamenty + 1 apartament prywatny) (pokoje podłogi panele, ścany i 
      sufity w pokojach gładzie, każdy pokój hotelowy wyposażony jest w łazienkę 
      z kabiną prysznicową + ubikacja). Skrzydło lewe stanowi usługi dla gości 
      hotelowych. Na poziomie przyziemia znajduje się kręgielnia z dwoma torami 
      oraz sala dyskotekowa wraz z barem do obsługi grających i uczestników 
      dyskoteki. Na pierwszym piętrze znajduje się restauracja do obsługi gości 
      hotelowych. W zachodniej części lewego skrzydła znajduje się zaplecze 
      restauracyjne, pomieszczenia magazynowe oraz pomieszczenia socjalne dla 
      obsługi restauracji. Zestawienie powerzchni według kondygnacji: Piwnica - 
      285 m2, Parter - 632 m2, I Piętro - 618,76 m2, II Piętro - 443,26 m2, 
      Poddasze - 305,66 m2. W restauracji pracuje na stałe jedna kucharka i dwie 
      pomoce kuchenne, oraz dwóch kelnerów obsługujących również bar. Do części 
      hotelowej zatrudnione są dwie recepcjonistki, pokojówka i sprzątaczka. 
      Isntieje możliwość przejęcia całego personelu wraz z właścicielem który 
      może prowadzić nadal cały obiekt. Cicha i spokojna lokalizacja W pobliżu 
      znajduje się mini zoo , stadnina koni, wypożyczalnia quadów. CENA DO 
      NEGOCJACJI.</TD></TR>
  <TR>
    <TD colSpan=\"40\"><IMG height=\"1\" 
      src=\"http://www.azg.pl/black.gif\" 
      width=\"100%\" border=\"0\"></IMG></TD>
  </TR>
   </TBODY>
  </TABLE>
  </CENTER>
  <br>
<A href=\"http://www.azg.pl/index.php?action=sprzedazozd&nu=84\">LINK DO OFERTY NA STRONIE BIURA.</A>
<br><br>
<center>
Zgodnie z ustawą z dnia 18 lipca 2002 r. o świadczeniu usług drogą elektroniczną ( Dz.U.Nr 144, poz.1204) jeśli nie wyrażają Państwo zgody na otrzymanie naszych informacji oraz ofert nieruchomości prosimy odesłać e-mail wpisując słowo NIE w temacie odsyłanego e-maila. Dziękujemy.
</center>
</BODY></HTML>";


$sqlk = "SELECT email FROM posrednicy;";
	
	$resultkm = @pg_Exec($conn, $sqlk);
	$rowskm = pg_NumRows($resultkm);
	
	for ($j=0; $j < $rowskm; $j++) {
	
	$emailkm = pg_result($resultkm, $j, "email");
	
	$toemail = "biuro2@azg.pl; informatyk@azg.pl";
	
	mail($toemail,$subjectte,$trescte,$headers);
	
	
	}



?>


