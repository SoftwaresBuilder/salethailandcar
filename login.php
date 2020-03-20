<?php include'header.php';?>
<div class="container">
    <div class="section_spacer">
        <div class="row register justify-content-center">
          <div class="col-12 col-lg-6">
          <form action="process.php?p=login" enctype="multipart/form-data" method="post">
            <div class="row">          
                <?php show_errors();?>
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label><?php echo translate("Email");?> <span class="err">*</span></label>
                            <input type="email" required class="form-control" id="email" name="email" placeholder="Email" value="">
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="form-group">
                            <label><?php echo translate("Password");?><span class="err">*</span></label>
                            <input type="password" required class="form-control" id="password" name="password" placeholder="Password" value="">
                        </div>
                    </div>
                    <div class="col-xs-12">&nbsp;</div>
                    <div class="col-md-12">
                        <button type="submit" class="btn btn-primary" name="Submit">Login</button>
                    </div>
                    <div class="col-xs-12">&nbsp;</div>
                    <div class="col-xs-12 col-md-12"><a href="">Forgot Password?</a></div>

                </div>
            </div>
          </form>
          </div>
        </div>
    </div>
</div>
<?php include'footer.php';?>
