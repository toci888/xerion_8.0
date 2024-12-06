<HTML>
<HEAD>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <script language="javascript" src="js/script.js"></script>
<link href="css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<?php
    include_once ('dal/queriesDAL.php');
    include_once ('ui/utilsui.php');
    include_once ('bll/tags.php');
    // ¶ ±
    session_start();
    require('naglowek.php');
    require('conf.php');
    
    if (!isset($_SESSION['uprawnienia']))
    {
        echo 'Nie jesteÅ› zalogowany.';
    }
    else
    {
        if(isset($_POST['szukaj']))
        {
            unset($_SESSION[$wynik_ed_of]);
            unset($_SESSION[$param_nier]);
            unset($_SESSION[$param_zap]);
            unset($_SESSION[NieruchomoscDAL::$id_nieruchomosc]);
            unset($_SESSION[NieruchomoscDAL::$id_oferta]);
            unset($_SESSION[$wyb_param_nowa_oferta]); //id rodzaju transakcji i nieruchomosci
            unset($_SESSION[NieruchomoscDAL::$id_nieruchomosc]);
            unset($_SESSION[NieruchomoscDAL::$id_oferta]);
            
            if(strlen($_POST['nazwisko']) > 0 || strlen($_POST['numer']) > 0)
            {
                if(strlen($_POST['numer']) < 1)
                {
                    $_POST['numer'] = 0;
                }
                if (strlen($_POST['nazwisko']) < 1)
                {
                    $_POST['nazwisko'] = 'null';
                }
                else
                {
                    $_POST['nazwisko'] = '\''.$_POST['nazwisko'].'\'';
                }
                
                $wyszukiwanie = new NieruchomoscDAL();
                $tabParametr[NieruchomoscDAL::$nazwisko] = $_POST['nazwisko'];
                
                if ($_SESSION[$posiada_poszukuje] == tags::$oferta)
                {
                    $tabParametr[NieruchomoscDAL::$id_oferta] = $_POST['numer'];
                    $wynik = $wyszukiwanie->SzybkieSzukanie($tabParametr, $iloscWierszy);

                    echo '<form action="edycja_oferty.php" method= "POST">';
                    
                    UtilsUI::WyswietlTab1Poz($wynik, 
                    array(NieruchomoscDAL::$miejscowosc, NieruchomoscDAL::$imie, NieruchomoscDAL::$nazwisko, NieruchomoscDAL::$cena, NieruchomoscDAL::$transakcja_rodzaj, NieruchomoscDAL::$nieruchomosc_rodzaj), 
                    array(tags::$miejscowosc, tags::$imie, tags::$nazwisko, tags::$cena, tags::$rodzaj_transakcja, tags::$rodzaj_nieruchomosci), 
                    NieruchomoscDAL::$id_oferta, 
                    'oferta_id',
                    array(Akcja::$edycja => 1, Akcja::$kasowanie => 1));
                    echo '</form>';
                }
                if ($_SESSION[$posiada_poszukuje] == tags::$zapotrzbowanie)
                {
                    $tabParametr[NieruchomoscDAL::$id_zapotrzebowanie] = $_POST['numer'];
                    $wynik = $wyszukiwanie->SzybkieSzukanieZapotrzebowanie($tabParametr, $iloscWierszy);

                    echo '<form action="edycja_zapotrzebowania.php" method= "POST">';
                    UtilsUI::WyswietlTab1Poz($wynik, 
                    array(NieruchomoscDAL::$imie, NieruchomoscDAL::$nazwisko, NieruchomoscDAL::$pesel), 
                    array(tags::$imie, tags::$nazwisko, tags::$pesel), 
                    NieruchomoscDAL::$id_zapotrzebowanie, 
                    'zapotrzebowanie_id',
                    array(Akcja::$edycja => 1, Akcja::$kasowanie => 1));
                    echo '</form>';
                }
            }
            /*else
            {
                echo 'Prosze wpisac dane przy wyszukiwaniu.';
            }*/
        }
    }
    require('stopka.php');

?>
</body>
</html>
