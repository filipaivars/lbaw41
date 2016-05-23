<?php
include_once('../../config/init.php');
include_once('../../database/users.php');

if (!$_GET['user_id']) {
    $_SESSION['error_messages'][] = 'Undefined id';
    header("Location: $BASE_URL");
    exit;
}

$user_id = $_GET['user_id'];
$user = getUserInfo($user_id)[0];


$smarty->assign('user', $user);
$smarty->display('users/users.tpl');
?>
