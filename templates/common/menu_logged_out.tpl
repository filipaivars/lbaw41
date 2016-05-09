<div class="header">
  <div class="container-fluid" id="header-container">
    <div class="row">
      <div class="col-xs-12 col-md-2">
        <a href="../../pages/home/home.php">
          <img src="../../images/assets/logo.png" style="height: 40px;">
        </a>
      </div>
      <div class="col-md-6">
        <h2>Custom search field</h2>
        <div id="custom-search-input">
          <div class="input-group col-md-12">
            <input type="text" class="form-control input-lg" placeholder="Buscar" />
            <span class="input-group-btn">
                <button class="btn btn-info btn-lg" type="button">
                    <i class="glyphicon glyphicon-search"></i>
                </button>
            </span>
          </div>
        </div>

        <!--
        <div class="span12">
          <form id="custom-search-form" class="form-search form-horizontal pull-right" action="../../pages/home/searchResults.php">
            <div class="input-append span12">
              <input type="text" class="search-query" placeholder="Search">
              <button type="submit" class="btn"><i class="icon-search"></i></button>
            </div>
          </form>
          </div>
          -->
      </div>
      <div class="col-xs-8 col-md-2">
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
