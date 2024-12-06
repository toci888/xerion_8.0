<?php
    echo $_SERVER['PHP_SELF'];
    $osoba_fizyczna = 1;
    $osoba_prawna = 2;
    $data_dzienna = date('Y-m-d');
    //sesje
    $nier_trans = 'obj_transnier';
    $zalogowany = 'uprawnienia';
    $dane_agent = 'dane_agent';
    $jezyk = 'wyb_jezyk';
    $wyb_param_nowa_oferta = 'param_nowa_oferta'; //wybrane parametry : id_rodzaju_nieruchomosci i id rodzaju transakcji dla edycji i dodawania nowego zarowno zapotrzebowania jak i oferty
    $param_nier = 'param_nier';
    $param_zap = 'param_zap';
    $sekcja = 'sekcja';
    $wynik_ed_of = 'wynik_ed_of';
    $wynik_ed_zap = 'wynik_ed_zap';
    $pomieszczenie_wyp = 'pomieszczenie_wyp';    
    $pomieszczenie_param = 'pomieszczenie_param';
    
    $oferta_hidden = 'is_oferta_hidden';
    $oferta_info = 'oferta_info';
    $zapotrzebowanie_info = 'zapotrzebowanie_info';
    $osoby_nowe_zlecenie = 'nowe_zlecenie_os_obj';
    //$zapotrzebowanie_trans_rodzaj_id = 'zapotrzebowanie_trans_rodzaj_id';
?>