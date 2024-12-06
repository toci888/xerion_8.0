<html><head><title>A.Z.Gwarancja - Baza Danych</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/style.css" rel="stylesheet" type="text/css"></head>
  <script language="javascript1.3" src="js/script.js"></script>
<body class="logo_top" >
<?
//onload="RadioOfertaZapotrzebowanie();"
    include_once ('bll/transnierbll.php');
    include_once ('bll/jezykibll.php');
    include_once ('dal/queriesDAL.php'); 
    include_once ('ui/kontrolki_html.php');
    include_once ('ui/utilsui.php');
    include_once ('bll/tags.php');
    include_once ('bll/agentbll.php');
    require('naglowek.php');
    require('conf.php');
    session_start();
    //echo 'Ĺ‚ĂłĹ„Ä‡ĹşĹĽÄ…Ĺ›Ä™';
    //$uprawnienia = unserialize($_SESSION['uprawnienia']);
    
    $tlumaczenia = cachejezyki::Czytaj();
    if (!isset($_SESSION[$zalogowany]))
    {
        echo 'Nie jesteś zalogowany.';
    }
    else
    {
        //if(isset($_POST['dodaj_zapotrzebowanie']))
        //{
            //$_SESSION[$posiada_poszukuje] = tags::$zapotrzbowanie;
        //    header('Location: dodanie_klient.php?zatwierdz_zapotrzebowanie=true');
        //}
        $agent_zal = unserialize($_SESSION[$dane_agent]);
        /*if(isset($_SESSION[$nier_trans]))
        {
            $obiektTrans = unserialize($_SESSION[$nier_trans]);
        }
        else
        {
            $obiektTrans = new TransNierBLL();
            $_SESSION[$nier_trans] = serialize($obiektTrans);
        } */
        
        //$tabNier = $obiektTrans->PodajTabNier();
        
        //dorobic radia
        /*if (isset($_POST['oferta_zapotrzebowanie']))
        {
            $_SESSION[$posiada_poszukuje] = $_POST['oferta_zapotrzebowanie'];
        }
        
        $zazn = null;
        if (isset($_SESSION[$posiada_poszukuje]))
        {
            $zazn = $_SESSION[$posiada_poszukuje];
        } */
        //przy formularzu szukania oferty - zapotrzebowania wykorzystac to radio tu: tam dac hiddena (to sa niezalezne formularze)
        //a tu js przekazac co jest wybrane; na onload strony ten hidden musi miec zaladowana wartosc z tego radia niezaleznie, dlatego ze radio 
        //jest lepkie i moze przy f5 od razu uzyskiwac zaznaczewnie na zapotrzebowanie nie na ofercie
        
        echo '<table><tr><td>';
        
            //tworzenie nowej table, 1 wiersz nazwa agenta, 2 wiersz ilosc dni do ydasniecia hasla ...
            echo '<table>';
            echo '<tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zalogowany).':</td><td><b>'.$agent_zal->nazwa.'</b></td></tr>';
            echo '<tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$pozostalo).': <b>'.$agent_zal->data_wyg_haslo.'</b></td><td>'.
            $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$dni_do_wygasniecia_hasla).'.</td></tr>';
            echo '<tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$id_agenta).':</td><td><b>'.$agent_zal->id.'</b>.</td></tr>';
            echo '</table>';  //<tr><td></td></tr><tr><td></td></tr><tr><td></td></tr><tr><td></td></tr><tr><td></td></tr><tr><td></td></tr>
        echo '</td><td valign="top">';    
            echo '<table><tr><td>';
            echo '<form method="POST" target="left" action="left.php">';
            KontrolkiHtml::DodajSubmit('oferty', 'id_oferty', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$oferty), '');
            echo '</form>';
            echo '</td><td>';
            echo '<form method="POST" target="left" action="left.php">';
            KontrolkiHtml::DodajSubmit('klienci', 'id_klienci', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$klienci), '');
            echo '</form>';
            echo '</td></tr></table>';
        echo '</td></tr></table>';
        /*echo '</td><td valign="top">'; 
            
        //echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'"><table><tr>';            
        //KontrolkiHtml::DodajHidden('of_zap_hid', 'of_zap_hid', tags::$oferta);
        //onclick="of_zap_hid.value = this.value;"
        
            echo '<table><tr><form method="POST" target="center" action="szybkieszukanie.php">';
                    KontrolkiHtml::DodajRadio('oferta_zapotrzebowanie', array('id_oferta', 'id_zapotrzebowanie'), 
                    array(tags::$oferta, tags::$zapotrzbowanie), array(tags::$oferta, tags::$zapotrzbowanie), '', false, $zazn, '<td >', '</td>'); //array z tags 1 jest do tlumaczenia - tego co sie pojawaia
            //2 array z tags to jzu kwestia drogi na skroty - do  sesji poslemy jedno z 2: albo oferta alobo zapotrzebowanie; zeby nie powielac po 100 razy stalych
            //bedziemy sesje sprawdzac z tagami zamiast z jakas stala z confa
                  echo '</tr><tr>';
                  //bgcolor="#eeffee"
            echo '<td >'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nazwisko).' : </td><td >';
                      KontrolkiHtml::DodajTextbox('nazwisko', 'id_nazwisko', '', 20, 20, '');
                echo '</td><td >'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$numer_oferty).' : </td><td >';KontrolkiHtml::DodajTextbox('numer', 'id_numer', '', 6, 6, ''); 
                       echo '</td><td >';
                                KontrolkiHtml::DodajSubmit('szukaj','id_szukaj',$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$szukaj).'.','');
                                /////////////////////////////////////////////////////////
                         echo '</td></form><form method="POST" action="'.$_SERVER['PHP_SELF'].'"><td>';
                                   KontrolkiHtml::DodajSelectDomWartId('nieruchomosci', 'id_nieruchomosci', $tabNier, 'hid_r_nier', null, '', '', TransNierDAL::$id_nieruchomosc, TransNierDAL::$nazwa_nieruchomosc);
                           echo '</td><td>';
                                    KontrolkiHtml::DodajSubmit('zatwierdz_nieruchomosc', 'id_zatwierdz_nieruchomosc', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zatwierdz), '');
                             echo '</td></form><form method="POST" target="center" action="dodanie_klient.php">
                                      <td>';
                                       KontrolkiHtml::DodajSubmit('dodaj_zapotrzebowanie', 'id_dodaj_zapotrzebowanie', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$dodaj_zapotrzebowanie), '');
                               echo '</td></form>
                  </tr>';
                  //</table>
            if(isset($_POST['zatwierdz_nieruchomosc']))
            {
                echo '<form method="POST" target="center" action="dodanie_klient.php"><tr><td></td><td></td><td></td><td></td><td></td>';
                //<table>
                //echo '<input type="hidden" name="hid_r_tr" id="hid_r_tr">';
                //KontrolkiHtml::DodajHidden('hid_r_tr', 'hid_r_tr', '');
                KontrolkiHtml::DodajHidden('hid_r_nier', 'hid_r_nier', $_POST['hid_r_nier']);
                $tabParam[TransNierDAL::$id_nieruchomosc] = $_POST['hid_r_nier'];
                $tabParam[TransNierDAL::$of_zap] = $_SESSION[$posiada_poszukuje];
                $tabTransNier = $obiektTrans->PodajTransDlaNier($tabParam, $iloscWierszy);
                                
                echo '<td>';
                KontrolkiHtml::DodajSelectDomWartId('transakcje', 'id_transakcje', $tabTransNier, 'hid_r_tr', null, '', '');
                echo '</td><td>';
                KontrolkiHtml::DodajSubmit('zatwierdz_transakcje', 'id_zatwierdz_transakcje', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zatwierdz), '');
                echo '</td></tr></form>';
                //</table>   
            }
        /////////////////////////////////////////
        //echo '<form method="POST" target="center" action="'.$_SERVER['PHP_SELF'].'"><td>';
        
        
        echo '</td></tr></table>';  */
        
        ///echo '</td><td align="right"></td></tr></table>';
    }
	require('stopka.php');
?>
</body>
</html>
