
<?php
$imgs = get_product_imgs($product['id'],'1');
?>
<div class="row mybox2">
	<?php include('status.php'); ?>
	<div class="col-12">
		<div class="imgdiv">
			<a href="<?php echo makepage_url("product_detail","?id=".enc_password($product['id']));?>"><img src="<?php echo $imgs[0]['img'];?>"></a>
			<?php include("like.php");?>
			
		</div>
	</div>
	<div class="col-12 title"><a href="<?php echo makepage_url("product_detail","?id=".enc_password($product['id']));?>"><?php echo showstring($product['title_'.$lang],"20");?></a></div>

	<div class="col-12"><i class="fa fa-map-marker"></i>&nbsp;<?php echo showstring($product['location'],"20");?></div>

	<div class="col-4 card_feature"><i class="fa fa-car"></i>&nbsp;<?php echo $product['type'];?></div>
	<div class="col-4 card_feature"><i class="fa fa-cog"></i>&nbsp;<?php echo $product['year_registration'];?></div>
	<div class="col-4 card_feature"><i class="fa fa-tachometer"></i>&nbsp;<?php echo $product['driven'];?></div>

	<?php
	/**
	?>
	<div class="col-4 card_feature"><i class="fa fa-copyright"></i>&nbsp;<?php echo $product['brand'];?></div>
	<div class="col-4 card_feature"><i class="fa fa-copyright"></i>&nbsp;<?php echo $product['model'];?></div>
	<div class="col-4 card_feature"><i class="fa fa-fire"></i>&nbsp;<?php echo $product['fuel_type'];?></div>
	<?php
	/**/
	?>
	
	<div class="col-12"><a href="<?php echo makepage_url("product_detail","?id=".enc_password($product['id']));?>" class="btn btn-primary full_width"><?php echo translate("View Detail");?></a></div>
</div>
