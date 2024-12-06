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
    include_once ('../../dal/admDAL.php');
    include_once ('../../ui/kontrolki_html.php');
    include_once ('../../ui/utilsui.php');
    include_once ('../../bll/parametrynierbll.php'); 
    include_once ('../../bll/tags.php'); 
    include_once ('../../bll/agentbll.php');
    include_once ('../../bll/jezykibll.php');
    include_once ('../../bll/cache.php');
    include_once ('../../bll/transnierbll.php');
    require('../../naglowek.php');
    require('../../conf.php');
    
    if (!isset($_SESSION[$zalogowany]))
    {
        echo 'Nie jesteÅ› zalogowany.';
    }
    else
    {
        $uprawnienia = unserialize($_SESSION[$zalogowany]);
        
        if ($uprawnienia->adm_dane)
        {
            $tlumaczenia = cachejezyki::Czytaj();
            $agent_zal = unserialize($_SESSION[$dane_agent]);
            
            if (isset($_POST['kasuj']))
            {
                $dal = new AdministracjaDAL();
                $tabParametr[AdministracjaDAL::$email] = $_POST['email'];
                $wynik = $dal->UsunMailBiura($tabParametr);
                if ($wynik)
                {
                    UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_powiodla_sie));
                }
                else
                {
                    UtilsUI::InfoBlad($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_nie_powiodla_sie));
                }
            }
            echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'">';
            KontrolkiHtml::DodajEmailTextbox('email', 'id_email', '', 40, 35, '', '');
            echo '<br />';
            KontrolkiHtml::DodajSubmit('kasuj', 'id_kasuj', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$kasuj), '');
            echo '</form>';
        }
    }
    require('../../stopka.php');
?>
</body>
</html>
