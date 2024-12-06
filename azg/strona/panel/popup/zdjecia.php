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
        //enctype=\"multipart/form-data\"
        //$_SESSION[NieruchomoscDAL::$id_nieruchomosc]
        $tlumaczenia = cachejezyki::Czytaj();
        
        ///wywalic sesje ze zdjec i filmow podczas przerobek
        
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
            $sciezka = '../../media/'.$nieruchomosc_id.'/zdjecia/';
            $dal = new MediaNierDAL($nieruchomosc_id);
            
            if (isset($_POST[tags::$wyzej]))
            {
                $tabParametr[MediaNierDAL::$id_zdjecie] = $_POST['zdjecie_id'];
                $wynik = $dal->PodniesZdjecie($tabParametr);
            }
            if (isset($_POST[tags::$nizej]))
            {
                $tabParametr[MediaNierDAL::$id_zdjecie] = $_POST['zdjecie_id'];
                $wynik = $dal->ObnizZdjecie($tabParametr);
            }
            
            if (isset($_POST[tags::$kasuj]))
            {
                $tabParametr[MediaNierDAL::$id_zdjecie] = $_POST['zdjecie_id'];
                $wynik = $dal->UsunZdjecie($tabParametr);
                if ($wynik[0] != 'null')
                {
                    echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_powiodla_sie);
                    if (file_exists($sciezka.$wynik[0]))
                    {
                        unlink($sciezka.$wynik[0]);
                        unlink($sciezka.'m_'.$wynik[0]);
                    }
                }
                else
                {
                    echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_nie_powiodla_sie);
                }
            }
            
            if (isset($_POST['dodaj_zdjecie'])) 
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
                    $tab_plik = explode('.', $_FILES['zdjecie']['name']);
                    $tabParametr[MediaNierDAL::$rozszerzenie] = strtolower($tab_plik[count($tab_plik) - 1]);
                    $wynik = $dal->DodajZdjecie($tabParametr);
                    
                    //$sciezka .= $wynik[0];
                    if (move_uploaded_file($_FILES['zdjecie']['tmp_name'], $sciezka.$wynik[0]))
                    {
                        UtilsUI::ObrazRozmiarNorm($sciezka.$wynik[0]);
                        UtilsUI::ObrazRozmiarPom($sciezka.$wynik[0], $sciezka.'m_'.$wynik[0]);
                        echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_powiodla_sie);
                    }
                    else
                    {
                        echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_nie_powiodla_sie);
                    }
                }
            }
            
            //$sciezka = '../media/'.$_SESSION[NieruchomoscDAL::$id_nieruchomosc].'/zdjecia/';
            
            echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'" enctype="multipart/form-data" ><table><tr><td>';
            KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_nieruchomosc, NieruchomoscDAL::$id_nieruchomosc, $nieruchomosc_id);
            KontrolkiHtml::DodajPlikWysylka('zdjecie', 'id_zdjecie', '');
            //kombo lista pozycji, wysw zdjec, dodanie tagow
            echo '</td></tr><tr><td>';
            KontrolkiHtml::DodajSubmit('dodaj_zdjecie', 'id_dodaj_zdjecie', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$dodaj), '');
            echo '</td></tr></table></form>';
            
            $tabParametr[MediaNierDAL::$sciezka] = $sciezka;
            $wynik = $dal->PodajZdjecia($tabParametr);
            
            echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'">';
            KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_nieruchomosc, NieruchomoscDAL::$id_nieruchomosc, $nieruchomosc_id);
            UtilsUI::WyswietlTab1Poz($wynik, array(MediaNierDAL::$id, MediaNierDAL::$nazwa), 
            array($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$id), $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zdjecia)), 
            MediaNierDAL::$id, 'zdjecie_id', null, array(tags::$kasuj, tags::$wyzej, tags::$nizej), array(tags::$kasuj => tags::$kasuj, tags::$wyzej => tags::$wyzej, tags::$nizej => tags::$nizej));
            echo '</form>';
        }
        echo '<hr />';
        KontrolkiHtml::DodajSubmit('ok', 'id_ok', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zakoncz), 'onclick="window.close();"'); 
    }
    require('../../stopka.php');

?>
</body>
</html>
