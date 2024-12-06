<?php
    class Soap
    {
        protected $serverWSDL;
        protected $client; ///pole, gdzie utworzony zostanie klient - obiekt na podstawie wsdl
        
        public function Soap($wsdlURL)
        {
            $this->serverWSDL = $wsdlURL;
            
            $this->client = new SoapClient($this->serverWSDL);
        }
        public function PodajKlient()
        {
            return $this->client;
        }
    }
?>