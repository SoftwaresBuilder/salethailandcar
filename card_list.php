<?php
$imgs = get_product_imgs($product['id'],'1');
?>
<div class="row mybox5">
	<div class="col-12 col-md-3">
		<div class="imgdiv">
			<a href="<?php echo makepage_url("product_detail","?slug=".$product['slug_en']);?>"><img src="<?php echo $imgs[0]['img'];?>" alt="<?php echo $imgs[0]['alt'];?>"></a>
		</div>
	</div>
	<div class="col-12 col-md-3">
		<a href="<?php echo makepage_url("product_detail","?slug=".$product['slug_en']);?>"><?php echo showstring($product['title_'.$lang],"20");?></a><br>
		<strong><?php echo translate("Views");?> : </strong><?php echo $product['views'];?><br>
		<strong> <?php echo translate("Posted On");?> : </strong><?php echo dateFormat($product['created_date']);?><br>
		<strong><?php echo translate("Location");?> : </strong><?php echo $product['location'];?>
	</div>
	<div class="col-12  col-md-2">
		<?php echo show_price($product['price']);?>
	</div>
	<div class="col-12 col-md-2">
		<a href="<?php echo makepage_url("edit_product","?id=".enc_password($product['id']));?>" title="<?php echo translate('Edit Product'); ?>"><i class="fa fa-pencil"></i></a>
		<!-- <a href="process.php?p=delproduct&id=<?= enc_password($product['id']);?>" title="Delete Product"><i class="fa fa-trash"></i></a> -->
		<a href="javascript:;" onclick="delete_record('process.php?p=delproduct&id=<?= enc_password($product['id']);?>');" data-toggle="modal" data-target="#delete" title="<?php echo translate('Delete Record'); ?>"><i class="fa fa-trash"></i></a>
		<a href="<?php echo makepage_url("edit_product_images","?id=".enc_password($product['id']));?>" title="<?php echo translate('Upload Images'); ?>"><i class="fa fa-image"></i></a>
	</div>
	<?php if($product['status']!=0){ ?> 
	<div class="col-12 col-md-1" id="action_<?php echo $product['id'];?>">
        <?php 
        if($product['status']!=1 and $product['status']!=0){
        ?>
            <a href ="javascript:void(0);" onclick="update_status(1,<?php echo $product['id']; ?>);">Activate</a>
        <?php
        } if($product['status']!=2){
        ?>
            <a href ="javascript:void(0);" onclick="update_status(2,<?php echo $product['id']; ?>);">Sold</a>
        <?php
        } if($product['status']!=3){
        ?>
            <a href="javascript:void(0);" onclick="update_status(3,<?php echo $product['id']; ?>);">Expired</a>
        <?php
        }
        ?>
                                 
     </div>
    <div class="col-12 col-md-1" id="bump_up_<?php echo $product['id'];?>">  <a href="javascript:void(0);" onclick="bump_up(<?php echo $product['id']; ?>);"> Bump up </a>
    </div>
    <?php  }  ?>  
</div>
