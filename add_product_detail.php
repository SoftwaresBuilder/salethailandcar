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
} else {
    redirect("add_product");
}

$category = get_records($tblcategories,"id='".$product[0]['category_id']."'");
$subcategory = get_records($tblcategories,"id='".$product[0]['subcategory_id']."'");
$user_detail = get_records($tblusers,"id = ".$product[0]['user_id']);
$p_features = get_records($tblproduct_features,'category_id = '.$product[0]['subcategory_id']);
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
                <div class="col-12 heading"><?php echo translate("More Information About your ads");?></div>
            </div>
            <div class="row">
                <div class="col-12 heading2"><?php echo translate("Step 2 of 2");?></div>
            </div>
            <div class="row">
                <div class="col-12 heading3"><?php echo $category[0]['title'];?>&nbsp;>&nbsp;<?php echo $subcategory[0]['title'];?></div>
            </div>
            <form action="process.php?p=add_product_detail" enctype="multipart/form-data" method="post">
                <?php show_errors();?>
                <div class="col-md-12">&nbsp;</div>
                <?php
                if($subcategory[0]['title']=="Cars"){
                ?>
                    <div class="row form_fields">
                        <div class="col-md-3"><?php echo translate("Brand");?></div>
                        <div class="col-md-8">
                        <div class="form-group">
                            <input type="text" required class="form-control" id="brand" name="brand" placeholder="" value="<?= $_SESSION['sysData']['brand'];?>">
                        </div>
                        </div>
                    </div>
                    <div class="row form_fields">
                        <div class="col-md-3"><?php echo translate("Year of registration");?></div>
                        <div class="col-md-8">
                        <div class="form-group">
                            <select required class="form-control" id="year_registration" name="year_registration">
                                <?php
                                for($y=date("Y");$y>="2000";$y--){
                                ?>
                                    <option value="<?= $y;?>"><?= $y;?></option>
                                <?php
                                }
                                ?>
                            </select>
                        </div>
                        </div>
                    </div>
                    <div class="row form_fields">
                        <div class="col-md-3"><?php echo translate("Kms Driven");?></div>
                        <div class="col-md-8">
                        <div class="form-group">
                            <input type="text" class="form-control" id="driven" name="driven" placeholder="" value="<?= $_SESSION['sysData']['driven'];?>">
                        </div>
                        </div>
                    </div>
                    <div class="row form_fields">
                        <div class="col-md-3"><?php echo translate("Features");?></div>
                        <div class="col-md-8">
                        <div class="form-group">
                            <?php 
                                foreach ($p_features as $key => $f) { ?>
                                    <div class="col-md-8">
                                    <input type="Checkbox" name="features[]" value="<?php echo $f['id'] ?>"> <?php echo $f['title'] ?>
                                </div>
                              <?php }
                            ?>
                        </div>
                        </div>
                    </div>
                    <div class="row form_fields">
                        <div class="col-md-3"><?php echo translate("Fuel Type");?></div>
                        <div class="col-md-8">
                        <div class="form-group">
                             <div class="col-md-8">
                                    <input type="Checkbox" name="   []" value="1"> <?php echo translate("Petrol");?>
                                     </div>
                                <div class="col-md-8">
                                     <input type="Checkbox" name="fuel_type[]" value="2"> <?php echo translate("Diesel");?>
                                      </div>
                                <div class="col-md-8">
                                    <input type="Checkbox" name="fuel_type[]" value="3"><?php echo translate("LPG");?> 
                                    </div>
                                <div class="col-md-8">
                                    <input type="Checkbox" name="fuel_type[]" value="4"><?php echo translate("CNG");?> 
                                    </div>
                                <div class="col-md-8">
                                 <input type="Checkbox" name="fuel_type[]" value="5"> <?php echo translate("Electric");?>
                                </div>
                        </div>
                        </div>
                    </div>
                <?php
                }
                ?>
                <div class="col-md-12 heading3"><?php echo translate("Seller information");?></div>
                <div class="row form_fields">
                    <div class="col-md-3"><?php echo translate("Name");?></div>
                    <div class="col-md-8">
                    <div class="form-group">
                        <input type="text" required class="form-control" id="name" name="name" placeholder="" value="<?php echo $user_detail[0]['name'];?>">
                    </div>
                    </div>
                </div>
                <div class="row form_fields">
                    <div class="col-md-3"><?php echo translate("Mobile Number");?></div>
                    <div class="col-md-8">
                    <div class="form-group">
                        <input type="text" required class="form-control" id="phone" name="phone" placeholder="" value="<?php echo $user_detail[0]['phone'];?>">
                    </div>
                    </div>
                </div>
                <div class="row form_fields">
                    <div class="col-md-3"><?php echo translate("Email");?></div>
                    <div class="col-md-8">
                    <div class="form-group">
                        <input type="text" required class="form-control" id="Email" name="email" placeholder="" value="<?php echo $user_detail[0]['email'];?>">
                    </div>
                    </div>
                </div>
                <div class="col-md-12">&nbsp;</div>
                <div class="col-md-12">
                    <input type="hidden" name="id" value="<?php echo enc_password($id);?>">
                    <input type="hidden" name="user_id" value="<?php echo enc_password($user_detail[0]['id']);?>">
                    <input type="submit" name="submit" class="btn btn-primary" value="<?php echo translate("SUBMIT MY AD NOW");?>">
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