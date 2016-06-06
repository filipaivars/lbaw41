<title>{$user.username} Edit Question | WalkMeThrough</title>
{include file='common/header.tpl'}

<div class="wrap_0">
    <div class="wrap" style="padding-top: 100px">

        <div class="row" style="padding-left: 20px">
            <div class="col-md-2">
                <img class="avatar" src="../../images/assets/default.png" width="100" height="100"><br>
                <a href="../../pages/users/users.php?user_id={$pergunta.criar_id}">{$resposta.username}</a><br>
                <div class="perg-data">{$resposta.created_date}</div>
            </div>
            <div class="col-md-10">
                {$resposta.conteudo}

            </div>
        </div>




        <br>
        <div class="row" style="margin-top: 20px; padding-top: 5px; margin-left: 3px; margin-right: 5px;background-color: #ecf0f1; min-height: 85px">

            <div class="col-md-10">
                <b>{$comentario.username}</b><br>
                {$comentario.conteudo}
            </div>
            <div class="col-md-2">
                {$comentario.created_date}
            </div>
        </div>

        <hr class="style-one">

        <h4>EDIT YOUR ANSWER</h4>
        <div id="{$comentario.resposta_id}">
            <form method="post" action="{$BASE_URL}actions/perguntas/update_comentario_resposta.php" enctype="multipart/form-data">
                <input type="text" style="display: none" name="resposta_id" value="{$resposta.resposta_id}">
                <input type="text" name="conteudo" value="{$comentario.conteudo}" style="width: 100%; margin-top: 10px; border-style: none; height: 150px;">
                <button type="submit" class="perg-comment"  style="background: none; border: none; color: #e94735; margin-top: 10px">edit</button>
            </form>
        </div>
    </div>
</div>



{include file='common/footer.tpl'}