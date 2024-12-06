<?php
    // œ - ¶ ¹ - ±  Ÿ - ¼  - ¬ Œ - ¦
    if ($_SERVER['SERVER_NAME'] == 'www.azg.pl' || $_SERVER['SERVER_NAME'] == 'azg.pl')
    {
        echo '<script type="text/javascript">
        var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
        document.write(unescape("%3Cscript src=\'" + gaJsHost + "google-analytics.com/ga.js\' type=\'text/javascript\'%3E%3C/script%3E"));
        </script>
        <script type="text/javascript">
        var pageTracker = _gat._getTracker("UA-5029884-4");
        pageTracker._trackPageview();
        </script>';
    } 
    if ($_SERVER['SERVER_NAME'] == 'www.azgwarancja.eu')
    {
        echo '<script type="text/javascript">
        var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
        document.write(unescape("%3Cscript src=\'" + gaJsHost + "google-analytics.com/ga.js\' type=\'text/javascript\'%3E%3C/script%3E"));
        </script>
        <script type="text/javascript">
        var pageTracker = _gat._getTracker("UA-5029884-2");
        pageTracker._initData();
        pageTracker._trackPageview();
        </script>';
    }
    if ($_SERVER['SERVER_NAME'] == 'www.nieruchomosciopole.pl')
    {
        echo '<script type="text/javascript">
        var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
        document.write(unescape("%3Cscript src=\'" + gaJsHost + "google-analytics.com/ga.js\' type=\'text/javascript\'%3E%3C/script%3E"));
        </script>
        <script type="text/javascript">
        var pageTracker = _gat._getTracker("UA-5029884-3");
        pageTracker._initData();
        pageTracker._trackPageview();
        </script>';
    }
?>
