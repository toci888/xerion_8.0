<?php

//define("AMFPHP_BASE", "../amf-core/");

include(AMFPHP_BASE . "util/MethodTable.php");

include("vo/Photographer.php");
include("vo/Photo.php");
include("vo/Gallery.php");

class PhotogalleryService {
	
	public function PhotogalleryService() {
		$this->methodTable = MethodTable::create(__FILE__);
  	}
  	
	/**
  	 * @access remote
  	 * @returns Array
  	 */
  	public function getPhotographers() {
		$photographers = array();
		
		/* tutaj normalnie pobralibyśmy dane z bazy */
		$p = new Photographer();
		$p->name = "Mietek";
		$p->surname = "Krawężnik";
		
		$g = new Gallery();
		$g->desc = "Galeria zdjęć z imprezy pod klatką";
		$g->name = "Ośka";
		
		$g->author = $p;
		$p->gallery = $g;
		
		/* a tutaj zczytali zawartość jakiegoś folderu */
		for ($i = 0; $i < 5; $i++) {
			$photo = new Photo();
			$photo->name = $i;
			$photo->desc = "zdjęcie $i";
			
			$g->addPhoto($photo);
		}
			
		array_push($photographers, $p);
		
  		return $photographers;
  	}
  	
}
/*
$pgs = new PhotogalleryService();
print "<pre>";
print_r($pgs->getPhotographers());
print "</pre>";
*/
?>
