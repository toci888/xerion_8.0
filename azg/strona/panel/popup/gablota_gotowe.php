<HTML>
<HEAD>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <script language="javascript" src="../../js/script.js"></script>
  <link href="../../css/gablota.css" rel="stylesheet" type="text/css">
</head>
<body onload="window.print();">
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
    include_once ('../../bll/transnierbll.php');
    require('../../naglowek.php');
    require('../../conf.php');
    
    if (!isset($_SESSION[$zalogowany]))
    {
        echo 'Nie jesteÅ› zalogowany.';
    }
    else
    {
        $tlumaczenia = cachejezyki::Czytaj();
        $agent_zal = unserialize($_SESSION[$dane_agent]);
        if (isset($_POST['drukuj']) && isset($_POST[NieruchomoscDAL::$id_oferta]))
        {
            $wysokosc = 340;
            $dal = new StronaPodsInfoDAL();
            $rodz_trans_nier = $dal->RodzajOferta($_POST[NieruchomoscDAL::$id_trans_rodzaj], $_POST[NieruchomoscDAL::$id_nier_rodzaj]);
            
            //$styl_bkg_clr = 'blue.jpg';
            
            $kolory_url = array($mieszkanie_nier_id => '#8f8f8f', $dom_nier_id => '#2865b5', $lokal_nier_id => '#b52865', $obiekt_nier_id => '#b52865', $teren_nier_id => '#65b528', $dzialka_nier_id => '#65b528');
            $styl_bkg_clr = 'style="background-color: '.$kolory_url[$_POST[NieruchomoscDAL::$id_nier_rodzaj]].';"';
            
            $tabParametr[NieruchomoscDAL::$id_oferta] = $_POST[NieruchomoscDAL::$id_oferta];
            
            $dane = $dal->OfertaSkroconaPojGablota($tabParametr, $ilosc_wierszy);
            $dane = $dane[0];
            $pelna_szer = 978;
            $j = 2;
            $i = $_POST['jeden_dwa'];
            //echo $_POST['jeden_dwa'];
            $szer = $pelna_szer / $j;
            echo '<table width="'.$szer.'"><tr>';
            while ($i > 0)
            {
                echo '<td width="490" border="1" rules="all" class="tableBorder">';
                echo '<table border="1" rules="all" class="tableBorder"><tr><td colspan="2" align="center" '.$styl_bkg_clr.' class="naglowek_sama_gora"><b>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], $rodz_trans_nier[0][NieruchomoscDAL::$transakcja_rodzaj]).' - '.
                $tlumaczenia->Tlumacz($_SESSION[$jezyk], $rodz_trans_nier[0][NieruchomoscDAL::$nieruchomosc_rodzaj]).' - '.
                $tlumaczenia->Tlumacz($_SESSION[$jezyk], $dane[NieruchomoscDAL::$rodzaj_budynek]);
                echo '</b></td></tr><tr><td colspan="2" align="center" class="czerwone_duze"><b>';
                if ($dane[StronaPodsInfoDAL::$wylacznosc])
                {
                    echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$oferta_na_wylacznosc);
                }
                else
                {
                    echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$oferta_w_naszym_biurze);
                }
                echo '</b></td></tr><tr>';
                if (isset($_POST['zdjecia']))
                {
                    echo '<td colspan="2"><img width="480" height="'.$wysokosc.'" src="../../media/'.$_POST[NieruchomoscDAL::$id_nieruchomosc].'/zdjecia/'.$_POST['zdjecia'].'" /></td>';
                }
                else
                {
                    echo '<td colspan="2" align="center" width="580" height="'.$wysokosc.'" class="naglowek_gora">'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], $rodz_trans_nier[0][NieruchomoscDAL::$nieruchomosc_rodzaj]).' <br /> '.
                    $tlumaczenia->Tlumacz($_SESSION[$jezyk], $dane[NieruchomoscDAL::$rodzaj_budynek]).'</td>';
                }
                //lokalizacja + cena, potem params + wypos
                
                echo '</tr><tr><td><b>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$lokalizacja).': </b>'.$dane[StronaOfertaDAL::$lokalizacja].'</td><td><b>';
                $cena = number_format($dane[NieruchomoscDAL::$cena], 0, ',', '.');
                echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$cena).': </b>'.$cena.' PLN</td></tr>';
                $licz = 0;
                if (isset($_POST['parametry']))
                foreach ($_POST['parametry'] as $parametr)
                {
                    if ($licz % 2 == 0)
                    {
                        echo '<tr>';
                    }
                    $odlamki = explode(' : ', $parametr);
                        //$odlamki = explode(' : ', UtilsUI::KonwersjaEncoding($tlumaczenia->TlumaczZlozenieTag($jezyk_id, $wartosc, ' : '), $jezyk_id));
                        //$tekst .= '<td class="strtd"><b>'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($jezyk_id, $odlamki[0]), $jezyk_id).': </b>'.$odlamki[1].'</td>';
                    echo '<td><b>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], $odlamki[0]).': </b>'.$odlamki[1].'</td>';
                    $licz++;
                    if ($licz % 2 == 0)
                    {
                        echo '</tr>';
                    }
                }
                if (isset($_POST['wyposazenia']))
                foreach ($_POST['wyposazenia'] as $wyposazenie)
                {
                    if ($licz % 2 == 0)
                    {
                        echo '<tr>';
                    }
                    $odlamki = explode(' : ', $tlumaczenia->TlumaczZlozenieTag($_SESSION[$jezyk], $wyposazenie, ' : '));
                        //$odlamki = explode(' : ', UtilsUI::KonwersjaEncoding($tlumaczenia->TlumaczZlozenieTag($jezyk_id, $wartosc, ' : '), $jezyk_id));
                        //$tekst .= '<td class="strtd"><b>'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($jezyk_id, $odlamki[0]), $jezyk_id).': </b>'.$odlamki[1].'</td>';
                    echo '<td><b>'.$odlamki[0].': </b>'.$odlamki[1].'</td>';
                    $licz++;
                    if ($licz % 2 == 0)
                    {
                        echo '</tr>';
                    }
                }
                while ($licz < 6)
                {
                    if ($licz % 2 == 0)
                    {
                        echo '<tr>';
                    }
                    echo '<td>&nbsp;</td>';
                    $licz++;
                    if ($licz % 2 == 0)
                    {
                        echo '</tr>';
                    }
                }
                echo '</table>'; 
                
                echo '<b>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$numer_oferty).': '.$dane[NieruchomoscDAL::$id_oferta].'.</b>';
                $komorka = number_format($dane[OsobaDAL::$komorka], 0, '', '-');
                $telefon = number_format($dane[OsobaDAL::$telefon], 0, '', '-');
                echo '<table width="484" border="1" rules="all" class="tableBorder"><tr><td align="left"><b><span class="naglowek_gora">'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$prowadzacy_oferte).
                ':</span><br /></b><span style="color: black;">'.$dane[NieruchomoscDAL::$agent].'.</span>';
                echo '<br /><span class="naglowek_gora"><b>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$telefon).': 0'.$komorka.', 0'.$telefon.'</b></span></td></tr>';
                echo '<tr><td align="left"><b><span class="naglowek_gora">'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wiecej_informacji_na_stronie_internetowej).': </span></b><br />';
                echo '<b><center><span class="napis_www">www.azg.pl</span></center></b></td></tr>';
                echo '</table>';
                
                echo '</td>';
                $i--;
            }
            echo '</tr></table>';
        }
    }
    require('../../stopka.php');
?>
</body>
</html>
