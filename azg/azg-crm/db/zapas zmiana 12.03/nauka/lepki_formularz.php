 <html>
 <head><title>Konwersja jednostek temperatury.</title></head>
 <body>
 

    <form action="<?php echo $_SERVER ['PHP_SELF']?>"method="GET">
    Temperatura w stopniach Fahrenheit:
    <?php 
    $fahr= '';
    if(isset($_GET['fahrenheit']))
    {
      $fahr = $_GET['fahrenheit'];
    }               
    echo '<input type="text" name="fahrenheit" value="'.$fahr.'" /> ';
    ?>
     <br />
    <input type="submit" name="Do Celcjusza!" />
    </form>   
<?php 
    //}
    if (isset($_GET['fahrenheit'])) 
    {                    
        $celcius = ($_GET['fahrenheit'] - 32) * 5/9;
        printf("%.2fF is %.2fC", $_GET['fahrenheit'], $celcius);
    }
?>
</body>
</html>