<?
    
    include_once ('dal/stronaDAL.php');
    include_once ('bll/tags.php');
    require('conf.php');
    //session_start();
    //$_SESSION[$jezyk] = 1;
    //$refactor = array('sprzedazm' => 'mieszkania_sprzedaz', 'sprzedazd' => 'domy_sprzedaz', 'sprzedazl' => 'lokale_sprzedaz', 'sprzedazo' => 'obiekty_sprzedaz', 'sprzedazdz' => 'dzialki_sprzedaz', 'sprzedazte' => 'tereny_sprzedaz');
    
if (!isset($_GET['action']) && !isset($_GET[tags::$oferta]) && !isset($_GET['filtruj'])) 
{
    $_GET['action'] = 'sprzedazm';
}
else
{
    if (isset($_GET[tags::$oferta]) || isset($_GET['filtruj']))
    $_GET['action'] = null; //wywalenie notice
    else if ($_GET['action'] == null)
    $_GET['action'] = 'sprzedazm';
}

/*if (isset($_GET['action']))
{
    if (isset($refactor[$_GET['action']]))
    {
        $_GET['action'] = $refactor[$_GET['action']];
    }
} */

if ($_GET['action'] == 'szukka') 
{
    include "szukka.inc"; 
}

if ($_GET['action'] == 'kalku') 
{
    include "info/kalkulator.inc";
}

if ($_GET['action'] == 'kredyty') 
{
    include "info/kredyty.inc"; 
}

if ($_GET['action'] == 'firma') 
{
    include "info/firma.inc"; 
}

if ($_GET['action'] == 'kontakt') 
{
    include "info/kontakt.inc"; 
}

if ($_GET['action'] == 'certy') {

 include "info/certy.inc"; 

}
if ($_GET['action'] == 'oblicz') {

 include "info/kalkulator.inc"; 

}

if ($_GET['action'] == 'info') {

 include "info/info.inc"; 

}

if ($_GET['action'] == 'formy') {

 include "info/formy.inc"; 

}

if (isset($_GET[tags::$oferta]))
{
    //tu dodac sprawdzenie, czy ta oferte mozna pokazac :P
    //jak nie moze wrzucic wszystkie mieszkania domy etc
    $adres = $_SERVER['REMOTE_ADDR'];
    $el_adr_ip = explode('.', $adres);
    if ($el_adr_ip[0] == 10 && $el_adr_ip[1] == 0)
    {
        require 'center_more.php';
    }
    else
    {
        //test czy of akt
        $dal = new StronaPodsInfoDAL();
        $wynik = $dal->PodajTransIdNierIdOfertaAkt($_GET[tags::$oferta]);
        if (is_array($wynik))
        {
            require 'center_more.php';
        }
        else
        {
            //$_GET[StronaPodsInfoDAL::$id_trans_rodzaj] = 1;
            //$_GET[StronaPodsInfoDAL::$id_nier_rodzaj] = 2;
            $_GET[$oferta_hidden] = tags::$oferta;
            require 'center.php';
        }
    }
}

if (isset($_GET['filtruj']))
{
    require('center.php');
}

if ($_GET['action'] == 'sprzedazm') 
{
    $_GET[StronaPodsInfoDAL::$id_trans_rodzaj] = 1;
    $_GET[StronaPodsInfoDAL::$id_nier_rodzaj] = 2;
    $_GET[$oferta_hidden] = tags::$oferta;
    require 'center.php';
    //include "sprzedaz/sprzedazm.inc";
}

if ($_GET['action'] == 'sprzedazd') 
{
    $_GET[StronaPodsInfoDAL::$id_trans_rodzaj] = 1;
    $_GET[StronaPodsInfoDAL::$id_nier_rodzaj] = 1;
    $_GET[$oferta_hidden] = tags::$oferta;
    require 'center.php';
    //include "sprzedaz/sprzedazd.inc"; 
}

if ($_GET['action'] == 'sprzedazl') 
{
    $_GET[StronaPodsInfoDAL::$id_trans_rodzaj] = 1;
    $_GET[StronaPodsInfoDAL::$id_nier_rodzaj] = 4;
    $_GET[$oferta_hidden] = tags::$oferta;
    require 'center.php';
}

if ($_GET['action'] == 'sprzedazo') 
{
    $_GET[StronaPodsInfoDAL::$id_trans_rodzaj] = 1;
    $_GET[StronaPodsInfoDAL::$id_nier_rodzaj] = 3;
    $_GET[$oferta_hidden] = tags::$oferta;
    require 'center.php';
}

if ($_GET['action'] == 'sprzedazdz') 
{
    $_GET[StronaPodsInfoDAL::$id_trans_rodzaj] = 1;
    $_GET[StronaPodsInfoDAL::$id_nier_rodzaj] = 6;
    $_GET[$oferta_hidden] = tags::$oferta;
    require 'center.php';
}

if ($_GET['action'] == 'sprzedazte') 
{
    $_GET[StronaPodsInfoDAL::$id_trans_rodzaj] = 1;
    $_GET[StronaPodsInfoDAL::$id_nier_rodzaj] = 5;
    $_GET[$oferta_hidden] = tags::$oferta;
    require 'center.php';
}

if ($_GET['action'] == 'wynajemm') 
{   
    $_GET[StronaPodsInfoDAL::$id_trans_rodzaj] = 2;
    $_GET[StronaPodsInfoDAL::$id_nier_rodzaj] = 2;
    $_GET[$oferta_hidden] = tags::$oferta;
    require 'center.php';
 //include "wynajem/wynajemm.inc"; 
}

if ($_GET['action'] == 'wynajemd') 
{
    $_GET[StronaPodsInfoDAL::$id_trans_rodzaj] = 2;
    $_GET[StronaPodsInfoDAL::$id_nier_rodzaj] = 1;
    $_GET[$oferta_hidden] = tags::$oferta;
    require('center.php');
    //include "wynajem/wynajemd.inc"; 
}

if ($_GET['action'] == 'wynajeml') 
{
    $_GET[StronaPodsInfoDAL::$id_trans_rodzaj] = 2;
    $_GET[StronaPodsInfoDAL::$id_nier_rodzaj] = 4;
    $_GET[$oferta_hidden] = tags::$oferta;
    require('center.php');
}

if ($_GET['action'] == 'wynajemo') 
{
    $_GET[StronaPodsInfoDAL::$id_trans_rodzaj] = 2;
    $_GET[StronaPodsInfoDAL::$id_nier_rodzaj] = 3;
    $_GET[$oferta_hidden] = tags::$oferta;
    require('center.php');
}

if ($_GET['action'] == 'wynajemdz') 
{
    $_GET[StronaPodsInfoDAL::$id_trans_rodzaj] = 2;
    $_GET[StronaPodsInfoDAL::$id_nier_rodzaj] = 6;
    $_GET[$oferta_hidden] = tags::$oferta;
    require('center.php');
}

if ($_GET['action'] == 'wynajemte') 
{
    $_GET[StronaPodsInfoDAL::$id_trans_rodzaj] = 2;
    $_GET[StronaPodsInfoDAL::$id_nier_rodzaj] = 5;
    $_GET[$oferta_hidden] = tags::$oferta;
    require('center.php');
}

if ($_GET['action'] == 'usunbiurolista')
{
    require('niezgoda.php');
}

if ($_GET['action'] == 'zamianam') 
{
    $_GET[StronaPodsInfoDAL::$id_trans_rodzaj] = 3;
    $_GET[StronaPodsInfoDAL::$id_nier_rodzaj] = 2;
    $_GET[$oferta_hidden] = tags::$oferta;
    require('center.php');
}
if ($_GET['action'] == 'zamianamzd') 
{
    $_GET[StronaPodsInfoDAL::$id_trans_rodzaj] = 3;
    $_GET[StronaPodsInfoDAL::$id_nier_rodzaj] = 2;
    $_GET[$oferta_hidden] = tags::$oferta;
    require('center.php'); 
}

if ($_GET['action'] == 'zamianad') 
{
    $_GET[StronaPodsInfoDAL::$id_trans_rodzaj] = 3;
    $_GET[StronaPodsInfoDAL::$id_nier_rodzaj] = 1;
    $_GET[$oferta_hidden] = tags::$oferta;
    require('center.php');
}
if ($_GET['action'] == 'zamianadzd') 
{
    $_GET[StronaPodsInfoDAL::$id_trans_rodzaj] = 3;
    $_GET[StronaPodsInfoDAL::$id_nier_rodzaj] = 1;
    $_GET[$oferta_hidden] = tags::$oferta;
    require('center.php');
}

if ($_GET['action'] == 'kupnom') {

 include "kupno/kupnom.inc"; 

}
if ($_GET['action'] == 'kupnomzd') {

 include "kupno/kupnom.inc"; 

}

if ($_GET['action'] == 'kupnomt') {

 include "kupno/kupnom.inc"; 

}


if ($_GET['action'] == 'kupnod') {

 include "kupno/kupnod.inc"; 

}
if ($_GET['action'] == 'kupnodzd') {

 include "kupno/kupnod.inc"; 

}

if ($_GET['action'] == 'kupnodt') {

 include "kupno/kupnod.inc"; 

}

if ($_GET['action'] == 'kupnol') {

 include "kupno/kupnol.inc"; 

}
if ($_GET['action'] == 'kupnolzd') {

 include "kupno/kupnol.inc"; 

}


if ($_GET['action'] == 'kupnoo') {

 include "kupno/kupnoo.inc"; 

}
if ($_GET['action'] == 'kupnoozd') {

 include "kupno/kupnoo.inc"; 

}

if ($_GET['action'] == 'kupnodz') {

 include "kupno/kupnodz.inc"; 

}
if ($_GET['action'] == 'kupnodzzd') {

 include "kupno/kupnodz.inc"; 

}

if ($_GET['action'] == 'kupnote') {

 include "kupno/kupnote.inc"; 

}
if ($_GET['action'] == 'kupnotezd') {

 include "kupno/kupnote.inc"; 

}

if ($_GET['action'] == 'dodajsub') {

 include "sub/sub.inc"; 

}

if ($_GET['action'] == 'wprowadzsub') {

 include "sub/sub.inc"; 

}

if ($_GET['action'] == 'dodajform') {

 include "form.inc"; 

}

if ($_GET['action'] == 'emailform') {

 include "form.inc"; 

}

?>