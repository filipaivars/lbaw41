<?php
include_once('../../config/init.php');
include_once($BASE_DIR .'database/perguntas.php');

$perguntas = getLastPerguntas();
for ($i = 0; $i < count($perguntas); $i++) {
    $perguntas[$i]["tags"] = getPerguntaTags($perguntas[$i]["pergunta_id"]);
}

$bestperguntas = getBestPerguntas();

for ($i = 0; $i < count($bestperguntas); $i++) {
    $bestperguntas[$i]["tags"] = getPerguntaTags($bestperguntas[$i]["pergunta_id"]);
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

$smarty->assign('perguntas', $perguntas);
$smarty->assign('bestperguntas', $bestperguntas);
$smarty->display('home/home.tpl');
?>
