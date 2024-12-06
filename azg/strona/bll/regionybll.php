<?php
    $path = str_replace($_SERVER['PHP_SELF'], '', $_SERVER['SCRIPT_FILENAME']).'/';
    
    include_once ($path.'dal/queriesDAL.php');

    class RegionyBLL
    {
        protected $dane;
        //powielenie idei jezykow: jesli ten obiekt jest powolywany nie ma cache, inaczej dane wyczytywane z cache
        
       public function RegionyBLL($id_region, $nazwa)
       {
           //1 wywolanie od 1, pobierane wojewodztw w polsce :)
           $this->PobierzInformacje($id_region, $this->dane);
           $this->GenerujJS($id_region, $nazwa);
       }
       //rekurencja
       protected function PobierzInformacje($id_parent, &$element_w_tab)
       {
           $wynik = SlownikDAL::PobierzRegionGeog($id_parent);
           
           if (is_array($wynik))
           foreach ($wynik as $wiersz)
           {
               $element_w_tab[$wiersz[NieruchomoscDAL::$id]] = array();
               $element_w_tab[$wiersz[NieruchomoscDAL::$id]] = $wiersz;
               if ($wiersz[SlownikDAL::$ma_dzieci])
               {
                   $element_w_tab[$wiersz[NieruchomoscDAL::$id]][SlownikDAL::$ma_dzieci] = array();
                    $this->PobierzInformacje($wiersz[NieruchomoscDAL::$id], $element_w_tab[$wiersz[NieruchomoscDAL::$id]][SlownikDAL::$ma_dzieci]);
               }
           }
       }
       /*public function PodajRegiony()
       {
           return $this->dane;
       } */
       protected function GenerujJS($id_region, $nazwa)
       {
           $nazwa_plik = str_replace($_SERVER['PHP_SELF'], '', $_SERVER['SCRIPT_FILENAME']).'/kod_drzewo/'.$id_region;
           $handle = fopen($nazwa_plik, 'w');
           //d.add(1,-1,\'dsfq\');
           fputs($handle, 'd.add('.$id_region.', -1, \''.$nazwa.'\');'."\n");
           
           $this->BudujPlik($handle, $this->dane, $id_region);           
       }
       protected function BudujPlik($handle, $dane, $id_parent)
       {
           //    id, parent, text over, link, alt, ?, ?, customgif  
           //d.add(9,0,'My Pictures','example01.html','Pictures I\'ve taken over the years','','','img/imgfolder.gif');
           foreach ($dane as $wiersz)
           {
               //javascript:parent.document.getElementById(\\\'id_wybrana_msc_fr\\\').value = '.$wiersz[NieruchomoscDAL::$id].';
               $url = '';
               if (!is_array($wiersz[SlownikDAL::$ma_dzieci]))
                    $url = 'region_drzewo.php?id_miejscowosc='.$wiersz[NieruchomoscDAL::$id].'&nazwa='.$wiersz[NieruchomoscDAL::$nazwa];
               fputs($handle, 'd.add('.$wiersz[NieruchomoscDAL::$id].', '.$id_parent.', \''.$wiersz[NieruchomoscDAL::$nazwa].'\', \''.$url.'\');'."\n");
               
               if (is_array($wiersz[SlownikDAL::$ma_dzieci]))
               if (count($wiersz[SlownikDAL::$ma_dzieci]) > 0)
               {
                   $this->BudujPlik($handle, $wiersz[SlownikDAL::$ma_dzieci], $wiersz[NieruchomoscDAL::$id]);
               }
           }
       }
    }
?>