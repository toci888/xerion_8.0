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
    include_once ('../../dal/admDAL.php');
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
        $uprawnienia = unserialize($_SESSION[$zalogowany]);
        
        if ($uprawnienia->adm_dane)
        {
            $tlumaczenia = cachejezyki::Czytaj();
            $agent_zal = unserialize($_SESSION[$dane_agent]);
            
            $dal = new AdministracjaDAL();
            if (isset($_POST['przebuduj_cache']))
            {
                $tlumaczenia = cachejezyki::ResetRead();
            }
            if (isset($_POST['dodaj']))
            {
                $tabParametr[AdministracjaDAL::$nazwa_lang_tag] = $_POST['kod_wyrazenia'];
                $wynik = $dal->DodajTagJezyk($tabParametr);
                if ($wynik)
                {
                    UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_powiodla_sie));
                }
                else
                {
                    UtilsUI::InfoBlad($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_nie_powiodla_sie));
                }
            }
            if (isset($_POST['zatwierdz']))
            {
                $tabParametr[AdministracjaDAL::$nazwa_lang_tag] = $_POST['wyb_slowo'];
                $tabParametr[NieruchomoscDAL::$id_jezyk] = $_POST['id_jezyk'];
                $tabParametr[AdministracjaDAL::$nazwa] = str_replace(',', '^', $_POST['tlumaczenie'.$_POST['wyb_slowo']]);
                
                $wynik = $dal->DodajTlumaczenie($tabParametr);
                if ($wynik)
                {
                    UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_powiodla_sie));
                }
                else
                {
                    UtilsUI::InfoBlad($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_nie_powiodla_sie));
                }
            }
            if (isset($_POST['podaj_wyrazenia']))
            {
                $tabParametr[NieruchomoscDAL::$id_jezyk] = $_POST['jezyk_id'];
                $wynik = $dal->PodajNieWytlumaczoneSlowa($tabParametr, $ilosc_wierszy);
                
                if ($ilosc_wierszy > 0)
                {
                    UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$znaleziono_rekordow).': '.$ilosc_wierszy);
                    echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'">';
                    KontrolkiHtml::DodajHidden('wyb_slowo', 'wyb_slowo', '');
                    KontrolkiHtml::DodajHidden('id_jezyk', 'id_jezyk', $_POST['jezyk_id']);
                    KontrolkiHtml::DodajHidden('jezyk_id', 'jezyk_id', $_POST['jezyk_id']);
                    KontrolkiHtml::DodajHidden('podaj_wyrazenia', 'podaj_wyrazenia', $_POST['jezyk_id']); //tu byle co, zadaniem jest, aby po dodaniu jednego tlumaczenia lista pozostalych sie ladowala
                    echo '<table>';
                    foreach ($wynik as $wiersz)
                    {
                        echo '<tr><td>'.$tlumaczenia->Tlumacz($polski_jezyk, $wiersz[AdministracjaDAL::$nazwa]).': </td><td>';
                        KontrolkiHtml::DodajTextbox('tlumaczenie'.$wiersz[AdministracjaDAL::$nazwa], 'tlumaczenie'.$wiersz[AdministracjaDAL::$nazwa], '', 500, 50, '');
                        echo '</td><td>';
                        KontrolkiHtml::DodajSubmit('zatwierdz', 'id_zatwierdz', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zatwierdz), 'onclick="wyb_slowo.value = \''.$wiersz[AdministracjaDAL::$nazwa].'\';"');
                        echo '</td></tr>';
                    }
                    echo '</table>';
                    echo '</form>';
                }
            }
            $zazn_jezyk = $_SESSION[$jezyk];
            if (isset($_POST['jezyk_id']))
            {
                $zazn_jezyk = $_POST['jezyk_id'];
            }
            $jezyki = $tlumaczenia->PodajJezyki();
            echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'">';
            echo '<table><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wybierz_jezyk).': </td><td>';
            KontrolkiHtml::DodajSelectDomWartId('jezyki', 'id_jezyki', $jezyki, 'jezyk_id', $zazn_jezyk, '', '', NieruchomoscDAL::$id_jezyk);
            echo '</td><td>';
            KontrolkiHtml::DodajSubmit('podaj_wyrazenia', 'id_podaj_wyrazenia', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wyrazenia_nieprzetlumaczone), '');
            echo '</td></tr></table><hr />';
            
            echo '<table><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$dodaj_kod_wyrazenia).': </td><td>';
            KontrolkiHtml::DodajTextbox('kod_wyrazenia', 'id_kod_wyrazenia', '', 60, 35, '');
            echo '</td><td>';
            KontrolkiHtml::DodajSubmit('dodaj', 'id_dodaj', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$dodaj), '');
            echo '</td></tr></table><hr />';
            KontrolkiHtml::DodajSubmit('przebuduj_cache', 'id_przebuduj_cache', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$przebuduj_cache_jezykow), '');
            echo '</form>';
        }
    }
    require('../../stopka.php');
?>
</body>
</html>
