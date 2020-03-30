
<script>

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
    /**
    if(response.length == 0) {
        document.getElementById('g-recaptcha-error_signup').innerHTML = '<span style="color:red;"><?php ///echo translate("Prove you are not robort.");?></span>';
        return false;
    }
    /**/
    return true;
}
 
</script>
<div <?php if(isset($_SESSION['cookie'])){ ?> style="display: none"  <?php  }  ?>>
<div id="cookie-law-info-bar" 
style=" background-color: rgb(242, 245, 245);
     color: rgb(0, 0, 0);
     font-family: inherit;
     bottom: 0px;
    position: fixed; 
    display: block;">
<span>
  <?php echo translate('lang_text34'); ?>
 <a href="process.php?p=cookie_accept" id="" onclick="" class="cookies_accept_btn st" style="height: 50px"><?php echo translate('ACCEPT'); ?></a>
</span>
</div>
</div> 


<div class="footer" style="background-color: #031543;">
  <div class="container">
    <div class="row section_spacer">
      <div class="col-12 col-md-5">
        <div class="row">
          <div class="col-12 mb10"><img src="images/site-logo.png" class="img-fluid"></div>
          <div class="col-12 mb10"><?php echo translate("lang_text16");?> </div>
          <div class="col-12"><a href="cms.php?type=aboutus"><input type="button" class="btn btn-primary" name="" value="<?php echo translate("READ MORE ABOUT US");?>"></a></div>
        </div>
      </div>
      <div class="col-12 col-md-3">
          <div class="row">
              <div class="col-12 footer_heading mb10"><?php echo translate("Subscribe To Us");?></div>
              <div class="col-12 mb10"><?php echo translate("lang_text17");?></div>
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
          <div class="col-12 mb10"><a href="contact_us.php"><?php echo translate("Contact Us");?></a></div>
          <div class="col-12 mb10"><a href="cms.php?type=privacy_policy"><?php echo translate("Privacy Policy");?></a></div>
          <div class="col-12 mb10"><a href="cms.php?type=terms_and_conditions"><?php echo translate("lang_text18");?></a></div>
          <div class="col-12 mb10"><a href="faqs.php"><?php echo translate("FAQ");?></a></div>
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
 
  $("#login").hide();
  $("#sign_up_div").slideDown(300);
   $(".overlay").toggle();   
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
</body>
</html>

<div id="delete" class="modal fade" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title" id="modal_tlt"><?php echo translate("Delete");?></h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
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

<div id="register_popup" class="modal fade login_popup" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title"></h4>
      </div>
      <div class="modal-body">
        <?php include("signup_popup.php");?>
      </div>
    </div>
  </div>
</div>


<div id="login_popup" class="modal fade login_popup" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title"></h4>
      </div>
      <div class="modal-body">
        <?php include("login_popup.php");?>
      </div>
    </div>
  </div>
</div>


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
function show_radio_val(){

      // var location = $('#location').val();
      // var cat_val = $('#hidden_value').val();
      // var type_filter = str;
      //    $.ajax({
      //       type: "GET",
      //       url: "ajaxphp.php",
      //        dataType: 'html',  
      //       data: {location:location,type:type_filter,cat_val:cat_val,p:'get_real_estate_type'},
      //       success: function(data){
      //         $('#serach_results').html('');
      //          $('#serach_results').html(data);

      //          document.getElementById('serach_results').scrollIntoView({block: 'start', behavior: 'smooth'});

      //       } 
      //   });
   
}
function get_filter_products_type(){
    var radio_value = $("input[name='radioTabTest']:checked").val();
     var location = $('#location').val();
     var cat_val = $('#hidden_value').val();
       //alert(radioValue+' / '+ location+ ' / '+ cat_val); return false; 
         $.ajax({
            type: "GET",
            url: "ajaxphp.php",
             dataType: 'html',  
            data: {location:location,radio_value:radio_value,cat_val:cat_val,p:'get_real_estate_type'},
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
function myFunction(str){
       $('#'+str).val('translating....');
    }
    function translate_into_thai(str,id){
       var description = str;
         $.ajax({
            type: "GET",
            url: "ajaxphp.php",
             dataType: 'html',  
            data: {description:description,p:'translate_into_thai'},
            success: function(data){
              $('#'+id).val(data);
               
             } 
        });
    }
     function set_image_attribute(id,p_id)
    {
      var is_main =0;
      var alt = $('#img_alt'+id).val();
      var description = $('#img_description'+id).val();
      if($('#main_img'+id).prop('checked')) { 
         is_main =1;
     }
    //alert(alt + ' / '+description+' / '+is_main); return false;
     $.ajax({
            type: "GET",
            url: "ajaxphp.php",
             dataType: 'html',  
            data: {id:id,p_id:p_id,alt:alt,description:description,is_main:is_main,p:'set_image_attribute'},
            success: function(data){
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