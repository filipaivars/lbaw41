{include file='common/header.tpl'}



<section id="tweets">
  <h4 style="margin-top: 0; padding-top: 20px">Recent Questions</h4>
  <hr class="style-one">


  <h4>Top Questions</h4>
  <hr class="style-one">

  <div id="new_tweets"></div>

  {foreach $tweets as $tweet}

  <article class="tweet-data">
    <!--<img src="{$BASE_URL}{$tweet.photo}">
    <span class="realname">{$tweet.realname}</span>
    <a href="{$BASE_URL}pages/tweets/list_user.php?username={$tweet.username}" class="username">@{$tweet.username}</a>
-->
    <span class="time">{$tweet.titulo}</span>
    <div class="tweet-text">{$tweet.conteudo}</div>
  </article>

  {/foreach}

</section>

<script>last_tweet_id = {$last_tweet_id}</script>

<!--<script src="{$BASE_URL}javascript/tweets.js"></script>-->

{include file='common/footer.tpl'}
