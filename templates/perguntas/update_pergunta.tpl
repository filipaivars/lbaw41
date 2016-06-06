<title>{$user.username} Profile | WalkMeThrough</title>
{include file='common/header.tpl'}

<div class="wrap_0">
    <div class="wrap">
        <div class="aparece" id="{$pergunta.pergunta_id}">
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