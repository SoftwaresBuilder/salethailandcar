<?php
function translate($text){
	global $lang_data;
	$new_text = strtolower($text);
	$new_text = str_replace(" ","_",$new_text);
	$new_text = str_replace("?","",$new_text);
	$new_text = str_replace("!","",$new_text);
	$new_text = str_replace("'","",$new_text);
	$new_text = str_replace(".","",$new_text);
	$text = (isset($lang_data[$new_text]))?$lang_data[$new_text]:$text;
	return $text;
}
function translate_api($text,$from="th",$to="en")
{
    $api = 'trnsl.1.1.20190923T051659Z.b513b7808b41eae4.2f4d48620d30c4afa4dc4a7ca1154e27f39f9172'; // TODO: Get your key from https://tech.yandex.com/translate/
    $url = file_get_contents('https://translate.yandex.net/api/v1.5/tr.json/translate?key=' . $api . '&lang=' . $from . '-' . $to . '&text=' . urlencode($text));
    $json = json_decode($url);
    return $json->text[0];
}

function upload_img($file,$path="",$img_name="",$allowed_types=array('jpg','jpeg','png','gif')){
	$type = @strtolower(end(explode('.',$file['img']['name']))); // partition before and after .
	if( in_array($type,$allowed_types) ){
		$rand = rand(1111,9999);
		$imgnew = ($img_name)?$img_name.".".$type:date("YmdHis").$rand.".".$type;
		if( move_uploaded_file($file['img']['tmp_name'],$path.$imgnew) ) // upload and save in dir folder
		{
			return $imgnew;
		} else {
			$_SESSION['sysErr']['img'] = "File ".$file['img']['name']." uploading Error";
		}
	} else {
		$allow = implode(', ',$allowed_types);
		$_SESSION['sysErr']['img'] = "Please only upload $allow files";
	}
	return false;
}
function add_watermark($img)
{
	
	$stamp = imagecreatefrompng('images/watermark.png');
	$im = imagecreatefromjpeg($img);

	$marge_right = 40;
	$marge_bottom = 60;
	$sx = imagesx($stamp);
	$sy = imagesy($stamp);

	imagecopy($im, $stamp, imagesx($im) - $sx - $marge_right, imagesy($im) - $sy - $marge_bottom, 0, 0, imagesx($stamp), imagesy($stamp));
	imagejpeg($im, $img);
	imagedestroy($im);
}
function admin_login_check(){
	if($_SESSION['adminrecord']['id']>0){
		return true;
	} else {
		$_SESSION['err_msg'] = "Please login your account";
		header("location:login.php");
	}
}
function show_errors(){
	///echo "<pre>"; print_r($_SESSION['sysErr']); echo "</pre>";
	if(isset($_SESSION['sysErr'])){
		if(count($_SESSION['sysErr'])>0){
			foreach($_SESSION['sysErr'] as $k=>$v){
				if(!is_array($v)){
					echo '<div class="row"><div class="col-md-12 err_div err">'.$v.'</div></div>';
					unset($_SESSION['sysErr'][$k]);
				}
			}
		}
	}
}
function redirect($page,$str=""){
	$url = makepage_url($page,$str);
	echo '<script>window.location="'.$url.'";</script>';
}
function dates_duration($dated,$type='ago')
{
	$date1 = $dated;
	$date2 = date("Y-m-d H:i:s");
	$diff = strtotime($date2) - strtotime($date1);
	if($diff>=0 and $type=='remaining')
	{
		return 'Time finish';
	}
	$diff = abs($diff);
	
	$years   = floor($diff / (365*60*60*24));
	if($years>0)
	{
		return $years.' years '.$type;
	}
	$months  = floor(($diff - $years * 365*60*60*24) / (30*60*60*24));
	if($months>0)
	{
		return $months.' months '.$type;
	}
	$days    = floor(($diff - $years * 365*60*60*24 - $months*30*60*60*24)/ (60*60*24));
	if($days>0)
	{
		return $days.' days '.$type;
	}
	$hours   = floor(($diff - $years * 365*60*60*24 - $months*30*60*60*24 - $days*60*60*24)/ (60*60));
	if($hours>0)
	{
		return $hours.' hours '.$type;
	}
	$minuts  = floor(($diff - $years * 365*60*60*24 - $months*30*60*60*24 - $days*60*60*24 - $hours*60*60)/ 60);
	if($minuts>0)
	{
		return $minuts.' minuts '.$type;
	}
	$seconds = floor(($diff - $years * 365*60*60*24 - $months*30*60*60*24 - $days*60*60*24 - $hours*60*60 - $minuts*60));
	if($seconds>0)
	{
		return $seconds.' seconds '.$type;
	}
}

function currency_converter($price,$convertfrom="thai",$convertin="usd")
{
	global $thai_rate;
	$new_price = 0;
	$convertfrom = strtolower($convertfrom);
	$convertin = strtolower($convertin);
	
	if($convertfrom == "thai" and $convertin == "usd")
	{
		$new_price = $price/$thai_rate;
	}
	else if($convertfrom == "usd" and $convertin == "thai")
	{
		$new_price = $price*$thai_rate;
	}
	else
	{
		$new_price = $price;
	}
	return $new_price;
}
function save_price($price)
{
	$price_rate = $_SESSION['price_rate'];
	$price = $price/$price_rate;
	return $price;
}
function show_price($price,$hide="",$show_format="")
{
	$cons_currency = $_SESSION['cons_currency'];
	$price_rate = $_SESSION['price_rate'];
	$price = $price*$price_rate;
	if($show_format)
	{
		$price = numberFormat($price);
	}
	$price = ($hide)?$price:$cons_currency.$price;
	return $price;
}


function get_product_imgs($id,$limit='')
{
	global $tblproduct_images, $web_site_uploads;
	$imgs = array();
	$product_images = get_records($tblproduct_images,"product_id='".$id."' and trash='0'","main DESC",$limit);
	if(count($product_images)>0){
		foreach ($product_images as $v) {
			$imgs[] = $web_site_uploads.$v['img'];
		}
	} else {
		$imgs[] = $web_site_uploads."no image.jpg";
	}
	return $imgs;
}
function get_upload_img($img)
{
	global $web_site_uploads;
	$img = ($img)?$img:"no image.jpg";
	return $web_site_uploads.$img;
}
function get_user_img($img)
{
	global $web_site_uploads;
	$img = ($img)?$img:"user.jpg";
	return $web_site_uploads.$img;
}
function get_product_featured($status=0)
{
	$status_arr = array('Simple','Featured');
	return $status_arr[$status];
}
function get_product_status($status=0)
{
	$status_arr = array('Pending','Active','Sold','Expired');
	return $status_arr[$status];
}
function get_category_status($status=0)
{
	$status_arr = array('Inactive','Active');
	return $status_arr[$status];
}
function get_user_status($status=0)
{
	$status_arr = array('Inactive','Active');
	return $status_arr[$status];
}

function update_date($date,$interval="0",$type="day")
{
	$sql = "SELECT DATE_ADD('".$date."', INTERVAL $interval $type) as newdate";
	$record = sql($sql);
	return $record[0]['newdate'];
}
function compare_dates($date1,$date2)
{
	$sql = "SELECT DATEDIFF( '".$date1."', '".$date2."' ) AS days";
	$record = sql($sql);
	return $record[0]['days'];
}
function dateFormat($date,$format='Y-m-d')
{
	if($date!="0000-00-00"){
		$date = date($format,strtotime($date));
		return $date;
	} else {
		return $date;
	}
}
function numberFormat($num)
{
	$dn=number_format($num, 2, '.', '');
	$num_d = number_format($dn, 2, '.', ',');
	
	return $num_d;
}
function pr($arr=array(),$exit=""){
	echo "<pre>";
	print_r($arr);
	echo "</pre>";
	if($exit){ exit; }
}

function enc_password($pass)
{
	global $salt;
	$newpass = "";
	if($pass)
	{
		$newpass = base64_encode($pass);
	}
	return $newpass;
}

function dec_password($pass)
{
	global $salt;
	$newpass = "";
	if($pass)
	{
		$newpass = base64_decode($pass);
	}
	return $newpass;
}

function getsettings($option)
{
	global $tblsettings;
	$where = "`option_name`='".$option."'";
	$setting = get_records($tblsettings,$where);
	if(count($setting)>0){
		return $setting[0]['value_name'];
	}
	return "";
}

function makepage_url($p="index",$query="")
{
	$p = ($p)?$p:"home";
	$url = $p.'.php';
	return $url.$query;
}
function getpage_url()
{
	$phpself = $_SERVER['REQUEST_URI'];
	$phpself = explode("/",$phpself);
	$ind = count($phpself)-1;
	$url = (count($phpself)>0)?$phpself[$ind]:'index.php';
	return $url;
}

function getpagename()
{
	$phpself = $_SERVER['PHP_SELF'];
	list($phpself) = explode(".php",$phpself);
	$phpself = explode("/",$phpself);
	$count = count($phpself)-1;
	return $phpself[$count];
}

function formspecialchars($var)
{
	$pattern = '/&(#)?[a-zA-Z0-9]{0,};/';
   
	if (is_array($var)) {    // If variable is an array
		$out = array();      // Set output as an array
		foreach ($var as $key => $v) {     
			$out[$key] = formspecialchars($v);         // Run formspecialchars on every element of the array and return the result. Also maintains the keys.
		}
	} else {
		$out = $var;
		while (preg_match($pattern,$out) > 0) {
			$out = htmlspecialchars_decode($out,ENT_QUOTES);      
		}                            
		$out = htmlspecialchars(stripslashes(trim($out)), ENT_QUOTES,'UTF-8',true);     // Trim the variable, strip all slashes, and encode it
	   
	}
   
	return $out;
}
///////////////////////////////////////////////////////////////
function sendmail($userid,$type,$confirmationLink="")
{
	global $tblusers,$tblemails;
	$headers  = 'MIME-Version: 1.0' . "\r\n";
	$headers .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";
	
	$where = "id='".$userid."'";
	$user = get_records($tblusers,$where);
	//pr($user); exit;
	if(count($user)>0){
		$user = $user[0];
		$name = $user['name'];
		$email = $user['email'];
		$pass = $user['pass'];
		
		$where = "type='".$type."'";
		$content = get_records($tblemails,$where);
		$content = $content[0];
		$adminName = $content['adminname'];
		$adminEmail = $content['adminemail'];
		$subject = $content['subject'];
		$body = $content['body'];
		
		$headersuser = $headers.'From: '.$adminName.' <'.$adminEmail.'>' . "\r\n";
		
		$message = str_replace("{{Name}}",$name,$body);
		$message = str_replace("{{Email}}",$email,$message);
		$message = str_replace("{{Password}}",$pass,$message);
		$message = str_replace("{{ConfirmationLink}}",$confirmationLink,$message);
		$message = nl2br($message);
		
		$mailsent = @mail($email,$subject,$message,$headersuser);
	}
}
function sendmail_bidding($userid,$type,$bid_id)
{
	//echo $userid . ' / ' . $type . ' / ' . $bid_id; exit;

	$headers  = 'MIME-Version: 1.0' . "\r\n";
	$headers .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";
	
	$where = "id='".$userid."'";
	$user = get_records($tblusers,$where);

	$where = "id='".$bid_id."'";
	$bidding_detail = get_records($tblbidding,$where);

	$where = "id='".$bidding_detail[0]['product_id']."'";
	$product_name = get_records($tblproducts,$where);
	
	if(count($user)>0){
		$user = $user[0];
		$name = $user['name'];

		$where = "type='".$type."'";
		$content = get_records($tblemails,$where);
		$content = $content[0];
		$adminName = $content['adminname'];
		$adminEmail = $content['adminemail'];
		$subject = $content['subject'];
		$body = $content['body'];
		
		$headersuser = $headers.'From: '.$adminName.' <'.$adminEmail.'>' . "\r\n";
		
		$message = str_replace("{{Name}}",$name,$body);
		$message = str_replace("{{bid_product}}",$product_name[0]['title'],$message);
		$message = str_replace("{{bid_amount}}",$bidding_detail[0]['amount'],$message);
		$message = nl2br($message);
		
		$mailsent = @mail($email,$subject,$message,$headersuser);
	}
}

function generateCode($characters) 
{
	/* list all possible characters, similar looking characters and vowels have been removed */
	$possible = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ'; 
	$code = '';
	$i = 0;
	while ($i < $characters) 
	{ 
		$code .= substr($possible, mt_rand(0, strlen($possible)-1), 1);
		$i++;
	}
	return $code;
}

function vpemail ($valoare)
{
	// Email
	if (!preg_match("/^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,3})$/", $valoare) || empty($valoare))
	{
		return true;
	}
}

function showstring($val,$num="",$break="") ///Using this in SS
{
	$val = stripslashes($val);
	if($break)
	{
		$val = wordwrap($val,$num);
	}
	else if($num<strlen($val) and $num>0)
	{
		$val = substr($val,0,$num)."...";
	}
	else
	{
		$val = $val;
		$val = nl2br($val);
	}
	return $val;
}

function splitlimit($string, $length = 50, $ellipsis = '...')
{
   if (strlen($string) > $length)return substr($string, 0, $length) . ' ' . $ellipsis;
   else return $string;
}
// function translate($text){
// return $text;
// }

?>