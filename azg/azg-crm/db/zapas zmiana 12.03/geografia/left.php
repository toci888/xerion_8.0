<html><head><title>A.Z.Gwarancja - Baza Danych</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <script language="javascript1.3" src="../js/script.js"></script>
<link href="../css/style.css" rel="stylesheet" type="text/css"></head>
<body>
<?
    require("../naglowek.php");
    include_once ('../ui/kontrolki_html.php');
    
    session_start();
    
    $polska = 1;
    $sesja_geog = 'sesja_geog';
    $dal = new dal('geog :P');
    $wojewodztwa = 'select id, nazwa from region_geog where id_parent = '.$polska.' order by nazwa asc;';
    
    //if ($_SERVER['REQUEST_METHOD'] == 'GET')
    //{
        $_SESSION[$sesja_geog] = 1; //na wojewodztwach
    //}
    
    if (isset($_GET['woj_id']))
    {
        $_SESSION[$sesja_geog] = 2;
        $_SESSION['bierzace_woj'] = $_GET['woj_id'];
    }
    
    if (isset($_GET['pow_id']) && isset($_GET['pow_submit']))
    {
        echo '<script>parent.center.location.href = "dodaj_regiony.php?rodzaj='.$_GET['pow_submit'].'&id_parent='.$_GET['pow_id'].'";</script>';
        $_SESSION[$sesja_geog] = 3;
        $_SESSION['bierzacy_pow'] = $_GET['pow_id'];
    }
    if (isset($_GET['gm_id']))
    {
        echo '<script>parent.center.location.href = "dodaj_regiony.php?rodzaj='.$_GET['gm_submit'].'&id_parent='.$_GET['gm_id'].'";</script>';
        $_SESSION[$sesja_geog] = 3;
        //$_SESSION['pow_id'] = $_GET['pow_id'];
    }
    ///
    if ($_SESSION[$sesja_geog] == 2)
    {
        echo '<form method="GET" action="'.$_SERVER['PHP_SELF'].'">';
        //KontrolkiHtml::DodajHidden('woj_id', 'woj_id', $_SESSION['bierzace_woj']);
        KontrolkiHtml::DodajSubmit('powrot_woj', 'id_woj_pow', 'Wojewodztwa', '');
        echo '</form>';
    }
    if ($_SESSION[$sesja_geog] == 3)
    {
        echo '<form method="GET" action="'.$_SERVER['PHP_SELF'].'">';
        KontrolkiHtml::DodajHidden('woj_id', 'woj_id', $_SESSION['bierzace_woj']);
        KontrolkiHtml::DodajSubmit('powrot_powiat', 'id_pow_pow', 'Powiaty', '');
        echo '</form>';
    }
    
    ///gminy
    if ($_SESSION[$sesja_geog] == 3)
    {
        //echo 'Wroc: <br />';
        //KontrolkiHtml::DodajSubmit('wroc_gm', '', 'Wroc', '');
        echo 'Gminy:';
        $gminy = 'select id, nazwa from region_geog where id_parent = '.$_GET['pow_id'].' order by nazwa asc;';
        $gm_wynik = $dal->PobierzDane($gminy, $ilosc_wierszy);
        if ($ilosc_wierszy > 0)
        {
            echo '<form method="GET" name="gminy" action="'.$_SERVER['PHP_SELF'].'"><table>';
            KontrolkiHtml::DodajHidden('id_gm_id', 'gm_id', '');
            KontrolkiHtml::DodajHidden('id_pow_id', 'pow_id', $_GET['pow_id']);
            
            foreach ($gm_wynik as $wiersz)
            {
                echo '<tr><td>';
                KontrolkiHtml::DodajSubmit('gm_submit', $wiersz['id'], $wiersz['nazwa'], 'onclick="gm_id.value = this.id;"');
                echo '</td></tr>';
            }
            
            echo '</table></form>';
        }
        else
        {
            echo '<script>parent.center.location.href = "dodaj_regiony.php?rodzaj='.$_GET['pow_submit'].'&id_parent='.$_GET['pow_id'].'";</script>'; 
        }
    }
    ///powiaty
    if ($_SESSION[$sesja_geog] == 2)
    {
        echo 'Powiaty:';
        $powiaty = 'select id, nazwa from region_geog where id_parent = '.$_GET['woj_id'].' order by nazwa asc;';
        $pow_wynik = $dal->PobierzDane($powiaty, $ilosc_wierszy);
        
        echo '<form method="GET" name="powiaty" action="'.$_SERVER['PHP_SELF'].'"><table>';
        KontrolkiHtml::DodajHidden('id_pow_id', 'pow_id', '');
        
        foreach ($pow_wynik as $wiersz)
        {
            echo '<tr><td>';
            KontrolkiHtml::DodajSubmit('pow_submit', $wiersz['id'], $wiersz['nazwa'], 'onclick="pow_id.value = this.id;"');
            echo '</td></tr>';
        }
        
        echo '</table></form>';
    }
    
    if ($_SESSION[$sesja_geog] == 1)
    {
        $woj_wynik = $dal->PobierzDane($wojewodztwa, $ilosc_wierszy);
        echo 'Wojewodztwa:';
        echo '<form method="GET" name="wojewodztwa" action="'.$_SERVER['PHP_SELF'].'"><table>';
        KontrolkiHtml::DodajHidden('id_woj_id', 'woj_id', '');
        
        foreach ($woj_wynik as $wiersz)
        {
            echo '<tr><td>';
            KontrolkiHtml::DodajSubmit('woj_submit', $wiersz['id'], $wiersz['nazwa'], 'onclick="woj_id.value = this.id;"');
            echo '</td></tr>';
        }
        
        echo '</table></form>';
    }
    
	require("../stopka.php");
?>
</body>
</html>
