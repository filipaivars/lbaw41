{include file='common/header.tpl'}

<div class="wrap">
    <div layout="column">
        <div>
            <div layout="row">
                <br>
                <div flex>
                    <img class="avatar" src="">
                </div>
                <div flex="80">
                    <div layout="column">
                        <div flex>
                            <h1>{$user.username}</h1><br>
                            {$user.about}
                        </div>
                        <div flex style="margin-top: 65px">
                            <div layout="row">
                                <div flex="65">
                                   <h3>[Medals]</h3>
                                </div>
                                <div>
                                    <h3>{$user.questions}</h3> questions<br>
                                    <h3>{$user.answers}</h3> answers<br>
                                    <h3>{$user.favourites}</h3> favourites<br>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div>
            <br>
            <h2>RECENT QUESTIONS<h2>
                    <section id="perguntas">
                        {foreach $perguntas as $pergunta}
                            <hr>
                            <div id="questaoRecente">
                                <div class="row">
                                    <div class="col-md-9">
                                        <div class="row">
                                            <div class="col-md-10">
                                                <div class="row">
                                                    <a href="../../pages/perguntas/show_pergunta.php?pergunta_id={$pergunta.pergunta_id}">
                                                        <div class="perg-titulo-user">
                                                            {$pergunta.titulo}
                                                        </div>
                                                    </a>
                                                    <div class="perg-teaser">
                                                        {$pergunta.conteudo}
                                                    </div>
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
                            <br>
                        {/foreach}
                    </section>
        </div>
    </div>
</div>


{include file='common/footer.tpl'}