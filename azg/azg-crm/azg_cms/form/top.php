<HTML>
<HEAD>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <script language="javascript" src="js/script.js"></script>
<link href="css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<?php
    // ¶ ±
    session_start();
    include_once ('dal/stronaDAL.php');
    include_once ('ui/kontrolki_html.php');
    include_once ('bll/tags.php'); 
    include_once ('bll/jezykibll.php');
    include_once ('bll/cache.php');
    require('naglowek.php');
    require('conf.php');
    
    if (!isset($_SESSION[$jezyk]))
    {
        $_SESSION[$jezyk] = 1;
    }
    
    $tlumaczenia = cachejezyki::Czytaj();
    $obj = new StronaPodsInfoDAL();
    
    $wynik = $obj->Transakcje($ilosc_wierszy);
    
    if ($ilosc_wierszy > 0)
    {
        echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'"><table><tr>';
        KontrolkiHtml::DodajHidden($oferta_hidden, $oferta_hidden, '');
        KontrolkiHtml::DodajHidden(StronaPodsInfoDAL::$id_trans_rodzaj, StronaPodsInfoDAL::$id_trans_rodzaj, '');
        
        foreach ($wynik as $wiersz)
        {
            if ($wiersz[StronaPodsInfoDAL::$oferta])
            {
                $of_zap = tags::$oferta;
            }
            else
            {
                $of_zap = tags::$zapotrzbowanie;
            }
            echo '<td>';
            KontrolkiHtml::DodajSubmit('transakcja', $wiersz[StronaPodsInfoDAL::$id], $tlumaczenia->Tlumacz($_SESSION[$jezyk], $wiersz[StronaPodsInfoDAL::$nazwa]), 
            'onclick="'.StronaPodsInfoDAL::$id_trans_rodzaj.'.value=this.id; '.$oferta_hidden.'.value=\''.$of_zap.'\';"');
            echo '</td>';
        }
        
        echo '</tr></table></form>';
    }
    
    if (isset($_POST[StronaPodsInfoDAL::$id_trans_rodzaj]))
    {
        $wynik = $obj->RodzajNieruchomosc($_POST[StronaPodsInfoDAL::$id_trans_rodzaj], $ilosc_wierszy);
        if ($ilosc_wierszy > 0)
        {
            echo $_POST['transakcja'].':';
            echo '<form method="POST" action="center.php" target="center"><table><tr>';
            KontrolkiHtml::DodajHidden($oferta_hidden, $oferta_hidden, $_POST[$oferta_hidden]);
            KontrolkiHtml::DodajHidden(StronaPodsInfoDAL::$id_trans_rodzaj, StronaPodsInfoDAL::$id_trans_rodzaj, $_POST[StronaPodsInfoDAL::$id_trans_rodzaj]);
            KontrolkiHtml::DodajHidden(StronaPodsInfoDAL::$id_nier_rodzaj, StronaPodsInfoDAL::$id_nier_rodzaj, '');
            
            foreach ($wynik as $wiersz)
            {
                echo '<td>';
                KontrolkiHtml::DodajSubmit($wiersz[StronaPodsInfoDAL::$nazwa], $wiersz[StronaPodsInfoDAL::$id], $tlumaczenia->Tlumacz($_SESSION[$jezyk], $wiersz[StronaPodsInfoDAL::$nazwa]), 
                'onclick="'.StronaPodsInfoDAL::$id_nier_rodzaj.'.value=this.id;"');
                echo '</td>';
            }
            
            echo '</tr></table></form>';
        }
    }

    require('stopka.php');

?>
</body>
</html>
