<HTML>
<HEAD>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <script language="javascript" src="js/script.js"></script>
<link href="azg.css" rel="stylesheet" type="text/css">
</head>
<body>
<?php
    // ¶ ±
    //session_start();
    include_once ('../dal/stronaDAL.php');
    include_once ('../ui/kontrolki_html.php'); 
    include_once ('../ui/utilsui.php'); 
    include_once ('../bll/tags.php'); 
    include_once ('../bll/jezykibll.php');
    include_once ('../bll/cache.php');
    include_once ('../bll/ofertystronabll.php');
    require('../naglowek.php');
    require('../conf.php');
    
    if (isset($_GET[tags::$oferta]))
    {
        $obiekt = new StronaOfertaBLL();
        $tlumaczenia = cachejezyki::Czytaj();
        $oferta = $obiekt->PodajOferta($_GET[tags::$oferta], $_GET[StronaPodsInfoDAL::$id_trans_rodzaj], $_GET[StronaPodsInfoDAL::$id_nier_rodzaj], $sekcje, $pomieszczenia);
        
        //wytrzepac text sprzedaz mieszkanie itd
        echo '<center><span class="nag2b"><b></b><br /></span></center>';

        echo '<table width="512" cellpadding="0" cellspacing="0" border = "0"><tr><td width="50%"  align = "left"><a href="index.php?action='.$_GET['cat'].'">
        <object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,0,0" width="40" height="20" id="backsm" align="middle">
        <param name="allowScriptAccess" value="sameDomain" />
        <param name="movie" value="backsm.swf" />
        <param name="quality" value="high" />
        <param name="wmode" value="transparent" />
        <param name="bgcolor" value="#ffffff" />
        <embed src="backsm.swf" quality="high" wmode="transparent" bgcolor="#ffffff" width="40" height="20" name="backsm" align="middle" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />
        </object></a></td><td width="50%" align="right"><a href="druksm.php?'.tags::$oferta.'='.$_GET[tags::$oferta].'&'.StronaPodsInfoDAL::$id_trans_rodzaj.'='.$_GET[StronaPodsInfoDAL::$id_trans_rodzaj].'&'.
        StronaPodsInfoDAL::$id_nier_rodzaj.'='.$_GET[StronaPodsInfoDAL::$id_nier_rodzaj].'" target="_blank"><img src="../img/printer.gif" width="15" height="17" border="0"></img>&nbsp;&nbsp;'.
        $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wydrukuj_ze_zdjeciami).'</a><br><a href="druksmb.php?'.tags::$oferta.'='.$_GET[tags::$oferta].'&'.StronaPodsInfoDAL::$id_trans_rodzaj.'='.$_GET[StronaPodsInfoDAL::$id_trans_rodzaj].'&'.
        StronaPodsInfoDAL::$id_nier_rodzaj.'='.$_GET[StronaPodsInfoDAL::$id_nier_rodzaj].'" target="_blank"><img src="../img/printer.gif" width="15" height="17" border="0"></img>&nbsp;&nbsp;'.
        $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wydrukuj_bez_zdjec).'</a></td></tr></table>';
        
        //echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], '_sekcjapodstawowa');
        
        echo '<br /><center><table width="512" cellpadding="0" cellspacing="0" border="1" frame="above,below,rhs" rules="groups">';
        $oferta = $oferta[0];
        
        echo '<tr><td><b>'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$numer_oferty), $_SESSION[$jezyk]).':</b> '.$oferta[StronaOfertaDAL::$id_oferta].'</td>'.UtilsUI::TabelaPionSep().'
        <td><b>'.
        UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$status), $_SESSION[$jezyk]).':</b> '.
        UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], $oferta[StronaOfertaDAL::$status]), $_SESSION[$jezyk]).'</td>'.UtilsUI::TabelaPionSep().'<td colspan="20"><b>'.
        UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$posrednik), $_SESSION[$jezyk]).': </b><a href="mailto:'.$oferta[StronaOfertaDAL::$email].'">'.
        UtilsUI::KonwersjaEncoding($oferta[StronaOfertaDAL::$agent], $_SESSION[$jezyk]).'</a> <b>'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$telefon), $_SESSION[$jezyk]).': </b>'.
        $oferta[StronaOfertaDAL::$telefon].'</td></tr>'.UtilsUI::TabelaPoziomSep();
        
        echo '<tr><td><b>'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$lokalizacja), $_SESSION[$jezyk]).': </b>'.UtilsUI::KonwersjaEncoding($oferta[StronaOfertaDAL::$lokalizacja], $_SESSION[$jezyk]).
        '</td>'.UtilsUI::TabelaPionSep().'<td><b>'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$wojewodztwo), $_SESSION[$jezyk]).': </b> '.
        UtilsUI::KonwersjaEncoding($oferta[StronaOfertaDAL::$wojewodztwo], $_SESSION[$jezyk]).'</td>'.UtilsUI::TabelaPionSep().'<td><b>'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$powiat), $_SESSION[$jezyk]).
        ': </b> '.UtilsUI::KonwersjaEncoding($oferta[StronaOfertaDAL::$powiat], $_SESSION[$jezyk]).'</td>'.UtilsUI::TabelaPionSep().'<td><b>'.
        UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$cena), $_SESSION[$jezyk]).': </b> '.$oferta[StronaOfertaDAL::$cena].' <span class="cenapop">'.$oferta[StronaOfertaDAL::$cena_pop].'</span></td></tr>';
        
        foreach ($sekcje as $sekcja)
        {
            echo UtilsUI::TabelaPoziomSep().'<tr><td colspan="40" height="7" class="tdnag"><span class="nag1wb">&nbsp;'.
            UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], $sekcja[StronaOfertaDAL::$nazwa]), $_SESSION[$jezyk]).'</span></td></tr>'.UtilsUI::TabelaPoziomSep();
            
            $i = 0;
            echo '<tr><td colspan="40"><table width="100%" align="center">';
            
            if (isset($sekcja[StronaOfertaDAL::$parametry]))
            {
                foreach ($sekcja[StronaOfertaDAL::$parametry] as $klucz => $wartosc)
                {
                    if ($i % 4 == 0)
                    {
                        echo '<tr>';
                    }
                    
                    echo '<td>'.UtilsUI::KonwersjaEncoding($tlumaczenia->TlumaczZlozenieTag($_SESSION[$jezyk], $wartosc, ' : '), $_SESSION[$jezyk]).'</td>';
                    
                    $i++;
                    if ($i % 4 != 0)
                    {
                        echo UtilsUI::TabelaPionSep();
                    }
                    if ($i % 4 == 0)
                    {
                        echo '</tr>'.UtilsUI::TabelaPoziomSep();
                    }
                }   
            }
            if (isset($sekcja[StronaOfertaDAL::$wyposazenia]))
            {
                foreach ($sekcja[StronaOfertaDAL::$wyposazenia] as $klucz => $wartosc)
                {
                    if ($i % 4 == 0)
                    {
                        echo '<tr>';
                    }
                    
                    echo '<td>'.UtilsUI::KonwersjaEncoding($tlumaczenia->TlumaczZlozenieTag($_SESSION[$jezyk], $wartosc, ' : '), $_SESSION[$jezyk]).'</td>';
                    
                    $i++;
                    if ($i % 4 != 0)
                    {
                        //tu jerszcze jest problem
                        echo UtilsUI::TabelaPionSep();
                    }
                    if ($i % 4 == 0)
                    {
                        echo '</tr>'.UtilsUI::TabelaPoziomSep();
                    }
                }   
            }
            
            echo '</table></td></tr>';
        }
        
        if (isset($oferta[StronaOfertaDAL::$zdjecie]))
        {
            $i = 0;
            echo UtilsUI::TabelaPoziomSep().'<tr><td colspan="40" height="7" class="tdnag"><span class="nag1wb">&nbsp;'.
            UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zdjecia_oferty), $_SESSION[$jezyk]).'</span></td></tr>'.UtilsUI::TabelaPoziomSep();
            echo '<tr><td colspan="40"><table width="100%" align="center">';
            foreach ($oferta[StronaOfertaDAL::$zdjecie] as $zdjecie)
            {
                if ($i % 4 == 0)
                {
                    echo '<tr>';
                }

                echo '<td><img src="../media/'.$oferta[StronaOfertaDAL::$id_nieruchomosc].'/zdjecia/'.$zdjecie.'" width="125" height="100" style="cursor: pointer;" border="0" class="ira" 
                onclick="NewWindow(\'image.php?p=../media/'.$oferta[StronaOfertaDAL::$id_nieruchomosc].'/zdjecia/'.$zdjecie.'&w=550&h=350&i=Zdjecie\', \'name\', 570, 370, \'no\');return false;"></img></td>';
                
                $i++;

                if ($i % 4 == 0)
                {
                    echo '</tr>'.UtilsUI::TabelaPoziomSep();
                }
            }
            echo '</table></td></tr>';
        }
        
        if (isset($pomieszczenia))
        {
            echo UtilsUI::TabelaPoziomSep().'<tr><td colspan="40" height="7" class="tdnag" align="center"><span class="nag1wb">&nbsp;'.
            UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$pomieszczenia), $_SESSION[$jezyk]).'</span></td></tr>'.UtilsUI::TabelaPoziomSep();
            foreach ($pomieszczenia as $pomieszczenie)
            {
                $nr = null;
                if ($pomieszczenie[StronaOfertaDAL::$nr_pomieszczenie] > 1)
                {
                    $nr = ' '.$pomieszczenie[StronaOfertaDAL::$nr_pomieszczenie];
                }
                echo UtilsUI::TabelaPoziomSep().'<tr><td colspan="40" height="7" class="tdnag"><span class="nag1wb">&nbsp;'.
                UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], $pomieszczenie[StronaOfertaDAL::$nazwa]), $_SESSION[$jezyk]).$nr.'</span></td></tr>'.UtilsUI::TabelaPoziomSep();
                
                $i = 0;
                echo '<tr><td colspan="40"><table width="100%" align="center">';
                
                if (isset($pomieszczenie[StronaOfertaDAL::$parametry]))
                {
                    foreach ($pomieszczenie[StronaOfertaDAL::$parametry] as $klucz => $wartosc)
                    {
                        if ($i % 4 == 0)
                        {
                            echo '<tr>';
                        }
                        
                        echo '<td>'.UtilsUI::KonwersjaEncoding($tlumaczenia->TlumaczZlozenieTag($_SESSION[$jezyk], $wartosc, ' : '), $_SESSION[$jezyk]).'</td>';
                        
                        $i++;
                        if ($i % 4 != 0)
                        {
                            echo UtilsUI::TabelaPionSep();
                        }
                        if ($i % 4 == 0)
                        {
                            echo '</tr>'.UtilsUI::TabelaPoziomSep();
                        }
                    }   
                }
                if (isset($pomieszczenie[StronaOfertaDAL::$wyposazenia]))
                {
                    foreach ($pomieszczenie[StronaOfertaDAL::$wyposazenia] as $klucz => $wartosc)
                    {
                        if ($i % 4 == 0)
                        {
                            echo '<tr>';
                        }
                        
                        echo '<td>'.UtilsUI::KonwersjaEncoding($tlumaczenia->TlumaczZlozenieTag($_SESSION[$jezyk], $wartosc, ' : '), $_SESSION[$jezyk]).'</td>';
                        
                        $i++;
                        if ($i % 4 != 0)
                        {
                            //tu jerszcze jest problem
                            echo UtilsUI::TabelaPionSep();
                        }
                        if ($i % 4 == 0)
                        {
                            echo '</tr>'.UtilsUI::TabelaPoziomSep();
                        }
                    }   
                }
                
                echo '</table></td></tr>';
            }
        }
        
        if (isset($oferta[StronaOfertaDAL::$opis][$_SESSION[$jezyk]]))
        {
            echo UtilsUI::TabelaPoziomSep().'<tr><td colspan="40" height="7" class="tdnag" align="center"><span class="nag1wb">&nbsp;'.
            UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$opis_oferty), $_SESSION[$jezyk]).'</span></td></tr>'.UtilsUI::TabelaPoziomSep();
            
            echo '<tr><td colspan="40">'.UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION[$jezyk], $oferta[StronaOfertaDAL::$opis][$_SESSION[$jezyk]]), $_SESSION[$jezyk]).'</td></tr>';
        }
        
        echo '</table>';
        
        //var_dump($oferta);
    
    
        //var_dump($sekcje);
    
        //var_dump($pomieszczenia);
    }
    
    require('../stopka.php');

?>
</body>
</html>
