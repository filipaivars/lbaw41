{include file='common/header.tpl'}



<section id="perguntas">
  <h4 style="margin-top: 0; padding-top: 20px">Recent Questions</h4>
  <hr class="style-one">


  <h4>Top Questions</h4>
  <hr class="style-one">

  <div id="new_perguntas"></div>

  {foreach $perguntas as $pergunta}

  <article class="tweet-data">
    <!--<img src="{$BASE_URL}{$pergunta.photo}">
    <span class="realname">{$pergunta.realname}</span>
    <a href="{$BASE_URL}pages/tweets/list_user.php?username={$pergunta.username}" class="username">@{$pergunta.username}</a>
-->
    <span class="time">{$pergunta.titulo}</span>
    <div class="tweet-text">{$pergunta.conteudo}</div>
  </article>

  {/foreach}

</section>


<!--<script src="{$BASE_URL}javascript/tweets.js"></script>-->

{include file='common/footer.tpl'}
