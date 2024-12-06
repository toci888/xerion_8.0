<?php
    class GusSoap
    {
        protected $serverUrl = "http://www.stat.gov.pl/broker/services/WebServiceServant?wsdl";
        public $client;
        
        function GusSoap()
        {
            //$this->client = new nusoapclient($this->serverUrl);
            $this->client = new SoapClient($this->serverUrl);
            //$this->client->soap_defencoding = 'ISO-8859-2';
            //$this->client->xml_encoding = 'ISO-8859-2';
        }
    }
?>