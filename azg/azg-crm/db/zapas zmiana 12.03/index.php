<html><head><title>A.Z.Gwarancja - Baza Danych</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
  <script language="javascript1.3" src="js/script.js"></script>
<body>

<?
    /*ini_set('session.use_cookies', 0);
    session_start();
    $kupa = session_id();
    ini_set('session.use_cookies', 1);
    session_destroy();   */
    
    //session_start();
    //$kupa = session_id();
    //session_destroy();
    //ini_set('session.name', $kupa);
    //session_name($kupa);
    //echo 'id index: '.$kupa.'<br />';
    
    //echo $kupa;
    //$wynik = session_name($kupa);
    //$wynik = session_name($kupa); 
    //echo 'nazwa sesji: '.$wynik;
    //session_start();
    //$wynik = session_name($kupa);
    //$wynik = session_name($kupa);
    //$wynik = session_name(session_id()); 
    //$wynik = session_name($kupa);
    //$wynik = session_name('fdsnguds8');
    //echo 'nazwa sesji: '.$wynik;
    
    //session_start();
    
	//require("naglowek.php");
    include_once ('bll/cache.php');
    include_once ('bll/jezykibll.php');
    //session_register('wyb_jezyk');
    //$_SESSION['wyb_jezyk'] = 1;
    $obiekt = cachejezyki::Czytaj();
    if(!$obiekt)
    {
        echo 'Utworzenie obiektu.';
        $obiekt = new JezykBLL();
        cachejezyki::Zapisz($obiekt); 
    }
    /*echo '<form action="'.$_SERVER['PHP_SELF'].'" method="POST"> 
      Login: <INPUT type="text" id="imie"><BR>
      Has³o: <INPUT type="text" id="nazwisko"><BR>
      <INPUT type="submit" value=" OK "> 
    </form>';*/
    require('logowanie.php');
	//header('Location: pgsql.php');
    
	//require("stopka.php");
?>
</body>
</html>