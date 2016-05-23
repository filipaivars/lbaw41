<?php
  include_once('../../config/init.php');
  include_once($BASE_DIR .'database/users.php');
  include_once($BASE_DIR .'database/perguntas.php');



  if(!$_SESSION['username']) {
    $_SESSION['error_messages'][] = 'User needs to login in order to make a question';
    header('Location: ' . $_SERVER['HTTP_REFERER']);
    exit;
  }

   if(!$_POST['conteudo'] || !$_POST['pergunta_id']) {
     $_SESSION['error_messages'][] = 'Missing form values';
     header('Location: ' . $_SERVER['HTTP_REFERER']);
     exit;
   }



  $pergunta_id = $_POST['pergunta_id'];
  $conteudo = $_POST['conteudo'];

  $user_id = getUserId($_SESSION['username'])['user_id'];

  createAnswer($conteudo,$user_id,$pergunta_id);

  header('Location: ' . $_SERVER['HTTP_REFERER']);

?>