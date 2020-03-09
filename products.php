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
    <div class="section_spacer">
    	<div class="row">
    		<div class="col-12">
	        <table class="table table-hover table-striped mytable">
                <thead>
                    <tr>
                        <th><?php echo translate("Category");?></th>
                        <th><?php echo translate("SubCategory");?></th>
                        <th><?php echo translate("Product Name");?></th>
                        <th><?php echo translate("Price");?></th>
                        <th><?php echo translate("Action");?></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
        <?php
        if (count($products) > 0) {
            foreach ($products as $v) {
            	$category = get_records($tblcategories,"id='".$v['category_id']."'");
            	$subcategory = get_records($tblcategories,"id='".$v['subcategory_id']."'");
                ?>
                <tr>
                    <td><?php echo $category[0]['title']; ?></td>
                    <td><?php echo $subcategory[0]['title']; ?></td>
                    <td><a href="<?php echo makepage_url("product_detail","?id=".enc_password($v['id']));?>"><?php echo $v['title']; ?></a></td>
                    <td><?php echo show_price($v['price']); ?></td>
                    
                    <td id="action_<?php echo $v['id'];?>">
                        <?php 
                        if($v['status']!=1 and $v['status']!=0){
                        ?>
                            <a href ="javascript:void(0);" onclick="update_status(1,<?php echo $v['id']; ?>);"><?php echo translate("Activate");?></a>
                        <?php
                        } if($v['status']!=2){
                        ?>
                            <a href ="javascript:void(0);" onclick="update_status(2,<?php echo $v['id']; ?>);"><?php echo translate("Sold");?></a>
                        <?php
                        } if($v['status']!=3){
                        ?>
                            <a href="javascript:void(0);" onclick="update_status(3,<?php echo $v['id']; ?>);"><?php echo translate("Expired");?></a>
                        <?php
                        }

                        ?>
                    </td>
                    <td id="bump_up_<?php echo $v['id'];?>">  <a href="javascript:void(0);" onclick="bump_up(<?php echo $v['id']; ?>);"> <?php echo translate("Bump up");?> </a></td>
                </tr>
                <?php
            }
        } else {
            echo '<tr><td class="err" colspan="4">'. translate("No record found"). '</td></tr>';
        }
        ?>
                </tbody>
            </table>
    		</div>
    	</div>
    </div>
</div>
