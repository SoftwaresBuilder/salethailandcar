<?php
if(!isset($_SESSION['sysData']['name'])) {
    $_SESSION['sysData'] = table_fields($tblusers);
}
?>
<div class="row">
                            <div class="col-md-6">
                                <div class="modal_left_bx">
                                    <h4 class="login_heading"><?php echo translate("Register with us");?></h4>
                                    <div class="media login_feature">
                                        <img class="mr-3" src="images/side_icon_6.png">
                                        <div class="media-body">
                                            <h5 class="login_heading2"><?php echo translate("lang_text27");?></h5>
                                            <p><?php echo translate("lang_text28");?></p>
                                        </div>
                                    </div>
                                   <div class="media login_feature">
                                        <img class="mr-3" src="images/side_icon_1.png">
                                        <div class="media-body">
                                            <h5 class="login_heading2"><?php echo translate("Receive And Send Bids");?></h5>
                                            <p><?php echo translate("lang_text19");?></p>
                                        </div>
                                    </div>
                                    <div class="media login_feature">
                                        <img class="mr-3" src="images/side_icon_2.png">
                                        <div class="media-body">
                                            <h5 class="login_heading2"><?php echo translate("list features");?></h5>
                                            <p><?php echo translate("lang_text20");?></p>
                                        </div>
                                    </div>
                                    <div class="media login_feature">
                                        <img class="mr-3" src="images/side_icon_3.png">
                                        <div class="media-body">
                                            <h5 class="login_heading2"><?php echo translate("Chat");?> &amp; <?php echo translate("message");?></h5>
                                            <p><?php echo translate("lang_text21");?></p>
                                        </div>
                                    </div>
                                    <div class="media login_feature">
                                        <img class="mr-3" src="images/side_icon_4.png">
                                        <div class="media-body">
                                            <h5 class="login_heading2"><?php echo translate("User dashboard");?></h5>
                                            <p><?php echo translate("lang_text22");?></p>
                                        </div>
                                    </div>
                                    <div class="media login_feature">
                                        <img class="mr-3" src="images/side_icon_5.png">
                                        <div class="media-body">
                                            <h5 class="login_heading2"><?php echo translate("Track the status of your ad history");?></h5>
                                            <p><?php echo translate("lang_text23");?></p>
                                        </div>
                                    </div>


                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="log_sign_bx">
                                    <div class="top_social">
                                        <div id="w3">                                        <div class="row">
                                             <div class="col pr-2"><a class="btn btn-primary facebook full_width" href="/site/auth?authclient=facebook" title="Facebook" data-popup-width="860" data-popup-height="480"><span><i class="fa fa-facebook"></i> <?php echo translate("FACEBOOK");?></span> </a> </div>
                                             <div class="col pr-2"><a class="btn btn-primary google full_width" href="/site/auth?authclient=google" title="Google"><span><i class="fa fa-google"></i> <?php echo translate("GOOGLE");?></span> </a> </div>                                                </div>                                        </div>
                                        <span class="nw_orcls">Or</span>
                                    </div>
                                    <form action="process.php?p=partner_register" enctype="multipart/form-data" method="post">
                                      <!-- ........................ -->
                                        <div class="row justify-content-center">
   
           
        <?php show_errors();?>
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
      <div class="clearfix"></div>
              
</div>  
                                        <!-- ......................... -->
                                        <div class="row mb-2">
                                            <div class="col-sm-12">
                                                <div class="my-1 mr-sm-2">
                                                   <div class="g-recaptcha" data-sitekey="6Le0HucUAAAAAMMTA9XKvSeuqvHC-9gb2DyEmBVO">
                                   </div>
                                   <div id="g-recaptcha-error_signup"></div>
                                                </div>
                                            </div>
                                            <div class="help-block has-error signup_captcha_error"></div>
                                        </div>

                                        <div class="col-md-12">
                <button type="submit" class="btn btn-primary full_width" name="Submit"><?php echo translate("Submit");?></button>
            </div>
                                        <div class="signin-foot text-center">
                                            <p><?php echo translate("lang_text29");?> <a href="javascript:;" data-dismiss="modal" data-toggle="modal" data-target="#register_popup"><?php echo translate("Sign In");?></a></p>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>