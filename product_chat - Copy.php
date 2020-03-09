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
  <div class="ui-block-content" style="padding: 0;margin-top: 64px;">
      <input type="hidden" name="check" id="check" value="1">
      <div class="chat-box">
          <div id="displayMsg" class=" chat-message-field p-3" style="overflow-y: scroll;height:570px;">
            <div class="chatTwoTrwapper">
                <div class="reciever"></div>
                <div class="name">
                  <small class="time"></small>
                </div>
            </div>
          </div>
          <div class="chat_footer">
              <div class="row no-gutters">
                <div class="col-10">
                  <textarea id="msgboxtext" class="chat_text_input form-control p-3" style="padding:10px 2px;" placeholder="Text Here!"></textarea>
                </div>
                <div class="col-2">
                  <button type="button" onclick="sendmsg(11,3)" class="chat_text_send text-primary col btn bg-white btn-sm ">
                    <i class="fa fa-send"></i>
                  </button>
                </div>
              </div>
          </div>
      </div>
  </div>
</div>