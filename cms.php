<?php
include("header.php");

if(isset($_GET['type']))
{
  $type=$_GET['type']; 
  $record = get_records($tblcms,"type='".$type."'");
}
if( !(count($record)>0) ){
  redirect("index");exit;
}
?>

<div class="container">
  <div class="row section_spacer">
    <div class="col-12">
      <?php echo  $record[0]['content'];?>
    </div>
  </div>
</div>
<?php
include("footer.php");
?>