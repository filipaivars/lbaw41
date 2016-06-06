<title>{$user.username} Edit Question | WalkMeThrough</title>
{include file='common/header.tpl'}

<div class="wrap_0">
    <div class="wrap" style="padding-top: 100px">

        <div class="row" style="padding-left: 20px">
            <div class="col-md-2">
                <img class="avatar" src="../../images/assets/default.png" width="100" height="100"><br>
                <a href="../../pages/users/users.php?user_id={$pergunta.criar_id}">{$pergunta.username}</a><br>
                <div class="perg-data">{$pergunta.created_date}</div>
            </div>
            <div class="col-md-10">
                <a href="../../pages/perguntas/show_pergunta.php?pergunta_id={$pergunta.pergunta_id}">
                    <div class="perg-titulo">
                        {$pergunta.titulo}
                    </div>
                </a>
                <br>
                {$pergunta.conteudo}


                <br><br>
                {foreach $tags as $tag}
                <div class="col-md-1" style="display:flex">
                    <div class="tag-style">
                        {$tag.nome}
                    </div>
                </div>
                {/foreach}
            </div>
        </div>

        <div style="padding-left: 200px; padding-top: 150px">
            <div class="perg-conteudo">
                {$resposta.conteudo}
            </div>
        </div>

        <hr class="style-one">

        <h4>EDIT YOUR ANSWER</h4>
        <div id="{$pergunta.pergunta_id}">
            <form method="post" action="{$BASE_URL}actions/perguntas/update_resposta.php" enctype="multipart/form-data">
                <input type="text" style="display: none" name="resposta_id" value="{$resposta.resposta_id}">
                <input type="text" name="conteudo" value="{$resposta.conteudo}" style="width: 100%; margin-top: 10px; border-style: none; height: 150px;">
                <button type="submit" class="perg-comment"  style="background: none; border: none; color: #e94735; margin-top: 10px">edit</button>
            </form>
        </div>
    </div>
</div>



{include file='common/footer.tpl'}