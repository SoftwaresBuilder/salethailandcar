<?php
include('../config/config.php');
header('Content-Type: text/html; charset=utf-8');
require_once __DIR__ . '/simplexlsx.class.php';

$excel_file = 'products.xlsx';
///$excel_file = 'test.xlsx';

if ( $xlsx = SimpleXLSX::parse($excel_file)) {
	$result_array = $xlsx->rows();
	echo '<h1>Total Records: '.count($result_array).'</h1>';
	if(count($result_array)>0)
	{
		$count = 0;
		foreach($result_array as $k=>$v)
		{
			if($k>0){
				$insertData = array();
				$insertData['title'] = $v[0];
				$insertData['slug'] = $v[1];
				$insertData['description'] = $v[2];
				$insertData['purchase_price'] = $v[3];
				$insertData['sale_price'] = $v[4];
				$insertData['discount'] = $v[5];
				$insertData['discount_type'] = $v[6];
				$insertData['qty'] = $v[7];
				$insertData['check_stock'] = $v[8];
				$insertData['region'] = $v[9];
				$id = insert_record($tblproducts,$insertData);
				if($id>0){
					$count++;
				}
			}
		}
		echo "$count Records have been inserted from ".(count($result_array)-1)." records";
	} else {
		echo "No record found";
	}
} else {
	echo SimpleXLSX::parse_error();
}
?>