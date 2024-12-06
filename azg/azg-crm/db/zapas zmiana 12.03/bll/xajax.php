<?php
    $path = str_replace($_SERVER['PHP_SELF'], '', $_SERVER['SCRIPT_FILENAME']).'/';
    include_once ($path.'lib/xajax/xajax.inc.php');
    include_once ($path.'bll/parametrynierbll.php');
    include_once ('ui/kontrolki_html.php');
    include_once ('ui/utilsui.php');
    include_once ($path.'dal/queriesDAL.php');
    include_once ($path.'dal/queriesDAL.php'); 
    
    function DodajWyposazenie($nazwa_komponentu, $wlasciwosc_komponentu, $id_wyposazenie, $id_sekcja)
    {
        $path = str_replace($_SERVER['PHP_SELF'], '', $_SERVER['SCRIPT_FILENAME']).'/';
        require ($path.'conf.php');
        if (!isset($_SESSION[$param_nier]))
        {
            session_start();
        }
        $paramNier = unserialize($_SESSION[$param_nier]);
        //$kol = $kolWyp[$klucz]->PodajDostepneWyposazenie();
        //$kolWyb = $kolWyp[$klucz]->PodajWybraneWyposazenie();
        $kolWyp = $paramNier->KolekcjaWyposazen(); 
        $kolWyp = $kolWyp[$id_sekcja];

        //na kolWyp wywolac dodaj wyposazenie, podmieniec w paramnier ten element kolekcji i pokombinowac zeby zamienic 2 komba - moze 2 addassign daje rade ??
        $kolWyp->DodajWyposazenie($id_wyposazenie);
        $paramNier->ZamienElKolWyp($kolWyp, $id_sekcja);
        $_SESSION[$param_nier] = serialize($paramNier);
        
        $objResponse = new xajaxResponse();
        $objResponse->setCharEncoding("UTF-8");
        $objResponse->addAssign($nazwa_komponentu, $wlasciwosc_komponentu, KontrolkiHtml::DodajSelectWyposazenie($kolWyp->tag, $kolWyp->id_sekcja, $kolWyp->PodajDostepneWyposazenie(), $kolWyp->tag.$kolWyp->id_sekcja));
        //KontrolkiHtml::DodajSelectRegGeog('nadrzedny_region', 'id_nadrzedny_region', $id_parent, 'region_geog_id'.$numer, '', 'DodajDzieciGeog(document.getElementById(\'region_geog_id'.$numer.'\').value);')
        
        return $objResponse;
    }
    $xajax = new xajax();
    $xajax->registerFunction('DodajWyposazenie'); 
    $xajax->processRequests();
?>