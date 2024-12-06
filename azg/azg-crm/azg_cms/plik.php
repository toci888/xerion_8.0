<?php
    $hand1 = fopen('plik.txt', 'r');
    $hand2 = fopen('wyjscie.txt', 'w');
    while ($str = fgets($hand1))
    {
        //SPӣDZIELNIA ZWM;774555621;0;0;0;1
        $tab = explode(';', $str);
        $tab[0] = '"'.$tab[0].'"';
        $tab[1] = '"0'.$tab[1].'"';
        fputs($hand2, $tab[0].','.$tab[1].','.$tab[2].','.$tab[3].','.$tab[4].','.$tab[5]);
    }
    fclose($hand1);
    fclose($hand2);
?>