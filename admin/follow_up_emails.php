<?php ?>
<form action="process.php?p=follow_up_emails" method="post">
<div class="row">
    <div class="col-md-12">
        <div class="card">
            
                <div class="row">
                    <h4 class="title">Follow Up Email</h4>
                </div>
                <?php show_errors();?>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Select Type</label>
                        <select required class="form-control"  name="type" id="type">
                            <option value="">Select Type</option>
                            <option value="users">Users</option>
                            <option value="partners">Partners</option>
                            <option value="subscribers">Subscribers</option>
                        </select>
                         </div>
                    </div>
                <div class="col-md-6">
                        <div class="form-group">
                            <label>Subject</label>
                            <input required type="text" class="form-control" id="subject" name="subject" placeholder="Subject">
                        </div>
                    </div>
                </div>
                <div class="row">
                	
                    <div class="col-md-12">
                        <div class="form-group">
                            <label>Email Content</label>
                            <textarea required class="form-control" id="body" name="body" placeholder="Email Content"></textarea>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-1">
                         <div class="form-group">
                        <button type="submit" class="btn btn-info btn-fill pull-right" name="submit">Send Mail</button>
                        <div class="clearfix"></div>
                    </div>
                    </div>
                </div>

                
		</div>
	</div>
</div>
</form>