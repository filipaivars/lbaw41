{include file='common/header.tpl'}

<div id="register" align="center">
  <h2>Register</h2>
    <form action="{$BASE_URL}actions/users/register.php" method="post" enctype="multipart/form-data">
        <label>Username:<br>
            <input type="text" name="username" value="{$username}">
        </label>
        <br>
    </form>
    <SCRIPT TYPE="text/javascript" src="../../fbapp/fb.js"></SCRIPT>
    <div class="fb-login-button" data-size="large" data-scope="public_profile,email" onlogin="checkLoginState();"></div>
    <br>
</div>

{include file='common/footer.tpl'}
