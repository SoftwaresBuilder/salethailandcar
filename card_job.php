<?php
$imgs = get_product_imgs($product['id'],'1');
?>
<div class="row mybox2">
	<?php include('status.php'); ?>
	<div class="col-12">
		<div class="imgdiv">
			<a href="<?php echo makepage_url("product_detail","?slug=".($product['slug_en']));?>"><img src="<?php echo $imgs[0]['img'];?>"></a>
			<?php include("like.php");?>
		</div>
	</div>

	<div class="col-12 title"><a href="<?php echo makepage_url("product_detail","?slug=".($product['slug_en']));?>"><?php echo  showstring($product['title_'.$lang],"20");?></a></div>
	<div class="col-12"><i class="fa fa-map-marker"></i>&nbsp;<?php echo showstring($product['location'],"25");?></div>
	<div class="col-12"><?php echo show_price($product['price']);?></div>
	<div class="col-12"><a href="<?php echo makepage_url("product_detail","?slug=".($product['slug_en']));?>" class="btn btn-primary full_width"><?php echo translate("View Detail");?></a></div>
</div>
	