<?php
include_once('../../config/init.php');
include_once($BASE_DIR .'database/users.php');

if (!$_GET['user_id']) {
    $_SESSION['error_messages'][] = 'Undefined user_id';
    header("Location: $BASE_URL");
    exit;
}
$perguntas = getLastPerguntas();

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
