<?php
$imgs = get_product_imgs($product['id'],'1');
?>
<div class="row mybox2">
	<div class="col-12">
		<div class="imgdiv">
			<a href="<?php echo makepage_url("product_detail","?id=".enc_password($product['id']));?>"><img src="<?php echo $imgs[0]['img'];?>"></a>

			<?php include("like.php");?>
		</div>
	</div>
	<div class="col-12 title"><a href="<?php echo makepage_url("product_detail","?id=".enc_password($product['id']));?>"><?php echo showstring($product['title_'.$lang],"20");?></a></div>

	<div class="col-12"><i class="fa fa-phone"></i>&nbsp;<?php echo showstring($product['location'],"20");?></div>
	<div class="col-4"><i class="fa fa-phone"></i>&nbsp;<?php echo showstring($product['type'],"20");?></div>
	<div class="col-4"><i class="fa fa-phone"></i>&nbsp;<?php echo show_price($product['price']);?></div>
	<?php if($product['status']==1)
	{
	echo '<div class="col-4"><i class="fa fa-phone"></i>&nbsp;Active</div>';
	}
	else if($product['status']==2)
	{
	echo '<div class="col-4"><i class="fa fa-phone"></i>&nbsp;Sold</div>';
	}
	else if($product['status']==3)
	{
	echo '<div class="col-4"><i class="fa fa-phone"></i>&nbsp;Expired</div>';
	}
	 ?>
	

	<div class="col-12"><a href="<?php echo makepage_url("product_detail","?id=".enc_password($product['id']));?>" class="btn btn-primary full_width"><?php echo translate("View Detail");?></a></div>
</div>
