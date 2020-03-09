<?php
$packages = get_records($tblvendor_packages,"status='1' and trash='0'");
?>
<div class="container">
    <div class="section_spacer">
        <div class="row register justify-content-center">
            <?php
            if(count($packages)>0){
                foreach ($packages as $v) {
                ?>
                <div class="col-3">
                    <div class="row packages">
                        <div class="col-12 center"><?php echo $v['title'];?></div>
                        <div class="col-12 center"><?php echo show_price($v['price']);?></div>
                        <div class="col-12 center"><?php echo translate("Post Ads");?> <?php echo $v['post_ads'];?></div>
                        <div class="col-12 center"><?php echo translate("Bump Ups");?> <?php echo $v['bump_up'];?></div>
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
