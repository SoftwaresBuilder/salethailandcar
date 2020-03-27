<?php
include'header.php';
$tab = (isset($_GET['tab']))?$_GET['tab']:"ads";
$tab_ads = "";
$tab_personal = "";
$tab_favorites = "";
$tab_pending = "";
$tab_chat = "";
$tab_packages = "";
$tab_bids = "";
switch($tab){
  case "personal":
    $tab_personal = "show active";
  break;
  case "favorites":
    $tab_favorites = "show active";
  break;
  case "pending":
    $tab_pending = "show active";
  break;
  case "chat":
    $tab_chat = "show active";
  break;
  case "packages":
    $tab_packages = "show active";
  break;
  case "bids":
    $tab_bids = "show active";
  break;
  default:
    $tab_personal = "show active";
}
?>
<div class="container">
    <div class="section_spacer">
        <div class="col-12"><?php show_errors();?></div>
        <div class="row mt10">
          <div class="col-12 col-md-4 col-lg-2">
            <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
              <a class="nav-link <?php echo $tab_personal;?>" id="v-pills-menu2-tab" data-toggle="pill" href="#v-pills-menu2" role="tab" aria-controls="v-pills-menu2" aria-selected="false"><?php echo translate("Personal Home");?></a>
              <a class="nav-link <?php echo $tab_ads;?>" id="v-pills-menu1-tab" data-toggle="pill" href="#v-pills-menu1" role="tab" aria-controls="v-pills-menu1" aria-selected="true"><?php echo translate("My Ads");?></a>
              
              <a class="nav-link <?php echo $tab_favorites;?>" id="v-pills-menu3-tab" data-toggle="pill" href="#v-pills-menu3" role="tab" aria-controls="v-pills-menu3" aria-selected="false"><?php echo translate("Favourite ads");?></a>
              <a class="nav-link <?php echo $tab_pending;?>" id="v-pills-menu4-tab" data-toggle="pill" href="#v-pills-menu4" role="tab" aria-controls="v-pills-menu4" aria-selected="false"><?php echo translate("Pending Approvals");?></a>
              <a class="nav-link <?php echo $tab_chat;?>" id="v-pills-menu5-tab" data-toggle="pill" href="#v-pills-menu5" role="tab" aria-controls="v-pills-menu5" aria-selected="false"><?php echo translate("Chat");?></a>
              <a class="nav-link <?php echo $tab_packages;?>" id="v-pills-menu6-tab" data-toggle="pill" href="#v-pills-menu6" role="tab" aria-controls="v-pills-menu6" aria-selected="false"><?php echo translate("Packages");?></a>
              <a class="nav-link <?php echo $tab_bids;?>" id="v-pills-menu7-tab" data-toggle="pill" href="#v-pills-menu7" role="tab" aria-controls="v-pills-menu7" aria-selected="false"><?php echo translate("My Bids");?></a>
            </div>
          </div>
          <div class="col-12 col-md-8 col-lg-10">
            <div class="tab-content" id="v-pills-tabContent">
              <div class="tab-pane fade <?php echo $tab_ads;?>" id="v-pills-menu1" role="tabpanel" aria-labelledby="v-pills-menu1-tab">
                <?php include("products.php");?>
              </div>
              <div class="tab-pane fade <?php echo $tab_personal;?>" id="v-pills-menu2" role="tabpanel" aria-labelledby="v-pills-menu2-tab">
                <?php include("profile.php");?>
              </div>
              <div class="tab-pane fade <?php echo $tab_favorites;?>" id="v-pills-menu3" role="tabpanel" aria-labelledby="v-pills-menu3-tab">
                <?php include("product_favorites.php");?>
              </div>
              <div class="tab-pane fade <?php echo $tab_pending;?>" id="v-pills-menu4" role="tabpanel" aria-labelledby="v-pills-menu4-tab">
                <?php
                $where_extra = " and status='0'";
                include("products.php");
                ?>
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
              <div class="tab-pane fade <?php echo $tab_packages;?>" id="v-pills-menu6" role="tabpanel" aria-labelledby="v-pills-menu6-tab">
                <?php include("vendor_packages.php");?>
              </div>
              <div class="tab-pane fade <?php echo $tab_bids;?>" id="v-pills-menu7" role="tabpanel" aria-labelledby="v-pills-menu7-tab">
               <?php include("vendor_bids.php");?>
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