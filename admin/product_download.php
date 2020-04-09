<?php
include("../config/config.php");

if(isset($_GET['id'])){
    $enc_id = $_GET['id'];
    $id = dec_password($_GET['id']);
    $product = get_records($tblproducts,"id='".$id."'");
    $product_images = get_records($tblproduct_images,"product_id='".$id."' and main ='1' and trash='0'");
    $p_cat = get_records($tblcategories,"id='".$product[0]['category_id']."'");
    $p_sub_cat = get_records($tblcategories,"id='".$product[0]['subcategory_id']."'");
    $type = get_records($tblcategory_types,"category_id='".$product[0]['subcategory_id']."' and trash='0'");
    $models = get_records($tblcategory_models,"category_id='".$product[0]['subcategory_id']."' and trash='0'");
    $submodel = get_records($tblcategory_submodels,"type_id='".$type[0]['id']."' and trash='0'");
    $p_features = get_records($tblcategory_features,'category_id = '.$product[0]['subcategory_id']);
    $img = get_upload_img($product_images[0]['img']);
} else {
    redirect("products"); exit;
}
?>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src= 
"https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"> 
    </script> 
<script src="https://files.codepedia.info/files/uploads/iScripts/html2canvas.js"></script>

<div class="container">
    <div class="section_spacer">
        

    
    <div class="row">
        <div class="col-md-6">
            <div class="row">
                <div class="col-md-12"><h3>Product Detail:</h3></div>
                <div class="col-md-12" id="html-content-holder">
                    <img src="<?php echo $img;?>" class="img-fluid"><br>
                    Product Name : <?php echo $product[0]['title_en']; ?><br>
                    Product Description :<?php echo $product[0]['description_en']; ?><br>
                    Category : <?php echo $p_cat[0]['title_en']; ?><br>
                    SubCategory :<?php echo $p_sub_cat[0]['title_en']; ?><br>
                    Price :<?php echo $product[0]['price']; ?><br>
                    Location :<?php echo $product[0]['location']; ?><br>
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="row">
                <div class="col-md-12"><h3>Preview:</h3></div>
                <div class="col-md-12" id="previewImage">

                </div>
            </div>
        </div>

        <div class="col-12">
            <center>
                <input id="btn-Preview-Image" type="button" value="Preview" />
                <a id="btn-Convert-Html2Image" href="#">Download</a>
            </center>
        </div>
    </div> 
    
    <script> 
        $(document).ready(function() { 
        
            // Global variable 
            var element = $("#html-content-holder"); 
        
            // Global variable 
            var getCanvas; 

            $("#btn-Preview-Image").on('click', function() { 
                html2canvas(element, { 
                    onrendered: function(canvas) { 
                        $("#previewImage").append(canvas); 
                        getCanvas = canvas; 
                    } 
                }); 
            }); 

            $("#btn-Convert-Html2Image").on('click', function() { 
                var imgageData = 
                    getCanvas.toDataURL("image/png"); 
            
                // Now browser starts downloading 
                // it instead of just showing it 
                var newData = imgageData.replace( 
                /^data:image\/png/, "data:application/octet-stream"); 
            
                $("#btn-Convert-Html2Image").attr( 
                "download", "GeeksForGeeks.png").attr( 
                "href", newData); 
            }); 
        }); 
    </script> 
    

    </div>
</div>
