<?php
    require('conf.php');
    session_start();
    
    if (isset($_SESSION[$baner_not]))
    {
        ///podanie tego flashowi
        echo $_SESSION[$jezyk];
    }
?>