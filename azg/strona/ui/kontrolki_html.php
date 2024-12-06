<?php
    $path = str_replace($_SERVER['PHP_SELF'], '', $_SERVER['SCRIPT_FILENAME']).'/';
    
    include_once ($path.'bll/jezykibll.php');
    include_once ($path.'bll/cache.php');
    include_once ($path.'ui/utilsui.php');
    include_once ($path.'dal/queriesDAL.php');

  class KontrolkiHtml 
  {
      public static function DodajZdjNierStrona ($sciezka_zdjecie, $id_nier_rodzaj, $id_oferta, $width, $height, $lokalizacja = '')
      {
          $t_nier_r = array(2 => tags::$mieszkania, 1 => tags::$domy, 4 => tags::$lokale, 3 => tags::$obiekty, 6 => tags::$dzialki, 5 => tags::$tereny);
          $path = str_replace($_SERVER['PHP_SELF'], '', $_SERVER['SCRIPT_FILENAME']).'/';
          require($path.'conf.php');
          $tlumaczenia = cachejezyki::Czytaj();

          $str = '<img src="'.$sciezka_zdjecie.'" width="'.$width.'" height="'.$height.'" border="0" class="ira" title="'.
          $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nieruchomosci).' '.$lokalizacja.': '.
          $tlumaczenia->Tlumacz($_SESSION[$jezyk], $t_nier_r[$id_nier_rodzaj]).' - '.
          $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$numer_oferty).': '.$id_oferta.'." alt="'.
          $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nieruchomosci).' '.$lokalizacja.': '.
          $tlumaczenia->Tlumacz($_SESSION[$jezyk], $t_nier_r[$id_nier_rodzaj]).', '.
          $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$numer_oferty).': '.$id_oferta.'."></img>';
          
          return $str;
      }
      public static function DodajZdjeciaNierStrona ($nieruchomosc_id, $tab_zdj, $tlumaczenia, $jezyk_id, $tab_nier_rodz, $id_nier_rodzaj, $id_oferta, $width, $height, $lokalizacja = '')
      {
          $title = $tlumaczenia->Tlumacz($jezyk_id, tags::$nieruchomosci).' '.$lokalizacja.': '.$tlumaczenia->Tlumacz($jezyk_id, $tab_nier_rodz[$id_nier_rodzaj]).' - '.
          $tlumaczenia->Tlumacz($jezyk_id, tags::$numer_oferty).': '.$id_oferta.'.';
          $str = '';
          foreach ($tab_zdj as $zdjecie)
          {
              if (file_exists('media/'.$nieruchomosc_id.'/zdjecia/m_'.$zdjecie))
              $str .= '<img src="media/'.$nieruchomosc_id.'/zdjecia/m_'.$zdjecie.'" width="'.$width.'" height="'.$height.'" border="1" class="ira" title="'.$title.'" alt="'.$title.'"></img>';
          }
          
          return $str;
      }
      public static function DodajTextboxWalBaza ($nazwa, $id, $wartosc, $dlugosc, $iloscZnakow, $walidacja)
      {
          $text = 'text';
          $float = 'float';
          $int = 'int';
          $data = 'data';
          
          $funJSkeyPress = '';
                                                                                    
          switch ($walidacja)
          {
              case $text:        
                $funJSkeyPress = 'WalidacjaText';
              break;
              case $float:
                $funJSkeyPress = 'WalidacjaLiczbaWymierna';
              break;
              case $int:
                $funJSkeyPress = 'WalidacjaLiczbaCalkowita';
              break;
              case $data;
                $funJSkeyPress = 'WalidacjaData';
              break;
          }
          
          echo '<input class="przezrocze" type = "text" name = "'.$nazwa.'" id = "'.$id.'" value = "'.$wartosc.'" size = "'.$dlugosc.'" maxlength = "'.$iloscZnakow.'" onkeypress = "return '.$funJSkeyPress.'(this, event);" class="formfield" />';
      }
      public static function DodajSelectWyposazenie($nazwa, $id, $objWyp, $hiddenId, $formName, $onDbClick) 
      {
          $str = '<select size="ROZMIAR" name="'.$nazwa.'" id="'.$id.'"  onclick = "setHiddenFromSelect(this, \''.$hiddenId.'\');" ondblclick="'.$onDbClick.$formName.'.submit();" class="formfield" >';
          //$str .= '<option id="--------" value="--------">--------</option>';
          $licznik = 0;
          foreach ($objWyp as $klucz => $wartosc)
          {
              $str .= '<option id="'.$wartosc->id.'" value="'.$wartosc->nazwa.'">'.$wartosc->nazwa.'</option>';
              $licznik++;
          }
          if ($licznik == 1) $licznik++;
          $str = str_replace('ROZMIAR', $licznik, $str);
          //$str .= '<option id="'.$row[$id].'" value="'.$row[$name].'">'.$row[$name].'</option>';
          //onkeyup=\"klawisz(this);\"
          
          $str .= '</select><input type="hidden" id="'.$hiddenId.'" name="'.$hiddenId.'" />';
          echo $str; 
      }
      public static function DodajSelectMulti($nazwa, $id, $objWyp, $hiddenId, $formName, $onDbClick) 
      {
          $str = '<select size="ROZMIAR" name="'.$nazwa.'" id="'.$id.'"  onclick = "setHiddenFromSelect(this, \''.$hiddenId.'\');" ondblclick="'.$onDbClick.$formName.'.submit();" class="formfield" >';
          //$str .= '<option id="--------" value="--------">--------</option>';
          $tlumaczenia = cachejezyki::Czytaj();
          $licznik = 0;
          if (is_array($objWyp))
          foreach ($objWyp as $klucz => $wartosc)
          {
              $dana = $tlumaczenia->Tlumacz($_SESSION['wyb_jezyk'], $wartosc['nazwa']);
              $str .= '<option id="'.$wartosc['id'].'" value="'.$dana.'">'.$dana.'</option>';
              $licznik++;
          }
          if ($licznik == 1) $licznik++;
          $str = str_replace('ROZMIAR', $licznik, $str);
          //$str .= '<option id="'.$row[$id].'" value="'.$row[$name].'">'.$row[$name].'</option>';
          //onkeyup=\"klawisz(this);\"
          
          $str .= '</select><input type="hidden" id="'.$hiddenId.'" name="'.$hiddenId.'" />';
          echo $str; 
      }
      public static function DodajSelectRegGeog ($nazwa, $id, $id_parent, $hiddenId, $id_sel, $onClick)
      {
          //pobranie danych dla slownika regionow
          ///dowalic ifa temu session start
          //uzupelnic tego hiddena
          if (!isset($_SESSION['wyb_jezyk']))
          {
              session_start();
          }
          $tlumaczenia = cachejezyki::Czytaj(); 
          $wynik = SlownikDAL::PobierzRegionGeog($id_parent);
          //wywolanie metody dodajacej klasyczny select skoro juz mamy do niego tresc
          $str = '<select size="ROZMIAR" name="'.$nazwa.'" id="'.$id.'" onClick="setHiddenFromSelect(this, \''.$hiddenId.'\'); '.$onClick.'" style="background-color: #d5deec;">';
          $licznik = 0;
          foreach ($wynik as $wiersz)
          {
              $dana = $tlumaczenia->Tlumacz($_SESSION['wyb_jezyk'], $wiersz['nazwa']);
              if ($id_sel == $wiersz['id'])
              {
                  $str .= '<option selected id="'.$wiersz['id'].'" value="'.$dana.'">'.$dana.'</option>';
              }
              else
              {
                  $str .= '<option id="'.$wiersz['id'].'" value="'.$dana.'">'.$dana.'</option>';
              }
              $licznik++;
          }
          if ($licznik == 1) $licznik++;
          $str = str_replace('ROZMIAR', $licznik, $str);
          $str .= '</select><input type="hidden" id="'.$hiddenId.'" name="'.$hiddenId.'" value="'.$id_sel.'" />';
          //echo $str;
          return $str;
      }
      public static function DodajSelectDomWartId ($nazwa_ctrl, $id, $wynik, $hiddenId, $id_sel, $onBlur, $specific, $indId = null, $indTxt = null, $convert = false)
      {
          //w przypadku, gdy id nie zostanie podane nalezy wprowadzic 1 id jako zaznaczone, gdyz 1 element domyslnie jest wybrany
          $nazwa = 'nazwa';
          if ($indTxt != null)
          {
              $nazwa = $indTxt;
          }
          $id_ind = 'id';
          if ($indId != null)
          {
              $id_ind = $indId;
          }
          if (strlen($id_sel) < 1)
          {
              //gdy nie otrzymano id sel przypisujemy null
              $id_sel = null;
          }//WspomaganieSelect
          $str = '<select name="'.$nazwa_ctrl.'" id="'.$id.'" onkeyup="WspomaganieSelect(this, event, \'txt'.$hiddenId.'\', \'pole'.$hiddenId.'\');" onBlur = "CzyscPamietanieSelect(\'txt'.$hiddenId.'\'); setHiddenFromSelect(this, \''.$hiddenId.'\');'.$onBlur.'" class="formfield" '.$specific.'>'; 
          $tlumaczenia = cachejezyki::Czytaj();
          
          if(is_array($wynik))
          foreach ($wynik as $wiersz)
          {
              if (!$convert)
              {
                  $dana = $tlumaczenia->Tlumacz($_SESSION['wyb_jezyk'], $wiersz[$nazwa]);
              }
              else
              {
                  $dana = UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION['wyb_jezyk'], $wiersz[$nazwa]), $_SESSION['wyb_jezyk']);
              }
              //jesli id sel jest nullem 1 wartosc zosatje do niego przypisana i juz nie jest nullem, wiec 1 id zostaje
              if ($id_sel == null)
              {
                  $id_sel = $wiersz[$id_ind];
              }
              if ($id_sel == $wiersz[$id_ind])
              {
                  $str .= '<option selected id="'.$wiersz[$id_ind].'" value="'.$dana.'">'.$dana.'</option>';
              }
              else
              {
                  $str .= '<option id="'.$wiersz[$id_ind].'" value="'.$dana.'">'.$dana.'</option>';
              }
              
          }
          $str .= '</select><input type="hidden" id="'.$hiddenId.'" name="'.$hiddenId.'" value="'.$id_sel.'" /><input type="hidden" id="txt'.$hiddenId.'" name="txt'.
          $hiddenId.'" /><input type="hidden" id="pole'.$hiddenId.'" name="pole'.$hiddenId.'" />';
          echo $str;
          //return $str;
      }
      public static function DodajSelectDomWartIdMulti ($nazwa_ctrl, $id, $wynik, $hiddenId, $id_sel, $onBlur, $specific, $indId = null, $indTxt = null, $convert = false)
      {
          //w przypadku, gdy id nie zostanie podane nalezy wprowadzic 1 id jako zaznaczone, gdyz 1 element domyslnie jest wybrany
          $nazwa = 'nazwa';
          if ($indTxt != null)
          {
              $nazwa = $indTxt;
          }
          $id_ind = 'id';
          if ($indId != null)
          {
              $id_ind = $indId;
          }
          //if (strlen($id_sel) < 1)
          //{
              //gdy nie otrzymano id sel przypisujemy null
          //    $id_sel = null;
          //}//WspomaganieSelect
          $str = '<select size="ROZMIAR" name="'.$nazwa_ctrl.'[]" id="'.$id.'"  onchange="setHiddenFromSelectMulti(this, \''.$hiddenId.'\');'.$onBlur.'" class="formfield" '.$specific.' multiple="multiple">'; 
          $tlumaczenia = cachejezyki::Czytaj();
          $licznik = 0;
          
          if(is_array($wynik))
          foreach ($wynik as $wiersz)
          {
              if (!$convert)
              {
                  $dana = $tlumaczenia->Tlumacz($_SESSION['wyb_jezyk'], $wiersz[$nazwa]);
              }
              else
              {
                  $dana = UtilsUI::KonwersjaEncoding($tlumaczenia->Tlumacz($_SESSION['wyb_jezyk'], $wiersz[$nazwa]), $_SESSION['wyb_jezyk']);
              }
              //jesli id sel jest nullem 1 wartosc zosatje do niego przypisana i juz nie jest nullem, wiec 1 id zostaje
              if ($id_sel == null)
              {
                  $id_sel = $wiersz[$id_ind];
              }
              if (isset($id_sel[$wiersz[$id_ind]]))
              {
                  $str .= '<option selected id="'.$wiersz[$id_ind].'" value="'.$dana.'">'.$dana.'</option>';
              }
              else
              {
                  $str .= '<option id="'.$wiersz[$id_ind].'" value="'.$dana.'">'.$dana.'</option>';
              }
              $licznik++;
          }
          $str = str_replace('ROZMIAR', $licznik, $str);
          $sel_items = '';
          if ($id_sel != null)
          {
              $licznik = 0;
              foreach ($id_sel as $el_tab => $wart)
              {
                  if ($licznik > 0)
                  {
                      $sel_items .= ';';
                  }
                  $sel_items .= $el_tab;
                  $licznik++;
              }
          }
          $str .= '</select><input type="hidden" id="'.$hiddenId.'" name="'.$hiddenId.'" value="'.$sel_items.'" />';
          echo $str;
          //return $str;
      }
      public static function DodajXajaxSelectDomWartId ($nazwa, $id, $wynik, $hiddenId, $id_sel, $onBlur, $specific)
      {
          if (!isset($_SESSION['wyb_jezyk']))
          {
              session_start();
          }
          //w przypadku, gdy id nie zostanie podane nalezy wprowadzic 1 id jako zaznaczone, gdyz 1 element domyslnie jest wybrany
          if (strlen($id_sel) < 1)
          {
              //gdy nie otrzymano id sel przypisujemy null
              $id_sel = null;
          }
          $str = '<select name="'.$nazwa.'" id="'.$id.'"  onBlur = "setHiddenFromSelect(this, \''.$hiddenId.'\'); '.$onBlur.'" class="formfield" '.$specific.'>';
          $tlumaczenia = cachejezyki::Czytaj();
          
          foreach ($wynik as $wiersz)
          {
              $dana = $tlumaczenia->Tlumacz($_SESSION['wyb_jezyk'], $wiersz['nazwa']);
              //jesli id sel jest nullem 1 wartosc zosatje do niego przypisana i juz nie jest nullem, wiec 1 id zostaje
              if ($id_sel == null)
              {
                  $id_sel = $wiersz['id'];
              }
              if ($id_sel == $wiersz['id'])
              {
                  $str .= '<option selected id="'.$wiersz['id'].'" value="'.$dana.'">'.$dana.'</option>';
              }
              else
              {
                  $str .= '<option id="'.$wiersz['id'].'" value="'.$dana.'">'.$dana.'</option>';
              }
              
          }
          $str .= '</select><input type="hidden" id="'.$hiddenId.'" name="'.$hiddenId.'" value="'.$id_sel.'" />';
          return $str;
          //return $str;
      }
      ///metoda odpowiedzialna za dodanie pola rozwijalnego z zawartoscia ze slownika z bazy
      //roznica polega na tym ze dla slownikow wolana jest metoda statyczna ktora uzupelnia zmienna wynik zawartoscia slownika z bazy
      public static function DodajSelectZrodSlownik ($nazwa, $id, $nazwaSlownik, $hiddenId, $id_sel, $onBlur, $specific)
      {
          //pobranie danych dla podanego slownika
          $wynik = SlownikDAL::PobierzSlownik($nazwaSlownik);
          //wywolanie metody dodajacej klasyczny select skoro juz mamy do niego tresc
          KontrolkiHtml::DodajSelectDomWartId($nazwa, $id, $wynik, $hiddenId, $id_sel, $onBlur, $specific);
      }
      public static function DodajPrzeszukiwanieKontrolka($PrzyciskNapis, $PrzyciskNazwa, $TxtID, $TxtValue, $HiddenID, $HiddenValue, $StronaOdp, $NazwaOkno, $wymagane = false)  //Capital letter textbox
      {
          $css_klasa = 'przezrocze';
          if ($wymagane) //if jest binarny, jesli napiszesz if (true) - sie wykona
          {
              $css_klasa = 'pole_wymagane';
          }
          $str = '<input class="'.$css_klasa.'" type="text" name="'.$TxtID.'" id="'.$TxtID.'" value="'.$TxtValue.'" size="20" READONLY>
          <input type="hidden" name="'.$HiddenID.'" id="'.$HiddenID.'" value="'.$HiddenValue.'">
          <input type="button" value="'.$PrzyciskNapis.'" name="'.$PrzyciskNazwa.'" class="przycisksubmit" onClick = "this.disabled = true; window.open(\''.$StronaOdp.'\', \''.$NazwaOkno.'\',\'toolbar=no, scrollbars=yes, width=750,height=650\'); this.disabled = false;">';
          echo $str;
      }
      public static function DodajWyborPrzeszukiwania($HiddenId, $TxtId, $PrzyciskNazwa, $wartoscId, $wartoscTxt)
      {
          $str = '<input type="button" name="wybierz" class="przycisksubmit" value="'.$PrzyciskNazwa.'" 
                onclick="opener.window.document.getElementById(\''.$HiddenId.'\').value = \''.$wartoscId.'\';
                opener.window.document.getElementById(\''.$TxtId.'\').value = \''.$wartoscTxt.'\';
                window.close();">';
          echo $str;
      }
      public static function DodajSubmit($name, $id, $value, $specific)
      {
          $str = '<input type="submit" name="'.$name.'" id="'.$id.'" value="'.$value.'" class="przycisksubmit" '.$specific.' />';
          echo $str;
      }
      public static function DodajSubmitWyczysc($name, $id, $value, $specific)
      {
          $str = '<input type="reset" name="'.$name.'" id="'.$id.'" value="'.$value.'" class="przycisksubmit" '.$specific.' />';
          echo $str;
      }
      public static function DodajHidden($id,$name,$value)
      {
          $str="<input type='hidden' id='".$id."' name='".$name."' value='".$value."' />";
          echo $str;
      }
      public static function DodajCheckbox($nazwa, $id, $zaznaczony, $komentarz, $specific, $value = '')  //nuber designed textbox
      {
          $checked = '';
          if($zaznaczony)                                                             
          {
              $checked = 'checked';
          }
          $str = '<input type="checkbox" name="'.$nazwa.'" id="'.$id.'" value="'.$value.'" onmouseup="blur();" class="formfield" '.$checked.' '.$specific.' /><label for="'.$id.'"><i>'.$komentarz.'</i></label>';
          echo $str;
      }
      //dodanie n radio boxow opatrzonych komentarzem z arraya, ktorego ilosc elementow = ilosci podanych oczekiwanych radiow :P; id tez w arrayu
      /**
      * @desc dodaje elementy radio w ilosci okreslonej przez tablice $tab_id - id poszczegolnych elementow, $tab_nazwa - tablica ich nazw, $tab_wartosc - poszczegolne wartosci
      */
      public static function DodajRadio ($nazwa, $tab_id, $tab_nazwa, $tab_wartosc, $specific, $nowe_linie, $zaznaczony, $tag_otw, $tag_zam)
      {
          $path = str_replace($_SERVER['PHP_SELF'], '', $_SERVER['SCRIPT_FILENAME']).'/';
          require($path.'conf.php');
          $tlumaczenia = cachejezyki::Czytaj();
          $i = 0; //potrzebne do indexowania tab_nazwa podczas krecenia foreachem tab_id
          $str = '';
          if ($zaznaczony == null)
          {
              $zaznaczony = $tab_wartosc[0];
          }
          foreach ($tab_id as $dane_id)
          {
              $check = '';
              if ($zaznaczony == $tab_wartosc[$i])
              {
                  $check = 'checked';
              }
              $str .= $tag_otw.'<input type="radio" name="'.$nazwa.'" id="'.$dane_id.'" value="'.$tab_wartosc[$i].'" '.$check.' '.$specific.'/><label for="'.
              $dane_id.'">'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], $tab_nazwa[$i]).'</label>'.$tag_zam;
              if ($nowe_linie)
              {
                  $str .= '<br />';
              }
              $i++;
          }
          
          echo $str;
      }                                                            //array :P
      public static function DodajRadioDb ($nazwa, $wynik, $index, $dane, $id_prefix, $specific, $nowe_linie, $zaznaczony, $tag_otw, $tag_zam)
      {
          $path = str_replace($_SERVER['PHP_SELF'], '', $_SERVER['SCRIPT_FILENAME']).'/';
          require($path.'conf.php');
          $tlumaczenia = cachejezyki::Czytaj();
          $i = 0; //potrzebne do indexowania tab_nazwa podczas krecenia foreachem tab_id
          $str = '';
          if ($zaznaczony == null)
          {
              $zaznaczony = $wynik[0][$index];
          }
          foreach ($wynik as $wiersz)
          {
              $check = '';
              if ($zaznaczony == $wiersz[$index])
              {
                  $check = 'checked';
              }
              
              if (!is_array($dane))
              {
                  $etykieta = $tlumaczenia->Tlumacz($_SESSION[$jezyk], $wiersz[$dane]);
              }
              else
              {
                  $etykieta = '';
                  foreach ($dane as $wartosc)
                  {
                      if (!is_array($wiersz[$wartosc]))
                      {
                          $etykieta .= ' '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], $wiersz[$wartosc]).',';
                      }
                      else
                      {
                          foreach ($wiersz[$wartosc] as $element_wiersz)
                          {
                              $etykieta .= ' '.$tlumaczenia->Tlumacz($_SESSION[$jezyk], $element_wiersz).',';
                          }
                      }
                  }
              }
              
              $str .= $tag_otw.'<input type="radio" name="'.$nazwa.'" id="'.$id_prefix.$wiersz[$index].'" value="'.$wiersz[$index].'" '.$check.' '.$specific.'/><label for="'.
              $id_prefix.$wiersz[$index].'">'.$etykieta.'</label>'.$tag_zam;
              if ($nowe_linie)
              {
                  $str .= '<br />';
              }
              $i++;
          }
          
          echo $str;
      }
      public static function DodajTextbox($name, $id, $value, $length, $size, $validation, $wymagane = false)  //Capital letter textbox
      {
          $css_klasa = 'przezrocze';
          if ($wymagane) //if jest binarny, jesli napiszesz if (true) - sie wykona
          {
              $css_klasa = 'pole_wymagane';
          }//class="formfield"
          $str = '<input type="text" name="'.$name.'" class="'.$css_klasa.'" id="'.$id.'" value="'.$value.'" maxlength="'.$length.'" size="'.$size.'" onblur="this.value = trim(this.value);" '.$validation.'>';
          echo $str;
      }
      public static function DodajTextArea($name, $id, $value, $kolumn, $wiersze, $wrap, $specific = '')
      {
          $str = '<textarea class="przezrocze" name="'.$name.'" id="'.$id.'" cols="'.$kolumn.'" rows="'.$wiersze.'" wrap="'.$wrap.'" '.$specific.'>'.$value.'</textarea>';
          echo $str;   
      }
      public static function DodajTextboxNip($nazwa, $id, $value, $onblur, $specific, $wymagane = false)  //date designed textbox
      {
          $path = str_replace($_SERVER['PHP_SELF'], '', $_SERVER['SCRIPT_FILENAME']).'/';
          require($path.'conf.php');
          $tlumaczenia = cachejezyki::Czytaj();
          
          $css_klasa = 'przezrocze';
          if ($wymagane) //if jest binarny, jesli napiszesz if (true) - sie wykona
          {
              $css_klasa = 'pole_wymagane';
          }                                                                                                                  //dopuszcza cyfry i myslniki
          $str = '<input class="'.$css_klasa.'" type="text" name="'.$nazwa.'" id="'.$id.'" value="'.$value.'" onkeypress = "return WalidacjaData(this, event);" 
          onblur="WalidacjaNip(this, \''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$nip_jest_niepoprawny).'\'); '.$onblur.'"  maxlength="13" size="12" '.$specific.'>';
          echo $str;
      }
      public static function DodajTextboxData($nazwa, $id, $value, $length, $size, $info_zla_data, $onblur, $specific, $form = '', $sciezka = '', $wymagane = false)  //date designed textbox
      {
          $css_klasa = 'przezrocze';
          if ($wymagane) //if jest binarny, jesli napiszesz if (true) - sie wykona
          {
              $css_klasa = 'pole_wymagane';
          }                                                                    
          echo '<a href="javascript:'.$id.'.popup();"><img src="'.$sciezka.'../img/cal.gif" width="20" height="20" border="0"></a>';
          $str = '<input class="'.$css_klasa.'" type="text" name="'.$nazwa.'" id="'.$id.'" value="'.$value.'" onkeypress = "return WalidacjaData(this, event);" 
          onblur="SprawdzDlugoscData(this, \''.$info_zla_data.'\'); '.$onblur.'"  maxlength="'.$length.'" size="'.$size.'" class="formfield" '.$specific.'>';
          echo $str;
          echo '<script language="javascript">var '.$id.' = new calendar1(document.forms[\''.$form.'\'].elements[\''.$nazwa.'\']);</script>'; //document.getElementById[\''.$id.'\']
      }
      //onkeyup = 'DateKeyUp(this)'  - po co to ??
      public static function DodajTextboxDataPrzyszlosc($nazwa, $id, $value, $length, $size, $info_zla_data, $monit, $onblur, $specific, $form = '', $sciezka = '')  //date designed textbox
      {
          echo '<a href="javascript:'.$id.'.popup();"><img src="'.$sciezka.'../img/cal.gif" width="20" height="20" border="0"></a>';
          $str = '<input class="przezrocze" type="text" name="'.$nazwa.'" id="'.$id.'" value="'.$value.'" onkeypress = "return WalidacjaData(this, event);" onblur = "SprawdzDlugoscData(this, \''.$info_zla_data.'\'); DataPrzyszlosc(this, \''.$monit.'\'); '.$onblur.'" maxlength="'.$length.'" size="'.$size.'" class="formfield" '.$specific.'>';
          echo $str;
          echo '<script language="javascript">var '.$id.' = new calendar1(document.forms[\''.$form.'\'].elements[\''.$nazwa.'\']);</script>'; //document.getElementById[\''.$id.'\']
      }
      public static function DodajLiczbaCalkowitaTextbox($name, $id, $value, $length, $size, $specific, $wymagane = false)  //nuber designed textbox
      {
          $css_klasa = 'przezrocze';
          if ($wymagane) //if jest binarny, jesli napiszesz if (true) - sie wykona
          {
              $css_klasa = 'pole_wymagane';
          }                                                                    
          $str = '<input type="text" name="'.$name.'" id="'.$id.'" class="'.$css_klasa.'" value="'.$value.'" onkeypress = "return WalidacjaLiczbaCalkowita(this, event);" maxlength="'.
          $length.'" size="'.$size.'" class="formfield" '.$specific.'>';
          echo $str;
      }
      public static function DodajLiczbaWymiernaTextbox($name, $id, $value, $length, $size, $specific, $wymagane = false)  //nuber designed textbox
      {
          $css_klasa = 'przezrocze';
          if ($wymagane) //if jest binarny, jesli napiszesz if (true) - sie wykona
          {
              $css_klasa = 'pole_wymagane';
          }                                                                    
          $str = '<input type="text" name="'.$name.'" id="'.$id.'" class="'.$css_klasa.'" value="'.$value.'" onkeypress = "return WalidacjaLiczbaWymierna(this, event);" maxlength="'.$length.'" size="'.$size.'" class="formfield" '.$specific.'>';
          echo $str;
      }
      public static function DodajKodPocztowyTextbox($name, $id, $value, $length, $size, $onblur, $specific)  //nuber designed textbox
      {
          $path = str_replace($_SERVER['PHP_SELF'], '', $_SERVER['SCRIPT_FILENAME']).'/';
          require($path.'conf.php');
          $tlumaczenia = cachejezyki::Czytaj();
          $str = '<input class="przezrocze" type="text" name="'.$name.'" id="'.$id.'" value="'.$value.'" onblur = "PoprKodPocztowy(this, \''.
          $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$bledny_kod).'\');'.$onblur.'" onkeypress = "return WalidacjaKodPocztowy(this, event);" maxlength="'.
          $length.'" size="'.$size.'" class="formfield" '.$specific.'>';
          echo $str;
      }
      public static function DodajKomorkaTextbox($name, $id, $value, $length, $size, $onblur, $validation, $wymagane = false)  //Capital letter textbox
      {
          ///pomeczyc gownianosc tego rozwiazania
          $path = str_replace($_SERVER['PHP_SELF'], '', $_SERVER['SCRIPT_FILENAME']).'/';
          require($path.'conf.php');
          $tlumaczenia = cachejezyki::Czytaj();
          $css_klasa = 'przezrocze';
          if ($wymagane) //if jest binarny, jesli napiszesz if (true) - sie wykona
          {
              $css_klasa = 'pole_wymagane';
          }                                                                            //onkeypress = "return WalidacjaLiczbaCalkowita(this, event);"  //onkeydown="return DopuscCtrl(event);"
          $str = '<input type="text" name="'.$name.'" id="'.$id.'" value="'.$value.'" class="'.$css_klasa.'" onkeypress="return WalidacjaLiczbaCalkowita(this, event);" maxlength="'.
          $length.'" size="'.$size.'" onblur="this.value = trim(this.value); TelefonKomWalidacja(this, \''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$bledny_tel_kom).'\');'.$onblur.'" '.
          $validation.'>';
          echo $str;
      }
      public static function DodajTelefonTextbox($name, $id, $value, $length, $size, $onblur, $validation, $wymagane = false)  //Capital letter textbox
      {
          $path = str_replace($_SERVER['PHP_SELF'], '', $_SERVER['SCRIPT_FILENAME']).'/';
          require($path.'conf.php');
          $tlumaczenia = cachejezyki::Czytaj();
          $css_klasa = 'przezrocze';
          if ($wymagane) //if jest binarny, jesli napiszesz if (true) - sie wykona
          {
              $css_klasa = 'pole_wymagane';
          }  
                                                                          
          $str = '<input class="'.$css_klasa.'" type="text" name="'.$name.'" id="'.$id.'" value="'.$value.'" class="formfield" onkeypress = "return WalidacjaLiczbaCalkowita(this, event);" maxlength="'.
          $length.'" size="'.$size.'" onblur="this.value = trim(this.value); TelefonWalidacja(this, \''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$bledny_telefon).'\');'.$onblur.'" '.
          $validation.'>';
          if (strlen($value) > 0)
          {
              $str .= '<div id="telefon'.$value.'"><a style="cursor: pointer;" onclick="xajax_Zadzwon('.$value.');">tel</a></div>';
          }
          echo $str;
      }
      public static function DodajEmailTextbox($name, $id, $value, $length, $size, $onblur, $validation, $wymagane = false)
      {
          if ($length < 40)
          {
              $length = 40;
          }
          $path = str_replace($_SERVER['PHP_SELF'], '', $_SERVER['SCRIPT_FILENAME']).'/';
          require($path.'conf.php');
          $tlumaczenia = cachejezyki::Czytaj();
          $css_klasa = 'przezrocze';
          if ($wymagane) //if jest binarny, jesli napiszesz if (true) - sie wykona
          {
              $css_klasa = 'pole_wymagane';
          }
          //element ma 2 klasy css ?                                                                    
          //konwersja encoding robi krzywde panelowi ;/
          $str = '<input type="text" name="'.$name.'" id="'.$id.'" value="'.$value.'" class="'.$css_klasa.'" maxlength="'.$length.'" size="'.$size.'" onblur="this.value = trim(this.value); EmailWalidacja(this, 
          \''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$bledny_e_mail).'\');'.
          $onblur.'" '.$validation.'>';
          echo $str;
      }
      public static function DodajHasloKontrolka ($nazwy, $ids, $length, $size, $specific, $wymagane = false) //zastanowic sie, czy zabicie na sztywno tabeli nie uczyni tego malo uzytecznym, na potrzebe zmienic
      {
          $path = str_replace($_SERVER['PHP_SELF'], '', $_SERVER['SCRIPT_FILENAME']).'/';
          require($path.'conf.php');
          $tlumaczenia = cachejezyki::Czytaj();
          echo '<tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$haslo).':</td><td>';
          KontrolkiHtml::DodajHasloTextbox($nazwy[0], $ids[0], '', $length, $size, 'SprawdzZgodnoscHasel(1, '.$nazwy[0].', '.$nazwy[1].', "'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$hasla_sa_niezgodne).'");', $specific, true);
          echo '</td></tr><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$haslo_ponownie).':</td><td>';
          KontrolkiHtml::DodajHasloTextbox($nazwy[1], $ids[1], '', $length, $size, 'SprawdzZgodnoscHasel(2, '.$nazwy[0].', '.$nazwy[1].', "'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$hasla_sa_niezgodne).'");', $specific, true);
          echo '</td></tr>';
      }
      public static function DodajHasloTextbox($name, $id, $value, $length, $size, $onblur, $validation, $wymagane = false)  //Capital letter textbox
      {
          $css_klasa = 'przezrocze';
          if ($wymagane) //if jest binarny, jesli napiszesz if (true) - sie wykona
          {
              $css_klasa = 'pole_wymagane';
          }                                                                    
          $str = "<input type='password' name='".$name."' id='".$id."' value='".$value."' class='".$css_klasa."' maxlength='".$length."' size='".$size."' onblur='this.value = trim(this.value); ".$onblur."' ".$validation.">";
          echo $str;
      }
      public static function DodajPopUpButton($value, $name, $openSite, $width, $height)
      {
          $str = '<input type="button" value="'.$value.'" name="'.$name.'"
          class="przycisksubmit" onClick = "this.disabled = true; window.open(\''.$openSite.'\', \''.$name.'\',\'toolbar=no, scrollbars=yes, width='.$width.',height='.$height.'\'); this.disabled = false;"/>';
          echo $str;  
      }
      public static function AddPassbox($name, $id, $value, $length, $size, $validation, $ver_hard = false)  //Capital letter textbox
      {
          $walid_tw_has = '';
          if ($ver_hard)
          {
              $walid_tw_has = 'SprawdzTwardoscHaslo(this, monit);';
          }
          $str = "<input type='password' name='".$name."' id='".$id."' value='".$value."' class='formfield' maxlength='".$length."' size='".$size."' onblur='this.value = trim(this.value); ".$walid_tw_has."' ".$validation.">";
          echo $str;
      }
      public static function AddAnkietaDatebox($name, $id, $value, $length, $size, $validation, $css)  //date designed textbox
      {                                                                    
          $str = "<input type='text' name='".$name."' id='".$id."' value='".$value."' onkeypress = 'test(this, event)' onkeyup = 'DateKeyUp(this)' onmouseout='showHint(\"\");' 
	  onmouseover='showHint(\"<i>Data w formacie<br> RRRR-MM-DD (rok-miesi±c-dzieñ).</i>\");'  maxlength='".$length."' size='".$size."' class='".$css."' ".$validation.">";
          echo $str;
      }
      public static function AddSeekTextbox($name, $value, $id, $length, $size)  //textbox
      {                                                                    
          $str = "<input type='text' name='".$name."' id='".$id."' value='".$value."' onkeypress = 'TextValidate(this, event)' onblur='this.value = trim(this.value);' maxlength='".$length."' size='".$size."' class='formfield'>";
          echo $str;
      }
      public static function AddPostCodebox($name, $value, $length, $size)  //textbox
      {                                                                    
          $str = "<input type='text' name='".$name."' id='".$name."' value='".$value."' onkeypress = 'test(this, event)' onBlur='sprawdz_kod(this)' maxlength='".$length."' size='".$size."' class='formfield'>";
          echo $str;
      }
      public static function AddAnkietaPostCodebox($name, $value, $length, $size, $validation, $css, $hint)  //textbox
      {                                                                    
          $str = "<input type='text' name='".$name."' id='".$name."' value='".$value."' onkeypress = 'test(this, event)' onBlur='sprawdz_kod(this)' title='Kod pocztowy w formacie xx-xxx.' maxlength='".$length."' size='".$size."' class='".$css."' onmouseover='showHint(\"".$hint."\");' onmouseout='showHint(\"\");' ".$validation.">";
          echo $str;
      }
      public static function AddNumberbox($name, $id, $value, $length, $size, $onblurvalidation)  //nuber designed textbox
      {                                                                    
          $str = "<input type='text' name='".$name."' id='".$id."' value='".$value."' onkeypress = 'OnlyNumber(this, event)' onBlur='".$onblurvalidation."' maxlength='".$length."' size='".$size."' class='formfield'>";
          echo $str;
      }
      public static function AddAnkietaNumberbox($name, $id, $value, $length, $size, $onblurvalidation, $validation, $css, $hint)  //nuber designed textbox
      {                                                                    
          $str = "<input type='text' name='".$name."' id='".$id."' value='".$value."' onkeypress = 'OnlyNumber(this, event)' onBlur='".$onblurvalidation."' maxlength='".$length."' size='".$size."' class='".$css."' onmouseover='showHint(\"".$hint."\");' ".$validation." onmouseout='showHint(\"\");'>";
          echo $str;
      }
      public static function AddTelSNumberbox($name, $value, $length, $onchangevalidation, $onblurvalidation)  //nuber designed textbox
      {                                                                    
          $str = "<input type='text' name='".$name."' id='".$name."' value='".$value."' onkeypress = 'OnlyNumber(this, event)' onChange='".$onchangevalidation."' onBlur='".$onblurvalidation."' maxlength='".$length."' class='formfield'>";
          echo $str;
      }
      public static function AddCheckbox($name, $id, $checked, $specific)  //nuber designed textbox
      {                                                             
          $str = "<input type='checkbox' name='".$name."' id='".$id."' onmouseup='blur();' class='formfield' $checked $specific>";
          echo $str;
      }
      public static function DodajPopUp ($popupname, $src, $width, $height, $x_loc, $y_loc)
      {
          $str = '<div style="position: absolute; width: '.$width.'px; height: '.$height.'px; top: '.$y_loc.'px; left: '.$x_loc.'px;" id="'.$popupname.'" name="'.$popupname.'">
          <iframe width="'.$width.'" height="'.$height.'" frameborder="0" src="'.$src.'"></iframe>
          </div>';
          //document.body.removeChild(document.getElementById('layer'));
          echo $str;
      }
      /*public static function AddPopUpButton($value, $name, $openSite, $width, $height)
      {
          $str = "<input type=\"button\" value=\"".$value."\" name=\"".$name."\"
          class=\"rightSidePopUps\" onClick = \"window.open('".$openSite."', '".$value."','toolbar=no, scrollbars=yes, width=".$width.",height=".$height."')\"/>";
          echo $str;  
      }
      public static function AddSubmit($name, $id, $value, $specific)
      {
          $str = "<input type='submit' name='".$name."' id='".$id."' value='".$value."' class=\"formreset\" ".$specific."/>";
          echo $str;
      }*/
      public static function AddSubmitOwnCss($name, $id, $value, $specific, $class)
      {
          $str = "<input type='submit' name='".$name."' id='".$id."' value='".$value."' class=\"".$class."\" ".$specific."/>";
          echo $str;
      }
      public static function AddTableSubmit($name, $id, $value, $specific)
      {
          $str = "<input type='submit' name='".$name."' id='".$id."' value='".$value."' class='tableSubmits' ".$specific."/>";
          echo $str;
      }
      public static function AddSubmitStiffWidth($name, $id, $value, $specific)
      {
          $str = "<input type='submit' name='".$name."' id='".$id."' value='".$value."' class=\"leftSideButtons\" ".$specific."/>";
          echo $str;
      }
      public static function AddHiddenTableConfig($idTab, $nameTab)
      {
          echo '<input type="hidden" name="id" value="'.$idTab.'"><input type="hidden" name="name" value="'.$nameTab.'">';
      }
      public static function AddTextArea ($name, $cols, $rows,$value)
      {
          echo '<textarea name="'.$name.'" rows="'.$rows.'" cols="'.$cols.'">'.$value.'</textarea>';
      }
      public static function AddHiddenCtrlConfig($nameTab, $nameHid, $nameTxt, $valTab, $valHid, $valTxt)
      {
          echo '<input type="hidden" name="'.$nameTab.'" value="'.$valTab.'">
          <input type="hidden" name="'.$nameHid.'" value="'.$valHid.'">
          <input type="hidden" name="'.$nameTxt.'" value="'.$valTxt.'">';
      }
      public static function OccGroupControlAnkieta ($ButValue, $ButName, $TxtName, $TxtID, $TxtValue, $HidName, $HidID, $HidValue, $ScrUrl, $WindowName)
      {
          $str = "<input type='text' name='".$TxtName."' id='".$TxtID."' value='".$TxtValue."' size='30' class='required' onchange = 'checkName(); checkAll();' READONLY>
          <input type='hidden' name='".$HidName."' id='".$HidID."' value='".$HidValue."'>
	      <input type=\"button\" value='".$ButValue."' name='".$ButName."' onblur = 'checkName(); checkAll();' onmouseover='showHint(\"<i>Naci¶nij, by okre¶liæ swoj± przynale¿no¶æ<br> do grupy zawodowej.</i>\");' 
	      onmouseout='showHint(\"\");'
	      onClick = \"window.open('".$ScrUrl."', '".$WindowName."','toolbar=no, scrollbars=yes, width=750,height=650')\">";
          
          echo $str;
      }
      //jesli juz to wsadzic to od razu z kazdym selectem, jak rowniez onkeyup
      public static function AddSelectHelpHidden()
      {
          $str = '<input type="hidden" id="ukryty_js">
            <input type = "hidden" id = "t" />
            <input type = "hidden" id = "pole" />';
          echo $str;
      }
      public static function AddSelect ($name, $id, $specific, $result, $selectedValue, $hiddenId, $itemName, $itemId, $onblur)
      {
          $str = "<select name=".$name." id=".$id." onkeyup=\"klawisz(this);\" onBlur = \"wyczysc();setHiddenFromSelect(this, '".$hiddenId."');".$onblur."\" class=\"formfield\" ".$specific.">";
          
          $str .= valControl::fillselect($result, $selectedValue, $itemName, $itemId, $resId);
          $str .= "</select><input type='hidden' id='".$hiddenId."' name='".$hiddenId."' value='".$resId."'>";
          echo $str; 
      }
      public static function AddSelectSelValById ($name, $id, $specific, $result, $selectedId, $hiddenId, $itemName, $itemId, $onblur)
      {
          $str = "<select name=".$name." id=".$id." onkeyup=\"klawisz(this);\" onBlur = \"wyczysc();setHiddenFromSelect(this, '".$hiddenId."');".$onblur."\" class=\"formfield\" ".$specific.">";
          
          $str .= valControl::fillselectById($result, $selectedId, $itemName, $itemId);
          $str .= "</select><input type='hidden' id='".$hiddenId."' name='".$hiddenId."' value='".$selectedId."'>";
          echo $str; 
      }
      public static function DodajPlikWysylka ($name, $id, $specific)
      {
          echo '<input type="file" name="'.$name.'" id="'.$id.'" class="formfield" '.$specific.'/>';
      }
      //function generates option tags for select html control with definitions of id, name and selected option
      //in this specific case we may not know what the selected value is going to be, thus we have to make code tell
      //us which option by default is selected in the combo we have
      protected static function fillselect ($result, $selectedValue, $name, $id, &$IdForHidden)
      {
          //name can also be defined in option, it is visible in js
          //inner html for option shows it's inside content, value does't have to be defined
          $str = "";
          $i = 0;
          //$firstId;
          while (isset($result[$i]))
          {
              $row = $result[$i];
                if ($str == "")//if no default value is expected, the first is default
                {          
                    $firstId = $row[$id]; //remember the first id
                }
                if($row[$name] == $selectedValue)                //if the selected value is known and expected
                {
                    $str .= "<option id='".$row[$id]."' value='".$row[$name]."' selected>".$row[$name]."";
                    $IdForHidden = $row[$id]; //we remember it to pass it to hidden
                }
                else
                { //by default we add option which are not selected, but required
                //sometimes one of the options may eventually become selected
                    $str .= "<option id='".$row[$id]."' value='".$row[$name]."'>".$row[$name]."";
                }
                $i++;
          }
          //if we haven't chosen any id it means no selected value was expected
          if (!isset($IdForHidden))
          {
              $IdForHidden = $firstId; //first option is then recognised as selected
          }
          return $str;
      }
      //here the id we want to have selected is known
      //it may happen the id is not present in combo
      //in such a case the id is going to be from the database until there is a blur on select control
      protected static function fillselectById ($result, $selectedId, $name, $id)
      {
          //name can also be defined in option, it is visible in js
          //inner html for option shows it's inside content, value does't have to be defined
          $str = "";  
          $i = 0;
          while (isset($result[$i]))
          {
              $row = $result[$i];
                if($row[$id] == $selectedId)
                {
                    $str .= "<option id='".$row[$id]."' value='".$row[$name]."' selected>".$row[$name]."";
                }
                else
                {
                    $str .= "<option id='".$row[$id]."' value='".$row[$name]."'>".$row[$name]."";
                }
                $i++;
          }
          return $str;
      }
  }
?>
