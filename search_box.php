<?php
$subcategories = array();
if($id>0){
	$subcategories = get_records($tblcategories,"pid='".$id."' and status='1' and trash='0'");
	//$brands = get_records($tblcategory_types,"category_id='".$id."' and trash='0'");
	$subcategories1 = get_records($tblcategories,"banner_name !='NULL' and status='1' and trash='0'");
}
?>
<div class="row search_box">
	
	<div <?php if($flag_for_location){?> style="display: none;" <?php } ?> class="col-12 border_bottom pt10"><input type="text" class="form-control" placeholder="<?php echo translate("Location");?>" name="location" value="<?php echo $location;?>"></div>
	<div class="col-12 border_bottom">
		
		<select class="form-control">
			<option value=""><?php echo translate("lang_text32");?></option>
		</select>
	</div>
	<div class="col-12 border_bottom">
		<select class="form-control" id="price_sort" onchange="get_filter_products();">
			<option value="default"><?php echo translate("Sort By");?></option>

                                
          <option value="low_to_high"><?php echo translate("Price Low to High");?></option>
          <option value="high_to_low"><?php echo translate("Price High to Low");?></option>
		</select>
	</div>
	<div class="col-12 heading2"><?php echo $category[0]['title_'.$lang];?></div>
	<?php
	if(count($subcategories)>0){
		foreach ($subcategories as $v) {?>

			<div class="col-12"><input id="check_id_<?php echo $v['id'];?>" type="checkbox" onclick="get_filter_products()" name="checklist" value="<?php echo $v['id'];?>">&nbsp;<?php echo $v['title_'.$lang];?></div>

		<?php }}
		?>
		<div id="brand_title" style="display: none;" class="col-12 heading2">Brand</div>
		<div id="brand_div" style="height: 300px;width:100%;overflow: auto; display: none">
			<input type="hidden" id="for_brand" name="" value="">
		<div id="items"></div>
		
		</div>
	</div>
<script type="text/javascript">

</script>