<?php
include('../config/config.php');

$shops = get_records($tblproducts,"status='1' and trash='0'","id DESC","","id");

if(count($shops)>0){
	foreach($shops as $v){
		
		$sql = "SELECT COUNT(*) as total_reviews, SUM(rating) as rating FROM ".$tblreviews." WHERE status='1' and trash='0' and product_id='".$v['id']."'";
		$result = sql($sql);
		$rating = 0;
		$total_reviews = 0;
		if(count($result)>0){
			$total_reviews = $result[0]['total_reviews'];
			$rating = $result[0]['rating']/$total_reviews;
		}
		$data = array();
		$data['rating'] = round($rating);
		$data['total_reviews'] = $total_reviews;
		$condition = array();
		$condition['id'] = $v['id'];
		update_record($tblproducts,$data,$condition);
	}
}
?>