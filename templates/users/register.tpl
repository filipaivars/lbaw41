{include file='common/header.tpl'}
<?php $username = $_POST['username']; ?>

<div id="register" align="center">
  <h2>Register</h2>
    <form action="{$BASE_URL}actions/users/register.php" method="post" enctype="multipart/form-data">
        <label>Username:<br>
            <input type="text" name="username" value="{$username}">
        </label>
        <br>
        <!--<div class="fb-login-button" data-scope="public_profile, email" onlogin="checkLoginState();"></div>
        <div class="fb-login-button" data-max-rows="1" data-size="large" data-show-faces="false"
             data-auto-logout-link="false" data-scope="public_profile, email"></div> !-->
    </form>
    <div class="fb-login-button" data-max-rows="1" data-size="large" data-show-faces="false" data-auto-logout-link="false"></div>

</div>

{include file='common/footer.tpl'}
