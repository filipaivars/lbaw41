{include file='common/header.tpl'}

<div class="wrap_0">
    <div class="wrap">
        <h3>{$pergunta.titulo}</h3>
        <hr class="style-one">
        <div class="row">
            <div class="col-md-3">
                <img class="avatar" src="../../images/assets/default.png" width="50" height="50"><br>
                {$pergunta.username}<br><br>
                <div class="perg-data">{$pergunta.created_date}</div>
            </div>
            <div class="col-md-9">
                <div class="perg-conteudo">
                    <h4>{$pergunta.conteudo}</h4>
                </div>
                {foreach $tags as $tag}
                    <div style="background-color: grey; border-width 1px; margin-left: 2px; margin-top: 2px; margin-bottom: 2px">
                        {$tag.nome}
                    </div>
                {/foreach}
            </div>
            <br><hr class="style-one"><br>
            {foreach $respostas as $resposta}
                <hr>
                <div>
                    {$resposta.conteudo}<br>
                    -{$resposta.average}-<br>
                    <div id="user_section" align="right">
                        Answered {$resposta.created_date}<br>
                        {$resposta.username}<br>
                    </div>
                </div>
            {/foreach}
        </div>
    </div>
</div>

{include file='common/footer.tpl'}