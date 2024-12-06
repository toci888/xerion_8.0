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
        $tlumaczenia = cachejezyki::Czytaj();
        $agent_zal = unserialize($_SESSION[$dane_agent]); 
        
        
        if (isset($_GET[WyposazenieZapDAL::$id_zapotrzebowanie_trans_rodzaj]))
        {
            $_SESSION[WyposazenieZapDAL::$id_zapotrzebowanie_trans_rodzaj] = $_GET[WyposazenieZapDAL::$id_zapotrzebowanie_trans_rodzaj];
        }
        if (isset($_POST[WyposazenieZapDAL::$id_zapotrzebowanie_trans_rodzaj]))
        {
            $_SESSION[WyposazenieZapDAL::$id_zapotrzebowanie_trans_rodzaj] = $_POST[WyposazenieZapDAL::$id_zapotrzebowanie_trans_rodzaj];
        }
        $dal = new WyposazenieZapDAL($_SESSION[WyposazenieZapDAL::$id_zapotrzebowanie_trans_rodzaj]);
        
        if (isset($_POST['dodaj']))
        {
            //$tabParametr[WyposazenieZapDAL::$id_opis] = $_POST['opis_id'];
            $tabParametr[WyposazenieZapDAL::$id_zapotrzebowanie_trans_rodzaj] = $_POST[WyposazenieZapDAL::$id_zapotrzebowanie_trans_rodzaj];
            $tabParametr[WyposazenieZapDAL::$id_jezyk] = $_POST['jezyk_id'];
            $tabParametr[WyposazenieZapDAL::$tresc] = $_POST['tresc'.$_POST['jezyk_id']];
            if (strlen($_POST['tresc'.$_POST['jezyk_id']]) > 0)
            {
                $wynik = $dal->DodajOpisZapotrzebowanieTrRodz($tabParametr);  
            }
            else
            {
                $wynik = false;
            }
            if (!$wynik)
            {
                UtilsUI::InfoBlad($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_nie_powiodla_sie));
            }
        }
        if (isset($_POST['aktualizuj']))
        {
            $tabParametr[WyposazenieZapDAL::$id_opis] = $_POST['opis_id'];
            $tabParametr[WyposazenieZapDAL::$id_zapotrzebowanie_trans_rodzaj] = $_POST[WyposazenieZapDAL::$id_zapotrzebowanie_trans_rodzaj]; 
            $tabParametr[WyposazenieZapDAL::$id_jezyk] = 'null';
            $tabParametr[WyposazenieZapDAL::$tresc] = $_POST['tresc'.$_POST['opis_id']];

                $wynik = $dal->DodajOpisZapotrzebowanieTrRodz($tabParametr);    
            
            if (!$wynik)
            {
                UtilsUI::InfoBlad($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_nie_powiodla_sie));
            }
        }
        if (isset($_POST['kasuj']))
        {
            $tabParametr[WyposazenieZapDAL::$id_opis] = $_POST['opis_id'];
            $wynik = $dal->UsunOpisZapotrzebowanieTrRodz($tabParametr); 
            
            if (!$wynik)
            {
                UtilsUI::InfoBlad($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_nie_powiodla_sie));
            }
        }
        //echo $_SESSION[NieruchomoscDAL::$id_oferta];
        
        
        $wynik = $dal->PodajDostOpisZapotrzebowanieTrRodz(array(WyposazenieZapDAL::$id_zapotrzebowanie_trans_rodzaj => $_SESSION[WyposazenieZapDAL::$id_zapotrzebowanie_trans_rodzaj]), $ilosc_wierszy);
        
        echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'"><table>';
        KontrolkiHtml::DodajHidden(WyposazenieZapDAL::$id_zapotrzebowanie_trans_rodzaj, WyposazenieZapDAL::$id_zapotrzebowanie_trans_rodzaj, $_SESSION[WyposazenieZapDAL::$id_zapotrzebowanie_trans_rodzaj]);
        KontrolkiHtml::DodajHidden(WyposazenieZapDAL::$id_jezyk, WyposazenieZapDAL::$id_jezyk, $jezyk);
        KontrolkiHtml::DodajHidden('jezyk_id', 'jezyk_id', '');
            
        if($ilosc_wierszy > 0)
        {    
            foreach ($wynik as $wiersz)
            {
                echo '<tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$opis).': '.$wiersz[WyposazenieZapDAL::$jezyk].'</td></tr><tr><td>';
                KontrolkiHtml::DodajTextArea('tresc'.$wiersz[WyposazenieZapDAL::$id_jezyk],'id_tresc','','40','5',''); 
                echo '</td></tr><tr><td>';
                KontrolkiHtml::DodajSubmit('dodaj', $wiersz[WyposazenieZapDAL::$id_jezyk], $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$dodaj), 'onclick="jezyk_id.value=this.id;"');
                echo '</td></tr>';
            }
        } 
        echo '</table></form><hr />'; 
        
        $wynik = $dal->PodajOpisZapotrzebowanieTrRodz(array(WyposazenieZapDAL::$id_zapotrzebowanie_trans_rodzaj => $_SESSION[WyposazenieZapDAL::$id_zapotrzebowanie_trans_rodzaj]), $ilosc_wierszy);
        echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'"><table>';
        KontrolkiHtml::DodajHidden(WyposazenieZapDAL::$id_zapotrzebowanie_trans_rodzaj, WyposazenieZapDAL::$id_zapotrzebowanie_trans_rodzaj, $_SESSION[WyposazenieZapDAL::$id_zapotrzebowanie_trans_rodzaj]);
        KontrolkiHtml::DodajHidden('opis_id', 'opis_id', '');
        if($ilosc_wierszy > 0)
        {    
            foreach ($wynik as $wiersz)
            {
                //var_dump($wiersz);
                echo '<tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$opis).': '.$wiersz[WyposazenieZapDAL::$jezyk].'</td></tr><tr><td>';
                KontrolkiHtml::DodajTextArea('tresc'.$wiersz[WyposazenieZapDAL::$id_opis],'id_tresc'.$wiersz[WyposazenieZapDAL::$id_jezyk],$wiersz[WyposazenieZapDAL::$opis],'40','5',''); 
                echo '</td></tr><tr><td>';
                KontrolkiHtml::DodajSubmit('aktualizuj', $wiersz[WyposazenieZapDAL::$id_opis], $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$aktualizuj), 'onclick="opis_id.value=this.id;"');
                echo '&nbsp;';
                KontrolkiHtml::DodajSubmit('kasuj', $wiersz[WyposazenieZapDAL::$id_opis], $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$kasuj), 'onclick="opis_id.value=this.id;"');
                echo '</td></tr>';
            }
        }
        echo '</table></form><hr />';    
    }
    require('../../stopka.php');

?>
</body>
</html>
