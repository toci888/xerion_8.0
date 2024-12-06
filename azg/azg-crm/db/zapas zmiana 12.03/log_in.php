<?php
    include_once ('bll/agentbll.php');
    require('conf.php');
    session_start();
    $_SESSION['wyb_jezyk'] = 1;  
    if (isset( $_POST['wyslij']))
    {
        
        $obj = new AgentBLL();
        $uprawnienia = null;
        
        $tabParam[AgentDAL::$login] = $_POST['login'];
        $tabParam[AgentDAL::$haslo] = $_POST['pass'];
        $wynik = $obj->Logowanie($tabParam, $uprawnienia);
        
        //echo 'fasdfad';
        //echo $wynik[0][AgentDAL::$rezultat];
        if ($wynik->rezultat)
        {
            echo 'Zalogowano.';
            //var_dump($uprawnienia);
            $_SESSION[$zalogowany] = serialize($uprawnienia);
            $_SESSION[$dane_agent] = serialize($wynik);
            
            ///ustawnienie sesji z uprawnieniami, sama sesja jednoczesnie jest dowodem zalogowania
            header ('Location: pgsql.php');
        }
        else
        {
            unset($_SESSION['uprawnienia']);
            //pare ifow
            //echo 'Sorry.';
        }
    }
    
    if (isset($_POST['wyloguj']))
    {
        unset($_SESSION['uprawnienia']);
        echo '<script>parent.window.location.href="index.php";</script>';
        //header ('Location: index.php'); 
    }
?>