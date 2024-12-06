<?
    for ($licz = 0; $licz < 6; $licz++)
    {
        $j = $licz + 1;
        $zm = 'zds'.$j;
        $zdOtodom[$licz] = $zdj_for_otodom_prefix.$$zm;
        //echo $zdOtodom[$licz];
    }

    $queryStruct = "select techno_b.nazwat_b as nazwat_b from ".$tabela." 
    join techno_b on ".$tabela.".".$techn_bud." = techno_b.id where ".$tabela.".".$klucz_pod." = ".$idut.";";
    $resStruct = pg_query($conn, $queryStruct);
    $structure = pg_result($resStruct, 0, "nazwat_b");
    //convert('¿Ÿæ³œóñ', 'LATIN2', 'UNICODE')
    
    if (!isset($dontUseMedia))
    {
        $queryMedia = "select convert('Ciep³a woda: ' || ciepla_woda.nazwa_wo, 'LATIN2', 'UNICODE') as cwod, convert('Si³a: ' || sila.nazwa_si,  'LATIN2', 'UNICODE') as sila,
        convert('Gaz: ' || gaz.nazwa_g, 'LATIN2', 'UNICODE') as gaz, convert('Kanalizacja: ' || kanaliza.nazwa_ka, 'LATIN2', 'UNICODE') as kanalizacja, 
        convert('Telefon: ' || telefon.nazwa_te, 'LATIN2', 'UNICODE') as telefon, convert('Sieæ kablowa: ' || kablowa.nazwa_kab, 'LATIN2', 'UNICODE') as kablowka, 
        convert('Antena TV: ' || antena.nazwa_an, 'LATIN2', 'UNICODE') as antena, convert('Internet: ' || siec_inter.nazwa_siec, 'LATIN2', 'UNICODE') as internet
        from ".$tabela."
        left join ciepla_woda on ".$tabela.".".$ciepla_woda_n." = ciepla_woda.id 
        left join sila on ".$tabela.".".$sila_n." = sila.id
        left join gaz on ".$tabela.".".$gaz_n." = gaz.id
        left join kanaliza on ".$tabela.".".$kan_n." = kanaliza.id
        left join telefon on ".$tabela.".".$tel_n." = telefon.id
        left join kablowa on ".$tabela.".".$kabl_n." = kablowa.id
        left join antena on ".$tabela.".".$ant_n." = antena.id
        left join siec_inter on ".$tabela.".".$inter_n." = siec_inter.id
        where ".$tabela.".".$klucz_pod." = ".$idut.";";
        $resMedia = pg_query($conn, $queryMedia);
        $rowMedia = pg_fetch_array($resMedia);
        $j = 0;
        for ($i = 0; $i < 8; $i++)
        {
            if (isset($rowMedia[$i]))
            {
                $mediaTab[$j] = $rowMedia[$i];
                $j++;
            }
        }
    }
    $queryHeat = "select ".$ogrz_n.", ".$parking_n." from ".$tabela." where ".$klucz_pod." = ".$idut.";";
    $resHeat = pg_query($conn, $queryHeat);
    $heating = pg_result($resHeat, 0, $ogrz_n);
    $parking = pg_result($resHeat, 0, $parking_n);

    if ($heating > 0)
    {
        $heating = 'y';
    }
    else
    {
        $heating = 'n';
    }
    if ($parking == 2)
    {
        $parking = 'y';
    }
    else
    {
        $parking = 'n';
    }
    /*
    convert('Fitnes: ' || fitness.nazwa_fi, 'LATIN2', 'UNICODE') as fitness, 
    convert('Plac zabaw: ' || plac_zabaw.nazwa_zab, 'LATIN2', 'UNICODE') as plac_zabaw,
    convert('Sauna: ' || sauna.nazwa_sa, 'LATIN2', 'UNICODE') as sauna,
    convert('Basen: ' || basen.nazwa_bas, 'LATIN2', 'UNICODE') as basen,
    convert('Kort tenisowy: ' || kort_te.nazwa_kor, 'LATIN2', 'UNICODE') as kort
    
    left join fitness on ".$tabela.".".$fitnes_n." = fitness.id
    left join plac_zabaw on ".$tabela.".".$plac_zabaw_n." = plac_zabaw.id
    left join sauna on ".$tabela.".".$sauna_n." = sauna.id
    left join basen on ".$tabela.".".$basen_n." = basen.id
    left join kort_te on ".$tabela.".".$kort_n." = kort_te.id
    */

    $querySurrounding = "select convert('Las: ' || las.nazwa_la, 'LATIN2', 'UNICODE') as las, 
    convert('Park: ' || park.nazwa_par,  'LATIN2', 'UNICODE') as park,
    convert('Rzeka: ' || rzeka.nazwa_rz, 'LATIN2', 'UNICODE') as rzeka, 
    convert('Jezioro: ' || jezioro.nazwa_je, 'LATIN2', 'UNICODE') as jezioro, 
    convert('Staw: ' || staw.nazwa_sta, 'LATIN2', 'UNICODE') as staw, 
    convert('Góry: ' || gory.nazwa_go, 'LATIN2', 'UNICODE') as gory 
    from ".$tabela."
    left join las on ".$tabela.".".$las_n." = las.id 
    left join park on ".$tabela.".".$park_n." = park.id
    left join rzeka on ".$tabela.".".$rzeka_n." = rzeka.id
    left join jezioro on ".$tabela.".".$jezioro_n." = jezioro.id
    left join staw on ".$tabela.".".$staw_n." = staw.id
    left join gory on ".$tabela.".".$gory_n." = gory.id 
    where ".$tabela.".".$klucz_pod." = ".$idut.";";
    $resSurr = pg_query($conn, $querySurrounding);
    $rowSurr = pg_fetch_array($resSurr);
    
    $j = 0;
    for ($i = 0; $i < 6; $i++)
    {
        if (isset($rowSurr[$i]))
        {
            $surrTab[$j] = $rowSurr[$i];
            $j++;
        }
    }
    
    $queryAccTypes = "select convert('Typ ulicy: ' || typ_ulicy.nazwa_ul, 'LATIN2', 'UNICODE') as ulica, 
    convert('Nawierzchnia drogi: ' || nawierzchnia.nazwa_na,  'LATIN2', 'UNICODE') as nawierzchnia,
    convert('Komunikacja: ' || komunikacja.nazwa_kom, 'LATIN2', 'UNICODE') as komunikacja  
    from ".$tabela."
    left join typ_ulicy on ".$tabela.".".$typ_ul_n." = typ_ulicy.id 
    left join nawierzchnia on ".$tabela.".".$naw_ul_n." = nawierzchnia.id
    left join komunikacja on ".$tabela.".".$komunikacja_n." = komunikacja.id
    where ".$tabela.".".$klucz_pod." = ".$idut.";";
    $resAccTypes = pg_query($conn, $queryAccTypes);
    $rowAccTypes = pg_fetch_array($resAccTypes);
    
    $j = 0;
    for ($i = 0; $i < 3; $i++)
    {
        if (isset($rowAccTypes[$i]))
        {
            $accTab[$j] = $rowAccTypes[$i];
            $j++;
        }
    } 

    $year = date('Y');
    $month = date('m');
    $day = date('d');
    
    $future = forward_date($year, $month, $day, 30);
    
    $agOtoDomQuery = "select id_otodom from agent_otodom where id = ".$agent.";";
    $resAgentOtD = pg_query($conn, $agOtoDomQuery);
    $rowAgOD = pg_fetch_array($resAgentOtD);
    
    $agent_id_otodom = $rowAgOD['id_otodom'];
    ///end of additionals for otodom 
?>    