<?php
include_once($BASE_DIR .'config/init.php');
include_once($BASE_DIR .'database/perguntas.php');

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


$smarty->assign('perguntas', $perguntas);
$smarty->display('home/home.tpl');
?>
