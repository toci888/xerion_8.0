<?php
    $path = str_replace($_SERVER['PHP_SELF'], '', $_SERVER['SCRIPT_FILENAME']).'/';
    
    include_once ($path.'bll/jezykibll.php');
    include_once ($path.'bll/cache.php');
    include_once ($path.'dal/queriesDAL.php');

  class KontrolkiHtml 
  {
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
      public static function DodajSelectDomWartId ($nazwa_ctrl, $id, $wynik, $hiddenId, $id_sel, $onBlur, $specific, $indId = null, $indTxt = null)
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
          }
          $str = '<select name="'.$nazwa_ctrl.'" id="'.$id.'"  onBlur = "setHiddenFromSelect(this, \''.$hiddenId.'\'); '.$onBlur.'" class="formfield" '.$specific.'>';
          $tlumaczenia = cachejezyki::Czytaj();
          
          if(is_array($wynik))
          foreach ($wynik as $wiersz)
          {
              $dana = $tlumaczenia->Tlumacz($_SESSION['wyb_jezyk'], $wiersz[$nazwa]);
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
          $str .= '</select><input type="hidden" id="'.$hiddenId.'" name="'.$hiddenId.'" value="'.$id_sel.'" />';
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
      public static function DodajPrzeszukiwanieKontrolka($PrzyciskNapis, $PrzyciskNazwa, $TxtID, $TxtValue, $HiddenID, $HiddenValue, $StronaOdp, $NazwaOkno)
      {
          $str = '<input class="przezrocze" type="text" name="'.$TxtID.'" id="'.$TxtID.'" value="'.$TxtValue.'" size="20" READONLY>
          <input type="hidden" name="'.$HiddenID.'" id="'.$HiddenID.'" value="'.$HiddenValue.'">
          <input type="button" value="'.$PrzyciskNapis.'" name="'.$PrzyciskNazwa.'" class="przycisksubmit" onClick = "window.open(\''.$StronaOdp.'\', \''.$NazwaOkno.'\',\'toolbar=no, scrollbars=yes, width=750,height=650\');">';
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
      public static function DodajHidden($id,$name,$value)
      {
          $str="<input type='hidden' id='".$id."' name='".$name."' value='".$value."' />";
          echo $str;
      }
      public static function DodajCheckbox($nazwa, $id, $zaznaczony, $komentarz, $specific)  //nuber designed textbox
      {
          $checked = '';
          if($zaznaczony)                                                             
          {
              $checked = 'checked';
          }
          $str = '<input type="checkbox" name="'.$nazwa.'" id="'.$id.'" onmouseup="blur();" class="formfield" '.$checked.' '.$specific.'>&nbsp;'.$komentarz;
          echo $str;
      }
      //dodanie n radio boxow opatrzonych komentarzem z arraya, ktorego ilosc elementow = ilosci podanych oczekiwanych radiow :P; id tez w arrayu
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
      }
      public static function DodajTextbox($name, $id, $value, $length, $size, $validation)  //Capital letter textbox
      {                                                                    
          $str = '<input class="przezrocze" type="text" name="'.$name.'" id="'.$id.'" value="'.$value.'" class="formfield" maxlength="'.$length.'" size="'.$size.'" onblur="this.value = trim(this.value);" '.$validation.'>';
          echo $str;
      }
      public static function DodajTextArea($name, $id, $value, $kolumn, $wiersze, $wrap)
      {
          $str = '<textarea class="przezrocze" name="'.$name.'" id="'.$id.'" cols="'.$kolumn.'" rows="'.$wiersze.'" wrap="'.$wrap.'" >'.$value.'</textarea>';
          echo $str;   
      }
      public static function DodajTextboxData($nazwa, $id, $value, $length, $size, $info_zla_data, $onblur, $specific)  //date designed textbox
      {                                                                    
          $str = '<input class="przezrocze" type="text" name="'.$nazwa.'" id="'.$id.'" value="'.$value.'" onkeypress = "return WalidacjaData(this, event);" onblur = "SprawdzDlugoscData(this, \''.$info_zla_data.'\'); '.$onblur.'"  maxlength="'.$length.'" size="'.$size.'" class="formfield" '.$specific.'>';
          echo $str;
      }
      //onkeyup = 'DateKeyUp(this)'  - po co to ??
      public static function DodajTextboxDataPrzyszlosc($nazwa, $id, $value, $length, $size, $info_zla_data, $monit, $onblur, $specific)  //date designed textbox
      {                                                                    
          $str = '<input class="przezrocze" type="text" name="'.$nazwa.'" id="'.$id.'" value="'.$value.'" onkeypress = "return WalidacjaData(this, event);" onblur = "SprawdzDlugoscData(this, \''.$info_zla_data.'\'); DataPrzyszlosc(this, \''.$monit.'\'); '.$onblur.'"  maxlength="'.$length.'" size="'.$size.'" class="formfield" '.$specific.'>';
          echo $str;
      }
      public static function DodajLiczbaCalkowitaTextbox($name, $id, $value, $length, $size, $specific)  //nuber designed textbox
      {                                                                    
          $str = '<input class="przezrocze" type="text" name="'.$name.'" id="'.$id.'" value="'.$value.'" onkeypress = "return WalidacjaLiczbaCalkowita(this, event);" maxlength="'.$length.'" size="'.$size.'" class="formfield" '.$specific.'>';
          echo $str;
      }
      public static function DodajLiczbaWymiernaTextbox($name, $id, $value, $length, $size, $specific)  //nuber designed textbox
      {                                                                    
          $str = '<input class="przezrocze" type="text" name="'.$name.'" id="'.$id.'" value="'.$value.'" onkeypress = "return WalidacjaLiczbaWymierna(this, event);" maxlength="'.$length.'" size="'.$size.'" class="formfield" '.$specific.'>';
          echo $str;
      }
      public static function DodajKodPocztowyTextbox($name, $id, $value, $length, $size, $onblur, $specific)  //nuber designed textbox
      {                                                                    
          $str = '<input class="przezrocze" type="text" name="'.$name.'" id="'.$id.'" value="'.$value.'" onblur = "'.$onblur.'" onkeypress = "return WalidacjaKodPocztowy(this, event);" maxlength="'.$length.'" size="'.$size.'" class="formfield" '.$specific.'>';
          echo $str;
      }
      public static function DodajKomorkaTextbox($name, $id, $value, $length, $size, $onblur, $validation)  //Capital letter textbox
      {                                                                    
          $str = '<input class="przezrocze" type="text" name="'.$name.'" id="'.$id.'" value="'.$value.'" class="formfield" onkeypress = "return WalidacjaLiczbaCalkowita(this, event);" maxlength="'.$length.'" size="'.$size.'" onblur="this.value = trim(this.value);'.$onblur.'" '.$validation.'>';
          echo $str;
      }
      public static function DodajTelefonTextbox($name, $id, $value, $length, $size, $onblur, $validation)  //Capital letter textbox
      {                                                                    
          $str = '<input class="przezrocze" type="text" name="'.$name.'" id="'.$id.'" value="'.$value.'" class="formfield" onkeypress = "return WalidacjaLiczbaCalkowita(this, event);" maxlength="'.$length.'" size="'.$size.'" onblur="this.value = trim(this.value);'.$onblur.'" '.$validation.'>';
          echo $str;
      }
      public static function DodajEmailTextbox($name, $id, $value, $length, $size, $onblur, $validation)  //Capital letter textbox
      {                                                                    
          $str = '<input class="przezrocze" type="text" name="'.$name.'" id="'.$id.'" value="'.$value.'" class="formfield" maxlength="'.$length.'" size="'.$size.'" onblur="this.value = trim(this.value);'.$onblur.'" '.$validation.'>';
          echo $str;
      }
      public static function DodajPopUpButton($value, $name, $openSite, $width, $height)
      {
          $str = '<input type="button" value="'.$value.'" name="'.$name.'"
          class="przycisksubmit" onClick = "this.disabled = true; window.open(\''.$openSite.'\', \''.$name.'\',\'toolbar=no, scrollbars=yes, width='.$width.',height='.$height.'\'); this.disabled = false;"/>';
          echo $str;  
      }
      public static function AddPassbox($name, $id, $value, $length, $size, $validation)  //Capital letter textbox
      {                                                                    
          $str = "<input type='password' name='".$name."' id='".$id."' value='".$value."' class='formfield' maxlength='".$length."' size='".$size."' onblur='this.value = trim(this.value);' ".$validation.">";
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
      ///PONIZSZE KODY POWINNYW  WCALOSCI OKAZAC SIE ZBEDNE :p
      /*public static function DodajSelectRegGeog ($nazwa, $id, $id_parent, $hiddenId, $id_sel, $onBlur)
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
          $str = '<select name="'.$nazwa.'" id="'.$id.'" onBlur = "setHiddenFromSelect(this, \''.$hiddenId.'\'); '.$onBlur.'" class="formfield" >';
          //onBlur = "setHiddenFromSelect(this, \''.$hiddenId.'\'); '.$onBlur.'"
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
              
          }
          $str .= '</select><input type="hidden" id="'.$hiddenId.'" name="'.$hiddenId.'" value="'.$id_sel.'" />';
          //echo $str;
          return $str;
      }*/
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
