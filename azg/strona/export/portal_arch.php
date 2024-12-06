<?php
    abstract class ArchiwizacjaPortal
    {
        protected $sciezka_zapis = '/home/bartek/zeus_dysk1/archiwa_portale/';
        protected $portal_nazwa = '';
        
        /**
        * @desc Metoda do przeci��enia w klasach dziedzicz�cych zapisuj�ca (poprzez przeniesienie) plik archiwum lub xml (np dla gratki) stanowi�cy histori� wysy�ek. 
        * Jest to rozumiane jako dow�d na to, �e cos zosta�o wys�ane lub te� nie :). Cia�o metody jest nieznane na tym poziomie ze wzgl�du na r�ne nazwy plik�w lub nawet r�zne sposoby exportu.
        */
        protected abstract function Archiwizuj(); 
        /**
        * @desc Metoda do przeci��enia w klasach dziedzicz�cych usuwajaca powstale poboczne zbedne pliki xml, czasem xml bez rozszerzenia ...
        */
        protected abstract function UsunPliki(); 
    }
?>