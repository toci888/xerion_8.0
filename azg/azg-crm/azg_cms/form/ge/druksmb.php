<HTML LANG="pl">
<HEAD>
<META http-equiv="content-type" content="text/html; charset=ISO-8859-2">
<LINK REL="stylesheet" HREF="azg.css">
<TITLE>"IMMOBILIEN IN OPPELN - A.Z.GWARANCJA"</TITLE>

</HEAD>

<BODY bgcolor='white' marginheight="0" marginwidth="0" topmargin="0" leftmargin="0">

<center>
<table width=100% cellpadding=0 cellspacing=0 frame border=0>
<tr>
	<td colspan = 4 height=5 ></td>
</tr>

<tr>
<td width=23% order=0 align=left rowspan = 3>

<img src=logom.jpg width=181 height=90 border=0></img>

</td>

<td width=77% border=0 align=right colspan = 5>
<span class=tytulna><b>
IMMOBILIEN IN OPPELN A.Z.GWARANCJA<br>
</span>
</td>
</tr>

<tr>

<td height=5 width=25% border=0 align=right>
<span class=tytul><b>
<u>IMMOBILIEN STAMMSITZ</u><br>
str.Szarych Szereg�w 34 d,<br>
45-285 OPOLE<br>
tel.fax:(077)402-75-20<br>
</b>
</span>
</td>

<td width=1% height=100% align=right><img src=black.gif width=1 height=100% border=0></td>

<td height=5 width=25% border=0 align=right>
<span class=tytul><b>
<u>FILIALE Nr I</u><br>
str.Bytnara Rudego 13<br>
45-284 OPOLE<br>
tel./fax:(077)458-00-94<br>
</b>
</span>
</td>

<td width=1% height=100% align=right><img src=black.gif width=1 height=100% border=0></td>


<td height=5 width=25% border=0 align=right>
<span class=tytul><b>
<u>FILIALE Nr II</u><br>
Geb�ude der Wohngesellschaft ZWM<br>
I Etage, Raum. 118A<br>
str. Sosnkowskiego 40-42<br>
45-284 Opole<br>
tel/fax:(077) 457-96-99<br>
</b>
</span>
</td>

</tr>
<tr>
<td width=100% border=0 align=right colspan = 5>
<span class=tytulna><b>
mobile: 0602-531-334, www: www.azg.pl, e-mail: azgwarancja@azg.pl
</b>
</span>
</td>

</tr>

	<tr>
	<td colspan = 6><img src=black.gif width=100% height=3 border=0></td>
	</tr>

</table>
</center>
<br>


<?
                      include_once ('../dal/stronaDAL.php');
    include_once ('../ui/kontrolki_html.php'); 
    include_once ('../ui/utilsui.php'); 
    include_once ('../bll/tags.php'); 
    include_once ('../bll/jezykibll.php');
    include_once ('../bll/cache.php');
    include_once ('../bll/ofertystronabll.php');
    require('../naglowek.php');
    require('../conf.php');
    
    session_start();
    
    if (isset($_GET[tags::$oferta]))
    {
        $obiekt = new StronaOfertaBLL();
        $tlumaczenia = cachejezyki::Czytaj();
        $oferta = $obiekt->PodajOferta($_GET[tags::$oferta], $_GET[StronaPodsInfoDAL::$id_trans_rodzaj], $_GET[StronaPodsInfoDAL::$id_nier_rodzaj], $sekcje, $pomieszczenia);
        
        //wytrzepac text sprzedaz mieszkanie itd
        echo '<center><span class="nag2b"><b></b><br /></span></center>';
        
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
        
        /*if (isset($oferta[StronaOfertaDAL::$zdjecie]))
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

                echo '<td><img src="media/'.$oferta[StronaOfertaDAL::$id_nieruchomosc].'/zdjecia/'.$zdjecie.'" width="125" height="100" style="cursor: pointer;" border="0" class="ira" 
                onclick="NewWindow(\'image.php?p=media/'.$oferta[StronaOfertaDAL::$id_nieruchomosc].'/zdjecia/'.$zdjecie.'&w=550&h=350&i=Zdjecie\', \'name\', 570, 370, \'no\');return false;"></img></td>';
                
                $i++;

                if ($i % 4 == 0)
                {
                    echo '</tr>'.UtilsUI::TabelaPoziomSep();
                }
            }
            echo '</table></td></tr>';
        } */
        
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
<SCRIPT language=JavaScript type=text/javascript>self.print()</SCRIPT>
</BODY>
</HTML>