<?php
include_once('../../config/init.php');
include_once($BASE_DIR .'database/users.php');
include_once($BASE_DIR .'database/perguntas.php');



if(!$_SESSION['username']) {
    $_SESSION['error_messages'][] = 'User needs to login in order to update a comment';
    header('Location: ' . $_SERVER['HTTP_REFERER']);
    exit;
}

if(!$_POST['conteudo'] || !$_POST['resposta_id']) {
    $_SESSION['error_messages'][] = 'Missing form values';
    header('Location: ' . $_SERVER['HTTP_REFERER']);
    exit;
}



$resposta_id = $_POST['resposta_id'];
$conteudo = $_POST['conteudo'];

$user_id = getUserId($_SESSION['username'])['user_id'];

updateCommentAwnser($conteudo,$user_id,$resposta_id);

$pergunta_id = getResposta($resposta_id)['pergunta_id'];

header('Location: ' . $BASE_URL . 'pages/perguntas/show_pergunta.php?pergunta_id='. $pergunta_id);

?>