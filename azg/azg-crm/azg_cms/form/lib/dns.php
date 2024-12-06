<?php
/*            class whois
{
  var $server;
  var $port;
  var $data;

  // ustawia nazwe serwera whois
  function set_server($server)
  {
    $this->server = $server;
  }

  // ustawia numer portu serwera whois
  function set_port($port)
  {
    $this->port = $port;
  }

  // wysyla zapytanie do serwera whois
  function query($adress)
  {
    $fp = fsockopen($this->server, $this->port);
    if (!$fp)
    {
       $this->data = 0;
       return FALSE;
    }
    else
    {
      fputs($fp, "$adress\n");
      $this->data = fread($fp, 16384);
      fclose($fp);
      return TRUE;
    }
  }

  // zwraca pola descr z odpowiedzi serwera whois
  function get_info()
  {
    $lines = split("\n", $this->data);
    while (list($key, $value) = each($lines))
      if (ereg("descr: +(.*)", $value, $match))
        $info .= "$match[1]\n";
    return $info;
  }

}

// tworzy nowy obiekt whois, ustawia parametry, wysyla zapytanie i podaje odpowiedz
$whois = new whois;
$whois->set_server("193.0.0.135");
$whois->set_port(43);
if($whois->query($q))
  if($whois->get_info())
    $info = $whois->get_info();
  else
    $info = "Brak danych\n";*/
    class Dns
    {
        protected $server = '10.0.0.200';
        protected $port = 53;
        protected $data;
        
        public function Dns($server = null, $port = null)
        {
            
        }
        public function Resolve($adress)
        {
            $fp = fsockopen('udp://'.$this->server, $this->port, $var1, $var2, 1000);
            if (!$fp)
            {
                $this->data = 0;
                return null;
            }
            else
            {
                fputs($fp, $adress."\n");
                $this->data = fread($fp, 3200); //nie wiem czemu akurat tyle czyta :P
                fclose($fp);
                $info = $this->GetInfo();
                return $info;
            }
        }
        protected function GetInfo()
        {
            $i = strlen($this->data);
            //echo $i;
            $j = 0;
            while ($j <= $i)
            {
                $el = substr($this->data, $j, 1);
                //echo chr($el);
                $j++;
                //echo $el;
            }
            /*$lines = split("\n", $this->data);
            var_dump($lines);
            while (list($key, $value) = each($lines))
            if (ereg("descr: +(.*)", $value, $match))
            {
                $info .= $match[1]."\n";
            }            */
            return $this->data;
        }     
    }
?>