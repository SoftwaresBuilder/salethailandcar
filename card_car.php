<?php
$imgs = get_product_imgs($product['id'],'1');
?>
<div class="row mybox2">
	<div class="col-12">
		<div class="imgdiv">
			<img src="<?php echo $imgs[0]['img'];?>">
			<?php include("like.php");?>
		</div>
	</div>
	<div class="col-12 title"><?php echo showstring($product['title_'.$lang],"20");?></div>

	<div class="col-12"><i class="fa fa-phone"></i>&nbsp;<?php echo $product['location'];?></div>
	<div class="col-4"><i class="fa fa-phone"></i>&nbsp;N/A</div>
	<div class="col-4"><i class="fa fa-phone"></i>&nbsp;N/A</div>
	<div class="col-4"><i class="fa fa-phone"></i>&nbsp;N/A</div>

	<div class="col-4"><i class="fa fa-phone"></i>&nbsp;N/A</div>
	<div class="col-4"><i class="fa fa-phone"></i>&nbsp;N/A</div>
	<div class="col-4"><i class="fa fa-phone"></i>&nbsp;N/A</div>

	<div class="col-12"><a href="<?php echo makepage_url("product_detail","?id=".enc_password($product['id']));?>" class="btn btn-primary full_width"><?php echo translate("View Detail");?></a></div>
</div>
