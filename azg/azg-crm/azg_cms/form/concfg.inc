<?

#$conn12 = pg_connect ("host=localhost user=postgres password=beatka dbname=pass");
$conn111 = pg_connect ("host=localhost user=postgres password=beatka dbname=kajet");
pg_set_client_encoding ($conn111, 'LATIN2');
$conn = pg_connect ("host=localhost user=postgres password=beatka dbname=nierazg");
pg_set_client_encoding ($conn, 'LATIN2');


?>
