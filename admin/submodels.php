<?php
$search_key = "";
if (isset($_POST['search_key'])) {
    $search_key = $_POST['search_key'];
    $_SESSION['pagination']['search_key'] = $search_key;
} else {
    $search_key = (isset($_SESSION['pagination']['search_key'])) ? $_SESSION['pagination']['search_key'] : "";
}
$_SESSION['pagination']['search_key'] = ($search_key) ? $search_key : "";

$sortby = "";
if (isset($_POST['sortby'])) {
    $sortby = $_POST['sortby'];
    $_SESSION['pagination']['sortby'] = $sortby;
} else {
    $sortby = (isset($_SESSION['pagination']['sortby'])) ? $_SESSION['pagination']['sortby'] : "id DESC";
}
$_SESSION['pagination']['sortby'] = ($sortby) ? $sortby : "";

$pid = 0;
$cid =0;
if( isset($_GET['id']) ){
    $enc_pid = $_GET['id'];
    $pid = dec_password($_GET['id']);
    $enc_cid = $_GET['cid'];
    $cid = dec_password($_GET['cid']);
}
$parent = get_records($tblcategory_types,"id='".$pid."'");
$where = "type_id='".$pid."' and trash!='1'";
if ($search_key) {
    $where .= " AND (titl_en LIKE '%" . $search_key . "%')";
}
if ($sortby) {
    $where .= " ORDER BY $sortby";
}
///////////// Paging /////////////////////
if (!isset($_GET['pageNo'])) {
    $pageNo = 1;
} else {
    $pageNo = $_GET['pageNo'];
}
$from = (($pageNo * $max_results) - $max_results);


$sql = "SELECT * FROM " . $tblcategory_submodels . " where " . $where;
$sql_limit = $sql . " LIMIT $from, " . $max_results;
$type_submodels = sql($sql_limit);
//pr($categories);
/**************************************************************************/
$total_results = sql("SELECT COUNT(*) as Num FROM " . $tblcategory_submodels . " where " . $where);
$total_results = (count($total_results)>0)?$total_results[0]['Num']:0;
////////////////////////////////////////////////////
?>
<div class="row">
    <div class="col-md-12">
        <div class="card">
            <div class="row">
                <div class="col-md-6">
                    <h4 class="title">Manage SubModels of<?php echo $parent[0]['title_en'];?></h4>
                </div>
                <div class="col-md-6 add_new">
                    <a href="index.php?p=addeditsubmodels&cid=<?= enc_password($pid); ?>">Add Edit Sub Models</a>
                
                </div>
            </div>
            <div class="row">&nbsp;</div>
            <?php show_errors(); ?>
            <div class="content table-responsive table-full-width">
                <form method="post">
                    <div class="col-md-12" style="border:1px solid #ccc; padding:10px;">
                        <div class="col-md-6">Search Key: <input type="text" name="search_key" placeholder="Title" value="<?= $search_key; ?>" /></div>
                        <div class="col-md-4">
                            Sort By: <select name="sortby">
                                <option <?php if ($sortby == "id desc") { ?> selected="selected" <?php } ?> value="id desc">New First</option>
                                <option <?php if ($sortby == "id asc") { ?> selected="selected" <?php } ?> value="id asc">Old First</option>
                                <option <?php if ($sortby == "title asc") { ?> selected="selected" <?php } ?> value="title asc">Title ASC</option>
                                <option <?php if ($sortby == "title desc") { ?> selected="selected" <?php } ?> value="title desc">Title DESC</option>
                            </select>
                        </div>
                        <div class="col-md-2"><input type="submit" name="search" value="Search" /></div>
                    </div>
                </form>
                <div class="col-md-12">&nbsp;</div>
                <div class="col-md-12"><?php include("paginglayout.php"); ?></div>
                <div class="col-md-12">&nbsp;</div>
                <table class="table table-hover table-striped mytable">
                    <thead>
                        <tr>
                            <th>Title</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        if (count($type_submodels) > 0) {
                            foreach ($type_submodels as $v) {
                                ?>
                                <tr>
                                    <td><?php echo $v['title_en']; ?></td>
                                    <td>
                                        <a href="index.php?p=addeditsubmodels&id=<?= enc_password($v['id']); ?>>&cid=<?= enc_password($pid); ?>" title="Update Record"><i class="fa fa-pencil"></i></a>&nbsp;&nbsp;
                                        <a href="javascript:;" onclick="delete_record('process.php?p=delsubmodels&id=<?= enc_password($v['id']);?>');" data-toggle="modal" data-target="#delete" title="Delete Record"><i class="fa fa-trash"></i></a>&nbsp;&nbsp;
                                    </td>
                                </tr>
                        <?php
                            }
                        } else {
                            echo '<tr><td class="err" colspan="9">No record found</td></tr>';
                        }
                        ?>
                        <tr>
                            <td colspan="9"><?php include("paginglayout.php"); ?></td>
                        </tr>
                    </tbody>
                </table>
             </div>
    </div>
    </div>
       
</div>