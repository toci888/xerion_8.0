<HTML>
<HEAD>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <script language="javascript" src="../js/script.js"></script>
<link href="../css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<?php
    // ¶ ±
    include_once('../dal/dal.php');
    //include_once ('../dal/utilsdal.php'); 
    include ('kontrolki_html.php');
    include ('bll/tags.php');
    session_start();
    $kontrolki = new KontrolkiHtml();
        
    require('../naglowek.php');

    $dal = new dal();
    $res = $dal->pgSelect('select id,nazwa from jezyk;');
    
    echo '<form method="POST" target="center" action="panel_adm/jezyk.php">';
    
    $i = 0;
    echo '<table><tr>';
    while (isset($res[$i]))
    {
        $wiersz = $res[$i];
        echo '<td>';
       // echo $wiersz['nazwa'];
    $kontrolki->AddSubmit ('jezyk', $wiersz['id'], $wiersz['nazwa'], '');
        echo '</td>';   
        $i++;  
    }
      echo '</tr></table>';  
      echo '</form>';
    
    require("../stopka.php");
?>
</body>
</html>
