<?php 
        include_once ('bll/cache.php');
        include_once ('bll/tags.php');
        require('conf.php');
        $tlumaczenia = cachejezyki::Czytaj(); 
        echo 'integracja w szczyrku :P<br>'; ?>