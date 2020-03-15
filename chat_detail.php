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
<div class="container">
	<div class="row">
		<div class="col-12 col-lg-12 heading"><?php echo $product[0]['title_'.$lang];?></div>
	</div>
    <div class="section_spacer">
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
                        <div class="col-9 col-md-10 pr0"><input type="text" class="form-control brl" id="msg" name="msg" placeholder="<?php echo translate("Write your message");?>" /></div>
                        <div class="col-3 col-md-2 pl0">
                            <input type="hidden" id="chat_id" name="chat_id" value="<?php echo $enc_chat_id;?>">
                            <input type="submit" class="btn btn-primary brr" name="submit" value="<?php echo translate("Send");?>">
                        </div>
                    </div>
                    </form>
                </div>
    		</div>
    	</div>
    </div>
</div>
<script type="text/javascript">
function chat_send(){
    var msg = $("#msg").val();
    var chat_id = $("#chat_id").val();
    $("#msg").val("");
    $.ajax({
        method: "POST",
        url: "ajaxphp.php?p=chat_send",
        data: { chat_id: chat_id, msg:msg }
    })
    .done(function( msg ) {
        var html = $("#chat_box").html();
        $("#chat_box").html(html+msg);
    });

    scroll_chat_div();

    return false;
}
function chat_update(){
    var chat_id = $("#chat_id").val();
    $.ajax({
        method: "POST",
        url: "ajaxphp.php?p=chat_update",
        data: { chat_id: chat_id }
    })
    .done(function( msg ) {
        var html = $("#chat_box").html();
        $("#chat_box").html(html+msg);
    });

    scroll_chat_div();

    setTimeout(chat_update,10000);
}
setTimeout(chat_update,20000);

function scroll_chat_div(){
    $("#chat_box").animate({
      scrollTop: $('#chat_box')[0].scrollHeight - $('#chat_box')[0].clientHeight
    }, 500);
}
scroll_chat_div();
</script>