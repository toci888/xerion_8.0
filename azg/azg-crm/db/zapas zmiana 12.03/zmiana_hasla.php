<html><head><title>A.Z.Gwarancja - Baza Danych</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/style.css" rel="stylesheet" type="text/css"></head>
  <script language="javascript1.3" src="js/script.js"></script>
<body>
<?php
    include_once ('bll/cache.php'); 
    include_once ('bll/jezykibll.php'); 
    include_once ('bll/tags.php'); 
    include_once ('ui/kontrolki_html.php');
    include_once ('ui/utilsui.php');
    require('naglowek.php');
    require('conf.php');
    session_start();
    
    if (!isset($_SESSION[$zalogowany]))
    {
        echo 'Nie jesteś zalogowany.';
    }
    else
    {
        $tlumaczenia = cachejezyki::Czytaj(); 
        //jelsi ktos przycisnal wyslij
        if (isset($_POST['wyslij']))
        {
            if (($_POST['nowe_haslo'] != $_POST['potw_nowe_haslo']) || (strlen($_POST['nowe_haslo']) < 6))
            {
                $niezgodne_hasla = UtilsUI::ZamianaLitery($tlumaczenia->Tlumacz($_SESSION['wyb_jezyk'], tags::$niezgodne).' '.$tlumaczenia->Tlumacz($_SESSION['wyb_jezyk'], tags::$nowe).' '.$tlumaczenia->Tlumacz($_SESSION['wyb_jezyk'], tags::$haslo).'.');
                echo $niezgodne_hasla;
            }
        }
        else
        {
            echo '<form method="post" action="'.$_SERVER['PHP_SELF'].'">
            <br><table border="0" cellpadding="2" cellspacing="0" width="100%"><tbody><tr>
            <td class="text_bold" width="32%"><div align="right">'.$tlumaczenia->Tlumacz($_SESSION['wyb_jezyk'], tags::$login).':&nbsp;&nbsp;&nbsp;</div></td><td width="68%">';
            KontrolkiHtml::DodajTextbox('login', 'id_login', '', 15, 15, '');
            //<input name="login" class="formfield" tabindex="1" type="text"></td>
            echo '</tr><tr><td class="text_bold"><div align="right">'.$tlumaczenia->Tlumacz($_SESSION['wyb_jezyk'], tags::$haslo).':&nbsp;&nbsp;&nbsp;</div></td><td>';
            KontrolkiHtml::AddPassbox('haslo', 'id_haslo', '', 15, 15, '');
            //<input name="pass" class="formfield" tabindex="2" type="password"></td>
            $nowe_haslo = $tlumaczenia->Tlumacz($_SESSION['wyb_jezyk'], tags::$nowe).' '.$tlumaczenia->Tlumacz($_SESSION['wyb_jezyk'], tags::$haslo);
            $nowe_haslo = UtilsUI::ZamianaLitery($nowe_haslo);
            echo '</tr><tr><td class="text_bold"><div align="right">'.$nowe_haslo.':&nbsp;&nbsp;&nbsp;</div></td><td>';
            KontrolkiHtml::AddPassbox('nowe_haslo', 'id_nowe_haslo', '', 15, 15, '');
            //<input name="pass" class="formfield" tabindex="2" type="password"></td>
            $potwierdz_nowe_haslo = $tlumaczenia->Tlumacz($_SESSION['wyb_jezyk'], tags::$potwierdz).' '.$tlumaczenia->Tlumacz($_SESSION['wyb_jezyk'], tags::$nowe).' '.$tlumaczenia->Tlumacz($_SESSION['wyb_jezyk'], tags::$haslo); 
            //zamiana litery wylatuje - pomysl na wielojezykowowsci sie wysypie, nie da rady tak dzialac (chodzi o szyk zdania - kolejnosc liter)
            $potwierdz_nowe_haslo = UtilsUI::ZamianaLitery($potwierdz_nowe_haslo);
            echo '</tr><tr><td class="text_bold"><div align="right">'.$potwierdz_nowe_haslo.':&nbsp;&nbsp;&nbsp;</div></td><td>';
            KontrolkiHtml::AddPassbox('potw_nowe_haslo', 'id_potw_nowe_haslo', '', 15, 15, '');
            //<input name="pass" class="formfield" tabindex="2" type="password"></td>
            echo '</tr><tr><td class="text_bold">&nbsp;</td><td><br>';
            KontrolkiHtml::DodajSubmit('wyslij', 'id_wyslij', $tlumaczenia->Tlumacz($_SESSION['wyb_jezyk'], tags::$potwierdz), '');
            //<input name="wyslij" class="formreset" value="$tlumaczenia->Tlumacz($_SESSION['wyb_jezyk'], tags::$potwierdz)" tabindex="3" type="submit"></td>
            echo '</tr></tbody></table></form>'; 
        }
    }
?>

</body>
</html>