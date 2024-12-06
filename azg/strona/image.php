<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<html>
<head>
	<title><? echo $_GET['i']; ?></title>
</head>

<body bgcolor="#ffffff" marginwidth="0" marginheight="0" leftmargin="0" topmargin="0" background="img/back_img.gif">

<?
	$imgn = $_GET['p'];
	$ww = $_GET['w'] + 20;
	$hh = $_GET['h'] + 20;
	echo '<table border="0" cellspacing="0" width="'.$ww.'" height="'.$hh.'" valign="middle"><tr align="center"><td><a href="javascript:window.close()"><img src="'.$imgn.'" border="0" width="'.
    $_GET['w'].'" height="'.$_GET['h'].'" border="0" alt="">';
?>
</a></td></tr>
</table>

</body>
</html>
