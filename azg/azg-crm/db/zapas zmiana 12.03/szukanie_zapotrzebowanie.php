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
    include_once ('dal/queriesDAL.php');
    include_once ('ui/kontrolki_html.php');
    include_once ('ui/utilsui.php');
    include_once ('bll/parametrynierbll.php'); 
    include_once ('bll/tags.php'); 
    include_once ('bll/agentbll.php');
    include_once ('bll/jezykibll.php');
    include_once ('bll/cache.php');
    include_once ('bll/transnierbll.php');
    require('naglowek.php');
    require('conf.php'); 
    $tlumaczenia = cachejezyki::Czytaj(); 
    if (!isset($_SESSION[$zalogowany]))
    {
        echo 'Nie jesteÅ› zalogowany.';
    }
    else
    {
        if (isset($_POST['szukaj']))
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
            $tabParametr[NieruchomoscDAL::$id_zapotrzebowanie] = $_POST['numer'];        
            $tabParametr[NieruchomoscDAL::$nazwisko] = $_POST['nazwisko'];
            $wyszukiwanie = new NieruchomoscDAL();
            
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
        if (isset($_POST['szukaj_left']))
        {
            echo '<form action="'.$_SERVER['PHP_SELF'].'" method= "POST" >';    
            echo '<table><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nazwisko).' :</td><td>';
            KontrolkiHtml::DodajTextbox('nazwisko', 'id_nazwisko', '', 20, 20, '');
            echo '</td><td >'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$numer_zapotrzebowania).' : </td><td >';
            KontrolkiHtml::DodajLiczbaCalkowitaTextbox('numer', 'id_numer', '', 6, 6, '');
            echo '</td><td >';
            KontrolkiHtml::DodajSubmit('szukaj','id_szukaj',$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$szukaj).'.','');
            echo '</td></tr></table></form><hr />'; 
        }
    }
    require('stopka.php');

?>
</body>
</html>
