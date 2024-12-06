<?php
    $osoba_fizyczna = 1;
    $osoba_prawna = 2;
    $ogladanie = 1;
    $status_nieaktualny = 2;
    $status_aktualny = 1;
    $status_zawieszony = 3;
    $status_umowiony = 4;
    $status_wstrzymany = 5;
    $data_dzienna = date('Y-m-d');
    //sesje
    $nier_trans = 'obj_transnier';
    $zalogowany = 'uprawnienia';
    $dane_agent = 'dane_agent';
    $jezyk = 'wyb_jezyk';
    $polski_jezyk = 1;
    $wyb_param_nowa_oferta = 'param_nowa_oferta'; //wybrane parametry : id_rodzaju_nieruchomosci i id rodzaju transakcji dla edycji i dodawania nowego zarowno zapotrzebowania jak i oferty
    $param_nier = 'param_nier';
    $param_zap = 'param_zap';
    $sekcja = 'sekcja';
    $sekcja_podstawowa_id = 1;
    $pokazujace_os_of = 'sesja_pok_os_of';
    $wynik_ed_of = 'wynik_ed_of';
    $wynik_ed_zap = 'wynik_ed_zap';
    $pomieszczenie_wyp = 'pomieszczenie_wyp';    
    $pomieszczenie_param = 'pomieszczenie_param';
    
    $oferta_hidden = 'is_oferta_hidden';
    $oferta_info = 'oferta_info';
    $zapotrzebowanie_info = 'zapotrzebowanie_info';
    $osoby_nowe_zlecenie = 'nowe_zlecenie_os_obj';
    //$zapotrzebowanie_trans_rodzaj_id = 'zapotrzebowanie_trans_rodzaj_id';
    
    //kolory
    $zielony = '#22FF44';
    $czerwony = '#FF4422';
    $niebieski = '#2244FF';
    $zolty = '#9fcf1F'; ///lekko zgnity, ale zapewnia przejrzystosc
    
    //wymiary lista wskazan
    $dl_lista_wsk = 800;
    $szer_lista_wsk = 790;
    
    $polecane = 'polecamy';
    $inwestycje = 'inwestycje';
    
    $AZG = 'A.Z.GWARANCJA';
    //$strona_www = 'http://www.azg.pl/index.php?';
    $strona_www = 'http://'.$_SERVER['SERVER_NAME'].'/index.php?'; //w zaleznosci od domeny, z jakiej sie ktos dobije to musi byc zmienna
    
    $opole_id = 411; //a nie 574 ?? gdzie to jest uzywane ??
    $opolskie = 9;
    
    $mieszkanie_nier_id = 2;
    $dom_nier_id = 1;
    $lokal_nier_id = 3;
    $obiekt_nier_id = 4;
    $teren_nier_id = 5;
    $dzialka_nier_id = 6;
    
    $gablota_zmiany = 'gablota_zmiany';
?>