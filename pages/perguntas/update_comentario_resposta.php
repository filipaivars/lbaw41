<?php
include_once('../../config/init.php');
include_once($BASE_DIR .'database/perguntas.php');


if (!$_GET['resposta_id']) {
    $_SESSION['error_messages'][] = 'Undefined pergunta_id';
    header("Location: $BASE_URL");
    exit;
}

if(!$_SESSION['user_id']) {
    $_SESSION['error_messages'][] = 'User not logged';
    header("Location: $BASE_URL");
    exit;
}

$resposta_id = $_GET['resposta_id'];

$resposta = getResposta($resposta_id);
$comentario = getRespostaComentario($resposta_id,$_SESSION['user_id']);





$smarty->assign('resposta', $resposta);
$smarty->assign('comentario', $comentario);


$smarty->display('perguntas/update_comentario_resposta.tpl');

?>