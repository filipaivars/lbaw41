<?php
include_once('../../config/init.php');
include_once($BASE_DIR .'database/perguntas.php');


if (!$_GET['pergunta_id']) {
    $_SESSION['error_messages'][] = 'Undefined pergunta_id';
    header("Location: $BASE_URL");
    exit;
}

/*if(!$_SESSION['user_id']) {
    $_SESSION['error_messages'][] = 'User not logged';
    header("Location: $BASE_URL");
    exit;
}*/

$pergunta_id = $_GET['pergunta_id'];

$pergunta = getPergunta($pergunta_id);
$comentario = getPerguntaComentario($pergunta_id,$_SESSION['user_id']);



$tags = getPerguntaTags($pergunta_id);




$smarty->assign('pergunta', $pergunta);
$smarty->assign('comentario', $comentario);
$smarty->assign('tags', $tags);


$smarty->display('perguntas/update_comentario_pergunta.tpl');

?>