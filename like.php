<?php
if($user_id>0){
	$liked = get_records($tblproduct_favorites,"user_id='".$user_id."' and product_id='".$product['id']."'");
	
	if(count($liked)>0){
	?>
		<i class="fa fa-heart liked"></i>
	<?php
	} else {
	?>
		<a href="process.php?p=like_product&id=<?php echo enc_password($product['id']);?>"><i class="fa fa-heart like"></i></a>

	<?php
	}
}
?>