<?php
include('../config/config.php');

$url = "http://www.savemart.pk/product-category/toothpaste/";
$content = file_get_contents($url);

$explode_arr = explode('<h2 class="woocommerce-loop-product__title">',$content);

$inserted = 0;
if(count($explode_arr)>0){
	foreach($explode_arr as $k=>$v){
		if($k){
			list($product_title) = explode('</h2>',$v);
			$slug = make_slug($product_title);
			
			list($str_a,$str_b) = explode('</span>',$v);
			list($product_price) = explode('</span>',$str_b);
			
			list($str_a,$str_b) = explode('http://www.savemart.pk/wp-content/uploads',$v);
			list($product_img) = explode('"',$str_b);
			$product_img_path = "http://www.savemart.pk/wp-content/uploads".$product_img;
			$img = @end(explode('/',$product_img));
			list($str_a,$str_b) = explode('.',$img);
			$imgnew = $str_a.'-'.rand(1111,9999).rand(1111,9999).'.'.$str_b;
			
			$insertData = array();
			$insertData['title'] = $product_title;
			$insertData['slug'] = $slug;
			$insertData['purchase_price'] = $product_price;
			$insertData['sale_price'] = $product_price;
			$insertData['region'] = "Pakistan";
			$id = insert_record($tblproducts_crawl,$insertData);
			if($id>0){
				$newfile = $dir_site_products.'crawl/'.$imgnew;
				$file = $product_img_path;
				
				copy($file, $newfile);
				
				$inserted++;
				
			}
		}
	}
}
echo "<br>$inserted have been inserted from $k products";
?>