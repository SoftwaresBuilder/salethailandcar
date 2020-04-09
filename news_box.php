<?php
$news_img = get_upload_img($record['img']);
?>
<div class="row mybox_news">
	<div class="col-12"><div class="imgdiv2"><img src="<?php echo $news_img;?>"></div></div>
	<div class="col-12 title"><?php echo showstring($record['title_'.$lang],"25");?></div>

	<div class="col-12"><?php echo showstring($record['description_'.$lang],"130");?></div>
	<div class="col-12"><a href="<?php echo makepage_url("news_detail","?slug=".($record['slug_en']));?>" class="btn btn-primary full_width"><?php echo translate("Read More");?></a></div>
</div>
