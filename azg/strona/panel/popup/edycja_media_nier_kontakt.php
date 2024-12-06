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
        
        $id_status = null;
        
        if (isset($_GET[MediaDAL::$id_media_nieruchomosc]))
        {
            $id_media = $_GET[MediaDAL::$id_media_nieruchomosc];
            $id_status = $_GET[NieruchomoscDAL::$id_status];
        }
        if (isset($_POST[MediaDAL::$id_media_nieruchomosc]))
        {
            $id_media = $_POST[MediaDAL::$id_media_nieruchomosc];
            $id_status = $_POST[NieruchomoscDAL::$id_status];
        }
        
        $disable = '';
        if ($id_status == $status_umowiony)
        {
            $disable = 'disabled';
        }
        
        $dal = new MediaDAL();
        
        if (isset($_POST['zatwierdz']))
        {
            $wynik = $dal->DodajKontaktMediaNier(array(MediaDAL::$id_media_nieruchomosc => $id_media, NieruchomoscDAL::$id_agent => $agent_zal->id, 
            MediaDAL::$komentarz => $_POST['komentarz']));
            if (!$wynik)
            {
                UtilsUI::InfoBlad($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_nie_powiodla_sie));
            }
        }
        
        $tabParametr[MediaDAL::$id_media_nieruchomosc] = $id_media;
        
        /*$telefony = $dal->PodajTelefonMedia($tabParametr, $ilosc_wierszy);
        UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$telefony_kontaktowe));
        echo '<table>';
        if (is_array($telefony))
        foreach ($telefony as $wiersz)
        {
            echo '<tr><td>'.$wiersz[MediaDAL::$nazwa].'</td><td>'.$wiersz[MediaDAL::$opis].'</td></tr>';
        }
        echo '</table><hr />';*/
        
        $wynik = $dal->PodajKontaktyMediaNier($tabParametr, $ilosc_wierszy);

        //echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'">';
        UtilsUI::WyswietlTab1Poz($wynik, array(MediaDAL::$komentarz, NieruchomoscDAL::$data, NieruchomoscDAL::$agent), 
                array(tags::$komentarz, tags::$data, tags::$agent), MediaDAL::$id_media_nieruchomosc, 'kontakt', null); 
        //echo '</form>'; 

        echo '<hr /><form method="POST" action="'.$_SERVER['PHP_SELF'].'"><table>';
        KontrolkiHtml::DodajHidden(MediaDAL::$id_media_nieruchomosc, MediaDAL::$id_media_nieruchomosc, $id_media);
        KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_status, NieruchomoscDAL::$id_status, $id_status);
        echo '<tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$komentarz).' :</td><td>';
        KontrolkiHtml::DodajTextArea('komentarz', 'id_komentarz', '', 50, 5, '', $disable);
        echo '</td></tr><tr><td>';
        KontrolkiHtml::DodajSubmit('zatwierdz', 'id_zatwierdz', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zatwierdz).'.', $disable);
        echo '</td></tr></table></form>';
    }
    require('../../stopka.php');

?>
</body>
</html>
