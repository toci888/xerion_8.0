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

    
    
    if (isset($_POST['wojewodztwo']) || isset($_SESSION['woj']))
    {
        //echo $_POST['hid_w'];
        if (isset($_POST['hid_w']))
        {
            $_SESSION['woj'] = $_POST['hid_w'];
        }
        else
        {
            $_POST['hid_w'] = $_SESSION['woj'];
        }
        $query = "select id, nazwa from powiat where id_wojewodztwo = ".$_POST['hid_w']." order by nazwa asc;";
        $dal->pgSelect($query);
        
        echo '<form method="POST" target="center" action="gminy.php"><table>';
        echo '<input type="hidden" name="hid_p" id="hid_p">';
           
        $i = 0;  
        while (isset($dal->rows[$i]))
        {
            $row = $dal->rows[$i];
            
            echo '<tr><td>';
            $kontrolki->AddSubmit('powiat', $row['id'], $row['id'].': '.$row['nazwa'], 'onclick="hid_p.value=this.id;"');
            echo '</td></tr>';
            $i++;
        }
        
        echo '</table></form>';
    }
    else
    {
        echo 'Script called illegally.';
    }

    require("../stopka.php");

?>
</body>
</html>
