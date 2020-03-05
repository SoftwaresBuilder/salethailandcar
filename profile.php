<?php

if(!isset($_SESSION['sysData']['name'])) {
    $_SESSION['sysData'] = table_fields($tblusers);
}
?>

<div class="container">
    <div class="row">
        <div class="col-12 heading">My Profile</div>
    </div>
    <div class="section_spacer">
        <div class="row register">
            <div class="col-xs-12 col-md-6">
                <form action="process.php?p=register" enctype="multipart/form-data" method="post">
                    <?php show_errors();?>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label>Full Name <span class="err">*</span></label>
                                 <input type="text" required class="form-control" id="name" name="name" placeholder="Enter Your Name" value="<?= $_SESSION['sysData']['name'];?>">
                            
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label>Email <span class="err">*</span></label>
                                <input type="email" required class="form-control" id="email" name="email" placeholder="Email" value="<?= $_SESSION['sysData']['email'];?>">
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label>Password <span class="err">*</span></label>
                                <input type="password" required class="form-control" id="password" name="password" placeholder="Password" value="">
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label>Confirm Password <span class="err">*</span></label>
                                <input type="password" required class="form-control" id="cpassword" name="cpassword" placeholder="Confirm password" value="">
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label>Address</label>
                                <input type="text" required class="form-control" id="address" name="address" placeholder="Enter Your Address" value="<?= $_SESSION['sysData']['address'];?>">
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label>City</label>
                                <input type="text" required class="form-control" id="city" name="city" placeholder="Enter Your City" value="<?= $_SESSION['sysData']['city'];?>">
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label>State</label>
                                <input type="text" required class="form-control" id="state" name="state" placeholder="Enter Your State" value="<?= $_SESSION['sysData']['state'];?>">
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label>Zipcode</label>
                                <input type="text" required class="form-control" id="zip" name="zip" placeholder="Enter Your Zip code" value="<?= $_SESSION['sysData']['zip'];?>">
                            </div>
                        </div>
                         <div class="col-md-12">
                         <div class="col-md-12">
                            <div class="form-group">
                                <label>Profile Image</label>
                                <input type="file" required class="form-control" id="profile_img" name="profile_img">;
                            </div>
                        </div>
                        <div class="col-md-12" style="margin-top: 10px;">
                            <button type="submit" class="btn btn-primary" name="Submit">Update Profile</button>
                        </div>
                    </div>
                  <div class="clearfix"></div>
                </form>
            </div>
        </div>
    </div> 
</div>
