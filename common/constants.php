<?php
$cons_sitetitle = getsettings("site title");
$max_results = getsettings("show records");
$top_offers = getsettings("top offers");
if(isset($_SESSION['lang']) and $_SESSION['lang']=="th"){
	$meta_tags = getsettings("meta tags th");
	$meta_description = getsettings("meta description th");
} else {
	$meta_tags = getsettings("meta tags en");
	$meta_description = getsettings("meta description en");
}
$cons_gmap_distance=100;
$thai_rate = '1'; /// I have removed multi currency option when enable set its rate
$usd_rate = '1'; /// I have removed multi currency option when enable set its rate

$cons_thai = "฿";
$cons_usd = "$";
$for_new_user = "new user";