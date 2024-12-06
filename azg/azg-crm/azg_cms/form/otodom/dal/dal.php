<?
    class dal
    {
        protected $database;            
        protected $con_str = "host=localhost user=postgres dbname=azg password=beatka";
        public $result;
        
        /*function fillBasicQueries()
        {
            $this->queries['queryName'] = 'select nazwa from imiona order by nazwa asc;';
            $this->queries['queryGender'] = 'select nazwa from plec order by nazwa asc;';
            $this->queries['queryMsc'] = 'select nazwa from miejscowosc order by nazwa asc;';
        }*/
        public function dbConnect()
        {
            if (!isset($this->database))
            {
                $this->database = pg_connect($this->con_str);
            }
            return $this->database;
        }
        public function dbClose()
        {
            pg_close($this->database);
        }
        public function pgQuery($query)
        {
            //echo $query."<br>";
            $this->result = pg_query($this->dbConnect(), $query);
            return $this->result;
        }
    }
    class DataSet
    {
        private $headers = array();
        private $data = array();
        private $dataIndexer = 0;
        public function GetHeaders()
        {
            return $this->headers;
        } 
        public function GetData()
        {
            return $this->data;
        }
        public function SetHeaders($headers) //only one headers array is possible
        {
            $this->headers = $headers;
        }
        public function AddRow($row) //row is an array of data which may be nested table in each index
        {
            $this->data[$this->dataIndexer] = $row;
            $this->dataIndexer++;
        }
        public function SetData($data)
        {
            $this->data = $data;
        }
    }
?>