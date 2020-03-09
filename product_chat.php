<?php
if(isset($_GET['chat_id'])){
    $enc_chat_id = $_GET['chat_id'];
    $chat_id = dec_password($enc_chat_id);
    $chat = get_records($tblchat,"chat_id='".$chat_id."'","id ASC");
    $_SESSION['chat']['last_id'][$chat_id] = 0;
}
if(!(count($chat)>0)){
    $_SESSION['sysErr']['msg'] = "Invalid chat";
    redirect("dashboard"); exit;
}

$product = get_records($tblproducts,"id='".$chat[0]['product_id']."'");
?>
<div id="ChatMsg" class="ChatBar ui-block" style="width: 30%;display: none;">
  <h3 class="light-text-0 ui-block-title" style="position: fixed;background-color: white;z-index: 999;width: inherit">
    <span class="user-image round-img header-img">
      <img src="images/profile-placeholder.jpg" alt="David">
    </span>
    <a class="light-text-1 text-capitalize" href="vendor_profile.php?id=<?=enc_password($get_user_detail[0]['id']);?>">
      <?php echo $get_user_detail[0]['name']; ?>
      <i class="fa fa-angle-double-right"></i>
    </a>
    <a href="javascript:void(0)" class="closebtn" onclick="closeChat()">×</a>
  </h3>
  <div class="ui-block-content" style="padding: 0;margin-top: 100px;">
      
    
    <div class="row">
        <div class="col-12">
            <div class="chat_box" id="chat_box">
                <?php
                if(count($chat)>0){
                    foreach ($chat as $v) {
                        include("chat_msgs.php");
                    }
                }
                ?>
            </div>
            <div class="chat_send">
              <form onsubmit="return chat_send();" method="post">
                <div class="row">
                    <div class="col-9 col-md-10 pr0"><input type="text" class="form-control brl" id="msg" name="msg" placeholder="Write your message" /></div>
                    <div class="col-3 col-md-2 pl0">
                        <input type="hidden" id="chat_id" name="chat_id" value="<?php echo $enc_chat_id;?>">
                        <input type="submit" class="btn btn-primary brr" name="submit" value="Send">
                    </div>
                </div>
              </form>
            </div>
        </div>
    </div>


  </div>
</div>