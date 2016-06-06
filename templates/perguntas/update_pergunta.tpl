<title>{$user.username} Edit Question | WalkMeThrough</title>
{include file='common/header.tpl'}

<div class="wrap_0">
    <div class="wrap" style="padding-top: 100px">

        <div class="row" style="padding-left: 20px">
            <a href="../../pages/perguntas/show_pergunta.php?pergunta_id={$pergunta.pergunta_id}">
                <div class="perg-titulo">
                    {$pergunta.titulo}
                </div>

            </a>
            {foreach $pergunta.tags as $tag}
            <div class="col-md-1" style="display:flex">
                <div class="tag-style">
                    {$tag.nome}
                </div>
            </div>
            {/foreach}
        </div>

        <hr class="style-one">

        <h4>EDIT YOUR QUESTION</h4>
        <div id="{$pergunta.pergunta_id}">
            <form method="post" action="{$BASE_URL}actions/perguntas/update_pergunta.php" enctype="multipart/form-data">
                <input type="text" style="display: none" name="pergunta_id" value="{$pergunta.pergunta_id}">
                <input type="text" name="titulo" value="{$pergunta.titulo}" style="width: 100%; margin-top: 10px; border-style: none; height: 50px;">
                <input type="text" name="conteudo" value="{$pergunta.conteudo}" style="width: 100%; margin-top: 10px; border-style: none; height: 50px;">
                <button type="submit" class="perg-comment btn3"  style="background: none; border: none; color: #e94735; margin-top: 10px">edit</button>
            </form>
        </div>
    </div>
</div>



{include file='common/footer.tpl'}