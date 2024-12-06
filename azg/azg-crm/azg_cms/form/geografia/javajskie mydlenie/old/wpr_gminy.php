<HTML>
<HEAD>
  <META HTTP-EQUIV="Content-type" CONTENT="text/html; charset=iso-8859-2">
  <script language="javascript" src="../js/script.js"></script>
<link href="../css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<?php
    // ś ą
    require("../naglowek.php");
    include ("../dal.php");
    include ("../kontrolki_html.php");
    session_start();
    $kontrolki = new KontrolkiHtml();
    $dal = new dal();
    
    echo 'Powiat nr: '.$_POST['hid_p_g'].'<br />';

    if (isset($_POST['wpr_gminy']))
    {
        $odlamki = explode(';', $_POST['gminy_gus']);
        //var_dump($odlamki);
        
        $handle = fopen("out.sql", "a");
        flock($handle, 2); 

        $i = 0;
        $odlamki[$i] = trim($odlamki[$i]); 
        while (strlen($odlamki[$i]) > 1)//($i < 10)//(isset($odlamki[$i]))
        {
            $test = "select id from gmina where nazwa = '".$odlamki[$i]."' and id_powiat = ".$_POST['hid_p_g'].";";
            $dal->pgSelect($test);
            
            if ($dal->numRows > 0)
            {
                echo $odlamki[$i].' figuruje w tym powiecie.<br />';
            }
            else
            {
                $insert = "insert into gmina (id_powiat, nazwa) values (".$_POST['hid_p_g'].", '".$odlamki[$i]."');";
                if ($dal->pgQuery($insert))
                {
                    fwrite($handle, $insert.'
');
                }
            } 
            $i++;
            $odlamki[$i] = trim($odlamki[$i]);
        }
        // odblokowanie pliku 
        flock($handle, 3); 

        // zamknięcie pliku 
        fclose($handle);
        
        echo '<a href="powiaty.php">Powiaty</a>';
    }
    
    require("../stopka.php");

?>
</body>
</html>
