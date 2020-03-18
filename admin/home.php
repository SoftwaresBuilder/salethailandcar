<?php
$users_total = get_count($tblusers);
$users_active = get_count($tblusers,"status>0 and trash=0");
$users_inactive = get_count($tblusers,"status=0 and trash=0");

$products_total = get_count($tblproducts);
$products_active = get_count($tblproducts,"status>0 and trash=0");
$products_inactive = get_count($tblproducts,"status=0 and trash=0");

$bidding_total = get_count($tblbidding);
$bidding_active = get_count($tblbidding,"status>0 and trash=0");
$bidding_inactive = get_count($tblbidding,"status=0 and trash=0");
?>
<div class="row">
    <div class="col-md-6">
        <div class="card">
            <div class="header">
                <h4 class="title">Stats Of Users</h4>
            </div>
            <div class="content">
            	<div class="row">
                    <div class="col-md-5">Total Users</div>
                    <div class="col-md-7"><?= $users_total;?></div>
                </div>
                <div class="row">
                    <div class="col-md-5">Active Users</div>
                    <div class="col-md-7"><?= $users_active;?></div>
                </div>
                <div class="row">
                    <div class="col-md-5">Inactive Partners</div>
                    <div class="col-md-7"><?= $users_inactive;?></div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-6">
        <div class="card ">
            <div class="header">
                <h4 class="title">Stats Of Ads</h4>
            </div>
            <div class="content">
            	<div class="row">
                    <div class="col-md-5">Total Ads</div>
                    <div class="col-md-7"><?= $products_total;?></div>
                </div>
                <div class="row">
                    <div class="col-md-5">Active Ads</div>
                    <div class="col-md-7"><?= $products_active;?></div>
                </div>
                <div class="row">
                    <div class="col-md-5">Inactive Ads</div>
                    <div class="col-md-7"><?= $products_inactive;?></div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-6">
        <div class="card ">
            <div class="header">
                <h4 class="title">Stats Of Bids</h4>
            </div>
            <div class="content">
                <div class="row">
                    <div class="col-md-5">Total Bids</div>
                    <div class="col-md-7"><?= $bidding_total;?></div>
                </div>
                <div class="row">
                    <div class="col-md-5">Active Bids</div>
                    <div class="col-md-7"><?= $bidding_active;?></div>
                </div>
                <div class="row">
                    <div class="col-md-5">Inactive Bids</div>
                    <div class="col-md-7"><?= $bidding_inactive;?></div>
                </div>
            </div>
        </div>
    </div>
</div>
