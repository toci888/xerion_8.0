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

    
    
    if (isset($_POST['gmina']))
    {
        //echo $_POST['hid_w'];

        $query = "select id, nazwa from miejscowosc where id_gmina = ".$_POST['hid_p_g']." order by nazwa asc;";
        $dal->pgSelect($query);
        
        if ($dal->numRows > 0)
        {
            echo '<table>';
            $i = 0;  
            while (isset($dal->rows[$i]))
            {
                $row = $dal->rows[$i];
                
                echo '<tr><td>'.$row['nazwa'].'</td></tr>';
                $i++;
            }
            echo '</table>';
        }
        //else
        //{
            echo '<form method="POST" target="center" action="wpr_msc.php">';
            echo '<input type="hidden" name="hid_p_g" id="hid_p_g">';
            echo '<textarea cols="50" rows="15" name="miejscowosci_gus"></textarea>';
            $kontrolki->AddSubmit('wpr_msc', $_POST['hid_p_g'], 'Zatwierdz', 'onclick="hid_p_g.value=this.id;"');
            echo '</form>';
        //}
    }
    else
    {
        echo 'Script called illegally.';
    }

    require("../stopka.php");

?>
</body>
</html>
