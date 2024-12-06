<HEAD>
<META http-equiv=Content-Type content="text/html; charset=iso-8859-2"><LINK 
href="azgf.css" type=text/css rel=stylesheet>
</HEAD>

<?

include "../concfg.inc";

if ($st == 'dodzdjecia') { 

	echo "<span class = \"na1\">";
	echo "<center>";
	echo "<br>";	
	echo "Dodanie Zdjęcia";
	echo "</center>";
	echo "</span>";
echo "<br>";

$dir = "../img/"; 
$dh  = opendir($dir); 
while (false !== ($filename = readdir($dh))) { 
   $wynik1 = str_replace("[a-z]", "", $filename);
   $wynik2 = str_replace("_b.jpg", "", $wynik1);
   $wynik3 = str_replace(".jpg", "", $wynik2);
   $wynik4 = str_replace("zdl", "", $wynik3);
   $wynik5 = str_replace("zd", "", $wynik4);
   $wynik6 = str_replace("z", "", $wynik5);
   $wynik7 = str_replace("wa", "", $wynik6);
   $wynik8 = str_replace("ubepiecenie", "", $wynik7);
   $wynik9 = str_replace("teksti.gif", "", $wynik8);
   $wynik10 = str_replace("tc.gif", "", $wynik9);
   $wynik11 = str_replace("swiadectwo", "", $wynik10);
   $wynik12 = str_replace("red.gif", "", $wynik11);
   $wynik13 = str_replace("pte", "", $wynik12);
   $wynik14 = str_replace("printer.gif", "", $wynik13);
   $wynik15 = str_replace("prev_year.gif", "", $wynik14);
   $wynik16 = str_replace("prev.gif", "", $wynik15);
   $wynik17 = str_replace("pixel.gif", "", $wynik16);
   $wynik18 = str_replace("pfrns", "", $wynik17);
   $wynik19 = str_replace("pfrn", "", $wynik18);
   $wynik20 = str_replace("ospprn", "", $wynik19);
   $wynik21 = str_replace("next_year.gif", "", $wynik20);
   $wynik22 = str_replace("mapa_s", "", $wynik21);
   $wynik23 = str_replace("mapa", "", $wynik22);
   $wynik24 = str_replace("logo.gif", "", $wynik23);
   $wynik25 = str_replace("licenida", "", $wynik24);
   $wynik26 = str_replace("licenandy", "", $wynik25);
   $wynik27 = str_replace("kongres", "", $wynik26);
   $wynik28 = str_replace("kongr", "", $wynik27);
   $wynik29 = str_replace("fotow.gif", "", $wynik28);
   $wynik30 = str_replace("fotor.gif", "", $wynik29);
   $wynik31 = str_replace("fotog.gif", "", $wynik30);
   $wynik32 = str_replace("fotob.gif", "", $wynik31);
   $wynik33 = str_replace("ean4", "", $wynik32);
   $wynik34 = str_replace("ean3", "", $wynik33);
   $wynik35 = str_replace("ean2", "", $wynik34);
   $wynik36 = str_replace("ean1", "", $wynik35);
   $wynik37 = str_replace("ean0", "", $wynik36);
   $wynik38 = str_replace("dypun", "", $wynik37);
   $wynik39 = str_replace("certhom", "", $wynik38);
   $wynik40 = str_replace("ceosp", "", $wynik39);
   $wynik41 = str_replace("camera2", "", $wynik40);
   $wynik42 = str_replace("cal.gif", "", $wynik41);
   $wynik43 = str_replace("bud4", "", $wynik42);
   $wynik44 = str_replace("bud3", "", $wynik43);
   $wynik45 = str_replace("bud2", "", $wynik44);
   $wynik46 = str_replace("bud1", "", $wynik45);
   $wynik46 = str_replace("bud1", "", $wynik45);
   $wynik47 = str_replace("black.gif", "", $wynik46);
   $wynik48 = str_replace("biur4", "", $wynik47);
   $wynik49 = str_replace("biur3", "", $wynik48);
   $wynik50 = str_replace("biur2", "", $wynik49);
   $wynik51 = str_replace("biur1", "", $wynik50);
   $wynik52 = str_replace("8r", "", $wynik51);
   $wynik53 = str_replace("7r", "", $wynik52);
   $wynik54 = str_replace("6r", "", $wynik53);
   $wynik55 = str_replace("5r", "", $wynik54);
   $wynik56 = str_replace("next.gif", "", $wynik55);
   $wynik57 = str_replace("3r", "", $wynik56);
   $wynik58 = str_replace("4r", "", $wynik57);
   $wynik59 = str_replace("2r", "", $wynik58);
   $wynik60 = str_replace("1r", "", $wynik59);
   
     
   $ini = $wynik60;
   $files[] = $ini; 
} 

sort($files);
$rety = max($files);

echo "Ostatnio nazwany plik: ";
echo $rety; 
$retyn = $rety + 1;
echo ".  Twój następny plik to: "; 
echo $retyn;

echo "<br>
<center>
<table align=\"center\">
  <tr>
    <td>
      <div align=\"center\">
        
                     <td>
                    <form method=\"post\" enctype=\"multipart/form-data\">
                      <table width=\"100%\" cellspacing=\"2\" cellpadding=\"2\">
                        
                        <tr> 
                          <td width=\"80\">Plik 1: </td>
                          <td> 
                            <input type=\"file\" name=\"bilde_fil1\">
                            <input type=\"hidden\" name=\"folder1\" value=\"../img/\">
                          </td>
                        
                          <td width=\"80\">Nazwa pliku 1:</td>
                          <td> 
                            <input type=\"text\" name=\"nyttnavn1\">
                           <input type=\"hidden\" name=\"ending1\" value=\".jpg\">
                            </td>
                        </tr>
                        
                        <tr> 
                          <td width=\"80\">Plik 2: </td>
                          <td> 
                            <input type=\"file\" name=\"bilde_fil2\">
                            <input type=\"hidden\" name=\"folder2\" value=\"../img/\">
                          </td>
                        
                          <td width=\"80\">Nazwa pliku 2:</td>
                          <td> 
                            <input type=\"text\" name=\"nyttnavn2\">
                           <input type=\"hidden\" name=\"ending2\" value=\".jpg\">
                            </td>
                        </tr>
                        
                        <tr> 
                          <td width=\"80\">Plik 3: </td>
                          <td> 
                            <input type=\"file\" name=\"bilde_fil3\">
                            <input type=\"hidden\" name=\"folder3\" value=\"../img/\">
                          </td>
                        
                          <td width=\"80\">Nazwa pliku 3:</td>
                          <td> 
                            <input type=\"text\" name=\"nyttnavn3\">
                           <input type=\"hidden\" name=\"ending3\" value=\".jpg\">
                            </td>
                        </tr>

                        <tr> 
                          <td width=\"80\">Plik 4: </td>
                          <td> 
                            <input type=\"file\" name=\"bilde_fil4\">
                            <input type=\"hidden\" name=\"folder4\" value=\"../img/\">
                          </td>
                        
                          <td width=\"80\">Nazwa pliku 4:</td>
                          <td> 
                            <input type=\"text\" name=\"nyttnavn4\">
                           <input type=\"hidden\" name=\"ending4\" value=\".jpg\">
                            </td>
                        </tr>                        

                        <tr> 
                          <td width=\"80\">Plik 5: </td>
                          <td> 
                            <input type=\"file\" name=\"bilde_fil5\">
                            <input type=\"hidden\" name=\"folder5\" value=\"../img/\">
                          </td>
                        
                          <td width=\"80\">Nazwa pliku 5:</td>
                          <td> 
                            <input type=\"text\" name=\"nyttnavn5\">
                           <input type=\"hidden\" name=\"ending5\" value=\".jpg\">
                            </td>
                        </tr>

                        <tr> 
                          <td width=\"80\">Plik 6: </td>
                          <td> 
                            <input type=\"file\" name=\"bilde_fil6\">
                            <input type=\"hidden\" name=\"folder6\" value=\"../img/\">
                          </td>
                        
                          <td width=\"80\">Nazwa pliku 6:</td>
                          <td> 
                            <input type=\"text\" name=\"nyttnavn6\">
                           <input type=\"hidden\" name=\"ending6\" value=\".jpg\">
                            </td>
                        </tr>

                        <tr> 
                          <td width=\"80\">Plik 7: </td>
                          <td> 
                            <input type=\"file\" name=\"bilde_fil7\">
                            <input type=\"hidden\" name=\"folder7\" value=\"../img/\">
                          </td>
                        
                          <td width=\"80\">Nazwa pliku 7:</td>
                          <td> 
                            <input type=\"text\" name=\"nyttnavn7\">
                           <input type=\"hidden\" name=\"ending7\" value=\".jpg\">
                            </td>
                        </tr>

                        <tr> 
                          <td width=\"80\">Plik 8: </td>
                          <td> 
                            <input type=\"file\" name=\"bilde_fil8\">
                            <input type=\"hidden\" name=\"folder8\" value=\"../img/\">
                          </td>
                        
                          <td width=\"80\">Nazwa pliku 8:</td>
                          <td> 
                            <input type=\"text\" name=\"nyttnavn8\">
                           <input type=\"hidden\" name=\"ending8\" value=\".jpg\">
                            </td>
                        </tr>

                        <tr> 
                          <td width=\"80\">Plik 9: </td>
                          <td> 
                            <input type=\"file\" name=\"bilde_fil9\">
                            <input type=\"hidden\" name=\"folder9\" value=\"../img/\">
                          </td>
                        
                          <td width=\"80\">Nazwa pliku 9:</td>
                          <td> 
                            <input type=\"text\" name=\"nyttnavn9\">
                           <input type=\"hidden\" name=\"ending9\" value=\".jpg\">
                            </td>
                        </tr>

                        <tr> 
                          <td width=\"80\">Plik 10: </td>
                          <td> 
                            <input type=\"file\" name=\"bilde_fil10\">
                            <input type=\"hidden\" name=\"folder10\" value=\"../img/\">
                          </td>
                        
                          <td width=\"80\">Nazwa pliku 10:</td>
                          <td> 
                            <input type=\"text\" name=\"nyttnavn10\">
                           <input type=\"hidden\" name=\"ending10\" value=\".jpg\">
                            </td>
                        </tr>

                        <tr> 
                          <td width=\"80\">Plik 11: </td>
                          <td> 
                            <input type=\"file\" name=\"bilde_fil11\">
                            <input type=\"hidden\" name=\"folder11\" value=\"../img/\">
                          </td>
                        
                          <td width=\"80\">Nazwa pliku 11:</td>
                          <td> 
                            <input type=\"text\" name=\"nyttnavn11\">
                           <input type=\"hidden\" name=\"ending11\" value=\".jpg\">
                            </td>
                        </tr>

                        <tr> 
                          <td width=\"80\">Plik 12: </td>
                          <td> 
                            <input type=\"file\" name=\"bilde_fil12\">
                            <input type=\"hidden\" name=\"folder12\" value=\"../img/\">
                          </td>
                        
                          <td width=\"80\">Nazwa pliku 12:</td>
                          <td> 
                            <input type=\"text\" name=\"nyttnavn12\">
                           <input type=\"hidden\" name=\"ending12\" value=\".jpg\">
                            </td>
                        </tr>

                        <tr> 
                          <td width=\"80\">Plik 13: </td>
                          <td> 
                            <input type=\"file\" name=\"bilde_fil13\">
                            <input type=\"hidden\" name=\"folder13\" value=\"../img/\">
                          </td>
                        
                          <td width=\"80\">Nazwa pliku 13:</td>
                          <td> 
                            <input type=\"text\" name=\"nyttnavn13\">
                           <input type=\"hidden\" name=\"ending13\" value=\".jpg\">
                            </td>
                        </tr>

                        <tr> 
                          <td width=\"80\">Plik 14: </td>
                          <td> 
                            <input type=\"file\" name=\"bilde_fil14\">
                            <input type=\"hidden\" name=\"folder14\" value=\"../img/\">
                          </td>
                        
                          <td width=\"80\">Nazwa pliku 14:</td>
                          <td> 
                            <input type=\"text\" name=\"nyttnavn14\">
                           <input type=\"hidden\" name=\"ending14\" value=\".jpg\">
                            </td>
                        </tr>

                        <tr> 
                          <td width=\"80\">Plik 15: </td>
                          <td> 
                            <input type=\"file\" name=\"bilde_fil15\">
                            <input type=\"hidden\" name=\"folder15\" value=\"../img/\">
                          </td>
                        
                          <td width=\"80\">Nazwa pliku 15:</td>
                          <td> 
                            <input type=\"text\" name=\"nyttnavn15\">
                           <input type=\"hidden\" name=\"ending15\" value=\".jpg\">
                            </td>
                        </tr>

                        <tr> 
                          <td width=\"80\">Plik 16: </td>
                          <td> 
                            <input type=\"file\" name=\"bilde_fil16\">
                            <input type=\"hidden\" name=\"folder16\" value=\"../img/\">
                          </td>
                        
                          <td width=\"80\">Nazwa pliku 16:</td>
                          <td> 
                            <input type=\"text\" name=\"nyttnavn16\">
                           <input type=\"hidden\" name=\"ending16\" value=\".jpg\">
                            </td>
                        </tr>

                        <tr> 
                          <td width=\"80\">Plik 17: </td>
                          <td> 
                            <input type=\"file\" name=\"bilde_fil17\">
                            <input type=\"hidden\" name=\"folder17\" value=\"../img/\">
                          </td>
                        
                          <td width=\"80\">Nazwa pliku 17:</td>
                          <td> 
                            <input type=\"text\" name=\"nyttnavn17\">
                           <input type=\"hidden\" name=\"ending17\" value=\".jpg\">
                            </td>
                        </tr>

                        <tr> 
                          <td width=\"80\">Plik 18: </td>
                          <td> 
                            <input type=\"file\" name=\"bilde_fil18\">
                            <input type=\"hidden\" name=\"folder18\" value=\"../img/\">
                          </td>
                        
                          <td width=\"80\">Nazwa pliku 18:</td>
                          <td> 
                            <input type=\"text\" name=\"nyttnavn18\">
                           <input type=\"hidden\" name=\"ending18\" value=\".jpg\">
                            </td>
                        </tr>

                        <tr> 
                          <td width=\"80\">Plik 19: </td>
                          <td> 
                            <input type=\"file\" name=\"bilde_fil19\">
                            <input type=\"hidden\" name=\"folder19\" value=\"../img/\">
                          </td>
                        
                          <td width=\"80\">Nazwa pliku 19:</td>
                          <td> 
                            <input type=\"text\" name=\"nyttnavn19\">
                           <input type=\"hidden\" name=\"ending19\" value=\".jpg\">
                            </td>
                        </tr>
               
                          <tr> 
                          <td width=\"80\">Plik 20: </td>
                          <td> 
                            <input type=\"file\" name=\"bilde_fil20\">
                            <input type=\"hidden\" name=\"folder20\" value=\"../img/\">
                          </td>
                        
                          <td width=\"80\">Nazwa pliku 20:</td>
                          <td> 
                            <input type=\"text\" name=\"nyttnavn20\">
                           <input type=\"hidden\" name=\"ending20\" value=\".jpg\">
                            </td>
                        </tr>
               
                          <tr> 
                          <td width=\"80\">Plik 21: </td>
                          <td> 
                            <input type=\"file\" name=\"bilde_fil21\">
                            <input type=\"hidden\" name=\"folder21\" value=\"../img/\">
                          </td>
                        
                          <td width=\"80\">Nazwa pliku 21:</td>
                          <td> 
                            <input type=\"text\" name=\"nyttnavn21\">
                           <input type=\"hidden\" name=\"ending21\" value=\".jpg\">
                            </td>
                        </tr>
               
                          <tr> 
                          <td width=\"80\">Plik 22: </td>
                          <td> 
                            <input type=\"file\" name=\"bilde_fil22\">
                            <input type=\"hidden\" name=\"folder22\" value=\"../img/\">
                          </td>
                        
                          <td width=\"80\">Nazwa pliku 22:</td>
                          <td> 
                            <input type=\"text\" name=\"nyttnavn22\">
                           <input type=\"hidden\" name=\"ending22\" value=\".jpg\">
                            </td>
                        </tr>
               
               	          <tr> 
                          <td width=\"80\">Plik 23: </td>
                          <td> 
                            <input type=\"file\" name=\"bilde_fil23\">
                            <input type=\"hidden\" name=\"folder23\" value=\"../img/\">
                          </td>
                        
                          <td width=\"80\">Nazwa pliku 23:</td>
                          <td> 
                            <input type=\"text\" name=\"nyttnavn23\">
                           <input type=\"hidden\" name=\"ending23\" value=\".jpg\">
                            </td>
                        </tr>
               
               		<tr> 
                          <td width=\"80\">Plik 24: </td>
                          <td> 
                            <input type=\"file\" name=\"bilde_fil24\">
                            <input type=\"hidden\" name=\"folder24\" value=\"../img/\">
                          </td>
                        
                          <td width=\"80\">Nazwa pliku 24:</td>
                          <td> 
                            <input type=\"text\" name=\"nyttnavn24\">
                           <input type=\"hidden\" name=\"ending24\" value=\".jpg\">
                            </td>
                        </tr>
                      </table>
                      <br>
                      <input type=\"submit\" value=\"Załaduj\" name=\"submit\">
                      <input type=\"hidden\" name=\"MAX_FILE_SIZE\" value=\"1000000\">";

                    
$path1=$folder1;
if ($bilde_fil1 && $nyttnavn1){
$ok1 = 1;

   if (is_file($path1.$nyttnavn1.$ending1)){
      print "<b>Błšd</b>, Już istnieje<br>";
      $ok1 = 0;
   }
   if (preg_match("/^[\/\\\.]/", $nyttnavn1)){
      print "<b>Błšd</b>, Nazwa nie może zawierać znaków: '.', '/' or '\'";
      $ok1 = 0;
   }
   if (!($ending1 == ".jpg" || $ending1 == ".gif" || $ending1 == ".zip" || $ending1 == ".exe" || $ending1 == ".rar" || $ending1 == ".html" || $ending1 == ".ace" || $ending1 == ".png")){
      print "<b>Błšd</b>, Nie wprowadzaj innego rozszerzenia";
      $ok1 = 0;
   }
   print "";
}

if ($ok1){
   $res1 = copy($bilde_fil1, $path1."/".$nyttnavn1.$ending1);
   echo "<br>";
   print ($res1)?"<b>Zakończono</b>, Załadowano ".$nyttnavn1.$ending1."":"<b>Błšd</b>, nie możno było załadowac pliku.<br>";
   print "";
}


$path2=$folder2;
if ($bilde_fil2 && $nyttnavn2){
$ok2 = 1;

   if (is_file($path2.$nyttnavn2.$ending2)){
      print "<b>Błšd</b>, Już istnieje<br>";
      $ok2 = 0;
   }
   if (preg_match("/^[\/\\\.]/", $nyttnavn2)){
      print "<b>Błšd</b>, Nazwa nie może zawierać znaków: '.', '/' or '\'";
      $ok2 = 0;
   }
   if (!($ending2 == ".jpg" || $ending2 == ".gif" || $ending2 == ".zip" || $ending2 == ".exe" || $ending2 == ".rar" || $ending2 == ".html" || $ending2 == ".ace" || $ending2 == ".png")){
      print "<b>Błšd</b>, Nie wprowadzaj innego rozszerzenia";
      $ok2 = 0;
   }
   print "";
}

if ($ok2){
   $res2 = copy($bilde_fil2, $path2."/".$nyttnavn2.$ending2);
   echo "<br>";
   print ($res2)?"<b>Zakończono</b>, Załadowano ".$nyttnavn2.$ending2."":"<b>Błšd</b>, nie możno było załadowac pliku.<br>";
   print "";
}


$path3=$folder3;
if ($bilde_fil3 && $nyttnavn3){
$ok3 = 1;

   if (is_file($path3.$nyttnavn3.$ending3)){
      print "<b>Błšd</b>, Już istnieje<br>";
      $ok3 = 0;
   }
   if (preg_match("/^[\/\\\.]/", $nyttnavn3)){
      print "<b>Błšd</b>, Nazwa nie może zawierać znaków: '.', '/' or '\'";
      $ok3 = 0;
   }
   if (!($ending3 == ".jpg" || $ending3 == ".gif" || $ending3 == ".zip" || $ending3 == ".exe" || $ending3 == ".rar" || $ending3 == ".html" || $ending3 == ".ace" || $ending3 == ".png")){
      print "<b>Błšd</b>, Nie wprowadzaj innego rozszerzenia";
      $ok3 = 0;
   }
   print "";
}

if ($ok3){
   $res3 = copy($bilde_fil3, $path3."/".$nyttnavn3.$ending3);
   echo "<br>";
   print ($res3)?"<b>Zakończono</b>, Załadowano ".$nyttnavn3.$ending3."":"<b>Błšd</b>, nie możno było załadowac pliku.<br>";
   print "";
}

$path4=$folder4;
if ($bilde_fil4 && $nyttnavn4){
$ok4 = 1;

   if (is_file($path4.$nyttnavn4.$ending4)){
      print "<b>Błšd</b>, Już istnieje<br>";
      $ok4 = 0;
   }
   if (preg_match("/^[\/\\\.]/", $nyttnavn4)){
      print "<b>Błšd</b>, Nazwa nie może zawierać znaków: '.', '/' or '\'";
      $ok4 = 0;
   }
   if (!($ending4 == ".jpg" || $ending4 == ".gif" || $ending4 == ".zip" || $ending4 == ".exe" || $ending4 == ".rar" || $ending4 == ".html" || $ending4 == ".ace" || $ending4 == ".png")){
      print "<b>Błšd</b>, Nie wprowadzaj innego rozszerzenia";
      $ok4 = 0;
   }
   print "";
}

if ($ok4){
   $res4 = copy($bilde_fil4, $path4."/".$nyttnavn4.$ending4);
   echo "<br>";
   print ($res4)?"<b>Zakończono</b>, Załadowano ".$nyttnavn4.$ending4."":"<b>Błšd</b>, nie możno było załadowac pliku.<br>";
   print "";
}

$path5=$folder5;
if ($bilde_fil5 && $nyttnavn5){
$ok5 = 1;

   if (is_file($path5.$nyttnavn5.$ending5)){
      print "<b>Błšd</b>, Już istnieje<br>";
      $ok5 = 0;
   }
   if (preg_match("/^[\/\\\.]/", $nyttnavn5)){
      print "<b>Błšd</b>, Nazwa nie może zawierać znaków: '.', '/' or '\'";
      $ok5 = 0;
   }
   if (!($ending5 == ".jpg" || $ending5 == ".gif" || $ending5 == ".zip" || $ending5 == ".exe" || $ending5 == ".rar" || $ending5 == ".html" || $ending5 == ".ace" || $ending5 == ".png")){
      print "<b>Błšd</b>, Nie wprowadzaj innego rozszerzenia";
      $ok5 = 0;
   }
   print "";
}

if ($ok5){
   $res5 = copy($bilde_fil5, $path5."/".$nyttnavn5.$ending5);
   echo "<br>";
   print ($res5)?"<b>Zakończono</b>, Załadowano ".$nyttnavn5.$ending5."":"<b>Błšd</b>, nie możno było załadowac pliku.<br>";
   print "";
}

$path6=$folder6;
if ($bilde_fil6 && $nyttnavn6){
$ok6 = 1;

   if (is_file($path6.$nyttnavn6.$ending6)){
      print "<b>Błšd</b>, Już istnieje<br>";
      $ok6 = 0;
   }
   if (preg_match("/^[\/\\\.]/", $nyttnavn6)){
      print "<b>Błšd</b>, Nazwa nie może zawierać znaków: '.', '/' or '\'";
      $ok6 = 0;
   }
   if (!($ending6 == ".jpg" || $ending6 == ".gif" || $ending6 == ".zip" || $ending6 == ".exe" || $ending6 == ".rar" || $ending6 == ".html" || $ending6 == ".ace" || $ending6 == ".png")){
      print "<b>Błšd</b>, Nie wprowadzaj innego rozszerzenia";
      $ok6 = 0;
   }
   print "";
}

if ($ok6){
   $res6 = copy($bilde_fil6, $path6."/".$nyttnavn6.$ending6);
   echo "<br>";
   print ($res6)?"<b>Zakończono</b>, Załadowano ".$nyttnavn6.$ending6."":"<b>Błšd</b>, nie możno było załadowac pliku.<br>";
   print "";
}


$path7=$folder7;
if ($bilde_fil7 && $nyttnavn7){
$ok7 = 1;

   if (is_file($path7.$nyttnavn7.$ending7)){
      print "<b>Błšd</b>, Już istnieje<br>";
      $ok7 = 0;
   }
   if (preg_match("/^[\/\\\.]/", $nyttnavn7)){
      print "<b>Błšd</b>, Nazwa nie może zawierać znaków: '.', '/' or '\'";
      $ok7 = 0;
   }
   if (!($ending7 == ".jpg" || $ending7 == ".gif" || $ending7 == ".zip" || $ending7 == ".exe" || $ending7 == ".rar" || $ending7 == ".html" || $ending7 == ".ace" || $ending7 == ".png")){
      print "<b>Błšd</b>, Nie wprowadzaj innego rozszerzenia";
      $ok7 = 0;
   }
   print "";
}

if ($ok7){
   $res7 = copy($bilde_fil7, $path7."/".$nyttnavn7.$ending7);
   echo "<br>";
   print ($res7)?"<b>Zakończono</b>, Załadowano ".$nyttnavn7.$ending7."":"<b>Błšd</b>, nie możno było załadowac pliku.<br>";
   print "";
}

$path8=$folder8;
if ($bilde_fil8 && $nyttnavn8){
$ok8 = 1;

   if (is_file($path8.$nyttnavn8.$ending8)){
      print "<b>Błšd</b>, Już istnieje<br>";
      $ok8 = 0;
   }
   if (preg_match("/^[\/\\\.]/", $nyttnavn8)){
      print "<b>Błšd</b>, Nazwa nie może zawierać znaków: '.', '/' or '\'";
      $ok8 = 0;
   }
   if (!($ending8 == ".jpg" || $ending8 == ".gif" || $ending8 == ".zip" || $ending8 == ".exe" || $ending8 == ".rar" || $ending8 == ".html" || $ending8 == ".ace" || $ending8 == ".png")){
      print "<b>Błšd</b>, Nie wprowadzaj innego rozszerzenia";
      $ok8 = 0;
   }
   print "";
}

if ($ok8){
   $res8 = copy($bilde_fil8, $path8."/".$nyttnavn8.$ending8);
   echo "<br>";
   print ($res8)?"<b>Zakończono</b>, Załadowano ".$nyttnavn8.$ending8."":"<b>Błšd</b>, nie możno było załadowac pliku.<br>";
   print "";
}

$path9=$folder9;
if ($bilde_fil9 && $nyttnavn9){
$ok9 = 1;

   if (is_file($path9.$nyttnavn9.$ending9)){
      print "<b>Błšd</b>, Już istnieje<br>";
      $ok9 = 0;
   }
   if (preg_match("/^[\/\\\.]/", $nyttnavn9)){
      print "<b>Błšd</b>, Nazwa nie może zawierać znaków: '.', '/' or '\'";
      $ok9 = 0;
   }
   if (!($ending9 == ".jpg" || $ending9 == ".gif" || $ending9 == ".zip" || $ending9 == ".exe" || $ending9 == ".rar" || $ending9 == ".html" || $ending9 == ".ace" || $ending9 == ".png")){
      print "<b>Błšd</b>, Nie wprowadzaj innego rozszerzenia";
      $ok9 = 0;
   }
   print "";
}

if ($ok9){
   $res9 = copy($bilde_fil9, $path9."/".$nyttnavn9.$ending9);
   echo "<br>";
   print ($res9)?"<b>Zakończono</b>, Załadowano ".$nyttnavn9.$ending9."":"<b>Błšd</b>, nie możno było załadowac pliku.<br>";
   print "";
}

$path10=$folder10;
if ($bilde_fil10 && $nyttnavn10){
$ok10 = 1;

   if (is_file($path10.$nyttnavn10.$ending10)){
      print "<b>Błšd</b>, Już istnieje<br>";
      $ok10 = 0;
   }
   if (preg_match("/^[\/\\\.]/", $nyttnavn10)){
      print "<b>Błšd</b>, Nazwa nie może zawierać znaków: '.', '/' or '\'";
      $ok10 = 0;
   }
   if (!($ending10 == ".jpg" || $ending10 == ".gif" || $ending10 == ".zip" || $ending10 == ".exe" || $ending10 == ".rar" || $ending10 == ".html" || $ending10 == ".ace" || $ending10 == ".png")){
      print "<b>Błšd</b>, Nie wprowadzaj innego rozszerzenia";
      $ok10 = 0;
   }
   print "";
}

if ($ok10){
   $res10 = copy($bilde_fil10, $path10."/".$nyttnavn10.$ending10);
   echo "<br>";
   print ($res10)?"<b>Zakończono</b>, Załadowano ".$nyttnavn10.$ending10."":"<b>Błšd</b>, nie możno było załadowac pliku.<br>";
   print "";
}

$path11=$folder11;
if ($bilde_fil11 && $nyttnavn11){
$ok11 = 1;

   if (is_file($path11.$nyttnavn11.$ending11)){
      print "<b>Błšd</b>, Już istnieje<br>";
      $ok11 = 0;
   }
   if (preg_match("/^[\/\\\.]/", $nyttnavn11)){
      print "<b>Błšd</b>, Nazwa nie może zawierać znaków: '.', '/' or '\'";
      $ok11 = 0;
   }
   if (!($ending11 == ".jpg" || $ending11 == ".gif" || $ending11 == ".zip" || $ending11 == ".exe" || $ending11 == ".rar" || $ending11 == ".html" || $ending11 == ".ace" || $ending11 == ".png")){
      print "<b>Błšd</b>, Nie wprowadzaj innego rozszerzenia";
      $ok11 = 0;
   }
   print "";
}

if ($ok11){
   $res11 = copy($bilde_fil11, $path11."/".$nyttnavn11.$ending11);
   echo "<br>";
   print ($res11)?"<b>Zakończono</b>, Załadowano ".$nyttnavn11.$ending11."":"<b>Błšd</b>, nie możno było załadowac pliku.<br>";
   print "";
}

$path12=$folder12;
if ($bilde_fil12 && $nyttnavn12){
$ok12 = 1;

   if (is_file($path12.$nyttnavn12.$ending12)){
      print "<b>Błšd</b>, Już istnieje<br>";
      $ok12 = 0;
   }
   if (preg_match("/^[\/\\\.]/", $nyttnavn12)){
      print "<b>Błšd</b>, Nazwa nie może zawierać znaków: '.', '/' or '\'";
      $ok12 = 0;
   }
   if (!($ending12 == ".jpg" || $ending12 == ".gif" || $ending12 == ".zip" || $ending12 == ".exe" || $ending12 == ".rar" || $ending12 == ".html" || $ending12 == ".ace" || $ending12 == ".png")){
      print "<b>Błšd</b>, Nie wprowadzaj innego rozszerzenia";
      $ok12 = 0;
   }
   print "";
}

if ($ok12){
   $res12 = copy($bilde_fil12, $path12."/".$nyttnavn12.$ending12);
   echo "<br>";
   print ($res12)?"<b>Zakończono</b>, Załadowano ".$nyttnavn12.$ending12."":"<b>Błšd</b>, nie możno było załadowac pliku.<br>";
   print "";
}

$path13=$folder13;
if ($bilde_fil13 && $nyttnavn13){
$ok13 = 1;

   if (is_file($path13.$nyttnavn13.$ending13)){
      print "<b>Błšd</b>, Już istnieje<br>";
      $ok13 = 0;
   }
   if (preg_match("/^[\/\\\.]/", $nyttnavn13)){
      print "<b>Błšd</b>, Nazwa nie może zawierać znaków: '.', '/' or '\'";
      $ok13 = 0;
   }
   if (!($ending13 == ".jpg" || $ending13 == ".gif" || $ending13 == ".zip" || $ending13 == ".exe" || $ending13 == ".rar" || $ending13 == ".html" || $ending13 == ".ace" || $ending13 == ".png")){
      print "<b>Błšd</b>, Nie wprowadzaj innego rozszerzenia";
      $ok13 = 0;
   }
   print "";
}

if ($ok13){
   $res13 = copy($bilde_fil13, $path13."/".$nyttnavn13.$ending13);
   echo "<br>";
   print ($res13)?"<b>Zakończono</b>, Załadowano ".$nyttnavn13.$ending13."":"<b>Błšd</b>, nie możno było załadowac pliku.<br>";
   print "";
}

$path14=$folder14;
if ($bilde_fil14 && $nyttnavn14){
$ok14 = 1;

   if (is_file($path14.$nyttnavn14.$ending14)){
      print "<b>Błšd</b>, Już istnieje<br>";
      $ok14 = 0;
   }
   if (preg_match("/^[\/\\\.]/", $nyttnavn14)){
      print "<b>Błšd</b>, Nazwa nie może zawierać znaków: '.', '/' or '\'";
      $ok14 = 0;
   }
   if (!($ending14 == ".jpg" || $ending14 == ".gif" || $ending14 == ".zip" || $ending14 == ".exe" || $ending14 == ".rar" || $ending14 == ".html" || $ending14 == ".ace" || $ending14 == ".png")){
      print "<b>Błšd</b>, Nie wprowadzaj innego rozszerzenia";
      $ok14 = 0;
   }
   print "";
}

if ($ok14){
   $res14 = copy($bilde_fil14, $path14."/".$nyttnavn14.$ending14);
   echo "<br>";
   print ($res14)?"<b>Zakończono</b>, Załadowano ".$nyttnavn14.$ending14."":"<b>Błšd</b>, nie możno było załadowac pliku.<br>";
   print "";
}

$path15=$folder15;
if ($bilde_fil15 && $nyttnavn15){
$ok15 = 1;

   if (is_file($path15.$nyttnavn15.$ending15)){
      print "<b>Błšd</b>, Już istnieje<br>";
      $ok15 = 0;
   }
   if (preg_match("/^[\/\\\.]/", $nyttnavn15)){
      print "<b>Błšd</b>, Nazwa nie może zawierać znaków: '.', '/' or '\'";
      $ok15 = 0;
   }
   if (!($ending15 == ".jpg" || $ending15 == ".gif" || $ending15 == ".zip" || $ending15 == ".exe" || $ending15 == ".rar" || $ending15 == ".html" || $ending15 == ".ace" || $ending15 == ".png")){
      print "<b>Błšd</b>, Nie wprowadzaj innego rozszerzenia";
      $ok15 = 0;
   }
   print "";
}

if ($ok15){
   $res15 = copy($bilde_fil15, $path15."/".$nyttnavn15.$ending15);
   echo "<br>";
   print ($res15)?"<b>Zakończono</b>, Załadowano ".$nyttnavn15.$ending15."":"<b>Błšd</b>, nie możno było załadowac pliku.<br>";
   print "";
}

$path16=$folder16;
if ($bilde_fil16 && $nyttnavn16){
$ok16 = 1;

   if (is_file($path16.$nyttnavn16.$ending16)){
      print "<b>Błšd</b>, Już istnieje<br>";
      $ok16 = 0;
   }
   if (preg_match("/^[\/\\\.]/", $nyttnavn16)){
      print "<b>Błšd</b>, Nazwa nie może zawierać znaków: '.', '/' or '\'";
      $ok16 = 0;
   }
   if (!($ending16 == ".jpg" || $ending16 == ".gif" || $ending16 == ".zip" || $ending16 == ".exe" || $ending16 == ".rar" || $ending16 == ".html" || $ending16 == ".ace" || $ending16 == ".png")){
      print "<b>Błšd</b>, Nie wprowadzaj innego rozszerzenia";
      $ok16 = 0;
   }
   print "";
}

if ($ok16){
   $res16 = copy($bilde_fil16, $path16."/".$nyttnavn16.$ending16);
   echo "<br>";
   print ($res16)?"<b>Zakończono</b>, Załadowano ".$nyttnavn16.$ending16."":"<b>Błšd</b>, nie możno było załadowac pliku.<br>";
   print "";
}

$path17=$folder17;
if ($bilde_fil17 && $nyttnavn17){
$ok17 = 1;

   if (is_file($path17.$nyttnavn17.$ending17)){
      print "<b>Błšd</b>, Już istnieje<br>";
      $ok17 = 0;
   }
   if (preg_match("/^[\/\\\.]/", $nyttnavn17)){
      print "<b>Błšd</b>, Nazwa nie może zawierać znaków: '.', '/' or '\'";
      $ok17 = 0;
   }
   if (!($ending17 == ".jpg" || $ending17 == ".gif" || $ending17 == ".zip" || $ending17 == ".exe" || $ending17 == ".rar" || $ending17 == ".html" || $ending17 == ".ace" || $ending17 == ".png")){
      print "<b>Błšd</b>, Nie wprowadzaj innego rozszerzenia";
      $ok17 = 0;
   }
   print "";
}

if ($ok17){
   $res17 = copy($bilde_fil17, $path17."/".$nyttnavn17.$ending17);
   echo "<br>";
   print ($res17)?"<b>Zakończono</b>, Załadowano ".$nyttnavn17.$ending17."":"<b>Błšd</b>, nie możno było załadowac pliku.<br>";
   print "";
}

$path18=$folder18;
if ($bilde_fil18 && $nyttnavn18){
$ok18 = 1;

   if (is_file($path18.$nyttnavn18.$ending18)){
      print "<b>Błšd</b>, Już istnieje<br>";
      $ok18 = 0;
   }
   if (preg_match("/^[\/\\\.]/", $nyttnavn18)){
      print "<b>Błšd</b>, Nazwa nie może zawierać znaków: '.', '/' or '\'";
      $ok18 = 0;
   }
   if (!($ending18 == ".jpg" || $ending18 == ".gif" || $ending18 == ".zip" || $ending18 == ".exe" || $ending18 == ".rar" || $ending18 == ".html" || $ending18 == ".ace" || $ending18 == ".png")){
      print "<b>Błšd</b>, Nie wprowadzaj innego rozszerzenia";
      $ok18 = 0;
   }
   print "";
}

if ($ok18){
   $res18 = copy($bilde_fil18, $path18."/".$nyttnavn18.$ending18);
   echo "<br>";
   print ($res18)?"<b>Zakończono</b>, Załadowano ".$nyttnavn18.$ending18."":"<b>Błšd</b>, nie możno było załadowac pliku.<br>";
   print "";
}

$path19=$folder19;
if ($bilde_fil19 && $nyttnavn19){
$ok19 = 1;

   if (is_file($path19.$nyttnavn19.$ending19)){
      print "<b>Błšd</b>, Już istnieje<br>";
      $ok19 = 0;
   }
   if (preg_match("/^[\/\\\.]/", $nyttnavn19)){
      print "<b>Błšd</b>, Nazwa nie może zawierać znaków: '.', '/' or '\'";
      $ok19 = 0;
   }
   if (!($ending19 == ".jpg" || $ending19 == ".gif" || $ending19 == ".zip" || $ending19 == ".exe" || $ending19 == ".rar" || $ending19 == ".html" || $ending19 == ".ace" || $ending19 == ".png")){
      print "<b>Błšd</b>, Nie wprowadzaj innego rozszerzenia";
      $ok19 = 0;
   }
   print "";
}

if ($ok19){
   $res19 = copy($bilde_fil19, $path19."/".$nyttnavn19.$ending19);
   echo "<br>";
   print ($res19)?"<b>Zakończono</b>, Załadowano ".$nyttnavn19.$ending19."":"<b>Błšd</b>, nie możno było załadowac pliku.<br>";
   print "";
}

$path20=$folder20;
if ($bilde_fil20 && $nyttnavn20){
$ok20 = 1;

   if (is_file($path20.$nyttnavn20.$ending20)){
      print "<b>Błšd</b>, Już istnieje<br>";
      $ok20 = 0;
   }
   if (preg_match("/^[\/\\\.]/", $nyttnavn20)){
      print "<b>Błšd</b>, Nazwa nie może zawierać znaków: '.', '/' or '\'";
      $ok20 = 0;
   }
   if (!($ending20 == ".jpg" || $ending20 == ".gif" || $ending20 == ".zip" || $ending20 == ".exe" || $ending20 == ".rar" || $ending20 == ".html" || $ending20 == ".ace" || $ending20 == ".png")){
      print "<b>Błšd</b>, Nie wprowadzaj innego rozszerzenia";
      $ok20 = 0;
   }
   print "";
}

if ($ok20){
   $res20 = copy($bilde_fil20, $path20."/".$nyttnavn20.$ending20);
   echo "<br>";
   print ($res20)?"<b>Zakończono</b>, Załadowano ".$nyttnavn20.$ending20."":"<b>Błšd</b>, nie możno było załadowac pliku.<br>";
   print "";
}

$path21=$folder21;
if ($bilde_fil21 && $nyttnavn21){
$ok21 = 1;

   if (is_file($path21.$nyttnavn21.$ending21)){
      print "<b>Błšd</b>, Już istnieje<br>";
      $ok21 = 0;
   }
   if (preg_match("/^[\/\\\.]/", $nyttnavn21)){
      print "<b>Błšd</b>, Nazwa nie może zawierać znaków: '.', '/' or '\'";
      $ok21 = 0;
   }
   if (!($ending21 == ".jpg" || $ending21 == ".gif" || $ending21 == ".zip" || $ending21 == ".exe" || $ending21 == ".rar" || $ending21 == ".html" || $ending21 == ".ace" || $ending21 == ".png")){
      print "<b>Błšd</b>, Nie wprowadzaj innego rozszerzenia";
      $ok21 = 0;
   }
   print "";
}

if ($ok21){
   $res21 = copy($bilde_fil21, $path21."/".$nyttnavn21.$ending21);
   echo "<br>";
   print ($res21)?"<b>Zakończono</b>, Załadowano ".$nyttnavn21.$ending21."":"<b>Błšd</b>, nie możno było załadowac pliku.<br>";
   print "";
}

$path22=$folder22;
if ($bilde_fil22 && $nyttnavn22){
$ok22 = 1;

   if (is_file($path22.$nyttnavn22.$ending22)){
      print "<b>Błšd</b>, Już istnieje<br>";
      $ok22 = 0;
   }
   if (preg_match("/^[\/\\\.]/", $nyttnavn22)){
      print "<b>Błšd</b>, Nazwa nie może zawierać znaków: '.', '/' or '\'";
      $ok22 = 0;
   }
   if (!($ending22 == ".jpg" || $ending22 == ".gif" || $ending22 == ".zip" || $ending22 == ".exe" || $ending22 == ".rar" || $ending22 == ".html" || $ending22 == ".ace" || $ending22 == ".png")){
      print "<b>Błšd</b>, Nie wprowadzaj innego rozszerzenia";
      $ok22 = 0;
   }
   print "";
}

if ($ok22){
   $res22 = copy($bilde_fil22, $path22."/".$nyttnavn22.$ending22);
   echo "<br>";
   print ($res22)?"<b>Zakończono</b>, Załadowano ".$nyttnavn22.$ending22."":"<b>Błšd</b>, nie możno było załadowac pliku.<br>";
   print "";
}

$path23=$folder23;
if ($bilde_fil23 && $nyttnavn23){
$ok23 = 1;

   if (is_file($path23.$nyttnavn23.$ending23)){
      print "<b>Błšd</b>, Już istnieje<br>";
      $ok23 = 0;
   }
   if (preg_match("/^[\/\\\.]/", $nyttnavn23)){
      print "<b>Błšd</b>, Nazwa nie może zawierać znaków: '.', '/' or '\'";
      $ok23 = 0;
   }
   if (!($ending23 == ".jpg" || $ending23 == ".gif" || $ending23 == ".zip" || $ending23 == ".exe" || $ending23 == ".rar" || $ending23 == ".html" || $ending23 == ".ace" || $ending23 == ".png")){
      print "<b>Błšd</b>, Nie wprowadzaj innego rozszerzenia";
      $ok23 = 0;
   }
   print "";
}

if ($ok23){
   $res23 = copy($bilde_fil23, $path23."/".$nyttnavn23.$ending23);
   echo "<br>";
   print ($res23)?"<b>Zakończono</b>, Załadowano ".$nyttnavn23.$ending23."":"<b>Błšd</b>, nie możno było załadowac pliku.<br>";
   print "";
}

$path24=$folder24;
if ($bilde_fil24 && $nyttnavn24){
$ok24 = 1;

   if (is_file($path24.$nyttnavn24.$ending24)){
      print "<b>Błšd</b>, Już istnieje<br>";
      $ok24 = 0;
   }
   if (preg_match("/^[\/\\\.]/", $nyttnavn24)){
      print "<b>Błšd</b>, Nazwa nie może zawierać znaków: '.', '/' or '\'";
      $ok24 = 0;
   }
   if (!($ending24 == ".jpg" || $ending24 == ".gif" || $ending24 == ".zip" || $ending24 == ".exe" || $ending24 == ".rar" || $ending24 == ".html" || $ending24 == ".ace" || $ending24 == ".png")){
      print "<b>Błšd</b>, Nie wprowadzaj innego rozszerzenia";
      $ok24 = 0;
   }
   print "";
}

if ($ok24){
   $res24 = copy($bilde_fil24, $path24."/".$nyttnavn24.$ending24);
   echo "<br>";
   print ($res24)?"<b>Zakończono</b>, Załadowano ".$nyttnavn24.$ending24."":"<b>Błšd</b>, nie możno było załadowac pliku.<br>";
   print "";
}








echo "
<br>
</form>
</td>
</tr>
</table> </td>
</tr>
</table>
</div>
</td>
</tr>
</table>
</center>";


}
?>