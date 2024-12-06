<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<?php
    require("naglowek.php");
    
    echo '<link href="css/login.css" rel="stylesheet" type="text/css">';
    echo '<table align="center" border="0" cellpadding="0" cellspacing="0" height="200" width="350">
	<tbody><tr valign="top">
		  <td rowspan="3" width="102"><img src="zdj/1.jpg" height="203" width="102"></td>
		  <td colspan="2"><img src="zdj/2.jpg" height="32" width="248"></td></tr>
          <tr valign="top">
	      <td background="zdj/lgn_bg.jpg" height="139" valign="middle" width="234">
		  <form method="post" action="log_in.php" target="_parent">
		  <br>
	  	  <table border="0" cellpadding="2" cellspacing="0" width="100%">
	    	<tbody><tr>
			<td class="text_bold" width="32%"><div align="right">Login:&nbsp;&nbsp;&nbsp;</div></td>
	  		<td width="68%">
		  	<input name="login" class="formfield" tabindex="1" type="text"></td>
			</tr>
			<tr>
			<td class="text_bold"><div align="right">Hasło:&nbsp;&nbsp;&nbsp;</div></td>
			<td><input name="pass" class="formfield" tabindex="2" type="password"></td>
			</tr>
			<tr>
			<td class="text_bold">&nbsp;</td>
			<td><br>
			<input name="wyslij" class="formreset" value="Zaloguj" tabindex="3" type="submit"></td>
			</tr>
	      	</tbody></table>
	      	</form></td>
		<td height="139" width="14"><img src="zdj/4.jpg" height="149" width="14"></td></tr>
  		<tr valign="top">
	  	<td colspan="2" height="22" valign="top"><img src="zdj/3.jpg" height="22" width="248"></td></tr>
		<tr valign="top">
		<td colspan="2" height="22" valign="top"></td>
		</tr>
</tbody></table>';
require("stopka.php");
?>
