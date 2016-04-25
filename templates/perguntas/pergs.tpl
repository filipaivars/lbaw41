{include file='common/header.tpl'}

<div class="wrap_0">
    <div class="wrap">
        <h4>{$pergunta.titulo}</h4>
        <hr class="style-one">
        <div class="row">
            <div class="col-md-2">
                <img class="avatar" src="../../images/assets/default.png" width="100" height="100"><br>
                {$pergunta.username}<br>
                <div class="perg-data">asked {$pergunta.created_date}</div>
            </div>
            <div class="col-md-10">
                <div class="row">
                    <div class="perg-conteudo">
                        {$pergunta.conteudo}
                    </div>

                    <div class="tag-style">
                        {foreach $tags as $tag}
                            <div class="col-md-1">
                                <div class="tag-style">
                                    {$tag.nome}
                                </div>
                            </div>
                        {/foreach}
                    </div>
                    <a>"<"RATE ME">"</a>
                    <a class="perg-comment">COMMENT</a>
                </div>
            </div>

        </div>
        <br><hr class="style-one"><br>
        <h3>ANSWERS</h3>
        <div>
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