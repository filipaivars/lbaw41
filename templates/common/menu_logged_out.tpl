<div class="header">
  <div class="container-fluid" id="header-container">

    <div class="row">
      <div class="col-xs-12 col-md-2">
        <a href="../../pages/home/home.php">
          <img src="../../images/assets/logo.png" style="height: 40px;">
        </a>
      </div>
      <div class="col-xs-12 col-md-3">
        <!--
        <form class="navbar-form" action="../../pages/home/searchResults.php">
          <div class="input-group">
            <input type="text" class="form-control" placeholder="Search" name="search" id="srch-term">
            <div class="input-group-btn">
              <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
            </div>
          </div>
        </form>
        -->
        ola
      </div>
      <div class="col-xs-8 col-md-5">
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
