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
        $miejscowosc = null;
        $wojewodztwo = $opolskie;
        
        if (isset($_POST['nazwa']))
        {
            $miejscowosc = $_POST['nazwa'];
            $wojewodztwo = $_POST['wojewodztwo_id'];
        }
        
        //$_SESSION[NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj]
        if (isset($_GET[NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj]))
        {
            $zapotrzebowanie_trans_id = $_GET[NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj];
            $zapotrzebowanie_id = $_GET[NieruchomoscDAL::$id_zapotrzebowanie];
        }
        if (isset($_POST[NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj]))
        {
            $zapotrzebowanie_trans_id = $_POST[NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj];
            $zapotrzebowanie_id = $_POST[NieruchomoscDAL::$id_zapotrzebowanie];
        }
        
        $obiekt = new WyposazenieZapDAL($zapotrzebowanie_trans_id);
        
        if(isset($_POST['kasuj']))
        {
            $wynik = $obiekt->UsunRegGeogZap($_POST['id_region_geog_kasuj']);
            if (!$wynik)
            {
                UtilsUI::InfoBlad($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_nie_powiodla_sie));
            }  
        }
        
        if(isset($_POST['id_region_geog']))//obsluga dodawania
        {
            $wynik = $obiekt->DodajRegGeogZap($_POST['id_region_geog']);
            if ($wynik[NieruchomoscDAL::$id] == null)
            {
                UtilsUI::InfoBlad($tlumaczenia->Tlumacz($_SESSION[$jezyk], $wynik[NieruchomoscDAL::$nazwa]));
            }   
        }
        if (isset($_POST['szukaj']))
        {
            $wynik = SlownikDAL::PobierzDowRegionGeog($_POST['wojewodztwo_id'], $_POST['nazwa']);
            
            if (is_array($wynik))
            {
                UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$znalezione_lokalizacje));
                echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'"><table>';
                KontrolkiHtml::DodajHidden('id_region_geog','id_region_geog','');
                KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj, NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj, $zapotrzebowanie_trans_id);
                KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_zapotrzebowanie, NieruchomoscDAL::$id_zapotrzebowanie, $zapotrzebowanie_id);
                KontrolkiHtml::DodajHidden('nazwa', 'nazwa', $miejscowosc);
                KontrolkiHtml::DodajHidden('wojewodztwo_id', 'wojewodztwo_id', $wojewodztwo);
                
                foreach ($wynik as $wiersz)
                {
                    echo '<tr><td>';
                    KontrolkiHtml::DodajSubmit('wybor', $wiersz[NieruchomoscDAL::$id_region_geog], $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wybierz), 'onclick="id_region_geog.value = this.id;"');
                    //echo '</td><td><b>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], $wiersz[NieruchomoscDAL::$region]).'</b>';
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
                echo '</table></form>';
            }
            else
            {
                echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], $wynik);
            }
        }
        $wojewodztwa = SlownikDAL::PodajWojewodztwa();
        UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nr_zapotrzebowania).': '.$zapotrzebowanie_id);
        UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$akceptowana_lokalizacja_poszukiwanej_nieruchomosci));
        echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'"><table><tr><td>';
        KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj, NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj, $zapotrzebowanie_trans_id);
        KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_zapotrzebowanie, NieruchomoscDAL::$id_zapotrzebowanie, $zapotrzebowanie_id);
        KontrolkiHtml::DodajSelectDomWartId('wojewodztwo', 'id_wojewodztwo', $wojewodztwa, 'wojewodztwo_id', $wojewodztwo, '', '');
        echo '</td><td>';
        KontrolkiHtml::DodajTextbox('nazwa', 'id_nazwa', $miejscowosc, '15', '15', '');
        echo '</td><td>';
        KontrolkiHtml::DodajSubmit('szukaj', 'id_szukaj', $tlumaczenia->Tlumacz ($_SESSION[$jezyk], tags::$szukaj).'.', ''); 
        echo '</td></tr></table></form>';
        
        $wynik = $obiekt->PodajRegGeogZap($IloscWierszy);
        if($IloscWierszy > 0)
        { 
            UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wybrane_lokalizacje_poszukiwanej_nieruchomosci));    
            echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'"><table border="1">';
            KontrolkiHtml::DodajHidden('id_region_geog_kasuj','id_region_geog_kasuj','');
            KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj, NieruchomoscDAL::$id_zapotrzebowanie_trans_rodzaj, $zapotrzebowanie_trans_id);
            KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_zapotrzebowanie, NieruchomoscDAL::$id_zapotrzebowanie, $zapotrzebowanie_id);
            KontrolkiHtml::DodajHidden('nazwa', 'nazwa', $miejscowosc);
            KontrolkiHtml::DodajHidden('wojewodztwo_id', 'wojewodztwo_id', $wojewodztwo);
            
            echo '<tr><td><b>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$kasuj).'</b></td><td><b>'.
            $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wybrane_lokalizacje_poszukiwanej_nieruchomosci).'</b></td></tr>';
            foreach ($wynik as $wiersz)
            {
                echo '<tr><td>';
                KontrolkiHtml::DodajSubmit('kasuj', $wiersz[NieruchomoscDAL::$id_region_geog], $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$kasuj), 'onclick="id_region_geog_kasuj.value = this.id;"');
                $i = count($wiersz[NieruchomoscDAL::$rodzice]);
                //echo '</td><td><b>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], $wiersz[NieruchomoscDAL::$region]).'</b>';
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
            echo '</table></form>';
        }
        echo '<hr />';
        KontrolkiHtml::DodajSubmit('ok', 'id_ok', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zakoncz), 'onclick="window.close();"');
    }
    require('../../stopka.php');

?>
</body>
</html>
