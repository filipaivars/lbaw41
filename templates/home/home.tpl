{include file='common/header.tpl'}

<div class="wrap_0">
    <div class="wrap">

        <section id="perguntas">
            <h4 style="margin-top: 0; padding-top: 20px">Recent Questions</h4>

            <div id="new_perguntas"></div>
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
                                        <div class="perg-user"><a href="../../pages/users/users.php">{$pergunta.username}</a></div>
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


            <hr class="style-two">
            <h4>Top Questions</h4>
            <div>
                {foreach $bestperguntas as $bestpergunta}
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
                                            <div class="perg-user">{$bestpergunta.username}</div>
                                            <a href="../../pages/perguntas/show_pergunta.php?pergunta_id={$bestpergunta.pergunta_id}">
                                                <div class="perg-titulo">{$bestpergunta.titulo}</div>
                                            </a>
                                            {foreach $bestpergunta.tags as $tag}
                                                <div class="col-md-1" style="display:flex">
                                                    <div class="tag-style">
                                                        {$tag.nome}
                                                    </div>
                                                </div>
                                            {/foreach}
                                        </div>
                                    </div>
                                    <div class="col-md-2">
                                        <span class="perg-data" style="text-align: right">{$bestpergunta.created_date}</span>
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
                                            document.write(checkNull({$bestpergunta.n_respostas}));
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
                                        document.write(roundMe(checkNull({$bestpergunta.average})));
                                    </script>
                                </div>
                            </div>
                        </div>
                    </div>
                    <script>
                        myFunction();
                    </script>
                {/foreach}
            </div>
            <hr class="style-two">

        </section>
    </div>
</div>


<!--<script src="{$BASE_URL}javascript/tweets.js"></script>-->

{include file='common/footer.tpl'}
