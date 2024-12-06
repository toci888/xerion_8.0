
<?php

        //dziala :)
        //header('Location: http://ozyrys/media/test.doc');
        //ooo !!! nie do konca dziala ;/
        //header("Content-Disposition: attachment; filename=test.doc");
        //header("Content-length: ".filesize('../media/test.doc')."");
        header("Content-type: application/vnd.ms-excel");
        header("Content-Disposition: attachment; filename=excel.xls");
        
        readfile('../media/test.xls');
        
        //header('Content-Type: application/force-download'); 
        //header('Content-Type: text/html');  
        //header('Content-Disposition: attachment; filename="blebla.doc"'); 
        //header('X-Sendfile: ../media/test.doc');
        //header('Content-length: '.filesize('../media/test.doc')); 
        //readfile('../media/test.doc');
        
        /* dziala
        // We'll be outputting a PDF
header('Content-type: application/pdf');

// It will be called downloaded.pdf
header('Content-Disposition: attachment; filename="downloaded.pdf"');

// The PDF source is in original.pdf
readfile('../media/deklaracja.pdf');
*/
?>
