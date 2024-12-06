<HTML>
<HEAD>
  <META HTTP-EQUIV="Content-type" CONTENT="text/html; charset=iso-8859-2">
  <script language="javascript" src="../js/script.js"></script>
  <title>Preferencje</title>
<link href="../css/style.css" rel="stylesheet" type="text/css"></head>
</head>
<?php
    @session_start();
    if (empty($_SESSION['uzytkownik']))
    {
        require("../log_in.php");
    }
    else
    {
        require("../naglowek.php");
        require("../conf.php");
	include("f_image_operations.php");
        $database = pg_connect($con_str);
	//Pytanie o imie i nazwisko klienta
        $query = "select imiona.nazwa as nazwa, dane_osobowe.nazwisko as nazwisko from dane_osobowe join imiona on dane_osobowe.id_imie = imiona.id WHERE dane_osobowe.id = '".$_SESSION['id']."';";
	$database = pg_connect($con_str);
	$wynik = pg_query($database, $query);
	if (pg_num_rows($wynik) == 0)
	{
		echo "Osoba w chwili obecnej nie znajduje się już w bazie, musiała dopiero co zostać usunięta !?";
	}
	else
	{
		//skrypt dodaje plik o nazwie paszport numer id .jpg w katalogu dokumenty, podkatalogu nr id
		if (isset($_POST['dodaj_paszport']))
	        {
			if (!is_dir("../dokumenty/".$_SESSION['id'].""))
			{
				mkdir("../dokumenty/".$_SESSION['id']."", 0755);
				if (!is_dir("../dokumenty/".$_SESSION['id'].""))
					echo("Nie udalo sie utworzyc katalogu dla dokumentów.");
			}
	                $target_path = "../dokumenty/".$_SESSION['id']."/";
       		        $name = "paszport".$_SESSION['id'].".jpg";
               		$target_path .= $name;
	               	if (move_uploaded_file($_FILES['plik']['tmp_name'], $target_path))
       		       	{
				fittosize($target_path);
        	       	}
       	               	else
		       	{
				echo "Nie udalo sie.";
		       	}
	        }
		if (isset($_POST['dodaj_soffi']))
	        {
			if (!is_dir("../dokumenty/".$_SESSION['id'].""))
			{
				mkdir("../dokumenty/".$_SESSION['id']."", 0755);
				if (!is_dir("../dokumenty/".$_SESSION['id'].""))
					echo("Nie udalo sie utworzyc katalogu dla dokumentów.");
			}
	                $target_path = "../dokumenty/".$_SESSION['id']."/";
       		        $name = "soffinumer".$_SESSION['id'].".jpg";
               		$target_path .= $name;
	               	if (move_uploaded_file($_FILES['plik']['tmp_name'], $target_path))
       		       	{
				fittosize($target_path);
        	       	}
       	               	else
		       	{
				echo "Nie udalo sie.";
		       	}
	        }
		if (isset($_POST['dodaj_konto']))
	        {
			if (!is_dir("../dokumenty/".$_SESSION['id'].""))
			{
				mkdir("../dokumenty/".$_SESSION['id']."", 0755);
				if (!is_dir("../dokumenty/".$_SESSION['id'].""))
					echo("Nie udalo sie utworzyc katalogu dla dokumentów.");
			}
	                $target_path = "../dokumenty/".$_SESSION['id']."/";
       		        $name = "nr_konta".$_SESSION['id'].".jpg";
               		$target_path .= $name;
	               	if (move_uploaded_file($_FILES['plik']['tmp_name'], $target_path))
       		       	{
				fittosize($target_path);
        	       	}
       	               	else
		       	{
				echo "Nie udalo sie.";
		       	}
	        }
		if (isset($_POST['ankieta_pdf']))
		{
			$zapytanie = "select * from ankieta_holandia where id = '".$_SESSION['id']."';";
			$ResN = pg_query($database, $zapytanie);
			if (pg_num_rows($ResN) == 0)
			{
				$zapytanie = "select * from ankieta_nowy where id = '".$_SESSION['id']."';";
			}
        	    	$zapytanie1 = "select jezyki.nazwa, poziomy.nazwa from znane_jezyki join jezyki on jezyki.id = znane_jezyki.id_jezyk join poziomy on poziomy.id = znane_jezyki.id_poziom where znane_jezyki.id = '".$_SESSION['id']."';";
            		$zapytanie3 = "select prawo_jazdy.nazwa from pos_prawo_jazdy join prawo_jazdy on pos_prawo_jazdy.id_prawka = prawo_jazdy.id where pos_prawo_jazdy.id = '".$_SESSION['id']."';";
			$tab = array("Id:", "Name:", "Surname:", "Gender:", "Birth date:", "Birth place:", "Place:", "Street:", "Postal code:", "Telephone:", "Cell phone:", "Passport number:", "Expiry date:", "Soffinumer:", "Bank:", "Account number", "Driving license:", "Foreign language:", "Shoes size:", "Employer:", "Departure date:", "Weeks:", "Office:");
			require_once 'fpdf.php';
			//$pdf = &File_PDF::factory(array('orientation' => 'P', 'format' => 'A4'));
			$pdf=new FPDF();
			$pdf->open();
			$pdf->setCompression(true);
			$pdf->addPage();
			define('FPDF_FONTPATH','/usr/share/pear/font/');
			$pdf->AddFont('times', '', 'times.php');
			$pdf->setFont('times', '', 18);
			//$pdf->Cell(40,10,'Hello World!');
			$zmienna="../dokumenty/".$_SESSION['id']."/ankieta".$_SESSION['id'].".pdf";
			//$plik=fopen($zmienna,"w");
			//fclose($plik);
			//$pdf->Output();
        		$w = pg_query($database, $zapytanie);
		        $w1 = pg_query($database, $zapytanie1);
		        $w3 = pg_query($database, $zapytanie3);
		        $tab_w = array();
		        $jezyki = "";
		        $prawka = "";
		        while ($r1 = pg_fetch_array($w1))
		        {
                		for ($z = 0; $z < count($r1) / 2 - 1; $z++)
                		{
                    			$jezyki .= " ".$r1[$z].": ".$r1[$z + 1].", ";
                		}
            		}
            while ($r3 = pg_fetch_array($w3))
            {
                for ($q = 0; $q < count($r3) / 2; $q++)
                {
                    $prawka .= $r3[$q].", ";
                }
            }
            $jezyki = trim($jezyki);
            $jezyki = substr($jezyki, 0, strlen($jezyki) - 1);
            if ($jezyki == "")
                $jezyki = "--------";
            $prawka = trim($prawka);
            $prawka = substr($prawka, 0, strlen($prawka) - 1);
            if ($prawka == "")
                $prawka = "--------";
            while ($r = pg_fetch_array($w))
            {
                for ($l = 0; $l < count($r) / 2; $l++)
                {
                    if ($l == 16)
                    {
                        $tab_w[] = $prawka;
                        $tab_w[] = $jezyki;
                    }
                    if ($r[$l] == "")
                        $tab_w[] = "--------";
                    else
                        $tab_w[] = $r[$l];
                }
            }
			//odstep w pionie
			$i = 8;
			//oddalenie od lewej
			$x = 7;
			//oddalenie od gory
			$y = 8;
			//licznik tabeli z inf
			$j = 0;
            $licznik = 0;
            $tab_j = explode(",", $jezyki);
			while ($tab[$j])
			{
		                $tmp = $tab[$j]." ".$tab_w[$j];
                		if ($tab[$j] == "Foreign language:")
		                {
                		    while ($tab_j[$licznik])
		                    {
                		        $tmp_1 = $tab[$j]." ".trim($tab_j[$licznik]);
				        $pdf->text($x, $y, $tmp_1);
				        $licznik++;
				        $y += $i;
                    		    }
                    		    $j++;
                		}
		                else
                		{
				    $pdf->text($x, $y, $tmp);
				    $j++;
				    $y += $i;
		                }
			}
			if (!is_dir("../dokumenty/".$_SESSION['id'].""))
			{
				mkdir("../dokumenty/".$_SESSION['id']."", 0755);
			}
			if (!is_dir("../dokumenty/".$_SESSION['id'].""))
			{
				echo("Nie udalo sie utworzyc katalogu dla dokumentów.");
			}
			else
			{
				//$zmienna="../dokumenty/".$_SESSION['id']."/ankieta".$_SESSION['id'].".pdf";
				$pdf->Output($zmienna);
				//$plik=fopen($zmienna,"w");
				//$pdf->Output($plik);
				//$pdf->Output($dane);
				//$res = fputs($plik, $dane);
				//fclose($plik);
			}
		}
       	}
       	$wiersz = pg_fetch_array($wynik);
        echo "<table align=\"CENTER\"><form method=\"POST\" action='".$_SERVER['PHP_SELF']."' enctype=\"multipart/form-data\">";
        echo "<tr><td>Imie: </td><td><input type=\"text\" readonly=\"readonly\" name=\"imie\" value='".$wiersz['nazwa']."' class=\"formfield\" /></td></tr>
	<tr><td>Nazwisko: </td><td><input type=\"text\" readonly=\"readonly\" name=\"nazwisko\" value='".$wiersz['nazwisko']."' class=\"formfield\" /></td></tr>";
	echo("<tr><td>Plik obrazu paszportu:</td></tr>");
        echo("<td><input type=\"file\" name=\"plik\" size = \"40\" class=\"formfield\" /></td>");
        echo("<input type=\"hidden\" name=\"MAX_FILE_SIZE\" value=\"10000\" />");
        echo "<td><input type=\"submit\" value=\"Dodaj\" name=\"dodaj_paszport\" class=\"formreset\" /></td></tr></form>";
	
	
        echo "<form method=\"POST\" action='".$_SERVER['PHP_SELF']."' enctype=\"multipart/form-data\">";
        echo("<tr><td>Plik obrazu soffinumeru:</td></tr>");
        echo("<td><input type=\"file\" name=\"plik\" size = \"40\" class=\"formfield\" /></td>");
        echo("<input type=\"hidden\" name=\"MAX_FILE_SIZE\" value=\"10000\" />");
        echo("<td><input type=\"submit\" value=\"Dodaj\" name=\"dodaj_soffi\" class=\"formreset\" /></td></tr>");
        echo("</form>");
	

        echo "<form method=\"POST\" action='".$_SERVER['PHP_SELF']."' enctype=\"multipart/form-data\">";
        echo "<tr><td>Plik obrazu numeru konta:</td></tr>";
        echo("<td><input type=\"file\" name=\"plik\" size = \"40\" class=\"formfield\" /></td>");
        echo("<input type=\"hidden\" name=\"MAX_FILE_SIZE\" value=\"10000\" />");
        echo("<td><input type=\"submit\" value=\"Dodaj\" name=\"dodaj_konto\" class=\"formreset\" /></td></tr>");
        echo "</form>";
	
        echo "<form method=\"POST\" action='".$_SERVER['PHP_SELF']."' enctype=\"multipart/form-data\">";
        echo("<tr><td>Plik ankiety:</td></tr>");
        echo "<td><input type=\"submit\" value=\"Generuj ankietę.\" name=\"ankieta_pdf\" class=\"formreset\" /></td></tr>";
        echo("</form></table>");
        //a tu piszemy cala reszte :P
	//echo "<table border='1'><tr><td>Paszport:</td><td>Soffinumer:</td><td>Numer konta:</td></tr>";
	//echo "<h1>Paszport: Soffinumer: Numer konta:</h1>";
	//echo "<tr>";
	if (is_file("../dokumenty/".$_SESSION['id']."/paszport".$_SESSION['id'].".jpg"))
	{
		echo "&nbsp;";
		echo "<tr><td><a valign='top' href='../dokumenty/".$_SESSION['id']."/paszport".$_SESSION['id'].".jpg' class='img' target='_blank'><img src='../dokumenty/".$_SESSION['id']."/paszport".$_SESSION['id'].".jpg' width='250' heigth='350'></a></td></tr>";
	}
	if (is_file("../dokumenty/".$_SESSION['id']."/soffinumer".$_SESSION['id'].".jpg"))
	{
		echo "&nbsp;";
		echo "<tr><td><a valign='top' href='../dokumenty/".$_SESSION['id']."/soffinumer".$_SESSION['id'].".jpg' class='img' target='_blank'><img src='../dokumenty/".$_SESSION['id']."/soffinumer".$_SESSION['id'].".jpg' width='250' heigth='350'></a></td></tr>";
	}
	if (is_file("../dokumenty/".$_SESSION['id']."/nr_konta".$_SESSION['id'].".jpg"))
	{
		echo "&nbsp;";
		echo "<tr><td><a valign='top' href='../dokumenty/".$_SESSION['id']."/nr_konta".$_SESSION['id'].".jpg' class='img' target='_blank'><img src='../dokumenty/".$_SESSION['id']."/nr_konta".$_SESSION['id'].".jpg' width='250' heigth='350'></a></td></tr>";
	}
	if (is_file("../dokumenty/".$_SESSION['id']."/ankieta".$_SESSION['id'].".pdf"))
	{
		echo "&nbsp;";
		echo "<tr><td><a valign='top' href='../dokumenty/".$_SESSION['id']."/ankieta".$_SESSION['id'].".pdf' class='img' target='_blank'><img src='../zdj/pdf.jpg' width='50' heigth='35'></a></td></tr>";
	}
	//echo "</tr></table>";
        require("../stopka.php");
    }
?>
</html>
