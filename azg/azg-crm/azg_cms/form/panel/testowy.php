<html><head><title>A.Z.Gwarancja - Baza Danych</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/style.css" rel="stylesheet" type="text/css"></head>
  <script language="javascript1.3" src="js/script.js"></script>
<body>

<?
    include_once('dal/queriesDAL.php');
    include_once('bll/utilsbll.php');
    include_once('bll/jezykibll.php');
    //zwrocenie wartosci z funkcji spowoduje, ze do zdarzenia zostanie zwrocony rezultat dzialania funkcji - jesli false event zostanie zatrzymany
    echo '<input type="text" onkeypress="return WalidacjaLiczbaWymierna(event);">';
    /*function policz($pie, &$dru)
    {
        $dru += 2;
        $wyn = $pie + $dru;
        
        return $wyn;
        //$dru = $wyn + 10;
    }
    
    $quDal = new WyposazenieNierDAL();
    
    $zmTest = 5;
    
    $wynik = policz(2, $zmTest);
    
    echo 'Zmienna testowa: '.$zmTest.'<br />';
    
    echo $wynik;
    
    //$efekt = $quDal->Wyposazenie();
    
    //Utils::WyswietlTablice($efekt);
    //print_r($efekt);
    
    echo '<br />dfsafdsa';     */
    
    ///$obiekt = new JezykDAL();
    ///$zm = $obiekt->Tlumaczenia($iloscWierszy);
    
    //print_r($zm);
    ///Utils::WyswietlTablice($zm);
    
    //$obiekt = new JezykBLL();
    
    //echo $obiekt->Tlumacz(3, '_grzanie_elektryczno___sloneczne');
    
    //$wyposazenie = new WyposazenieNierDAL();
    
    //$zm1 = $wyposazenie->WyposazenieNieruchomosci(array(WyposazenieNierDAL::$id_transakcja => 1, WyposazenieNierDAL::$id_nieruchomosc => 1), $iloscWierszy);
    //Utils::WyswietlTablice($zm1);
?>
</body>
</html>