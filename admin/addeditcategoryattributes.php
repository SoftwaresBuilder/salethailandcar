<?php
$id = '';
if(isset($_GET['id']))
{
    $tblname = "";
    $select_name ="";
    $id = dec_password($_GET['id']);
    $att = $_GET['att'];
    if($att=='f'){$tblname=$tblcategory_features;$select_name="Select Feature";}
    if($att=='t')
    {
        $tblname=$tblcategory_types;
        $select_name="Select Type";
    }
    if($att=='m'){$tblname=$tblcategory_models;$select_name="Select Model";}
    $record = get_records($tblname,"category_id='".$id."'");
    if(isset($record[0])){
        foreach ($record[0] as $k => $v )
        {
            $_SESSION['sysData'][$k] = stripslashes($v);
        }
    }
}
else if(!isset($_SESSION['sysData']['id'])) {
    $_SESSION['sysData'] = table_fields($tblcategories);
}
?>
<form action="process.php?p=addeditcategoryattributes" enctype="multipart/form-data" method="post">
<div class="row">
    <div class="col-md-12">
        <div class="card">
            
                <div class="header">
                    <h4 class="title">Add/Edit Category Attributes</h4>
                </div>
                <?php show_errors();?>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label><?php echo $select_name; ?></label>
                            <select onchange="get_attribute_val(this.value);" class="form-control" id="cat_attributes" name="cat_attributes">
                                <option><?php echo $select_name; ?></option>
                                <?php
                                if(count($record)>0){
                                    foreach ($record as $v) {
                                    ?>
                                        <option value="<?php echo $v['id'];?>"><?php echo $v['title_en'];?></option>
                                    <?php
                                    }
                                }
                                ?>
                            </select>
                        </div>
                    </div>
                     <div class="col-md-6">
                        <div class="form-group" id="cat_submodels_div" style="display: none;">
                            <label>Select SubModels</label>
                            <select class="form-control" id="cat_submodels" name="cat_submodels">
                                <option>Select Sub Model</option>
                            </select>
                        </div>
                    </div>
                     
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Add New / Edit <span class="err">*</span></label>
                            <input oninput="myFunction('title_th')" onfocusout="translate_into_thai($('#title_en').val(),'title_th')" type="text" class="form-control" id="title_en" name="title_en" placeholder="title" value="">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Title Thai <span class="err">*</span></label>
                            <input type="text" class="form-control" id="title_th" name="title_th" placeholder="title" value="">
                        </div>
                    </div>
                    
                </div>
                    
                <input type="hidden" name="cat_id" id="cat_id" value="<?php echo enc_password($v['category_id']); ?>" />
                <input type="hidden" name="tblname" id="tblname" value="<?php echo $tblname; ?>" />
                <button type="submit" class="btn btn-info btn-fill" name="submit">Submit</button>
           
           <div class="clearfix"></div>
       </div>
   </div>
   </div>
</form>