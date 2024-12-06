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
    require('../naglowek.php');
    require('../conf.php');
    
    if (!isset($_SESSION[$zalogowany]))
    {
        echo 'Nie jesteÅ› zalogowany.';
    }
    else
    {
        $tlumaczenia = cachejezyki::Czytaj();
        $tabParametr = array();
        
        if (isset($_GET[NieruchomoscDAL::$id_zapotrzebowanie]))
        {
            $_SESSION[NieruchomoscDAL::$id_zapotrzebowanie] = $_GET[NieruchomoscDAL::$id_zapotrzebowanie];
        }
        ///pokazanie ofert skojarzonych dla zapotrzebowan
        
        if (isset($_POST['zatw_poziomy']))
        {
            $tabParametr[WyposazenieZapDAL::$poziom_parametry] = $_POST['poziom_par'];
            $tabParametr[WyposazenieZapDAL::$poziom_wyposazenia] = $_POST['poziom_wyp'];
        }
        
        if ((isset($_GET[WyposazenieZapDAL::$id_zapotrzebowanie_trans_rodzaj]) || ($_SERVER['REQUEST_METHOD'] == 'POST')))
        {
            if (isset($_GET[WyposazenieZapDAL::$id_zapotrzebowanie_trans_rodzaj]))
            {
                $_SESSION[WyposazenieZapDAL::$id_zapotrzebowanie_trans_rodzaj] = $_GET[WyposazenieZapDAL::$id_zapotrzebowanie_trans_rodzaj];
            }
            if (isset($_POST[WyposazenieZapDAL::$id_zapotrzebowanie_trans_rodzaj]))
            {
                $_SESSION[WyposazenieZapDAL::$id_zapotrzebowanie_trans_rodzaj] = $_POST[WyposazenieZapDAL::$id_zapotrzebowanie_trans_rodzaj];
            }
            echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$numer_zapotrzebowania).' :'.$_SESSION[NieruchomoscDAL::$id_zapotrzebowanie].'.<br/>';
            $par_zazn = null;
            $wyp_zazn = null;
            
            if (isset($_POST['poziom_par']))
            {
                $par_zazn = $_POST['poziom_par'];
            }
            if (isset($_POST['poziom_wyp']))
            {
                $wyp_zazn = $_POST['poziom_wyp'];
            }
            
            echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'"><table><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$poziom_kojarzenia_parametrow).' :</td>';
            KontrolkiHtml::DodajHidden(WyposazenieZapDAL::$id_zapotrzebowanie_trans_rodzaj, WyposazenieZapDAL::$id_zapotrzebowanie_trans_rodzaj, 
            $_SESSION[WyposazenieZapDAL::$id_zapotrzebowanie_trans_rodzaj]);
            KontrolkiHtml::DodajRadio('poziom_par', array('par0_id', 'par1_id', 'par2_id', 'par3_id', 'par4_id'), 
            array(tags::$brak, ' 1', ' 2', ' 3', ' 4'), array(0, 1, 2, 3, 4), '', false, $par_zazn, '<td>', '</td>');
            
            echo '</tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$poziom_kojarzenia_wyposazen).' :</td>';
            KontrolkiHtml::DodajRadio('poziom_wyp', array('wyp0_id', 'wyp1_id', 'wyp2_id', 'wyp3_id', 'wyp4_id'), 
            array(tags::$brak, ' 1', ' 2', ' 3', ' 4'), array(0, 1, 2, 3, 4), '', false, $wyp_zazn, '<td>', '</td>');
            
            echo '<td>';
            KontrolkiHtml::DodajSubmit('zatw_poziomy', 'id_zatw_poziomy', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zatwierdz), '');
            echo '</td></tr></table></form><hr />';
            
            $dal = new WyposazenieZapDAL($_SESSION[WyposazenieZapDAL::$id_zapotrzebowanie_trans_rodzaj]);
            $wynik = $dal->KojarzenieBazoweDlaZapotrzebowania($tabParametr);
            
            $popupObj = new PopUpWysw();
                
            $popupObj->nag = array(tags::$lista_wskazan);
            $popupObj->przyc_nazwa = array(tags::$lista_wskazan);
            $popupObj->url = array('dodaj_of_lista_wsk.php?'.NieruchomoscDAL::$id_zapotrzebowanie.'='.$_SESSION[NieruchomoscDAL::$id_zapotrzebowanie].'&'.NieruchomoscDAL::$id_oferta);
            $popupObj->szerokosc = array(600);
            $popupObj->dlugosc = array(600);
            
            echo '<form action="../edycja_oferty.php" method= "POST" target="_blank">';
            //NieruchomoscDAL::$imie, NieruchomoscDAL::$nazwisko, 
            //tags::$imie, tags::$nazwisko, 
            UtilsUI::WyswietlTab1Poz($wynik, 
            array(NieruchomoscDAL::$id_oferta, NieruchomoscDAL::$miejscowosc, NieruchomoscDAL::$cena, NieruchomoscDAL::$transakcja_rodzaj, 
            NieruchomoscDAL::$nieruchomosc_rodzaj), array(tags::$id, tags::$miejscowosc, tags::$cena, tags::$rodzaj_transakcja, tags::$rodzaj_nieruchomosci), 
            NieruchomoscDAL::$id_oferta, 
            'oferta_id',
            array(Akcja::$edycja => 1, Akcja::$kasowanie => 1), null, null, $popupObj);
            echo '</form>';
        }
    }
    require('../stopka.php');

?>
</body>
</html>
