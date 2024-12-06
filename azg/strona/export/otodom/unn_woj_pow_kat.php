<?
    $sqlpowiat = "SELECT powiaty.id_pow_otodom, powiaty.nazwa_p, lok_p, wojewodztwa.id_w_otodom, wojewodztwa.nazwa_w, lok_w, kategorie_allegro.kategoria_allegro 
    FROM ".$tabela." 
    join powiaty on ".$tabela.".lok_p = powiaty.id_pow 
    join wojewodztwa on ".$tabela.".lok_w = wojewodztwa.id_w 
    join kategorie_allegro on powiaty.id_pow = kategorie_allegro.id_powiat
    where ".$klucz_pod." = '$idut' and kategorie_allegro.sprzedaz = 'true' 
    and kategorie_allegro.id_rodzaj_nieruchomosci = (select id from rodzaj_nieruchomosci where nazwa = '".$rodzaj_nier."');";
    
    //echo $sqlpowiat;
            
            $resultpowiat = @pg_Exec($conn, $sqlpowiat);
            $powiatn = pg_result($resultpowiat, 0, "lok_p");
            $powiatns = pg_result($resultpowiat, 0, "nazwa_p");    
            $powiatn_otodom = pg_result($resultpowiat, 0, "id_pow_otodom");
            $wojn = pg_result($resultpowiat, 0, "lok_w");
            $wojns = pg_result($resultpowiat, 0, "nazwa_w");
            $wojn_otodom = pg_result($resultpowiat, 0, "id_w_otodom");    
            $kat_allegro = pg_result($resultpowiat, 0, "kategoria_allegro");
?>