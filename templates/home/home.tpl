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
                        <div class="col-md-2">
                            <img id="avatar" src="">
                            <script>
                                function myFunction() {
                                    document.getElementById("avatar").src = "../../images/assets/default.png";
                                }
                                myFunction()
                            </script>
                        </div>
                        <div class="col-md-8">
                            <div class="row">
                                <div class="col-md-8">
                                    <div class="row">
                                        <div class="perg-user">{$pergunta.username}</div>
                                        <div class="perg-titulo">{$pergunta.titulo}</div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <span class="perg-date">{$pergunta.created_date}</span>
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
            {/foreach}


            <hr class="style-two">
            <h4>Top Questions</h4>
            <hr class="style-two">

        </section>
    </div>
</div>


<!--<script src="{$BASE_URL}javascript/tweets.js"></script>-->

{include file='common/footer.tpl'}