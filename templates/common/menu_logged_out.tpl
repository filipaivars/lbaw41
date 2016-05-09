<div class="header">
  <div class="container-fluid" id="header-container">
    <div class="row">
      <div class="col-xs-12 col-md-2">
        <a href="../../pages/home/home.php">
          <img src="../../images/assets/logo.png" style="height: 40px;">
        </a>
      </div>
      <div class="col-xs-8 col-md-2">
        <form method="get" action="../../pages/home/searchResults.php">
          <div class="input-group stylish-input-group">
            <input type="text" class="form-control"  placeholder="Search" name="search">
            <button type="submit"><img src="../../images/assets/search_icon.png"></button>
            <span class="input-group-addon">
                <button type="submit">
                    <span class="glyphicon glyphicon-search"></span>
                </button>
            </span>
          </div>
        </form>
      </div>
      <div class="col-xs-8 col-md-6">
        <form id="form-login" method="post" action="{$BASE_URL}actions/users/login.php" enctype="multipart/form-data">
          <label>username</label>
          <input type="text" name="username" style="color: black;">
          <label>password</label>
          <input type="password" name="password" value="" style="color: black;">
          <input type="submit" value="Login">
        </form>
      </div>
      <div class="col-xs-2 col-md-1" style="text-align: right   ">
        <i class="material-icons" style="font-size: 35px">email</i>
      </div>
      <div class="col-xs-2 col-md-1" style="text-align: right ">
        <a href="../../pages/users/register.php">
          <i class="material-icons" style="font-size: 35px">person</i>
        </a>
      </div>
    </div>
  </div>
</div>
