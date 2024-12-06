<?php
    $path = str_replace($_SERVER['PHP_SELF'], '', $_SERVER['SCRIPT_FILENAME']).'/';
    include_once ($path.'dal/queriesDAL.php');

    class AgentUprawnieniaACD
    {
        public $dodawanie;
        public $edycja;
        public $kasowanie;
        public $druk;
        public $adm_klient;
        public $adm_dane;
        public $zmiana_upr; 
    }
    class AgentDaneACD
    {
        public $id;
        public $id_otodom;
        public $login;
        public $nazwa;
        public $email;
        public $firma;
        public $aktywnosc_konto;
        public $data_wyg_haslo;
        public $wewnetrzny;
        public $rezultat;
        public $nip;
        public $adres;
        //konta + banki ??
        public $bank; //array
        public $konto; //array
    }
    class AgentBLL
    {
        protected $dal;
        protected $uprawnienia;
        protected $dane;
        
        public function AgentBLL()
        {
            $this->dal = new AgentDAL();
        }
        //logowanie agenta, w parametrze referencyjnym zwracamy uprawnienia
        //cala funckja zwraca dane o agencie lub obiekt z info o przyczynie niepowodzenia
        public function Logowanie($tabParam, &$upraw) 
        {
            $wynik = $this->dal->Logowanie($tabParam);
            $this->dane = new AgentDaneACD();
            $upraw = null;
            
            $this->dane->rezultat = $wynik[0][AgentDAL::$rezultat];
            $this->dane->aktywnosc_konto = $wynik[0][AgentDAL::$aktywnosc];
            $this->dane->data_wyg_haslo = $wynik[0][AgentDAL::$il_dni_wyg];
            $this->dane->nazwa = $wynik[0][AgentDAL::$nazwa];
            $this->dane->email = $wynik[0][AgenciDAL::$email];
            $this->dane->id = (int)$wynik[0][AgentDAL::$id_agent];
            
            if ($wynik[0][AgentDAL::$rezultat] == true)
            {
                $this->dane->login = $tabParam[AgentDAL::$login];
                
                $this->dane->id_otodom = (int)$wynik[0][AgentDAL::$id_agent_otodom];
                $this->dane->wewnetrzny = $wynik[0][AgentDAL::$wewnetrzny];
                $this->dane->adres = $wynik[0][AgentDAL::$adres];
                $this->dane->bank = $wynik[0][AgentDAL::$bank];
                $this->dane->konto = $wynik[0][AgentDAL::$nr_konto];
                $this->dane->firma = $wynik[0][AgentDAL::$firma];
                $this->dane->nip = $wynik[0][AgentDAL::$nip];
                
                
                $this->uprawnienia = new AgentUprawnieniaACD();
                $this->uprawnienia->adm_dane = $wynik[0][AgentDAL::$admin_dane];
                $this->uprawnienia->adm_klient = $wynik[0][AgentDAL::$admin_klient];
                $this->uprawnienia->dodawanie = $wynik[0][AgentDAL::$dodawanie];
                $this->uprawnienia->druk = $wynik[0][AgentDAL::$druk];
                $this->uprawnienia->edycja = $wynik[0][AgentDAL::$edycja];
                $this->uprawnienia->kasowanie = $wynik[0][AgentDAL::$kasowanie];
                $this->uprawnienia->zmiana_upr = $wynik[0][AgentDAL::$zmiana_uprawnien];
                
                $upraw = $this->uprawnienia;
            }
            
            return $this->dane;
        }
    }     
?>