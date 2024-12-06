<html><head><title>A.Z.Gwarancja - Baza Danych</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/style.css" rel="stylesheet" type="text/css"></head>
  <script language="javascript1.3" src="../js/script.js"></script>
<body>
<?php
    include_once ('../bll/cache.php'); 
    include_once ('../bll/jezykibll.php'); 
    include_once ('../bll/tags.php'); 
    include_once ('../dal/admDAL.php'); 
    include_once ('../ui/kontrolki_html.php');
    include_once ('../ui/utilsui.php');
    require('../naglowek.php');
    require('../conf.php');
    session_start();
    
    if (!isset($_SESSION[$zalogowany]))
    {
        echo 'Nie jesteś zalogowany.';
    }
    else
    {
        $tlumaczenia = cachejezyki::Czytaj();
        $agent_zal = unserialize($_SESSION[$dane_agent]); 
        //jesli ktos przycisnal wyslij
        if (isset($_POST['wyslij']))
        {
            if ($_POST['nowe_haslo'] != $_POST['potw_nowe_haslo'])
            {
                $niezgodne_hasla = UtilsUI::ZamianaLitery($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$niezgodne).' '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nowe).' '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$haslo).'.');
                UtilsUI::InfoBlad($niezgodne_hasla);
            }
            else if (strlen($_POST['nowe_haslo']) < 8)
            {
                //haslo za krotkie
                UtilsUI::InfoBlad($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$haslo_jest_za_krotkie));
            }
            else
            {
                //przekalkulowac twardosc i jazda
                $dal = new AgenciDAL();
                
                $tabParametr[AgenciDAL::$login] = $agent_zal->login;
                $tabParametr[AgenciDAL::$haslo] = $_POST['haslo'];
                $tabParametr[AgenciDAL::$nowe_haslo] = $_POST['nowe_haslo'];
                $wynik = $dal->ZmianaHasloAgent($tabParametr);
                if ($wynik[NieruchomoscDAL::$id])
                {
                    UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_powiodla_sie));
                }
                else
                {
                    UtilsUI::InfoBlad($tlumaczenia->Tlumacz($_SESSION[$jezyk], $wynik[NieruchomoscDAL::$nazwa]));
                }
            }
        }
        else
        {
            //var_dump($agent_zal);
            echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'"><table border="0"><tbody>
            <tr><td class="text_bold">'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$haslo).':&nbsp;&nbsp;&nbsp;</td><td>';
            KontrolkiHtml::AddPassbox('haslo', 'id_haslo', '', 15, 15, '');
            //<input name="pass" class="formfield" tabindex="2" type="password"></td>
            $nowe_haslo = $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nowe).' '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$haslo);
            $nowe_haslo = UtilsUI::ZamianaLitery($nowe_haslo);
            echo '</tr><tr><td class="text_bold">'.$nowe_haslo.':&nbsp;&nbsp;&nbsp;</td><td>';
            KontrolkiHtml::AddPassbox('nowe_haslo', 'id_nowe_haslo', '', 15, 15, '', true);
            //<input name="pass" class="formfield" tabindex="2" type="password"></td>
            $potwierdz_nowe_haslo = $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$potwierdz).' '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nowe).' '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$haslo); 
            //zamiana litery wylatuje - pomysl na wielojezykowowsci sie wysypie, nie da rady tak dzialac (chodzi o szyk zdania - kolejnosc liter)
            $potwierdz_nowe_haslo = UtilsUI::ZamianaLitery($potwierdz_nowe_haslo);
            echo '</tr><tr><td class="text_bold">'.$potwierdz_nowe_haslo.':&nbsp;&nbsp;&nbsp;</td><td>';
            KontrolkiHtml::AddPassbox('potw_nowe_haslo', 'id_potw_nowe_haslo', '', 15, 15, '', true);
            //<input name="pass" class="formfield" tabindex="2" type="password"></td>
            echo '</tr><tr><td class="text_bold">&nbsp;</td><td><br>';
            KontrolkiHtml::DodajSubmit('wyslij', 'id_wyslij', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$potwierdz), '');
            //<input name="wyslij" class="formreset" value="$tlumaczenia->Tlumacz($_SESSION['wyb_jezyk'], tags::$potwierdz)" tabindex="3" type="submit"></td>
            echo '</tr></tbody></table></form>'; 
        }
    }
    require('../stopka.php'); 
?>

</body>
</html>