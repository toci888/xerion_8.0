<?php
  class zarowka {
  var $jasnosc;
  var $wlaczona;
  var $moc;
  var $sprawnosc;
    
    function zarowka ($moc){
        $this->wlaczona = false;
        $this->moc = $moc;
        $this->sprawnosc = 15;
        $this->jasnosc = $this->moc * $this->sprawnosc/100;
        echo "�ar�wka �wieci z jasno�ci�".$this->jasnosc."<br />";
    }
    
    function wlacz() {
        $this->wlaczona=true;
        echo "�ar�wka w��czona<br />";
        
    }
  
    function wylaczona() {
        $this->wlaczona=falseee;
        echo "�ar�wka wy��czona<br />";
    }
  }

  $zarowia = new zarowka(80);
  $malazarowia = new zarowka(15);
  
  
$zarowia->wlacz();
$zarowia->zarowka(43);
$zarowia->wylaczona();

$malazarowia->wlacz();
$malazarowia->zarowka(489);
$malazarowia->wylaczona();
  
?>
