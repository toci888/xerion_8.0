<?php
    $path = str_replace($_SERVER['PHP_SELF'], '', $_SERVER['SCRIPT_FILENAME']).'/';
    include_once ($path.'lib/xajax/xajax.inc.php');
    include_once ($path.'ui/kontrolki_html.php');
    include_once ($path.'dal/queriesDAL.php'); 
    
    function PodajDzieciRegGeog($nazwa_komponentu, $wlasciwosc_komponentu, $id_parent, $numer)
    {
        $objResponse = new xajaxResponse();
        $objResponse->setCharEncoding("UTF-8");
        $objResponse->addAssign($nazwa_komponentu, $wlasciwosc_komponentu, KontrolkiHtml::DodajSelectRegGeog('nadrzedny_region', 'id_nadrzedny_region', $id_parent, 'region_geog_id'.$numer, '', 'DodajDzieciGeog(document.getElementById(\'region_geog_id'.$numer.'\').value);'));
        //KontrolkiHtml::DodajSelectRegGeog('nadrzedny_region', 'id_nadrzedny_region', $id_parent, 'region_geog_id'.$numer, '', 'DodajDzieciGeog(document.getElementById(\'region_geog_id'.$numer.'\').value);')
        
        return $objResponse;
    }
    function PodajOsobaKlient($nazwa_kom, $id_klient)
    {
        $wynik = SlownikDAL::PobierzOsobaKlient($id_klient);
        $objResponse = new xajaxResponse();
        $objResponse->setCharEncoding("UTF-8");
        $objResponse->addAssign($nazwa_kom, 'innerHTML', KontrolkiHtml::DodajXajaxSelectDomWartId('osoba_cena', 'id_osoba_cena', $wynik, 'osoba_id', null, '', ''));
        
        return $objResponse;
    }
    $xajax = new xajax();
    $xajax->registerFunction('PodajOsobaKlient'); 
    $xajax->processRequests();
?>