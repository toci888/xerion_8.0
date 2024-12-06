<?php
// Pocz¹tek pobierania linku do kursu walut w formacie XML...
$a = "0";
$connect = fopen("http://www.nbp.pl/kursy/kursya.html", "r");
if ($connect) {
while (!feof ($connect)) {
   $a++;
   $buffer = fgets($connect, 4096);
   if($a=="166") {
   $link = $buffer;
   }
};
}
fclose($connect);
// Koniec pobierania linku do kursu walut w formacie XML

// Wycinanie linku
$link1 = strstr($link, 'xml');
$link2 = substr($link1, '0', '18');
$link = "http://www.nbp.pl/kursy/".$link2;
// Koniec. Link w zmiennej $link.

// Pobieranie arkusza XML
$a = "0";
$connect = fopen($link, "r");
while (!feof ($connect)) {
   $a++;
   $buffer = fgets($connect, 4096);
   if($a=="4") {
   $datak = $buffer;
   }
   elseif($a=="3") {
   $numerk = $buffer;
   }
   elseif($a=="6") {
   $waluta1 = $buffer;
   }
   elseif($a=="8") {
   $symbol1 = $buffer;
   }
   elseif($a=="9") {
   $kurs1 = $buffer;
   }
   elseif($a=="30") {
   $waluta2 = $buffer;
   }
   elseif($a=="32") {
   $symbol2 = $buffer;
   }
   elseif($a=="33") {
   $kurs2 = $buffer;
   }
   elseif($a=="24") {
   $waluta3 = $buffer;
   }
   elseif($a=="26") {
   $symbol3 = $buffer;
   }
   elseif($a=="27") {
   $kurs3 = $buffer;
   }
   elseif($a=="54") {
   $waluta4 = $buffer;
   }
   elseif($a=="56") {
   $symbol4 = $buffer;
   }
   elseif($a=="57") {
   $kurs4 = $buffer;
   }
};
fclose($connect);
echo "Œrednie kursy walut nr ".$numerk." z dnia ".$datak." wg NBP (nazwa waluty, symbol, œredni kurs): ".$waluta1." <b>(".$symbol1.")</b>: <b>".$kurs1."</b>;&nbsp;&nbsp;".$waluta2." <B>(".$symbol2.")</B>: <B>".$kurs2."</B>;&nbsp;&nbsp;".$waluta3." <B>(".$symbol3.")</B>: <B>".$kurs3."</B>;&nbsp;&nbsp;".$waluta4." <B>(".$symbol4.")</B>: <B>".$kurs4."</B>.";
?>