<HTML>
<HEAD>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <script language="javascript" src="../js/script.js"></script>
<link href="../css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<?php
    // ¶ ±
    session_start();
    include_once ('../dal/queriesDAL.php');
    include_once ('../ui/kontrolki_html.php');
    include_once ('../ui/utilsui.php'); 
    include_once ('../bll/parametrynierbll.php');
    include_once ('../bll/tags.php'); 
    include_once ('../bll/agentbll.php');
    include_once ('../bll/jezykibll.php');
    include_once ('../bll/cache.php');
    require('../naglowek.php');
    require('../conf.php');
    
    if (!isset($_SESSION[$zalogowany]))
    {
        echo 'Nie jesteÅ› zalogowany.';
    }
    else
    {
        $tlumaczenia = cachejezyki::Czytaj();
        
        if (isset($_GET[NieruchomoscDAL::$id_nieruchomosc]))
        {
            $_SESSION[NieruchomoscDAL::$id_nieruchomosc] = $_GET[NieruchomoscDAL::$id_nieruchomosc];
        } 
        if (isset($_POST[NieruchomoscDAL::$id_nieruchomosc]))
        {
            $_SESSION[NieruchomoscDAL::$id_nieruchomosc] = $_POST[NieruchomoscDAL::$id_nieruchomosc];
        }
        
        $oper_wlasciciel = new OsobaDAL(null);
         
        if (isset($_POST['aktualizuj']))
        {
            
            $tabParametr[OsobaDAL::$id_wlasciciel] = $_POST['wlasciciel_id'];
            $tabParametr[OsobaDAL::$id_nieruchomosc] = $_POST[NieruchomoscDAL::$id_nieruchomosc];
            $tabParametr[OsobaDAL::$id_osoba] = 'null';
            $tabParametr[OsobaDAL::$udzial_proc] = $_POST['proc_udzial'.$_POST['wlasciciel_id']];
                
            $wynik = $oper_wlasciciel->DodajWlasciciel($tabParametr);     
            
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
            $tabParametr[OsobaDAL::$id_wlasciciel] = $_POST['wlasciciel_id'];
            
            $wynik = $oper_wlasciciel->UsunWlasciciel($tabParametr);
            
            if ($wynik)
            {
                echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_powiodla_sie).'<br />';
            }
            else
            {
                echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_nie_powiodla_sie).'<br />';
            } 
        }
        if (isset($_POST['dodaj']))
        {
            $tabParametr[OsobaDAL::$id_wlasciciel] = 'null';
            $tabParametr[OsobaDAL::$id_nieruchomosc] = $_POST[NieruchomoscDAL::$id_nieruchomosc];
            $tabParametr[OsobaDAL::$id_osoba] = $_POST[OsobaDAL::$id_osoba];
            $tabParametr[OsobaDAL::$udzial_proc] = $_POST['proc_udzial'.$_POST[OsobaDAL::$id_osoba]];
                
            $wynik = $oper_wlasciciel->DodajWlasciciel($tabParametr);     
            
            if ($wynik)
            {
                echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_powiodla_sie).'<br />';
            }
            else
            {
                echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_nie_powiodla_sie).'<br />';
            }     
        }
        
        $wynik = $oper_wlasciciel->PodajWlascicieleNier(array(OsobaDAL::$id_nieruchomosc => $_SESSION[NieruchomoscDAL::$id_nieruchomosc]), $ilosc_wierszy);
        if ($ilosc_wierszy > 0)
        {
            echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'"><table BORDER="2">';
            KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_nieruchomosc, NieruchomoscDAL::$id_nieruchomosc, $_SESSION[NieruchomoscDAL::$id_nieruchomosc]);
            KontrolkiHtml::DodajHidden('wlasciciel_id', 'wlasciciel_id','');
            echo '<tr><td colspan="10" TD BGCOLOR=LIGHTBLUE><b>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wlasciciele).' : </b></td></tr>';
            foreach ($wynik as $wiersz)
            {
                echo '<tr><td><b>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nazwisko).' : </b></td><td>'.$wiersz[OsobaDAL::$nazwisko].'</td><td><b>'.
                $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$imie).' : </b></td><td>'.$wiersz[OsobaDAL::$imie].'</td><td><b>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$pesel).' : </b></td><td>'.
                $wiersz[OsobaDAL::$pesel].'</td><td><b>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$proc_udzial).' : </b></td><td>';
                KontrolkiHtml::DodajLiczbaWymiernaTextbox('proc_udzial'.$wiersz[OsobaDAL::$id_wlasciciel], 'id_proc_udzial', $wiersz[OsobaDAL::$udzial_proc], 5, 5, '');
                echo '</td><td>';
                KontrolkiHtml::DodajSubmit('aktualizuj', $wiersz[OsobaDAL::$id_wlasciciel], $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$aktualizuj), 
                'onclick="wlasciciel_id.value = this.id"');
                echo '</td><td>';
                KontrolkiHtml::DodajSubmit('kasuj', $wiersz[OsobaDAL::$id_wlasciciel],$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$kasuj), 
                'onclick="wlasciciel_id.value = this.id;"');
                echo '</td></tr>';
            }
            
            echo '</table></form>';
        }
        $wynik = $oper_wlasciciel->PodajDostOsWlas(array(OsobaDAL::$id_nieruchomosc => $_SESSION[NieruchomoscDAL::$id_nieruchomosc]), $ilosc_wierszy);
        if($ilosc_wierszy > 0)
        {
            echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'"><table BORDER="1">';
            KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_nieruchomosc, NieruchomoscDAL::$id_nieruchomosc, $_SESSION[NieruchomoscDAL::$id_nieruchomosc]);
            KontrolkiHtml::DodajHidden(OsobaDAL::$id_osoba, OsobaDAL::$id_osoba, '');
            echo '<tr><td colspan="10" TD BGCOLOR=LIGHTBLUE><b>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$osoby_dostepne).' : </b></td></tr>';
            foreach ($wynik as $wiersz)
            {
                echo '<tr><td><b>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nazwisko).' : </b></td><td>'.$wiersz[OsobaDAL::$nazwisko].'</td><td><b>'.
                $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$imie).' : </b></td><td>'.$wiersz[OsobaDAL::$imie].'</td><td><b>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$pesel).' : </b></td><td>'.
                $wiersz[OsobaDAL::$pesel].'</td><td><b>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$proc_udzial).' : </b></td><td>';
                KontrolkiHtml::DodajLiczbaWymiernaTextbox('proc_udzial'.$wiersz[OsobaDAL::$id_osoba], 'id_proc_udzial', '', 5, 5, '');
                echo '</td><td>';
                KontrolkiHtml::DodajSubmit('dodaj', $wiersz[OsobaDAL::$id_osoba], $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$dodaj), 'onclick="'.OsobaDAL::$id_osoba.'.value = this.id;"');
                echo '</td></tr>';    
            }
            echo '</table></form>';   
        }
        
    }
    require('../stopka.php');

?>
</body>
</html>
