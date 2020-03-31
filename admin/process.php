
<?php
include('../config/config.php');
unset($_SESSION['sysErr']);
unset($_SESSION['sysData']);
$flg = false;
$p = $_GET['p'];//get page reference to execute the related condition


if($p == "upload_product_images"){
	$enc_id = $_POST['id'];
	$id = dec_password($enc_id);
	$_SESSION['sysErr']['msg'] = "There is some problem try again";

	if($id>0 and isset($_FILES['img']['name'])){
		if(count($_FILES['img']['name'])>0){  /// Add product images
			$product_images = get_records($tblproduct_images,"product_id='".$id."' and main='1'");
			$main = (count($product_images)>0)?0:1;
			foreach ($_FILES['img']['name'] as $key => $value) {
				if($value){
					$files_arr = array();
					$files_arr['img']['name'] = $_FILES['img']['name'][$key];
					$files_arr['img']['tmp_name'] = $_FILES['img']['tmp_name'][$key];
					$files_arr['img']['size'] = $_FILES['img']['size'][$key];
					
					$imgname = "";
					$img_name = upload_img($files_arr,$dir_site_uploads,$imgname);
					add_watermark($dir_site_uploads.$img_name);
					if($img_name){
						$_SESSION['sysErr']['msg'] = "Images uploaded successfully";
						$data = array();
						$data['product_id'] = $id;
						$data['img'] = $img_name;
						$data['main'] = $main;
						$result = insert_record($tblproduct_images,$data);
						$main = 0;
					}
				}
			}

		}
	}

	header("location:index.php?p=product_images&id=".$enc_id);
	exit;
}
if($p == "delproduct_image")
{
	$enc_id = $_GET['product_id'];
	$id = dec_password($_GET['id']);
	$id = (int)$id;
	
	$data = array();
	$data['trash'] = '1';
	$condition = array();
	$condition['id'] = $id;
	$result = update_record($tblproduct_images,$data,$condition);
	if($result){
		$_SESSION['sysErr']['msg'] = "Record deleted successfully";
	}
	header("location:index.php?p=product_images&id=".$enc_id);
	exit;
}

if($p == "addeditproduct")
{
	foreach ($_POST as $k => $v )
	{
		$$k = addslashes($v);
		$_SESSION['sysData'][$k] = $v;
	}
 	$enc_id = $id;
	if($id){
		$id = dec_password($id);
	}
	if(!$title_en){
		$_SESSION['sysErr']['title_'.$lang] = "Please enter product title";
		$flg = true;
	}
	if(!($price>0)){
		$_SESSION['sysErr']['price'] = "Please enter price";
		$flg = true;
	}
	if($flg){
		header("location:index.php?p=addeditproduct&id=".$enc_id);
		exit;
	}
	if( $id > 0 )
	{
		$data = array();
		$data['category_id'] = $category_id;
		$data['subcategory_id'] = $subcategory_id;
		$data['user_id'] = $user_id;
		$data['title_en'] = $title_en;
		$data['title_th'] = $title_th;
		$data['price'] = $price;
		$data['description_en'] = $description_en;
		$data['description_th'] = $description_th;
		$data['status'] = $status;
		$data['featured'] = $featured;
		$data['location'] = $location;
		$data['type'] = $type;
		$data['model'] = $model;
		$data['brand'] = $brand;
		$data['year_registration'] = $year_registration;
		$data['driven'] = $driven;
		$data['fuel_type'] = $fuel_type;
		$data['gearbox'] = $gearbox;
		$data['features'] = $features;
		$condition = array();
		$condition['id'] = $id;
		$result = update_record($tblproducts,$data,$condition);
		if($result)
		{
			$_SESSION['sysErr']['msg'] = "Record updated successfully";
		}
	}
	else
	{
		$data = array();
		$data['category_id'] = $category_id;
		$data['subcategory_id'] = $subcategory_id;
		$data['title_en'] = $title_en;
		$data['title_th'] = $title_th;
		$data['price'] = $price;
		$data['description_en'] = $description_en;
		$data['description_th'] = $description_th;
		$data['status'] = $status;
		$data['featured'] = $featured;
		$data['user_id'] = $user_id;
		$data['location'] = $location;
		$data['type'] = $type;
		$data['model'] = $model;
		$data['brand'] = $brand;
		$data['year_registration'] = $year_registration;
		$data['driven'] = $driven;
		$data['fuel_type'] = $fuel_type;
		$data['gearbox'] = $gearbox;
		$data['features'] = $features;
		
		$id = insert_record($tblproducts,$data);
		if($id>0)
		{
			$_SESSION['sysErr']['msg'] = "Record added successfully";
		}
	}
	
	header("location:index.php?p=products");
	exit;
}
if($p == "delproduct")
{
	$id = dec_password($_GET['id']);
	$id = (int)$id;
	$data = array();
	$data['trash'] = '1';
	$condition = array();
	$condition['id'] = $id;
	$result = update_record($tblproducts,$data,$condition);
	if($result){
		$_SESSION['sysErr']['msg'] = "Record deleted successfully";
	}
	header("location:index.php?p=products");
	exit;
}
if($p == "addeditpackages")
{
	foreach ($_POST as $k => $v )
	{
		$$k = addslashes($v);
		$_SESSION['sysData'][$k] = $v;
	}
 	$enc_id = $id;
	if($id){
		$id = dec_password($id);
	}
	if(!$title_en){
		$_SESSION['sysErr']['title_en'] = "Please enter packages title";
		$flg = true;
	}
	if(!($price>0)){
		$_SESSION['sysErr']['price'] = "Please enter price";
		$flg = true;
	}
	if($flg){
		header("location:index.php?p=addeditpackages&id=".$enc_id);
		exit;
	}
	if( $id > 0 )
	{
		$data = array();
		$data['title_en'] = $title_en;
		$data['title_th'] = $title_th;
		$data['category'] = $category;
		$data['price'] = $price;
		$data['post_ads'] = $post_ads;
		$data['bump_up'] = $bump_up;
		$data['social_media_ads'] = $social_media_ads;
		$data['feature_ads'] = $feature_ads;
		$data['expiry_days'] = $expiry_days;
		$data['status'] = $status;
		$condition = array();
		$condition['id'] = $id;
		$result = update_record($tblvendor_packages,$data,$condition);
		if($result)
		{
			$_SESSION['sysErr']['msg'] = "Record updated successfully";
		}
	}
	else
	{
		$data = array();
		$data['title_en'] = $title_en;
		$data['title_th'] = $title_th;
		$data['category'] = $category;
		$data['price'] = $price;
		$data['post_ads'] = $post_ads;
		$data['bump_up'] = $bump_up;
		$data['social_media_ads'] = $social_media_ads;
		$data['feature_ads'] = $feature_ads;
		$data['expiry_days'] = $expiry_days;
		$data['status'] = $status;
		$id = insert_record($tblvendor_packages,$data);
		if($id>0)
		{
			$_SESSION['sysErr']['msg'] = "Record added successfully";
		}
	}
	
	header("location:index.php?p=packages");
	exit;
}
if($p == "delpackages")
{
	$id = dec_password($_GET['id']);
	$id = (int)$id;
	$data = array();
	$data['trash'] = '1';
	$condition = array();
	$condition['id'] = $id;
	$result = update_record($tblvendor_packages,$data,$condition,"1");
	if($result){
		$_SESSION['sysErr']['msg'] = "Record deleted successfully";
	}
	header("location:index.php?p=packages");
	exit;
}
if($p == "addeditcoupon")
{
	foreach ($_POST as $k => $v )
	{
		$$k = addslashes($v);
		$_SESSION['sysData'][$k] = $v;
	}
 	$enc_id = $id;
	if($id){
		$id = dec_password($id);
	}
	if(!$title_en){
		$_SESSION['sysErr']['title_en'] = "Please enter Coupon title";
		$flg = true;
	}
	if(!($price>0)){
		$_SESSION['sysErr']['price'] = "Please enter price";
		$flg = true;
	}
	if($flg){
		header("location:index.php?p=addeditcoupon&id=".$enc_id);
		exit;
	}
	if( $id > 0 )
	{
		$data = array();
		$data['title_en'] = $title_en;
		$data['title_th'] = $title_th;
		$data['category'] = $category;
		$data['price'] = $price;
		$data['code'] = $code;
		$data['expiry_date'] = $expiry_date;
		$data['status'] = $status;
		$condition = array();
		$condition['id'] = $id;
		$result = update_record($tblcoupon,$data,$condition);
		if($result)
		{
			$_SESSION['sysErr']['msg'] = "Record updated successfully";
		}
	}
	else
	{
		$data = array();
		$data['title_en'] = $title_en;
		$data['title_th'] = $title_th;
		$data['category'] = $category;
		$data['price'] = $price;
		$data['code'] = $code;
		$data['expiry_date'] = $expiry_date;
		$data['status'] = $status;
		$id = insert_record($tblcoupon,$data);
		if($id>0)
		{
			$_SESSION['sysErr']['msg'] = "Record added successfully";
		}
	}
	
	header("location:index.php?p=coupon");
	exit;
}
if($p == "delcoupon")
{
	$id = dec_password($_GET['id']);
	$id = (int)$id;
	$data = array();
	$data['trash'] = '1';
	$condition = array();
	$condition['id'] = $id;
	$result = update_record($tblcoupon,$data,$condition);
	if($result){
		$_SESSION['sysErr']['msg'] = "Record deleted successfully";
	}
	header("location:index.php?p=coupon");
	exit;
}
if($p == "addeditcategory")
{
	foreach ($_POST as $k => $v )
	{
		$$k = addslashes($v);
		$_SESSION['sysData'][$k] = $v;
	}
 	$enc_id = $id;
	if($id){
		$id = dec_password($id);
	}
	if(!$title_en){
		$_SESSION['sysErr']['msg'] = "Please enter category title";
		$flg = true;
	}
	if($flg){
		header("location:index.php?p=addeditcategory&id=".$enc_id);
		exit;
	}
	if( $id > 0 )
	{
		$data = array();
		$data['pid'] = $pid;
		$data['title_en'] = $title_en;
		$data['title_th'] = $title_th;
		$data['description'] = $description;
		$data['status'] = $status;
		$condition = array();
		$condition['id'] = $id;
		$result = update_record($tblcategories,$data,$condition);
		if($result)
		{
			$_SESSION['sysErr']['msg'] = "Record updated successfully";
		}
	}
	else
	{
		$data = array();
		$data['pid'] = $pid;
		$data['title_en'] = $title_en;
		$data['title_th'] = $title_th;
		$data['description'] = $description;
		$data['status'] = $status;
		$id = insert_record($tblcategories,$data);
		if($id>0)
		{
			$_SESSION['sysErr']['msg'] = "Record added successfully";
		}
	}
	
	header("location:index.php?p=categories");
	exit;
}
if($p == "addeditfeatures")
{

	foreach ($_POST as $k => $v )
	{
		$$k = addslashes($v);
		$_SESSION['sysData'][$k] = $v;
	}
 		$f_id = dec_password($_POST['id']);
 		$c_id = dec_password($_POST['cid']);
	
	if( $f_id > 0 )
	{
		$data = array();
		$data['title_en'] = $title_en;
		$data['title_th'] = $title_th;
		$condition = array();
		$condition['id'] = $f_id;
		$condition['category_id'] = $c_id;

		$result = update_record($tblcategory_features,$data,$condition);
		if($result)
		{
			$_SESSION['sysErr']['msg'] = "Record updated successfully";
		}
	}
	else
	{
		$data = array();
		$data['category_id'] = $c_id;
		$data['title_en'] = $title_en;
		$data['title_th'] = $title_th;
		
		$id = insert_record($tblcategory_features,$data);
		if($id>0)
		{
			$_SESSION['sysErr']['msg'] = "Record added successfully";
		}
	}
	
	header("location:index.php?p=features");
	exit;
}
if($p == "addeditmodels")
{
	foreach ($_POST as $k => $v )
	{
		$$k = addslashes($v);
		$_SESSION['sysData'][$k] = $v;
	}
 		$f_id = dec_password($_POST['id']);
 		$c_id = dec_password($_POST['cid']);
	
	if( $f_id > 0 )
	{
		$data = array();
		$data['title_en'] = $title_en;
		$data['title_th'] = $title_th;
		$condition = array();
		$condition['id'] = $f_id;
		$condition['category_id'] = $c_id;
		$result = update_record($tblcategory_models,$data,$condition);
		if($result)
		{
			$_SESSION['sysErr']['msg'] = "Record updated successfully";
		}
	}
	else
	{
		$data = array();
		$data['category_id'] = $c_id;
		$data['title_en'] = $title_en;
		$data['title_th'] = $title_th;
		$id = insert_record($tblcategory_models,$data);
		if($id>0)
		{
			$_SESSION['sysErr']['msg'] = "Record added successfully";
		}
	}
	
	header("location:index.php?p=models");
	exit;
}
if($p == "addedittype")
{
	foreach ($_POST as $k => $v )
	{
		$$k = addslashes($v);
		$_SESSION['sysData'][$k] = $v;
	}
 		$f_id = dec_password($_POST['id']);
 		$c_id = dec_password($_POST['cid']);
	
	if( $f_id > 0 )
	{
		$data = array();
		$data['title_en'] = $title_en;
		$data['title_th'] = $title_th;
		$condition = array();
		$condition['id'] = $f_id;
		$condition['category_id'] = $c_id;
		$result = update_record($tblcategory_types,$data,$condition);
		if($result)
		{
			$_SESSION['sysErr']['msg'] = "Record updated successfully";
		}
	}
	else
	{
		$data = array();
		$data['category_id'] = $c_id;
		$data['title_en'] = $title_en;
		$data['title_th'] = $title_th;
		$id = insert_record($tblcategory_types,$data);
		if($id>0)
		{
			$_SESSION['sysErr']['msg'] = "Record added successfully";
		}
	}
	
	header("location:index.php?p=type");
	exit;
}
if($p == "addeditsubmodels")
{
	foreach ($_POST as $k => $v )
	{
		$$k = addslashes($v);
		$_SESSION['sysData'][$k] = $v;
	}
 		$f_id = dec_password($_POST['id']);
 		$c_id = dec_password($_POST['cid']);
	
	if( $f_id > 0 )
	{
		$data = array();
		$data['title_en'] = $title_en;
		$data['title_th'] = $title_th;
		$condition = array();
		$condition['id'] = $f_id;
		$condition['type_id'] = $c_id;
		$result = update_record($tblcategory_submodels,$data,$condition);
		if($result)
		{
			$_SESSION['sysErr']['msg'] = "Record updated successfully";
		}
	}
	else
	{
		$data = array();
		$data['type_id'] = $c_id;
		$data['title_en'] = $title_en;
		$data['title_th'] = $title_th;
		$id = insert_record($tblcategory_submodels,$data);
		if($id>0)
		{
			$_SESSION['sysErr']['msg'] = "Record added successfully";
		}
	}
	
	header("location:index.php?p=submodels");
	exit;
}
if($p == "addeditcategoryattributes")
{
	foreach ($_POST as $k => $v )
	{
		$$k = addslashes($v);
		$_SESSION['sysData'][$k] = $v;
	}
 	$category_id = dec_password($_POST['cat_id']);
 	$tblname = $_POST['tblname'];
 	$id = $_POST['cat_attributes'];
	if( $id > 0 )
	{
		$data = array();
		$data['title_en'] = $title_en;
		$data['title_th'] = $title_th;
		$condition = array();
		$condition['id'] = $id;
		$condition['category_id'] = $category_id;
		$result = update_record($tblname,$data,$condition);
		if($result)
		{
			$_SESSION['sysErr']['msg'] = "Record updated successfully";
		}
	}
	else
	{
		$data = array();
		$data['category_id'] = $category_id;
		$data['title_en'] = $title_en;
		$data['title_th'] = $title_th;
		$id = insert_record($tblname,$data);
		if($id>0)
		{
			$_SESSION['sysErr']['msg'] = "Record added successfully";
		}
	}
	
	header("location:index.php?p=categories");
	exit;
}
if($p == "delcategory")
{
	$id = dec_password($_GET['id']);
	$id = (int)$id;
	$data = array();
	$data['trash'] = '1';
	$condition = array();
	$condition['id'] = $id;
	$result = update_record($tblcategories,$data,$condition);
	if($result){
		$_SESSION['sysErr']['msg'] = "Record deleted successfully";
	}
	header("location:index.php?p=categories");
	exit;
}
if($p == "delfeatures")
{
	$id = dec_password($_GET['id']);
	$id = (int)$id;
	$data = array();
	$data['trash'] = '1';
	$condition = array();
	$condition['id'] = $id;
	$result = update_record($tblcategory_features,$data,$condition);
	if($result){
		$_SESSION['sysErr']['msg'] = "Record deleted successfully";
	}
	header("location:index.php?p=categories");
	exit;
}
if($p == "delmodels")
{
	$id = dec_password($_GET['id']);
	$id = (int)$id;
	$data = array();
	$data['trash'] = '1';
	$condition = array();
	$condition['id'] = $id;
	$result = update_record($tblcategory_models,$data,$condition);
	if($result){
		$_SESSION['sysErr']['msg'] = "Record deleted successfully";
	}
	header("location:index.php?p=categories");
	exit;
}
if($p == "delsubmodels")
{
	$id = dec_password($_GET['id']);
	$id = (int)$id;
	$data = array();
	$data['trash'] = '1';
	$condition = array();
	$condition['id'] = $id;
	$result = update_record($tblcategory_submodels,$data,$condition);
	if($result){
		$_SESSION['sysErr']['msg'] = "Record deleted successfully";
	}
	header("location:index.php?p=categories");
	exit;
}
if($p == "deltype")
{
	$id = dec_password($_GET['id']);
	$id = (int)$id;
	$data = array();
	$data['trash'] = '1';
	$condition = array();
	$condition['id'] = $id;
	$result = update_record($tblcategory_types,$data,$condition);
	if($result){
		$_SESSION['sysErr']['msg'] = "Record deleted successfully";
	}
	header("location:index.php?p=categories");
	exit;
}
if($p == "addedituser")
{
	foreach ($_POST as $k => $v )
	{
		if(is_array($v)){
			$v = implode(",",$v);
			$$k = $v;
		} else {
			$$k = addslashes($v);
		}
		$_SESSION['sysData'][$k] = $v;
	}
 	$enc_id = $id;
	if($id){
		$id = dec_password($id);
	}  
	
	if( $id > 0 )
	{
		$data = array();
		$data['name'] = $name;
		$data['email'] = $email;
		$data['password'] = $password;
		$data['phone'] = $phone;
		$data['zip'] = $zip;
		$data['state'] = $state;
		$data['city'] = $city;
		$data['address'] = $address;
		$data['status'] = $status;
		$condition = array();
		$condition['id'] = $id;
		$result = update_record($tblusers,$data,$condition);
		if($result)
		{
			$_SESSION['sysErr']['msg'] = "Record updated successfully";
		}
	}
	else
	{
		$data = array();
		$data['name'] = $name;
		$data['email'] = $email;
		$data['password'] = $password;
		$data['phone'] = $phone;
		$data['zip'] = $zip;
		$data['state'] = $state;
		$data['city'] = $city;
		$data['address'] = $address;
		$data['status'] = $status;
		$id = insert_record($tblusers,$data);
		if($id>0)
		{
			$_SESSION['sysErr']['msg'] = "Record added successfully";
		}
	}
	
	header("location:index.php?p=users");
	exit;
}

if($p == "delusers")
{
	$id = dec_password($_GET['id']);
	$id = (int)$id;
	$data = array();
	$data['trash'] = '1';
	$condition = array();
	$condition['id'] = $id;
	$result = update_record($tblusers,$data,$condition);
	if($result){
		$_SESSION['sysErr']['msg'] = "Record deleted successfully";
	}
	header("location:index.php?p=users");
	exit;
}

if($p == "addeditcms")
{
	foreach ($_POST as $k => $v )
	{
		$$k = addslashes($v);
		$_SESSION['sysData'][$k] = $v;
	}
 	
	if( $type )
	{
		$data = array();
		
		$data['content_en'] = $content;
		$data['content_th'] = $content;
		$condition = array();
		$condition['type'] = $type;
		$result = update_record($tblcms,$data,$condition);
		if($result)
		{
			$_SESSION['sysErr']['msg'] = "Record updated successfully";
		}
	}
	
	header("location:index.php?p=cms");
	exit;
}

if($p == "addeditfaq")
{
	foreach ($_POST as $k => $v )
	{
		if(is_array($v)){
			$v = implode(",",$v);
			$$k = $v;
		} else {
			$$k = addslashes($v);
		}
		$_SESSION['sysData'][$k] = $v;
	}
 	$enc_id = $id;
	if($id){
		$id = dec_password($id);
	}  
	
	if( $id > 0 )
	{
		$data = array();
		
		$data['title_en'] = $title_en;
		$data['title_th'] = $title_th;
		$data['description_en'] = $description_en;
		$data['description_en'] = $description_en;
		$data['status'] = $faq_status;
		$condition = array();
		$condition['id'] = $id;
		$result = update_record($tblfaq,$data,$condition);
		if($result)
		{
			$_SESSION['sysErr']['msg'] = "Record updated successfully";
		}
	}
	else
	{
		$data = array();
		
		$data['title_en'] = $title_en;
		$data['title_th'] = $title_th;
		$data['description_en'] = $description_en;
		$data['description_en'] = $description_en;
		$data['status'] = $status;
		$id = insert_record($tblfaq,$data);
		if($id>0)
		{
			$_SESSION['sysErr']['msg'] = "Record added successfully";
		}
	}
	
	header("location:index.php?p=faqs");
	exit;
}


if($p == "delfaqs")
{
	$id = dec_password($_GET['id']);
	$id = (int)$id;
	$data = array();
	$data['trash'] = '1';
	$condition = array();
	$condition['id'] = $id;
	$result = update_record($tblfaq,$data,$condition);
	if($result){
		$_SESSION['sysErr']['msg'] = "Record deleted successfully";
	}
	header("location:index.php?p=faqs");
	exit;
}

if($p == "addeditsetting")
{
	foreach ($_POST as $k => $v )
	{
		$$k = addslashes(htmlspecialchars($v));
		$_SESSION['sysData'][$k] = $v;
	}
	$enc_id = $id;
	if($id){
		$id = dec_password($id);
	}
	$flg = false;
	
	if(!$value_name)
	{
		$_SESSION['sysErr']['value_name'] = "Please Enter Value";
		$flg = true;
	}
	if($flg)
	{
		header("location:index.php?p=addeditsetting&id=".$enc_id);exit;
	}
	if( $id > 0 )
	{
		$data = array();
		$data['option_name'] = $option_name;
		$data['value_name'] = $value_name;
		$condition = array();
		$condition['id'] = $id;
		$result = update_record($tblsettings,$data,$condition);
		if($result)
		{
			$_SESSION['sysErr']['msg'] = "Record updated successfully";
		}
	}
	else
	{
		$data = array();
		$data['option_name'] = $option_name;
		$data['value_name'] = $value_name;
		$id = insert_record($tblsettings,$data);
		if($id>0)
		{
			$_SESSION['sysErr']['msg'] = "Record added successfully";
		}
	}
	
	header("location:index.php?p=setting");
	exit;
} 

if($p == "addeditnews")
{
	foreach ($_POST as $k => $v )
	{
		if(is_array($v)){
			$v = implode(",",$v);
			$$k = $v;
		} else {
			$$k = addslashes($v);
		}
		$_SESSION['sysData'][$k] = $v;
	}
	$enc_id = $id;
	if($id){
		$id = dec_password($id);
	}
	$flg = false;
	
	if(!$title_en)
	{
		$_SESSION['sysErr']['title_en'] = "Please enter name";
		$flg = true;
	}
	
	/*if(!$slug)
	{
		$_SESSION['sysErr']['slug'] = "Please enter slug";
		$flg = true;
	}
	
	if($flg)
	{
		header("location:index.php?p=addeditnews&id=".$enc_id);exit;
	} */
	
	if( $id > 0 )
	{
		$data = array();
		$data['title_en'] = $title_en;
		$data['title_th'] = $title_th;
		$data['description_en'] = $description_en;
		$data['description_th'] = $description_th;
		$data['tags_en'] = $tags_en;
		$data['tags_th'] = $tags_th;
		$data['meta_description_en'] = $meta_description_en;
		$data['meta_description_th'] = $meta_description_th;
		$data['status'] = $status;
		$condition = array();
		$condition['id'] = $id;
		$result = update_record($tblnews,$data,$condition);
		if($result)
		{
			$_SESSION['sysErr']['msg'] = "Record updated successfully";
		}
	}
	else
	{
		$data = array();
		$data['title_en'] = $title_en;
		$data['title_th'] = $title_th;
		$data['description_en'] = $description_en;
		$data['description_th'] = $description_th;
		$data['tags_en'] = $tags_en;
		$data['tags_th'] = $tags_th;
		$data['meta_description_en'] = $meta_description_en;
		$data['meta_description_th'] = $meta_description_th;
		$data['status'] = $status;
		$id = insert_record($tblnews,$data);
		if($id>0)
		{
			$_SESSION['sysErr']['msg'] = "Record added successfully";
		}
	}
	if(isset($_FILES['img']['name']) and $_FILES['img']['name']){
		$file['img'] = $_FILES['img'];
		$img_name = upload_img($file,$dir_site_news,$slug);
		if($img_name){
			///resize_img($img_name,$dir_site_news);
			$data = array();
			$data['img'] = $img_name;
			$condition = array();
			$condition['id'] = $id;
			update_record($tblnews,$data,$condition);
		}
	}
	///echo $sql;exit;
	header("location:index.php?p=news");
	exit;
}
if($p == "delnews")
{
	$id = dec_password($_GET['id']);
	$id = (int)$id;
	$data = array();
	$data['trash'] = '1';
	$condition = array();
	$condition['id'] = $id;
	$result = update_record($tblnews,$data,$condition);
	if($result){
		$_SESSION['sysErr']['msg'] = "Record deleted successfully";
	}
	header("location:index.php?p=news");
	exit;
}

?>