<?


$ip = $REMOTE_ADDR;
$time = time();
$minutes = 10;
$found = 0;
$users = 0;
$user  = "";

//$tmpdata = $DOCUMENT_ROOT."data";
$tmpdata = "/vadmin/skroty/azg.pl/data";

if (!is_file("$tmpdata/online.txt"))	
	{
	$s = fopen("$tmpdata/online.txt","w");
	fclose($s);
	chmod("$tmpdata/online.txt",0666);
	}

$f = fopen("$tmpdata/online.txt","r+");
flock($f,2);

while (!feof($f))
	{
	$user[] = chop(fgets($f,65536));
	}

fseek($f,0,SEEK_SET);
ftruncate($f,0);

foreach ($user as $line)
	{
	list($savedip,$savedtime) = split("\|",$line);
	if ($savedip == $ip) {$savedtime = $time;$found = 1;}
	if ($time < $savedtime + ($minutes * 60)) 
		{
		fputs($f,"$savedip|$savedtime\n");
		$users = $users + 1;
		}
	}

if ($found == 0) 
	{
	fputs($f,"$ip|$time\n");
	$users = $users + 1;
	}

fclose ($f);
print "&nbsp;&nbsp;U¿ytkownicy Online :&nbsp;$users";
?>
