
<title>{$user.username} Profile | WalkMeThrough</title>
{include file='common/header.tpl'}
<div class="wrap_0">
    <div class="wrap" style="padding-top: 100px">

        <div class="row">
            <div class="col-md-2">
                <img id="buttonChangePic" src="{$user.avatar}" style="width: 160px" alt="User Medal">
                <div style="width: 160px; height: 30px; background-color: #282827; text-align: center; color: white">
                    {$user.average}
                </div>
                {if $USERNAME eq $user.username}
                <script>
                    $(document).ready(function(){
                        $("#buttonChangePic").click(function(){
                            $("#changePic").toggle(250);
                        });
                    });
                </script>
                <!--<div id="buttonChangePic" style="width: 160px">Change Profile Picture</div>-->
                <div id="changePic" style="width: 160px; cursor: pointer;" hidden>
                    <form action="../../actions/users/uploadPFImage.php" method="post" enctype="multipart/form-data">
                        <input type="file" name="fileToUpload" id="fileToUpload">
                        <input type="submit" value="Upload Image" name="submit">
                    </form>
                </div>
                {/if}
                {if $USERNAME eq $user.username}
                <button type="submit" class="perg-comment btn2_3"  style="background: none; border: none; color: #e94735; margin-top: 30px;">EDIT</button>
                {else}
                favorite <img src="../../images/assets/favorite.png" width="20" alt="Favourite"/>
                {/if}
                <br><br>

            </div>
            <div class="col-md-8">
                <h4>{$user.username}</h4><br>
                {if $user.about eq ""}
                <div>
                    este utilizador ainda não adicionou uma descrição
                </div>
                {else}
                {$user.about}
                {/if}

                <br><br>
                <div>
                    {if empty($user_medals)}
                    <div class="perg-teaser">
                        This user has no medals yet.
                    </div>
                    {/if}
                    {foreach $user_medals as $medal}
                    <img src="{$medal.image}" style="width: 40px" alt="User Medal">
                    {/foreach}
                </div>
            </div>
            <div class="col-md-2">
                <div style="padding-top: 200px">
                    <b>{$user.questions}</b> questions<br>
                    <b>{$user.answers}</b> answers<br>
                    <b>{$user.favourites}</b> favourites<br>
                </div>
            </div>
        </div>

        <div class="aparecePerfil" style="padding-left: 10%; padding-right: 30%; padding-top: 50px">
            <form action="{$BASE_URL}actions/users/update_perfil.php" method="post" enctype="multipart/form-data">
                <div>
                    <input type="text" style="display: none" name="user_id" value="{$user.user_id}">
                    <input type="text" name="about" value="{$user.about}" style="width: 100%; margin-top: 10px; border-style: none; height: 33px;">
                </div>
                <div>
                    <button type="submit" class="perg-comment"  style="background: none; border: none; color: #e94735; margin-top: 10px">edit</button>
                </div>

            </form>
        </div>

        <div>
            <hr class="style-one">
            <h4>QUESTIONS</h4>
            <div>
                {foreach $perguntas as $pergunta}
                <div id="questaoRecente" style="padding-bottom: 50px">
                    <div class="row">
                        <div class="col-md-10">
                            <div class="row">
                                <div class="col-md-10">
                                    <div class="row" style="padding-left: 20px">
                                        <a href="../../pages/perguntas/show_pergunta.php?pergunta_id={$pergunta.pergunta_id}">
                                            <div class="perg-titulo">
                                                {$pergunta.titulo}
                                            </div>

                                        </a>
                                        {foreach $pergunta.tags as $tag}
                                        <div class="col-md-1" style="display:flex">
                                            <div class="tag-style">
                                                {$tag.nome}
                                            </div>
                                        </div>
                                        {/foreach}
                                    </div>
                                    {if $USERNAME eq $user.username}
                                    <div>
                                        <a href="../../pages/perguntas/update_pergunta.php?pergunta_id={$pergunta.pergunta_id}">edit</a>
                                    </div>
                                    {/if}

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
                {/foreach}
            </div>
        </div>
    </div>
</div>

{include file='common/footer.tpl'}
