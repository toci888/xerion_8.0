<html><head><title>A.Z.Gwarancja - Baza Danych</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-2">
  <script language="javascript1.3" src="../js/script.js"></script>
<link href="../css/style.css" rel="stylesheet" type="text/css"></head>
<body>
<?
    require("../naglowek.php");
    include_once ("../dal.php");
    include ("../kontrolki_html.php");
    session_start();
    $kontrolki = new KontrolkiHtml();
    $dal = new dal();

    $query = "select id, nazwa from wojewodztwo order by nazwa asc;";
    $dal->pgSelect($query);
    
    echo '<form method="POST" target="center" action="powiaty.php"><table>';
    echo '<input type="hidden" name="hid_w" id="hid_w">';
       
    $i = 0;  
    while (isset($dal->rows[$i]))
    {
        $row = $dal->rows[$i];
        
        echo '<tr><td>';
        $kontrolki->AddSubmit('wojewodztwo', $row['id'], $row['nazwa'], 'onclick="hid_w.value=this.id;"');
        echo '</td></tr>';
        $i++;
    }
    
    echo '</table></form>';
        
    
    //echo '<form method="POST" target="center" action="panel_adm/jezyk.php">';
    //$kontrolki->AddSubmit('jezyki', 'jezyki', 'Języki', '');
    //echo '</form>';
    
	require("../stopka.php");
?>
</body>
</html>
