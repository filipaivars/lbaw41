{include_php '../../pages/home/footer.php'}

<div class="footer">
    <div class="row" style="padding-top: 50px; padding-bottom: 20px">
        <div class="col-xs-0 col-md-2" style="color: #f44937">
            <a href="http://lbaw.fe.up.pt/201516/doku.php/lbaw1541/proj/index">about</a>
            <a href="../../pages/home/help.php">help</a>
        </div>
        <div class="col-xs-12 col-md-2" style="color: white">
            {foreach $popular_tags.nome  as $tag}
                {$popular_tags.nome}<br>
            {/foreach}
        </div>
        <div class="col-xs-12 col-md-2" style="color: white">
            {foreach $recent_tags.nome  as $tag}
                {$recent_tags.nome}<br>
            {/foreach}
        </div>
        <div class="col-xs-12 col-md-2" style="color: white">
            Square Enix<br>
            Rockstar<br>
            Blizzard<br>
            Ubisoft
        </div>
    </div>
</div>

</body>
</html>
