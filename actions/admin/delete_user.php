<?php
include_once('../../config/init.php');
include_once($BASE_DIR .'database/users.php');





if(!$_SESSION['admin']) {
    $_SESSION['error_messages'][] = 'Admin needs to login in order to make anything';
    header('Location: ' . $_SERVER['HTTP_REFERER']);
    exit;
}

if(!$_GET['user_id']) {
    $_SESSION['error_messages'][] = 'Input error';
    header('Location: ' . $_SERVER['HTTP_REFERER']);
    exit;
}




$userid = $_GET['user_id'];
$_SESSION['success_messages'][] = 'Delete successful';
deleteUser($userid);



header('Location: ' . $_SERVER['HTTP_REFERER']);

?>