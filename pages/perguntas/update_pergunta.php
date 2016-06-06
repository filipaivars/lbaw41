<?php
include_once('../../config/init.php');
include_once($BASE_DIR .'database/perguntas.php');


if (!$_GET['pergunta_id']) {
    $_SESSION['error_messages'][] = 'Undefined pergunta_id';
    header("Location: $BASE_URL");
    exit;
}

$pergunta_id = $_GET['pergunta_id'];


$perguntas = getPergunta($pergunta_id);
$pergunta = $perguntas[0];

$pergunta["comentarios"] = getPerguntaComentarios($pergunta["pergunta_id"]);





$tags = getPerguntaTags($pergunta_id);

$respostas = getPerguntaRespostas($pergunta_id);

for ($i = 0; $i < count($respostas); $i++) {
    $respostas[$i]["comentarios"] = getRespostaComentarios($respostas[$i]["resposta_id"]);
}


$smarty->assign('pergunta', $pergunta);
$smarty->assign('tags', $tags);
$smarty->assign('respostas', $respostas);


$smarty->display('perguntas/update_pergunta.tpl');

?>