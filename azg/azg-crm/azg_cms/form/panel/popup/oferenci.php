<body>
<HEAD>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <script language="javascript" src="../../js/script.js"></script>
</head>
<body style="margin-left: 0px; margin-right: 0px; margin-top: 0px; margin-bottom: 0px;">
<?php
// onload="window.print();"
    require('../../conf.php');
    include_once ('../../ui/utilsui.php');
    include_once ('../../bll/cache.php');
    include_once ('../../bll/agentbll.php'); 
    include_once ('../../bll/listawskazanbll.php');
    session_start();
    $agent_zal = unserialize($_SESSION[$dane_agent]);
    $tlumaczenia = cachejezyki::Czytaj();
    //echo '<script>history.clear();</script>';
    if(isset($_GET[NieruchomoscDAL::$id_zapotrzebowanie]))// && isset($_GET[AgentDAL::$id_agent]))
    {
        //majac id zapotrzebowanie pobieramy pokazujacych ze spotkan i tyle
        $dal = new OsobaDAL(null);
        $tabParametr[OsobaDAL::$id_zapotrzebowanie] = $_GET[NieruchomoscDAL::$id_zapotrzebowanie];
        $wynik = $dal->PodajOferenciSpotkanieZapotrzebowanie($tabParametr, $ilosc_wierszy);
        
        echo '<table>';
        foreach ($wynik as $wiersz)
        {
            echo '<tr>';
            echo '<td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nr_oferty).':</td><td>'.$wiersz[NieruchomoscDAL::$id_oferta].'</td>';
            echo '<td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$pokazuje).':</td><td>'.$wiersz[NieruchomoscDAL::$nazwisko].' '.$wiersz[NieruchomoscDAL::$imie].',</td>';
            echo '<td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$telefon).':</td><td>';
            foreach ($wiersz[OsobaDAL::$telefon] as $tel_of)
            {
                echo $tel_of.', ';
            }
            echo '</td>';
            //echo '<td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$telefon_komorkowy).':</td><td>'.$wiersz[OsobaDAL::$komorka].'</td>';
            echo '</tr>';
        } 
        echo '</table>';
        
        //var_dump($wynik);
    }
?>
</body>