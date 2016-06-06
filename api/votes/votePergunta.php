<?php
include_once('../../config/init.php');
include_once($BASE_DIR .'database/perguntas.php');

getTweetCountAfter($_GET['id']);

if(existsVotoPergunta($_GET['user_id'], $_GET['pergunta_id'])) {
    updateVotoPergunta($_GET['user_id'], $_GET['pergunta_id'],$_GET['valor']);
}
else{
    createVotoPergunta($_GET['user_id'], $_GET['pergunta_id'],$_GET['valor']);
}

echo json_encode(true);
?>
