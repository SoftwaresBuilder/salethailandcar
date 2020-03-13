<div class="row">
                            <div class="col-sm-6">
                                <div class="modal_left_bx">
                                    <h4 class="login_heading"><?php echo translate("Register with us");?></h4>
                                    <div class="media login_feature">
                                        <img class="mr-3" src="images/side_icon_1.png" alt="">
                                        <div class="media-body">
                                            <h5 class="login_heading2"><?php echo translate("Receive And Send Bids");?></h5>
                                            <p><?php echo translate("lang_text19");?></p>
                                        </div>
                                    </div>
                                    <div class="media login_feature">
                                        <img class="mr-3" src="images/side_icon_2.png" alt="">
                                        <div class="media-body">
                                            <h5 class="login_heading2"><?php echo translate("list features");?></h5>
                                            <p><?php echo translate("lang_text20");?></p>
                                        </div>
                                    </div>
                                    <div class="media login_feature">
                                        <img class="mr-3" src="images/side_icon_3.png" alt="">
                                        <div class="media-body">
                                            <h5 class="login_heading2"><?php echo translate("Chat");?> &amp; <?php echo translate("message");?></h5>
                                            <p><?php echo translate("lang_text21");?></p>
                                        </div>
                                    </div>
                                    <div class="media login_feature">
                                        <img class="mr-3" src="images/side_icon_4.png" alt="">
                                        <div class="media-body">
                                            <h5 class="login_heading2"><?php echo translate("User dashboard");?></h5>
                                            <p><?php echo translate("lang_text22");?></p>
                                        </div>
                                    </div>
                                    <div class="media login_feature">
                                        <img class="mr-3" src="images/side_icon_5.png" alt="">
                                        <div class="media-body">
                                            <h5 class="login_heading2"><?php echo translate("lang_text23");?></h5>
                                            <p><?php echo translate("lang_text23");?></p>
                                        </div>
                                    </div>


                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="log_sign_bx">
                                    <div class="top_social">
                                      <div id="google_facebook">
                                        <div id="w2">
                                          <div class="row">
                                             <div class="col pr-2"><a class="btn btn-primary facebook full_width" href="/site/auth?authclient=facebook" title="Facebook" data-popup-width="860" data-popup-height="480"><span><i class="fa fa-facebook"></i> <?php echo translate("FACEBOOK");?></span> </a> </div>
                                             <div class="col pr-2"><a class="btn btn-primary google full_width" href="/site/auth?authclient=google" title="Google"><span><i class="fa fa-google"></i> <?php echo translate("GOOGLE");?> </span> </a> </div>                                                </div>                                        </div></div>
                                        <span class="nw_orcls"><?php echo translate("Or");?></span>
                                    </div>
                                    <div id="login_form">
                                     <form onsubmit="return submitUserForm();" action="process.php?p=login" enctype="multipart/form-data" method="post">
                                       <div class="row">
                                         <?php show_errors();?>
                    <div class="col-md-12">
                        <div class="form-group">
                            <label><?php echo translate("Email");?> <span class="err">*</span></label>
                            <input type="email" required class="form-control" id="email" name="email" placeholder="<?php echo translate("Email");?>" value="">
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="form-group">
                            <label><?php echo translate("Password");?> <span class="err">*</span></label>
                            <input type="password" required class="form-control" id="password" name="password" placeholder="<?php echo translate("Password");?>" value="">
                        </div>
                    </div>
                    

                </div>
                                        <div class="row mb-2">
                                            <div class="col-sm-12">
                                                <div class="my-1 mr-sm-2">
                                  <div class="g-recaptcha" data-sitekey="6Lc9VN4UAAAAAGO9tfy6py6kcAHeo5xwyE0ZgNNd">
                                   </div>
                                   <div id="g-recaptcha-error"></div>
                                                </div>
                                            </div>
                                            <div class="help-block has-error signup_captcha_error"></div>
                                        </div>
                                        <div class="d-flex log_nw_bx justify-content-between mb-2">

                                            <a href="#" onclick="show_forgot_password_form();" class="forget_pass"><?php echo translate("lang_text25");?></a>
                                        </div>

                                       <div class="col-md-12">
                        <input type="submit" class="btn btn-primary full_width" value="<?php echo translate("Login");?>" name="Submit">
                    </div>
                                        <div class="signin-foot text-center">
                                            <p><?php echo translate("lang_text26");?> <a href="javascript:;" data-dismiss="modal" data-toggle="modal" data-target="#login_popup"><?php echo translate("Sign Up");?></a></p>
                                        </div>
                                    </form>
                                  </div>
                                  <div id="forgot_password_form" style="display: none;">
                                     <form action="process.php?p=forgot_password" method="post">
                                       <div class="row">
                                         <?php show_errors();?>
                    <div class="col-md-12">
                        <div class="form-group">
                            <label><?php echo translate("Email");?> <span class="err">*</span></label>
                            <input type="email" required class="form-control" id="email" name="email" placeholder="<?php echo translate("Email");?>" value="">
                        </div>
                    </div>
              </div>
                                        <div class="row mb-2">
                                            <div class="col-sm-12">
                                                <div class="my-1 mr-sm-2">
                                  <!-- <div class="g-recaptcha" data-sitekey="6Lc9VN4UAAAAAGO9tfy6py6kcAHeo5xwyE0ZgNNd">
                                   </div>
                                   <div id="g-recaptcha-forgot-error"></div>
                                                </div> -->
                                            </div>
                                            <div class="help-block has-error signup_captcha_error"></div>
                                        </div>
                                      

                                       <div class="col-md-12">
                        <input type="submit" class="btn btn-primary full_width" value="<?php echo translate("Send Link");?>" name="Submit">
                    </div>
                                        
                                    </form>
                                  </div>
                                </div>
                            </div>
                        </div>