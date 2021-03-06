<title>{$pergunta.titulo} | WalkMeThrough</title>
{include file='common/header.tpl'}

<script src="../../javascript/stars.js"></script>


<div class="wrap_0">
    <div class="wrap">
        <h4>{$pergunta.titulo}</h4>
        <hr class="style-one">
        <div class="row">
            <div class="col-md-2">
                <img class="avatar" src="{$pergunta.avatar}" width="100" height="100" alt="User Avatar"><br>
                <a href="../../pages/users/users.php?user_id={$pergunta.criar_id}">{$pergunta.username}</a><br>
                <div class="perg-data">{$pergunta.created_date}</div>
                <br><br>
                {if $USERNAME eq $pergunta.username}
                    <form action="">
                        <input type="checkbox" name="fechar" value="">fechar pergunta<br>
                        <input type="submit">
                    </form>

                    <a href="../../pages/perguntas/update_pergunta.php?pergunta_id={$pergunta.pergunta_id}">edit</a>
                {/if}
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


                        {if not ($USERNAME eq $pergunta.username)}
                            {if isset($pergunta.voto)}
                                <input type="number" class="rating" id="test" name="test" data-min="1" data-max="5" value="{$pergunta.voto}" data-id="{$pergunta.pergunta_id}"
                                                             data-user_id="{$USERID}" data-case="0">
                            {else}


                            <input type="number" class="rating" id="test" name="test" data-min="1" data-max="5" value="" data-id="{$pergunta.pergunta_id}"
                                   data-user_id="{$USERID}" data-case="0">
                            {/if}

                        {/if}
                        <br>
                    <div id="apareceComm1">
                        <form method="post" action="{$BASE_URL}actions/perguntas/create_comentario_pergunta.php" enctype="multipart/form-data">
                            <input type="text" style="display: none" name="pergunta_id" value="{$pergunta.pergunta_id}">
                            <input type="text" name="conteudo" placeholder="my comment" style="width: 100%; margin-top: 10px; border-style: none; height: 50px;">
                            <button type="submit" class="perg-comment btn2_2" style="background: none; border: none; color: #e94735; margin-top: 10px">COMMENT</button>
                        </form>
                    </div>
                    <a class="perg-comment" id="btn2_1">COMMENT</a>
                    {foreach $pergunta.comentarios as $comentario}
                        <div class="row" style="margin-top: 20px; padding-top: 5px; margin-left: 3px; margin-right: 5px;background-color: #ecf0f1; min-height: 85px;">
                            <div >
                                <div class="col-md-1">
                                    <img class="avatar" src="{$comentario.avatar}" alt="User Avatar">
                                </div>
                                <div class="col-md-9" style="padding-left: 20px">
                                    <b>{$comentario.username}</b><br>
                                    {$comentario.conteudo}
                                </div>
                                <div class="col-md-2">
                                    {$comentario.created_date}
                                </div>
                            </div>
                        </div>
                        {if $USERNAME eq $comentario.username}
                            <a href="../../pages/perguntas/update_comentario_pergunta.php?pergunta_id={$pergunta.pergunta_id}">edit</a>
                        {/if}


                    {/foreach}

                    <div style="margin-top: 30px;">
                        <form method="post" action="{$BASE_URL}actions/perguntas/create_resposta.php" enctype="multipart/form-data">
                            <input type="text" style="display: none" name="pergunta_id" value="{$pergunta.pergunta_id}">
                            <input type="text" name="conteudo" placeholder="my answer" style="width: 100%; margin-top: 10px; border-style: none; height: 75px;">
                            <button type="submit" class="btn btn-default" style="background-color: #f44937; color: white; margin-top: 10px;">post answer</button>
                        </form>
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
                        <img class="avatar" src="{$resposta.avatar}" width="100" height="100" alt="User Avatar"><br>
                        {$resposta.username}<br>
                        <div class="perg-data">{$resposta.created_date}</div>
                        <br><br>
                        {if $USERNAME eq $resposta.username}
                            <a href="../../pages/perguntas/update_resposta.php?resposta_id={$resposta.resposta_id}">edit</a>
                        {/if}
                    </div>
                    <div class="col-md-10">

                        <div class="perg-conteudo">
                            {$resposta.conteudo}
                        </div>
                        <br>
                        <script>
                            document.write(checkNull({$resposta.average}))
                        </script>

                        {if not ($USERNAME eq $resposta.username)}

                            {if isset($resposta.voto)}
                                <input type="number" class="rating" id="test" name="test" data-min="1" data-max="5" value="{$resposta.voto}" data-id="{$resposta.resposta_id}"
                                       data-user_id="{$USERID}" data-case="1">
                            {else}
                                <input type="number" class="rating" id="test" name="test" data-min="1" data-max="5" value="" data-id="{$resposta.resposta_id}"
                                   data-user_id="{$USERID}" data-case="1">
                            {/if}
                        {/if}
                        <br>
                        <form method="POST" action="{$BASE_URL}actions/perguntas/create_comentario_resposta.php" enctype="multipart/form-data">
                            <input type="text" style="display: none" name="resposta_id" value="{$resposta.resposta_id}">
                            <input type="text" name="conteudo" placeholder="my comment" style="width: 100%; margin-top: 10px; border-style: none; height: 50px;">
                            <button type="submit" class="perg-comment btn2_2" style="background: none; border: none; color: #e94735; margin-top: 10px">COMMENT</button>
                        </form>

                        {foreach $resposta.comentarios as $comentario}
                            <div class="row" style="margin-top: 20px; padding-top: 5px; margin-left: 3px; margin-right: 5px;background-color: #ecf0f1; min-height: 85px">
                                <div >
                                    <div class="col-md-1">
                                        <img class="avatar" src="{$comentario.avatar}" alt="User Avatar">
                                    </div>
                                    <div class="col-md-9" style="padding-left: 20px">
                                        <b>{$comentario.username}</b><br>
                                        {$comentario.conteudo}
                                    </div>
                                    <div class="col-md-2">
                                        {$comentario.created_date}

                                    </div>
                                </div>
                            </div>

                            {if $USERNAME eq $comentario.username}
                            <a href="../../pages/perguntas/update_comentario_resposta.php?resposta_id={$resposta.resposta_id}">edit</a>
                            {/if}
                        {/foreach}
                    </div>
                </div>
                <hr>

            {/foreach}


        </div>

    </div>

</div>


{include file='common/footer.tpl'}