<title> {$search} Results | WalkMeThrough</title>
{include file='common/header.tpl'}

<div class="wrap_0">
    <div class="wrap">
        <div>
            <h4 style="margin-top: 0; padding-top: 20px">Search Results</h4>
            {foreach $perguntas as $pergunta}
                <hr class="style-one">

                <div id="questaoRecente">
                    <div class="row">
                        <div class="col-md-1">
                            <img class="avatar" src="" alt="User Avatar">
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
        </div>

    </div>
</div>


{include file='common/footer.tpl'}