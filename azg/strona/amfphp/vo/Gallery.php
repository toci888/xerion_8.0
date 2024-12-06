<?php

class Gallery {
	
	var $name = "";
	var $desc = "";
	
	var $author;
	
	var $photos = array();

	function Gallery() {
	}
	
	function addPhoto($newPhoto) {
		array_push($this->photos, $newPhoto);
	}
	
}

?>
