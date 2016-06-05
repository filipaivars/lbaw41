
<title>{$user.username} Profile | WalkMeThrough</title>
{include file='common/header.tpl'}
<div class="wrap" style="padding-top: 100px">

    <div class="row">
        <div class="col-md-2">
            <img id="buttonChangePic" src="{$user.avatar}" style="width: 160px">
            <div style="width: 160px; height: 30px; background-color: #282827">

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
            <div id="changePic" style="width: 160px" hidden>
                <form action="../../actions/users/uploadPFImage.php" method="post" enctype="multipart/form-data">
                    <input type="file" name="fileToUpload" id="fileToUpload">
                    <input type="submit" value="Upload Image" name="submit">
                </form>
            </div>
            {/if}
            {if $USERNAME eq $user.username}
            <button>EDIT</button>
            {else}
            favorite <button>fav<button>
            {/if}
            <br><br>
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

        </div>
        <div class="col-md-8" style="background-color: blue">
            <h2>{$user.username}</h2><br>
            {if $user.about eq ""}
                <div>
                    este utilizador ainda não adicionou uma descrição
                </div>
            {else}
                {$user.about}
            {/if}
        </div>
        <div class="col-md-2" style="background-color: yellow">
            <div style="padding-top: 100px">
                <b>{$user.questions}</b> questions<br>
                <b>{$user.answers}</b> answers<br>
                <b>{$user.favourites}</b> favourites<br>
            </div>
        </div>
    </div>













</div>


{include file='common/footer.tpl'}
