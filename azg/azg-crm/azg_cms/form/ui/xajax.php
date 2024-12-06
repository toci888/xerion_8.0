<?php
    $path = str_replace($_SERVER['PHP_SELF'], '', $_SERVER['SCRIPT_FILENAME']).'/';
    include_once ($path.'lib/xajax/xajax.inc.php');
    include_once ($path.'ui/kontrolki_html.php');
    include_once ($path.'dal/queriesDAL.php');
    include_once ($path.'bll/agentbll.php');
    include_once ($path.'lib/slican_komunikacja.php');
    
    //metoda nieuzywana
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
    function Zadzwon($telefon)
    {
        $path = str_replace($_SERVER['PHP_SELF'], '', $_SERVER['SCRIPT_FILENAME']).'/';
        require($path.'conf.php');
        session_start();
        $agent_zal = unserialize($_SESSION[$dane_agent]);
        $centralka = new Slican();
        $objResponse = new xajaxResponse();
        $objResponse->setCharEncoding("UTF-8");
        //echo '<script>alert("gfds");</script>';
        //
        $objResponse->addAssign('telefon'.$telefon, 'innerHTML', $centralka->Dial($agent_zal->wewnetrzny, $telefon));
        //$centralka->Dial($agent_zal->wewnetrzny, $telefon);
        return $objResponse;
    }
    $xajax = new xajax();
    $xajax->registerFunction('PodajOsobaKlient'); 
    $xajax->registerFunction('Zadzwon'); 
    $xajax->processRequests();
?>