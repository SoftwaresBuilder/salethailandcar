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
?>