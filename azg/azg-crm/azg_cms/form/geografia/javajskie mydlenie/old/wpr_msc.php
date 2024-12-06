<HTML>
<HEAD>
  <META HTTP-EQUIV="Content-type" CONTENT="text/html; charset=iso-8859-2">
  <script language="javascript" src="../js/script.js"></script>
<link href="../css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<?php
    // � �
    require("../naglowek.php");
    include ("../dal.php");
    include ("../kontrolki_html.php");
    session_start();
    $kontrolki = new KontrolkiHtml();
    $dal = new dal();
    
    echo 'Gmina nr: '.$_POST['hid_p_g'].'<br />';

    if (isset($_POST['wpr_msc']))
    {
        $odlamki = explode(';', $_POST['miejscowosci_gus']);
        //var_dump($odlamki);
        
        $handle = fopen("out.sql", "a");
        flock($handle, 2); 

        $i = 0;
        $odlamki[$i] = trim($odlamki[$i]); 
        while (strlen($odlamki[$i]) > 1)//($i < 10)//(isset($odlamki[$i]))
        {
            $test = "select id from miejscowosc where nazwa = '".$odlamki[$i]."' and id_gmina = ".$_POST['hid_p_g'].";";
            $dal->pgSelect($test);
            
            if ($dal->numRows > 0)
            {
                echo $odlamki[$i].' figuruje w tej gminie.<br />';
            }
            else
            {
                $insert = "insert into miejscowosc (id_gmina, nazwa) values (".$_POST['hid_p_g'].", '".$odlamki[$i]."');";
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

        // zamkni�cie pliku 
        fclose($handle);
        
        echo '<a href="gminy.php">Gminy</a>';
    }
    
    require("../stopka.php");

?>
</body>
</html>
