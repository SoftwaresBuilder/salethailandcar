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
}

if(!isset($_SESSION['sysData']['title_'.$lang])) {
    $_SESSION['sysData'] = table_fields($tblproducts);
}
$fiels_for_relestate = get_records($tblcategories,"id='".$product[0]['category_id']."'");
$category = get_records($tblcategories,"pid='0' and status='1' and trash='0'","title_".$lang." ASC");
$fields_for_car = get_records($tblcategories,"id='".$product[0]['subcategory_id']."'");
$subcategory = get_records($tblcategories,"pid='".$product[0]['category_id']."' and status='1' and trash='0'","title_".$lang." ASC");
$type = get_records($tblcategory_types,"category_id='".$product[0]['subcategory_id']."' and trash='0'");
$models = get_records($tblcategory_models,"category_id='".$product[0]['subcategory_id']."' and trash='0'");
$submodel = get_records($tblcategory_submodels,"type_id='".$type[0]['id']."' and trash='0'");
//$user_detail = get_records($tblusers,"id = ".$product[0]['user_id']);
$p_features = get_records($tblcategory_features,'category_id = '.$product[0]['subcategory_id']);
?>
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
                <div class="col-12 heading"><?php echo translate("lang_text3");?></div>
            </div>
            <form action="process.php?p=add_product" enctype="multipart/form-data" method="post">
                <?php show_errors();?>
               
                    <div class="row form_fields">
                        <div class="col-md-3"><?php echo translate("Ad Type");?></div>
                        <div class="col-md-3">
                        <div class="form-check form-check-inline">
                            <label class="form-check-label">
                                <input class="form-check-input" type="radio" name="ad_type" id="inlineRadio1" value="Private" <?php if($product[0]['ad_type']==0){?> checked="checked" <?php }?> > <span class="light-text-1"><?php echo translate("Private");?></span>
                            </label>
                        </div>
                        <div class="form-check form-check-inline">
                            <label class="form-check-label">
                                <input class="form-check-input" type="radio" name="ad_type" id="inlineRadio2" value="Business" <?php if($product[0]['ad_type']==1){?> checked="checked" <?php }?>> <span class="light-text-1"><?php echo translate("Business");?></span>
                            </label>
                        </div>
                        </div>
                    </div>
                    <div class="row form_fields">
                        <div class="col-md-3"><?php echo translate("Ad Tittle");?></div>
                        <div class="col-md-8">
                        <div class="form-group">
                           
                            <input type="text" required class="form-control" id="title" name="title" placeholder="" value="<?= $product[0]['title_'.$lang];?>">
                        </div>
                        </div>
                    </div>
                     <div class="row form_fields">
                        <div class="col-md-3"><?php echo translate("Ad Description");?> </div>
                        <div class="col-md-8">
                        <div class="form-group">
                            
                            <textarea required="" class="form-control" rows="3" id="description" name="description" placeholder=""><?= $product[0]['description_'.$lang];?></textarea>
                        </div>
                        </div>
                    </div>
                    <div class="row form_fields">
                        <div class="col-md-3"><?php echo translate("Category");?></div>
                        <div class="col-md-8">
                        <select required class="form-control" id="category_id" name="category_id"
                         onchange="update_subcategories(this.value);">
                            <option value=""><?php echo translate("Select Category");?></option>
                            <?php
                            if(count($category)>0){
                                foreach ($category as $v) {
                                ?>
                                    <option <?php if($product[0]['category_id']==$v['id']){?> selected <?php }?> value="<?php echo $v['id'];?>"><?php echo $v['title_'.$lang];?></option>
                                <?php
                                }
                            }
                            ?>
                        </select>
                        </div>
                    </div>
                    <div class="row form_fields" >
                        <div class="col-md-3"><?php echo translate("Sub Category");?></div>
                        <div class="col-md-8">
                        <select required class="form-control" id="subcategory_id" name="subcategory_id" onchange="update_ad_type(this.value);">
                            <option value=""><?php echo translate("Select Sub Category");?></option>
                            <?php
                            if(count($subcategory)>0){
                                foreach ($subcategory as $v) {
                                ?>
                                    <option <?php if($product[0]['subcategory_id']==$v['id']){?> selected <?php }?> value="<?php echo $v['id'];?>"><?php echo $v['title_'.$lang];?></option>
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
                            <select required class="form-control" id="type" name="type" onchange="update_submodels(this.value);">
                                <option value=""><?php echo translate("Select Type");?></option>
                                 <?php
                            if(count($type)>0){
                                foreach ($type as $v) {
                                ?>
                                    <option <?php if($product[0]['type']==$v['title_'.$lang]){?> selected="selected" <?php }?> value="<?php echo $v['title_'.$lang];?>"><?php echo $v['title_'.$lang];?></option>
                                <?php
                                }
                            }
                            ?>
                            </select>
                        </div>
                    </div>
                    <div class="row form_fields" id="submodel_div" <?php if(count($submodel)>0){} else { ?> style="display: none;" <?php } ?> >
                        <div class="col-md-3"><?php echo translate("SubModel");?></div>
                        <div class="col-md-8">
                            <select class="form-control" id="submodel" name="submodel">s
                                <option value=""><?php echo translate("Select SubModel");?></option>
                                 <?php
                            if(count($submodel)>0){
                                foreach ($submodel as $v) {
                                ?>
                                    <option <?php if($product[0]['submodel']==$v['title_'.$lang]){?> selected="selected" <?php }?> value="<?php echo $v['title_'.$lang];?>"><?php echo $v['title_'.$lang];?></option>
                                <?php
                                }
                            }

                            ?>
                            </select>
                        </div>
                    </div>
                    <div class="row form_fields" id="model_div" <?php if(count($submodel)>0){} else { ?> style="display: none;" <?php } ?>>
                        <div class="col-md-3"><?php echo translate("Model");?></div>
                        <div class="col-md-8">
                            <select class="form-control" id="model" name="model">
                                <option value=""><?php echo translate("Select Model");?></option>
                                <?php
                            if(count($models)>0){
                                foreach ($models as $v) {
                                ?>
                                    <option <?php if($product[0]['model']==$v['title_'.$lang]){?> selected="selected" <?php }?> value="<?php echo $v['title_'.$lang];?>"><?php echo $v['title_'.$lang];?></option>
                                <?php
                                }
                            }
                            ?>
                            </select>
                        </div>
                    </div>
                    <div class="row form_fields">
                        <div class="col-md-3"><?php echo translate("Price");?></div>
                        <div class="col-md-8">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="basic-adon1"><?php echo $cons_thai;?></span>
                                <input type="text" required class="form-control" id="price" name="price" placeholder="<?php echo translate("Price");?>" value="<?= $product[0]['price'];?>">
                            </div>
                        </div>
                    </div>
                <div class="row form_fields">
                        <div class="col-md-3"><?php echo translate("Tags");?></div>
                        <div class="col-md-8">
                             <input type="text" required class="form-control" id="tags" name="tags" placeholder="<?php echo translate("Tags");?>" value="<?= $product[0]['tags_'.$lang];?>">
                        </div>
                    </div>
                    
                    <?php
                if($fields_for_car[0]['title_en']=="Cars"){
                ?>
                    <div class="row form_fields">
                        <div class="col-md-3"><?php echo translate("Brand");?></div>
                        <div class="col-md-8">
                        <div class="form-group">
                            <input type="text" required class="form-control" id="brand" name="brand" placeholder="" value="<?= $product[0]['brand'];?>">
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
                                    <option <?php if($product[0]['year_registration']==$y){?> selected="selected" <?php }?> value="<?= $y;?>"><?= $y;?></option>
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
                            <input type="text" class="form-control" id="driven" name="driven" placeholder="" value="<?= $product[0]['driven'];?>">
                        </div>
                        </div>
                    </div>
                    <div class="row form_fields">
                        <div class="col-md-3"><?php echo translate("Features");?></div>
                        <div class="col-md-8">
                        <div class="form-group">
                            <?php 
                            $features_ids = explode('::', $product[0]['features']);
                                foreach ($p_features as $key => $f) { ?>
                                    <div class="col-md-8">
                                    <input <?php if(in_array($f['id'], $features_ids)){?> checked="checked" <?php } ?> type="Checkbox" name="features[]" value="<?php echo $f['id'] ?>"> <?php echo $f['title_'.$lang] ?>
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
                            <?php $fuel_type_ids = explode('::', $product[0]['fuel_type']);
                             ?>
                             <div class="col-md-8">
                                    <input <?php if(in_array("Petrol", $fuel_type_ids)){?> checked="checked" <?php } ?> type="Checkbox" name="  fuel_type[]" value="Petrol"> <?php echo translate("Petrol");?>
                                     </div>
                                <div class="col-md-8">
                                     <input <?php if(in_array("Diesel", $fuel_type_ids)){?> checked="checked" <?php } ?> type="Checkbox" name="fuel_type[]" value="Diesel"> <?php echo translate("Diesel");?>
                                      </div>
                                <div class="col-md-8">
                                    <input <?php if(in_array("LPG", $fuel_type_ids)){?> checked="checked" <?php } ?> type="Checkbox" name="fuel_type[]" value="LPG"><?php echo translate("LPG");?> 
                                    </div>
                                <div class="col-md-8">
                                    <input <?php if(in_array("CNG", $fuel_type_ids)){?> checked="checked" <?php } ?> type="Checkbox" name="fuel_type[]" value="CNG"><?php echo translate("CNG");?> 
                                    </div>
                                <div class="col-md-8">
                                 <input <?php if(in_array("Electric", $fuel_type_ids)){?> checked="checked" <?php } ?> type="Checkbox" name="fuel_type[]" value="Electric"> <?php echo translate("Electric");?>
                                </div>
                        </div>
                        </div>
                    </div>
                <?php
                }
                if($fiels_for_relestate[0]['title_en']=="Real Estate"){
                ?>
                 <div class="row form_fields">
                        <div class="col-md-3"><?php echo translate("Number of BedRooms");?></div>
                        <div class="col-md-8">
                        <select class="form-control" id="bedrooms" name="bedrooms">
                            <option value=""><?php echo translate("Select Bedrooms");?></option>
                            <?php
                                for($i=0;$i<11;$i++){
                                ?>
                                    <option <?php if($product[0]['bedrooms']==$i){?> selected="selected" <?php }?> value="<?php echo $i;?>"><?php echo $i;?></option>
                                <?php
                            }?>
                        </select>
                        </div>
                    </div>
                    <div class="row form_fields">
                        <div class="col-md-3"><?php echo translate("Number of BathRooms");?></div>
                        <div class="col-md-8">
                        <select class="form-control" id="bathrooms" name="bathrooms">
                            <option value=""><?php echo translate("Select Bathrooms");?></option>
                            <?php
                                for($i=0;$i<11;$i++){
                                ?>
                                    <option <?php if($product[0]['bathrooms']==$i){?> selected="selected" <?php }?> value="<?php echo $i;?>"><?php echo $i;?></option>
                                <?php
                            }?>
                        </select>
                        </div>
                    </div>
                    <div class="row form_fields">
                        <div class="col-md-3"><?php echo translate("Number of Kitchens");?></div>
                        <div class="col-md-8">
                        <select class="form-control" id="kitchens" name="kitchens">
                            <option value=""><?php echo translate("Select Kitchens");?></option>
                            <?php
                                for($i=0;$i<11;$i++){
                                ?>
                                    <option <?php if($product[0]['kitchens']==$i){?> selected="selected" <?php }?> value="<?php echo $i;?>"><?php echo $i;?></option>
                                <?php
                            }?>
                        </select>
                        </div>
                    </div>
                <?php
                }
                ?>
                <div class="row form_fields">
                        <div class="col-md-3"><?php echo translate("Address");?></div>
                        <div class="col-md-8">
                             <input type="text" required class="form-control" id="location" name="location" placeholder="<?php echo translate("Enter Location");?>" value="<?= $product[0]['location'];?>">
                        </div>
                    </div>
                    <div class="col-md-12"><?php include("gmap.php");?></div>
                    <div class="col-md-12">&nbsp;</div>
                    <div class="col-md-12">
                        <input type="submit" name="submit" class="btn btn-primary" value="<?php echo translate("Save");?>">
                    </div>
                    <input type="hidden" name="id" id="id" value="<?php echo $id; ?>">
            </form>
        </div>
    </div>
    <div class="col-md-3" style="margin-top: 30px;">
          
          <div class="col-12 heading"><?php echo translate("lang_text3");?>  </div>
          
                <p class="light-text-0">
                    <?php echo translate("lang_text4");?>
                               </p>
                

                <div class="card bg-transparent mt-3">
                    <div class="card-body">
                        <h5 class="card-title light-text-1 mt-3">
                            <?php echo translate("lang_text5");?>
                        </h5>
                        <ul class="list-unstyled">
                            <li class="text-secondary list-item"> <i class="fa fa-check"></i><?php echo translate("lang_text6");?> </li>
                            <li class="text-secondary list-item"> <i class="fa fa-check"></i><?php echo translate("lang_text7");?>  </li>
                            <li class="text-secondary list-item"> <i class="fa fa-check"></i><?php echo translate("lang_text8");?>  </li>
                            <li class="text-secondary list-item"> <i class="fa fa-check"></i><?php echo translate("lang_text9");?>  </li>
                            <li class="text-secondary list-item"> <i class="fa fa-check"></i><?php echo translate("lang_text10");?>  </li>

                        </ul>
                        <a href="#" class="btn btn-primary" style="margin-top: 10px"><?php echo translate("View Details");?></a>
                    
                </div>
            </div>
    </div>
</div> 
   
</div>

<?php include'footer.php';?>