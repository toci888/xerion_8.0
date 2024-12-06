<html><head><title>A.Z.Gwarancja - Baza Danych</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/style.css" rel="stylesheet" type="text/css"></head>
  <script language="javascript" src="../js/script.js"></script>
<body>
<?php
    include_once ('../bll/agentbll.php');
    include_once ('../bll/jezykibll.php');
    include_once ('../bll/cache.php');
    include_once ('../dal/admDAL.php');
    include_once ('../ui/kontrolki_html.php');
    require('../conf.php');
    session_start();
    $_SESSION[$jezyk] = 1;
    $tlumaczenia = cachejezyki::Czytaj();

    if (isset($_POST['wyslij_zm_wyg_haslo']))
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
            
            $tabParametr[AgenciDAL::$login] = $_POST['login'];
            $tabParametr[AgenciDAL::$haslo] = $_POST['haslo'];
            $tabParametr[AgenciDAL::$nowe_haslo] = $_POST['nowe_haslo'];
            $wynik = $dal->ZmianaHasloAgent($tabParametr);
            if ($wynik[NieruchomoscDAL::$id])
            {
                UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_powiodla_sie));
                ///url to log in
                echo '<a href="http://'.$_SERVER['SERVER_NAME'].'/panel">'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zaloguj_sie).'</a>';
            }
            else
            {
                UtilsUI::InfoBlad($tlumaczenia->Tlumacz($_SESSION[$jezyk], $wynik[NieruchomoscDAL::$nazwa]));
            }
        }
    } 
    if (isset( $_POST['wyslij']))
    {
        $obj = new AgentBLL();
        $uprawnienia = null;
        
        $tabParam[AgentDAL::$login] = $_POST['login'];
        $tabParam[AgentDAL::$haslo] = $_POST['pass'];
        $wynik = $obj->Logowanie($tabParam, $uprawnienia);
        
        //echo 'fasdfad';
        //echo $wynik[0][AgentDAL::$rezultat];
                
        if ($wynik->rezultat)
        {
            echo 'Zalogowano.';
            //var_dump($uprawnienia);
            $_SESSION[$zalogowany] = serialize($uprawnienia);
            $_SESSION[$dane_agent] = serialize($wynik);
            
            ///ustawnienie sesji z uprawnieniami, sama sesja jednoczesnie jest dowodem zalogowania
            header ('Location: pgsql.php');
        }
        else
        {
            unset($_SESSION['uprawnienia']);
            ///data_wyg_haslo
            //pare ifow - wygaslo haslo itd form zmiany itd :P
            UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], $wynik->nazwa));
            if ($wynik->nazwa == '_haslo_wygaslo')
            {
                UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zmiana_hasla));
                //jesli ilosc dni jest mniejsza - form zm hasla, jesli konto jest nieaktywne - sorry, jesli pomylono loginy - link do formu ??
                echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'"><table border="0"><tbody>
                <tr><td class="text_bold">'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$login).':&nbsp;&nbsp;&nbsp;</td><td>';
                KontrolkiHtml::DodajTextbox('login', 'id_login', '', 20, 15, '');
                echo '</td></tr><tr><td class="text_bold">'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$haslo).':&nbsp;&nbsp;&nbsp;</td><td>';
                KontrolkiHtml::AddPassbox('haslo', 'id_haslo', '', 15, 15, '');
                $nowe_haslo = $tlumaczenia->Tlumacz($_SESSION['wyb_jezyk'], tags::$nowe).' '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$haslo);
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
                KontrolkiHtml::DodajSubmit('wyslij_zm_wyg_haslo', 'id_wyslij', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$potwierdz), '');
                //<input name="wyslij" class="formreset" value="$tlumaczenia->Tlumacz($_SESSION['wyb_jezyk'], tags::$potwierdz)" tabindex="3" type="submit"></td>
                echo '</tr></tbody></table></form>';
            }
            else
            {
                echo '<a href="http://'.$_SERVER['SERVER_NAME'].'/panel">'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zaloguj_sie).'</a>';
            }
            
            //jesli konto nieaktywne - aktywnosc_konto na false
            //jesli haslo wygaslo - il_dni_wyg < 1
        }
    }
    
    if (isset($_POST['wyloguj']))
    {
        unset($_SESSION['uprawnienia']);
        ///unsetowac ewentualnie wszystko inne najlepiej foreachem :P, zrobic na to util :P
        echo '<script>parent.window.location.href="index.php";</script>';
        //header ('Location: index.php'); 
    }
?>
</body>
</html>