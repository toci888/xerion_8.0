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
        $dal = new NieruchomoscDAL();
        
        //$_SESSION[NieruchomoscDAL::$id_oferta]
        if (isset($_GET[NieruchomoscDAL::$id_oferta]))
        {
            $oferta_id = $_GET[NieruchomoscDAL::$id_oferta];
        }
        if (isset($_POST[NieruchomoscDAL::$id_oferta]))
        {
            $oferta_id = $_POST[NieruchomoscDAL::$id_oferta];
        }
        if (isset($_POST['dodaj']))
        {
            $tabParametr[NieruchomoscDAL::$id_oferta] = $_POST[NieruchomoscDAL::$id_oferta];
            $tabParametr[NieruchomoscDAL::$id_jezyk] = $_POST['jezyk_id'];
            $tabParametr[NieruchomoscDAL::$tresc] = $_POST['tresc'.$_POST['jezyk_id']];
            if (strlen($_POST['tresc'.$_POST['jezyk_id']]) > 0)
            {
                $wynik = $dal->DodajOpisOferta($tabParametr);  
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
            $tabParametr[NieruchomoscDAL::$id_opis] = $_POST['opis_id'];
            $tabParametr[NieruchomoscDAL::$id_oferta] = $_POST[NieruchomoscDAL::$id_oferta];
            $tabParametr[NieruchomoscDAL::$tresc] = $_POST['tresc'.$_POST['opis_id']];

                $wynik = $dal->DodajOpisOferta($tabParametr);    
            
            if (!$wynik)
            {
                UtilsUI::InfoBlad($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_nie_powiodla_sie));
            }
        }
        if (isset($_POST['kasuj']))
        {
            $tabParametr[NieruchomoscDAL::$id_opis] = $_POST['opis_id'];
            $wynik = $dal->UsunOpisOferta($tabParametr); 
            
            if (!$wynik)
            {
                UtilsUI::InfoBlad($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_nie_powiodla_sie));
            }
        }
        //echo $_SESSION[NieruchomoscDAL::$id_oferta];
        
        
        $wynik = $dal->PodajDostOpisOferta(array(NieruchomoscDAL::$id_oferta => $oferta_id), $ilosc_wierszy);
        UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nr_oferty).': '.$oferta_id);
        UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$opis_oferty));
        echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'"><table>';
        KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_oferta, NieruchomoscDAL::$id_oferta, $oferta_id);
        KontrolkiHtml::DodajHidden(NieruchomoscDAL::$jezyk, NieruchomoscDAL::$jezyk, $jezyk);
        KontrolkiHtml::DodajHidden('jezyk_id', 'jezyk_id', '');
            
        if($ilosc_wierszy > 0)
        {    
            foreach ($wynik as $wiersz)
            {
                echo '<tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$opis).': '.$wiersz[NieruchomoscDAL::$jezyk].'</td></tr><tr><td>';
                KontrolkiHtml::DodajTextArea('tresc'.$wiersz[NieruchomoscDAL::$id_jezyk],'id_tresc','','40','5',''); 
                echo '</td></tr><tr><td>';
                KontrolkiHtml::DodajSubmit('dodaj', $wiersz[NieruchomoscDAL::$id_jezyk], $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$dodaj), 'onclick="jezyk_id.value=this.id;"');
                echo '</td></tr>';
            }
        } 
        echo '</table></form><hr />'; 
        
        $wynik = $dal->PodajOpisOferta(array(NieruchomoscDAL::$id_oferta => $oferta_id), $ilosc_wierszy);
        echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'"><table>';
        KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_oferta, NieruchomoscDAL::$id_oferta, $oferta_id);
        KontrolkiHtml::DodajHidden('opis_id', 'opis_id', '');
        if($ilosc_wierszy > 0)
        {    
            foreach ($wynik as $wiersz)
            {
                //var_dump($wiersz);
                echo '<tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$opis).': '.$wiersz[NieruchomoscDAL::$jezyk].'</td></tr><tr><td>';
                KontrolkiHtml::DodajTextArea('tresc'.$wiersz[NieruchomoscDAL::$id_opis],'id_tresc'.$wiersz[NieruchomoscDAL::$id_jezyk],$wiersz[NieruchomoscDAL::$opis],'40','5',''); 
                echo '</td></tr><tr><td>';
                KontrolkiHtml::DodajSubmit('aktualizuj', $wiersz[NieruchomoscDAL::$id_opis], $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$aktualizuj), 'onclick="opis_id.value=this.id;"');
                echo '&nbsp;';
                KontrolkiHtml::DodajSubmit('kasuj', $wiersz[NieruchomoscDAL::$id_opis], $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$kasuj), 'onclick="opis_id.value=this.id;"');
                echo '</td></tr>';
            }
        }
        echo '</table></form><hr />';
        KontrolkiHtml::DodajSubmit('ok', 'id_ok', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zakoncz), 'onclick="window.close();"');               
    }
    require('../../stopka.php');

?>
</body>
</html>
