<?php
$where_extra = (isset($where_extra))?$where_extra:" and status>='1'";
$where = "user_id='".$user_id."' and trash='0'".$where_extra;
$products = get_records($tblproducts,$where,"id DESC");
?>
<div class="container">
	<div class="row">
		<div class="col-12 col-lg-6 heading"><?php echo translate("Products");?></div>
		<div class="col-12 col-lg-6"><a href="add_product.php" class="btn btn-primary pull-right"><?php echo translate("Post Ads");?></a></div>
	</div>
    <div class="section_spacer" style="border: 1px solid #ccc;">
    	<div class="row">
            <div class="col-12 d-none d-md-block">
                <div class="row text-center">
            		<div class="col-12 col-md-4">
                        <strong>Photo</strong> 
                    </div>
                    <div class="col-12 col-md-4">
                       <strong>Ads Details</strong> 
                    </div>
                    <div class="col-12  col-md-2">
                       <strong>Price</strong> 
                    </div>
                    <div class="col-12 col-md-2">
                       <strong>Action</strong> 
                    </div>
                </div><hr>
            </div>
    	</div>
        <?php
        if (count($products) > 0) {
            foreach ($products as $product) {
                include("card_list.php");
            }
        }
        ?>
    </div>
</div>
