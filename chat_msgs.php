<?php
$chat_msg = ($v['user_id']==$user_id)?'chat_msg1':'chat_msg2';
$_SESSION['chat']['last_id'][$chat_id] = $v['id'];
$msg_id=$v['id'];
?>
<div class="chat_msg">
    <div id="div_<?php echo $msg_id;?>" class="<?php echo $chat_msg;?>"><div class="small_text"><?php echo dates_duration($v['created_date']);?></div><?php echo $v['msg'];?></div><a id="a_<?php echo $msg_id;?>" href="javascript:;" onclick="translateChat(<?php echo $msg_id;?>)" style="font-size: 15px;">Translate</a>
    <div id="listing_chat"></div>
</div>
<script type="text/javascript">
	
	function translateChat(msg_id) {
		var cid=msg_id;
       $("#a_"+cid).hide();

		// alert(cid);return false;
		if (cid>0) {
		$.ajax({
                    type: "GET",
                    url: "ajaxphp.php",
                    dataType :'html',
                    data: {cid:cid,p:'getTranslate'},
                    success: function(data){
                          // $("#listing_chat").html(data);
                          $("#div_"+cid).append(data);


                    }
                });
		}
		
	}
</script>