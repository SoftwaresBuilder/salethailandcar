<?php
include("header.php");?>

<div class="container" style="margin-top: 50px;margin-bottom: 50px">
    <div class="row">
        <div class="col">
            <div class="card">
                <div class="card-header bg-primary text-white"><i class="fa fa-envelope"></i> <?php echo translate('Contact Us') ?>
                </div>
                <div class="card-body">
                    <form action="#" method="post">
                        <div class="form-group">
                            <label for="name"><?php echo translate('Name') ?></label>
                            <input type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="<?php echo translate('Enter Your Name') ?>" required>
                        </div>
                        <div class="form-group">
                            <label for="email"><?php echo translate('Email') ?></label>
                            <input type="email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="<?php echo translate('Email') ?>" required>
                            <small id="emailHelp" class="form-text text-muted"><?php echo translate('lang_text35') ?></small>
                        </div>
                        <div class="form-group">
                            <label for="message"><?php echo translate('Message') ?></label>
                            <textarea class="form-control" id="message" rows="6" required></textarea>
                        </div>
                        <div class="mx-auto">
                        <button type="submit" class="btn btn-primary text-right"><?php echo translate('Submit') ?></button></div>
                    </form>
                </div>
            </div>
        </div>
        <div class="col-12 col-sm-4">
            <div class="card bg-light mb-3">
                <div class="card-header bg-success text-white text-uppercase"><i class="fa fa-home"></i> <?php echo translate('Address') ?></div>
                <div class="card-body">
                    <p>3 rue des Champs Elysées</p>
                    <p>75008 PARIS</p>
                    <p>France</p>
                    <p>Email : email@example.com</p>
                    <p>Tel. +33 12 56 11 51 84</p>

                </div>

            </div>
        </div>
    </div>
</div>

<?php include("footer.php");
?>