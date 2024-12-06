<?php
/*
PHPTelnet 1.1
by Antone Roundy
adapted from code found on the PHP website
public domain
*/

//to juz przestal byc lib, po uruchomieniu funkcjonalnoci konieczne bedzie korygowanie

    $path = str_replace($_SERVER['PHP_SELF'], '', $_SERVER['SCRIPT_FILENAME']).'/';
    
    include_once ($path.'lib/slican_komunikacja.php');

class PHPTelnet 
{
    protected $show_connect_error=1;
    protected $use_usleep = 1;    // change to 1 for faster execution
        // don't change to 1 on Windows servers unless you have PHP 5
    protected $sleeptime=125000;
    protected $cust_sleeptime=125;
    protected $loginsleeptime=1000000;

    protected $fp=NULL;
    protected $loginprompt;
    
    protected $conn1;
    protected $conn2;
    
    protected $port = 23;
    protected $slican;
    
    protected $log_ind_comm = 'aLOGI';
    protected $log_ogol_comm = 'aLOGA';
    protected $password = '5744';
    
    /*
    0 = success
    1 = couldn't open network connection
    2 = unknown host
    3 = login failed
    4 = PHP version too low
    */
    //uzytkownik domyslnie null - logowanie ogolne odsluchowe, port customowy jesli inny niz telnet
    public function Connect($server, $user = null, $port = null, $time = null) 
    {
        if ($port != null)
        {
            $this->port = $port;
        }
        $rv = 0;
        $vers = explode('.', PHP_VERSION);
        $needvers = array(4,3,0);
        $j = count($vers);
        $k = count($needvers);
        if ($k<$j) $j=$k;
        for ($i=0;$i<$j;$i++) 
        {
            if (($vers[$i]+0)>$needvers[$i]) break;
            if (($vers[$i]+0)<$needvers[$i]) 
            {
                $this->ConnectError(4);
                return 4;
            }
        }
        //smiesznie to zrobione - jesli fp istnieje najpierw zamyka polaczenie zanim je otworzy
        //nie ma komentarza na to, wiec wyglada rozlaczanie smiesznie w connectcie, zle ta metoda jest nazwana
        $this->Disconnect();
        
        if (strlen($server)) 
        {
            if (preg_match('/[^0-9.]/', $server)) 
            {
                $ip=gethostbyname($server);
                if ($ip==$server) 
                {
                    $ip='';
                    $rv=2;
                }
            } 
            else $ip=$server;
        } 
        else $ip='127.0.0.1';
        
        if (strlen($ip)) 
        {
            if ($this->fp = fsockopen($ip, $this->port, $err_num, $err_str)) 
            {
                if ($time > 0)
                {
                    ///ustawnienei dla polaczenia czasu trwania - timeoutu, na podane w parametrze sekundy (domyslnie parametr moze nie zostac podany, polaczenie jest wtedy bez timeoutu)
                    stream_set_timeout($this->fp, $time);
                }
                //stream_set_blocking  ($this->fp , 1); //blocking mode, 0 byloby non-blocking mode : przy blocking mode podobno socket_get_status dziala jak chce a nie jak trzeba, ale jak ustawie blocking timeout nie zadziala
                
                //$this->DoCommand('aLOGI 37 5744', $r);
                ///logowanie indywidualnie przyjete do slicanowskiej centralki
                ///logowanie do wszystkich - logowanie indywidualne odbywac sie bedzie troche inaczej, ale bedzie to mialo miejsce dla poszczegolnych stacji
                $this->slican = new Slican();
                $comm = '';
                if ($user != null)
                {
                    $comm .= $this->log_ind_comm.' '.$user.' '.$this->password;
                }
                else
                {
                    $comm .= $this->log_ogol_comm.' '.$this->password;
                }
                if ($user == null)
                {
                    $this->DoCommand($comm, $r);
                    echo $r;
                }
                else
                {
                    $licz = 10;
                    $polaczono = false;
                    while ($licz > 0)
                    {
                        $this->DoCommand($comm, $r);
                        //komenda polaczenia i odpowiedz
                        //echo $comm;
                        //echo $r;
                        $tab_zwr = explode(' ', $r);
                        if ($tab_zwr[0] == 'aOK')
                        {
                            $licz = 0;
                            $polaczono = true;  
                        }
                        else
                        {
                            $licz--;
                        }
                    }
                    if (!$polaczono)
                    {
                        $rv = 3;
                        $this->ConnectError($rv);
                        return $rv;
                    }
                }
                //jesli $r daje aNa to nie pojdzie, trzebaby petlic az chwyci
            } 
            else $rv=1;
        }
        
        if ($rv) $this->ConnectError($rv);
        return $rv;
    }
    
    public function Disconnect($exit=1) 
    {
        if ($this->fp) 
        {
            if ($exit) $this->DoCommand('exit', $junk);
            fclose($this->fp);
            $this->fp = NULL;
        }
    }

    function DoCommand($c,&$r) 
    {
        if ($this->fp) 
        {
            fputs($this->fp,"$c\r");
            $this->Sleep();
            $this->GetResponse($r);
            $r=preg_replace("/^.*?\n(.*)\n[^\n]*$/","$1",$r);
        }
        return $this->fp?1:0;
    }
    public function Polecenie($komenda)
    {
        if ($this->fp) 
        {
            fputs($this->fp, "$komenda\r"); ///problem tkwil w tym stringu ..... sprawdzic ile powyzszych sleepow nie ma racji bytu
            //echo $komenda;
            //$this->Sleep();
            //$this->GetResponse($r);
            //$r=preg_replace("/^.*?\n(.*)\n[^\n]*$/","$1",$r);
            //var_dump($r);
        }
        return $this->fp?1:0;
    }
    
    public function GetResponse(&$r)  //dodac 2 parametr nieobowiazkowy - krotnosc sleepow - po przekroczeniu pewnej liczby ³¹czenie zaniechane
    {   
        $r='';
        do 
        { 
            $s = socket_get_status($this->fp);
            
            /*echo 'Przed: ';
            var_dump($s);
            echo '<br /><br />';*/
            $r .= fread($this->fp, 1000);
            $s = socket_get_status($this->fp);
            /*echo 'Po: ';
            var_dump($s);
            echo '<br /><br />';*/
        } 
        while ($s['unread_bytes']);
    }
    public function Listen(&$response)
    {
        $i = 0;
        while (1) //zamienic na while 1, zbudowac silnik zczytywania i interpretacji pakietow, dala adminskiego + tabelki - ewidencja w bazie :P - osobna baza (???) nie raczej nie, 
        //niech to wejdzie z panelem i bedzie wpanelu
        {
            $response = '';
            do 
            { 
                $response .= fread($this->fp, 1000);
                $s=socket_get_status($this->fp);
                $i++;
            } 
            while ($s['unread_bytes']);
            //tu odpalic metode z obiektu slican przyjetopakiet czy cos :P
            $this->slican->OdebranoKomunikat($response);
            //$this->Sleep();
            usleep($this->cust_sleeptime);
        }
    }
    
    function Sleep() {
        if ($this->use_usleep) usleep($this->sleeptime);
        else sleep(1);
    }
    
    function PHPTelnet() 
    {
        $this->conn1=chr(0xFF).chr(0xFB).chr(0x1F).chr(0xFF).chr(0xFB).
            chr(0x20).chr(0xFF).chr(0xFB).chr(0x18).chr(0xFF).chr(0xFB).
            chr(0x27).chr(0xFF).chr(0xFD).chr(0x01).chr(0xFF).chr(0xFB).
            chr(0x03).chr(0xFF).chr(0xFD).chr(0x03).chr(0xFF).chr(0xFC).
            chr(0x23).chr(0xFF).chr(0xFC).chr(0x24).chr(0xFF).chr(0xFA).
            chr(0x1F).chr(0x00).chr(0x50).chr(0x00).chr(0x18).chr(0xFF).
            chr(0xF0).chr(0xFF).chr(0xFA).chr(0x20).chr(0x00).chr(0x33).
            chr(0x38).chr(0x34).chr(0x30).chr(0x30).chr(0x2C).chr(0x33).
            chr(0x38).chr(0x34).chr(0x30).chr(0x30).chr(0xFF).chr(0xF0).
            chr(0xFF).chr(0xFA).chr(0x27).chr(0x00).chr(0xFF).chr(0xF0).
            chr(0xFF).chr(0xFA).chr(0x18).chr(0x00).chr(0x58).chr(0x54).
            chr(0x45).chr(0x52).chr(0x4D).chr(0xFF).chr(0xF0);
        $this->conn2=chr(0xFF).chr(0xFC).chr(0x01).chr(0xFF).chr(0xFC).
            chr(0x22).chr(0xFF).chr(0xFE).chr(0x05).chr(0xFF).chr(0xFC).chr(0x21);
    }
    
    protected function ConnectError($num) {
        if ($this->show_connect_error) switch ($num) 
        {
        case 1: echo '<br />[PHP Telnet] <a href="http://www.geckotribe.com/php-telnet/errors/fsockopen.php">Connect failed: Unable to open network connection</a><br />'; break;
        case 2: echo '<br />[PHP Telnet] <a href="http://www.geckotribe.com/php-telnet/errors/unknown-host.php">Connect failed: Unknown host</a><br />'; break;
        case 3: echo '<br />[PHP Telnet] <a href="http://www.geckotribe.com/php-telnet/errors/login.php">Connect failed: Login failed</a><br />'; break;
        case 4: echo '<br />[PHP Telnet] <a href="http://www.geckotribe.com/php-telnet/errors/php-version.php">Connect failed: Your server\'s PHP version is too low for PHP Telnet</a><br />'; break;
        }
    }
}
?>