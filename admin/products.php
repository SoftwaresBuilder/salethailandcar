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

$where = "trash!='1'";
if ($search_key) {
    $where .= " AND (titl LIKE '%" . $search_key . "%')";
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

$sql = "SELECT * FROM " . $tblproducts . " where " . $where;
$sql_limit = $sql . " LIMIT $from, " . $max_results;
$products = sql($sql_limit);
/**************************************************************************/
$total_results = sql("SELECT COUNT(*) as Num FROM " . $tblproducts . " where " . $where);
$total_results = (count($total_results)>0)?$total_results[0]['Num']:0;
////////////////////////////////////////////////////
?>
<div class="row">
    <div class="col-md-12">
        <div class="card">
            <div class="row">
                <div class="col-md-6">
                    <h4 class="title">Manage Products</h4>
                </div>
                <div class="col-md-6 add_new">
                    <a href="index.php?p=addeditproduct">Add New Product</a>
                </div>
            </div>
            <div class="row">&nbsp;</div>
            <?php show_errors(); ?>
            <div class="content table-responsive table-full-width">
                <form method="post">
                    <div class="col-md-12" style="border:1px solid #ccc; padding:10px;">
                        <div class="col-md-6">Search Key: <input type="text" name="search_key" placeholder="Product Name" value="<?= $search_key; ?>" /></div>
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
                            <th>Category</th>
                            <th>Title</th>
                            <th>Description</th>
                            <th>Price</th>
                            <th>Featured</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        if (count($products) > 0) {
                            foreach ($products as $v) {
                                $status = get_product_status($v['status']);
                                $featured = get_product_featured($v['featured']);
                                $category = get_records($tblcategories,"id='".$v['category_id']."'");
                                $category_name = (count($category)>0)?$category[0]['title_en']:'';
                                ?>
                                <tr>
                                    <td><?php echo $category_name; ?></td>
                                    <td><?php echo $v['title_en']; ?></td>
                                    <td><?php echo $v['description_en']; ?></td>
                                    <td><?php echo $v['price']; ?></td>
                                    <td><?php echo $status; ?></td>
                                    <td><?php echo $status; ?></td>
                                    <td>
                                        <a href="index.php?p=addeditproduct&id=<?= enc_password($v['id']); ?>" title="Update Record"><i class="fa fa-pencil"></i></a>&nbsp;&nbsp;
                                        <a href="javascript:;" onclick="delete_record('process.php?p=delproduct&id=<?= enc_password($v['id']);?>');" data-toggle="modal" data-target="#delete" title="Delete Record"><i class="fa fa-trash"></i></a>&nbsp;&nbsp;
                                        <a href="index.php?p=product_images&id=<?= enc_password($v['id']); ?>"><i class="fa fa-image"></i></a>&nbsp;&nbsp;
                                        <a href="product_download.php?id=<?= enc_password($v['id']); ?>" target="_blank"><i class="fa fa-download"></i></a>
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