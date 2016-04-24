{include file='common/header.tpl'}

<div class="wrap_0">
    <div class="wrap">

        <section id="perguntas">
            <h4 style="margin-top: 0; padding-top: 20px">Recent Questions</h4>

            <div id="new_perguntas"></div>
            {foreach $perguntas as $pergunta}
                <div id="questaoRecente">
                    <div class="row">
                        <div class="col-md-2">
                            <div class="perg-user">{$pergunta.username}</div>
                        </div>
                        <div class="col-md-8">
                            <div class="row">
                                <div class="col-md-8">
                                    <span class="perg-titulo">{$pergunta.titulo}</span>
                                </div>
                                <div class="col-md-4">
                                    <span class="perg-titulo">{$pergunta.created_date}</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-1">
                            RESPOSTAS
                        </div>
                        <div class="col-md-1">
                            STARS
                        </div>
                    </div>
                </div>
                <hr class="style-one">
            {/foreach}



            <h4>Top Questions</h4>
            <hr class="style-two">

        </section>
    </div>
</div>


<!--<script src="{$BASE_URL}javascript/tweets.js"></script>-->

{include file='common/footer.tpl'}
