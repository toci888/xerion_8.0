<HTML>
<HEAD>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <script language="javascript" src="../../js/script.js"></script>
<link href="../../css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<?php
    // ¶ ±
    session_start();
    include_once ('../../dal/queriesDAL.php');
    include_once ('../../dal/admDAL.php');
    include_once ('../../ui/kontrolki_html.php');
    include_once ('../../ui/utilsui.php'); 
    include_once ('../../bll/parametrynierbll.php');
    include_once ('../../bll/tags.php'); 
    include_once ('../../bll/agentbll.php');
    include_once ('../../bll/jezykibll.php');
    include_once ('../../bll/cache.php');
    include_once ('../../bll/transnierbll.php');
    require('../../naglowek.php');
    require('../../conf.php');
    
    if (!isset($_SESSION[$zalogowany]))
    {
        echo 'Nie jesteÅ› zalogowany.';
    }
    else
    {
        $tlumaczenia = cachejezyki::Czytaj();
        $agent_zal = unserialize($_SESSION[$dane_agent]);
        $dal = new TransakcjaDAL();
        
        $sciezka_doc = '/var/www/html/dokumenty/';
        $id_lista_wsk_adr = null;
        
        if (isset($_POST['lista_wsk_adr_id']))
        {
            $id_lista_wsk_adr = $_POST['lista_wsk_adr_id'];
        }
        if (isset($_POST[AdministracjaDAL::$id_lista_wsk_adr]))
        {
            $id_lista_wsk_adr = $_POST[AdministracjaDAL::$id_lista_wsk_adr];
        }
        
        if (isset($_POST['pobierz_plik_umowa']))
        {
            //kopiowanie
            copy($sciezka_doc.$_POST[AdministracjaDAL::$plik_umowa], '/var/www/html/form/20826819244b2630f79f0685624c6a27/'.$_POST[NieruchomoscDAL::$id_oferta].$_POST[AdministracjaDAL::$id_lista_wsk_adr].'.doc');
            //header
            header('Location: http://'.$_SERVER['SERVER_NAME'].'/20826819244b2630f79f0685624c6a27/'.$_POST[NieruchomoscDAL::$id_oferta].$_POST[AdministracjaDAL::$id_lista_wsk_adr].'.doc');
            //aktualizuj plik kasuje, jak nie i tak bedzie kasowane
        }
        if (isset($_POST['dodaj_notatka']))
        {
            $tabParametr[AdministracjaDAL::$id_transakcja] = $_POST[AdministracjaDAL::$id_transakcja];
            $tabParametr[AdministracjaDAL::$id_agent] = $agent_zal->id;
            
            $wynik = $dal->DodajNotatkaTransakcja();
        }
        if(isset($_POST['aktualizuj']))
        {
            if (is_file('/var/www/html/form/20826819244b2630f79f0685624c6a27/'.$_POST[NieruchomoscDAL::$id_oferta].$_POST[AdministracjaDAL::$id_lista_wsk_adr].'.doc'))
            {
                unlink('/var/www/html/form/20826819244b2630f79f0685624c6a27/'.$_POST[NieruchomoscDAL::$id_oferta].$_POST[AdministracjaDAL::$id_lista_wsk_adr].'.doc');
            }
            $tabParametr[AdministracjaDAL::$id_lista_wsk_adr] = $id_lista_wsk_adr;
            $tabParametr[AdministracjaDAL::$data_umowa_przed] = '2222-12-12';//bez sensu, parametr nie bierze udzialu
            $tabParametr[AdministracjaDAL::$cena] = '';
            $tabParametr[AdministracjaDAL::$kwota] = $_POST['kredyt'];
            $tabParametr[AdministracjaDAL::$termin_notar] = $_POST['termin_um_notar'];
            $tabParametr[AdministracjaDAL::$zdanie_nier] = $_POST['data_zdania'];
            $tabParametr[AdministracjaDAL::$plik_umowa] = $_POST[AdministracjaDAL::$plik_umowa];
            if ($_POST['bank_id'] > 0)
            {
                $tabParametr[AdministracjaDAL::$id_bank] = $_POST['bank_id'];
            }
            $wynik = $dal->DodajTransakcja($tabParametr);
            if ($wynik)
            {
                echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_powiodla_sie);
            }
            else
            {
                echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_nie_powiodla_sie);
            }
        }
        if(isset($_POST['zatwierdz']))
        {
            $tab_plik = explode('.', $_FILES['umowa_plik']['name']);
            $rozszerzenie = strtolower($tab_plik[count($tab_plik) - 1]);
            $nazwa_plik = md5($_POST[NieruchomoscDAL::$id_oferta]);
            
            if (move_uploaded_file($_FILES['umowa_plik']['tmp_name'], $sciezka_doc.$nazwa_plik.'.'.$rozszerzenie))
            {
                //jesli operacja kopiowania pliku sie powiodla insert do bazy
                $tabParametr[AdministracjaDAL::$id_lista_wsk_adr] = $id_lista_wsk_adr;
                $tabParametr[AdministracjaDAL::$data_umowa_przed] = $_POST['data_um_przed'];
                $tabParametr[AdministracjaDAL::$cena] = $_POST['cena'];
                $tabParametr[AdministracjaDAL::$kwota] = $_POST['kredyt'];
                $tabParametr[AdministracjaDAL::$termin_notar] = $_POST['termin_um_notar'];
                $tabParametr[AdministracjaDAL::$zdanie_nier] = $_POST['data_zdania'];
                $tabParametr[AdministracjaDAL::$plik_umowa] = $nazwa_plik.'.'.$rozszerzenie;
                
                if ($_POST['bank_id'] > 0)
                {
                    $tabParametr[AdministracjaDAL::$id_bank] = $_POST['bank_id'];
                }
                $wynik = $dal->DodajTransakcja($tabParametr);
                if ($wynik)
                {
                    echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_powiodla_sie);
                }
                else
                {
                    echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_nie_powiodla_sie);
                }
            }
            else
            {
                echo $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$operacja_nie_powiodla_sie);
            }
        }
        //plik jest wywolywany przez lista_wskazan_adresowych_o, _z w chwili obecnej tez jest mozliwe: zlecenie teoretycznie moze kupic wiecej niz jedna oferte
        //weryfkacja zlecenia w zwiazku z tym ma miejsce, kiedy w poscie jest id_zapotrzebowanie
        //sprawdzenie czy jest i ewentualny update; jesli nie ma id zapotrzebowanie to nieistotne jest id lista wsk booo wejscie jest od strony oferty
        if (isset($_POST[NieruchomoscDAL::$id_oferta]))
        {
            $tabParametr[NieruchomoscDAL::$id_oferta] = $_POST[NieruchomoscDAL::$id_oferta];
            $tabParametr[TransakcjaDAL::$id_lista_wsk_adr] = $id_lista_wsk_adr;

            $wynik = $dal->SprawdzCzyOfNieTransakcja($tabParametr);
            //jesli wynik true mozna dodawac nowa transakcje - spoko, jesli false od strony oferty koniec, jesli od strony .... tu wystapil powazny problem, na dobra sprawe trzeba bedzie czesciowo ten bardak rozdzielic
            //niezalezne weryfikacje w roznych plikach atu juz albo update albo dodaj i tyle
            //zalozenie ze mozna dodac nowe

            if ($wynik)
            {
                echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'" name="dodaj_transakcja" enctype="multipart/form-data"><table>';
                KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_oferta, NieruchomoscDAL::$id_oferta, $_POST[NieruchomoscDAL::$id_oferta]);
                KontrolkiHtml::DodajHidden(AdministracjaDAL::$id_lista_wsk_adr, AdministracjaDAL::$id_lista_wsk_adr, $id_lista_wsk_adr);
                echo '<tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$data_umowy_przedwstepnej).': </td><td>';
                KontrolkiHtml::DodajTextboxData('data_um_przed', 'id_data_um_przed', $data_dzienna, 10, 10, $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podana_inf_nie_jest_data), '', '', 'dodaj_transakcja', '../');
                echo '</td><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$cena).': </td><td>';
                KontrolkiHtml::DodajLiczbaWymiernaTextbox('cena', 'id_cena', '', 15, 10, '', true);
                echo '</td><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$bank).': </td><td>';
                KontrolkiHtml::DodajSelectZrodSlownik('bank', 'id_bank', SlownikDAL::$bank, 'bank_id', null, '', '', true);
                echo '</td><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$kwota_kredytu).': </td><td>';
                KontrolkiHtml::DodajLiczbaWymiernaTextbox('kredyt', 'id_kredyt', '', 15, 10, '');
                echo '</td></tr></table><table><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$termin_umowy_notarialnej).': </td><td>';
                KontrolkiHtml::DodajTextboxData('termin_um_notar', 'id_termin_um_notar', null, 10, 10, $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podana_inf_nie_jest_data), '', '', 'dodaj_transakcja', '../', true);
                echo '</td><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$data_zdania).': </td><td>';
                KontrolkiHtml::DodajTextboxData('data_zdania', 'id_data_zdania', null, 10, 10, $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podana_inf_nie_jest_data), '', '', 'dodaj_transakcja', '../', true);
                echo '</td><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$sporzadzony_dokument).': </td><td>';
                KontrolkiHtml::DodajPlikWysylka('umowa_plik', 'id_umowa_plik', '');
                echo '</td></tr><tr><td>';
                $tabPodpowiedzi = 'Array(\''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$data_umowy_przedwstepnej).'\', \''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$cena).'\', \''.
                $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$termin_umowy_notarialnej).'\', \''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$data_zdania).'\', \''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$sporzadzony_dokument).'\')';
                KontrolkiHtml::DodajSubmit('zatwierdz', 'id_zatwierdz', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zatwierdz), 'onclick="return WalidacjaFormularz(Array(data_um_przed, cena, termin_um_notar, data_zdania, umowa_plik), '.
                $tabPodpowiedzi.', \''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$brak).' : \');"');
                echo '</td></tr></table></form>';
            }
            //if powyzszy i ponizszy sie wykluczaja, bo if(null) zwraca false, stad nie ma szans na sytuacje, ze pojda oba ify, bo jesli $wynik bedzie null gorny if nie ruszy
            
            if (is_null($wynik))
            {
                //pobranie danych do update
                //przy danych do update pojawi sie szereg funkcjonalnosci jak notatki itd
                $tabParametr[TransakcjaDAL::$id_lista_wsk_adr] = $id_lista_wsk_adr;
                $wynik = $dal->EdycjaTransakcja($tabParametr);
                echo '<b>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$agent).':</b> '.$wynik[NieruchomoscDAL::$agent].
                ', <b>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$sprzedajacy).':</b> '.$wynik[AdministracjaDAL::$sprzedajacy].', <b>'.
                $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$kupujacy).':</b> '.$wynik[AdministracjaDAL::$kupujacy].'.';
                echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'" name="edytuj_transakcja"><table>';
                KontrolkiHtml::DodajHidden(AdministracjaDAL::$id_lista_wsk_adr, AdministracjaDAL::$id_lista_wsk_adr, $wynik[AdministracjaDAL::$id_lista_wsk_adr]);
                KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_oferta, NieruchomoscDAL::$id_oferta, $_POST[NieruchomoscDAL::$id_oferta]);
                KontrolkiHtml::DodajHidden(AdministracjaDAL::$plik_umowa, AdministracjaDAL::$plik_umowa, $wynik[AdministracjaDAL::$plik_umowa]);
                echo '<tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$data_umowy_przedwstepnej).': </td><td>';
                KontrolkiHtml::DodajTextboxData('data_um_przed', 'id_data_um_przed', $wynik[AdministracjaDAL::$data_umowa_przed], 10, 10, $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podana_inf_nie_jest_data), '', 'disabled="disabled"', 'edytuj_transakcja', '../');
                echo '</td><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$cena).': </td><td>';
                KontrolkiHtml::DodajLiczbaWymiernaTextbox('cena', 'id_cena', $wynik[AdministracjaDAL::$cena], 15, 10, 'disabled="disabled"', true);
                echo '</td><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$bank).': </td><td>';
                if ($wynik[AdministracjaDAL::$id_bank] == '')
                {
                    $wynik[AdministracjaDAL::$id_bank] = '0';
                }
                KontrolkiHtml::DodajSelectZrodSlownik('bank', 'id_bank', SlownikDAL::$bank, 'bank_id', $wynik[AdministracjaDAL::$id_bank], '', '', true);
                echo '</td><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$kwota_kredytu).': </td><td>';
                KontrolkiHtml::DodajLiczbaWymiernaTextbox('kredyt', 'id_kredyt', $wynik[AdministracjaDAL::$kwota], 15, 10, '');
                echo '</td></tr></table><table><tr><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$termin_umowy_notarialnej).': </td><td>';
                KontrolkiHtml::DodajTextboxData('termin_um_notar', 'id_termin_um_notar', $wynik[AdministracjaDAL::$termin_notar], 10, 10, $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podana_inf_nie_jest_data), '', '', 'edytuj_transakcja', '../', true);
                echo '</td><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$data_zdania).': </td><td>';
                KontrolkiHtml::DodajTextboxData('data_zdania', 'id_data_zdania', $wynik[AdministracjaDAL::$zdanie_nier], 10, 10, $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$podana_inf_nie_jest_data), '', '', 'edytuj_transakcja', '../', true);
                echo '</td><td>'.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$sporzadzony_dokument).': </td><td>';
                KontrolkiHtml::DodajSubmit('pobierz_plik_umowa', 'id_pobierz_plik_umowa', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$pobierz_plik), '');
                echo '</td></tr><tr><td>';
                $tabPodpowiedzi = 'Array(\''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$data_umowy_przedwstepnej).'\', \''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$cena).'\', \''.
                $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$termin_umowy_notarialnej).'\', \''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$data_zdania).'\')';
                KontrolkiHtml::DodajSubmit('aktualizuj', 'id_aktualizuj', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zatwierdz), 'onclick="return WalidacjaFormularz(Array(data_um_przed, cena, termin_um_notar, data_zdania), '.
                $tabPodpowiedzi.', \''.$tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$brak).' : \');"');
                echo '</td></tr></table></form>';
                //popup z wnioskami, lub formularz, to samo z notatkami
                
                //dodaj notatke
                echo '<form method="POST" action="'.$_SERVER['PHP_SELF'].'">';
                UtilsUI::IstotneInfo($tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$notatki));
                KontrolkiHtml::DodajHidden(NieruchomoscDAL::$id_oferta, NieruchomoscDAL::$id_oferta, $_POST[NieruchomoscDAL::$id_oferta]);
                KontrolkiHtml::DodajHidden(AdministracjaDAL::$id_lista_wsk_adr, AdministracjaDAL::$id_lista_wsk_adr, $wynik[AdministracjaDAL::$id_lista_wsk_adr]);
                KontrolkiHtml::DodajHidden(AdministracjaDAL::$id_transakcja, AdministracjaDAL::$id_transakcja, $wynik[AdministracjaDAL::$id_transakcja]);
                KontrolkiHtml::DodajTextArea('notatka', 'id_notatka', '', 50, 5, '', '');
                echo '<br />';
                KontrolkiHtml::DodajSubmit('dodaj_notatka', 'id_dodaj_notatka', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$dodaj), '');
                echo '</form>';
            }
        }
        echo '<br />';
        KontrolkiHtml::DodajSubmit('ok', 'id_ok', $tlumaczenia->Tlumacz($_SESSION[$jezyk], tags::$zakoncz), 'onclick="window.close();"');
    }
    
    require('../../stopka.php');
?>
</body>
</html>
