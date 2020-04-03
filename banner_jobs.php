<link rel="stylesheet" type="text/css" href="css/try.css">

<div class="inner_banner" style="background-image: url(images/jobs.jpg);">
    <!--<div class="bnr-overlay"></div>-->
    <div class="container_fluid">

        <section class="banner-area">
            <div class="padding-none posi-search">
                <div class="top-search-form">
                    <h1 class="banner-caption"><?php echo translate("Thailand's Home for Real Estate");?></h1>
                    <p class="small_para"><?php echo translate("Lorem ipsum dolor sit amet, consectetur adipiscing elit");?></p>
                    <div class="search-sec jbarea inner">
                        <div class="header-job-search">
                                                        <input type="hidden" name="cat_id" value="2">
                            <div class="row">
                                <div class="col-sm-6 px-2">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <div class="input-group-append search_btn">
                                                <button class="btn btn-outline-secondary" type="button"><i class="icofont-search-1"></i></button>
                                            </div>
                                            <input type="text" class="form-control" id="job_title" name="title" placeholder="<?php echo translate("Enter job title");?>" aria-label="Username" aria-describedby="basic-addon1">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6 px-2">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <div class="input-group-append search_btn">
                                                <button class="btn btn-outline-secondary" type="button"><i class="icofont-location-pin"></i></button>
                                            </div>
                                            <input name="location" type="text" pattern=".{3,}" id="location" class="form-control" placeholder="<?php echo translate("Enter Location");?>" value="" autocomplete="off">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6 px-2">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <div class="input-group-append search_btn">
                                                <button class="btn btn-outline-secondary" type="button"><i class="icofont-settings"></i></button>
                                            </div>
                                            <select class="form-control" id="subcategory_jobs" name="subcategory[]" onchange="">
                                                <option value=""><?php echo translate("All jobs");?></option>
                                             <option value="8"><?php echo translate("IT And Computer Jobs");?></option>
                                             <option value="28"><?php echo translate("Sales And Marketing");?></option>
                                              <option value="32"><?php echo translate("Hotels And Tourism");?></option>
                                              <option value="33"><?php echo translate("Accounting And Finance");?></option>
                                              <option value="34"><?php echo translate("Advertising And PR");?></option>
                                               <option value="35"><?php echo translate("Human Resources");?></option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6 px-2">
                                    <div class="form-group">
                                        <div class="row m-0">
                                            <div class="col-sm-3 p-0">
                                                <select class="form-control" id="month_year">
                                                    <option value=""><?php echo translate("Monthly");?></option>
                                                    <option value=""><?php echo translate("Yearly");?></option>
                                                </select>
                                            </div>
                                            <div class="col-sm-4 p-0">
                                                <div class="select-btn">
                                                    <select class="form-control selectpicker bs-select-hidden" id="min_price" name="min_price">
                                                        <option value=""><?php echo translate("Min Price");?></option>
                                 <option value="500"><?php echo translate("THB 500");?></option>
                                  <option value="1000"><?php echo translate("THB 1000");?></option>
                                  <option value="2000"><?php echo translate("THB 2000");?></option>
                                  <option value="3000"><?php echo translate("THB 3000");?></option>
                                  <option value="4000"><?php echo translate("THB 4000");?></option>
                                                            </select>
  
     </div>
    </div>
         <div class="col-sm-5 p-0">
        <div class="select-btn">
         <select class="form-control selectpicker bs-select-hidden" id="max_price" name="max_price" onchange="">
         <option value=""><?php echo translate("Max Price");?></option>
         <option value="500"><?php echo translate("THB 500");?></option>
                                  <option value="1000"><?php echo translate("THB 1000");?></option>
                                  <option value="2000"><?php echo translate("THB 2000");?></option>
                                  <option value="3000"><?php echo translate("THB 3000");?></option>
                                  <option value="4000"><?php echo translate("THB 4000");?></option>
          </select>
                                     </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <input type="hidden" id="limit" name="limit" value="12">
                            <input type="hidden" id="offset" name="offset" value="12">
                            <div class="search-button form_stl">
                                <button type="button" class="search-btn" onclick="find_filter_jobs();"><img src="images/search.png"> <?php echo translate("Search");?></button>
                            </div>
                        </div>
                    </div> 
                </div>
            </div>
        </section>
    </div>
</div>