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
    $sortby = (isset($_SESSION['pagination']['sortby'])) ? $_SESSION['pagination']['sortby'] : "";
}
$_SESSION['pagination']['sortby'] = ($sortby) ? $sortby : "";

$where = "trash='0'";
if ($search_key) {
    $where .= " AND (title LIKE '%" . $search_key . "%')";
}
if ($sortby) {
    $where .= " ORDER BY $sortby";
}
/////////////////////////////////////////
///////////// Paging /////////////////////
if (!isset($_GET['pageNo'])) {
    $pageNo = 1;
} else {
    $pageNo = $_GET['pageNo'];
}
$from = (($pageNo * $max_results) - $max_results);
$sql = "SELECT * FROM " . $tblnews . " where " . $where;
$sql_limit = $sql . " LIMIT $from, " . $max_results;
$news = sql($sql_limit);
/**************************************************************************/
$total_results = sql("SELECT COUNT(*) as Num FROM " . $tblnews . " where " . $where);
$total_results = (count($total_results)>0)?$total_results[0]['Num']:0;
////////////////////////////////////////////////////
?>
<div class="row">
    <div class="col-md-12">
        <div class="card">
            <div class="header">
                <div class="col-md-6">
                    <h4 class="title">Manage News</h4>
                </div>
                <div class="col-md-6 add_new">
                    <a href="index.php?p=addeditnews">Add News</a>
                </div>
            </div>
            <?php show_errors(); ?>
            <div class="content table-responsive table-full-width">
                <form method="post">
                    <div class="col-md-12" style="border:1px solid #ccc; padding:10px;">
                        <div class="col-md-6">Search Key: <input type="text" name="search_key" placeholder="News" value="<?= $search_key; ?>" /></div>
                        <div class="col-md-4">
                            Sort By: <select name="sortby">
                                <option <?php if ($sortby == "id desc") { ?> selected="selected" <?php } ?> value="id desc">New First</option>
                                <option <?php if ($sortby == "id asc") { ?> selected="selected" <?php } ?> value="id asc">Old First</option>
                                <option <?php if ($sortby == "title asc") { ?> selected="selected" <?php } ?> value="title asc">Name ASC</option>
                                <option <?php if ($sortby == "title desc") { ?> selected="selected" <?php } ?> value="title desc">Name DESC</option>
                            </select>
                        </div>
                        <div class="col-md-2"><input type="submit" name="search" value="Search" /></div>
                    </div>
                </form>
                <div class="col-md-12">&nbsp;</div>
                <table class="table table-hover table-striped mytable">
                    <thead>
                        <tr>
                            <th>Image</th>
                            <th>News</th>
                            <th>Detail</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        if (count($news) > 0) {
                            foreach ($news as $v) {
                                $news_status = get_news_status($v['status']);
								$news_img = get_news_img($v['img']);
                                ?>
                                <tr>
                                    <td><img src="<?php echo $news_img;?>" class="news_thumb" /></td>
                                    <td><?php echo $v['title_'.$lang]; ?></td>
                                    <td><?php echo $v['description']; ?></td>
                                    <td><?php echo $news_status; ?></td>
                                    <td>
                                        <a href="index.php?p=addeditnews&id=<?= enc_password($v['id']); ?>" title="Update Record"><i class="fa fa-pencil"></i></a>&nbsp;&nbsp;
                                        <a href="javascript:;" onclick="delete_record('process.php?p=delnews&id=<?= enc_password($v['id']); ?>');" data-toggle="modal" data-target="#delete" title="Delete Record"><i class="fa fa-trash"></i></a>
                                    </td>
                                </tr>
                        <?php
                            }
                        } else {
                            echo '<tr><td class="err" colspan="5">No record found</td></tr>';
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
