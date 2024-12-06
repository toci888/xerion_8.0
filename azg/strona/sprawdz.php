<?php
    //include_once ('bll/tags.php');
    //require('conf.php');
    session_start();
    
    if (isset($_POST['spurl']) == 'sprawdz')
    {
        ///podanie tego flashowi
        print "jakiurl=http://ozyrys".$_SESSION['baner_not'];
    }
?>