<?php
$subcategories = array();
if(isset($_GET['id'])){
	$category_id = dec_password($_GET['id']);
	$subcategories = get_records($tblcategories,"pid='".$category_id."' and status='1' and trash='0'");
	$subcategories1 = get_records($tblcategories,"banner_name !='NULL' and status='1' and trash='0'");
	//pr($subcategories1);
	
}
?>
<div class="row search_box">
	
	<div <?php if($flag_for_location){?> style="display: none;" <?php } ?> class="col-12 border_bottom pt10"><input type="text" class="form-control" placeholder="<?php echo translate("Location");?>" name=""></div>
	<div class="col-12 border_bottom">
		
		<select class="form-control">
			<option value=""><?php echo translate("Near By (Km)");?></option>
		</select>
	</div>
	<div class="col-12 border_bottom">
		<select class="form-control" id="price_sort" onchange="sort_by_price();">
			<option value="default"><?php echo translate("Sort By");?></option>

                                
          <option value="low_to_high"><?php echo translate("Price Low to High");?></option>
          <option value="high_to_low"><?php echo translate("Price High to Low");?></option>
		</select>
	</div>
	<div class="col-12 heading2"><?php echo $category[0]['title'];?></div>
	<?php
	if(count($subcategories)>0){
		foreach ($subcategories as $v) {?>

			<div class="col-12"><input id="check_id_<?php echo $v['id'];?>" type="checkbox"  onclick="get_filter_products(<?php echo $v['id'];?>)" name="checklist" value="<?php echo $v['id'];?>">&nbsp;<?php echo $v['title'];?></div>

		<?php }}
		?>
	</div>
