<html><head><title>A.Z.Gwarancja - Baza Danych</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/style.css" rel="stylesheet" type="text/css"></head>
  <script language="javascript1.3" src="../js/script.js"></script>
<body>
<?
    require("../naglowek.php"); 
    include_once ('../ui/kontrolki_html.php');
    
    session_start();
    $dal = new dal('geog :P');
    
    if (isset($_POST['parent_id']))
    {
        //var_dump($_POST['regiony_text']);
        $wynik = str_replace("\t", "|", $_POST['regiony_text']);
        $wynik = str_replace("\n", "|", $wynik);
        $wynik = str_replace(" |", "|", $wynik);
        //var_dump($wynik);
        $temp = explode('|', $wynik); 
        $i = 1;
        $krok = 3;
        $j = 0;
        while (isset($temp[$i]))
        {
            $odlamki[$j] = $temp[$i];
            $j++;
            $i += $krok;
        }
        //var_dump($odlamki);
        //1, 4, 7 itd petla przepisac do odlamkow i puscic reszte, powinno hulac, na wszelki wypadek dac trima na odlamkach
        $handle = fopen("out.sql", "a");
        flock($handle, 2); 

        $i = 0;
        $odlamki[$i] = trim($odlamki[$i]); 
         
        while (isset($odlamki[$i]) && strlen($odlamki[$i]) > 1)//($i < 10)//(isset($odlamki[$i]))
        {
            $test = "select id from region_geog where nazwa = '".$odlamki[$i]."' and id_parent = ".$_POST['parent_id'].";";
            $dal->PobierzDane($test, $il_wierszy);
            
            if ($il_wierszy > 0)
            {
                echo $odlamki[$i].' jest juz dodane(a/y).<br />';
            }
            else
            {
                $insert = "insert into region_geog (id_parent, nazwa) values (".$_POST['parent_id'].", '".$odlamki[$i]."');";
                if ($dal->InsUpNaZywca($insert))
                {
                    fwrite($handle, $insert.'
');
                    echo 'Dodano: '.$odlamki[$i].'<br />';
                }
            } 
            $i++;
            if (isset($odlamki[$i]))
            $odlamki[$i] = trim($odlamki[$i]);
        }
        // odblokowanie pliku 
        flock($handle, 3); 

        // zamkniêcie pliku 
        fclose($handle);  
    }
    
    if (isset($_GET['id_parent']))
    {        
        $test = "select id, nazwa from region_geog where id_parent = ".$_GET['id_parent'].";";
        $wynik = $dal->PobierzDane($test, $il_wierszy);
        
        if ($il_wierszy > 0)
        {
            foreach ($wynik as $wiersz)
            echo $wiersz['nazwa'].' jest juz dodane(a/y).<br />';
        }
        
        echo '<br />'.$_GET['rodzaj'].'<br />';    
        
        echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'">';
        KontrolkiHtml::DodajHidden('id_parent_id', 'parent_id', $_GET['id_parent']);
        KontrolkiHtml::DodajSubmit('potwierdz', 'id_potwierdz', 'Potwierdz', '');
        echo '<br /><textarea rows="30" cols="30" name="regiony_text">';
        
        echo '</textarea>';
        echo '</form>';
    }
    if (isset($_GET['left_reload_pow']))
    {
        //echo '<script>parent.left.location.href = "left.php?pow_id='.$_GET['pow_id'].'";</script>';
    }
    
	require('../stopka.php');
?>
</body>
</html>