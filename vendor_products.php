<?php

include("header.php");
$id = 0;
if(isset($_GET['id'])){
  $id = dec_password($_GET['id']);
}


$products = get_records($tblproducts,"user_id='".$id."' and status>0 and trash='0'");
$vendor_record = get_records($tblusers,"id='".$id."' and status='1' and trash='0'");
$count_total_products = count($products);
?>
<script type="text/javascript">
  function changeText(val) {
    if(val!=''){
    if($("#show_number").html() ==='<i class="fa fa-phone"></i>xxxxxxx'){
    $("#show_number").text(val);
  }
  else{$("#show_number").html('<i class="fa fa-phone"></i>xxxxxxx');}
}
}
</script>
<div class="container">
  <h4>All Products of <?php echo $vendor_record[0]['name']; ?> </h4>
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