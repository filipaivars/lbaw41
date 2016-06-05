
<title>{$user.username} Profile | WalkMeThrough</title>
{include file='common/header.tpl'}
<div class="wrap">

    <div class="row">
        <div class="col-md-2">
            <img id="buttonChangePic" src="{$user.avatar}" style="width: 160px">
            <div style="width: 160px; height: 20px; background-color: #282827">

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
        </div>
        <div class="col-md-8" style="background-color: blue">

        </div>
        <div class="col-md-2" style="background-color: yellow">

        </div>
    </div>













</div>


{include file='common/footer.tpl'}
