<title>Register | WalkMeThrough</title>
{include file='common/header.tpl'}

<div class="wrap_0">
    <div class="wrap">

        <div id="register">
            <h4>Register using Facebook</h4>
            <SCRIPT TYPE="text/javascript" src="../../fbapp/fb.js"></SCRIPT>
            <div class="fb-login-button" data-scope="public_profile,email" onlogin="checkLoginState();"></div>
            <br>
            <br>
        </div>
        <hr>
        <div id="register_sFB">
            <form action="{$BASE_URL}actions/users/register.php" method="post" enctype="multipart/form-data">
                <fieldset>
                    <legend><h4>Register without Facebook</h4></legend>
                <label>Username:</label>
                <input type="text" name="username" value="{$FORM_VALUES.username}" pattern="^[A-Za-z0-9]+(?:[ _-][A-Za-z0-9]+)*$" required>
                <label>Password:</label>
                <input type="password" name="password" value="" required>
                <input type="submit" value="Register">
            </fieldset>
            </form>
        </div>
    </div>
</div>

{include file='common/footer.tpl'}
