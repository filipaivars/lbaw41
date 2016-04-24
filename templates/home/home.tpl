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
              eu
            </div>
            <div class="col-md-8">
              tu
            </div>
            <div class="col-md-1">
              ele
            </div>
            <div class="col-md-1">
              nos
            </div>
          </div>
        </div>
      <article class="tweet-data">
        <!--<img src="{$BASE_URL}{$pergunta.photo}">
        <span class="realname">{$pergunta.realname}</span>
        <a href="{$BASE_URL}pages/tweets/list_user.php?username={$pergunta.username}" class="username">@{$pergunta.username}</a>
    -->
        <span class="time">{$pergunta.titulo}</span>
        <div class="tweet-text">{$pergunta.conteudo}</div>
      </article>

      {/foreach}

      <hr class="style-one">

      <h4>Top Questions</h4>
      <hr class="style-one">

    </section>
  </div>
</div>


<!--<script src="{$BASE_URL}javascript/tweets.js"></script>-->

{include file='common/footer.tpl'}
