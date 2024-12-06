
<?php
    // œ - ¶ ¹ - ±  Ÿ - ¼  - ¬ Œ - ¦
    session_start();
    include_once ('ui/kontrolki_html.php'); 
    include_once ('bll/tags.php'); 
    include_once ('bll/jezykibll.php');
    include_once ('bll/cache.php');
    include_once ('dal/dal.php');
    require('naglowek.php');
    require('conf.php');
    
    $dal = new dal();
    $wynik = $dal->PobierzDane('select nazwa_pot as nazwa from agent;', $ilosc_wierszy);
    //$link = mysql_connect("localhost","lee","password");
    //mysql_select_db("brimelow_store");

    //$query = 'SELECT * FROM products';
    //$results = mysql_query($query);

    echo "<?xml version=\"1.0\"?>\n";
    echo "<products>\n";

    //while($line = mysql_fetch_assoc($results)) 
    foreach ($wynik as $wiersz)
    {
        echo "<item>" . $wiersz['nazwa'] . "</item>\n";
    }

    echo "</products>\n";

    //mysql_close($link);
    
    require('stopka.php'); 
    
    
?>

