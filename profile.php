<?php
if(!isset($_SESSION['sysData']['name'])) {
    $_SESSION['sysData'] = table_fields($tblusers);
}
$user_details = get_records($tblusers,'id ='.$_SESSION['user_record']['id']);
$query ='SELECT COUNT(id) FROM ' .$tblproducts. ' WHERE user_id = ' .$user_details[0]['id'];
$query_pending_approvals ='SELECT COUNT(id) FROM ' .$tblproducts. ' WHERE user_id = ' .$user_details[0]['id']. ' AND status = 0';
$query_favourites ='SELECT COUNT(id) FROM ' .$tblproduct_favorites. ' WHERE user_id = ' .$user_details[0]['id'];

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
        line-height: 90px;
        border: 1px solid grey;
    }
</style>

<div class="container">
    <div class="row">
        <div style="background-color: #e6e9ed; margin-bottom: 20px;" class="col-md-4 for_text">
            <img width="80px" height="80px" style="border-radius: 50px; margin-top: 10px;margin-bottom: 10px" src="images/user.jpg">
            <span class="" style="margin-left: 20px"> <?php echo $user_details[0]['name']; ?></span>

        </div>
        <div style="background-color: #e6e9ed; margin-bottom: 20px;" class="col-md-4 for_text"><?php echo translate("Total Ads");?>
            <?php echo $count_ads[0]['COUNT(id)'] ?>
        </div>
        <div style="background-color: #e6e9ed; margin-bottom: 20px;" class="col-md-4 for_text"><?php echo translate("Favourite ads");?>
            <?php echo $count_favourites[0]['COUNT(id)'] ?>
        </div>
    </div>
    <div class="row">
        <div style="background-color: #e6e9ed" class="col-md-4 for_text"><?php echo translate("Remaings Bids");?>
            <?php echo $user_details[0]['post_ads']; ?>
        </div>
        <div style="background-color: #e6e9ed" class="col-md-4 for_text"><?php echo translate("Remaing bumps up");?>
            <?php echo $user_details[0]['bump_up']; ?>
        </div>
        <div style="background-color: #e6e9ed" class="col-md-4 for_text"><?php echo translate("Pending approvals");?>
            <?php echo $count_pending_ads[0]['COUNT(id)'] ?>
        </div>
    </div>
    <div class="row">
        <div class="col-12 heading"><?php echo translate("My Profile");?></div>
    </div>
    <div class="section_spacer">
        <div class="row register">
            <div class="col-xs-12 col-md-6">
                <form action="process.php?p=register" enctype="multipart/form-data" method="post">
                    <?php show_errors();?>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label><?php echo translate("Full Name");?> <span class="err">*</span></label>
                                <input type="text" required class="form-control" id="name" name="name" placeholder="<?php echo translate("Enter Your Name");?>" value="<?= $_SESSION['sysData']['name'];?>">

                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label><?php echo translate("Email");?> <span class="err">*</span></label>
                                <input type="email" required class="form-control" id="email" name="email" placeholder="<?php echo translate("Email");?>" value="<?= $_SESSION['sysData']['email'];?>">
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
                                <input type="text" required class="form-control" id="address" name="address" placeholder="<?php echo translate("Enter Your Address");?>" value="<?= $_SESSION['sysData']['address'];?>">
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label><?php echo translate("City");?></label>
                                <input type="text" required class="form-control" id="city" name="city" placeholder="<?php echo translate("Enter Your City");?>" value="<?= $_SESSION['sysData']['city'];?>">
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label><?php echo translate("State");?></label>
                                <input type="text" required class="form-control" id="state" name="state" placeholder="<?php echo translate("Enter Your State");?>" value="<?= $_SESSION['sysData']['state'];?>">
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label><?php echo translate("Zipcode");?></label>
                                <input type="text" required class="form-control" id="zip" name="zip" placeholder="<?php echo translate("Enter Your Zip code");?>" value="<?= $_SESSION['sysData']['zip'];?>">
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label><?php echo translate("Profile Image");?></label>
                                    <input type="file" required class="form-control" id="profile_img" name="profile_img">
                                </div>
                            </div>
                            <div class="col-md-12" style="margin-top: 10px;">
                                <button type="submit" class="btn btn-primary" name="Submit"><?php echo translate("Update Profile");?></button>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>