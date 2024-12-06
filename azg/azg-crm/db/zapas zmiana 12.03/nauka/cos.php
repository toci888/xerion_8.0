<html>
 <head><title>Osobowosc.</title></head>
 <body>
 
 <?php
 //pobierz wartosc z formularza, jesli istnieja
 $artybuty = $_GET['attributes'];
 if(! is_array($artybuty))
 {
     $artybuty = array();
 }    
 //utwórz kod HTML dla pól o identycznych nazwach 
 function rob_checkboxes ($nama, $zapytanie, $opcje)
 {
     foreatch ($opcje as $wartosc => $opis)
     {
         printf('%s <input type="checkbox" name="%s[]" value="%s" ', $opis, $nama, $wartosc);
         
         if (in_array($wartosc, $zapytanie))
         {
             echo "checked ";
         }
         echo " /><br />\n";
     }
 }
 
 //lista wartoœci i nazwy pól
 
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