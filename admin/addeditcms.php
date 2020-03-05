<?php
$type = '';
if(isset($_GET['type']))
{
    $type = $_GET['type'];
    $record = get_records($tblcms,"type='".$type."'");
    if(isset($record[0])){
        foreach ($record[0] as $k => $v )
        {
            $_SESSION['sysData'][$k] = stripslashes($v);
        }
    }
}
?>
<form action="process.php?p=addeditcms" enctype="multipart/form-data" method="post">
<div class="row">
    <div class="col-md-12">
        <div class="card">
            
                <div class="header">
                    <h4 class="title">Edit CMS</h4>
                </div>
                <?php show_errors();?>
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label>Type <span class="err">*</span></label>
                            <input type="text" readonly required class="form-control" id="type" name="type" placeholder="type" value="<?= $_SESSION['sysData']['type'];?>">
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="form-group">
                            <label>Page Content</label>
                            <textarea class="form-control" id="content" name="content" placeholder="Page Content"><?= $_SESSION['sysData']['content'];?></textarea>
                        </div>
                    </div>
                </div>
                
                </div>
                <button type="submit" class="btn btn-info btn-fill" name="submit">Submit</button>
                <div class="clearfix"></div>
        </div>
    </div>
</div>
</form>