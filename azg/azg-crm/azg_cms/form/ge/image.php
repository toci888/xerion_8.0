<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<html>
<head>
	<title><? echo "$i"; ?></title>
</head>

<body bgcolor="#ffffff" marginwidth="0" marginheight="0" leftmargin="0" topmargin="0" background="img/back_img.gif">

<?
	$imgn = $p . ".jpg";
	$ww = $w + 20;
	$hh = $h + 20;
	echo "<table border=\"0\" cellspacing=\"0\" width=\"$ww\" height=\"$hh\" valign=\"middle\">\n";
	echo "<tr align=\"center\"><td><a href=\"javascript:window.close()\">";
	echo "<img src=\"$imgn\" border=\"0\" width=\"$w\" height=\"$h\" border=\"0\" alt=\"$i\">";
?>
</a></td></tr>
</table>

</body>
</html>
