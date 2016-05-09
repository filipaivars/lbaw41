{include file='common/header.tpl'}

<div class="wrap_0">
    <div class="wrap">

        <div id="register" align="center">
            <h4>Register</h4>
            <form action="{$BASE_URL}actions/users/register.php" method="post" enctype="multipart/form-data">
                <label>Username:<br>
                    <input type="text" name="username" value="{$username}">
                </label>
                <br>
            </form>
            <SCRIPT TYPE="text/javascript" src="../../fbapp/fb.js"></SCRIPT>
            <div class="fb-login-button" data-size="large" data-scope="public_profile,email" onlogin="checkLoginState();"></div>
            <br>
            <br>
        </div>

        <div id="register_sFB">
            <h4>Register without Facebook</h4>
            <form action="{$BASE_URL}actions/users/register.php" method="post" enctype="multipart/form-data">
                <label>Username:<br></label>
                <input type="text" name="username" value="{$FORM_VALUES.username}">
                <label>Password:<br></label>
                <input type="password" name="password" value="">
                <br>
                <input type="submit" value="Register">
            </form>
        </div>
    </div>
</div>

{include file='common/footer.tpl'}
