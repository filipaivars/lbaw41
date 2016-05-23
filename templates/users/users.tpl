{include file='common/header.tpl'}

<div class="wrap">
    <div layout="column">
        <div>
            <div layout="row">
                <br>
                <div flex>
                    <img src="../../images/users/perfil_foto.png" style="width: 160px">
                </div>
                <div flex="80">
                    <div layout="column">
                        <div flex>
                            <h2>{$user.username}</h2><br>
                            {$user.about}
                        </div>
                        <div flex style="margin-top: 65px">
                            <div layout="row">
                                <div flex="65">
                                    Medals
                                </div>
                                <div>
                                    <b>{$user.questions}</b> questions<br>
                                    <b>{$user.answers}</b> answers<br>
                                    <b>{$user.favourites}</b> favourites<br>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <span style="display:block; height: 50px;"></span>
        <div>
            <h2>QUESTIONS<h2><hr>
                    <section id="perguntas">
                        <h4 style="margin-top: 0; padding-top: 20px">Recent Questions</h4>
                        {foreach $perguntas as $pergunta}
                            <hr class="style-one">
                            <div id="questaoRecente">
                                <div class="row">
                                    <div class="col-md-1">
                                        <img class="avatar" src="">
                                    </div>
                                    <div class="col-md-9">
                                        <div class="row">
                                            <div class="col-md-10">
                                                <div class="row">
                                                    <div class="perg-user"><a href="../../pages/users/users.php?user_id={$pergunta.criar_id}">{$pergunta.username}</a></div>
                                                    <a href="../../pages/perguntas/show_pergunta.php?pergunta_id={$pergunta.pergunta_id}">
                                                        <div class="perg-titulo">{$pergunta.titulo}</div>
                                                    </a>
                                                    {foreach $pergunta.tags as $tag}
                                                        <div class="col-md-1" style="display:flex">
                                                            <div class="tag-style">
                                                                {$tag.nome}
                                                            </div>
                                                        </div>
                                                    {/foreach}
                                                </div>
                                            </div>
                                            <div class="col-md-2">
                                                <span class="perg-data" style="text-align: right">{$pergunta.created_date}</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-1">
                                        <div class="row">
                                            <div class="caixaPerg">
                                                Answers
                                            </div>
                                            <div style="background-color: white; color: #282827; text-align: center">
                                                <script>
                                                    document.write(checkNull({$pergunta.n_respostas}));
                                                </script>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-1">
                                        <div class="caixaPerg">
                                            Stars
                                        </div>
                                        <div class="starsAvg" style="background-color: white; color: #282827; text-align: center">
                                            <script>
                                                document.write(roundMe(checkNull({$pergunta.average})));
                                            </script>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <script>
                                myFunction();
                            </script>
                        {/foreach}
                    </section>
        </div>
    </div>
</div>


{include file='common/footer.tpl'}