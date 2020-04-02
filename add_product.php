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
 } //else{
//     $user = get_records($tblusers ,"id='".$user_id."'");
//     if(count($user)>0 and $user[0]['post_ads']<1){
//         $_SESSION['sysErr']['msg'] = "Please refill your post ads limit";
//         redirect("dashboard","?tab=packages");
//         exit;
//     }
// }

if(!isset($_SESSION['sysData']['title_'.$lang])) {
    $_SESSION['sysData'] = table_fields($tblproducts);
}
//pr($_SESSION['sysData']); exit;
$category = get_records($tblcategories,"pid='0' and status='1' and trash='0'","title_".$lang." ASC");
$subcategory = get_records($tblcategories,"pid='".$category[0]['id']."' and status='1' and trash='0'","title_".$lang." ASC");

?>
<script type="text/javascript">
    function cat_div_show(){
        $("#select_Category_div").show("slow");
    }
    function hide_div(){
        $("#select_Category_div").hide("slow");
    }
    
        window.onload = function () {
            var fileUpload = document.getElementById("fileupload");
            fileUpload.onchange = function () {
                if (typeof (FileReader) != "undefined") {
                    var dvPreview = document.getElementById("dvPreview");
                    dvPreview.innerHTML = "";
                    var img_id = 1;
                    var regex = /^([a-zA-Z0-9\s_\\.\-:])+(.jpg|.jpeg|.gif|.png|.bmp)$/;
                    for (var i = 0; i < fileUpload.files.length; i++) {
                        var file = fileUpload.files[i];
                        if (regex.test(file.name.toLowerCase())) {
                            var reader = new FileReader();
                            reader.onload = function (e) {
                                var img = document.createElement("IMG");
                                img.id = "img"+img_id;
                                img.style="margin:20px";
                                if(fileUpload.files.length<=1){
                                 img.height = 250/fileUpload.files.length;
                                }
                                else
                                {
                                    img.height = 250/fileUpload.files.length*2;
                                }
                                img.width = 400/fileUpload.files.length;
                                img.src = e.target.result;
                                dvPreview.prepend(img);
                                img_id++;
                            }
                            reader.readAsDataURL(file);
                        } else {
                            alert(file.name + " is not a valid image file.");
                            dvPreview.innerHTML = "";
                            return false;
                        }
                    }
                } else {
                    alert("This browser does not support HTML5 FileReader.");
                }
            }
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
    overflow: auto;}
    .drop-area-text {
         margin-top: 25%;
    text-align: center;
    vertical-align: center;
    font-size: 1.5em;
    padding-bottom: 20px;
}
.preview{
    background-color:#dcdee6;height: 300px; width: 100%;
    border: 1px dashed black; 
}
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
                           
                            <input type="text" required class="form-control" id="title" name="title" placeholder="" value="<?= $_SESSION['sysData']['title_'.$lang];?>">
                        </div>
                        </div>
                    </div>
                     <!-- <div class="row form_fields">
                        <div class="col-md-3"><?php echo translate("Ad Tittle in thai");?></div>
                        <div class="col-md-8">
                        <div class="form-group">
                           
                            <input type="text" required class="form-control" id="title_th" name="title
                            -th" placeholder="" value="<?= $_SESSION['sysData']['title_'.$lang];?>">
                        </div>
                        </div>
                    </div> -->
                     <div class="row form_fields">
                        <div class="col-md-3"><?php echo translate("Ad Description");?> </div>
                        <div class="col-md-8">
                        <div class="form-group">
                            
                            <textarea required="" class="form-control" rows="3" id="description" name="description" placeholder=""><?= $_SESSION['sysData']['description_'.$lang];?></textarea>
                        </div>
                        </div>
                    </div>
                   <!--  <div class="row form_fields">
                        <div class="col-md-3"><?php echo translate("Ad Description in thai");?> </div>
                        <div class="col-md-8">
                        <div class="form-group">
                            
                            <textarea class="form-control" rows="3" id="description_th" name="description_th" placeholder=""><?= $_SESSION['sysData']['description_th'];?></textarea>
                        </div>
                        </div>
                    </div> -->
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
                                    <option value="<?php echo $v['id'];?>"><?php echo $v['title_'.$lang];?></option>
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
                                    <option value="<?php echo $v['id'];?>"><?php echo $v['title_'.$lang];?></option>
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
                                <span class="input-group-text" id="basic-adon1"><?php echo $cons_thai;?></span>
                                <input type="text" required class="form-control" id="price" name="price" placeholder="<?php echo translate("Price");?>" value="">
                            </div>
                        </div>
                    </div>
                    <div class="row form_fields">
                        <div class="col-md-3"><?php echo translate("Picture");?></div>
                        <div class="col-md-8">
                            <div id="dvPreview" class="preview" onclick="$('#dvPreview').click(function(){ $('#fileupload').trigger('click'); });">
                               <p class="drop-area-text"> Click Here to add Images </p>
                            </div>
                             <input id="fileupload" name="img[]" type="file" multiple="multiple" />
                    </div>
                </div>
                <div class="row form_fields">
                        <div class="col-md-3"><?php echo translate("Tags");?></div>
                        <div class="col-md-8">
                             <input type="text" required class="form-control" id="tags" name="tags" placeholder="<?php echo translate("Tags");?>" value="<?= $_SESSION['sysData']['tags_'.$lang];?>">
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