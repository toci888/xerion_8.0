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
 <form action="<?php echo $_SERVER['PHP_SELF'] ?>" method="GET" >
 Wybierz jezyk programowania:<br />
 
 <select name="jezyk[]">
    <option name=""></option>
    <option name="c ">C</option>
    <option name="c++ ">C++89</option>
    <option name="php ">PHP</option>
    <option name="perl ">PERL</option>
 </select>
 <input type="submit" name="ble" value="zatwierdz" />
  </form>
 <?php
  //var_dump($_GET['jezyk']);
  ?>
  <br>
  <?php
 if(isset($_GET['jezyk']) )
 {                          
    $zmienna = $_GET['jezyk'][0];
       echo "Twoj jezyk to $zmienna .";
 }
?>
 <br> 
 
  <form action="<?php echo $_SERVER['PHP_SELF'] ?>" method="GET" >
 Wybierz swoje cechy charakteru:<br />
 
    Radosny<input type="checkbox" name="attributes[]" value="radosny " ><br />
    Ponury<input type="checkbox" name="attributes[]" value="ponury "><br />
    Zamyslony<input type="checkbox" name="attributes[]" value="zamyslony "><br />
    Czujacy<input type="checkbox" name="attributes[]" value="czujacy "><br />
    Skapy<input type="checkbox" name="attributes[]" value="skapy "><br />
    Rozrzutny<input type="checkbox" name="attributes[]" value="rozrzutny "><br /> 
 <br />
 
 <input type="submit" name="s" value="Moja osobowosc!" />

 </form>
 
 <?php
 if (array_key_exists('s', $_GET))
 {
     //var_dump($_GET['attributes']);
     $cecha = join (" ", $_GET['attributes']);
     echo "Jestes $cecha ";
     echo ".";
 }
 ?>
 </body>
 </html>