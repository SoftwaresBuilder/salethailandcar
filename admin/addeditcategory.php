<?php
$id = '';
if(isset($_GET['id']))
{
    $id = dec_password($_GET['id']);
    $record = get_records($tblcategories,"id='".$id."'");
    if(isset($record[0])){
        foreach ($record[0] as $k => $v )
        {
            $_SESSION['sysData'][$k] = stripslashes($v);
        }
    }
}
else if(!isset($_SESSION['sysData']['id'])) {
    $_SESSION['sysData'] = table_fields($tblcategories);
}

$parent_categories = get_records($tblcategories,"pid='0' and trash!='1'");
?>
<form action="process.php?p=addeditcategory" enctype="multipart/form-data" method="post">
<div class="row">
    <div class="col-md-12">
        <div class="card">
            
                <div class="header">
                    <h4 class="title">Add/Edit Category</h4>
                </div>
                <?php show_errors();?>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Select Parent</label>
                            <select required class="form-control" id="pid" name="pid">
                                <option <?php if($_SESSION['sysData']['pid']=="0"){?> selected="selected" <?php }?> value="0">Parent Category</option>
                                <?php
                                if(count($parent_categories)>0){
                                    foreach ($parent_categories as $v) {
                                    ?>
                                        <option <?php if($_SESSION['sysData']['pid']==$v['id']){?> selected="selected" <?php }?> value="<?php echo $v['id'];?>"><?php echo $v['title_en'];?></option>
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
                            <input onfocusout="translate_into_thai(this.value,'title_th')" type="text" required class="form-control" id="title_en" name="title_en" placeholder="title" value="<?= $_SESSION['sysData']['title_en'];?>">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Title Thai <span class="err">*</span></label>
                            <input type="text" required class="form-control" id="title_th" name="title_th" placeholder="title" value="<?= $_SESSION['sysData']['title_th'];?>">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Description</label>
                            <input type="text" class="form-control" id="description" name="description" placeholder="description" value="<?= $_SESSION['sysData']['description'];?>">
                        </div>
                    </div>
                    </div>
                    <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Status</label>
                            <select required class="form-control" id="status" name="status">
                                <option <?php if($_SESSION['sysData']['status']=="1"){?> selected="selected" <?php }?> value="1"><?php echo get_category_status('1');?></option>
                                <option <?php if($_SESSION['sysData']['status']=="0"){?> selected="selected" <?php }?> value="0"><?php echo get_category_status('0');?></option>
                            </select>
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