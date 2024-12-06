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
        $query = $query = "select email from mailing where id_wojewodztwo = ".$_POST['hid_w'].";";
        $dal->pgSelect($query);  
        
        $mail = new PHPMailer();
        $mail->IsSMTP(); // telling the class to use SMTP
        //$mail->Host = "192.168.1.50"; // SMTP server
        $mail->Username = "informatyk-azg.pl";
        $mail->Password = "bartek123";
        $mail->Host = "213.218.124.66"; // SMTP server
        $mail->From = $_POST['mail'];
        $mail->Sender = $_POST['mail'];
        $mail->Mailer = "smtp";
        $mail->SMTPAuth = true;
        $mail->FromName="A. Z. Gwarancja";
        $mail->Subject = "".$_POST['temat'].".";
        $mail->Body = "".$_POST['tresc']."";
        
        $i = 0;       
        $j = 0; 
        while (isset($dal->rows[$i]))
        {
            $row = $dal->rows[$i];
            if ($row['email'] != "")
            {
                //$mail->AddBCC("b.zapart@eena.pl");
                //$mail->AddBCC("".$row['email']."");
                //tu po tescie org
                //$mail->AddAddress("b.zapart@eena.pl");
                $mail->AddAddress($row['email']);
                if(!$mail->Send())
                {
                    echo "<center>Wiadomości nie wysłano. Skontaktuj się z administratorem.</center><br>";
                    echo "Mailer Error: " . $mail->ErrorInfo;
                } 
                else 
                {
                    $j++;
                    //echo "<center>Wiadomość wysłano pomyślnie.</center><br>";
                }
                $mail->ClearAllRecipients();
            }
            $i++;
        }
        
        echo 'Wysłanych pomyślnie : '.$j.'.';
        /*if(!$mail->Send())
        {
            echo "<center>Wiadomości nie wysłano. Skontaktuj się z administratorem.</center><br>";
            echo "Mailer Error: " . $mail->ErrorInfo;
        } 
        else 
        {
            echo "<center>Wiadomość wysłano pomyślnie.</center><br>";
        } */
    }
    else
    {
        echo 'Skrypt nie może być wywołany w ten sposób.';
    }
    require("../stopka.php");
?>
</body>
</html>
