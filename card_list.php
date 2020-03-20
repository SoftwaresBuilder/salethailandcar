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
		<strong><?php echo translate("Views");?> : </strong><?php echo $product['views'];?><br>
		<strong> <?php echo translate("Posted On");?> : </strong><?php echo dateFormat($product['created_date']);?><br>
		<strong><?php echo translate("Location");?> : </strong><?php echo $product['location'];?>
	</div>
	<div class="col-12  col-md-2">
		<?php echo show_price($product['price']);?>
	</div>
	<div class="col-12 col-md-2">
		<a href="<?php echo makepage_url("add_product","?id=".enc_password($product['id']));?>" title="Edit Product"><i class="fa fa-pencil"></i></a>
		<!-- <a href="process.php?p=delproduct&id=<?= enc_password($product['id']);?>" title="Delete Product"><i class="fa fa-trash"></i></a> -->
		<a href="javascript:;" onclick="delete_record('process.php?p=delproduct&id=<?= enc_password($product['id']);?>');" data-toggle="modal" data-target="#delete" title="Delete Record"><i class="fa fa-trash"></i></a>&nbsp;&nbsp;
	</div>
</div>
