<?php
    $query = array(2 => "http://www.azg.pl/", 1 => "http://www.azgwarancja.eu/", 3 => "http://www.nieruchomosciopole.pl/");
    
    $handle = fopen('zapis.txt', 'a'); 
    
    $licznik = 15; //teoretycznie po 5 wejsc
    while ($licznik > 0)
    {
        $index = rand(10, 30);
        $index = round($index / 10); //losowanie co za strona teraz
        //echo $index.'<br />';
        $domena = $query[$index];
        $url = parse_url($domena);
        $host = $url['host'];
        $path = $url['path'];
        
        ///docelowo zrobic rozdzialy od minuty wzwyz tak, zeby rozlozyc wejscia na pol godziny ltd
        $cyfra = rand(120, 240); //spoznienia
        usleep(1000000 * $cyfra);
        $czas = date("Y-m-d H:i:s");
        $fp = fsockopen($host, 80);
        if (!$fp) 
        {
            fputs($handle, $host.' '.$czas." - Unable to open\r\n");
        }
        else
        {
            fwrite($fp, "GET $path HTTP/1.0\nHost: ".$host."\n\n");
            stream_set_timeout($fp, 5);
            $buf = '';
            while (!feof($fp) && $fp)
            {
              $buf .= fgets($fp, 128);
            }

            $info = stream_get_meta_data($fp);
            

            if ($info['timed_out']) 
            {
                fputs($handle, $host.' '.$czas." - Connection timed out!\r\n");
            } 
            else 
            {
                fputs($handle, $host.' '.$czas." - powodzenie\r\n");
            }
            fclose($fp);
        }
        $licznik--;
    }

    fclose($handle);
?>