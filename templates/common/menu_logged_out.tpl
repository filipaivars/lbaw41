<div class="header">
  <div class="container-fluid" id="header-container">




    <div class="row" style="display: flex; align-items: center; text-align: right">


      <div class="col-xs-12 col-md-2" style="text-align: left">
        <a href="../../pages/home/home.php">
          <img src="../../images/assets/logo.png" style="height: 40px">
        </a>
      </div>


      <div class="col-xs-8 col-md-2">
        <form id="search-form" action="../../pages/home/searchResults.php">
          <div class="input-group">
            <input type="text" class="form-control" placeholder="Search" name="search" id="srch-term">
            <div class="input-group-btn">
              <button class="btn btn-default"  type="submit"><i class="glyphicon glyphicon-search" style="color: #282827"></i></button>
            </div>
          </div>
        </form>
      </div>


      <div class="col-xs-8 col-md-6">
        <form id="form-login" method="post" action="{$BASE_URL}actions/users/login.php" enctype="multipart/form-data">
          <label>username</label>
          <input type="text" name="username" style="color: black; text-align: left; border-bottom: 2px solid red;">
          <label>password</label>
          <input type="password" name="password" value="" style="color: black; text-align: left">
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
