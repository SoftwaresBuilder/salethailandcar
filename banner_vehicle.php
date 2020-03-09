<link rel="stylesheet" type="text/css" href="css/try.css">

<div class="inner_banner" style="background-image: url(images/car.jpg);">
        <!--<div class="bnr-overlay"></div>-->
        <div class="container_fluid">
            <section class="banner-area">
                <div class="padding-none posi-search">
                    <div class="top-search-form">
                        <h1 class="banner-caption"><?php echo translate("Thailand's for Vehicles");?></h1>
                        <p class="small_para"><?php echo translate("Lorem ipsum dolor sit amet, consectetur adipiscing elit");?></p>
                        <div class="search-sec inner">
                            <div class="input-group">
                                <input name="location" type="text" pattern=".{3,}" id="location" class="form-control" placeholder="<?php echo translate("Enter Location");?>" value="" autocomplete="off">
                                <div class="input-group-append search_btn">
                                    <button class="btn btn-outline-secondary" type="button" onclick="get_filter_products(document.getElementById('location').value);"><img src="images/search.png"></button>
                                </div>
                            </div>
                        </div> 
                    </div>
                </div>
            </section>
        </div>
    </div>