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

$where = "id>0";
if ($search_key) {
    $where .= " AND (name LIKE '%" . $search_key . "%')";
    $where .=  " AND trash!=1";
}
if ($sortby) {
            $where .=  " AND trash!=1";

    $where .= " ORDER BY $sortby";

}
///////////// Paging /////////////////////
if (!isset($_GET['pageNo'])) {
    $pageNo = 1;
} else {
    $pageNo = $_GET['pageNo'];
}
$from = (($pageNo * $max_results) - $max_results);


 $sql = "SELECT * FROM " . $tblusers . " where " . $where;
$sql_limit = $sql . " LIMIT $from, " . $max_results;
$users = sql($sql_limit);
/**************************************************************************/
$total_results = sql("SELECT COUNT(*) as Num FROM " . $tblusers . " where " . $where);
$total_results = (count($total_results)>0)?$total_results[0]['Num']:0;
////////////////////////////////////////////////////
?>
<div class="row">
    <div class="col-md-12">
        <div class="card">
            <div class="row">
                <div class="col-md-6">
                    <h4 class="title">Manage User</h4>
                </div>
                <div class="col-md-6 add_new">
                    <a href="index.php?p=addedituser">Add New User</a>
                </div>
            </div>
            <div class="row">&nbsp;</div>
            <?php show_errors(); ?>
            <div class="content table-responsive table-full-width">
                <form method="post">
                    <div class="col-md-12" style="border:1px solid #ccc; padding:10px;">
                        <div class="col-md-6">Search Key: <input type="text" name="search_key" placeholder="Name" value="<?= $search_key; ?>" /></div>
                        <div class="col-md-4">
                            Sort By: <select name="sortby">
                                <option <?php if ($sortby == "id desc") { ?> selected="selected" <?php } ?> value="id desc">New First</option>
                                <option <?php if ($sortby == "id asc") { ?> selected="selected" <?php } ?> value="id asc">Old First</option>
                                <option <?php if ($sortby == "fname asc") { ?> selected="selected" <?php } ?> value="fname asc">Name ASC</option>
                                <option <?php if ($sortby == "fname desc") { ?> selected="selected" <?php } ?> value="fname desc">Name DESC</option>
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
                            <th>Name</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>City</th>
                            <th>Address</th>
                            <th>Last Active</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        if (count($users) > 0) {
                            foreach ($users as $v) {
                                $user_status = get_user_status($v['status']);
                                $last_active = "";
                                if($v['login']==1){$last_active = "Online";}
                                else{
                                     $now = time(); // or your date as well
                                      $last_date = strtotime($v['login_time']);
                                      $active_time = $now - $last_date;

                                      $last_active_date = round($active_time / (60 * 60 * 24));
                                     $last_active = $last_active_date.' days ago';
                                }

                                ?>
                                <tr>
                                    <td><?php echo $v['name']; ?></td>
                                    <td><?php echo $v['email']; ?></td>
                                    <td><?php echo $v['phone']; ?></td>
                                    <td><?php echo $v['city']; ?></td>
                                    <td><?php echo $v['address']; ?></td>
                                    <td style="color: green"><?php echo $last_active; ?></td>
                                    <td><?php echo $user_status; ?></td>
                                    <td>
                                        <a href="index.php?p=addedituser&id=<?= enc_password($v['id']); ?>" title="Update Record"><i class="fa fa-pencil"></i></a>&nbsp;&nbsp;
                                        <a href="javascript:;" onclick="delete_record('process.php?p=delusers&id=<?= enc_password($v['id']); ?>');" data-toggle="modal" data-target="#delete" title="Delete Record"><i class="fa fa-trash"></i></a>&nbsp;&nbsp;
                                         <a href="index.php?p=user_info&id=<?= enc_password($v['id']); ?>" title="View Info"><i class="fa fa-eye"></i></a>
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