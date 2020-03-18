<?php
include("header.php");
$id = 0;
if(isset($_GET['id'])){
  $id = dec_password($_GET['id']);
}
$news = get_records($tblnews,"id='".$id."' and status='1' and trash='0'");
if(!(count($news)>0)){
  redirect("search");exit;
}
$imgs = get_upload_img($news[0]['img']);
?>

<div class="container">
<div class="row section_spacer">
    <div class="col-12 col-md-5">
        <img src="<?php echo $imgs;?>" class="img-fluid"/>
    </div>
    <div class="col-12 col-md-7">
      <div class="row">
        <div class="col-12">
          <span class="heading"><?php echo $news[0]['title_'.$lang];?></span>
        </div>
        <div class="col-12 mt10 mb10">
          <span class="small_text"><?php echo $news[0]['created_date'];?></span>
        </div>
        <div class="col-12 mt10"><?php echo $news[0]['description_'.$lang];?></div>
      </div>
    </div>
</div>
</div>
<?php
include("footer.php");
?>