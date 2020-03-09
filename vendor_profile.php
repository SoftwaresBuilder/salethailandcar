<?php

include("header.php");
$id = 0;
if(isset($_GET['id'])){
  $id = dec_password($_GET['id']);
}


$products = get_records($tblproducts,"user_id='".$id."' and status='1' and trash='0'");
$vendor_record = get_records($tblusers,"id='".$id."' and status='1' and trash='0'");
$count_total_products = count($products);
?>
<script type="text/javascript">
  function changeText(val) {
    if($("#show_number").text() ==='xxxxxxx'){
    $("#show_number").text(val);
  }
  else{$("#show_number").text('xxxxxxx');}
}
</script>
<div class="container">
  <div style="margin-top: 15px" class="row">
    <div class="col-12 col-md-4">
       <div class="row">
        <div class="col-12 col-md-6">
      <div class="row">
      <img style="height: 150px; width: 150px" src="images/user.jpg" alt="/images/user.jpg">
    </div>
     </div>
     <div class="col-12 col-md-6">
        <div class="row">
      <?php echo $vendor_record[0]['name']; ?> 
    </div>
     <div class="row">
     Last Active
    </div>
     <div class="row">
      <a href="#"><div class="seller-public-profile-star-icons">
      <!-- <i class="fa fa-star-o"></i> <i class="fa fa-star-o"></i> <i class="fa fa-star-o"></i> <i class="fa fa-star-o"></i> <i class="fa fa-star-o"></i> --> </a>
    </div>          <span class="rating-count count-clr"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
         <!--   (0) -->
           </font></font></span>
        </div>
     </div>
    </div>
    </div>
    <div class="col-12 col-md-4">
      <!-- <div class="row">
       <div class="col-12 col-md-6">
       <h4>Total Number Of Ads = <?php echo $count_total_products; ?></h4>
     </div>
       <div class="col-12 col-md-6">
      <h4> Total Num of Sale Ads = </h4>
     </div>
    </div> -->
   <div class="row">
      <div class="col-12 col-md-6">
        
         <a id="show_number" onclick="changeText('1234567');" class="nav-link btn btn-primary" href="#"><i class="fa fa-phone"></i>xxxxxxx</a>
          
      </div>
      <div class="col-12 col-md-6">
        <a class="nav-link btn btn-primary" href="javascript:void(0);" onclick="openChat();"><?php echo translate("MESSAGE");?></a>
      </div>
    </div>
     
  
  </div>
</div>
  <div class="row section_spacer">
    
    <div class="col-12 col-md-12">
      <div class="row">
        
        <?php
        if(count($products)>0){
        
          foreach ($products as $product) {
            $category = get_records($tblcategories,"id='".$product['category_id']."' and status='1' and trash='0'");
            $card_name =$category[0]['card_name'].'.php';

          ?>
            <div class="col-12 col-md-3"><?php include($card_name);?></div>
          <?php
          }
        } else {
        ?>
          <div class="col-12"><div class="err err_div"><?php echo translate("No record found");?></div></div>
        <?php
        }
        ?>
      </div>
    </div>
  </div>
</div>

<?php
include("footer.php");
?>