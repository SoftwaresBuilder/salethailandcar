<?php
include('../config/config.php');

$categories = get_records($tblcategories);
if(count($categories)>0){
	foreach($categories as $v){
		$data = array();
		$data['sl_charges'] = $v['sl_charges'];
		$data['security_charges'] = $v['security_charges'];
		$data['rmgc_charges'] = $v['rmgc_charges'];
		$data['tax'] = $v['tax'];
		$data['water_charges'] = $v['water_charges'];
		$data['electric_charges'] = $v['electric_charges'];
		$condition = array();
		$condition['ptype_id'] = $v['id'];
		$result = update_record($tblproperties,$data,$condition);
		echo "<br>".$v['title']." Has updated<br>";
	}
}
echo "<br>All values have been updated<br>";
?>