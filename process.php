<?php
include('config/config.php');
unset($_SESSION['sysErr']);
unset($_SESSION['sysData']);
$user_id = 0;
if(isset($_SESSION['user_record'])){
	$user_id = $_SESSION['user_record']['id'];
}
$lang = $_SESSION['lang'];
$flg = false;
$p = $_GET['p'];//get page reference to execute the related condition

if($p=="get_package"){
	$enc_id = $_GET['id'];
	$id = dec_password($enc_id);
	$package = get_records($tblvendor_packages ,"id='".$id."'");
	if($package)
	{
		$user = get_records($tblusers ,"id='".$user_id."'");

		$data = array();
		$data['post_ads'] = $package[0]['post_ads']+$user[0]['post_ads'];
		$data['bump_up'] = $package[0]['bump_up']+$user[0]['bump_up'];
		$data['package_id'] = $package[0]['id'];
		$condition = array();
		$condition['id'] = $user_id;
		$result = update_record($tblusers ,$data,$condition);
		if($result)
		{
			$_SESSION['sysErr']['msg'] = "Package updated successfully";
		}
	}
	header("location:dashboard.php?tab=packages");
	exit;
}
if($p=="delfavorite"){
	$enc_id = $_GET['id'];
	$id = dec_password($enc_id);
	$result = delete_records($tblproduct_favorites ,"user_id='".$user_id."' and product_id='".$id."'");
	if($result)
	{
		$_SESSION['sysErr']['msg'] = "Record deleted successfully";
	}
	header("location:dashboard.php?tab=favorites");
	exit;
}

if($p=="like_product"){
	foreach ($_GET as $k => $v )
	{
		$$k = addslashes($v);
		$_SESSION['sysData'][$k] = $v;
	}
	$id = dec_password($id);
	
	$data = array();
	$data['user_id'] = $user_id;
	$data['product_id'] = $id;
	$id = insert_record($tblproduct_favorites,$data);
	if($id>0)
	{
		$_SESSION['sysErr']['msg'] = "Added to favorite successfully";
	}
	
	header("location:".$_SESSION['page_url']);
	exit;
}

if($p=="select_lang"){
	$lang = $_GET['lang'];
	$_SESSION['lang'] = ($lang)?$lang:'en';
	if($_SESSION['lang']=="en"){
		$_SESSION['price_rate'] = $usd_rate; /// Assigning currency exchange rate (default USD=1)
		$_SESSION['cons_currency'] = $cons_usd; /// Assigning which currency will show on site
	} else {
		$_SESSION['price_rate'] = $thai_rate;
		$_SESSION['cons_currency'] = $cons_thai;
	}
	header("location:".$_SESSION['page_url']);
	exit;
}

if($p=="inquiry_reply"){
	foreach ($_POST as $k => $v )
	{
		if(!is_array($v)){
			$$k = addslashes($v);
			$_SESSION['sysData'][$k] = $v;
		}
	}
	if(!$inquiry)
	{
		$_SESSION['sysErr']['inquiry'] = "Write your inquiry";
		$flg = true;
	}
	$community = get_records($tblcommunities,"id='".$community_id."' and trash='0' and status='1'");
	if(!(count($community)>0))
	{
		$_SESSION['sysErr']['community'] = "Invalid community";
		$flg = true;
	}
	if(!$flg)
	{
		$data = array();
		$data['community_id'] = $community_id;
		$data['touser_id'] = $community[0]['user_id'];
		$data['user_id'] = $user_id;
		$data['inquiry'] = $inquiry;
		$id = insert_record($tblinquiries,$data);
		if($id>0)
		{
			$_SESSION['sysErr']['msg'] = "Inquiry posted successfully";
		}
	}
	header("location:".$_SESSION['page_url']);
	exit;
}

if($p=="search_process"){
	if(count($_POST['favorite'])>0){
		foreach ($_POST['favorite'] as $k => $v) {
			$data = array();
			$data['community_id'] = $v;
			$data['user_id'] = $user_id;
			$id = insert_record($tblcommunities_favorites,$data);
		}
	}
	if(count($_POST['more_info'])>0){
		foreach ($_POST['more_info'] as $k => $v) {
			$data = array();
			$data['community_id'] = $v;
			$data['user_id'] = $user_id;
			$id = insert_record($tblcommunities_moreinfo,$data);
		}
	}
	if(count($_POST['send_assessment'])>0){
		if(!$_SESSION['user_record']['assessment']){
			$_SESSION['sysErr']['assessment'] = "Please write your assessment first";
			header("location:assessment.php");
			exit;
		} else {
			foreach ($_POST['send_assessment'] as $k => $v) {
				$data = array();
				$data['community_id'] = $v;
				$data['user_id'] = $user_id;
				$id = insert_record($tblcommunities_assessments,$data);

				$community = get_records($tblcommunities,"id='".$v."' and trash='0' and status='1'");
				$data = array();
				$data['community_id'] = $v;
				$data['touser_id'] = $community[0]['user_id'];
				$data['user_id'] = $user_id;
				$data['inquiry'] = $_SESSION['user_record']['assessment'];
				$id = insert_record($tblinquiries,$data);
			}
		}
	}

	header("location:".$_SESSION['page_url']);
	exit;
}

if($p=="update_assessment"){
	foreach ($_POST as $k => $v )
	{
		$$k = addslashes($v);
		$_SESSION['sysData'][$k] = $v;
	}
	
	if(!$assessment)
	{
		$_SESSION['sysErr']['assessment'] = "Please write some detail";
		$flg = true;
	}

	if(!$flg)
	{
		$data = array();
		$data['assessment'] = $assessment;
		$condition = array();
		$condition['id'] = $user_id;
		$result = update_record($tblusers,$data,$condition);
		if($result)
		{
			$_SESSION['sysErr']['msg'] = "Assessment saved successfully";
		}
	}
	header("location:".$_SESSION['page_url']);
	exit;
}

if($p=="post_inquiry"){ /// I have removed inquiry from from detail page so it is not working
	foreach ($_POST as $k => $v )
	{
		if(!is_array($v)){
			$$k = addslashes($v);
			$_SESSION['sysData'][$k] = $v;
		}
	}
	$community_id = dec_password($community_id);
	if($user_id==0)
	{
		$_SESSION['sysErr']['inquiry'] = "Login to post inquiry";
		header("location:login.php");
		exit;
	}
	if(!$inquiry)
	{
		$_SESSION['sysErr']['inquiry'] = "Write your inquiry";
		$flg = true;
	}
	$community = get_records($tblcommunities,"id='".$community_id."' and trash='0' and status='1'");
	if(!(count($community)>0))
	{
		$_SESSION['sysErr']['community'] = "Invalid community";
		$flg = true;
	}
	if($flg)
	{
		header("location:".$_SESSION['page_url']);
		exit;
	}
	
	$data = array();
	$data['community_id'] = $community_id;
	$data['touser_id'] = $community[0]['user_id'];
	$data['user_id'] = $user_id;
	$data['inquiry'] = $inquiry;
	$id = insert_record($tblinquiries,$data);
	if($id>0)
	{
		$_SESSION['sysErr']['msg'] = "Inquiry posted successfully";
	}
	header("location:".$_SESSION['page_url']);
	exit;
}
if($p=="delproduct_img"){
	$enc_id = $_GET['id'];
	$id = dec_password($enc_id);
	$data = array();
	$data['trash'] = '1';
	$condition = array();
	$condition['id'] = $id;
	$result = update_record($tblproduct_images ,$data,$condition);
	if($result)
	{
		$_SESSION['sysErr']['msg'] = "Record deleted successfully";
	}
	header("location:".$_SESSION['page_url']);
	exit;
}
if($p=="delproduct"){
	$enc_id = $_GET['id'];
	$id = dec_password($enc_id);
	$data = array();
	$data['trash'] = '1';
	$condition = array();
	$condition['id'] = $id;
	$result = update_record($tblproducts ,$data,$condition);
	if($result)
	{
		$_SESSION['sysErr']['msg'] = "Product deleted successfully";
	}
	header("location:".$_SESSION['page_url']);
	exit;
}
if($p=="add_product"){	
	foreach ($_POST as $k => $v )
	{
		if(!is_array($v)){
			$$k = addslashes($v);
			$_SESSION['sysData'][$k] = $v;
		}
	}
	
	if(!$title)
	{
		$_SESSION['sysErr']['title'] = "Please enter ad name";
		$flg = true;
	}
	
	if($flg)
	{
		header("location:".$_SESSION['page_url']);
		exit;
	}

	if( $id > 0 )
	{
		$features_ids = implode('::', $_POST['features']);
		$fuel_type_ids = implode('::', $_POST['fuel_type']);
		$data = array();
		if($lang =='en'){
			$data['title_en'] = $title;
			$data['title_th'] = translate_api($title,'en','th');
			$data['description_en'] = $description;
			$data['description_th'] = translate_api($description,'en','th');
			$data['tags_en'] = $tags;
			$data['tags_th'] = translate_api($tags,'en','th');
			}
		else if($lang =='th'){
			$data['title_th'] = $title;
			$data['title_en'] =  translate_api($title,'th','en');
			$data['description_th'] = $description;
			$data['description_en'] =  translate_api($description,'th','en');
			$data['tags_th'] = $tags;
			$data['tags_en'] = translate_api($tags,'th','en');
		}
		$data['category_id'] = $category_id;
		$data['subcategory_id'] = $subcategory_id;
		$data['user_id'] = $user_id;
		$data['price'] = save_price($price);
		$data['longitude'] = $longitude;
		$data['latitude'] = $latitude;
		$data['location'] = $location;
		$data['type'] = $type;
		$data['ad_type'] = $ad_type;
		if(isset($submodel)){$data['submodel'] = $submodel;}
		if(isset($model)){$data['model'] = $model;}
		if(isset($brand)){$data['brand'] = $brand;}
		if(isset($year_registration)){$data['year_registration'] = $year_registration;}
		if(isset($driven)){$data['driven'] = $driven;}
		if(isset($fuel_type_ids)){$data['fuel_type'] = $fuel_type_ids;}
		if(isset($features_ids)){$data['features'] = $features_ids;}
		if(isset($bedrooms)){$data['bedrooms'] =$bedrooms;}
		if(isset($bathrooms)){$data['bathrooms'] =$bathrooms;}
		if(isset($kitchens)){$data['kitchens'] =$kitchens;}
		$condition = array();
		$condition['id'] = $id;
		$result = update_record($tblproducts ,$data,$condition);
		if($result)
		{
			$_SESSION['sysErr']['msg'] = "Record updated successfully";
			header("location:dashboard.php");
			exit;
		}
	}
	else
	{
		$data = array();
		if($lang =='en'){
			$data['title_en'] = $title;
			$data['title_th'] = translate_api($title,'en','th');
			$data['description_en'] = $description;
			$data['description_th'] = translate_api($description,'en','th');
			$data['tags_en'] = $tags;
			$data['tags_th'] = translate_api($tags,'en','th');
			}
		else if($lang =='th'){
			$data['title_th'] = $title;
			$data['title_en'] =  translate_api($title,'th','en');
			$data['description_th'] = $description;
			$data['description_en'] =  translate_api($description,'th','en');
			$data['tags_th'] = $tags;
			$data['tags_en'] = translate_api($tags,'th','en');
		}
		$data['category_id'] = $category_id;
		$data['subcategory_id'] = $subcategory_id;
		$data['user_id'] = $user_id;
		$data['price'] = save_price($price);
		$data['longitude'] = $longitude;
		$data['latitude'] = $latitude;
		$data['location'] = $location;
		$data['type'] = $type;
		$data['submodel'] = $submodel;
		$data['model'] = $model;
		/**
		$data['brand'] = $brand;
		$data['year_registration'] = $year_registration;
		$data['driven'] = $driven;
		$data['fuel_type'] = $fuel_type;
		$data['gearbox'] = $gearbox;
		$data['features'] = $features;
		/**/
		$id = insert_record($tblproducts,$data);
		
		if($id>0)
		{
			$user = get_records($tblusers ,"id='".$user_id."'");
			$data = array();
			$data['post_ads'] = ($user[0]['post_ads']-1);
			$condition = array();
			$condition['id'] = $user_id;
			$result = update_record($tblusers ,$data,$condition);

			$_SESSION['sysErr']['msg'] = "Record added successfully";
		}
	}
	
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

	header("location:add_product_detail.php?id=".enc_password($id));
	exit;
}
if($p=="add_product_detail"){
	$features_ids = implode('::', $_POST['features']);
	$fuel_type_ids = implode('::', $_POST['fuel_type']);
	foreach ($_POST as $k => $v )
	{
		if(!is_array($v)){
			$$k = addslashes($v);
			$_SESSION['sysData'][$k] = $v;
		}
	}
	
		$data = array();
		$data['brand'] = $brand;
		$data['year_registration'] = $year_registration;
		$data['driven'] = $driven;
		$data['fuel_type'] = $fuel_type_ids;
		// $data['gearbox'] = $gearbox;
		$data['features'] = $features_ids;
		$data['bedrooms'] =$bedrooms;
		$data['bathrooms'] =$bathrooms;
		$data['kitchens'] =$kitchens;
		$condition = array();
		$condition['id'] = dec_password($id);
		$result = update_record($tblproducts ,$data,$condition);
		//update vendor detail
		$data2 = array();
		$data2['name'] = $name;
		$data2['phone'] = $phone;
		$data2['email'] = $email;
		
		$condition2 = array();
		$condition2['id'] = dec_password($user_id);
		$result2 = update_record($tblusers ,$data2,$condition2); 
		if($result)
		{
			$_SESSION['sysErr']['msg'] = "Record updated successfully";
			sendmail( dec_password($user_id),'add posted');
		}
	
	
	header("location:dashboard.php");
	exit;
}

if($p=="login"){
	foreach ($_POST as $k => $v )
	{
		$$k = addslashes($v);
		$_SESSION['sysData'][$k] = $v;
	}
	
	if(!$email)
	{
		$_SESSION['sysErr']['email'] = "Please enter email";
		$flg = true;
	}
	
	$password = enc_password($password);
	$where = "email='".$email."' and password='".$password."' and status='1' and trash='0'";
	$result = get_records($tblusers,$where);
	if(count($result)>0)
	{  
		$_SESSION['user_record'] = $result[0];
		$data = array();
			$data['login'] = '1';
			$data['login_time'] = date("Y-m-d H:i:s");
			$condition = array();
			$condition['id'] = $result[0]['id'];

			$ans = update_record($tblusers ,$data,$condition);
		if($result[0]['type']=="1"){
			header("location: dashboard.php");
		} else {
			header("location: account.php");
		}
        exit;
	}
	else
	{
		$_SESSION['sysErr']['msg'] = "Invalid email or password !";
		header("location:login.php");
		exit;
	}
	
	header("location:".$_SESSION['page_url']);
	exit;
}
if($p=="partner_register"){
	foreach ($_POST as $k => $v )
	{
		$$k = addslashes($v);
		$_SESSION['sysData'][$k] = $v;
	}
	
	if(!$name)
	{
		$_SESSION['sysErr']['name'] = "Please enter name";
		$flg = true;
	}
	$user = get_records($tblusers,"email='".$email."' and id!='".$user_id."'");
	if(count($user)>0)
	{
		$_SESSION['sysErr']['name'] = "Email already in use";
		$flg = true;
	}
	if($flg)
	{
		header("location:".$_SESSION['page_url']);
		exit;
	}

	$password = enc_password($password);
	$data = array();
	$data = array();
	$data['member'] = date("ymdHis").rand(11,99);
	$data['name'] = $name;
	$data['email'] = $email;
	$data['password'] = $password;
	$data['type'] = "1";
	$id = insert_record($tblusers,$data);
	if($id>0)
	{
		$user = get_records($tblusers,"id='".$id."' and status='1'");
		if(count($user)>0){
			header("location:partner_account.php");
			exit;
		}
		$_SESSION['sysErr']['msg'] = "Record added successfully";
	}

	header("location:login.php");
	exit;
}
if($p=="register"){
	//pr($_POST);exit;
	foreach ($_POST as $k => $v )
	{
		$$k = addslashes($v);
		$_SESSION['sysData'][$k] = $v;
	}
	
	if(!$name)
	{
		$_SESSION['sysErr']['name'] = "Please enter name";
		$flg = true;
	}
	$user = get_records($tblusers,"email='".$email."' and id!='".$user_id."'");
	if(count($user)>0)
	{
		$_SESSION['sysErr']['name'] = "Email already in use";
		$flg = true;
	}
	if($flg)
	{
		header("location:".$_SESSION['page_url']);
		exit;
	}

	$password = enc_password($password);
	$data = array();
	$data = array();
	
	$data['name'] = $name;
	$data['img'] = $profile_img;
	$data['address'] = $address;
	$data['email'] = $email;
	$data['password'] = $password;
	$data['city'] = $city;
	$data['state'] = $state;
	$data['zip'] = $zip;
	$data['type'] = "0";

	$id = insert_record($tblusers,$data);
	
	if($id>0)
	{
		$user = get_records($tblusers,"id='".$id."' and status='1'");
		if(count($user)>0){
			header("location:account.php");
			exit;
		}
		$_SESSION['sysErr']['msg'] = "Record added successfully";
	}

	header("location:index.php");
	exit;
}

if($p=="my_account"){
	foreach ($_POST as $k => $v )
	{
		$$k = addslashes($v);
		$_SESSION['sysData'][$k] = $v;
	}
	
	if(!$name)
	{
		$_SESSION['sysErr']['name'] = "Please enter name";
		$flg = true;
	}
	if($password!=$cpassword)
	{
		$_SESSION['sysErr']['name'] = "New password and confirm password are not same";
		$flg = true;
	}
	$user = get_records($tblusers,"email='".$email."' and id!='".$user_id."'");
	if(count($user)>0)
	{
		$_SESSION['sysErr']['name'] = "Email already in use";
		$flg = true;
	}
	if(!$flg)
	{
		if( $user_id > 0 )
		{
			if($_FILES['img']['name']){  /// Add product images
					$files_arr = array();
					$files_arr['img']['name'] = $_FILES['img']['name'];
					$files_arr['img']['tmp_name'] = $_FILES['img']['tmp_name'];
					$files_arr['img']['size'] = $_FILES['img']['size'];
					
					$imgname = "";
				  $img_name = upload_img($files_arr,$dir_site_uploads,$imgname);
			}
			$password = enc_password($password);
			$data = array();
			$data['name'] = $name;
			if($imgname!=""){
			$data['img'] = $img_name;
			}
			$data['address'] = $address;
			$data['email'] = $email;
			$data['password'] = $password;
			$data['city'] = $city;
			$data['state'] = $state;
			$data['zip'] = $zip;
			$condition = array();
			$condition['id'] = $user_id;
			$result = update_record($tblusers,$data,$condition);
			
			if($result)
			{
				$_SESSION['sysErr']['msg'] = "Profile updated successfully";
			}
		}
	}
	header("location:".$_SESSION['page_url']);
	exit;
}
if($p=="partner_update_account"){
	foreach ($_POST as $k => $v )
	{
		$$k = addslashes($v);
		$_SESSION['sysData'][$k] = $v;
	}
	
	if(!$name)
	{
		$_SESSION['sysErr']['name'] = "Please enter name";
		$flg = true;
	}
	$user = get_records($tblusers,"email='".$email."' and id!='".$user_id."'");
	if(count($user)>0)
	{
		$_SESSION['sysErr']['name'] = "Email already in use";
		$flg = true;
	}
	if(!$flg)
	{
		if( $user_id > 0 )
		{
			$data = array();
			$data['name'] = $name;
			$data['address'] = $address;
			$data['email'] = $email;
			$data['city'] = $city;
			$data['state'] = $state;
			$data['zip'] = $zip;
			$condition = array();
			$condition['id'] = $user_id;
			$result = update_record($tblusers,$data,$condition);
			if($result)
			{
				$_SESSION['sysErr']['msg'] = "Record updated successfully";
			}
		}
	}
	header("location:".$_SESSION['page_url']);
	exit;
}
if($p=="change_password"){
	foreach ($_POST as $k => $v )
	{
		$$k = addslashes($v);
		$_SESSION['sysData'][$k] = $v;
	}
	
	if(!$password)
	{
		$_SESSION['sysErr']['password'] = "Please enter current password";
		$flg = true;
	}
	if(!$npassword)
	{
		$_SESSION['sysErr']['npassword'] = "Please enter new password";
		$flg = true;
	}
	if($npassword==$cpassword)
	{
		$_SESSION['sysErr']['cpassword'] = "New password and confirm password are not same";
		$flg = true;
	}
	$pass = enc_password($password);
	if($pass==$_SESSION['user_record']['password'])
	{
		$_SESSION['sysErr']['password'] = "Current password is incorrect";
		$flg = true;
	}

	if(!$flg)
	{
		$pass = enc_password($npassword);
		$data = array();
		$data['password'] = $pass;
		$condition = array();
		$condition['id'] = $_SESSION['user_record']['id'];
		$result = update_record($tblusers,$data,$condition);
		if($result)
		{
			$_SESSION['user_record']['password'] = $pass;
			$_SESSION['sysErr']['msg'] = "Your password has been changed successfully";
			sendmail($_SESSION['user_record']['id'],'change password');
		}
	}
	header("location:".$_SESSION['page_url']);
	exit;
}
if($p=="logout"){
	
	$data = array();
	$data['login'] = '0';
	
	$condition = array();
	$condition['id'] = $_SESSION['user_record']['id'];

	$ans = update_record($tblusers ,$data,$condition);
	$_SESSION['user_record'] = "";
	$lang = $_SESSION['lang'];
	unset($_SESSION['user_record']);
	session_destroy();
	session_start();
	$_SESSION['lang'] = $lang;
	header("location: index.php?p=login");
}

if($p=="subscribed"){
	
	foreach ($_POST as $k => $v )
	{
		$$k = addslashes($v);
		$_SESSION['sysData'][$k] = $v;
	}
	
	$data = array();
	$data['email'] = $email;
	$id = insert_record($tblsubscribed,$data);
	if($id>0)
	{
		$_SESSION['sysErr']['msg'] = "Email added successfully";
	}
	header("location:".$_SESSION['page_url']);
	exit;
}

if($p=="add_bidd"){
	foreach ($_POST as $k => $v )
	{
		if(!is_array($v)){
			$$k = addslashes($v);
			$_SESSION['sysData'][$k] = $v;
		}
	}
		$data = array();
		$data['user_id'] = $user_id;
		$data['product_id'] = $product_id;
		$data['amount'] = $bid_amount;
		$data['message'] = $bid_message;
		pr($data);
		$id = insert_record($tblbidding,$data);
		if($id>0)
		{
			$_SESSION['sysErr']['msg'] = "Record added successfully";
			
		}
		header("location:".$_SESSION['page_url']);
		exit;
	
}
if($p=="forgot_password"){

		$get_email = $_POST['email'];
		$email_check = get_records($tblusers,"email='".$get_email."'");

		foreach ($email_check as $r) {}
     	 $valid_email = $r['email'];
 		 $valid_id = $r['id'];
 		 $valid_passwoed = dec_password($r['password']);
		if($valid_email == $get_email)
			{
				sendmail($valid_id,'forgot password');
				echo 'Link sent to your email address';
				header("location: index.php");
			}
		else
			{
				echo'email you entered does not exixst';
			}
		exit;
		}
	if($p=="cookie_accept"){
		$_SESSION['cookie'] = "accept";
		header("location:".$_SESSION['page_url']);
		exit;
	}
	if($p=="close_offer"){
		$_SESSION['close_offer'] = "close";
		header("location:".$_SESSION['page_url']);
		exit;
	}
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

	header("location:dashboard.php");
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
	header("location:".$_SESSION['page_url']);
	exit;
}
?>
