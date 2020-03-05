<?php
$id = '';
if(isset($_GET['id']))
{
	$id = dec_password($_GET['id']);
	$record = get_records($tblnews,"id='".$id."'");
	if(isset($record[0])){
		foreach ($record[0] as $k => $v )
		{
			$_SESSION['sysData'][$k] = stripslashes($v);
		}
	}
}
else if(!isset($_SESSION['sysData']['id'])) {
	$_SESSION['sysData'] = table_fields($tblnews);
}
?>
<form action="process.php?p=addeditnews" enctype="multipart/form-data" method="post">
<div class="row">
    <div class="col-md-12">
        <div class="card">
            
                <div class="header">
                    <h4 class="title">Add/Edit News</h4>
                </div>
                <?php show_errors();?>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Title<span class="err">*</span></label>
                            <input type="text" required class="form-control" id="title" name="title" placeholder="Post name" value="<?= $_SESSION['sysData']['title'];?>">
                        </div>
                    </div>
                    
                </div>
                <div class="row">
                	<div class="col-md-12">
                        <div class="form-group">
                            <label>Description</label>
                            <textarea class="form-control" id="description" name="description" placeholder="Category detail"><?= $_SESSION['sysData']['description'];?></textarea>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>News Image</label>
                            <input type="file" class="form-control" id="img" name="img" value="<?= $_SESSION['sysData']['img'];?>">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Status</label>
                            <select required class="form-control" id="status" name="status">
                            	<option <?php if($_SESSION['sysData']['status']=='1'){?> selected="selected" <?php }?> value="1">Active</option>
                                <option <?php if($_SESSION['sysData']['status']=='0'){?> selected="selected" <?php }?> value="0">Inactive</option>
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