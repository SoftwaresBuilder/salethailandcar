<?php
$get_vendor_bidds =get_records($tblbidding,"user_id='".$_SESSION['user_record']['id']."' and status='1' and trash='0' order by id desc");
//pr($get_vendor_bidds);
?>
<div class="container">
    <div class="row">
        <div class="col-12 heading"><?php echo translate("My Bids");?>
</div>
    </div>
    <div class="section_spacer">
        <div class="row register justify-content-center">
          <div class="col-12">
          
            <table class="table table-hover table-striped mytable">
                <thead>
                    <tr>
                        <th><?php echo translate("Product");?> </th>
                        <th><?php echo translate("Heighest Bid");?></th>
                        <th><?php echo translate("Lowest Bid");?></th>
                        <th><?php echo translate("Total Bids");?></th>
                       
                    </tr>
                </thead>
                <tbody>
                    <?php
                    if (count($get_vendor_bidds) > 0) {
                        foreach ($get_vendor_bidds as $v) {
                $get_bids_products_name =get_records($tblproducts,"id='".$v['product_id']."' and status='1' and trash='0'");
                $where = "product_id=".$v['product_id']."";
             
            $max_bid_amount = sql("SELECT MAX(amount) as max_bid_amount FROM " . $tblbidding . " where " . $where);
             $min_bid_amount = sql("SELECT MIN(amount) as min_bid_amount FROM " . $tblbidding . " where " . $where);
             $total_bid_counts = sql("SELECT COUNT(*) as Num FROM " . $tblbidding . " where " . $where);
             
                            ?>
                            <tr>
                        <td><a href="<?php echo makepage_url("product_detail","?id=".enc_password($get_vendor_bidds[0]['product_id']));?>">
                            <?php echo $get_bids_products_name[0]['title']; ?></a></td>
                                <td><?php  echo show_price($max_bid_amount[0]['max_bid_amount']); ?></a></td>
                                <td><?php echo show_price($min_bid_amount[0]['min_bid_amount']); ?></td>
                                <td><?php echo $total_bid_counts[0]['Num']; ?></td>
                               
                            </tr>
                            <?php
                        }
                    } else {
                        echo '<tr><td class="err" colspan="4">'.translate("No record found").'</td></tr>';
                    }
                    ?>
                </tbody>
            </table>

          </div>
        </div>

    </div>
</div>
