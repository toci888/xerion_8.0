<?php
    include_once ('class.phpmailer.php');
    
    class MailSend
    {
        protected $mail;
        
        protected $uzytkownik_uw = 'informatyk';
        protected $haslo = 'abn62beatka';
        protected $komp_wys_ip = '217.197.72.138';
        protected $mailer = 'smtp';
        protected $charset = 'iso-8859-2';
        protected $smtpauth = true;
        protected $mail_firmowy = 'azgwarancja@azg.pl'; //zmienic na azgwarancja
        
        public function MailSend()
        {
            $this->mail = new PHPMailer();
            $this->mail->IsSMTP(); // telling the class to use SMTP
            $this->mail->Username = $this->uzytkownik_uw;
            $this->mail->Password = $this->haslo;
            $this->mail->Host = $this->komp_wys_ip; // SMTP server
            //$mail->From = $_POST['mail'];
            $this->mail->Mailer = $this->mailer;
            //$mail->ContentType = "text/html";
            $this->mail->CharSet = $this->charset;
            $this->mail->SMTPAuth = $this->smtpauth;
            $this->mail->FromName = "A. Z. Gwarancja";
        }
        
        public function DodajUkrytyOdbiorca ($email)
        {
            $this->mail->AddBCC($email);
        }
        public function DodajOdbiorca($email)
        {
            $this->mail->AddAddress($email);
        }
        public function DodajZalacznik($nazwa_plik)
        {
            $this->mail->AddAttachment($nazwa_plik);
        }
        /**
        * @desc Wys³anie maila. Tematu i tresci nie mozna ustawic za wczasu w obiekcie, domyslnie typ tresci nie jest definiowany
        */
        public function WyslijMail($temat, $tresc, $typ_tresc = null, $wyslij_od = null, $odpowiedz_do = null)
        {
            $this->mail->Subject = $temat;
            $this->mail->Body = $tresc;
            
            if ($typ_tresc != null)
            {
                $this->mail->ContentType = $typ_tresc;
            }
            
            if ($wyslij_od != null)
            {
                $this->mail->From = $wyslij_od;
            }
            else
            {
                $this->mail->From = $this->mail_firmowy;
            }
            if ($odpowiedz_do != null)
            {
                $this->mail->AddReplyTo($odpowiedz_do);
            }
            else
            {
                $this->mail->AddReplyTo($this->mail_firmowy);
            }
            
            $result = $this->mail->Send();
            return $result;
        }        
    }
?>