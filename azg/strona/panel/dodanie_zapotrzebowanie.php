<html><head><title>A.Z.Gwarancja - Baza Danych</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/style.css" rel="stylesheet" type="text/css"></head>
  <script language="javascript" src="../js/script.js"></script>
<body>
<?php
    include_once ('../bll/cache.php');
    include_once ('../bll/agentbll.php');
    include_once ('../bll/jezykibll.php');
    include_once ('../bll/parametrynierbll.php');
    include_once ('../bll/klientbll.php');
    include_once ('../dal/queriesDAL.php');
    include_once ('../dal/utilsdal.php');
    include_once ('../ui/kontrolki_html.php');
    include_once ('../ui/utilsui.php');
    include_once ('../bll/transnierbll.php');
    require('../naglowek.php');
    require('../conf.php');
    session_start();
    $tlumaczenia = cachejezyki::Czytaj();
    if (!isset($_SESSION[$zalogowany]))
    {
        echo 'Nie jesteś zalogowany.';
    }
    else
    {
        //zniszczenie sesji z wyposazeniami jesliby czasem pamietalo z poprzedniejoferty (np. niedokonczonej)

        //pobranie tlumaczen z cache
        $tlumaczenia = cachejezyki::Czytaj();
        //utworzenie obiektu do komunikacji z baza danych w kontekscier nieruchomosci
        $nieruchomoscDal = new NieruchomoscDAL();
        //wczytanie danych agenta z sesji
        $agent_zal = unserialize($_SESSION[$dane_agent]);
        
        $obiektTrans = new TransNierDAL();
        $tabNieruchomosc = $obiektTrans->PodajListeNieruchomosci($ilosc_wierszy);
        
        //zdarzenie zatwierdzenia formularza, poslanie informacji do bazy danych
        if (isset($_POST['zatwierdz']))
        {
            $tabParametr[NieruchomoscDAL::$id_klient] = $_POST[KlientDAL::$id_klient];

            $tabParametr[NieruchomoscDAL::$data_otw_zlecenie] = $_POST['data_otw_zlec'];
            $tabParametr[NieruchomoscDAL::$data_zam_zlecenie] = $_POST['data_zam_zlec'];
            $tabParametr[NieruchomoscDAL::$prowizja] = $_POST['prowizja'];
            //region checkboxow
            if (isset($_POST['prowizja_proc']))
            {
                $tabParametr[NieruchomoscDAL::$prow_proc] = true;
            }
            else
            {
                $tabParametr[NieruchomoscDAL::$prow_proc] = false;
            }
            $wybNier = array();
            foreach ($tabNieruchomosc as $wiersz)
            {
                if (isset($_POST['nieruchomosc'.$wiersz['id']]))
                {
                    $wybNier[$wiersz['id']] = $wiersz['id'];
                }
            }
            $tabParametr[NieruchomoscDAL::$nieruchomosc_rodzaj] = UtilsDAL::TabPhp2TabPg($wybNier, false, $tabParametr[NieruchomoscDAL::$nieruchomosc_rodzaj]);
            //koniec regionu checkboxow
            $tabParametr[NieruchomoscDAL::$agent] = (int)$agent_zal->id;
            $wynik = $nieruchomoscDal->DodajZapotrzebowanie($tabParametr);
            
            ///w wyniku od 0 jest id zapotrzebowania
            if (isset($wynik[0]))
            {
                if ($wynik[0] != null)
                {
                    $tabParametr = array();

                    $dal = new OsobaDAL($_POST[KlientDAL::$id_osoba]);
                    
                    $dal->DodajOsobaZapotrzebowanie(array(OsobaDAL::$id_zapotrzebowanie => $wynik[0]), true);
                    //unset($_SESSION[NieruchomoscDAL::$id_klient]);
                    header('Location: dodanie_trans_zap.php?'.NieruchomoscDAL::$id_zapotrzebowanie.'='.$wynik[0].'&'.KlientDAL::$id_klient.'='.$_POST[KlientDAL::$id_klient]);
                }
            }
        }
    }
    require('../stopka.php');
?>
</body>
</html>