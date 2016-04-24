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
    <div id="bar" style=" float: right;">
        <div class="fb-login-button" data-max-rows="1" data-size="large" data-show-faces="false" data-auto-logout-link="false"></div>
    </div>
    <br>
</div>

{include file='common/footer.tpl'}
