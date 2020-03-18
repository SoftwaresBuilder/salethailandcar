<?php
$imgs = get_product_imgs($product['id'],'1');
?>
<div class="row mybox5">
	<div class="col-12 col-md-4">
		<div class="imgdiv">
			<a href="<?php echo makepage_url("product_detail","?id=".enc_password($product['id']));?>"><img src="<?php echo $imgs[0]['img'];?>" alt="<?php echo $imgs[0]['alt'];?>"></a>
		</div>
	</div>
	<div class="col-12 col-md-4">
		<a href="<?php echo makepage_url("product_detail","?id=".enc_password($product['id']));?>"><?php echo showstring($product['title_'.$lang],"20");?></a><br>
		<?php echo $product['views'];?><br>
		<div><strong> <?php echo translate("Posted On");?> :</strong><?php echo dateFormat($product['created_date']);?></div><br>
		<?php echo $product['location'];?>
	</div>
	<div class="col-12  col-md-2">
		<?php echo show_price($product['price']);?>
	</div>
	<div class="col-12 col-md-2">
		<a href="<?php echo makepage_url("add_product","?id=".enc_password($product['id']));?>" title="Edit Product"><i class="fa fa-pencil"></i></a>
	</div>
</div>
