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
        $dal = null;
        
        if (isset($_GET[OsobaDAL::$id_osoba]))
        {
            $dal = new OsobaDAL($_GET[OsobaDAL::$id_osoba]);
            $osoba_id = $_GET[OsobaDAL::$id_osoba];
        }
        if (isset($_POST[OsobaDAL::$id_osoba]))
        {
            $dal = new OsobaDAL($_POST[OsobaDAL::$id_osoba]);
            $osoba_id = $_POST[OsobaDAL::$id_osoba];
        }
        
        if(isset($_POST['dodaj']) || isset($_POST['aktualizuj']))
        {
            $tabParametr[OsobaDAL::$id_osoba] = $_POST[OsobaDAL::$id_osoba];
            $tabParametr[OsobaDAL::$id_rodzaj_dowod] = $_POST[OsobaDAL::$id_rodzaj_dowod];
            $tabParametr[OsobaDAL::$nr_dowod] = $_POST['nr_dowod'.$_POST[OsobaDAL::$id_rodzaj_dowod]];
            
            if(isset($_POST['dodaj']))
            if (strlen($_POST['nr_dowod'.$_POST[OsobaDAL::$id_rodzaj_dowod]]) > 0)
            {
                $wynik = $dal->DodajDokOsoba($tabParametr);
            }
            else
            {
                $wynik = false;
            }
            
            if (isset($_POST['aktualizuj']))
            $wynik = $dal->DodajDokOsoba($tabParametr); 
            
            if ($wynik)
            {
                echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_powiodla_sie).'<br />';
            }
            else
            {
                echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_nie_powiodla_sie).'<br />';
            }
        }
        if (isset($_POST['kasuj']))
        {
            $tabParametr[OsobaDAL::$id_osoba] = $_POST[OsobaDAL::$id_osoba];
            $tabParametr[OsobaDAL::$id_rodzaj_dowod] = $_POST[OsobaDAL::$id_rodzaj_dowod];
            
            $wynik = $dal->UsunDokOsoba($tabParametr); 
            if ($wynik)
            {
                echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_powiodla_sie).'<br />';
            }
            else
            {
                echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_nie_powiodla_sie).'<br />';
            }   
        }
        /*if(isset($_POST['aktualizuj']))
        {
            $tabParametr[OsobaDAL::$id_osoba] = $_POST[OsobaDAL::$id_osoba];
            $tabParametr[OsobaDAL::$id_rodzaj_dowod] = $_POST[OsobaDAL::$id_rodzaj_dowod]; 
            
        }*/
        
        if ($dal != null)
        {
            //calosc tu
            //pokazanie juz zdefiniowanych dokumentow; formularz od reki umozliwia aktualizacje

            $wynik = $dal->PodajDokOsoba($ilosc_wierszy);
            if ($ilosc_wierszy > 0)
            {
                echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'"><table>';
                KontrolkiHtml::DodajHidden(OsobaDAL::$id_osoba, OsobaDAL::$id_osoba, $osoba_id);
                KontrolkiHtml::DodajHidden(OsobaDAL::$id_rodzaj_dowod, OsobaDAL::$id_rodzaj_dowod, '');
                foreach ($wynik as $wiersz)
                {
                    echo '<tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], $wiersz[OsobaDAL::$rodzaj_dowod]).' : </td><td>';
                    KontrolkiHtml::DodajTextbox('nr_dowod'.$wiersz[OsobaDAL::$id_rodzaj_dowod], 'id_nr_dowod'.$wiersz[OsobaDAL::$id_rodzaj_dowod], $wiersz[OsobaDAL::$nr_dowod], 15, 15, '');
                    echo '</td><td>';
                    KontrolkiHtml::DodajSubmit('aktualizuj', $wiersz[OsobaDAL::$id_rodzaj_dowod], $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$aktualizuj), 'onclick="'.OsobaDAL::$id_rodzaj_dowod.'.value = this.id;"');
                    echo '</td><td>';
                    KontrolkiHtml::DodajSubmit('kasuj', $wiersz[OsobaDAL::$id_rodzaj_dowod],$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$kasuj), 'onclick="'.OsobaDAL::$id_rodzaj_dowod.'.value = this.id;"');
                    echo '</td></tr>';
                }
                
                echo '</table></form>';
            }
            
            $wynik = $dal->PodajDostDokOsoba($ilosc_wierszy);
            if ($ilosc_wierszy > 0)
            {
                echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'"><table>';
                KontrolkiHtml::DodajHidden(OsobaDAL::$id_osoba, OsobaDAL::$id_osoba, $osoba_id);
                KontrolkiHtml::DodajHidden(OsobaDAL::$id_rodzaj_dowod, OsobaDAL::$id_rodzaj_dowod, '');
                foreach ($wynik as $wiersz)
                {
                    echo '<tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], $wiersz[OsobaDAL::$rodzaj_dowod]).' : </td><td>';
                    KontrolkiHtml::DodajTextbox('nr_dowod'.$wiersz[OsobaDAL::$id_rodzaj_dowod], 'id_nr_dowod'.$wiersz[OsobaDAL::$id_rodzaj_dowod], '', 15, 15, '');
                    echo '</td><td>';
                    KontrolkiHtml::DodajSubmit('dodaj', $wiersz[OsobaDAL::$id_rodzaj_dowod], $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zatwierdz), 'onclick="'.OsobaDAL::$id_rodzaj_dowod.'.value = this.id;"');
                    echo '</td></tr>';
                }
                
                echo '</table></form>';
            }
            KontrolkiHtml::DodajSubmit('ok', 'id_ok', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zatwierdz), 'onclick="window.close();"');
        }
    }
    require('../../stopka.php');

?>
</body>
</html>
