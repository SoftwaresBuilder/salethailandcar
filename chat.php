<?php
$where = "(user_id='".$user_id."' or touser_id='".$user_id."') and status='1' and trash='0' GROUP BY chat_id";
$chat = get_records($tblchat,$where,"id DESC");
?>
<div class="container">
	<div class="row">
		<div class="col-12 col-lg-12 heading">Chats</div>
	</div>
    <div class="section_spacer">
    	<div class="row">
    		<div class="col-12">
	        <table class="table table-hover table-striped mytable">
                <thead>
                    <tr>
                        <th>Product</th>
                        <th>Date</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    if (count($chat) > 0) {
                        foreach ($chat as $v) {
                        	$product = get_records($tblproducts,"id='".$v['product_id']."'");
                            ?>
                            <tr>
                                <td><a href="<?php echo makepage_url("product_detail","?id=".enc_password($v['product_id']));?>"><?php echo $product[0]['title']; ?></a></td>
                                <td><?php echo dates_duration($v['created_date']); ?></td>
                                <td>
                                    <a href="<?php echo makepage_url($p,"?tab=chat&chat_id=".enc_password($v['chat_id']));?>"><i class="fa fa-comments"></i></a>
                                </td>
                            </tr>
                            <?php
                        }
                    } else {
                        echo '<tr><td class="err" colspan="3">No record found</td></tr>';
                    }
                    ?>
                </tbody>
            </table>
    		</div>
    	</div>
    </div>
</div>
