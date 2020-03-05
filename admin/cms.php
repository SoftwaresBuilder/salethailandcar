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
    $sortby = (isset($_SESSION['pagination']['sortby'])) ? $_SESSION['pagination']['sortby'] : "type ASC";
}
$_SESSION['pagination']['sortby'] = ($sortby) ? $sortby : "";

$where = "type!=''";
if ($search_key) {
    $where .= " AND (type LIKE '%" . $search_key . "%')";
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


$sql = "SELECT * FROM " . $tblcms . " where " . $where;
$sql_limit = $sql . " LIMIT $from, " . $max_results;
$cms = sql($sql_limit);
/**************************************************************************/
$total_results = sql("SELECT COUNT(*) as Num FROM " . $tblcms . " where " . $where);
$total_results = (count($total_results)>0)?$total_results[0]['Num']:0;
////////////////////////////////////////////////////
?>
<div class="row">
    <div class="col-md-12">
        <div class="card">
            <div class="row">
                <div class="col-md-12">
                    <h4 class="title">Manage CMS</h4>
                </div>
            </div>
            <div class="row">&nbsp;</div>
            <?php show_errors(); ?>
            <div class="content table-responsive table-full-width">
                <form method="post">
                    <div class="col-md-12" style="border:1px solid #ccc; padding:10px;">
                        <div class="col-md-6">Search Key: <input type="text" name="search_key" placeholder="Type" value="<?= $search_key; ?>" /></div>
                        <div class="col-md-4">
                            Sort By: <select name="sortby">
                                <option <?php if ($sortby == "type asc") { ?> selected="selected" <?php } ?> value="type asc">Type ASC</option>
                                <option <?php if ($sortby == "type desc") { ?> selected="selected" <?php } ?> value="type desc">Type DESC</option>
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
                            <th>Type</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        if (count($cms) > 0) {
                            foreach ($cms as $v) {
                                ?>
                                <tr>
                                    <td><?php echo $v['type']; ?></td>
                                    <td>
                                        <a href="index.php?p=addeditcms&type=<?= $v['type']; ?>" title="Update Record"><i class="fa fa-pencil"></i></a>&nbsp;&nbsp;
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