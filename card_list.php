<?php
$imgs = get_product_imgs($product['id'],'1');
?>
<div class="row mybox5">
	<div class="col-12 col-md-4">
		<div class="imgdiv">
			<img src="<?php echo $imgs[0];?>">
		</div>
	</div>
	<div class="col-12 col-md-4">
		<?php echo $product['title'];?><br>
		<?php echo $product['views'];?><br>
		<?php echo dateFormat($product['created_date']);?><br>
		<?php echo $product['location'];?>
	</div>
	<div class="col-12  col-md-2">
		<?php echo show_price($product['price']);?>
	</div>
	<div class="col-12 col-md-2">
		Action
	</div>
</div>
