<?php
include_once('../../config/init.php');
include_once($BASE_DIR .'database/perguntas.php');



if(existsVotoResposta($_GET['user_id'], $_GET['resposta_id'])) {
    updateVotoResposta($_GET['user_id'], $_GET['resposta_id'],$_GET['valor']);
}
else{
    createVotoResposta($_GET['user_id'], $_GET['resposta_id'],$_GET['valor']);
}

echo json_encode(true);
?>
