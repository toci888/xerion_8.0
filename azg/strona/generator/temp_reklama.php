<?php 
        session_start();
        include_once ('../bll/cache.php');
        include_once ('../bll/tags.php');
        require('../conf.php');
        $tlumaczenia = cachejezyki::Czytaj(); 
        echo '<p class="MsoNormal" style="text-align: justify; text-indent: 27pt; line-height: 150%; font-family: Verdana;"><font size="1">'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], '|_biuro_nieruchomosci|').' „A.Z.GWARANCJA” '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], '|_organizuje_i_realizuje_reklame___|').':<br><b style=""><u>- '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], '|_prasowych|').':</u></b></font></p><p class="MsoNormal" style="text-align: justify; text-indent: 27pt; line-height: 150%; font-family: Verdana;"><font size="1"><b style=""><u><o:p></o:p></u></b></font></p>



<ul style="font-family: Verdana;"><li><!--[if !supportLists]--><font size="1"><span style="">  </span>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], '|_gazeta_nto_ogloszenia_zbiorcze_biur|').',</font></li></ul><ul style="font-family: Verdana;"><li><font size="1">'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], '|_gazeta_nto_ogloszenia_pojedyncze_wydawane|').',<br></font></li></ul>



<ul style="font-family: Verdana;"><li><!--[if !supportLists]--><font size="1"><span style=""><span style="" times="" new="" roman="" ;="" font-style:="" font-variant:="" font-weight:="" font-size:="" 7pt;="" line-height:="" font-size-adjust:="" none;="" font-stretch:="" normal;="">    
</span></span>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], '|_gazeta_nto_ogloszenia_w_bazarze_w_dodatku_nto|').',</font><!--[endif]--></li></ul><ul style="font-family: Verdana;"><li><!--[if !supportLists]--><font size="1"><span style=""><span style="" times="" new="" roman="" ;="" font-style:="" font-variant:="" font-weight:="" font-size:="" 7pt;="" line-height:="" font-size-adjust:="" none;="" font-stretch:="" normal;="">   
</span></span>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], '|_gazeta_gazeta_wyborcza_ogloszenia_drobne|').', </font><!--[endif]--></li></ul>

<ul style="font-family: Verdana;"><li><!--[if !supportLists]--><font size="1"><span style=""><span style="" times="" new="" roman="" ;="" font-style:="" font-variant:="" font-weight:="" font-size:="" 7pt;="" line-height:="" font-size-adjust:="" none;="" font-stretch:="" normal;="">   
</span></span>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], '|_gazeta_posrednik_wydawany_raz_w_tygodniu|').',</font><!--[endif]--></li></ul>

<ul style="font-family: Verdana;"><li><!--[if !supportLists]--><font size="1"><span style=""><span style="" times="" new="" roman="" ;="" font-style:="" font-variant:="" font-weight:="" font-size:="" 7pt;="" line-height:="" font-size-adjust:="" none;="" font-stretch:="" normal;="">   
</span></span>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], '|_gazeta_posrednik_ogloszenia_drobne_ofert|').',</font><!--[endif]--></li></ul>

<ul style="font-family: Verdana;"><li><!--[if !supportLists]--><font size="1"><span style=""><span style="" times="" new="" roman="" ;="" font-style:="" font-variant:="" font-weight:="" font-size:="" 7pt;="" line-height:="" font-size-adjust:="" none;="" font-stretch:="" normal;="">    
</span></span>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], '|_gazeta_nieruchomosci_lokale_kontakt_wydawany_raz|').'.</font><!--[endif]--></li></ul>                        

<font style="font-family: Verdana;" size="1"><b><u>        - '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], '|_sieci_internetowej|').':<o:p></o:p></u></b></font>



<ul style="font-family: Verdana;"><li><!--[if !supportLists]--><font size="1"><span style=""><span style="" times="" new="" roman="" ;="" font-style:="" font-variant:="" font-weight:="" font-size:="" 7pt;="" line-height:="" font-size-adjust:="" none;="" font-stretch:="" normal;=""> 
</span></span>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], '|_strone_firmowa_azg_pl_oraz|').',</font><!--[endif]--></li></ul><ul style="font-family: Verdana;"><li><!--[if !supportLists]--><font size="1"><span style=""><span style="" times="" new="" roman="" ;="" font-style:="" font-variant:="" font-weight:="" font-size:="" 7pt;="" line-height:="" font-size-adjust:="" none;="" font-stretch:="" normal;=""> 
</span></span>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], '|_oferty_umieszczane_sa_rowniez_w|').',</font><!--[endif]--></li></ul>

<ul style="font-family: Verdana;"><li><!--[if !supportLists]--><font size="1"><span style=""></span>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], '|_raz_w_miesiacu_wybrane_oferty|').',</font></li></ul><font style="font-family: Verdana;" size="1"><b><u>- '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], '|_inne|').': <o:p></o:p></u></b></font>





<ul style="font-family: Verdana;"><li><font size="1"><b style=""><u><o:p><span style="text-decoration: none;"></span></o:p></u></b><span style=""><span style="font-style: normal; font-variant: normal; font-weight: normal; font-size: 7pt; line-height: normal; font-size-adjust: none; font-stretch: normal;"> </span></span>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], '|_oferty_zamieszczane_sa_w_formie|').':<br></font><!--[endif]--></li></ul>



<p class="MsoNormal" style="margin-left: 27pt; text-align: justify; text-indent: -9pt; line-height: 150%; font-family: Verdana;"><font size="1"><o:p></o:p>- '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], '|_w_siedzibie_glownej_przy_ul|').',</font></p>

<p class="MsoNormal" style="margin-left: 27pt; text-align: justify; text-indent: -9pt; line-height: 150%; font-family: Verdana;"><font size="1">- '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], '|_w_filii_nr_1_przy_ul|').',</font></p>

<p class="MsoNormal" style="margin-left: 27pt; text-align: justify; text-indent: -9pt; line-height: 150%; font-family: Verdana;"><font size="1">- '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], '|_przy_deptaku_ulicy_krakowskiej|').', </font></p>

<p class="MsoNormal" style="margin-left: 27pt; text-align: justify; text-indent: -9pt; line-height: 150%; font-family: Verdana;"><font size="1">- '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], '|_przy_ul_kosciuszki_na_budynku|').',</font></p>



<ul style="font-family: Verdana;"><li><!--[if !supportLists]--><font size="1"><span style=""><span style="font-style: normal; font-variant: normal; font-weight: normal; font-size: 7pt; line-height: normal; font-size-adjust: none; font-stretch: normal;"></span></span>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], '|_wybrane_oferty_rozmieszczone_na_dwoch|').',</font><!--[endif]--></li></ul>

<p class="MsoNormal" style="text-align: justify; line-height: 150%; font-family: Verdana;"><font size="1"><o:p> </o:p></font></p>

<ul style="font-family: Verdana;"><li><font size="1"><span style=""><span style="font-style: normal; font-variant: normal; font-weight: normal; font-size: 7pt; line-height: normal; font-size-adjust: none; font-stretch: normal;"></span></span>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], '|_banery_reklamowe_ktorymi_biuro_dysponuje|').'.</font><!--[endif]--></li></ul>





'; ?>