<?php
	include_once('../../config/init.php');
	include_once($BASE_DIR .'database/users.php');

	$user_id = getUserId($_SESSION['username'])['user_id'];
	$target_dir = "https://gnomo.fe.up.pt/~lbaw1541/lbaw41/images/users/";
	$target_file = $BASE_DIR . "images/users/" . $user_id . basename($_FILES["fileToUpload"]["name"]);
	$db_dir = $target_dir . $user_id . basename($_FILES["fileToUpload"]["name"]);
	$uploadOk = 1;
	$changeOk = 1;
	$imageFileType = pathinfo($target_file,PATHINFO_EXTENSION);
// Check if image file is a actual image or fake image
	if(isset($_POST["submit"])) {
		$check = getimagesize($_FILES["fileToUpload"]["tmp_name"]);
		if($check !== false) {
			$uploadOk = 1;
		} else {
			echo '<script type="text/javascript">alert("File is not an image.");window.history.go(-1);</script>';
			$uploadOk = 0;
			$changeOk = 0;
		}
	}
// Check if file already exists
	if (file_exists($target_file)) {
		echo '<script type="text/javascript">alert("Sorry, file already exists.");window.history.go(-1);</script>';
		$uploadOk = 0;
	}
// Check file size
	if ($_FILES["fileToUpload"]["size"] > 500000) {
		echo '<script type="text/javascript">alert("Sorry, your file is too large.");window.history.go(-1);</script>';
		$uploadOk = 0;
		$changeOk = 0;
	}
// Allow certain file formats
	if($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg"
	&& $imageFileType != "gif" ) {
		echo '<script type="text/javascript">alert("Sorry, only JPG, JPEG, PNG & GIF files are allowed.");window.history.go(-1);</script>';
		$uploadOk = 0;
		$changeOk = 0;
	}
// Check if $uploadOk is set to 0 by an error
	if ($uploadOk == 0) {
			if($changeOk == 1) {
				$user_id = getUserId($_SESSION['username'])['user_id'];
				changeAvatar($user_id,$db_dir);
			}
// if everything is ok, try to upload file
	} else {
		if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $target_file)) {
			changeAvatar($user_id,$db_dir);
			echo "The file ". basename( $_FILES["fileToUpload"]["name"]). " has been uploaded.";
		} else {
			if($changeOk == 1) {
				$user_id = getUserId($_SESSION['username'])['user_id'];
				changeAvatar($user_id,$db_dir);
			}
			echo '<script type="text/javascript">alert("Sorry, there was an error uploading your file.");window.history.go(-1);</script>';
    }
}
?>