<?php
include('../config/config.php');
header('Content-Type: text/html; charset=utf-8');
require_once __DIR__ . '/simplexlsx.class.php';

$excel_file = 'categories.xlsx';
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
				$parent_slug = $v[0];
				$parent_category = get_records($tblcategories,"slug='".$parent_slug."'");
				if(count($parent_category)>0){	
					$insertData['pid'] = $parent_category[0]['id'];
				} else {
					$insertData['pid'] = '0';
				}
				$insertData['title_'.$lang_'.$lang] = $v[1];
				$insertData['slug'] = $v[2];
				$insertData['description'] = $v[3];
				$insertData['region'] = ($v[4])?$v[4]:'Whole world';
				$insertData['img'] = ($v[5])?$v[5]:$v[2].'.jpg';
				$id = insert_record($tblcategories,$insertData);
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