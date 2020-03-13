<?php
$id = '';
if(isset($_GET['id']))
{
    $id = dec_password($_GET['id']);
    $record = get_records($tblproducts,"id='".$id."'");
    if(isset($record[0])){
        foreach ($record[0] as $k => $v )
        {
            $_SESSION['sysData'][$k] = stripslashes($v);
        }
    }
}
else if(!isset($_SESSION['sysData']['id'])) {
    $_SESSION['sysData'] = table_fields($tblproducts);
}

$categories = get_records($tblcategories,"pid='0' and trash!='1'");
$subcategories = get_records($tblcategories,"pid!='0' and trash!='1'");
$users=  get_records($tblusers, "id>'0' and trash='0'");
?>
<form action="process.php?p=addeditproduct" enctype="multipart/form-data" method="post">
<div class="row">
    <div class="col-md-12">
        <div class="card">
            
                <div class="header">
                    <h4 class="title">Add/Edit Product</h4>
                </div>
                <?php show_errors();?>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Category <span class="err">*</span></label>
                            <select required class="form-control" id="category_id" name="category_id">
                                <option value="">Select Category</option>
                                <?php
                                if(count($categories)>0){
                                    foreach ($categories as $v) {
                                    ?>
                                        <option <?php if($_SESSION['sysData']['category_id']==$v['id']){?> selected <?php }?> value="<?php echo $v['id'];?>"><?php echo $v['title_en'];?></option>
                                    <?php
                                    }
                                }
                                ?>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>SubCategory <span class="err">*</span></label>
                            <select required class="form-control" id="subcategory_id" name="subcategory_id">
                                <option value="">Select SubCategory</option>
                                <?php
                                if(count($subcategories)>0){
                                    foreach ($subcategories as $v) {
                                    ?>
                                        <option <?php if($_SESSION['sysData']['subcategory_id']==$v['id']){?> selected <?php }?> value="<?php echo $v['id'];?>"><?php echo $v['title_en'];?></option>
                                    <?php
                                    }
                                }
                                ?>
                            </select>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label>User <span class="err">*</span></label>
                            <select required class="form-control" id="user_id" name="user_id">
                                <option value="">Select User</option>
                                <?php
                                if(count($users)>0){
                                    foreach ($users as $v) {
                                    ?>
                                        <option <?php if($_SESSION['sysData']['user_id']==$v['id']){?> selected <?php }?> value="<?php echo $v['id'];?>"><?php echo $v['name'];?></option>
                                    <?php
                                    }
                                }
                                ?>
                            </select>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Title English <span class="err">*</span></label>
                            <input oninput="myFunction('title_th')" onfocusout="translate_into_thai($('#title_en').val(),'title_th')" type="text" required class="form-control" id="title_en" name="title_en" placeholder="title" value="<?= $_SESSION['sysData']['title_en'];?>">
                        </div>
                    </div>
                     <div class="col-md-6">
                        <div class="form-group">
                            <label>Title Thai <span class="err">*</span></label>
                            <input type="text" required class="form-control" id="title_th" name="title_th" placeholder="title" value="<?= $_SESSION['sysData']['title_th'];?>">
                        </div>
                    </div>
                    
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Price</label>
                            <input type="number" required class="form-control" id="price" name="price" placeholder="price" value="<?= $_SESSION['sysData']['price'];?>">
                        </div>
                    </div>
                    
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Featured</label>
                            <select required class="form-control" id="featured" name="featured">
                                <option <?php if($_SESSION['sysData']['featured']=="0"){?> selected="selected" <?php }?> value="0"><?php echo get_product_featured("0");?></option>
                                <option <?php if($_SESSION['sysData']['featured']=="1"){?> selected="selected" <?php }?> value="1"><?php echo get_product_featured("1");?></option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Status</label>
                            <select required class="form-control" id="status" name="status">
                                <option <?php if($_SESSION['sysData']['status']=="1"){?> selected="selected" <?php }?> value="1"><?php echo get_product_status('1');?></option>
                                <option <?php if($_SESSION['sysData']['status']=="0"){?> selected="selected" <?php }?> value="0"><?php echo get_product_status('0');?></option>
                                <option <?php if($_SESSION['sysData']['status']=="2"){?> selected="selected" <?php }?> value="2"><?php echo get_product_status('2');?></option>
                                <option <?php if($_SESSION['sysData']['status']=="3"){?> selected="selected" <?php }?> value="3"><?php echo get_product_status('3');?></option>
                            </select>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Location <span class="err">*</span></label>
                            <input type="text" required class="form-control" id="location" name="location" placeholder="location" value="<?= $_SESSION['sysData']['location'];?>">
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Type</label>
                            <input type="text"  class="form-control" id="type" name="type" placeholder="type" value="<?= $_SESSION['sysData']['type'];?>">
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Model</label>
                            <input type="text"  class="form-control" id="model" name="model" placeholder="model" value="<?= $_SESSION['sysData']['model'];?>">
                        </div>
                    </div> 

                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Brand</label>
                            <input type="text"  class="form-control" id="brand" name="brand" placeholder="brand" value="<?= $_SESSION['sysData']['brand'];?>">
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Year Registration </label>
                            <input type="text" class="form-control" id="year_registration" name="year_registration" placeholder="year_registration" value="<?= $_SESSION['sysData']['year_registration'];?>">
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Driven</label>
                            <input type="text"  class="form-control" id="driven" name="driven" placeholder="driven" value="<?= $_SESSION['sysData']['driven'];?>">
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Fuel Type</label>
                            <input type="text"  class="form-control" id="fuel_type" name="fuel_type" placeholder="fuel_type" value="<?= $_SESSION['sysData']['fuel_type'];?>">
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label>GearBox</label>
                            <input type="text"  class="form-control" id="gearbox" name="gearbox" placeholder="gearbox" value="<?= $_SESSION['sysData']['gearbox'];?>">
                        </div>
                    </div>
                     <div class="col-md-6">
                        <div class="form-group">
                            <label>Description English</label>
                            <textarea  oninput="myFunction('description_th')" onfocusout="translate_into_thai($('#description_en').val(),'description_th')" class="form-control" id="description_en" name="description_en" placeholder="description"><?= $_SESSION['sysData']['description_en'];?></textarea>
                        </div>
                    </div>
                     <div class="col-md-6">
                        <div class="form-group">
                            <label>Description Thai</label>
                            <textarea class="form-control" id="description_th" name="description_th" placeholder="description"><?= $_SESSION['sysData']['description_th'];?></textarea>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Features </label>
                            <input type="text"  class="form-control" id="features" name="features" placeholder="features" value="<?= $_SESSION['sysData']['features'];?>">
                        </div>
                    </div>
                </div>
                </div>
                <input type="hidden" name="id" id="id" value="<?php echo enc_password($_SESSION['sysData']['id']); ?>" />
                <button type="submit" class="btn btn-info btn-fill" name="submit">Submit</button>
                <div class="clearfix"></div>
        </div>
    </div>
</div>
</form>