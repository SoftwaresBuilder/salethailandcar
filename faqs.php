<?php
include("header.php");

$faq = get_records($tblfaq,"status='1' and trash='0'","id DESC");
?>

<div class="container">
  <div class="row section_spacer">
    <div class="col-12 heading mb50">FAQs</div>
    <div class="col-12">
      <div id="accordion">
        <?php
        if(count($faq)>0){
          foreach ($faq as $key => $v) {
          ?>
          <div class="card">
            <div class="card-header" id="heading<?= $key;?>">
              <h5 class="mb-0">
                <button class="faq collapsed" data-toggle="collapse" data-target="#collapse<?= $key;?>" aria-expanded="false" aria-controls="collapse<?= $key;?>">
                  <?php echo $v['title_'.$lang];?>
                </button>
              </h5>
            </div>
            <div id="collapse<?= $key;?>" class="collapse" aria-labelledby="heading<?= $key;?>" data-parent="#accordion">
              <div class="card-body">
                <?php echo $v['description_'.$lang];?>
              </div>
            </div>
          </div>
          <?php
          }
        }
        ?>
      </div>
    </div>
  </div>
</div>
<?php
include("footer.php");
?>