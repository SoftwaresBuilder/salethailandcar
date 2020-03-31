<?php
include('header.php');
$id = 0;
if(isset($_REQUEST['id'])){
    $id = dec_password($_REQUEST['id']);
}
$packages = get_records($tblvendor_packages,"id='".$id."' and status='1' and trash='0'");
?>
<div class="container">
    <div class="section_spacer">
        <div class="row register justify-content-center">
            <?php
                $category_name = get_records($tblcategories,"id='".$packages[0]['category']."' and trash!='1'");
                $cat_id =$packages[0]['category'];
                ?>
                <div class="col-4">
                    <div class="row packages">
                        <div class="col-12 center"><?php echo $packages[0]['title_'.$lang];?></div>
                        <div class="col-12 center"><?php echo $category_name[0]['title_'.$lang];?></div>
                        <div class="col-12 center"><?php echo show_price($packages[0]['price']);?></div>
                        <div class="col-12 center"><?php echo translate("Post Ads");?> <?php echo $packages[0]['post_ads'];?></div>
                        <div class="col-12 center"><?php echo translate("Bump Ups");?> <?php echo $packages[0]['bump_up'];?></div>
                        <div class="col-12 center"><?php echo translate("Social Media Ads");?> <?php echo $packages[0]['social_media_ads'];?></div>
                        <div class="col-12 center"><?php echo translate("Feature Ads");?> <?php echo $packages[0]['feature_ads'];?></div>
                        <div class="col-12 center"><?php echo translate("Expiry Days");?> <?php echo $packages[0]['expiry_days'];?></div>
                        <!-- <div class="col-12 center last"><a href="process.php?p=get_package&id=<?php echo enc_password($packages[0]['id']);?>" class="btn btn-primary"><?php echo translate("Get Package");?></a></div> -->
                    </div>
                </div>
                <div class="col-6">
                    <form action="process.php?p=get_package" method="post">
                <?php show_errors();?>
                    <div class="row form_fields">
                        <div class="col-md-3"><?php echo translate("Enter Code");?></div>
                        <div class="col-md-6">
                        <div class="form-group">
                           <input type="text" class="form-control" id="code" name="code" placeholder="" value="">
                        </div>
                        </div>
                        <div class="col-md-2">
                        <div class="form-group">
                          <a class="btn btn-primary" href="javascript:;" onclick="code_valid($('#code').val(),'<?php echo $cat_id; ?>')">Validate</a>
                        </div>
                        </div>
                    </div>
                    <div class="row form_fields">
                        <div class="col-md-3"></div>
                        <div class="col-md-8">
                            <div class="form-group">
                                <p id="code_valid" style="font-size: 20px"></p>
                            </div>
                        </div>
                    </div>
                    <div class="row form_fields">
                        <div class="col-md-3"></div>
                        <div class="col-md-8">
                            <div class="form-group">
                                <input type="hidden" name="id" value="<?php echo enc_password($packages[0]['id']);?>">
                                <input type="hidden" id="code_used" name="code_used" value="">
                                <input type="hidden" id="coupon_code" name="coupon_code" value="">
                                <input type="submit" name="submit" class="btn btn-primary" value="<?php echo translate("Get Package");?>">
                            </div>
                        </div>
                    </div>
            </form>
                </div>
                <div class="col-2"></div>
        </div>
    </div>
</div>
<?php include('footer.php'); ?>
<script type="text/javascript">
    function code_valid(val,cat_id){
        if(val==""){
            $("#code_valid").html('Please Entr Code');
        }
        else{
          $.ajax({
            method: "POST",
            url: "ajaxphp.php?p=code_validate",
            data: { val: val,cat_id:cat_id }
          })
          .done(function( msg ) {
            if(msg=='Valid'){
                $("#code_used").val('1');
                $("#coupon_code").val(val);
            }
            $("#code_valid").html(msg);
          });
      }
    }
</script>