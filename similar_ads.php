
<div class="col-12 mt40 border_bottom"><p class="heading"><?php echo translate("Similar Ads");?></p>
        <div class="row section_spacer">
          <div class="col-12 col-md-12">
            <div class="row">
                <?php
                $similar_products = get_records($tblproducts,"category_id='".$product[0]['category_id']."' and status>0 and trash='0'","","4");
                if(count($similar_products)>0){
                foreach ($similar_products as $product) {
                    $category = get_records($tblcategories,"id='".$product['category_id']."' and status='1' and trash='0'");
                    $card_name =$category[0]['card_name'].'.php';
                    
                    ?>
                    <div class="col-12 col-md-4"><?php include($card_name);?></div>
                  <?php
                  }
                }else {
                ?>
                  <div class="col-12"><div class="err err_div"><?php echo translate("No record found");?></div></div>
                <?php
                }
                ?>
            </div>
          </div>
        </div>
</div>