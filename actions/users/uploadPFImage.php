<?php
	include_once('../../config/init.php');
	include_once($BASE_DIR .'database/users.php');

	$target_dir = $BASE_DIR."images/users";
	$target_file = $target_dir . basename($_FILES["fileToUpload"]["name"]);
	$uploadOk = 1;
	$imageFileType = pathinfo($target_file,PATHINFO_EXTENSION);
	// Check if image file is a actual image or fake image
	if(isset($_POST["submit"])) {
		$check = getimagesize($_FILES["fileToUpload"]["tmp_name"]);
		if($check !== false) {
			$user_id = getUserId($_SESSION['username'])['user_id'];
			changeAvatar($user_id,$target_file);
			$uploadOk = 1;
		} else {
			echo "File is not an image.";
			$uploadOk = 0;
		}
	}
?>