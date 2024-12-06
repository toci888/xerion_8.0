<?php
    if (!isset($_GET['target']))
    {
        $_GET['target'] = 'o_firmie';
    }
    if (isset($_GET['target']))
    {
        if (is_file($_GET['target'].'.php')) //zabezpieczenie, jesli pliku ni ma
        require ($_GET['target'].'.php');
    }
?>