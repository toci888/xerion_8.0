<?php
    class Utils
    {
        public static function WyswietlTablice($tablica)
        {
            echo '<table border="1">';
            
            $wiersz = $tablica[0];
            echo '<tr>';    
            //naglowek tabeli    
            foreach ($wiersz as $key => $value)
            {
                if (!is_int($key))
                {
                    echo '<td>';
                    echo $key;
                    echo '</td>';
                }
            }
            
            echo '</tr>';
            $i = 0;
            
            while(isset($tablica[$i]))
            {
                //echo $tablica[$i]['nazwa'].'<br />';
                echo '<tr>';
                $wiersz = $tablica[$i];
                
                foreach ($wiersz as $key => $value)
                {
                    //if (is_int($key))
                    //{
                        echo '<td>';
                        if (!is_array($value))
                        {
                            echo $value;
                        }
                        else
                        {     
                            Utils::WyswietlTablice($value);
                        }
                        echo '</td>';
                    //}
                }
                
                echo '</tr>';
                $i++;
            }
            
            echo '</table>';
        }
        public static function KonwertujNaBool ($element)
        {
            if ($element == 't')
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        public static function IloscSekund ($rok, $miesiac, $dzien, $godzina, $minuta, $sekunda)
        {
            $sekundy = mktime($godzina, $minuta, $sekunda, $miesiac, $dzien, $rok);
            return $sekundy;
        }
        public static function DataKolejnyDzien ($data, $tyl = false)
        {
            $rmd = explode('-', $data);
            $t = mktime(0,0,0, $rmd[1], $rmd[2], $rmd[0]);
            $t += 60 * 24 * 4; //dodaje 4 godziny - nie wiem strefy czasowe ??? !!!!!!!!!!!!! zmiana czasu !!!!!!!! trza dodac godzine !!!!!!!!!!! o kurwa :P !!

            if ($tyl)
            {
                $t -= (60 * 60 * 24);
            }
            else
            {
                $t += (60 * 60 * 24);
            }
            $t = date('Y-m-d', $t);

            return $t;
        }
        /*
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
        function cofnij_date($rok, $miesiac, $dzien, $ilosc_dni)
        {
            $t = mktime(0,0,0, $miesiac, $dzien, $rok);
            //$t += ($ilosc_tyg * 7 * 24 * 60 * 60);
            $t -= (60 * 60 * 24);
            $t = date("Y-m-d", $t);
            return $t;
        }*/
        //tablica - array po serializacji i umieszczeniuw  poscie ma escape'owane  wszystkie ", wiec przy deserializacji trzeba najpierw wywalic \\ :)
        public static function DeserializacjaPost ($tablica)
        {
            $tablica = str_replace('\\', '', $tablica);
            $tablica = unserialize($tablica);
            return $tablica;
        }
        public static function slownie ($kw) 
        {
            $t_a = array('','sto','dwie�cie','trzysta','czterysta','pi��set','sze��set','siedemset','osiemset','dziewi��set');
            $t_b = array('','dziesi��','dwadzie�cia','trzydzie�ci','czterdzie�ci','pi��dziesi�t','sze��dziesi�t','siedemdziesi�t','osiemdziesi�t','dziewi��dziesi�t');
            $t_c = array('','jeden','dwa','trzy','cztery','pi��','sze��','siedem','osiem','dziewi��');
            $t_d = array('dziesi��','jedena�cie','dwana�cie','trzyna�cie','czterna�cie','pi�tna�cie','szesna�cie','siedna�cie','osiemna�cie','dziewi�tna�cie');

            $t_kw_15 = array('septyliard','septyliard�w','septyliardy');
            $t_kw_14 = array('septylion','septylion�w','septyliony');
            $t_kw_13 = array('sekstyliard','sekstyliard�w','sekstyliardy');
            $t_kw_12 = array('sekstylion','sekstylion�w','sepstyliony');
            $t_kw_11 = array('kwintyliard','kwintyliard�w','kwintyliardy');
            $t_kw_10 = array('kwintylion','kwintylion�w','kwintyliony');
            $t_kw_9 = array('kwadryliard','kwadryliard�w','kwaryliardy');
            $t_kw_8 = array('kwadrylion','kwadrylion�w','kwadryliony');
            $t_kw_7 = array('tryliard','tryliard�w','tryliardy');
            $t_kw_6 = array('trylion','trylion�w','tryliony');
            $t_kw_5 = array('biliard','biliard�w','biliardy');
            $t_kw_4 = array('bilion','bilion�w','bilony');
            $t_kw_3 = array('miliard','miliard�w','miliardy');
            $t_kw_2 = array('milion','milion�w','miliony');
            $t_kw_1 = array('tysi�c','tysi�cy','tysi�ce');
            $t_kw_0 = array('z�oty','z�otych','z�ote');

            if ($kw!='') 
            {
                $kw=(substr_count($kw,',')==0) ? $kw.',00':$kw;
                $tmp=explode(",",$kw);
                $ln=strlen($tmp[0]);
                $tmp_a=($ln%3==0) ? (floor($ln/3)*3):((floor($ln/3)+1)*3);
                
                $l_pad = '';
                $kw_w = '';
                for($i = $ln; $i < $tmp_a; $i++) 
                {
                    $l_pad .= '0';
                    $kw_w = $l_pad . $tmp[0];
                }

                $kw_w=($kw_w=='') ? $tmp[0]:$kw_w;
                $paczki=(strlen($kw_w)/3)-1;
                $p_tmp=$paczki;

                $kw_slow = '';
                for($i=0;$i<=$paczki;$i++) 
                {
                    $t_tmp='t_kw_'.$p_tmp;
                    $p_tmp--;
                    $p_kw=substr($kw_w,($i*3),3);
                    $kw_w_s=($p_kw{1}!=1) ? $t_a[$p_kw{0}].' '.$t_b[$p_kw{1}].' '.$t_c[$p_kw{2}]:$t_a[$p_kw{0}].' '.$t_d[$p_kw{2}];

                    if(($p_kw{0}==0)&&($p_kw{2}==1)&&($p_kw{1}<1))
                    $ka=${$t_tmp}[0];

                    else if (($p_kw{2}>1 && $p_kw{2}<5)&&$p_kw{1}!=1) $ka=${$t_tmp}[2];
                    else $ka=${$t_tmp}[1];
                    $kw_slow.=$kw_w_s.' '.$ka.' ';
                }
            }

            $text = $kw_slow.' '.$tmp[1].'/100 gr.';
            return $text;
        }
        public static function KonwertujTabIndWar ($tab, &$wyj_tab)
        {
            if (is_array($tab))
            {
                $wyj_tab = array();
                foreach ($tab as $klucz => $wartosc)
                {
                    $wartosc = trim($wartosc);
                    $wyj_tab[$wartosc] = $wartosc;
                }
                return true;
            }
            else
            {
                $wyj_tab = null;
                return false;
            }
        }
    }
?>