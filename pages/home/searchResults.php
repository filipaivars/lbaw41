<?php
include_once('../../config/init.php');
include_once($BASE_DIR .'database/perguntas.php');

$search = $_GET['search'];
$perguntas = getSearchResults($search);

for ($i = 0; $i < count($perguntas); $i++) {
    $perguntas[$i]["tags"] = getPerguntaTags($perguntas[$i]["pergunta_id"]);
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
$smarty->display('home/searchResults.tpl');
?>
