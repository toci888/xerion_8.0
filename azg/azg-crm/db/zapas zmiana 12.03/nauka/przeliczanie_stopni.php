 <html>
 <head><title>Konwersja jednostek temperatury.</title></head>
 <body>
 
<?php
    if ($_SERVER['REQUEST_METHOD'] == 'GET')
    {
?>
    <form action="<?php echo $_SERVER ['PHP_SELF']?>"method="POST">
    Temperatura w stopniach Fahrenheit:
    <input type="text" name="fahrenheit" /> <br />
    <input type="submit" name="Zmieñ na Celcjusza!" />
    </form>   
<?php 
    }
    else if ($_SERVER['REQUEST_METHOD'] == 'POST')
    {
        $fahr = $_POST['fahrenheit'];
        $celcius = ($fahr - 32) * 5/9;
        printf("%.2fF to %.2fC", $fahr, $celcius);
    }
    else
    {
        die("Ten skrypt dzia³a tylko z ¿¹daniami GET i POST.");
    }
?>
</body>
</html>