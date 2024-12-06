<?php
    $path = str_replace($_SERVER['PHP_SELF'], '', $_SERVER['SCRIPT_FILENAME']).'/';
    
    include_once ($path.'dal/dal.php');
    include_once ($path.'dal/utilsdal.php');
    include_once ($path.'bll/tags.php');
    
    
    
?>