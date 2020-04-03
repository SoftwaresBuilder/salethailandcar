<?php
include("config/config.php");
if(!isset($_SESSION['testing']) and $web_live=="yes"){
    header("location:coming_soon/");exit;
}
$_SESSION['lang'] = (isset($_SESSION['lang']))?$_SESSION['lang']:'en';

$lang = $_SESSION['lang'];
$_SESSION['price_rate'] = $thai_rate;
$_SESSION['cons_currency'] = $cons_thai;

$user_id = 0;
if(isset($_SESSION['user_record'])){
  $login_user = get_records($tblusers,"id='".$_SESSION['user_record']['id']."' and status='1' and trash='0'");
  $_SESSION['user_record'] = $login_user[0];
  $user_id = $_SESSION['user_record']['id'];
}

$p = getpagename();
$without_login_pages = array('contact_us','index','login','forgot_password','register', 'faqs', 'news_detail','about','contact','cms','search_by_map','search','product_detail','vendor_profile','vendor_products');
if(!isset($_SESSION['user_record'])){
  if( !in_array($p,$without_login_pages) ){
    redirect("login");exit;
  }
}

$page_url = getpage_url();
if($page_url){
  $_SESSION['page_url'] = $page_url;
}

$parent_categories = get_records($tblcategories,"pid='0' and status='1' and trash='0'");

?>
<!DOCTYPE html>
<html lang="en">
<head>
  <script>
    function initMap() {
        var input = document.getElementById('location');
        var autocomplete = new google.maps.places.Autocomplete(input);
        autocomplete.addListener('place_changed', function () {
            var address = $('#location').val();
            if ($('#filterform').find('#hidden_location').length != 0) {
                $('#hidden_location').val(address);
            }
            filter(0);
        });
    }
    $(document).ready(function () {
      $('#login').hide();
        $('#location').on('keyup keypress', function () {
            if ($(this).val() == "") {
                $('#location').val('')
                $('#hidden_location').val('');
                filter(0);
            }
        });
        filter();
    });

    function get_filter_products(){
    var location = $('#location').val();
    var cat_val = $('#hidden_value').val();
    var product_ids = [];
    var brands_ids = [];
      $.each($("input[name='checklist']:checked"), function(){

          product_ids.push($(this).val());
      });
     if ((product_ids.indexOf('18') === -1) && (product_ids.indexOf('22') === -1)) {
          $('#brand_div').hide();
          $("#brand_title").hide();
          $("#for_brand").val('');
        }
        else {
          if($("#for_brand").val()=='done'){}
            else{
           $.ajax({
            type: "GET",
            url: "ajaxphp.php",
            dataType: 'html',  
            data: {product_ids:product_ids,p:'update_brand'},
            success: function(data){
              $("#brand_title").show();
              $("#brand_div").show();
              $("#items").html(data);
              $("#for_brand").val('done');
              } 
  });
       } }
        
      $.each($("input[name='brands']:checked"), function(){

          brands_ids.push($(this).val());
      });
     brands_ids.join();
   $.ajax({
      type: "GET",
      url: "ajaxphp.php",
       dataType: 'html',  
      data: {product_ids:product_ids,brands_ids:brands_ids,location:location,cat_val:cat_val,p:'get_search_filter'},
      success: function(data){
        $('#serach_results').html('');
        //return false;
         //alert(data);
         $('#serach_results').html(data);
      } 
  });
   
}
function get_filter_brands(){
  alert('here');return false;
  var brands_ids = [];
      $.each($("input[name='brands']:checked"), function(){

          brands_ids.push($(this).val());
      });
     brands_ids.join();
   $.ajax({
      type: "GET",
      url: "ajaxphp.php",
       dataType: 'html',  
      data: {brands_ids:brands_ids,p:'get_search_filter'},
      success: function(data){
        $('#serach_results').html('');
        //return false;
         //alert(data);
         $('#serach_results').html(data);
      } 
  });
   
}

function find_filter_jobs(){
  var cat_val = $('#hidden_value').val();
  var job_title = $('#job_title').val();
   var job_location =$('#location').val();
   var job_sub_category =$('#subcategory_jobs').val();
   var job_month_year =$('#month_year').val();
   var job_min_price =$('#min_price').val();
   var job_max_price =$('#max_price').val();
  
   //alert(job_filter);
    $.ajax({
            type: "GET",
            url: "ajaxphp.php",
             dataType: 'html',  
            data: {cat_val:cat_val,job_title:job_title,job_location:job_location,job_sub_category:job_sub_category,job_month_year:job_month_year,job_min_price:job_min_price,job_max_price:job_max_price,p:'get_jobs_filter'},
            success: function(data){
              $('#serach_results').html('');
              //return false;
               //alert(data);
               $('#serach_results').html(data);
            } 
        });
}
</script>
  <meta charset="utf-8">
  <title><?= $cons_sitetitle;?></title>
  <!--meta name="viewport" content="width=device-width, initial-scale=1"-->
  <meta name="keywords" content="<?php echo $meta_tags; ?>" />
  <meta name="description" content="<?php echo $meta_description; ?>" />

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAjUVBDtXhhNNo36KTzFe5GhNa3o4cK5aA&libraries=places&callback=initMap" async defer></script>
  <script src='https://www.google.com/recaptcha/api.js'></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


  <link rel="stylesheet"  href="src/css/lightslider.css"/>
    <style>
      ul{
      list-style: none outside none;
        padding-left: 0;
            margin: 0;
    }
        .demo .item{
            margin-bottom: 60px;
        }
    .content-slider li{
        background-color: #ed3020;
        text-align: center;
        color: #FFF;
    }
    .content-slider h3 {
        margin: 0;
        padding: 70px 0;
    }
    .demo{
      width: 800px;
    }
    .btn-color{
      background-color: #e22029;
    }
    .homeBtn {
    border: none;
    padding: 15px 25px;
    font-size: 16px;
    font-weight: 700;
    color: #fff !important;
    background-color: #4885ED;
    text-transform: uppercase;
    display: block ruby;
    margin-top:4px; 
}
.homeBtn:hover{
  background-color: #3e3bf5;
}
.homeBtn1:hover{
  background-color: #bd3719;
}
.homeBtn1 {
    border: none;
    padding: 15px 25px;
    font-size: 16px;
    font-weight: 700;
    color: #fff !important;
    background-color: #e22029;
    text-transform: uppercase;
    display: block ruby;
    margin-top:4px; 
}
.btn_size{
  padding: 10px 18px;font-size: 11px;border-radius: 4px;
}
    </style>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script src="src/js/lightslider.js"></script> 
    <script>
       $(document).ready(function() {
      $("#content-slider").lightSlider({
                loop:true,
                keyPress:true
            });
            $('#image-gallery').lightSlider({
                gallery:true,
                item:1,
                thumbItem:9,
                slideMargin: 0,
                speed:500,
                auto:true,
                loop:true,
                onSliderLoad: function() {
                    $('#image-gallery').removeClass('cS-hidden');
                }  
            });
    });
       function showCustomerSignup() {
    if ($('#globalloginModal').hasClass('show')) {
        $('#globalloginModal').modal('hide').on('hidden.bs.modal', function () {
            $('#customersignupmodal').modal('show');
            $(this).off('hidden.bs.modal');
        });
    } else {
        $('#customersignupmodal').modal('show');
    }

}
function showGlobalLogin() {
    if ($('#customersignupmodal').hasClass('show')) {
        $('#customersignupmodal').modal('hide').on('hidden.bs.modal', function () {
            $('#globalloginModal').modal('show');
            $(this).off('hidden.bs.modal');
        });
    } else {
        $('#globalloginModal').modal('show');
    }
}
<!-- //Count down function -->
var countDownDate = new Date("<?php echo $top_offers; ?>").getTime();
var x = setInterval(function() {
var now = new Date().getTime();
var distance = countDownDate - now;
var days = Math.floor(distance / (1000 * 60 * 60 * 24));
var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
var seconds = Math.floor((distance % (1000 * 60)) / 1000);
document.getElementById("count_down").innerHTML = days + "d " + hours + "h "
+ minutes + "m " + seconds + "s " +'left';
if (distance < 0) {
  clearInterval(x);
  document.getElementById("count_down").innerHTML = "EXPIRED";
}
}, 1000);
<!-- //End Count Down function -->
</script>

<link rel="stylesheet" href="css/style.css?v=1.1">
</head>
<body>
  
  <?php
  $top_offers = get_records($tblcms,"type = 'top_offers'");

   ?>
  <div class="offer_div" <?php if(isset($_SESSION['close_offer'])) { ?> style="display: none;"  <?php } ?> >
    <a class="offer_close" href="process.php?p=close_offer">X</a>
    <div class="top_offers animation_div">
      <span class="count_down" id="count_down"></span>
    <?php echo $top_offers[0]['content_'.$lang]; ?></div>

  </div>

<div class="bg_image" <?php if($p!="index"){?> style="background-image: none;" <?php }?>>

  <div class="container">
      <div class="row header">
      <div class="col-8 col-md-6"><a class="navbar-brand" href="<?php echo makepage_url("index");?>"><img src="images/site-logo.png" class="img-fluid"></a></div>
      <div class="col-4 col-md-6">
        
        <nav class="navbar navbar-expand-lg navbar-dark pull-right">
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
              <?php
              if($user_id>0){
                 $dashboard = ($_SESSION['user_record']['type'])?'dashboard':'account';
              ?>
                <li class="nav-item d-none d-lg-block">
                  <a class="homeBtn1 btn_size" href="<?php echo makepage_url($dashboard);?>"><?php echo translate("Dashboard");?></a>
                </li>
                <li class="nav-item d-none d-lg-block">
                  <a class="homeBtn btn_size" href="<?php echo makepage_url("add_product");?>"><?php echo translate("Post Ads");?> </a>
                </li>
               
                <li class="nav-item d-none d-lg-block">
                  <a class="homeBtn1 btn_size" href="process.php?p=logout"><?php echo translate("Logout");?></a>
                </li>
                <li class="nav-item d-block d-lg-none">
                  <a class="nav-link" href="<?php echo makepage_url($dashboard);?>"><?php echo translate("Dashboard");?></a>
                </li>
                <?php
                if($_SESSION['user_record']['type']){
                ?>
                  <li class="nav-item d-block d-lg-none">
                    <a class="nav-link" href="<?php echo makepage_url("add_product");?>"><?php echo translate("Post Ads");?></a>
                  </li>
                <?php
                }
                ?>
                <li class="nav-item d-block d-lg-none">
                  <a class="nav-link" href="process.php?p=logout"><?php echo translate("Logout");?></a>
                </li>
              <?php
              } else {
              ?>
                <li class="nav-item d-none d-lg-block">
                  <a class="homeBtn1 btn_size" data-toggle="modal" data-target="#login_popup" title="" href="javascript:void(0);"><?php echo translate("LOGIN");?></a>
                </li>
                <li class="nav-item d-none d-lg-block">
                  <a class="homeBtn btn_size" href="<?php echo makepage_url("login");?>"><?php echo translate("Post Ads");?> </a>
                </li>
                <li class="nav-item d-none d-lg-block">
                  <a class="homeBtn btn_size" href="javascript:;" data-toggle="modal" data-target="#register_popup" title=""><?php echo translate("SIGN UP");?></a>
                </li>
                <li class="nav-item d-block d-lg-none">
                  <a class="homeBtn1 btn_size" href="javascript:;" data-toggle="modal" data-target="#login_popup" title=""><?php echo translate("LOGIN");?></a>
                </li>
                <li class="nav-item d-block d-lg-none">
                  <a class="homeBtn btn_size" href="javascript:;" data-toggle="modal" data-target="#register_popup" title=""><?php echo translate("SIGN UP");?></a>
                </li>
              <?php
              }
              ?>
              <li class="nav-item">
                <a class="nav-link lang" href="process.php?p=select_lang&lang=en"><img src="images/en-flag.png" width="20" /> EN</a>
              </li>
              <li class="nav-item">
                <a class="nav-link lang" href="process.php?p=select_lang&lang=th"><img src="images/th-flag.png" width="20" /> TH</a>
              </li>
            </ul>
          </div>
        </nav>

      </div>
    </div>
  </div>
  
  <div class="menu_bar d-none d-lg-block">
    <div class="container">
      <div class="row">
        <div class="col-12">
          <?php
          if(count($parent_categories)>0){
            $sep = "";
            foreach ($parent_categories as $v) {
              echo $sep;
            ?>
              <a href="<?php echo makepage_url("search","?id=".enc_password($v['id']));?>"><?php echo $v['title_'.$lang];?></a>
            <?php
              $sep = "&nbsp;|&nbsp;";
            }
          }
          ?>
        </div>
      </div>
    </div>
  </div>
  <?php
  if($p=="index"){
  ?>
  <div class="container">
    <?php if(isset($_POST['submit'])){
$selected_val = $_POST['category'];  // Storing Selected Value In Variable
echo translate("You have selected :") .$selected_val;  // Displaying Selected Value
}
?>
    <form action="<?php echo makepage_url("search");?>" method="post">
    <div class="row top_banner_section justify-content-center">
      <div class="col-12 banner_caption"><?php echo translate("lang_text1");?></div>
      <div class="col-12 col-md-8">
        <div class="row">
          <div class="col-12 col-md-4 nopadding"><input type="text" class="form-control search_fields" name="title" placeholder="<?php echo translate("lang_text2.");?>" value=""></div>
          <div class="col-12 col-md-4 nopadding">
            <select class="form-control search_fields" selected="selected" name="id">
              <?php
              if(count($parent_categories)>0){
                foreach ($parent_categories as $v) {
                ?>
                  <option value="<?php echo enc_password($v['id']);?>"><?php echo $v['title_'.$lang];?></option>
                <?php
                }
              }
              ?>
            </select>
          </div>
          <div class="col-12 col-md-4 nopadding"><input type="text" class="form-control search_fields" name="location" placeholder="<?php echo translate("Enter location");?>" value=""></div>
        </div>
      </div>
      <div class="col-12 banner_search_btn"><input type="submit" class="btn btn-primary" name="submit" value="<?php echo translate("Search");?>"></div>
    </div>
    </form>
  </div>
  <?php
  }
  ?>
</div>

    
</body>
</html>