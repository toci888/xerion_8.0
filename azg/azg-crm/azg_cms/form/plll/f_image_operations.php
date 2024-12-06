<?
	Function fittosize ($resourceimage)
	{
		$percent = 1;
		$rozmiar = 680;
		list($width, $height) = getimagesize($resourceimage);
		if ($width > $rozmiar || $height > $rozmiar)
		{
			    if ($width > $height)
			    {
			    	$percent = $rozmiar / $width;
			    }
			    else
			    {
			        $percent = $rozmiar / $height;
			    }
		}
		if ($percent < 1)
		{
		    $newwidth = $width * $percent;
                    $newheight = $height * $percent;
                    $thumb = imagecreatetruecolor($newwidth, $newheight);
		    $source = imagecreatefromjpeg($resourceimage);
		    imagecopyresized($thumb, $source, 0, 0, 0, 0, $newwidth, $newheight, $width, $height);
			      //image data, image name, quality	
		    ImageJPEG($thumb, $resourceimage, 90);
                }
	}
?>
