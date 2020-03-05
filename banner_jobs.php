<link rel="stylesheet" type="text/css" href="css/try.css">

<div class="inner_banner" style="background-image: url(images/jobs.jpg);">
    <!--<div class="bnr-overlay"></div>-->
    <div class="container_fluid">

        <section class="banner-area">
            <div class="padding-none posi-search">
                <div class="top-search-form">
                    <h1 class="banner-caption">Thailand's Home for Real Estate</h1>
                    <p class="small_para">Lorem ipsum dolor sit amet, consectetur adipiscing elit</p>
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
                                            <input type="text" class="form-control" id="job_title" name="title" placeholder="Enter job title" aria-label="Username" aria-describedby="basic-addon1">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6 px-2">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <div class="input-group-append search_btn">
                                                <button class="btn btn-outline-secondary" type="button"><i class="icofont-location-pin"></i></button>
                                            </div>
                                            <input name="location" type="text" pattern=".{3,}" id="location" class="form-control" placeholder="Enter Location" value="" autocomplete="off">
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
                                                <option value="">All jobs</option>
                                             <option value="8">IT And Computer Jobs</option>
                                             <option value="28">Sales And Marketing</option>
                                              <option value="32">Hotels And Tourism</option>
                                              <option value="33">Accounting And Finance</option>
                                              <option value="34">Advertising And PR</option>
                                               <option value="35">Human Resources</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6 px-2">
                                    <div class="form-group">
                                        <div class="row m-0">
                                            <div class="col-sm-3 p-0">
                                                <select class="form-control" id="month_year">
                                                    <option value="">Monthly</option>
                                                    <option value="">Yearly</option>
                                                </select>
                                            </div>
                                            <div class="col-sm-4 p-0">
                                                <div class="select-btn">
                                                    <select class="form-control selectpicker bs-select-hidden" id="min_price" name="min_price">
                                                        <option value="">Min Price</option>
                                 <option value="2500">THB 2500</option>
                                  <option value="2600">THB 2600</option>
                                                            </select>
  
     </div>
    </div>
         <div class="col-sm-5 p-0">
        <div class="select-btn">
         <select class="form-control selectpicker bs-select-hidden" id="max_price" name="max_price" onchange="">
         <option value="">Max Price</option>
         <option value="2500">THB 2500</option>
         <option value="2600">THB 2600</option>
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
                                <button type="button" class="search-btn" onclick="find_filter_jobs();"><img src="images/search.png"> Search</button>
                            </div>
                        </div>
                    </div> 
                </div>
            </div>
        </section>
    </div>
</div>