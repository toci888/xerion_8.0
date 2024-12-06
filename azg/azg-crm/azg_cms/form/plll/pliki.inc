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
?>

<?phpfunction resizeImage($source, $max_x, $max_y, $save_image, $jpeg_quality = 100)
{

/*    * source - obrazek jpeg
    * max_x - maksymalna szerokosc pomniejszonego obrazka
    * max_y - maksymalna dlugosc pomniejszonego obrazka
    * save_image - nazwa pliku do ktorego zostanie zapisany nowy obrazek
    * jpeg_quality - jakosc powstalego obrazu jpeg - jezeli bedzie inny to argument jest nie wazny (domyslnie 100)
*/

if(exif_imagetype($source) == IMAGETYPE_JPEG) 
 {
     $img_src = imagecreatefromjpeg($source);
 }

elseif(exif_imagetype($source) == IMAGETYPE_GIF)
{
     $img_src = imagecreatefromgif($source);
}
elseif(exif_imagetype($source) == IMAGETYPE_PNG)
{
     $img_src = imagecreatefrompng($source);      
}

   else      
   {
   die('Wrong filetype! Accepted images: JPG/JPEG, GIF, PNG');
   }
$image_x = imagesx($img_src);
$image_y = imagesy($img_src);
if($image_x > $image_y) // Landscape
{
 $ratio_x = ($image_x > $max_x) ? $max_x/$image_x : 1;
 $ratio_y = $ratio_x;
 $move = 'y';
}
else // Portrait   
{
$ratio_y = ($image_y > $max_y) ? $max_y/$image_y : 1;
$ratio_x = $ratio_y;
$move = 'x';
}
$new_x = $image_x*$ratio_x;
$new_y = $image_y*$ratio_y;

$move_x = ($move == "x\") ? ($max_x-$new_x)/2 : 0;
$move_y = ($move == \"y\") ? ($max_y-$new_y)/2 : 0;

$new_img = imagecreatetruecolor($max_x, $max_y);
$background = imagecolorallocate($new_img, 255, 255, 255);
imagefill($new_img, 0, 0, $background);
imagecopyresampled($new_img, $img_src, $move_x, $move_y, 0, 0, $new_x, $new_y, $image_x, $image_y);

if(exif_imagetype($save_image) == IMAGETYPE_JPEG)
 {
   imagejpeg($new_img, $save_image, $jpeg_quality);
 }    
 elseif(exif_imagetype($save_image) == IMAGETYPE_GIF)
 {
   imagegif($new_img, $save_image);
 }
 
 elseif(exif_imagetype($save_image) == IMAGETYPE_PNG)
 {
   imagepng($new_img, $save_image);
 }
 echo '<img src=\"'.$save_image.'\" border=\"1\">';}
 
 ?>

<?

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