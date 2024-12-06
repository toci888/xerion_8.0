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
        
        $nieruchomosc_id = null;
        
        //get dziala przyu otwieraniu okna, nastepnie dziala post - przy submitach formularzy
        if (isset($_GET[NieruchomoscDAL::$id_nieruchomosc]))
        {
            $nieruchomosc_id = $_GET[NieruchomoscDAL::$id_nieruchomosc];
        }
        if (isset($_POST[NieruchomoscDAL::$id_nieruchomosc]))
        {
            $nieruchomosc_id = $_POST[NieruchomoscDAL::$id_nieruchomosc];
        }
        
        if ($nieruchomosc_id != null)
        {
            $sciezka = '../../media/'.$nieruchomosc_id.'/filmy/';
            $dal = new MediaNierDAL($nieruchomosc_id);
            
            if (isset($_POST['kasowanie']))
            {
                $tabParametr[MediaNierDAL::$id_film] = $_POST['film_id'];
                $wynik = $dal->UsunFilm($tabParametr);
                if ($wynik[0] != 'null')
                {
                    echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_powiodla_sie);
                    if (file_exists($sciezka.$wynik[0]))
                    {
                        unlink($sciezka.$wynik[0]);
                    }
                }
                else
                {
                    echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_nie_powiodla_sie);
                }
            }
            
            if (isset($_POST['dodaj_film'])) 
            {
                $jest_katalog = false;
                if (!is_dir($sciezka))
                {
                    //stworz katalogi lub drzewo katalogow
                    if (!mkdir($sciezka, 0755, true))
                    {
                        echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$blad_zakladanie_katalog).'<br />';
                    }
                    else
                    {
                        $jest_katalog = true;
                    }
                }
                else
                {
                    $jest_katalog = true;
                }
                if ($jest_katalog)
                {
                    $tab_plik = explode('.', $_FILES['film']['name']);
                    $tabParametr[MediaNierDAL::$rozszerzenie] = strtolower($tab_plik[count($tab_plik) - 1]);
                    $wynik = $dal->DodajFilm($tabParametr);
                    
                    //$sciezka .= $wynik[0];
                    if (move_uploaded_file($_FILES['film']['tmp_name'], $sciezka.$wynik[0]))
                    {
                        echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_powiodla_sie);
                    }
                    else
                    {
                        echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_nie_powiodla_sie);
                    }
                }
            }
            
            //$sciezka = '../media/'.$_SESSION[NieruchomoscDAL::$id_nieruchomosc].'/filmy/';
            
            echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'" enctype="multipart/form-data" ><table><tr><td>';
            KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_nieruchomosc, NieruchomoscDAL::$id_nieruchomosc, $nieruchomosc_id);
            KontrolkiHtml::DodajPlikWysylka('film', 'id_film', '');
            echo '</td></tr><tr><td>';
            KontrolkiHtml::DodajSubmit('dodaj_film', 'id_dodaj_film', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$dodaj), '');
            echo '</td></tr></table></form>';
            
            $tabParametr[MediaNierDAL::$sciezka] = $sciezka;
            $wynik = $dal->PodajFilmy($tabParametr);
            
            echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'">';
            KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_nieruchomosc, NieruchomoscDAL::$id_nieruchomosc, $nieruchomosc_id);
            UtilsUI::WyswietlTab1Poz($wynik, array(MediaNierDAL::$id, MediaNierDAL::$nazwa), 
            array($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$id), $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zdjecia)), 
            MediaNierDAL::$id, 'film_id', array(Akcja::$kasowanie => 1));
            echo '</form>';
        }
        echo '<hr />';
        KontrolkiHtml::DodajSubmit('ok', 'id_ok', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zakoncz), 'onclick="window.close();"');
    }
    require('../../stopka.php');

?>
</body>
</html>
