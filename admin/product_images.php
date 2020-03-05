<?php
if(isset($_GET['id'])){
    $enc_id = $_GET['id'];
    $id = dec_password($_GET['id']);
    $product = get_records($tblproducts,"id='".$id."'");
    $product_images = get_records($tblproduct_images,"product_id='".$id."' and trash='0'");
} else {
    redirect("products"); exit;
}
?>
<form action="process.php?p=upload_product_images" enctype="multipart/form-data" method="post">
<div class="row">
    <div class="col-md-12">
        <div class="card">
            
                <div class="header">
                    <h4 class="title"><?php echo $product[0]['title'];?> Images</h4>
                </div>
                <?php show_errors();?>
                <div class="row">
                    <?php
                    if(count($product_images)>0){
                        foreach ($product_images as $v) {
                            $img = get_upload_img($v['img']);
                        ?>
                            <div class="col-12 col-md-3">
                                <div class="img_box">
                                    <div class="img_thumb"><img src="<?php echo $img;?>"></div>
                                    <a href="javascript:;" onclick="delete_record('process.php?p=delproduct_image&id=<?= enc_password($v['id']);?>&product_id=<?= enc_password($v['product_id']);?>');" data-toggle="modal" data-target="#delete" title="Delete Image"><i class="fa fa-trash"></i></a>
                                </div>
                            </div>
                        <?php
                        }
                    }
                    ?>
                </div>
                <hr/>
                <div class="row">
                    <div class="col-xs-6"><h4 class="title">Upload Images</h4></div>
                    <div class="col-xs-6"><a href="javascript:;" onclick="add_image();">Add Another Image</a></div>
                </div>
                <div class="row">&nbsp;</div>
                <div class="row" id="upload_images">
                    <div class="col-md-4"><input type="file" name="img[]"></div>
                </div>
                <div class="row">&nbsp;</div>
                <input type="hidden" name="id" id="id" value="<?php echo $enc_id; ?>" />
                <button type="submit" class="btn btn-info btn-fill" name="submit">Submit</button>
                <div class="clearfix"></div>
        </div>
    </div>
</div>
</form>
<script>
function add_image(){
    var html = '<div class="col-12 col-md-4"><input type="file" name="img[]"></div>';
    $("#upload_images").append(html)
}
</script>