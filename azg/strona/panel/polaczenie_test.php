<?php
    $query = array(2 => "http://www.azg.pl/", 1 => "http://www.azgwarancja.eu/", 3 => "http://www.nieruchomosciopole.pl/");
    
    $handle = fopen('zapis.txt', 'a'); 
    
    $licznik = 15; //teoretycznie po 5 wejsc
    //while ($licznik > 0)
    //{
        $index = rand(10, 30);
        $index = round($index / 10); //losowanie co za strona teraz
        //echo $index.'<br />';
        $domena = $query[$index];
        $url = parse_url($domena);
        $host = $url['host'];
        $path = $url['path'];
        
        ///docelowo zrobic rozdzialy od minuty wzwyz tak, zeby rozlozyc wejscia na pol godziny ltd
        $czas = date("Y-m-d H:i:s");
        $fp = fsockopen($host, 80);
        if (!$fp) 
        {
            fputs($handle, $host.' '.$czas." - Unable to open\r\n");
        }
        else
        {
            stream_set_timeout($fp, 5);

            $info = stream_get_meta_data($fp);
            

            if ($info['timed_out']) 
            {
                fputs($handle, $host.' '.$czas." - Connection timed out!\r\n");
            } 
            else 
            {
                fputs($handle, $host.' '.$czas." - powodzenie\r\n");
            }
            header('Location: http://'.$host);
            fclose($fp);
        }
        $licznik--;
    //}

    fclose($handle);
?>