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
                    <h4 class="title">Add/Edit Blogs</h4>
                </div>
                <?php show_errors();?>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Blog Title English<span class="err">*</span></label>
                            <input onfocusout="translate_into_thai(this.value,'title_th')" type="text" required class="form-control" id="title_en" name="title_en" placeholder="Blog title in English" value="<?= $_SESSION['sysData']['title_en'];?>">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Blog Title thai<span class="err">*</span></label>
                            <input type="text" required class="form-control" id="title_th" name="title_th" placeholder="Blog titile in Thai" value="<?= $_SESSION['sysData']['title_th'];?>">
                        </div>
                    </div>
                    
                </div>
                <div class="row">
                	<div class="col-md-6">
                        <div class="form-group">
                            <label>Description English</label>
                            <textarea onfocusout="translate_into_thai(this.value,'description_th')" class="form-control" id="description_en" name="description_en" placeholder="Description in English"><?= $_SESSION['sysData']['description_en'];?></textarea>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Description Thai</label>
                            <textarea class="form-control" id="description_th" name="description_th" placeholder="Description in Thai"><?= $_SESSION['sysData']['description_th'];?></textarea>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Tags in English</label>
                            <textarea onfocusout="translate_into_thai(this.value,'tags_th')" class="form-control" id="tags_en" name="tags_en" placeholder="Tags in English"><?= $_SESSION['sysData']['tags_en'];?></textarea>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Tags in Thai</label>
                            <textarea class="form-control" id="tags_th" name="tags_th" placeholder="Tags in Thai"><?= $_SESSION['sysData']['tags_th'];?></textarea>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Meta Description English</label>
                            <textarea onfocusout="translate_into_thai(this.value,'meta_description_th')" class="form-control" id="meta_description_en" name="meta_description_en" placeholder="Meta Description in English"><?= $_SESSION['sysData']['meta_description_en'];?></textarea>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Meta Description Thai</label>
                            <textarea class="form-control" id="meta_description_th" name="meta_description_th" placeholder="Meta Description in Thai"><?= $_SESSION['sysData']['meta_description_th'];?></textarea>
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