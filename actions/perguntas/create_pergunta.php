<?php
  include_once('../../config/init.php');
  include_once($BASE_DIR .'database/users.php');
  include_once($BASE_DIR .'database/perguntas.php');


  if(!$_SESSION['username']) {
    $_SESSION['error_messages'][] = 'User needs to login in order to make a question';
    header('Location: ' . $_SERVER['HTTP_REFERER']);
    exit;
  }
/*
  if (!$_POST['username'] || !$_POST['password']) {
    $_SESSION['error_messages'][] = 'Invalid login';
    $_SESSION['form_values'] = $_POST;
    header('Location: ' . $_SERVER['HTTP_REFERER']);
    exit;
  }
*/

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
      $tags_id[] = addTag($tag);
  }

  $pergunta_id = addQuestion($titulo, $conteudo, getUserId($_SESSION['username']), $tags_id);

  var_dump($pergunta_id);

  /*header('Location: ' . $BASE_URL . 'pages/perguntas/show_pergunta.php?pergunta_id='. $pergunta_id);*/

?>