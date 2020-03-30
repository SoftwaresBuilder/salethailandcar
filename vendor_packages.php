<?php
$packages = get_records($tblvendor_packages,"status='1' and trash='0'");
?>
<div class="container">
    <div class="section_spacer">
        <div class="row register justify-content-center">
            <?php
            if(count($packages)>0){
                foreach ($packages as $v) {
                    $category_name = get_records($tblcategories,"id='".$v['category']."' and trash!='1'");
                ?>
                <div class="col-3">
                    <div class="row packages">
                        <div class="col-12 center"><?php echo $v['title_'.$lang];?></div>
                        <div class="col-12 center"><?php echo $category_name[0]['title_'.$lang];?></div>
                        <div class="col-12 center"><?php echo show_price($v['price']);?></div>
                        <div class="col-12 center"><?php echo translate("Post Ads");?> <?php echo $v['post_ads'];?></div>
                        <div class="col-12 center"><?php echo translate("Bump Ups");?> <?php echo $v['bump_up'];?></div>
                        <div class="col-12 center"><?php echo translate("Social Media Ads");?> <?php echo $v['social_media_ads'];?></div>
                        <div class="col-12 center"><?php echo translate("Feature Ads");?> <?php echo $v['feature_ads'];?></div>
                        <div class="col-12 center"><?php echo translate("Expiry Days");?> <?php echo $v['expiry_days'];?></div>
                        <div class="col-12 center last"><a href="process.php?p=get_package&id=<?php echo enc_password($v['id']);?>" class="btn btn-primary"><?php echo translate("Get Package");?></a></div>
                    </div>
                </div>
                <?php
                }
            }
            ?>
        </div>
    </div>
</div>
