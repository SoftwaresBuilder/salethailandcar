<?php include'header.php';

$id = 0;
if(isset($_GET['id'])){
    $enc_id = $_GET['id'];
    $id = enc_password($enc_id);
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

<div class="container">
    <div class="section_spacer">
        <?php show_errors();?>
        <div class="row">
            <div class="col-12 heading">Save Product</div>
        </div>
        <form action="process.php?p=add_product" enctype="multipart/form-data" method="post">
            <?php show_errors();?>
            <div class="row">
                <div class="col-md-6 col-lg-4">
                    <div class="form-group">
                        <label>Category <span class="err">*</span></label>
                         <select required class="form-control" id="category_id" name="category_id" onchange="updat_subcategories(this.value);">
                            <option value="">Select Category</option>
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
                <div class="col-md-6 col-lg-4">
                    <div class="form-group">
                        <label>SubCategory <span class="err">*</span></label>
                        <select required class="form-control" id="subcategory_id" name="subcategory_id">
                            <option value="">Select SubCategory</option>
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
                <div class="col-md-6 col-lg-4">
                    <div class="form-group">
                        <label>Product Name</label>
                        <input type="text" required class="form-control" id="title" name="title" placeholder="Enter product name" value="<?= $_SESSION['sysData']['title'];?>">
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="form-group">
                        <label>Price</label>
                        <input type="number" min="0" required class="form-control" id="price" name="price" placeholder="Price" value="<?= $_SESSION['sysData']['price'];?>">
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="form-group">
                        <label>Location</label>
                        <input type="text" class="form-control" id="location" name="location" placeholder="Location" value="<?= $_SESSION['sysData']['location'];?>">
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="form-group">
                        <label>Type</label>
                        <input type="text" class="form-control" id="type" name="type" placeholder="Type" value="<?= $_SESSION['sysData']['type'];?>">
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="form-group">
                        <label>Model</label>
                        <input type="text" class="form-control" id="model" name="model" placeholder="Model" value="<?= $_SESSION['sysData']['model'];?>">
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="form-group">
                        <label>Brand</label>
                        <input type="text" class="form-control" id="brand" name="brand" placeholder="Brand" value="<?= $_SESSION['sysData']['brand'];?>">
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="form-group">
                        <label>Registration Year</label>
                        <input type="text" class="form-control" id="year_registration" name="year_registration" placeholder="year_registration" value="<?= $_SESSION['sysData']['year_registration'];?>">
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="form-group">
                        <label>Driven (Km)</label>
                        <input type="number" class="form-control" id="driven" name="driven" min="0" value="<?= $_SESSION['sysData']['driven'];?>">
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="form-group">
                        <label>Fuel Type</label>
                        <input type="text" class="form-control" id="fuel_type" name="fuel_type" placeholder="Fuel Type" value="<?= $_SESSION['sysData']['fuel_type'];?>">
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="form-group">
                        <label>Gear Box</label>
                        <input type="text" class="form-control" id="gearbox" name="gearbox" placeholder="Gear Box" value="<?= $_SESSION['sysData']['gearbox'];?>">
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="form-group">
                        <label>Features</label>
                        <input type="text" class="form-control" id="features" name="features" placeholder="Features" value="<?= $_SESSION['sysData']['features'];?>">
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="form-group">
                        <label>Description</label>
                        <textarea class="form-control" rows="3" id="description" name="description" placeholder="Description"><?= $_SESSION['sysData']['description'];?></textarea>
                    </div>
                </div>
                <div class="col-12">
                    <div class="row">
                      <div class="col-12" id="uploaded_images">
                          <label>Product Images</label>
                          <a href="javascript:;" class="pull-right" onclick="add_image();">Add Another Image</a>
                          <?php
                          if(isset($_SESSION['sysData']['id'])){
                            echo '<div class="row">';
                            $product_images = get_records($tblproduct_images,"product_id='".$_SESSION['sysData']['id']."' AND trash='0'");
                            if(count($product_images)>0){
                              foreach ($product_images as $v) {
                                $product_img = get_upload_img($v['img']);
                              ?>
                                <div class="col-12 col-md-3">
                                  <img src="<?php echo $product_img;?>" class="img-fluid"><br>
                                  <a href="process.php?p=delproduct_img&id=<?php echo enc_password($v['id']);?>" title="Delete Image"><i class="fa fa-trash"></i></a>
                                </div>
                              <?php
                              }
                            }
                            echo '</div>';
                          }
                          ?>
                      </div>
                      <div class="col-12 mb20">
                          <div class="row" id="upload_images">
                            <div class="col-12 col-md-3"><input type="file" name="img[]"></div>
                          </div>
                      </div>
                      <script type="text/javascript">
                        function add_image(){
                          var html = '<div class="col-12 col-md-3"><input type="file" name="img[]"></div>';
                          $("#upload_images").append(html)
                        }
                      </script>
                    </div>
                </div>
                <div class="col-md-12"><?php include("gmap.php");?></div>

                <div class="col-md-12">
                    <input type="hidden" name="id" value="<?php echo dec_password($id);?>">
                    <button type="submit" class="btn btn-primary" name="Submit">Save Product</button>
                </div>
            </div>
          <div class="clearfix"></div>
        </form>
    </div> 
</div>

<?php include'footer.php';?>