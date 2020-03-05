<div class="row section_spacer">
  <?php
	if(count($parent_categories)>0){
		foreach ($parent_categories as $v) {
			$subcategories = get_records($tblcategories,"pid='".$v['id']."' and status='1' and trash='0'","title ASC","0,5");
		?>
			<div class="col-12 col-md-3">
				<div class="mybox">
			  <div class="col-12"><i class="fa fa-cart-plus"></i></div>
			  <div class="col-12 title"><?php echo $v['title'];?></div>
			  <div class="col-12">
			  	<?php
			  	if(count($subcategories)>0){
			  		foreach($subcategories as $v2){
				  	?>
				  		<a href="<?php echo makepage_url("search","?id=".enc_password($v2['id']));?>"><?php echo $v2['title'];?></a><br>
				  	<?php
			  		}
			  	}
			  	?>
			  </div>
			</div>
			</div>
		<?php
		}
	}
  ?>
</div>