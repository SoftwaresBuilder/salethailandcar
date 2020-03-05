<?php
include('../config/config.php');
include('../common/functions_process.php');

$source = $dir_site_products_source;
$destination = $dir_site_products;
$count = 0;
$files = scandir($source);
if(count($files)>2){
	foreach($files as $v){
		if( !($v=='' or $v=="." or $v==".." or $v=="index.php") ){
			$count++;
			resize_img($v,$source,"110",$source."thumbs/");
		}
	}
	echo "<br>".$count." files have been uploaded from ".(count($files)-3)." files";
} else {
	echo "No file found in the folder";
}
?>