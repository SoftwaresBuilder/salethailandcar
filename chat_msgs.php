<?php
$chat_msg = ($v['user_id']==$user_id)?'chat_msg1':'chat_msg2';
$_SESSION['chat']['last_id'][$chat_id] = $v['id'];
?>
<div class="chat_msg">
    <div class="<?php echo $chat_msg;?>"><div class="small_text"><?php echo dates_duration($v['created_date']);?></div><?php echo $v['msg'];?></div>
</div>
