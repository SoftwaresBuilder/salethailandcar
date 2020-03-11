<?php
$imgs = get_product_imgs($product['id'],'1');

?>
<div class="mybox2">
	<div class="row">

	<div class="col-6">
		<div class="col-12">
			<a href="<?php echo makepage_url("product_detail","?id=".enc_password($product['id']));?>" style=" text-decoration: none; font-weight: bold;"><?php echo splitlimit($product['title'],'20','...');?></a>
		</div>
		<div class="col-12"><i class="fa fa-usd"></i>&nbsp;<?php echo $product['price'];?></div>
		<div class="col-12">
			<i class="fa fa-map-marker"></i>&nbsp;<?php echo splitlimit($product['location'],'30','...');?>
		</div>
	</div>
	<div class="col-6" style="padding-right: 30px;">
		<div class="imgdiv4">
			<a href="<?php echo makepage_url("product_detail","?id=".enc_password($product['id']));?>"><img
			 src="<?php echo $imgs[0];?>" class=""></a>
			
		</div>
	</div>
</div>
</div>
