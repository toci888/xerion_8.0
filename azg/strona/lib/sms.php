<?php
    class Sms
    {
        //powinna byc const albo jakos przez property zakamuflowana, zeby w obiekcie nie dalo sie zmienic :P
        protected $adres_url = 'http://api.smsapi.pl/send.do?';
        protected $username = 'bartek';
        protected $password = '4b6e6343f692c6030154ba2ef7c94197';
        protected $encoding = 'iso-8859-2';
                               
        
        //zlozenie adresu url do wykonania oraz odczyt wyniku
        protected function WyslijSms ($adres)
        {            
            $url = parse_url($adres);
            $host = $url["host"];
            $path = $url["path"] . "?" . $url["query"];
            $timeout = 30;
            $buf = '';

            $fp = fsockopen($host, 80, $errno, $errstr, $timeout);
            if ($fp)
            {
                fputs ($fp, "POST $path HTTP/1.0\nHost: ".$host."\n\n");
                while (!feof($fp))
                {
                  $buf .= fgets($fp, 128);
                }
                fclose($fp);
            } 
            else 
            {
                echo("$errno, $errstr");
                return null;
            }
            $pos = strpos($buf, 'OK:');
            $str = substr($buf, $pos);
            
            return $str;
            //analiza $buf
            //echo $buf;
            
            //$res = file_get_contents($adres);
            //echo '<br />'.$res;
        }
        protected function AnalizaOdp ($wynik, $telefony)
        {
            $odp_posz_wysylka = explode(';', $wynik);
            
            $status = array();
            $remote_id = array();
            $punkty = array();
            //$telefon = array();
            
            foreach ($odp_posz_wysylka as $wysylka)
            {
                $elementy = explode(':', $wysylka);
                $status[] = $elementy[0];
                $remote_id[] = $elementy[1];
                $punkty[] = $elementy[2];
                //upewnic sie, ze tel. nie przychodzi ...
                //$telefon[] = substr($elementy[3], 2);
            }
            
            $rezultat = array('status' => $status, 'remote_id' => $remote_id, 'punkty' => $punkty, 'telefon' => $telefony);
            return $rezultat;
        }
        public function MasowySms ($tab_tel, $nadawca, $wiadomosc, $index_tel = null) //ewentualnie podac index wiadomosci i oprogramowac dla roznych wiadomosci
        {
            if ($index_tel == null)
            {
                $ciag_tel = implode(',', $tab_tel);
            }
            else
            {
                $ciag_tel = '';
                $przecinek = false;
                foreach ($tab_tel as $element)
                {
                    if ($przecinek)
                    {
                        $ciag_tel .= ',';
                    }
                    $przecinek = true;
                    $ciag_tel .= $element[$index_tel];
                }
            }
            $adres = $this->adres_url.'username='.$this->username.'&password='.$this->password.'&encoding='.$this->encoding.'&from=48'.$nadawca.'&to='.$ciag_tel.'&message='.urlencode($wiadomosc);
            $wynik = $this->WyslijSms($adres);
            $parsed_data = $this->AnalizaOdp($wynik, explode(',', $ciag_tel));
            return $parsed_data;
        }
    }
?>