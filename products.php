<?php
$where_extra = (isset($where_extra))?$where_extra:" and status='1'";
$where = "user_id='".$user_id."' and trash='0'".$where_extra;
$products = get_records($tblproducts,$where,"id DESC");
?>
<div class="container">
	<div class="row">
		<div class="col-12 col-lg-6 heading">Products</div>
		<div class="col-12 col-lg-6"><a href="add_product.php" class="btn btn-primary pull-right">Post Ads</a></div>
	</div>
    <div class="section_spacer">
    	<div class="row">
    		<div class="col-12">
	        <table class="table table-hover table-striped mytable">
                <thead>
                    <tr>
                        <th>Category</th>
                        <th>SubCategory</th>
                        <th>Product Name</th>
                        <th>Price</th>
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
                            </tr>
                            <?php
                        }
                    } else {
                        echo '<tr><td class="err" colspan="4">No record found</td></tr>';
                    }
                    ?>
                </tbody>
            </table>
    		</div>
    	</div>
    </div>
</div>
