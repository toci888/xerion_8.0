<?php
    abstract class ArchiwizacjaPortal
    {
        protected $sciezka_zapis = '/home/bartek/zeus_dysk1/archiwa_portale/';
        protected $portal_nazwa = '';
        
        /**
        * @desc Metoda do przeci¹¿enia w klasach dziedzicz¹cych zapisuj¹ca (poprzez przeniesienie) plik archiwum lub xml (np dla gratki) stanowi¹cy historiê wysy³ek. 
        * Jest to rozumiane jako dowód na to, ¿e cos zosta³o wys³ane lub te¿ nie :). Cia³o metody jest nieznane na tym poziomie ze wzglêdu na ró¿ne nazwy plików lub nawet rózne sposoby exportu.
        */
        protected abstract function Archiwizuj(); 
        /**
        * @desc Metoda do przeci¹¿enia w klasach dziedzicz¹cych usuwajaca powstale poboczne zbedne pliki xml, czasem xml bez rozszerzenia ...
        */
        protected abstract function UsunPliki(); 
    }
?>