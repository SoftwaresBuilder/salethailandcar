<?php
include('../config/config.php');
include('../common/functions_process.php');

$page_id = (isset($_GET['page']) and $_GET['page']>1)?$_GET['page']:'';
$s = (isset($_GET['s']) and $_GET['s']>1)?$_GET['s']:'1';
$e = (isset($_GET['e']) and $_GET['e']>1)?$_GET['e']:'1';
$inserted = 0;
for($i=$s;$i<=$e;$i++){
	echo "<br><br>URL: ".$url = "http://144.76.174.7/mcc2/home/category_page/".$page_id."/".$i;
	$content = file_get_contents($url);
	
	$explode_arr = explode('<div class="product-thumb">',$content);
	if(count($explode_arr)>0){
		foreach($explode_arr as $k=>$v){
			if($k){
				list($str_a,$str_b) = explode('<h4>',$v);
				list($product_title) = explode('</h4>',$str_b);
				$product_title = trim(strip_tags($product_title));
				$slug = make_slug($product_title);
				list($str_a,$str_b) = explode('<span class="price-new">',$v);
				list($purchase_price) = explode('</span>',$str_b);
				list($str_a,$purchase_price) = explode(' ',$purchase_price);
				$purchase_price = trim($purchase_price);
				list($str_a,$str_b) = explode('<span class="price-old">',$v);
				list($sale_price) = explode('</span>',$str_b);
				list($str_a,$sale_price) = explode(' ',$sale_price);
				$sale_price = trim($sale_price);
				list($str_a,$str_b) = explode('uploads/menu/',$v);
				list($product_img) = explode('"',$str_b);
				
				$product_img_path = "http://144.76.174.7/mcc2/uploads/menu/".$product_img;
				$type = @end(explode('.',$product_img));
				$imgnew = $slug.'-'.rand(1111,9999).rand(1111,9999).'.'.$type;
				
				$insertData = array();
				$insertData['title_'.$lang] = $product_title;
				$insertData['slug'] = $slug;
				$insertData['purchase_price'] = $purchase_price;
				$insertData['sale_price'] = $sale_price;
				$insertData['region'] = "Pakistan";
				$id = insert_record($tblproducts_crawl,$insertData,'1');
				if($id>0){
					$newfile = $dir_site_products.'crawl/'.$imgnew;
					$file = $product_img_path;
					if(!copy($file, $newfile)){ ///Try once again if not found first time
						copy($file, $newfile);
					}
					
					$insertData = array();
					$insertData['product_id'] = $id;
					$insertData['img'] = $imgnew;
					$insertData['main_img'] = '1';
					insert_record($tblproductimages_crawl,$insertData);
					
					$inserted++;
				}
			}
		}
	}
}
echo "<br>$inserted have been inserted from $k products";
?>