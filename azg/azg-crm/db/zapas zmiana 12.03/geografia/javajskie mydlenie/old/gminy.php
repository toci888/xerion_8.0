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

    
    
    if (isset($_POST['powiat']) || isset($_SESSION['pow']))
    {
        //echo $_POST['hid_w'];
        if (isset($_POST['hid_p']))
        {
            $_SESSION['pow'] = $_POST['hid_p'];
        }
        else
        {
            $_POST['hid_p'] = $_SESSION['pow'];
        }
        $query = "select id, nazwa from gmina where id_powiat = ".$_POST['hid_p']." order by nazwa asc;";
        $dal->pgSelect($query);
        
        if ($dal->numRows > 0)
        {
            echo '<form method="POST" target="center" action="miejscowosci.php"><table>'; 
            echo '<input type="hidden" name="hid_p_g" id="hid_p_g">';
               
            $i = 0;  
            while (isset($dal->rows[$i]))
            {
                $row = $dal->rows[$i];
                
                echo '<tr><td>';
                $kontrolki->AddSubmit('gmina', $row['id'], $row['id'].': '.$row['nazwa'], 'onclick="hid_p_g.value=this.id;"');
                echo '</td></tr>';
                $i++;
            }
            
            echo '</table></form>';
        }
        //else
        //{
            echo '<form method="POST" target="center" action="wpr_gminy.php">';
            echo '<input type="hidden" name="hid_p_g" id="hid_p_g">';
            echo '<textarea cols="50" rows="15" name="gminy_gus"></textarea>';
            $kontrolki->AddSubmit('wpr_gminy', $_POST['hid_p'], 'Zatwierdz', 'onclick="hid_p_g.value=this.id;"');
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
