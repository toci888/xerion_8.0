<HTML>
<HEAD>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <script language="javascript" src="../../js/script.js"></script>
<link href="../../css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<?php
    // ¶ ±
    session_start();
    include_once ('../../dal/queriesDAL.php');
    include_once ('../../ui/kontrolki_html.php');
    include_once ('../../ui/utilsui.php'); 
    include_once ('../../bll/parametrynierbll.php');
    include_once ('../../bll/tags.php'); 
    include_once ('../../bll/agentbll.php');
    include_once ('../../bll/jezykibll.php');
    include_once ('../../bll/cache.php');
    require('../../naglowek.php');
    require('../../conf.php');
    
    if (!isset($_SESSION[$zalogowany]))
    {
        echo 'Nie jesteÅ› zalogowany.';
    }
    else
    {
        //plik przeznaczony do popupu wymuszajacego podanie informacji, chodzi o zanotowanie przyczyny zmiany statusu
        $tlumaczenia = cachejezyki::Czytaj();
        $agent_zal = unserialize($_SESSION[$dane_agent]); 
        $dal = new NieruchomoscDAL();
        
        if (isset($_GET[NieruchomoscDAL::$id_nieruchomosc]))
        {
            $nieruchomosc_id = $_GET[NieruchomoscDAL::$id_nieruchomosc];
        }
        if (isset($_POST[NieruchomoscDAL::$id_nieruchomosc]))
        {
            $nieruchomosc_id = $_POST[NieruchomoscDAL::$id_nieruchomosc];
        }
        
        if(isset($_POST['dodaj']))
        {
            //echo '<script>this.document.body.removeChild(this.document.body.lastChild);</script>';
            //echo '<script>div_popup_wymuszenie.style.display = \'none\';</script>';
            //echo '<script>alert(document.getElementById(\'div_popup_wymuszenie\'));</script>';
            //echo '<script>document.getElementById(\'id_dodaj\').parentNode.parentNode.removeChild(document.getElementById(\'id_dodaj\').parentNode);</script>';
            //echo '<script>document.body.removeChild(document.body.parentNode.parentNode);</script>';
            
            //echo '<script>alert(parent.frames[2].document.body.lastChild);</script>';
            //echo '<script>alert(document.getElementById(\'popup_wymuszenie\'));</script>';
            
            
            ///chyba tak by zadzialalo 
            //echo '<script>parent.document.body.removeChild(document.body.parentNode.parentNode);</script>';
            
            //echo '<script>alert(parent.document.getElementById("notatka_wymuszenie").style.display);</script>';
            
            //echo '<script>window.removeChild(parent.frames[2].document.getElementById(\'popup_wymuszenie\').value);</script>';
            if (strlen($_POST['tresc_not']) > 10)
            {
                $tabParametr[NieruchomoscDAL::$id_nieruchomosc] = $_POST[NieruchomoscDAL::$id_nieruchomosc];
                $tabParametr[NieruchomoscDAL::$id_agent] = $agent_zal->id;
                $tabParametr[NieruchomoscDAL::$notatka] = $_POST['tresc_not'];
                
                $wynik = $dal->DodajOpisNieruchomosc($tabParametr);
                if ($wynik == null)
                {
                    UtilsUI::InfoBlad($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_nie_powiodla_sie));
                }
                //zamkniecie
                //document.body.parentNode.parentNode
                //echo '<script>window.removeChild(document.body.parentNode.parentNode);</script>';
                //echo '<script>this.display = \'none\';</script>';
                echo '<script>parent.document.getElementById("notatka_wymuszenie").style.display = "none";</script>';
                echo '<script>parent.document.getElementById("przycisk_zatwierdz").style.display = "";</script>';
            }
        }
        
        echo '<form name="dodanie_notatka" id="dodanie_notatka" method="POST" action="'.$_SERVER['PHP_SELF'].'"><table>';
        KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_nieruchomosc, NieruchomoscDAL::$id_nieruchomosc, $nieruchomosc_id);
        echo '<tr><td><b>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$notatka_wewnetrzna_do_nieruchomosci).' : </b></td></tr><tr><td>'; 
        KontrolkiHtml::DodajTextArea('tresc_not','id_tresc_not','','40','5','');
        echo '</td></tr><tr><td>';
        KontrolkiHtml::DodajSubmit('dodaj', 'id_dodaj', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$dodaj), '');
        echo '</tr></td></table></form>';   
    }
    require('../../stopka.php');

?>
</body>
</html>
