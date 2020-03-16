<?php
$id = '';
if(isset($_GET['id']))
{
    $id = dec_password($_GET['id']);
    $record = get_records($tblcategory_types,"id='".$id."'");
    if(isset($record[0])){
        foreach ($record[0] as $k => $v )
        {
            $_SESSION['sysData'][$k] = stripslashes($v);
        }
    }
}
else if(!isset($_SESSION['sysData']['id'])) {
    $_SESSION['sysData'] = table_fields($tblcategory_types);
}
$cid = dec_password($_GET['cid']);
?>
<form action="process.php?p=addedittype" enctype="multipart/form-data" method="post">
<div class="row">
    <div class="col-md-12">
        <div class="card">
            
                <div class="header">
                    <h4 class="title">Add/Edit Type</h4>
                </div>
                <?php show_errors();?>
                <div class="row">
                    
                     <div class="col-md-6">
                        <div class="form-group">
                            <label>Title English <span class="err">*</span></label>
                            <input type="text" required class="form-control" id="title_en" name="title_en" placeholder="title" value="<?= $_SESSION['sysData']['title_en'];?>">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Title Thai <span class="err">*</span></label>
                            <input type="text" required class="form-control" id="title_th" name="title_th" placeholder="title" value="<?= $_SESSION['sysData']['title_th'];?>">
                        </div>
                    </div>
                </div>
                    
                <input type="hidden" name="id" id="id" value="<?php echo enc_password($_SESSION['sysData']['id']); ?>" />
                <input type="hidden" name="cid" id="cid" value="<?php echo enc_password($cid); ?>" />
                <button type="submit" class="btn btn-info btn-fill" name="submit">Submit</button>
           
           <div class="clearfix"></div>
       </div>
   </div>
   </div>
</form>