<HTML>
<HEAD>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <script language="javascript" src="js/script.js"></script>
<link href="css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<?php
    // ¶ ±
    session_start();
    //////tu jest inny dal !!!!!! nie wiem czemu !!!! cos ze sciezkami nie lezalo !!!
    include_once ('t_dal.php');
    require('naglowek.php');
    require('conf.php');

    if (isset($_GET[';)']))
    {
        $dal = new dal();
        $sciezka = 'media/';
        $sciezka_old = 'img/';
        $zapytanie = 'select distinct id_nieruchomosc from zdjecie;';
        $wynik = $dal->PobierzDane($zapytanie, $ilosc_wierszy);
        
        foreach ($wynik as $wiersz)
        {
            $zapytanie = 'select nazwa, nazwa_old from zdjecie where id_nieruchomosc = '.$wiersz['id_nieruchomosc'].';';
            $id_nieruchomosc = $wiersz['id_nieruchomosc'];
            $wyn_zdjecia = $dal->PobierzDane($zapytanie, $ilosc_wierszy);
            foreach ($wyn_zdjecia as $wiersz)
            {
                $stare_zdj = $sciezka_old.'zd'.$wiersz['nazwa_old'].'.jpg';
                $stare_zdj_b = $sciezka_old.'zd'.$wiersz['nazwa_old'].'_b.jpg';
                
                $sciezka_nowa = $sciezka.$id_nieruchomosc.'/zdjecia/';
                if (!is_dir($sciezka_nowa))
                {
                    //stworz katalogi lub drzewo katalogow
                    if (!mkdir($sciezka_nowa, 0755, true))
                    {
                        echo 'Blad.<br />';
                    }
                    else
                    {
                        $jest_katalog = true;
                    }
                }
                if (file_exists($stare_zdj))
                {
                    copy($stare_zdj, $sciezka_nowa.'m_'.$wiersz['nazwa']);
                }
                if (file_exists($stare_zdj_b))
                {
                    copy($stare_zdj_b, $sciezka_nowa.$wiersz['nazwa']);
                }
            }
        }
    }

    require('stopka.php'); 
?>
</body>
</html>
