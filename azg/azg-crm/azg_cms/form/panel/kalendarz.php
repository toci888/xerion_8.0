<HTML>
<HEAD>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <script language="javascript" src="../js/script.js"></script>
<link href="../css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<?php
    // ¶ ±
    session_start();
    include_once ('../dal/queriesDAL.php');
    include_once ('../ui/kontrolki_html.php');
    include_once ('../ui/utilsui.php');
    include_once ('../bll/parametrynierbll.php'); 
    include_once ('../bll/tags.php'); 
    include_once ('../bll/agentbll.php');
    include_once ('../bll/jezykibll.php');
    include_once ('../bll/cache.php');
    include_once ('../bll/transnierbll.php');
    require('../naglowek.php');
    require('../conf.php');
    
    if (!isset($_SESSION[$zalogowany]))
    {
        echo 'Nie jesteÅ› zalogowany.';
    }
    else
    {
        $tlumaczenia = cachejezyki::Czytaj();
        $agent_zal = unserialize($_SESSION[$dane_agent]);
        $komentarz = '';
        
        ///pomyslec o wystukaniu paru formularzy : ja wszyscy, data
        
        $dal = new KalendarzDAL();  
    
        if (isset($_POST['aktualizuj']) && isset($_POST['kalendarz_id']))
        {
            if (strlen($_POST['komentarz']) > 0)
            {
                $_POST['agent_id'] = explode(';', $_POST['agent_id']);
                $tabParametr[KalendarzDAL::$id_kalendarz] = $_POST['kalendarz_id'];
                $tabParametr[KalendarzDAL::$data] = $_POST['data'];
                $tabParametr[KalendarzDAL::$id_godzina] = $_POST['godzina_id'];
                $tabParametr[KalendarzDAL::$id_minuta] = $_POST['minuta_id'];
                $tabParametr[KalendarzDAL::$id_agent] = $_POST['agent_id'];
                $tabParametr[KalendarzDAL::$id_spotkanie] = $_POST['spotkanie_id'];
                $tabParametr[KalendarzDAL::$komentarz] = $_POST['komentarz'];
                
                $wynik = $dal->WpisKalendarz($tabParametr);
                
                if ($wynik['nazwa'] != null)
                {
                    echo UtilsUI::InfoBlad($tlumaczenia->Tlumacz($_SESSION[$jezyk], $wynik['nazwa']));
                }
            }
        }
        if (isset($_POST['kasowanie']) && isset($_POST['kalendarz_id']))
        {
            $wynik = $dal->UsunWpisKalendarz(array(KalendarzDAL::$id_kalendarz => $_POST['kalendarz_id']));
            if ($wynik[NieruchomoscDAL::$nazwa] != null)
            {
                UtilsUI::InfoBlad($tlumaczenia->Tlumacz($_SESSION[$jezyk], $wynik[NieruchomoscDAL::$nazwa]));
            }
        }
        if (isset($_POST['zatwierdz']))
        {
            if (strlen($_POST['komentarz']) > 0)
            {
                $_POST['agent_id'] = explode(';', $_POST['agent_id']);
                $tabParametr[KalendarzDAL::$data] = $_POST['data'];
                $tabParametr[KalendarzDAL::$id_godzina] = $_POST['godzina_id'];
                $tabParametr[KalendarzDAL::$id_minuta] = $_POST['minuta_id'];
                $tabParametr[KalendarzDAL::$id_agent] = $_POST['agent_id'];
                $tabParametr[KalendarzDAL::$komentarz] = $_POST['komentarz'];
            
                $wynik = $dal->WpisKalendarz($tabParametr);
                
                if ($wynik['nazwa'] != null)
                {
                    echo UtilsUI::InfoBlad($tlumaczenia->Tlumacz($_SESSION[$jezyk], $wynik['nazwa']));
                    $komentarz = $_POST['komentarz'];
                }
            }
        }
        
        $agenci = $dal->PodajAgentow($ilosc_wierszy);        
        
        $tabParametr = array();
        $tabParametr[KalendarzDAL::$id_agent] = 'null';
        $dana_radio = null;
        $data_filtr = $data_dzienna;
        
        //dostawic if
        if (isset($_POST['moje_wszystkie']))
        {
            if ($_POST['moje_wszystkie'] == tags::$moje)
            {
                $tabParametr[KalendarzDAL::$id_agent] = $agent_zal->id;
            }
            
            if (strlen($_POST['data']) > 0)
            {
                if (isset($_POST['ujmij']))
                {
                    $_POST['data'] = Utils::DataKolejnyDzien($_POST['data'], true);
                }
                if (isset($_POST['dodaj']))
                {
                    $_POST['data'] = Utils::DataKolejnyDzien($_POST['data']);
                }
                $tabParametr[KalendarzDAL::$data] = $_POST['data'];
            }
            $data_filtr = $_POST['data'];
            $dana_radio = $_POST['moje_wszystkie'];
        }
        $wynik = $dal->PokazKalendarz($tabParametr, $ilosc_wierszy);
        
        echo '<form name="pokaz_kalendarz" method="POST" action="'.$_SERVER['PHP_SELF'].'"><table><tr>';
        KontrolkiHtml::DodajRadio('moje_wszystkie', array('id_wszystkie', 'id_moje'), array(tags::$wszystkie, tags::$moje), array(tags::$wszystkie, tags::$moje), '', false, $dana_radio, '<td>', '</td>');
        echo '<td>';
        KontrolkiHtml::DodajSubmit('ujmij', 'id_ujmij', '<<', '');
        echo '</td><td>';
        KontrolkiHtml::DodajTextboxData('data', 'id_data_mw', $data_filtr, 10, 10, $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podana_inf_nie_jest_data), '', '', 'pokaz_kalendarz');
        echo '</td><td>';
        KontrolkiHtml::DodajSubmit('dodaj', 'id_dodaj', '>>', '');
        echo '</td><td>';
        KontrolkiHtml::DodajSubmit('filtruj_kalendarz', 'id_filtruj_kalendarz', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zatwierdz), '');
        echo '</td></tr></table>';
        UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$kalendarz_na_dzien).' : '.$data_filtr);
        if ($ilosc_wierszy > 0)
        {
            UtilsUI::$rekordy = $ilosc_wierszy;
            UtilsUI::DodajTabWyroznien($data_dzienna, $zielony);
            if (!isset($tabParametr[KalendarzDAL::$data]))
            {
                UtilsUI::PodajIndWyroznien(KalendarzDAL::$data);
                UtilsUI::WyswietlTab1Poz($wynik, array(KalendarzDAL::$godzina, KalendarzDAL::$komentarz, KalendarzDAL::$agent), 
                array(tags::$godzina, tags::$komentarz, tags::$agent), KalendarzDAL::$id_kalendarz, 'kalendarz_id', array(Akcja::$edycja => 1), array(tags::$kasuj), array(Akcja::$kasowanie => tags::$kasuj));
            }
            else if (($tabParametr[KalendarzDAL::$data] >= $data_dzienna))
            {
                UtilsUI::PodajIndWyroznien(KalendarzDAL::$data);
                UtilsUI::WyswietlTab1Poz($wynik, array(KalendarzDAL::$godzina, KalendarzDAL::$komentarz, KalendarzDAL::$agent), 
                array(tags::$godzina, tags::$komentarz, tags::$agent), KalendarzDAL::$id_kalendarz, 'kalendarz_id', array(Akcja::$edycja => 1), array(tags::$kasuj), array(Akcja::$kasowanie => tags::$kasuj));
            }
            else
            {
                UtilsUI::PodajIndWyroznien(KalendarzDAL::$data);
                UtilsUI::WyswietlTab1Poz($wynik, array(KalendarzDAL::$godzina, KalendarzDAL::$komentarz, KalendarzDAL::$agent), 
                array(tags::$godzina, tags::$komentarz, tags::$agent), KalendarzDAL::$id_kalendarz, 'kalendarz_id', null);
            }
        }
        else
        {
            UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$brak_informacji_do_wyswietlenia));
        }
        echo '</form><hr />';
        
        if (isset($_POST['edycja']) && isset($_POST['kalendarz_id']))
        {
            $wynik = $dal->PodajWpisKalendarz(array(KalendarzDAL::$id_kalendarz => $_POST['kalendarz_id']));
            $wiersz = $wynik[0];
            
            UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$aktualizacja_kalendarza));
            echo '<form name="dod_kalendarz" method="POST" action="'.$_SERVER['PHP_SELF'].'"><table>';
            KontrolkiHtml::DodajHidden('kalendarz_id', 'kalendarz_id', $_POST['kalendarz_id']);
            KontrolkiHtml::DodajHidden('spotkanie_id', 'spotkanie_id', $wiersz[KalendarzDAL::$id_spotkanie]);
            
            echo '<tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$data).' : </td><td>';
            KontrolkiHtml::DodajTextboxDataPrzyszlosc('data', 'id_data', $wiersz[KalendarzDAL::$data], 10, 10, 
            $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podana_inf_nie_jest_data), $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podano_data_przeszlosc), '', '', 'dod_kalendarz');
            echo '</td><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$godzina).' : </td><td>';
            KontrolkiHtml::DodajSelectZrodSlownik('godzina', 'id_godzina', SlownikDAL::$godzina, 'godzina_id', $wiersz[KalendarzDAL::$id_godzina], '', '');
            echo ' : </td><td>';
            KontrolkiHtml::DodajSelectZrodSlownik('minuta', 'id_minuta', SlownikDAL::$minuta, 'minuta_id', $wiersz[KalendarzDAL::$id_minuta], '', '');
            echo '</td><td></td><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$agent);
            echo ' : </td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$komentarz).' :</td><td colspan="5">';
            KontrolkiHtml::DodajTextArea('komentarz', 'id_komentarz', $wiersz[KalendarzDAL::$komentarz], 50, 10, '');
            echo '</td><td>';
            KontrolkiHtml::DodajSelectDomWartIdMulti('agent', 'id_agent', $agenci, 'agent_id', $wiersz[KalendarzDAL::$id_agent], '', '');
            echo '</td></tr><tr><td>';
            KontrolkiHtml::DodajSubmit('aktualizuj', 'id_aktualizuj', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$aktualizuj), '');
            echo '</td></tr></table></form>';
        }
        
        if (!isset($_POST['edycja']))
        {
            $agent_id = $agent_zal->id;  
            
            UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$dodawanie_do_kalendarza));
            echo '<form name="ed_kalendarz" method="POST" action="'.$_SERVER['PHP_SELF'].'"><table align="left">';
            
            echo '<tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$data).' : </td><td>';
            KontrolkiHtml::DodajTextboxDataPrzyszlosc('data', 'id_data', $data_dzienna, 10, 10, $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podana_inf_nie_jest_data), $tlumaczenia->Tlumacz($_SESSION[$jezyk], 
            tags::$podano_data_przeszlosc), '', '', 'ed_kalendarz');
            echo '</td><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$godzina).' : </td><td>';
            KontrolkiHtml::DodajSelectZrodSlownik('godzina', 'id_godzina', SlownikDAL::$godzina, 'godzina_id', null, '', '');
            echo ' : </td><td>';
            KontrolkiHtml::DodajSelectZrodSlownik('minuta', 'id_minuta', SlownikDAL::$minuta, 'minuta_id', null, '', '');
            echo '</td><td></td><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$agent);
            echo ' : </td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$komentarz).' :</td><td colspan="5">';
            KontrolkiHtml::DodajTextArea('komentarz', 'id_komentarz', $komentarz, 50, 10, '');
            echo '</td><td>';
            KontrolkiHtml::DodajSelectDomWartIdMulti('agent', 'id_agent', $agenci, 'agent_id', array($agent_id => $agent_id), '', '');
            echo '</td></tr><tr><td>';
            KontrolkiHtml::DodajSubmit('zatwierdz', 'id_zatwierdz', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zatwierdz), '');
            echo '</td></tr></table></form>';
        }
    }
    require('../stopka.php');

?>
</body>
</html>
