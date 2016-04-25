{include file='common/header.tpl'}

<div class="wrap_0">
    <div class="wrap">
        <h4>{$pergunta.titulo}</h4>
        <hr class="style-one">
        <div class="row">
            <div class="col-md-3">
                <img class="avatar" src="../../images/assets/default.png" width="100" height="100"><br>
                {$pergunta.username}<br>
                <div class="perg-data">asked {$pergunta.created_date}</div>
            </div>
            <div class="col-md-9">
                <div class="perg-conteudo">
                    {$pergunta.conteudo}
                </div>
                <div class="tag-style">
                    {foreach $tags as $tag}
                        <div style="background-color: grey; margin-left: 2px; margin-top: 2px; margin-bottom: 2px; padding: 5px; color: white">
                            {$tag.nome}
                        </div>
                    {/foreach}
                </div>

            </div>
            <br><hr class="style-one"><br>
            {foreach $respostas as $resposta}
                <div>
                    {$resposta.conteudo}<br>
                    -{$resposta.average}-<br>
                    <div id="user_section" align="right">
                        answered {$resposta.created_date}<br>
                        {$resposta.username}<br>
                    </div>
                </div>
                <hr>
            {/foreach}
        </div>
    </div>
</div>

{include file='common/footer.tpl'}