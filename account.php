<?php

include'header.php';
$tab = (isset($_GET['tab']))?$_GET['tab']:"ads";
$tab_orders = "";
$tab_personal = "";
$tab_favorites = "";
$tab_chat = "";
switch($tab){
  case "personal":
    $tab_personal = "show active";
  break;
  case "favorites":
    $tab_favorites = "show active";
  break;
  case "chat":
    $tab_chat = "show active";
  break;
  default:
    $tab_orders = "show active";
}
?>
<div class="container">
    <div class="section_spacer">
        <div class="col-12"><?php show_errors();?></div>
        <div class="row mt10">
          <div class="col-12 col-md-4 col-lg-3">
            <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
              <a class="nav-link <?php echo $tab_orders;?>" id="v-pills-menu1-tab" data-toggle="pill" href="#v-pills-menu1" role="tab" aria-controls="v-pills-menu1" aria-selected="true"><?php echo translate("My Bids");?></a>
              <a class="nav-link <?php echo $tab_personal;?>" id="v-pills-menu2-tab" data-toggle="pill" href="#v-pills-menu2" role="tab" aria-controls="v-pills-menu2" aria-selected="false"><?php echo translate("Personal Home");?></a>
              <a class="nav-link <?php echo $tab_favorites;?>" id="v-pills-menu3-tab" data-toggle="pill" href="#v-pills-menu3" role="tab" aria-controls="v-pills-menu3" aria-selected="false"><?php echo translate("Favourite ads");?></a>
              <a class="nav-link <?php echo $tab_chat;?>" id="v-pills-menu5-tab" data-toggle="pill" href="#v-pills-menu5" role="tab" aria-controls="v-pills-menu5" aria-selected="false"><?php echo translate("Chat");?></a>
            </div>
          </div>
          <div class="col-12 col-md-8 col-lg-9">
            <div class="tab-content" id="v-pills-tabContent">
              <div class="tab-pane fade <?php echo $tab_orders;?>" id="v-pills-menu1" role="tabpanel" aria-labelledby="v-pills-menu1-tab">
                <?php include("orders.php");?>
              </div>
              <div class="tab-pane fade <?php echo $tab_personal;?>" id="v-pills-menu2" role="tabpanel" aria-labelledby="v-pills-menu2-tab">
                <?php include("profile.php");?>
              </div>
              <div class="tab-pane fade <?php echo $tab_favorites;?>" id="v-pills-menu3" role="tabpanel" aria-labelledby="v-pills-menu3-tab">
                <?php include("product_favorites.php");?>
              </div>
              <div class="tab-pane fade <?php echo $tab_chat;?>" id="v-pills-menu5" role="tabpanel" aria-labelledby="v-pills-menu5-tab">
                <?php
                if(isset($_GET['chat_id'])){
                  include("chat_detail.php");
                } else {
                  include("chat.php");
                }
                ?>
              </div>
            </div>
          </div>
        </div>

    </div>
</div>
<?php include'footer.php';?>
<script type="text/javascript">
$('#v-pills-menu3-tab').on('click', function (e) {
  e.preventDefault()
  $(this).tab('show')
})
</script>