<?php
$id = '';
if(isset($_GET['id']))
{
    $id = dec_password($_GET['id']);
    $record = get_records($tblfaq,"id='".$id."'");
    if(isset($record[0])){
        foreach ($record[0] as $k => $v )
        {
            $_SESSION['sysData'][$k] = stripslashes($v);
        }
    }
}
else if(!isset($_SESSION['sysData']['id'])) {
    $_SESSION['sysData'] = table_fields($tblfaq);
}
?>
<form action="process.php?p=addeditfaq" enctype="multipart/form-data" method="post">
<div class="row">
    <div class="col-md-12">
        <div class="card">
            
                <div class="header">
                    <h4 class="title">Add/Edit FAQ</h4>
                </div>
                <?php show_errors();?>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Title <span class="err">*</span></label>
                            <input type="text" required class="form-control" id="title" name="title" placeholder="title" value="<?= $_SESSION['sysData']['title'];?>">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Description</label>
                            <input type="text" class="form-control" id="description" name="description" placeholder="description" value="<?= $_SESSION['sysData']['description'];?>">
                        </div>
                    </div>
                </div>
                
                   
                    
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Status</label>
                            <select required class="form-control" id="status" name="status">
                                <option <?php if($_SESSION['sysData']['status']=="1"){?> selected="selected" <?php }?> value="1">Active</option>
                                <option <?php if($_SESSION['sysData']['status']=="0"){?> selected="selected" <?php }?> value="0">Inactive</option>
                            </select>
                        </div>
                    </div>
                   <!-- <div class="col-md-6">
                        <div class="form-group">
                            <label>User Level</label>
                            <select required class="form-control" id="user_level" name="user_level">
                                <option <?php if($_SESSION['sysData']['user_level']=="0"){?> selected="selected" <?php }?> value="0">Admin</option>
                                <option <?php if($_SESSION['sysData']['user_level']=="1"){?> selected="selected" <?php }?> value="1">User</option>
                                <option <?php if($_SESSION['sysData']['user_level']=="2"){?> selected="selected" <?php }?> value="2">Coach</option>
                            </select>
                        </div>
                  -->  </div>
                </div>
                <input type="hidden" name="id" id="id" value="<?php echo enc_password($_SESSION['sysData']['id']); ?>" />
                <button type="submit" class="btn btn-info btn-fill" name="submit">Submit</button>
                <div class="clearfix"></div>
        </div>
    </div>
</div>
</form>