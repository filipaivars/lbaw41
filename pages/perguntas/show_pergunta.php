<?php
include_once('../../config/init.php');
include_once($BASE_DIR .'database/perguntas.php');


if (!$_GET['pergunta_id']) {
    $_SESSION['error_messages'][] = 'Undefined pergunta_id';
    header("Location: $BASE_URL");
    exit;
}

$pergunta_id = $_GET['pergunta_id'];


$pergunta = getPergunta($pergunta_id);

$smarty->assign('pergunta', $pergunta);
$smarty->display('home/home.tpl');





?>