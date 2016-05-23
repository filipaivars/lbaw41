<?php
include_once('../../config/init.php');
include_once('../../database/users.php');

if (!$_GET['user_id']) {
    $_SESSION['error_messages'][] = 'Undefined id';
    header("Location: $BASE_URL");
    exit;
}

$user_id = $_GET['user_id'];
$username = getUserInfo($user_id)[0];
$avatar = getUserInfo($user_id)[1];
$created_date = getUserInfo($user_id)[2];
$about = getUserInfo($user_id)[3];


/*foreach ($tweets as $key => $tweet) {
  unset($photo);
  if (file_exists($BASE_DIR.'images/users/'.$tweet['username'].'.png'))
    $photo = 'images/users/'.$tweet['username'].'.png';
  if (file_exists($BASE_DIR.'images/users/'.$tweet['username'].'.jpg'))
    $photo = 'images/users/'.$tweet['username'].'.jpg';
  if (!$photo) $photo = 'images/assets/default.png';
  $tweets[$key]['photo'] = $photo;
}*/


//$smarty->assign('perguntas', $perguntas);
$smarty->display('users/users.tpl');
?>
