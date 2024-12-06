 <html>
 <head><title>Konwersja jednostek temperatury.</title></head>
 <body>
 
<?php
    //$fahr = $_GET['fahrenheit'];
    if (!isset($_GET['fahrenheit']))
    {
?>
    <form action="<?php echo $_SERVER ['PHP_SELF']?>"method="GET">
    Temperatura w stopniach Fahrenheit:
    <input type="text" name="fahrenheit" /> <br />
    <input type="submit" name="Zmieñ na Celcjusza!" />
    </form>   
<?php 
    }
    else 
    {                    
        $celcius = ($_GET['fahrenheit'] - 32) * 5/9;
        printf("%.2fF is %.2fC", $_GET['fahrenheit'], $celcius);
    }
?>
</body>
</html>