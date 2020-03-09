<?php include'header.php';

$id = 0;
if(isset($_GET['id'])){
    $enc_id = $_GET['id'];
    $id = dec_password($enc_id);
    $product = get_records($tblproducts,"id='".$id."'");
    if(count($product)>0){
        foreach ($product as $k=>$v) {
            $_SESSION['sysData'][$k] = $v;
        }
    }
} else{
    $user = get_records($tblusers ,"id='".$user_id."'");
    if(count($user)>0 and $user[0]['post_ads']<1){
        $_SESSION['sysErr']['msg'] = "Please refill your post ads limit";
        redirect("dashboard","?tab=packages");
        exit;
    }
}
if(!isset($_SESSION['sysData']['title'])) {
    $_SESSION['sysData'] = table_fields($tblproducts);
}

$category = get_records($tblcategories,"pid='0' and status='1' and trash='0'","title ASC");
$subcategory = get_records($tblcategories,"pid='".$category[0]['id']."' and status='1' and trash='0'","title ASC");

?>
<script type="text/javascript">
    function cat_div_show(){
        $("#select_Category_div").show("slow");
    }
    function hide_div(){
        $("#select_Category_div").hide("slow");
    }
    
</script>
<style type="text/css">
    .form_fields{
        margin-bottom: 20px;
    }
 #select_Category_div{
    display: none; 
    z-index: 2;
    position: fixed;
    top: 25px;
    bottom: 10px;
    left: 20%;
    height: 85%;
    width: 60%;
    overflow: auto;
</style>

<div class="container">
    <div class="row">
        <div class="col-md-9">
        <div class="section_spacer">
            <?php show_errors();?>
            <div class="row">
                <div class="col-12 heading"><?php echo translate("Post a Free Classified Ad");?></div>
            </div>
            <form action="process.php?p=add_product" enctype="multipart/form-data" method="post">
                <?php show_errors();?>
               
                    <div class="row form_fields">
                        <div class="col-md-3"><?php echo translate("Ad Type");?></div>
                        <div class="col-md-3">
                        <div class="form-check form-check-inline">
                            <label class="form-check-label">
                                <input class="form-check-input" type="radio" name="ad_type" id="inlineRadio1" value="Private"> <span class="light-text-1"><?php echo translate("Private");?></span>
                            </label>
                        </div>
                        <div class="form-check form-check-inline">
                            <label class="form-check-label">
                                <input class="form-check-input" type="radio" name="ad_type" id="inlineRadio2" value="Business"> <span class="light-text-1"><?php echo translate("Business");?></span>
                            </label>
                        </div>
                        </div>
                    </div>
                    <div class="row form_fields">
                        <div class="col-md-3"><?php echo translate("Ad Tittle");?></div>
                        <div class="col-md-8">
                        <div class="form-group">
                           
                            <input type="text" required class="form-control" id="title" name="title" placeholder="" value="<?= $_SESSION['sysData']['title'];?>">
                        </div>
                        </div>
                    </div>
                     <div class="row form_fields">
                        <div class="col-md-3"><?php echo translate("Ad Description");?> </div>
                        <div class="col-md-8">
                        <div class="form-group">
                            
                            <textarea oninput="myFunction()" onfocusout="translate_into_thai($('#description_en').val())" class="form-control" rows="3" id="description_en" name="description_en" placeholder=""><?= $_SESSION['sysData']['description_en'];?></textarea>
                        </div>
                        </div>
                    </div>
                    <div class="row form_fields">
                        <div class="col-md-3"><?php echo translate("Ad Description in thai");?> </div>
                        <div class="col-md-8">
                        <div class="form-group">
                            
                            <textarea class="form-control" rows="3" id="description_th" name="description_th" placeholder=""><?= $_SESSION['sysData']['description_th'];?></textarea>
                        </div>
                        </div>
                    </div>
                    <div class="row form_fields">
                        <div class="col-md-3"><?php echo translate("Category");?></div>
                        <div class="col-md-8">
                        <select required class="form-control" id="category_id" name="category_id" onchange="update_subcategories(this.value);">
                            <option value=""><?php echo translate("Select Category");?></option>
                            <?php
                            if(count($category)>0){
                                foreach ($category as $v) {
                                ?>
                                    <option value="<?php echo $v['id'];?>"><?php echo $v['title'];?></option>
                                <?php
                                }
                            }
                            ?>
                        </select>
                        </div>
                    </div>
                    <div class="row form_fields">
                        <div class="col-md-3"><?php echo translate("Sub Category");?></div>
                        <div class="col-md-8">
                        <select required class="form-control" id="subcategory_id" name="subcategory_id" onchange="update_ad_type(this.value);">
                            <option value=""><?php echo translate("Select Sub Category");?></option>
                            <?php
                            if(count($subcategory)>0){
                                foreach ($subcategory as $v) {
                                ?>
                                    <option value="<?php echo $v['id'];?>"><?php echo $v['title'];?></option>
                                <?php
                                }
                            }
                            ?>
                        </select>
                        </div>
                    </div>
                    <div class="row form_fields">
                        <div class="col-md-3"><?php echo translate("For");?> </div>
                        <div class="col-md-8">
                            <select required class="form-control" id="type" name="type">
                                <option value=""><?php echo translate("Select Type");?></option>
                               
                            </select>
                        </div>
                    </div>
                    <div class="row form_fields" id="submodel_div" style="display: none;">
                        <div class="col-md-3"><?php echo translate("SubModel");?></div>
                        <div class="col-md-8">
                            <select class="form-control" id="submodel" name="submodel">s
                                <option value=""><?php echo translate("Select SubModel");?></option>
                            </select>
                        </div>
                    </div>
                    <div class="row form_fields" id="model_div" style="display: none;">
                        <div class="col-md-3"><?php echo translate("Model");?></div>
                        <div class="col-md-8">
                            <select class="form-control" id="model" name="model">
                                <option value=""><?php echo translate("Select Model");?></option>
                            </select>
                        </div>
                    </div>
                    <div class="row form_fields">
                        <div class="col-md-3"><?php echo translate("Price");?></div>
                        <div class="col-md-8">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="basic-adon1"><?php echo $cons_currency;?></span>
                                <input type="text" required class="form-control" id="price" name="price" placeholder="<?php echo translate("Price");?>" value="">
                            </div>
                        </div>
                    </div>
                    <div class="row form_fields">
                        <div class="col-md-3"><?php echo translate("Picture");?></div>
                        <div class="col-md-8">
                            <div style="background-color:#dcdee6;height: 300px; width: 100%;">
                            <img id="blah" onclick="" alt="" width="100%" height="300px" /></div>
                            <input type="file" name="img"  onchange="document.getElementById('blah').src = window.URL.createObjectURL(this.files[0])">
                        </div>
                    </div>
                    <div class="row form_fields">
                        <div class="col-md-3"><?php echo translate("Address");?></div>
                        <div class="col-md-8">
                             <input type="text" required class="form-control" id="location" name="location" placeholder="<?php echo translate("Enter Location");?>" value="<?= $_SESSION['sysData']['location'];?>">
                        </div>
                    </div>
                    <div class="col-md-12"><?php include("gmap.php");?></div>
                    <div class="col-md-12">&nbsp;</div>
                    <div class="col-md-12">
                        <input type="submit" name="submit" class="btn btn-primary" value="<?php echo translate("Save And Next");?>">
                    </div>
            </form>
        </div>
    </div>
    <div class="col-md-3" style="margin-top: 30px;">
          
          <div class="col-12 heading"><?php echo translate("Post a free Classified Ad");?>  </div>
          
                <p class="light-text-0">
                    <?php echo translate(" Post your free online classified ads with us. Lorem ipsum dolor sit amet, consectetur
                            adipiscing elit.");?>
                               </p>
                

                <div class="card bg-transparent mt-3">
                    <div class="card-body">
                        <h5 class="card-title light-text-1 mt-3">
                            <?php echo translate("How to sell quickly?");?>
                        </h5>
                        <ul class="list-unstyled">
                            <li class="text-secondary list-item"> <i class="fa fa-check"></i><?php echo translate("Use a brief title and description of the item ");?> </li>
                            <li class="text-secondary list-item"> <i class="fa fa-check"></i><?php echo translate("Make sure you post in the correct category");?>  </li>
                            <li class="text-secondary list-item"> <i class="fa fa-check"></i><?php echo translate("Add nice photos to your ad");?>  </li>
                            <li class="text-secondary list-item"> <i class="fa fa-check"></i><?php echo translate("Put a reasonable price");?>  </li>
                            <li class="text-secondary list-item"> <i class="fa fa-check"></i><?php echo translate("Check the item before publish");?>  </li>

                        </ul>
                        <a href="" class="btn btn-primary" style="margin-top: 10px"><?php echo translate("View Details");?></a>
                    
                </div>
            </div>
    </div>
</div> 
   
</div>

<?php include'footer.php';?>