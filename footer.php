
  <head>
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>
    <script>
function submitUserForm() {
    var response = grecaptcha.getResponse();
    if(response.length == 0) {
        document.getElementById('g-recaptcha-error').innerHTML = '<span style="color:red;"><?php echo translate("Prove you are not robort.");?></span>';
        return false;
    }
    return true;
}
// function forgot_captcha() {
//     var response = grecaptcha.getResponse();
//     if(response.length == 0) {
//         document.getElementById('g-recaptcha-forgot-error').innerHTML = '<span style="color:red;">Prove you are not robort.</span>';
//         alert('truee');
//         return false;
//     }

//     return true;
// }
function submitUserForm_signup() {
    var response = grecaptcha.getResponse();
    if(response.length == 0) {
        document.getElementById('g-recaptcha-error_signup').innerHTML = '<span style="color:red;"><?php echo translate("Prove you are not robort.");?></span>';
        return false;
    }
    return true;
}
 s
</script>
  </head>

<?php error_reporting(0); ?>
<div class="footer" style="background-color: #031543;">
  <div class="container">
    <div class="row section_spacer">
      <div class="col-12 col-md-5">
        <div class="row">
          <div class="col-12 mb10"><img src="images/site-logo.png" class="img-fluid"></div>
          <div class="col-12 mb10"><?php echo translate("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley");?> </div>
          <div class="col-12"><input type="button" class="btn btn-primary" name="" value="<?php echo translate("READ MORE ABOUT US");?>"></div>
        </div>
      </div>
      <div class="col-12 col-md-3">
          <div class="row">
              <div class="col-12 footer_heading mb10"><?php echo translate("Subscribe To Us");?></div>
              <div class="col-12 mb10"><?php echo translate("Subscribe to our newsletter and stay updated to our latest news.");?></div>
              <form action="process.php?p=subscribed" method="post">
                  <div class="row">
                  <div class="col-9 pr0"><input type="email" required class="form-control brl" name="email" id="email" placeholder="<?php echo translate("Enter your email");?>">
                  </div>
                  <div class="col-3 pl0"><button type="submit" class="btn btn-primary full_width brr">
                   <i class="fa fa-paper-plane"></i>
                  </button></div>
                  </div>
              </form>
              
          </div>
      </div>
      <div class="col-12 col-md-2">
        <div class="row">
          <div class="col-12 footer_heading mb10"><?php echo translate("Social Media");?></div>
          <div class="col-12 mb10"><a href=""><i class="fa fa-facebook"></i>&nbsp;<?php echo translate("facebook");?></a></div>
          <div class="col-12 mb10"><a href=""><i class="fa fa-twitter"></i>&nbsp;<?php echo translate("Twitter");?></a></div>
          <div class="col-12 mb10"><a href=""><i class="fa fa-instagram"></i>&nbsp;<?php echo translate("Instagram");?></a></div>
          <div class="col-12 mb10"><a href=""><i class="fa fa-linkedin"></i>&nbsp;<?php echo translate("Linkedin");?></a></div>
        </div>
      </div>
      <div class="col-12 col-md-2">
        <div class="row">
          <div class="col-12 footer_heading mb10"><?php echo translate("Other Media");?></div>
          <div class="col-12 mb10"><a href="cms.php?type=aboutus"><?php echo translate("About Us");?></a></div>
          <div class="col-12 mb10"><a href=""><?php echo translate("Contact Us");?></a></div>
          <div class="col-12 mb10"><a href="cms.php?type=privacy_policy"><?php echo translate("Privacy Policy");?></a></div>
          <div class="col-12 mb10"><a href="cms.php?type=terms_and_conditions"><?php echo translate("Terms & Conditions");?></a></div>
        </div>
      </div>
    </div>
  </div>
</div>

<div class="overlay"></div>


<script type="text/javascript">

  function show_login_div(){
  
  $("#sign_up_div").hide();
  $("#login").slideDown(300);
  $(".overlay").toggle();   
}
function show_sign_up_div(){
  $(".overlay").toggle(); 
  $("#login").hide();
  $("#sign_up_div").slideDown("slow");
    
}
function hide_login(){
  
  //$('#login').show(500);
  $("#login").slideUp(1000);
  $("#sign_up_div").slideUp(1000);
       $(".overlay").toggle();  
}
function show_forgot_password_form(){
  $("#login_form").hide();
  $("#google_facebook").hide();
  $("#forgot_password_form").show(500);
}
</script>
<!-- --------------------------------------------------------------------------------- -->
<style type="text/css">
  .overlay {
    position:fixed;
    display:none; 

    /* color with alpha channel */
    background-color: rgba(0, 0, 0, 0.7); /* 0.7 = 70% opacity */

    /* stretch to screen edges */
    top: 0;
    left: 0;
    bottom: 0;
    right: 0;
}

  .login_signup_div{
    display: none; 
    z-index: 2;
    position: fixed;
    top: 25px;
    bottom: 10px;
    left: 20%;
    height: 85%;
    width: 60%;
    overflow: auto;
  }
  .mr-3{
    height: 50px;
    width: 45px;
  }
  .mt-0{
    font-size: 15px;
    font-weight: 600;
    margin-bottom: 5px;
  }
</style>
<div id="login" class="modal-content login_signup_div">
                    <div class="modal-header">
                        <div class="page-info">
                            <!--        <h1 class="modal-title" id="exampleModalLabel">Register with us</h1>-->
                        </div>
                        <button type="button" onclick="hide_login();" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <div class="row">
                            <div class="col-sm-6">
                                <div class="modal_left_bx">
                                    <h4><?php echo translate("Register with us");?></h4>
                                    <div class="media">
                                        <img class="mr-3" src="images/side_icon_1.png">
                                        <div class="media-body">
                                            <h5 class="mt-0"><?php echo translate("Receive And Send Bids");?></h5>
                                            <p<?php echo translate("Receive bids for your ads and increase your chances of closing sales.");?>></p>
                                        </div>
                                    </div>
                                    <div class="media">
                                        <img class="mr-3" src="images/side_icon_2.png">
                                        <div class="media-body">
                                            <h5 class="mt-0"><?php echo translate("list features");?></h5>
                                            <p><?php echo translate("Create more value for your ads.");?></p>
                                        </div>
                                    </div>
                                    <div class="media">
                                        <img class="mr-3" src="images/side_icon_3.png">
                                        <div class="media-body">
                                            <h5 class="mt-0"><?php echo translate("Chat");?> &amp; <?php echo translate("message");?></h5>
                                            <p><?php echo translate("Access your chat and account information from any device.");?></p>
                                        </div>
                                    </div>
                                    <div class="media">
                                        <img class="mr-3" src="images/side_icon_4.png">
                                        <div class="media-body">
                                            <h5 class="mt-0"><?php echo translate("User dashboard");?></h5>
                                            <p><?php echo translate("Collect the desired items by saving your favorites.");?></p>
                                        </div>
                                    </div>
                                    <div class="media">
                                        <img class="mr-3" src="images/side_icon_5.png">
                                        <div class="media-body">
                                            <h5 class="mt-0"><?php echo translate("Track the status of your ad history");?></h5>
                                            <p><?php echo translate("Track the status of your ad history.");?></p>
                                        </div>
                                    </div>


                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="log_sign_bx">
                                    <div class="top_social">
                                      <div id="google_facebook">
                                        <div id="w2">                                        <div class="row">
                                             <div class="col pr-2"><a class="custom-btn facebook auth-link" href="/site/auth?authclient=facebook" title="Facebook" data-popup-width="860" data-popup-height="480"><span><i class="icofont-facebook"></i> <?php echo translate("FACEBOOK");?></span> </a> </div>                                                 <div class="col pr-2"><a class="custom-btn google auth-link" href="/site/auth?authclient=google" title="Google"><span><i class="fa fa-google"></i><?php echo translate("GOOGLE");?> </span> </a> </div>                                                </div>                                        </div></div>
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

                                            <a href="#" onclick="show_forgot_password_form();" class="forget_pass"><?php echo translate("Forgot password ?");?></a>
                                        </div>

                                       <div class="col-md-12">
                        <input type="submit" class="btn btn-primary" value="<?php echo translate("Login");?>" name="Submit">
                    </div>
                                        <div class="signin-foot text-center">
                                            <p><?php echo translate("Don't have an account?");?> <a href="#" onclick="show_sign_up_div();"><?php echo translate("Sign Up");?></a></p>
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
                        <input type="submit" class="btn btn-primary" value="<?php echo translate("Send Link");?>" name="Submit">
                    </div>
                                        
                                    </form>
                                  </div>
                                </div>
                            </div>
                        </div>

                    </div>

                </div>
<!-- ------------------------------------------------------------------------------------ -->

<!--........................................................ sign up div.................. -->
<div id="sign_up_div" class="modal-content login_signup_div">
                    <div class="modal-header">
                        <div class="page-info">
                            <!--        <h1 class="modal-title" id="exampleModalLabel">Register with us</h1>-->
                        </div>
                        <a class="close" onclick="hide_login();" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </a>
                    </div>
                    <div class="modal-body">

                        <div class="row">
                            <div class="col-sm-6">
                                <div class="modal_left_bx">
                                    <h4><?php echo translate("Register with us");?></h4>
                                    <div class="media">
                                        <img class="mr-3" src="images/side_icon_6.png">
                                        <div class="media-body">
                                            <h5 class="mt-0"><?php echo translate("Get Ads for free!");?></h5>
                                            <p><?php echo translate("Register and post your information for free!");?></p>
                                        </div>
                                    </div>
                                   <div class="media">
                                        <img class="mr-3" src="images/side_icon_1.png">
                                        <div class="media-body">
                                            <h5 class="mt-0"><?php echo translate("Receive And Send Bids");?></h5>
                                            <p><?php echo translate("Receive bids for your ads and increase your chances of closing sales.");?></p>
                                        </div>
                                    </div>
                                    <div class="media">
                                        <img class="mr-3" src="images/side_icon_2.png">
                                        <div class="media-body">
                                            <h5 class="mt-0"><?php echo translate("list features");?></h5>
                                            <p><?php echo translate("Create more value for your ads.");?></p>
                                        </div>
                                    </div>
                                    <div class="media">
                                        <img class="mr-3" src="images/side_icon_3.png">
                                        <div class="media-body">
                                            <h5 class="mt-0"><?php echo translate("Chat");?> &amp; <?php echo translate("message");?></h5>
                                            <p><?php echo translate("Access your chat and account information from any device.");?></p>
                                        </div>
                                    </div>
                                    <div class="media">
                                        <img class="mr-3" src="images/side_icon_4.png">
                                        <div class="media-body">
                                            <h5 class="mt-0"><?php echo translate("User dashboard");?></h5>
                                            <p><?php echo translate("Collect the desired items by saving your favorites.");?></p>
                                        </div>
                                    </div>
                                    <div class="media">
                                        <img class="mr-3" src="images/side_icon_5.png">
                                        <div class="media-body">
                                            <h5 class="mt-0"><?php echo translate("Track the status of your ad history");?></h5>
                                            <p><?php echo translate("Track the status of your ad history.");?></p>
                                        </div>
                                    </div>


                                </div>
                            </div>
                            <div class="col-sm-5">
                                <div class="log_sign_bx">
                                    <div class="top_social">
                                        <div id="w3">                                        <div class="row">
                                             <div class="col pr-2"><a class="custom-btn facebook auth-link" href="/site/auth?authclient=facebook" title="Facebook" data-popup-width="860" data-popup-height="480"><span><i class="icofont-facebook"></i> <?php echo translate("FACEBOOK");?></span> </a> </div>                                                 <div class="col pr-2"><a class="custom-btn google auth-link" href="/site/auth?authclient=google" title="Google"><span><i class="fa fa-google"></i> <?php echo translate("GOOGLE");?></span> </a> </div>                                                </div>                                        </div>
                                        <span class="nw_orcls">Or</span>
                                    </div>
                                    <form onsubmit="return submitUserForm_signup();" action="process.php?p=register" enctype="multipart/form-data" method="post">
                                      <!-- ........................ -->
                                        <div class="row justify-content-center">
   
           
        <?php show_errors();?>
        <div class="row">
            <div class="col-md-8">
                <div class="form-group">
                    <label><?php echo translate("Full Name");?> <span class="err">*</span></label>
                     <input type="text" required class="form-control" id="name" name="name" placeholder="<?php echo translate("Enter Your Name");?>" value="<?= $_SESSION['sysData']['name'];?>">
                
                </div>
            </div>
            <div class="col-md-8">
                <div class="form-group">
                    <label><?php echo translate("Email");?> <span class="err">*</span></label>
                    <input type="email" required class="form-control" id="email" name="email" placeholder="<?php echo translate("Email");?>" value="<?= $_SESSION['sysData']['email'];?>">
                </div>
            </div>
            <div class="col-md-8">
                <div class="form-group">
                    <label><?php echo translate("Password");?> <span class="err">*</span></label>
                    <input type="password" required class="form-control" id="password" name="password" placeholder="<?php echo translate("Password");?>" value="">
                </div>
            </div>
            <div class="col-md-8">
                <div class="form-group">
                    <label><?php echo translate("Confirm Password");?> <span class="err">*</span></label>
                    <input type="password" required class="form-control" id="cpassword" name="cpassword" placeholder="<?php echo translate("Confirm password");?>" value="">
                </div>
            </div>
            <div class="col-md-8">
                <div class="form-group">
                    <label><?php echo translate("Address");?></label>
                    <input type="text" required class="form-control" id="address" name="address" placeholder="<?php echo translate("Enter Your Address");?>" value="<?= $_SESSION['sysData']['address'];?>">
                </div>
            </div>
            <div class="col-md-8">
                <div class="form-group">
                    <label><?php echo translate("City");?></label>
                    <input type="text" required class="form-control" id="city" name="city" placeholder="<?php echo translate("Enter Your City");?>" value="<?= $_SESSION['sysData']['city'];?>">
                </div>
            </div>
            <div class="col-md-8">
                <div class="form-group">
                    <label><?php echo translate("State");?></label>
                    <input type="text" required class="form-control" id="state" name="state" placeholder="<?php echo translate("Enter Your State");?>" value="<?= $_SESSION['sysData']['state'];?>">
                </div>
            </div>
            <div class="col-md-8">
                <div class="form-group">
                    <label><?php echo translate("Zipcode");?></label>
                    <input type="text" required class="form-control" id="zip" name="zip" placeholder="<?php echo translate("Enter Your Zip code");?>" value="<?= $_SESSION['sysData']['zip'];?>">
                </div>
            </div>
           
        </div>
      <div class="clearfix"></div>
              
</div>  
                                        <!-- ......................... -->
                                        <div class="row mb-2">
                                            <div class="col-sm-12">
                                                <div class="my-1 mr-sm-2">
                                                   <div class="g-recaptcha" data-sitekey="6Lc9VN4UAAAAAGO9tfy6py6kcAHeo5xwyE0ZgNNd">
                                   </div>
                                   <div id="g-recaptcha-error_signup"></div>
                                                </div>
                                            </div>
                                            <div class="help-block has-error signup_captcha_error"></div>
                                        </div>

                                        <div class="col-md-8">
                <button type="submit" class="btn btn-primary" name="Submit"><?php echo translate("Submit");?></button>
            </div>
                                        <div class="signin-foot text-center">
                                            <p><?php echo translate("Already have an account?");?> <a href="#" onclick="show_login_div();"><?php echo translate("Sign In");?></a></p>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>

                    </div>

                </div>
<!-- ...................End Sign Up Div ................................................... -->

<?php
/**/
?>
</body>
</html>

<div id="form_popup" class="modal fade" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title" id="modal_tlt"><?php echo translate("My Form");?></h4>
      </div>
      <div class="modal-body">
        <p class="text-danger" id="modal_msg"><?php echo translate("Put your form here");?></p>
      </div>
      
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal"><?php echo translate("Close");?></button>
      </div>
    </div>
  </div>
</div>
<script>
function form_popup(modal_tlt="",modal_msg=""){
  if(modal_msg!=""){
    $( "#modal_msg" ).html(modal_msg);
  }
  if(modal_tlt!=""){
    $( "#modal_tlt" ).html(modal_tlt);
  }
}
</script>

<div id="delete" class="modal fade" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title" id="modal_tlt"><?php echo translate("Delete");?></h4>
      </div>
      <div class="modal-body">
        <p class="text-danger" id="modal_msg"><?php echo translate("Are you sure you want to perform delete operation?");?></p>
      </div>
      
      <div class="modal-footer">
      <a class="btn btn-danger" id="delete_client_button" href="" ><?php echo translate("Yes");?></a>
        <button type="button" class="btn btn-default" data-dismiss="modal"><?php echo translate("No");?></button>
      </div>
    </div>
  </div>
</div>
<script>
function delete_record(url,modal_msg="",modal_tlt=""){
  if(modal_msg!=""){
    $( "#modal_msg" ).html(modal_msg);
  }
  if(modal_tlt!=""){
    $( "#modal_tlt" ).html(modal_tlt);
  }
  $( "#delete_client_button" ).attr( "href", url );
}
</script>

<script type="text/javascript">
function update_subcategories(id){
  $(".hide_class").hide();
  
  if($("#category_id option:selected").text()==="Vehicle"){
     $(".vehicle").show();
  }
  $("#subcategory_id").html('<option value="">Loading...</option>');
  $.ajax({
    method: "POST",
    url: "ajaxphp.php?p=update_subcategories",
    data: { id: id }
  })
  .done(function( msg ) {
    $("#subcategory_id").html(msg);
  });

  $("#submodel_div").hide();
  $("#model_div").hide();
}
function update_ad_type(id){
  $("#type").html('<option value="">Loading...</option>');
  $.ajax({
    method: "POST",
    url: "ajaxphp.php?p=update_ad_type",
    data: { id: id }
  })
  .done(function( msg ) {
    $("#type").html(msg);
  });
  update_models(id);
  update_submodels(id);
}
function update_models(id){
  $("#type").html('<option value="">Loading...</option>');
  $.ajax({
    method: "POST",
    url: "ajaxphp.php?p=update_models",
    data: { id: id }
  })
  .done(function( msg ) {
    if(msg=="no"){
      $("#model_div").hide();
    } else {
      $("#model_div").show();
      $("#model").html(msg);
    }
  });
}
function update_submodels(id){
  $("#type").html('<option value="">Loading...</option>');
  $.ajax({
    method: "POST",
    url: "ajaxphp.php?p=update_submodels",
    data: { id: id }
  })
  .done(function( msg ) {
    if(msg=="no"){
      $("#submodel_div").hide();
    } else {
      $("#submodel_div").show();
      $("#submodel").html(msg);
    }
  });
}
function show_radio_val(str){
      var location = $('#location').val();
      var cat_val = $('#hidden_value').val();
      var type_filter = str;
         $.ajax({
            type: "GET",
            url: "ajaxphp.php",
             dataType: 'html',  
            data: {location:location,type:type_filter,cat_val:cat_val,p:'get_real_estate_type'},
            success: function(data){
              $('#serach_results').html('');
               $('#serach_results').html(data);

               document.getElementById('serach_results').scrollIntoView({block: 'start', behavior: 'smooth'});

            } 
        });
   
}
function get_val(str){
     var location = $('#location').val();
      var cat_val = $('#hidden_value').val();
      // alert(str+location+cat_val); return false;
      var type_filter = str;
         $.ajax({
            type: "GET",
            url: "ajaxphp.php",
             dataType: 'html',  
            data: {location:location,type:type_filter,cat_val:cat_val,p:'get_real_estate_type'},
            success: function(data){
              $('#serach_results').html('');
               $('#serach_results').html(data);

               document.getElementById('serach_results').scrollIntoView({block: 'start', behavior: 'smooth'});

            } 
        });
}
function sort_by_price()
{
  var cat_val = $('#hidden_value').val();
      var sort_by = $('#price_sort').val();
         $.ajax({
            type: "GET",
            url: "ajaxphp.php",
             dataType: 'html',  
            data: {sort_by:sort_by,cat_val:cat_val,p:'get_price_sort'},
            success: function(data){
              $('#serach_results').html('');
               $('#serach_results').html(data);
             } 
        });
}
function update_status(status,id)
{
  var status = status;
   $.ajax({
            type: "GET",
            url: "ajaxphp.php",
             dataType: 'html',  
            data: {id:id,status:status,p:'change_product_status'},
           success: function(data){
              $('#action_'+id).html(data);
            } 
        });
             
}
function test(){}
function bump_up(id)
{
    $.ajax({
    type: "GET",
    url: "ajaxphp.php",
    dataType: 'html',
    data: {
        id: id,
        p: 'bump_up_product'
    },
    success: function(data) {
        if(data=='yes')
            {$('#bump_up_' + id).html('Product is Bumped up');
                }
        else
            {$('#bump_up_' + id).html('You have 0 bump up');
                }
        }
     });
}
function myFunction(){
       $('#description_th').val('translating....');
    }
    function translate_into_thai(str){
       var description = str;
         $.ajax({
            type: "GET",
            url: "ajaxphp.php",
             dataType: 'html',  
            data: {description:description,p:'translate_into_thai'},
            success: function(data){
              $('#description_th').val(data);
               
             } 
        });
    }
</script>

<?php
$keep_sysData_pages = array('register','partner_register','my-community');
if( !in_array($p,$keep_sysData_pages) ){
  unset($_SESSION['sysData']);
}
unset($_SESSION['sysErr']);
?>