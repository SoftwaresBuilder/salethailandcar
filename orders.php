<?php
$get_user_bidds =get_records($tblbidding,"bidder_id='".$_SESSION['user_record']['id']."' and status='1' and trash='0' order by id desc");
//pr($get_user_bidds);
?>
<div class="container">
    <div class="row">
        <div class="col-12 heading">My Bids</div>
    </div>
    <div class="section_spacer">
        <div class="row register justify-content-center">
          <div class="col-12">
          
            <table class="table table-hover table-striped mytable">
                <thead>
                    <tr>
                        <th>Product</th>
                        <th>Bid Amount</th>
                        <th>Bidding Date</th>
                       
                    </tr>
                </thead>
                <tbody>
                    <?php
                    if (count($get_user_bidds) > 0) {
                        foreach ($get_user_bidds as $v) {
                $get_bids_products_name =get_records($tblproducts,"id='".$v['product_id']."' and status='1' and trash='0'");
                            ?>
                            <tr>
                                <td><a href="<?php echo makepage_url("product_detail","?id=".enc_password($get_user_bidds[0]['product_id']));?>"><?php echo $get_bids_products_name[0]['title']; ?></a></td>
                                <td><?php echo show_price($v['amount']); ?></td>
                                <td><?php echo $v['created_date']; ?></td>
                               
                            </tr>
                            <?php
                        }
                    } else {
                        echo '<tr><td class="err" colspan="4">No record found</td></tr>';
                    }
                    ?>
                </tbody>
            </table>

          </div>
        </div>
    </div>
</div>
