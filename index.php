<?php
include("header.php");

$featured_products = get_records($tblproducts,"featured='1' and status='1' and trash='0'","","4");
$featured_car_products = get_records($tblproducts,"featured='1' and status='1' and trash='0'","","3");
$home_news = get_records($tblnews,"featured='1' and status='1' and trash='0'","","3");
?>
<div class="bgcolor">
  <div class="container">
    <div class="row section_spacer">
    <?php
    if(count($parent_categories)>0){
      foreach ($parent_categories as $k=>$v) {
        if($k>=4){ break; }
        $subcategories = get_records($tblcategories,"pid='".$v['id']."' and status='1' and trash='0'","title_".$lang." ASC","5");
      ?>
        <div class="col-12 col-md-3">
          <div class="mybox">
          <div class="col-12"><i class="fa fa-cart-plus"></i></div>
          <div class="col-12 title"><?php echo $v['title_'.$lang];?></div>
          <div class="col-12">
            <?php
            if(count($subcategories)>0){
              foreach($subcategories as $v2){
              ?>
                <a href="<?php echo makepage_url("search","?slug=".($v2['slug_en']));?>"><?php echo $v2['title_'.$lang];?></a><br>
              <?php
              }
            }
            ?>
          </div>
        </div>
        </div>
      <?php
      }
    }
    ?>
    </div>
   
  </div>
</div>
<div class="container" style="margin-top: 10px">
 <div class="row ad_banner">
     <img src="images/car - Copy.jpg">
    </div>
  </div>
<div class="container">
  <div class="row section_spacer">
    <div class="col-12 heading center mb50"><?php echo translate("Featured Ads");?></div>
    <?php
    if($featured_products){
      foreach ($featured_products as $v) {
        $product = $v;
      ?>
        <div class="col-12 col-md-3"><?php include("card_car.php");?></div>
      <?php
      }
    }
    ?>
  </div>
</div>

<div class="bgcolor">
  <div class="container">
    <div class="row section_spacer">
      <div class="col-12 heading center mb50"><?php echo translate("Featured Cars");?></div>
      <div class="col-12 col-md-3"><?php include("mybox3.php");?></div>
      <?php
      if($featured_car_products){
        foreach ($featured_car_products as $v) {
          $product = $v;
        ?>
          <div class="col-12 col-md-3"><?php include("card_car.php");?></div>
        <?php
        }
      }
      ?>
    </div>
  </div>
</div>

<div class="container">
  <div class="row section_spacer">
    <div class="col-12 heading center mb50"><?php echo translate("FROM THE BLOG");?></div>
    <?php
    if($home_news){
      foreach ($home_news as $v) {
        $record = $v;
      ?>
        <div class="col-12 col-md-4"><?php include("news_box.php");?></div>
      <?php
      }
    }
    ?>
  </div>
</div>
<div class="container" style="margin-bottom: 10px">
 <div class="row ad_banner">
     <img src="images/car - Copy.jpg">
    </div>
  </div>
<?php include("footer.php");?>