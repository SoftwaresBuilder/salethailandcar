<?php include'header.php';

$id = 0;
if(isset($_GET['id'])){
    $enc_id = $_GET['id'];
    $id = enc_password($enc_id);
    $product = get_records($tblproducts,"id='".$id."'");
    if(count($product)>0){
        foreach ($product as $k=>$v) {
            $_SESSION['sysData'][$k] = $v;
        }
    }
} else{
    $user = get_records($tblusers ,"id='".$user_id."'");
    if(count($user)>0 and $user[0]['post_ads']<1){
        $_SESSION['sysErr']['msg'] = "Please refill your post ads limit";
        redirect("dashboard","?tab=packages");
        exit;
    }
}
if(!isset($_SESSION['sysData']['title'])) {
    $_SESSION['sysData'] = table_fields($tblproducts);
}

$category = get_records($tblcategories,"pid='0' and status='1' and trash='0'","title ASC");
$subcategory = get_records($tblcategories,"pid='".$category[0]['id']."' and status='1' and trash='0'","title ASC");

?>
<script type="text/javascript">
    function cat_div_show(){
        $("#select_Category_div").show("slow");
    }
    function hide_div(){
        $("#select_Category_div").hide("slow");
    }
</script>
<style type="text/css">
    .form_fields{
        margin-bottom: 20px;
    }
 #select_Category_div{
    display: none; 
    z-index: 2;
    position: fixed;
    top: 25px;
    bottom: 10px;
    left: 20%;
    height: 85%;
    width: 60%;
    overflow: auto;
</style>

<div class="container">
    <div class="row">
        <div class="col-md-9">
    <div class="section_spacer">
        <?php show_errors();?>
        <div class="row">
            <div class="col-12 heading">Post a Free Classified Ad</div>
        </div>
        <form action="process.php?p=add_product" enctype="multipart/form-data" method="post">
            <?php show_errors();?>
           
                <div class="row form_fields">
                    <div class="col-md-3">Ad Type</div>
                    <div class="col-md-3">
                    <div class="form-check form-check-inline">
                        <label class="form-check-label">
                            <input class="form-check-input" type="radio" name="AdsForm[ad_type]" id="inlineRadio1" value="Private"> <span class="light-text-1">Private</span>
                        </label>
                    </div>
                    <div class="form-check form-check-inline">
                        <label class="form-check-label">
                            <input class="form-check-input" type="radio" name="AdsForm[ad_type]" id="inlineRadio2" value="Business"> <span class="light-text-1">Business</span>
                        </label>
                    </div>
                    </div>
                </div>
                <div class="row form_fields">
                    <div class="col-md-3">Add Title</div>
                    <div class="col-md-8">
                    <div class="form-group">
                       
                        <input type="text" required class="form-control" id="title" name="title" placeholder="" value="<?= $_SESSION['sysData']['title'];?>">
                    </div>
                    </div>
                </div>
                 <div class="row form_fields">
                    <div class="col-md-3">Ad Description</div>
                    <div class="col-md-8">
                    <div class="form-group">
                        
                        <textarea class="form-control" rows="3" id="description" name="description" placeholder=""><?= $_SESSION['sysData']['description'];?></textarea>
                    </div>
                    </div>
                </div>
                <div class="row form_fields">
                    <div class="col-md-3">Category</div>
                    <div class="col-md-8">
                    <button type="button" onclick="cat_div_show();" href="#" data-toggle="modal" class="btn btn-success btn-lg">Select Category</button>
                    </div>
                </div>
                <div class="row form_fields">
                    <div class="col-md-3">For</div>
                    <div class="col-md-8">
                   <select required class="form-control" id="type" name="type">
                            <option value="">Select Type</option>
                           
                        </select>
                    </div>
                </div>
                <div class="row form_fields">
                    <div class="col-md-3">Price</div>
                    <div class="col-md-8">
                        <div class="input-group-prepend">
                                        <span class="input-group-text" id="basic-adon1"></span>
                                        
                   <input type="text" required class="form-control" id="price" name="price" placeholder="Price" value=""></div>
                    </div>
                </div>
                <div class="row form_fields">
                    <div class="col-md-3">Picture</div>
                    <div class="col-md-8">
                        <div style="background-color:#dcdee6;height: 300px; width: 100%;">
                        <img id="blah" onclick="" alt="" width="100%" height="300px" /></div>

        <input type="file"  onchange="document.getElementById('blah').src = window.URL.createObjectURL(this.files[0])">
                    </div>
                </div>
                 <div class="row form_fields">
                    <div class="col-md-3">Address</div>
                    <div class="col-md-8">
                         <input type="text" required class="form-control" id="title" name="title" placeholder="" value="<?= $_SESSION['sysData']['title'];?>">
                    </div>
                </div>

               
                
                
         <div class="col-md-12"><?php include("gmap.php");?></div>
 
        </form>
    </div>
</div> 
<div class="col-md-3" style="margin-top: 30px;">
      
      <div class="col-12 heading">Post a Free Classified  </div>
      
            <p class="light-text-0">
                Post your free online classified ads with us. Lorem ipsum dolor sit amet, consectetur
                        adipiscing elit.            </p>
            

            <div class="card bg-transparent mt-3">
                <div class="card-body">
                    <h5 class="card-title light-text-1 mt-3">
                        How to sell quickly?
                    </h5>
                    <ul class="list-unstyled">
                        <li class="text-secondary list-item"> <i class="fa fa-check"></i> Use a brief title and description of the item </li>
                        <li class="text-secondary list-item"> <i class="fa fa-check"></i>  Make sure you post in the correct category</li>
                        <li class="text-secondary list-item"> <i class="fa fa-check"></i>  Add nice photos to your ad</li>
                        <li class="text-secondary list-item"> <i class="fa fa-check"></i>  Put a reasonable price</li>
                        <li class="text-secondary list-item"> <i class="fa fa-check"></i>  Check the item before publish</li>

                    </ul>
                    <a href="" class="btn btn-success btn-sm" style="margin-top: 10px">View Details</a>
                
            </div>
        </div>
    </div>
</div> 
   
    </div>


<!-- ------------- -->
<div class="modal-content" id="select_Category_div" style="display: none;">
            <div class="modal-header">
                <h4 class="modal-title light-text-1">
                    Select Category                </h4>

                <button type="button" onclick="hide_div();" class="close" data-dismiss="modal">
                    <span aria-hidden="true">×</span>
                    <span class="sr-only">Close</span>
                </button>
            </div>
           <div class="row">
              
                <?php foreach ($category as $key => $value){  ?>
                 <div class="col-md-3">
               <div class="modal-body">
                <div id="post-from-modal-cat" class="row">
                                <div class="col-12" align="center">
                <div class="card bg-transparent mt-3">
                    <div class="card-body">
                        <h5 class="card-title light-text-1 mt-3">
                            <i class="pe-7s-box1 ln-shadow"></i>
                        </h5>
                        <p class="text-secondary">
                            <?php echo $value['title']; ?>                        </p>
                        <a href="javascript:void(0)" class="postFormCat_list btn btn-success card-link" value="<?php echo $value['id']; ?>">
                            Select
                        </a>
                    </div>
                </div>
            </div>
             </div>
         </div>
     </div>
          <?php  } ?> 
           </div>
            
            <div class="modal-body">
                <div id="post-from-modal-cat" class="row hidden">
                                <div class="col-3" align="center">
                <div class="card bg-transparent mt-3">
                    <div class="card-body">
                        <h5 class="card-title light-text-1 mt-3">
                            <i class="pe-7s-box1 ln-shadow"></i>
                        </h5>
                        <p class="text-secondary">
                            Second Hand                        </p>
                        <a href="javascript:void(0)" class="postFormCat_list btn btn-success card-link" data-postform-cat="1" data-postform-cat-name="Second Hand" data-postform-cat-icon="pe-7s-box1">
                            Select
                        </a>
                    </div>
                </div>
            </div>
                        <div class="col-3" align="center">
                <div class="card bg-transparent mt-3">
                    <div class="card-body">
                        <h5 class="card-title light-text-1 mt-3">
                            <i class="pe-7s-study ln-shadow"></i>
                        </h5>
                        <p class="text-secondary">
                            Jobs                        </p>
                        <a href="javascript:void(0)" class="postFormCat_list btn btn-success card-link" data-postform-cat="2" data-postform-cat-name="Jobs" data-postform-cat-icon="pe-7s-study">
                            Select
                        </a>
                    </div>
                </div>
            </div>
                        <div class="col-3" align="center">
                <div class="card bg-transparent mt-3">
                    <div class="card-body">
                        <h5 class="card-title light-text-1 mt-3">
                            <i class="fa fa-paw ln-shadow"></i>
                        </h5>
                        <p class="text-secondary">
                            Pets                        </p>
                        <a href="javascript:void(0)" class="postFormCat_list btn btn-success card-link" data-postform-cat="4" data-postform-cat-name="Pets" data-postform-cat-icon="fa fa-paw">
                            Select
                        </a>
                    </div>
                </div>
            </div>
                        <div class="col-3" align="center">
                <div class="card bg-transparent mt-3">
                    <div class="card-body">
                        <h5 class="card-title light-text-1 mt-3">
                            <i class="pe-7s-car ln-shadow"></i>
                        </h5>
                        <p class="text-secondary">
                            Vehicle                        </p>
                        <a href="javascript:void(0)" class="postFormCat_list btn btn-success card-link" data-postform-cat="5" data-postform-cat-name="Vehicle" data-postform-cat-icon="pe-7s-car">
                            Select
                        </a>
                    </div>
                </div>
            </div>
                        <div class="col-3" align="center">
                <div class="card bg-transparent mt-3">
                    <div class="card-body">
                        <h5 class="card-title light-text-1 mt-3">
                            <i class="pe-7s-home ln-shadow"></i>
                        </h5>
                        <p class="text-secondary">
                            Real Estate                        </p>
                        <a href="javascript:void(0)" class="postFormCat_list btn btn-success card-link" data-postform-cat="6" data-postform-cat-name="Real Estate" data-postform-cat-icon="pe-7s-home">
                            Select
                        </a>
                    </div>
                </div>
            </div>
                        <div class="col-3" align="center">
                <div class="card bg-transparent mt-3">
                    <div class="card-body">
                        <h5 class="card-title light-text-1 mt-3">
                            <i class="pe-7s-scissors ln-shadow"></i>
                        </h5>
                        <p class="text-secondary">
                            Fashion                        </p>
                        <a href="javascript:void(0)" class="postFormCat_list btn btn-success card-link" data-postform-cat="10" data-postform-cat-name="Fashion" data-postform-cat-icon="pe-7s-scissors">
                            Select
                        </a>
                    </div>
                </div>
            </div>
                        <div class="col-3" align="center">
                <div class="card bg-transparent mt-3">
                    <div class="card-body">
                        <h5 class="card-title light-text-1 mt-3">
                            <i class="pe-7s-airplay ln-shadow"></i>
                        </h5>
                        <p class="text-secondary">
                            Electronics Goods                        </p>
                        <a href="javascript:void(0)" class="postFormCat_list btn btn-success card-link" data-postform-cat="11" data-postform-cat-name="Electronics Goods" data-postform-cat-icon="pe-7s-airplay">
                            Select
                        </a>
                    </div>
                </div>
            </div>
                            </div>
                <div id="post-from-modal-sub" class="row">

                    <div class="col-lg-12 hidden" id="post-modal-waiting">
                        <div class="card card-default bg-inverse" style="padding: 30px 10px">
                            <div class="card-body" align="center">
                                <p style="font-size: 60px;color: #fff">
                                    <i id="waiting-icon" class="fa fa-circle-o-notch fa-spin"></i>
                                </p>
                                <p style="font-size: 16px;color: #fff" id="waiting-text">
                                    Loading Sub Category...
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-12" id="post-modal-data">
                        <div class="d-flex justify-content-between p-2">
                            <div>
                                <h2 class="catChips light-text-1">Vehicle</h2>
                            </div>
                            <div>
                                <button type="button" class="btn btn-success pull-right" onclick="$('#post-from-modal-sub').addClass('hidden');
                                        $('#post-from-modal-cat').removeClass('hidden');">Back to Main Category <i class="fa fa-arrow-up"></i></button>
                            </div>
                        </div>

                        <ul class="list-group mt-3 list-group-flush pst-modal-subC" id="post-modal-data-list">    <li class="list-group-item">
        <a class="text-secondary" href="javascript:void(0)" onclick="popSubCat_a77('37','Cars');" data-postform-sub="Cars">
            Cars        </a>
    </li>
    <li class="list-group-item">
        <a class="text-secondary" href="javascript:void(0)" onclick="popSubCat_a77('38','Spare Parts');" data-postform-sub="Spare Parts">
            Spare Parts        </a>
    </li>
    <li class="list-group-item">
        <a class="text-secondary" href="javascript:void(0)" onclick="popSubCat_a77('39','Commercial Vehicles');" data-postform-sub="Commercial Vehicles">
            Commercial Vehicles        </a>
    </li>
    <li class="list-group-item">
        <a class="text-secondary" href="javascript:void(0)" onclick="popSubCat_a77('40','Other Vehicles');" data-postform-sub="Other Vehicles">
            Other Vehicles        </a>
    </li>
    <li class="list-group-item">
        <a class="text-secondary" href="javascript:void(0)" onclick="popSubCat_a77('41','Scooter');" data-postform-sub="Scooter">
            Scooter        </a>
    </li>
    <li class="list-group-item">
        <a class="text-secondary" href="javascript:void(0)" onclick="popSubCat_a77('42','Bicycles');" data-postform-sub="Bicycles">
            Bicycles        </a>
    </li>
</ul>
                    </div>

                </div>
            </div>
            
        </div>
<?php include'footer.php';?>