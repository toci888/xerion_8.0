<html><head><title>A.Z.Gwarancja - Baza Danych</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-2">
  <script language="javascript1.3" src="../js/script.js"></script>
<link href="../css/style.css" rel="stylesheet" type="text/css"></head>
<body>
<?php
    require("../naglowek.php");
    include_once ("../dal.php");
    include ("../kontrolki_html.php");  
    include ('../lib/class.phpmailer.php');
    session_start();
    $kontrolki = new KontrolkiHtml();
    $dal = new dal();
    
    $query = "select count(id) as ilosc from mailing where id_wojewodztwo = ".$_POST['hid_w'].";";
    $dal->pgSelect($query);  
    
    $row = $dal->rows[0];
    
    echo 'Ilość maili na województwo : '.$row['ilosc'];
    
    if ($row['ilosc'] > 0)
    {
        echo '<form method="POST" action="wysylka.php">';
        echo '<table><tr><td>';      
    	echo 'Mail zwrotny : </td><td>'.$kontrolki->AddTextbox('mail', 'mail', '', 30, 30, '').'</td></tr>';
	    echo '<tr><td>Temat wiadomości: </td><td>'.$kontrolki->AddTextbox('temat', 'temat', '', 60, 60, '').'</td></tr><tr><td>';
        echo '<input type="hidden" name="hid_w" id="hid_w" value="'.$_POST['hid_w'].'" />';  
        $kontrolki->AddSubmit('wyslij', 'wyslij', 'Wyślij', '');  
        echo '</td></tr></table>';
        echo '<textarea name="tresc" rows="60" cols="60" ></textarea>'; 
        echo '</form>';
    }
    else
    {
	    echo '<br />Nie ma maili, pod które możnaby wysłać wiadomość.';
    }
    
    require("../stopka.php");
?>
</body>
</html>
