<?php
include("header.php");

$id = 0;
if(isset($_REQUEST['id'])){
    $id = dec_password($_REQUEST['id']);
}

$flag_for_location = false;
$category = get_records($tblcategories,"id='".$id."' and status='1' and trash='0'");
if(!(count($category)>0)){
  redirect("index");exit;
}

$where = "category_id='".$id."' and status>=1 and trash='0'";
if(isset($_POST['title'])){
    $title =$_POST['title'];
    $where .= " AND title_".$lang." LIKE '%".$title."%'";
}
$location = "";
if(isset($_POST['location'])){
    $location = $_POST['location'];
    $where .= " AND location LIKE '%".$location."%'";
}

$products = get_records($tblproducts,$where,'sort_date DESC');
$card_name = (count($category)>0)?$category[0]['card_name'].'.php':"card_car.php";
$banner_name = ($category[0]['banner_name'])?$category[0]['banner_name'].'.php':"";
if($banner_name){
  include($banner_name);
  $flag_for_location = true;
}
?>
    <input type="hidden" id="hidden_value" value="<?php echo $id;?>">
    <div class="container">

        <div class="row section_spacer">
            <div class="col-12 col-md-3">
                <?php if($banner_name=="banner_jobs.php"){} else { include("search_box.php");}?>
            </div>
            <div class="col-12 col-md-9">
                <div class="col-12 heading mb50">
                    <?php echo $category[0]['title_'.$lang];?>
                    <div style="float: right;"><span style="color: green;font-size: 24px"><a href="<?php echo makepage_url("search_by_map","?id=".enc_password($id));?>">View by map&nbsp;</a> 
                    </span></div>
                </div>

                <div class="row" id="serach_results">
                    <?php
                    if(count($products)>0){
                      foreach ($products as $product) {
                    ?>
                        <div class="col-12 col-md-4">
                            <?php include($card_name);?>
                        </div>
                    <?php
                      }
                    } else {
                    ?>
                        <div class="col-12">
                            <div class="err err_div"><?php echo translate("No record found");?></div>
                        </div>
                    <?php
                    }
                    ?>
                </div>
                <div id="get_focus" style="display: block;"></div>
            </div>
        </div>
    </div>

    <?php
include("footer.php");
?>