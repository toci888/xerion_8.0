<HTML>
<HEAD>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <script language="javascript" src="../../js/script.js"></script>
<link href="../../css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<?php
    session_start();
    include_once ('../../dal/queriesDAL.php');
    include_once ('../../ui/kontrolki_html.php');
    include_once ('../../bll/tags.php'); 
    include_once ('../../bll/jezykibll.php');
    include_once ('../../bll/cache.php');
    include_once ('../../ui/utilsui.php');
    require('../../naglowek.php');
    require('../../conf.php');
    if (!isset($_SESSION[$zalogowany]))
    {
        echo 'Nie jesteś zalogowany.';
    }
    else
    {
        $tlumaczenia = cachejezyki::Czytaj();
        
        $region = 'opole'; //
        $region_id = $opole_id;
        $wojewodztwo = $opolskie;
        
        if (isset($_GET['txt']))
        {
            $region_txt = $_GET['txt'];
            $region_hid = $_GET['hid'];
        }
        
        if (isset($_POST['region_txt']))
        {
            $region_txt = $_POST['region_txt'];
            $region_hid = $_POST['region_hid'];
            $region = $_POST['region_szukaj'];
        }
        
        echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wybor_miejscowosci).': <br />';
        
        if (isset($_POST['szukaj']))
        {
            $wynik = SlownikDAL::RegionGeograficznyCzwPozWoj($_POST['region_szukaj'], $_POST['wojewodztwo_id']);
            
            if (is_array($wynik))
            {
                echo '<table>';
                foreach ($wynik as $wiersz)
                {
                    echo '<tr><td>';
                    KontrolkiHtml::DodajWyborPrzeszukiwania($_POST['region_hid'], $_POST['region_txt'], $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wybierz), $wiersz[NieruchomoscDAL::$id_region_geog], $wiersz[NieruchomoscDAL::$region]);
                    $i = count($wiersz[NieruchomoscDAL::$rodzice]); 
                    echo '</td><td><b>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$region_geog[$i]).' : '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], $wiersz[NieruchomoscDAL::$region]).'</b>';
                                        
                    foreach ($wiersz[NieruchomoscDAL::$rodzice] as $rodzic)
                    {
                        if (strlen($rodzic) > 0)
                        {
                            $i--;
                            echo ', '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$region_geog[$i]).' : '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], $rodzic);
                        }
                    }
                    echo '</td></tr>';
                }
                echo '</table>';
            }
            else
            {
                echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], $wynik);
            }
        }

        $wojewodztwa = SlownikDAL::PodajWojewodztwa();
        
        echo '<form action= "'.$_SERVER['PHP_SELF'].'" method= "POST"><table><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wojewodztwo).' :</td><td>';
        KontrolkiHtml::DodajHidden('region_txt', 'region_txt', $region_txt);
        KontrolkiHtml::DodajHidden('region_hid', 'region_hid', $region_hid);
        KontrolkiHtml::DodajSelectDomWartId('wojewodztwo', 'id_wojewodztwo', $wojewodztwa, 'wojewodztwo_id', $opolskie, '', '');
        echo '</td><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$miejscowosc).' :</td><td>';
        KontrolkiHtml::DodajTextbox('region_szukaj', 'id_region_szukaj', $region, 20, 20, '');
        echo '</td><td>';
        KontrolkiHtml::DodajSubmit('szukaj','id_szukaj',$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$szukaj).'.','');
        echo '</td></tr></table></form>';
    }
    require('../../stopka.php');
?>
</body>
</html>