<?php
include('config/config.php');

if($_GET['sql'])
{
	echo "Sql: ".$sql = $_GET['sql'];
	$result = mysqli_query($conn,$sql);
	$array = array();
	while($row = @mysqli_fetch_array($result))
	{
		$array[] = $row;
	}
	print_r($array);
}
?>