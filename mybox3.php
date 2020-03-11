
<div class="row mybox3">
	<div class="col-12 title"><?php echo translate("Recent Categories");?></div>
	<div class="listing">
		<?php
		if(count($parent_categories)>0){
			foreach ($parent_categories as $v) {
			?>
				<div class="col-12"><a href="<?php echo makepage_url("search","?id=".enc_password($v['id']));?>"><?php echo $v['title_'.$lang];?></a></div>
			<?php
			}
		}
		?>
	</div>
</div>
