<?php
$imgs = get_product_imgs($product['id'],'1');
$sub_cat=get_records($tblcategories,"id='".$sub_cat_id."' and trash=0");

?>
<div class="mybox2">
	<div class="row">

	<div class="col-6">
		<div class="col-12">
			<a href="<?php echo makepage_url("product_detail","?slug=".$product['slug_en']);?>" style=" text-decoration: none; font-weight: bold;"><?php echo splitlimit($product['title_'.$lang],'20','...');?></a>
		</div>
		<div class="col-12"><i class="fa fa-usd"></i>&nbsp;<?php echo $product['price'];?></div>
		<div class="col-12">
			<i class="fa fa-map-marker"></i>&nbsp;<?php echo splitlimit($product['location'],'30','...');?>
		</div>
		<div class="col-12">
			<i class="fa fa-home"></i>&nbsp;<?php echo splitlimit($sub_cat[0]['title_'.$lang],'30','...');?>
		</div>
	</div>
	<div class="col-6" style="padding-right: 30px;">
		<div class="imgdiv4">
			<a href="<?php echo makepage_url("product_detail","?slug=".$product['slug_en']);?>"><img
			 src="<?php echo $imgs[0]['img'];?>" alt="<?php echo $imgs[0]['alt'];?>" class=""></a>
			
		</div>
	</div>
</div>
</div>
