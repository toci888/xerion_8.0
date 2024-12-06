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
    include_once ('../../bll/ofertystronabll.php');
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
            $zdj_o_firmie = new StronaElemBLL();
            
            if (isset($_POST['dodaj_zdjecie'])) 
            {
                $tab_plik = explode('.', $_FILES['zdjecie']['name']);
                $rozszerzenie = strtolower($tab_plik[count($tab_plik) - 1]);
                
                $zdj_o_firmie->DodajPlikOFirmie($_FILES['zdjecie']['tmp_name'], $rozszerzenie, $_POST['opis_tag'], 1);
                //$sciezka .= $wynik[0];

                    //UtilsUI::ObrazRozmiarNorm($sciezka.$wynik[0]);
                    //UtilsUI::ObrazRozmiarPom($sciezka.$wynik[0], $sciezka.'m_'.$wynik[0]);
                //echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_powiodla_sie);

                //echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_nie_powiodla_sie);
            }
            
            $dal = new AdministracjaDAL();
            $wynik = $dal->PodajZakladkiStr($ilosc_wierszy);
            
            if ($ilosc_wierszy > 0)
            {
                echo '<form method="POST" action="../../edytor/index.php">';
                UtilsUI::WyswietlTab1Poz($wynik, array(NieruchomoscDAL::$nazwa), 
                array(tags::$zakladka), AdministracjaDAL::$nazwa, 'strona_zakladki_id', array(Akcja::$edycja => 1));
                echo '</form>';
            }
            
            
            
            $zdjecia = $zdj_o_firmie->PodajPlikOFirmie();
            echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'">';
            UtilsUI::WyswietlTab1Poz($zdjecia, array('opis'), array(tags::$opis), 'zdjecie', 'zdjecie', array(Akcja::$kasowanie => 1)); //Akcja::$edycja => 1, edycja pobawic sie pozniej
            echo '</form>';
            
            UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$dodaj_zdjecie_o_firmie));
            echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'" enctype="multipart/form-data" ><table><tr><td>';
            KontrolkiHtml::DodajPlikWysylka('zdjecie', 'id_zdjecie', '');
            echo '</td></tr><tr><td>';
            KontrolkiHtml::DodajTextbox('opis_tag', 'id_opis_tag', '', 30, 30, ''); //walidacja tagow :) do zrobienia
            echo '</td></tr><tr><td>';
            KontrolkiHtml::DodajSubmit('dodaj_zdjecie', 'id_dodaj_zdjecie', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$dodaj), '');
            echo '</td></tr></table></form>';
        }
    }
    require('../../stopka.php');
?>
</body>
</html>
