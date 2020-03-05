
    $(document).ready(function () {

        $('#prd-gallery-carousel').flexslider({
            animation: "slide",
            controlNav: false,
            animationLoop: false,
            slideshow: false,
            itemWidth: 88.5,
            itemMargin: 13,
            asNavFor: '#product-gallery-slider'
        });

       
        

        // initiates responsive slide
        var settings = function () {
            var mobileSettings = {
                slideWidth: 80,
                minSlides: 2,
                maxSlides: 5,
                slideMargin: 5,
                adaptiveHeight: true,
                pager: false

            };
            var pcSettings = {
                slideWidth: 100,
                minSlides: 3,
                maxSlides: 5,
                pager: false,
                slideMargin: 10,
                adaptiveHeight: true
            };
            return ($(window).width() < 768) ? mobileSettings : pcSettings;
        }

        var thumbSlider;

        function tourLandingScript() {
            thumbSlider.reloadSlider(settings());
        }

        thumbSlider = $('.product-view-thumb').bxSlider(settings());
        $(window).resize(tourLandingScript);

    });
    
    function seeNumber(obj) {
        var phn = $(obj).data('phn');
        var val = $(obj).data('val');
        if (val == 0) {
            $(obj).data('val', '1');
            $(obj).html('<i class="icofont-ui-call"></i> ' + phn);
        } else {
            $(obj).data('val', '0');
            $(obj).html('<i class="icofont-ui-call"></i> See Number');
        }
    }
    function closeChat()
    {
        document.getElementById("ChatMsg").style.width = "0";
    }
    function openChat()
    {
       $("#ChatMsg").show(500);
     //  $("#ChatMsg").animate({"left":"0px", "slow");
        $('#scroll_top').css({'z-index': '0'});
        var screen = window.screen.availWidth;
        var siftScrren = "40%";
        if (screen > 720)
        {
            var siftScrren = "30%";
        }
        if (screen < 720 && screen > 620) {
            var siftScrren = "80%";
        }
        if (screen < 620) {
            var siftScrren = "100%";
        }
        document.getElementById("ChatMsg").style.width = siftScrren;
        //$('#ChatMsg').show();
        var div = $("#displayMsg");
        div.scrollTop(div.prop('scrollHeight'));
        setInterval(function () {
            newUpdate();
        }, 5000);

    }
    function sendmsg(id, ads)
    {
        var message = $('#msgboxtext').val();
        $('#msgboxtext').val('');
        var receiver = id;
        var url = "/message/send-msg?msg=" + message + "&receiver=" + receiver + "&ad=" + ads;
        $.post(url, function (data) {
//            $('#msgboxtext').val('');
            // $('#displayMsg').append("Sent");
        }).fail(function () {
            $('#display-msg').append("<p>Connection Error...</p>");
        });

    }
    function newUpdate()
    {
        var chat = "21" + "3" + "11";
        var receiver = "11";
        var current = $('#check').val();

        var check = "/message/check?chatId=" + chat;

        $.post(check, function (data) {
            if (data > current)
            {
                console.log("chech client :" + current + " --- " + " server : " + data);
                $('#check').val(data);
                // var new_msg = getNewMsg(chat);
                var check = "/message/load-new-msg?chat=" + chat;
                $.post(check, function (data) {
                    $('#displayMsg').append(data);
                    var div = $("#displayMsg");
                    div.scrollTop(div.prop('scrollHeight'));
                }).fail(function () {
                    return "fools";
                });
            }
        }).fail(function (data) {
           
        });
    }

    function getNewMsg(chat)
    {
        var check = "/message/load-new-msg?chat=" + chat;
        $.post(check, function (data) {
            return data;
        }).fail(function () {
            return "fools";
        });
    }

    function CheckUpdate()
    {

        var chat = "21" + "3" + "11";
        var receiver = "11";
        var current = $('#check').val();

        var check = "/message/check?chatId=" + chat;

        var url = "/message/load-msg-tpl?chat_id=" + chat + "&current=" + current;
        $.post(url, function (data)
        {
            $('#displayMsg').append(data);
            var div = $("#displayMsg");
            div.scrollTop(div.prop('scrollHeight'));

        }).done(function () {
            $('#displayMsg').append(data);
        }).fail(function () {
            $('#display-msg').append("<p>Connection Error...</p>");
        });


        $.post(check, function (data) {
            if (data > current)
            {
                document.getElementById("check").value = data;

            }
        }).fail(function () {
            alert(data + " urrent:" + current);
        });
    }

function fnAdd_bidd(){

  var bidder_id = $('#bidder_id').val();
  if(isNaN(bidder_id))
  {
   
    window.location.href = "http://localhost/thai/login.php";
    return false;
  }
  //return false;

  var product_id = $('#product_id').val();
  var user_id = $('#user_id').val();
  var bid_amount = $('#bid_amount').val();
  var bid_message = $('#bid_message').val();
  if(bid_amount>0)
    {
        $.ajax({
            type: "GET",
            url: "ajaxphp.php",
             dataType: 'JSON',  
            data: {product_id:product_id,user_id:user_id,bidder_id:bidder_id,bid_amount:bid_amount,bid_message:bid_message,p:'add_bidd'},
            cache: false,
            success: function(data){
              
               $(".bidd-form").fadeOut(500);
               var stramount = '<span class="field-left">Bid Amount</span> <span id="sp_bid_amount" class="field-right">'+data[0].amount+'</span>';
               $("#div_bid_amount").html(stramount);
               var strdate = '<span class="field-left">Bid Amount</span> <span id="sp_bid_amount" class="field-right">'+data[0].created_date+'</span>';
              $("#div_bid_date").html(strdate);
                var total_bid = '<span class="field-left">Total Bids</span> <span class="field-right">'+data[0].total_bid_counts+'</span>';
                var heighest_bid ='<span class="field-left">Highest Bids</span> <span class="field-right">USD'+data[0].max_bid_amount+'</span>';
                var lowest_bid = '<span class="field-left">Lowest Bids</span> <span class="field-right">USD'+data[0].min_bid_amount+'</span>';
                $("#total_bid").html(total_bid);
                $("#heighest_bid").html(heighest_bid);
                $("#lowest_bid").html(lowest_bid);
            } 
        });
    }
    else
    {
      alert('amount cannot be blank');
    }

}