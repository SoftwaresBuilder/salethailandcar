<?php
$id = '';
if(isset($_GET['id']))
{
    $id = dec_password($_GET['id']);
    $record = get_records($tblusers,"id='".$id."'");
    //pr($record);
}
$package_detail = get_records($tbluser_package,"user_id='".$id."'");
$query ='SELECT COUNT(id) FROM ' .$tblproducts. ' WHERE user_id = ' .$id;
$query_pending_approvals ='SELECT COUNT(id) FROM ' .$tblproducts. ' WHERE user_id = ' .$id. ' AND status = 0';
$query_favourites ='SELECT COUNT(id) FROM ' .$tblproduct_favorites. ' WHERE user_id = ' .$id;

$count_ads = sql($query);
$count_pending_ads = sql($query_pending_approvals);
$count_favourites = sql($query_favourites);

?>
<style type="text/css">
    .for_text {
        font-size: 15px;
        font-family: serif;
        text-align: center;
        vertical-align: middle;
        line-height: 50px;
        height: 120px;
        border: 1px solid grey;
        background-color: #e6e9ed; margin-bottom: 20px;
    }
    .multiple{
        font-size: 15px;
        font-family: serif;
        text-align: center;
        border: 1px solid grey;
        background-color: #e6e9ed; margin-bottom: 20px;
    }
</style>

    
   <div class="row"><h4><a href="index.php?p=users">Back</a></h4></div>
        <div class="col-md-3 for_text">
        <?php
        $user_img = get_user_img($record[0]['img']);
        ?>
        <img width="100px" height="100px" style="border-radius: 50px; margin-top: 10px;margin-bottom: 10px" src="<?php echo $user_img; ?>">
        <span class="" style="margin-left: 20px"> <?php echo $record[0]['name']; ?></span>

        </div>
        <div class="col-md-3 for_text">Email :
            <?php echo $record[0]['email'] ?>
        </div>
         <div class="col-md-3 for_text">Phone #
            <?php echo $record[0]['phone'] ?>
        </div>
         <div class="col-md-3 for_text">IP Address :
            <?php echo $record[0]['ip_address'] ?>
        </div>
         <div class="col-md-4 for_text">Social Media Accounts :
            <?php echo $record[0]['social_media_accounts'] ?>
        </div>
        
        <div class="col-md-4 for_text">SignUp from Page :
            <?php echo $record[0]['signup_from_page'] ?>
        </div>
        <div class="col-md-4 for_text">Preferred Payment Method :
            <?php echo $record[0]['preferred_payment_method'] ?>
        </div>
        <div class="col-md-4 for_text">Total Ads
            <?php echo $count_ads[0]['COUNT(id)'] ?>
        </div>
        <div class="col-md-4 for_text">Favourite ads
            <?php echo $count_favourites[0]['COUNT(id)'] ?>
        </div>
   
        <div class="col-md-4 for_text">Pending approvals
            <?php echo $count_pending_ads[0]['COUNT(id)'] ?>
        </div>
        <div class="row"></div>
        <?php
        foreach ($package_detail as $key => $v) {
            $categories = get_records($tblcategories,"id='".$v['category_id']."' and trash!='1'");
         ?>
            <div class="col-md-4 multiple">
            <span style="font-weight: bold;"><?php echo 'For ' .$categories[0]['title_en']; ?></span></br>
            <?php echo 'Post Ads ' .$v['post_ads']; ?></br>
            <?php echo 'Bump up ' .$v['bump_up']; ?></br>
            <?php echo 'Social Media Ads ' .$v['social_media_ads']; ?></br>
            <?php echo 'Feature ads ' .$v['feature_ads']; ?>
            </div>
        <?php  } 
        ?>
