<?php
$id = '';
if(isset($_GET['id']))
{
    $id = dec_password($_GET['id']);
    $record = get_records($tblusers,"id='".$id."'");
    if(isset($record[0])){
        foreach ($record[0] as $k => $v )
        {
            $_SESSION['sysData'][$k] = stripslashes($v);
        }
    }
}
else if(!isset($_SESSION['sysData']['id'])) {
    $_SESSION['sysData'] = table_fields($tblusers);
}
$password = ($_SESSION['sysData']['password'])?dec_password($_SESSION['sysData']['password']):"";
?>
<form action="process.php?p=addedituser" enctype="multipart/form-data" method="post">
<div class="row">
    <div class="col-md-12">
        <div class="card">
            
                <div class="header">
                    <h4 class="title">Add/Edit User</h4>
                </div>
                <?php show_errors();?>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Name <span class="err">*</span></label>
                            <input type="text" required class="form-control" id="name" name="name" placeholder="Full Name" value="<?= $_SESSION['sysData']['name'];?>">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Phone</label>
                            <input type="text" class="form-control" id="phone" name="phone" placeholder="Contact Number" value="<?= $_SESSION['sysData']['phone'];?>">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Email <span class="err">*</span></label>
                            <input type="email" required class="form-control" id="email" name="email" placeholder="Email Address" value="<?= $_SESSION['sysData']['email'];?>">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Zip</label>
                            <input type="text" class="form-control" id="zip" name="zip" placeholder="zip" value="<?= $_SESSION['sysData']['zip'];?>">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>State</label>
                            <input type="text" class="form-control" id="state" name="state" placeholder="state" value="<?= $_SESSION['sysData']['state'];?>">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>City</label>
                            <input type="text" class="form-control" id="city" name="city" placeholder="city" value="<?= $_SESSION['sysData']['city'];?>">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Address</label>
                            <input type="text" class="form-control" id="address" name="address" placeholder="address" value="<?= $_SESSION['sysData']['address'];?>">
                        </div>
                    </div>
                    
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Password <span class="err">*</span></label>
                            <input type="password" required class="form-control" id="password" name="password" placeholder="password" value="<?= $_SESSION['sysData']['password'];?>">
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
                  </div>
                </div>
                <input type="hidden" name="id" id="id" value="<?php echo enc_password($_SESSION['sysData']['id']); ?>" />
                <button type="submit" class="btn btn-info btn-fill" name="submit">Submit</button>
                <div class="clearfix"></div>
        </div>
    </div>
</div>
</form>