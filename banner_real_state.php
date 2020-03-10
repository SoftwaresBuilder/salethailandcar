<link rel="stylesheet" type="text/css" href="css/try.css">

<div class="inner_banner" style="background-image: url(images/real-state.jpg);">
        <!--<div class="bnr-overlay"></div>-->
        <div class="container_fluid">
            <section class="banner-area">
                <div class="padding-none posi-search">
                    <div class="top-search-form">
                        <h1 class="banner-caption"><?php echo translate("lang_text13");?></h1>
                        <p class="small_para"><?php echo translate("lang_text14");?></p>
                        <div class="search-sec inner">
                            <div class="header-job-search">
                                <div class="header-job-search-1 clearfix"> 
                                    <div class="stv-radio-tabs-wrapper">
                                        <input type="radio" class="stv-radio-tab" name="radioTabTest" value="buy" id="tab1" checked="">
                                        <label for="tab1" class="first_lbl"><?php echo translate("Buy");?></label>
                                        <input type="radio" class="stv-radio-tab" name="radioTabTest" value="rent" id="tab2">
                                        <label for="tab2"><?php echo translate("Rent");?></label>
                                        <input type="radio" class="stv-radio-tab" name="radioTabTest" value="sell" id="tab3">
                                        <label for="tab3"><?php echo translate("Sell");?></label>
                                    </div>
                                </div>
                                <div class="input-group">
                                    <input name="location" type="text" pattern=".{3,}" onchange="get_filter_products_type()" id="location" class="form-control" placeholder="<?php echo translate("Enter Location");?>" value="" autocomplete="off">
                                    <!--<input type="text" class="form-control" placeholder="Search by Region, Location or Project" aria-label="Username" aria-describedby="basic-addon1">-->
                                    <div class="input-group-append search_btn">
                                        <button class="btn btn-outline-secondary" type="button" onclick="get_filter_products();"><img src="images/search.png"></button>
                                    </div>
                                </div>
                            </div>
                        </div> 
                    </div>
                </div>
                <ul class="list-inline banner_social">
                    <li class="list-inline-item"><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                    <li class="list-inline-item"><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                    <li class="list-inline-item"><a href="#"><i class="fa fa-google-plus" aria-hidden="true"></i></a></li>
                    <li class="list-inline-item"><a href="#"><i class="fa fa-youtube-play" aria-hidden="true"></i></a></li>
                    <li class="list-inline-item"><a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a></li>
                    <li class="list-inline-item"><a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
                </ul>
            </section>
        </div>
    </div>