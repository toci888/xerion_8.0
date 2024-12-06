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
        echo "¯arówka œwieci z jasnoœci¹".$this->jasnosc."<br />";
    }
    
    function wlacz() {
        $this->wlaczona=true;
        echo "¯arówka w³¹czona<br />";
        
    }
  
    function wylaczona() {
        $this->wlaczona=falseee;
        echo "¯arówka wy³¹czona<br />";
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
