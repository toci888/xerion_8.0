<?php
	function oblicz_date($rok, $miesiac, $dzien, $ilosc_tyg)
	{
		$t = mktime(0,0,0, $miesiac, $dzien, $rok);
		$t += ($ilosc_tyg * 7 * 24 * 60 * 60);
		$t += (60 * 60 * 24);
		$t = date("Y-m-d", $t);
		return $t;
	}
	function oblicz_date_bez_przes($rok, $miesiac, $dzien, $ilosc_tyg)
	{
		$t = mktime(0,0,0, $miesiac, $dzien, $rok);
		$t += ($ilosc_tyg * 7 * 24 * 60 * 60);
		//$t += (60 * 60 * 24);
		$t = date("Y-m-d", $t);
		return $t;
	}
	function backward_date($rok, $miesiac, $dzien, $ilosc_dni)
	{
		$t = mktime(0,0,0, $miesiac, $dzien, $rok);
		$t -= (60 * 60 * 24);
		$t = date("Y-m-d", $t);
		return $t;
	}
    function forward_date($rok, $miesiac, $dzien, $ilosc_dni)
    {
        $t = mktime(0,0,0, $miesiac, $dzien, $rok);
        $t += (60 * 60 * 24);
        $t = date("Y-m-d", $t);
        return $t;
    }
?>
</html>
