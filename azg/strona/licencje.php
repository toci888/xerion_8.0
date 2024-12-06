<HTML>
<HEAD>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <script language='javascript' type="text/javascript" src="js/funkcjejs.js"></script>
<link href="azg.css" rel="stylesheet" type="text/css">
</head>
<body>

<?php
    //$tekst .= '<td><img src="http://'.$_SERVER['SERVER_NAME'].'/media/'.$oferta[StronaOfertaDAL::$id_nieruchomosc].'/zdjecia/m_'.$zdjecie.'" width="125" height="100" style="cursor: pointer;" border="0" class="ira" 
    //onclick="NewWindow(\'image.php?p=http://'.$_SERVER['SERVER_NAME'].'/media/'.$oferta[StronaOfertaDAL::$id_nieruchomosc].'/zdjecia/'.$zdjecie.'&w=550&h=350&i=Zdjecie\', \'name\', 570, 370, \'no\');return false;"></img></td>';
    class Enum
    {
        public static $poziomo = 'poziomo';
        public static $pionowo = 'pionowo';
    }
    $mini_x = 125;
    $x = 500;
    $mnoznik = 1.414;
    
    $tablica_zdjec = array(
    array('nazwa' => 'licencja_senior', 'orientacja' => Enum::$pionowo),
    array('nazwa' => 'licencja_junior', 'orientacja' => Enum::$pionowo),
    array('nazwa' => 'licencja_ida', 'orientacja' => Enum::$pionowo),
    array('nazwa' => 'licencja_gosia', 'orientacja' => Enum::$pionowo),
    array('nazwa' => 'licencja_arek', 'orientacja' => Enum::$pionowo),
    array('nazwa' => 'certyfikat_czlonkostwo_stowarzyszenie', 'orientacja' => Enum::$poziomo),
    array('nazwa' => 'certyfikat_ean', 'orientacja' => Enum::$pionowo), 
    array('nazwa' => 'certyfikat_doradcy', 'orientacja' => Enum::$poziomo),
    array('nazwa' => 'certyfikat_ii_konferencja', 'orientacja' => Enum::$pionowo),
    array('nazwa' => 'zaswiadczenie_ean', 'orientacja' => Enum::$pionowo),
    array('nazwa' => 'certyfikat_pan', 'orientacja' => Enum::$pionowo),
    array('nazwa' => 'certyfikat_xi_kongres', 'orientacja' => Enum::$pionowo),
    array('nazwa' => 'zaswiadczenie_ean_2', 'orientacja' => Enum::$pionowo),
    array('nazwa' => 'dga_doradztwo', 'orientacja' => Enum::$pionowo),
    array('nazwa' => 'dga_zasw_doradztwo', 'orientacja' => Enum::$pionowo),
    array('nazwa' => 'zaswiadczenie_elementy_wiedzy', 'orientacja' => Enum::$pionowo),
    array('nazwa' => 'dyplom_uznania', 'orientacja' => Enum::$pionowo),
    array('nazwa' => 'dyplom_xii_kongres', 'orientacja' => Enum::$pionowo),
    array('nazwa' => 'zaswiadczenie_prawo_wspolnotowe', 'orientacja' => Enum::$pionowo),
    array('nazwa' => 'dyplom_xiii_kongres', 'orientacja' => Enum::$pionowo),
    array('nazwa' => 'swiadectwo_ochronne', 'orientacja' => Enum::$pionowo),    
    array('nazwa' => 'zaswiadczenie_unijne_reg', 'orientacja' => Enum::$pionowo),
    array('nazwa' => 'zaswiadczenie_zarzadzanie_jakoscia', 'orientacja' => Enum::$pionowo)
    );
    $i = 0;
    echo '<table width="100%" align="center">';
    
    foreach ($tablica_zdjec as $zdjecie)                
    {
        if ($i % 3 == 0)
        {
            echo '<tr>';
        }
        if ($zdjecie['orientacja'] == Enum::$pionowo)
        {
            $mini_width = $mini_x;
            $width = $x;
            
            $mini_height = $mini_x * $mnoznik;
            $height = $x * $mnoznik;
        }
        else
        {
            $mini_width = $mini_x * $mnoznik;
            $width = $x * $mnoznik;
            
            $mini_height = $mini_x;
            $height = $x;
        }              
        echo '<td width="33%" align="center"><img src="http://'.$_SERVER['SERVER_NAME'].'/certyfikaty/mini_'.$zdjecie['nazwa'].'.gif" width="'.$mini_width.'" height="'.$mini_height.'" style="cursor: pointer;" border="0" class="ira" 
        onclick="NewWindow(\'image.php?p=http://'.$_SERVER['SERVER_NAME'].'/certyfikaty/'.$zdjecie['nazwa'].'.gif&w='.$width.'&h='.$height.'&i=Zdjecie\', \'name\', '.($width + 20).', '.($height + 20).', \'no\');return false;"></img></td>';
        
        $i++;
        
        if ($i % 3 == 0)
        {
            echo '</tr>';
        }
    }
    if ($i % 3 != 0)
        {
            echo '</tr>';
        }
    echo '</table>';
?>
</body>
</html>