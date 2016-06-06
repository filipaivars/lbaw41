<?php
include_once('../../config/init.php');
include_once($BASE_DIR .'database/users.php');



if(!$_SESSION['username']) {
    $_SESSION['error_messages'][] = 'User needs to login in order to update an answer';
    header('Location: ' . $_SERVER['HTTP_REFERER']);
    exit;
}

if(!$_POST['user_id'] || !$_POST['about']) {
    $_SESSION['error_messages'][] = 'Missing form values';
    header('Location: ' . $_SERVER['HTTP_REFERER']);
    exit;
}

if($_POST['user_id'] != $_SESSION['user_id']) {
    $_SESSION['error_messages'][] = 'Can only change your own profile';
    header('Location: ' . $_SERVER['HTTP_REFERER']);
    exit;
}



$user_id = $_POST['user_id'];
$about = $_POST['about'];




updateAbout($user_id,$about);


header('Location: ' . $_SERVER['HTTP_REFERER']);

?>