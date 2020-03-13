<?php
$sql = "SELECT p.* FROM $tblproduct_favorites pf
        LEFT JOIN $tblproducts p on p.id=pf.product_id
        WHERE pf.user_id='".$user_id."' ORDER BY pf.id DESC";
$products = sql($sql);
?>
<div class="container">
	<div class="row">
		<div class="col-12 heading"><?php echo translate("Favorite Products");?></div>
	</div>
    <div class="section_spacer">
    	<div class="row">
    		<div class="col-12">
	        <table class="table table-hover table-striped mytable">
                <thead>
                    <tr>
                        <th><?php echo translate("Category");?></th>
                        <th><?php echo translate("SubCategory");?></th>
                        <th><?php echo translate("Product");?> Name</th>
                        <th><?php echo translate("Price");?></th>
                        <th><?php echo translate("Action");?></th>
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
                                <td><?php echo $category[0]['title_'.$lang]; ?></td>
                                <td><?php echo $subcategory[0]['title_'.$lang]; ?></td>
                                <td><a href="<?php echo makepage_url("product_detail","?id=".enc_password($v['id']));?>"><?php echo $v['title_'.$lang]; ?></a></td>
                                <td><?php echo show_price($v['price']); ?></td>
                                <td>
                                    <a href="javascript:;" onclick="delete_record('process.php?p=delfavorite&id=<?= enc_password($v['id']); ?>');" data-toggle="modal" data-target="#delete" title="<?php echo translate("Delete Record");?>"><i class="fa fa-trash"></i></a>
                                </td>
                            </tr>
                            <?php
                        }
                    } else {
                        echo '<tr><td class="err" colspan="5">'. translate("No record found"). '</td></tr>';
                    }
                    ?>
                </tbody>
            </table>
    		</div>
    	</div>
    </div>
</div>
