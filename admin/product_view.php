<?php
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
<style type="text/css">
    .product_view{
        font-size: 20px;
        margin-top: : 25px;
        font-family: serif;
    }
</style>

<div class="row" id ="content">
    <div class="col-md-12">
        <div class="card">
            <div class="header">
                <h4 class="title"><?php echo $product[0]['title_en'];?></h4>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="img_thumb_view">
                        <img src="<?php echo $img;?>">
                   </div>
                </div>
                <div class="col-md-6">
                    <div class="row product_view">
                        Product Name : <?php echo $product[0]['title_en']; ?><br>
                        Product Description :<?php echo $product[0]['description_en']; ?><br>
                        Category : <?php echo $p_cat[0]['title_en']; ?><br>
                        SubCategory :<?php echo $p_sub_cat[0]['title_en']; ?><br>
                        Price :<?php echo $product[0]['price']; ?><br>
                        Location :<?php echo $product[0]['location']; ?><br>
                        <?php if(isset($type)){?> Product Type : <?php echo $type[0]['title_en']; ?><br> <?php } ?>
                        <?php
                            if($product[0]['subcategory_id']==18){
                         if(isset($models)){?> Product Model : <?php echo $models[0]['title_en']; ?><br> <?php } ?>
                        <?php if(isset($submodel)){?> Product Submodel : <?php echo $submodel[0]['title_en']; ?><br>
                        <?php
                         }
                         $features_ids = explode('::', $product[0]['features']);
                         $n = 1;
                         echo 'Product features : <br>';
                         foreach ($p_features as $key => $f) { 
                                    if(in_array($f['id'], $features_ids)){
                                     echo '&nbsp;&nbsp;&nbsp;&nbsp;' .$n.' ' .$f['title_en'].'<br>';
                                     $n++;
                              }
                             } 
                            $fuel_ids = explode('::', $product[0]['fuel_type']);
                            $n = 1;
                             echo 'Product fuel type : <br>';
                          foreach ($fuel_ids as $key => $f) { 
                                   
                                     echo '&nbsp;&nbsp;&nbsp;&nbsp;' .$n.' ' .$f.'<br>';
                                     $n++;
                             } ?>
                             Brand :<?php echo $product[0]['brand']; ?><br>
                             Driven :<?php echo $product[0]['driven']; ?><br>
                             Registration Year :<?php echo $product[0]['year_registration']; ?><br>
                          <?php   } 
                           if($product[0]['category_id']==24){
                        ?>
                             Bathrooms :<?php echo $product[0]['bathrooms']; ?><br>
                             Bedrooms :<?php echo $product[0]['bedrooms']; ?><br>
                             Kitchens :<?php echo $product[0]['kitchens']; ?><br>
                          <?php   } 

                          $html ='<html>Hello World!<br><br>HTML Test using phpToPDF</html>';
                    ?>
                     </div>
                 </div>
            </div>
            <?php show_errors();?>
            <div class="row">
                <div class="col-12 col-md-3">
                    <div id="editor"></div>
                    <a href="javascript:;" onclick="htmltopdf('<?php echo $html; ?>');">Save to PDF</a>
                    <button id="cmd">Download PDF</button>
                <div class="clearfix"></div>
                </div>
        </div>
    </div>
</div>
</div>
<?php
//echo $html = show_source("product_view.php");
?>
<script>
    function htmltopdf(str){
    
       var html = str;
         $.ajax({
            type: "GET",
            url: "ajax.php",
             dataType: 'html',  
            data: {html:html,p:'convert_to_pdf'},
            success: function(data){
             
               
             } 
        });
    }
</script> 
   