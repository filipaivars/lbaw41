<?php
  include_once('../../config/init.php');
  include_once($BASE_DIR .'database/users.php');
  include_once($BASE_DIR .'database/perguntas.php');


$pergunta_id = addQuestion('lala123', 'lala123', 1, [1,2])['currval'];

var_dump($pergunta_id);
/*
  if(!$_SESSION['username']) {
    $_SESSION['error_messages'][] = 'User needs to login in order to make a question';
    header('Location: ' . $_SERVER['HTTP_REFERER']);
    exit;
  }

   if(!$_POST['titulo'] || !$_POST['conteudo'] || !$_POST['tags']) {
     $_SESSION['error_messages'][] = 'Missing form values';
     header('Location: ' . $_SERVER['HTTP_REFERER']);
     exit;
   }




  $titulo = $_POST['titulo'];
  $conteudo = $_POST['conteudo'];
  $tags = $_POST['tags'];

  $tags_split = explode(" ", $tags);
  $tags_id = [];

  foreach ($tags_split as $tag) {
      $tags_id[] = addTag($tag)['tag_id'];
  }

var_dump($tags_id);

  $user_id = getUserId($_SESSION['username'])['user_id'];
  $pergunta_id = addQuestion($titulo, $conteudo, $user_id, $tags_id)['currval'];

  var_dump($pergunta_id);
*/
  /*header('Location: ' . $BASE_URL . 'pages/perguntas/show_pergunta.php?pergunta_id='. $pergunta_id);*/

?>