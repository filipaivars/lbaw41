<?php
include_once('../../config/init.php');
include_once($BASE_DIR .'database/users.php');

if (!$_GET['user_name']) {
    $_SESSION['error_messages'][] = 'Undefined username';
    header("Location: $BASE_URL");
    exit;
} else {
    $username = $_GET['username'];
    $user_id = getUserInfo($username)[0];
    $avatar = getUserInfo($unsername)[1];
    $created_date = getUserInfo($username)[2];
    $about = getUserInfo($username)[3];
}



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
