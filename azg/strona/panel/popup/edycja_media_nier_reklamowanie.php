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
    include_once ('../../dal/queriesDAL.php');
    include_once ('../../ui/kontrolki_html.php');
    include_once ('../../ui/utilsui.php'); 
    include_once ('../../bll/parametrynierbll.php');
    include_once ('../../bll/tags.php'); 
    include_once ('../../bll/agentbll.php');
    include_once ('../../bll/jezykibll.php');
    include_once ('../../bll/cache.php');
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
        
        if (isset($_GET[MediaDAL::$id_media_nieruchomosc]))
        {
            $id_media = $_GET[MediaDAL::$id_media_nieruchomosc];
        }
        if (isset($_POST[MediaDAL::$id_media_nieruchomosc]))
        {
            $id_media = $_POST[MediaDAL::$id_media_nieruchomosc];
        }
        
        if (isset($_POST['zatwierdz']))
        {
            $dal = new MediaDAL();
            $wynik = $dal->DodajReklamaMedia(array(MediaDAL::$id_media_nieruchomosc => $id_media, MediaDAL::$id_media_reklama => $_POST['media_reklama_id'], MediaDAL::$data => $_POST['data']), 
            $ilosc_wierszy);
            if (!$wynik)
            {
                UtilsUI::InfoBlad($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_nie_powiodla_sie));
            }
        }
        
        $dal = new MediaDAL();
        
        $tabParametr[MediaDAL::$id_media_nieruchomosc] = $id_media;
        
        $wynik = $dal->PodajReklamaMedia($tabParametr, $ilosc_wierszy);
        if ($ilosc_wierszy > 0)
        {
            UtilsUI::$rekordy = $ilosc_wierszy;
            UtilsUI::WyswietlTab1Poz($wynik, array(MediaDAL::$media_reklama, NieruchomoscDAL::$data), 
                array(tags::$media, tags::$data), MediaDAL::$id_media_nieruchomosc, 'reklama', null);
        }
        //var_dump($wynik);
        
        echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'" name="dodanie_reklamowanie"><table>';
        KontrolkiHtml::DodajHidden(MediaDAL::$id_media_nieruchomosc, MediaDAL::$id_media_nieruchomosc, $id_media);
        
        echo '<tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$data).' :</td><td>';
        KontrolkiHtml::DodajTextboxData('data', 'id_data', $data_dzienna, 10, 10, $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podana_inf_nie_jest_data), '', '', 'dodanie_reklamowanie', '../');
        echo '</td><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$reklamowanie).' :</td><td>';

        KontrolkiHtml::DodajSelectZrodSlownik('reklama', 'id_reklama', SlownikDAL::$media_reklama, 'media_reklama_id', null, '', '');
        echo '</td></tr><tr><td>';
        KontrolkiHtml::DodajSubmit('zatwierdz', 'id_zatwierdz', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zatwierdz).'.', '');
        echo '</td></tr></table></form>';    
        
        echo '<hr />';
        KontrolkiHtml::DodajSubmit('ok', 'id_ok', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zakoncz), 'onclick="window.close();"');
    }
    require('../../stopka.php');

?>
</body>
</html>
