<?php
$id = '';
if(isset($_GET['id']))
{
	$id = dec_password($_GET['id']);
	$record = get_records($tblemails,"id='".$id."'");
	if(isset($record[0])){
		foreach ($record[0] as $k => $v )
		{
			$_SESSION['sysData'][$k] = stripslashes($v);
		}
	}
}
else if(!isset($_SESSION['sysData']['id'])) {
	$_SESSION['sysData'] = table_fields($tblemails);
}
?>
<form action="process.php?p=addeditemail" enctype="multipart/form-data" method="post">
<div class="row">
    <div class="col-md-12">
        <div class="card">
            
                <div class="row">
                    <h4 class="title">Edit Email</h4>
                </div>
                <?php show_errors();?>
                <div class="row">
                	<div class="col-md-6">
                        <div class="form-group">
                            <label>From Name</label>
                            <textarea class="form-control" id="adminname" name="adminname" placeholder="From Name"><?= $_SESSION['sysData']['adminname'];?></textarea>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>From Email</label>
                            <textarea class="form-control" id="adminemail" name="adminemail" placeholder="From Email"><?= $_SESSION['sysData']['adminemail'];?></textarea>
                        </div>
                    </div>
                </div>
                <div class="row">
                	<div class="col-md-6">
                        <div class="form-group">
                            <label>Subject</label>
                            <textarea class="form-control" id="subject" name="subject" placeholder="Subject"><?= $_SESSION['sysData']['subject'];?></textarea>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Email Content</label>
                            <textarea class="form-control" id="body" name="body" placeholder="Email Content"><?= $_SESSION['sysData']['body'];?></textarea>
                        </div>
                    </div>
                </div>
                <input type="hidden" name="id" id="id" value="<?php echo enc_password($_SESSION['sysData']['id']); ?>" />
                <button type="submit" class="btn btn-info btn-fill pull-right" name="submit">Submit</button>
                <div class="clearfix"></div>
		</div>
	</div>
</div>
</form>