<?php
include_once('../../config/init.php');
include_once($BASE_DIR .'database/perguntas.php');


if (!$_GET['resposta_id']) {
    $_SESSION['error_messages'][] = 'Undefined resposta_id';
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
$pergunta = getPergunta($resposta['pergunta_id'])[0];



$tags = getPerguntaTags($resposta['pergunta_id']);


$smarty->assign('pergunta', $pergunta);
$smarty->assign('resposta', $resposta);
$smarty->assign('tags', $tags);


$smarty->display('perguntas/update_resposta.tpl');

?>