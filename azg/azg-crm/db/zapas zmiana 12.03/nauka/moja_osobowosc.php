<html>
 <head><title>Osobowosc.</title></head>
 <body>
 
 <form action="<?php echo $_SERVER['PHP_SELF'] ?>" method="GET" >
 Wybierz swoje cechy charakteru:<br />
 
 <select name="attributes[]" multiple>
    <option value="radosny ">Radosny</option>
    <option value="ponury ">Ponury</option>
    <option value="zamyslony ">Zamyslony</option>
    <option value="czujacy ">Czujacy</option>
    <option value="skapy ">Skapy</option>
    <option value="rozrzutny ">Rozrzutny</option> 
 </select>
 
 <br>
 
 <input type="submit" name="baton" value="Moja osobowosc!!" />
 </form>
 
 <?php
 if (array_key_exists('baton', $_GET))
 {
     //var_dump($_GET['attributes']);
     $cecha = join ("", $_GET['attributes']);
     echo "Jestes $cecha ";
     echo ".";
 }   
 ?>
 
 </body>
 </html>