{include file='common/header.tpl'}

<div class="wrap_0">
    <div class="wrap">
        <h4>{$pergunta.titulo}</h4>
        <hr class="style-one">
        <div class="row">
            <div class="col-md-2">
                <img class="avatar" src="../../images/assets/default.png" width="100" height="100"><br>
                {$pergunta.username}<br>
                <div class="perg-data">{$pergunta.created_date}</div>
            </div>
            <div class="col-md-10">

                <div class="perg-conteudo">
                    {$pergunta.conteudo}
                </div>
                <div style="margin-top: 10px; margin-bottom: 10px">
                {foreach $tags as $tag}
                    <div class="col-md-1" style="display:flex">
                        <div class="tag-style">
                            {$tag.nome}
                        </div>
                    </div>
                {/foreach}
                </div>
                <div>
                    <br><br>
                    <script>
                        document.write(checkNull({$pergunta.average}));
                    </script>
                    <br><a style="margin-top: 10px;">RATE ME</a>
                    <br><br><a class="perg-comment">COMMENT</a>
                    {foreach $pergunta.comentarios as $comentario}
                        <div class="row" style="margin-top: 20px; margin-left: 3px; margin-right: 5px;">
                            <div style="margin-top: 10px; background-color: #ecf0f1">
                                <div class="col-md-1">
                                    <img class="avatar" src="">
                                </div>
                                <div class="col-md-9">
                                    {$comentario.username}<br>
                                    {$comentario.conteudo}
                                </div>
                                <div class="col-md-2">
                                    {$comentario.created_date}
                                </div>
                            </div>
                        </div>

                        <script>
                            myFunction();
                        </script>
                    {/foreach}

                    <div style="margin-top: 30px;">
                        <input type="text" name="myAnswer" placeholder="my answer" style="width: 100%; margin-top: 10px; border-style: none; height: 75px;">
                        <button type="button" class="btn btn-default" style="background-color: #f44937; color: white; margin-top: 10px;">post question</button>
                    </div>
                </div>
            </div>

        </div>
        <br><hr class="style-one"><br>
        <h3>ANSWERS</h3>
        <div id="wrap-answers">
            {foreach $respostas as $resposta}
                <div class="row">
                    <div class="col-md-2">
                        <img class="avatar" src="../../images/assets/default.png" width="100" height="100"><br>
                        {$resposta.username}<br>
                        <div class="perg-data">{$resposta.created_date}</div>
                    </div>
                    <div class="col-md-10">

                        <div class="perg-conteudo">
                            {$resposta.conteudo}
                        </div>
                        <br>
                        <script>
                            document.write(checkNull({$resposta.average}));
                        </script>
                        <br><a style="padding-top: 30px; margin-top: 20px">RATE ME</a>
                        <br><br><a class="perg-comment">COMMENT</a>
                        <div class="row" style="margin-top: 20px; margin-left: 3px; margin-right: 5px;">
                            <div style="margin-top: 10px; background-color: #ecf0f1">LIST OF COMMENTS</div>
                            <div style="margin-top: 10px; background-color: #ecf0f1">LIST OF COMMENTS</div>
                        </div>
                    </div>
                </div>
                <hr>

            {/foreach}


        </div>


    </div>
</div>


{include file='common/footer.tpl'}