<?php
if(!isset($_SESSION['sysData']['name'])) {
    $_SESSION['sysData'] = table_fields($tblusers);
}

$user_details = get_records($tblusers,'id ='.$_SESSION['user_record']['id']);
$query ='SELECT COUNT(id) FROM ' .$tblproducts. ' WHERE user_id = ' .$user_details[0]['id'];
$query_pending_approvals ='SELECT COUNT(id) FROM ' .$tblproducts. ' WHERE user_id = ' .$user_details[0]['id']. ' AND status = 0';
$query_favourites ='SELECT COUNT(id) FROM ' .$tblproduct_favorites. ' WHERE user_id = ' .$user_details[0]['id'];
$user_packages = get_records($tbluser_package,'user_id ='.$_SESSION['user_record']['id']);

$count_ads = sql($query);
$count_pending_ads = sql($query_pending_approvals);
$count_favourites = sql($query_favourites);

?>
<style type="text/css">
    .for_text {
        font-size: 20px;
        font-family: serif;
        text-align: center;
        vertical-align: middle;
        line-height: 40px;
        border: 1px solid grey;
    }
    .box{
        background-color: #e6e9ed;
        margin-bottom: 20px;
    }
</style>

<div class="container">
   <div class="row">
        <div class="col-md-4 for_text box">
        <?php
        $user_img = get_user_img($user_details[0]['img']);
        ?>
        <img width="100px" height="100px" style="border-radius: 50px; margin-top: 10px;margin-bottom: 10px" src="<?php echo $user_img; ?>">
        <span class=""> <?php echo $user_details[0]['name']; ?></span>

        </div>
        <div class="col-md-4 for_text box"><?php echo translate("Favourite ads");?>
            <?php echo $count_favourites[0]['COUNT(id)'] ?>
        </div>
        <div class="col-md-4 for_text box"><?php echo translate("Pending approvals");?>
            <?php echo $count_pending_ads[0]['COUNT(id)'] ?>
        </div>
        <?php
        if(count($user_packages)>0){
            foreach ($user_packages as $key => $v) { 
                 $categories = get_records($tblcategories,"id='".$v['category_id']."' and trash!='1'"); ?>
          
        <div class="col-md-4 for_text box"><span style="font-weight: bold"><?php echo 'For ' .$categories[0]['title_'.$lang]; ?></span><br>
             <?php echo 'Post Ads ' .$v['post_ads']; ?></br>
            <?php echo 'Bump up ' .$v['bump_up']; ?></br>
            <?php echo 'Social Media Ads ' .$v['social_media_ads']; ?></br>
            <?php echo 'Feature ads ' .$v['feature_ads']; ?>
        </div>
        <?php  }
        } ?>
    </div>
    <div class="row">
        <div class="col-12 heading"><?php echo translate("My Profile");?></div>
    </div>
    <div class="section_spacer">
        <div class="row register">
            <div class="col-xs-12 col-md-6">
                <form action="process.php?p=my_account" enctype="multipart/form-data" method="post">
                    <?php show_errors();?>
                    
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label><?php echo translate("Full Name");?> <span class="err">*</span></label>
                                <input type="text" required class="form-control" id="name" name="name" placeholder="<?php echo translate("Enter Your Name");?>" value="<?= $_SESSION['user_record']['name'];?>">

                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label><?php echo translate("Email");?> <span class="err">*</span></label>
                                <input type="email" required class="form-control" id="email" name="email" placeholder="<?php echo translate("Email");?>" value="<?= $_SESSION['user_record']['email'];?>">
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label><?php echo translate("Password");?> <span class="err">*</span></label>
                                <input type="password" required class="form-control" id="password" name="password" placeholder="<?php echo translate("Password");?>" value="">
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label><?php echo translate("Confirm Password");?> <span class="err">*</span></label>
                                <input type="password" required class="form-control" id="cpassword" name="cpassword" placeholder="<?php echo translate("Confirm password");?>" value="">
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label><?php echo translate("Address");?></label>
                                <input type="text" required class="form-control" id="address" name="address" placeholder="<?php echo translate("Enter Your Address");?>" value="<?= $_SESSION['user_record']['address'];?>">
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label><?php echo translate("City");?></label>
                                <input type="text" required class="form-control" id="city" name="city" placeholder="<?php echo translate("Enter Your City");?>" value="<?= $_SESSION['user_record']['city'];?>">
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label><?php echo translate("State");?></label>
                                <input type="text" required class="form-control" id="state" name="state" placeholder="<?php echo translate("Enter Your State");?>" value="<?= $_SESSION['user_record']['state'];?>">
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label><?php echo translate("Zipcode");?></label>
                                <input type="text" required class="form-control" id="zip" name="zip" placeholder="<?php echo translate("Enter Your Zip code");?>" value="<?= $_SESSION['user_record']['zip'];?>">
                            </div>
                        </div>
                        
                        <div class="col-md-12">
                            <div class="form-group">
                                <label><?php echo translate("Profile Image");?></label>
                                <div style="background-color:#dcdee6;height: 300px; width: 100%;">
                                <img src="<?php echo $user_img; ?>" id="blah" onclick="" alt="" width="100%" height="300px" /></div>
                                <input type="file" name="img"  onchange="document.getElementById('blah').src = window.URL.createObjectURL(this.files[0])">
                             </div>
                        </div>
                           
                        <div class="col-md-12" style="margin-top: 10px;">
                            <button type="submit" class="btn btn-primary" name="Submit"><?php echo translate("Update Profile");?></button>
                        </div>
                        <div class="clearfix"></div>
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>