<?
    include ('dal.php');
    
    echo md5('dobre_rady');
    
    /*class poltl 
    {
        public $id;
        public $tag;
    }
    
    $dal = new dal();
    $tl = new poltl();
    
    $tl->id = 1;
    $tl->tag = '_dom';
    
    $ar['id'] = 1;
    $ar['tag'] = '_dom';
    echo "select tlumacz(".$ar.");";
    
    $dal->pgQuery("select tlumacz(".serialize($ar)."::pojtlumaczenie);");  //::pojtlumaczenie
    var_dump($dal->rows);     */
?>