
<title>{$user.username} Profile | WalkMeThrough</title>
{include file='common/header.tpl'}
<div class="wrap">


    <div layout="column">
        <div>
            <div layout="row">
                <br>
                <div flex>
                    <img src="{$user.avatar}" style="width: 160px">
					{if $_SESSION[user_id] == $user.user_id}
						<script>
							$(document).ready(function(){
								$("#buttonChangePic").click(function(){
									$("#changePic").toggle(250);
								});
							});
						</script>
						<div id="buttonChangePic" style="width: 160px">Change Profile Picture</div>
						<div id="changePic" style="width: 160px">
							<form action="uploadPFImage.php" method="post" enctype="multipart/form-data">
								<input type="file" name="fileToUpload" id="fileToUpload">
								<input type="submit" value="Upload Image" name="submit">
							</form>
						</div>
					{/if}
                </div>
                <div flex="80">
                    <div layout="column">
                        <div flex>
                            <h2>{$user.username}</h2><br>
                            {$user.about}
                        </div>
                        <div flex style="margin-top: 5px">
                            <div layout="row">
                                <div>
                                    {if empty($user_medals)}
                                        <div class="perg-teaser">
                                            This user has no medals yet.
                                        </div>
                                    {/if}
                                    {foreach $user_medals as $medal}
                                        <img src="{$medal.image}" style="width: 40px">
                                    {/foreach}
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
        <div>
            <br>
            <h2>RECENT QUESTIONS<h2>
                    <section id="perguntas">
                        {if empty($perguntas)}
                            <div class="perg-teaser">
                                This user hasn't asked any questions yet.
                            </div>
                        {/if}
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
