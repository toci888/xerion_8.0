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
    
    if (isset($_POST['wyslij']))
    {
        $mail = new PHPMailer();
        $mail->IsSMTP(); // telling the class to use SMTP
        //$mail->Host = "192.168.1.50"; // SMTP server
        $mail->Username = "informatyk-azg.pl";
        $mail->Password = "bartek123";
        $mail->Host = "213.218.124.66"; // SMTP server
        $mail->From = $_POST['mail'];
        $mail->Mailer = "smtp";
        $mail->SMTPAuth = true;
        $mail->Sender = $_POST['mail'];
        $mail->FromName="A. Z. Gwarancja";
        $mail->Subject = "".$_POST['temat'].".";
        $mail->Body = "".$_POST['tresc']."";
        
        $mail->AddBCC("".$_POST['mail']."");
        //$mail->AddBCC("bzapart@gmail.com");
        if(!$mail->Send())
        {
            echo "<center>Wiadomości nie wysłano. Skontaktuj się z administratorem.</center><br>";
	        echo "Mailer Error: " . $mail->ErrorInfo;
        } 
        else 
        {
            echo "<center>Wiadomość wysłano pomyślnie.</center><br>";
        }
    }
    echo 'Email testowy.';
    echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'">';
    echo '<table><tr><td>';
    echo 'Mail zwrotny : </td><td>'.$kontrolki->AddTextbox('mail', 'mail', '', 30, 30, '').'</td></tr>';
    echo '<tr><td>Temat wiadomości: </td><td>'.$kontrolki->AddTextbox('temat', 'temat', '', 60, 60, '').'</td></tr><tr><td>';
    $kontrolki->AddSubmit('wyslij', 'wyslij', 'Wyślij', '');   
    echo '</td></tr></table>';
    echo '<textarea name="tresc" rows="60" cols="60" ></textarea>';
    echo '</form>';
    
    require("../stopka.php");
?>
</body>
</html>
