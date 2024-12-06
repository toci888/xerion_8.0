<?
    include ("../dal/dal.php");

    $zmienna = 'powiaty_csv.txt';
    $dal =& new dal();
    if($plik=fopen($zmienna,"r"))
    {
        while(!feof($plik))
        {
            $ciag=addslashes(trim(fgets($plik)));
            $odlamki = explode(";", $ciag);
            $odlamki[1] = str_replace('?', '_', $odlamki[1]);
            $querySup = "select id_w from wojewodztwa where id_w_otodom = ".$odlamki[2].";";
            $resSup = $dal->pgQuery($querySup);
            $rowSup = pg_fetch_array($resSup);
            //0 - id otodom, 2 - id wojewodztwa
            $query = "select id_pow from powiaty where id_w = ".$rowSup['id_w']." and nazwa_p like '".$odlamki[1]."%';";
            $res = $dal->pgQuery($query);
            $row = pg_fetch_array($res);
            if (pg_num_rows($res) == 1)
            {
                echo "UPDATE powiaty set id_pow_otodom = ".$odlamki[0]." where id_pow = ".$row['id_pow'].";";
            }
            else
            {
                echo 'Lipa finding powiat : '.$odlamki[1].', id : '.$odlamki[0].'.';
                echo '<br />';
                echo $query;
            }
            echo '<br />';
        }
    }
?>