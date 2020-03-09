<?php
error_reporting(0);
include("header.php");
$id = 0;
if(isset($_GET['id'])){
  $id = dec_password($_GET['id']);
}
$product = get_records($tblproducts,"id='".$id."' and status='1' and trash='0'");

$get_user_detail =  get_records($tblusers,"id='".$product[0]['user_id']."' and status='1' and trash='0'");

$user_online =  get_records($tblusers,"id='".$product[0]['user_id']."' and status='1' and trash='0'");

if(!(count($product)>0)){
  redirect("search");exit;
}
$imgs = get_product_imgs($product[0]['id']);
?>
<html>
<head>
  <link rel="stylesheet" type="text/css" href="css/custom.css">

<script type="text/javascript">

    $(document).ready(function () {

        $('#prd-gallery-carousel').flexslider({
            animation: "slide",
            controlNav: false,
            animationLoop: false,
            slideshow: false,
            itemWidth: 88.5,
            itemMargin: 13,
            asNavFor: '#product-gallery-slider'
        });

       
        

        // initiates responsive slide
        var settings = function () {
            var mobileSettings = {
                slideWidth: 80,
                minSlides: 2,
                maxSlides: 5,
                slideMargin: 5,
                adaptiveHeight: true,
                pager: false

            };
            var pcSettings = {
                slideWidth: 100,
                minSlides: 3,
                maxSlides: 5,
                pager: false,
                slideMargin: 10,
                adaptiveHeight: true
            };
            return ($(window).width() < 768) ? mobileSettings : pcSettings;
        }

        var thumbSlider;

        function tourLandingScript() {
            thumbSlider.reloadSlider(settings());
        }

        thumbSlider = $('.product-view-thumb').bxSlider(settings());
        $(window).resize(tourLandingScript);

    });
    
    function seeNumber(obj) {
        var phn = $(obj).data('phn');
        var val = $(obj).data('val');
        if (val == 0) {
            $(obj).data('val', '1');
            $(obj).html('<i class="icofont-ui-call"></i> ' + phn);
        } else {
            $(obj).data('val', '0');
            $(obj).html('<i class="icofont-ui-call"></i> See Number');
        }
    }
    function closeChat()
    {
        document.getElementById("ChatMsg").style.width = "0";
    }
    function openChat()
    {
       $("#ChatMsg").show(500);
     //  $("#ChatMsg").animate({"left":"0px", "slow");
        $('#scroll_top').css({'z-index': '0'});
        var screen = window.screen.availWidth;
        var siftScrren = "40%";
        if (screen > 720)
        {
            var siftScrren = "30%";
        }
        if (screen < 720 && screen > 620) {
            var siftScrren = "80%";
        }
        if (screen < 620) {
            var siftScrren = "100%";
        }
        document.getElementById("ChatMsg").style.width = siftScrren;
        //$('#ChatMsg').show();
        var div = $("#displayMsg");
        div.scrollTop(div.prop('scrollHeight'));
        setInterval(function () {
            newUpdate();
        }, 5000);

    }
    function sendmsg(id, ads)
    {
        var message = $('#msgboxtext').val();
        $('#msgboxtext').val('');
        var receiver = id;
        var url = "/message/send-msg?msg=" + message + "&receiver=" + receiver + "&ad=" + ads;
        $.post(url, function (data) {
//            $('#msgboxtext').val('');
            // $('#displayMsg').append("Sent");
        }).fail(function () {
            $('#display-msg').append("<p>Connection Error...</p>");
        });

    }
    function newUpdate()
    {
        var chat = "21" + "3" + "11";
        var receiver = "11";
        var current = $('#check').val();

        var check = "/message/check?chatId=" + chat;

        $.post(check, function (data) {
            if (data > current)
            {
                console.log("chech client :" + current + " --- " + " server : " + data);
                $('#check').val(data);
                // var new_msg = getNewMsg(chat);
                var check = "/message/load-new-msg?chat=" + chat;
                $.post(check, function (data) {
                    $('#displayMsg').append(data);
                    var div = $("#displayMsg");
                    div.scrollTop(div.prop('scrollHeight'));
                }).fail(function () {
                    return "fools";
                });
            }
        }).fail(function (data) {
           
        });
    }

    function getNewMsg(chat)
    {
        var check = "/message/load-new-msg?chat=" + chat;
        $.post(check, function (data) {
            return data;
        }).fail(function () {
            return "fools";
        });
    }

    function CheckUpdate()
    {

        var chat = "21" + "3" + "11";
        var receiver = "11";
        var current = $('#check').val();

        var check = "/message/check?chatId=" + chat;

        var url = "/message/load-msg-tpl?chat_id=" + chat + "&current=" + current;
        $.post(url, function (data)
        {
            $('#displayMsg').append(data);
            var div = $("#displayMsg");
            div.scrollTop(div.prop('scrollHeight'));

        }).done(function () {
            $('#displayMsg').append(data);
        }).fail(function () {
            $('#display-msg').append("<p>Connection Error...</p>");
        });


        $.post(check, function (data) {
            if (data > current)
            {
                document.getElementById("check").value = data;

            }
        }).fail(function () {
            alert(data + " urrent:" + current);
        });
    }

function fnAdd_bidd(){

  var bidder_id = $('#bidder_id').val();
  if(isNaN(bidder_id))
  {
   
    window.location.href = "http://localhost/thai/login.php";
    return false;
  }
  //return false;

  var product_id = $('#product_id').val();
  var user_id = $('#user_id').val();
  var bid_amount = $('#bid_amount').val();
  var bid_message = $('#bid_message').val();
  if(bid_amount>0)
    {
        $.ajax({
            type: "GET",
            url: "ajaxphp.php",
             dataType: 'JSON',  
            data: {product_id:product_id,user_id:user_id,bidder_id:bidder_id,bid_amount:bid_amount,bid_message:bid_message,p:'add_bidd'},
            cache: false,
            success: function(data){
              
               $(".bidd-form").fadeOut(500);
               var stramount = '<span class="field-left">Bid Amount</span> <span id="sp_bid_amount" class="field-right">'+data[0].amount+'</span>';
               $("#div_bid_amount").html(stramount);
               var strdate = '<span class="field-left">Bid Amount</span> <span id="sp_bid_amount" class="field-right">'+data[0].created_date+'</span>';
              $("#div_bid_date").html(strdate);
                var total_bid = '<span class="field-left">Total Bids</span> <span class="field-right">'+data[0].total_bid_counts+'</span>';
                var heighest_bid ='<span class="field-left">Highest Bids</span> <span class="field-right">USD'+data[0].max_bid_amount+'</span>';
                var lowest_bid = '<span class="field-left">Lowest Bids</span> <span class="field-right">USD'+data[0].min_bid_amount+'</span>';
                $("#total_bid").html(total_bid);
                $("#heighest_bid").html(heighest_bid);
                $("#lowest_bid").html(lowest_bid);
            } 
        });
    }
    else
    {
      alert('amount cannot be blank');
    }

}


</script>
</head>

<body>
<div class="container">
<div class="row section_spacer">
  <div class="col-12 col-md-8">
    <div class="row">
      <div class="col-12">
        <ul id="image-gallery" class="gallery list-unstyled cS-hidden">
          <?php
          if(count($imgs)>0){
            foreach ($imgs as $v) {
            ?>
            <li data-thumb="<?php echo $v;?>"> 
              <img src="<?php echo $v;?>" />
            </li>
            <?php
            }
          }
          ?>
        </ul>
      </div>
    </div>
    <div class="row">
      <div class="col-12 heading mt40 border_bottom">About</div>
      <?php
      if($product[0]['type']){
      ?>
        <div class="col-12 col-md-4"><span class="heading3">Type</span><br><?php echo $product[0]['type'];?></div>
      <?php
      }
      if($product[0]['model']){
      ?>
        <div class="col-12 col-md-4"><span class="heading3">Model</span><br><?php echo $product[0]['model'];?></div>
      <?php
      }
      if($product[0]['brand']){
      ?>
        <div class="col-12 col-md-4"><span class="heading3">Brand</span><br><?php echo $product[0]['brand'];?></div>
      <?php
      }
      if($product[0]['year_registration']){
      ?>
        <div class="col-12 col-md-4"><span class="heading3">Registration Year</span><br><?php echo $product[0]['year_registration'];?></div>
      <?php
      }
      if($product[0]['driven']){
      ?>
        <div class="col-12 col-md-4"><span class="heading3">Driven</span><br><?php echo $product[0]['driven'];?></div>
      <?php
      }
      if($product[0]['fuel_type']){
      ?>
        <div class="col-12 col-md-4"><span class="heading3">Fuel Type</span><br><?php echo $product[0]['fuel_type'];?></div>
      <?php
      }
      if($product[0]['gearbox']){
      ?>
        <div class="col-12 col-md-4"><span class="heading3">Gearbox Type</span><br><?php echo $product[0]['gearbox'];?></div>
      <?php
      }
      if($product[0]['features']){
      ?>
        <div class="col-12 col-md-4"><span class="heading3">Features</span><br><?php echo $product[0]['features'];?></div>
      <?php
      }
      ?>
      <div class="col-12 heading mt40 border_bottom">Description</div>
      <div class="col-12"><?php echo $product[0]['description'];?></div>
      <div class="col-12 heading mt40 border_bottom">Similar Ads</div>
    </div>
  </div>
  <div class="col-12 col-md-4">
    
    <div class="row search_box">
      <div class="col-12 border_bottom pt10">
        <?php
        $latitude = $product[0]['latitude'];
        $$longitude = $product[0]['longitude'];
        include("gmap2.php");
        ?>
        <div class="heading3"><?php echo $product[0]['title']; ?></div>
        <div><i class="fa fa-phone"></i>&nbsp;<?php echo $product[0]['location']; ?></div>
      </div>
      <div class="col-12 border_bottom">
        <div class="row">
          <div class="col-2"><img src="images/user.jpg" class="user_icon"></div>
          <div class="col-10">
            By
            <a href="vendor_profile.php?id=<?=enc_password($get_user_detail[0]['id']);?>"><?php echo $get_user_detail[0]['name']; ?></a><br>
            <?php echo $product[0]['created_date']; ?> - Views <span class="bold">6</span></br>
            <?php if($user_online[0]['login']=='1')
            { echo '<h3 style="color:red;">online</h3>';} ?>
            
          </div>
        </div>
      </div>
      <div class="col-12 border_bottom">
        <?php echo show_price($product[0]['price']);?>
      </div>
      <div class="col-12 pb10">
        <div class="row">
          <div class="col-6"><a class="nav-link btn btn-primary" href="#"><i class="fa fa-phone"></i>xxxxxxxx</a></div>
          <div class="col-6"><a class="nav-link btn btn-primary" href="javascript:void(0);" onclick="openChat();">MESSAGE</a></div>
        </div>
      </div>
    </div>

    
    <?php include("product_chat.php");?>


          <div class="bidd-details-sec">
                            <nav>
                                <div class="nav nav-tabs nav-fill" id="nav-tab" role="tablist">
                                                                            <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#bidding" role="tab" aria-controls="nav-home" aria-selected="true">Bidding Status</a>
                                                                        <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#bidders" role="tab" aria-controls="nav-profile" aria-selected="false">Top Bidders</a>
                                </div>
                            </nav>
     <?php $where_condition="";
      $get_product_bid =get_records($tblbidding,"product_id='".$product[0]['id']."' and bidder_id='".$_SESSION['user_record']['id']." and status='1' and trash='0'"); 
             $where = "product_id=".$get_product_bid[0]['product_id']."";
             
            $max_bid_amount = sql("SELECT MAX(amount) as max_bid_amount FROM " . $tblbidding . " where " . $where);
             $min_bid_amount = sql("SELECT MIN(amount) as min_bid_amount FROM " . $tblbidding . " where " . $where);
             $total_bid_counts = sql("SELECT COUNT(*) as Num FROM " . $tblbidding . " where " . $where);
                                    if(!empty($get_product_bid)){
                                      ?>
                                      <style type="text/css">#bidding_form{
                                        display:none;
                                        }</style>
                                         <div class="tab-content py-3 px-3 px-sm-0" id="nav-tabContent">
                                    <div class="tab-pane fade show active" id="bidding" role="tabpanel" aria-labelledby="nav-home-tab">
                                        <div id ="div_bid_amount" class="tab-content-field">
                                            <span class="field-left">Bid Amount</span>
                                            <span class="field-right"><?php echo $get_product_bid[0]['amount'] ?></span>
                                        </div>
                                        
                                        <div id ="div_bid_date" class="tab-content-field">
                                            <span class="field-left">Bid Date</span>
                                            <span class="field-right"><?php echo $get_product_bid[0]['created_date'] ?></span>
                                        </div>
                                    </div>
                                <div class="tab-pane fade" id="bidders" role="tabpanel" aria-labelledby="nav-profile-tab">
                                    <div id="total_bid" class="tab-content-field">
                                        <span class="field-left">Total Bids</span>
                                        <span class="field-right"><?php echo $total_bid_counts[0]['Num']; ?></span>
                                    </div>
                                    <div id="heighest_bid" class="tab-content-field">
                                        <span class="field-left">Highest Bids</span>
                                        <span class="field-right">USD <?php echo $max_bid_amount[0]['max_bid_amount']; ?> </span>
                                    </div>
                                    <div id="lowest_bid" class="tab-content-field">
                                        <span class="field-left">Lowest Bids</span>
                                        <span class="field-right">USD <?php echo $min_bid_amount[0]['min_bid_amount']; ?> </span>
                                    </div>
                                </div>
                            </div>
                                        <?php

                                    }
                                      else{
                                        ?>
                                         <div class="tab-content py-3 px-3 px-sm-0" id="nav-tabContent">
                                    <div class="tab-pane fade show active" id="bidding" role="tabpanel" aria-labelledby="nav-home-tab">
                                        <div id ="div_bid_amount" class="tab-content-field">
                                            <span class="field-left">Bid Amount</span>
                                            <span class="field-right">You have not bid this ad yet</span>
                                        </div>
                                        
                                        <div id ="div_bid_date" class="tab-content-field">
                                            <span class="field-left">Bid Date</span>
                                            <span class="field-right">You have not bid this ad yet</span>
                                        </div>
                                    </div>
                                <div class="tab-pane fade" id="bidders" role="tabpanel" aria-labelledby="nav-profile-tab">
                                    <div id="total_bid" class="tab-content-field">
                                        <span class="field-left">Total Bids</span>
                                        <span class="field-right"></span>
                                    </div>
                                    <div id="heighest_bid" class="tab-content-field">
                                        <span class="field-left">Highest Bids</span>
                                        <span class="field-right">USD </span>
                                    </div>
                                    <div id="lowest_bid" class="tab-content-field">
                                        <span class="field-left">Lowest Bids</span>
                                        <span class="field-right">USD </span>
                                    </div>
                                </div>
                            </div>
                            <?php
                                                                             
                                      }
                     
                     ?>
                     
                             <div id="bidding_form" class="bidd-form">
                                <form action="process.php?p=add_bidd" id="customer-bidding-form">
                                    <input type="hidden" name="product_id" id="product_id" value="<?php echo $product[0]['id'] ?>">
                                    <input type="hidden" name="user_id" id="user_id" value="<?php echo $product[0]['user_id'] ?>">
                                    <input type="hidden" name="bidder_id" id="bidder_id" value="<?php echo $_SESSION['user_record']['id']; ?>">
                                    <div class="form-group">
                                        <input type="text" name="bid_amount" id="bid_amount" placeholder="Bids amount in (USD)">
                                        <span class="help-block"></span>
                                    </div>
                                    <div class="form-group">
                                        <textarea name="bid_message" id="bid_message" placeholder="Comments..."></textarea>
                                        <span class="help-block"></span>
                                    </div>
                                    <div class="form-info-txt">* Your phone number will be displayed to post the author</div>
                                    
                                    <a href="javascript:;" onclick="fnAdd_bidd();">Save</a>
                                </form>
                            </div> 
                     
                                 
                           

                        
                        </div>
                                                   
         <!--  here end -->
  </div>
</div>
</div>

<?php
include("footer.php");
?>





</body>
</html>