<?php
include('../config/config.php');

$source = $dir_site_products_source;
$destination = $dir_site_products;
$count = 0;
$files = scandir($source);
if(count($files)>2){
	foreach($files as $v){
		if( !($v=='' or $v=="." or $v=="..") ){
			$arr = explode("_",$v);
			if(count($arr)>0) { $slug = $arr[0]; }
			$product = get_records($tblproducts,"slug='".$slug."'");
			if(count($product)>0){
				$product_id = $product[0]['id'];
				$productimages = get_records($tblproductimages,"product_id='".$product_id."' and main_img='1'");
				$main_img = (count($productimages)>0)?'0':'1';
				if ( copy($source.$v, $destination.$v) ) {
					$insertData = array();
					$insertData['product_id'] = $product_id;
					$insertData['img'] = $v;
					$insertData['type'] = '0';
					$insertData['main_img'] = $main_img;
					$id = insert_record($tblproductimages,$insertData);
					if($id>0){
						$count++;
						unlink($source.$v);
						echo "<br>Copy success!";
					}
				} else {
					echo "<br>Copy failed.";
				}
			} else {
				echo "<br>Product not found.";
			}
		}
	}
	echo "<br>".$count." files have been uploaded from ".(count($files)-2)." files";
} else {
	echo "No file found in the folder";
}
?>