<?php
    include_once ('../ui/kontrolki_html.php');
    include_once ('../dal/admDAL.php');
    
    function ListaTagow ($html)
    {
        $i = 0;
        $tablica = null;
        if (strchr($html, '|'))
        {
            $loop = true;
        }
        else
        {
            $loop = false;
        }
        $occurence = 0;
        $offset = 0;
        
        while ($loop)
        {
            $occurence = strpos($html, '|', $occurence);
            $offset = strpos($html, '|', $occurence + 1);
            
            $tag = substr($html, $occurence, $offset - ($occurence - 1));
            $tablica[$tag] = $tag;
            $test_next = strpos($html, '|', $offset + 1);
            if ($test_next < $offset)
            {
                $loop = false;
            }
            $occurence = $offset = $offset + 1;
            $i++;
        }                                              
        
        return $tablica;
    }
    function DodanieTagowBaza ($tablica)
    {
        $dal = new AdministracjaDAL();
        foreach ($tablica as $tag)
        {
            $tabParametr[AdministracjaDAL::$nazwa_lang_tag] = $tag;
            $wynik = $dal->DodajTagJezyk($tabParametr);
        }
    }
    function PodgladPhp ($html, $tagi, $plik_wyn)
    {
        $wynik = '<?php 
        session_start();
        include_once (\'../bll/cache.php\');
        include_once (\'../bll/tags.php\');
        require(\'../conf.php\');
        $tlumaczenia = cachejezyki::Czytaj(); 
        echo \''.$html.'\'; ?>';
        if (is_array($tagi))
        foreach ($tagi as $tag)
        {
            $wynik = str_replace($tag, '\'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], \''.$tag.'\').\'', $wynik);
        }
        
        file_put_contents($plik_wyn, $wynik);
    }
    function OficjalnaPhp ($html, $tagi, $plik_wyn)
    {
        $wynik = '<?php 
        include_once (\'bll/cache.php\');
        include_once (\'bll/tags.php\');
        require(\'conf.php\');
        $tlumaczenia = cachejezyki::Czytaj(); 
        echo \''.$html.'\'; ?>';
        if (is_array($tagi))
        foreach ($tagi as $tag)
        {
            $wynik = str_replace($tag, '\'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], \''.$tag.'\').\'', $wynik);
        }
        
        file_put_contents($plik_wyn, $wynik);
    }
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
	<head>
		<title></title>
		<link rel="stylesheet" href="docs/style.css" type="text/css">
		
		<!-- 
			Include the WYSIWYG javascript files
		-->
		<script type="text/javascript" src="scripts/wysiwyg.js"></script>
		<script type="text/javascript" src="scripts/wysiwyg-settings.js"></script>
		<!-- 
			Attach the editor on the textareas
		-->
		<script type="text/javascript">
        <?php
        if (isset($_POST['strona_zakladki_id']))
			echo "WYSIWYG.attach('textarea1', full);"; // full featured setup
        ?>
		</script>
		
	</head>
	<body>
    <?php
    
    $temp = null;
    $render = null;
    $php_file = null;
    
    if (isset($_POST['strona_zakladki_id']))
    {
        $temp = '../generator/temp_'.$_POST['strona_zakladki_id'].'.php';
        $render = '../generator/'.$_POST['strona_zakladki_id'].'.html';
        $php_file = '../generator/'.$_POST['strona_zakladki_id'].'.php';
    }
    
    if ($_SERVER['REQUEST_METHOD'] == 'POST')
    {
        if (isset($_POST['tresc_html']))
        {
            $_POST['tresc_html'] = str_replace('\"', '"', $_POST['tresc_html']);
            $plik = fopen($render, 'w');
            fwrite($plik, $_POST['tresc_html']);
            fclose($plik);
            //interpretacja - poszukiwanie tagÛw, dodanie tagÛw, parsowanie php tmp
            $tab = ListaTagow($_POST['tresc_html']);
            if (is_array($tab))
            {
                DodanieTagowBaza($tab);
            }
            PodgladPhp($_POST['tresc_html'], $tab, $temp);
            echo '<a href="../generator/temp_o_firmie.php" target="_blank">podglad</a><br />';
            if (isset($_POST['potwierdz_nadpisz']))
            {
                OficjalnaPhp($_POST['tresc_html'], $tab, $php_file);
            }
        }

        //strona_zakladki_id
        if (isset($_POST['strona_zakladki_id']))
        {
            $str = '';
            if (is_file($render))
            {
                $str = file_get_contents($render);
            }
            echo '<form action="index.php" method="POST" name="form_edit">';
            KontrolkiHtml::DodajHidden('strona_zakladki_id', 'strona_zakladki_id', $_POST['strona_zakladki_id']);
	        echo '<textarea id="textarea1" name="tresc_html">';
            echo $str;
            echo '</textarea><br />';
            KontrolkiHtml::DodajSubmit('potwierdz_nadpisz', 'id_potwierdz_nadpisz', 'Potwierdü', '');
            echo '</form>';
        }
    }    
    ?>
    
</body>
</html>
