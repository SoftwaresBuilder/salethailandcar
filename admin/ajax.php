<?php
include('../config/config.php');
unset($_SESSION['sysErr']);
unset($_SESSION['sysData']);
$p = $_GET['p'];//get page reference to execute the related condition


if($p == "update_bill"){
	if(isset($_GET['id'])){
		$id = $_GET['id'];
		$paid_type = $_GET['paid_type'];
		$bill = $_GET['bill'];
		
		$get_bill = get_records($tblbills, "id='".$id."'");
		
		if(count($get_bill)>0){
			$data = array();
			$data['paid_type'] = $paid_type;
			$data['paid_amount'] = $bill;
			$data['paid_date'] = date("Y-m-d");
			$data['paid'] = '1';
			$condition = array();
			$condition['id'] = $id;
			$result = update_record($tblbills,$data,$condition);
			
			$arrears = $get_bill[0][$paid_type]-$bill;  /// total amount - paid maount
			
			$data = array();
			$data['arrears'] = $arrears;
			$condition = array();
			$condition['id'] = $get_bill[0]['property_id'];
			$result = update_record($tblproperties,$data,$condition);
			
			///echo get_bill_status($status);
			echo 'Paid &nbsp;&nbsp;<a href="index.php?p=property_bills&id='.enc_password($get_bill[0]['property_id']).'" title="Property Bills" style="float:right;"><i class="fa fa-list-alt"></i></a>';
		}
	}
	exit;
}
if($p=="translate_into_thai"){    
    $description = $_GET['description'];
    if($description)
    {
    	echo $result = translate_api($description,"en","th");
    }
	exit;
}	
if($p=="update_submodels"){
	$id = $_POST['id'];
	$submodels = get_records($tblcategory_submodels,"type_id='".$id."'","title_en ASC");
	$html = '<option value="">Select Submodels</option>';
	if(count($submodels)>0){
		foreach ($submodels as $v) {
			$html .= '<option value="'.$v['id'].'">'.$v['title_en'].'</option>';
		}
	} else {
		$html = "no";
	}
	echo $html;
	exit;
}
if($p == "set_image_attribute"){
	
		$id = $_GET['id'];
		$p_id = $_GET['p_id'];
		$alt = $_GET['alt'];
		$description = $_GET['description'];
		$is_main = $_GET['is_main'];
		if($id){
			if($is_main!=0)
			{
			$data2 = array();
			$data2['main'] = 0;
			$condition2 = array();
			$condition2['product_id'] =$p_id ;
			$result2 = update_record($tblproduct_images,$data2,$condition2);
			}
			$data = array();
			$data['alt'] = $alt;
			$data['description'] = $description;
			$data['main'] = $is_main;
			$condition = array();
			$condition['id'] = $id;
			$result = update_record($tblproduct_images,$data,$condition);
		}
	exit;
}
?>