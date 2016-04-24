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
    $perguntas[0]->comentarios = getPerguntaComentarios($pergunta_id);
    $pergunta = $perguntas[0];



    $tags = getPerguntaTags($pergunta_id);

    $respostas = getPerguntaRespostas($pergunta_id);


    foreach ($respostas as $resposta) {
        $resposta->comentarios = getRespostaComentarios($resposta->resposta_id);
    }




    $smarty->assign('pergunta', $pergunta);
    $smarty->assign('tags', $tags);
    $smarty->assign('respostas', $respostas);


    $smarty->display('perguntas/pergs.tpl');

?>