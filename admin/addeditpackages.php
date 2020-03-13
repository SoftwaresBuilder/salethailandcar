<?php
$id = '';
if(isset($_GET['id']))
{
    $id = dec_password($_GET['id']);
    $record = get_records($tblpackages,"id='".$id."'");
    if(isset($record[0])){
        foreach ($record[0] as $k => $v )
        {
            $_SESSION['sysData'][$k] = stripslashes($v);
        }
    }
}
else if(!isset($_SESSION['sysData']['id'])) {
    $_SESSION['sysData'] = table_fields($tblpackages);
}
?>
<form action="process.php?p=addeditpackages" enctype="multipart/form-data" method="post">
<div class="row">
    <div class="col-md-12">
        <div class="card">
            
                <div class="header">
                    <h4 class="title">Add/Edit Packages</h4>
                </div>
                <?php show_errors();?>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Title <span class="err">*</span></label>
                            <input type="text" required class="form-control" id="title" name="title" placeholder="title" value="<?= $_SESSION['sysData']['title_'.$lang];?>">
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
                            <label>post_ads <span class="err">*</span></label>
                            <input type="text" required class="form-control" id="post_ads" name="post_ads" placeholder="post_ads" value="<?= $_SESSION['sysData']['post_ads'];?>">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>bump_up <span class="err">*</span></label>
                            <input type="text" required class="form-control" id="bump_up" name="bump_up" placeholder="bump_up" value="<?= $_SESSION['sysData']['bump_up'];?>">
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Status</label>
                            <select required class="form-control" id="status" name="status">
                                <option <?php if($_SESSION['sysData']['status']=="1"){?> selected="selected" <?php }?> value="1">Active</option>
                                <option <?php if($_SESSION['sysData']['status']=="0"){?> selected="selected" <?php }?> value="0">Inactive</option>
                            </select>
                        </div>
                    </div>
                </div>
                </div>
                <input type="hidden" name="id" id="id" value="<?php echo enc_password($_SESSION['sysData']['id']); ?>" />
                <button type="submit" class="btn btn-info btn-fill" name="submit">Submit</button>
                <div class="clearfix"></div>
        </div>
    </div>
</form>